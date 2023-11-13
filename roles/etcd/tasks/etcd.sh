#!/bin/bash
# Run a tailored version of fio


for node in $(oc get nodes -l 'node-role.kubernetes.io/control-plane' -o jsonpath='{range .items[*].metadata}{""}{.name}{"\n"}{end}' )
do
  echo "The node is $node, spinning up fio container" 
  oc debug node/$node -- chroot /host podman run --volume /var/lib/etcd:/var/lib/etcd:Z quay.io/openshift-scale/etcd-perf exit
done