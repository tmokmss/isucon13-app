#!/bin/bash -ex

# ビルド済みのGoバイナリをサーバー群に配布する

BINARY='isupipe'
SERVICE='isupipe-go'
TARGETS=(isu1 isu2 isu3)

deploy(){
  ssh -t $1 "sudo systemctl stop $SERVICE"
  scp ./$BINARY $1:/home/isucon/webapp/go/
  ssh -t $1 "sudo systemctl start $SERVICE"
}

GOOS=linux GOARCH=amd64 go build -o $BINARY
for t in ${TARGETS[@]}
do
  deploy $t &
done

wait

for t in ${TARGETS[@]}
do
ssh -t $t "cd isucon11-infra && make reset-log" &
done

for t in ${TARGETS[@]}
do
ssh -t $t "journalctl -q -u $SERVICE | tail -5"
done

echo "finish deploy"
