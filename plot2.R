source("downloadFromURLAndUnzip.R")
source("readCSV.R")
source("dev.copy2png.R")

downloadFromURLAndUnzip("https://d396qusza40orc.cloudfront.net","data","exdata_data_household_power_consumption.zip")
data<-readCSV("./data","household_power_consumption.txt",";",FALSE)

#Checking the correctness of the data
numberObs<-nrow(data)
namesData<-names(data)
originalDataNames<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
if((numberObs==2075259) && (namesData==originalDataNames)){

  #converting the data and time from Strings to Date and Time 
  dateTime <- paste(data$Date, data$Time)
  aux<-as.Date(data$Date,"%d/%m/%Y")
  daysShortName<-format(aux,"%a")  #obtain the day short name for each Date #i.e. lun, mar, mie, jue, vie
  data$Date<-aux
  data$dayShortName<-daysShortName
  rm(aux)
  rm(daysShortName)
  
  
  aux<-strptime(dateTime,format="%d/%m/%Y %H:%M:%S")
  time<-data$Time
  data$Time<-aux
  rm(aux) 
  
  #personal comment: Ez dut ulertzen zergaitik ez dabilen transform
  # transform(dataSet,Global_active_power=as.numeric(dataSet$Global_active_power))
  
     dataSet<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")
     
     
     aux<-as.numeric(dataSet$Global_active_power)
     dataSet$Global_active_power<-aux
     rm(aux)
     
     #adapting the margins
     par(mar=c(4,4,3,1))
  
     #shrinking using the cex flag: the labels (cex.lab)
     # the title (cex.main)
     #the axis scales (cex.axis)
     plot(dataSet$Time,dataSet$Global_active_power,ylab="Global Active Power (kilowatts)",xaxt = "n", type = "l",cex.axis=0.75,cex.lab=0.75,xlab="")
     axis.POSIXct(1,dataSet$Time,format="%a")
     dev.copy2png("plot2.png")
     
}else{
  
   stop("Number of obs or features not correct. Check the data file")

}