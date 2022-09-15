library(tradestatistics)
# US HS4-level trade from 2000 to 2018
us_trade <- ots_create_tidy_data(
                                 # years = c(2000:2018),
                                 years = 2000,
                                 reporters = "usa",
                                 table = "yrpc"
                                )


library(arrow)
library(data.table)
library(vroom)


system.time(taxi <- fread("taxi_trip_data.csv", tz = "UTC"))
#>    user  system elapsed
#>   3.578   0.498   7.767
system.time(taxi_arrow <- read_csv_arrow("taxi_trip_data.csv"))
#>    user  system elapsed
#>   6.810   1.772   2.001
taxi_arrow %<>% arrow_table()

system.time(taxi <- vroom("taxi_trip_data.csv", progress = FALSE))

# Example experiment using the iris dataset.
# You may want to specify a different path for experiment_dir.
# This is where results are written to.
familiar::summon_familiar(data=iris,
                          experiment_dir=file.path("/Users/carlosortega/Downloads/", "familiar_1"),
                          outcome_type="multinomial",
                          outcome_column="Species",
                          experimental_design="fs+mb",
                          cluster_method="none",
                          fs_method="mrmr",
                          learner="glm",
                          parallel=FALSE)

