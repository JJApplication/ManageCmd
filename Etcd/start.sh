#!/usr/bin/env bash
cd "${APP_ROOT}/${APP}" || exit "${APP_START_ERR}"
if [[ ! -d "${APP_LOG}/${APP}" ]];then
  mkdir -p "${APP_LOG}/${APP}"
fi

nohup "${APP_ROOT}/${APP}/etcd" --name=etcd0 --listen-client-urls=http://localhost:2379 >> "${APP_LOG}/${APP}/${APP}.log" 2>&1 &
result=$?
if [[ $result != 0 ]];then
  exit "${APP_START_ERR}"
else
  exit 0
fi