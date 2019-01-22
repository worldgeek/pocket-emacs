STATIC_FILES=assets gemini-in-action-india-2018 browserconfig.xml 
GENERATED_FILES=pocket-emacs.html gemini-in-action-india-2018/gemini-in-action.html

all: ${GENERATED_FILES}

clean:
	rm -f ${GENERATED_FILES}

deploy: all ${STATIC_FILES} ${GENERATED_FILES}
	rsync --delete-after -r --exclude gemini-in-action-india-2018/gemini-in-action.org ${STATIC_FILES} pocket-emacs.html root@worldgeek:/srv/worldgeek.org/public/htdocs/

pocket-emacs.html: pocket-emacs.org
	spacemacs --visit $< -f org-html-export-to-html --eval '(kill-emacs)'

gemini-in-action-india-2018/gemini-in-action.html: gemini-in-action-india-2018/gemini-in-action.org
	spacemacs --visit $< -f org-reveal-export-to-html --eval '(kill-emacs)'
