FROM docker:dind

RUN apk add --no-cache bash git

RUN wget -qO- https://git.io/g-install | sh -s -- bash -y

ENV PATH="/root/go/bin:$PATH"

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 0774 /usr/local/bin/entrypoint.sh

ENV GIT_REPO "https://github.com/Shanduur/discord-runner.git"
ENV TEST_ARGS "-cover"
ENV ADDITIONAL_DEPS ""

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
