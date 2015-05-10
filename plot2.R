packs <- installed.packages()
packages <- packs[,1]
if (!is.element("sqldf",packages)) 
  install.packages("sqldf")

library(sqldf)

df <- read.csv.sql("household_power_consumption.txt",
               sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
               sep = ";")

df <- cbind(strptime(asdate,"%d/%m/%Y %H:%M:%S"), df)
names(df)[1] <- "DateTime"

png(filename = "plot2.png")
plot(df$DateTime, df$Global_active_power, type = "l", ylab = "Global Active Power (kilowats)", xlab = "")
dev.off()

