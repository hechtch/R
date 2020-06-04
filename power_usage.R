library(ggplot2)
library(reshape)

# If you can't load the CSV files, the following is likely your issue. Uncomment and run the 'getwd()' see if it is set to the directory with './data' in it.
# getwd()
setwd('./R')

###############
# Power Usage #
###############

# preprocessing of the data: remove the first two columns (Account number and another reference number) before using.
powerusage <- read.csv('./data/dominion_06042020_history_kwh.csv', header=FALSE)
colnames(powerusage) <- c("Date","T0030","T0100","T0130","T0200","T0230","T0300","T0330","T0400","T0430","T0500","T0530","T0600","T0630","T0700","T0730","T0800","T0830","T0900","T0930","T1000","T1030","T1100","T1130","T1200","T1230","T1300","T1330","T1400","T1430","T1500","T1530","T1600","T1630","T1700","T1730","T1800","T1830","T1900","T1930","T2000","T2030","T2100","T2130","T2200","T2230","T2300","T2330","T2400")

acusage <- read.table('./data/AC_stats.txt', header=FALSE)
colnames(acusage) <- c("Date", "Temperature", "Mode")
acusage

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

# See https://www.ncdc.noaa.gov/cdo-web/faq#orderingSection for ordering historical weather data from NOAA.

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

# rbind tmax, tmin, tavg (similar to original data but only temps, no precip)
# reverse tmin so that we go around clockwise all the points for the polygon fill
temps <- rbind(tmax, tmin[seq(dim(tmin)[1],1),])

temps

# Not exactly what I expected, but it seems good enough for now.
ggplot(data=temps, aes(x=Date, y=value, group=variable, color=variable, shape=variable)) + 
  geom_line() + 
  geom_point() + geom_polygon(aes(fill = value, group = Date), fill="blue")


install.packages("tidyverse")
library("tidyverse")
#rlang_update()

#output data as R code to rebuild that data
#dput(tmin)









# See http://earlh.com/blog/2009/07/28/filled-line-plots-graphs-in-r-part-10-in-a-series/
# tmax$Date does seem to reduce to an integer here.
xx <- c(tmax$Date, rev(tmax$Date))
yy <- c(tmax$value, rev(tmin$value))
polygon(x = c(1, 1, 2, 2),                           # X-Coordinates of polygon
        y = c(40, 60, 55, 55),                             # Y-Coordinates of polygon
        col = "blue")




longIADWeather










###################################### JUNK 
range(tmin$Date)

tmin$Date
#polygon(x = c('2020-04-27', '2020-04-27', '2020-04-28', '2020-04-28'), y = c(41, 59, 39, 53), col="blue")

#polygon(t(tmax)[3,], t(tmin)[3,], col="blue")
polygon(t(tmax)[3,], t(tmin)[3,], col="blue")
ttmax <- t(tmax)
ttmin <- t(tmin)
is.data.frame(ttmin)
is.data.frame(tmin)



c(tmin$Date)
c(tmin$value)

c(tmin$Date, tmin$value)
?c()

polygon(c(tmin$Date, tmin$value), c(tmax$Date, tmax$value), col="blue")

t(tmax)[3,]

tmax
?t()
ttmax <- t(tmax)
?rev()
?dnorm()

x <- seq(-3,3,0.01)
y1 <- dnorm(x,0,1)
y2 <- 0.5*dnorm(x,0,1)
plot(x,y1,type="l",bty="L",xlab="X",ylab="dnorm(X)")
points(x,y2,type="l",col="red")
polygon(c(x,rev(x)),c(y2,rev(y1)),col="skyblue")

?c()
