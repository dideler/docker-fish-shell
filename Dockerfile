FROM ubuntu:jammy

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update --quiet && \
    apt-get install --quiet --yes --no-install-recommends software-properties-common gnupg openssh-client git ca-certificates && \
    add-apt-repository --yes ppa:fish-shell/release-3 && \
    apt-get install --quiet --yes --no-install-recommends fish=3.7.1-1~jammy && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

SHELL ["fish", "--command"]

RUN chsh -s /usr/bin/fish

ENV SHELL=/usr/bin/fish
ENV LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8

ENTRYPOINT [ "fish" ]
