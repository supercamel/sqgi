# PangoXft 1.0

SQGI import: `import("PangoXft", "1.0")`

Packages: `pangoxft`
Includes: `GObject-2.0`, `Pango-1.0`, `PangoFT2-1.0`, `PangoOT-1.0`, `xft-2.0`, `xlib-2.0`
Libraries: `libpangoxft-1.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 3 |
| Interfaces | 0 |
| Records | 2 |
| Unions | 0 |
| Enums | 0 |
| Flags | 0 |
| Functions | 10 |
| Callbacks | 1 |
| Constants | 0 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Font | PangoFc.Font | 0 | 0 | 7 | `PangoXftFont` is an implementation of `PangoFcFont` using the Xft library for rendering. It is used in conjunction with `PangoXftFontMap`. |
| FontMap | PangoFc.FontMap | 0 | 0 | 0 | `PangoXftFontMap` is an implementation of `PangoFcFontMap` suitable for the Xft library as the renderer. It is used in to create fonts of type `Pan... |
| Renderer | Pango.Renderer | 0 | 0 | 3 | `PangoXftRenderer` is a subclass of `PangoRenderer` used for rendering with Pango's Xft backend. It can be used directly, or it can be further subc... |

### PangoXft.Font

Parent: `PangoFc.Font` ?? GType: `PangoXftFont` ?? C type: `PangoXftFont`

`PangoXftFont` is an implementation of `PangoFcFont` using the Xft library for rendering. It is used in conjunction with `PangoXftFontMap`.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_font | `get_font(font: Pango.Font?) -> xft.Font` | pango_xft_font_get_font |  | Returns the `XftFont` of a font. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_display | `Font.get_display() -> xlib.Display` | pango_xft_font_get_display |  | Returns the X display of the `XftFont` of a font. |
| get_glyph | `Font.get_glyph(wc: gunichar) -> guint` | pango_xft_font_get_glyph | 1.2 | Gets the glyph index for a given Unicode character for @font. If you only want to determine whether the font has the glyph, use pango_xft_font_has_... |
| get_unknown_glyph | `Font.get_unknown_glyph(wc: gunichar) -> Pango.Glyph` | pango_xft_font_get_unknown_glyph |  | Returns the index of a glyph suitable for drawing @wc as an unknown character. Use PANGO_GET_UNKNOWN_GLYPH() instead. |
| has_char | `Font.has_char(wc: gunichar) -> gboolean` | pango_xft_font_has_char | 1.2 | Determines whether @font has a glyph for the codepoint @wc. Use pango_fc_font_has_char() instead. |
| lock_face | `Font.lock_face() -> freetype2.Face` | pango_xft_font_lock_face | 1.2 | Gets the FreeType `FT_Face` associated with a font. This face will be kept around until you call pango_xft_font_unlock_face(). Use pango_fc_font_lo... |
| unlock_face | `Font.unlock_face() -> none` | pango_xft_font_unlock_face | 1.2 | Releases a font previously obtained with pango_xft_font_lock_face(). Use pango_fc_font_unlock_face() instead. |

### PangoXft.FontMap

Parent: `PangoFc.FontMap` ?? Implements: `Gio.ListModel` ?? GType: `PangoXftFontMap` ?? C type: `PangoXftFontMap`

`PangoXftFontMap` is an implementation of `PangoFcFontMap` suitable for the Xft library as the renderer. It is used in to create fonts of type `Pan...

### PangoXft.Renderer

Parent: `Pango.Renderer` ?? GType: `PangoXftRenderer` ?? C type: `PangoXftRenderer`

`PangoXftRenderer` is a subclass of `PangoRenderer` used for rendering with Pango's Xft backend. It can be used directly, or it can be further subc...

#### Fields

| Field | Type |
| --- | --- |
| display | xlib.Display |
| draw | xft.Draw |
| parent_instance | Pango.Renderer |
| priv | RendererPrivate |
| screen | gint |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Renderer.new(display: xlib.Display, screen: gint) -> Pango.Renderer` | pango_xft_renderer_new | 1.8 | Create a new `PangoXftRenderer` to allow rendering Pango objects with the Xft library. You must call pango_xft_renderer_set_draw() before using the... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| set_default_color | `Renderer.set_default_color(default_color: Pango.Color) -> none` | pango_xft_renderer_set_default_color | 1.8 | Sets the default foreground color for a XftRenderer. |
| set_draw | `Renderer.set_draw(draw: xft.Draw) -> none` | pango_xft_renderer_set_draw | 1.8 | Sets the XftDraw object that the renderer is drawing to. The renderer must not be currently active. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| display | gpointer | write, construct-only |  |
| screen | gint | write, construct-only |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| composite_glyphs | `composite_glyphs(xft_font: xft.Font, glyphs: xft.GlyphSpec, n_glyphs: gint) -> none` |  |  | draw the specified glyphs using the current foreground color and other foreground attributes |
| composite_trapezoids | `composite_trapezoids(part: Pango.RenderPart, trapezoids: xlib.XTrapezoid, n_trapezoids: gint) -> none` |  |  | draw the specified trapezoids using the current color and other attributes for @part |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| RendererClass |  | 0 | 0 | 0 | The class structure for `PangoXftRenderer` |
| RendererPrivate |  | 0 | 0 | 0 |  |

### PangoXft.RendererClass

C type: `PangoXftRendererClass`

The class structure for `PangoXftRenderer`

#### Fields

| Field | Type |
| --- | --- |
| composite_glyphs | none |
| composite_trapezoids | none |
| parent_class | Pango.RendererClass |

### PangoXft.RendererPrivate

C type: `PangoXftRendererPrivate`

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_context | `get_context(display: xlib.Display, screen: gint) -> Pango.Context` | pango_xft_get_context |  | Retrieves a `PangoContext` appropriate for rendering with Xft fonts on the given screen of the given display. |
| get_font_map | `get_font_map(display: xlib.Display, screen: gint) -> Pango.FontMap` | pango_xft_get_font_map | 1.2 | Returns the `PangoXftFontMap` for the given display and screen. The fontmap is owned by Pango and will be valid until the display is closed. |
| picture_render | `picture_render(display: xlib.Display, src_picture: xlib.Picture, dest_picture: xlib.Picture, font: Pango.Font, glyphs: Pango.GlyphString, x: gint, y: gint) -> none` | pango_xft_picture_render |  | Renders a `PangoGlyphString` onto an Xrender Picture object. |
| render | `render(draw: xft.Draw, color: xft.Color, font: Pango.Font, glyphs: Pango.GlyphString, x: gint, y: gint) -> none` | pango_xft_render |  | Renders a `PangoGlyphString` onto an XftDraw object wrapping an X drawable. |
| render_layout | `render_layout(draw: xft.Draw, color: xft.Color, layout: Pango.Layout, x: gint, y: gint) -> none` | pango_xft_render_layout | 1.8 | Render a `PangoLayout` onto a XftDraw |
| render_layout_line | `render_layout_line(draw: xft.Draw, color: xft.Color, line: Pango.LayoutLine, x: gint, y: gint) -> none` | pango_xft_render_layout_line | 1.8 | Render a `PangoLayoutLine` onto a XftDraw |
| render_transformed | `render_transformed(draw: xft.Draw, color: xft.Color, matrix: Pango.Matrix?, font: Pango.Font, glyphs: Pango.GlyphString, x: gint, y: gint) -> none` | pango_xft_render_transformed | 1.8 | Renders a `PangoGlyphString` onto a XftDraw, possibly transforming the layed-out coordinates through a transformation matrix. Note that the transfo... |
| set_default_substitute | `set_default_substitute(display: xlib.Display, screen: gint, func: SubstituteFunc, data: gpointer?, notify: GLib.DestroyNotify) -> none` | pango_xft_set_default_substitute | 1.2 | Sets a function that will be called to do final configuration substitution on a #FcPattern before it is used to load the font. This function can be... |
| shutdown_display | `shutdown_display(display: xlib.Display, screen: gint) -> none` | pango_xft_shutdown_display | 1.2 | Release any resources that have been cached for the combination of @display and @screen. Note that when the X display is closed, resources are rele... |
| substitute_changed | `substitute_changed(display: xlib.Display, screen: gint) -> none` | pango_xft_substitute_changed | 1.2 | Call this function any time the results of the default substitution function set with pango_xft_set_default_substitute() change. That is, if your s... |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| SubstituteFunc | `SubstituteFunc(pattern: fontconfig.Pattern, data: gpointer?) -> none` |  |  | Function type for doing final config tweaking on prepared FcPatterns. |

