use Test::More 'no_plan';
use Number::Fraction ':constants';

my $fract = undef;

$fract = eval { Number::Fraction->new(3.0 , 4) };
cmp_ok($fract, 'eq' , '3/4', "fraction from round decimal numinator as number"); 

$fract = eval {Number::Fraction->new(3 , 4.0) };
cmp_ok($fract, 'eq' , '3/4', "fraction from round decimal denominator as number");

$fract = eval {Number::Fraction->new('3', '4' ) };
ok($@, "fraction from two healty strings not supported, use numbers instead");

$fract = eval {Number::Fraction->new('3.0', '4' ) };
ok($@, "fraction from round decimal numinator as string not supported");

$fract = eval {Number::Fraction->new('3' , '4.0') };
ok($@, "fraction from round decimal denominator as string not supported");

$fract = eval {Number::Fraction->new(3.5, 4 ) };
ok($@, "Numinator can\'t be a decimal");

$fract = eval {Number::Fraction->new(3 , 4.5) };
ok($@, "Denominator can\'t be a decimal");

