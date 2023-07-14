FROM postgres

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD Ankit@2002
ENV POSTGRES_DB api

COPY dump.sql /docker-entrypoint-initdb.d

EXPOSE 5432