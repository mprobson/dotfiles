test -z "$PROFILEREAD" && . /etc/profile || true

export SPEECHD_PORT=6561

# My Changes
export CHARMC=~/charm/bin/charmc

# Add home folder with custom built libs & header to include path
export CPATH=~/myUsr/local/include/:$CPATH
export LD_LIBRARY_PATH=~/myUsr/local/lib:$LD_LIBRARY_PATH
export CMAKE_LIBRARY_PATH=~/myUsr/local/lib:$CMAKE_LIBRARY_PATH

hostname=$(uname)
if [ "$hostname" == "Darwin" ];
then
  # MacPorts Installer addition on 2014-09-09_at_01:15:07: adding an appropriate PATH variable for use with MacPorts.
  export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
  # Finished adapting your PATH environment variable for use with MacPorts.
fi

# TODO make this an if?
export PATH="$PATH:~/projections/bin"

# Run .bashrc configurations if the file exists
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
