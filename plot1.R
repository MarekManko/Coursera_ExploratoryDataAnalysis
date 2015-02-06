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
hist(Proc.Data$Global_reactive_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red"
     )

# Export to .png file
dev.copy(png, file=paste(strDir,"plot1.png", sep=""), height=480, width=480)
dev.off()
