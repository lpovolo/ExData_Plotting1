data <- read.table("household_power_consumption.txt", header = TRUE, sep= ";")

data$Date_Time<-paste(data$Date, data$Time)

data$Date_Time<-strptime(data$Date_Time, "%d/%m/%Y %H:%M:%S")

first_day<-which(data$Date_Time==strptime("2007-02-01", "%Y-%m-%d"))

last_day <- which(data$Date_Time==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S")) #If I don't include the time I'll get only the first of that day

data_filter <- data[first_day:last_day, ]

png(file="~/plot1.png",
    width=480, height=480)

hist(as.numeric(as.character(data_filter$Global_active_power)), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()