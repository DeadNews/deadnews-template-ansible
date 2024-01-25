# Ansible managed

# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# export the docker socket
export XDG_RUNTIME_DIR=/run/user/${UID}
export DOCKER_HOST=unix://${XDG_RUNTIME_DIR}/docker.sock
