## Create a package
## check the package's name availability
library(available)
available::available("hmsidwR")

library(devtools)
library(usethis)
usethis::create_package("~/Documents/R/AAA_packages/hmsidwR")
usethis::use_git()

## Function Documentation
usethis::use_r("lmforecast")

## restart and load the function
devtools::load_all()

## check the package status
devtools::check()

## type ctrl . to access the DESCRIPTION file to customize
## add the licence
usethis::use_mit_license()

## add documentation of the function
# head over the function file and --> code--> Insert roxygen skeleton
devtools::document()

## Install the package (Cmd + Shift + B)
devtools::install()

## install testthat to check functions
usethis::use_testthat()
# then fill up the test_that() function with expected output
devtools::test()

## use github
usethis::use_github()

## add a readme
usethis::use_readme_rmd()

## build the readme
devtools::build_readme()
## then check and install


## Data

