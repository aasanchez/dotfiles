#!/bin/bash

# <bitbar.title>AWS Cost</bitbar.title>
# <bitbar.version>v1.0.0</bitbar.version>
# <bitbar.author>Sean Luce</bitbar.author>
# <bitbar.author.github>seanluce</bitbar.author.github>
# <bitbar.desc>Show the current months AWS costs.</bitbar.desc>

#Assumes AWS CLI is installed, 'pip install awscli' or 'pip3 install awscli', and 'aws configure' has been ran.

bitcoin_icon='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'

start=$(date -v1d +%Y-%m-%d)
end=$(date -v+1m -v1d -v-1d +%Y-%m-%d)
export PATH="/usr/local/bin:/usr/bin:$PATH"
prefix=$(aws ce get-cost-and-usage --time-period Start="$start",End="$end" --granularity MONTHLY --metric "BlendedCost" | awk '/Unit/ {print $2;}' | sed 's/[,"]//g')
cost=$(aws ce get-cost-and-usage --time-period Start="$start",End="$end" --granularity MONTHLY --metric "BlendedCost" | awk '/Amount/ {print $2;}' | sed 's/[,"]//g' | xargs printf "%.*f\n" 2)

echo "|templateImage=$bitcoin_icon"

echo "---"

echo "Cost: $cost" "$prefix"
