#!/bin/sh

# cSpell: words autosetuprebase runuser

################################################################################

echo Running script ./.devcontainer/init.sh

# exit script if any command fails
set -e

################################################################################
# Set get pull mode to rebase. Do the same for branches that may exist. However
# this is a repo designed for trunk-based development, so there shouldn't be any
# branches other than 'main' [Manfred, 07 Feb 2025]
# For more details, see https://stackoverflow.com/a/13974638/411428
runuser -l node -c 'cd /work && git config pull.rebase true'
runuser -l node -c 'cd /work && git config branch.autosetuprebase always'
runuser -l node -c 'cd /work && git config --add safe.directory /work'
# option -l specifies the user on whose behalf the command is executed. Note that
#           this script runs as root. [Manfred, 07 Feb 2025]

################################################################################
# Make 'p' an alias for 'pnpm':
runuser -l node -c 'echo "alias p='pnpm'" >> /home/node/.bashrc && source /home/node/.bashrc'
# option -l specifies the user on whose behalf the command is executed. Note that
#           this script itself runs as root. [Manfred, 19 Oct 2024]


################################################################################
# Optional tools
#
# Some may require changes in .devcontainer/Dockerfile and/or configuration
# files. Comment in as required.
################################################################################


# ################################################################################
# # Start nginx
# echo ************************************************************************************************************
# echo starting nginx as background demon ...
# nginx &


# ################################################################################
# # start OPA agent in the background
# echo ************************************************************************************************************
# echo creating directory  /work/service/logs ...
# runuser -l node -c 'mkdir -p /work/service/logs'
# # ensure that the directory exists and is writable by the user 'node' and by user 'root'
# chmod 777 /work/service/logs
# runuser -l node -c 'opa run --log-level debug -w -s /work/service/src/config/policies > /work/service/logs/opa.log 2>&1 &'
# # option -l specifies the user on whose behalf the command is executed. Note that
# #           this script itself runs as root. For security reasons, we prefer OPA to run as
# #           non-root user. [Manfred, 19 Oct 2024]
# # To get a more verbose output - visible in Docker log output of the container - add the
# # following command line option:
# # `--log-level debug`
# # Meaning of command line options:
# # -w: watch for changes in the policy directory
# # -s: run in server mode (HTTP server)


################################################################################
echo Script ./.devcontainer/init.sh finished
