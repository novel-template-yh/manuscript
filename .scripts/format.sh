#!/bin/sh


for file in ./manuscripts/*; do
    input=$file
    output_extends=".o"
    output=$file$output_extends

    cat $input |
    sed -e '/^%/!s/\(.*\)%.*/\1/g' |
    sed -e 's/%.*$/%comment/g' | sed -z 's/%comment\n//g' |

    sed -e 's/^$/\n　/g' |
    sed -z 's/　\n/　/g' |
    sed -z 's/\n//g' |
    sed -z 's/　/\n　/g' |
    sed -e 's/　\\/\\/g' |

    sed -e 's/\\section{\(.*\)}/# \1\n/g' |
    sed -e 's/\\section\*{\(.*\)}/# \1\n/g' |
    sed -e 's/\\subsection{\(.*\)}/## \1\n/g' |
    sed -e 's/\\subsection\*{\(.*\)}/## \1\n/g' |
    sed -e 's/\\scene/\n   ◇◆◇\n/g' |
    sed -e 's/\\clearpage/\n---------\n/g' |
    sed -e 's/\\ltjruby{\(.*\)}{\(.*\)}/｜\1《\2》/g' |
    sed -e 's/\\\\/\n/g' |

    sed -z 's/！\n/！/g' |
    sed -z 's/？\n/？/g' |

    sed -z 's/\n　「/\n「/g' |
    sed -z 's/\n　『/\n『/g' |
    sed -z 's/\n　（/\n（/g' |
    sed -z 's/\n　〝/\n〝/g' |

    sed -e 's/^　$//g' > $output
done
