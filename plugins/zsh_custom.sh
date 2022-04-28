#!/bin/bash
while true; do
    read -p "Do you wish to install this program? yes (y) / no (n)" yn
    case $yn in
        [Yy]* ) make install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


