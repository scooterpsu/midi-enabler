#!/bin/sh

mkdir -p ipkg/etc/
mkdir -p ipkg/home/retrofw/
cp timidity.cfg ipkg/etc/
cp -R .timidity ipkg/home/retrofw/

cd ipkg

sed -e "s/^Version:.*/Version: $(date +%Y%m%d)/" ../control > control

echo "2.0" > debian-binary

tar -czvf control.tar.gz control ../postinst ../preinst --owner=0 --group=0
tar -czvf data.tar.gz etc home --owner=0 --group=0
ar rv ../midi-enabler.ipk control.tar.gz data.tar.gz debian-binary

cd ..
rm -r ipkg
