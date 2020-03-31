#!/bin/tcsh -xef

echo "I don't care who you are or your span of participants because I'll just run stuff for everyone."

echo "I'm going to check to see if you installed pandas..."
if python3 -c "import pkgutil; exit(not pkgutil.find_loader('pandas'))"; then
    echo "Pandas found. Nice."
else
    echo "Why isn't pandas installed? I'll install it for you, rookie >:/"
    pip3 install pandas
fi

while true; do
    read -p "You ready to go? Remember, I'll run for everyone... " yn
    case $yn in
        [Yy]* ) echo "leggo."; break;;
        [Nn]* ) echo "smh."; exit;;
        * ) echo "Give me a yes or no; don't play me. ";;
    esac
done

echo "Running Confounds.py to generate the overall confounds csv for all participants..."
chmod +x Confounds.py
python3 Confounds.py

cd ~/Documents/1stHalfFunctional/Output/fmriprep
for sub in $(seq -w 1 132)
do
	if [[ -d "sub-$sub" ]]
	then
		echo "Subject $sub folder found"
		cd sub-$sub/func/
		echo "Converting the confounds tsv to an AFNI 1D file..."
		touch confounds_rall.1D # creating 1D file
		1dcat confounds_rall.csv > confounds_rall.1D # putting info from the csv into the 1D file
		cd ../..
	else
		echo "No subject $sub folder...moving on..."
	fi
done
