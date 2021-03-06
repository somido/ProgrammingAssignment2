## These functions are used to cache the inverse of a matrix.

##  makeCacheMatrix creates an object that stores a matrix and caches its inverse.

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setinv <- function(inverse) inv <<- inverse
	getinv <- function() inv
	list(set = set, get = get, 
		setinv = setinv,
		getinv = getinv)
}


## cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above. It first checks if the inverse has already been calculated. If so, the cacheSolve retrieves the inverse from the cache. If not, it computes the inverse of the data and sets the value of inverse in the cache via the setinv function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinv()
        if(!is.null(inv)) {
        	message("getting cached data")
        	return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv
}
