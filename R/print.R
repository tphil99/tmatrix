#' Print a tmatrix
#'
#' Print a tmatrix just like a standard matrix, with a
#' footer reminding you that it is a tmatrix.
#' @param x tmatrix
print.tmatrix <- function(x) {print(unclass(x)); cat("class: tmatrix\n")}
