#Example File to Run Functions
source('makeCacheMatrix.R')
source('cacheSolve.R')
x <- rbind(c(-1,3,-1),c(0,-6,5),c(-5,-3,1))
Special_Matrix <- makeCacheMatrix(x)
Special_Matrix$get()
cacheSolve(Special_Matrix)
cacheSolve(Special_Matrix)
