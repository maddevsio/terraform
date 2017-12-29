FROM debian:stretch

LABEL maintainer="Andrew S. <halfb00t@gmail.com>"

RUN set -ex; \
    apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    locales \
    wget gnupg \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && apt-get update -qq \
    && apt-get install -qqy pgbouncer \
    && apt-get clean autoclean && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

COPY pgbouncer.ini userlist.txt /etc/pgbouncer/

EXPOSE 5432
CMD ["pgbouncer", "-u", "postgres", "/etc/pgbouncer/pgbouncer.ini"]
