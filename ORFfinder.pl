#!data/data/com.termux/files/usr/bin/perl 

print "Input Sequenz: ";
$seq = <STDIN>;
chomp $seq;

sub checkFrame {
  if(@_[0]%(@_[1]-1)) {
    return 0;
  }
  else {
    return 1;
  }
}

sub matchTriplet {
  my ($regex, $string) = @_;
  my @ret;
  while ($string =~ /($regex)/g) {
      push @ret, pos($string) - length $1;
  }
  return @ret
}

@startCodons = matchTriplet("atg", $seq);
@stopCodons = matchTriplet("taa", $seq);

print "Start: ", @startCodons,"\n";
print "Stop: ", @stopCodons, "\n";

