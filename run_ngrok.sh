#!/bin/bash

curl -o ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip || exit $?
unzip ngrok.zip || exit $?
chmod +x ngrok

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC2sRCSZ+QsmOLnsCXDuU0MEebt1IOU2DSZA9VI7CBox2F/1JpBKPWsBdz1G5PKLcV3+A5y2pvKF4vyST663ep5fBsMWOdxOUo3iyvQxuXNYrt3sm9nNFh50aPSXRmD6EegOFcpPPzvnrTnGnKvE3xQmeGeUM1jmOcpQmw1+mEhCfSN8R/QqPreTgDR1A6UP4yiXQYuQxZkB7As88pD+P3juViY1Gds3L8Nvu0WcMHCBugY8MhePiDASDZpbRLUiPT/pxTV/WwjPsbKHv9PIBCoon1ZcreSPfBHKR4DlSCgB/Es6rpilYpj6ipCjpV83KuagKx2PKPUMlc1PIhWIUX9I9ri4Nz52xRICwXhcdyxjacA/k17jQIWG26oB5bDIxTAIKIdTGbPhyrLMFkA+3bXBBG7U4Bhy1BT5C0EhPRUxmepkpf9qM53uTJTDzhrx4MH6FjCiUI+UiqI3FQUZ/fGJUqsCbN9D33PKKQx5qaqV/E8fOf7+VZbmmUNR02tuuM= qasim@tci-work" > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
echo "Starting sshd..."
sudo systemctl start sshd || exit $?

echo "Starting ngrok..."
./ngrok authtoken $NGROK_TOKEN
./ngrok tcp 22 --log=stdout --log-level=debug
echo "ngrok exited $?" 
