## week 3 - programming assignment 2

## return a list of functions (sort of 'object methods') to access a
## sort of 'object' containing a matrix & its inverse matrix
makeCacheMatrix <- function(x = matrix()) {

    ## initialize cached inversed matrix
    inverse_matrix <- NULL

    ## setter for the input matrix (also sets cached inverse to null,
    ## because original matrix has changed)
    set <- function(y) {
        x <<- y
        inverse_matrix <<- NULL
    }

    ## getter for the input matrix
    get <- function() x

    ## setter for the inverse
    set_inverse <- function(input_inverse_matrix) inverse_matrix <<- input_inverse_matrix

    ## getter for the inverse
    get_inverse <- function() inverse_matrix

    ## list containing 'methods' for this 'object'
    list(set = set, get = get, set_inverse = set_inverse, get_inverse = get_inverse)
}

## return a matrix that is the inverse of 'x'. return cached inverse
## matrix when available, otherwise calculate it & cache it
cacheSolve <- function(x, ...) {

    ## get inverse from input matrix
    inverse_matrix <- x$get_inverse()

    ## if already calculated, return cached result;
    if (!is.null(inverse_matrix)) {
        message("getting cached data")
        return(inverse_matrix)
    }

    ##  inverse matrix was not available => calculate it & cache it
    object_matrix <- x$get()
    inverse_matrix <- solve(object_matrix, ...)
    x$set_inverse(inverse_matrix)
    inverse_matrix
}
