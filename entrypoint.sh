#!/bin/bash
set -e

rm -f /app/tmp/pids/server.pid

bundle exec rails db:create db:migrate db:seed 2>/dev/null || bundle exec rails db:migrate db:seed

exec "$@"
