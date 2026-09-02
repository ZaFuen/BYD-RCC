#!/usr/bin/bash

opt="--verbose --compress-algo zlib --format-version 1 --binary"

./rcc ${opt} ./../qrc/45cluster_theme2.qrc -o ./../rcc/cluster_theme2.rcc
