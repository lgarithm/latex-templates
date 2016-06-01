. pack.sh
. uninstall.sh

mkdir $pkg
cd $_

cp $cwd/$pkg.tar .
tar -xf $pkg.tar

rm *.tar
mv latex.el latex-autoloads.el
