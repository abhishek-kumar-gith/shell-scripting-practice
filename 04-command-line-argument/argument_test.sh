


if [ $# -lt 3 ]
then
    echo "Usage: ./argument_test.sh <name1> <name2> <name3>"
    exit 1
fi

echo "$1"
echo "$2"
echo "$3"


echo "TOtal Argument :" "$#"
