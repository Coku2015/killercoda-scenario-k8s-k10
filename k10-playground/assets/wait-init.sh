#!/bin/bash

# waits for background init to finish

rm $0

clear

echo "#################################";
echo "##                             ##";
echo "##   Environment Detail:       ##";
echo "##   K3S v1.27                 ##";
echo "##   Kasten K10 + Minio        ##";
echo "##   Nginx Webserver           ##";
echo "##                             ##";
echo "#################################";

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