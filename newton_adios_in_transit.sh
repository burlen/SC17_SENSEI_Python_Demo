#!/bin/bash
trap 'echo "# $BASH_COMMAND"' DEBUG

module load sensei/1.1.0-vtk

n_its=$1

mpiexec -np 4 python newton.py --analysis=configurable \
  --analysis_opts=config=adios_config.xml --n_its=${n_its}
