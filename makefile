BIN=commit-msg

OUTDIR=test/out

ECODES=$(OUTDIR)/ecodes

# Paths for commit messages, output controls, and successful diffs.
MESSAGES=$(wildcard test/message/*)
CONTROLS=$(addprefix test/control/,$(notdir $(MESSAGES)))
DIFFS=$(addprefix test/out/,$(notdir $(MESSAGES))) $(CONTROLS)

.SUFFIXES:

.PHONY: check clean
check: $(BIN) $(OUTDIR) $(ECODES) $(DIFFS)

clean:
	rm -rf $(OUTDIR)

$(OUTDIR):
	mkdir $@

$(ECODES): $(BIN)
	./$< test/message/compliant 2>/dev/null
	./$< test/message/empty 2>/dev/null; test $$? -ne 0
	./$< test/message/non-compliant 2>/dev/null; test $$? -ne 0
	touch $@

$(OUTDIR)/%: test/message/% test/control/% $(BIN)
	./$(BIN) $< 2>&1 | diff test/control/$* -
	touch $@
