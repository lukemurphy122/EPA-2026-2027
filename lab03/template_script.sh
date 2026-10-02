# lets pass a parameter into counter function
counter 5
# but the counter function doesn't yet use the value passed
# how can we get a function to use a parameter?

# here's another example
counter_v2() {
    echo "the parameter passed into this function is $1"
}

counter_v2 5

# lets look at a more complex example
# suppose we want to monitor the file system for
# the %age of used space.

# this looks very complex
# note the use of 2 pipes (|) and three commands - this is a form of chaining
used_percent=$(df -h | awk 'FNR==2{print $5}' | sed 's/%//')
echo "the root partition is $used_percent percent used"
