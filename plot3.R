plot3 <- function(datadir, fundir) {
  ## 'datadir' is a character vector of length 1 indicating
  ## the location of the data files
  ## 'fundir' is a character vector of length 1 indicating 
  ## the location of the function (in this case where the file plot3.R is located)
  
  # Store the current working directory
  old.dir <- getwd()
  setwd(datadir[1])
  
  #Read file into table and set the directory to output file
  dat <- read.table("household_power_consumption.txt", sep=";", header = TRUE )
  setwd(fundir[1])
  
  #Filter to the rows required
  dat_take1 <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
  
  #Convert columns to appropriate data types
  dat_take1$Global_active_power <- as.numeric(as.character(dat_take1$Global_active_power))
  
  #Add an additional column for Datetime
  dat_take1["DateTime"] <- NA
  dat_take1$DateTime <- strptime(paste(dat_take1$Date, dat_take1$Time), format = "%d/%m/%Y %H:%M:%S")
  
  #Convert columns to appropriate data types
  dat_take1$Sub_metering_1 <- as.numeric(as.character(dat_take1$Sub_metering_1))
  dat_take1$Sub_metering_2 <- as.numeric(as.character(dat_take1$Sub_metering_2))
  dat_take1$Sub_metering_3 <- as.numeric(as.character(dat_take1$Sub_metering_3))
  
  #Select PNG device
  png(file="plot3.png")
  
  #Plot Graphs
  with(dat_take1, plot(dat_take1$DateTime, dat_take1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering"))
  with(dat_take1, lines(DateTime, Sub_metering_2, col = "red") )
  
  with(dat_take1, lines(DateTime, Sub_metering_3, col = "blue"))
  
  legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  
  #Release Device
  dev.off()
  
  #Set back to the original working directory
  setwd(old.dir)
}