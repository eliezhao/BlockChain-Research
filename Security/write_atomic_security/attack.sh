#!/bin/bash
v="attack"
echo $v $(date "+%Y-%m-%d %H:%M:%S").$((`date "+%N"`/1000000))
dfx canister --network ic call main attack_func
echo $v $(date "+%Y-%m-%d %H:%M:%S").$((`date "+%N"`/1000000))
