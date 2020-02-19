#state = v2


rankhospitalforall <- function(state, outcome,num="best",i) {
        
        ## Return hospital name in that state with the given rank 
        ## 30-day death rate
        
       ## w<-subset(read,read$State==state)
        i <- i+1
        w<-w[order(w[,s]),]
        if(num=="worst")  w<-w[which.max(w[,s]),]
        if((num=="best") | ( num=="worst")) num<-1
        v1[i] <- as.vector(w$Hospital.Name[num])
        ## print(v[num])
        ## write.csv(w,"C:/Users/Mehdi/Desktop/Desktop/Data Science/Working Directory/Assignments/Programming Assignment 3/rprog_data_ProgAssignment3-data/My Data.csv")
}
