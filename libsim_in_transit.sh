#!/bin/bash
trap 'echo "# $BASH_COMMAND"' DEBUG

module load sensei/1.1.0-libsim

mpiexec -np 4 ADIOSAnalysisEndPoint -r flexpath -f libsim_config.xml newton.bp
