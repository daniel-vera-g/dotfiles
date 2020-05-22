#!/usr/bin/perl -w
use strict;

my $device = '38:18:4C:7C:99:1E';

my $index = pacmd_index( $device );
command( "pacmd set-card-profile $index off" );
command( "bluetoothctl disconnect '$device'" );
command( "bluetoothctl connect '$device'" );
$index = pacmd_index( $device );
command( "pacmd set-card-profile $index a2dp_sink" );
exit( 0 );

sub command {
	my $command = shift;
	print $command, "\n";
	system( $command );
}

sub pacmd_index {
	my $device = shift;
	my $index = 0;
	foreach my $line ( split( /\n/, `pacmd list-cards` ) ) {
		$line =~ /index: (\d+)/i and $index = $1;
		index( $line, $device ) > -1 and return $index;
	}
	die "Device $device not found.\n";
}

