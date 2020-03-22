### Creating a new tagged image for a fish version

Building the image requires Docker 1.12 and up, due to the `SHELL` Dockerfile instruction.

In terms of maintenance, periodically check whether there is a new

- [Ubuntu LTS image](https://hub.docker.com/_/ubuntu/)
- [fish-shell PPA](https://launchpad.net/~fish-shell)

1. Get the PPA version at https://launchpad.net/~fish-shell/+archive/ubuntu/release-3/+packages
2. Update the version in the Dockerfile (e.g. 3.1.0-1~bionic)
3. Build a new tagged image  
   ```
   docker image build --tag fish-shell --tag dideler/fish-shell:3.1.0 .
   ```
4. Verify the version is correct  
   ```
   docker container run --rm fish-shell --version
   ```
5. Push the image to the DockerHub repository  
   ```
   docker image push dideler/fish-shell:3.1.0
   ```

