# factorio-discord-logger

A Discord chatbot for Factorio written in simple shell script

This bot check for updating console log of the factorio and posts simple differences to Discord channel via an incoming webhook.
It cannot read any Discord posts but only supports posting messages to Discord channels.

## Requirements

- [curl](https://curl.se/docs/install.html)

## Usage

### 1. add `--console-log` option to factorio headless server

You start (or restart) factorio headless server with `--console-log` option.

```shell
./bin/x64/factorio --start-server ./saves/my-save.zip --console-log /path/to/log
```

cf. [Official Factorio Wiki - Command line parameters](https://wiki.factorio.com/Command_line_parameters)
