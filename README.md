# gitVer

About
------

A collection of Shell Scripts developed to retrieve the version of Git installed at the specified location. This information is then reported to DataDog for observability.

Additionally, [`gitVer_other.sh`](https://github.com/maximlevey/gitVer/blob/main/gitVer_other) has been created to detect and report on all Git installations outside of known locations. The scripts output can be used to create additional scripts for specific paths and will also report to its own DataDig metric, `git.version.other` 

Usage
------

These scripts are designed to be deployed via an MDM solution such as Kandji or Jamf - alternatively, each script can be run directly from the command line.  
```
> sudo ./gitVer_homebrew
```
> **Note**
>Since the script may need to search system directories, it will need to be run as root.

Requirements
------

To successfully deploy these scripts, it is necessary to create specific DataDog custom metrics, which correspond to the script names listed in the table below. Additionally, the script looks for a DataDog Agent installation on the machine, without DataDog agent, the script will not report metrics and instead `exit 1`

| Script      | Metric     | 
|:------------| :------------|
|[gitVer_apt.sh](https://github.com/maximlevey/gitVer/blob/main/gitVer_apt.sh)|`git.version.apt` |
|[gitVer_homebrew.sh](https://github.com/maximlevey/gitVer/blob/main/gitVer_homebrew.sh)|   `git.version.homebrew`    |
|[gitVer_nix.sh](https://github.com/maximlevey/gitVer/blob/main/gitVer_nix.sh)|`git.version.nix` |
|[gitVer_other.sh](https://github.com/maximlevey/gitVer/blob/main/gitVer_other.sh)|`git.version.other` |
|[gitVer_xcode.sh](https://github.com/maximlevey/gitVer/blob/main/gitVer_xcode.sh)|`git.version.xcode` |

