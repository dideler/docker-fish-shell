### Creating a new tagged image for a fish version

Images are automatically built and pushed by [GitHub Actions](.github/workflows/build-push.yml)
when Dockerfiles are changed on `main`, and on a monthly schedule.

#### Automated workflow

1. Update the fish version in the relevant Dockerfile (e.g. `Dockerfile.v4`)
2. Check the [fish-shell PPA][fish-ppa] for the correct version string for your Ubuntu base
   (e.g. `4.4.0-4~noble`)
3. Push or merge to `main` — the CI workflow will build, verify, and push to both
   [Docker Hub](https://hub.docker.com/r/dideler/fish-shell) and
   [GitHub Container Registry](https://github.com/users/dideler/packages/container/package/fish-shell)

#### Manual build (if needed)

Building the image requires Docker 1.12 and up, due to the `SHELL` Dockerfile instruction.

In terms of maintenance, periodically check whether there is a new
- [Ubuntu LTS Docker Image][ubuntu-lts]
- [Fish shell Personal Package Archive (PPA)][fish-ppa]

For example, making a Docker image for fish 3.7.1 on Ubuntu 22.04 (jammy):
1. [Get the PPA version for the appropriate release series][fish-ppa]
2. Update the version in the Dockerfile (e.g. 3.7.1-1~jammy)
3. Build a new tagged image  
   ```shell
   docker image build -f Dockerfile.v3 --tag fish-shell --tag dideler/fish-shell:3.7.1 --tag ghcr.io/dideler/fish-shell:3.7.1 ./.
   ```
4. Verify the version is correct  
   ```shell
   docker container run --rm fish-shell --version
   ```
5. Push the image to DockerHub and GitHub Container Registry  
   ```shell
   docker image push dideler/fish-shell:3.7.1
   docker image push ghcr.io/dideler/fish-shell:3.7.1
   ```

[ubuntu-lts]: https://hub.docker.com/_/ubuntu/
[fish-ppa]: https://launchpad.net/~fish-shell
