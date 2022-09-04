setwd("C:\\Users\\tsuim\\Documents\\R\\JHU Data Course\\Module 4 Exploratory Data Analysis\\Week 1")

# Read data
power_consumption <- read.table("household_power_consumption.txt", header = T, sep = ";" )

# Convert date and time from string to date/time class, convert columns from char to numeric
power_consumption$Date <- as.Date(power_consumption$Date,"%d/%m/%Y")
power_consumption$Global_active_power <- as.numeric(power_consumption$Global_active_power)

# Filter selected dates 
select_power_consumption <- subset(power_consumption, power_consumption$Date=="2007-02-01" | power_consumption$Date=="2007-02-02")

# Combine date and time
select_power_consumption$dateTime <- as.POSIXct(as.character(paste(select_power_consumption$Date, select_power_consumption$Time), format="%d/%m/%Y %H:%M:%S"))
select_power_consumption <- select_power_consumption[,3:10]

# Remove incomplete data
select_power_consumption <- select_power_consumption[complete.cases(select_power_consumption),]

# Plot first data series 
plot(select_power_consumption$dateTime, select_power_consumption$Sub_metering_1, type="l", col="black", xlab="",ylab = "Energy sub metering")

# Add second and third data series to the same chart 
lines(select_power_consumption$dateTime, select_power_consumption$Sub_metering_2, col="red")
lines(select_power_consumption$dateTime, select_power_consumption$Sub_metering_3, col="blue")

# Add a legend to the top right corner of the chart 
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=c(1,2,3), cex=0.8, xjust = 1)

       