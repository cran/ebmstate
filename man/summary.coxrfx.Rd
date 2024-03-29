% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CoxRFX.R
\name{summary.coxrfx}
\alias{summary.coxrfx}
\title{A summary method for CoxRFX models}
\usage{
\method{summary}{coxrfx}(object, ...)
}
\arguments{
\item{object}{A \code{coxrfx} object 
(obtained by running the function \code{CoxRFX}).}

\item{...}{Further arguments passed to or from other methods.}
}
\value{
Returns an invisible NULL object.
}
\description{
This function prints the point estimates of parameters and 
hyperparameters contained in a \code{coxrfx} object.
}
\details{
Prints two data frames, one with hyperparameter estimates and 
another with regression coefficient estimates.
}
\author{
Rui Costa
}
