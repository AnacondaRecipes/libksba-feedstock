#!/usr/bin/env bash

# t-crl-parser and t-ocsp are excluded because they rely on oidtranstbl.h
# which is not distributed

cd tests
# Build tests, link against npth
export COMP_OPTIONS="-I${CONDA_PREFIX}/include -L${CONDA_PREFIX}/lib -lksba -lgpg-error -Wl,-rpath,${CONDA_PREFIX}/lib"
#export COMP_OPTIONS="$COMP_OPTIONS -pthread"    # [linux]
$CC t-cms-parser.c -o t-cms-parser $COMP_OPTIONS
#$CC t-crl-parser.c -o t-crl-parser $COMP_OPTIONS
$CC t-der-builder.c -o t-der-builder $COMP_OPTIONS
$CC t-dnparser.c -o t-dnparser $COMP_OPTIONS
#$CC t-ocsp.c -o t-ocsp $COMP_OPTIONS
$CC t-oid.c -o t-oid $COMP_OPTIONS
$CC t-reader.c -o t-reader $COMP_OPTIONS
# Run tests
set -v
./t-cms-parser --verbose
#./t-crl-parser --verbose
./t-der-builder --verbose
./t-dnparser --verbose
#./t-ocsp --verbose
./t-oid
./t-reader
