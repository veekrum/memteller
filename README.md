# Memteller
Script that shows the memory usage by the xcowsay 

## Requirement
 Install xcowsay
````sudo apt install -y xcowsay````

## Usage
1. Clone the repo
2. Now set the cron 
    
 */2 * * * * export DISPLAY=:0 && cd /home/$(hostname) && ./memteller.sh > /tmp/cronlog.log 2>&1
