#!/usr/bin/env bash

PAT=$(op item get 'gitlab - aasanchez' --format json | jq --raw-output '.fields | .[] | select(.label == "PAT") | .value')
echo "GITLAB_TOKEN=\"$PAT\"" > shell/.shell/credentials.sh
