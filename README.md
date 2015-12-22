# ghost-wait-mysql

ghost-wait-mysql is a small modification to the official [Ghost](https://ghost.org/) [Docker image](https://hub.docker.com/_/ghost/) which waits for a mysql container to be up and running before continuing with the original entrypoint.

This avoids [problems](https://github.com/docker/compose/issues/374) when using Ghost with Docker Compose, where the Ghost container will error exit if it cannot reach mysql. See this issue for more info. 

### Quick Start

Just use the `bennetimo/ghost-wait-mysql` image in place of `ghost`

### Credits

The script used in this container is modified from a [comment](https://github.com/docker/docker/issues/7445#issuecomment-101523662) by artem-sidorenko.