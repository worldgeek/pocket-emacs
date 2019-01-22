GENERATED_FILES=pocket-emacs.html gemini-in-action-india-2018/gemini-in-action.html
FAVICON_FILES= \
android-chrome-192x192.png \
android-chrome-256x256.png \
apple-touch-icon.png \
browserconfig.xml \
favicon-16x16.png \
favicon-32x32.png \
favicon.ico \
mstile-150x150.png \
safari-pinned-tab.svg \
site.webmanifest

all: ${GENERATED_FILES}

clean:
	rm -f ${GENERATED_FILES}

deploy: pocket-emacs.html gemini-in-action-india-2018 ${FAVICON_FILES}
	rsync \
		--recursive --delete-after \
		--exclude gemini-in-action-india-2018/gemini-in-action.org \
	$^ root@worldgeek:/srv/worldgeek.org/public/htdocs/

pocket-emacs.html: pocket-emacs.org
	spacemacs --visit $< -f org-html-export-to-html --eval '(kill-emacs)'

gemini-in-action-india-2018/gemini-in-action.html: gemini-in-action-india-2018/gemini-in-action.org
	spacemacs --visit $< -f org-reveal-export-to-html --eval '(kill-emacs)'
