#' Create a tmatrix
#'
#' A tmatrix is a matrix with class tmatrix.
#' Specify elements in row-major order, with the first row terminated by NULL.
#'
#' @param ... elements to include (with NULL terminating the first row)
#' @param terse if FALSE, create a matrix (not tmatrix)
#' @return tmatrix (or matrix) with elements and shape as specified in ...
#' @export
#' @examples
#' tmatrix(1,2,NULL,
#'         3,4)
tmatrix <- function(..., terse = TRUE) {
    l <- list(...)
    ncol <- which(sapply(l, is.null)) - 1
    l[[ncol+1]] <- NULL
    m <- matrix(as.numeric(l), ncol = ncol, byrow=TRUE)
    if (terse) attr(m, "class") <- "tmatrix"
    m
}

as.tmatrix <- function(mat) {
   structure(mat, class = "tmatrix")
}

as.matrix.tmatrix <- function(mat) {
  if (length(oldClass(mat)) == 1) unclass(mat)
  else structure(mat, class = setdiff(oldClass(mat, "tmatrix")))
}



