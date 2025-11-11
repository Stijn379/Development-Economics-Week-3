library(survey)
library(readstata13) 

statafile <- "C:/Users/viggo/Documents/Development Economics 1/Tanzania_2012.dta"

tzdata <- read.dta13(statafile,nonint.factors = T)

keep_cases <- !with(tzdata,
                    is.na(cons) | is.na(STRATUM) | is.na(CLUSTER) |
                      is.na(hhsize) | is.na(hhweight))

tzdata <- tzdata[keep_cases, ]
rm(keep_cases)


tzdata$popwt <- with(tzdata, hhsize * hhweight)

library(survey)

tzdesign <- svydesign(
  id = ~CLUSTER,
  strata = ~STRATUM,
  weights = ~popwt,
  data = tzdata
)

#Start of assignments


#1

tzdata
