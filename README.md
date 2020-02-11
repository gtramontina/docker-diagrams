<p align="center">
  <a href="https://hub.docker.com/r/gtramontina/diagrams/tags/"><img height="20" alt="Docker Tags" src="https://img.shields.io/badge/dynamic/json.svg?style=for-the-badge&label=%F0%9F%90%B3%20tags&colorB=066da5&query=$.count&uri=https%3A%2F%2Fhub.docker.com%2Fv2%2Frepositories%2Fgtramontina%2Fdiagrams%2Ftags"></a>
  <a href="https://hub.docker.com/r/gtramontina/diagrams/tags/"><img height="20" alt="Docker Latest Tag" src="https://img.shields.io/badge/dynamic/json.svg?style=for-the-badge&label=%F0%9F%90%B3%20latest%20tag&colorB=066da5&query=$.results[0].name&uri=https%3A%2F%2Fhub.docker.com%2Fv2%2Frepositories%2Fgtramontina%2Fdiagrams%2Ftags"></a>
  <a href="https://github.com/gtramontina/docker-diagrams/actions"><img height="20" alt="Build" src="https://img.shields.io/github/workflow/status/gtramontina/docker-diagrams/Build docker image/master?style=for-the-badge"></a>
</p>

<p align="center">
  Docker image for <a href="https://github.com/mingrammer/diagrams"><code>diagrams</code></a>
</p>

---

#### _Running:_

```sh
$ cat <diagram-file>.py | docker run -i --rm -v $(pwd)/out:/out gtramontina/diagrams:<version>
```

The `/out` directory is where `diagram` will generate your PNGs.

---

#### _Developing:_

```sh
$ make build    # Builds a new image
$ make test     # Runs/tests the image
$ make push     # Pushes the image up
$ make clean    # Removes any generated artifacts
$ make clobber  # Removes artifacts and generated images
```

---

<p align="right">🐳</p>
