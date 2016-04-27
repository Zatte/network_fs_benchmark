#!/bin/bash

file_path="../files"

mkdir -p $file_path

for file_size in 1 2 8 20 100
do
  for file_num in {1..500}
  do
    dd if=/dev/urandom of="${file_path}/file_${file_size}k_${file_num}" bs=1K count=$file_size
  done
done

for file_size in 1 5 50
do
  for file_num in {1..20}
  do
    dd if=/dev/urandom of="${file_path}/file_${file_size}M_${file_num}" bs=1M count=$file_size
  done
done


for file_size in 100 500
do
  for file_num in {1..10}
  do
    dd if=/dev/urandom of="${file_path}/file_${file_size}M_${file_num}" bs=1M count=$file_size
  done
done

dd if=/dev/urandom of="${file_path}/file_1000M_1" bs=1M count=1000
dd if=/dev/urandom of="${file_path}/file_1000M_2" bs=1M count=1000
