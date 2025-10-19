all:
	typst compile docs/proposal.typ docs/jckesle2ece592proposal.pdf --root .

watch:
	typst watch docs/proposal.typ docs/jckesle2ece592proposal.pdf --root . --open zathura