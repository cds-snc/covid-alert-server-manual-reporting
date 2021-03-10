import json
import numpy as np
import pandas as pd
from datetime import date

def getdf(filename):
  fp = open(filename,'r')
  raw = fp.read()
  unparsed_json = json.loads(raw)['Items']
  # { "c": { "S": "val" } }
  # normalize the object {"a": { "b": "c" } } => { "a.b": "c" }
  df = pd.json_normalize(unparsed_json)

  return df

df = getdf('./all.json')

count = "count"
regions = "regions"
appos = "os"

original_count_name = "metricCount.N"
original_region_name = "region.S"
original_appos_name = "appos.S"

# rename columns
df = df.rename(columns={
    original_count_name: count,
    original_region_name: regions,
    original_appos_name: appos,
    "identifier.S": "identifier",
    "appversion.S": "appversion",
    "osversion.S": "osversion",
    "manufacturer.S": "manufacturer",
    "androidreleaseversion.S": "androidreleaseversion",
    "osversion.N": "osversion",
    "date.S": "date",
    "version.N": "version"})

# Convert data types
df[count] = df[count].astype(int)
df['date'] = pd.to_datetime(df['date'], format="%Y-%m-%d")
# Filter out data we don't want
today = date.today()
df = df.query("date < @today")

df["version"] = df["version"].astype(int)
df = df.query("version >= 3")

# Delete Unneeded Columns
del df["version"]
del df["state.S"]
del df["frameworkenabled.S"]
del df["count.S"]
del df["hoursSinceExposureDetectedAt.S"]
del df["pushnotification.S"]
del df["sk.S"]
del df["duration.S"]
del df["pk.S"]
print(df.head())

df = df[df.identifier.str.contains("active-user")]
print(df.head())
compression_opts = dict(method='zip',
                        archive_name='out.csv')
df.to_csv('out.zip', index=False,
          compression=compression_opts)
