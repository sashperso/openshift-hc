#!/bin/bash
# For loop to get images from worker and infrastructure nodes


for node in $(oc get nodes | awk '{print $1}' | sed '1d')
do
  echo "The node is $node" 
  oc debug node/$node -- chroot /host ls -la /etc/kubernetes/kubelet.conf
done