#!/usr/bin/python

import os

dirs = os.scandir('/sys/class/hwmon')

hwmon = {}

for i in dirs:
	sensors = []

	for j in os.scandir(i.path):
		if not j.is_file():
			continue

		sensor = {
			"type": "unknown",
			"path": i.path
		}

		if j.startswith("in"): # напряжение
			sensor.type = "in"

		if j.startswith("fan"

	f = open(i.path + "/name")
	hwmon[f.read().lstrip().rstrip()] = {
		"path": i.path,
		"sensors": sensors
	}
	f.close()

print(hwmon)
