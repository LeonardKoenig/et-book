#! /bin/sh

# Required tools:
# * Perl with: https://metacpan.org/pod/Mac::AppleSingleDouble
# * Fondu: http://fondu.sourceforge.net/

# See https://github.com/edwardtufte/et-book/issues/1#issuecomment-733080737

set -e

originals=$1

if [ -z "$originals" ]; then
    printf "Please pass the originals.zip as first argument\n" >&2
    exit 1
fi

rm -f et-book*
rm -rf originals __MACOSX
unzip $originals
pushd originals
rm -f *
find ../__MACOSX/originals -type f -not -name '*.rsrc' -exec \
    perl -MMac::AppleSingleDouble -e \
        'for(@ARGV) {
            $a = new Mac::AppleSingleDouble($_);
            if(open $f, ">", $_.".rsrc") {
                print STDERR "Converting from Apple Double", $_, "\n";
                binmode $f;
                print $f $a->get_entry(2);
                close $f;
            }
        }' {} \;
find ../__MACOSX/originals -type f -name '*.rsrc' -exec \
    /bin/sh -c 'printf "Extracting $1\n" >&2; fondu -afm $1' '/bin/sh' {} \;
popd
rm -rf __MACOSX
