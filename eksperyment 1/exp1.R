eksperyment1 <- function(n, k) {
  #powtórz losowanie dla n osób k razy
  los <- sapply(1:k, function(x) jestPoprawne(losujPrezenty(1:n)))
 
  length(which(los))/k
}