export i=0

for atom in Ag Au C Cl Cn Cu F Fl H Hg N Nh Og Pb Pt Rn Tl
do
  echo $atom
  for b in $(ls ./"$atom"/basis)
  do
    python3 txttojson.py -f ./"$atom"/basis/"$b" --atomname "$atom" --basisname "$b" --outfilename "$atom"_"$i".json
    i=$((i+1))
  done

  for b in $(ls ./"$atom"/fitt)
  do
    python3 txttojson.py -f ./"$atom"/fitt/"$b" -t --atomname "$atom" --basisname "$b" --outfilename "$atom"_"$i".json
    i=$((i+1))
  done

done
