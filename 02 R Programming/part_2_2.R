complete2<- function(dir,ID=1:332) {
        dir<-getwd()
        names<--numeric()
        x<-numeric()
        listfiles<-list.files(path=dir,pattern = ".csv")
        for (i in ID) {
                table<-read.csv(listfiles[i])
                newtable<-na.omit(table)
                d<-dim(newtable)
                names<-c(names,i)
                x<-c(x,d[1])
        }
        com<-data.frame(x=names,y=x)
        colnames(com)<-c("id","nobs")
        com
        
}
