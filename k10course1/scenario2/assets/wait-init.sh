#!/bin/bash

# waits for background init to finish

rm $0

clear

echo "#########################";
echo "##                     ##";
echo "##   $ k10 Shell       ##";
echo "##                     ##";
echo "#########################";

echo -n "Initialising Kubernetes..."
while [ ! -f /ks/.k8sfinished ]; do
    echo -n '.'
    sleep 1;
done;
echo " done"

echo -n "Installing K10, this can take a minute..."
while [ ! -f /ks/.initfinished ]; do
    echo -n '.'
    sleep 1;
done;
echo " done"

echo