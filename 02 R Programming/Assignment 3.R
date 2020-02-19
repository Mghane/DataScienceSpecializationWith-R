best <- function(state, outcome) {
        ##Trimming the outcome
        s<<-NULL
        r<-strsplit(outcome," ")
        r<-unlist(r)
        r<-paste(toupper(substring(r,1,1)),tolower(substring(r,2)),sep="")
        noutcome<-paste(r[1],r[2],sep=".")
        ##st(outcome)
        ## Read outcome data
        read<-read.csv("outcome-of-care-measures.csv",na.strings = "Not Available")
        ## Check that state and outcome are valid
        ch<-paste("Hospital.30.Day.Death..Mortality..Rates.from",noutcome,sep=".")
        for (i in 1:ncol(read)) {
             if (identical(ch,names(read)[i])==TRUE)  {
                     s<<-i
             }  
        }
        if (is.null(s)==TRUE) {stop("Invalid Outcome")}
        if (!state %in% unique(read$State)) {stop("Invalid State")}
        ## Return hospital name in that state with lowest 30-day death ## rate
        w<-subset(read,read$State==state)
        w[,s]<-as.numeric(w[,s])
        w<-w[order(w[,s]),]
        v<-as.vector(w$Hospital.Name)
        if (is.null(s)==FALSE) print(v[1:5])
        write.csv(w,"C:/Users/Mehdi/Desktop/Desktop/Data Science/Working Directory/Assignments/Programming Assignment 3/rprog_data_ProgAssignment3-data/My Data.csv")
}
