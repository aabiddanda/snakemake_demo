import msprime
import numpy
import pandas as pd
import tszip as tsz

if __name__ == "__main__":
    # Read in the tszipped format trees
    ts = tsz.decompress(snakemake.input["tsz"])
    # Compute popgen summary statistics
    pairwise_div = ts.diversity()
    tajimas_d = ts.Tajimas_D()
    sites = ts.segregating_sites()
    df = pd.DataFrame(
        {
            "seed": snakemake.wildcards["seed"],
            "n": snakemake.wildcards["n"],
            "length": snakemake.wildcards["length"],
            "Ne": 1e4,
            "mu": 1.2e-8,
            "pairwise_div": pairwise_div,
            "segregating_sites": sites,
            "tajimas_d": tajimas_d,
        },
        index=[0],
    )
    df.to_csv(snakemake.output["tsv"], index=None, sep="\t")
