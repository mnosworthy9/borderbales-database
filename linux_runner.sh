for file in /docker-entrypoint-initdb.d/*.pgsql; do
    if [[ -f "$file" ]]; then
        echo "Running $file..."
        psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f "$file"
    fi
done