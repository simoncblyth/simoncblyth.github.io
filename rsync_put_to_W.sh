#!/bin/bash
usage(){ cat << EOU
rsync_put_to_W.sh
===================

This is a workaround for github/bitbucket blockage.
It is not convenient to get around that blockage
on machines I do not control such as W.
So rsync_put_to_W.sh rsyncs from A to W.


HMM : how dodgy a thing is this ?
------------------------------------

* as the target machine is for presentation of html its
  probably no big deal, however note that if use
  git on the remote side it means a git binary version 
  is having to deal with the raw repo files provide by 
  another git version


rsync options
----------------

-z, --compress   compress file data during the transfer
-a, --archive    archive mode; equals -rlptgoD (no -H,-A,-X)
-r, --recursive  recurse into directories
-v, --verbose    increase verbosity
    --delete     delete extraneous files from dest dirs

* :google:`rsync git repository`

* https://tylercipriani.com/blog/2020/09/22/migrating-git-data-with-rsync/

::

    "The moral of the story here is to never omit --delete from rsync if you’re
    trying to keep repos in sync."


git bundle
-----------

Another approach see "git help bundle"


observations
----------------

* Doing almost nothing sync takes about 20s
* use of "--delete" is a bit fraught, so this script
  is deliberately not very flexible to avoid surprises


EOU
}

cd $(dirname $(realpath $BASH_SOURCE))

defarg="info_all"
arg=${1:-$defarg}

if [ "$PWD" != "/usr/local/simoncblyth.github.io" ]; then
    echo $BASH_SOURCE - ERROR UNEXPECTED PWD $PWD
    exit 1
fi

src=/usr/local/simoncblyth.github.io/         ## for rsync a trailing slash on source directory means copy contents of this directory
dst=W:simoncblyth.github.io

cmd="rsync -zarv --delete  $src $dst"
cmdx="rsync -zarv --exclude .git/ --delete $src $dst"

vars="BASH_SOURCE defarg arg src dst cmd cmdx"

if [ "${arg/info}" != "$arg" ]; then
   for var in $vars ; do printf "%20s : %s \n" "$var" "${!var}" ; done
fi

if [ "${arg/all}" != "$arg" ]; then
   date
   echo $cmd
   eval $cmd
   [ $? -ne 0 ] && echo $BASH_SOURCE : all error && exit 1
   date
fi

if [ "${arg/wc}" != "$arg" ]; then
   read -p "$BASH_SOURCE : CAUTION UNTESTED : this will delete .git 160MB at the other end, enter YES to continue " answer
   if [ "$answer" == "YES" ]; then

       date
       echo $cmd
       eval $cmd
       [ $? -ne 0 ] && echo $BASH_SOURCE : wc error && exit 2
       date
   else
        echo $BASH_SOURCE : skip
   fi
fi



