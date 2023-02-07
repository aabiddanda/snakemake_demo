#!python3

rule sim_popgen_data:
  """Simulate population genetic data.""" 
  output:
    tsz = "results/sim_data/{n}.{length}.{seed}.trees.tsz"
  params:
    n = lambda wildcards: wildcards['n'],
    length = lambda wildcards: wildcards['length'],
    seed = lambda wildcards: wildcards['seed']
  conda:
    "../envs/msprime.yaml"
  script:
    "../scripts/sim_msprime.py"
