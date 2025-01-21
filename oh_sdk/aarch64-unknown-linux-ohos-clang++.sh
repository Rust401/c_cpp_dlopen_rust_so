#!/bin/bash
# GEWU-LLM dependency prepare script.
# Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
set -e

exec $ONDK/llvm/bin/clang++ \
  -target aarch64-linux-ohos \
  -L $ONDK/llvm/lib/aarch64-linux-ohos/c++ \
  --sysroot=$ONDK/sysroot \
  -D__MUSL__ \
  -fno-emulated-tls \
  "$@"
