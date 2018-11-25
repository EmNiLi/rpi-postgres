FROM emnili/rpi-base

Maintainer Guenther Morhart

ENV PGDATA=/data \
    PGPASS=app

RUN apk add --no-cache \
	postgresql \
	postgresql-contrib && \
	mkdir /run/postgresql && \
	chown -R app:app /run/postgresql 
	

EXPOSE 5432

COPY app-init.sh /usr/local/bin/app-init

CMD ["su-exec", "app", "postgres"]
