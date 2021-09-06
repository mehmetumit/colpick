# !/bin/sh
#           _       _      _    
#  ___ ___ | |_ __ (_) ___| | __
# / __/ _ \| | '_ \| |/ __| |/ /
#| (_| (_) | | |_) | | (__|   < 
# \___\___/|_| .__/|_|\___|_|\_\
#            |_|               
# 
#author: Mehmet Ümit Özden
#dependencies: ImageMagick, scrot, xdotool, xclip(optional), notification daemon(optional)
VERSION="1.0"
TEMP_DIR="/tmp"
ICON_PATH="$TEMP_DIR/solid_color.png"
COLOR_TYPE="hex"
STDOUT=false
NOTIFY=false
NOTIFICATION_MESSAGE=""
ICON_SIZE="32x32"
BORDER_SIZE="1"
BORDER_COLOR="white"
COPY_TO_CLIPBOARD=false
EXPIRE_TIME=14000
help() {
    cat <<EOF
usage: colpick [OPTIONS...]

Pick color at mouse position

options:
	--help(-h)		Print this text and exit
	--version(-v)		Print colpick's version and exit
	--copy_to_clipboard(-c) Copy color code to clipboard
	--stdout(-so)		Output the color value to stdout
	--rgb			Show the color code as RGB instead of HEX
	--notify(-n)		Send the color code to notification daemon with solid color icon
	--icon_size(-ics)	Size of the notification solid color icon (default: 32x32)
	--border(-b)		Set border size of notification icon (default: 1)
	--border_color(-bc)	Set border color of notification icon (default: white)
	--expire_time(-t)	Set notification expire time as miliseconds
	--notification_message(-m)	Set notification message under color code
EOF
}
check_dependencies() {
	if [ $COPY_TO_CLIPBOARD == true ]; then
		! command -v xclip &>/dev/null && 
			echo "xclip need to be installed" && exit 1 
	else
		! command -v convert &>/dev/null &&
			echo "ImageMagick need to be installed" && exit 1
		! command -v scrot &>/dev/null &&
			echo "scrot need to be installed" && exit 1
		! command -v xdotool &>/dev/null &&
			echo "xdotool need to be installed" && exit 1 
	fi
}
# Converts hex code to rgb which includes hashtag
hex_to_rgb() { 
	rgb=$(printf "(%d,%d,%d)" 0x"${1:1:2}" 0x"${1:3:2}" 0x"${1:5:2}")
	echo $rgb
}
# Get color code depends on color type
get_color_code(){
	if [ $COLOR_TYPE == "rgb" ]; then
		color_code="$(hex_to_rgb $1)"
	else
		color_code=$1
	fi
	echo $color_code
}
main() {
	# x,y
	mouse_pos=$(xdotool getmouselocation | awk -F"[:a-z=&\"]*" '{printf "%d,%d",$2,$3}')
	# Bitmap for high accuarcy and speed
	hex_color=$(scrot -o "$TEMP_DIR/colpick.bmp" && convert "$TEMP_DIR/colpick.bmp" -set colorspace RGB -format "#%[hex:p{$mouse_pos}]" info:-)
	color_code="$(get_color_code $hex_color)"

	if [ $COPY_TO_CLIPBOARD == true ]; then
		printf $color_code | xclip -selection clipboard
	fi

	if [ $NOTIFY == true ]; then
		# Solid color icon for notification
		convert -bordercolor $BORDER_COLOR -border $BORDER_SIZE -size $ICON_SIZE xc:$hex_color $ICON_PATH
		# Notify the notification manager
		notify-send -t $EXPIRE_TIME -i $ICON_PATH $color_code $NOTIFICATION_MESSAGE
	fi

	if [ $STDOUT == true ]; then
		echo $color_code
	fi
}

check_dependencies

while [[ "$1" ]]; do
    case "$1" in
        -h|--help) help && exit ;;
        -v|--version) echo $VERSION && exit ;;
        -c|--copy_to_clipboard) COPY_TO_CLIPBOARD=true ;;
        -so|--stdout) STDOUT=true ;;
        --rgb) COLOR_TYPE="rgb" ;;
        -n|--notify) NOTIFY=true ;;
        -ics|--icon_size) ICON_SIZE="$2";;
		-b|--border) BORDER_SIZE="$2";;
		-bc|--border_color) BORDER_COLOR="$2";;
		-t|--expire_time) EXPIRE_TIME="$2";;
		-m|--notification_message) NOTIFICATION_MESSAGE="$2";;
    esac
    shift
done

main