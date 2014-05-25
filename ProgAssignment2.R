function(x = matrix()) {
  
  #This Function sets a new "object" matrix which has four functions defined within. i.e. its simply a list of 4 functions
  # set : set the matrix
  # get: gets the matrix
  # setsolve : solves the matrix (i.e. finds the inverse)
  # getsolve : retrived the solved Matrix (i.e. returns the inverted matrix)
  
  #This Function was created based on the understanding of the makeVector function stated in the programming assignment 2 
  #page, it hold the same basic structure.
  
  
  # Set the Value of the Inverted Cached Matrix to Null
  inverted_Matrix <- NULL
  #Now We have the Function that sets our Matrix
  set <- function(y) {
    x <<- y
    inverted_Matrix <<- NULL
  }
  #This Function returns the value of the Matrix
  get <- function() x
  
  #Now Lets Solve(I.e find the inverse) of the matrix
  setsolve <- function(solve) inverted_Matrix <<- solve
  #Now Lets retrive the value of the inverted Matrix
  getsolve <- function() inverted_Matrix
  #The List Below contains the names of all the functions we created in this object
  # set : set the matrix
  # get: gets the matrix
  # setsolve : solves the matrix (i.e. finds the inverse)
  # getsolve : retrived the solved Matrix (i.e. returns the inverted matrix)
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

cacheSolve <- function(x, ...) {
  #cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
  #If the inverse has already been calculated (and the matrix has not changed), 
  #then the cachesolve should retrieve the inverse from the cache.
  
  #First we try to get the inverted matrix from our special matrix object
  inverted_Matrix <- x$getsolve()
  #Now the following if conditions checks if the returned inverted matrix is NULL or not, if you remember
  # From the makeCacheMatrix.R file we set the inverted_Matrix to Null at the begining and if now solution is assigned to it.
  # It will remain NULL , hence if this matrix wasn't solved before the special matrix will return null
  
  if(!is.null(inverted_Matrix)) {
    message("Found Inverse :D getting cached data ...")
    #Inverted Matrix found :) Returning its value and exiting 
    return(inverted_Matrix)
  }
  #If we reach this part of the function this means that the inverse wasn't calculated before.
  #No Problems first lets get the matrix value
  data <- x$get()
  #Now We Use the solve function to find the inverse of the retrived matrix
  inverted_Matrix <- solve(data, ...)
  #Now lets set the inverted Matrix value in our special Matrix so it would be available for future use
  x$setsolve(inverted_Matrix)
  #Return to user the inverted Matrix Value
  inverted_Matrix
}
