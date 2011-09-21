# set latexfile to the name of the main file without the .tex
latexfile = kbtL9
# put the names of figure files here.  include the .eps
figures = 
TEX = latex

# *.fig files may be in ./Figs
#vpath %.fig Figs

# reruns latex if needed.  to get rid of this capability, delete the
# three lines after the rule. 
# idea from http://ctan.unsw.edu.au/help/uk-tex-faq/Makefile
$(latexfile).dvi : $(figures) $(latexfile).tex
	while ($(TEX) $(latexfile) ; \
	grep -q "Rerun to get cross" $(latexfile).log ) do true ; \
	done

%.eps : %.fig
	fig2dev -L eps $< > $@

$(latexfile).pdf : $(latexfile).ps
	ps2pdf $(latexfile).ps $(latexfile).pdf

pdf : $(latexfile).pdf

$(latexfile).ps : $(latexfile).dvi
	dvips $(latexfile)

ps : $(latexfile).ps 

$(latexfile).tar.gz : $(figures) $(latexfile).tex
	tar -czvf $(latexfile).tar.gz $(figures) $(latexfile).tex Figs/*.fig

tarball: $(latexfile).tar.gz

vpdf: $(latexfile).pdf
	acroread $(latexfile).pdf

clean:
	rm *.dvi *~ *.pdf *.ps *.out *.aux *.log *.backup
