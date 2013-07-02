requires 'perl', '5.008001';
requires 'HTML::FillInForm' , '0';
requires 'Nephia'           , '0.22';
requires 'Nephia::DSLModifier';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

