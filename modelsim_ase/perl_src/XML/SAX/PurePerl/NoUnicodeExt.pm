# $Id: //dvt/mti/rel/6.5b/src/misc/perl_src/XML/SAX/PurePerl/NoUnicodeExt.pm#1 $

package XML::SAX::PurePerl;
use strict;

sub chr_ref {
    my $n = shift;
    if ($n < 0x80) {
        return chr ($n);
    }
    elsif ($n < 0x800) {
        return pack ("CC", (($n >> 6) | 0xc0), (($n & 0x3f) | 0x80));
    }
    elsif ($n < 0x10000) {
        return pack ("CCC", (($n >> 12) | 0xe0), ((($n >> 6) & 0x3f) | 0x80),
                                    (($n & 0x3f) | 0x80));
    }
    elsif ($n < 0x110000)
    {
        return pack ("CCCC", (($n >> 18) | 0xf0), ((($n >> 12) & 0x3f) | 0x80),
        ((($n >> 6) & 0x3f) | 0x80), (($n & 0x3f) | 0x80));
    }
    else {
        return undef;
    }
}

1;
