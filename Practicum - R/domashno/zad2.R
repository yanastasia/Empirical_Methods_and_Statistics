install.packages("tidyverse")
install.packages("broom")

library(tidyverse)
library(broom)
simulate_chi_square <- function(n, green, blue, yellow) {
  colors <- c(rep("green", green), rep("blue", blue), rep("yellow", yellow))
  
  counts <- table(sample(colors, n, replace = TRUE))
  
  test_result <- chisq.test(counts)
  
  p_value <- test_result$p.value
  
  return(p_value)
}
simulate_chi_square_repeatedly <- function(n, green, blue, yellow, repetitions) {
  
  p_values <- rep(NA, repetitions)
  
  for (i in 1:repetitions) {
    p_values[i] <- simulate_chi_square(n, green, blue, yellow)
  }
  
  frequency <- mean(p_values > 0.05)
  
  return(frequency)
}

repetitions <- 10000


green <- 5
blue <- 7
yellow <- 7

ns <- c(50, 100, 200, 500, 1000)

frequencies <- rep(NA, length(ns))

for (i in 1:length(ns)) {
  frequencies[i] <- simulate_chi_square_repeatedly(ns[i], green, blue, yellow, repetitions)
}

results <- data.frame(n = ns, frequency = frequencies)

ggplot(results, aes(x = n, y = frequency)) +
  geom_line() +
  xlab("n") +
  ylab("Честота на вярно заключение")
