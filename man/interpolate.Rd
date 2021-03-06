\name{interpolate}
\alias{interpolate}
\title{Univariate Interpolation}
\description{
    Univariate interpolation of gappy time series. 
}
\usage{
   interpolate(z, gap, maxit = 20, progress=FALSE, sigClip=0.999, delT=1)
}
\arguments{
   \item{z}{time series with gaps, denoted by \code{NA}.}
   \item{gap}{indexes of missing values, from \code{1:N}, where \code{N = length(z)}. }
   \item{maxit}{maximum number of iterations for convergence in interpolation. }
   \item{progress}{logical: should progress be written to screen as iterations proceed?}
   \item{sigClip}{probabilistic significance for choice of line components, dividing series
         into ``signal'' and ``noise'' (see algorithm for more). Suggested that this be kept
         above \code{0.95} at a minimum.}
   \item{delT}{the time step delta-t in seconds.}
}
\details{
   This function implements the algorithm developed and explained in Chapter 3 of
   ``Air Pollution and Health: Time Series Tools and Analysis''. 
}
\value{
    A list of five elements, including an interpolated series:
    \item{zF}{the final interpolated series.}
    \item{p}{the number of iterations.}
    \item{diffC}{the difference between the final series and the previous iteration (metric for convergence).}
    \item{zA}{a list of interim series, showing each stage of the convergence.}
    \item{converge}{logical indicating whether convergence occurred.}
}
\examples{
   library("tsinterp")
   data("flux")

   z1 <- flux$SagOrig
   z1[which(flux$S == FALSE)] <- NA

   # Unfortunately, not fast enough to run for CRAN checks
   # sagInt <- interpolate(z = z1, gap = which(flux$S == FALSE), maxit = 3, delT = 86400)

}
