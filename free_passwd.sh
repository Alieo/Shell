#!/bin/bash
#一句话实现免密登录多个树莓派
# $1：表示pi上用户名
# $2: 表示pi的ip
ssh-copy-id -i ~/.ssh/id_rsa.pub $1@$2

