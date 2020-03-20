#!/bin/bash

curl -L https://bootstrap.saltstack.com -o bootstrap-salt.sh
sha256sum bootstrap-salt.sh

echo "NOW LISTEN UP YER LIL MAGGOT: yer gonna go to https://github.com/saltstack/salt-bootstrap and check the bloody checksum before you type yes, aye?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) sh bootstrap-salt.sh -x python3; break;;
        No ) exit;;
    esac
done

sed "1imaster: $1" /etc/salt/minion
systemctl restart salt-minion
