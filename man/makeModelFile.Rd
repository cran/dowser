% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TreeFunctions.R
\name{makeModelFile}
\alias{makeModelFile}
\title{Make a parsimony model file}
\usage{
makeModelFile(file, states, constraints = NULL, exceptions = NULL)
}
\arguments{
\item{file}{model file name to write.}

\item{states}{vector of states to include in model.}

\item{constraints}{constraints to add to model.}

\item{exceptions}{vector of comma-separated states that are 
exceptions to constraints}
}
\value{
Name of model file
}
\description{
\code{makeModelFile} Filler
}
\details{
Currently the only option for \code{constraints} is "irrev", which
forbids switches moving from left to right in the \code{states} vector.
}
\seealso{
\link{readModelFile}, \link{getTrees}, \link{findSwitches}
}
