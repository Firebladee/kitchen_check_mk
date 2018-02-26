#!/bin/bash

echo '192.168.33.10 default-puppet-master.vagrantup.com puppet' >> /etc/hosts
puppet agent --test
