#!/bin/bash

#---Information---#

# gitVer_other.sh
# Checks if Git installed at paths outside known directories and reports version to DataDog
# Created by Maxim Levey <github.com/maximlevey>
# Last Modified 14/02/2023

#---Requirements---#

# Custom DataDog metric "git.version.other" to be created before script deployed

#---Variables---#

# Define knownDirectories for apt, homebrew, nix and xcode install paths

knownDirectories=("/usr/bin/git" "/opt/homebrew/bin/git" "/run/current-system/sw/bin/git" "/Library/Developer/CommandLineTools/usr/bin/git")

#---Start Script---#

# Create a flag to indicate that the current path is not listed in knownDirectories
# Check Git installation paths using "which git" and Compare to knownDirectories
# If a match is found, set the unknown flag to false

for path in $(which git); do
	unkown=true
for knownDir in "${knownDirectories[@]}"; do
	if [ "$path" == "$knownDir" ]; then
		unknown=false
		break
	fi
done

# If Git is installed at an unknown directory, check if datadog-agent is installed on the device
# Write Git version to datadog metric "git.version.other"
	
if $unknown; then
	dog=`which datadog-agent`
	if [ "$dog" != "" ]; then
		$dog metric send "git.version.other" gauge $git_version
		echo "Git version reported to DataDog"
	else
		echo "DataDog agent is not installed"
		exit 1
	fi
		echo "Found Git in unknown directory: $path"
		unknown=true
	fi
done

# If Git is not found in any unknown directories, exit

if ! $unknown; then
	echo "Git installation not found in any unknown directories."
	exit 1
fi

exit 0

#---End Script---#
