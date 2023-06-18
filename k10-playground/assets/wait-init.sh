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

echo -n "Installing Scenario, this can take 3-5 minutes..."
while [ ! -f /ks/.initfinished ]; do
    echo -n '.'
    sleep 20;
done;
echo " done"

echo