makeCacheMatrix <- function(x = matrix()) {
    cached <<- NULL
    set <- function(y){
         x <<- y
         cached <<- NULL
    }
    get <- function(){
        x
    }
    setSolve <- function(solve){
        cached <<- solve
    }
    getSolve <- function(){
        cached
    }
    list(set=set, get=get, setSolve=setSolve, getSolve=getSolve)
}

cacheSolve <- function(x, ...) {
    cached <- x$getSolve()
    if (!is.null(cached)){
        message("Data from cache")
        return(cached)
    }
    data <- x$get()
    solve <- solve(data)
    x$setSolve(solve)
    solve
}
