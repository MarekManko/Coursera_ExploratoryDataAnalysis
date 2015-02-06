# Inital setting
# Set parent directory
strDir <- "E:\\Marek\\Studia\\Coursera\\Exploratory Data Analysis\\W1\\"

# Import whole dataset, extract what is needed
Imp.Data <- read.csv(paste(strDir,"household_power_consumption.txt",sep=""), header=T, sep=';', na.strings="?", 
            nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
Imp.Data$Date <- as.Date(Imp.Data$Date, format ="%d/%m/%Y")

# Extract required data, remove the rest
Proc.Data <- subset(Imp.Data, Date >= '2007-02-01' & Date <= '2007-02-02'); rm(Imp.Data)
Proc.Data$DateTime <- as.POSIXct(paste(as.Date(Proc.Data$Date), Proc.Data$Time))

# Plotting
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
# 1
plot(x=Proc.Data$DateTime, y=Proc.Data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# 2
plot(x=Proc.Data$DateTime, y=Proc.Data$Voltage, type="l", xlab="", ylab="Voltage (volt)")
# 3
plot(x = Proc.Data$DateTime, y = Proc.Data$Sub_metering_1, type = "l", xlab = "", ylab="Energy sub metering")
lines(x = Proc.Data$DateTime, y = Proc.Data$Sub_metering_2, col = "red")
lines(x = Proc.Data$DateTime, y = Proc.Data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=0.75, cex=0.35,
       bty="n", col = c("black", "red", "blue")) 
# 4
plot(x = Proc.Data$DateTime, y = Proc.Data$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab="Global_reactive_power")


# Export to .png file
dev.copy(png, file=paste(strDir,"plot4.png", sep=""), height=480, width=480)
dev.off()
