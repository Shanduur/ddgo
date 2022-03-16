FROM docker:dind

RUN apk add bash

RUN wget -qO- https://git.io/g-install | sh -s -- bash -y

ENV PATH="/root/go/bin:$PATH"

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 0774 /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
