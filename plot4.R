plot4 <- function(datadir, fundir) {
  ## 'datadir' is a character vector of length 1 indicating
  ## the location of the data files
  ## 'fundir' is a character vector of length 1 indicating 
  ## the location of the function (in this case where the file plot3.R is located)
  
  old.dir <- getwd()
  setwd(datadir[1])
  
  dat <- read.table("household_power_consumption.txt", sep=";", header = TRUE )
  setwd(fundir[1])
  dat_take1 <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
  dat_take1$Global_active_power <- as.numeric(as.character(dat_take1$Global_active_power))
  dat_take1["DateTime"] <- NA
  dat_take1$DateTime <- strptime(paste(dat_take1$Date, dat_take1$Time), format = "%d/%m/%Y %H:%M:%S")
  dat_take1$Sub_metering_1 <- as.numeric(as.character(dat_take1$Sub_metering_1))
  dat_take1$Sub_metering_2 <- as.numeric(as.character(dat_take1$Sub_metering_2))
  dat_take1$Sub_metering_3 <- as.numeric(as.character(dat_take1$Sub_metering_3))
  dat_take1$Global_reactive_power <- as.numeric(as.character(dat_take1$Global_reactive_power))
  dat_take1$Voltage <- as.numeric(as.character(dat_take1$Voltage))
  
  par(mfrow = c(2,2), mar=c(4,4,2,2), oma=c(0,3,3,0))
  with(dat_take1, {
    plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    plot(dat_take1$DateTime, dat_take1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
    lines(dat_take1$DateTime, dat_take1$Sub_metering_2, col = "red")
    lines(dat_take1$DateTime, dat_take1$Sub_metering_3, col = "blue")
    plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  })
  
  #plot(dat_take1$DateTime, dat_take1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
  #lines(dat_take1$DateTime, dat_take1$Sub_metering_2, col = "red")
  #lines(dat_take1$DateTime, dat_take1$Sub_metering_3, col = "blue")
  dev.copy(png, file="plot4.png")
  dev.off()
  
  setwd(old.dir)
}