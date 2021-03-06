% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MeasureSimple.R
\name{mlr_measures_regr.rmse}
\alias{mlr_measures_regr.rmse}
\title{Root Mean Squared Error}
\format{\code{\link[R6:R6Class]{R6::R6Class()}} inheriting from \link{Measure}.}
\description{
Regression measure defined as \deqn{
  \sqrt{\frac{1}{n} \sum_{i=1}^n \left( t_i - r_i \right)^2}.
}{
  sqrt(mean((t - r)^2)).
}
}
\note{
The score function calls \code{\link[mlr3measures:rmse]{mlr3measures::rmse()}} from package \CRANpkg{mlr3measures}.

If the measure is undefined for the input, \code{NaN} is returned.
This can be customized by setting the field \code{na_value}.
}
\section{Construction}{

This measures can be retrieved from the dictionary \link{mlr_measures}:\preformatted{mlr_measures$get("classif.rmse")
msr("classif.rmse")
}
}

\section{Meta Information}{


\itemize{
\item Type: \code{"regr"}
\item Range: \eqn{[0, \infty)}{[0, Inf)}
\item Minimize: \code{TRUE}
\item Required prediction: \code{response}
}

}

\seealso{
\link[mlr3misc:Dictionary]{Dictionary} of \link[=Measure]{Measures}: \link{mlr_measures}

\code{as.data.table(mlr_measures)} for a complete table of all (also dynamically created) \link{Measure} implementations.

Other regression measures: 
\code{\link{mlr_measures_regr.bias}},
\code{\link{mlr_measures_regr.ktau}},
\code{\link{mlr_measures_regr.mae}},
\code{\link{mlr_measures_regr.mape}},
\code{\link{mlr_measures_regr.maxae}},
\code{\link{mlr_measures_regr.medae}},
\code{\link{mlr_measures_regr.medse}},
\code{\link{mlr_measures_regr.mse}},
\code{\link{mlr_measures_regr.msle}},
\code{\link{mlr_measures_regr.pbias}},
\code{\link{mlr_measures_regr.rae}},
\code{\link{mlr_measures_regr.rmsle}},
\code{\link{mlr_measures_regr.rrse}},
\code{\link{mlr_measures_regr.rse}},
\code{\link{mlr_measures_regr.rsq}},
\code{\link{mlr_measures_regr.sae}},
\code{\link{mlr_measures_regr.smape}},
\code{\link{mlr_measures_regr.srho}},
\code{\link{mlr_measures_regr.sse}}
}
\concept{regression measures}
