\name{segment}
\alias{segment}
\title{Segment a sequence into shifted versions of itself}
\arguments{
  \item{x}{A vector}

  \item{do.pad}{Whether the vector should be padded to
  contain the edges of the sequence}
}
\value{
  The return value is a data.frame with dimensions
  length(x) - 1 by 2 or length(x) + 1 by 2 if do.pad ==
  TRUE. A data.frame is used to support arbitrary types.
  For example, using a Date vector will result in a numeric
  output, which is inconvenient.
}
\description{
  Create a shifted version of a sequence to make it easier
  to do certain types of analysis.
}
\note{
  The segment function is a convenience and can be
  implemented using the general functions partition and
  also maprange. If you want more than two columns, use
  maprange.
}
\section{Usage}{
  segment(x, do.pad=FALSE)
}

\section{Details}{
  Segmenting sequences into offset versions of itself is
  useful for detecting patterns in sequences. This approach
  is compatible with a functional programming style as each
  row can then be passed to a map-vectorized function for
  further processing.

  The advantage over an iterative approach is that the
  map-vectorized function can focus on a row-specific model
  independent of data management mechanics like maintaining
  proper indices while iterating over the sequence, as this
  is handled by segment.
}
\examples{
segment(1:10)

# Notice how the ends of the sequence are given their own rows
segment(1:10, TRUE)

# Emulate segment using partition
partition(1:10, function(x) x, 1)

# Emulate segment using maprange
t(maprange(1:10, 2, function(x) x))

# Create four shifted copies instead of two
maprange(1:10, 4, function(x) x)
}
\author{
  Brian Lee Yung Rowe
}
\seealso{
  \code{\link{partition}} \code{\link{maprange}}
}

