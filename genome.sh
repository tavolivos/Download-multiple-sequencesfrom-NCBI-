#This is a bash-script to download multiple sequences from NCBI
#Writen by Gustavo Olivos (tavolivos@gmail.com)
#Replace the genus here  i=genus
#pip install ncbi-genome-download
i="Anabaena"
ncbi-genome-download --format fasta --genus $i bacteria
mv refseq/bacteria/GCF_* . && rm -r refseq
for d in GCF*/; do
    cd $d && gzip -d *.gz && cd ..;
done
for d in GCF*/; do
    cd $d && mv *.fna ../ && cd ..;
done
rm -r GCF*/
echo 'All sequences have been downloaded'


