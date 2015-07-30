#!/bin/bash

cd /var/local/meTypesetTests/tests/testOutput
for dir in *; do
	python ../regex.py ${dir}
done 
cd ..

