eksperyment1 <- function(n, k) {
  #powt�rz losowanie dla n os�b k razy
  los <- sapply(1:k, function(x) jestPoprawne(losujPrezenty(1:n)))
 
  length(which(los))/k
}