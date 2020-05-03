data <- read.table('household_power_consumption.txt', header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)),  na = "?")
subset <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
newdata <- data[subset, ]
  
x <- paste(data$Date,data$Time)
newdata$data$Datedata$Time <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newdata) <- 1:nrow(newdata)
png(filename = "plot1.png",  width = 480, height = 480, units = "px", bg = "white")
hist(newdata$Global_active_power, col = "red", ylim = c(0, 1200), main = 'Global Active Power', xlab = 'Global Active power(kilowatt)')
title(ylab = 'Frequency')
dev.off()
    