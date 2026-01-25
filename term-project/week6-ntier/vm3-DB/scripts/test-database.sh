#!/bin/bash
# scripts/test-database.sh
# Test Database Health (VM3)

DB_HOST="localhost"
DB_PORT="5432"
DB_NAME="taskboard_db"
DB_USERUSER="taskboard"
DB_PASSWORD="taskboard123"

echo "=== VM3: Database Test ==="

export PGPASSWORD="$DB_PASSWORD"

# Test connection
psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -c "\dt" >/dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "✓ Database connection OK"
else
    echo "✗ Database connection FAILED"
    exit 1
fi

# Test query
echo ""
echo "Tables:"
psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -c "\dt"

echo ""
echo "Task count:"
psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -c "SELECT COUNT(*) FROM tasks;"
