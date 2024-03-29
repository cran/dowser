% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TreeFunctions.R
\name{buildRAxML}
\alias{buildRAxML}
\title{Wrapper to build RAxML-ng trees and infer intermediate nodes}
\usage{
buildRAxML(
  clone,
  seq = "sequence",
  exec,
  model = "GTR",
  partition = NULL,
  rseed = 28,
  name = "run",
  starting_tree = NULL,
  from_getTrees = FALSE,
  rm_files = TRUE,
  asr = TRUE,
  rep = 1,
  dir = NULL,
  ...
)
}
\arguments{
\item{clone}{list of \code{airrClone} objects}

\item{seq}{the phylo_seq option does this clone uses. Possible options are "sequence", "hlsequence", or "lsequence"}

\item{exec}{RAxML-ng executable}

\item{model}{The DNA model to be used. GTR is the default.}

\item{partition}{A parameter that determines how branches are reported when partitioning. Options include NULL (default), 
scaled, unlinked, and linked}

\item{rseed}{The random seed used for the parsimony inferences. This allows you to reproduce your results.}

\item{name}{specifies the name of the output file}

\item{starting_tree}{specifies a user starting tree file name and path in Newick format}

\item{from_getTrees}{A logical that indicates if the desired starting tree is from getTrees and not a newick file}

\item{rm_files}{remove temporary files?}

\item{asr}{computes the marginal ancestral states of a tree}

\item{rep}{Which repetition of the tree building is currently being run. Mainly for getBootstraps.}

\item{dir}{Where the output files are to be made.}

\item{...}{Additional arguments (not currently used)}
}
\value{
\code{phylo} object created by RAxML-ng with nodes attribute
         containing reconstructed sequences.
}
\description{
Wrapper to build RAxML-ng trees and infer intermediate nodes
}
