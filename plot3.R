data <- read.table('household_power_consumption.txt', header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)),  na = "?")
subset <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
newdata <- data[subset, ]
attach(newdata)
x <- paste(Date,Time)
newdata$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newdata) <- 1:nrow(newdata)
dim(newdata)
attach(newdata)

png(filename = "plot3.png",  width = 480, height = 480,units = "px", bg = "white")
plot(DateTime, Sub_metering_1, type = "l",col = "black",xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd = 1)
dev.off()