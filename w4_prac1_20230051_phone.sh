if [ $# -eq 0 ]; then
    echo "Usage: phone searchfor [… searchfor]"
    echo "You didn't tell me what to search for."
    exit 1
fi

pattern=""
for arg in "$@"; do
    if [ -z "$pattern" ]; then
        pattern="$arg"
    else
        pattern="$pattern|$arg"
    fi
done

egrep "$pattern" ~/mydata > tmp

awk -f display.awk tmp

rm tmp

