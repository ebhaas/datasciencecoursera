## Put comments here that give an overall description of what your
## functions do

##
## In this Programming Assignment we will take advantage of the scoping rules of
## the R language and how they can be manipulated to preserve state inside of an
## R object.  Below are two functions that are used to create a special object
## that stores a numeric matrix and cache's its inverse.
##


## Write a short comment describing this function

## The first function, makeCacheMatrix creates a special "matrix",
## which is really a list containing functions to 
##   1. set the value of the matrix
##   2. get the value of the matrix
##   3.	set the value of the inverse
##   4.	get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  
  ## Return a list of functions representing the creation
  ## of a special "matrix"
  
  inv <- NULL
  
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  get <- function() x
  
  setinverse <- function(inverse) inv <<- inverse
  
  getinverse <- function() inv
  
  list(set = set, 
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

## The following function calculates the inverse of the special "matrix" created
## with the above function. However, it first checks to see if the inverse has
## already been calculated. If so, it gets the inverse from the cache and skips
## the computation. Otherwise, it calculates the inverse of the matrix and sets
## the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  
  inv <- x$getinverse()
  
  if(!is.null(inv)) {
    message("getting cached inverse")
    return(inv)
  }
  
  mat <- x$get()
  inv <- solve(mat, ...)
  
  x$setinverse(inv)
  inv
}
