# PangoCairo 1.0

SQGI import: `import("PangoCairo", "1.0")`

Packages: `pangocairo`
Includes: `GObject-2.0`, `Pango-1.0`, `cairo-1.0`
Libraries: `libpangocairo-1.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 0 |
| Interfaces | 2 |
| Records | 0 |
| Unions | 0 |
| Enums | 0 |
| Flags | 0 |
| Functions | 22 |
| Callbacks | 1 |
| Constants | 0 |
| Aliases | 0 |

## Interfaces

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Font |  | 0 | 0 | 1 | `PangoCairoFont` is an interface exported by fonts for use with Cairo. The actual type of the font will depend on the particular font technology Ca... |
| FontMap |  | 0 | 0 | 8 | `PangoCairoFontMap` is an interface exported by font maps for use with Cairo. The actual type of the font map will depend on the particular font te... |

### PangoCairo.Font

GType: `PangoCairoFont` ?? C type: `PangoCairoFont`

`PangoCairoFont` is an interface exported by fonts for use with Cairo. The actual type of the font will depend on the particular font technology Ca...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_scaled_font | `Font.get_scaled_font() -> cairo.ScaledFont` | pango_cairo_font_get_scaled_font | 1.18 | Gets the `cairo_scaled_font_t` used by @font. The scaled font can be referenced and kept using cairo_scaled_font_reference(). |

### PangoCairo.FontMap

GType: `PangoCairoFontMap` ?? C type: `PangoCairoFontMap`

`PangoCairoFontMap` is an interface exported by font maps for use with Cairo. The actual type of the font map will depend on the particular font te...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default | `get_default() -> Pango.FontMap` | pango_cairo_font_map_get_default | 1.10 | Gets a default `PangoCairoFontMap` to use with Cairo. Note that the type of the returned object will depend on the particular font backend Cairo wa... |
| new | `new() -> Pango.FontMap` | pango_cairo_font_map_new | 1.10 | Creates a new `PangoCairoFontMap` object. A fontmap is used to cache information about available fonts, and holds certain global parameters such as... |
| new_for_font_type | `new_for_font_type(fonttype: cairo.FontType) -> Pango.FontMap` | pango_cairo_font_map_new_for_font_type | 1.18 | Creates a new `PangoCairoFontMap` object of the type suitable to be used with cairo font backend of type @fonttype. In most cases one should simply... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| create_context | `FontMap.create_context() -> Pango.Context` | pango_cairo_font_map_create_context | 1.10 | Create a `PangoContext` for the given fontmap. |
| get_font_type | `FontMap.get_font_type() -> cairo.FontType` | pango_cairo_font_map_get_font_type | 1.18 | Gets the type of Cairo font backend that @fontmap uses. |
| get_resolution | `FontMap.get_resolution() -> gdouble` | pango_cairo_font_map_get_resolution | 1.10 | Gets the resolution for the fontmap. See [method@PangoCairo.FontMap.set_resolution]. |
| set_default | `FontMap.set_default() -> none` | pango_cairo_font_map_set_default | 1.22 | Sets a default `PangoCairoFontMap` to use with Cairo. This can be used to change the Cairo font backend that the default fontmap uses for example. ... |
| set_resolution | `FontMap.set_resolution(dpi: gdouble) -> none` | pango_cairo_font_map_set_resolution | 1.10 | Sets the resolution for the fontmap. This is a scale factor between points specified in a `PangoFontDescription` and Cairo units. The default value... |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| context_get_font_options | `context_get_font_options(context: Pango.Context) -> cairo.FontOptions` | pango_cairo_context_get_font_options | 1.10 | Retrieves any font rendering options previously set with [func@PangoCairo.context_set_font_options]. This function does not report options that are... |
| context_get_resolution | `context_get_resolution(context: Pango.Context) -> gdouble` | pango_cairo_context_get_resolution | 1.10 | Gets the resolution for the context. See [func@PangoCairo.context_set_resolution] |
| context_get_shape_renderer | `context_get_shape_renderer(context: Pango.Context, data: gpointer?) -> ShapeRendererFunc` | pango_cairo_context_get_shape_renderer | 1.18 | Sets callback function for context to use for rendering attributes of type %PANGO_ATTR_SHAPE. See `PangoCairoShapeRendererFunc` for details. Retrie... |
| context_set_font_options | `context_set_font_options(context: Pango.Context, options: cairo.FontOptions?) -> none` | pango_cairo_context_set_font_options | 1.10 | Sets the font options used when rendering text with this context. These options override any options that [func@update_context] derives from the ta... |
| context_set_resolution | `context_set_resolution(context: Pango.Context, dpi: gdouble) -> none` | pango_cairo_context_set_resolution | 1.10 | Sets the resolution for the context. This is a scale factor between points specified in a `PangoFontDescription` and Cairo units. The default value... |
| context_set_shape_renderer | `context_set_shape_renderer(context: Pango.Context, func: ShapeRendererFunc?, data: gpointer?, dnotify: GLib.DestroyNotify?) -> none` | pango_cairo_context_set_shape_renderer | 1.18 | Sets callback function for context to use for rendering attributes of type %PANGO_ATTR_SHAPE. See `PangoCairoShapeRendererFunc` for details. |
| create_context | `create_context(cr: cairo.Context) -> Pango.Context` | pango_cairo_create_context | 1.22 | Creates a context object set up to match the current transformation and target surface of the Cairo context. This context can then be used to creat... |
| create_layout | `create_layout(cr: cairo.Context) -> Pango.Layout` | pango_cairo_create_layout | 1.10 | Creates a layout object set up to match the current transformation and target surface of the Cairo context. This layout can then be used for text m... |
| error_underline_path | `error_underline_path(cr: cairo.Context, x: gdouble, y: gdouble, width: gdouble, height: gdouble) -> none` | pango_cairo_error_underline_path | 1.14 | Add a squiggly line to the current path in the specified cairo context that approximately covers the given rectangle in the style of an underline u... |
| font_map_get_default | `font_map_get_default() -> Pango.FontMap` | pango_cairo_font_map_get_default | 1.10 | Gets a default `PangoCairoFontMap` to use with Cairo. Note that the type of the returned object will depend on the particular font backend Cairo wa... |
| font_map_new | `font_map_new() -> Pango.FontMap` | pango_cairo_font_map_new | 1.10 | Creates a new `PangoCairoFontMap` object. A fontmap is used to cache information about available fonts, and holds certain global parameters such as... |
| font_map_new_for_font_type | `font_map_new_for_font_type(fonttype: cairo.FontType) -> Pango.FontMap` | pango_cairo_font_map_new_for_font_type | 1.18 | Creates a new `PangoCairoFontMap` object of the type suitable to be used with cairo font backend of type @fonttype. In most cases one should simply... |
| glyph_string_path | `glyph_string_path(cr: cairo.Context, font: Pango.Font, glyphs: Pango.GlyphString) -> none` | pango_cairo_glyph_string_path | 1.10 | Adds the glyphs in @glyphs to the current path in the specified cairo context. The origin of the glyphs (the left edge of the baseline) will be at ... |
| layout_line_path | `layout_line_path(cr: cairo.Context, line: Pango.LayoutLine) -> none` | pango_cairo_layout_line_path | 1.10 | Adds the text in `PangoLayoutLine` to the current path in the specified cairo context. The origin of the glyphs (the left edge of the line) will be... |
| layout_path | `layout_path(cr: cairo.Context, layout: Pango.Layout) -> none` | pango_cairo_layout_path | 1.10 | Adds the text in a `PangoLayout` to the current path in the specified cairo context. The top-left corner of the `PangoLayout` will be at the curren... |
| show_error_underline | `show_error_underline(cr: cairo.Context, x: gdouble, y: gdouble, width: gdouble, height: gdouble) -> none` | pango_cairo_show_error_underline | 1.14 | Draw a squiggly line in the specified cairo context that approximately covers the given rectangle in the style of an underline used to indicate a s... |
| show_glyph_item | `show_glyph_item(cr: cairo.Context, text: utf8, glyph_item: Pango.GlyphItem) -> none` | pango_cairo_show_glyph_item | 1.22 | Draws the glyphs in @glyph_item in the specified cairo context, embedding the text associated with the glyphs in the output if the output format su... |
| show_glyph_string | `show_glyph_string(cr: cairo.Context, font: Pango.Font, glyphs: Pango.GlyphString) -> none` | pango_cairo_show_glyph_string | 1.10 | Draws the glyphs in @glyphs in the specified cairo context. The origin of the glyphs (the left edge of the baseline) will be drawn at the current p... |
| show_layout | `show_layout(cr: cairo.Context, layout: Pango.Layout) -> none` | pango_cairo_show_layout | 1.10 | Draws a `PangoLayout` in the specified cairo context. The top-left corner of the `PangoLayout` will be drawn at the current point of the cairo cont... |
| show_layout_line | `show_layout_line(cr: cairo.Context, line: Pango.LayoutLine) -> none` | pango_cairo_show_layout_line | 1.10 | Draws a `PangoLayoutLine` in the specified cairo context. The origin of the glyphs (the left edge of the line) will be drawn at the current point o... |
| update_context | `update_context(cr: cairo.Context, context: Pango.Context) -> none` | pango_cairo_update_context | 1.10 | Updates a `PangoContext` previously created for use with Cairo to match the current transformation and target surface of a Cairo context. If any la... |
| update_layout | `update_layout(cr: cairo.Context, layout: Pango.Layout) -> none` | pango_cairo_update_layout | 1.10 | Updates the private `PangoContext` of a `PangoLayout` created with [func@create_layout] to match the current transformation and target surface of a... |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ShapeRendererFunc | `ShapeRendererFunc(cr: cairo.Context, attr: Pango.AttrShape, do_path: gboolean, data: gpointer?) -> none` |  |  | Function type for rendering attributes of type %PANGO_ATTR_SHAPE with Pango's Cairo renderer. |

