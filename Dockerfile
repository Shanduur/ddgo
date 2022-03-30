FROM docker:dind

RUN apk add --no-cache bash git go

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 0774 /usr/local/bin/entrypoint.sh

ENV GIT_REPO "https://github.com/Shanduur/discord-runner.git"
ENV TEST_ARGS "-cover"
ENV ADDITIONAL_DEPS ""

RUN curl -s https://uploader.codecov.io/latest/alpine/codecov > /usr/local/bin/codecov
RUN chmod +x /usr/local/bin/codecov

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
