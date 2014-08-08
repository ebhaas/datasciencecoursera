#
# Exploritory Data Analysis
# Programming Assignement 1
#
# plot2.R
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

# save off plot 2 as .png file

png(file="plot2.png")

main.str <- ""
xlab.str <- ""
ylab.str <- "Global Active Power (kilowatts)"

plot(x<-data2.df$Time, y<-data2.df$Global_active_power, main=main.str, xlab=xlab.str, ylab=ylab.str, pch=".", type="l")

dev.off()
