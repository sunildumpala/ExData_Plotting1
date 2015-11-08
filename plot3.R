plot3 <- function(datadir, fundir) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the data files
  ##
  
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
  plot(dat_take1$DateTime, dat_take1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
  lines(dat_take1$DateTime, dat_take1$Sub_metering_2, col = "red")
  lines(dat_take1$DateTime, dat_take1$Sub_metering_3, col = "blue")
  dev.copy(png, file="plot3.png")
  dev.off()
  
  setwd(old.dir)
}