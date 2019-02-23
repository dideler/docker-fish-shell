FROM ubuntu:bionic

RUN apt-get update --quiet && \
    apt-get install --quiet --yes software-properties-common && \
    add-apt-repository --yes ppa:fish-shell/release-3 && \
    apt-get install --quiet --yes fish=3.0.2-1~bionic

SHELL ["fish", "--command"]

RUN chsh -s /usr/bin/fish

ENV SHELL /usr/bin/fish
ENV LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8

ENTRYPOINT [ "fish" ]
