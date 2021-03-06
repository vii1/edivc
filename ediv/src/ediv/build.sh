#!/bin/bash
DEBUG="-g -ggdb3 -D_DEBUG -DDBG -DDEBUG"
CCOPTS="-I. -I../shared ${DEBUG} -fPIC"

FILES="
edivcfg/dictionary
edivcfg/e_error
edivcfg/edivcfg
edivcfg/mainparse
edivcfg/strlib
compiler
ediv
ediv_export
encrypt
expresion
language
listados
lower
ltlex
modulos
parser
varindex
../../src/shared/utils
"

OBJECTS=""

for FILE in $FILES; do
	gcc -c $FILE.c $CCOPTS -o $FILE.o
	OBJECTS+="$FILE.o "
done

gcc $OBJECTS -o ../../bin/edivc -lz -ldl

rm $OBJECTS
