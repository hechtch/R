library(ggplot2)
library(reshape)

ls()
powerusage <- read.csv('./data/dominion_05072020_history_kw.csv', header=FALSE)
colnames(powerusage) <- c("Date","T0030","T0100","T0130","T0200","T0230","T0300","T0330","T0400","T0430","T0500","T0530","T0600","T0630","T0700","T0730","T0800","T0830","T0900","T0930","T1000","T1030","T1100","T1130","T1200","T1230","T1300","T1330","T1400","T1430","T1500","T1530","T1600","T1630","T1700","T1730","T1800","T1830","T1900","T1930","T2000","T2030","T2100","T2130","T2200","T2230","T2300","T2330","T2400")

str(powerusage)
summary(powerusage)

ggplot(data=powerusage, aes(x=T0030, y=Date)) + geom_line() + geom_point()


?aes()

# Need:
# Date, Time, KW, KWH
# I think this will plot better. Have to transform.


longPowerUsage <- melt(powerusage)
str(longPowerUsage)
summary(longPowerUsage)

sum(powerusage$T2200)
sum(powerusage$T2300)

#rowSums(powerusage[2,], na.rm=TRUE)

#longPowerUsage2 <- melt(longPowerUsage, id.vars = c("Date", "variable"))
#longPowerUsage2

ggplot(data=longPowerUsage, aes(x=variable, y=value)) + geom_line() + geom_point()
