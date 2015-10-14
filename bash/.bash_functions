
startserver() {
  python -m SimpleHTTPServer $1;
}

## TODO add a flag to keep the first row or not, useful for csv headers !!
sample() {
  head -1 $2;
  awk -v percent=$1 'BEGIN {srand()} !/^$/ { if (rand() <= percent) print $0}' $2;
}

## Calculator cli: http://askubuntu.com/questions/378661/any-command-line-calculator-for-ubuntu
=() { echo '$(($@))'; }

fullpath() {
  cd $(dirname $1);
  echo $PWD/$(basename $1);
  cd $OLDPWD;
}

# not really useful, but ideas for scripts:
alias wifi="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | awk '/ SSID/{print $2}'"

bandwidth() {
  INTERFACE=$1;
  SAMPLE_A=(`/usr/sbin/netstat -ib | awk "/$INTERFACE/"'{print $7" "$10; exit}'`);
  sleep 1;
  SAMPLE_B=(`/usr/sbin/netstat -ib | awk "/$INTERFACE/"'{print $7" "$10; exit}'`);

  BANDWIDTH_USAGE=(`echo "2k ${SAMPLE_B[0]} ${SAMPLE_A[0]} - 1024 / p" "${SAMPLE_B[1]} ${SAMPLE_A[1]} - 1024 / p" | dc`);
  echo -e "in:\t${BANDWIDTH_USAGE[0]} Kb/sec";
  echo -e "out:\t${BANDWIDTH_USAGE[1]} Kb/sec";
}

alias runspark='/Users/jc5809/latest-spark-version/spark/bin/spark-shell'

## Added by Justine 150506 from https://unix.stackexchange.com/questions/47407/cat-line-x-to-line-y-on-a-huge-file
fromto() {
  cat $1 | tail -n +"$2" | head -n "$(($3-$2))"
}
