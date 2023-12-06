# Based on https://github.com/redhat-cop/containers-quickstarts/blob/master/utilities/ubi8-asciidoctor/Dockerfile
FROM registry.access.redhat.com/ubi9:latest

LABEL MAINTAINERS="Red Hat Services"
ENV OCP_API_URL https://example.com:6443
ENV OCP_TOKEN example
USER root

RUN dnf update -y \
    && dnf install -y \
    python3 \
    ruby \
    jq \
    git \
    python3-pip \
    && gem install --no-document \
    "asciidoctor" \
    "asciidoctor-pdf" \
    && rm -rf /usr/local/share/gems/cache \
    && dnf clean all \
    && rm -rf /var/lib/dnf \
    && python3 -m pip install --upgrade pip \
    && BUILDNUMBER=$(curl -s https://mirror.openshift.com/pub/openshift-v4/clients/ocp-dev-preview/latest/release.txt | grep 'Name:' | awk '{print $NF}') \
    && curl -O https://mirror.openshift.com/pub/openshift-v4/clients/ocp-dev-preview/latest/openshift-client-linux-${BUILDNUMBER}.tar.gz \
    && tar zxvf openshift-client-linux-${BUILDNUMBER}.tar.gz -C /usr/bin \
    && rm -f openshift-client-linux-${BUILDNUMBER}.tar.gz /usr/bin/README.md \
    && chmod +x /usr/bin/oc

WORKDIR /home

VOLUME /home/output
VOLUME /home/settings
COPY ./requirements.txt /home
RUN pip3 install --no-cache-dir -r requirements.txt

COPY generate-report.yml /home/
COPY collections /home/collections 
COPY fonts /home/fonts
COPY images /home/images
COPY ocp-manifest /home/ocp-manifest 
COPY roles /home/roles 
COPY styles /home/styles
COPY templates /home/templates

RUN chmod -R g=u /home

USER 1001

ENTRYPOINT ["sh", "-c", "oc login --token=$OCP_TOKEN --server=$OCP_API_URL --insecure-skip-tls-verify && ansible-playbook -e output_dir='/home/output' generate-report.yml -vvv"]