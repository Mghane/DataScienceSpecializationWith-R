best <- function(state, outcome) {
        ## final version
        ## Read outcome data
       if(outcome=="heart attack") {s<-11}
       if(outcome=="heart failure") {s<-17}
        if(outcome=="pneumonia") {s<-23}
        
         ##st(outcome)
        read<-read.csv("outcome-of-care-measures.csv",na.strings = "Not Available")
        ##v<-as.vector()
        w<-subset(read,read$State==state)
        w[,s]<-as.numeric(w[,s])
        w<-w[order(w[,s]),]
        v<-as.vector(w$Hospital.Name)
        print(v[1:5])
        
        ##sub<-subset.data.frame(read,read[,])
        
        ## Check that state and outcome are valid
        ## Return hospital name in that state with lowest 30-day death ## rate
}
