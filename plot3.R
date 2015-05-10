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

png(filename = "plot3.png")

plot(df$DateTime,df$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(df$DateTime,df$Sub_metering_1, type = "l", col = "gray33")
points(df$DateTime,df$Sub_metering_2, type = "l", col = "red")
points(df$DateTime,df$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1,lwd = 2, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("gray33","red","blue"))

dev.off()
