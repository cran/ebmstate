% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{coxrfx_object_sample}
\alias{coxrfx_object_sample}
\title{Example of an empirical Bayes model fit}
\format{
An object of class 
\code{c(coxrfx,coxph.penal,coxph)}, which is 
essentially a coxph object with a few 
extra fields [the inputs $groups, $Z,
and $surv, and the hyperparameters 
$sigma2 (variances) and $mu (means)].
}
\usage{
coxrfx_object_sample
}
\description{
An RData object containing the model fit 
obtained by running \code{CoxRFX} on the
data set \code{mstate_data_sample} (included 
in the present package).
}
\seealso{
\code{\link{mstate_data_sample}}; 
\code{\link{CoxRFX}}.
}
\keyword{datasets}
