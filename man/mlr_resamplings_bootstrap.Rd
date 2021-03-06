% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ResamplingBootstrap.R
\name{mlr_resamplings_bootstrap}
\alias{mlr_resamplings_bootstrap}
\alias{ResamplingBootstrap}
\title{Bootstrap Resampling}
\format{\link[R6:R6Class]{R6::R6Class} inheriting from \link{Resampling}.}
\description{
Splits data into bootstrap samples (sampling with replacement).
Hyperparameters are the number of bootstrap iterations (\code{repeats}, default: 30)
and the ratio of observations to draw per iteration (\code{ratio}, default: 1) for the training set.
}
\section{Construction}{
\preformatted{ResamplingBootstrap$new()
mlr_resamplings$get("bootstrap")
rsmp("bootstrap")
}
}

\section{Fields}{

See \link{Resampling}.
}

\section{Methods}{

See \link{Resampling}.
}

\section{Parameters}{

\itemize{
\item \code{repeats} :: \code{integer(1)}\cr
Number of repetitions.
\item \code{ratio} :: \code{numeric(1)}\cr
Ratio of observations to put into the training set.
}
}

\examples{
# Create a task with 10 observations
task = tsk("iris")
task$filter(1:10)

# Instantiate Resampling
rb = rsmp("bootstrap", repeats = 2, ratio = 1)
rb$instantiate(task)

# Individual sets:
rb$train_set(1)
rb$test_set(1)
intersect(rb$train_set(1), rb$test_set(1))

# Internal storage:
rb$instance$M # Matrix of counts
}
\references{
\cite{mlr3}{bischl_2012}
}
\seealso{
\link[mlr3misc:Dictionary]{Dictionary} of \link[=Resampling]{Resamplings}: \link{mlr_resamplings}

\code{as.data.table(mlr_resamplings)} for a complete table of all (also dynamically created) \link{Resampling} implementations.
}
