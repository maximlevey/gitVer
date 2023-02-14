# gitVer

<img alt="gitVerGift" src="https://user-images.githubusercontent.com/72744507/218667651-e796e53e-2ab6-4a59-b120-fda048d274b7.gif" width="600" />

About
------

A collection of Shell Scripts developed to retrieve the version of Git installed at the specified location. This information is then reported to DataDog for observability.

Usage
------

These scripts are designed to be deployed via an MDM solution such as Kandji or Jamf - alternatively, each script can be run directly from the command line.  
```
> sudo ./gitVer_Homebrew
```
> **Note**
>Since the script may need to search system directories, it will need to be run as root.

Requirements
------

To successfully deploy these scripts, it is necessary to create specific DataDog custom metrics, which correspond to the script names listed in the table below. Additionally, the script looks for a DataDog Agent installation on the machine, without DataDog agent, the script will not report metrics and instead `exit 1`

| Script      | Metric     | 
|:------------| :------------|
|[gitVer_APT.sh](https://github.com/maximlevey/gitVer/blob/main/Scripts/gitVer_APT.sh)|`git.version.apt` |
|[gitVer_Homebrew.sh](https://github.com/maximlevey/gitVer/blob/main/Scripts/gitVer_Homebrew.sh)|   `git.version.homebrew`    |
|[gitVer_Nix.sh](https://github.com/maximlevey/gitVer/blob/main/Scripts/gitVer_Nix.sh)|`git.version.nix` |
|[gitVer_Other.sh](https://github.com/maximlevey/gitVer/blob/main/Scripts/gitVer_Other.sh)|`git.version.other` |
|[gitVer_Xcode.sh](https://github.com/maximlevey/gitVer/blob/main/Scripts/gitVer_Xcode.sh)|`git.version.xcode` |

