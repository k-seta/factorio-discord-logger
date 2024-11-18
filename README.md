# factorio-discord-logger

A Discord chatbot for Factorio written in simple shell script

This bot check for updating console log of the factorio and posts simple differences to Discord channel via an incoming webhook.
It cannot read any Discord posts but only supports posting messages to Discord channels.

## Requirements

- [curl](https://curl.se/docs/install.html)

## Usage

### 1. add `--console-log` option to factorio headless server

Start (or restart) factorio headless server with `--console-log` option.

```shell
./bin/x64/factorio --start-server ./saves/my-save.zip --console-log /path/to/log
```

cf. [Official Factorio Wiki - Command line parameters](https://wiki.factorio.com/Command_line_parameters)

### 2. create a Discord Webhook

Generate a Webhook URL to post message by the bot.

> 1. Open your Server Settings and head into the Integrations tab:
> 2. Click the "Create Webhook" button to create a new webhook!

cf. [official Discord webhooks introduction page](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks)

### 3. Activate the bot

Set the environment variables and run the shell script in the background.
Daemonize it with systemd if necessary.

```shell
export FACTORIO_CONSOLE_LOG_PATH=/path/to/log
export DISCORD_INCOMING_WEB_HOOK_URL=https://discord.com/api/webhooks/xxxx/yyyy
nohup ./factorio-discord-logger.sh &
```

### 4. Conguratulations

Have a good "Factorio" life!
