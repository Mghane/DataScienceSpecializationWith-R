rankall <- function(outcome=character ,num = "best") { 
        ##final version
        ## Return a data frame with the hospital names and the ## (abbreviated) state name
        ##rm(list=ls())
        s<-NULL
        ##outcome<-"heart attack"
        ##num<-20
        if(outcome=="heart attack") {s<-11}
        if(outcome=="heart failure") {s<-17}
        if(outcome=="pneumonia") {s<-23}
        ## Check that state and outcome are valid
        if (is.null(s)==TRUE) {stop("Invalid Outcome")}
        ## Read outcome data
        w<-read.csv("outcome-of-care-measures.csv",na.strings = "Not Available")
        w[,s]<-as.numeric(w[,s])
        ##remove the NAs
        w<-w[!is.na(w[,s]),]
        ##sort the data
        if(!num=="worst")  { w<-w[order(w$State, w[,s],w$Hospital.Name),] }
        if(num=="worst")  { w<-w[order(w$State,-w[,s],w$Hospital.Name),] }
        ##extract data into a data.frame
        if((num=="best") | ( num=="worst")) num<-1
        v2<-as.vector(unique(w$State))
        v1<-as.vector(tapply(as.character(w$Hospital.Name),w$State,function(x) x[num]))
        df <- data.frame(v1,v2)
        names(df)<-c("Name of Hospital","State")
        print(df)
       write.csv(w,"C:/Users/Mehdi/Desktop/Desktop/Data Science/Working Directory/Assignments/Programming Assignment 3/rprog_data_ProgAssignment3-data/My Data.csv")
}

