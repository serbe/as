#!/bin/sh

sed -e 's/#ru_RU.U/ru_RU.U/g' /etc/locale.gen
sed -e 's/#en_US.U/en_US.U/g' /etc/locale.gen

locale-gen

echo LANG=ru_RU.UTF-8 > /etc/locale.conf

pacman -S terminus-font --noconfirm --needed

echo LOCALE=ru_RU.UTF-8 > /etc/vconsole.conf
echo KEYMAP=ruwin_cplk-UTF-8 >> /etc/vconsole.conf
echo FONT=ter-u16n >> /etc/vconsole.conf
echo USECOLOR=yes >> /etc/vconsole.conf

sed -e 's/base udev/base consolefont keymap udev/g' /etc/mkinitcpio.conf

mkinitcpio -p linux
