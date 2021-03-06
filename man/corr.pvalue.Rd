% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main_functions.R
\name{corr.pvalue}
\alias{corr.pvalue}
\title{Pearson correlation, p-value and t-statistic associated with the regression between response y and a covariate x}
\usage{
corr.pvalue(
  x,
  y,
  delta,
  method = "pearson",
  alternative = "two.sided",
  ttest.pvalue = FALSE,
  regression.type
)
}
\arguments{
\item{x}{(n by 1) matrix corresponding to a covariate vector where n is the sample size.}

\item{y}{(n by 1) a matrix corresponding to the response variable. If \code{regression.type} is "cox",
\code{y} contains the observed event times.}

\item{delta}{(n by 1) a matrix that denotes censoring when \code{regression.type} is "cox" (1 denotes
survival event is observed, 0 denotes the survival event is censored). Can be NULL.}

\item{method}{character indicating the type of correlation to compute. Default if "pearson"}

\item{alternative}{character indicating whether the p-value is computed using one-sided or two-sided
testing. Default is "two-sided".}

\item{ttest.pvalue}{logical indicator. If TRUE, p-value for each covariate is computed from univariate
linear/cox regression of the response on each covariate. If FALSE, the
p-value is computed from correlation coefficients between the response and each covariate.
Default is FALSE.}

\item{regression.type}{a character indicator that is either "linear" for linear regression
or "cox" for Cox proportional hazards regression. Default is "linear".}
}
\value{
\itemize{
  \item \strong{p.value:}{p-value of the coefficient of x in the regression of y on x.}
  \item \strong{estimate:}{Pearson correlation between x and y.}
  \item \strong{t.stat:}{t-statistic with testing the significance of x in the regression
  of y on x.}
}
}
\description{
Pearson correlation, p-value and t-statistic associated with the regression between response y and a covariate x
}
\examples{
x = matrix(rnorm(100, 0, 1),100,1)
colnames(x) <- paste0("X",1:ncol(x))
y = matrix(2*x[,1]+ rnorm(100, 0, 1), 100)
colnames(y) <- "y"
delta <- NULL

output <- corr.pvalue(x,y,delta,regression.type="linear")

}
