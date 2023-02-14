# gitVer Scripts
Custom scripts to detect the install location of Git and report the version of that location to DataDog

> **Note**
> To successfully deploy this script, it is necessary to create specific DataDog custom metrics, which correspond to the script names listed in the table below. Additionally, the script looks for a DataDog Agent installation on the machine, without DataDog agent, the script will not report metrics and instead `exit 1`figl

| Script      | Metric     | 
|:------------| :------------|
|[gitVer_APT.sh](https://github.com/maximlevey/gitVer/blob/main/Scripts/gitVer_APT.sh)|`git.version.apt` |
|[gitVer_Homebrew.sh](https://github.com/maximlevey/gitVer/blob/main/Scripts/gitVer_Homebrew.sh)|   `git.version.homebrew`    |
|[gitVer_Nix.sh](https://github.com/maximlevey/gitVer/blob/main/Scripts/gitVer_Nix.sh)|`git.version.nix` |
|[gitVer_Other.sh](https://github.com/maximlevey/gitVer/blob/main/Scripts/gitVer_Other.sh)|`git.version.other` |
|[gitVer_Xcode.sh](https://github.com/maximlevey/gitVer/blob/main/Scripts/gitVer_Xcode.sh)|`git.version.xcode` |

