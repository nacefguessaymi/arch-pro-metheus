---
Installing Arch Linux
---

# Arch Linux Documentation
The documentation on the arch linux website is very comprehensive and well written. 
I followed [this guide](https://wiki.archlinux.org/title/Installation_guide) to the letter.

## Preparing an Image
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
For a flash drive I used this USB-C/A [SanDisk 256GB Flash Drive](https://www.bestbuy.com/site/sandisk-ultra-dual-drive-go-256gb-usb-type-a-usb-type-c-flash-drive-black/6421486.p?skuId=6421486).
To get arround having to use an exe to burn the image onto a flash drive, and to set up a seperate small partition just for the arch iso I used my Macbook to get access to the `dd` command.
For generating the live image, I set up a small `8GB` partition for the image using Apple's [`diskutil`](https://ss64.com/mac/diskutil.html) command.
```bash
diskutil patitionDisk /dev/<disk_flash_drive>/ 2  
```
