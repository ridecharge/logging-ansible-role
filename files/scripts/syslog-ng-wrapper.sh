#!/bin/bash

if [ -z "$TOKEN" ]; then
  echo "Missing \$TOKEN"
  exit 1
fi

TAG=$(curl http://169.254.169.254/latest/meta-data/instance-id)

sed -i "s/TOKEN/$TOKEN/g" /etc/syslog-ng/conf.d/22-loggly.conf
sed -i "s/TAG/$TAG/g" /etc/syslog-ng/conf.d/22-loggly.conf
cat /etc/syslog-ng/conf.d/22-loggly.conf
exec /usr/sbin/syslog-ng -F --no-caps