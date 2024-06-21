import pandas as pd
import matplotlib.pyplot as plt

def main():
    print("---------------------------------------------------------CodeStart - CorrPlot")

    # Read the results_table.csv file
    correlation_data = pd.read_csv("results_table.csv")

    # Sort the data for better visualization
    correlation_data = correlation_data.sort_values(by='First_Trait_Correlations')

    # Plot the horizontal bar plot with error bars
    plt.figure(figsize=(10, 8))
    plt.barh(correlation_data['TRAIT2'], correlation_data['First_Trait_Correlations'], 
             xerr=correlation_data['First_Trait_SEs'], color='skyblue', edgecolor='black')
    plt.xlabel('Correlation')
    plt.ylabel('Trait')
    plt.title('Correlation Plot')
    plt.grid(True, which='both', linestyle='--', linewidth=0.5)
    plt.gca().set_facecolor('white')
    plt.gcf().set_facecolor('white')

    # Save the plot as a PNG file with a white background
    plt.savefig('correlation_plot.png', bbox_inches='tight', facecolor='white')

    print("---------------------------------------------------------Whole Code Finished")

if __name__ == "__main__":
    main()
