#!/usr/bin/bash

sensors | grep "edge" | grep -E -o "\+[0-9]+" | head -n1
