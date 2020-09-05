library(dplyr) 

dat <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))

data <- filter(dat, Date == "1/2/2007" | Date == "2/2/2007")

rm(dat)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$timetemp <- paste(data$Date, data$Time)
data$Time <- strptime(data$timetemp, format = "%Y-%m-%d %H:%M:%S")

png(file = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

