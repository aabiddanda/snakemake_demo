"""Simulate a very simple msprime simulation and store."""

import msprime
import tszip

if __name__ == "__main__":
    n = int(snakemake.params["n"])  # noqa
    sequence_length = int(snakemake.params["length"])  # noqa
    seed = int(snakemake.params["seed"])  # noqa
    ts = msprime.sim_ancestry(
        n,
        sequence_length=sequence_length * 1e6,
        population_size=1e4,
        recombination_rate=1e-8,
        random_seed=seed,
    )
    mts = msprime.sim_mutations(ts, rate=1.2e-8, random_seed=seed)
    tszip.compress(mts, snakemake.output["tsz"])  # noqa
