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
