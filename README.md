# In transit demo
In the in transit demo we run the newton.py n-body code configure SENSEI use
ADIOS+FLEXPATH to move data across the network to a SENSEI configurable
end-point. In the end-point we configure SENSEI to use either libsim, Catalyst,
or a custom histogram analysis. The demo requires two MPI jobs, simulation and
end-point.The following scripts run the jobs.

| script name | purpose |
|-----------------------|
| newton_adios_in_transit.sh | launches the simulation for the in transit demos. take nmumber of iterations as an argument. launch in terminal 1. |
| catalyst_in_transit.sh | launches the end-point and configures with Catalyst. launch in terminal 2. |
| libsim_in_transit.sh | launches the end-point and and configure with Libsim. launch in terminal 2. |
| histogram_in_transit.sh | launches the end-point and configures with histogram. launch in terminal 2. |

# In situ demo
The in situ demo repeats the in transit demos, but in situ. In this demo the
same XML configurations used in the in transit end-point are used as before
except on the simulation side. The following scripts run the demos.

script name | purpose
---------------------
newton_catalyst_in_situ.sh | launches the simulation for the Catalyst in transit demo. take nmumber of iterations as an argument.
newton_libsim_in_situ.sh | launches the simulation for the libsim in transit demo. take nmumber of iterations as an argument.
newton_histogram_in_situ.sh | launches the simulation for the Catalyst in transit demo. take nmumber of iterations as an argument.

# Post hoc I/O demo
In the post hoc demo data is written to disk in ParaView or VisIt readable
format. Note: mode=1 for VisIt readable output and mode=0 for ParaView readable
output.
```bash
module load sensei/1.1.0-vtk
mpiexec -np 4 python newton.py --analysis=posthoc --analysis_opts=mode=1,file=newton_out
```
