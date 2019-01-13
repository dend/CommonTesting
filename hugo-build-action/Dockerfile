FROM debian:9.5-slim

LABEL "com.github.actions.name"="Build Hugo content"
LABEL "com.github.actions.description"="Builds Hugo blog content locally."
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="red"

LABEL "repository"="http://github.com/dend/CommonTesting"
LABEL "homepage"="http://dennisdel.com"
LABEL "maintainer"="Den <dend@outlook.com>"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
