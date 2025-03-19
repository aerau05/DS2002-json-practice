#!/usr/bin/env python3

import requests
import json

url = "https://aviationweather.gov/api/data/metar?ids=KMCI&format=json&taf=false&hours=12&bbox=40%2C-90%2C45%2C-85"
response = requests.get(url)
data = response.json()

receipt_times = [entry["receiptTime"] for entry in data[:6]]
for time in receipt_times:
    print(time)

temperatures = [entry.get("temp", None) for entry in data if "temp" in entry]
temperatures = [t for t in temperatures if t is not None]

if temperatures:
    avg_temp = sum(temperatures) / len(temperatures)
    print("Average Temperature):", avg_temp)
else:
    print("No temperature data available.")

cloudy_count = sum(1 for entry in data if entry.get("cloud", "CLR") != "CLR")
total_entries = len(data)

more_than_half_cloudy = cloudy_count > total_entries / 2
print("Mostly cloudy:", more_than_half_cloudy)
