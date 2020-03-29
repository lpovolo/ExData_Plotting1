data <- read.table("household_power_consumption.txt", header = TRUE, sep= ";")

data$Date_Time<-paste(data$Date, data$Time)

data$Date_Time<-strptime(data$Date_Time, "%d/%m/%Y %H:%M:%S")

first_day<-which(data$Date_Time==strptime("2007-02-01", "%Y-%m-%d"))

last_day <- which(data$Date_Time==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S")) #If I don't include the time I'll get only the first of that day

data_filter <- data[first_day:last_day, ]

png('plot4.png')

par(mfcol=c(2,2))

plot(data_filter$Date_Time, as.numeric(as.character(data_filter$Global_active_power)),type='l',ylab="Global Active Power", xlab="")

plot(data_filter$Date_Time, as.numeric(as.character(data_filter$Sub_metering_1)),type='l', xlab="",ylab ="Energy sub metering")
lines(data_filter$Date_Time, as.numeric(as.character(data_filter$Sub_metering_2)),type='l', col='red')
lines(data_filter$Date_Time, data_filter$Sub_metering_3,type='l', col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))

plot(data_filter$Date_Time, as.numeric(as.character(data_filter$Voltage)),type='l', 
     ylab="Voltage",xlab="Date_Time" )

plot(data_filter$Date_Time, as.numeric(as.character(data_filter$Global_reactive_power)),type='l', 
     ylab="Global_reactive_power",xlab="Date_Time" )

dev.off()

