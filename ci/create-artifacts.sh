#!/usr/bin/env bash
set -euo pipefail

echo "some artifact test" >> out.txt

echo "cat file"
cat out.txt

echo "done"
