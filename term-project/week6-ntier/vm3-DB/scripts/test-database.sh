#!/bin/bash
# Test Database Health

DB_NAME="taskboard_db"

echo "=== VM3: Database Test ==="

psql -d $DB_NAME -c "\dt" >/dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✓ Database connection OK"
else
    echo "✗ Database connection FAILED"
fi

psql -d $DB_NAME -c "SELECT COUNT(*) FROM tasks;" 2>/dev/null
