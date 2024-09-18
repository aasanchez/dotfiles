#!/usr/bin/env bash

# <xbar.title>Gitlab MR Status</xbar.title>
# <xbar.version>v1.0</xbar.version>
# <xbar.author>Alexis Sanchez</xbar.author>
# <xbar.author.github>aasanchez</xbar.author.github>
# <xbar.author.gitlab>aasanchez</xbar.author.gitlab>
# <xbar.desc>Getting MR Statuses base on Labels</xbar.desc>

export PATH=$PATH:/opt/homebrew/bin
export PATH="$PATH:/usr/local/bin"

source ~/.shell/credentials.sh

AUTH=$(echo -n "alexis@watechnology.com:$JIRA_API_TOKEN" | base64)

READY_TO_DEPLOY_LABELS="BSX,Ready+to+Deploy"
NEEDS_REVIEW_LABELS="BSX,Needs+Review"


GITLAB_LOGO="iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAAAv3pUWHRSYXcgcHJvZmlsZSB0eXBlIGV4aWYAAHjabVBbDgMhCPznFD2CAioex+3apDfo8YtCzdp2EofHxBGB/no+4DaAkYFTkVxzDgquXLFpIsHQJsfAk61A1+LehyWgtkgjWSl5XbR+XAYWmmbpYiR3F45dqOz+8mXkD9OYaOSnG1U3IjQhukGzb4VcpVy/cPSwQ+zAIJZ97J+66PbOpO8QYqdIQZmIbQAah4DaECbrOpRx5mWyuJku5N+ePoA32dpZCOihYEIAAAGDaUNDUElDQyBwcm9maWxlAAB4nH2RPUjDUBSFT1NFqS0OdhBxyFCd7KIijrUKRagQaoVWHUxe+gdNGpIUF0fBteDgz2LVwcVZVwdXQRD8AXF1cVJ0kRLvSwotYnxweR/nvXO47z5AaFaZZvUkAE23zUwqKebyq2LfK0IYoIpAlJllzElSGr7r6x4Bvt/FeZb/vT9XRC1YDAiIxAlmmDbxBvHMpm1w3ieOsrKsEp8TT5jUIPEj1xWP3ziXXBZ4ZtTMZuaJo8RiqYuVLmZlUyOeJo6pmk75Qs5jlfMWZ61aZ+0++QvDBX1lmetUo0hhEUuQIEJBHRVUYSNOu06KhQydJ338I65fIpdCrgoYORZQgwbZ9YP/we/ZWsWpSS8pnAR6XxznYwzo2wVaDcf5Pnac1gkQfAau9I6/1gRmP0lvdLTYETC4DVxcdzRlD7jcAYafDNmUXSlIJRSLwPsZfVMeGLoFQmve3NrnOH0AsjSr9A1wcAiMlyh73efd/d1z+/dOe34/WRRynH5Mg20AAA16aVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/Pgo8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJYTVAgQ29yZSA0LjQuMC1FeGl2MiI+CiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiCiAgICB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIKICAgIHhtbG5zOnN0RXZ0PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VFdmVudCMiCiAgICB4bWxuczpHSU1QPSJodHRwOi8vd3d3LmdpbXAub3JnL3htcC8iCiAgICB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgeG1wTU06RG9jdW1lbnRJRD0iZ2ltcDpkb2NpZDpnaW1wOmEwM2M4ZjQxLTRhM2ItNGQ0MC04MDZjLTVmY2FlZmU5YWVmYyIKICAgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo1MGJiNjcxYy0wMjJiLTRmMjAtYjJjYi1lYzA0Y2VjYzNlMzYiCiAgIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDowNTc0ZDMzZi1kNzU4LTQ3NTYtODA3NC03MjQ5NGU2MzZkMDYiCiAgIEdJTVA6QVBJPSIyLjAiCiAgIEdJTVA6UGxhdGZvcm09Ik1hYyBPUyIKICAgR0lNUDpUaW1lU3RhbXA9IjE2OTcwMTk0MzgxOTEyNDYiCiAgIEdJTVA6VmVyc2lvbj0iMi4xMC4zNCIKICAgZGM6Rm9ybWF0PSJpbWFnZS9wbmciCiAgIHRpZmY6T3JpZW50YXRpb249IjEiCiAgIHhtcDpDcmVhdG9yVG9vbD0iR0lNUCAyLjEwIgogICB4bXA6TWV0YWRhdGFEYXRlPSIyMDIzOjEwOjExVDEyOjE3OjE4KzAyOjAwIgogICB4bXA6TW9kaWZ5RGF0ZT0iMjAyMzoxMDoxMVQxMjoxNzoxOCswMjowMCI+CiAgIDx4bXBNTTpIaXN0b3J5PgogICAgPHJkZjpTZXE+CiAgICAgPHJkZjpsaQogICAgICBzdEV2dDphY3Rpb249InNhdmVkIgogICAgICBzdEV2dDpjaGFuZ2VkPSIvIgogICAgICBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOmM3NTY4YTU4LWY4ZDgtNGU3ZC1hZGQzLWFhMmUxMDcyNzUyMCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iR2ltcCAyLjEwIChNYWMgT1MpIgogICAgICBzdEV2dDp3aGVuPSIyMDIzLTEwLTExVDEyOjE3OjE4KzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAKPD94cGFja2V0IGVuZD0idyI/PnoW8EIAAAAGYktHRAD/AP8A/6C9p5MAAAAJcEhZcwAACxMAAAsTAQCanBgAAAAHdElNRQfnCgsKERL308m0AAACWklEQVQ4y4WTz0tUURTHP+fe92beNL6ZCQdzCH8kpk5agSsrKTGDsLJFGwmy1pGtosR/oEW0MZetrH20yF2ti0CooKwsTVpYhBgiMszMOy3mNf6gN33hLO693/vl+73nXCHE0mC+R0QvGpWpphcf1qmBpaG8L4FeR5hteT7/DsAALJ/JiwhXBbmtwgD/gVEGRGRSkMuLA91SFSKgWaAf2AOcW+hvM1Eii2c7LHA+5A4aEzQDmK/DnQKcBLoBCxyJxePNUUK2aJuAnpDbJcIxAOMUJBUK1QECtAL5Gsm6gbaQ6wND3wbzGQekBTgVHgBkgUvLpw9ZINj9PKAjQH24FuA4QpNjLL1BmQPbyC4wCnohwlFdyPmLTmP1hFPfWr5W2BBnc00oFQRVAJJhRUIEHE9JpNXEkjrquHH63LiSSCkbq8Lmb0O5WLv91lUSGUhmAmzFW58BVgGsA35WSecC3IRGirgJJZ1T/PqqCMCqAZ5V7RrwkhWil1JEdkbxUkomp3hJRbZNmipPDehD4OPWDYh5SiYXkMwqxoKxkMxW9lxPt/pbwbzAI6Mqcwp3gFdANZOx4GcD0u2V8rMBxu4QCICXChMKrwWgMN5uLaZL4ZbAFcAqIHuB/eG178BaVaQM+hj0fgl57z34XK6aLN7sFILAF5FxHG7QwD4aEZyQUAJWUH6yQolp0GkjwbqZ+qKwOy1QHOuIyWGGaWASQ2/4pyouyszxS+/atzorMwuFHXMV1ebiTMdRESaAkbA3T1Tlnjv26c0/B7TW4JVmDjYiDAMqqrN2bOFHFPcPVNOvMbQzfvMAAAAASUVORK5CYII="
GIT_LOGO="iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAOVBMVEWJV+WJV+WJV+WJV+WJV+WJV+WJV+WJV+WJV+WJV+Xl2/qUZ+ju5vyederZyffQvPWxkO68n/CphOwABBCrAAAACnRSTlMB7+7/qEmxF+SSRZmxPgAAAHtJREFUGNNlj9sSxCAIQ9FIq2C9/f/HFquzs7vNk54JkBCZOEQgBqalM3k8cul8/gc+OiZJQCt9k2TzDio1Xwt4pgBoEdFtCWT7ceUJtJkt0sQqIr2bz8gGo9WSax4G1oi9MGqfI7YUP0vZf591/A72jm7l3I65yv3VvwHqGQV6jQ4tqAAAAABJRU5ErkJggg=="

FONT=( 'size=13' 'font=UbuntuMono' )

ready_to_deploy=$(curl --silent --output -H "Content-Type: application/json" "https://gitlab.com/api/v4/groups/67410723/merge_requests?labels=$READY_TO_DEPLOY_LABELS&state=opened&sort=asc" --header "PRIVATE-TOKEN: $GITLAB_ACCESS_TOKEN")
needs_review=$(curl --silent --output -H "Content-Type: application/json" "https://gitlab.com/api/v4/groups/67410723/merge_requests?labels=$NEEDS_REVIEW_LABELS&state=opened&sort=asc" --header "PRIVATE-TOKEN: $GITLAB_ACCESS_TOKEN")

to_deploy=$(echo $ready_to_deploy | jq length )
to_review=$(echo $needs_review | jq length )

echo " $to_deploy🚀 - $to_review📚 | image=$GITLAB_LOGO"

echo "---"
echo "Label BSX | href=https://gitlab.com/groups/betstudios/-/merge_requests?scope=all&state=opened&label_name[]=BSX | image=$GIT_LOGO | $FONT" 
echo "Label BSX Merged | alternate=true | href=https://gitlab.com/groups/betstudios/-/merge_requests?scope=all&state=merged&label_name[]=BSX | image=$GIT_LOGO | $FONT" 
echo "---"
echo "🚀 Ready to Deploy: | href=https://gitlab.com/groups/betstudios/-/merge_requests?label_name[]=Ready+to+Deploy&label_name[]=BSX"
repo=""
echo "$ready_to_deploy"| jq -c 'sort_by(.project_id) | .[]' | while read -r project; do
  if [[ $(echo $project | jq -r '.draft') == true ]]; then continue; fi
  project_repo=$(echo $project | jq -r '.references.relative' | sed 's#.*/\(.*\)!\(.*\)#\1#' )
  title=$(echo $project | jq -r '.title')
  JIRA_KEY=$(echo "${title%% *}" | tr -cd '[:alnum:]-' | tr '[:lower:]' '[:upper:]')
  JIRA=$(curl -s "https://draad.atlassian.net/rest/api/3/issue/$JIRA_KEY" -H "Authorization: Basic $AUTH" -H "Content-Type: application/json" -X GET)
  JIRA_STATUS=$(echo $JIRA | jq -r .fields.status.name | tr '[:upper:]' '[:lower:]')
  JIRA_FLAG=$(echo $JIRA | jq -r .fields.customfield_10021)
  if [ "$JIRA_FLAG" != "null" ]; then FLAG="🚩"; else FLAG=""; fi
  if [ "$repo" != "$project_repo" ]; then repo="$project_repo"; echo -e "\033[1;34m$repo\033[0m"; fi
  if [ "$(echo $project | jq -r '.detailed_merge_status')" != "mergeable" ]; then icon="🚫"; else icon="✅"; fi
  echo -e "$FLAG $icon \033[1;31m$title\033[0m by $(echo $project | jq -r '.assignee.name') \033[1;33m$JIRA_STATUS\033[0m | href=$(echo $project | jq -r '.web_url') | $FONT"
  echo -e "Jira Ticket: \033[1;33m$JIRA_KEY\033[0m | alternate=true | href=https://draad.atlassian.net/browse/$JIRA_KEY | $FONT"
done

echo "---"

repo=""
echo "📚 Needs Review: | href=https://gitlab.com/groups/betstudios/-/merge_requests?scope=all&state=opened&label_name[]=Needs+Review&label_name[]=BSX"
echo "$needs_review" | jq -c 'sort_by(.project_id) | .[]' | while read -r project; do
  if [[ $(echo $project | jq -r '.draft') == true ]]; then continue; fi
  project_repo=$(echo $project | jq -r '.references.relative' | sed 's#.*/\(.*\)!\(.*\)#\1#' )
  title=$(echo $project | jq -r '.title')
  JIRA_KEY=$(echo "${title%% *}" | tr -cd '[:alnum:]-' | tr '[:lower:]' '[:upper:]')
  echo -e "\033[1;31m$title\033[0m by $(echo $project | jq -r '.assignee.name') \033[1;33m$JIRA_STATUS\033[0m | href=$(echo $project | jq -r '.web_url') | $FONT"
  echo -e "Jira Ticket: \033[1;33m$JIRA_KEY\033[0m | alternate=true | href=https://draad.atlassian.net/browse/$JIRA_KEY | $FONT"
done



echo "---"
echo "Refresh | refresh=true"
