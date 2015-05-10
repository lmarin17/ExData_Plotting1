packs <- installed.packages()
packages <- packs[,1]
if (!is.element("sqldf",packages)) 
  install.packages("sqldf")


library(sqldf)

df <- read.csv.sql("household_power_consumption.txt",
               sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
               sep = ";")

png(filename = "plot1.png")
hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

