#!/bin/bash

mv /root/custom_process_exporter/*  /root/

cat <<EOF >>/usr/bin/test.sh
#!/bin/bash
while true
do

/root/./grafana_push.sh;

sleep 1
done

EOF



cat <<EOF >>/lib/systemd/system/shellscript.service


[Unit]
Description=My Shell Script

[Service]
ExecStart=/usr/bin/test.sh

[Install]
WantedBy=multi-user.target

EOF

chmod +x /root/grafana_push.sh
chmod +x /usr/bin/test.sh


systemctl start shellscript.service

systemctl status shellscript.service

