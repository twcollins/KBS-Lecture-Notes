latexfiles = lect1 lect2 lect3 lect4 lect5 lect6 lect7 lect8 lect9 lect10


dvi:
	for i in $(latexfiles); do \
		echo $$i; \
		cd $$i && make && cd -; \
	done

pdf: 
	for i in $(latexfiles); do \
		echo $$i; \
		cd $$i && make pdf && cd -; \
	done

clean: 
	for i in $(latexfiles); do \
		echo $$i; \
		cd $$i && make clean && cd -; \
	done


bundle: $(pdf)
	mkdir ./bundle
	for i in $(latexfiles); do \
		echo $$i; \
		cd $$i && cp ./*.pdf ../bundle && cd -; \
	done
	

