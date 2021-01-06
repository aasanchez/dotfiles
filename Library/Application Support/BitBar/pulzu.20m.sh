#!/bin/bash
# <bitbar.title>Show templateImages and images</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Stefan Rakel</bitbar.author>
# <bitbar.author.github>ibutra</bitbar.author.github>
# <bitbar.desc>Example of how to use the templateImage and image parameter</bitbar.desc>
# <bitbar.image>http://i.imgur.com/Rva36NL.png</bitbar.image>
# <bitbar.abouturl>https://github.com/matryer/bitbar-plugins/blob/master/Tutorial/images.sh</bitbar.abouturl>
BitBarDarkMode=${BitBarDarkMode}

if [ "$BitBarDarkMode" ]; then
  COLOR="white"
else
  COLOR="black"
fi

function msg {
  echo "$1 | color=$COLOR"
}

# start=$(date -v1d +%Y-%m-%d)
# end=$(date -v+1m -v1d -v-1d +%Y-%m-%d)
# export PATH="/usr/local/bin:/usr/bin:$PATH"
# prefix=$(aws ce get-cost-and-usage --time-period Start="$start",End="$end" --granularity MONTHLY --metric "BlendedCost" | awk '/Unit/ {print $2;}' | sed 's/[,"]//g')
# cost=$(aws ce get-cost-and-usage --time-period Star
# t="$start",End="$end" --granularity MONTHLY --metric "BlendedCost" | awk '/Amount/ {print $2;}' | sed 's/[,"]//g' | xargs printf "%.*f\n" 2)

echo "| templateImage=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"
echo "---"
msg "Refresh | refresh=true"
# msg "Cost: $cost $prefix"
