#!/bin/bash
# For loop to get images from worker and infrastructure nodes


for node in $(oc get nodes -l 'node-role.kubernetes.io/control-plane' -o jsonpath='{range .items[*].metadata}{""}{.name}{"\n"}{end}')
do
  echo "The node is $node"
  oc debug node/$node -- chroot /host cat /etc/kubernetes/kubelet.conf
  
done