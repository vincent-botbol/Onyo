NAME = rapport
DEPS = $(wildcard *.tex)
all: pdf
pdf: $(NAME).pdf
dvi: $(NAME).dvi
$(NAME).pdf $(NAME).dvi: $(DEPS)
show: showpdf
showpdf: $(NAME).pdf
	evince $<
showdvi: $(NAME).dvi
	xdvi $<

# Debian package: latex-make
include /usr/include/LaTeX.mk