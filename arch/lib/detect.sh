#!/usr/bin/env bash
# lib/detect.sh — hardware/environment detection helpers.
# Sourced by 01-installation/scripts/00-vars.sh. Not meant to be run directly.
#
# Every function either echoes a value (capture with $(...)) or sets a
# well-known variable. Nothing here prompts the user — that's 00-vars.sh's job.

### RAM / swap ###
# Configurable extra swap on top of RAM, for hibernation headroom.
: "${HIBERNATE_HEADROOM_GIB:=4}"

detect_ram_gib() {
	# /proc/meminfo MemTotal is in KiB. Ceiling-divide to GiB.
	local kib
	kib=$(awk '/^MemTotal:/ {print $2}' /proc/meminfo)
	echo $(((kib + 1048575) / 1048576))
}

compute_swap_gib() {
	local ram_gib="$1"
	echo $((ram_gib + HIBERNATE_HEADROOM_GIB))
}

### GPU ###
# Echoes one of: intel | nvidia | amd | optimus (intel+nvidia hybrid) | amd-nvidia | unknown
detect_gpu_vendor() {
	local vga
	vga=$(lspci -nn 2>/dev/null | grep -Ei 'vga compatible controller|3d controller' || true)

	local has_intel=0 has_nvidia=0 has_amd=0
	grep -qi 'intel' <<<"$vga" && has_intel=1
	grep -qi 'nvidia' <<<"$vga" && has_nvidia=1
	grep -Eqi 'advanced micro devices|\bamd\b|\bati\b' <<<"$vga" && has_amd=1

	if [[ $has_intel -eq 1 && $has_nvidia -eq 1 ]]; then echo "optimus"
	elif [[ $has_amd -eq 1 && -eq 1 ]]; then echo "amd-nvidia"
	elif [[ $has_nvidia -eq 1 ]]; then echo "nvidia"
	elif [[ $has_amd -eq 1 ]]; then echo "amd"
	elif [[ $has_intel -eq 1 ]]; then echo "intel"
	else echo "unknown"
	fi
}

### Disks ###
# Prints "NAME SIZE MODEL TRAN" for every real disk (no partitions, no loop/rom devices).
list_disks() {
	lsblk -d -n -P -o NAME,SIZE,MODEL,TRAN,TYPE | while IFS= read -r line; do
		eval "$line"
		[[ "$TYPE" == "disk" ]] && echo "/dev/$NAME $SIZE $MODEL $TRAN"
	done
}
