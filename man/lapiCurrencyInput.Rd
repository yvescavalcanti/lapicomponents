% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lapiCurrencyInput.R
\name{lapiCurrencyInput}
\alias{lapiCurrencyInput}
\title{Function that generates currency inputs}
\usage{
lapiCurrencyInput(
  inputId,
  label,
  value = 0,
  caption = NULL,
  big.mark = ".",
  decimal.sep = ",",
  class = NULL,
  prefix = NULL
)
}
\arguments{
\item{big.mark}{default = '.' The thousands separator}

\item{decimal.sep}{default = ','}

\item{class}{default = NULL}

\item{prefix}{default = NULL}

\item{valua}{Initial value}
}
\value{
The masked input html
}
\description{
Function that generates currency inputs
}
