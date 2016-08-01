#!/usr/bin/env sh
#
# Usage:
#   ./mroonga-status.sh
#

ZABBIX_CONF=/etc/zabbix/zabbix_agentd.conf
ZABBIX_SEND=/usr/bin/zabbix_sender
DEBUG=1
ZABBIX_FLAG=1

function zabbix_send {
  [ ${DEBUG} -ne 0 ] && echo "Send key \"$1\" with value \"$2\"" >&2
  [ ${ZABBIX_FLAG} -ne 0 ] && $ZABBIX_SEND -c $ZABBIX_CONF -k "$1" -o "$2" 2>&1 >/dev/null
}

RESULT=$(mysql -e "SELECT mroonga_command('status') AS result;")

alloc_count=$(echo $RESULT | grep -o '"alloc_count":[0-9]\+' | grep -o '[0-9]\+')
n_queries=$(echo $RESULT | grep -o '"n_queries":[0-9]\+' | grep -o '[0-9]\+')
cache_hit_rate=$(echo $RESULT | grep -o '"cache_hit_rate":[0-9\.]\+' | grep -o '[0-9\.]\+')

echo 'alloc_count    : '$alloc_count
echo 'n_queries      : '$n_queries
echo 'cache_hit_rate : '$cache_hit_rate

zabbix_send 'mroonga.status.alloc_count'    $alloc_count
zabbix_send 'mroonga.status.n_queries'      $n_queries
zabbix_send 'mroonga.status.cache_hit_rate' $cache_hit_rate

exit 0
