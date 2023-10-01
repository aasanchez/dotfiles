#!/usr/bin/env bash

echo "#!/usr/bin/env bash" > configs/.shell/credentials.sh
echo "" >> configs/.shell/credentials.sh

GITHUB_ACCESS_TOKEN=$(op item get 'GitHub' --format json | jq --raw-output '.fields | .[] | select(.label == "Personal access token") | .value')
echo "export GITHUB_ACCESS_TOKEN=\"$GITHUB_ACCESS_TOKEN\"" >> configs/.shell/credentials.sh

GITLAB_ACCESS_TOKEN=$(op item get 'gitlab - aasanchez' --format json | jq --raw-output '.fields | .[] | select(.label == "GITLAB_ACCESS_TOKEN") | .value')
echo "export GITLAB_ACCESS_TOKEN=\"$GITLAB_ACCESS_TOKEN\"" >> configs/.shell/credentials.sh

echo "export GITLAB_USER=\"aasanchez\"" >> configs/.shell/credentials.sh

OPENAI_API_KEY=$(op item get 'Openai' --format json | jq --raw-output '.fields | .[] | select(.label == "Secret Key") | .value')
echo "export OPENAI_API_KEY=\"$OPENAI_API_KEY\"" >> configs/.shell/credentials.sh

WAKATIME_API_KEY=$(op item get 'wakatime' --format json | jq --raw-output '.fields | .[] | select(.label == "api key") | .value')

rm -rf "configs/.wakatime.cfg"
touch "configs/.wakatime.cfg"
# Use a here document to write multiple lines to the file
cat <<EOL > "configs/.wakatime.cfg"
[settings]
api_key = $WAKATIME_API_KEY
EOL
