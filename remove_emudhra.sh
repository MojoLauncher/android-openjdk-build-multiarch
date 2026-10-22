#!/bin/bash
pushd openjdk
set +e
echo "Removing eMudhra certificates..."
rm jdk/make/data/cacerts/emsignrootcag2
rm jdk/make/data/cacerts/emsignrootcag1
rm jdk/make/data/cacerts/emsigneccrootcag3
popd
