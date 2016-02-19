use strict;
use warnings;

open(FILE,"/home3/rnaseq-shared/Miguel/01_Bowtie/file.list.txt") or die;
while(<FILE>){
	chomp;
	my $name = $_;
	open(OUT,">$name.sh") or die;
	print OUT "#!/bin/bash\n";
	print OUT "samtools view -b -F 1548 -q 30 /home3/rnaseq-shared/Miguel/01_Bowtie/$name | bamToBed -i stdin | awk 'BEGIN{FS=\"\\t\";OFS=\"\\t\"}{\$4=\"N\"; print \$0}' | gzip -c >/home3/rnaseq-shared/Miguel/01_Bowtie/$name.tagAlign.gz";
	print $name; 
	close OUT;
}
close FILE;
