#!/bin/bash

echo $(sensors | grep "Package id 0" | grep -E -o "\+[0-9]+" | head -n1)
