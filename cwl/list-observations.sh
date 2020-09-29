#!/bin/bash

for i in $(seq 1 3); do
  date > $i.obs
done
