print("---------------------------------------------------------Code Start")

library("GenomicSEM")
library("utils")
library("Matrix")

if (!dir.exists("log")) {
  dir.create("log")
}

paths_corr <- "PATH_DIRECTORY_LOCATION_SUMSTATS" # EDIT WITH APPROPRIATE PATH
ld <- "PATH_DIRECTORY_LOCATION_LD" # EDIT WITH APPROPRIATE PATH

wld <- ld

corr <- read.csv("Correlation_input.csv")
corr_input <- paste0(paths_corr, corr$code)
corr_input <- c(corr_input)

missing_files <- corr_input[!file.exists(corr_input)]
if (length(missing_files) > 0) {
  print("The following files do not exist:")
  print(missing_files)
} else {
  print("All files exist.")
}

corr$sampleprev <- as.character(corr$sampleprev)
corr$popprev <- as.character(corr$popprev)
corr$sampleprev <- gsub(",", ".", corr$sampleprev)
corr$popprev <- gsub(",", ".", corr$popprev)
corr$sampleprev <- as.numeric(corr$sampleprev)
corr$popprev <- as.numeric(corr$popprev)

first_trait_correlations <- numeric(length(corr_input) - 1)
first_trait_ses <- numeric(length(corr_input) - 1)
second_traits <- corr$trait[-1]

original_wd <- getwd()

for (i in 2:length(corr_input)) {
  setwd("log")

  log_file <- sprintf("ldsc_log_%d.log", i)

  Correlation_output <- suppressMessages(
    suppressWarnings(
      ldsc(traits = corr_input[c(1, i)],
           sample.prev = corr$sampleprev[c(1, i)],
           population.prev = corr$popprev[c(1, i)],
           ld = ld, wld = wld, stand = TRUE,
           ldsc.log = log_file)
    )
  )
    print(Correlation_output)

  first_trait_correlations[i - 1] <- Correlation_output$S_Stand[1, 2]
  
  variance <- Correlation_output$V_Stand[1, 2]
  if (!is.null(variance)) {
    first_trait_ses[i - 1] <- sqrt(abs(variance))
  } else {
    first_trait_ses[i - 1] <- NA
  }

  setwd(original_wd)
}

results_table <- data.frame(
  TRAIT2 = second_traits,
  First_Trait_Correlations = first_trait_correlations,
  First_Trait_SEs = first_trait_ses
)

print(results_table)

write.csv(results_table, file = "results_table.csv", row.names = FALSE)

print("---------------------------------------------------------Code Finished")
