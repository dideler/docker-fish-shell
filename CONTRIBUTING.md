### Creating a new tagged image for a fish version

Building the image requires Docker 1.12 and up, due to the `SHELL` Dockerfile instruction.

In terms of maintenance, periodically check whether there is a new
- [Ubuntu LTS Docker Image][ubuntu-lts]
- [Fish hell Personal Package Archive (PPA)][fish-ppa]

For example, making a Docker image for fish 3.1.0 on Ubuntu 18.04 (bionic):
1. [Get the PPA version for the appropriate release series][fish-ppa]
2. Update the version in the Dockerfile (e.g. 3.1.0-1~bionic)
3. Build a new tagged image  
   ```shell
   docker image build --tag fish-shell --tag dideler/fish-shell:3.1.0 --tag ghcr.io/dideler/fish-shell:3.1.0 ./.
   ```
4. Verify the version is correct  
   ```shell
   docker container run --rm fish-shell --version
   ```
5. Push the image to DockerHub and GitHub Container Registry  
   ```shell
   docker image push dideler/fish-shell:3.1.0
   docker image push ghcr.io/dideler/fish-shell:3.1.0
   ```


[ubuntu-lts]: https://hub.docker.com/_/ubuntu/
[fish-ppa]: https://launchpad.net/~fish-shell
