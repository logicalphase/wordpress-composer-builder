#!/bin/bash

if [ -z "$GH_USER" ]; then
    echo "You must define \"GH_USER\" environment variable" >&2
    exit 2
fi

if [ -z "$GH_TOKEN" ]; then
    echo "You must define \"GH_PASSWORD\" environment variable" >&2
    exit 2
fi

git config --global user.email ${GH_EMAIL:-no-reply@presslabs.com}
git config --global user.name $GH_USER
cat <<EOF > ~/.netrc
machine github.com
       login ${GH_USER}
       password ${GH_TOKEN}
EOF
