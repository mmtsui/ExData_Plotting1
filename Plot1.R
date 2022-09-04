# Download zipped file and extract
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "C:\\Users\\tsuim\\Documents\\R\\JHU Data Course\\Module 4 Exploratory Data Analysis\\Week 1\\dataset.zip")
unzip_this <- "C:\\Users\\tsuim\\Documents\\R\\JHU Data Course\\Module 4 Exploratory Data Analysis\\Week 1\\dataset.zip"
unzip(unzip_this, exdir = "C:\\Users\\tsuim\\Documents\\R\\JHU Data Course\\Module 4 Exploratory Data Analysis\\Week 1")

setwd("C:\\Users\\tsuim\\Documents\\R\\JHU Data Course\\Module 4 Exploratory Data Analysis\\Week 1")

# Read data
power_consumption <- read.table("household_power_consumption.txt", header = T, sep = ";" )

# Convert date and time from string to date/time class, convert columns from char to numeric
power_consumption$Date <- as.Date(power_consumption$Date,"%d/%m/%Y")
power_consumption$Global_active_power <- as.numeric(power_consumption$Global_active_power)

# Create new df based on selected dates 
select_power_consumption <- subset(power_consumption, power_consumption$Date=="2007-02-01" | power_consumption$Date=="2007-02-02")

# Plot frequency of global active power
hist(select_power_consumption$Global_active_power, col="red", frame=F, breaks=11, xlab="Global Active Power (kilowatts)",main="Global Active Power", ylim=c(0, 1200) )
