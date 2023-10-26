# Use the official MySQL 8.0 image as the base image
FROM mysql:8.0

# Set the root password for MySQL
ENV MYSQL_ROOT_PASSWORD=root

# Copy the SQL script to the init directory
COPY ./scripts/schema.sql /docker-entrypoint-initdb.d/1.sql
COPY ./scripts/data.sql /docker-entrypoint-initdb.d/2.sql

# Expose port 3306 for MySQL connections
EXPOSE 3306
