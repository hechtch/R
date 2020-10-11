# R

## Historical Energy usage from Dominion

## Historical weather data from NOAA

https://www.ncdc.noaa.gov/cdo-web/webservices/v2

https://www.ncdc.noaa.gov/

https://www.ncdc.noaa.gov/cdo-web/api/v2/stations/GHCND:USW00093738

Example (curl):
```
curl -H "token:<token>" https://www.ncdc.noaa.gov/cdo-web/api/v2/stations/GHCND:USW00093738
...
{"elevation":88.4,"mindate":"1960-04-01","maxdate":"2020-10-08","latitude":38.9349,"name":"WASHINGTON DULLES INTERNATIONAL AIRPORT, VA US","datacoverage":1,"id":"GHCND:USW00093738","elevationUnit":"METERS","longitude":-77.4473}
```



Fetch data from the GSOM dataset (Global Summary of the Month) for IAD:
```
# Need to use the double-quotes for the URL in curl or you get an error message that you didn't supply startdate
curl -H "token:<token>" "https://www.ncdc.noaa.gov/cdo-web/api/v2/data?datasetid=GSOM&stationid=GHCND:USW00093738&units=standard&startdate=2010-09-01&enddate=2010-09-30"

checht@DESKTOP-C4FGFH5:~/projects/R$ curl -H "token:<token>" "https://www.ncdc.noaa.gov/cdo-web/api/v2/data?datasetid=GSOM&stationid=GHCND:USW00093738&units=standard&startdate=2010-09-01&enddate=2010-09-30"
...
{"metadata":{"resultset":{"offset":1,"count":37,"limit":25}},"results":[{"date":"2010-09-01T00:00:00","datatype":"AWND","station":"GHCND:USW00093738","attributes":",W","value":6.7},{"date":"2010-09-01T00:00:00","datatype":"CDSD","station":"GHCND:USW00093738","attributes":"0","value":1556.0},{"date":"2010-09-01T00:00:00","datatype":"CLDD","station":"GHCND:USW00093738","attributes":",0","value":198.0},{"date":"2010-09-01T00:00:00","datatype":"DP01","station":"GHCND:USW00093738","attributes":",0","value":8},{"date":"2010-09-01T00:00:00","datatype":"DP10","station":"GHCND:USW00093738","attributes":",0","value":5},{"date":"2010-09-01T00:00:00","datatype":"DP1X","station":"GHCND:USW00093738","attributes":",0","value":1},{"date":"2010-09-01T00:00:00","datatype":"DSND","station":"GHCND:USW00093738","attributes":",0","value":0},{"date":"2010-09-01T00:00:00","datatype":"DSNW","station":"GHCND:USW00093738","attributes":",0","value":0},{"date":"2010-09-01T00:00:00","datatype":"DT00","station":"GHCND:USW00093738","attributes":",0","value":0},{"date":"2010-09-01T00:00:00","datatype":"DT32","station":"GHCND:USW00093738","attributes":",0","value":0},{"date":"2010-09-01T00:00:00","datatype":"DX32","station":"GHCND:USW00093738","attributes":",0","value":0},{"date":"2010-09-01T00:00:00","datatype":"DX70","station":"GHCND:USW00093738","attributes":",0","value":29},{"date":"2010-09-01T00:00:00","datatype":"DX90","station":"GHCND:USW00093738","attributes":",0","value":9},{"date":"2010-09-01T00:00:00","datatype":"DYFG","station":"GHCND:USW00093738","value":13},{"date":"2010-09-01T00:00:00","datatype":"DYHF","station":"GHCND:USW00093738","value":1},{"date":"2010-09-01T00:00:00","datatype":"DYNT","station":"GHCND:USW00093738","attributes":",,0","value":20100921},{"date":"2010-09-01T00:00:00","datatype":"DYSD","station":"GHCND:USW00093738","attributes":"+,,0","value":20100930},{"date":"2010-09-01T00:00:00","datatype":"DYSN","station":"GHCND:USW00093738","attributes":"+,,0","value":20100930},{"date":"2010-09-01T00:00:00","datatype":"DYTS","station":"GHCND:USW00093738","value":3},{"date":"2010-09-01T00:00:00","datatype":"DYXP","station":"GHCND:USW00093738","attributes":",,0","value":20100930},{"date":"2010-09-01T00:00:00","datatype":"DYXT","station":"GHCND:USW00093738","attributes":",,0","value":20100924},{"date":"2010-09-01T00:00:00","datatype":"EMNT","station":"GHCND:USW00093738","attributes":",0,21,","value":46.0},{"date":"2010-09-01T00:00:00","datatype":"EMSD","station":"GHCND:USW00093738","attributes":",,0,30,+","value":0.0},{"date":"2010-09-01T00:00:00","datatype":"EMSN","station":"GHCND:USW00093738","attributes":",,0,30,+","value":0.0},{"date":"2010-09-01T00:00:00","datatype":"EMXP","station":"GHCND:USW00093738","attributes":",,0,30,","value":4.74}]}checht@DESKTOP-C4FGFH5:~/projects/R$
...
```