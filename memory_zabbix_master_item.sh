#/bin/sh

# Get current memory usage
if [ -f "/etc/redhat-release" ]; then
        MemUsage=`free | awk 'NR==2 {printf("%d %d %d %d",$2,$4,$6,$6)}'`
elif [ -f "/etc/lsb-release" ]; then
        MemUsage=`free -w | awk 'NR==2 {printf("%d %d %d %d",$2,$4,$6,$6)}'`
else
        echo "Not supported distribution."
fi

# Retrieve each element
#buff and cache value are the same 
Total=`echo $MemUsage | awk '{print $1}'`
Free=`echo $MemUsage | awk '{print $2}'`
Buff=`echo $MemUsage | awk '{print $3}'`
Cached=`echo $MemUsage | awk '{print $4}'`

# Create JSON string
echo "$MemUsage $(( Total -  (Free + Buff)))" | \
awk \
'{printf("{\
\"MEM_TOTAL\":%d ,\
\"MEM_FREE\":%d ,\
\"MEM_BUFFERS\":%d ,\
\"MEM_CACHED\":%d ,\
\"MEM_USED\":%d }",\
$1,$2,$3,$4,$5)}'


