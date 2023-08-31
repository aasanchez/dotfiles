#!/usr/bin/env bash

echo "#!/usr/bin/env bash" > shell/.shell/credentials.sh
echo "" >> shell/.shell/credentials.sh

PAT=$(op item get 'gitlab - aasanchez' --format json | jq --raw-output '.fields | .[] | select(.label == "PAT") | .value')
echo "export GITLAB_TOKEN=\"$PAT\"" >> shell/.shell/credentials.sh
