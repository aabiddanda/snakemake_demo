## Snakemake Demo (PopGen Edition)

The primary purposes of this repository are to get accustomed to using snakemake in a new cluster environment with configurations. This is primarily for my own personal use but can be useful to highlight how using `snakemake` can help with a number of tasks.

### Installation

To properly get setup for running this initial `snakemake` workflow, I recommend the following set of steps:

1. Install `conda` and `mamba`

Follow the instructions to install `mamba` into your `base` conda environment: https://mamba.readthedocs.io/en/latest/installation/mamba-installation.html


2. Create a new environment for this project

```
mamba create --name "snakemake_demo" python=3.11
```

3. `pip install` the latest software for running the base-level workflow

```
pip install snakemake numpy tszip tskit pandas snakemake-executor-plugin-cluster-generic
```

Note: this is helpful because it will automatically install `snakemake>=8.0.0` which has some key differences in how submission to a cluster is handled

## Contact

If you have any questions - please feel free to suggest fixes via an issue or submit a PR.
