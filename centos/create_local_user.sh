#!/bin/bash
id -u 'mspif'
result=$?
if [ $result -eq 0 ]
then
    echo "User already exists."
else
    password='123Qweasdzxc!@#'
    useradd -m 'mspif' -p $password
    chage -E -1 -M 99999 mspif
    echo "mspif ALL=(ALL)   NOPASSWD:ALL" >> /etc/sudoers.d/vagrant
fi