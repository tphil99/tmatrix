`tmatrix` (Terse Matrix Operations) provides functions and operators for writing matrix algebra concisely.

For example:

```
# standard approach
X <- matrix(c(1,2,3,3,2,1), 3)
β <- matrix(c(2,1))
y <- X %*% β + rnorm(3)
β_ <- solve(t(X)%*%X)%*%t(X)%*%y

# tmatrix approach
library(tmatrix)
X <- tmatrix(1,3,NULL,
             2,2,
             3,1)
β <- tmatrix(2,NULL,
             1)
y <- β%%X + rnorm(3) # or y <- X %*% β + rnorm(3)
β_ <- y %% +X %% -(X%%+X) # read from right to left
```

+X is t(X)
-X is solve(X)
-I(X) is -X
y%%X is X%*%y

NB: we do things backwards for two reasons:
- precedence rules mean we can avoid parentheses this way
- transpose and inverse are most conveniently expressed as postfix operators, but R only supports prefix operators. If you read backward, prefix becomes postfix
- in the same way as f(g(h(x))) may be nice to read as x |> h |> g |> f, the matrix multiplication ABCx may be nice to read as xCBA

