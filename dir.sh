pwd=`pwd`

while read -r dir
do
	sed -i 's/letter/newletter/g' "$dir" #letter
    echo $dir
done < <(find . -type d)

