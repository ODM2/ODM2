import yaml

multiTimeSeriesLongHeaderStream = file('iUTAH_MultiTimeSeriesExample_LongHeader.yaml', 'r')
multiTImeSeriesLongHeaderObject = yaml.load(multiTimeSeriesLongHeaderStream)

multiTimeSeriesCompactHeaderStream = file('iUTAH_MultiTimeSeriesExample_CompactHeader.yaml', 'r')
multiTimeSeriesCompactHeaderObject = yaml.load(multiTimeSeriesCompactHeaderStream)

multiTimeSeriesCompactHeaderNestedTableStream = file('iUTAH_MultiTimeSeriesExample_CompactHeader_NestedTable.yaml', 'r')
multiTimeSeriesCompactHeaderNestedTableObject = yaml.load(multiTimeSeriesCompactHeaderNestedTableStream)

specimenTimeSeriesStream = file('iUTAH_SpecimenTimeSeriesExample_CompactHeader.yaml', 'r')
specimenTimeSeriesObject = yaml.load(specimenTimeSeriesStream)

print yaml.dump(specimenTimeSeriesObject)