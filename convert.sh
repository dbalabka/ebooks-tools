#!/bin/sh

_convert () { 
    local c="djvu2hocr -p${2} ${1} | sed 's/ocrx/ocr/g' > pg${2}.html && ddjvu -format=tiff -page=${2} ${1} pg${2}.tif && pdfbeads -d -o pg${2}.pdf"
    echo "$c"
    eval "$c"
    rm ./*.tif
    rm ./*.html
    rm ./*.sym
    rm ./*.jbig2
}

_convert_all () {
    local n=`djvused -e "n" $1`
    echo "$n pages to process\n"

    for i in $(seq 1 $n)
    do
        _convert $1 $i
    done

    local c="pdftk "
    for i in $(seq 1 $n)
    do
        c="${c} pg${i}.pdf"
    done
    c="$c cat output $2"
    echo "$c"
    eval "$c"
    rm -rf pg*.pdf
}
_convert_all $1 $2
