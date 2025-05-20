 #!/usr/bin/env

for i in $(ls results/EHdn_prep/str-profiles/*.json); 
do 
    SAMPLE=$(basename "$i" | sed -E 's/^(.*)\.str_profile\.json$/\1/')
    echo -e "$SAMPLE\tcase\t$i" >> "results/EHdn_prep/manifest.tsv"
done 