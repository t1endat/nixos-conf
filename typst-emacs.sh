git clone --depth=1 --single-branch -b master git@github.com:uben0/tree-sitter-typst.git

cd tree-sitter-typst/src
cc -fPIC -c -I. parser.c

# Compile scanner.c.
if test -f scanner.c
then
    cc -fPIC -c -I. scanner.c
fi

# Compile scanner.cc.
if test -f scanner.cc
then
    c++ -fPIC -I. -c scanner.cc
fi

# Link.
if test -f scanner.cc
then
    c++ -fPIC -shared *.o -o "libtree-sitter-typst.so"
else
    cc -fPIC -shared *.o -o "libtree-sitter-typst.so"
fi

# Should remove folder after cp .so file
mkdir ~/.config/emacs/tree-sitter
cp libtree-sitter-typst.so ~/.config/emacs/tree-sitter
trash-put tree-sitter-typst/
