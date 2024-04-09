# docker_python3.10_scip
Dockerfile with Python 3.10, SCIP and pyscipopt installed.

Note that this Dockerfile is based on the official python:3.10-slim image. It installs the SCIP optimization suite and it's Python 
interface pyscipopt.

I opted to build SCIP from source, depending on your build environment it might be possible to install a pre-built version.

# Built Docker Image

[rhedak/py310_scip](https://hub.docker.com/repository/docker/rhedak/py310_scip/general)

# References

[Python 3.10 Docker Image](https://hub.docker.com/layers/library/python/3.10-slim/images/sha256-0d15918ecae76250659ae3036ad1fc898f801f6cb803860bdf0cc4b27fe316dc)

[SCIP Optimization Suite](https://scipopt.org/)

[pyscipopt](https://github.com/scipopt/PySCIPOpt)
