use strict;
use warnings;
use File::Spec;
use File::Basename 'dirname';

use lib (
    File::Spec->catdir(dirname(__FILE__)), 
    File::Spec->catdir(dirname(__FILE__), '..', 'lib'), 
);
use TestApp;

TestApp->run({
    view => {
        class        => 'MicroTemplate',
        include_path => [File::Spec->catdir(dirname(__FILE__))],
    }
});

