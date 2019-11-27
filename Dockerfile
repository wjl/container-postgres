# Start with the official image.
FROM docker.io/library/postgres:12-alpine

# Copy in backup script.
COPY run-backup /usr/local/bin/

# Define backup volume.
VOLUME /var/lib/postgresql/backup

# Add a health check.
HEALTHCHECK --interval=30m CMD \
	psql -U postgres -l
