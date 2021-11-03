#!/bin/bash
v="block"
echo $v $(date "+%Y-%m-%d %H:%M:%S").$((`date "+%N"`/1000000))
dfx canister --network ic call main block_func
echo $v $(date "+%Y-%m-%d %H:%M:%S").$((`date "+%N"`/1000000))
dfx canister --network ic call main getVal
