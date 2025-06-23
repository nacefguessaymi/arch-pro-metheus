#!/bin/bash

#Set system time to Eastern US time
ln -sf /usr/share/zoneinfo/US/Eastern/ /etc/localtime

# Set hardware clock
hwclock --systohc

#
