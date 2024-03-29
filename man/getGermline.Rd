% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Germlines.R
\name{getGermline}
\alias{getGermline}
\title{\link{getGermline} get germline segment from specified receptor and segment}
\usage{
getGermline(
  receptor,
  references,
  segment,
  field,
  germ_start,
  germ_end,
  germ_length,
  germ_aa_start,
  germ_aa_length,
  amino_acid = FALSE
)
}
\arguments{
\item{receptor}{row from AIRR-table containing sequence of interest}

\item{references}{list of reference segments. Must be specific to
locus and segment}

\item{segment}{Gene segment to search. Must be V, D, or J.}

\item{field}{Column name for segment gene call (e.g. v_call)}

\item{germ_start}{Column name of index of segment start within germline 
segment (e.g. v_germline_start)}

\item{germ_end}{Similar to germ_start, but specifies end of segment 
(e.g. v_germline_end)}

\item{germ_length}{Similar to germ_start, but specifies length of segment
(e.g. v_germline_end)}

\item{germ_aa_start}{Column name of index of segment start within germline 
segment in AA (if amino_acid=TRUE, e.g. v_germline_start)}

\item{germ_aa_length}{Similar to germ_start, but specifies length of segment
in AA (if amino_acid=TRUE, e.g. v_germline_end)}

\item{amino_acid}{Perform reconstruction on amino acid sequence (experimental)}
}
\value{
String of germline sequence from specified segment aligned with the 
sequence in the seq column of \code{receptor}.
}
\description{
\link{getGermline} get germline segment from specified receptor and segment
}
