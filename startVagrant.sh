#!/bin/bash
vagrant up

vagrant ssh deploy-server -- -t  'curl http://releases.ubuntu.com/16.04/ubuntu-16.04.4-server-i386.iso.torrent --output ubuntu-16.04.4-server-i386.iso.torrent && tar -czvf  ubuntu-16.04.4-server-i386.iso.torrent.tar.gz ubuntu-16.04.4-server-i386.iso.torrent && scp -o StrictHostKeyChecking=no -q ./ubuntu-16.04.4-server-i386.iso.torrent.tar.gz testing@10.10.10.3:/home/testing'
#vagrant ssh deploy-server -- -t  'curl http://releases.ubuntu.com/16.04/ubuntu-16.04.4-server-i386.iso.torrent --output ubuntu-16.04.4-server-i386.iso.torrent && tar -czvf  ubuntu-16.04.4-server-i386.iso.torrent.tar.gz ./ubuntu-16.04.4-server-i386.iso.torrent && scp ubuntu-16.04.4-server-i386.iso.torrent.tar.gz testing@10.10.10.3:'
