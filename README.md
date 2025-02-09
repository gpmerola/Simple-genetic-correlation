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
    git clone git@github.com:gpmerola/Simple-genetic-correlation.git
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

- Update these paths in the script according to your data storage locations:

    - Summary Statistics Path (paths_corr): Set to the directory holding the GWAS summary statistics.

    - LD Score Path (ld): Set to the directory with the LD score files used for analysis.


## Output Files
- results_table.csv: A CSV file containing the calculated correlations and standard errors.
- correlation_plot.png: A PNG file visualizing the correlations with error bars.

## License
This project is licensed under the MIT License - see the LICENSE file for details.
