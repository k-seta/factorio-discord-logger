#!/bin/sh

# Initialize
LOG_PATH=${FACTORIO_CONSOLE_LOG_PATH}
LOG_BACKUP_PATH=${LOG_PATH}.bak
URL=${DISCORD_INCOMING_WEB_HOOK_URL}

cp ${LOG_PATH} ${LOG_BACKUP_PATH}
LATEST=$(ls --full-time ${LOG_PATH} | awk '{print $6"-"$7}')

# Loop
while true; do
  sleep 5
  CURRENT=$(ls --full-time ${LOG_PATH} | awk '{print $6"-"$7}')
  if [ $LATEST != $CURRENT ] ; then
      # Get New Console Log Messages
      MESSAGES=$(diff --old-line-format='' --unchanged-line-format='' --new-line-format='%L' ${LOG_BACKUP_PATH} ${LOG_PATH})

      # POST Discord Incoming Webhook
      curl -s -X POST -H 'Content-Type: application/json' ${DISCORD_INCOMING_WEB_HOOK_URL} -d "{\"content\": \"${MESSAGES}\"}"

      cp ${LOG_PATH} ${LOG_BACKUP_PATH}
      LATEST=$CURRENT
  fi
done
