# PangoFc 1.0

SQGI import: `import("PangoFc", "1.0")`

Packages: `pangofc`
Includes: `Pango-1.0`, `fontconfig-2.0`
Libraries: `libpangoft2-1.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 3 |
| Interfaces | 0 |
| Records | 4 |
| Unions | 0 |
| Enums | 0 |
| Flags | 0 |
| Functions | 0 |
| Callbacks | 2 |
| Constants | 5 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Decoder | GObject.Object | 0 | 0 | 2 | `PangoFcDecoder` is a virtual base class that implementations will inherit from. It's the interface that is used to define a custom encoding for a ... |
| Font | Pango.Font | 0 | 0 | 9 | `PangoFcFont` is a base class for font implementations using the Fontconfig and FreeType libraries. It is used in onjunction with [class@PangoFc.Fo... |
| FontMap | Pango.FontMap | 0 | 0 | 11 | `PangoFcFontMap` is a base class for font map implementations using the Fontconfig and FreeType libraries. It is used in the Xft and FreeType backe... |

### PangoFc.Decoder

Parent: `GObject.Object` ?? GType: `PangoFcDecoder` ?? C type: `PangoFcDecoder` ?? Abstract

`PangoFcDecoder` is a virtual base class that implementations will inherit from. It's the interface that is used to define a custom encoding for a ...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_charset | `Decoder.get_charset(fcfont: Font) -> fontconfig.CharSet` | pango_fc_decoder_get_charset | 1.6 | Generates an `FcCharSet` of supported characters for the @fcfont given. The returned `FcCharSet` will be a reference to an internal value stored by... |
| get_glyph | `Decoder.get_glyph(fcfont: Font, wc: guint32) -> Pango.Glyph` | pango_fc_decoder_get_glyph | 1.6 | Generates a `PangoGlyph` for the given Unicode point using the custom decoder. For complex scripts where there can be multiple glyphs for a single ... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_charset | `get_charset(fcfont: Font) -> fontconfig.CharSet` |  | 1.6 | Generates an `FcCharSet` of supported characters for the @fcfont given. The returned `FcCharSet` will be a reference to an internal value stored by... |
| get_glyph | `get_glyph(fcfont: Font, wc: guint32) -> Pango.Glyph` |  | 1.6 | Generates a `PangoGlyph` for the given Unicode point using the custom decoder. For complex scripts where there can be multiple glyphs for a single ... |

### PangoFc.Font

Parent: `Pango.Font` ?? GType: `PangoFcFont` ?? C type: `PangoFcFont` ?? Abstract

`PangoFcFont` is a base class for font implementations using the Fontconfig and FreeType libraries. It is used in onjunction with [class@PangoFc.Fo...

#### Fields

| Field | Type |
| --- | --- |
| description | Pango.FontDescription |
| font_pattern | fontconfig.Pattern |
| fontmap | Pango.FontMap |
| is_hinted | guint |
| is_transformed | guint |
| matrix | Pango.Matrix |
| metrics_by_lang | GLib.SList |
| parent_instance | Pango.Font |
| priv | gpointer |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| description_from_pattern | `description_from_pattern(pattern: fontconfig.Pattern, include_size: gboolean) -> Pango.FontDescription` | pango_fc_font_description_from_pattern | 1.4 | Creates a `PangoFontDescription` that matches the specified Fontconfig pattern as closely as possible. Many possible Fontconfig pattern values, suc... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_glyph | `Font.get_glyph(wc: gunichar) -> guint` | pango_fc_font_get_glyph | 1.4 | Gets the glyph index for a given Unicode character for @font. If you only want to determine whether the font has the glyph, use [method@PangoFc.Fon... |
| get_languages | `Font.get_languages() -> Pango.Language` | pango_fc_font_get_languages | 1.48 | Returns the languages that are supported by @font. This corresponds to the FC_LANG member of the FcPattern. The returned array is only valid as lon... |
| get_pattern | `Font.get_pattern() -> fontconfig.Pattern` | pango_fc_font_get_pattern | 1.48 | Returns the FcPattern that @font is based on. |
| get_unknown_glyph | `Font.get_unknown_glyph(wc: gunichar) -> Pango.Glyph` | pango_fc_font_get_unknown_glyph | 1.4 | Returns the index of a glyph suitable for drawing @wc as an unknown character. Use PANGO_GET_UNKNOWN_GLYPH() instead. |
| has_char | `Font.has_char(wc: gunichar) -> gboolean` | pango_fc_font_has_char | 1.4 | Determines whether @font has a glyph for the codepoint @wc. |
| kern_glyphs | `Font.kern_glyphs(glyphs: Pango.GlyphString) -> none` | pango_fc_font_kern_glyphs | 1.4 | This function used to adjust each adjacent pair of glyphs in @glyphs according to kerning information in @font. Since 1.44, it does nothing. |
| lock_face | `Font.lock_face() -> freetype2.Face` | pango_fc_font_lock_face | 1.4 | Gets the FreeType `FT_Face` associated with a font. This face will be kept around until you call [method@PangoFc.Font.unlock_face]. |
| unlock_face | `Font.unlock_face() -> none` | pango_fc_font_unlock_face | 1.4 | Releases a font previously obtained with [method@PangoFc.Font.lock_face]. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| fontmap | FontMap | read, write | The PangoFc font map this font is associated with. |
| pattern | gpointer | read, write, construct-only | The fontconfig pattern for this font. |

### PangoFc.FontMap

Parent: `Pango.FontMap` ?? Implements: `Gio.ListModel` ?? GType: `PangoFcFontMap` ?? C type: `PangoFcFontMap` ?? Abstract

`PangoFcFontMap` is a base class for font map implementations using the Fontconfig and FreeType libraries. It is used in the Xft and FreeType backe...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_decoder_find_func | `FontMap.add_decoder_find_func(findfunc: DecoderFindFunc, user_data: gpointer?, dnotify: GLib.DestroyNotify) -> none` | pango_fc_font_map_add_decoder_find_func | 1.6 | This function saves a callback method in the `PangoFcFontMap` that will be called whenever new fonts are created. If the function returns a `PangoF... |
| cache_clear | `FontMap.cache_clear() -> none` | pango_fc_font_map_cache_clear | 1.4 | Clear all cached information and fontsets for this font map. This should be called whenever there is a change in the output of the default_substitu... |
| config_changed | `FontMap.config_changed() -> none` | pango_fc_font_map_config_changed | 1.38 | Informs font map that the fontconfig configuration (i.e., FcConfig object) used by this font map has changed. This currently calls [method@PangoFc.... |
| create_context | `FontMap.create_context() -> Pango.Context` | pango_fc_font_map_create_context | 1.4 | Creates a new context for this fontmap. This function is intended only for backend implementations deriving from `PangoFcFontMap`; it is possible t... |
| find_decoder | `FontMap.find_decoder(pattern: fontconfig.Pattern) -> Decoder` | pango_fc_font_map_find_decoder | 1.26 | Finds the decoder to use for @pattern. Decoders can be added to a font map using [method@PangoFc.FontMap.add_decoder_find_func]. |
| get_config | `FontMap.get_config() -> fontconfig.Config` | pango_fc_font_map_get_config | 1.38 | Fetches the `FcConfig` attached to a font map. See also: [method@PangoFc.FontMap.set_config]. |
| get_hb_face | `FontMap.get_hb_face(fcfont: Font) -> HarfBuzz.face_t` | pango_fc_font_map_get_hb_face | 1.44 | Retrieves the `hb_face_t` for the given `PangoFcFont`. |
| set_config | `FontMap.set_config(fcconfig: fontconfig.Config?) -> none` | pango_fc_font_map_set_config | 1.38 | Set the `FcConfig` for this font map to use. The default value is %NULL, which causes Fontconfig to use its global "current config". You can create... |
| set_default_substitute | `FontMap.set_default_substitute(func: SubstituteFunc, data: gpointer?, notify: GLib.DestroyNotify) -> none` | pango_fc_font_map_set_default_substitute | 1.48 | Sets a function that will be called to do final configuration substitution on a `FcPattern` before it is used to load the font. This function can b... |
| shutdown | `FontMap.shutdown() -> none` | pango_fc_font_map_shutdown | 1.4 | Clears all cached information for the fontmap and marks all fonts open for the fontmap as dead. See the shutdown() virtual function of `PangoFcFont... |
| substitute_changed | `FontMap.substitute_changed() -> none` | pango_fc_font_map_substitute_changed | 1.48 | Call this function any time the results of the default substitution function set with [method@PangoFc.FontMap.set_default_substitute] change. That ... |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| DecoderClass |  | 0 | 0 | 0 | Class structure for `PangoFcDecoder`. |
| FontClass |  | 0 | 0 | 0 |  |
| FontMapClass |  | 0 | 0 | 0 |  |
| FontMapPrivate |  | 0 | 0 | 0 |  |

### PangoFc.DecoderClass

C type: `PangoFcDecoderClass`

Class structure for `PangoFcDecoder`.

#### Fields

| Field | Type |
| --- | --- |
| _pango_reserved1 | none |
| _pango_reserved2 | none |
| _pango_reserved3 | none |
| _pango_reserved4 | none |
| get_charset | fontconfig.CharSet |
| get_glyph | Pango.Glyph |
| parent_class | GObject.ObjectClass |

### PangoFc.FontClass

C type: `PangoFcFontClass`

### PangoFc.FontMapClass

C type: `PangoFcFontMapClass`

### PangoFc.FontMapPrivate

C type: `PangoFcFontMapPrivate`

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| DecoderFindFunc | `DecoderFindFunc(pattern: fontconfig.Pattern, user_data: gpointer?) -> Decoder` |  |  | Callback function passed to [method@PangoFc.FontMap.add_decoder_find_func]. |
| SubstituteFunc | `SubstituteFunc(pattern: fontconfig.Pattern, data: gpointer?) -> none` |  |  | Function type for doing final config tweaking on prepared `FcPattern`s. |

## Constants

| Name | Type |
| --- | --- |
| FONT_FEATURES | utf8 |
| FONT_VARIATIONS | utf8 |
| GRAVITY | utf8 |
| PRGNAME | utf8 |
| VERSION | utf8 |

