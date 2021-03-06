# ghost-wait-mysql

ghost-wait-mysql is a small modification to the official [Ghost](https://ghost.org/) [Docker image](https://hub.docker.com/_/ghost/) which waits for a mysql container to be up and running before continuing with the original entrypoint.

This avoids [problems](https://github.com/docker/compose/issues/374) when using Ghost with Docker Compose, where the Ghost container will error exit if it cannot reach mysql. See this [issue](https://github.com/docker/compose/issues/374) for more info. 

### Quick Start

Just use the `bennetimo/ghost-wait-mysql` [image](https://hub.docker.com/r/bennetimo/ghost-wait-mysql/) in place of `ghost`

The version number of 'bennetimo/ghost-wait-mysql' matches the version of `ghost`

These are the current published tags:

 * 3.1 => for ghost 3.1
 * 2.37 => for ghost 2.37
 * 2.31 => for ghost 2.31
 * 2.2 => for ghost 2.2
 * 1.25 => for ghost 1.x
 * 0.7.3 => for ghost 0.x

### Configuration

By default the script will try to reach mysql every 2 seconds for 20 seconds. You can set environment variables to tweak this:

`ENV MYSQL_HOST=mysql`
> Mysql host to try to connect to

`ENV MYSQL_PORT=3306`
> Mysql host post`

`ENV WAIT_LOOPS=10`
> Max number of connection attempts

`ENV WAIT_SLEEP=2`
> Sleep time between each try

### Credits

The script used in this container is modified from a [comment](https://github.com/docker/docker/issues/7445#issuecomment-101523662) by artem-sidorenko.