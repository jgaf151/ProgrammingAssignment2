## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
     inv<-NULL
     set<-function(y){
          x<<-y
          inv<<-NULL
     }
     get<-function()x
     setinv<-function(solve) inv<<-solve
     getinv<-function()inv
     list(set=set,get=get,setinv=setinv,getinv=getinv)
     }


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
     ## Return a matrix that is the inverse of 'x'
     inv<-x$getinv()
     if(!is.null(inv)) {
          message("getting cached data")
          return(inv)
     }
     data<-x$get()
     inv<-solve(data,...)
     x$setinv(inv)
     inv
}


#example for input
makeCacheMatrix(a_matrix)
a_matrix$get()
a_matrix$getInverse()
cacheSolve(a_matrix2)

my_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))
my_matrix$get()
my_matrix$getinv()
cacheSolve(my_matrix)
test_matrix <- matrix(c(3:10, 10), 3, 3)
test_matrix2<-makeCacheMatrix(test_matrix)
cacheSolve(test_matrix2)
