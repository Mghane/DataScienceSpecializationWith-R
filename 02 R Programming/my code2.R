pollutantmean<- function(dir,poll,ID=1:332){
        dir<-getwd()
        #ID<-numeric()
        if (identical(poll,"sulfate")==TRUE) {coln<-2} else {coln<-3}
        Tsum<-0
        count<-0
        listfiles<-list.files(path = dir,pattern = ".csv")
        for(i in ID) {
                T<-read.csv(listfiles[i])
                Tsum<-sum(T[,coln],na.rm=TRUE)+Tsum
                count<-sum(!is.na(T[,coln]))+count
}
mean<-Tsum/count
paste("mean:", mean)     

}


