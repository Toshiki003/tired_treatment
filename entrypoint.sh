#!/bin/sh
set -e

bin/rails db:migrate

rm -f temp/pids/server.pid && bin/rails s
