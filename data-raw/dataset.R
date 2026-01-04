
# Read the excerpt.

text_raw <- readLines("./inst/extdata/joyce_excerpt.txt")

# Collapse to a single string.

text_raw <- paste(text_raw, collapse = "")

# Keep letters only; remove spaces and punctuation.

text_clean <- gsub("[^A-Za-z]", "", text_raw)

# Convert to lower case.

text_clean <- tolower(text_clean)

# Split into individual characters.

chars <- strsplit(text_clean, "")[[1]]

# Count characters.

n_chars <- length(chars)

# Generate overlapping pairs.

# Note: from starts at x_1 and ends an x_{-1}. i.e. 
#       drops the last character that cannot transition.
#       And to starts at x_2 and ends at x_n, i.e. the
#       transitioned state of each prior character.

from <- chars[-length(chars)] # Drops last.

to <- chars[-1] # Drops first.

transitions <- data.frame(from = from, 
                          to = to,
                          stringsAsFactors = FALSE)

# Number of transitions.

row(transitions)

# Frequency table.

table(transitions$from, transitions$to)[1:5, 1:5]

# Save transitions data frame.

saveRDS(transitions, "./data/transitions.rds")







