#!/bin/sh

if [ -f index.html ]; then
    aws s3 sync . s3://glenc.co \
        --exclude "*.*" \
        --include "*.html" \
        --include "*.css" \
        --delete \
        --acl public-read \
        --cache-control "max-age=60"
else
    echo "You're not in the right directory"
    exit
fi
