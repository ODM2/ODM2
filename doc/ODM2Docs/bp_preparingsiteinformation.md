ODM2 Best Practices: Preparing Site Information
===============================================

### Assigning SiteCodes ###
A SiteCode is a short, unique text identifier for a site, where a site is defined as a single record in the Sites table. Both its uniqueness and its conciseness lend towards performing queries on the data, as opposed to using the longer name for the site.

Example:
```
I have a site named “USGS NWIS Stream Gage at the Colorado River at Austin”. This site has a SiteCode of “08158000”.
```
### Make SiteCodes Unique within an ODM2 Database ###
Each site (e.g., a stream gage) is assigned a SiteCode that must be unique within your ODM2 database. SiteCode is used by various tools to locate a specific site within ODM2, so that’s why it must be unique.

Example:
```
I operate a water quality observations network, that I’ll call UTdata. Within this network, I have two sensors on the Colorado River at different locations. I would NOT give both of these sites a SiteCode of “UTSite”. Instead, I might call one “UTSite1” and the other “UTSite2”.

Typically, each instance of an ODM2 database represents a single observation network. It’s OK for sites in different ODM2 databases to have the same SiteCode. These sites are differentiated by the observations network to which they belong.
```
Example:
```
I have a database of USGS NWIS sites. The SiteCode for a stream gage in Austin is "08158000." I also have my own water quality sensor that I have installed next to the USGS sensor, to which I had previously assigned a SiteCode of “UTSite1”. As a reminder that my sensor is at the same location as the USGS sensor, I give my sensor a SiteCode of “08158000”. This is ok, because the USGS site and my own site are in different observations networks, and in different ODM2 databases.

Note that in this example, I could also just as easily have stuck with “UTSite1” for this site. The choice about which SiteCodes you assign is up to you, just so long as they are unique within your ODM2 database.
```
### Make SiteCodes Concise ###
When you query for these data, you might be typing in queries by hand. Typing in very long SiteCodes can be tedious, so keeping them brief is recommended.

**Important:** For your SiteCodes, try to avoid using special characters that might be used by other applications to parse text, or that might be altered or removed by web applications. Example of characters to avoid include commas, tildes, semicolons, plus signs, spaces, and colons.

Example:
```
“Colorado River, Texas: River Mile 41” is not a very good SiteCode because it is long and has some special characters in it. A better SiteCode is “CoRiver41”.
```