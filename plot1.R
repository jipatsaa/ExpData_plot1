source("downloadFromURLAndUnzip.R")
source("readCSV.R")

downloadFromURLAndUnzip("https://d396qusza40orc.cloudfront.net","data","exdata_data_household_power_consumption.zip")
data<-readCSV("./data","household_power_consumption.txt",";",FALSE)
#denbora emanez gero date horiek Date datu motara pasatu beharko lirateke

numberObs<-nrows(data)
namesData<-names(data)

if((numberObs!=2075259)|names!=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")){
  stop("Number of obs or features not correct. Check the data file")
}
else{dataSet<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
     #fork Peng's repository 
     # go to  https://github.com/rdpeng/ExData_Plotting1
     # and on the right upside corner click on fork
     
     #ez dut ulertzen zergaitik ez dabilen transform
     # transform(dataSet,Global_active_power=as.numeric(dataSet$Global_active_power))
     
     aux<-as.numeric(dataSet$Global_active_power)
     dataSet$Global_active_power<-aux
     rm(aux)
     hist(dataSet$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
     
     #falta da frekuentzien eskala aldatzea
}