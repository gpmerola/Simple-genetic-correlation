# Simple-genetic-correlation

Simple-genetic-correlation  is a simple tool designed for calculating and visualizing genomic trait correlations using summary statistics from GWAS (Genome-Wide Association Studies).

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Input Files](#input-files)
- [Output Files](#output-files)
- [Example](#example)
- [License](#license)

## Installation

### Prerequisites

- R (with `GenomicSEM`, `utils`, and `Matrix` packages)
- Python 3 (with `pandas` and `matplotlib` packages)

### Steps

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/GenomicCorrelator.git
    cd GenomicCorrelator
    ```

2. Install R packages:

    ```r
    install.packages(c("GenomicSEM", "utils", "Matrix"))
    ```

3. Install Python packages:

    ```bash
    pip install pandas matplotlib
    ```

## Usage

### Step 1: Calculate Correlations

Run the `main.R` script to compute the trait correlations and generate a results table.

```bash
Rscript main.R
