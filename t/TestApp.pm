package TestApp;
use strict;
use warnings;
use utf8;
use Nephia plugins => ['FillInForm'];

path '/' => sub {
    { template => 'test.html' };
};

path '/suppress' => sub {
    suppress_fillin { template => 'test.html' };
};

1;
