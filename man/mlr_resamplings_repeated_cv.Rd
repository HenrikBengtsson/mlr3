% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ResamplingRepeatedCV.R
\name{mlr_resamplings_repeated_cv}
\alias{mlr_resamplings_repeated_cv}
\alias{ResamplingRepeatedCV}
\title{Repeated Cross Validation Resampling}
\format{\code{\link[R6:R6Class]{R6::R6Class()}} inheriting from \link{Resampling}.}
\description{
Splits data \code{repeats} (default: 10) times using a \code{folds}-fold (default: 10) cross-validation.

The iteration counter translates to \code{repeats} blocks of \code{folds}
cross-validations, i.e., the first \code{folds} iterations belong to
a single cross-validation.
}
\section{Construction}{
\preformatted{ResamplingRepeatedCV$new()
mlr_resamplings$get("repeated_cv")
rsmp("repeated_cv")
}
}

\section{Fields}{

See \link{Resampling}.
}

\section{Methods}{

See \link{Resampling}.
Additionally, the class provides two helper function to translate iteration numbers to folds / repeats:
\itemize{
\item \code{folds(iters)}\cr
\code{integer()} -> \code{integer()}\cr
Translates iteration numbers to fold number.
\item \code{repeats(iters)}\cr
\code{integer()} -> \code{integer()}\cr
Translates iteration numbers to repetition number.
}
}

\section{Parameters}{

\itemize{
\item \code{repeats} :: \code{integer(1)}\cr
Number of repetitions.
\item \code{folds} :: \code{integer(1)}\cr
Number of folds.
}
}

\examples{
# Create a task with 10 observations
task = tsk("iris")
task$filter(1:10)

# Instantiate Resampling
rrcv = rsmp("repeated_cv", repeats = 2, folds = 3)
rrcv$instantiate(task)
rrcv$iters
rrcv$folds(1:6)
rrcv$repeats(1:6)

# Individual sets:
rrcv$train_set(1)
rrcv$test_set(1)
intersect(rrcv$train_set(1), rrcv$test_set(1))

# Internal storage:
rrcv$instance # table
}
\references{
\cite{mlr3}{bischl_2012}
}
\seealso{
\link[mlr3misc:Dictionary]{Dictionary} of \link[=Resampling]{Resamplings}: \link{mlr_resamplings}

\code{as.data.table(mlr_resamplings)} for a complete table of all (also dynamically created) \link{Resampling} implementations.
}
