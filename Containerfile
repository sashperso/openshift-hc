# Based on https://github.com/redhat-cop/containers-quickstarts/blob/master/utilities/ubi8-asciidoctor/Dockerfile
FROM registry.access.redhat.com/ubi8:latest

LABEL MAINTAINERS="Red Hat Services"
ENV OCP_API_URL https://example.com:6443
ENV OCP_TOKEN example
ARG RUBY_VERSION=3.1
USER root

RUN dnf -y module enable ruby:${RUBY_VERSION} \
    && dnf -y module install ruby:${RUBY_VERSION}

RUN dnf update -y \
    && dnf install -y \
    python3 \
    jq \
    git \
    python3-pip \
    && gem install --no-document \
    "asciidoctor" \
    "asciidoctor-pdf" \
    && rm -rf /usr/local/share/gems/cache \
    && dnf clean all \
    && rm -rf /var/lib/dnf \
    && python3 -m pip install --upgrade pip

WORKDIR /home

VOLUME /home/output
VOLUME /home/settings
COPY ./requirements.txt /home
RUN pip3 install --no-cache-dir -r requirements.txt

COPY ./oc /usr/bin/
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

ENTRYPOINT ["sh", "-c", "oc login --token=$OCP_TOKEN --server=$OCP_API_URL --insecure-skip-tls-verify && ansible-playbook -e output_dir='/home/output' generate-report.yml"]