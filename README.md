# Language switcher with `fn` key for Karabiner

## Introduction

Old non-M1 Macs dont support switching language with double `fn` press. But it can be
achieved using complex combinations in Karabiner-elements project.

This repository contains:
- MacOS CLI project that toggles languages (currently hardcoded to toggle between KK <-> ABC)
- Karabiner complex modification rule (file `double_fn_switch_langage.json)


## Installation

1. Clone this repo and open project in XCode
2. Release it by Archiving the project and copy generated `LanguageSwitcher` to somewhere
3. Specify full path to `LanguageSwitcher` to `shell_command` in `double_fn_switch_language.json` file
4. Copy `double_fn_switch_language.json` to `~/.config/karabiner/assets/complex_modifications`
5. Enable rule in `Karabiner-elements -> Preferences -> Complex modifications -> Add rule -> Execute LanguageSwitcher in shell`
6. Enjoy!

## Tested
1. Project created and compiled on:
    * MacOS BigSur 11.6.2
    * XCode 13.1
2. Karabiner-elements 14.3.0


(c) 2021
