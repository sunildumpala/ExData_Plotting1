plot1 <- function(datadir, fundir) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the data files
  ##
  
  old.dir <- getwd()
  setwd(datadir[1])
  
  dat <- read.table("household_power_consumption.txt", sep=";", header = TRUE )
  setwd(fundir[1])
  dat_take1 <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
  dat_take1$Global_active_power <- as.numeric(as.character(dat_take1$Global_active_power))
  #with(plot, dat_take1)
  hist(dat_take1$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
  dev.copy(png, file="plot1.png")
  dev.off()
  
  setwd(old.dir)
}