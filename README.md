<h1 align="center">colpick</h1>
<p align="center">
	<img src="https://img.shields.io/github/languages/code-size/MehmetUmit/colpick" alt="Code Size"/>
	<img src="https://img.shields.io/github/repo-size/MehmetUmit/colpick" alt="Repo Size"/>
	<img src="https://img.shields.io/github/license/MehmetUmit/colpick" alt="License"/>
</p>

---

Fast way to pick color at mouse position on linux.

![demonstration](https://github.com/MehmetUmit/colpick/blob/main/demo/demo.gif)
## Dependencies
* `ImageMagick`
* `scrot`
* `xdotool`
* `xclip` (optional)
* notification daemon (optional)
## Execution Time
```sh
$ time colpick -n

real	0m0.326s
user	0m0.253s
sys     0m0.135s
```
## Installation
```sh
# Clone the repository
$ git clone https://github.com/mehmetumit/colpick.git
# Change directory
$ cd colpick
# Install with make
$ sudo make install
```
## Usage
```
$ colpick -h
usage: colpick [OPTIONS...]

Pick color at mouse position

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
