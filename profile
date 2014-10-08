export SPEECHD_PORT=6561

# My Changes
export CHARMC=~/charm/bin/charmc

# Add home folder with custom built libs & header to include path
export CPATH=/dcsdata/home/mprobson/myUsr/local/include/:$CPATH
export LD_LIBRARY_PATH=~/myUsr/local/lib:$LD_LIBRARY_PATH
export CMAKE_LIBRARY_PATH=~/myUsr/local/lib:$CMAKE_LIBRARY_PATH

# Run .bashrc configurations if the file exists
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
