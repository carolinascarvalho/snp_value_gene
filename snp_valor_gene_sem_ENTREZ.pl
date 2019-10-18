open (my $file1, "<", $ARGV[0]) or die "Nao foi possivel abrir o arquivo $ARGV[0]"; # This line open the annotation file
while ($L = <$file1>){ 
	chomp $L;
	@tmp = split(/\t/, $L); #This line separe the columns of the annotation file without separate the pathways compounds
	$snp{$tmp[0]} = $tmp[2]; 
}

close($file1);

open (my $file2, "<", $ARGV[1]) or die "Nao foi possivel abrir o arquivo $ARGV[1]";
open (my $file3, ">", $ARGV[2]) or die "Nao foi possivel abrir o arquivo $ARGV[2]"; 
while ($L = <$file2>){ 
	chomp $L;
	@tmp = split(/\t/, $L); #This line separe the columns of the annotation file without separate the pathways compounds
	if (exists($snp{$tmp[2]})){
		print $file3 $tmp[2]."\t".$tmp[9]."\t".$snp{$tmp[2]}."\n";
	}
}

close($file2);
close($file3);
