#!/bin/bash

while true; do
    date '+%Y-%m-%d %H:%M:%S'
    echo "Проверка состояния ноды..."
    NODE_STATE=$(docker exec shardeum-dashboard /bin/bash -c "operator-cli status" | grep "state:" | awk '{print $2}')
    if [[ $NODE_STATE == "stopped" ]]; then
        echo "Нода выключена, перезапускаю"
        docker exec shardeum-dashboard /bin/bash -c "operator-cli start"
        sleep 60
    else
        echo "Нода воркает."
        sleep 600
    fi
done
