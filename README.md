# Mroonga Status Template for Zabbix

This Zabbix template is template for resource monitoring of Mroonga status.  
In this example the settings path of zabbix is `/etc/zabbix/`.


### Setting zabbix monitoring client side

Install `zabbix-sender`.  
If cannot install zabbix sender, after zabbix RPM installation, try again!

    $ sudo yum zabbix-sender install

Setting script file.

    $ curl https://raw.githubusercontent.com/tetsuwo/zabbix-mroonga-template/master/src/bin/mroonga-status.sh > /etc/zabbix/bin/mroonga-status.sh
    $ sudo chown zabbix:zabbix /etc/zabbix/bin/mroonga-status.sh
    $ sudo chmod +x /etc/zabbix/bin/mroonga-status.sh

Test with `/etc/zabbix/bin/mroonga-status.sh`.

    alloc_count    : 1147104
    n_queries      : 124014
    cache_hit_rate : 0.0
    Send key "mroonga.status.alloc_count" with value "1147104"
    Send key "mroonga.status.n_queries" with value "124014"
    Send key "mroonga.status.cache_hit_rate" with value "0.0"


### Setting zabbix server side

Import template ([download](https://raw.githubusercontent.com/tetsuwo/zabbix-mroonga-template/master/templates/template.xml)).

Macro ... nothing
