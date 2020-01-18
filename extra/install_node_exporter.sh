#!/bin/bash

sudo curl -LO https://github.com/prometheus/node_exporter/releases/download/v0.15.1/node_exporter-0.15.1.linux-amd64.tar.gz
sudo tar -zxf node_exporter-0.15.1.linux-amd64.tar.gz
cd node_exporter-0.15.1.linux-amd64
sudo cp node_exporter /usr/local/bin/
sudo useradd node_exporter
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
cd ../
rm -f node_exporter-0.15.1.linux-amd64.tar.gz
sudo aws s3 cp s3://projeto05-transfers/node_exporter/node_exporter.service /etc/systemd/system/node_exporter.service
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter