#!/bin/bash

cd `dirname $0`/../../..

rm -rf /opt/scripts
mkdir -p /opt/scripts
cp src/scripts/macbook-pro/* /opt/scripts
chown root:root /opt/scripts/*

echo "" >> /etc/sudoers
echo "ALL ALL=(ALL) NOPASSWD: /opt/scripts/*.sh" >> /etc/sudoers
echo "" >> /etc/sudoers

echo "#!/bin/bash" > bin/set-gfx-slow
echo "sudo /opt/scripts/slow-gfx.sh" >> bin/set-gfx-slow
echo "" >> bin/set-gfx-slow
chmod +x bin/set-gfx-slow

