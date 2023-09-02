#!/usr/bin/env bash

echo "#!/usr/bin/env bash" > shell/.shell/credentials.sh
echo "" >> shell/.shell/credentials.sh

PAT=$(op item get 'gitlab - aasanchez' --format json | jq --raw-output '.fields | .[] | select(.label == "PAT") | .value')
echo "export GITLAB_TOKEN=\"$PAT\"" >> shell/.shell/credentials.sh

OPENAI_API_KEY=$(op item get 'Openai' --format json | jq --raw-output '.fields | .[] | select(.label == "Secret Key") | .value')
echo "export OPENAI_API_KEY=\"$OPENAI_API_KEY\"" >> shell/.shell/credentials.sh
