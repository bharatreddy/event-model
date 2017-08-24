echo $1
gs -sDEVICE=pdfwrite -sOutputFile=$1.pdf -dUseArtBox -dNOPAUSE -dEPSCrop -c "<</Orientation 2>> setpagedevice" -f $1.ps -c quit
pdfcrop $1.pdf
mv $1-crop.pdf $1.pdf
pdftocairo -png $1.pdf
convert -delay 100 frames -loop 0 $1-*.png $1.gif
rm *.png
mv $1.pdf ../figs/
mv $1.gif ../figs/mov/
