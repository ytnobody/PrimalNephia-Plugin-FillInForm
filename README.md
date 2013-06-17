# NAME

Nephia::Plugin::FillInForm - Nephia plugin that provides automated fill-in-form feature

# SYNOPSIS

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

# COMMAND

## suppress\_fillin

Suppress fill-in-form feature when rendering.

# LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

ytnobody <ytnobody@gmail.com>
