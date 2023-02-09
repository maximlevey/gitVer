#!/bin/bash

# Requires custom DataDog metric "git.version.nix" to be created before script deployed

# Check if Git is installed via Nix package manager
# Check git version and create $git_version variable

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
