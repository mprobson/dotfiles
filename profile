export SPEECHD_PORT=6561

# My Changes
export CHARMC=~/charm/bin/charmc

# Add home folder with custom built libs & header to include path
export CPATH=/dcsdata/home/mprobson/myUsr/local/include/:$CPATH
export LD_LIBRARY_PATH=~/myUsr/local/lib:$LD_LIBRARY_PATH
export CMAKE_LIBRARY_PATH=~/myUsr/local/lib:$CMAKE_LIBRARY_PATH

hostname=$(hostname)
if [ "$hostname" == "wirelessprvnat" ];
then
  # MacPorts Installer addition on 2014-09-09_at_01:15:07: adding an appropriate PATH variable for use with MacPorts.
  export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
  # Finished adapting your PATH environment variable for use with MacPorts.
  echo "MAC!"
# TODO make this an if instead of an else
else
  export PATH="$PATH:/dcsdata/home/mprobson/projections/bin"
fi

# Run .bashrc configurations if the file exists
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
