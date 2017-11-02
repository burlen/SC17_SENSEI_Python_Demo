# SC17 Tutorial In transit Demo
These scripts run the demos.

script name | purpose
---------------------
newton_in_transit.sh | launches the simulation for all the demos. take nmumber of iterations as an argument
catalyst_in_transit.sh | launches the end-point and configures with Catalyst
libsim_in_transit.sh | launches the end-point and and configure with Libsim
histogram_in_transit.sh | launches the end-point and configures with histogram

# More Demos
Newton, a simple parallel n-body gravitational simulation, is written in Python
and ships with SENSEI. Newton was used to test SENSEI's Python bindings and to
illustrate how SENSEI can be used from a Python simulation.

This demo shows how SENSEI can do *in situ*, *in transit*, and I/O for *post
hoc* processing. The demo illustrates use of Catalyst, Libsim, and ADIOS.

## In situ
In the in situ demo the simulation and rendering occurs in the same process.
### Catalyst
```bash
module load sensei/1.1.0-catalyst
mpiexec -np 4 python newton.py --analysis=catalyst --analysis_opts=script=newton_catalyst.py
```
### Libsim
```bash
module load sensei/1.1.0-libsim
mpiexec -np 4 python  newton.py --analysis=configurable --analysis_opts=config=newton_libsim.xml --n_its=5
```
### Post hoc I/O
In the post hoc demo data is written to disk in ParaView or VisIt readable
format. Note: mode=1 for VisIt readable output and mode=0 for ParaView readable
output.
```bash
module load sensei/1.1.0-vtk
mpiexec -np 4 python newton.py --analysis=posthoc --analysis_opts=mode=1,file=newton_out
```

## In transit
In the in transit demo ADIOS is used to move data across the network or to
stage simulation data to shared resource (such as a burst buffer) where a
second job called an end-point analyzes it.

### Catalyst
##### Simulation (Job 1)
```bash
module load sensei/1.1.0-catalyst
mpiexec -np 4 python newton.py --analysis=configurable --analysis_opts=config=adios_config.xml
```
##### Rendering (Job 2)
```bash
module load sensei/1.1.0-catalyst
mpiexec -np 4 ADIOSAnalysisEndPoint -r flexpath -f catalyst_config.xml newton.bp
```

### Libsim
##### Simulation (Job 1)
```bash
module load sensei/1.1.0-libsim
mpiexec -np 4 python newton.py --analysis=configurable --analysis_opts=config=adios_config.xml
```
##### Rendering (Job 2)
```bash
module load sensei/1.1.0-libsim
mpiexec -np 4 ADIOSAnalysisEndPoint -r flexpath -f libsim_config.xml newton.bp
```
