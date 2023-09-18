#!/usr/bin/env bash

output_file="ocp-certs.json"

function get_certs () {
  json='{"results":[]}'

  # Use https://access.redhat.com/solutions/3930291 to get cluster certs
  oc get secrets -A -o go-template='{{range .items}}{{if eq .type "kubernetes.io/tls"}}{{.metadata.namespace}}{{" "}}{{.metadata.name}}{{" "}}{{index .data "tls.crt"}}{{"\n"}}{{end}}{{end}}' | while read namespace name cert
  do
    # check cert expiry date
    certdate=`echo $cert | base64 -d | openssl x509 -noout -enddate|cut -d= -f2`
    epochcertdate=$(date -d "$certdate" +"%s")
    currentdate=$(date +%s)
    if ((epochcertdate > currentdate)); then
      datediff=$((epochcertdate-currentdate))
      state="OK"
    else
      state="EXPIRED"
      datediff=$((currentdate-epochcertdate))
    fi
    days=$((datediff/86400))
    certdate=`echo $cert | base64 -d | openssl x509 -noout -enddate| cut -d= -f2`

    # Write results out to JSON, so it's easier to parse
    #
    # with jq we can create our JSON output like so:
    json="$(jq --arg state "$state" \
      --arg days "$days" \
      --arg name "$name" \
      --arg namespace "$namespace" \
      --arg certdate "$certdate" '.results += [$ARGS.named]' <<< "$json")"

    echo $json > "$output_file"
  done
}

function cleanup_tmp_files () {
  if [ -f "$output_file" ]
  then
    rm -rf "$output_file"
  fi
}

function main () {
  get_certs
  # cleanup_tmp_files
}

main