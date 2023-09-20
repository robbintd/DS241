
library(nycflights13)
library(tidyverse)

flights = nycflights13::flights
view(flights)

# functions affecting rows

jan1 = flights |> filter(dep_delay > 120)

janFeb = flights |> filter(month %in% c(1,2))

reorg = flights |> arrange(desc(month), year, day, dep_time)

pairs = flights |> distinct(origin, dest)

f4 = flights |> distinct(origin, dest, .keep_all = TRUE)

f5 = flights |> count(origin, dest, sort = TRUE)

# functions affecting columns

gainSpeed = flights |> mutate(gain = dep_delay - arr_delay,
                  speed = distance / air_time * 60, .keep = "used"
                  ) |> filter(gain >10)

charCols = flights |> select(where(is.character))
