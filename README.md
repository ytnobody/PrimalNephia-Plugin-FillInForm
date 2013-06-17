# NAME

Nephia::Plugin::FillInForm - It's new $module

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

# DESCRIPTION

Nephia::Plugin::FillInForm is ...

# LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

ytnobody <ytnobody@gmail.com>
