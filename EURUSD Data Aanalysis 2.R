n <- 261
p <- 100
beta <- -4:95
X <- matrix(rnorm(n * p), nrow=n)
colnames(X) <- paste0("beta_", beta)
Y <- X %*% beta + rnorm(n)
ls.model <- lm(Y ~ 0 + X)
m <- data.frame(ls.est = coef(ls.model))
rownames(m) <- paste0("$\\beta_{", 1:p, "}$")
knitr::kable(m)

suppressWarnings(library(CVXR, warn.conflicts=FALSE))
betaHat <- Variable(p)
objective <- Minimize(sum((Y - X %*% betaHat)^2))
problem <- Problem(objective)
result <- solve(problem)
m <- cbind(coef(ls.model), result$getValue(betaHat))
colnames(m) <- c("lm est.", "CVXR est.")
rownames(m) <- paste0("$\\beta_{", 1:p, "}$")
knitr::kable(m)

problem <- Problem(objective, constraints = list(betaHat >= 0))
problem <- Problem(objective, constraints = list(betaHat >= 0))
result <- solve(problem)
m <- data.frame(CVXR.est = result$getValue(betaHat))
rownames(m) <- paste0("$\\beta_{", 1:p, "}$")
knitr::kable(m)

if (requireNamespace("nnls", quietly = TRUE)) {
    nnls.fit <- nnls::nnls(X, Y)$x
} else {
    nnls.fit <- rep(NA, p)
}
m <- cbind(result$getValue(betaHat), nnls.fit)
colnames(m) <- c("CVXR est.", "nnls est.")
rownames(m) <- paste0("$\\beta_{", 1:p, "}$")
knitr::kable(m)
