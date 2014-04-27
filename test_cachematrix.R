source('cachematrix.R')

sample_run <- function() {
 
    my_matrix_object <- makeCacheMatrix(matrix(c(1,2,3,4), nrow = 2))
    print(my_matrix_object$get())
    #      [,1] [,2]
    # [1,]    1    3
    # [2,]    2    4

    print(cacheSolve(my_matrix_object))
    #      [,1] [,2]
    # [1,]   -2  1.5
    # [2,]    1 -0.5

    print(cacheSolve(my_matrix_object))
    # getting cached data
    #      [,1] [,2]
    # [1,]   -2  1.5
    # [2,]    1 -0.5

    ## cache is invalidated when original matrix object changes

    my_matrix_object <- makeCacheMatrix(matrix(c(2,3,4,5), nrow = 2))

    print(cacheSolve(my_matrix_object))
    # [,1] [,2]
    # [1,] -2.5    2
    # [2,]  1.5   -1

    print(cacheSolve(my_matrix_object))
    # getting cached data
    # [,1] [,2]
    # [1,] -2.5    2
    # [2,]  1.5   -1
 
}

sample_run()
