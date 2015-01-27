FILES=`find ./ -type l`

for F in $FILES; do
	if [ ! -e $F ]; then
		echo "deadlink"
		echo "$F"
	fi
done
exit 0
