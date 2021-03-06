#!/bin/bash
trap 'echo "# $BASH_COMMAND"' DEBUG

module load sensei/1.1.0-vtk

mpiexec -np 4 ADIOSAnalysisEndPoint -r flexpath -f histogram_config.xml newton.bp
