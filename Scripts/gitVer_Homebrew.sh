#!/bin/bash

#---Information---#

# gitVer_Homebrew.sh
# Checks if Git installed via Homebrew and reports version to DataDog
# Created by Maxim Levey <github.com/maximlevey>
# Last Modified 12/02/2023

#---Requirements---#

# Custom DataDog metric "git.version.homebrew" to be created before script deployed

#---Start Script---#

# Check if Git is installed via Homebrew
# Check Git version and create variable $git_version

if [ -x /opt/homebrew/bin/git ]; then
	git_version=$(/opt/homebrew/bin/git --version | awk '{print $3}')
	echo "Git version: $git_version"
else
	echo "Git has not been installed via Homebrew"
	exit 1
fi

# Check if datadog-agent is installed on the device
# Write Git version to datadog metric "git.version.homebrew"

dog=`which datadog-agent`
if [ "$dog" != "" ]; then
	$dog metric send "git.version.homebrew" gauge $git_version
	echo "Git version reported to DataDog"
else
	echo "DataDog agent is not installed"
	exit 1
fi

exit 0

#---End Script---#
