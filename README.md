# fish 🐟 + docker 🐳

[![Docker Build](https://img.shields.io/docker/automated/dideler/fish-shell.svg)](https://hub.docker.com/r/dideler/fish-shell)
[![Docker Pulls](https://img.shields.io/docker/pulls/dideler/fish-shell.svg)](https://hub.docker.com/r/dideler/fish-shell)

Ubuntu LTS container with fish installed as the default shell.

- Available on Docker Hub at https://hub.docker.com/r/dideler/fish-shell
- Available on GitHub at https://github.com/users/dideler/packages/container/package/fish-shell

## Use case

**Useful when** wanting to play around with fish in a pristine and ephemeral environment.  
**Useful when** reproducibility is desired (e.g. controlled environment for running a fish package CI pipeline).

**Not intended for** developing on the fish codebase.  
To build the shell from source with the help of Docker, see [fish-shell's Dockerfile](https://github.com/fish-shell/fish-shell/blob/master/Dockerfile) instead.

## Versions

See image tags [on DockerHub][dh-image-tags] or [on GitHub][gh-image-tags] for available fish versions.

Images are based on the latest Ubuntu LTS available at the time of building.

[dh-image-tags]: https://hub.docker.com/r/dideler/fish-shell/tags?page=1&ordering=name
[gh-image-tags]: https://github.com/users/dideler/packages/container/fish-shell/versions

## Examples

Pulling the latest image
```shell
docker pull dideler/fish-shell # from DockerHub
docker pull ghcr.io/dideler/fish-shell # from GitHub
```

Running commands on a specific version
```shell
$ docker container run --rm dideler/fish-shell:2.7.1 --version
fish, version 2.7.1
```

```shell
$ docker container run -it --rm dideler/fish-shell:3.0.0
root@aa26d2209674 /# for i in (seq 1 3)
                         echo $i
                     end
1
2
3
```

Using the image in a CircleCI build for testing [a fish packge](https://github.com/dideler/fish-cd-git/blob/master/.circleci/config.yml)
```yaml
version: 2

jobs:
  build:
    docker:
      - image: dideler/fish-shell:3.6.1
    shell: fish
    steps:
      - checkout
      - run:
          name: Install Fisher
          command: |
            apt-get update --quiet
            apt-get install --yes --quiet curl
            curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher
            fisher --version
      - run:
          name: Install fish-cd-git
          command: |
            fisher install <fish_plugins
            fisher install .
      - run:
          name: Run tests
          command: fishtape test/*.fish
```
