---
Installing Arch Linux
---

# Arch Linux Documentation
The documentation on the arch linux website is very comprehensive and well written. 
I followed [this guide](https://wiki.archlinux.org/title/Installation_guide) to the letter.

## Preparing an Image
### Downloading and Verifying the Image
I downloaded the arch iso from the MIT mirror.
I tried to use the Matebook for most steps on this guide so I had to figure out how to verify the signature of the iso.
The [checksum](https://archlinux.org/download/#checksums) for the iso is
```bash
06ee9907fef3a9843a5b1408bbb426cf5c703aa00ca191ee24daa7ddda82a6a7
```
Due to using Windows, I had to figure out how to use [PowerShell](https://learn.microsoft.com/en-us/powershell/) to check the hash for the iso.
I use the
```powershell
Get-FileHash -Path "./archlinux-version-x86_64.iso" -Algorithm "SHA256" 
```
to verify the signature.
### Burning the Image Onto the Flash Drive
For a flash drive I used this USB-C/A [SanDisk 256GB Flash Drive](https://www.bestbuy.com/site/sandisk-ultra-dual-drive-go-256gb-usb-type-a-usb-type-c-flash-drive-black/6421486.p?skuId=6421486).
To get arround having to use an exe to burn the image onto a flash drive, and to set up a seperate small partition just for the arch iso I used my Macbook to get access to the `dd` command.
For generating the live image, I set up a small `8GB` partition for the image using Apple's [`diskutil`](https://ss64.com/mac/diskutil.html) command.
```bash
diskutil patitionDisk /dev/<disk_flash_drive> GPT FAT32 "arch" 4G ExFAT "data"  
```
This creates a `FAT32` partition for the installation media, and the rest of the flash drive to be useable by most OS (using `exfat`).
Then following the [guide](https://wiki.archlinux.org/title/USB_flash_installation_medium#:~:text=In-,macOS,-Using%20macOS%20dd) I unmounted the partition and used the `dd` command to burn the image.

## Installation
First I made sure to back up all my data on the laptop onto an external hard drive.
Bye bye Windows.
## Disabling Secure Boot
On this device Secure Boot needs to be disabled.
I simply held down the `F12` key during boot to access the BIOS and disable it from there.
## Installing
To use the installation media, it was as simple as choosing `Arch Linux install medium` and pressing `Enter`.
Now begins the actual process.
From here I simply followed [the guide](https://wiki.archlinux.org/title/Installation_guide#:~:text=the%20installation%20medium.-,Set%20the%20console%20keyboard%20layout%20and%20font,-The%20default%20console) to make sure the keyboard layout was set to US and changed to the font they recommended.
Then I verified he boot mode according to the guide.
The Matebook X Pro has 64-bit architecture, so the command returned `64`.
I connected to the internet using `ip-link`.
Then I made sure the system clock is enabled.
## Partitioning the Disk
The laptop comes with a `512GB` SSD.
In addition, it comes with `16GB` of RAM.
This is important to know because I set up a `swap` partition to use hibernate.
In addition, it supports `EFI` booting, so this partition needed to be created.
Following [the guide](https://wiki.archlinux.org/title/Installation_guide#:~:text=%23%20timedatectl-,Partition%20the%20disks,-When%20recognized%20by) I created this patition layout.

| Partition | Format | Type | Notes |
| --------- | ------ | ---- | ----- |
