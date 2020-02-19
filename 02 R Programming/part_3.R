corr<-function(dir,threshold=0) {
        dir<-getwd()
        cr<-numeric()
        listfiles<-list.files(path=dir,pattern = ".csv")
        source('C:/Users/Mehdi/Desktop/Desctop/Data Science/Quizzes and Assignments/2nd Assignment/part_2_2.R')
        data<-complete2(dir,1:332)
        newdata<-subset.data.frame(data,data$nobs>=threshold)
        for(i in 1:nrow(newdata)) {
                table<-read.csv(listfiles[newdata[i,1]]) 
                newtable<-na.omit(table)
                cr<-c(cr,cor(newtable$sulfate,newtable$nitrate,method = "pearson"))
        }      
        cr
        
}