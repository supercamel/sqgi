# GdkPixdata 2.0

SQGI import: `import("GdkPixdata", "2.0")`

Packages: `gdk-pixbuf-2.0`
Includes: `GdkPixbuf-2.0`
Libraries: `libgdk_pixbuf-2.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 0 |
| Interfaces | 0 |
| Records | 1 |
| Unions | 0 |
| Enums | 0 |
| Flags | 2 |
| Functions | 1 |
| Callbacks | 0 |
| Constants | 2 |
| Aliases | 0 |

## Flags

### GdkPixdata.PixdataDumpType

C type: `GdkPixdataDumpType`

An enumeration which is used by gdk_pixdata_to_csource() to determine the form of C source to be generated. The three values @GDK_PIXDATA_DUMP_PIXD...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| const | 1024 |  | Generate const symbols. |
| ctypes | 256 |  | Generate standard C data types instead of GLib data types. |
| gtypes | 0 |  | Generate GLib data types instead of standard C data types. |
| macros | 2 |  | Generate <function>*_ROWSTRIDE</function>, <function>*_WIDTH</function>, <function>*_HEIGHT</function>, <function>*_BYTES_PER_PIXEL</function> and ... |
| pixdata_stream | 0 |  | Generate pixbuf data stream (a single string containing a serialized #GdkPixdata structure in network byte order). |
| pixdata_struct | 1 |  | Generate #GdkPixdata structure (needs the #GdkPixdata structure definition from gdk-pixdata.h). |
| rle_decoder | 65536 |  | Provide a <function>*_RUN_LENGTH_DECODE(image_buf, rle_data, size, bpp)</function> macro definition to decode run-length encoded image data. |
| static | 512 |  | Generate static symbols. |

### GdkPixdata.PixdataType

C type: `GdkPixdataType`

An enumeration containing three sets of flags for a #GdkPixdata struct: one for the used colorspace, one for the width of the samples and one for t...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| color_type_mask | 255 |  | mask for the colortype flags of the enum. |
| color_type_rgb | 1 |  | each pixel has red, green and blue samples. |
| color_type_rgba | 2 |  | each pixel has red, green and blue samples and an alpha value. |
| encoding_mask | 251658240 |  | mask for the encoding flags of the enum. |
| encoding_raw | 16777216 |  | the pixel data is in raw form. |
| encoding_rle | 33554432 |  | the pixel data is run-length encoded. Runs may be up to 127 bytes long; their length is stored in a single byte preceding the pixel data for the ru... |
| sample_width_8 | 65536 |  | each sample has 8 bits. |
| sample_width_mask | 983040 |  | mask for the sample width flags of the enum. |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Pixdata |  | 0 | 0 | 4 | A pixel buffer suitable for serialization and streaming. Using `GdkPixdata`, images can be compiled into an application, making it unnecessary to r... |

### GdkPixdata.Pixdata

C type: `GdkPixdata`

A pixel buffer suitable for serialization and streaming. Using `GdkPixdata`, images can be compiled into an application, making it unnecessary to r...

#### Fields

| Field | Type |
| --- | --- |
| height | guint32 |
| length | gint32 |
| magic | guint32 |
| pixdata_type | guint32 |
| pixel_data | guint8 |
| rowstride | guint32 |
| width | guint32 |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| deserialize | `Pixdata.deserialize(stream_length: guint, stream: guint8) -> gboolean throws` | gdk_pixdata_deserialize |  | Deserializes (reconstruct) a #GdkPixdata structure from a byte stream. The byte stream consists of a straightforward writeout of the `GdkPixdata` f... |
| from_pixbuf | `Pixdata.from_pixbuf(pixbuf: GdkPixbuf.Pixbuf, use_rle: gboolean) -> guint8` | gdk_pixdata_from_pixbuf |  | Converts a `GdkPixbuf` to a `GdkPixdata`. If `use_rle` is `TRUE`, the pixel data is run-length encoded into newly-allocated memory and a pointer to... |
| serialize | `Pixdata.serialize(stream_length_p: out guint) -> guint8` | gdk_pixdata_serialize |  | Serializes a #GdkPixdata structure into a byte stream. The byte stream consists of a straightforward writeout of the #GdkPixdata fields in network ... |
| to_csource | `Pixdata.to_csource(name: utf8, dump_type: PixdataDumpType) -> GLib.String` | gdk_pixdata_to_csource |  | Generates C source code suitable for compiling images directly into programs. GdkPixbuf ships with a program called `gdk-pixbuf-csource`, which off... |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| pixbuf_from_pixdata | `pixbuf_from_pixdata(pixdata: Pixdata, copy_pixels: gboolean) -> GdkPixbuf.Pixbuf throws` | gdk_pixbuf_from_pixdata |  | Converts a `GdkPixdata` to a `GdkPixbuf`. If `copy_pixels` is `TRUE` or if the pixel data is run-length-encoded, the pixel data is copied into newl... |

## Constants

| Name | Type |
| --- | --- |
| PIXBUF_MAGIC_NUMBER | gint |
| PIXDATA_HEADER_LENGTH | gint |

