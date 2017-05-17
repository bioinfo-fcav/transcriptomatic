#!/bin/bash

# input - diretório contendo os arquivos de entrada no formato .fastq
input=$1

# as linhas que iniciam com cerquilha são comentários

if [ ! ${input} ]
then   
        echo "Missing input directory"
        exit
else   
        if [ ! -d ${input} ]
        then   
                echo "Wrong input directory ${input}"
                exit
        fi
fi

# num_threads - inteiro com o número de processadores para serem utilizados nos parâmetros dos programas que serão executados a seguir
num_threads=23

###
# Arquivos e diretórios de entrada (input)
#

###
# Arquivos e diretórios de saída (output) 
#

basedir_out="./assembled_nonplants"

renamed_out="${basedir_out}/renamed"
trinity_out="${basedir_out}/trinity"

# Criando diretórios para as saídas dos programas que serão utilizados a seguir

mkdir -p ${renamed_out}

species=()

# percorrendo múltiplos valores retornados por um comando no shell (o comando irá listar todos os arquivos com extensão .fastq do diretório ${input})
for fastq in `ls ${input}/*.fastq`; do
	
	# obtendo nome do arquivo 
	fastqbn=`basename ${fastq}`;
	if [[ ! $fastqbn =~ bad ]]; then
		sp=`echo ${fastqbn} | cut -f 1,2 -d '-' | cut -d '_' -f 1`
		species=($(printf "%s\n" ${species[@]} ${sp} | sort -u ))
	fi

done


for sp in ${species[@]}; do

	left=()
	left_singleton=()
	right=()
	right_singleton=()

	echo "Assembling ${sp} ..."

	trinity_species_out="${trinity_out}_${sp}"
	mkdir -p ${trinity_species_out}

	for fastq in `ls ${input}/${sp}*.fastq`; do
		# obtendo nome do arquivo 
		fastqbn=`basename ${fastq}`;
		if [[ ! $fastqbn =~ bad ]]; then
			renamed_fastq="${renamed_out}/${fastqbn}"
			sp=`echo ${fastqbn} | cut -f 1 -d '-'`
			species=($(printf "%s\n" ${species[@]} ${sp} | sort -u ))
			if [ ! -e ${renamed_fastq} ]; then
				echo "Renaming ${fastqbn} ..."
				if [[ ${fastqbn} =~ _1 ]]; then
#					awk '{ if (NR%4==1) { print $1"/1" } else { print } }' ${fastq} > ${renamed_fastq}
					awk '{ if (NR%4==1) { print $1 } else { print } }' ${fastq} > ${renamed_fastq}
				elif [[ ${fastqbn} =~ _2 ]]; then
#					awk '{ if (NR%4==1) { print $1"/2" } else { print } }' ${fastq} > ${renamed_fastq}
					awk '{ if (NR%4==1) { print $1 } else { print } }' ${fastq} > ${renamed_fastq}
				elif [[ ${fastqbn} =~ _0 ]]; then
					echo "   Sigleton found!"
				else
					echo "Not found read pair info in ${fastqbn}"
					exit
				fi
			fi

			if [[ ${fastqbn} =~ _1 ]]; then
				if [[ ${fastqbn} =~ singleton ]]; then
					left_singleton=($(printf "%s\n" ${left_singleton[@]} ${renamed_fastq} | sort -u ))
				else
					left=($(printf "%s\n" ${left[@]} ${renamed_fastq}  | sort -u ))
				fi
			elif [[ ${fastqbn} =~ _2 ]]; then
				if [[ ${fastqbn} =~ singleton ]]; then
					right_singleton=($(printf "%s\n" ${right_singleton[@]} ${renamed_fastq}  | sort -u ))
				else
					right=($(printf "%s\n" ${right[@]} ${renamed_fastq}  | sort -u ))
				fi
			elif [[ ${fastqbn} =~ _0 ]]; then
				echo "   Sigleton found!"
			else
				echo "Not found read pair info in ${fastqbn}"
				exit
			fi

		fi
	done
	
	if [ ! -e ${trinity_species_out}/Trinity.fasta ]; then
		Trinity --KMER_SIZE 27 --SS_lib_type RF --output ${trinity_species_out} --seqType fq --max_memory 160G --CPU 23 --left $(IFS=, ; echo "${left[*]},${left_singleton[*]}") --right $(IFS=, ; echo "${right[*]},${right_singleton[*]}") &> ${trinity_species_out}/Trinity.log.txt
	fi
done

