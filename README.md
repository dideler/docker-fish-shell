# fish shell + docker

Ubuntu LTS container with fish installed as the default shell.

Available on Docker Hub at https://hub.docker.com/r/dideler/fish-shell

## Use case

**Useful when** wanting to play around with fish in a pristine and ephemeral environment, or when reproducibility is desired (e.g. runnings tests in a CI pipeline for a fish package).

**Not intended for** developing on the fish codebase. To build the shell from source with the help of Docker, see [the fish-shell's Dockerfile](https://github.com/fish-shell/fish-shell/blob/master/Dockerfile) instead.

## Examples

Using the latest version
```shell
$ docker container run --rm dideler/fish-shell --version
fish, version 3.0.0
```

Using a specific version
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