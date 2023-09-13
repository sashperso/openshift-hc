#!/usr/bin/env bash
# description: Checks if there are pending csr

#[ -z ${UTILSFILE} ] && source $(echo "$(dirname ${0})/../utils")

error=false
pattern=approved

if oc auth can-i get csr >/dev/null 2>&1; then
  pending_csr=$(oc get csr --no-headers --ignore-not-found=true | grep -ci "$pattern")
  if [[ ${pending_csr} -ge 1 ]]; then
    PCSR=$(oc get csr --no-headers | grep -i "$pattern")
    echo "Pending CSRs (${pending_csr})"
    echo "${PCSR}"
    errors=$(("${errors}" + 1))
    error=true
  fi
  if [[ $error == true ]]; then
    exit 1
  else
    echo "pending csrs"
    echo $pending_csr
    exit 0
  fi
else
  msg "Couldn't login to OCP cluster"
  exit 1
fi
echo "exiting...."
exit 
