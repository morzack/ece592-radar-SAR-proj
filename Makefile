all:
	typst compile docs/proposal.typ docs/jckesle2report.pdf --root .

watch:
	typst watch docs/proposal.typ docs/jckesle2report.pdf --root . --open zathura