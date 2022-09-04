setwd("C:\\Users\\tsuim\\Documents\\R\\JHU Data Course\\Module 4 Exploratory Data Analysis\\Week 1")

# Read data
power_consumption <- read.table("household_power_consumption.txt", header = T, sep = ";" )

# Convert date and time from string to date/time class, convert columns from char to numeric
power_consumption$Date <- as.Date(power_consumption$Date,"%d/%m/%Y")
power_consumption$Global_active_power <- as.numeric(power_consumption$Global_active_power)
#power_consumption$Time <- strptime(power_consumption$Time, format = "%H:%M:%S")

# Filter selected dates 
select_power_consumption <- subset(power_consumption, power_consumption$Date=="2007-02-01" | power_consumption$Date=="2007-02-02")
select_power_consumption$dateTime <- as.POSIXct(as.character(paste(select_power_consumption$Date, select_power_consumption$Time), format="%d/%m/%Y %H:%M:%S"))
select_power_consumption <- select_power_consumption[,3:10]

# Remove incomplete data
select_power_consumption <- select_power_consumption[complete.cases(select_power_consumption),]

# Combine date and time columns
#date_time <- paste(select_power_consumption$Date, select_power_consumption$Time)

plot(select_power_consumption$dateTime, select_power_consumption$Global_active_power, type="l", xlab="",ylab = "Global Active Power (kilowatts)")
