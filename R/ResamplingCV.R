#' @title Cross Validation Resampling
#'
#' @usage NULL
#' @name mlr_resamplings_cv
#' @format [R6::R6Class] inheriting from [Resampling].
#' @include Resampling.R
#'
#' @section Construction:
#' ```
#' ResamplingCV$new()
#' mlr_resamplings$get("cv")
#' rsmp("cv")
#' ```
#'
#' @description
#' Splits data using a `folds`-folds (default: 10 folds) cross-validation.
#'
#' @section Fields:
#' See [Resampling].
#'
#' @section Methods:
#' See [Resampling].
#'
#' @section Parameters:
#' * `folds` :: `integer(1)`\cr
#'   Number of folds.
#'
#' @references
#' \cite{mlr3}{bischl_2012}
#'
#' @template seealso_resampling
#' @export
#' @examples
#' # Create a task with 10 observations
#' task = tsk("iris")
#' task$filter(1:10)
#'
#' # Instantiate Resampling
#' rcv = rsmp("cv", folds = 3)
#' rcv$instantiate(task)
#'
#' # Individual sets:
#' rcv$train_set(1)
#' rcv$test_set(1)
#' intersect(rcv$train_set(1), rcv$test_set(1))
#'
#' # Internal storage:
#' rcv$instance # table
ResamplingCV = R6Class("ResamplingCV", inherit = Resampling,
  public = list(
    initialize = function() {
      ps = ParamSet$new(list(
        ParamInt$new("folds", lower = 1L, tags = "required")
      ))
      ps$values = list(folds = 10L)

      super$initialize(id = "cv", param_set = ps, man = "mlr3::mlr_resamplings_cv")
    }
  ),

  active = list(
    iters = function() {
      as.integer(self$param_set$values$folds)
    }
  ),

  private = list(
    .sample = function(ids) {
      data.table(
        row_id = ids,
        fold = shuffle(seq_along0(ids) %% as.integer(self$param_set$values$folds) + 1L),
        key = "fold"
      )
    },

    .get_train = function(i) {
      self$instance[!list(i), "row_id", on = "fold"][[1L]]
    },

    .get_test = function(i) {
      self$instance[list(i), "row_id", on = "fold"][[1L]]
    },

    .combine = function(instances) {
      rbindlist(instances, use.names = TRUE)
    },

    deep_clone = function(name, value) {
      if (name == "instance") copy(value) else value
    }
  )
)

#' @include mlr_resamplings.R
mlr_resamplings$add("cv", ResamplingCV)
