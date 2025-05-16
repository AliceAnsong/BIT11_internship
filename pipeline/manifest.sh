 #!/usr/bin/env 

for i in $(ls results/EHdn_prep/str-profiles/); 
do 
    FILE=results/EHdn_prep/str-profiles/$i
    SAMPLE=$(echo "$i" | sed -E 's/^(.*)\.str_profile\.json$/\1/')
    echo -e "$SAMPLE\tcase\t$FILE" >> "results/EHdn_prep/manifest.tsv"
done 
