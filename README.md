ebooks-tools
============

VM with tools for converting Djvu to PDF, OCR for text layer creation. 

Quick start
===========

1. Before start you need install [Vagrant](https://www.vagrantup.com/downloads).
2. Clone this repository `git clone git@github.com:torinaki/ebooks-tools.git`
3. Start VM `cd ./ebooks-tools; vagrant up`
4. Connect to VM via SSH `vagrant ssh; cd ./share`

Now you are ready.

Convert DJVU to PDF
===================
1. Put DJVU file to `./ebooks-tools` folder. Then it will be accesable on VM because this folders shares via your computer and VM
2. Start convertion `sh ./convert.sh your_ebook.djvu converted_ebook.pdf`

Create DJVU text layer with OCR tool
====================================
1. Put DJVU file to `./ebooks-tools` folder.
2. Start text recognition process 
   `ocrodjvu --engine tesseract --language=rus -o your_ebook_with_text_layer.djvu  your_ebook.djvu`


