#!/bin/bash
trap 'echo "# $BASH_COMMAND"' DEBUG

module load sensei/1.1.0-catalyst

n_its=$1

mpiexec -np 4 python newton.py --analysis=configurable \
  --analysis_opts=config=catalyst_config.xml --n_its=${n_its}
