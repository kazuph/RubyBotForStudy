#!/usr/bin/env perl
use strict;
use warnings;

use utf8;
use Net::Twitter;
use DateTime::Format::Strptime;

my $handle = Net::Twitter->new({
    traits => [qw/OAuth API::REST API::Search/],
    consumer_key => "lnnjDg4UrOYQpL2iq56Q",
    consumer_secret => "EJnJxZGozCFp6Iwui8pJyhPg7gCyeQbHUxzWZMdvR4",
    access_token => "130326102-GBuxOMcO54I3dmvg0PnIuEL6bhny3rbovb8Hyrsb",
    access_token_secret => "cqJhMIQmwN0OMUel4u8sgz7WVVFMwlZTQuiRmdnSa1w"
});

my $ret = $handle->update({status=>"ぺろぺろ"});
print "Cannot post!!" unless $ret;
