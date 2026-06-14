# PangoFT2 1.0

SQGI import: `import("PangoFT2", "1.0")`

Packages: `pangoft2`
Includes: `PangoFc-1.0`, `freetype2-2.0`
Libraries: `libpangoft2-1.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 1 |
| Interfaces | 0 |
| Records | 0 |
| Unions | 0 |
| Enums | 0 |
| Flags | 0 |
| Functions | 12 |
| Callbacks | 1 |
| Constants | 0 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| FontMap | PangoFc.FontMap | 0 | 0 | 6 | The `PangoFT2FontMap` is the `PangoFontMap` implementation for FreeType fonts. |

### PangoFT2.FontMap

Parent: `PangoFc.FontMap` ?? Implements: `Gio.ListModel` ?? GType: `PangoFT2FontMap` ?? C type: `PangoFT2FontMap`

The `PangoFT2FontMap` is the `PangoFontMap` implementation for FreeType fonts.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `FontMap.new() -> Pango.FontMap` | pango_ft2_font_map_new | 1.2 | Create a new `PangoFT2FontMap` object. A fontmap is used to cache information about available fonts, and holds certain global parameters such as th... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| for_display | `for_display() -> Pango.FontMap` | pango_ft2_font_map_for_display |  | Returns a `PangoFT2FontMap`. This font map is cached and should not be freed. If the font map is no longer needed, it can be released with pango_ft... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| create_context | `FontMap.create_context() -> Pango.Context` | pango_ft2_font_map_create_context | 1.2 | Create a `PangoContext` for the given fontmap. |
| set_default_substitute | `FontMap.set_default_substitute(func: SubstituteFunc, data: gpointer?, notify: GLib.DestroyNotify) -> none` | pango_ft2_font_map_set_default_substitute | 1.2 | Sets a function that will be called to do final configuration substitution on a `FcPattern` before it is used to load the font. This function can b... |
| set_resolution | `FontMap.set_resolution(dpi_x: gdouble, dpi_y: gdouble) -> none` | pango_ft2_font_map_set_resolution | 1.2 | Sets the horizontal and vertical resolutions for the fontmap. |
| substitute_changed | `FontMap.substitute_changed() -> none` | pango_ft2_font_map_substitute_changed | 1.2 | Call this function any time the results of the default substitution function set with pango_ft2_font_map_set_default_substitute() change. That is, ... |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| font_get_coverage | `font_get_coverage(font: Pango.Font, language: Pango.Language) -> Pango.Coverage` | pango_ft2_font_get_coverage |  | Gets the `PangoCoverage` for a `PangoFT2Font`. Use [method@Pango.Font.get_coverage] instead. |
| font_get_face | `font_get_face(font: Pango.Font) -> freetype2.Face` | pango_ft2_font_get_face |  | Returns the native FreeType2 `FT_Face` structure used for this `PangoFont`. This may be useful if you want to use FreeType2 functions directly. Use... |
| font_get_kerning | `font_get_kerning(font: Pango.Font, left: Pango.Glyph, right: Pango.Glyph) -> gint` | pango_ft2_font_get_kerning |  | Retrieves kerning information for a combination of two glyphs. Use pango_fc_font_kern_glyphs() instead. |
| get_context | `get_context(dpi_x: gdouble, dpi_y: gdouble) -> Pango.Context` | pango_ft2_get_context |  | Retrieves a `PangoContext` for the default PangoFT2 fontmap (see pango_ft2_font_map_for_display()) and sets the resolution for the default fontmap ... |
| get_unknown_glyph | `get_unknown_glyph(font: Pango.Font) -> Pango.Glyph` | pango_ft2_get_unknown_glyph |  | Return the index of a glyph suitable for drawing unknown characters with @font, or %PANGO_GLYPH_EMPTY if no suitable glyph found. If you want to dr... |
| render | `render(bitmap: freetype2.Bitmap, font: Pango.Font, glyphs: Pango.GlyphString, x: gint, y: gint) -> none` | pango_ft2_render |  | Renders a `PangoGlyphString` onto a FreeType2 bitmap. |
| render_layout | `render_layout(bitmap: freetype2.Bitmap, layout: Pango.Layout, x: gint, y: gint) -> none` | pango_ft2_render_layout |  | Render a `PangoLayout` onto a FreeType2 bitmap |
| render_layout_line | `render_layout_line(bitmap: freetype2.Bitmap, line: Pango.LayoutLine, x: gint, y: gint) -> none` | pango_ft2_render_layout_line |  | Render a `PangoLayoutLine` onto a FreeType2 bitmap |
| render_layout_line_subpixel | `render_layout_line_subpixel(bitmap: freetype2.Bitmap, line: Pango.LayoutLine, x: gint, y: gint) -> none` | pango_ft2_render_layout_line_subpixel | 1.6 | Render a `PangoLayoutLine` onto a FreeType2 bitmap, with he location specified in fixed-point Pango units rather than pixels. (Using this will avoi... |
| render_layout_subpixel | `render_layout_subpixel(bitmap: freetype2.Bitmap, layout: Pango.Layout, x: gint, y: gint) -> none` | pango_ft2_render_layout_subpixel | 1.6 | Render a `PangoLayout` onto a FreeType2 bitmap, with he location specified in fixed-point Pango units rather than pixels. (Using this will avoid ex... |
| render_transformed | `render_transformed(bitmap: freetype2.Bitmap, matrix: Pango.Matrix?, font: Pango.Font, glyphs: Pango.GlyphString, x: gint, y: gint) -> none` | pango_ft2_render_transformed | 1.6 | Renders a `PangoGlyphString` onto a FreeType2 bitmap, possibly transforming the layed-out coordinates through a transformation matrix. Note that th... |
| shutdown_display | `shutdown_display() -> none` | pango_ft2_shutdown_display |  | Free the global fontmap. (See pango_ft2_font_map_for_display()) Use of the global PangoFT2 fontmap is deprecated. |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| SubstituteFunc | `SubstituteFunc(pattern: fontconfig.Pattern, data: gpointer?) -> none` |  |  | Function type for doing final config tweaking on prepared FcPatterns. |

