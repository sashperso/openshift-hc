#!/bin/bash
# For loop to get images from worker and infrastructure nodes


for node in $(oc get nodes | grep -v master | awk '{print $1}' | sed '1d')
do 
  oc debug node/$node -- chroot /host; podman images | grep -v redhat | grep -v openshift-release-dev 
done

