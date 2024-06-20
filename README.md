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
```

### Step 2: Generate Correlation Plot
Run the corrplot.py script to create a visual representation of the trait correlations.

```bash
python corrplot.py
```

## Input Files
- Correlation_input.csv: A CSV file containing the traits name, traits file name, sample prevalence, and population prevalence.
```
trait,code,sampleprev,popprev
Trait1.gz,trait1,0.1,0.01
Trait2.gz,trait2,0.2,0.02
Trait3.gz,trait3,0.15,0.015
```
- reference.1000G.maf.0.005.txt.gz: Reference file for LD score regression.
- w_hm3.snplist: SNP list.
- Summary statistic files for each trait located in the specified path (/scratch/prj/gwas_sumstats/munged/).

## Output Files
- results_table.csv: A CSV file containing the calculated correlations and standard errors.
- correlation_plot_python.png: A PNG file visualizing the correlations with error bars.

## License
This project is licensed under the MIT License - see the LICENSE file for details.
