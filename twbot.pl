#!/usr/bin/env perl
use strict;
use warnings;

use utf8;
use Net::Twitter;
use DateTime::Format::Strptime;

my $handle = Net::Twitter->new({
    traits => [qw/OAuth API::REST API::Search/],
    consumer_key => "",
    consumer_secret => "",
    access_token => "",
    access_token_secret => ""
});

my $ret = $handle->update({status=>"ぺろぺろ"});
print "Cannot post!!" unless $ret;
