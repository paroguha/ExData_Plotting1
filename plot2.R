## Reading and cleaning data
household_power_consumption <- read.csv("C:/Users/paro/Desktop/coursera/EDA/week1/household_power_consumption.txt", header=T, sep=';', na.strings="?")
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")
data <- subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(household_power_consumption)
head(data)
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
