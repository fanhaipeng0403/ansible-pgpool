#!/bin/bash
cd ~/.ssh
ssh-keygen -t rsa -f id_rsa
ssh-copy-id -i id_rsa.pub postgres@postgres1.local
ssh-copy-id -i id_rsa.pub postgres@postgres2.local