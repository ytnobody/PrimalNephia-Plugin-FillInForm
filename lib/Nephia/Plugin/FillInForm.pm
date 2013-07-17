package Nephia::Plugin::FillInForm;
use 5.008005;
use strict;
use warnings;
use HTML::FillInForm;
use Nephia::Request;

our $VERSION = "0.04";

our @EXPORT = qw/ suppress_fillin /;

sub process_env {
    my $env = shift;
    my $req = Nephia::Request->new($env);
    context(req => $req);
    return $env;
}

sub process_content {
    my $raw_content = shift;
    my $content;
    unless ( my $is_suppress = context('suppress_fillin') ) {
        my $req     = context('req');
        my $params  = $req->parameters->as_hashref;
        $content = HTML::FillInForm->fill(\$raw_content, $params);
    }
    return $content || $raw_content;
}

sub suppress_fillin ($) {
    my $params = shift;
    context(suppress_fillin => 1);
    return $params;
}

1;
__END__

=encoding utf-8

=head1 NAME

Nephia::Plugin::FillInForm - Nephia plugin that provides automated fill-in-form feature

=head1 SYNOPSIS

    use Nephia plugin => ['FillInForm'];
    path '/' => sub {
        +{
            template => 'form.html',
        };
    };
    
    # To suppress fillin, use "suppress_fillin DSL"
    path '/no_fillin' => sub {
        suppress_fillin +{
            template => 'no_fillin_form.html',
        };
    };

=head1 COMMAND

=head2 suppress_fillin

Suppress fill-in-form feature when rendering.

=head1 LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

ytnobody E<lt>ytnobody@gmail.comE<gt>

=cut

