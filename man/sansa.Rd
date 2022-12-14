% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sansa.R
\name{sansa}
\alias{sansa}
\title{Title}
\usage{
sansa(x, y, lambda = 0, ksel = 3)
}
\arguments{
\item{x}{Input predictor as a dataframe}

\item{y}{Target variable as factor}

\item{lambda}{Lambda parameter to select distribution of synthetic variables}

\item{ksel}{K parameter to choose how many neighbors are used in calculations}
}
\value{
A list with two elements: x contains predictors with synthetic data, y contains target with synthetic data.
}
\description{
Title
}
\examples{

library(sansa)
library(ggplot2)
minority = data.frame(x1 = rnorm(10, 10, 3),
                      x2 = rnorm(10, 25, 10),
                      target = "true")
majority = data.frame(x1 = rnorm(100, 4, 2),
                      x2 = rnorm(100, 30, 10),
                      target = "false")

dataset = rbind(minority, majority)

ggplot(dataset) + geom_point(aes(x1, x2, color = target))
sansaobject = sansa(x = dataset[,1:2], y = dataset$target, lambda = 1, ksel = 3)

balanced <- sansaobject$x
balanced$target = sansaobject$y

ggplot(balanced) + geom_point(aes(x1, x2, color = target))

}
