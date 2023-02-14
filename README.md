# gitVer

Custom scripts to detect the install location of Git and report the version of that location to DataDog

<img alt="gitVer" src="https://user-images.githubusercontent.com/72744507/218667651-e796e53e-2ab6-4a59-b120-fda048d274b7.gif" width="800" />

> **Note**
> To successfully deploy these scripts, it is necessary to create specific DataDog custom metrics, which correspond to the script names listed in the table below. Additionally, the script looks for a DataDog Agent installation on the machine, without DataDog agent, the script will not report metrics and instead `exit 1`

| Script      | Metric     | 
|:------------| :------------|
|[gitVer_APT.sh](https://github.com/maximlevey/gitVer/blob/main/Scripts/gitVer_APT.sh)|`git.version.apt` |
|[gitVer_Homebrew.sh](https://github.com/maximlevey/gitVer/blob/main/Scripts/gitVer_Homebrew.sh)|   `git.version.homebrew`    |
|[gitVer_Nix.sh](https://github.com/maximlevey/gitVer/blob/main/Scripts/gitVer_Nix.sh)|`git.version.nix` |
|[gitVer_Other.sh](https://github.com/maximlevey/gitVer/blob/main/Scripts/gitVer_Other.sh)|`git.version.other` |
|[gitVer_Xcode.sh](https://github.com/maximlevey/gitVer/blob/main/Scripts/gitVer_Xcode.sh)|`git.version.xcode` |

