% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/msfit.R
\name{msfit_generic}
\alias{msfit_generic}
\alias{msfit_generic.default}
\alias{msfit_generic.coxrfx}
\title{Compute subject-specific transition hazards.}
\usage{
msfit_generic(object, ...)

\method{msfit_generic}{default}(
  object,
  newdata,
  variance = TRUE,
  vartype = c("aalen", "greenwood"),
  trans,
  ...
)

\method{msfit_generic}{coxrfx}(object, newdata, trans, ...)
}
\arguments{
\item{object}{An object describing the fit of
a multi-state Cox model.}

\item{...}{Further arguments}

\item{newdata}{A data frame in `long format'. See details.}

\item{variance}{A logical value indicating whether the
(co-)variances of the subject-specific transition hazards should be computed.}

\item{vartype}{A character string specifying the type of
variances to be computed (so only needed if variance=TRUE).}

\item{trans}{Transition matrix describing the states and transitions in 
the multi-state model. See \code{trans} in \code{\link[mstate:msprep]{mstate::msprep}}
for more detailed information.}
}
\value{
An 'msfit' object. See \code{\link[mstate:msfit]{mstate::msfit}} for details.
If the S3 method \code{msfit_generic.coxrfx} is called, the 
returned object will be of class \code{c(msfit,coxrfx)}; 
otherwise, it will be of class \code{msfit}.
}
\description{
This function computes subject-specific or overall cumulative transition
hazards for each of the possible transitions in the multi-state model.
This help page is an adaptation of the \code{mstate::msfit} help page.
}
\details{
The purpose of \code{msfit_generic} is to be able to use 
\code{mstate::msfit} on model fit objects of class \code{coxrfx} 
(i.e. objects generated by \code{\link{CoxRFX}}). This can now be done
with \code{msfit_generic.coxrfx}, which introduces minor modifications
to \code{mstate::msfit}. In particular, it precludes \code{msfit} from 
computing the (co-)variances of transition hazard estimators, as this
computation relies on asymptotic results for the fixed effects Cox model
(see de Wreede et al, 2010, section 2.3.2). The method \code{msfit_generic.default}
corresponds to the original \code{mstate::msfit} function. 
The data frame given as \code{newdata} input needs to have one row for each transition
 in the multi-state model, and one column for each covariate.
An additional column strata (numeric) is needed to describe for each transition to
which stratum it belongs. The name has to be \code{strata}, even if in the original
\code{coxph} call another variable was used. See \code{\link{msfit}} for more details.
}
\examples{
# Compute cumulative hazard rates
# under a (pre-estimated) empirical Bayes Cox
# model.

#load simulated data (illness-death model,
#500 patients) and estimated empirical
# Bayes Cox model
data("mstate_data_sample")
data("coxrfx_object_sample")

# Make objects 'surv' and 'Z'
# with the data used in the estimation

#outcome data
surv<-coxrfx_object_sample$surv

#covariate data
Z<-coxrfx_object_sample$Z

# Build a data frame 'patient_data'
# with the covariate values for which 
# cumulative hazards are to be computed
# (patient 1 covariate values in this case).
# 'patient_data' must have one row for each
# transition in the model 
# and the same columns as 'Z'. The assignment
# of transitions to strata (made in the 'strata'
# column) must follow the original model in
# 'coxrfx_object_sample'.

patient_data<-mstate_data_sample[mstate_data_sample$id==1,
   ,drop=FALSE][rep(1,3),]
patient_data$strata<-patient_data$trans<-1:3
patient_data<-mstate::expand.covs(patient_data,
   covs=names(patient_data)[!names(patient_data)\%in\%
   c("id","from","to","trans","Tstart","Tstop","time",
   "to","trans","Tstart","Tstop","time","status",
   "strata")],append=TRUE)

# compute cumulative hazards
msfit_object<-msfit_generic(coxrfx_object_sample,
                            patient_data,
                            coxrfx_object_sample$tmat)

# show estimates
print(msfit_object)
}
\references{
de Wreede LC, Fiocco M, and Putter H (2010). The mstate package for 
estimation and prediction in non- and semi-parametric multi-state and 
competing risks models. \emph{Computer Methods and Programs in Biomedicine} 
\strong{99}, 261–274.
}
\seealso{
\code{\link[mstate:msfit]{mstate::msfit}}; \code{\link[mstate:msprep]{mstate::msprep}}; \code{\link[mstate:plot.msfit]{mstate::plot.msfit}}.
}
\author{
Rui Costa, adapting the work of L. de Wreede,
M. Fiocco and H. Putter in the
\code{\link{mstate}} package.
}
