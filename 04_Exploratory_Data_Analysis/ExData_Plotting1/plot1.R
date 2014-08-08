#
# Exploritory Data Analysis
# Programming Assignement 1
#
# plot1.R
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

# save off plot 1 as .png file

png(file="plot1.png")

main.str <- "Global Active Power"
xlab.str <- "Global Active Power (kilowatts)"
ylab.str <- "Frequency"
colr.str <- "red"

hist(data2.df$Global_active_power, col=colr.str, main=main.str, xlab=xlab.str, ylab=ylab.str)

dev.off()
