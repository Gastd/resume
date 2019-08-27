##
# Makefile for Latex + Pythontex
# @author Gabriel Araujo
##

# Compiler Options
TEX = pdflatex
TEXFLAGS = --enable-write18 --shell-escape

NAME = resume

##
# Recipes:
##
.PHONY = all
all: $(NAME).pdf

# Compile and open pdf
$(NAME).pdf: clean-tex
	$(TEX) $(TEXFLAGS) $(NAME).tex 
	$(TEX) $(NAME).tex &&\
	$(TEX) $(NAME).tex
	# xdg-open $(@)&

# Remove generated files
.PHONY = clean
clean-tex:
	rm -f $(NAME).aux $(NAME).bbl $(NAME).blg $(NAME).log $(NAME).idx $(NAME).out\
	$(NAME).nav $(NAME).snm $(NAME).toc $(NAME).vrb

.PHONY = clean-all
clean-all: clean-tex 
	rm -f $(NAME).pdf
