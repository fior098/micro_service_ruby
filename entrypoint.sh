#!/bin/bash
set -e

rm -f /app/tmp/pids/server.pid

bundle exec rails db:create 2>/dev/null || true
bundle exec rails db:migrate

if [ "$(bundle exec rails runner 'puts School.count' 2>/dev/null)" = "0" ]; then
  bundle exec rails db:seed
fi

exec "$@"
