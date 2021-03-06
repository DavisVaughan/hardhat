% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mold.R
\name{run_mold}
\alias{run_mold}
\title{Call \code{mold$clean()} and \code{mold$process()}}
\usage{
run_mold(blueprint, ...)
}
\arguments{
\item{blueprint}{A preprocessing blueprint.}

\item{...}{Not used. Required for extensibility.}
}
\value{
The preprocessed result, as a named list.
}
\description{
This is a purely developer facing function, that is \emph{only} used if you are
creating a completely new blueprint inheriting only from \code{\link[=new_blueprint]{new_blueprint()}}, and
not from one of the more common: \code{\link[=new_xy_blueprint]{new_xy_blueprint()}}, \code{\link[=new_recipe_blueprint]{new_recipe_blueprint()}},
\code{\link[=new_formula_blueprint]{new_formula_blueprint()}}.
}
\details{
Because \code{mold()} has different interfaces (like XY and formula),
which require different arguments (\code{x} and \code{y} vs \code{data}), their
corresponding blueprints also have different arguments for the
\code{blueprint$mold$clean()} and \code{blueprint$mold$process()} functions. The sole
job of \code{run_mold()} is simply to call these two functions with the right
arguments.

The only time you need to implement a method for \code{run_mold()} is if you
are creating a \code{new_blueprint()} that does not follow one of the three core
blueprint types. In that special case, create a method for \code{run_mold()} with
your blueprint type, and pass through whatever arguments are necessary to call
your blueprint specific \code{clean()} and \code{process()} functions.

If you go this route, you will also need to create a \code{mold()} method if \code{x}
is not a data frame / matrix, recipe, or formula. If \code{x} is one of
those types, then \code{run_mold()} will be called for you by the
existing \code{mold()} method, you just have to supply the \code{run_mold()} method
for your blueprint.
}
