#!/bin/bash
SH_ROOT=./sh
SSH_ROOT=./.ssh
SPEC_ROOT=./serverspec/spec

aws ec2 describe-instances --filters Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].PublicDnsName" --output text > ${SH_ROOT}/hosts

while read line; do
  cat ${SSH_ROOT}/template | sed s/server_name/${line}/ >> ${SSH_ROOT}/config
  cp -R ${SPEC_ROOT}/template ${SPEC_ROOT}/$line
done < ${SH_ROOT}/hosts

cp -R ${SSH_ROOT} ~/
