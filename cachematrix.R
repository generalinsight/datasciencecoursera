## Programming assignment 2 from R Programming

## these two functions together help in caching inverse of a matrix.
## matrix inversion is computationally intensive. Therefore, avoiding recomputation is helpful.

## to facilitate this caching, we start by creating this function makeCacheMatrix.
## any matrix can be input into this function


## usage example:
## x <- matrix(1:4, nrow = 2, ncol = 2)
## m <- makeCacheMatrix(x)



makeCacheMatrix <- function(x = matrix()) {

	# following assignment example, we achieve this in 4 steps

	# 1. set the matrix
	# 2. get the matrix
	# 3. set the inverse of the matrix
	# 4. get the inverse of the matrix

	# Initially setting to null, changes as user sets value

	inv <- NULL

	# set function for the matrix (not the inverse)

	set <- function(y) {
		x <<- y
		inv <<- NULL
	}		
	
	# get function for the matrix ( & not the inverse)

	get <- function() x
	
	# set inverse manually

	setinverse <- function(inverse) inv <<- inverse

	# get inverse

	getinverse <- function() inv

	# compile into a list

	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## cacheSolve to compute the inverse and cache the result matrix. 
## from next iteration, this avoid recomputation & produces from cache 

## usage example:
## x <- matrix(1:4, nrow = 2, ncol = 2)
## m <- makeCacheMatrix(x)
## s <- cacheSolve(m)
## print(s)
##
## s to return:
##	[,1] [,2]
## [1,]	-2   1.5
## [2,]	1   -0.5
##
## s2 <- cacheSolve(m)
## print(s2)
##
## s2 to return:
##	[,1] [,2]
## [1,]	-2   1.5
## [2,]	1   -0.5



cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	# following same format with assignment example

	#get current state of inverse
	# see if it has been computed yet
	
	inv <- x$getinverse()

	# if it has been computed, then

	if(!is.null(inv)) {
	# return computed inverse
	
	message("Getting cached matrix")
	return(inv)

	}

	# if it has not been computed, then 
	#get the matrix, compute the inverse, cache the result

	data <- x$get()
	inv <- solve(data,...)
	x$setinverse(inv)

	#return result
	
	inv

}
