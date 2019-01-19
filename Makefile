FILES=assets gemini-in-action-india-2018 browserconfig.xml pocket-emacs.html

all: gemini-in-action-india-2018/gemini-in-action.html

deploy: all ${FILES}
	rsync --verbose --progress -r ${FILES} root@worldgeek:/srv/worldgeek.org/public/htdocs/

gemini-in-action-india-2018/gemini-in-action.html: gemini-in-action-india-2018/gemini-in-action.org
	emacs --batch -l ~/.emacs --visit $< -f org-reveal-export-to-html
