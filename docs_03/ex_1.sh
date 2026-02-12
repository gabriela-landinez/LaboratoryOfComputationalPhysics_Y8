#!/bin/bash

# 1a

mkdir /home/gaby/Documents/PoD/CP/LaboratoryOfComputationalPhysics_Y8/docs_03/students
cd /home/gaby/Documents/PoD/CP/LaboratoryOfComputationalPhysics_Y8/docs_03/students

if [ ! -f "./LCP_22-23_students.csv?rlkey=47fakvatrtif3q3qw4q97p5b7" ]
then
    echo "the file does not exist"
    wget "https://www.dropbox.com/scl/fi/bxv17nrbrl83vw6qrkiu9/LCP_22-23_students.csv?rlkey=47fakvatrtif3q3qw4q97p5b7"
else
    echo "the file already exists"
    #more "LCP_22-23_students.csv?rlkey=47fakvatrtif3q3qw4q97p5b7"
fi

# 1b

ORIGINAL_FILE="LCP_22-23_students.csv?rlkey=47fakvatrtif3q3qw4q97p5b7"
# students belonging to PoD
grep "PoD" "$ORIGINAL_FILE" > pod_students.csv
# students belonging to Physics
grep "Physics" "$ORIGINAL_FILE" > physics_students.csv
echo "Two new files have been created"

# 1c

#tail -n +2 "$ORIGINAL_FILE" > solo_datos.tmp
#sed '1d' "$ORIGINAL_FILE" > solo_datos.tmp
#cut -d ',' -f 1 solo_datos.tmp > solo_apellidos.tmp
#cut -c 1 solo_apellidos.tmp > solo_letras.tmp
#sort solo_letras.tmp > letras_ordenadas.tmp
#uniq -c letras_ordenadas.tmp > contador_letras.txt
sed '1d' "$ORIGINAL_FILE" | cut -d ',' -f 1 | cut -c 1 | uniq -c  > contador_letras.txt
echo "The student count by surname initial has been saved to contador_letras.txt"

# 1d
echo "The letter with most counts is"
sort -nr contador_letras.txt | head -n 1

#1e

STUDENTS_DIR="/home/gaby/Documents/PoD/CP/LaboratoryOfComputationalPhysics_Y8/docs_03/students"
contador=0
sed '1d' "$ORIGINAL_FILE" | while read -r line
do
    grupo=$(( contador % 18 ))
    echo "$linea" >> "${STUDENTS_DIR}/grupo_${grupo}.csv"

    contador=$(( contador + 1 ))

done
echo "The students are now divided into 18 groups"

