#!/bin/bash -l 
pfx=Geant4OpticksWorkflow7
src=$HOME/Documents/$pfx
pages="005 006"

for page in $pages ; do 
    snam=${pfx}.${page}
    dnam=${pfx}_${page}
    ext=png
    cmd="cp $src/$snam.$ext $dnam.$ext"

    echo $cmd
    eval $cmd 
done



