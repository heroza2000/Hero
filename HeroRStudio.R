
library(ggplot2)
library(xts)
library(ggthemes)
library(CVXR)


load("C:\\Users\\Hero Ozagho\\Desktop\\EURUSD.csv")

executions <- read.csv(file = "EURUSD.csv")
dim(executions)

executions$Date <- as.Date(executions$Date, format = "%m/%d/%Y")



data <- executions[, 2:5]
rownames(data) <- executions[,1]
dim(data)


# Plot column by column
ggplot(data = executions, aes(x = Date)) +
  geom_line(aes(y = Open,  color ="Open")) +
  geom_line(aes(y = High, color = "High")) +
  geom_line(aes(y = Low, color = "Low")) +
  geom_line(aes(y = Close, color = "Close"))+
  geom_line(aes(y = Adj.Close, color = "AdjClose"))



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

betaHat <- Variable(p)
objective <- Minimize(sum((Y - X %*% betaHat)^2))
problem <- Problem(objective)

result <- solve(problem)

m <- cbind(coef(ls.model), result$getValue(betaHat))
colnames(m) <- c("lm est.", "CVXR est.")
rownames(m) <- paste0("$\\beta_{", 1:p, "}$")
knitr::kable(m)

problem <- Problem(objective, constraints = list(betaHat >= 0))
#problem <- Problem(objective, constraints = list(betaHat >= 0))
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






# PCA

pca <- prcomp(executions[, 2:5])
summary(pca)

pca$rotation

(pca)

