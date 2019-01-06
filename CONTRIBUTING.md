To build, tag, and push the image to the repository:
```
docker image build --tag fish-shell .
docker image tag fish-shell dideler/fish-shell:3.0.0
docker image push dideler/fish-shell:3.0.0
```

Building the image requires Docker 1.12 and up, due to the `SHELL` Dockerfile instruction.

In terms of maintenance, periodically check whether there is

- [a new Ubuntu LTS image](https://hub.docker.com/_/ubuntu/)
- [a new fish version on the fish-shell PPA](https://launchpad.net/~fish-shell)