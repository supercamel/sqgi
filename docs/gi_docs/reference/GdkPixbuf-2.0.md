# GdkPixbuf 2.0

SQGI import: `import("GdkPixbuf", "2.0")`

Packages: `gdk-pixbuf-2.0`
Includes: `GModule-2.0`, `Gio-2.0`
Libraries: `libgdk_pixbuf-2.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 7 |
| Interfaces | 0 |
| Records | 7 |
| Unions | 0 |
| Enums | 5 |
| Flags | 1 |
| Functions | 1 |
| Callbacks | 16 |
| Constants | 4 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Pixbuf | GObject.Object | 0 | 0 | 65 | A pixel buffer. `GdkPixbuf` contains information about an image's pixel data, its color space, bits per sample, width and height, and the rowstride... |
| PixbufAnimation | GObject.Object | 2 | 0 | 12 | An opaque object representing an animation. The GdkPixBuf library provides a simple mechanism to load and represent animations. An animation is con... |
| PixbufAnimationIter | GObject.Object | 1 | 0 | 4 | An opaque object representing an iterator which points to a certain position in an animation. |
| PixbufLoader | GObject.Object | 0 | 4 | 10 | Incremental image loader. `GdkPixbufLoader` provides a way for applications to drive the process of loading an image, by letting them send the imag... |
| PixbufNonAnim | PixbufAnimation | 0 | 0 | 1 |  |
| PixbufSimpleAnim | PixbufAnimation | 0 | 0 | 4 | An opaque struct representing a simple animation. |
| PixbufSimpleAnimIter | PixbufAnimationIter | 0 | 0 | 0 |  |

### GdkPixbuf.Pixbuf

Parent: `GObject.Object` ?? Implements: `Gio.Icon`, `Gio.LoadableIcon` ?? GType: `GdkPixbuf` ?? C type: `GdkPixbuf`

A pixel buffer. `GdkPixbuf` contains information about an image's pixel data, its color space, bits per sample, width and height, and the rowstride...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Pixbuf.new(colorspace: Colorspace, has_alpha: gboolean, bits_per_sample: gint, width: gint, height: gint) -> Pixbuf` | gdk_pixbuf_new |  | Creates a new `GdkPixbuf` structure and allocates a buffer for it. If the allocation of the buffer failed, this function will return `NULL`. The bu... |
| new_from_bytes | `Pixbuf.new_from_bytes(data: GLib.Bytes, colorspace: Colorspace, has_alpha: gboolean, bits_per_sample: gint, width: gint, height: gint, rowstride: gint) -> Pixbuf` | gdk_pixbuf_new_from_bytes | 2.32 | Creates a new #GdkPixbuf out of in-memory readonly image data. Currently only RGB images with 8 bits per sample are supported. This is the `GBytes`... |
| new_from_data | `Pixbuf.new_from_data(data: guint8, colorspace: Colorspace, has_alpha: gboolean, bits_per_sample: gint, width: gint, height: gint, rowstride: gint, destroy_fn: PixbufDestroyNotify?, destroy_fn_data: gpointer?) -> Pixbuf` | gdk_pixbuf_new_from_data |  | Creates a new #GdkPixbuf out of in-memory image data. Currently only RGB images with 8 bits per sample are supported. Since you are providing a pre... |
| new_from_file | `Pixbuf.new_from_file(filename: filename) -> Pixbuf throws` | gdk_pixbuf_new_from_file |  | Creates a new pixbuf by loading an image from a file. The file format is detected automatically. If `NULL` is returned, then @error will be set. Po... |
| new_from_file_at_scale | `Pixbuf.new_from_file_at_scale(filename: filename, width: gint, height: gint, preserve_aspect_ratio: gboolean) -> Pixbuf throws` | gdk_pixbuf_new_from_file_at_scale | 2.6 | Creates a new pixbuf by loading an image from a file. The file format is detected automatically. If `NULL` is returned, then @error will be set. Po... |
| new_from_file_at_size | `Pixbuf.new_from_file_at_size(filename: filename, width: gint, height: gint) -> Pixbuf throws` | gdk_pixbuf_new_from_file_at_size | 2.4 | Creates a new pixbuf by loading an image from a file. The file format is detected automatically. If `NULL` is returned, then @error will be set. Po... |
| new_from_inline | `Pixbuf.new_from_inline(data_length: gint, data: guint8, copy_pixels: gboolean) -> Pixbuf throws` | gdk_pixbuf_new_from_inline |  | Creates a `GdkPixbuf` from a flat representation that is suitable for storing as inline data in a program. This is useful if you want to ship a pro... |
| new_from_resource | `Pixbuf.new_from_resource(resource_path: utf8) -> Pixbuf throws` | gdk_pixbuf_new_from_resource | 2.26 | Creates a new pixbuf by loading an image from an resource. The file format is detected automatically. If `NULL` is returned, then @error will be set. |
| new_from_resource_at_scale | `Pixbuf.new_from_resource_at_scale(resource_path: utf8, width: gint, height: gint, preserve_aspect_ratio: gboolean) -> Pixbuf throws` | gdk_pixbuf_new_from_resource_at_scale | 2.26 | Creates a new pixbuf by loading an image from an resource. The file format is detected automatically. If `NULL` is returned, then @error will be se... |
| new_from_stream | `Pixbuf.new_from_stream(stream: Gio.InputStream, cancellable: Gio.Cancellable?) -> Pixbuf throws` | gdk_pixbuf_new_from_stream | 2.14 | Creates a new pixbuf by loading an image from an input stream. The file format is detected automatically. If `NULL` is returned, then `error` will ... |
| new_from_stream_at_scale | `Pixbuf.new_from_stream_at_scale(stream: Gio.InputStream, width: gint, height: gint, preserve_aspect_ratio: gboolean, cancellable: Gio.Cancellable?) -> Pixbuf throws` | gdk_pixbuf_new_from_stream_at_scale | 2.14 | Creates a new pixbuf by loading an image from an input stream. The file format is detected automatically. If `NULL` is returned, then @error will b... |
| new_from_stream_finish | `Pixbuf.new_from_stream_finish(async_result: Gio.AsyncResult) -> Pixbuf throws` | gdk_pixbuf_new_from_stream_finish | 2.24 | Finishes an asynchronous pixbuf creation operation started with gdk_pixbuf_new_from_stream_async(). |
| new_from_xpm_data | `Pixbuf.new_from_xpm_data(data: utf8) -> Pixbuf` | gdk_pixbuf_new_from_xpm_data |  | Creates a new pixbuf by parsing XPM data in memory. This data is commonly the result of including an XPM file into a program's C source. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| calculate_rowstride | `calculate_rowstride(colorspace: Colorspace, has_alpha: gboolean, bits_per_sample: gint, width: gint, height: gint) -> gint` | gdk_pixbuf_calculate_rowstride | 2.36.8 | Calculates the rowstride that an image created with those values would have. This function is useful for front-ends and backends that want to check... |
| get_file_info | `get_file_info(filename: filename, width: out gint?, height: out gint?) -> PixbufFormat` | gdk_pixbuf_get_file_info | 2.4 | Parses an image file far enough to determine its format and size. |
| get_file_info_async | `get_file_info_async(filename: filename, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gdk_pixbuf_get_file_info_async | 2.32 | Asynchronously parses an image file far enough to determine its format and size. For more details see gdk_pixbuf_get_file_info(), which is the sync... |
| get_file_info_finish | `get_file_info_finish(async_result: Gio.AsyncResult, width: out gint, height: out gint) -> PixbufFormat throws` | gdk_pixbuf_get_file_info_finish | 2.32 | Finishes an asynchronous pixbuf parsing operation started with gdk_pixbuf_get_file_info_async(). |
| get_formats | `get_formats() -> GLib.SList` | gdk_pixbuf_get_formats | 2.2 | Obtains the available information about the image formats supported by GdkPixbuf. |
| init_modules | `init_modules(path: utf8) -> gboolean throws` | gdk_pixbuf_init_modules | 2.40 | Initalizes the gdk-pixbuf loader modules referenced by the `loaders.cache` file present inside that directory. This is to be used by applications t... |
| new_from_stream_async | `new_from_stream_async(stream: Gio.InputStream, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gdk_pixbuf_new_from_stream_async | 2.24 | Creates a new pixbuf by asynchronously loading an image from an input stream. For more details see gdk_pixbuf_new_from_stream(), which is the synch... |
| new_from_stream_at_scale_async | `new_from_stream_at_scale_async(stream: Gio.InputStream, width: gint, height: gint, preserve_aspect_ratio: gboolean, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gdk_pixbuf_new_from_stream_at_scale_async | 2.24 | Creates a new pixbuf by asynchronously loading an image from an input stream. For more details see gdk_pixbuf_new_from_stream_at_scale(), which is ... |
| save_to_stream_finish | `save_to_stream_finish(async_result: Gio.AsyncResult) -> gboolean throws` | gdk_pixbuf_save_to_stream_finish | 2.24 | Finishes an asynchronous pixbuf save operation started with gdk_pixbuf_save_to_stream_async(). |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_alpha | `Pixbuf.add_alpha(substitute_color: gboolean, r: guint8, g: guint8, b: guint8) -> Pixbuf` | gdk_pixbuf_add_alpha |  | Takes an existing pixbuf and adds an alpha channel to it. If the existing pixbuf already had an alpha channel, the channel values are copied from t... |
| apply_embedded_orientation | `Pixbuf.apply_embedded_orientation() -> Pixbuf` | gdk_pixbuf_apply_embedded_orientation | 2.12 | Takes an existing pixbuf and checks for the presence of an associated "orientation" option. The orientation option may be provided by the JPEG load... |
| composite | `Pixbuf.composite(dest: Pixbuf, dest_x: gint, dest_y: gint, dest_width: gint, dest_height: gint, offset_x: gdouble, offset_y: gdouble, scale_x: gdouble, scale_y: gdouble, interp_type: InterpType, overall_alpha: gint) -> none` | gdk_pixbuf_composite |  | Creates a transformation of the source image @src by scaling by @scale_x and @scale_y then translating by @offset_x and @offset_y. This gives an im... |
| composite_color | `Pixbuf.composite_color(dest: Pixbuf, dest_x: gint, dest_y: gint, dest_width: gint, dest_height: gint, offset_x: gdouble, offset_y: gdouble, scale_x: gdouble, scale_y: gdouble, interp_type: InterpType, overall_alpha: gint, check_x: gint, check_y: gint, check_size: gint, color1: guint32, color2: guint32) -> none` | gdk_pixbuf_composite_color |  | Creates a transformation of the source image @src by scaling by @scale_x and @scale_y then translating by @offset_x and @offset_y, then alpha blend... |
| composite_color_simple | `Pixbuf.composite_color_simple(dest_width: gint, dest_height: gint, interp_type: InterpType, overall_alpha: gint, check_size: gint, color1: guint32, color2: guint32) -> Pixbuf` | gdk_pixbuf_composite_color_simple |  | Creates a new pixbuf by scaling `src` to `dest_width` x `dest_height` and alpha blending the result with a checkboard of colors `color1` and `color2`. |
| copy | `Pixbuf.copy() -> Pixbuf` | gdk_pixbuf_copy |  | Creates a new `GdkPixbuf` with a copy of the information in the specified `pixbuf`. Note that this does not copy the options set on the original `G... |
| copy_area | `Pixbuf.copy_area(src_x: gint, src_y: gint, width: gint, height: gint, dest_pixbuf: Pixbuf, dest_x: gint, dest_y: gint) -> none` | gdk_pixbuf_copy_area |  | Copies a rectangular area from `src_pixbuf` to `dest_pixbuf`. Conversion of pixbuf formats is done automatically. If the source rectangle overlaps ... |
| copy_options | `Pixbuf.copy_options(dest_pixbuf: Pixbuf) -> gboolean` | gdk_pixbuf_copy_options | 2.36 | Copies the key/value pair options attached to a `GdkPixbuf` to another `GdkPixbuf`. This is useful to keep original metadata after having manipulat... |
| fill | `Pixbuf.fill(pixel: guint32) -> none` | gdk_pixbuf_fill |  | Clears a pixbuf to the given RGBA value, converting the RGBA value into the pixbuf's pixel format. The alpha component will be ignored if the pixbu... |
| flip | `Pixbuf.flip(horizontal: gboolean) -> Pixbuf` | gdk_pixbuf_flip | 2.6 | Flips a pixbuf horizontally or vertically and returns the result in a new pixbuf. |
| get_bits_per_sample | `Pixbuf.get_bits_per_sample() -> gint` | gdk_pixbuf_get_bits_per_sample |  | Queries the number of bits per color sample in a pixbuf. |
| get_byte_length | `Pixbuf.get_byte_length() -> gsize` | gdk_pixbuf_get_byte_length | 2.26 | Returns the length of the pixel data, in bytes. |
| get_colorspace | `Pixbuf.get_colorspace() -> Colorspace` | gdk_pixbuf_get_colorspace |  | Queries the color space of a pixbuf. |
| get_has_alpha | `Pixbuf.get_has_alpha() -> gboolean` | gdk_pixbuf_get_has_alpha |  | Queries whether a pixbuf has an alpha channel (opacity information). |
| get_height | `Pixbuf.get_height() -> gint` | gdk_pixbuf_get_height |  | Queries the height of a pixbuf. |
| get_n_channels | `Pixbuf.get_n_channels() -> gint` | gdk_pixbuf_get_n_channels |  | Queries the number of channels of a pixbuf. |
| get_option | `Pixbuf.get_option(key: utf8) -> utf8` | gdk_pixbuf_get_option |  | Looks up @key in the list of options that may have been attached to the @pixbuf when it was loaded, or that may have been attached by another funct... |
| get_options | `Pixbuf.get_options() -> GLib.HashTable` | gdk_pixbuf_get_options | 2.32 | Returns a `GHashTable` with a list of all the options that may have been attached to the `pixbuf` when it was loaded, or that may have been attache... |
| get_pixels | `Pixbuf.get_pixels() -> guint8` | gdk_pixbuf_get_pixels |  | Queries a pointer to the pixel data of a pixbuf. This function will cause an implicit copy of the pixbuf data if the pixbuf was created from read-o... |
| get_pixels_with_length | `Pixbuf.get_pixels_with_length(length: out guint) -> guint8` | gdk_pixbuf_get_pixels_with_length | 2.26 | Queries a pointer to the pixel data of a pixbuf. This function will cause an implicit copy of the pixbuf data if the pixbuf was created from read-o... |
| get_rowstride | `Pixbuf.get_rowstride() -> gint` | gdk_pixbuf_get_rowstride |  | Queries the rowstride of a pixbuf, which is the number of bytes between the start of a row and the start of the next row. |
| get_width | `Pixbuf.get_width() -> gint` | gdk_pixbuf_get_width |  | Queries the width of a pixbuf. |
| new_subpixbuf | `Pixbuf.new_subpixbuf(src_x: gint, src_y: gint, width: gint, height: gint) -> Pixbuf` | gdk_pixbuf_new_subpixbuf |  | Creates a new pixbuf which represents a sub-region of `src_pixbuf`. The new pixbuf shares its pixels with the original pixbuf, so writing to one af... |
| read_pixel_bytes | `Pixbuf.read_pixel_bytes() -> GLib.Bytes` | gdk_pixbuf_read_pixel_bytes | 2.32 | Provides a #GBytes buffer containing the raw pixel data; the data must not be modified. This function allows skipping the implicit copy that must b... |
| read_pixels | `Pixbuf.read_pixels() -> guint8` | gdk_pixbuf_read_pixels | 2.32 | Provides a read-only pointer to the raw pixel data. This function allows skipping the implicit copy that must be made if gdk_pixbuf_get_pixels() is... |
| ref | `Pixbuf.ref() -> Pixbuf` | gdk_pixbuf_ref |  | Adds a reference to a pixbuf. |
| remove_option | `Pixbuf.remove_option(key: utf8) -> gboolean` | gdk_pixbuf_remove_option | 2.36 | Removes the key/value pair option attached to a `GdkPixbuf`. |
| rotate_simple | `Pixbuf.rotate_simple(angle: PixbufRotation) -> Pixbuf` | gdk_pixbuf_rotate_simple | 2.6 | Rotates a pixbuf by a multiple of 90 degrees, and returns the result in a new pixbuf. If `angle` is 0, this function will return a copy of `src`. |
| saturate_and_pixelate | `Pixbuf.saturate_and_pixelate(dest: Pixbuf, saturation: gfloat, pixelate: gboolean) -> none` | gdk_pixbuf_saturate_and_pixelate |  | Modifies saturation and optionally pixelates `src`, placing the result in `dest`. The `src` and `dest` pixbufs must have the same image format, siz... |
| save | `Pixbuf.save(filename: filename, type: utf8, error: GLib.Error?, ...: void) -> gboolean` | gdk_pixbuf_save |  | Saves pixbuf to a file in format @type. By default, "jpeg", "png", "ico" and "bmp" are possible file formats to save in, but more formats may be in... |
| save_to_buffer | `Pixbuf.save_to_buffer(buffer: out guint8, buffer_size: out gsize, type: utf8, error: GLib.Error?, ...: void) -> gboolean` | gdk_pixbuf_save_to_buffer | 2.4 | Saves pixbuf to a new buffer in format `type`, which is currently "jpeg", "png", "tiff", "ico" or "bmp". This is a convenience function that uses `... |
| save_to_bufferv | `Pixbuf.save_to_bufferv(buffer: out guint8, buffer_size: out gsize, type: utf8, option_keys: utf8?, option_values: utf8?) -> gboolean throws` | gdk_pixbuf_save_to_bufferv | 2.4 | Vector version of `gdk_pixbuf_save_to_buffer()`. Saves pixbuf to a new buffer in format @type, which is currently "jpeg", "tiff", "png", "ico" or "... |
| save_to_callback | `Pixbuf.save_to_callback(save_func: PixbufSaveFunc, user_data: gpointer?, type: utf8, error: GLib.Error?, ...: void) -> gboolean` | gdk_pixbuf_save_to_callback | 2.4 | Saves pixbuf in format `type` by feeding the produced data to a callback. This function can be used when you want to store the image to something o... |
| save_to_callbackv | `Pixbuf.save_to_callbackv(save_func: PixbufSaveFunc, user_data: gpointer?, type: utf8, option_keys: utf8?, option_values: utf8?) -> gboolean throws` | gdk_pixbuf_save_to_callbackv | 2.4 | Vector version of `gdk_pixbuf_save_to_callback()`. Saves pixbuf to a callback in format @type, which is currently "jpeg", "png", "tiff", "ico" or "... |
| save_to_stream | `Pixbuf.save_to_stream(stream: Gio.OutputStream, type: utf8, cancellable: Gio.Cancellable?, error: GLib.Error?, ...: void) -> gboolean` | gdk_pixbuf_save_to_stream | 2.14 | Saves `pixbuf` to an output stream. Supported file formats are currently "jpeg", "tiff", "png", "ico" or "bmp". See `gdk_pixbuf_save_to_buffer()` f... |
| save_to_stream_async | `Pixbuf.save_to_stream_async(stream: Gio.OutputStream, type: utf8, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?, ...: void) -> none` | gdk_pixbuf_save_to_stream_async | 2.24 | Saves `pixbuf` to an output stream asynchronously. For more details see gdk_pixbuf_save_to_stream(), which is the synchronous version of this funct... |
| save_to_streamv | `Pixbuf.save_to_streamv(stream: Gio.OutputStream, type: utf8, option_keys: utf8?, option_values: utf8?, cancellable: Gio.Cancellable?) -> gboolean throws` | gdk_pixbuf_save_to_streamv | 2.36 | Saves `pixbuf` to an output stream. Supported file formats are currently "jpeg", "tiff", "png", "ico" or "bmp". See [method@GdkPixbuf.Pixbuf.save_t... |
| save_to_streamv_async | `Pixbuf.save_to_streamv_async(stream: Gio.OutputStream, type: utf8, option_keys: utf8?, option_values: utf8?, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gdk_pixbuf_save_to_streamv_async | 2.36 | Saves `pixbuf` to an output stream asynchronously. For more details see gdk_pixbuf_save_to_streamv(), which is the synchronous version of this func... |
| savev | `Pixbuf.savev(filename: filename, type: utf8, option_keys: utf8?, option_values: utf8?) -> gboolean throws` | gdk_pixbuf_savev |  | Vector version of `gdk_pixbuf_save()`. Saves pixbuf to a file in `type`, which is currently "jpeg", "png", "tiff", "ico" or "bmp". If @error is set... |
| scale | `Pixbuf.scale(dest: Pixbuf, dest_x: gint, dest_y: gint, dest_width: gint, dest_height: gint, offset_x: gdouble, offset_y: gdouble, scale_x: gdouble, scale_y: gdouble, interp_type: InterpType) -> none` | gdk_pixbuf_scale |  | Creates a transformation of the source image @src by scaling by @scale_x and @scale_y then translating by @offset_x and @offset_y, then renders the... |
| scale_simple | `Pixbuf.scale_simple(dest_width: gint, dest_height: gint, interp_type: InterpType) -> Pixbuf` | gdk_pixbuf_scale_simple |  | Create a new pixbuf containing a copy of `src` scaled to `dest_width` x `dest_height`. This function leaves `src` unaffected. The `interp_type` sho... |
| set_option | `Pixbuf.set_option(key: utf8, value: utf8) -> gboolean` | gdk_pixbuf_set_option | 2.2 | Attaches a key/value pair as an option to a `GdkPixbuf`. If `key` already exists in the list of options attached to the `pixbuf`, the new value is ... |
| unref | `Pixbuf.unref() -> none` | gdk_pixbuf_unref |  | Removes a reference from a pixbuf. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| bits-per-sample | gint | read, write, construct-only | The number of bits per sample. Currently only 8 bit per sample are supported. |
| colorspace | Colorspace | read, write, construct-only | The color space of the pixbuf. Currently, only `GDK_COLORSPACE_RGB` is supported. |
| has-alpha | gboolean | read, write, construct-only | Whether the pixbuf has an alpha channel. |
| height | gint | read, write, construct-only | The number of rows of the pixbuf. |
| n-channels | gint | read, write, construct-only | The number of samples per pixel. Currently, only 3 or 4 samples per pixel are supported. |
| pixel-bytes | GLib.Bytes | read, write, construct-only |  |
| pixels | gpointer | read, write, construct-only | A pointer to the pixel data of the pixbuf. |
| rowstride | gint | read, write, construct-only | The number of bytes between the start of a row and the start of the next row. This number must (obviously) be at least as large as the width of the... |
| width | gint | read, write, construct-only | The number of columns of the pixbuf. |

### GdkPixbuf.PixbufAnimation

Parent: `GObject.Object` ?? Subclasses: `PixbufNonAnim`, `PixbufSimpleAnim` ?? GType: `GdkPixbufAnimation` ?? C type: `GdkPixbufAnimation`

An opaque object representing an animation. The GdkPixBuf library provides a simple mechanism to load and represent animations. An animation is con...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_from_file | `PixbufAnimation.new_from_file(filename: filename) -> PixbufAnimation throws` | gdk_pixbuf_animation_new_from_file |  | Creates a new animation by loading it from a file. The file format is detected automatically. If the file's format does not support multi-frame ima... |
| new_from_resource | `PixbufAnimation.new_from_resource(resource_path: utf8) -> PixbufAnimation throws` | gdk_pixbuf_animation_new_from_resource | 2.28 | Creates a new pixbuf animation by loading an image from an resource. The file format is detected automatically. If `NULL` is returned, then @error ... |
| new_from_stream | `PixbufAnimation.new_from_stream(stream: Gio.InputStream, cancellable: Gio.Cancellable?) -> PixbufAnimation throws` | gdk_pixbuf_animation_new_from_stream | 2.28 | Creates a new animation by loading it from an input stream. The file format is detected automatically. If `NULL` is returned, then @error will be s... |
| new_from_stream_finish | `PixbufAnimation.new_from_stream_finish(async_result: Gio.AsyncResult) -> PixbufAnimation throws` | gdk_pixbuf_animation_new_from_stream_finish | 2.28 | Finishes an asynchronous pixbuf animation creation operation started with [func@GdkPixbuf.PixbufAnimation.new_from_stream_async]. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_from_stream_async | `new_from_stream_async(stream: Gio.InputStream, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gdk_pixbuf_animation_new_from_stream_async | 2.28 | Creates a new animation by asynchronously loading an image from an input stream. For more details see gdk_pixbuf_new_from_stream(), which is the sy... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_height | `PixbufAnimation.get_height() -> gint` | gdk_pixbuf_animation_get_height |  | Queries the height of the bounding box of a pixbuf animation. |
| get_iter | `PixbufAnimation.get_iter(start_time: GLib.TimeVal?) -> PixbufAnimationIter` | gdk_pixbuf_animation_get_iter |  | Get an iterator for displaying an animation. The iterator provides the frames that should be displayed at a given time. @start_time would normally ... |
| get_static_image | `PixbufAnimation.get_static_image() -> Pixbuf` | gdk_pixbuf_animation_get_static_image |  | Retrieves a static image for the animation. If an animation is really just a plain image (has only one frame), this function returns that image. If... |
| get_width | `PixbufAnimation.get_width() -> gint` | gdk_pixbuf_animation_get_width |  | Queries the width of the bounding box of a pixbuf animation. |
| is_static_image | `PixbufAnimation.is_static_image() -> gboolean` | gdk_pixbuf_animation_is_static_image |  | Checks whether the animation is a static image. If you load a file with gdk_pixbuf_animation_new_from_file() and it turns out to be a plain, unanim... |
| ref | `PixbufAnimation.ref() -> PixbufAnimation` | gdk_pixbuf_animation_ref |  | Adds a reference to an animation. |
| unref | `PixbufAnimation.unref() -> none` | gdk_pixbuf_animation_unref |  | Removes a reference from an animation. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_iter | `get_iter(start_time: GLib.TimeVal?) -> PixbufAnimationIter` |  |  | Get an iterator for displaying an animation. The iterator provides the frames that should be displayed at a given time. @start_time would normally ... |
| get_size | `get_size(width: gint, height: gint) -> none` |  |  | fills @width and @height with the frame size of the animation. |
| get_static_image | `get_static_image() -> Pixbuf` |  |  | Retrieves a static image for the animation. If an animation is really just a plain image (has only one frame), this function returns that image. If... |
| is_static_image | `is_static_image() -> gboolean` |  |  | Checks whether the animation is a static image. If you load a file with gdk_pixbuf_animation_new_from_file() and it turns out to be a plain, unanim... |

### GdkPixbuf.PixbufAnimationIter

Parent: `GObject.Object` ?? Subclasses: `PixbufSimpleAnimIter` ?? GType: `GdkPixbufAnimationIter` ?? C type: `GdkPixbufAnimationIter`

An opaque object representing an iterator which points to a certain position in an animation.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| advance | `PixbufAnimationIter.advance(current_time: GLib.TimeVal?) -> gboolean` | gdk_pixbuf_animation_iter_advance |  | Possibly advances an animation to a new frame. Chooses the frame based on the start time passed to gdk_pixbuf_animation_get_iter(). @current_time w... |
| get_delay_time | `PixbufAnimationIter.get_delay_time() -> gint` | gdk_pixbuf_animation_iter_get_delay_time |  | Gets the number of milliseconds the current pixbuf should be displayed, or -1 if the current pixbuf should be displayed forever. The `g_timeout_add... |
| get_pixbuf | `PixbufAnimationIter.get_pixbuf() -> Pixbuf` | gdk_pixbuf_animation_iter_get_pixbuf |  | Gets the current pixbuf which should be displayed. The pixbuf might not be the same size as the animation itself (gdk_pixbuf_animation_get_width(),... |
| on_currently_loading_frame | `PixbufAnimationIter.on_currently_loading_frame() -> gboolean` | gdk_pixbuf_animation_iter_on_currently_loading_frame |  | Used to determine how to respond to the area_updated signal on #GdkPixbufLoader when loading an animation. The `::area_updated` signal is emitted f... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| advance | `advance(current_time: GLib.TimeVal?) -> gboolean` |  |  | Possibly advances an animation to a new frame. Chooses the frame based on the start time passed to gdk_pixbuf_animation_get_iter(). @current_time w... |
| get_delay_time | `get_delay_time() -> gint` |  |  | Gets the number of milliseconds the current pixbuf should be displayed, or -1 if the current pixbuf should be displayed forever. The `g_timeout_add... |
| get_pixbuf | `get_pixbuf() -> Pixbuf` |  |  | Gets the current pixbuf which should be displayed. The pixbuf might not be the same size as the animation itself (gdk_pixbuf_animation_get_width(),... |
| on_currently_loading_frame | `on_currently_loading_frame() -> gboolean` |  |  | Used to determine how to respond to the area_updated signal on #GdkPixbufLoader when loading an animation. The `::area_updated` signal is emitted f... |

### GdkPixbuf.PixbufLoader

Parent: `GObject.Object` ?? GType: `GdkPixbufLoader` ?? C type: `GdkPixbufLoader`

Incremental image loader. `GdkPixbufLoader` provides a way for applications to drive the process of loading an image, by letting them send the imag...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | gpointer |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `PixbufLoader.new() -> PixbufLoader` | gdk_pixbuf_loader_new |  | Creates a new pixbuf loader object. |
| new_with_mime_type | `PixbufLoader.new_with_mime_type(mime_type: utf8) -> PixbufLoader throws` | gdk_pixbuf_loader_new_with_mime_type | 2.4 | Creates a new pixbuf loader object that always attempts to parse image data as if it were an image of MIME type @mime_type, instead of identifying ... |
| new_with_type | `PixbufLoader.new_with_type(image_type: utf8) -> PixbufLoader throws` | gdk_pixbuf_loader_new_with_type |  | Creates a new pixbuf loader object that always attempts to parse image data as if it were an image of type @image_type, instead of identifying the ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| close | `PixbufLoader.close() -> gboolean throws` | gdk_pixbuf_loader_close |  | Informs a pixbuf loader that no further writes with gdk_pixbuf_loader_write() will occur, so that it can free its internal loading structures. This... |
| get_animation | `PixbufLoader.get_animation() -> PixbufAnimation` | gdk_pixbuf_loader_get_animation |  | Queries the #GdkPixbufAnimation that a pixbuf loader is currently creating. In general it only makes sense to call this function after the [signal@... |
| get_format | `PixbufLoader.get_format() -> PixbufFormat` | gdk_pixbuf_loader_get_format | 2.2 | Obtains the available information about the format of the currently loading image file. |
| get_pixbuf | `PixbufLoader.get_pixbuf() -> Pixbuf` | gdk_pixbuf_loader_get_pixbuf |  | Queries the #GdkPixbuf that a pixbuf loader is currently creating. In general it only makes sense to call this function after the [signal@GdkPixbuf... |
| set_size | `PixbufLoader.set_size(width: gint, height: gint) -> none` | gdk_pixbuf_loader_set_size | 2.2 | Causes the image to be scaled while it is loaded. The desired image size can be determined relative to the original size of the image by calling gd... |
| write | `PixbufLoader.write(buf: guint8, count: gsize) -> gboolean throws` | gdk_pixbuf_loader_write |  | Parses the next `count` bytes in the given image buffer. |
| write_bytes | `PixbufLoader.write_bytes(buffer: GLib.Bytes) -> gboolean throws` | gdk_pixbuf_loader_write_bytes | 2.30 | Parses the next contents of the given image buffer. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| area-prepared | `` | none | last |  | This signal is emitted when the pixbuf loader has allocated the pixbuf in the desired size. After this signal is emitted, applications can call gdk... |
| area-updated | `x: gint, y: gint, width: gint, height: gint` | none | last |  | This signal is emitted when a significant area of the image being loaded has been updated. Normally it means that a complete scanline has been read... |
| closed | `` | none | last |  | This signal is emitted when gdk_pixbuf_loader_close() is called. It can be used by different parts of an application to receive notification when a... |
| size-prepared | `width: gint, height: gint` | none | last |  | This signal is emitted when the pixbuf loader has been fed the initial amount of data that is required to figure out the size of the image that it ... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| area_prepared | `area_prepared() -> none` |  |  |  |
| area_updated | `area_updated(x: gint, y: gint, width: gint, height: gint) -> none` |  |  |  |
| closed | `closed() -> none` |  |  |  |
| size_prepared | `size_prepared(width: gint, height: gint) -> none` |  |  |  |

### GdkPixbuf.PixbufNonAnim

Parent: `PixbufAnimation` ?? GType: `GdkPixbufNonAnim`

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `PixbufNonAnim.new(pixbuf: Pixbuf) -> PixbufAnimation` | gdk_pixbuf_non_anim_new |  |  |

### GdkPixbuf.PixbufSimpleAnim

Parent: `PixbufAnimation` ?? GType: `GdkPixbufSimpleAnim` ?? C type: `GdkPixbufSimpleAnim`

An opaque struct representing a simple animation.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `PixbufSimpleAnim.new(width: gint, height: gint, rate: gfloat) -> PixbufSimpleAnim` | gdk_pixbuf_simple_anim_new | 2.8 | Creates a new, empty animation. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_frame | `PixbufSimpleAnim.add_frame(pixbuf: Pixbuf) -> none` | gdk_pixbuf_simple_anim_add_frame | 2.8 | Adds a new frame to @animation. The @pixbuf must have the dimensions specified when the animation was constructed. |
| get_loop | `PixbufSimpleAnim.get_loop() -> gboolean` | gdk_pixbuf_simple_anim_get_loop | 2.18 | Gets whether @animation should loop indefinitely when it reaches the end. |
| set_loop | `PixbufSimpleAnim.set_loop(loop: gboolean) -> none` | gdk_pixbuf_simple_anim_set_loop | 2.18 | Sets whether @animation should loop indefinitely when it reaches the end. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| loop | gboolean | read, write | Whether the animation should loop when it reaches the end. |

### GdkPixbuf.PixbufSimpleAnimIter

Parent: `PixbufAnimationIter` ?? GType: `GdkPixbufSimpleAnimIter`

## Enums

### GdkPixbuf.Colorspace

GType: `GdkColorspace` ?? C type: `GdkColorspace`

This enumeration defines the color spaces that are supported by the gdk-pixbuf library. Currently only RGB is supported.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| rgb | 0 | rgb | Indicates a red/green/blue additive color space. |

### GdkPixbuf.InterpType

GType: `GdkInterpType` ?? C type: `GdkInterpType`

Interpolation modes for scaling functions. The `GDK_INTERP_NEAREST` mode is the fastest scaling method, but has horrible quality when scaling down;...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bilinear | 2 | bilinear | Best quality/speed balance; use this mode by default. Bilinear interpolation. For enlargement, it is equivalent to point-sampling the ideal bilinea... |
| hyper | 3 | hyper | This is the slowest and highest quality reconstruction function. It is derived from the hyperbolic filters in Wolberg's "Digital Image Warping", an... |
| nearest | 0 | nearest | Nearest neighbor sampling; this is the fastest and lowest quality mode. Quality is normally unacceptable when scaling down, but may be OK when scal... |
| tiles | 1 | tiles | This is an accurate simulation of the PostScript image operator without any interpolation enabled. Each pixel is rendered as a tiny parallelogram o... |

### GdkPixbuf.PixbufAlphaMode

GType: `GdkPixbufAlphaMode` ?? C type: `GdkPixbufAlphaMode`

Control the alpha channel for drawables. These values can be passed to gdk_pixbuf_xlib_render_to_drawable_alpha() in gdk-pixbuf-xlib to control how...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bilevel | 0 | bilevel | A bilevel clipping mask (black and white) will be created and used to draw the image. Pixels below 0.5 opacity will be considered fully transparent... |
| full | 1 | full | For now falls back to #GDK_PIXBUF_ALPHA_BILEVEL. In the future it will do full alpha compositing. |

### GdkPixbuf.PixbufError

GType: `GdkPixbufError` ?? C type: `GdkPixbufError`

An error code in the `GDK_PIXBUF_ERROR` domain. Many gdk-pixbuf operations can cause errors in this domain, or in the `G_FILE_ERROR` domain.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bad_option | 2 | bad-option | A bad option was passed to a pixbuf save module. |
| corrupt_image | 0 | corrupt-image | An image file was broken somehow. |
| failed | 5 | failed | Generic failure code, something went wrong. |
| incomplete_animation | 6 | incomplete-animation | Only part of the animation was loaded. |
| insufficient_memory | 1 | insufficient-memory | Not enough memory. |
| unknown_type | 3 | unknown-type | Unknown image type. |
| unsupported_operation | 4 | unsupported-operation | Don't know how to perform the given operation on the type of image at hand. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | gdk_pixbuf_error_quark |  |  |

### GdkPixbuf.PixbufRotation

GType: `GdkPixbufRotation` ?? C type: `GdkPixbufRotation`

The possible rotations which can be passed to gdk_pixbuf_rotate_simple(). To make them easier to use, their numerical values are the actual degrees.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| clockwise | 270 | clockwise | Rotate by 270 degrees. |
| counterclockwise | 90 | counterclockwise | Rotate by 90 degrees. |
| none | 0 | none | No rotation. |
| upsidedown | 180 | upsidedown | Rotate by 180 degrees. |

## Flags

### GdkPixbuf.PixbufFormatFlags

C type: `GdkPixbufFormatFlags`

Flags which allow a module to specify further details about the supported operations.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| scalable | 2 |  | the image format is scalable |
| threadsafe | 4 |  | the module is threadsafe. gdk-pixbuf ignores modules that are not marked as threadsafe. (Since 2.28). |
| writable | 1 |  | the module can write out images in the format. |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| PixbufAnimationClass |  | 0 | 0 | 0 | Modules supporting animations must derive a type from #GdkPixbufAnimation, providing suitable implementations of the virtual functions. |
| PixbufAnimationIterClass |  | 0 | 0 | 0 | Modules supporting animations must derive a type from #GdkPixbufAnimationIter, providing suitable implementations of the virtual functions. |
| PixbufFormat |  | 0 | 0 | 12 | A `GdkPixbufFormat` contains information about the image format accepted by a module. Only modules should access the fields directly, applications ... |
| PixbufLoaderClass |  | 0 | 0 | 0 |  |
| PixbufModule |  | 0 | 0 | 0 | A `GdkPixbufModule` contains the necessary functions to load and save images in a certain file format. If `GdkPixbuf` has been compiled with `GModu... |
| PixbufModulePattern |  | 0 | 0 | 0 | The signature prefix for a module. The signature of a module is a set of prefixes. Prefixes are encoded as pairs of ordinary strings, where the sec... |
| PixbufSimpleAnimClass |  | 0 | 0 | 0 |  |

### GdkPixbuf.PixbufAnimationClass

C type: `GdkPixbufAnimationClass`

Modules supporting animations must derive a type from #GdkPixbufAnimation, providing suitable implementations of the virtual functions.

#### Fields

| Field | Type |
| --- | --- |
| get_iter | PixbufAnimationIter |
| get_size | none |
| get_static_image | Pixbuf |
| is_static_image | gboolean |
| parent_class | GObject.ObjectClass |

### GdkPixbuf.PixbufAnimationIterClass

C type: `GdkPixbufAnimationIterClass`

Modules supporting animations must derive a type from #GdkPixbufAnimationIter, providing suitable implementations of the virtual functions.

#### Fields

| Field | Type |
| --- | --- |
| advance | gboolean |
| get_delay_time | gint |
| get_pixbuf | Pixbuf |
| on_currently_loading_frame | gboolean |
| parent_class | GObject.ObjectClass |

### GdkPixbuf.PixbufFormat

GType: `GdkPixbufFormat` ?? C type: `GdkPixbufFormat`

A `GdkPixbufFormat` contains information about the image format accepted by a module. Only modules should access the fields directly, applications ...

#### Fields

| Field | Type |
| --- | --- |
| description | utf8 |
| disabled | gboolean |
| domain | utf8 |
| extensions | utf8 |
| flags | guint32 |
| license | utf8 |
| mime_types | utf8 |
| name | utf8 |
| signature | PixbufModulePattern |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `PixbufFormat.copy() -> PixbufFormat` | gdk_pixbuf_format_copy | 2.22 | Creates a copy of `format`. |
| free | `PixbufFormat.free() -> none` | gdk_pixbuf_format_free | 2.22 | Frees the resources allocated when copying a `GdkPixbufFormat` using gdk_pixbuf_format_copy() |
| get_description | `PixbufFormat.get_description() -> utf8` | gdk_pixbuf_format_get_description | 2.2 | Returns a description of the format. |
| get_extensions | `PixbufFormat.get_extensions() -> utf8` | gdk_pixbuf_format_get_extensions | 2.2 | Returns the filename extensions typically used for files in the given format. |
| get_license | `PixbufFormat.get_license() -> utf8` | gdk_pixbuf_format_get_license | 2.6 | Returns information about the license of the image loader for the format. The returned string should be a shorthand for a well known license, e.g. ... |
| get_mime_types | `PixbufFormat.get_mime_types() -> utf8` | gdk_pixbuf_format_get_mime_types | 2.2 | Returns the mime types supported by the format. |
| get_name | `PixbufFormat.get_name() -> utf8` | gdk_pixbuf_format_get_name | 2.2 | Returns the name of the format. |
| is_disabled | `PixbufFormat.is_disabled() -> gboolean` | gdk_pixbuf_format_is_disabled | 2.6 | Returns whether this image format is disabled. See gdk_pixbuf_format_set_disabled(). |
| is_save_option_supported | `PixbufFormat.is_save_option_supported(option_key: utf8) -> gboolean` | gdk_pixbuf_format_is_save_option_supported | 2.36 | Returns `TRUE` if the save option specified by @option_key is supported when saving a pixbuf using the module implementing @format. See gdk_pixbuf_... |
| is_scalable | `PixbufFormat.is_scalable() -> gboolean` | gdk_pixbuf_format_is_scalable | 2.6 | Returns whether this image format is scalable. If a file is in a scalable format, it is preferable to load it at the desired size, rather than load... |
| is_writable | `PixbufFormat.is_writable() -> gboolean` | gdk_pixbuf_format_is_writable | 2.2 | Returns whether pixbufs can be saved in the given format. |
| set_disabled | `PixbufFormat.set_disabled(disabled: gboolean) -> none` | gdk_pixbuf_format_set_disabled | 2.6 | Disables or enables an image format. If a format is disabled, GdkPixbuf won't use the image loader for this format to load images. Applications can... |

### GdkPixbuf.PixbufLoaderClass

C type: `GdkPixbufLoaderClass`

#### Fields

| Field | Type |
| --- | --- |
| area_prepared | none |
| area_updated | none |
| closed | none |
| parent_class | GObject.ObjectClass |
| size_prepared | none |

### GdkPixbuf.PixbufModule

C type: `GdkPixbufModule`

A `GdkPixbufModule` contains the necessary functions to load and save images in a certain file format. If `GdkPixbuf` has been compiled with `GModu...

#### Fields

| Field | Type |
| --- | --- |
| _reserved1 | none |
| _reserved2 | none |
| _reserved3 | none |
| _reserved4 | none |
| begin_load | PixbufModuleBeginLoadFunc |
| info | PixbufFormat |
| is_save_option_supported | PixbufModuleSaveOptionSupportedFunc |
| load | PixbufModuleLoadFunc |
| load_animation | PixbufModuleLoadAnimationFunc |
| load_increment | PixbufModuleIncrementLoadFunc |
| load_xpm_data | PixbufModuleLoadXpmDataFunc |
| module | GModule.Module |
| module_name | utf8 |
| module_path | utf8 |
| save | PixbufModuleSaveFunc |
| save_to_callback | PixbufModuleSaveCallbackFunc |
| stop_load | PixbufModuleStopLoadFunc |

### GdkPixbuf.PixbufModulePattern

C type: `GdkPixbufModulePattern`

The signature prefix for a module. The signature of a module is a set of prefixes. Prefixes are encoded as pairs of ordinary strings, where the sec...

#### Fields

| Field | Type |
| --- | --- |
| mask | utf8 |
| prefix | utf8 |
| relevance | gint |

### GdkPixbuf.PixbufSimpleAnimClass

C type: `GdkPixbufSimpleAnimClass`

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| pixbuf_error_quark | `pixbuf_error_quark() -> GLib.Quark` | gdk_pixbuf_error_quark |  |  |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| PixbufDestroyNotify | `PixbufDestroyNotify(pixels: guint8, data: gpointer?) -> none` |  |  | A function of this type is responsible for freeing the pixel array of a pixbuf. The gdk_pixbuf_new_from_data() function lets you pass in a pre-allo... |
| PixbufModuleBeginLoadFunc | `PixbufModuleBeginLoadFunc(size_func: PixbufModuleSizeFunc, prepared_func: PixbufModulePreparedFunc, updated_func: PixbufModuleUpdatedFunc, user_data: gpointer?) -> gpointer throws` |  |  | Sets up the image loading state. The image loader is responsible for storing the given function pointers and user data, and call them when needed. ... |
| PixbufModuleFillInfoFunc | `PixbufModuleFillInfoFunc(info: PixbufFormat) -> none` |  | 2.2 | Defines the type of the function used to fill a #GdkPixbufFormat structure with information about a module. |
| PixbufModuleFillVtableFunc | `PixbufModuleFillVtableFunc(module: PixbufModule) -> none` |  | 2.2 | Defines the type of the function used to set the vtable of a #GdkPixbufModule when it is loaded. |
| PixbufModuleIncrementLoadFunc | `PixbufModuleIncrementLoadFunc(context: gpointer?, buf: guint8, size: guint) -> gboolean throws` |  |  | Incrementally loads a buffer into the image data. |
| PixbufModuleLoadAnimationFunc | `PixbufModuleLoadAnimationFunc(f: gpointer?) -> PixbufAnimation throws` |  |  | Loads a file from a standard C file stream into a new `GdkPixbufAnimation`. In case of error, this function should return `NULL` and set the `error... |
| PixbufModuleLoadFunc | `PixbufModuleLoadFunc(f: gpointer?) -> Pixbuf throws` |  |  | Loads a file from a standard C file stream into a new `GdkPixbuf`. In case of error, this function should return `NULL` and set the `error` argument. |
| PixbufModuleLoadXpmDataFunc | `PixbufModuleLoadXpmDataFunc(data: utf8) -> Pixbuf` |  |  | Loads XPM data into a new `GdkPixbuf`. |
| PixbufModulePreparedFunc | `PixbufModulePreparedFunc(pixbuf: Pixbuf, anim: PixbufAnimation, user_data: gpointer?) -> none` |  | 2.2 | Defines the type of the function that gets called once the initial setup of @pixbuf is done. #GdkPixbufLoader uses a function of this type to emit ... |
| PixbufModuleSaveCallbackFunc | `PixbufModuleSaveCallbackFunc(save_func: PixbufSaveFunc, user_data: gpointer?, pixbuf: Pixbuf, option_keys: utf8?, option_values: utf8?) -> gboolean throws` |  |  | Saves a `GdkPixbuf` by calling the provided function. The optional `option_keys` and `option_values` arrays contain the keys and values (in the sam... |
| PixbufModuleSaveFunc | `PixbufModuleSaveFunc(f: gpointer?, pixbuf: Pixbuf, param_keys: utf8?, param_values: utf8?) -> gboolean throws` |  |  | Saves a `GdkPixbuf` into a standard C file stream. The optional `param_keys` and `param_values` arrays contain the keys and values (in the same ord... |
| PixbufModuleSaveOptionSupportedFunc | `PixbufModuleSaveOptionSupportedFunc(option_key: utf8) -> gboolean` |  |  | Checks whether the given `option_key` is supported when saving. |
| PixbufModuleSizeFunc | `PixbufModuleSizeFunc(width: gint, height: gint, user_data: gpointer?) -> none` |  | 2.2 | Defines the type of the function that gets called once the size of the loaded image is known. The function is expected to set @width and @height to... |
| PixbufModuleStopLoadFunc | `PixbufModuleStopLoadFunc(context: gpointer?) -> gboolean throws` |  |  | Finalizes the image loading state. This function is called on success and error states. |
| PixbufModuleUpdatedFunc | `PixbufModuleUpdatedFunc(pixbuf: Pixbuf, x: gint, y: gint, width: gint, height: gint, user_data: gpointer?) -> none` |  | 2.2 | Defines the type of the function that gets called every time a region of @pixbuf is updated. #GdkPixbufLoader uses a function of this type to emit ... |
| PixbufSaveFunc | `PixbufSaveFunc(buf: guint8, count: gsize, error: out GLib.Error, data: gpointer?) -> gboolean` |  | 2.4 | Save functions used by [method@GdkPixbuf.Pixbuf.save_to_callback]. This function is called once for each block of bytes that is "written" by `gdk_p... |

## Constants

| Name | Type |
| --- | --- |
| PIXBUF_MAJOR | gint |
| PIXBUF_MICRO | gint |
| PIXBUF_MINOR | gint |
| PIXBUF_VERSION | utf8 |

