FROM python:3.6-alpine

MAINTAINER Daniel Kristiyanto <daniel@kensci.com>

# Install Pandas
RUN apk add --no-cache g++ && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h && \
    pip install cython==0.25.2 numpy==1.12.0 && \
    pip install pandas==0.18.1

# Install Superset
ENV SUPERSET_VERSION 0.15.4
RUN apk add --no-cache \
        curl \
        libffi-dev \
        cyrus-sasl-dev \
        mariadb-dev \
        postgresql-dev && \
    pip3 install \
        superset==$SUPERSET_VERSION \
        mysqlclient==1.3.7 \
        ldap3==2.1.1 \
        psycopg2==2.6.1 \
        redis==2.10.5 \
        sqlalchemy-redshift==0.5.0

# Default config
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PATH=$PATH:/home/superset/.bin \
    PYTHONPATH=/home/superset/superset_config.py:$PYTHONPATH

ADD media/logo.png /usr/local/lib/python3.6/site-packages/superset/static/assets/images/superset.png
ADD media/logo2.png /usr/local/lib/python3.6/site-packages/superset/static/assets/images/superset-logo@2x.png
ADD media/logo2.png /usr/local/lib/python3.6/site-packages/superset/static/assets/images/favicon.png
RUN chmod 644 /usr/local/lib/python3.6/site-packages/superset/static/assets/images/favicon.png
RUN chmod 644 /usr/local/lib/python3.6/site-packages/superset/static/assets/images/superset-logo@2x.png

# Run as superset user
WORKDIR /home/superset
COPY superset .
RUN addgroup superset && \
    adduser -h /home/superset -G superset -D superset && \
    chown -R superset:superset /home/superset

USER superset



# Deploy
EXPOSE 8088
HEALTHCHECK CMD ["curl", "-f", "http://localhost:8088/health"]
ENTRYPOINT ["superset"]
CMD ["runserver"]