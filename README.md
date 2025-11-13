# xp-toolset

## Introduction

This repository is a collection of simple scripts used in a local organisation called XP Ängelholm to simplify administrative tasks as well as to enhance security, e.g by removing user details when a user signs out. These are structured to be used by people with limited technical abilities, therefore are advanced tools such as applications contained in seperate repositories. 

## Scripts

### user-removal

These scripts are designed to be executed during startup and deletes user information to forcefully logout users of applications not affected by a similar process done by ggLeap.

### windows-profile-picture-removal

_windows-profile-picture-removal_ can be used to quickly remove profile pictures from computers with pictures due to people logging into Windows and Microsoft.

### installer-scripts

The scripts found in _installer-scripts_ are used to simplify the install process for the other scripts. A seperate folder is used instead of dividing the install scripts based on usage to simplify the main install script as well as enabling individual download.

## Preparing files and installing

### Building files

1. Open PowerShell in the root folder.
2. Execute `Install-Module -Name ps2exe -Force`.
3. Execute `build.ps1`.
4. The files are found in _distribution_.

### Downloading and installing

#### Downloading

1. Start the computer in administrator mode.
2. Go to [the page containing releases](https://github.com/EliasNimlandLind/xp-toolset/releases/).
3. Click on _distribution.zip_ under _Assets_ to start the download. Choose the latest version.
4. Extract the ZIP file.
5. Open the resulting folder.

#### Installing using the main installer

6. Click on _main-installer.exe_.

#### Installing each script seperately

6. Open _installer-scripts_.
7. Click on each file seperately.

## The release workflow

Create a release by:

1. Create and push commits with trigger words to categorize the changes.
2. Create a release by executing `git tag <tag to use>` and `git tag <tag to use>`.

| Version type | Trigger in commit message | What it updates                                                          | Example change                                                   |
| ------------ | ------------------------- | ------------------------------------------------------------------------ | ---------------------------------------------------------------- |
| **Major**    | `BREAKING CHANGE`         | Increments the **major** version, resets **minor** and **patch** to `0`. | Refactoring core components that are not backward compatible.    |
| **Minor**    | `feat`                    | Increments the **minor** version, resets **patch** to `0`.               | Adding a new feature that does not break backward compatibility. |
| **Patch**    | `fix`                     | Increments the **patch** version.                                        | Fixing bugs or making minor improvements.                        |
