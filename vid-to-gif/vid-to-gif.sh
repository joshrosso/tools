#!/bin/sh

# source: https://superuser.com/a/556031
# pumps ffmpeg output into image2pipe and create a lowish quality,
# but small in size, gif.
ffmpeg -i icon.mp4 \
    -vf "fps=10,scale=800:-1:flags=lanczos" \
    -c:v pam \
    -f image2pipe - | \
    convert -delay 10 - \
    -loop 0 -layers \
    optimize output.gif
