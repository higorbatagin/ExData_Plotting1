        #reads data afrom "household_power_consumption.txt" in the working directory
        data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings ="?")
        
        #converts Date to date format and subsets only the dates we are interested into
        data$Date <- as.Date(data$Date, "%d/%m/%Y")
        data <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
        
        #converts the time to a date/time variable
        data$Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
        
        #Create the plot
        png(filename = "plot3.png", width = 480, height = 480, units = "px")
        
        #plots the canvas, sets the y label
        plot(data$Time, data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
        lines(data$Time, data$Sub_metering_1)
        lines(data$Time, data$Sub_metering_2, col = "red")
        lines(data$Time, data$Sub_metering_3, col = "blue")
        
        #plots the legend
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = c(2,2,2),
               col = c("black", "red", "blue"))
        
        #saves the file
        dev.off()