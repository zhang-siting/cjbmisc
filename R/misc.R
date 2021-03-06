#' Miscellaneous functions
#'
#' A group of functions for miscellaneous usage.
#' \itemize{
#'   \item dist_cos, dist_euc: cosine and Euclidean distance of 2 vectors.\cr
#'   return a single numeric value
#'   \item get_mode, cv: get the mode and coefficient of variations of a vector.\cr
#'   return a single numeric value or multiple values when \emph{multi==TRUE}
#'   \item perm: permutation of 1:n sequence
#'   \item consistSymbol: Force a integer vector to use numbers match best with another vector
#' }
#' @param a,b,x,r numeric vector. r for reference
#' @param v any vector
#' @param n integer
#' @param multi when TRUE, return a vector when multiple outcome are possible; when FALSE, only output the first one of them.
#' @name cjb.misc
NULL
#' @rdname cjb.misc
#' @export
#cosine distance of two vectors
dist_cos <- function(a,b){
  sum(a*b) / ( sqrt(sum(a * a)) * sqrt(sum(b * b)) )
}
#' @rdname cjb.misc
#' @export
# Euclidean distance of 2 vectors
dist_euc <- function(a,b) sqrt(sum((a - b) ^ 2))
#' @rdname cjb.misc
#' @export
#get the mode of a vector
get_mode <- function(v,na.rm=TRUE,multi=FALSE) {
  if(na.rm){
    v = v[!is.na(v)]
  }
  ux <- unique(v)
  if (multi){
    tab <- tabulate(match(v, ux))
    return(ux[tab == max(tab)])
  } else return(ux[which.max(tabulate(match(v, ux)))])
}
#' @rdname cjb.misc
#' @export
# Coefficient of variations
cv <- function(x){
  sd(x)/mean(x)*100
}
#' @rdname cjb.misc
#' @export
# Output permutation of 1:n sequence
perm <- function(n){
  if(n==1){
    return(matrix(1))
  } else {
    sp <- perm(n-1)
    p <- nrow(sp)
    A <- matrix(nrow=n*p,ncol=n)
    for(i in 1:n){
      A[(i-1)*p+1:p,] <- cbind(i,sp+(sp>=i))
    }
    return(A)
  }
}
#' @rdname cjb.misc
#' @export
# Force a to use number symbol more consistent with r
consistSymbol <- function(a,r){#a,r:numeric factor vector;r:ref
  a <- as.factor(a)
  r <- as.factor(r)
  p <- perm(length(levels(r)))
  temp <- apply(p,1,function(x) x[a])
  sum <- apply(temp,2,function(x) sum(x==r))
  return(temp[,which(sum==max(sum))]) # when 2 equal number occur, return both
}

