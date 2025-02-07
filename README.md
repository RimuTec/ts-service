# ts-service

Template repository for a dev container for TypeScript development of a micro service. All source code is available under the very permissive MIT license.

If you have suggestions for improvement please create an issue in this repository. While we may not adopt any such suggestion, we are keen to hear all of them.

By recording them as an issue, you also give other people the opportunity to participate in the discussion and give them ideas for how to adapt the code in this repository to their needs.

## Prerequisites

Windows:
- WSL2
- Docker Desktop
- git client
- VS Code with extension for "Remote Development"

MacOS:
- Docker Desktop
- git client
- VS Code with extension for "Remote Development"

Linux:
- Docker engine. Docker Desktop is likely to create issues with permissions due to user ids and group ids.
- git client
- VS Code with extension for "Remote Development"

## How To Use This Container

Suggested steps when cloning this repo:
1. Create a new repo from this template repo
2. Rename all occurrences of "ts-service" to the desired service name, e.g. "foobar-service"
3. Change the value of env variable `COMPOSE_PROJECT_NAME` in file `.env`. The file contains recommendations.
4. Change the network name in file `.devcontainer/docker-compose.yml` to something more suitable. The recommendation is to use the same value that you use for `COMPOSE_PROJECT_NAME`
5. Choose suitable port numbers in file `.devcontainer/docker-compose.yml`
6. On your host, open a bash terminal, and switch to the directory of the repo clone
7. Run `code .` (the dot is significant)
8. When prompted, re-open in the dev container. If you are not prompted,

## Troubleshooting

Some suggested troubleshooting steps. Note, these don't cover all possible root causes, just the most commons ones that I ran into myself or that I sorted out in collaboration with other software engineers who got stuck.

### General

- Make sure Docker Desktop (MacOS, Windows) or Docker Engine (Linux) is running
- Make sure the VS Code extension for "Remote Development" is installed

### Not prompted to re-open in dev container

- Double check you are in the correct directory. When using `ls -la` it should list a directory `.devcontainer`
- If you are you can try building and starting the dev container from the bash shell

  ```bash
  docker compose -f .devcontainer/docker-compose.yml -p <project-name> build
  docker compose -f .devcontainer/docker-compose.yml -p <project-name> up -d
  docker compose -f .devcontainer/docker-compose.yml -p <project-name> stop
  ```

  Replace `<project-name>` with the name you chose for the value in `.env` file. See section "How To Use This Container".

  The first two commands help with identifying what is missing. Read the output carefully. Some issue can be buried in a lot of output and is easy to overlook.

  The last command stops the container again.

  Using the `-p` option essentially helps making sure that the command - generally speaking - does the same thing that VS Code does. This is not entirely true but I spare you the details.
