FROM docker:latest

RUN apk add bash

ENV SHELL=bash

RUN wget -qO- https://git.io/g-install | sh -s -- -y

