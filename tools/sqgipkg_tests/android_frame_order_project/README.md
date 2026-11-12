# Android frame presentation regression

This native GTK fixture displays independent 16-bit frame counters in a
`GtkGLArea` and a `GtkPicture` containing freshly allocated CPU pixels. Label
updates exercise partial damage between image updates. It isolates presentation
from Squirrel, video decoding and GWorldScene.

Build and launch from this directory with a prepared Android toolchain:

```sh
sqgipkg build --platform android --arch x86_64
sqgipkg deploy --platform android --arch x86_64 --serial emulator-5564
```

Record the **host emulator window**, including the complete tablet display, for
at least 25 seconds. On X11, find its child window ID with `xwininfo -root -tree`
and pass it to FFmpeg (replace `WINDOW_ID`):

```sh
ffmpeg -f x11grab -window_id WINDOW_ID -framerate 60 -draw_mouse 0 \
  -i "$DISPLAY" -t 25 -c:v libx264 -preset ultrafast -crf 18 frame-order.mp4
python3 check_video.py frame-order.mp4
```

The checker locates both bars, requires advancing counters and fails if either
counter moves backwards. Use a landscape 16:10 tablet display, such as 1920×1200
at 240 dpi, and capture the display without emulator controls or window borders.

Emulator 37.2.13 with host composition on an NVIDIA RTX 3090 reproduced backwards
CPU frames even when a simultaneous Android `screenrecord` stayed in order.
Repeating with `-feature -HostComposition` eliminated the backwards frames while
retaining GPU acceleration. `sqgipkg emulator` supplies this setting. Android
screen recordings alone are insufficient to check this regression.
