#!/usr/bin/env bash

echo "#!/usr/bin/env bash" > configs/.shell/credentials.sh
echo "" >> configs/.shell/credentials.sh

GITHUB_ACCESS_TOKEN=$(op item get vfqwhypvkeg7pa3auzgz4b3kna --format json | jq --raw-output '.fields | .[] | select(.label == "Personal access token") | .value')
echo "export GITHUB_ACCESS_TOKEN=\"$GITHUB_ACCESS_TOKEN\"" >> configs/.shell/credentials.sh

GITLAB_ACCESS_TOKEN=$(op item get un5sf5joa2jtm74kyi2qambavq --format json | jq --raw-output '.fields | .[] | select(.label == "GITLAB_ACCESS_TOKEN") | .value')
echo "export GITLAB_ACCESS_TOKEN=\"$GITLAB_ACCESS_TOKEN\"" >> configs/.shell/credentials.sh

echo "export GITLAB_USER=\"aasanchez\"" >> configs/.shell/credentials.sh

OPENAI_API_KEY=$(op item get 'Openai' --format json | jq --raw-output '.fields | .[] | select(.label == "Secret Key") | .value')
echo "export OPENAI_API_KEY=\"$OPENAI_API_KEY\"" >> configs/.shell/credentials.sh
