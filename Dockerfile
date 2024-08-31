FROM postgres:latest

# Define build arguments (optional but recommended for clarity)
ARG DB_USER
ARG DB_PASS
ARG DB_NAME
ARG DB_PORT

# Set environment variables for PostgreSQL configuration, using the build arguments
ENV POSTGRES_DB=$DB_NAME
ENV POSTGRES_USER=$DB_USER
ENV POSTGRES_PASSWORD=$DB_PASS
ENV POSTGRES_PORT=$DB_PORT

# Expose the PostgreSQL default port
EXPOSE 5432

COPY ./sql/ /docker-entrypoint-initdb.d/