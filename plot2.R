        #reads data afrom "household_power_consumption.txt" in the working directory
        data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings ="?")
        
        #converts Date to date format and subsets only the dates we are interested into
        data$Date <- as.Date(data$Date, "%d/%m/%Y")
        data <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
        
        #converts the time to a date/time variable
        data$Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
        
        #plots the canvas, sets the y label
        plot(data$Time, data$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
        lines(data$Time, data$Global_active_power)
        
        #saves the graphic generated in the screen to a file named "plot1.png" in the working directory
        dev.copy(png, file = "plot2.png", width=480, height=480)
        dev.off()