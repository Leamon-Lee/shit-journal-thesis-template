$pdf_mode = 1;
$pdflatex = 'xelatex -interaction=nonstopmode -synctex=1 %O %S';
$bibtex_use = 1;

add_cus_dep('bib','bbl',0,'do_bibtex');
sub do_bibtex {
  system("bibtex $_[0]");
}

