## This code is to calculate the matrix inverse and cache it to avoid recalculation

## this function store the matrix(x) and it's inverse in a list

makeCacheMatrix <- function(x = matrix()) {
        inv<-NULL
        set<-function(new) {
                x<<-new()
                inv<<-NULL
        }
        get<-function() x
        setinverse<-function(inverse) {inv<<-inverse}
        getinverse<- function() {inv}
        list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## calculate the matrix inverse
cacheSolve <- function(x, ...) {
        inv<-x$getinverse()
        if(!is.null(inv)) {
                message("it is already calculate, getting it from cache data")
                ## Return a matrix that is the inverse of 'x'
                return(inv)
        }
        matrix<-x$get()
        inv<-solve(matrix)
        x$setinverse(inv)
        ## Return a matrix that is the inverse of 'x'
        return(inv)
}
