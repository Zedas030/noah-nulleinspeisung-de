#!/bin/sh
# Startet noah-mqtt, falls der Container nicht laeuft. Gedacht als erzwungener SSH-Befehl
# (command="..." in authorized_keys) fuer einen eigenen Schluessel von Home Assistant, damit
# eine HA-Automation den Container neu starten kann, ohne eine Shell auf dem Host zu bekommen.
# Gibt eine Zeile fuers Logbuch aus.
if docker inspect --format "{{.State.Running}}" noah-mqtt 2>/dev/null | grep -qx true; then
  echo "noah-mqtt laeuft bereits"
else
  docker start noah-mqtt >/dev/null && echo "noah-mqtt gestartet"
fi
