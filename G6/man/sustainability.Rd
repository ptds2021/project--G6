% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sustainability.R
\name{sustainability}
\alias{sustainability}
\title{Sustainability Plot}
\usage{
sustainability(countries_select)
}
\arguments{
\item{countries_select}{Country/ies selected by the user.}
}
\value{
A bar plot displaying the consumed biocapacity
}
\description{
The function returns a bar plot showing the difference per year between the biocapacity (in gha) per capita and the ecological footprint of production (in gha) per capita. Each bar shows then a sustainability value which can be positive or negative. If the value is positive, this means that a country for one year is sustainable (i.e. it has more biocapacity than what it actually uses).
}
\examples{
countries <- list("China","Germany","India")
sustainability(countries)
}
