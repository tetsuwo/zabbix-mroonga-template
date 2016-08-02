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

    $ zabbix_agentd -t memcached.stat[--host,localhost,--port,11211,--item,version]
    memcached.stat[--host,localhost,--port,11211,--item,version] [t|1.4.13]


### Setting zabbix server side

Import template ([download](https://raw.githubusercontent.com/tetsuwo/zabbix-mroonga-template/master/templates/template.xml)).

Macro ... nothing
