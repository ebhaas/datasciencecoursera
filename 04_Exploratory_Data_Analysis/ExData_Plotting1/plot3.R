#
# Exploritory Data Analysis
# Programming Assignement 1
#
# plot3.R
#


# Loading the data

data.fn <- "household_power_consumption.txt"

data.df <- read.table(file=data.fn, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
dim(data.df)


# convert the Date and Time variables to Date/Time classes using
# the strptime() and as.Date() functions.

data.df$Time <- strptime(paste(data.df$Date, data.df$Time), format="%d/%m/%Y %H:%M:%S")
data.df$Date <- as.Date(data.df$Date, format="%d/%m/%Y")


# We will only be using data from the dates 2007-02-01 and 2007-02-02.

data2.df <- data.df[ data.df$Date==as.Date("2007-02-01") | data.df$Date==as.Date("2007-02-02") , ]
dim(data2.df)


# Making Plots

# save off plot 3 as .png file

png(file="plot3.png")

main.str <- ""
xlab.str <- ""
ylab.str <- "Energy sub metering"

plot(x<-data2.df$Time, y<-data2.df$Sub_metering_1, main=main.str, xlab=xlab.str, ylab=ylab.str, pch=".", type="l")
points(x<-data2.df$Time, y<-data2.df$Sub_metering_2, col="red", pch=".", type="l")
points(x<-data2.df$Time, y<-data2.df$Sub_metering_3, col="blue", pch=".", type="l")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), pch=".", lty=1)

dev.off()
