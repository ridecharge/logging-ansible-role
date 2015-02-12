#!/bin/bash

if [ -z "$LOGGLY_TOKEN" ]; then
  echo "Missing \$LOGGLY_TOKEN"
  exit 1
fi

if [ -z "$TAG" ]; then
	TAG=$(curl http://169.254.169.254/latest/meta-data/instance-id)
fi

sed -i "s/LOGGLY_TOKEN/$LOGGLY_TOKEN/g" /etc/syslog-ng/conf.d/22-loggly.conf
sed -i "s/TAG/$TAG/g" /etc/syslog-ng/conf.d/22-loggly.conf
cat /etc/syslog-ng/conf.d/22-loggly.conf
exec /usr/sbin/syslog-ng -F --no-caps -v