#!/usr/bin/env bash

cd "${APP_ROOT}/${APP}" || exit "${APP_START_ERR}"
if [[ ! -d "${APP_LOG}/${APP}" ]];then
  mkdir -p "${APP_LOG}/${APP}"
fi

# 传递sandwich需要的环境变量 数据库名称
nohup "${APP_ROOT}/${APP}/traefik" \
  --configFile="${APP_ROOT}/${APP}/traefik.toml" \
>> "${APP_LOG}/${APP}/${APP}.log" 2>&1 &

result=$?
if [[ $result != 0 ]];then
  exit "${APP_START_ERR}"
else
  exit 0
fi