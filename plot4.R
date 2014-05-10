        #reads data afrom "household_power_consumption.txt" in the working directory
        data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings ="?")
        
        #converts Date to date format and subsets only the dates we are interested into
        data$Date <- as.Date(data$Date, "%d/%m/%Y")
        data <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
        
        #converts the time to a date/time variable
        data$Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
        
        #Create the plot
        png(filename = "plot4.png", width = 480, height = 480, units = "px")
        
        par(mfrow = c(2, 2))
        
                #plot1
                hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
                
                #plot2 (Voltage)
                plot(data$Time, data$Voltage, type = "n", ylab = "Voltage", xlab = "")
                lines(data$Time, data$Voltage)        
                
                #plot3
                plot(data$Time, data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "datetime")
                lines(data$Time, data$Sub_metering_1)
                lines(data$Time, data$Sub_metering_2, col = "red")
                lines(data$Time, data$Sub_metering_3, col = "blue")
                #plots the legend to plot3
                legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = c(2,2,2),
                col = c("black", "red", "blue"))
        
                #plot4
                plot(data$Time, data$Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab = "datetime")
                lines(data$Time, data$Global_reactive_power) 
               
        #saves the file
        dev.off()