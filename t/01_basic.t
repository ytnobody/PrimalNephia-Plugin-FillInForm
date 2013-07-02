use strict;
use warnings;
use Test::More;
use Plack::Test;
use Plack::Util;
use File::Spec;
use File::Basename 'dirname';
use HTTP::Request::Common;
use URI;

my $psgi = File::Spec->catfile(dirname(__FILE__), 'test.psgi');
my $app = Plack::Util::load_psgi($psgi);

test_psgi $app, sub {
    my $cb = shift;
    my $uri = URI->new('/'); 
    $uri->query_form(name => 'ytnobody', message => 'ohayoujo!');
    my $res = $cb->(GET $uri->as_string);
    like $res->content, qr/<input(?: (?:value="ytnobody"|name="name")){2}><input(?: (?:value="ohayoujo!"|name="message")){2}>/;
};

test_psgi $app, sub {
    my $cb = shift;
    my $uri = URI->new('/suppress'); 
    $uri->query_form(name => 'ytnobody', message => 'ohayoujo!');
    my $res = $cb->(GET $uri->as_string);
    like $res->content, qr|<input name="name"><input name="message">|;
};

done_testing;

1;
