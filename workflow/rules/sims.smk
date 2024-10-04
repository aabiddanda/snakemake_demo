#!python3


rule sim_popgen_data:
    """Simulate population genetic data."""
    output:
        tsz="results/sim_data/{n}.{length}.{seed}.trees.tsz",
    params:
        n=lambda wildcards: wildcards["n"],
        length=lambda wildcards: wildcards["length"],
        seed=lambda wildcards: wildcards["seed"],
    wildcard_constraints:
        n="\d+",
        length="\d+",
        seed="\d+",
    resources:
        time="0:25:00",
        mem_mb="500M",
    conda:
        "../envs/msprime.yaml"
    script:
        "../scripts/sim_msprime.py"


rule create_summary_stats:
    """
    Create some population-genetic summary statistics
    and store in a temporary TSV file.
    """
    input:
        tsz="results/sim_data/{n}.{length}.{seed}.trees.tsz",
    output:
        tsv=temp("results/sim_tsv/{n}.{length}.{seed}.sumstats.tsv"),
    conda:
        "../envs/msprime.yaml"
    script:
        "../scripts/summary_stats.py"


rule combine_summary_stats:
    """Combine all of the summary statistics."""
    input:
        tsvs=expand(
            "results/sim_tsv/{n}.{length}.{seed}.sumstats.tsv",
            seed=range(1, config["params"]["nreps"] + 1),
            length=config["params"]["length"],
            n=config["params"]["n"],
        ),
    output:
        tsv="results/full_simulations.tsv",
    run:
        import pandas as pd

        dfs = [pd.read_csv(i, sep="\t") for i in input.tsvs]
        tot_df = pd.concat(dfs)
        tot_df.to_csv(output.tsv, sep="\t", index=None)


# rule testR:
    # output:
        # "results/testR.csv"
    # shell:
#         "Rscript workflow/scripts/test.R {output}"
