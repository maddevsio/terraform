#!/bin/bash

yum install -y parted

if [ -b /dev/xvdcz ]; then
  parted /dev/xvdcz mklabel gpt --script
  parted /dev/xvdcz mkpart primary 0% 100% --script
  mkfs.ext4 /dev/xvdcz1
  mkdir /var/lib/docker
  mount /dev/xvdcz1 -orw,noatime,nodiratime /var/lib/docker
fi

yum install -y ecs-init
echo 'DOCKER_STORAGE_OPTIONS="--storage-driver overlay2"' > /etc/sysconfig/docker-storage
service docker start

cat > /etc/ecs/ecs.config << EOF
ECS_CLUSTER=${cluster_name}
ECS_DATADIR=/data
ECS_LOGLEVEL=info
ECS_LOGFILE=/log/ecs-agent.log
ECS_ENABLE_TASK_IAM_ROLE=true
ECS_ENABLE_TASK_IAM_ROLE_NETWORK_HOST=true
ECS_AVAILABLE_LOGGING_DRIVERS=["json-file","awslogs"]
EOF

start ecs
