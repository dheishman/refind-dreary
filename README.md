# refind-dreary
A gloomy rEFInd theme (as seem in [this Reddit thread](https://www.reddit.com/r/unixporn/comments/62mvp9/i_present_to_you_refinddreary_a_gloomy_refind/)) based on rEFInd-minimal and rEFInd-ambience, taking the best of both themes.

This is a fork with an added readme for a description, as well as instructions for how to install the theme.

## Author's description
<code>
This theme is based on /u/Evan-Purkhiser 's rEFInd-minimal, and /u/dyslexiccoder 's refind-ambience. Just wanted to extend credit where credit is due, and thank you both for making those awesome themes. This one is not much more than a mashup of my favorite parts of each.
</code>

## Installation instructions
<b>1.</b> Locate your rEFInd EFI directory. This is commonly <code>/boot/EFI/refind</code>, though it will depend on where you mount your ESP and where rEFInd is installed. <code>fdisk -l</code> and <code>mount</code> may help you find it.

<b>2.</b> Create a folder called "themes" inside it, if it doesn't already exist.

<b>3.</b> Clone or copy this repository into the themes directory.

<b>4.</b> To enable the theme, add <code>include themes/refind-dreary/theme.conf</code> at the end of <code>refind.conf</code>.

Here's an example menuentry configuration:

<code>
menuentry "Arch Linux" {
	icon /EFI/refind/themes/rEFInd-minimal/icons/os_arch.png
	loader vmlinuz-linux
	initrd initramfs-linux.img
	options "rw root=UUID=dfb2919d-ff78-48db-a8a7-23f7542c343a loglevel=3"
}

menuentry "Windows" {
	icon /EFI/refind/themes/rEFInd-minimal/icons/os_win.png
	loader /EFI/Microsoft/Boot/bootmgfw.efi
}

menuentry "OSX" {
	icon /EFI/refind/themes/rEFInd-minimal/icons/os_mac.png
	loader /EFI/Apple/Boot/bootmgfw.efi
}
</code>

Entries that are autodetected should also show the proper icons.
