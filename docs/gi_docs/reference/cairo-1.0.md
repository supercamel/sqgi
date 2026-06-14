# cairo 1.0

SQGI import: `import("cairo", "1.0")`

Packages: `cairo-gobject`
Includes: `GObject-2.0`
Libraries: `libcairo-gobject.so.2`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 0 |
| Interfaces | 0 |
| Records | 12 |
| Unions | 0 |
| Enums | 22 |
| Flags | 0 |
| Functions | 1 |
| Callbacks | 0 |
| Constants | 0 |
| Aliases | 0 |

## Enums

### cairo.Antialias

GType: `cairo_antialias_t` ?? C type: `cairo_antialias_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| best | 6 |  |  |
| default | 0 |  |  |
| fast | 4 |  |  |
| good | 5 |  |  |
| gray | 2 |  |  |
| none | 1 |  |  |
| subpixel | 3 |  |  |

### cairo.Content

GType: `cairo_content_t` ?? C type: `cairo_content_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| alpha | 8192 |  |  |
| color | 4096 |  |  |
| color_alpha | 12288 |  |  |

### cairo.DeviceType

GType: `cairo_device_type_t` ?? C type: `cairo_device_type_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cogl | 6 |  |  |
| drm | 0 |  |  |
| gl | 1 |  |  |
| invalid | -1 |  |  |
| script | 2 |  |  |
| win32 | 7 |  |  |
| xcb | 3 |  |  |
| xlib | 4 |  |  |
| xml | 5 |  |  |

### cairo.Extend

GType: `cairo_extend_t` ?? C type: `cairo_extend_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 |  |  |
| pad | 3 |  |  |
| reflect | 2 |  |  |
| repeat | 1 |  |  |

### cairo.FillRule

GType: `cairo_fill_rule_t` ?? C type: `cairo_fill_rule_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| even_odd | 1 |  |  |
| winding | 0 |  |  |

### cairo.Filter

GType: `cairo_filter_t` ?? C type: `cairo_filter_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| best | 2 |  |  |
| bilinear | 4 |  |  |
| fast | 0 |  |  |
| gaussian | 5 |  |  |
| good | 1 |  |  |
| nearest | 3 |  |  |

### cairo.FontSlant

GType: `cairo_font_slant_t` ?? C type: `cairo_font_slant_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| italic | 1 |  |  |
| normal | 0 |  |  |
| oblique | 2 |  |  |

### cairo.FontType

GType: `cairo_font_type_t` ?? C type: `cairo_font_type_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| ft | 1 |  |  |
| quartz | 3 |  |  |
| toy | 0 |  |  |
| user | 4 |  |  |
| win32 | 2 |  |  |

### cairo.FontWeight

GType: `cairo_font_weight_t` ?? C type: `cairo_font_weight_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bold | 1 |  |  |
| normal | 0 |  |  |

### cairo.Format

GType: `cairo_format_t` ?? C type: `cairo_format_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| a1 | 3 |  |  |
| a8 | 2 |  |  |
| argb32 | 0 |  |  |
| invalid | -1 |  |  |
| rgb16_565 | 4 |  |  |
| rgb24 | 1 |  |  |
| rgb30 | 5 |  |  |

### cairo.HintMetrics

GType: `cairo_hint_metrics_t` ?? C type: `cairo_hint_metrics_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| default | 0 |  |  |
| off | 1 |  |  |
| on | 2 |  |  |

### cairo.HintStyle

GType: `cairo_hint_style_t` ?? C type: `cairo_hint_style_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| default | 0 |  |  |
| full | 4 |  |  |
| medium | 3 |  |  |
| none | 1 |  |  |
| slight | 2 |  |  |

### cairo.LineCap

GType: `cairo_line_cap_t` ?? C type: `cairo_line_cap_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| butt | 0 |  |  |
| round | 1 |  |  |
| square | 2 |  |  |

### cairo.LineJoin

GType: `cairo_line_join_t` ?? C type: `cairo_line_join_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bevel | 2 |  |  |
| miter | 0 |  |  |
| round | 1 |  |  |

### cairo.Operator

GType: `cairo_operator_t` ?? C type: `cairo_operator_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| add | 12 |  |  |
| atop | 5 |  |  |
| clear | 0 |  |  |
| color_burn | 20 |  |  |
| color_dodge | 19 |  |  |
| darken | 17 |  |  |
| dest | 6 |  |  |
| dest_atop | 10 |  |  |
| dest_in | 8 |  |  |
| dest_out | 9 |  |  |
| dest_over | 7 |  |  |
| difference | 23 |  |  |
| exclusion | 24 |  |  |
| hard_light | 21 |  |  |
| hsl_color | 27 |  |  |
| hsl_hue | 25 |  |  |
| hsl_luminosity | 28 |  |  |
| hsl_saturation | 26 |  |  |
| in | 3 |  |  |
| lighten | 18 |  |  |
| multiply | 14 |  |  |
| out | 4 |  |  |
| over | 2 |  |  |
| overlay | 16 |  |  |
| saturate | 13 |  |  |
| screen | 15 |  |  |
| soft_light | 22 |  |  |
| source | 1 |  |  |
| xor | 11 |  |  |

### cairo.PathDataType

GType: `cairo_path_data_type_t` ?? C type: `cairo_path_data_type_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| close_path | 3 |  |  |
| curve_to | 2 |  |  |
| line_to | 1 |  |  |
| move_to | 0 |  |  |

### cairo.PatternType

GType: `cairo_pattern_type_t` ?? C type: `cairo_pattern_type_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| linear | 2 |  |  |
| mesh | 4 |  |  |
| radial | 3 |  |  |
| raster_source | 5 |  |  |
| solid | 0 |  |  |
| surface | 1 |  |  |

### cairo.RegionOverlap

GType: `cairo_region_overlap_t` ?? C type: `cairo_region_overlap_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| in | 0 |  |  |
| out | 1 |  |  |
| part | 2 |  |  |

### cairo.Status

GType: `cairo_status_t` ?? C type: `cairo_status_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| clip_not_representable | 22 |  |  |
| device_error | 35 |  |  |
| device_finished | 37 |  |  |
| device_type_mismatch | 34 |  |  |
| file_not_found | 18 |  |  |
| font_type_mismatch | 25 |  |  |
| invalid_clusters | 29 |  |  |
| invalid_content | 15 |  |  |
| invalid_dash | 19 |  |  |
| invalid_dsc_comment | 20 |  |  |
| invalid_format | 16 |  |  |
| invalid_index | 21 |  |  |
| invalid_matrix | 5 |  |  |
| invalid_mesh_construction | 36 |  |  |
| invalid_path_data | 9 |  |  |
| invalid_pop_group | 3 |  |  |
| invalid_restore | 2 |  |  |
| invalid_size | 32 |  |  |
| invalid_slant | 30 |  |  |
| invalid_status | 6 |  |  |
| invalid_stride | 24 |  |  |
| invalid_string | 8 |  |  |
| invalid_visual | 17 |  |  |
| invalid_weight | 31 |  |  |
| jbig2_global_missing | 38 |  |  |
| negative_count | 28 |  |  |
| no_current_point | 4 |  |  |
| no_memory | 1 |  |  |
| null_pointer | 7 |  |  |
| pattern_type_mismatch | 14 |  |  |
| read_error | 10 |  |  |
| success | 0 |  |  |
| surface_finished | 12 |  |  |
| surface_type_mismatch | 13 |  |  |
| temp_file_error | 23 |  |  |
| user_font_error | 27 |  |  |
| user_font_immutable | 26 |  |  |
| user_font_not_implemented | 33 |  |  |
| write_error | 11 |  |  |

### cairo.SubpixelOrder

GType: `cairo_subpixel_order_t` ?? C type: `cairo_subpixel_order_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bgr | 2 |  |  |
| default | 0 |  |  |
| rgb | 1 |  |  |
| vbgr | 4 |  |  |
| vrgb | 3 |  |  |

### cairo.SurfaceType

GType: `cairo_surface_type_t` ?? C type: `cairo_surface_type_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| beos | 8 |  |  |
| cogl | 24 |  |  |
| directfb | 9 |  |  |
| drm | 19 |  |  |
| gl | 18 |  |  |
| glitz | 5 |  |  |
| image | 0 |  |  |
| os2 | 11 |  |  |
| pdf | 1 |  |  |
| ps | 2 |  |  |
| qt | 15 |  |  |
| quartz | 6 |  |  |
| quartz_image | 13 |  |  |
| recording | 16 |  |  |
| script | 14 |  |  |
| skia | 22 |  |  |
| subsurface | 23 |  |  |
| svg | 10 |  |  |
| tee | 20 |  |  |
| vg | 17 |  |  |
| win32 | 7 |  |  |
| win32_printing | 12 |  |  |
| xcb | 4 |  |  |
| xlib | 3 |  |  |
| xml | 21 |  |  |

### cairo.TextClusterFlags

GType: `cairo_text_cluster_flags_t` ?? C type: `cairo_text_cluster_flags_t`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| backward | 1 |  |  |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Context |  | 0 | 0 | 0 |  |
| Device |  | 0 | 0 | 0 |  |
| FontFace |  | 0 | 0 | 0 |  |
| FontOptions |  | 0 | 0 | 0 |  |
| Matrix |  | 0 | 0 | 0 |  |
| Path |  | 0 | 0 | 0 |  |
| Pattern |  | 0 | 0 | 0 |  |
| Rectangle |  | 0 | 0 | 0 |  |
| RectangleInt |  | 0 | 0 | 0 |  |
| Region |  | 0 | 0 | 0 |  |
| ScaledFont |  | 0 | 0 | 0 |  |
| Surface |  | 0 | 0 | 0 |  |

### cairo.Context

GType: `CairoContext` ?? C type: `cairo_t`

### cairo.Device

GType: `CairoDevice` ?? C type: `cairo_device_t`

### cairo.FontFace

GType: `CairoFontFace` ?? C type: `cairo_font_face_t`

### cairo.FontOptions

GType: `CairoFontOptions` ?? C type: `cairo_font_options_t`

### cairo.Matrix

C type: `cairo_matrix_t`

### cairo.Path

C type: `cairo_path_t`

### cairo.Pattern

GType: `CairoPattern` ?? C type: `cairo_pattern_t`

### cairo.Rectangle

GType: `CairoRectangle` ?? C type: `cairo_rectangle_t`

#### Fields

| Field | Type |
| --- | --- |
| height | gdouble |
| width | gdouble |
| x | gdouble |
| y | gdouble |

### cairo.RectangleInt

GType: `CairoRectangleInt` ?? C type: `cairo_rectangle_int_t`

#### Fields

| Field | Type |
| --- | --- |
| height | gint |
| width | gint |
| x | gint |
| y | gint |

### cairo.Region

GType: `CairoRegion` ?? C type: `cairo_region_t`

### cairo.ScaledFont

GType: `CairoScaledFont` ?? C type: `cairo_scaled_font_t`

### cairo.Surface

GType: `CairoSurface` ?? C type: `cairo_surface_t`

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| image_surface_create | `image_surface_create() -> none` | cairo_image_surface_create |  |  |

