% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/herpSpecies.R
\name{herpSpecies}
\alias{herpSpecies}
\title{Retrieve Reptile Species and Taxonomic Information from TRD}
\usage{
herpSpecies(url,
                   dataList = NULL, 
                   taxonomicInfo=FALSE, 
                   fullHigher=FALSE, 
                   getLink=FALSE,
                   cores = max(1, parallel::detectCores() - 1),
                   checkpoint = NULL,
                   backup_file = NULL
                   )
}
\arguments{
\item{url}{Character string. A search URL generated via an advanced search on the TRD website or with \code{\link{herpAdvancedSearch}}.}

\item{dataList}{Optional. A data frame with columns \code{species} and \code{url}, used to extract taxonomic information from previously sampled species links.}

\item{taxonomicInfo}{Logical. If \code{TRUE}, returns taxonomic information for each species, including order, suborder, family, genus, author, and year. Default is \code{FALSE}.}

\item{fullHigher}{Logical. If \code{TRUE}, includes the full higher taxonomic hierarchy as reported by TRD (e.g., including subfamilies). Requires \code{taxonomicInfo = TRUE}. Default is \code{FALSE}.}

\item{getLink}{Logical. If \code{TRUE}, includes the TRD URL for each species (useful for follow-up functions like \code{\link{herpSynonyms}}). Default is \code{FALSE}.}

\item{cores}{Integer. Number of CPU cores to use for parallel processing. Default is one less than the number of available cores.}

\item{checkpoint}{Optional. Integer specifying the number of species to process before saving a temporary backup. Backup is only saved if \code{cores = 1}. If set to \code{1}, saves progress after each species (safest but slowest).}

\item{backup_file}{Optional. Character string specifying the path to an \code{.rds} file for saving intermediate results when \code{checkpoint} is set. Must end in \code{.rds}.}
}
\value{
If \code{taxonomicInfo = FALSE} (default), returns a character vector of species names.

If \code{taxonomicInfo = TRUE}, returns a data frame with columns:
\code{order}, \code{suborder} (if available), \code{family}, \code{genus}, \code{species}, \code{author}, and \code{year}.

If \code{fullHigher = TRUE}, includes an additional column with the full higher taxa classification.

If \code{getLink = TRUE}, includes a column with the URL for each species’ page on TRD.
}
\description{
Retrieves a list of reptile species from The Reptile Database (TRD) based on a search URL, and optionally returns detailed taxonomic information for each species.
This function can also save progress to disk during sampling and extract species-specific URLs for further use.
}
\note{
If \code{checkpoint} is used, progress will only be saved when \code{cores = 1}. This prevents potential write conflicts in parallel mode.
}
\examples{
\donttest{
boa <- herpSpecies(herpAdvancedSearch(genus = "Boa"),
                                      taxonomicInfo = TRUE, 
                                      cores = 2)
}

}
\seealso{
\code{\link{herpAdvancedSearch}}, \code{\link{herpSynonyms}}, \code{\link{herpSearch}}
}
