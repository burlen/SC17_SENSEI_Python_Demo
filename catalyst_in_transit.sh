#!/bin/bash
trap 'echo "# $BASH_COMMAND"' DEBUG

module load sensei/1.1.0-catalyst

mpiexec -np 4 ADIOSAnalysisEndPoint -r flexpath -f catalyst_config.xml newton.bp
