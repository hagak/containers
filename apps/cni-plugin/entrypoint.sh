#!/bin/sh
mkdir /plugins && tar -zxvf /*.tgz -C /plugins && rm /*.tgz && cp /plugins/* /host/opt/cni/bin
