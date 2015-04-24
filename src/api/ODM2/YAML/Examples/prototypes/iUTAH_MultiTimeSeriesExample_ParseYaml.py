import yaml

longHeaderStream = file('iUTAH_MultiTimeSeriesExample_LongHeader.yaml', 'r')
longHeaderObject = yaml.load(longHeaderStream)

compactHeaderStream = file('iUTAH_MultiTimeSeriesExample_CompactHeader.yaml', 'r')
compactHeaderObject = yaml.load(compactHeaderStream)

print yaml.dump(compactHeaderObject)