FROM docker:stable-dind
MAINTAINER mhjeffal <mh.jeffal@gmail.com>

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
    ncurses \
    git \
    openssh-client \
  && rm -rf /var/cache/apk/*

RUN pip install docker-compose

ENV DOCKER_DRIVER overlay

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["/bin/sh"]