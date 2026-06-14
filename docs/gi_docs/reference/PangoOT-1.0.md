# PangoOT 1.0

SQGI import: `import("PangoOT", "1.0")`

Packages: `pangoot`
Includes: `PangoFc-1.0`, `freetype2-2.0`
Libraries: `libpangoft2-1.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 2 |
| Interfaces | 0 |
| Records | 4 |
| Unions | 0 |
| Enums | 1 |
| Flags | 0 |
| Functions | 4 |
| Callbacks | 0 |
| Constants | 4 |
| Aliases | 1 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Info | GObject.Object | 0 | 0 | 7 | Returns the `PangoOTInfo` structure for the given FreeType font face. |
| Ruleset | GObject.Object | 0 | 0 | 10 | The `PangoOTRuleset` structure holds a set of features selected from the tables in an OpenType font. A feature is an operation such as adjusting gl... |

### PangoOT.Info

Parent: `GObject.Object` ?? GType: `PangoOTInfo` ?? C type: `PangoOTInfo`

Returns the `PangoOTInfo` structure for the given FreeType font face.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `get(face: freetype2.Face) -> Info` | pango_ot_info_get | 1.2 | Returns the `PangoOTInfo` structure for the given FreeType font face. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| find_feature | `Info.find_feature(table_type: TableType, feature_tag: Tag, script_index: guint, language_index: guint, feature_index: out guint?) -> gboolean` | pango_ot_info_find_feature |  | Finds the index of a feature. If the feature is not found, sets @feature_index to PANGO_OT_NO_FEATURE, which is safe to pass to [method@PangoOT.Rul... |
| find_language | `Info.find_language(table_type: TableType, script_index: guint, language_tag: Tag, language_index: out guint?, required_feature_index: out guint?) -> gboolean` | pango_ot_info_find_language |  | Finds the index of a language and its required feature index. If the language is not found, sets @language_index to %PANGO_OT_DEFAULT_LANGUAGE and ... |
| find_script | `Info.find_script(table_type: TableType, script_tag: Tag, script_index: out guint?) -> gboolean` | pango_ot_info_find_script |  | Finds the index of a script. If not found, tries to find the 'DFLT' and then 'dflt' scripts and return the index of that in @script_index. If none ... |
| list_features | `Info.list_features(table_type: TableType, tag: Tag, script_index: guint, language_index: guint) -> Tag` | pango_ot_info_list_features |  | Obtains the list of features for the given language of the given script. |
| list_languages | `Info.list_languages(table_type: TableType, script_index: guint, language_tag: Tag) -> Tag` | pango_ot_info_list_languages |  | Obtains the list of available languages for a given script. |
| list_scripts | `Info.list_scripts(table_type: TableType) -> Tag` | pango_ot_info_list_scripts |  | Obtains the list of available scripts. |

### PangoOT.Ruleset

Parent: `GObject.Object` ?? GType: `PangoOTRuleset` ?? C type: `PangoOTRuleset`

The `PangoOTRuleset` structure holds a set of features selected from the tables in an OpenType font. A feature is an operation such as adjusting gl...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Ruleset.new(info: Info) -> Ruleset` | pango_ot_ruleset_new |  | Creates a new `PangoOTRuleset` for the given OpenType info. |
| new_for | `Ruleset.new_for(info: Info, script: Pango.Script, language: Pango.Language) -> Ruleset` | pango_ot_ruleset_new_for | 1.18 | Creates a new `PangoOTRuleset` for the given OpenType info, script, and language. This function is part of a convenience scheme that highly simplif... |
| new_from_description | `Ruleset.new_from_description(info: Info, desc: RulesetDescription) -> Ruleset` | pango_ot_ruleset_new_from_description | 1.18 | Creates a new `PangoOTRuleset` for the given OpenType info and matching the given ruleset description. This is a convenience function that calls [c... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_for_description | `get_for_description(info: Info, desc: RulesetDescription) -> Ruleset` | pango_ot_ruleset_get_for_description | 1.18 | Returns a ruleset for the given OpenType info and ruleset description. Rulesets are created on demand using [ctor@PangoOT.Ruleset.new_from_descript... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_feature | `Ruleset.add_feature(table_type: TableType, feature_index: guint, property_bit: gulong) -> none` | pango_ot_ruleset_add_feature |  | Adds a feature to the ruleset. |
| get_feature_count | `Ruleset.get_feature_count(n_gsub_features: out guint?, n_gpos_features: out guint?) -> guint` | pango_ot_ruleset_get_feature_count | 1.18 | Gets the number of GSUB and GPOS features in the ruleset. |
| maybe_add_feature | `Ruleset.maybe_add_feature(table_type: TableType, feature_tag: Tag, property_bit: gulong) -> gboolean` | pango_ot_ruleset_maybe_add_feature | 1.18 | This is a convenience function that first tries to find the feature using [method@PangoOT.Info.find_feature] and the ruleset script and language pa... |
| maybe_add_features | `Ruleset.maybe_add_features(table_type: TableType, features: FeatureMap, n_features: guint) -> guint` | pango_ot_ruleset_maybe_add_features | 1.18 | This is a convenience function that for each feature in the feature map array @features converts the feature name to a `PangoOTTag` feature tag usi... |
| position | `Ruleset.position(buffer: Buffer) -> none` | pango_ot_ruleset_position | 1.4 | Performs the OpenType GPOS positioning on @buffer using the features in @ruleset. |
| substitute | `Ruleset.substitute(buffer: Buffer) -> none` | pango_ot_ruleset_substitute | 1.4 | Performs the OpenType GSUB substitution on @buffer using the features in @ruleset. |

## Enums

### PangoOT.TableType

C type: `PangoOTTableType`

The PangoOTTableType enumeration values are used to identify the various OpenType tables in the pango_ot_info_??? functions.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| gpos | 1 |  | The GPOS table. |
| gsub | 0 |  | The GSUB table. |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Buffer |  | 0 | 0 | 8 | Creates a new `PangoOTBuffer` for the given OpenType font. |
| FeatureMap |  | 0 | 0 | 0 | The `PangoOTFeatureMap` typedef is used to represent an OpenType feature with the property bit associated with it. The feature tag is represented a... |
| Glyph |  | 0 | 0 | 0 | The `PangoOTGlyph` structure represents a single glyph together with information used for OpenType layout processing of the glyph. It contains the ... |
| RulesetDescription |  | 0 | 0 | 4 | The `PangoOTRuleset` structure holds all the information needed to build a complete `PangoOTRuleset` from an OpenType font. The main use of this st... |

### PangoOT.Buffer

GType: `PangoOTBuffer` ?? C type: `PangoOTBuffer`

Creates a new `PangoOTBuffer` for the given OpenType font.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Buffer.new(font: PangoFc.Font) -> Buffer` | pango_ot_buffer_new | 1.4 | Creates a new `PangoOTBuffer` for the given OpenType font. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_glyph | `Buffer.add_glyph(glyph: guint, properties: guint, cluster: guint) -> none` | pango_ot_buffer_add_glyph | 1.4 | Appends a glyph to a `PangoOTBuffer`, with @properties identifying which features should be applied on this glyph. See [method@PangoOT.Ruleset.add_... |
| clear | `Buffer.clear() -> none` | pango_ot_buffer_clear | 1.4 | Empties a `PangoOTBuffer`, make it ready to add glyphs to. |
| destroy | `Buffer.destroy() -> none` | pango_ot_buffer_destroy | 1.4 | Destroys a `PangoOTBuffer` and free all associated memory. |
| get_glyphs | `Buffer.get_glyphs(glyphs: out Glyph?, n_glyphs: out gint?) -> none` | pango_ot_buffer_get_glyphs | 1.4 | Gets the glyph array contained in a `PangoOTBuffer`. The glyphs are owned by the buffer and should not be freed, and are only valid as long as buff... |
| output | `Buffer.output(glyphs: Pango.GlyphString) -> none` | pango_ot_buffer_output | 1.4 | Exports the glyphs in a `PangoOTBuffer` into a `PangoGlyphString`. This is typically used after the OpenType layout processing is over, to convert ... |
| set_rtl | `Buffer.set_rtl(rtl: gboolean) -> none` | pango_ot_buffer_set_rtl | 1.4 | Sets whether glyphs will be rendered right-to-left. This setting is needed for proper horizontal positioning of right-to-left scripts. |
| set_zero_width_marks | `Buffer.set_zero_width_marks(zero_width_marks: gboolean) -> none` | pango_ot_buffer_set_zero_width_marks | 1.6 | Sets whether characters with a mark class should be forced to zero width. This setting is needed for proper positioning of Arabic accents, but will... |

### PangoOT.FeatureMap

C type: `PangoOTFeatureMap`

The `PangoOTFeatureMap` typedef is used to represent an OpenType feature with the property bit associated with it. The feature tag is represented a...

#### Fields

| Field | Type |
| --- | --- |
| feature_name | gchar |
| property_bit | gulong |

### PangoOT.Glyph

C type: `PangoOTGlyph`

The `PangoOTGlyph` structure represents a single glyph together with information used for OpenType layout processing of the glyph. It contains the ...

#### Fields

| Field | Type |
| --- | --- |
| cluster | guint |
| component | gushort |
| glyph | guint32 |
| internal | guint |
| ligID | gushort |
| properties | guint |

### PangoOT.RulesetDescription

GType: `PangoOTRulesetDescription` ?? C type: `PangoOTRulesetDescription`

The `PangoOTRuleset` structure holds all the information needed to build a complete `PangoOTRuleset` from an OpenType font. The main use of this st...

#### Fields

| Field | Type |
| --- | --- |
| language | Pango.Language |
| n_other_features | guint |
| n_static_gpos_features | guint |
| n_static_gsub_features | guint |
| other_features | FeatureMap |
| script | Pango.Script |
| static_gpos_features | FeatureMap |
| static_gsub_features | FeatureMap |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `RulesetDescription.copy() -> RulesetDescription` | pango_ot_ruleset_description_copy | 1.18 | Creates a copy of @desc, which should be freed with [method@PangoOT.RulesetDescription.free]. Primarily used internally by [func@PangoOT.Ruleset.ge... |
| equal | `RulesetDescription.equal(desc2: RulesetDescription) -> gboolean` | pango_ot_ruleset_description_equal | 1.18 | Compares two ruleset descriptions for equality. Two ruleset descriptions are considered equal if the rulesets they describe are provably identical.... |
| free | `RulesetDescription.free() -> none` | pango_ot_ruleset_description_free | 1.18 | Frees a ruleset description allocated by pango_ot_ruleset_description_copy(). |
| hash | `RulesetDescription.hash() -> guint` | pango_ot_ruleset_description_hash | 1.18 | Computes a hash of a `PangoOTRulesetDescription` structure suitable to be used, for example, as an argument to g_hash_table_new(). |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| tag_from_language | `tag_from_language(language: Pango.Language?) -> Tag` | pango_ot_tag_from_language | 1.18 | Finds the OpenType language-system tag best describing @language. |
| tag_from_script | `tag_from_script(script: Pango.Script) -> Tag` | pango_ot_tag_from_script | 1.18 | Finds the OpenType script tag corresponding to @script. The %PANGO_SCRIPT_COMMON, %PANGO_SCRIPT_INHERITED, and %PANGO_SCRIPT_UNKNOWN scripts are ma... |
| tag_to_language | `tag_to_language(language_tag: Tag) -> Pango.Language` | pango_ot_tag_to_language | 1.18 | Finds a `PangoLanguage` corresponding to @language_tag. |
| tag_to_script | `tag_to_script(script_tag: Tag) -> Pango.Script` | pango_ot_tag_to_script | 1.18 | Finds the `PangoScript` corresponding to @script_tag. The 'DFLT' script tag is mapped to %PANGO_SCRIPT_COMMON. Note that an OpenType script tag may... |

## Constants

| Name | Type |
| --- | --- |
| ALL_GLYPHS | guint |
| DEFAULT_LANGUAGE | guint |
| NO_FEATURE | guint |
| NO_SCRIPT | guint |

## Aliases

| Name | Type |
| --- | --- |
| Tag | guint32 |

