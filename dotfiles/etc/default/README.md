# grub setup
grub-mkfont -s 48 -o /boot/grub/fonts/jetbrains48.pf2 /usr/share/fonts/TTF/JetBrainsMonoNerdFontMono-Regular.ttf
# edit /etc/default/grub (tracked in etc/default/grub)
grub-mkconfig -o /boot/grub/grub.cfg
