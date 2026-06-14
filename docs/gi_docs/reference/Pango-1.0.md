# Pango 1.0

SQGI import: `import("Pango", "1.0")`

Packages: `pango`
Includes: `GObject-2.0`, `Gio-2.0`, `HarfBuzz-0.0`, `cairo-1.0`
Libraries: `libpango-1.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 10 |
| Interfaces | 0 |
| Records | 42 |
| Unions | 0 |
| Enums | 22 |
| Flags | 5 |
| Functions | 94 |
| Callbacks | 3 |
| Constants | 13 |
| Aliases | 3 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Context | GObject.Object | 0 | 0 | 24 | A `PangoContext` stores global information used to control the itemization process. The information stored by `PangoContext` includes the fontmap u... |
| Coverage | GObject.Object | 0 | 0 | 9 | A `PangoCoverage` structure is a map from Unicode characters to [enum@Pango.CoverageLevel] values. It is often necessary in Pango to determine if a... |
| Font | GObject.Object | 0 | 0 | 14 | A `PangoFont` is used to represent a font in a rendering-system-independent manner. |
| FontFace | GObject.Object | 0 | 0 | 5 | A `PangoFontFace` is used to represent a group of fonts with the same family, slant, weight, and width, but varying sizes. |
| FontFamily | GObject.Object | 0 | 0 | 5 | A `PangoFontFamily` is used to represent a family of related font faces. The font faces in a family share a common design, but differ in slant, wei... |
| FontMap | GObject.Object | 0 | 0 | 8 | A `PangoFontMap` represents the set of fonts available for a particular rendering system. This is a virtual object with implementations being speci... |
| Fontset | GObject.Object | 1 | 0 | 3 | A `PangoFontset` represents a set of `PangoFont` to use when rendering text. A `PangoFontset` is the result of resolving a `PangoFontDescription` a... |
| FontsetSimple | Fontset | 0 | 0 | 3 | `PangoFontsetSimple` is a implementation of the abstract `PangoFontset` base class as an array of fonts. When creating a `PangoFontsetSimple`, you ... |
| Layout | GObject.Object | 0 | 0 | 66 | A `PangoLayout` structure represents an entire paragraph of text. While complete access to the layout capabilities of Pango is provided using the d... |
| Renderer | GObject.Object | 0 | 0 | 19 | `PangoRenderer` is a base class for objects that can render text provided as `PangoGlyphString` or `PangoLayout`. By subclassing `PangoRenderer` an... |

### Pango.Context

Parent: `GObject.Object` ?? GType: `PangoContext` ?? C type: `PangoContext`

A `PangoContext` stores global information used to control the itemization process. The information stored by `PangoContext` includes the fontmap u...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Context.new() -> Context` | pango_context_new |  | Creates a new `PangoContext` initialized to default values. This function is not particularly useful as it should always be followed by a [method@P... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| changed | `Context.changed() -> none` | pango_context_changed | 1.32.4 | Forces a change in the context, which will cause any `PangoLayout` using this context to re-layout. This function is only useful when implementing ... |
| get_base_dir | `Context.get_base_dir() -> Direction` | pango_context_get_base_dir |  | Retrieves the base direction for the context. See [method@Pango.Context.set_base_dir]. |
| get_base_gravity | `Context.get_base_gravity() -> Gravity` | pango_context_get_base_gravity | 1.16 | Retrieves the base gravity for the context. See [method@Pango.Context.set_base_gravity]. |
| get_font_description | `Context.get_font_description() -> FontDescription` | pango_context_get_font_description |  | Retrieve the default font description for the context. |
| get_font_map | `Context.get_font_map() -> FontMap` | pango_context_get_font_map | 1.6 | Gets the `PangoFontMap` used to look up fonts for this context. |
| get_gravity | `Context.get_gravity() -> Gravity` | pango_context_get_gravity | 1.16 | Retrieves the gravity for the context. This is similar to [method@Pango.Context.get_base_gravity], except for when the base gravity is %PANGO_GRAVI... |
| get_gravity_hint | `Context.get_gravity_hint() -> GravityHint` | pango_context_get_gravity_hint | 1.16 | Retrieves the gravity hint for the context. See [method@Pango.Context.set_gravity_hint] for details. |
| get_language | `Context.get_language() -> Language` | pango_context_get_language |  | Retrieves the global language tag for the context. |
| get_matrix | `Context.get_matrix() -> Matrix` | pango_context_get_matrix | 1.6 | Gets the transformation matrix that will be applied when rendering with this context. See [method@Pango.Context.set_matrix]. |
| get_metrics | `Context.get_metrics(desc: FontDescription?, language: Language?) -> FontMetrics` | pango_context_get_metrics |  | Get overall metric information for a particular font description. Since the metrics may be substantially different for different scripts, a languag... |
| get_round_glyph_positions | `Context.get_round_glyph_positions() -> gboolean` | pango_context_get_round_glyph_positions | 1.44 | Returns whether font rendering with this context should round glyph positions and widths. |
| get_serial | `Context.get_serial() -> guint` | pango_context_get_serial | 1.32.4 | Returns the current serial number of @context. The serial number is initialized to an small number larger than zero when a new context is created a... |
| list_families | `Context.list_families(families: out FontFamily, n_families: out gint) -> none` | pango_context_list_families |  | List all families for a context. |
| load_font | `Context.load_font(desc: FontDescription) -> Font` | pango_context_load_font |  | Loads the font in one of the fontmaps in the context that is the closest match for @desc. |
| load_fontset | `Context.load_fontset(desc: FontDescription, language: Language) -> Fontset` | pango_context_load_fontset |  | Load a set of fonts in the context that can be used to render a font matching @desc. |
| set_base_dir | `Context.set_base_dir(direction: Direction) -> none` | pango_context_set_base_dir |  | Sets the base direction for the context. The base direction is used in applying the Unicode bidirectional algorithm; if the @direction is %PANGO_DI... |
| set_base_gravity | `Context.set_base_gravity(gravity: Gravity) -> none` | pango_context_set_base_gravity | 1.16 | Sets the base gravity for the context. The base gravity is used in laying vertical text out. |
| set_font_description | `Context.set_font_description(desc: FontDescription?) -> none` | pango_context_set_font_description |  | Set the default font description for the context |
| set_font_map | `Context.set_font_map(font_map: FontMap?) -> none` | pango_context_set_font_map |  | Sets the font map to be searched when fonts are looked-up in this context. This is only for internal use by Pango backends, a `PangoContext` obtain... |
| set_gravity_hint | `Context.set_gravity_hint(hint: GravityHint) -> none` | pango_context_set_gravity_hint | 1.16 | Sets the gravity hint for the context. The gravity hint is used in laying vertical text out, and is only relevant if gravity of the context as retu... |
| set_language | `Context.set_language(language: Language?) -> none` | pango_context_set_language |  | Sets the global language tag for the context. The default language for the locale of the running process can be found using [func@Pango.Language.ge... |
| set_matrix | `Context.set_matrix(matrix: Matrix?) -> none` | pango_context_set_matrix | 1.6 | Sets the transformation matrix that will be applied when rendering with this context. Note that reported metrics are in the user space coordinates ... |
| set_round_glyph_positions | `Context.set_round_glyph_positions(round_positions: gboolean) -> none` | pango_context_set_round_glyph_positions | 1.44 | Sets whether font rendering with this context should round glyph positions and widths to integral positions, in device units. This is useful when t... |

### Pango.Coverage

Parent: `GObject.Object` ?? GType: `PangoCoverage` ?? C type: `PangoCoverage`

A `PangoCoverage` structure is a map from Unicode characters to [enum@Pango.CoverageLevel] values. It is often necessary in Pango to determine if a...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Coverage.new() -> Coverage` | pango_coverage_new |  | Create a new `PangoCoverage` |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| from_bytes | `from_bytes(bytes: guint8, n_bytes: gint) -> Coverage` | pango_coverage_from_bytes |  | Convert data generated from [method@Pango.Coverage.to_bytes] back to a `PangoCoverage`. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Coverage.copy() -> Coverage` | pango_coverage_copy |  | Copy an existing `PangoCoverage`. |
| get | `Coverage.get(index_: gint) -> CoverageLevel` | pango_coverage_get |  | Determine whether a particular index is covered by @coverage. |
| max | `Coverage.max(other: Coverage) -> none` | pango_coverage_max |  | Set the coverage for each index in @coverage to be the max (better) value of the current coverage for the index and the coverage for the correspond... |
| ref | `Coverage.ref() -> Coverage` | pango_coverage_ref |  | Increase the reference count on the `PangoCoverage` by one. |
| set | `Coverage.set(index_: gint, level: CoverageLevel) -> none` | pango_coverage_set |  | Modify a particular index within @coverage |
| to_bytes | `Coverage.to_bytes(bytes: out guint8, n_bytes: out gint) -> none` | pango_coverage_to_bytes |  | Convert a `PangoCoverage` structure into a flat binary format. |
| unref | `Coverage.unref() -> none` | pango_coverage_unref |  | Decrease the reference count on the `PangoCoverage` by one. If the result is zero, free the coverage and all associated memory. |

### Pango.Font

Parent: `GObject.Object` ?? GType: `PangoFont` ?? C type: `PangoFont` ?? Abstract

A `PangoFont` is used to represent a font in a rendering-system-independent manner.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| descriptions_free | `descriptions_free(descs: FontDescription?, n_descs: gint) -> none` | pango_font_descriptions_free |  | Frees an array of font descriptions. |
| deserialize | `deserialize(context: Context, bytes: GLib.Bytes) -> Font throws` | pango_font_deserialize | 1.50 | Loads data previously created via [method@Pango.Font.serialize]. For a discussion of the supported format, see that function. Note: to verify that ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| describe | `Font.describe() -> FontDescription` | pango_font_describe |  | Returns a description of the font, with font size set in points. Use [method@Pango.Font.describe_with_absolute_size] if you want the font size in d... |
| describe_with_absolute_size | `Font.describe_with_absolute_size() -> FontDescription` | pango_font_describe_with_absolute_size | 1.14 | Returns a description of the font, with absolute font size set in device units. Use [method@Pango.Font.describe] if you want the font size in points. |
| get_coverage | `Font.get_coverage(language: Language) -> Coverage` | pango_font_get_coverage |  | Computes the coverage map for a given font and language tag. |
| get_face | `Font.get_face() -> FontFace` | pango_font_get_face | 1.46 | Gets the `PangoFontFace` to which @font belongs. |
| get_features | `Font.get_features(features: out HarfBuzz.feature_t, len: guint, num_features: inout guint) -> none` | pango_font_get_features | 1.44 | Obtain the OpenType features that are provided by the font. These are passed to the rendering system, together with features that have been explici... |
| get_font_map | `Font.get_font_map() -> FontMap` | pango_font_get_font_map | 1.10 | Gets the font map for which the font was created. Note that the font maintains a *weak* reference to the font map, so if all references to font map... |
| get_glyph_extents | `Font.get_glyph_extents(glyph: Glyph, ink_rect: out Rectangle?, logical_rect: out Rectangle?) -> none` | pango_font_get_glyph_extents |  | Gets the logical and ink extents of a glyph within a font. The coordinate system for each rectangle has its origin at the base line and horizontal ... |
| get_hb_font | `Font.get_hb_font() -> HarfBuzz.font_t` | pango_font_get_hb_font | 1.44 | Get a `hb_font_t` object backing this font. Note that the objects returned by this function are cached and immutable. If you need to make changes t... |
| get_languages | `Font.get_languages() -> Language` | pango_font_get_languages | 1.50 | Returns the languages that are supported by @font. If the font backend does not provide this information, %NULL is returned. For the fontconfig bac... |
| get_metrics | `Font.get_metrics(language: Language?) -> FontMetrics` | pango_font_get_metrics |  | Gets overall metric information for a font. Since the metrics may be substantially different for different scripts, a language tag can be provided ... |
| has_char | `Font.has_char(wc: gunichar) -> gboolean` | pango_font_has_char | 1.44 | Returns whether the font provides a glyph for this character. |
| serialize | `Font.serialize() -> GLib.Bytes` | pango_font_serialize | 1.50 | Serializes the @font in a way that can be uniquely identified. There are no guarantees about the format of the output across different versions of ... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| create_hb_font | `create_hb_font() -> HarfBuzz.font_t` |  |  |  |
| describe | `describe() -> FontDescription` |  |  | Returns a description of the font, with font size set in points. Use [method@Pango.Font.describe_with_absolute_size] if you want the font size in d... |
| describe_absolute | `describe_absolute() -> FontDescription` |  |  |  |
| get_coverage | `get_coverage(language: Language) -> Coverage` |  |  | Computes the coverage map for a given font and language tag. |
| get_features | `get_features(features: out HarfBuzz.feature_t, len: guint, num_features: inout guint) -> none` |  | 1.44 | Obtain the OpenType features that are provided by the font. These are passed to the rendering system, together with features that have been explici... |
| get_font_map | `get_font_map() -> FontMap` |  | 1.10 | Gets the font map for which the font was created. Note that the font maintains a *weak* reference to the font map, so if all references to font map... |
| get_glyph_extents | `get_glyph_extents(glyph: Glyph, ink_rect: out Rectangle?, logical_rect: out Rectangle?) -> none` |  |  | Gets the logical and ink extents of a glyph within a font. The coordinate system for each rectangle has its origin at the base line and horizontal ... |
| get_metrics | `get_metrics(language: Language?) -> FontMetrics` |  |  | Gets overall metric information for a font. Since the metrics may be substantially different for different scripts, a language tag can be provided ... |

### Pango.FontFace

Parent: `GObject.Object` ?? GType: `PangoFontFace` ?? C type: `PangoFontFace` ?? Abstract

A `PangoFontFace` is used to represent a group of fonts with the same family, slant, weight, and width, but varying sizes.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| describe | `FontFace.describe() -> FontDescription` | pango_font_face_describe |  | Returns a font description that matches the face. The resulting font description will have the family, style, variant, weight and stretch of the fa... |
| get_face_name | `FontFace.get_face_name() -> utf8` | pango_font_face_get_face_name |  | Gets a name representing the style of this face. Note that a font family may contain multiple faces with the same name (e.g. a variable and a non-v... |
| get_family | `FontFace.get_family() -> FontFamily` | pango_font_face_get_family | 1.46 | Gets the `PangoFontFamily` that @face belongs to. |
| is_synthesized | `FontFace.is_synthesized() -> gboolean` | pango_font_face_is_synthesized | 1.18 | Returns whether a `PangoFontFace` is synthesized. This will be the case if the underlying font rendering engine creates this face from another face... |
| list_sizes | `FontFace.list_sizes(sizes: out gint?, n_sizes: out gint) -> none` | pango_font_face_list_sizes | 1.4 | List the available sizes for a font. This is only applicable to bitmap fonts. For scalable fonts, stores %NULL at the location pointed to by @sizes... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| describe | `describe() -> FontDescription` |  |  | Returns a font description that matches the face. The resulting font description will have the family, style, variant, weight and stretch of the fa... |
| get_face_name | `get_face_name() -> utf8` |  |  | Gets a name representing the style of this face. Note that a font family may contain multiple faces with the same name (e.g. a variable and a non-v... |
| get_family | `get_family() -> FontFamily` |  | 1.46 | Gets the `PangoFontFamily` that @face belongs to. |
| is_synthesized | `is_synthesized() -> gboolean` |  | 1.18 | Returns whether a `PangoFontFace` is synthesized. This will be the case if the underlying font rendering engine creates this face from another face... |
| list_sizes | `list_sizes(sizes: out gint?, n_sizes: out gint) -> none` |  | 1.4 | List the available sizes for a font. This is only applicable to bitmap fonts. For scalable fonts, stores %NULL at the location pointed to by @sizes... |

### Pango.FontFamily

Parent: `GObject.Object` ?? Implements: `Gio.ListModel` ?? GType: `PangoFontFamily` ?? C type: `PangoFontFamily` ?? Abstract

A `PangoFontFamily` is used to represent a family of related font faces. The font faces in a family share a common design, but differ in slant, wei...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_face | `FontFamily.get_face(name: utf8?) -> FontFace` | pango_font_family_get_face | 1.46 | Gets the `PangoFontFace` of @family with the given name. |
| get_name | `FontFamily.get_name() -> utf8` | pango_font_family_get_name |  | Gets the name of the family. The name is unique among all fonts for the font backend and can be used in a `PangoFontDescription` to specify that a ... |
| is_monospace | `FontFamily.is_monospace() -> gboolean` | pango_font_family_is_monospace | 1.4 | A monospace font is a font designed for text display where the the characters form a regular grid. For Western languages this would mean that the a... |
| is_variable | `FontFamily.is_variable() -> gboolean` | pango_font_family_is_variable | 1.44 | A variable font is a font which has axes that can be modified to produce different faces. Such axes are also known as _variations_; see [method@Pan... |
| list_faces | `FontFamily.list_faces(faces: out FontFace?, n_faces: out gint) -> none` | pango_font_family_list_faces |  | Lists the different font faces that make up @family. The faces in a family share a common design, but differ in slant, weight, width and other aspe... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| is-monospace | gboolean | read | Is this a monospace font |
| is-variable | gboolean | read | Is this a variable font |
| item-type | GType | read | The type of items contained in this list. |
| n-items | guint | read | The number of items contained in this list. |
| name | utf8 | read | The name of the family |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_face | `get_face(name: utf8?) -> FontFace` |  | 1.46 | Gets the `PangoFontFace` of @family with the given name. |
| get_name | `get_name() -> utf8` |  |  | Gets the name of the family. The name is unique among all fonts for the font backend and can be used in a `PangoFontDescription` to specify that a ... |
| is_monospace | `is_monospace() -> gboolean` |  | 1.4 | A monospace font is a font designed for text display where the the characters form a regular grid. For Western languages this would mean that the a... |
| is_variable | `is_variable() -> gboolean` |  | 1.44 | A variable font is a font which has axes that can be modified to produce different faces. Such axes are also known as _variations_; see [method@Pan... |
| list_faces | `list_faces(faces: out FontFace?, n_faces: out gint) -> none` |  |  | Lists the different font faces that make up @family. The faces in a family share a common design, but differ in slant, weight, width and other aspe... |

### Pango.FontMap

Parent: `GObject.Object` ?? Implements: `Gio.ListModel` ?? GType: `PangoFontMap` ?? C type: `PangoFontMap` ?? Abstract

A `PangoFontMap` represents the set of fonts available for a particular rendering system. This is a virtual object with implementations being speci...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| changed | `FontMap.changed() -> none` | pango_font_map_changed | 1.34 | Forces a change in the context, which will cause any `PangoContext` using this fontmap to change. This function is only useful when implementing a ... |
| create_context | `FontMap.create_context() -> Context` | pango_font_map_create_context | 1.22 | Creates a `PangoContext` connected to @fontmap. This is equivalent to [ctor@Pango.Context.new] followed by [method@Pango.Context.set_font_map]. If ... |
| get_family | `FontMap.get_family(name: utf8) -> FontFamily` | pango_font_map_get_family | 1.46 | Gets a font family by name. |
| get_serial | `FontMap.get_serial() -> guint` | pango_font_map_get_serial | 1.32.4 | Returns the current serial number of @fontmap. The serial number is initialized to an small number larger than zero when a new fontmap is created a... |
| list_families | `FontMap.list_families(families: out FontFamily, n_families: out gint) -> none` | pango_font_map_list_families |  | List all families for a fontmap. Note that the returned families are not in any particular order. `PangoFontMap` also implemented the [iface@Gio.Li... |
| load_font | `FontMap.load_font(context: Context, desc: FontDescription) -> Font` | pango_font_map_load_font |  | Load the font in the fontmap that is the closest match for @desc. |
| load_fontset | `FontMap.load_fontset(context: Context, desc: FontDescription, language: Language) -> Fontset` | pango_font_map_load_fontset |  | Load a set of fonts in the fontmap that can be used to render a font matching @desc. |
| reload_font | `FontMap.reload_font(font: Font, scale: gdouble, context: Context?, variations: utf8?) -> Font` | pango_font_map_reload_font | 1.52 | Returns a new font that is like @font, except that its size is multiplied by @scale, its backend-dependent configuration (e.g. cairo font options) ... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| item-type | GType | read | The type of items contained in this list. |
| n-items | guint | read | The number of items contained in this list. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| changed | `changed() -> none` |  | 1.34 | Forces a change in the context, which will cause any `PangoContext` using this fontmap to change. This function is only useful when implementing a ... |
| get_face | `get_face(font: Font) -> FontFace` |  |  |  |
| get_family | `get_family(name: utf8) -> FontFamily` |  | 1.46 | Gets a font family by name. |
| get_serial | `get_serial() -> guint` |  | 1.32.4 | Returns the current serial number of @fontmap. The serial number is initialized to an small number larger than zero when a new fontmap is created a... |
| list_families | `list_families(families: out FontFamily, n_families: out gint) -> none` |  |  | List all families for a fontmap. Note that the returned families are not in any particular order. `PangoFontMap` also implemented the [iface@Gio.Li... |
| load_font | `load_font(context: Context, desc: FontDescription) -> Font` |  |  | Load the font in the fontmap that is the closest match for @desc. |
| load_fontset | `load_fontset(context: Context, desc: FontDescription, language: Language) -> Fontset` |  |  | Load a set of fonts in the fontmap that can be used to render a font matching @desc. |

### Pango.Fontset

Parent: `GObject.Object` ?? Subclasses: `FontsetSimple` ?? GType: `PangoFontset` ?? C type: `PangoFontset` ?? Abstract

A `PangoFontset` represents a set of `PangoFont` to use when rendering text. A `PangoFontset` is the result of resolving a `PangoFontDescription` a...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| foreach | `Fontset.foreach(func: FontsetForeachFunc, data: gpointer?) -> none` | pango_fontset_foreach | 1.4 | Iterates through all the fonts in a fontset, calling @func for each one. If @func returns %TRUE, that stops the iteration. |
| get_font | `Fontset.get_font(wc: guint) -> Font` | pango_fontset_get_font |  | Returns the font in the fontset that contains the best glyph for a Unicode character. |
| get_metrics | `Fontset.get_metrics() -> FontMetrics` | pango_fontset_get_metrics |  | Get overall metric information for the fonts in the fontset. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| foreach | `foreach(func: FontsetForeachFunc, data: gpointer?) -> none` |  | 1.4 | Iterates through all the fonts in a fontset, calling @func for each one. If @func returns %TRUE, that stops the iteration. |
| get_font | `get_font(wc: guint) -> Font` |  |  | Returns the font in the fontset that contains the best glyph for a Unicode character. |
| get_language | `get_language() -> Language` |  |  | a function to get the language of the fontset. |
| get_metrics | `get_metrics() -> FontMetrics` |  |  | Get overall metric information for the fonts in the fontset. |

### Pango.FontsetSimple

Parent: `Fontset` ?? GType: `PangoFontsetSimple` ?? C type: `PangoFontsetSimple`

`PangoFontsetSimple` is a implementation of the abstract `PangoFontset` base class as an array of fonts. When creating a `PangoFontsetSimple`, you ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `FontsetSimple.new(language: Language) -> FontsetSimple` | pango_fontset_simple_new |  | Creates a new `PangoFontsetSimple` for the given language. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append | `FontsetSimple.append(font: Font) -> none` | pango_fontset_simple_append |  | Adds a font to the fontset. The fontset takes ownership of @font. |
| size | `FontsetSimple.size() -> gint` | pango_fontset_simple_size |  | Returns the number of fonts in the fontset. |

### Pango.Layout

Parent: `GObject.Object` ?? GType: `PangoLayout` ?? C type: `PangoLayout`

A `PangoLayout` structure represents an entire paragraph of text. While complete access to the layout capabilities of Pango is provided using the d...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Layout.new(context: Context) -> Layout` | pango_layout_new |  | Create a new `PangoLayout` object with attributes initialized to default values for a particular `PangoContext`. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| deserialize | `deserialize(context: Context, bytes: GLib.Bytes, flags: LayoutDeserializeFlags) -> Layout throws` | pango_layout_deserialize | 1.50 | Loads data previously created via [method@Pango.Layout.serialize]. For a discussion of the supported format, see that function. Note: to verify tha... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| context_changed | `Layout.context_changed() -> none` | pango_layout_context_changed |  | Forces recomputation of any state in the `PangoLayout` that might depend on the layout's context. This function should be called if you make change... |
| copy | `Layout.copy() -> Layout` | pango_layout_copy |  | Creates a deep copy-by-value of the layout. The attribute list, tab array, and text from the original layout are all copied by value. |
| get_alignment | `Layout.get_alignment() -> Alignment` | pango_layout_get_alignment |  | Gets the alignment for the layout: how partial lines are positioned within the horizontal space available. |
| get_attributes | `Layout.get_attributes() -> AttrList` | pango_layout_get_attributes |  | Gets the attribute list for the layout, if any. |
| get_auto_dir | `Layout.get_auto_dir() -> gboolean` | pango_layout_get_auto_dir | 1.4 | Gets whether to calculate the base direction for the layout according to its contents. See [method@Pango.Layout.set_auto_dir]. |
| get_baseline | `Layout.get_baseline() -> gint` | pango_layout_get_baseline | 1.22 | Gets the Y position of baseline of the first line in @layout. |
| get_caret_pos | `Layout.get_caret_pos(index_: gint, strong_pos: out Rectangle?, weak_pos: out Rectangle?) -> none` | pango_layout_get_caret_pos | 1.50 | Given an index within a layout, determines the positions that of the strong and weak cursors if the insertion point is at that index. This is a var... |
| get_character_count | `Layout.get_character_count() -> gint` | pango_layout_get_character_count | 1.30 | Returns the number of Unicode characters in the the text of @layout. |
| get_context | `Layout.get_context() -> Context` | pango_layout_get_context |  | Retrieves the `PangoContext` used for this layout. |
| get_cursor_pos | `Layout.get_cursor_pos(index_: gint, strong_pos: out Rectangle?, weak_pos: out Rectangle?) -> none` | pango_layout_get_cursor_pos |  | Given an index within a layout, determines the positions that of the strong and weak cursors if the insertion point is at that index. The position ... |
| get_direction | `Layout.get_direction(index: gint) -> Direction` | pango_layout_get_direction | 1.46 | Gets the text direction at the given character position in @layout. |
| get_ellipsize | `Layout.get_ellipsize() -> EllipsizeMode` | pango_layout_get_ellipsize | 1.6 | Gets the type of ellipsization being performed for @layout. See [method@Pango.Layout.set_ellipsize]. Use [method@Pango.Layout.is_ellipsized] to que... |
| get_extents | `Layout.get_extents(ink_rect: out Rectangle?, logical_rect: out Rectangle?) -> none` | pango_layout_get_extents |  | Computes the logical and ink extents of @layout. Logical extents are usually what you want for positioning things. Note that both extents may have ... |
| get_font_description | `Layout.get_font_description() -> FontDescription` | pango_layout_get_font_description | 1.8 | Gets the font description for the layout, if any. |
| get_height | `Layout.get_height() -> gint` | pango_layout_get_height | 1.20 | Gets the height of layout used for ellipsization. See [method@Pango.Layout.set_height] for details. |
| get_indent | `Layout.get_indent() -> gint` | pango_layout_get_indent |  | Gets the paragraph indent width in Pango units. A negative value indicates a hanging indentation. |
| get_iter | `Layout.get_iter() -> LayoutIter` | pango_layout_get_iter |  | Returns an iterator to iterate over the visual extents of the layout. |
| get_justify | `Layout.get_justify() -> gboolean` | pango_layout_get_justify |  | Gets whether each complete line should be stretched to fill the entire width of the layout. |
| get_justify_last_line | `Layout.get_justify_last_line() -> gboolean` | pango_layout_get_justify_last_line | 1.50 | Gets whether the last line should be stretched to fill the entire width of the layout. |
| get_line | `Layout.get_line(line: gint) -> LayoutLine` | pango_layout_get_line |  | Retrieves a particular line from a `PangoLayout`. Use the faster [method@Pango.Layout.get_line_readonly] if you do not plan to modify the contents ... |
| get_line_count | `Layout.get_line_count() -> gint` | pango_layout_get_line_count |  | Retrieves the count of lines for the @layout. |
| get_line_readonly | `Layout.get_line_readonly(line: gint) -> LayoutLine` | pango_layout_get_line_readonly | 1.16 | Retrieves a particular line from a `PangoLayout`. This is a faster alternative to [method@Pango.Layout.get_line], but the user is not expected to m... |
| get_line_spacing | `Layout.get_line_spacing() -> gfloat` | pango_layout_get_line_spacing | 1.44 | Gets the line spacing factor of @layout. See [method@Pango.Layout.set_line_spacing]. |
| get_lines | `Layout.get_lines() -> GLib.SList` | pango_layout_get_lines |  | Returns the lines of the @layout as a list. Use the faster [method@Pango.Layout.get_lines_readonly] if you do not plan to modify the contents of th... |
| get_lines_readonly | `Layout.get_lines_readonly() -> GLib.SList` | pango_layout_get_lines_readonly | 1.16 | Returns the lines of the @layout as a list. This is a faster alternative to [method@Pango.Layout.get_lines], but the user is not expected to modify... |
| get_log_attrs | `Layout.get_log_attrs(attrs: out LogAttr, n_attrs: out gint) -> none` | pango_layout_get_log_attrs |  | Retrieves an array of logical attributes for each character in the @layout. |
| get_log_attrs_readonly | `Layout.get_log_attrs_readonly(n_attrs: out gint) -> LogAttr` | pango_layout_get_log_attrs_readonly | 1.30 | Retrieves an array of logical attributes for each character in the @layout. This is a faster alternative to [method@Pango.Layout.get_log_attrs]. Th... |
| get_pixel_extents | `Layout.get_pixel_extents(ink_rect: out Rectangle?, logical_rect: out Rectangle?) -> none` | pango_layout_get_pixel_extents |  | Computes the logical and ink extents of @layout in device units. This function just calls [method@Pango.Layout.get_extents] followed by two [func@e... |
| get_pixel_size | `Layout.get_pixel_size(width: out gint?, height: out gint?) -> none` | pango_layout_get_pixel_size |  | Determines the logical width and height of a `PangoLayout` in device units. [method@Pango.Layout.get_size] returns the width and height scaled by %... |
| get_serial | `Layout.get_serial() -> guint` | pango_layout_get_serial | 1.32.4 | Returns the current serial number of @layout. The serial number is initialized to an small number larger than zero when a new layout is created and... |
| get_single_paragraph_mode | `Layout.get_single_paragraph_mode() -> gboolean` | pango_layout_get_single_paragraph_mode |  | Obtains whether @layout is in single paragraph mode. See [method@Pango.Layout.set_single_paragraph_mode]. |
| get_size | `Layout.get_size(width: out gint?, height: out gint?) -> none` | pango_layout_get_size |  | Determines the logical width and height of a `PangoLayout` in Pango units. This is simply a convenience function around [method@Pango.Layout.get_ex... |
| get_spacing | `Layout.get_spacing() -> gint` | pango_layout_get_spacing |  | Gets the amount of spacing between the lines of the layout. |
| get_tabs | `Layout.get_tabs() -> TabArray` | pango_layout_get_tabs |  | Gets the current `PangoTabArray` used by this layout. If no `PangoTabArray` has been set, then the default tabs are in use and %NULL is returned. D... |
| get_text | `Layout.get_text() -> utf8` | pango_layout_get_text |  | Gets the text in the layout. The returned text should not be freed or modified. |
| get_unknown_glyphs_count | `Layout.get_unknown_glyphs_count() -> gint` | pango_layout_get_unknown_glyphs_count | 1.16 | Counts the number of unknown glyphs in @layout. This function can be used to determine if there are any fonts available to render all characters in... |
| get_width | `Layout.get_width() -> gint` | pango_layout_get_width |  | Gets the width to which the lines of the `PangoLayout` should wrap. |
| get_wrap | `Layout.get_wrap() -> WrapMode` | pango_layout_get_wrap |  | Gets the wrap mode for the layout. Use [method@Pango.Layout.is_wrapped] to query whether any paragraphs were actually wrapped. |
| index_to_line_x | `Layout.index_to_line_x(index_: gint, trailing: gboolean, line: out gint?, x_pos: out gint?) -> none` | pango_layout_index_to_line_x |  | Converts from byte @index_ within the @layout to line and X position. The X position is measured from the left edge of the line. |
| index_to_pos | `Layout.index_to_pos(index_: gint, pos: out Rectangle) -> none` | pango_layout_index_to_pos |  | Converts from an index within a `PangoLayout` to the onscreen position corresponding to the grapheme at that index. The returns is represented as r... |
| is_ellipsized | `Layout.is_ellipsized() -> gboolean` | pango_layout_is_ellipsized | 1.16 | Queries whether the layout had to ellipsize any paragraphs. This returns %TRUE if the ellipsization mode for @layout is not %PANGO_ELLIPSIZE_NONE, ... |
| is_wrapped | `Layout.is_wrapped() -> gboolean` | pango_layout_is_wrapped | 1.16 | Queries whether the layout had to wrap any paragraphs. This returns %TRUE if a positive width is set on @layout, ellipsization mode of @layout is s... |
| move_cursor_visually | `Layout.move_cursor_visually(strong: gboolean, old_index: gint, old_trailing: gint, direction: gint, new_index: out gint, new_trailing: out gint) -> none` | pango_layout_move_cursor_visually |  | Computes a new cursor position from an old position and a direction. If @direction is positive, then the new position will cause the strong or weak... |
| serialize | `Layout.serialize(flags: LayoutSerializeFlags) -> GLib.Bytes` | pango_layout_serialize | 1.50 | Serializes the @layout for later deserialization via [func@Pango.Layout.deserialize]. There are no guarantees about the format of the output across... |
| set_alignment | `Layout.set_alignment(alignment: Alignment) -> none` | pango_layout_set_alignment |  | Sets the alignment for the layout: how partial lines are positioned within the horizontal space available. The default alignment is %PANGO_ALIGN_LEFT. |
| set_attributes | `Layout.set_attributes(attrs: AttrList?) -> none` | pango_layout_set_attributes |  | Sets the text attributes for a layout object. References @attrs, so the caller can unref its reference. |
| set_auto_dir | `Layout.set_auto_dir(auto_dir: gboolean) -> none` | pango_layout_set_auto_dir | 1.4 | Sets whether to calculate the base direction for the layout according to its contents. When this flag is on (the default), then paragraphs in @layo... |
| set_ellipsize | `Layout.set_ellipsize(ellipsize: EllipsizeMode) -> none` | pango_layout_set_ellipsize | 1.6 | Sets the type of ellipsization being performed for @layout. Depending on the ellipsization mode @ellipsize text is removed from the start, middle, ... |
| set_font_description | `Layout.set_font_description(desc: FontDescription?) -> none` | pango_layout_set_font_description |  | Sets the default font description for the layout. If no font description is set on the layout, the font description from the layout's context is used. |
| set_height | `Layout.set_height(height: gint) -> none` | pango_layout_set_height | 1.20 | Sets the height to which the `PangoLayout` should be ellipsized at. There are two different behaviors, based on whether @height is positive or nega... |
| set_indent | `Layout.set_indent(indent: gint) -> none` | pango_layout_set_indent |  | Sets the width in Pango units to indent each paragraph. A negative value of @indent will produce a hanging indentation. That is, the first line wil... |
| set_justify | `Layout.set_justify(justify: gboolean) -> none` | pango_layout_set_justify |  | Sets whether each complete line should be stretched to fill the entire width of the layout. Stretching is typically done by adding whitespace, but ... |
| set_justify_last_line | `Layout.set_justify_last_line(justify: gboolean) -> none` | pango_layout_set_justify_last_line | 1.50 | Sets whether the last line should be stretched to fill the entire width of the layout. This only has an effect if [method@Pango.Layout.set_justify]... |
| set_line_spacing | `Layout.set_line_spacing(factor: gfloat) -> none` | pango_layout_set_line_spacing | 1.44 | Sets a factor for line spacing. Typical values are: 0, 1, 1.5, 2. The default values is 0. If @factor is non-zero, lines are placed so that baselin... |
| set_markup | `Layout.set_markup(markup: utf8, length: gint) -> none` | pango_layout_set_markup |  | Sets the layout text and attribute list from marked-up text. See Pango Markup). Replaces the current text and attribute list. This is the same as [... |
| set_markup_with_accel | `Layout.set_markup_with_accel(markup: utf8, length: gint, accel_marker: gunichar, accel_char: out gunichar?) -> none` | pango_layout_set_markup_with_accel |  | Sets the layout text and attribute list from marked-up text. See Pango Markup). Replaces the current text and attribute list. If @accel_marker is n... |
| set_single_paragraph_mode | `Layout.set_single_paragraph_mode(setting: gboolean) -> none` | pango_layout_set_single_paragraph_mode |  | Sets the single paragraph mode of @layout. If @setting is %TRUE, do not treat newlines and similar characters as paragraph separators; instead, kee... |
| set_spacing | `Layout.set_spacing(spacing: gint) -> none` | pango_layout_set_spacing |  | Sets the amount of spacing in Pango units between the lines of the layout. When placing lines with spacing, Pango arranges things so that line2.top... |
| set_tabs | `Layout.set_tabs(tabs: TabArray?) -> none` | pango_layout_set_tabs |  | Sets the tabs to use for @layout, overriding the default tabs. `PangoLayout` will place content at the next tab position whenever it meets a Tab ch... |
| set_text | `Layout.set_text(text: utf8, length: gint) -> none` | pango_layout_set_text |  | Sets the text of the layout. This function validates @text and renders invalid UTF-8 with a placeholder glyph. Note that if you have used [method@P... |
| set_width | `Layout.set_width(width: gint) -> none` | pango_layout_set_width |  | Sets the width to which the lines of the `PangoLayout` should wrap or ellipsized. The default value is -1: no width set. |
| set_wrap | `Layout.set_wrap(wrap: WrapMode) -> none` | pango_layout_set_wrap |  | Sets the wrap mode. The wrap mode only has effect if a width is set on the layout with [method@Pango.Layout.set_width]. To turn off wrapping, set t... |
| write_to_file | `Layout.write_to_file(flags: LayoutSerializeFlags, filename: filename) -> gboolean throws` | pango_layout_write_to_file | 1.50 | A convenience method to serialize a layout to a file. It is equivalent to calling [method@Pango.Layout.serialize] followed by [func@GLib.file_set_c... |
| xy_to_index | `Layout.xy_to_index(x: gint, y: gint, index_: out gint, trailing: out gint) -> gboolean` | pango_layout_xy_to_index |  | Converts from X and Y position within a layout to the byte index to the character at that logical position. If the Y position is not inside the lay... |

### Pango.Renderer

Parent: `GObject.Object` ?? GType: `PangoRenderer` ?? C type: `PangoRenderer` ?? Abstract

`PangoRenderer` is a base class for objects that can render text provided as `PangoGlyphString` or `PangoLayout`. By subclassing `PangoRenderer` an...

#### Fields

| Field | Type |
| --- | --- |
| active_count | gint |
| matrix | Matrix |
| parent_instance | GObject.Object |
| priv | RendererPrivate |
| strikethrough | gboolean |
| underline | Underline |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| activate | `Renderer.activate() -> none` | pango_renderer_activate | 1.8 | Does initial setup before rendering operations on @renderer. [method@Pango.Renderer.deactivate] should be called when done drawing. Calls such as [... |
| deactivate | `Renderer.deactivate() -> none` | pango_renderer_deactivate | 1.8 | Cleans up after rendering operations on @renderer. See docs for [method@Pango.Renderer.activate]. |
| draw_error_underline | `Renderer.draw_error_underline(x: gint, y: gint, width: gint, height: gint) -> none` | pango_renderer_draw_error_underline | 1.8 | Draw a squiggly line that approximately covers the given rectangle in the style of an underline used to indicate a spelling error. The width of the... |
| draw_glyph | `Renderer.draw_glyph(font: Font, glyph: Glyph, x: gdouble, y: gdouble) -> none` | pango_renderer_draw_glyph | 1.8 | Draws a single glyph with coordinates in device space. |
| draw_glyph_item | `Renderer.draw_glyph_item(text: utf8?, glyph_item: GlyphItem, x: gint, y: gint) -> none` | pango_renderer_draw_glyph_item | 1.22 | Draws the glyphs in @glyph_item with the specified `PangoRenderer`, embedding the text associated with the glyphs in the output if the output forma... |
| draw_glyphs | `Renderer.draw_glyphs(font: Font, glyphs: GlyphString, x: gint, y: gint) -> none` | pango_renderer_draw_glyphs | 1.8 | Draws the glyphs in @glyphs with the specified `PangoRenderer`. |
| draw_layout | `Renderer.draw_layout(layout: Layout, x: gint, y: gint) -> none` | pango_renderer_draw_layout | 1.8 | Draws @layout with the specified `PangoRenderer`. This is equivalent to drawing the lines of the layout, at their respective positions relative to ... |
| draw_layout_line | `Renderer.draw_layout_line(line: LayoutLine, x: gint, y: gint) -> none` | pango_renderer_draw_layout_line | 1.8 | Draws @line with the specified `PangoRenderer`. This draws the glyph items that make up the line, as well as shapes, backgrounds and lines that are... |
| draw_rectangle | `Renderer.draw_rectangle(part: RenderPart, x: gint, y: gint, width: gint, height: gint) -> none` | pango_renderer_draw_rectangle | 1.8 | Draws an axis-aligned rectangle in user space coordinates with the specified `PangoRenderer`. This should be called while @renderer is already acti... |
| draw_trapezoid | `Renderer.draw_trapezoid(part: RenderPart, y1_: gdouble, x11: gdouble, x21: gdouble, y2: gdouble, x12: gdouble, x22: gdouble) -> none` | pango_renderer_draw_trapezoid | 1.8 | Draws a trapezoid with the parallel sides aligned with the X axis using the given `PangoRenderer`; coordinates are in device space. |
| get_alpha | `Renderer.get_alpha(part: RenderPart) -> guint16` | pango_renderer_get_alpha | 1.38 | Gets the current alpha for the specified part. |
| get_color | `Renderer.get_color(part: RenderPart) -> Color` | pango_renderer_get_color | 1.8 | Gets the current rendering color for the specified part. |
| get_layout | `Renderer.get_layout() -> Layout` | pango_renderer_get_layout | 1.20 | Gets the layout currently being rendered using @renderer. Calling this function only makes sense from inside a subclass's methods, like in its draw... |
| get_layout_line | `Renderer.get_layout_line() -> LayoutLine` | pango_renderer_get_layout_line | 1.20 | Gets the layout line currently being rendered using @renderer. Calling this function only makes sense from inside a subclass's methods, like in its... |
| get_matrix | `Renderer.get_matrix() -> Matrix` | pango_renderer_get_matrix | 1.8 | Gets the transformation matrix that will be applied when rendering. See [method@Pango.Renderer.set_matrix]. |
| part_changed | `Renderer.part_changed(part: RenderPart) -> none` | pango_renderer_part_changed | 1.8 | Informs Pango that the way that the rendering is done for @part has changed. This should be called if the rendering changes in a way that would pre... |
| set_alpha | `Renderer.set_alpha(part: RenderPart, alpha: guint16) -> none` | pango_renderer_set_alpha | 1.38 | Sets the alpha for part of the rendering. Note that the alpha may only be used if a color is specified for @part as well. |
| set_color | `Renderer.set_color(part: RenderPart, color: Color?) -> none` | pango_renderer_set_color | 1.8 | Sets the color for part of the rendering. Also see [method@Pango.Renderer.set_alpha]. |
| set_matrix | `Renderer.set_matrix(matrix: Matrix?) -> none` | pango_renderer_set_matrix | 1.8 | Sets the transformation matrix that will be applied when rendering. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| begin | `begin() -> none` |  |  | Do renderer-specific initialization before drawing |
| draw_error_underline | `draw_error_underline(x: gint, y: gint, width: gint, height: gint) -> none` |  | 1.8 | Draw a squiggly line that approximately covers the given rectangle in the style of an underline used to indicate a spelling error. The width of the... |
| draw_glyph | `draw_glyph(font: Font, glyph: Glyph, x: gdouble, y: gdouble) -> none` |  | 1.8 | Draws a single glyph with coordinates in device space. |
| draw_glyph_item | `draw_glyph_item(text: utf8?, glyph_item: GlyphItem, x: gint, y: gint) -> none` |  | 1.22 | Draws the glyphs in @glyph_item with the specified `PangoRenderer`, embedding the text associated with the glyphs in the output if the output forma... |
| draw_glyphs | `draw_glyphs(font: Font, glyphs: GlyphString, x: gint, y: gint) -> none` |  | 1.8 | Draws the glyphs in @glyphs with the specified `PangoRenderer`. |
| draw_rectangle | `draw_rectangle(part: RenderPart, x: gint, y: gint, width: gint, height: gint) -> none` |  | 1.8 | Draws an axis-aligned rectangle in user space coordinates with the specified `PangoRenderer`. This should be called while @renderer is already acti... |
| draw_shape | `draw_shape(attr: AttrShape, x: gint, y: gint) -> none` |  |  | draw content for a glyph shaped with `PangoAttrShape` @x, @y are the coordinates of the left edge of the baseline, in user coordinates. |
| draw_trapezoid | `draw_trapezoid(part: RenderPart, y1_: gdouble, x11: gdouble, x21: gdouble, y2: gdouble, x12: gdouble, x22: gdouble) -> none` |  | 1.8 | Draws a trapezoid with the parallel sides aligned with the X axis using the given `PangoRenderer`; coordinates are in device space. |
| end | `end() -> none` |  |  | Do renderer-specific cleanup after drawing |
| part_changed | `part_changed(part: RenderPart) -> none` |  | 1.8 | Informs Pango that the way that the rendering is done for @part has changed. This should be called if the rendering changes in a way that would pre... |
| prepare_run | `prepare_run(run: LayoutRun) -> none` |  |  | updates the renderer for a new run |

## Enums

### Pango.Alignment

GType: `PangoAlignment` ?? C type: `PangoAlignment`

`PangoAlignment` describes how to align the lines of a `PangoLayout` within the available space. If the `PangoLayout` is set to justify using [meth...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| center | 1 | center | Center the line within the available space |
| left | 0 | left | Put all available space on the right |
| right | 2 | right | Put all available space on the left |

### Pango.AttrType

GType: `PangoAttrType` ?? C type: `PangoAttrType`

The `PangoAttrType` distinguishes between different types of attributes. Along with the predefined values, it is possible to allocate additional va...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| absolute_line_height | 32 | absolute-line-height | line height ([struct@Pango.AttrInt]). Since: 1.50 |
| absolute_size | 20 | absolute-size | font size in pixels scaled by %PANGO_SCALE ([struct@Pango.AttrInt]) |
| allow_breaks | 26 | allow-breaks | whether breaks are allowed ([struct@Pango.AttrInt]). Since 1.44 |
| background | 10 | background | background color ([struct@Pango.AttrColor]) |
| background_alpha | 25 | background-alpha | background alpha ([struct@Pango.AttrInt]). Since 1.38 |
| baseline_shift | 36 | baseline-shift | baseline displacement ([struct@Pango.AttrInt]). Since 1.50 |
| fallback | 16 | fallback | whether fallback is enabled ([struct@Pango.AttrInt]) |
| family | 2 | family | font family name list ([struct@Pango.AttrString]) |
| font_desc | 8 | font-desc | font description ([struct@Pango.AttrFontDesc]) |
| font_features | 23 | font-features | OpenType font features ([struct@Pango.AttrFontFeatures]). Since 1.38 |
| font_scale | 37 | font-scale | font-relative size change ([struct@Pango.AttrInt]). Since 1.50 |
| foreground | 9 | foreground | foreground color ([struct@Pango.AttrColor]) |
| foreground_alpha | 24 | foreground-alpha | foreground alpha ([struct@Pango.AttrInt]). Since 1.38 |
| gravity | 21 | gravity | base text gravity ([struct@Pango.AttrInt]) |
| gravity_hint | 22 | gravity-hint | gravity hint ([struct@Pango.AttrInt]) |
| insert_hyphens | 28 | insert-hyphens | whether to insert hyphens at intra-word line breaks ([struct@Pango.AttrInt]). Since 1.44 |
| invalid | 0 | invalid | does not happen |
| language | 1 | language | language ([struct@Pango.AttrLanguage]) |
| letter_spacing | 17 | letter-spacing | letter spacing ([struct@PangoAttrInt]) |
| line_height | 31 | line-height | line height factor ([struct@Pango.AttrFloat]). Since: 1.50 |
| overline | 29 | overline | whether the text has an overline ([struct@Pango.AttrInt]). Since 1.46 |
| overline_color | 30 | overline-color | overline color ([struct@Pango.AttrColor]). Since 1.46 |
| rise | 13 | rise | baseline displacement ([struct@Pango.AttrInt]) |
| scale | 15 | scale | font size scale factor ([struct@Pango.AttrFloat]) |
| sentence | 35 | sentence | override segmentation to classify the range of the attribute as a single sentence ([struct@Pango.AttrInt]). Since 1.50 |
| shape | 14 | shape | shape ([struct@Pango.AttrShape]) |
| show | 27 | show | how to render invisible characters ([struct@Pango.AttrInt]). Since 1.44 |
| size | 7 | size | font size in points scaled by %PANGO_SCALE ([struct@Pango.AttrInt]) |
| stretch | 6 | stretch | font stretch ([struct@Pango.AttrInt]) |
| strikethrough | 12 | strikethrough | whether the text is struck-through ([struct@Pango.AttrInt]) |
| strikethrough_color | 19 | strikethrough-color | strikethrough color ([struct@Pango.AttrColor]) |
| style | 3 | style | font slant style ([struct@Pango.AttrInt]) |
| text_transform | 33 | text-transform |  |
| underline | 11 | underline | whether the text has an underline ([struct@Pango.AttrInt]) |
| underline_color | 18 | underline-color | underline color ([struct@Pango.AttrColor]) |
| variant | 5 | variant | font variant (normal or small caps) ([struct@Pango.AttrInt]) |
| weight | 4 | weight | font weight ([struct@Pango.AttrInt]) |
| word | 34 | word | override segmentation to classify the range of the attribute as a single word ([struct@Pango.AttrInt]). Since 1.50 |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_name | `get_name(type: AttrType) -> utf8` | pango_attr_type_get_name | 1.22 | Fetches the attribute type name. The attribute type name is the string passed in when registering the type using [func@Pango.AttrType.register]. Th... |
| register | `register(name: utf8) -> AttrType` | pango_attr_type_register |  | Allocate a new attribute type ID. The attribute type name can be accessed later by using [func@Pango.AttrType.get_name]. |

### Pango.BaselineShift

GType: `PangoBaselineShift` ?? C type: `PangoBaselineShift`

An enumeration that affects baseline shifts between runs.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | Leave the baseline unchanged |
| subscript | 2 | subscript | Shift the baseline to the subscript position, relative to the previous run |
| superscript | 1 | superscript | Shift the baseline to the superscript position, relative to the previous run |

### Pango.BidiType

GType: `PangoBidiType` ?? C type: `PangoBidiType`

`PangoBidiType` represents the bidirectional character type of a Unicode character. The values in this enumeration are specified by the Unicode bid...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| al | 4 | al | Right-to-Left Arabic |
| an | 11 | an | Arabic Number |
| b | 15 | b | Paragraph Separator |
| bn | 14 | bn | Boundary Neutral |
| cs | 12 | cs | Common Number Separator |
| en | 8 | en | European Number |
| es | 9 | es | European Number Separator |
| et | 10 | et | European Number Terminator |
| fsi | 21 | fsi | First strong isolate. Since 1.48.6 |
| l | 0 | l | Left-to-Right |
| lre | 1 | lre | Left-to-Right Embedding |
| lri | 19 | lri | Left-to-Right isolate. Since 1.48.6 |
| lro | 2 | lro | Left-to-Right Override |
| nsm | 13 | nsm | Nonspacing Mark |
| on | 18 | on | Other Neutrals |
| pdf | 7 | pdf | Pop Directional Format |
| pdi | 22 | pdi | Pop directional isolate. Since 1.48.6 |
| r | 3 | r | Right-to-Left |
| rle | 5 | rle | Right-to-Left Embedding |
| rli | 20 | rli | Right-to-Left isolate. Since 1.48.6 |
| rlo | 6 | rlo | Right-to-Left Override |
| s | 16 | s | Segment Separator |
| ws | 17 | ws | Whitespace |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| for_unichar | `for_unichar(ch: gunichar) -> BidiType` | pango_bidi_type_for_unichar | 1.22 | Determines the bidirectional type of a character. The bidirectional type is specified in the Unicode Character Database. A simplified version of th... |

### Pango.CoverageLevel

GType: `PangoCoverageLevel` ?? C type: `PangoCoverageLevel`

`PangoCoverageLevel` is used to indicate how well a font can represent a particular Unicode character for a particular script. Since 1.44, only %PA...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| approximate | 2 | approximate | The character is represented as basically the correct graphical form, but with a stylistic variant inappropriate for the current script. |
| exact | 3 | exact | The character is represented as the correct graphical form. |
| fallback | 1 | fallback | The character is represented in a way that may be comprehensible but is not the correct graphical form. For instance, a Hangul character represente... |
| none | 0 | none | The character is not representable with the font. |

### Pango.Direction

GType: `PangoDirection` ?? C type: `PangoDirection`

`PangoDirection` represents a direction in the Unicode bidirectional algorithm. Not every value in this enumeration makes sense for every usage of ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| ltr | 0 | ltr | A strong left-to-right direction |
| neutral | 6 | neutral | No direction specified |
| rtl | 1 | rtl | A strong right-to-left direction |
| ttb_ltr | 2 | ttb-ltr | Deprecated value; treated the same as `PANGO_DIRECTION_RTL`. |
| ttb_rtl | 3 | ttb-rtl | Deprecated value; treated the same as `PANGO_DIRECTION_LTR` |
| weak_ltr | 4 | weak-ltr | A weak left-to-right direction |
| weak_rtl | 5 | weak-rtl | A weak right-to-left direction |

### Pango.EllipsizeMode

GType: `PangoEllipsizeMode` ?? C type: `PangoEllipsizeMode`

`PangoEllipsizeMode` describes what sort of ellipsization should be applied to text. In the ellipsization process characters are removed from the t...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| end | 3 | end | Omit characters at the end of the text |
| middle | 2 | middle | Omit characters in the middle of the text |
| none | 0 | none | No ellipsization |
| start | 1 | start | Omit characters at the start of the text |

### Pango.FontScale

GType: `PangoFontScale` ?? C type: `PangoFontScale`

An enumeration that affects font sizes for superscript and subscript positioning and for (emulated) Small Caps.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | Leave the font size unchanged |
| small_caps | 3 | small-caps | Change the font to a size suitable for Small Caps |
| subscript | 2 | subscript | Change the font to a size suitable for subscripts |
| superscript | 1 | superscript | Change the font to a size suitable for superscripts |

### Pango.Gravity

GType: `PangoGravity` ?? C type: `PangoGravity`

`PangoGravity` represents the orientation of glyphs in a segment of text. This is useful when rendering vertical text layouts. In those situations,...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| auto | 4 | auto | Gravity is resolved from the context matrix |
| east | 1 | east | Glyphs are rotated 90 degrees counter-clockwise. <img align="right" valign="center" src="m-east.png"> |
| north | 2 | north | Glyphs are upside-down. <img align="right" valign="cener" src="m-north.png"> |
| south | 0 | south | Glyphs stand upright (default) <img align="right" valign="center" src="m-south.png"> |
| west | 3 | west | Glyphs are rotated 90 degrees clockwise. <img align="right" valign="center" src="m-west.png"> |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_for_matrix | `get_for_matrix(matrix: Matrix?) -> Gravity` | pango_gravity_get_for_matrix | 1.16 | Finds the gravity that best matches the rotation component in a `PangoMatrix`. |
| get_for_script | `get_for_script(script: Script, base_gravity: Gravity, hint: GravityHint) -> Gravity` | pango_gravity_get_for_script | 1.16 | Returns the gravity to use in laying out a `PangoItem`. The gravity is determined based on the script, base gravity, and hint. If @base_gravity is ... |
| get_for_script_and_width | `get_for_script_and_width(script: Script, wide: gboolean, base_gravity: Gravity, hint: GravityHint) -> Gravity` | pango_gravity_get_for_script_and_width | 1.26 | Returns the gravity to use in laying out a single character or `PangoItem`. The gravity is determined based on the script, East Asian width, base g... |
| to_rotation | `to_rotation(gravity: Gravity) -> gdouble` | pango_gravity_to_rotation | 1.16 | Converts a `PangoGravity` value to its natural rotation in radians. Note that [method@Pango.Matrix.rotate] takes angle in degrees, not radians. So,... |

### Pango.GravityHint

GType: `PangoGravityHint` ?? C type: `PangoGravityHint`

`PangoGravityHint` defines how horizontal scripts should behave in a vertical context. That is, English excerpts in a vertical paragraph for exampl...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| line | 2 | line | for scripts not in their natural direction (eg. Latin in East gravity), choose per-script gravity such that every script respects the line progress... |
| natural | 0 | natural | scripts will take their natural gravity based on the base gravity and the script. This is the default. |
| strong | 1 | strong | always use the base gravity set, regardless of the script. |

### Pango.LayoutDeserializeError

GType: `PangoLayoutDeserializeError` ?? C type: `PangoLayoutDeserializeError`

Errors that can be returned by [func@Pango.Layout.deserialize].

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| invalid | 0 | invalid | Unspecified error |
| invalid_value | 1 | invalid-value | A JSon value could not be interpreted |
| missing_value | 2 | missing-value | A required JSon member was not found |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | pango_layout_deserialize_error_quark |  |  |

### Pango.Overline

GType: `PangoOverline` ?? C type: `PangoOverline`

The `PangoOverline` enumeration is used to specify whether text should be overlined, and if so, the type of line.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | no overline should be drawn |
| single | 1 | single | Draw a single line above the ink extents of the text being underlined. |

### Pango.RenderPart

GType: `PangoRenderPart` ?? C type: `PangoRenderPart`

`PangoRenderPart` defines different items to render for such purposes as setting colors.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| background | 1 | background | the area behind the text |
| foreground | 0 | foreground | the text itself |
| overline | 4 | overline | overlines |
| strikethrough | 3 | strikethrough | strikethrough lines |
| underline | 2 | underline | underlines |

### Pango.Script

GType: `PangoScript` ?? C type: `PangoScript`

The `PangoScript` enumeration identifies different writing systems. The values correspond to the names as defined in the Unicode standard. See Unic...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| ahom | 111 | ahom | Ahom. Since: 1.40 |
| anatolian_hieroglyphs | 112 | anatolian-hieroglyphs | Anatolian Hieroglyphs. Since: 1.40 |
| arabic | 2 | arabic | Arabic |
| armenian | 3 | armenian | Armenian |
| balinese | 62 | balinese | Balinese. Since 1.14 |
| bassa_vah | 88 | bassa-vah | Bassa. Since: 1.40 |
| batak | 78 | batak | Batak. Since 1.32 |
| bengali | 4 | bengali | Bengali |
| bopomofo | 5 | bopomofo | Bopomofo |
| brahmi | 79 | brahmi | Brahmi. Since 1.32 |
| braille | 46 | braille | Braille |
| buginese | 55 | buginese | Buginese. Since 1.10 |
| buhid | 44 | buhid | Buhid |
| canadian_aboriginal | 40 | canadian-aboriginal | Canadian Aboriginal |
| carian | 75 | carian | Carian. Since 1.20.1 |
| caucasian_albanian | 89 | caucasian-albanian | Caucasian Albanian. Since: 1.40 |
| chakma | 81 | chakma | Chakma. Since: 1.32 |
| cham | 72 | cham | Cham. Since 1.20.1 |
| cherokee | 6 | cherokee | Cherokee |
| common | 0 | common | a character used by multiple different scripts |
| coptic | 7 | coptic | Coptic |
| cuneiform | 63 | cuneiform | Cuneiform. Since 1.14 |
| cypriot | 47 | cypriot | Cypriot |
| cyrillic | 8 | cyrillic | Cyrillic |
| deseret | 9 | deseret | Deseret |
| devanagari | 10 | devanagari | Devanagari |
| duployan | 90 | duployan | Duployan. Since: 1.40 |
| elbasan | 91 | elbasan | Elbasan. Since: 1.40 |
| ethiopic | 11 | ethiopic | Ethiopic |
| georgian | 12 | georgian | Georgian |
| glagolitic | 56 | glagolitic | Glagolitic. Since 1.10 |
| gothic | 13 | gothic | Gothic |
| grantha | 92 | grantha | Grantha. Since: 1.40 |
| greek | 14 | greek | Greek |
| gujarati | 15 | gujarati | Gujarati |
| gurmukhi | 16 | gurmukhi | Gurmukhi |
| han | 17 | han | Han |
| hangul | 18 | hangul | Hangul |
| hanunoo | 43 | hanunoo | Hanunoo |
| hatran | 113 | hatran | Hatran. Since: 1.40 |
| hebrew | 19 | hebrew | Hebrew |
| hiragana | 20 | hiragana | Hiragana |
| inherited | 1 | inherited | a mark glyph that takes its script from the base glyph to which it is attached |
| invalid_code | -1 | invalid-code | a value never returned from pango_script_for_unichar() |
| kannada | 21 | kannada | Kannada |
| katakana | 22 | katakana | Katakana |
| kayah_li | 67 | kayah-li | Kayah Li. Since 1.20.1 |
| kharoshthi | 60 | kharoshthi | Kharoshthi. Since 1.10 |
| khmer | 23 | khmer | Khmer |
| khojki | 93 | khojki | Kjohki. Since: 1.40 |
| khudawadi | 94 | khudawadi | Khudawadi, Sindhi. Since: 1.40 |
| lao | 24 | lao | Lao |
| latin | 25 | latin | Latin |
| lepcha | 68 | lepcha | Lepcha. Since 1.20.1 |
| limbu | 48 | limbu | Limbu |
| linear_a | 95 | linear-a | Linear A. Since: 1.40 |
| linear_b | 51 | linear-b | Linear B |
| lycian | 76 | lycian | Lycian. Since 1.20.1 |
| lydian | 77 | lydian | Lydian. Since 1.20.1 |
| mahajani | 96 | mahajani | Mahajani. Since: 1.40 |
| malayalam | 26 | malayalam | Malayalam |
| mandaic | 80 | mandaic | Mandaic. Since 1.32 |
| manichaean | 97 | manichaean | Manichaean. Since: 1.40 |
| mende_kikakui | 98 | mende-kikakui | Mende Kikakui. Since: 1.40 |
| meroitic_cursive | 82 | meroitic-cursive | Meroitic Cursive. Since: 1.32 |
| meroitic_hieroglyphs | 83 | meroitic-hieroglyphs | Meroitic Hieroglyphs. Since: 1.32 |
| miao | 84 | miao | Miao. Since: 1.32 |
| modi | 99 | modi | Modi. Since: 1.40 |
| mongolian | 27 | mongolian | Mongolian |
| mro | 100 | mro | Mro. Since: 1.40 |
| multani | 114 | multani | Multani. Since: 1.40 |
| myanmar | 28 | myanmar | Myanmar |
| nabataean | 101 | nabataean | Nabataean. Since: 1.40 |
| new_tai_lue | 54 | new-tai-lue | New Tai Lue. Since 1.10 |
| nko | 66 | nko | N'Ko. Since 1.14 |
| ogham | 29 | ogham | Ogham |
| ol_chiki | 73 | ol-chiki | Ol Chiki. Since 1.20.1 |
| old_hungarian | 115 | old-hungarian | Old Hungarian. Since: 1.40 |
| old_italic | 30 | old-italic | Old Italic |
| old_north_arabian | 102 | old-north-arabian | Old North Arabian. Since: 1.40 |
| old_permic | 103 | old-permic | Old Permic. Since: 1.40 |
| old_persian | 59 | old-persian | Old Persian. Since 1.10 |
| oriya | 31 | oriya | Oriya |
| osmanya | 49 | osmanya | Osmanya |
| pahawh_hmong | 104 | pahawh-hmong | Pahawh Hmong. Since: 1.40 |
| palmyrene | 105 | palmyrene | Palmyrene. Since: 1.40 |
| pau_cin_hau | 106 | pau-cin-hau | Pau Cin Hau. Since: 1.40 |
| phags_pa | 65 | phags-pa | Phags-pa. Since 1.14 |
| phoenician | 64 | phoenician | Phoenician. Since 1.14 |
| psalter_pahlavi | 107 | psalter-pahlavi | Psalter Pahlavi. Since: 1.40 |
| rejang | 69 | rejang | Rejang. Since 1.20.1 |
| runic | 32 | runic | Runic |
| saurashtra | 71 | saurashtra | Saurashtra. Since 1.20.1 |
| sharada | 85 | sharada | Sharada. Since: 1.32 |
| shavian | 50 | shavian | Shavian |
| siddham | 108 | siddham | Siddham. Since: 1.40 |
| signwriting | 116 | signwriting | Signwriting. Since: 1.40 |
| sinhala | 33 | sinhala | Sinhala |
| sora_sompeng | 86 | sora-sompeng | Sora Sompeng. Since: 1.32 |
| sundanese | 70 | sundanese | Sundanese. Since 1.20.1 |
| syloti_nagri | 58 | syloti-nagri | Syloti Nagri. Since 1.10 |
| syriac | 34 | syriac | Syriac |
| tagalog | 42 | tagalog | Tagalog |
| tagbanwa | 45 | tagbanwa | Tagbanwa |
| tai_le | 52 | tai-le | Tai Le |
| takri | 87 | takri | Takri. Since: 1.32 |
| tamil | 35 | tamil | Tamil |
| telugu | 36 | telugu | Telugu |
| thaana | 37 | thaana | Thaana |
| thai | 38 | thai | Thai |
| tibetan | 39 | tibetan | Tibetan |
| tifinagh | 57 | tifinagh | Tifinagh. Since 1.10 |
| tirhuta | 109 | tirhuta | Tirhuta. Since: 1.40 |
| ugaritic | 53 | ugaritic | Ugaritic |
| unknown | 61 | unknown | an unassigned code point. Since 1.14 |
| vai | 74 | vai | Vai. Since 1.20.1 |
| warang_citi | 110 | warang-citi | Warang Citi. Since: 1.40 |
| yi | 41 | yi | Yi |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| for_unichar | `for_unichar(ch: gunichar) -> Script` | pango_script_for_unichar | 1.4 | Looks up the script for a particular character. The script of a character is defined by Unicode Standard Annex 24: Script names. No check is made f... |
| get_sample_language | `get_sample_language(script: Script) -> Language` | pango_script_get_sample_language | 1.4 | Finds a language tag that is reasonably representative of @script. The language will usually be the most widely spoken or used language written in ... |

### Pango.Stretch

GType: `PangoStretch` ?? C type: `PangoStretch`

An enumeration specifying the width of the font relative to other designs within a family.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| condensed | 2 | condensed | condensed width |
| expanded | 6 | expanded | expanded width |
| extra_condensed | 1 | extra-condensed | extra condensed width |
| extra_expanded | 7 | extra-expanded | extra expanded width |
| normal | 4 | normal | the normal width |
| semi_condensed | 3 | semi-condensed | semi condensed width |
| semi_expanded | 5 | semi-expanded | semi expanded width |
| ultra_condensed | 0 | ultra-condensed | ultra condensed width |
| ultra_expanded | 8 | ultra-expanded | ultra expanded width |

### Pango.Style

GType: `PangoStyle` ?? C type: `PangoStyle`

An enumeration specifying the various slant styles possible for a font.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| italic | 2 | italic | the font is slanted in an italic style. |
| normal | 0 | normal | the font is upright. |
| oblique | 1 | oblique | the font is slanted, but in a roman style. |

### Pango.TabAlign

GType: `PangoTabAlign` ?? C type: `PangoTabAlign`

`PangoTabAlign` specifies where the text appears relative to the tab stop position.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| center | 2 | center | the text is centered at the tab stop position until the available space is filled. Since: 1.50 |
| decimal | 3 | decimal | text before the first occurrence of the decimal point character appears to the left of the tab stop position (until the available space is filled),... |
| left | 0 | left | the text appears to the right of the tab stop position |
| right | 1 | right | the text appears to the left of the tab stop position until the available space is filled. Since: 1.50 |

### Pango.TextTransform

GType: `PangoTextTransform` ?? C type: `PangoTextTransform`

An enumeration that affects how Pango treats characters during shaping.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| capitalize | 3 | capitalize | Display the first character of a word in titlecase |
| lowercase | 1 | lowercase | Display letters and numbers as lowercase |
| none | 0 | none | Leave text unchanged |
| uppercase | 2 | uppercase | Display letters and numbers as uppercase |

### Pango.Underline

GType: `PangoUnderline` ?? C type: `PangoUnderline`

The `PangoUnderline` enumeration is used to specify whether text should be underlined, and if so, the type of underlining.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| double | 2 | double | a double underline should be drawn |
| double_line | 6 | double-line | Like @PANGO_UNDERLINE_DOUBLE, but drawn continuously across multiple runs. This type of underlining is available since Pango 1.46. |
| error | 4 | error | an underline indicating an error should be drawn below. The exact style of rendering is up to the `PangoRenderer` in use, but typical styles includ... |
| error_line | 7 | error-line | Like @PANGO_UNDERLINE_ERROR, but drawn continuously across multiple runs. This type of underlining is available since Pango 1.46. |
| low | 3 | low | a single underline should be drawn at a position beneath the ink extents of the text being underlined. This should be used only for underlining sin... |
| none | 0 | none | no underline should be drawn |
| single | 1 | single | a single underline should be drawn |
| single_line | 5 | single-line | Like @PANGO_UNDERLINE_SINGLE, but drawn continuously across multiple runs. This type of underlining is available since Pango 1.46. |

### Pango.Variant

GType: `PangoVariant` ?? C type: `PangoVariant`

An enumeration specifying capitalization variant of the font.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all_petite_caps | 4 | all-petite-caps | A font with all characters replaced by smaller variants of the capital characters. Petite Caps can be even smaller than Small Caps. Since: 1.50 |
| all_small_caps | 2 | all-small-caps | A font with all characters replaced by smaller variants of the capital characters. Since: 1.50 |
| normal | 0 | normal | A normal font. |
| petite_caps | 3 | petite-caps | A font with the lower case characters replaced by smaller variants of the capital characters. Petite Caps can be even smaller than Small Caps. Sinc... |
| small_caps | 1 | small-caps | A font with the lower case characters replaced by smaller variants of the capital characters. |
| title_caps | 6 | title-caps | A font with capital letters that are more suitable for all-uppercase titles. Since: 1.50 |
| unicase | 5 | unicase | A font with the upper case characters replaced by smaller variants of the capital letters. Since: 1.50 |

### Pango.Weight

GType: `PangoWeight` ?? C type: `PangoWeight`

An enumeration specifying the weight (boldness) of a font. Weight is specified as a numeric value ranging from 100 to 1000. This enumeration simply...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bold | 700 | bold | the bold weight (= 700) |
| book | 380 | book | the book weight (= 380) Since: 1.24) |
| heavy | 900 | heavy | the heavy weight (= 900) |
| light | 300 | light | the light weight (= 300) |
| medium | 500 | medium | the medium weight (= 500) Since: 1.24 |
| normal | 400 | normal | the default weight (= 400) |
| semibold | 600 | semibold | the semibold weight (= 600) |
| semilight | 350 | semilight | the semilight weight (= 350) Since: 1.36.7 |
| thin | 100 | thin | the thin weight (= 100) Since: 1.24 |
| ultrabold | 800 | ultrabold | the ultrabold weight (= 800) |
| ultraheavy | 1000 | ultraheavy | the ultraheavy weight (= 1000) Since: 1.24 |
| ultralight | 200 | ultralight | the ultralight weight (= 200) |

### Pango.WrapMode

GType: `PangoWrapMode` ?? C type: `PangoWrapMode`

`PangoWrapMode` describes how to wrap the lines of a `PangoLayout` to the desired width. For @PANGO_WRAP_WORD, Pango uses break opportunities that ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| char | 1 | char | wrap lines at character boundaries. |
| word | 0 | word | wrap lines at word boundaries. |
| word_char | 2 | word-char | wrap lines at word boundaries, but fall back to character boundaries if there is not enough space for a full word. |

## Flags

### Pango.FontMask

GType: `PangoFontMask` ?? C type: `PangoFontMask`

The bits in a `PangoFontMask` correspond to the set fields in a `PangoFontDescription`.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| family | 1 | family | the font family is specified. |
| gravity | 64 | gravity | the font gravity is specified (Since: 1.16.) |
| size | 32 | size | the font size is specified. |
| stretch | 16 | stretch | the font stretch is specified. |
| style | 2 | style | the font style is specified. |
| variant | 4 | variant | the font variant is specified. |
| variations | 128 | variations | OpenType font variations are specified (Since: 1.42) |
| weight | 8 | weight | the font weight is specified. |

### Pango.LayoutDeserializeFlags

GType: `PangoLayoutDeserializeFlags` ?? C type: `PangoLayoutDeserializeFlags`

Flags that influence the behavior of [func@Pango.Layout.deserialize]. New members may be added to this enumeration over time.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| context | 1 | context | Apply context information from the serialization to the `PangoContext` |
| default | 0 | default | Default behavior |

### Pango.LayoutSerializeFlags

GType: `PangoLayoutSerializeFlags` ?? C type: `PangoLayoutSerializeFlags`

Flags that influence the behavior of [method@Pango.Layout.serialize]. New members may be added to this enumeration over time.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| context | 1 | context | Include context information |
| default | 0 | default | Default behavior |
| output | 2 | output | Include information about the formatted output |

### Pango.ShapeFlags

GType: `PangoShapeFlags` ?? C type: `PangoShapeFlags`

Flags influencing the shaping process. `PangoShapeFlags` can be passed to [func@Pango.shape_with_flags].

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | Default value |
| round_positions | 1 | round-positions | Round glyph positions and widths to whole device units This option should be set if the target renderer can't do subpixel positioning of glyphs |

### Pango.ShowFlags

GType: `PangoShowFlags` ?? C type: `PangoShowFlags`

These flags affect how Pango treats characters that are normally not visible in the output.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| ignorables | 4 | ignorables | Render default-ignorable Unicode characters visibly |
| line_breaks | 2 | line-breaks | Render line breaks visibly |
| none | 0 | none | No special treatment for invisible characters |
| spaces | 1 | spaces | Render spaces, tabs and newlines visibly |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Analysis |  | 0 | 0 | 0 | The `PangoAnalysis` structure stores information about the properties of a segment of text. |
| AttrClass |  | 0 | 0 | 0 | The `PangoAttrClass` structure stores the type and operations for a particular type of attribute. The functions in this structure should not be cal... |
| AttrColor |  | 0 | 0 | 0 | The `PangoAttrColor` structure is used to represent attributes that are colors. |
| AttrFloat |  | 0 | 0 | 0 | The `PangoAttrFloat` structure is used to represent attributes with a float or double value. |
| AttrFontDesc |  | 0 | 0 | 1 | The `PangoAttrFontDesc` structure is used to store an attribute that sets all aspects of the font description at once. |
| AttrFontFeatures |  | 0 | 0 | 1 | The `PangoAttrFontFeatures` structure is used to represent OpenType font features as an attribute. |
| Attribute |  | 0 | 0 | 13 | The `PangoAttribute` structure represents the common portions of all attributes. Particular types of attributes include this structure as their ini... |
| AttrInt |  | 0 | 0 | 0 | The `PangoAttrInt` structure is used to represent attributes with an integer or enumeration value. |
| AttrIterator |  | 0 | 0 | 7 | A `PangoAttrIterator` is used to iterate through a `PangoAttrList`. A new iterator is created with [method@Pango.AttrList.get_iterator]. Once the i... |
| AttrLanguage |  | 0 | 0 | 1 | The `PangoAttrLanguage` structure is used to represent attributes that are languages. |
| AttrList |  | 0 | 0 | 15 | A `PangoAttrList` represents a list of attributes that apply to a section of text. The attributes in a `PangoAttrList` are, in general, allowed to ... |
| AttrShape |  | 0 | 0 | 2 | The `PangoAttrShape` structure is used to represent attributes which impose shape restrictions. |
| AttrSize |  | 0 | 0 | 2 | The `PangoAttrSize` structure is used to represent attributes which set font size. |
| AttrString |  | 0 | 0 | 0 | The `PangoAttrString` structure is used to represent attributes with a string value. |
| Color |  | 0 | 0 | 5 | The `PangoColor` structure is used to represent a color in an uncalibrated RGB color-space. |
| ContextClass |  | 0 | 0 | 0 |  |
| FontClass |  | 0 | 0 | 0 | a newly-allocated `PangoFontDescription` object. |
| FontDescription |  | 0 | 0 | 34 | A `PangoFontDescription` describes a font in an implementation-independent manner. `PangoFontDescription` structures are used both to list what fon... |
| FontFaceClass |  | 0 | 0 | 0 | the face name for the face. This string is owned by the face object and must not be modified or freed. |
| FontFamilyClass |  | 0 | 0 | 0 | a `PangoFontFamily` |
| FontMapClass |  | 0 | 0 | 0 | The `PangoFontMapClass` structure holds the virtual functions for a particular `PangoFontMap` implementation. |
| FontMetrics |  | 0 | 0 | 11 | A `PangoFontMetrics` structure holds the overall metric information for a font. The information in a `PangoFontMetrics` structure may be restricted... |
| FontsetClass |  | 0 | 0 | 0 | The `PangoFontsetClass` structure holds the virtual functions for a particular `PangoFontset` implementation. |
| FontsetSimpleClass |  | 0 | 0 | 0 |  |
| GlyphGeometry |  | 0 | 0 | 0 | The `PangoGlyphGeometry` structure contains width and positioning information for a single glyph. Note that @width is not guaranteed to be the same... |
| GlyphInfo |  | 0 | 0 | 0 | A `PangoGlyphInfo` structure represents a single glyph with positioning information and visual attributes. |
| GlyphItem |  | 0 | 0 | 6 | A `PangoGlyphItem` is a pair of a `PangoItem` and the glyphs resulting from shaping the items text. As an example of the usage of `PangoGlyphItem`,... |
| GlyphItemIter |  | 0 | 0 | 6 | A `PangoGlyphItemIter` is an iterator over the clusters in a `PangoGlyphItem`. The *forward direction* of the iterator is the logical direction of ... |
| GlyphString |  | 0 | 0 | 11 | A `PangoGlyphString` is used to store strings of glyphs with geometry and visual attribute information. The storage for the glyph information is ow... |
| GlyphVisAttr |  | 0 | 0 | 0 | A `PangoGlyphVisAttr` structure communicates information between the shaping and rendering phases. Currently, it contains cluster start and color i... |
| Item |  | 0 | 0 | 5 | The `PangoItem` structure stores information about a segment of text. You typically obtain `PangoItems` by itemizing a piece of text with [func@ite... |
| Language |  | 0 | 0 | 8 | The `PangoLanguage` structure is used to represent a language. `PangoLanguage` pointers can be efficiently copied and compared with each other. |
| LayoutClass |  | 0 | 0 | 0 |  |
| LayoutIter |  | 0 | 0 | 21 | A `PangoLayoutIter` can be used to iterate over the visual extents of a `PangoLayout`. To obtain a `PangoLayoutIter`, use [method@Pango.Layout.get_... |
| LayoutLine |  | 0 | 0 | 12 | A `PangoLayoutLine` represents one of the lines resulting from laying out a paragraph via `PangoLayout`. `PangoLayoutLine` structures are obtained ... |
| LogAttr |  | 0 | 0 | 0 | The `PangoLogAttr` structure stores information about the attributes of a single character. |
| Matrix |  | 0 | 0 | 13 | A `PangoMatrix` specifies a transformation between user-space and device coordinates. The transformation is given by ``` x_device = x_user * matrix... |
| Rectangle |  | 0 | 0 | 0 | The `PangoRectangle` structure represents a rectangle. `PangoRectangle` is frequently used to represent the logical or ink extents of a single glyp... |
| RendererClass |  | 0 | 0 | 0 | Class structure for `PangoRenderer`. The following vfuncs take user space coordinates in Pango units and have default implementations: - draw_glyph... |
| RendererPrivate |  | 0 | 0 | 0 |  |
| ScriptIter |  | 0 | 0 | 4 | A `PangoScriptIter` is used to iterate through a string and identify ranges in different scripts. |
| TabArray |  | 0 | 0 | 16 | A `PangoTabArray` contains an array of tab stops. `PangoTabArray` can be used to set tab stops in a `PangoLayout`. Each tab stop has an alignment, ... |

### Pango.Analysis

C type: `PangoAnalysis`

The `PangoAnalysis` structure stores information about the properties of a segment of text.

#### Fields

| Field | Type |
| --- | --- |
| extra_attrs | GLib.SList |
| flags | guint8 |
| font | Font |
| gravity | guint8 |
| lang_engine | gpointer |
| language | Language |
| level | guint8 |
| script | guint8 |
| shape_engine | gpointer |

### Pango.AttrClass

C type: `PangoAttrClass`

The `PangoAttrClass` structure stores the type and operations for a particular type of attribute. The functions in this structure should not be cal...

#### Fields

| Field | Type |
| --- | --- |
| copy | Attribute |
| destroy | none |
| equal | gboolean |
| type | AttrType |

### Pango.AttrColor

C type: `PangoAttrColor`

The `PangoAttrColor` structure is used to represent attributes that are colors.

#### Fields

| Field | Type |
| --- | --- |
| attr | Attribute |
| color | Color |

### Pango.AttrFloat

C type: `PangoAttrFloat`

The `PangoAttrFloat` structure is used to represent attributes with a float or double value.

#### Fields

| Field | Type |
| --- | --- |
| attr | Attribute |
| value | gdouble |

### Pango.AttrFontDesc

C type: `PangoAttrFontDesc`

The `PangoAttrFontDesc` structure is used to store an attribute that sets all aspects of the font description at once.

#### Fields

| Field | Type |
| --- | --- |
| attr | Attribute |
| desc | FontDescription |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(desc: FontDescription) -> Attribute` | pango_attr_font_desc_new |  | Create a new font description attribute. This attribute allows setting family, style, weight, variant, stretch, and size simultaneously. |

### Pango.AttrFontFeatures

C type: `PangoAttrFontFeatures`

The `PangoAttrFontFeatures` structure is used to represent OpenType font features as an attribute.

#### Fields

| Field | Type |
| --- | --- |
| attr | Attribute |
| features | utf8 |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(features: utf8) -> Attribute` | pango_attr_font_features_new | 1.38 | Create a new font features tag attribute. You can use this attribute to select OpenType font features like small-caps, alternative glyphs, ligature... |

### Pango.Attribute

GType: `PangoAttribute` ?? C type: `PangoAttribute`

The `PangoAttribute` structure represents the common portions of all attributes. Particular types of attributes include this structure as their ini...

#### Fields

| Field | Type |
| --- | --- |
| end_index | guint |
| klass | AttrClass |
| start_index | guint |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| as_color | `Attribute.as_color() -> AttrColor` | pango_attribute_as_color | 1.50 | Returns the attribute cast to `PangoAttrColor`. This is mainly useful for language bindings. |
| as_float | `Attribute.as_float() -> AttrFloat` | pango_attribute_as_float | 1.50 | Returns the attribute cast to `PangoAttrFloat`. This is mainly useful for language bindings. |
| as_font_desc | `Attribute.as_font_desc() -> AttrFontDesc` | pango_attribute_as_font_desc | 1.50 | Returns the attribute cast to `PangoAttrFontDesc`. This is mainly useful for language bindings. |
| as_font_features | `Attribute.as_font_features() -> AttrFontFeatures` | pango_attribute_as_font_features | 1.50 | Returns the attribute cast to `PangoAttrFontFeatures`. This is mainly useful for language bindings. |
| as_int | `Attribute.as_int() -> AttrInt` | pango_attribute_as_int | 1.50 | Returns the attribute cast to `PangoAttrInt`. This is mainly useful for language bindings. |
| as_language | `Attribute.as_language() -> AttrLanguage` | pango_attribute_as_language | 1.50 | Returns the attribute cast to `PangoAttrLanguage`. This is mainly useful for language bindings. |
| as_shape | `Attribute.as_shape() -> AttrShape` | pango_attribute_as_shape | 1.50 | Returns the attribute cast to `PangoAttrShape`. This is mainly useful for language bindings. |
| as_size | `Attribute.as_size() -> AttrSize` | pango_attribute_as_size | 1.50 | Returns the attribute cast to `PangoAttrSize`. This is mainly useful for language bindings. |
| as_string | `Attribute.as_string() -> AttrString` | pango_attribute_as_string | 1.50 | Returns the attribute cast to `PangoAttrString`. This is mainly useful for language bindings. |
| copy | `Attribute.copy() -> Attribute` | pango_attribute_copy |  | Make a copy of an attribute. |
| destroy | `Attribute.destroy() -> none` | pango_attribute_destroy |  | Destroy a `PangoAttribute` and free all associated memory. |
| equal | `Attribute.equal(attr2: Attribute) -> gboolean` | pango_attribute_equal |  | Compare two attributes for equality. This compares only the actual value of the two attributes and not the ranges that the attributes apply to. |
| init | `Attribute.init(klass: AttrClass) -> none` | pango_attribute_init | 1.20 | Initializes @attr's klass to @klass, it's start_index to %PANGO_ATTR_INDEX_FROM_TEXT_BEGINNING and end_index to %PANGO_ATTR_INDEX_TO_TEXT_END such ... |

### Pango.AttrInt

C type: `PangoAttrInt`

The `PangoAttrInt` structure is used to represent attributes with an integer or enumeration value.

#### Fields

| Field | Type |
| --- | --- |
| attr | Attribute |
| value | gint |

### Pango.AttrIterator

GType: `PangoAttrIterator` ?? C type: `PangoAttrIterator`

A `PangoAttrIterator` is used to iterate through a `PangoAttrList`. A new iterator is created with [method@Pango.AttrList.get_iterator]. Once the i...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `AttrIterator.copy() -> AttrIterator` | pango_attr_iterator_copy |  | Copy a `PangoAttrIterator`. |
| destroy | `AttrIterator.destroy() -> none` | pango_attr_iterator_destroy |  | Destroy a `PangoAttrIterator` and free all associated memory. |
| get | `AttrIterator.get(type: AttrType) -> Attribute` | pango_attr_iterator_get |  | Find the current attribute of a particular type at the iterator location. When multiple attributes of the same type overlap, the attribute whose ra... |
| get_attrs | `AttrIterator.get_attrs() -> GLib.SList` | pango_attr_iterator_get_attrs | 1.2 | Gets a list of all attributes at the current position of the iterator. |
| get_font | `AttrIterator.get_font(desc: FontDescription, language: out Language?, extra_attrs: out GLib.SList?) -> none` | pango_attr_iterator_get_font |  | Get the font and other attributes at the current iterator position. |
| next | `AttrIterator.next() -> gboolean` | pango_attr_iterator_next |  | Advance the iterator until the next change of style. |
| range | `AttrIterator.range(start: out gint, end: out gint) -> none` | pango_attr_iterator_range |  | Get the range of the current segment. Note that the stored return values are signed, not unsigned like the values in `PangoAttribute`. To deal with... |

### Pango.AttrLanguage

C type: `PangoAttrLanguage`

The `PangoAttrLanguage` structure is used to represent attributes that are languages.

#### Fields

| Field | Type |
| --- | --- |
| attr | Attribute |
| value | Language |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(language: Language) -> Attribute` | pango_attr_language_new |  | Create a new language tag attribute. |

### Pango.AttrList

GType: `PangoAttrList` ?? C type: `PangoAttrList`

A `PangoAttrList` represents a list of attributes that apply to a section of text. The attributes in a `PangoAttrList` are, in general, allowed to ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `AttrList.new() -> AttrList` | pango_attr_list_new |  | Create a new empty attribute list with a reference count of one. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| from_string | `from_string(text: utf8) -> AttrList` | pango_attr_list_from_string | 1.50 | Deserializes a `PangoAttrList` from a string. This is the counterpart to [method@Pango.AttrList.to_string]. See that functions for details about th... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| change | `AttrList.change(attr: Attribute) -> none` | pango_attr_list_change |  | Insert the given attribute into the `PangoAttrList`. It will replace any attributes of the same type on that segment and be merged with any adjoini... |
| copy | `AttrList.copy() -> AttrList` | pango_attr_list_copy |  | Copy @list and return an identical new list. |
| equal | `AttrList.equal(other_list: AttrList) -> gboolean` | pango_attr_list_equal | 1.46 | Checks whether @list and @other_list contain the same attributes and whether those attributes apply to the same ranges. Beware that this will retur... |
| filter | `AttrList.filter(func: AttrFilterFunc, data: gpointer?) -> AttrList` | pango_attr_list_filter | 1.2 | Given a `PangoAttrList` and callback function, removes any elements of @list for which @func returns %TRUE and inserts them into a new list. |
| get_attributes | `AttrList.get_attributes() -> GLib.SList` | pango_attr_list_get_attributes | 1.44 | Gets a list of all attributes in @list. |
| get_iterator | `AttrList.get_iterator() -> AttrIterator` | pango_attr_list_get_iterator |  | Create a iterator initialized to the beginning of the list. @list must not be modified until this iterator is freed. |
| insert | `AttrList.insert(attr: Attribute) -> none` | pango_attr_list_insert |  | Insert the given attribute into the `PangoAttrList`. It will be inserted after all other attributes with a matching @start_index. |
| insert_before | `AttrList.insert_before(attr: Attribute) -> none` | pango_attr_list_insert_before |  | Insert the given attribute into the `PangoAttrList`. It will be inserted before all other attributes with a matching @start_index. |
| ref | `AttrList.ref() -> AttrList` | pango_attr_list_ref | 1.10 | Increase the reference count of the given attribute list by one. |
| splice | `AttrList.splice(other: AttrList, pos: gint, len: gint) -> none` | pango_attr_list_splice |  | This function opens up a hole in @list, fills it in with attributes from the left, and then merges @other on top of the hole. This operation is equ... |
| to_string | `AttrList.to_string() -> utf8` | pango_attr_list_to_string | 1.50 | Serializes a `PangoAttrList` to a string. In the resulting string, serialized attributes are separated by newlines or commas. Individual attributes... |
| unref | `AttrList.unref() -> none` | pango_attr_list_unref |  | Decrease the reference count of the given attribute list by one. If the result is zero, free the attribute list and the attributes it contains. |
| update | `AttrList.update(pos: gint, remove: gint, add: gint) -> none` | pango_attr_list_update | 1.44 | Update indices of attributes in @list for a change in the text they refer to. The change that this function applies is removing @remove bytes at po... |

### Pango.AttrShape

C type: `PangoAttrShape`

The `PangoAttrShape` structure is used to represent attributes which impose shape restrictions.

#### Fields

| Field | Type |
| --- | --- |
| attr | Attribute |
| copy_func | AttrDataCopyFunc |
| data | gpointer |
| destroy_func | GLib.DestroyNotify |
| ink_rect | Rectangle |
| logical_rect | Rectangle |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(ink_rect: Rectangle, logical_rect: Rectangle) -> Attribute` | pango_attr_shape_new |  | Create a new shape attribute. A shape is used to impose a particular ink and logical rectangle on the result of shaping a particular glyph. This mi... |
| new_with_data | `new_with_data(ink_rect: Rectangle, logical_rect: Rectangle, data: gpointer?, copy_func: AttrDataCopyFunc?, destroy_func: GLib.DestroyNotify?) -> Attribute` | pango_attr_shape_new_with_data | 1.8 | Creates a new shape attribute. Like [func@Pango.AttrShape.new], but a user data pointer is also provided; this pointer can be accessed when later r... |

### Pango.AttrSize

C type: `PangoAttrSize`

The `PangoAttrSize` structure is used to represent attributes which set font size.

#### Fields

| Field | Type |
| --- | --- |
| absolute | guint |
| attr | Attribute |
| size | gint |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(size: gint) -> Attribute` | pango_attr_size_new |  | Create a new font-size attribute in fractional points. |
| new_absolute | `new_absolute(size: gint) -> Attribute` | pango_attr_size_new_absolute | 1.8 | Create a new font-size attribute in device units. |

### Pango.AttrString

C type: `PangoAttrString`

The `PangoAttrString` structure is used to represent attributes with a string value.

#### Fields

| Field | Type |
| --- | --- |
| attr | Attribute |
| value | utf8 |

### Pango.Color

GType: `PangoColor` ?? C type: `PangoColor`

The `PangoColor` structure is used to represent a color in an uncalibrated RGB color-space.

#### Fields

| Field | Type |
| --- | --- |
| blue | guint16 |
| green | guint16 |
| red | guint16 |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Color.copy() -> Color` | pango_color_copy |  | Creates a copy of @src. The copy should be freed with [method@Pango.Color.free]. Primarily used by language bindings, not that useful otherwise (si... |
| free | `Color.free() -> none` | pango_color_free |  | Frees a color allocated by [method@Pango.Color.copy]. |
| parse | `Color.parse(spec: utf8) -> gboolean` | pango_color_parse |  | Fill in the fields of a color from a string specification. The string can either one of a large set of standard names. (Taken from the CSS Color sp... |
| parse_with_alpha | `Color.parse_with_alpha(alpha: out guint16?, spec: utf8) -> gboolean` | pango_color_parse_with_alpha | 1.46 | Fill in the fields of a color from a string specification. The string can either one of a large set of standard names. (Taken from the CSS Color sp... |
| to_string | `Color.to_string() -> utf8` | pango_color_to_string | 1.16 | Returns a textual specification of @color. The string is in the hexadecimal form `#rrrrggggbbbb`, where `r`, `g` and `b` are hex digits representin... |

### Pango.ContextClass

C type: `PangoContextClass`

### Pango.FontClass

C type: `PangoFontClass`

a newly-allocated `PangoFontDescription` object.

#### Fields

| Field | Type |
| --- | --- |
| create_hb_font | HarfBuzz.font_t |
| describe | FontDescription |
| describe_absolute | FontDescription |
| get_coverage | Coverage |
| get_features | none |
| get_font_map | FontMap |
| get_glyph_extents | none |
| get_metrics | FontMetrics |
| parent_class | GObject.ObjectClass |

### Pango.FontDescription

GType: `PangoFontDescription` ?? C type: `PangoFontDescription`

A `PangoFontDescription` describes a font in an implementation-independent manner. `PangoFontDescription` structures are used both to list what fon...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `FontDescription.new() -> FontDescription` | pango_font_description_new |  | Creates a new font description structure with all fields unset. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| from_string | `from_string(str: utf8) -> FontDescription` | pango_font_description_from_string |  | Creates a new font description from a string representation. The string must have the form "\[FAMILY-LIST] \[STYLE-OPTIONS] \[SIZE] \[VARIATIONS]",... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| better_match | `FontDescription.better_match(old_match: FontDescription?, new_match: FontDescription) -> gboolean` | pango_font_description_better_match |  | Determines if the style attributes of @new_match are a closer match for @desc than those of @old_match are, or if @old_match is %NULL, determines i... |
| copy | `FontDescription.copy() -> FontDescription` | pango_font_description_copy |  | Make a copy of a `PangoFontDescription`. |
| copy_static | `FontDescription.copy_static() -> FontDescription` | pango_font_description_copy_static |  | Make a copy of a `PangoFontDescription`, but don't duplicate allocated fields. This is like [method@Pango.FontDescription.copy], but only a shallow... |
| equal | `FontDescription.equal(desc2: FontDescription) -> gboolean` | pango_font_description_equal |  | Compares two font descriptions for equality. Two font descriptions are considered equal if the fonts they describe are provably identical. This mea... |
| free | `FontDescription.free() -> none` | pango_font_description_free |  | Frees a font description. |
| get_family | `FontDescription.get_family() -> utf8` | pango_font_description_get_family |  | Gets the family name field of a font description. See [method@Pango.FontDescription.set_family]. |
| get_gravity | `FontDescription.get_gravity() -> Gravity` | pango_font_description_get_gravity | 1.16 | Gets the gravity field of a font description. See [method@Pango.FontDescription.set_gravity]. |
| get_set_fields | `FontDescription.get_set_fields() -> FontMask` | pango_font_description_get_set_fields |  | Determines which fields in a font description have been set. |
| get_size | `FontDescription.get_size() -> gint` | pango_font_description_get_size |  | Gets the size field of a font description. See [method@Pango.FontDescription.set_size]. |
| get_size_is_absolute | `FontDescription.get_size_is_absolute() -> gboolean` | pango_font_description_get_size_is_absolute | 1.8 | Determines whether the size of the font is in points (not absolute) or device units (absolute). See [method@Pango.FontDescription.set_size] and [me... |
| get_stretch | `FontDescription.get_stretch() -> Stretch` | pango_font_description_get_stretch |  | Gets the stretch field of a font description. See [method@Pango.FontDescription.set_stretch]. |
| get_style | `FontDescription.get_style() -> Style` | pango_font_description_get_style |  | Gets the style field of a `PangoFontDescription`. See [method@Pango.FontDescription.set_style]. |
| get_variant | `FontDescription.get_variant() -> Variant` | pango_font_description_get_variant |  | Gets the variant field of a `PangoFontDescription`. See [method@Pango.FontDescription.set_variant]. |
| get_variations | `FontDescription.get_variations() -> utf8` | pango_font_description_get_variations | 1.42 | Gets the variations field of a font description. See [method@Pango.FontDescription.set_variations]. |
| get_weight | `FontDescription.get_weight() -> Weight` | pango_font_description_get_weight |  | Gets the weight field of a font description. See [method@Pango.FontDescription.set_weight]. |
| hash | `FontDescription.hash() -> guint` | pango_font_description_hash |  | Computes a hash of a `PangoFontDescription` structure. This is suitable to be used, for example, as an argument to g_hash_table_new(). The hash val... |
| merge | `FontDescription.merge(desc_to_merge: FontDescription?, replace_existing: gboolean) -> none` | pango_font_description_merge |  | Merges the fields that are set in @desc_to_merge into the fields in @desc. If @replace_existing is %FALSE, only fields in @desc that are not alread... |
| merge_static | `FontDescription.merge_static(desc_to_merge: FontDescription, replace_existing: gboolean) -> none` | pango_font_description_merge_static |  | Merges the fields that are set in @desc_to_merge into the fields in @desc, without copying allocated fields. This is like [method@Pango.FontDescrip... |
| set_absolute_size | `FontDescription.set_absolute_size(size: gdouble) -> none` | pango_font_description_set_absolute_size | 1.8 | Sets the size field of a font description, in device units. This is mutually exclusive with [method@Pango.FontDescription.set_size] which sets the ... |
| set_family | `FontDescription.set_family(family: utf8) -> none` | pango_font_description_set_family |  | Sets the family name field of a font description. The family name represents a family of related font styles, and will resolve to a particular `Pan... |
| set_family_static | `FontDescription.set_family_static(family: utf8) -> none` | pango_font_description_set_family_static |  | Sets the family name field of a font description, without copying the string. This is like [method@Pango.FontDescription.set_family], except that n... |
| set_gravity | `FontDescription.set_gravity(gravity: Gravity) -> none` | pango_font_description_set_gravity | 1.16 | Sets the gravity field of a font description. The gravity field specifies how the glyphs should be rotated. If @gravity is %PANGO_GRAVITY_AUTO, thi... |
| set_size | `FontDescription.set_size(size: gint) -> none` | pango_font_description_set_size |  | Sets the size field of a font description in fractional points. This is mutually exclusive with [method@Pango.FontDescription.set_absolute_size]. |
| set_stretch | `FontDescription.set_stretch(stretch: Stretch) -> none` | pango_font_description_set_stretch |  | Sets the stretch field of a font description. The [enum@Pango.Stretch] field specifies how narrow or wide the font should be. |
| set_style | `FontDescription.set_style(style: Style) -> none` | pango_font_description_set_style |  | Sets the style field of a `PangoFontDescription`. The [enum@Pango.Style] enumeration describes whether the font is slanted and the manner in which ... |
| set_variant | `FontDescription.set_variant(variant: Variant) -> none` | pango_font_description_set_variant |  | Sets the variant field of a font description. The [enum@Pango.Variant] can either be %PANGO_VARIANT_NORMAL or %PANGO_VARIANT_SMALL_CAPS. |
| set_variations | `FontDescription.set_variations(variations: utf8?) -> none` | pango_font_description_set_variations | 1.42 | Sets the variations field of a font description. OpenType font variations allow to select a font instance by specifying values for a number of axes... |
| set_variations_static | `FontDescription.set_variations_static(variations: utf8) -> none` | pango_font_description_set_variations_static | 1.42 | Sets the variations field of a font description. This is like [method@Pango.FontDescription.set_variations], except that no copy of @variations is ... |
| set_weight | `FontDescription.set_weight(weight: Weight) -> none` | pango_font_description_set_weight |  | Sets the weight field of a font description. The weight field specifies how bold or light the font should be. In addition to the values of the [enu... |
| to_filename | `FontDescription.to_filename() -> utf8` | pango_font_description_to_filename |  | Creates a filename representation of a font description. The filename is identical to the result from calling [method@Pango.FontDescription.to_stri... |
| to_string | `FontDescription.to_string() -> utf8` | pango_font_description_to_string |  | Creates a string representation of a font description. See [func@Pango.FontDescription.from_string] for a description of the format of the string r... |
| unset_fields | `FontDescription.unset_fields(to_unset: FontMask) -> none` | pango_font_description_unset_fields |  | Unsets some of the fields in a `PangoFontDescription`. The unset fields will get back to their default values. |

### Pango.FontFaceClass

C type: `PangoFontFaceClass`

the face name for the face. This string is owned by the face object and must not be modified or freed.

#### Fields

| Field | Type |
| --- | --- |
| _pango_reserved3 | none |
| _pango_reserved4 | none |
| describe | FontDescription |
| get_face_name | utf8 |
| get_family | FontFamily |
| is_synthesized | gboolean |
| list_sizes | none |
| parent_class | GObject.ObjectClass |

### Pango.FontFamilyClass

C type: `PangoFontFamilyClass`

a `PangoFontFamily`

#### Fields

| Field | Type |
| --- | --- |
| _pango_reserved2 | none |
| get_face | FontFace |
| get_name | utf8 |
| is_monospace | gboolean |
| is_variable | gboolean |
| list_faces | none |
| parent_class | GObject.ObjectClass |

### Pango.FontMapClass

C type: `PangoFontMapClass`

The `PangoFontMapClass` structure holds the virtual functions for a particular `PangoFontMap` implementation.

#### Fields

| Field | Type |
| --- | --- |
| changed | none |
| get_face | FontFace |
| get_family | FontFamily |
| get_serial | guint |
| list_families | none |
| load_font | Font |
| load_fontset | Fontset |
| parent_class | GObject.ObjectClass |
| shape_engine_type | utf8 |

### Pango.FontMetrics

GType: `PangoFontMetrics` ?? C type: `PangoFontMetrics`

A `PangoFontMetrics` structure holds the overall metric information for a font. The information in a `PangoFontMetrics` structure may be restricted...

#### Fields

| Field | Type |
| --- | --- |
| approximate_char_width | gint |
| approximate_digit_width | gint |
| ascent | gint |
| descent | gint |
| height | gint |
| ref_count | guint |
| strikethrough_position | gint |
| strikethrough_thickness | gint |
| underline_position | gint |
| underline_thickness | gint |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_approximate_char_width | `FontMetrics.get_approximate_char_width() -> gint` | pango_font_metrics_get_approximate_char_width |  | Gets the approximate character width for a font metrics structure. This is merely a representative value useful, for example, for determining the i... |
| get_approximate_digit_width | `FontMetrics.get_approximate_digit_width() -> gint` | pango_font_metrics_get_approximate_digit_width |  | Gets the approximate digit width for a font metrics structure. This is merely a representative value useful, for example, for determining the initi... |
| get_ascent | `FontMetrics.get_ascent() -> gint` | pango_font_metrics_get_ascent |  | Gets the ascent from a font metrics structure. The ascent is the distance from the baseline to the logical top of a line of text. (The logical top ... |
| get_descent | `FontMetrics.get_descent() -> gint` | pango_font_metrics_get_descent |  | Gets the descent from a font metrics structure. The descent is the distance from the baseline to the logical bottom of a line of text. (The logical... |
| get_height | `FontMetrics.get_height() -> gint` | pango_font_metrics_get_height | 1.44 | Gets the line height from a font metrics structure. The line height is the recommended distance between successive baselines in wrapped text using ... |
| get_strikethrough_position | `FontMetrics.get_strikethrough_position() -> gint` | pango_font_metrics_get_strikethrough_position | 1.6 | Gets the suggested position to draw the strikethrough. The value returned is the distance *above* the baseline of the top of the strikethrough. |
| get_strikethrough_thickness | `FontMetrics.get_strikethrough_thickness() -> gint` | pango_font_metrics_get_strikethrough_thickness | 1.6 | Gets the suggested thickness to draw for the strikethrough. |
| get_underline_position | `FontMetrics.get_underline_position() -> gint` | pango_font_metrics_get_underline_position | 1.6 | Gets the suggested position to draw the underline. The value returned is the distance *above* the baseline of the top of the underline. Since most ... |
| get_underline_thickness | `FontMetrics.get_underline_thickness() -> gint` | pango_font_metrics_get_underline_thickness | 1.6 | Gets the suggested thickness to draw for the underline. |
| ref | `FontMetrics.ref() -> FontMetrics` | pango_font_metrics_ref |  | Increase the reference count of a font metrics structure by one. |
| unref | `FontMetrics.unref() -> none` | pango_font_metrics_unref |  | Decrease the reference count of a font metrics structure by one. If the result is zero, frees the structure and any associated memory. |

### Pango.FontsetClass

C type: `PangoFontsetClass`

The `PangoFontsetClass` structure holds the virtual functions for a particular `PangoFontset` implementation.

#### Fields

| Field | Type |
| --- | --- |
| _pango_reserved1 | none |
| _pango_reserved2 | none |
| _pango_reserved3 | none |
| _pango_reserved4 | none |
| foreach | none |
| get_font | Font |
| get_language | Language |
| get_metrics | FontMetrics |
| parent_class | GObject.ObjectClass |

### Pango.FontsetSimpleClass

C type: `PangoFontsetSimpleClass`

### Pango.GlyphGeometry

C type: `PangoGlyphGeometry`

The `PangoGlyphGeometry` structure contains width and positioning information for a single glyph. Note that @width is not guaranteed to be the same...

#### Fields

| Field | Type |
| --- | --- |
| width | GlyphUnit |
| x_offset | GlyphUnit |
| y_offset | GlyphUnit |

### Pango.GlyphInfo

C type: `PangoGlyphInfo`

A `PangoGlyphInfo` structure represents a single glyph with positioning information and visual attributes.

#### Fields

| Field | Type |
| --- | --- |
| attr | GlyphVisAttr |
| geometry | GlyphGeometry |
| glyph | Glyph |

### Pango.GlyphItem

GType: `PangoGlyphItem` ?? C type: `PangoGlyphItem`

A `PangoGlyphItem` is a pair of a `PangoItem` and the glyphs resulting from shaping the items text. As an example of the usage of `PangoGlyphItem`,...

#### Fields

| Field | Type |
| --- | --- |
| end_x_offset | gint |
| glyphs | GlyphString |
| item | Item |
| start_x_offset | gint |
| y_offset | gint |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| apply_attrs | `GlyphItem.apply_attrs(text: utf8, list: AttrList) -> GLib.SList` | pango_glyph_item_apply_attrs | 1.2 | Splits a shaped item (`PangoGlyphItem`) into multiple items based on an attribute list. The idea is that if you have attributes that don't affect s... |
| copy | `GlyphItem.copy() -> GlyphItem` | pango_glyph_item_copy | 1.20 | Make a deep copy of an existing `PangoGlyphItem` structure. |
| free | `GlyphItem.free() -> none` | pango_glyph_item_free | 1.6 | Frees a `PangoGlyphItem` and resources to which it points. |
| get_logical_widths | `GlyphItem.get_logical_widths(text: utf8, logical_widths: gint) -> none` | pango_glyph_item_get_logical_widths | 1.26 | Given a `PangoGlyphItem` and the corresponding text, determine the width corresponding to each character. When multiple characters compose a single... |
| letter_space | `GlyphItem.letter_space(text: utf8, log_attrs: LogAttr, letter_spacing: gint) -> none` | pango_glyph_item_letter_space | 1.6 | Adds spacing between the graphemes of @glyph_item to give the effect of typographic letter spacing. |
| split | `GlyphItem.split(text: utf8, split_index: gint) -> GlyphItem` | pango_glyph_item_split | 1.2 | Modifies @orig to cover only the text after @split_index, and returns a new item that covers the text before @split_index that used to be in @orig.... |

### Pango.GlyphItemIter

GType: `PangoGlyphItemIter` ?? C type: `PangoGlyphItemIter`

A `PangoGlyphItemIter` is an iterator over the clusters in a `PangoGlyphItem`. The *forward direction* of the iterator is the logical direction of ...

#### Fields

| Field | Type |
| --- | --- |
| end_char | gint |
| end_glyph | gint |
| end_index | gint |
| glyph_item | GlyphItem |
| start_char | gint |
| start_glyph | gint |
| start_index | gint |
| text | utf8 |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `GlyphItemIter.copy() -> GlyphItemIter` | pango_glyph_item_iter_copy | 1.22 | Make a shallow copy of an existing `PangoGlyphItemIter` structure. |
| free | `GlyphItemIter.free() -> none` | pango_glyph_item_iter_free | 1.22 | Frees a `PangoGlyphItem`Iter. |
| init_end | `GlyphItemIter.init_end(glyph_item: GlyphItem, text: utf8) -> gboolean` | pango_glyph_item_iter_init_end | 1.22 | Initializes a `PangoGlyphItemIter` structure to point to the last cluster in a glyph item. See `PangoGlyphItemIter` for details of cluster orders. |
| init_start | `GlyphItemIter.init_start(glyph_item: GlyphItem, text: utf8) -> gboolean` | pango_glyph_item_iter_init_start | 1.22 | Initializes a `PangoGlyphItemIter` structure to point to the first cluster in a glyph item. See `PangoGlyphItemIter` for details of cluster orders. |
| next_cluster | `GlyphItemIter.next_cluster() -> gboolean` | pango_glyph_item_iter_next_cluster | 1.22 | Advances the iterator to the next cluster in the glyph item. See `PangoGlyphItemIter` for details of cluster orders. |
| prev_cluster | `GlyphItemIter.prev_cluster() -> gboolean` | pango_glyph_item_iter_prev_cluster | 1.22 | Moves the iterator to the preceding cluster in the glyph item. See `PangoGlyphItemIter` for details of cluster orders. |

### Pango.GlyphString

GType: `PangoGlyphString` ?? C type: `PangoGlyphString`

A `PangoGlyphString` is used to store strings of glyphs with geometry and visual attribute information. The storage for the glyph information is ow...

#### Fields

| Field | Type |
| --- | --- |
| glyphs | GlyphInfo |
| log_clusters | gint |
| num_glyphs | gint |
| space | gint |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `GlyphString.new() -> GlyphString` | pango_glyph_string_new |  | Create a new `PangoGlyphString`. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `GlyphString.copy() -> GlyphString` | pango_glyph_string_copy |  | Copy a glyph string and associated storage. |
| extents | `GlyphString.extents(font: Font, ink_rect: out Rectangle?, logical_rect: out Rectangle?) -> none` | pango_glyph_string_extents |  | Compute the logical and ink extents of a glyph string. See the documentation for [method@Pango.Font.get_glyph_extents] for details about the interp... |
| extents_range | `GlyphString.extents_range(start: gint, end: gint, font: Font, ink_rect: out Rectangle?, logical_rect: out Rectangle?) -> none` | pango_glyph_string_extents_range |  | Computes the extents of a sub-portion of a glyph string. The extents are relative to the start of the glyph string range (the origin of their coord... |
| free | `GlyphString.free() -> none` | pango_glyph_string_free |  | Free a glyph string and associated storage. |
| get_logical_widths | `GlyphString.get_logical_widths(text: utf8, length: gint, embedding_level: gint, logical_widths: gint) -> none` | pango_glyph_string_get_logical_widths |  | Given a `PangoGlyphString` and corresponding text, determine the width corresponding to each character. When multiple characters compose a single c... |
| get_width | `GlyphString.get_width() -> gint` | pango_glyph_string_get_width | 1.14 | Computes the logical width of the glyph string. This can also be computed using [method@Pango.GlyphString.extents]. However, since this only comput... |
| index_to_x | `GlyphString.index_to_x(text: utf8, length: gint, analysis: Analysis, index_: gint, trailing: gboolean, x_pos: out gint) -> none` | pango_glyph_string_index_to_x |  | Converts from character position to x position. The X position is measured from the left edge of the run. Character positions are obtained using fo... |
| index_to_x_full | `GlyphString.index_to_x_full(text: utf8, length: gint, analysis: Analysis, attrs: LogAttr?, index_: gint, trailing: gboolean, x_pos: out gint) -> none` | pango_glyph_string_index_to_x_full | 1.50 | Converts from character position to x position. This variant of [method@Pango.GlyphString.index_to_x] additionally accepts a `PangoLogAttr` array. ... |
| set_size | `GlyphString.set_size(new_len: gint) -> none` | pango_glyph_string_set_size |  | Resize a glyph string to the given length. |
| x_to_index | `GlyphString.x_to_index(text: utf8, length: gint, analysis: Analysis, x_pos: gint, index_: out gint, trailing: out gint) -> none` | pango_glyph_string_x_to_index |  | Convert from x offset to character position. Character positions are computed by dividing up each cluster into equal portions. In scripts where pos... |

### Pango.GlyphVisAttr

C type: `PangoGlyphVisAttr`

A `PangoGlyphVisAttr` structure communicates information between the shaping and rendering phases. Currently, it contains cluster start and color i...

#### Fields

| Field | Type |
| --- | --- |
| is_cluster_start | guint |
| is_color | guint |

### Pango.Item

GType: `PangoItem` ?? C type: `PangoItem`

The `PangoItem` structure stores information about a segment of text. You typically obtain `PangoItems` by itemizing a piece of text with [func@ite...

#### Fields

| Field | Type |
| --- | --- |
| analysis | Analysis |
| length | gint |
| num_chars | gint |
| offset | gint |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Item.new() -> Item` | pango_item_new |  | Creates a new `PangoItem` structure initialized to default values. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| apply_attrs | `Item.apply_attrs(iter: AttrIterator) -> none` | pango_item_apply_attrs | 1.44 | Add attributes to a `PangoItem`. The idea is that you have attributes that don't affect itemization, such as font features, so you filter them out ... |
| copy | `Item.copy() -> Item` | pango_item_copy |  | Copy an existing `PangoItem` structure. |
| free | `Item.free() -> none` | pango_item_free |  | Free a `PangoItem` and all associated memory. |
| split | `Item.split(split_index: gint, split_offset: gint) -> Item` | pango_item_split |  | Modifies @orig to cover only the text after @split_index, and returns a new item that covers the text before @split_index that used to be in @orig.... |

### Pango.Language

GType: `PangoLanguage` ?? C type: `PangoLanguage`

The `PangoLanguage` structure is used to represent a language. `PangoLanguage` pointers can be efficiently copied and compared with each other.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| from_string | `from_string(language: utf8?) -> Language` | pango_language_from_string |  | Convert a language tag to a `PangoLanguage`. The language tag must be in a RFC-3066 format. `PangoLanguage` pointers can be efficiently copied (cop... |
| get_default | `get_default() -> Language` | pango_language_get_default | 1.16 | Returns the `PangoLanguage` for the current locale of the process. On Unix systems, this is the return value is derived from `setlocale (LC_CTYPE, ... |
| get_preferred | `get_preferred() -> Language` | pango_language_get_preferred | 1.48 | Returns the list of languages that the user prefers. The list is specified by the `PANGO_LANGUAGE` or `LANGUAGE` environment variables, in order of... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_sample_string | `Language.get_sample_string() -> utf8` | pango_language_get_sample_string |  | Get a string that is representative of the characters needed to render a particular language. The sample text may be a pangram, but is not necessar... |
| get_scripts | `Language.get_scripts(num_scripts: out gint?) -> Script` | pango_language_get_scripts | 1.22 | Determines the scripts used to to write @language. If nothing is known about the language tag @language, or if @language is %NULL, then %NULL is re... |
| includes_script | `Language.includes_script(script: Script) -> gboolean` | pango_language_includes_script | 1.4 | Determines if @script is one of the scripts used to write @language. The returned value is conservative; if nothing is known about the language tag... |
| matches | `Language.matches(range_list: utf8) -> gboolean` | pango_language_matches |  | Checks if a language tag matches one of the elements in a list of language ranges. A language tag is considered to match a range in the list if the... |
| to_string | `Language.to_string() -> utf8` | pango_language_to_string |  | Gets the RFC-3066 format string representing the given language tag. Returns (transfer none): a string representing the language tag |

### Pango.LayoutClass

C type: `PangoLayoutClass`

### Pango.LayoutIter

GType: `PangoLayoutIter` ?? C type: `PangoLayoutIter`

A `PangoLayoutIter` can be used to iterate over the visual extents of a `PangoLayout`. To obtain a `PangoLayoutIter`, use [method@Pango.Layout.get_...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| at_last_line | `LayoutIter.at_last_line() -> gboolean` | pango_layout_iter_at_last_line |  | Determines whether @iter is on the last line of the layout. |
| copy | `LayoutIter.copy() -> LayoutIter` | pango_layout_iter_copy | 1.20 | Copies a `PangoLayoutIter`. |
| free | `LayoutIter.free() -> none` | pango_layout_iter_free |  | Frees an iterator that's no longer in use. |
| get_baseline | `LayoutIter.get_baseline() -> gint` | pango_layout_iter_get_baseline |  | Gets the Y position of the current line's baseline, in layout coordinates. Layout coordinates have the origin at the top left of the entire layout. |
| get_char_extents | `LayoutIter.get_char_extents(logical_rect: out Rectangle) -> none` | pango_layout_iter_get_char_extents |  | Gets the extents of the current character, in layout coordinates. Layout coordinates have the origin at the top left of the entire layout. Only log... |
| get_cluster_extents | `LayoutIter.get_cluster_extents(ink_rect: out Rectangle?, logical_rect: out Rectangle?) -> none` | pango_layout_iter_get_cluster_extents |  | Gets the extents of the current cluster, in layout coordinates. Layout coordinates have the origin at the top left of the entire layout. |
| get_index | `LayoutIter.get_index() -> gint` | pango_layout_iter_get_index |  | Gets the current byte index. Note that iterating forward by char moves in visual order, not logical order, so indexes may not be sequential. Also, ... |
| get_layout | `LayoutIter.get_layout() -> Layout` | pango_layout_iter_get_layout | 1.20 | Gets the layout associated with a `PangoLayoutIter`. |
| get_layout_extents | `LayoutIter.get_layout_extents(ink_rect: out Rectangle?, logical_rect: out Rectangle?) -> none` | pango_layout_iter_get_layout_extents |  | Obtains the extents of the `PangoLayout` being iterated over. |
| get_line | `LayoutIter.get_line() -> LayoutLine` | pango_layout_iter_get_line |  | Gets the current line. Use the faster [method@Pango.LayoutIter.get_line_readonly] if you do not plan to modify the contents of the line (glyphs, gl... |
| get_line_extents | `LayoutIter.get_line_extents(ink_rect: out Rectangle?, logical_rect: out Rectangle?) -> none` | pango_layout_iter_get_line_extents |  | Obtains the extents of the current line. Extents are in layout coordinates (origin is the top-left corner of the entire `PangoLayout`). Thus the ex... |
| get_line_readonly | `LayoutIter.get_line_readonly() -> LayoutLine` | pango_layout_iter_get_line_readonly | 1.16 | Gets the current line for read-only access. This is a faster alternative to [method@Pango.LayoutIter.get_line], but the user is not expected to mod... |
| get_line_yrange | `LayoutIter.get_line_yrange(y0_: out gint?, y1_: out gint?) -> none` | pango_layout_iter_get_line_yrange |  | Divides the vertical space in the `PangoLayout` being iterated over between the lines in the layout, and returns the space belonging to the current... |
| get_run | `LayoutIter.get_run() -> LayoutRun` | pango_layout_iter_get_run |  | Gets the current run. When iterating by run, at the end of each line, there's a position with a %NULL run, so this function can return %NULL. The %... |
| get_run_baseline | `LayoutIter.get_run_baseline() -> gint` | pango_layout_iter_get_run_baseline | 1.50 | Gets the Y position of the current run's baseline, in layout coordinates. Layout coordinates have the origin at the top left of the entire layout. ... |
| get_run_extents | `LayoutIter.get_run_extents(ink_rect: out Rectangle?, logical_rect: out Rectangle?) -> none` | pango_layout_iter_get_run_extents |  | Gets the extents of the current run in layout coordinates. Layout coordinates have the origin at the top left of the entire layout. |
| get_run_readonly | `LayoutIter.get_run_readonly() -> LayoutRun` | pango_layout_iter_get_run_readonly | 1.16 | Gets the current run for read-only access. When iterating by run, at the end of each line, there's a position with a %NULL run, so this function ca... |
| next_char | `LayoutIter.next_char() -> gboolean` | pango_layout_iter_next_char |  | Moves @iter forward to the next character in visual order. If @iter was already at the end of the layout, returns %FALSE. |
| next_cluster | `LayoutIter.next_cluster() -> gboolean` | pango_layout_iter_next_cluster |  | Moves @iter forward to the next cluster in visual order. If @iter was already at the end of the layout, returns %FALSE. |
| next_line | `LayoutIter.next_line() -> gboolean` | pango_layout_iter_next_line |  | Moves @iter forward to the start of the next line. If @iter is already on the last line, returns %FALSE. |
| next_run | `LayoutIter.next_run() -> gboolean` | pango_layout_iter_next_run |  | Moves @iter forward to the next run in visual order. If @iter was already at the end of the layout, returns %FALSE. |

### Pango.LayoutLine

GType: `PangoLayoutLine` ?? C type: `PangoLayoutLine`

A `PangoLayoutLine` represents one of the lines resulting from laying out a paragraph via `PangoLayout`. `PangoLayoutLine` structures are obtained ...

#### Fields

| Field | Type |
| --- | --- |
| is_paragraph_start | guint |
| layout | Layout |
| length | gint |
| resolved_dir | guint |
| runs | GLib.SList |
| start_index | gint |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_extents | `LayoutLine.get_extents(ink_rect: out Rectangle?, logical_rect: out Rectangle?) -> none` | pango_layout_line_get_extents |  | Computes the logical and ink extents of a layout line. See [method@Pango.Font.get_glyph_extents] for details about the interpretation of the rectan... |
| get_height | `LayoutLine.get_height(height: out gint?) -> none` | pango_layout_line_get_height | 1.44 | Computes the height of the line, as the maximum of the heights of fonts used in this line. Note that the actual baseline-to-baseline distance betwe... |
| get_length | `LayoutLine.get_length() -> gint` | pango_layout_line_get_length | 1.50 | Returns the length of the line, in bytes. |
| get_pixel_extents | `LayoutLine.get_pixel_extents(ink_rect: out Rectangle?, logical_rect: out Rectangle?) -> none` | pango_layout_line_get_pixel_extents |  | Computes the logical and ink extents of @layout_line in device units. This function just calls [method@Pango.LayoutLine.get_extents] followed by tw... |
| get_resolved_direction | `LayoutLine.get_resolved_direction() -> Direction` | pango_layout_line_get_resolved_direction | 1.50 | Returns the resolved direction of the line. |
| get_start_index | `LayoutLine.get_start_index() -> gint` | pango_layout_line_get_start_index | 1.50 | Returns the start index of the line, as byte index into the text of the layout. |
| get_x_ranges | `LayoutLine.get_x_ranges(start_index: gint, end_index: gint, ranges: out gint, n_ranges: out gint) -> none` | pango_layout_line_get_x_ranges |  | Gets a list of visual ranges corresponding to a given logical range. This list is not necessarily minimal - there may be consecutive ranges which a... |
| index_to_x | `LayoutLine.index_to_x(index_: gint, trailing: gboolean, x_pos: out gint) -> none` | pango_layout_line_index_to_x |  | Converts an index within a line to a X position. |
| is_paragraph_start | `LayoutLine.is_paragraph_start() -> gboolean` | pango_layout_line_is_paragraph_start | 1.50 | Returns whether this is the first line of the paragraph. |
| ref | `LayoutLine.ref() -> LayoutLine` | pango_layout_line_ref | 1.10 | Increase the reference count of a `PangoLayoutLine` by one. |
| unref | `LayoutLine.unref() -> none` | pango_layout_line_unref |  | Decrease the reference count of a `PangoLayoutLine` by one. If the result is zero, the line and all associated memory will be freed. |
| x_to_index | `LayoutLine.x_to_index(x_pos: gint, index_: out gint, trailing: out gint) -> gboolean` | pango_layout_line_x_to_index |  | Converts from x offset to the byte index of the corresponding character within the text of the layout. If @x_pos is outside the line, @index_ and @... |

### Pango.LogAttr

C type: `PangoLogAttr`

The `PangoLogAttr` structure stores information about the attributes of a single character.

#### Fields

| Field | Type |
| --- | --- |
| backspace_deletes_character | guint |
| break_inserts_hyphen | guint |
| break_removes_preceding | guint |
| is_char_break | guint |
| is_cursor_position | guint |
| is_expandable_space | guint |
| is_line_break | guint |
| is_mandatory_break | guint |
| is_sentence_boundary | guint |
| is_sentence_end | guint |
| is_sentence_start | guint |
| is_white | guint |
| is_word_boundary | guint |
| is_word_end | guint |
| is_word_start | guint |
| reserved | guint |

### Pango.Matrix

GType: `PangoMatrix` ?? C type: `PangoMatrix`

A `PangoMatrix` specifies a transformation between user-space and device coordinates. The transformation is given by ``` x_device = x_user * matrix...

#### Fields

| Field | Type |
| --- | --- |
| x0 | gdouble |
| xx | gdouble |
| xy | gdouble |
| y0 | gdouble |
| yx | gdouble |
| yy | gdouble |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| concat | `Matrix.concat(new_matrix: Matrix) -> none` | pango_matrix_concat | 1.6 | Changes the transformation represented by @matrix to be the transformation given by first applying transformation given by @new_matrix then applyin... |
| copy | `Matrix.copy() -> Matrix` | pango_matrix_copy | 1.6 | Copies a `PangoMatrix`. |
| free | `Matrix.free() -> none` | pango_matrix_free | 1.6 | Free a `PangoMatrix`. |
| get_font_scale_factor | `Matrix.get_font_scale_factor() -> gdouble` | pango_matrix_get_font_scale_factor | 1.12 | Returns the scale factor of a matrix on the height of the font. That is, the scale factor in the direction perpendicular to the vector that the X c... |
| get_font_scale_factors | `Matrix.get_font_scale_factors(xscale: out gdouble?, yscale: out gdouble?) -> none` | pango_matrix_get_font_scale_factors | 1.38 | Calculates the scale factor of a matrix on the width and height of the font. That is, @xscale is the scale factor in the direction of the X coordin... |
| get_slant_ratio | `Matrix.get_slant_ratio() -> gdouble` | pango_matrix_get_slant_ratio | 1.50 | Gets the slant ratio of a matrix. For a simple shear matrix in the form: 1 ?? 0 1 this is simply ??. |
| rotate | `Matrix.rotate(degrees: gdouble) -> none` | pango_matrix_rotate | 1.6 | Changes the transformation represented by @matrix to be the transformation given by first rotating by @degrees degrees counter-clockwise then apply... |
| scale | `Matrix.scale(scale_x: gdouble, scale_y: gdouble) -> none` | pango_matrix_scale | 1.6 | Changes the transformation represented by @matrix to be the transformation given by first scaling by @sx in the X direction and @sy in the Y direct... |
| transform_distance | `Matrix.transform_distance(dx: inout gdouble, dy: inout gdouble) -> none` | pango_matrix_transform_distance | 1.16 | Transforms the distance vector (@dx,@dy) by @matrix. This is similar to [method@Pango.Matrix.transform_point], except that the translation componen... |
| transform_pixel_rectangle | `Matrix.transform_pixel_rectangle(rect: inout Rectangle?) -> none` | pango_matrix_transform_pixel_rectangle | 1.16 | First transforms the @rect using @matrix, then calculates the bounding box of the transformed rectangle. This function is useful for example when y... |
| transform_point | `Matrix.transform_point(x: inout gdouble, y: inout gdouble) -> none` | pango_matrix_transform_point | 1.16 | Transforms the point (@x, @y) by @matrix. |
| transform_rectangle | `Matrix.transform_rectangle(rect: inout Rectangle?) -> none` | pango_matrix_transform_rectangle | 1.16 | First transforms @rect using @matrix, then calculates the bounding box of the transformed rectangle. This function is useful for example when you w... |
| translate | `Matrix.translate(tx: gdouble, ty: gdouble) -> none` | pango_matrix_translate | 1.6 | Changes the transformation represented by @matrix to be the transformation given by first translating by (@tx, @ty) then applying the original tran... |

### Pango.Rectangle

C type: `PangoRectangle`

The `PangoRectangle` structure represents a rectangle. `PangoRectangle` is frequently used to represent the logical or ink extents of a single glyp...

#### Fields

| Field | Type |
| --- | --- |
| height | gint |
| width | gint |
| x | gint |
| y | gint |

### Pango.RendererClass

C type: `PangoRendererClass`

Class structure for `PangoRenderer`. The following vfuncs take user space coordinates in Pango units and have default implementations: - draw_glyph...

#### Fields

| Field | Type |
| --- | --- |
| _pango_reserved2 | none |
| _pango_reserved3 | none |
| _pango_reserved4 | none |
| begin | none |
| draw_error_underline | none |
| draw_glyph | none |
| draw_glyph_item | none |
| draw_glyphs | none |
| draw_rectangle | none |
| draw_shape | none |
| draw_trapezoid | none |
| end | none |
| parent_class | GObject.ObjectClass |
| part_changed | none |
| prepare_run | none |

### Pango.RendererPrivate

C type: `PangoRendererPrivate`

### Pango.ScriptIter

GType: `PangoScriptIter` ?? C type: `PangoScriptIter`

A `PangoScriptIter` is used to iterate through a string and identify ranges in different scripts.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ScriptIter.new(text: utf8, length: gint) -> ScriptIter` | pango_script_iter_new | 1.4 | Create a new `PangoScriptIter`, used to break a string of Unicode text into runs by Unicode script. No copy is made of @text, so the caller needs t... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free | `ScriptIter.free() -> none` | pango_script_iter_free | 1.4 | Frees a `PangoScriptIter`. |
| get_range | `ScriptIter.get_range(start: out utf8?, end: out utf8?, script: out Script?) -> none` | pango_script_iter_get_range | 1.4 | Gets information about the range to which @iter currently points. The range is the set of locations p where *start <= p < *end. (That is, it doesn'... |
| next | `ScriptIter.next() -> gboolean` | pango_script_iter_next | 1.4 | Advances a `PangoScriptIter` to the next range. If @iter is already at the end, it is left unchanged and %FALSE is returned. |

### Pango.TabArray

GType: `PangoTabArray` ?? C type: `PangoTabArray`

A `PangoTabArray` contains an array of tab stops. `PangoTabArray` can be used to set tab stops in a `PangoLayout`. Each tab stop has an alignment, ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TabArray.new(initial_size: gint, positions_in_pixels: gboolean) -> TabArray` | pango_tab_array_new |  | Creates an array of @initial_size tab stops. Tab stops are specified in pixel units if @positions_in_pixels is %TRUE, otherwise in Pango units. All... |
| new_with_positions | `TabArray.new_with_positions(size: gint, positions_in_pixels: gboolean, first_alignment: TabAlign, first_position: gint, ...: void) -> TabArray` | pango_tab_array_new_with_positions |  | Creates a `PangoTabArray` and allows you to specify the alignment and position of each tab stop. You **must** provide an alignment and position for... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| from_string | `from_string(text: utf8) -> TabArray` | pango_tab_array_from_string | 1.50 | Deserializes a `PangoTabArray` from a string. This is the counterpart to [method@Pango.TabArray.to_string]. See that functions for details about th... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `TabArray.copy() -> TabArray` | pango_tab_array_copy |  | Copies a `PangoTabArray`. |
| free | `TabArray.free() -> none` | pango_tab_array_free |  | Frees a tab array and associated resources. |
| get_decimal_point | `TabArray.get_decimal_point(tab_index: gint) -> gunichar` | pango_tab_array_get_decimal_point | 1.50 | Gets the Unicode character to use as decimal point. This is only relevant for tabs with %PANGO_TAB_DECIMAL alignment, which align content at the fi... |
| get_positions_in_pixels | `TabArray.get_positions_in_pixels() -> gboolean` | pango_tab_array_get_positions_in_pixels |  | Returns %TRUE if the tab positions are in pixels, %FALSE if they are in Pango units. |
| get_size | `TabArray.get_size() -> gint` | pango_tab_array_get_size |  | Gets the number of tab stops in @tab_array. |
| get_tab | `TabArray.get_tab(tab_index: gint, alignment: out TabAlign?, location: out gint?) -> none` | pango_tab_array_get_tab |  | Gets the alignment and position of a tab stop. |
| get_tabs | `TabArray.get_tabs(alignments: out TabAlign?, locations: out gint?) -> none` | pango_tab_array_get_tabs |  | If non-%NULL, @alignments and @locations are filled with allocated arrays. The arrays are of length [method@Pango.TabArray.get_size]. You must free... |
| resize | `TabArray.resize(new_size: gint) -> none` | pango_tab_array_resize |  | Resizes a tab array. You must subsequently initialize any tabs that were added as a result of growing the array. |
| set_decimal_point | `TabArray.set_decimal_point(tab_index: gint, decimal_point: gunichar) -> none` | pango_tab_array_set_decimal_point | 1.50 | Sets the Unicode character to use as decimal point. This is only relevant for tabs with %PANGO_TAB_DECIMAL alignment, which align content at the fi... |
| set_positions_in_pixels | `TabArray.set_positions_in_pixels(positions_in_pixels: gboolean) -> none` | pango_tab_array_set_positions_in_pixels | 1.50 | Sets whether positions in this array are specified in pixels. |
| set_tab | `TabArray.set_tab(tab_index: gint, alignment: TabAlign, location: gint) -> none` | pango_tab_array_set_tab |  | Sets the alignment and location of a tab stop. |
| sort | `TabArray.sort() -> none` | pango_tab_array_sort | 1.50 | Utility function to ensure that the tab stops are in increasing order. |
| to_string | `TabArray.to_string() -> utf8` | pango_tab_array_to_string | 1.50 | Serializes a `PangoTabArray` to a string. No guarantees are made about the format of the string, it may change between Pango versions. The intended... |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| attr_allow_breaks_new | `attr_allow_breaks_new(allow_breaks: gboolean) -> Attribute` | pango_attr_allow_breaks_new | 1.44 | Create a new allow-breaks attribute. If breaks are disabled, the range will be kept in a single run, as far as possible. |
| attr_background_alpha_new | `attr_background_alpha_new(alpha: guint16) -> Attribute` | pango_attr_background_alpha_new | 1.38 | Create a new background alpha attribute. |
| attr_background_new | `attr_background_new(red: guint16, green: guint16, blue: guint16) -> Attribute` | pango_attr_background_new |  | Create a new background color attribute. |
| attr_baseline_shift_new | `attr_baseline_shift_new(shift: gint) -> Attribute` | pango_attr_baseline_shift_new | 1.50 | Create a new baseline displacement attribute. The effect of this attribute is to shift the baseline of a run, relative to the run of preceding run.... |
| attr_break | `attr_break(text: utf8, length: gint, attr_list: AttrList, offset: gint, attrs: LogAttr, attrs_len: gint) -> none` | pango_attr_break | 1.50 | Apply customization from attributes to the breaks in @attrs. The line breaks are assumed to have been produced by [func@Pango.default_break] and [f... |
| attr_fallback_new | `attr_fallback_new(enable_fallback: gboolean) -> Attribute` | pango_attr_fallback_new | 1.4 | Create a new font fallback attribute. If fallback is disabled, characters will only be used from the closest matching font on the system. No fallba... |
| attr_family_new | `attr_family_new(family: utf8) -> Attribute` | pango_attr_family_new |  | Create a new font family attribute. |
| attr_font_desc_new | `attr_font_desc_new(desc: FontDescription) -> Attribute` | pango_attr_font_desc_new |  | Create a new font description attribute. This attribute allows setting family, style, weight, variant, stretch, and size simultaneously. |
| attr_font_features_new | `attr_font_features_new(features: utf8) -> Attribute` | pango_attr_font_features_new | 1.38 | Create a new font features tag attribute. You can use this attribute to select OpenType font features like small-caps, alternative glyphs, ligature... |
| attr_font_scale_new | `attr_font_scale_new(scale: FontScale) -> Attribute` | pango_attr_font_scale_new | 1.50 | Create a new font scale attribute. The effect of this attribute is to change the font size of a run, relative to the size of preceding run. |
| attr_foreground_alpha_new | `attr_foreground_alpha_new(alpha: guint16) -> Attribute` | pango_attr_foreground_alpha_new | 1.38 | Create a new foreground alpha attribute. |
| attr_foreground_new | `attr_foreground_new(red: guint16, green: guint16, blue: guint16) -> Attribute` | pango_attr_foreground_new |  | Create a new foreground color attribute. |
| attr_gravity_hint_new | `attr_gravity_hint_new(hint: GravityHint) -> Attribute` | pango_attr_gravity_hint_new | 1.16 | Create a new gravity hint attribute. |
| attr_gravity_new | `attr_gravity_new(gravity: Gravity) -> Attribute` | pango_attr_gravity_new | 1.16 | Create a new gravity attribute. |
| attr_insert_hyphens_new | `attr_insert_hyphens_new(insert_hyphens: gboolean) -> Attribute` | pango_attr_insert_hyphens_new | 1.44 | Create a new insert-hyphens attribute. Pango will insert hyphens when breaking lines in the middle of a word. This attribute can be used to suppres... |
| attr_language_new | `attr_language_new(language: Language) -> Attribute` | pango_attr_language_new |  | Create a new language tag attribute. |
| attr_letter_spacing_new | `attr_letter_spacing_new(letter_spacing: gint) -> Attribute` | pango_attr_letter_spacing_new | 1.6 | Create a new letter-spacing attribute. |
| attr_line_height_new | `attr_line_height_new(factor: gdouble) -> Attribute` | pango_attr_line_height_new | 1.50 | Modify the height of logical line extents by a factor. This affects the values returned by [method@Pango.LayoutLine.get_extents], [method@Pango.Lay... |
| attr_line_height_new_absolute | `attr_line_height_new_absolute(height: gint) -> Attribute` | pango_attr_line_height_new_absolute | 1.50 | Override the height of logical line extents to be @height. This affects the values returned by [method@Pango.LayoutLine.get_extents], [method@Pango... |
| attr_list_from_string | `attr_list_from_string(text: utf8) -> AttrList` | pango_attr_list_from_string | 1.50 | Deserializes a `PangoAttrList` from a string. This is the counterpart to [method@Pango.AttrList.to_string]. See that functions for details about th... |
| attr_overline_color_new | `attr_overline_color_new(red: guint16, green: guint16, blue: guint16) -> Attribute` | pango_attr_overline_color_new | 1.46 | Create a new overline color attribute. This attribute modifies the color of overlines. If not set, overlines will use the foreground color. |
| attr_overline_new | `attr_overline_new(overline: Overline) -> Attribute` | pango_attr_overline_new | 1.46 | Create a new overline-style attribute. |
| attr_rise_new | `attr_rise_new(rise: gint) -> Attribute` | pango_attr_rise_new |  | Create a new baseline displacement attribute. |
| attr_scale_new | `attr_scale_new(scale_factor: gdouble) -> Attribute` | pango_attr_scale_new |  | Create a new font size scale attribute. The base font for the affected text will have its size multiplied by @scale_factor. |
| attr_sentence_new | `attr_sentence_new() -> Attribute` | pango_attr_sentence_new | 1.50 | Marks the range of the attribute as a single sentence. Note that this may require adjustments to word and sentence classification around the range. |
| attr_shape_new | `attr_shape_new(ink_rect: Rectangle, logical_rect: Rectangle) -> Attribute` | pango_attr_shape_new |  | Create a new shape attribute. A shape is used to impose a particular ink and logical rectangle on the result of shaping a particular glyph. This mi... |
| attr_shape_new_with_data | `attr_shape_new_with_data(ink_rect: Rectangle, logical_rect: Rectangle, data: gpointer?, copy_func: AttrDataCopyFunc?, destroy_func: GLib.DestroyNotify?) -> Attribute` | pango_attr_shape_new_with_data | 1.8 | Creates a new shape attribute. Like [func@Pango.AttrShape.new], but a user data pointer is also provided; this pointer can be accessed when later r... |
| attr_show_new | `attr_show_new(flags: ShowFlags) -> Attribute` | pango_attr_show_new | 1.44 | Create a new attribute that influences how invisible characters are rendered. |
| attr_size_new | `attr_size_new(size: gint) -> Attribute` | pango_attr_size_new |  | Create a new font-size attribute in fractional points. |
| attr_size_new_absolute | `attr_size_new_absolute(size: gint) -> Attribute` | pango_attr_size_new_absolute | 1.8 | Create a new font-size attribute in device units. |
| attr_stretch_new | `attr_stretch_new(stretch: Stretch) -> Attribute` | pango_attr_stretch_new |  | Create a new font stretch attribute. |
| attr_strikethrough_color_new | `attr_strikethrough_color_new(red: guint16, green: guint16, blue: guint16) -> Attribute` | pango_attr_strikethrough_color_new | 1.8 | Create a new strikethrough color attribute. This attribute modifies the color of strikethrough lines. If not set, strikethrough lines will use the ... |
| attr_strikethrough_new | `attr_strikethrough_new(strikethrough: gboolean) -> Attribute` | pango_attr_strikethrough_new |  | Create a new strike-through attribute. |
| attr_style_new | `attr_style_new(style: Style) -> Attribute` | pango_attr_style_new |  | Create a new font slant style attribute. |
| attr_text_transform_new | `attr_text_transform_new(transform: TextTransform) -> Attribute` | pango_attr_text_transform_new | 1.50 | Create a new attribute that influences how characters are transformed during shaping. |
| attr_type_get_name | `attr_type_get_name(type: AttrType) -> utf8` | pango_attr_type_get_name | 1.22 | Fetches the attribute type name. The attribute type name is the string passed in when registering the type using [func@Pango.AttrType.register]. Th... |
| attr_type_register | `attr_type_register(name: utf8) -> AttrType` | pango_attr_type_register |  | Allocate a new attribute type ID. The attribute type name can be accessed later by using [func@Pango.AttrType.get_name]. |
| attr_underline_color_new | `attr_underline_color_new(red: guint16, green: guint16, blue: guint16) -> Attribute` | pango_attr_underline_color_new | 1.8 | Create a new underline color attribute. This attribute modifies the color of underlines. If not set, underlines will use the foreground color. |
| attr_underline_new | `attr_underline_new(underline: Underline) -> Attribute` | pango_attr_underline_new |  | Create a new underline-style attribute. |
| attr_variant_new | `attr_variant_new(variant: Variant) -> Attribute` | pango_attr_variant_new |  | Create a new font variant attribute (normal or small caps). |
| attr_weight_new | `attr_weight_new(weight: Weight) -> Attribute` | pango_attr_weight_new |  | Create a new font weight attribute. |
| attr_word_new | `attr_word_new() -> Attribute` | pango_attr_word_new | 1.50 | Marks the range of the attribute as a single word. Note that this may require adjustments to word and sentence classification around the range. |
| bidi_type_for_unichar | `bidi_type_for_unichar(ch: gunichar) -> BidiType` | pango_bidi_type_for_unichar | 1.22 | Determines the bidirectional type of a character. The bidirectional type is specified in the Unicode Character Database. A simplified version of th... |
| break | `break(text: utf8, length: gint, analysis: Analysis, attrs: LogAttr, attrs_len: gint) -> none` | pango_break |  | Determines possible line, word, and character breaks for a string of Unicode text with a single analysis. For most purposes you may want to use [fu... |
| default_break | `default_break(text: utf8, length: gint, analysis: Analysis?, attrs: LogAttr, attrs_len: gint) -> none` | pango_default_break |  | This is the default break algorithm. It applies rules from the Unicode Line Breaking Algorithm without language-specific tailoring, therefore the @... |
| extents_to_pixels | `extents_to_pixels(inclusive: Rectangle?, nearest: Rectangle?) -> none` | pango_extents_to_pixels | 1.16 | Converts extents from Pango units to device units. The conversion is done by dividing by the %PANGO_SCALE factor and performing rounding. The @incl... |
| find_base_dir | `find_base_dir(text: utf8, length: gint) -> Direction` | pango_find_base_dir | 1.4 | Searches a string the first character that has a strong direction, according to the Unicode bidirectional algorithm. |
| find_paragraph_boundary | `find_paragraph_boundary(text: utf8, length: gint, paragraph_delimiter_index: out gint, next_paragraph_start: out gint) -> none` | pango_find_paragraph_boundary |  | Locates a paragraph boundary in @text. A boundary is caused by delimiter characters, such as a newline, carriage return, carriage return-newline pa... |
| font_description_from_string | `font_description_from_string(str: utf8) -> FontDescription` | pango_font_description_from_string |  | Creates a new font description from a string representation. The string must have the form "\[FAMILY-LIST] \[STYLE-OPTIONS] \[SIZE] \[VARIATIONS]",... |
| get_log_attrs | `get_log_attrs(text: utf8, length: gint, level: gint, language: Language, attrs: LogAttr, attrs_len: gint) -> none` | pango_get_log_attrs |  | Computes a `PangoLogAttr` for each character in @text. The @attrs array must have one `PangoLogAttr` for each position in @text; if @text contains ... |
| get_mirror_char | `get_mirror_char(ch: gunichar, mirrored_ch: gunichar) -> gboolean` | pango_get_mirror_char |  | Returns the mirrored character of a Unicode character. Mirror characters are determined by the Unicode mirrored property. |
| gravity_get_for_matrix | `gravity_get_for_matrix(matrix: Matrix?) -> Gravity` | pango_gravity_get_for_matrix | 1.16 | Finds the gravity that best matches the rotation component in a `PangoMatrix`. |
| gravity_get_for_script | `gravity_get_for_script(script: Script, base_gravity: Gravity, hint: GravityHint) -> Gravity` | pango_gravity_get_for_script | 1.16 | Returns the gravity to use in laying out a `PangoItem`. The gravity is determined based on the script, base gravity, and hint. If @base_gravity is ... |
| gravity_get_for_script_and_width | `gravity_get_for_script_and_width(script: Script, wide: gboolean, base_gravity: Gravity, hint: GravityHint) -> Gravity` | pango_gravity_get_for_script_and_width | 1.26 | Returns the gravity to use in laying out a single character or `PangoItem`. The gravity is determined based on the script, East Asian width, base g... |
| gravity_to_rotation | `gravity_to_rotation(gravity: Gravity) -> gdouble` | pango_gravity_to_rotation | 1.16 | Converts a `PangoGravity` value to its natural rotation in radians. Note that [method@Pango.Matrix.rotate] takes angle in degrees, not radians. So,... |
| is_zero_width | `is_zero_width(ch: gunichar) -> gboolean` | pango_is_zero_width | 1.10 | Checks if a character that should not be normally rendered. This includes all Unicode characters with "ZERO WIDTH" in their name, as well as *bidi*... |
| itemize | `itemize(context: Context, text: utf8, start_index: gint, length: gint, attrs: AttrList, cached_iter: AttrIterator?) -> GLib.List` | pango_itemize |  | Breaks a piece of text into segments with consistent directional level and font. Each byte of @text will be contained in exactly one of the items i... |
| itemize_with_base_dir | `itemize_with_base_dir(context: Context, base_dir: Direction, text: utf8, start_index: gint, length: gint, attrs: AttrList, cached_iter: AttrIterator?) -> GLib.List` | pango_itemize_with_base_dir | 1.4 | Like `pango_itemize()`, but with an explicitly specified base direction. The base direction is used when computing bidirectional levels. [func@item... |
| language_from_string | `language_from_string(language: utf8?) -> Language` | pango_language_from_string |  | Convert a language tag to a `PangoLanguage`. The language tag must be in a RFC-3066 format. `PangoLanguage` pointers can be efficiently copied (cop... |
| language_get_default | `language_get_default() -> Language` | pango_language_get_default | 1.16 | Returns the `PangoLanguage` for the current locale of the process. On Unix systems, this is the return value is derived from `setlocale (LC_CTYPE, ... |
| language_get_preferred | `language_get_preferred() -> Language` | pango_language_get_preferred | 1.48 | Returns the list of languages that the user prefers. The list is specified by the `PANGO_LANGUAGE` or `LANGUAGE` environment variables, in order of... |
| layout_deserialize_error_quark | `layout_deserialize_error_quark() -> GLib.Quark` | pango_layout_deserialize_error_quark |  |  |
| log2vis_get_embedding_levels | `log2vis_get_embedding_levels(text: utf8, length: gint, pbase_dir: Direction) -> guint8` | pango_log2vis_get_embedding_levels | 1.4 | Return the bidirectional embedding levels of the input paragraph. The bidirectional embedding levels are defined by the Unicode Bidirectional Algor... |
| markup_parser_finish | `markup_parser_finish(context: GLib.MarkupParseContext, attr_list: out AttrList?, text: out utf8?, accel_char: out gunichar?) -> gboolean throws` | pango_markup_parser_finish | 1.31.0 | Finishes parsing markup. After feeding a Pango markup parser some data with [method@GLib.MarkupParseContext.parse], use this function to get the li... |
| markup_parser_new | `markup_parser_new(accel_marker: gunichar) -> GLib.MarkupParseContext` | pango_markup_parser_new | 1.31.0 | Incrementally parses marked-up text to create a plain-text string and an attribute list. See the Pango Markup docs for details about the supported ... |
| parse_enum | `parse_enum(type: GType, str: utf8?, value: out gint?, warn: gboolean, possible_values: out utf8?) -> gboolean` | pango_parse_enum | 1.16 | Parses an enum type and stores the result in @value. If @str does not match the nick name of any of the possible values for the enum and is not an ... |
| parse_markup | `parse_markup(markup_text: utf8, length: gint, accel_marker: gunichar, attr_list: out AttrList?, text: out utf8?, accel_char: out gunichar?) -> gboolean throws` | pango_parse_markup |  | Parses marked-up text to create a plain-text string and an attribute list. See the Pango Markup docs for details about the supported markup. If @ac... |
| parse_stretch | `parse_stretch(str: utf8, stretch: out Stretch, warn: gboolean) -> gboolean` | pango_parse_stretch |  | Parses a font stretch. The allowed values are "ultra_condensed", "extra_condensed", "condensed", "semi_condensed", "normal", "semi_expanded", "expa... |
| parse_style | `parse_style(str: utf8, style: out Style, warn: gboolean) -> gboolean` | pango_parse_style |  | Parses a font style. The allowed values are "normal", "italic" and "oblique", case variations being ignored. |
| parse_variant | `parse_variant(str: utf8, variant: out Variant, warn: gboolean) -> gboolean` | pango_parse_variant |  | Parses a font variant. The allowed values are "normal", "small-caps", "all-small-caps", "petite-caps", "all-petite-caps", "unicase" and "title-caps... |
| parse_weight | `parse_weight(str: utf8, weight: out Weight, warn: gboolean) -> gboolean` | pango_parse_weight |  | Parses a font weight. The allowed values are "heavy", "ultrabold", "bold", "normal", "light", "ultraleight" and integers. Case variations are ignored. |
| quantize_line_geometry | `quantize_line_geometry(thickness: inout gint, position: inout gint) -> none` | pango_quantize_line_geometry | 1.12 | Quantizes the thickness and position of a line to whole device pixels. This is typically used for underline or strikethrough. The purpose of this f... |
| read_line | `read_line(stream: gpointer?, str: GLib.String) -> gint` | pango_read_line |  | Reads an entire line from a file into a buffer. Lines may be delimited with '\n', '\r', '\n\r', or '\r\n'. The delimiter is not written into the bu... |
| reorder_items | `reorder_items(items: GLib.List) -> GLib.List` | pango_reorder_items |  | Reorder items from logical order to visual order. The visual order is determined from the associated directional levels of the items. The original ... |
| scan_int | `scan_int(pos: inout utf8, out: out gint) -> gboolean` | pango_scan_int |  | Scans an integer. Leading white space is skipped. |
| scan_string | `scan_string(pos: inout utf8, out: GLib.String) -> gboolean` | pango_scan_string |  | Scans a string into a `GString` buffer. The string may either be a sequence of non-white-space characters, or a quoted string with '"'. Instead a q... |
| scan_word | `scan_word(pos: inout utf8, out: GLib.String) -> gboolean` | pango_scan_word |  | Scans a word into a `GString` buffer. A word consists of [A-Za-z_] followed by zero or more [A-Za-z_0-9]. Leading white space is skipped. |
| script_for_unichar | `script_for_unichar(ch: gunichar) -> Script` | pango_script_for_unichar | 1.4 | Looks up the script for a particular character. The script of a character is defined by Unicode Standard Annex 24: Script names. No check is made f... |
| script_get_sample_language | `script_get_sample_language(script: Script) -> Language` | pango_script_get_sample_language | 1.4 | Finds a language tag that is reasonably representative of @script. The language will usually be the most widely spoken or used language written in ... |
| shape | `shape(text: utf8, length: gint, analysis: Analysis, glyphs: GlyphString) -> none` | pango_shape |  | Convert the characters in @text into glyphs. Given a segment of text and the corresponding `PangoAnalysis` structure returned from [func@Pango.item... |
| shape_full | `shape_full(item_text: utf8, item_length: gint, paragraph_text: utf8?, paragraph_length: gint, analysis: Analysis, glyphs: GlyphString) -> none` | pango_shape_full | 1.32 | Convert the characters in @text into glyphs. Given a segment of text and the corresponding `PangoAnalysis` structure returned from [func@Pango.item... |
| shape_item | `shape_item(item: Item, paragraph_text: utf8?, paragraph_length: gint, log_attrs: LogAttr?, glyphs: GlyphString, flags: ShapeFlags) -> none` | pango_shape_item | 1.50 | Convert the characters in @item into glyphs. This is similar to [func@Pango.shape_with_flags], except it takes a `PangoItem` instead of separate @i... |
| shape_with_flags | `shape_with_flags(item_text: utf8, item_length: gint, paragraph_text: utf8?, paragraph_length: gint, analysis: Analysis, glyphs: GlyphString, flags: ShapeFlags) -> none` | pango_shape_with_flags | 1.44 | Convert the characters in @text into glyphs. Given a segment of text and the corresponding `PangoAnalysis` structure returned from [func@Pango.item... |
| skip_space | `skip_space(pos: inout utf8) -> gboolean` | pango_skip_space |  | Skips 0 or more characters of white space. |
| split_file_list | `split_file_list(str: utf8) -> utf8` | pango_split_file_list |  | Splits a %G_SEARCHPATH_SEPARATOR-separated list of files, stripping white space and substituting ~/ with $HOME/. |
| tab_array_from_string | `tab_array_from_string(text: utf8) -> TabArray` | pango_tab_array_from_string | 1.50 | Deserializes a `PangoTabArray` from a string. This is the counterpart to [method@Pango.TabArray.to_string]. See that functions for details about th... |
| tailor_break | `tailor_break(text: utf8, length: gint, analysis: Analysis, offset: gint, attrs: LogAttr, attrs_len: gint) -> none` | pango_tailor_break | 1.44 | Apply language-specific tailoring to the breaks in @attrs. The line breaks are assumed to have been produced by [func@Pango.default_break]. If @off... |
| trim_string | `trim_string(str: utf8) -> utf8` | pango_trim_string |  | Trims leading and trailing whitespace from a string. |
| unichar_direction | `unichar_direction(ch: gunichar) -> Direction` | pango_unichar_direction |  | Determines the inherent direction of a character. The inherent direction is either `PANGO_DIRECTION_LTR`, `PANGO_DIRECTION_RTL`, or `PANGO_DIRECTIO... |
| units_from_double | `units_from_double(d: gdouble) -> gint` | pango_units_from_double | 1.16 | Converts a floating-point number to Pango units. The conversion is done by multiplying @d by %PANGO_SCALE and rounding the result to nearest integer. |
| units_to_double | `units_to_double(i: gint) -> gdouble` | pango_units_to_double | 1.16 | Converts a number in Pango units to floating-point. The conversion is done by dividing @i by %PANGO_SCALE. |
| version | `version() -> gint` | pango_version | 1.16 | Returns the encoded version of Pango available at run-time. This is similar to the macro %PANGO_VERSION except that the macro returns the encoded v... |
| version_check | `version_check(required_major: gint, required_minor: gint, required_micro: gint) -> utf8` | pango_version_check | 1.16 | Checks that the Pango library in use is compatible with the given version. Generally you would pass in the constants %PANGO_VERSION_MAJOR, %PANGO_V... |
| version_string | `version_string() -> utf8` | pango_version_string | 1.16 | Returns the version of Pango available at run-time. This is similar to the macro %PANGO_VERSION_STRING except that the macro returns the version av... |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| AttrDataCopyFunc | `AttrDataCopyFunc(user_data: gpointer?) -> gpointer` |  |  | Type of a function that can duplicate user data for an attribute. |
| AttrFilterFunc | `AttrFilterFunc(attribute: Attribute, user_data: gpointer?) -> gboolean` |  |  | Type of a function filtering a list of attributes. |
| FontsetForeachFunc | `FontsetForeachFunc(fontset: Fontset, font: Font, user_data: gpointer?) -> gboolean` |  | 1.4 | Callback used when enumerating fonts in a fontset. See [method@Pango.Fontset.foreach]. |

## Constants

| Name | Type |
| --- | --- |
| ANALYSIS_FLAG_CENTERED_BASELINE | gint |
| ANALYSIS_FLAG_IS_ELLIPSIS | gint |
| ANALYSIS_FLAG_NEED_HYPHEN | gint |
| ATTR_INDEX_FROM_TEXT_BEGINNING | guint |
| ATTR_INDEX_TO_TEXT_END | guint |
| GLYPH_EMPTY | Glyph |
| GLYPH_INVALID_INPUT | Glyph |
| GLYPH_UNKNOWN_FLAG | Glyph |
| SCALE | gint |
| VERSION_MAJOR | gint |
| VERSION_MICRO | gint |
| VERSION_MINOR | gint |
| VERSION_STRING | utf8 |

## Aliases

| Name | Type |
| --- | --- |
| Glyph | guint32 |
| GlyphUnit | gint32 |
| LayoutRun | GlyphItem |

