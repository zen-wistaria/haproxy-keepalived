#!/bin/bash
set -e

if [ ! -f /config/haproxy.cfg ]; then
    echo "ERROR: /config/haproxy.cfg Not Found!"
    exit 1
fi

if [ ! -f /config/keepalived.conf ]; then
    echo "ERROR: /config/keepalived.conf Not Found!"
    exit 1
fi

echo "Starting services..."

# Start rsyslog (foreground)
rsyslogd

# Start haproxy (background)
haproxy -f /config/haproxy.cfg &

# Start keepalived (foreground)
exec keepalived -n -l -D -f /config/keepalived.conf
