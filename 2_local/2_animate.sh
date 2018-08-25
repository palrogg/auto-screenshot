# This converts all the pngs to gifs
# and then animates them
# Run with 'bash animate.sh'
DATE=$1
FILES=$DATE/*.png

for f in $FILES
do
   renamed=${f/.png/.gif}
   theHour=${f##*_}
   
   echo "Converting $f to $renamed"
   convert $f -gravity Northwest -chop 404x0 \
	   -pointsize 60 -annotate +80+20 "$DATE ${theHour//.png/}" $renamed
done

echo "Converting into an animated gif"
gifsicle --delay=30 --loop --colors 256 $DATE/*.gif > $DATE.gif


ffmpeg -i $DATE.gif -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" $DATE.mp4