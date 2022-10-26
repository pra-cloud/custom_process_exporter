#!/bin/bash
host="$(hostnamectl | awk '/hostname/ {print $3}')"
z=$(ps -aux)
while read -r z
do
  var=$var$(awk '{print "'$host'_cpu_usage{process=\""$11"\", pid=\""$2"\"}", $3z}');
done <<< $z
curl -X POST -H  "Content-Type: text/plain" --data "$var" http://165.22.210.27:9091/metrics/job/top/instance/machine

