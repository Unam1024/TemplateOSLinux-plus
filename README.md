# Zabbix_template_linux_OS-plus

Overview

This tenplate provides more accurate data for cpu, memory and swap usage using dependent items supported since V3.4.x, and a hostscreen which helps you to look over important metrics of linux operating system at a grance. 

As known before V3.4, it was sometimes difficult to have accurate graph image for system resources especialy when the data change rapidly, because there was no choice except collecting each metric at different timing. Thanks to dependent iems on Zabbix 3.4, multiple data collected with single polling can be easily separated to multiple items on Zabbix.    

This template is suposed to work together with the official template,"Template OS linux".

Elemets

•zbx_export_templates - linux OS - Plus.xml (tempalte)
•userparameter_linux-plus.conf (userparameter)
•memory_zabbix_master_item.sh (bash sctipt)

Installation

1.Place the script "memory_zabbix_master_item.sh" on a directory like /usr/local/bin on Zabbix or Proxy Server. 
2.Change script file permision, "chmod 0755 memory_zabbix_master_item.sh".
3.Place the userscript file on /etc/zabbix/zabbix_agentd.d.
4.Restart zabbix agent.
5.Import template.

If you'd like to apply this template to a host which is already associated with Template OS Linux, you need to choose "unlink" it before adding this template. Be sure not to choose "unlink and clear" to prevent from missing collected data.  

 
