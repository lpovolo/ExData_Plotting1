data <- read.table("household_power_consumption.txt", header = TRUE, sep= ";")

data$Date_Time<-paste(data$Date, data$Time)

data$Date_Time<-strptime(data$Date_Time, "%d/%m/%Y %H:%M:%S")

first_day<-which(data$Date_Time==strptime("2007-02-01", "%Y-%m-%d"))

last_day <- which(data$Date_Time==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S")) #If I don't include the time I'll get only the first of that day

data_filter <- data[first_day:last_day, ]

png('plot1.png')

plot(data_filter$Date_Time, as.numeric(as.character(data_filter$Global_active_power)),
     type='l',ylab="Global Active Power (Kilowatts)", xlab="")

dev.off()
