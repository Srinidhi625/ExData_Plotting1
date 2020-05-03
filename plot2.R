data <- read.table('household_power_consumption.txt', header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)),  na = "?")
subset <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
newdata <- data[subset, ]
attach(newdata)
x <- paste(Date,Time)
newdata$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newdata) <- 1:nrow(newdata)
dim(newdata)
attach(newdata)

png(filename = "plot2.png", width = 480, height = 480,units = "px",)
plot(DateTime,Global_active_power, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
