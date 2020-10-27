# aem_tools_splunk_mysql
Powershell scripts to copy over and install Splunk Forwarder and updateMySqlrefreshfolder
In order for "CopySplunk winstall remotePSsession" & UpdateMySqlrefreshfolder to operate properly
1. update the servers.txt file with the full proper domain name, example "us2pdsaem606.adminsys.mrll.com" etc.
2. in the same network segment on a server as admin "username-a"
3. on the server , select "run with Powershell" the servers in the "servers.txt" file will populate each machine with Splunk and the mysqlfolder<-is needed to PUB.
