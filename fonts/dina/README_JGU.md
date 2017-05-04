install if there is only BDF files from Dina:
  mkdir -p PCF;
  cd BDF;
  for i in *; do bdstopcf $i > ../PCF/$i; done;
  cd ../PCF/;
  for i in *.bdf; do a=$(echo $i | sed 's/bdf/pcf/'); mv -vf $i $a; done;
