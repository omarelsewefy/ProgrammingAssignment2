#Example File to Run Functions

x <- rbind(c(-1,3,-1),c(0,-6,5),c(-5,-3,1))
x
cx <- makeCacheMatrix(x)
cx
cx$get()
cacheSolve(cx)
cacheSolve(cx)
