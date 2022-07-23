## The following pair of functions serve the purpose of caching the inverve of matrix in R - part of Programming Assignment 2 Week 3. The purpose of
## caching is to save time from computing matrix which is usually costly if done repeatedly.

## The first function is to create a cache matrix which cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        inv <- null
        set <- function(y) {
                x <<- y
                inv <<- null
                } 
        get <- function() x 
        
        set_inverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## The second function is to compute the inverse of the matrix created by the above function. It will first check if the inverse was already calcucalated,
## it will retrieve the results from the cache if such inverse was already called.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
        if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
        }
        
        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(inv)
        inv
}
