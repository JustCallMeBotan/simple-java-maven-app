#!/usr/bin/env sh

echo 'was executed.'
set -x
kill $(cat .pidfile)
