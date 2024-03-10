#!/bin/bash
mkdir ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh
ssh-keygen -t rsa -f id_rsa_pgpool
ssh-copy-id -i id_rsa_pgpool.pub postgres@postgres1.local
ssh-copy-id -i id_rsa_pgpool.pub postgres@postgres2.local
ssh-copy-id -i id_rsa_pgpool.pub postgres@postgres3.local

su - postgres
mkdir ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh
ssh-keygen -t rsa -f id_rsa_pgpool
ssh-copy-id -i id_rsa_pgpool.pub postgres@postgres1.local
ssh-copy-id -i id_rsa_pgpool.pub postgres@postgres2.local
ssh-copy-id -i id_rsa_pgpool.pub postgres@postgres3.local