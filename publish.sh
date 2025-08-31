#!/bin/sh

if [ -f index.html ]; then
    aws s3 sync . s3://glenc.xyz \
        --exclude "*.*" \
        --include "*.html" \
	--include "*.jpg" \
        --include "*.css" \
        --delete \
        --acl public-read \
        --cache-control "max-age=60"
else
    echo "You're not in the right directory"
    exit
fi
