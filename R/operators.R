#' Unary operator: transpose
#'
#' As a unary operator, +X is the same as t(X), where X is a tmatrix.
#' As a binary operator, X+Y has the standard meaning.
#'
#' @param X tmatrix
#' @param Y tmatrix of same shape
#' @export
#' @examples
#' x <- tmatrix(1,2,NULL,3,4,5,6)
#' +x
#' x+x
`+.tmatrix` <- function(X,Y) {
    if (missing(Y)) {
        t(X)
    } else {
        structure(unclass(X)+unclass(Y), class = oldClass(X))
    }
}

#' Unary operator: matrix inverse
#'
#' As a unary operator, -X is the same as solve(X), where X is a tmatrix.
#' In order to negate a tmatrix, use -I(X).
#' As a binary operator, X-Y has the standard meaning.
#' 
#' @export
#' @examples
#' x <- tmatrix(1,2,NULL,3,4)
#' -x
#' -I(x)
`-.tmatrix` <- function(X,Y) {
    if (missing(Y)) {
        if (oldClass(X)[[1]] == "AsIs") {
           structure(-unclass(X), class = tail(oldClass(X), -1))
        } else {
            structure(solve(X), class = oldClass(X))
        }
    } else {
        structure(unclass(X)-unclass(Y), class = oldClass(X))
    }
}

#' Binary operator: matrix multiplication
#'
#' X %% Y is the same as Y %*% X
#'
#' @param X tmatrix
#' @param Y tmatrix of same shape
#' @export
`%%.tmatrix` <- function(X,Y) {
    structure(unclass(Y)%*%unclass(X), class = oldClass(X))
}

# eg. y%%+X%%-(X%%+X)
