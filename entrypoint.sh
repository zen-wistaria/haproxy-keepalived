#!/bin/bash
set -e

# Check config exists
if [[ ! -f /config/haproxy.cfg ]]; then
    echo "ERROR: /config/haproxy.cfg not found" >&2
    exit 1
fi

if [[ ! -f /config/keepalived.conf ]]; then
    echo "ERROR: /config/keepalived.conf not found" >&2
    exit 1
fi

echo "Starting rsyslog..."
rsyslogd

echo "Starting HAProxy..."
haproxy -f /config/haproxy.cfg &

echo "Starting Keepalived..."
exec keepalived -n -l -D -f /config/keepalived.conf
