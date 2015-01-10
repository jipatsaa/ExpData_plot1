readCSV <-function(dir,fileName,separator="\t",stringAsFactor = FALSE){
  # PRE: 4 parameters
  # dir: the source directory
  # fileName: the name of the unzip-ed file
  # separator: the separator if not especified \t 
  # stringAsFactor: a flag to decide wether strings should be imported as Factors or as Strings
  # POST: 
  fileAndPath=paste(dir,fileName,sep="/")
  result<-read.csv("../data/household_power_consumption.txt", sep = separator, stringsAsFactors = stringAsFactor)
}