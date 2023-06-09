#!/bin/bash

# cp psf pdb dcd

# write ColvarDefFile
vmdd -e getAtomNumbers-n-write-ColvarDefFile-2.0.tcl

# Calc colvar values in equilibrium
namd2 calc_colvars-in-equil-2.0.namd

# Calc avg value of colvars and write Harmonic file
bash calc-avg-for-colvars-n-write-HarmonicsFile-2.0.sh calc_colvars-in-equil.colvars.traj

# New Colvar setup files
# ColvarDefinitions.in & Harmonics.in
