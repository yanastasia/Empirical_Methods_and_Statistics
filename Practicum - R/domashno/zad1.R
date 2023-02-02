simulate_round <- function() {
  # Create a vector of cards, with 1 representing a marked card and 0 representing an unmarked one
  cards <- c(rep(1, 4), rep(0, 28))
  
  # Shuffle the cards
  cards <- sample(cards)
  
  # Divide the cards into 4 equal piles
  piles <- split(cards, rep(1:4, each = 8))
  
  # Check if each pile contains one ace
  result <- sapply(piles, function(pile) sum(pile) == 1)
  
  # Return TRUE if all piles contain one ace, FALSE otherwise
  return(all(result))
}
# Set the number of simulations to run
n <- 10000

# Initialize a counter for successful rounds
successes <- 0

# Run the simulations
for (i in 1:n) {
  if (simulate_round()) {
    successes <- successes + 1
  }
}

# Calculate the probability of success
probability <- successes / n
print(probability)