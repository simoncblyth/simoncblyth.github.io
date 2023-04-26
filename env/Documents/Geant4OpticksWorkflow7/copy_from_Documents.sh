#!/bin/bash -l 

src=$HOME/Documents/Geant4OpticksWorkflow7
snam=Geant4OpticksWorkflow7.005
dnam=${snam/./_}
ext=png

cmd="cp $src/$snam.$ext $dnam.$ext"

echo $cmd
eval $cmd 




