### Script for snakemake lunch n' learn

* Presentation + understanding the anatomy of a rule
* How to effectively chain rules (and how to break apart rules)
* What are wildcards and how should they be used in these kinds of workflows?

### The most important flags initially:
	* `-j1`: the number of jobs that can be run at once
	* `--cores`: the number of threads/cores that can be used 
	* `--rerun-incomplete`: reruning rules if the results are incomplete or frozen
	* `--dryrun`, `-n`: just make sure that the final output of a rule is the one that is expected
	* `--quiet rules`

### First failure point: "rule-specific environments"

  * For most bioinformatics setups you probably want most things like:
  	* `bcftools`
  	* `samtools`
  	* `plink2`
  * But some rules might require specialized software that you would rather just be kind of self-contained to their own environment
  * If we define an environment for a rule, we can use the `conda` block to support that pipeline here ... 

### Running on local vs. on `slurm`
	* We just finished running the pipeline on local! 
	* Lets do the whole thing over again on `slurm`! Which requires something known as a "profile" for running 
	* so remove `rm -rf results/` and lets try to run it again! 
	* Explanation of the profile and what each element helps to tell slurm (look this up in extra resources)
	* Run the workflow on slurm using `snakemake ... --profile profile/`

### Visualizing the workflow

Two options for visualizing your workflows are the following commands: 

```
snakemake --dag | dot -Tpdf > test.pdf
snakemake --rulegraph | dot -Tpdf > test.rulegraph.pdf
```

These are both good visualization tools for learning what steps you're taking in the process to get to your main results tables. For simulation settings with many replicates, it is recommended to use the `--rulegraph` flag to generate a more concise representation of the  
