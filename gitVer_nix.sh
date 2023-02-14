#!/bin/bash

#---Information---#

# gitVer_mix.sh
# Checks if Git installed via Nix Package Manager and reports version to DataDog
# Created by Maxim Levey <github.com/maximlevey>
# Last Modified 14/02/2023

#---Requirements---#

# Custom DataDog metric "git.version.nix" to be created before script deployed

#---Start Script---#

# Check if Git is installed via Nix Package Manager
# Check Git version and create variable $git_version

if [ -x /run/current-system/sw/bin/git ]; then
	git_version=$(/run/current-system/sw/bin/git --version | awk '{print $3}')
	echo "Git version: $git_version"
else
	echo "Git has not been installed via Nix Package Manager"
	exit 1
fi

# Check if datadog-agent is installed on the device
# Write Git version to datadog metric "git.version.nix"

dog=`which datadog-agent`
if [ "$dog" != "" ]; then
	$dog metric send "git.version.nix" gauge $git_version
	echo "Git version reported to DataDog"
else
	echo "DataDog agent is not installed"
	exit 1
fi

exit 0

#---End Script---#
