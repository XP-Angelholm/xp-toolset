# ggLeap toolset

## About

This repository is a collection of simple scripts used in a local organisation called XP Ängelholm to simplify administrative tasks as well as to enhance the security of ggLeap, e.g by removing user details when a user signs out. A large quantity of the users possess limited technical abilities, therefore have certain decisions been made, such as separating tools with a simple usage and more advanced tools, such as standalone applications.

Utilising Batch and PowerShell accomplishes the goal of minimising the prerequisites due to no additional installation being required as well as simplifying the process of enabling and disabling each script through the web interface accompanying ggLeap.

## Features

- A simple installation with no additional prerequisites.
- Security enhancements to ggLeap.
- Additional features to ggLeap, such as an auditory reminder that the establishment is closing soon.
- Tools to simplify administrative tasks related to ggLeap, such as removing profile pictures in Windows.

## Technology stack

- PowerShell
- Batch

## Scripts

### How to enable and disable scripts

1. Open the web portal of ggLeap.
2. Click on _Settings_.
3. Click on _Client configuration_.
4. Click on _Advanced_.
5. Either delete or alter the paths to become incorrect.

### user-removal

These scripts are designed to be executed during startup and deletes user information to forcefully logout users of applications not affected by a similar process done by ggLeap.

### windows-profile-picture-removal

_windows-profile-picture-removal_ can be used to quickly remove profile pictures from computers with pictures due to people logging into Windows and Microsoft. This script can be disabled until a profile picture is required to be deleted. Instructions on how to enable and disable can be found [here](#how-to-enable-and-disable-scripts).

### 15-minutes-remaining-warning

_15-minutes-remaining-warning_ reminds the visitors that the establishment closes in 15 minutes by playing a sound. This script should be configured to be executed over an extended amount of time, in the web interface of ggLeap.

### installer-scripts

The scripts found in _installer-scripts_ are used to simplify the install process for the other scripts. A separate folder is used instead of dividing the install scripts based on usage to simplify the main install script as well as enabling individual downloads.

## The build and installation process

### Creating a build

The build process is initiated by executing _build.ps1_ and the latest build is found in the folder called _distribution_.

### Download and installation

#### Download

1. Start the computer in administrator mode.
2. Go to [the page containing releases](https://github.com/EliasNimlandLind/xp-toolset/releases/).
3. Click on _distribution.zip_ under _Assets_ to start the download. Choose the latest version.
4. Extract the ZIP file.
5. Open the resulting folder.
6. Ensure all computers are assigned a security group allowing the execution of Batch and PowerShell, in the web interface.

#### Installing using the main installer

7. Click on _main-installer.exe_.

#### Installing each script separately

7. Open _installer-scripts_.
8. Click on each file separately.

#### Configuring the ggLeap client

1. Follow step one to four under _How to enable and disable scripts_.
2. Add the installation path of each script to all computers, and ensure each path is consistent throughout all computers.

## The release workflow

A release is created by following these steps:

1. Create a traditional commit, starting with any of the keywords found below and adhering to this pattern `<the desired keyword>: <the commit message>`.
2. Execute `git tag v<the version number>`.
3. Execute `git push <the name of the remote> <the version number>`.

| Version type | Trigger in commit message | What it updates                                                          | Example change                                                   |
| ------------ | ------------------------- | ------------------------------------------------------------------------ | ---------------------------------------------------------------- |
| **Major**    | `BREAKING CHANGE`         | Increments the **major** version, resets **minor** and **patch** to `0`. | Refactoring core components that are not backward compatible.    |
| **Minor**    | `feat`                    | Increments the **minor** version, resets **patch** to `0`.               | Adding a new feature that does not break backward compatibility. |
| **Patch**    | `fix`                     | Increments the **patch** version.                                        | Fixing bugs or making minor improvements.                        |
