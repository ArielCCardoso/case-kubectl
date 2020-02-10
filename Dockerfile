FROM alpine

LABEL BaseImage="alpine"                                   \
      Author="Ariel C. Cardoso <arielccardoso@live.com>"

USER root

ENV KUBECTL_VERSION=v1.14.8

RUN apk add --no-cache --update curl ca-certificates bash openssl openssl-dev openssh-client

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    --output /bin/kubectl && chmod 755 /bin/kubectl

RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash -

COPY entrypoint /entrypoint

RUN chmod 755 /entrypoint

ENTRYPOINT ["/entrypoint"]