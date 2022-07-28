<h1 align="center">colpick</h1>
<p align="center">
	<img src="https://img.shields.io/github/languages/code-size/mehmetumit/colpick" alt="Code Size"/>
	<img src="https://img.shields.io/github/repo-size/mehmetumit/colpick" alt="Repo Size"/>
	<img src="https://img.shields.io/github/stars/mehmetumit/colpick?color=yellow" alt="Stars"/>
	<a href="https://aur.archlinux.org/packages/colpick"><img src="https://img.shields.io/aur/version/colpick?color=%23123456" alt="AUR Version"/></a>
	<img src="https://img.shields.io/github/license/mehmetumit/colpick" alt="License"/>
</p>

---

A Linux tool that allows users to pick color at the current position of the mouse.
* Integrated configuration option for allowing users to adapt their workflow.
* 1x1 Bitmap screenshot of mouse position used to get pixel color codes.
* Notifier, color codes(RGB and hex) and clipboard features implemented.

![demonstration](https://raw.githubusercontent.com/mehmetumit/colpick/main/demo/demo.gif)
## Dependencies
* `ImageMagick`
* `scrot`
* `xdotool`
* `xclip` (optional)
* notification-daemon (optional)

## Execution Time
```
$ time colpick -n

real	0m0.057s
user	0m0.037s
sys     0m0.028s
```

## Installation
- Arch Linux:
	- Install via AUR
		```sh
		yay -S colpick
		```
	- Or by using the PKGBUILD [colpick](pkgbuilds/PKGBUILD)
		```sh
		cd pkgbuilds/
		makepkg -si
		```
- In General:
	```sh
	# Clone the repository
	git clone https://github.com/mehmetumit/colpick.git
	# Change directory
	cd colpick
	# Install with make
	make install
	```

## Usage
```
$ colpick -h
usage: colpick [OPTIONS...]

Pick color at the current position of the mouse

options:
	--help(-h)			Print this text and exit
	--version(-v)			Print colpick's version and exit
	--copy_to_clipboard(-c) 	Copy color code to clipboard
	--stdout(-so)			Output the color value to stdout
	--rgb				Show the color code as RGB instead of HEX
	--notify(-n)			Send the color code to notification daemon with solid color icon
	--icon_size(-ics)		Size of the notification solid color icon (default: 32x32)
	--border(-b)			Set border size of notification icon (default: 1)
	--border_color(-bc)		Set border color of notification icon (default: white)
	--expire_time(-t)		Set notification expire time as miliseconds
	--notification_message(-m)	Set notification message under color code

```
