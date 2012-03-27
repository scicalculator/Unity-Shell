
##############################################################
# --- PATH SETUP ---
if [[ $COMP_TYPE == "local" ]] ; then
  # add macports to path
  export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
  # This makes GNU binaries override some apple binaries (ie. ls, grep, etc.)
  export PATH="/opt/local/libexec/gnubin:$PATH"
else 

  export LD_LIBRARY_PATH="${HOME}/local/lib/:${HOME}/local/lib64/:${LD_LIBRARY_PATH}"
  export PATH="$HOME/local/bin:$PATH"

  # LAPACK libraries
  export BLAS_LIBS="$HOME/local/lib/libblas.a"
  export LAPACK_LIBS="$HOME/local/lib/liblapack.a"

fi

export PATH_ORIG="$PATH"
# --- regenpath: generate PATH---
function regenpath(){
if [[ -n $PATH_ORIG ]] ; then
  export PATH=$PATH_ORIG
fi
for dir in $(find $HOME/bin $HOME/dev -type d  -regex ".*\/bin" )
do
  # strip the trailing colon (not actually necessary)
  if [[ $PATH != *${dir}* ]] ; then
    # only insert the directory if it is unique
    # user defined functions take precedence over system functions
    export PATH="${dir}:$PATH"
  fi
done
}
regenpath

function regenpathpy(){
PYTHONPATH=
for dir in $(find $HOME/bin $HOME/dev -type d  -regex ".*\/py\(\w\|-\w\|\w*\/src\|-\w*\/src\)*")
do
  if [[ $PYTHONPATH != *${dir}* ]] ; then
    # only insert the directory if it is unique
    # the order is irrelevant
    export PYTHONPATH="$PYTHONPATH:${dir}"
  fi
done
}
regenpathpy
##############################################################
CDPATH=.:~:~/dev:~/bin