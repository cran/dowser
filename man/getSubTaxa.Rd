% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TreeFunctions.R
\name{getSubTaxa}
\alias{getSubTaxa}
\title{Get the tip labels as part of a clade defined by an internal node}
\usage{
getSubTaxa(node, tree)
}
\arguments{
\item{node}{node number that defines the target clade}

\item{tree}{\code{phylo} object}
}
\value{
A vector containing tip labels of the clade
}
\description{
\code{getSubTaxa} Gets the tip labels from a clade
}
\examples{
# Get taxa from all subtrees
data(BiopsyTrees)
tree <- BiopsyTrees$trees[[8]]
all_subtrees <- lapply(1:length(tree$nodes), function(x)getSubTaxa(x, tree))

}
