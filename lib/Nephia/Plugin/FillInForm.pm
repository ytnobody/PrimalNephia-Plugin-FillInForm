package Nephia::Plugin::FillInForm;
use 5.008005;
use strict;
use warnings;
use HTML::FillInForm;
use Nephia::DSLModifier;

our $VERSION = "0.02";
our $RENDERER = origin 'render';

around render => sub {
    my ($response, $orig) = @_;
    my $req    = origin('req')->();
    my $res    = $orig->($response);
    my $body   = $res->[2][0];
    my $params = $req->parameters->as_hashref;
    $res->[2][0] = HTML::FillInForm->fill(\$body, $params);
    return $res;
};

sub suppress_fillin ($) {
    my $params = shift;
    return $RENDERER->($params);
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

