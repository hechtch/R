library(ggplot2)
library(reshape)

# If you can't load the CSV files, the following is likely your issue. Uncomment and run the 'getwd()' see if it is set to the directory with './data' in it.
# getwd()
setwd('./R')

###############
# Power Usage #
###############

# preprocessing of the data: remove the first two columns ACcount number and another reference number before using.
powerusage <- read.csv('./data/dominion_05072020_history_kw.csv', header=FALSE)
colnames(powerusage) <- c("Date","T0030","T0100","T0130","T0200","T0230","T0300","T0330","T0400","T0430","T0500","T0530","T0600","T0630","T0700","T0730","T0800","T0830","T0900","T0930","T1000","T1030","T1100","T1130","T1200","T1230","T1300","T1330","T1400","T1430","T1500","T1530","T1600","T1630","T1700","T1730","T1800","T1830","T1900","T1930","T2000","T2030","T2100","T2130","T2200","T2230","T2300","T2330","T2400")

# melt to long format for ggplot.
longPowerUsage <- melt(powerusage)

# Plot KW usage over the course of each day 
# group = Date is the Magic??
ggplot(data=longPowerUsage, aes(x=variable, y=value, group=Date, color=Date, shape=Date)) + 
  geom_line() + 
  geom_point() + 
  scale_x_discrete(name="Time") #+ scale_y_discrete(name="Kilowatts")

powerusageSum <- powerusage
powerusageSum$Total <- sum(powerusageSum[3,], na.rm=TRUE)
powerusageSum

###############
# Temperature #
###############

# The data from NOAA was preprocessed as follows:
# 1) sed '%s/\"//g' to get rid of the quotes.
# 2) Removed first two columns STATION and 'WASHINGTON DULLES INTL...'
# There may be a way to do this with the RAW data from NOAA, but this was easier for now.
IAD_Weather <- read.csv('./data/IAD_weather.csv', header=FALSE)
colnames(IAD_Weather) <- c("Date", "PRCP", "SNOW", "SNWD", "TAVG", "TMAX", "TMIN")

# melt to change data from WIDE to LONG for plogging
longIADWeather <- melt(IAD_Weather)

# Extract three separate subset: TMIN, TMAX and TAVG. The strings should all be in the column named 'variable', so use grepl() to match for the subset.
tmax <- subset(longIADWeather, grepl("^TMAX$", longIADWeather$variable))
tmin <- subset(longIADWeather, grepl("^TMIN$", longIADWeather$variable))
tavg <- subset(longIADWeather, grepl("^TAVG$", longIADWeather$variable))

ggplot(data=longIADWeather, aes(x=Date, y=value, group=variable, color=variable, shape=variable)) + 
  geom_line() + 
  geom_point()
