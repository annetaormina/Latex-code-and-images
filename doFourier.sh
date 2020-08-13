#!/bin/bash

FILE=$PWD/"Fourier"

/usr/local/bin/latexml --dest=$FILE.xml --includestyles $FILE.tex

/usr/local/bin/latexmlpost --dest=$FILE.html $FILE.xml


sed -i ' ' '/<head>/ a\
	<script src=\"https:\/\/cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.3/MathJax.js?config=TeX-MML-AM_CHTML\"><\/script>' $FILE.html

sed -i ' ' '/<\/head>/ i\
	<link rel="stylesheet" href=\"https:\/\/samfearn.github.io\/latexml.min.css\">' $FILE.html
	
	# The  following command adds the right amount of padding around the text in the last box appearing in Fourier.html
	
sed -i ' ' 's/padding-top:12pt;padding-bottom:12pt;/padding-top:0pt;padding-bottom:12pt;padding-left:12pt;padding-right:12pt;/g' $FILE.html 
