#!/bin/bash

# /Users/blyth/simoncblyth.bitbucket.io/env/presentation/GEOM
reldir=J_2025jan08/CSGOptiXRenderInteractiveTest
name=cxr_min__eye_1,0,0__zoom_1__tmin_0.5__NNVT:0:000000.jpg


mkdir -p $reldir/
scp P:/data/blyth/opticks/GEOM/$reldir/$name $reldir/

ls -astl $PWD/$reldir/$name




