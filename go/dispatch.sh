#!/bin/bash -ex
# Usage: pass a bash command to execute on each host in parallel

ssh isu1 "cd webapp && $1" &
ssh isu2 "cd webapp && $1" &
ssh isu3 "cd webapp && $1"
wait
