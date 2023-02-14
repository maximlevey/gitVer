#!/bin/bash

#---Information---#

# gitVer_APT.sh
# Checks if Git installed via apt-get and reports version to DataDog
# Created by Maxim Levey <github.com/maximlevey>
# Last Modified 12/02/2023

#---Requirements---#

# Custom DataDog metric "git.version.apt" to be created before script deployed

#---Start Script---#

# Check if Git is installed via apt-get
# Check Git version and create variable $git_version

if [ -x "/usr/bin/git" ]; then
	git_version=$(/usr/bin/git --version | awk '{print $3}')
	echo "Git version: $git_version"
else
	echo "Git has not been installed via apt-get"
	exit 1
fi

# Check if datadog-agent is installed on the device
# Write Git version to datadog metric "git.version.apt"

dog=`which datadog-agent`
if [ "$dog" != "" ]; then
	$dog metric send "git.version.apt" gauge $git_version
	echo "Git version reported to DataDog"
else
	echo "DataDog agent is not installed"
	exit 1
fi

exit 0
