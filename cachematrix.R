
## define the get fucntion - returns value of the matrix argument
## define the set function to assign new 
## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  makeCacheMatrix <- function(x = matrix()) { 
      x <<- y                           
      inv <<- NULL     
      ## initialize inv as NULL; will hold value of matrix inverse 
    }
    get <- function() x                  
    ## define the get fucntion - returns value of the matrix argument
    setinverse <- function(inverse) inv <<- inverse 
    ## assigns value of inv in parent environment
    getinverse <- function() inv    
    ## gets the value of inv where called
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse) 
  }



## This function computes the inverse of the matrix returned by makeCacheMatrix above.
## If inverse has already been computed given that matrix has not changed,
## cacheSolve will retrieve the inverse from the cache

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