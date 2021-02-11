# Containered Caddy template

A Docker containered Caddy server template with a bash script to simplify startup process.

## Prerequisites

You should have installed [Docker](https://docs.docker.com/get-docker/) and [Docker-compose](https://docs.docker.com/compose/install/) to continue with this repo.

## How to

- [Configure Caddyfile](https://caddyserver.com/docs/caddyfile) as you wish.
- Run `docker-compose up -d` or using [run.sh](./run.sh) script.


## Example

Template Caddyfile:

```
:80 {
  route /api/* {
    uri strip_prefix /api
    reverse_proxy localhost:3001
  }

  reverse_proxy localhost:3000
}
```

Line-by-line explanation:

- Listen on **port** 80.
- Open route rules block on every `/api` request:
  - Strip /api
  - Proxy the request to `localhost:3001`
- Close route rules block.
- Proxy all other requests to `localhost:3000`