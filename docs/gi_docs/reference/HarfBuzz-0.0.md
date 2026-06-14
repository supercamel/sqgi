# HarfBuzz 0.0

SQGI import: `import("HarfBuzz", "0.0")`

Packages: `harfbuzz`, `harfbuzz-gobject`
Includes: `GObject-2.0`, `freetype2-2.0`
Libraries: `libharfbuzz-gobject.so.0`, `libharfbuzz.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 0 |
| Interfaces | 0 |
| Records | 31 |
| Unions | 2 |
| Enums | 20 |
| Flags | 7 |
| Functions | 498 |
| Callbacks | 48 |
| Constants | 20 |
| Aliases | 17 |

## Enums

### HarfBuzz.aat_layout_feature_selector_t

GType: `hb_aat_layout_feature_selector_t` ?? C type: `hb_aat_layout_feature_selector_t`

The selectors defined for specifying AAT feature settings.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| abbrev_squared_ligatures_off | 15 | abbrev-squared-ligatures-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| abbrev_squared_ligatures_on | 14 | abbrev-squared-ligatures-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| all_caps | 1 | all-caps | Deprecated |
| all_lower_case | 2 | all-lower-case | Deprecated |
| all_type_features_off | 1 | all-type-features-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_ALL_TYPOGRAPHIC |
| all_type_features_on | 0 | all-type-features-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_ALL_TYPOGRAPHIC |
| alt_half_width_text | 6 | alt-half-width-text | for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING |
| alt_proportional_text | 5 | alt-proportional-text | for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING |
| alternate_horiz_kana_off | 1 | alternate-horiz-kana-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA |
| alternate_horiz_kana_on | 0 | alternate-horiz-kana-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA |
| alternate_vert_kana_off | 3 | alternate-vert-kana-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA |
| alternate_vert_kana_on | 2 | alternate-vert-kana-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA |
| asterisk_to_multiply_off | 3 | asterisk-to-multiply-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS |
| asterisk_to_multiply_on | 2 | asterisk-to-multiply-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS |
| box_annotation | 1 | box-annotation | for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE |
| canonical_composition_off | 1 | canonical-composition-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE |
| canonical_composition_on | 0 | canonical-composition-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE |
| case_sensitive_layout_off | 1 | case-sensitive-layout-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT |
| case_sensitive_layout_on | 0 | case-sensitive-layout-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT |
| case_sensitive_spacing_off | 3 | case-sensitive-spacing-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT |
| case_sensitive_spacing_on | 2 | case-sensitive-spacing-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT |
| circle_annotation | 3 | circle-annotation | for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE |
| cjk_italic_roman | 1 | cjk-italic-roman | Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_ITALIC_ROMAN_ON instead |
| cjk_italic_roman_off | 3 | cjk-italic-roman-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_ITALIC_CJK_ROMAN |
| cjk_italic_roman_on | 2 | cjk-italic-roman-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_ITALIC_CJK_ROMAN |
| cjk_symbol_alt_five | 5 | cjk-symbol-alt-five | for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE |
| cjk_symbol_alt_four | 4 | cjk-symbol-alt-four | for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE |
| cjk_symbol_alt_one | 1 | cjk-symbol-alt-one | for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE |
| cjk_symbol_alt_three | 3 | cjk-symbol-alt-three | for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE |
| cjk_symbol_alt_two | 2 | cjk-symbol-alt-two | for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE |
| cjk_vertical_roman_centered | 0 | cjk-vertical-roman-centered | for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_VERTICAL_ROMAN_PLACEMENT_TYPE |
| cjk_vertical_roman_hbaseline | 1 | cjk-vertical-roman-hbaseline | for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_VERTICAL_ROMAN_PLACEMENT_TYPE |
| common_ligatures_off | 3 | common-ligatures-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| common_ligatures_on | 2 | common-ligatures-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| compatibility_composition_off | 3 | compatibility-composition-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE |
| compatibility_composition_on | 2 | compatibility-composition-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE |
| contextual_alternates_off | 1 | contextual-alternates-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES |
| contextual_alternates_on | 0 | contextual-alternates-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES |
| contextual_ligatures_off | 19 | contextual-ligatures-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| contextual_ligatures_on | 18 | contextual-ligatures-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| contextual_swash_alternates_off | 5 | contextual-swash-alternates-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES |
| contextual_swash_alternates_on | 4 | contextual-swash-alternates-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES |
| cursive | 2 | cursive | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| decompose_diacritics | 2 | decompose-diacritics | for #HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE |
| decorative_borders | 4 | decorative-borders | for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE |
| default_cjk_roman | 2 | default-cjk-roman | for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE |
| default_lower_case | 0 | default-lower-case | for #HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE |
| default_upper_case | 0 | default-upper-case | for #HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE |
| design_level1 | 0 | design-level1 | for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE |
| design_level2 | 1 | design-level2 | for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE |
| design_level3 | 2 | design-level3 | for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE |
| design_level4 | 3 | design-level4 | for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE |
| design_level5 | 4 | design-level5 | for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE |
| diagonal_fractions | 2 | diagonal-fractions | for #HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS |
| diamond_annotation | 8 | diamond-annotation | for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE |
| dingbats | 1 | dingbats | for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE |
| diphthong_ligatures_off | 11 | diphthong-ligatures-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| diphthong_ligatures_on | 10 | diphthong-ligatures-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| display_text | 1 | display-text | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS |
| engraved_text | 2 | engraved-text | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS |
| expert_characters | 10 | expert-characters | for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE |
| exponents_off | 9 | exponents-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS |
| exponents_on | 8 | exponents-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS |
| fleurons | 3 | fleurons | for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE |
| form_interrobang_off | 7 | form-interrobang-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS |
| form_interrobang_on | 6 | form-interrobang-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS |
| full_width_cjk_roman | 3 | full-width-cjk-roman | for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE |
| full_width_ideographs | 0 | full-width-ideographs | for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE |
| full_width_kana | 0 | full-width-kana | for #HB_AAT_LAYOUT_FEATURE_TYPE_KANA_SPACING_TYPE |
| half_width_cjk_roman | 0 | half-width-cjk-roman | for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE |
| half_width_ideographs | 2 | half-width-ideographs | for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE |
| half_width_text | 2 | half-width-text | for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING |
| hanja_to_hangul | 1 | hanja-to-hangul | for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION |
| hanja_to_hangul_alt_one | 7 | hanja-to-hangul-alt-one | for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION |
| hanja_to_hangul_alt_three | 9 | hanja-to-hangul-alt-three | for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION |
| hanja_to_hangul_alt_two | 8 | hanja-to-hangul-alt-two | for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION |
| hide_diacritics | 1 | hide-diacritics | for #HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE |
| hiragana_to_katakana | 2 | hiragana-to-katakana | for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION |
| historical_ligatures_off | 21 | historical-ligatures-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| historical_ligatures_on | 20 | historical-ligatures-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| hojo_characters | 12 | hojo-characters | for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE |
| hyphen_to_en_dash_off | 3 | hyphen-to-en-dash-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS |
| hyphen_to_en_dash_on | 2 | hyphen-to-en-dash-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS |
| hyphen_to_minus_off | 1 | hyphen-to-minus-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS |
| hyphen_to_minus_on | 0 | hyphen-to-minus-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS |
| hyphens_to_em_dash_off | 1 | hyphens-to-em-dash-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS |
| hyphens_to_em_dash_on | 0 | hyphens-to-em-dash-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS |
| ideographic_alt_five | 5 | ideographic-alt-five | for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE |
| ideographic_alt_four | 4 | ideographic-alt-four | for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE |
| ideographic_alt_one | 1 | ideographic-alt-one | for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE |
| ideographic_alt_three | 3 | ideographic-alt-three | for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE |
| ideographic_alt_two | 2 | ideographic-alt-two | for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE |
| illuminated_caps | 3 | illuminated-caps | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS |
| inequality_ligatures_off | 7 | inequality-ligatures-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS |
| inequality_ligatures_on | 6 | inequality-ligatures-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS |
| inferiors | 2 | inferiors | for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION |
| initial_caps | 4 | initial-caps | Deprecated |
| initial_caps_and_small_caps | 5 | initial-caps-and-small-caps | Deprecated |
| international_symbols | 5 | international-symbols | for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE |
| invalid | 65535 | invalid | Initial, unset feature selector |
| inverted_box_annotation | 9 | inverted-box-annotation | for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE |
| inverted_circle_annotation | 4 | inverted-circle-annotation | for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE |
| inverted_rounded_box_annotation | 10 | inverted-rounded-box-annotation | for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE |
| jis1978_characters | 2 | jis1978-characters | for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE |
| jis1983_characters | 3 | jis1983-characters | for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE |
| jis1990_characters | 4 | jis1990-characters | for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE |
| jis2004_characters | 11 | jis2004-characters | for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE |
| kana_to_romanization | 4 | kana-to-romanization | for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION |
| katakana_to_hiragana | 3 | katakana-to-hiragana | for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION |
| line_final_swashes_off | 7 | line-final-swashes-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE |
| line_final_swashes_on | 6 | line-final-swashes-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE |
| line_initial_swashes_off | 5 | line-initial-swashes-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE |
| line_initial_swashes_on | 4 | line-initial-swashes-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE |
| linguistic_rearrangement_off | 1 | linguistic-rearrangement-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_LINGUISTIC_REARRANGEMENT |
| linguistic_rearrangement_on | 0 | linguistic-rearrangement-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_LINGUISTIC_REARRANGEMENT |
| logos_off | 7 | logos-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| logos_on | 6 | logos-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| lower_case_numbers | 0 | lower-case-numbers | for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_CASE |
| lower_case_petite_caps | 2 | lower-case-petite-caps | for #HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE |
| lower_case_small_caps | 1 | lower-case-small-caps | for #HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE |
| math_symbols | 6 | math-symbols | for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE |
| mathematical_greek_off | 11 | mathematical-greek-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS |
| mathematical_greek_on | 10 | mathematical-greek-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS |
| monospaced_numbers | 0 | monospaced-numbers | for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING |
| monospaced_text | 1 | monospaced-text | for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING |
| nlccharacters | 13 | nlccharacters | for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE |
| no_alternates | 0 | no-alternates | for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_ALTERNATIVES |
| no_annotation | 0 | no-annotation | for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE |
| no_cjk_italic_roman | 0 | no-cjk-italic-roman | Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_ITALIC_ROMAN_OFF instead |
| no_cjk_symbol_alternatives | 0 | no-cjk-symbol-alternatives | for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE |
| no_fractions | 0 | no-fractions | for #HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS |
| no_ideographic_alternatives | 0 | no-ideographic-alternatives | for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE |
| no_ornaments | 0 | no-ornaments | for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE |
| no_ruby_kana | 0 | no-ruby-kana | Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_RUBY_KANA_OFF instead |
| no_style_options | 0 | no-style-options | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS |
| no_stylistic_alternates | 0 | no-stylistic-alternates | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| no_transliteration | 0 | no-transliteration | for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION |
| non_final_swashes_off | 9 | non-final-swashes-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE |
| non_final_swashes_on | 8 | non-final-swashes-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE |
| normal_position | 0 | normal-position | for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION |
| ordinals | 3 | ordinals | for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION |
| parenthesis_annotation | 5 | parenthesis-annotation | for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE |
| partially_connected | 1 | partially-connected | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| period_annotation | 6 | period-annotation | for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE |
| periods_to_ellipsis_off | 11 | periods-to-ellipsis-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS |
| periods_to_ellipsis_on | 10 | periods-to-ellipsis-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS |
| pi_characters | 2 | pi-characters | for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE |
| prevent_overlap_off | 1 | prevent-overlap-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_OVERLAPPING_CHARACTERS_TYPE |
| prevent_overlap_on | 0 | prevent-overlap-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_OVERLAPPING_CHARACTERS_TYPE |
| proportional_cjk_roman | 1 | proportional-cjk-roman | for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE |
| proportional_ideographs | 1 | proportional-ideographs | for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE |
| proportional_kana | 1 | proportional-kana | for #HB_AAT_LAYOUT_FEATURE_TYPE_KANA_SPACING_TYPE |
| proportional_numbers | 1 | proportional-numbers | for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING |
| proportional_text | 0 | proportional-text | for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING |
| quarter_width_numbers | 3 | quarter-width-numbers | for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING |
| quarter_width_text | 4 | quarter-width-text | for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING |
| rare_ligatures_off | 5 | rare-ligatures-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| rare_ligatures_on | 4 | rare-ligatures-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| rebus_pictures_off | 9 | rebus-pictures-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| rebus_pictures_on | 8 | rebus-pictures-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| required_ligatures_off | 1 | required-ligatures-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| required_ligatures_on | 0 | required-ligatures-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| roman_numeral_annotation | 7 | roman-numeral-annotation | for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE |
| romanization_to_hiragana | 5 | romanization-to-hiragana | for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION |
| romanization_to_katakana | 6 | romanization-to-katakana | for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION |
| rounded_box_annotation | 2 | rounded-box-annotation | for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE |
| ruby_kana | 1 | ruby-kana | Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_RUBY_KANA_ON instead |
| ruby_kana_off | 3 | ruby-kana-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_RUBY_KANA |
| ruby_kana_on | 2 | ruby-kana-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_RUBY_KANA |
| scientific_inferiors | 4 | scientific-inferiors | for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION |
| show_diacritics | 0 | show-diacritics | for #HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE |
| simplified_characters | 1 | simplified-characters | for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE |
| slash_to_divide_off | 5 | slash-to-divide-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS |
| slash_to_divide_on | 4 | slash-to-divide-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS |
| slashed_zero_off | 5 | slashed-zero-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS |
| slashed_zero_on | 4 | slashed-zero-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS |
| small_caps | 3 | small-caps | Deprecated |
| smart_quotes_off | 9 | smart-quotes-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS |
| smart_quotes_on | 8 | smart-quotes-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS |
| squared_ligatures_off | 13 | squared-ligatures-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| squared_ligatures_on | 12 | squared-ligatures-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| stylistic_alt_eight_off | 17 | stylistic-alt-eight-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_eight_on | 16 | stylistic-alt-eight-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_eighteen_off | 37 | stylistic-alt-eighteen-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_eighteen_on | 36 | stylistic-alt-eighteen-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_eleven_off | 23 | stylistic-alt-eleven-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_eleven_on | 22 | stylistic-alt-eleven-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_fifteen_off | 31 | stylistic-alt-fifteen-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_fifteen_on | 30 | stylistic-alt-fifteen-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_five_off | 11 | stylistic-alt-five-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_five_on | 10 | stylistic-alt-five-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_four_off | 9 | stylistic-alt-four-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_four_on | 8 | stylistic-alt-four-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_fourteen_off | 29 | stylistic-alt-fourteen-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_fourteen_on | 28 | stylistic-alt-fourteen-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_nine_off | 19 | stylistic-alt-nine-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_nine_on | 18 | stylistic-alt-nine-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_nineteen_off | 39 | stylistic-alt-nineteen-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_nineteen_on | 38 | stylistic-alt-nineteen-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_one_off | 3 | stylistic-alt-one-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_one_on | 2 | stylistic-alt-one-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_seven_off | 15 | stylistic-alt-seven-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_seven_on | 14 | stylistic-alt-seven-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_seventeen_off | 35 | stylistic-alt-seventeen-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_seventeen_on | 34 | stylistic-alt-seventeen-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_six_off | 13 | stylistic-alt-six-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_six_on | 12 | stylistic-alt-six-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_sixteen_off | 33 | stylistic-alt-sixteen-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_sixteen_on | 32 | stylistic-alt-sixteen-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_ten_off | 21 | stylistic-alt-ten-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_ten_on | 20 | stylistic-alt-ten-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_thirteen_off | 27 | stylistic-alt-thirteen-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_thirteen_on | 26 | stylistic-alt-thirteen-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_three_off | 7 | stylistic-alt-three-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_three_on | 6 | stylistic-alt-three-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_twelve_off | 25 | stylistic-alt-twelve-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_twelve_on | 24 | stylistic-alt-twelve-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_twenty_off | 41 | stylistic-alt-twenty-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_twenty_on | 40 | stylistic-alt-twenty-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_two_off | 5 | stylistic-alt-two-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| stylistic_alt_two_on | 4 | stylistic-alt-two-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES |
| substitute_vertical_forms_off | 1 | substitute-vertical-forms-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_SUBSTITUTION |
| substitute_vertical_forms_on | 0 | substitute-vertical-forms-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_SUBSTITUTION |
| superiors | 1 | superiors | for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION |
| swash_alternates_off | 3 | swash-alternates-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES |
| swash_alternates_on | 2 | swash-alternates-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES |
| symbol_ligatures_off | 17 | symbol-ligatures-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| symbol_ligatures_on | 16 | symbol-ligatures-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| tall_caps | 5 | tall-caps | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS |
| third_width_numbers | 2 | third-width-numbers | for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING |
| third_width_text | 3 | third-width-text | for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING |
| titling_caps | 4 | titling-caps | for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS |
| traditional_alt_five | 9 | traditional-alt-five | for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE |
| traditional_alt_four | 8 | traditional-alt-four | for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE |
| traditional_alt_one | 5 | traditional-alt-one | for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE |
| traditional_alt_three | 7 | traditional-alt-three | for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE |
| traditional_alt_two | 6 | traditional-alt-two | for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE |
| traditional_characters | 0 | traditional-characters | for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE |
| traditional_names_characters | 14 | traditional-names-characters | for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE |
| transcoding_composition_off | 5 | transcoding-composition-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE |
| transcoding_composition_on | 4 | transcoding-composition-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE |
| unconnected | 0 | unconnected | for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES |
| upper_and_lower_case | 0 | upper-and-lower-case | Deprecated |
| upper_case_numbers | 1 | upper-case-numbers | for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_CASE |
| upper_case_petite_caps | 2 | upper-case-petite-caps | for #HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE |
| upper_case_small_caps | 1 | upper-case-small-caps | for #HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE |
| vertical_fractions | 1 | vertical-fractions | for #HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS |
| word_final_swashes_off | 3 | word-final-swashes-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE |
| word_final_swashes_on | 2 | word-final-swashes-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE |
| word_initial_swashes_off | 1 | word-initial-swashes-off | for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE |
| word_initial_swashes_on | 0 | word-initial-swashes-on | for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE |

### HarfBuzz.aat_layout_feature_type_t

GType: `hb_aat_layout_feature_type_t` ?? C type: `hb_aat_layout_feature_type_t`

The possible feature types defined for AAT shaping, from Apple Font Feature Registry.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all_typographic | 0 | all-typographic | All Typographic Features |
| alternate_kana | 34 | alternate-kana | Alternate Kana |
| annotation_type | 24 | annotation-type | Annotation |
| case_sensitive_layout | 33 | case-sensitive-layout | Case Sensitive Layout |
| character_alternatives | 17 | character-alternatives | Character Alternatives |
| character_shape | 20 | character-shape | Character Shape |
| cjk_roman_spacing_type | 103 | cjk-roman-spacing-type | CJK Roman Spacing |
| cjk_symbol_alternatives_type | 29 | cjk-symbol-alternatives-type | CJK Symbol Alternatives |
| cjk_vertical_roman_placement_type | 31 | cjk-vertical-roman-placement-type | CJK Vertical Roman Placement |
| contextual_alternatives | 36 | contextual-alternatives | Contextual Alternatives |
| cursive_connection | 2 | cursive-connection | Cursive Connection |
| design_complexity_type | 18 | design-complexity-type | Design Complexity |
| diacritics_type | 9 | diacritics-type | Diacritics |
| fractions | 11 | fractions | Fractions |
| ideographic_alternatives_type | 30 | ideographic-alternatives-type | Ideographic Alternatives |
| ideographic_spacing_type | 26 | ideographic-spacing-type | Ideographic Spacing |
| invalid | 65535 | invalid | Initial, unset feature type |
| italic_cjk_roman | 32 | italic-cjk-roman | Italic CJK Roman |
| kana_spacing_type | 25 | kana-spacing-type | Kana Spacing |
| language_tag_type | 39 | language-tag-type | Language Tag |
| letter_case | 3 | letter-case | Letter Case |
| ligatures | 1 | ligatures | Ligatures |
| linguistic_rearrangement | 5 | linguistic-rearrangement | Linguistic Rearrangement |
| lower_case | 37 | lower-case | Lower Case |
| mathematical_extras | 15 | mathematical-extras | Mathematical Extras |
| number_case | 21 | number-case | Number Case |
| number_spacing | 6 | number-spacing | Number Spacing |
| ornament_sets_type | 16 | ornament-sets-type | Ornament Sets |
| overlapping_characters_type | 13 | overlapping-characters-type | Overlapping Characters |
| ruby_kana | 28 | ruby-kana | Ruby Kana |
| smart_swash_type | 8 | smart-swash-type | Smart Swash |
| style_options | 19 | style-options | Style Options |
| stylistic_alternatives | 35 | stylistic-alternatives | Stylistic Alternatives |
| text_spacing | 22 | text-spacing | Text Spacing |
| transliteration | 23 | transliteration | Transliteration |
| typographic_extras | 14 | typographic-extras | Typographic Extras |
| unicode_decomposition_type | 27 | unicode-decomposition-type | Unicode Decomposition |
| upper_case | 38 | upper-case | Upper Case |
| vertical_position | 10 | vertical-position | Vertical Position |
| vertical_substitution | 4 | vertical-substitution | Vertical Substitution |

### HarfBuzz.buffer_cluster_level_t

GType: `hb_buffer_cluster_level_t` ?? C type: `hb_buffer_cluster_level_t`

Data type for holding HarfBuzz's clustering behavior options. The cluster level dictates one aspect of how HarfBuzz will treat non-base characters ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| characters | 2 | characters | Don't group cluster values. |
| default | 0 | default | Default cluster level, equal to @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES. |
| monotone_characters | 1 | monotone-characters | Return cluster values grouped into monotone order. |
| monotone_graphemes | 0 | monotone-graphemes | Return cluster values grouped by graphemes into monotone order. |

### HarfBuzz.buffer_content_type_t

GType: `hb_buffer_content_type_t` ?? C type: `hb_buffer_content_type_t`

The type of #hb_buffer_t contents.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| glyphs | 2 | glyphs | The buffer contains output glyphs (after shaping). |
| invalid | 0 | invalid | Initial value for new buffer. |
| unicode | 1 | unicode | The buffer contains input characters (before shaping). |

### HarfBuzz.buffer_serialize_format_t

GType: `hb_buffer_serialize_format_t` ?? C type: `hb_buffer_serialize_format_t`

The buffer serialization and de-serialization format used in hb_buffer_serialize_glyphs() and hb_buffer_deserialize_glyphs().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| invalid | 0 | invalid | invalid format. |
| json | 1246973774 | json | a machine-readable JSON format. |
| text | 1413830740 | text | a human-readable, plain text format. |

### HarfBuzz.direction_t

GType: `hb_direction_t` ?? C type: `hb_direction_t`

The direction of a text segment or buffer. A segment can also be tested for horizontal or vertical orientation (irrespective of specific direction)...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| btt | 7 | btt | Text is set vertically from bottom to top. |
| invalid | 0 | invalid | Initial, unset direction. |
| ltr | 4 | ltr | Text is set horizontally from left to right. |
| rtl | 5 | rtl | Text is set horizontally from right to left. |
| ttb | 6 | ttb | Text is set vertically from top to bottom. |

### HarfBuzz.memory_mode_t

GType: `hb_memory_mode_t` ?? C type: `hb_memory_mode_t`

Data type holding the memory modes available to client programs. Regarding these various memory-modes: - In no case shall the HarfBuzz client modif...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| duplicate | 0 | duplicate | HarfBuzz immediately makes a copy of the data. |
| readonly | 1 | readonly | HarfBuzz client will never modify the data, and HarfBuzz will never modify the data. |
| readonly_may_make_writable | 3 | readonly-may-make-writable | See above |
| writable | 2 | writable | HarfBuzz client made a copy of the data solely for HarfBuzz, so HarfBuzz may modify the data. |

### HarfBuzz.ot_layout_baseline_tag_t

GType: `hb_ot_layout_baseline_tag_t` ?? C type: `hb_ot_layout_baseline_tag_t`

Baseline tags from Baseline Tags registry.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| hanging | 1751215719 | hanging | The hanging baseline. In horizontal direction, this is the horizontal line from which syllables seem, to hang in Tibetan and other similar scripts.... |
| ideo_embox_bottom_or_left | 1768187247 | ideo-embox-bottom-or-left | Ideographic em-box bottom or left edge, if the direction is horizontal or vertical, respectively. |
| ideo_embox_central | 1231315813 | ideo-embox-central | The center of the ideographic em-box. Since: 4.0.0 if the direction is horizontal or vertical, respectively. |
| ideo_embox_top_or_right | 1768191088 | ideo-embox-top-or-right | Ideographic em-box top or right edge baseline, |
| ideo_face_bottom_or_left | 1768121954 | ideo-face-bottom-or-left | Ideographic character face bottom or left edge, if the direction is horizontal or vertical, respectively. |
| ideo_face_central | 1231251043 | ideo-face-central | The center of the ideographic character face. Since: 4.0.0 |
| ideo_face_top_or_right | 1768121972 | ideo-face-top-or-right | Ideographic character face top or right edge, if the direction is horizontal or vertical, respectively. |
| math | 1835103336 | math | The baseline about which mathematical characters are centered. In vertical writing mode when mathematical characters rotated 90 degrees clockwise, ... |
| roman | 1919905134 | roman | The baseline used by alphabetic scripts such as Latin, Cyrillic and Greek. In vertical writing mode, the alphabetic baseline for characters rotated... |

### HarfBuzz.ot_layout_glyph_class_t

GType: `hb_ot_layout_glyph_class_t` ?? C type: `hb_ot_layout_glyph_class_t`

The GDEF classes defined for glyphs.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| base_glyph | 1 | base-glyph | Spacing, single characters, capable of accepting marks |
| component | 4 | component | Spacing glyphs that represent part of a single character |
| ligature | 2 | ligature | Glyphs that represent ligation of multiple characters |
| mark | 3 | mark | Non-spacing, combining glyphs that represent marks |
| unclassified | 0 | unclassified | Glyphs not matching the other classifications |

### HarfBuzz.ot_math_constant_t

GType: `hb_ot_math_constant_t` ?? C type: `hb_ot_math_constant_t`

The 'MATH' table constants, refer to OpenType documentation For more explanations.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| accent_base_height | 6 | accent-base-height | accentBaseHeight |
| axis_height | 5 | axis-height | axisHeight |
| delimited_sub_formula_min_height | 2 | delimited-sub-formula-min-height | delimitedSubFormulaMinHeight |
| display_operator_min_height | 3 | display-operator-min-height | displayOperatorMinHeight |
| flattened_accent_base_height | 7 | flattened-accent-base-height | flattenedAccentBaseHeight |
| fraction_denom_display_style_gap_min | 40 | fraction-denom-display-style-gap-min | fractionDenomDisplayStyleGapMin |
| fraction_denominator_display_style_shift_down | 35 | fraction-denominator-display-style-shift-down | fractionDenominatorDisplayStyleShiftDown |
| fraction_denominator_gap_min | 39 | fraction-denominator-gap-min | fractionDenominatorGapMin |
| fraction_denominator_shift_down | 34 | fraction-denominator-shift-down | fractionDenominatorShiftDown |
| fraction_num_display_style_gap_min | 37 | fraction-num-display-style-gap-min | fractionNumDisplayStyleGapMin |
| fraction_numerator_display_style_shift_up | 33 | fraction-numerator-display-style-shift-up | fractionNumeratorDisplayStyleShiftUp |
| fraction_numerator_gap_min | 36 | fraction-numerator-gap-min | fractionNumeratorGapMin |
| fraction_numerator_shift_up | 32 | fraction-numerator-shift-up | fractionNumeratorShiftUp |
| fraction_rule_thickness | 38 | fraction-rule-thickness | fractionRuleThickness |
| lower_limit_baseline_drop_min | 21 | lower-limit-baseline-drop-min | lowerLimitBaselineDropMin |
| lower_limit_gap_min | 20 | lower-limit-gap-min | lowerLimitGapMin |
| math_leading | 4 | math-leading | mathLeading |
| overbar_extra_ascender | 45 | overbar-extra-ascender | overbarExtraAscender |
| overbar_rule_thickness | 44 | overbar-rule-thickness | overbarRuleThickness |
| overbar_vertical_gap | 43 | overbar-vertical-gap | overbarVerticalGap |
| radical_degree_bottom_raise_percent | 55 | radical-degree-bottom-raise-percent | radicalDegreeBottomRaisePercent |
| radical_display_style_vertical_gap | 50 | radical-display-style-vertical-gap | radicalDisplayStyleVerticalGap |
| radical_extra_ascender | 52 | radical-extra-ascender | radicalExtraAscender |
| radical_kern_after_degree | 54 | radical-kern-after-degree | radicalKernAfterDegree |
| radical_kern_before_degree | 53 | radical-kern-before-degree | radicalKernBeforeDegree |
| radical_rule_thickness | 51 | radical-rule-thickness | radicalRuleThickness |
| radical_vertical_gap | 49 | radical-vertical-gap | radicalVerticalGap |
| script_percent_scale_down | 0 | script-percent-scale-down | scriptPercentScaleDown |
| script_script_percent_scale_down | 1 | script-script-percent-scale-down | scriptScriptPercentScaleDown |
| skewed_fraction_horizontal_gap | 41 | skewed-fraction-horizontal-gap | skewedFractionHorizontalGap |
| skewed_fraction_vertical_gap | 42 | skewed-fraction-vertical-gap | skewedFractionVerticalGap |
| space_after_script | 17 | space-after-script | spaceAfterScript |
| stack_bottom_display_style_shift_down | 25 | stack-bottom-display-style-shift-down | stackBottomDisplayStyleShiftDown |
| stack_bottom_shift_down | 24 | stack-bottom-shift-down | stackBottomShiftDown |
| stack_display_style_gap_min | 27 | stack-display-style-gap-min | stackDisplayStyleGapMin |
| stack_gap_min | 26 | stack-gap-min | stackGapMin |
| stack_top_display_style_shift_up | 23 | stack-top-display-style-shift-up | stackTopDisplayStyleShiftUp |
| stack_top_shift_up | 22 | stack-top-shift-up | stackTopShiftUp |
| stretch_stack_bottom_shift_down | 29 | stretch-stack-bottom-shift-down | stretchStackBottomShiftDown |
| stretch_stack_gap_above_min | 30 | stretch-stack-gap-above-min | stretchStackGapAboveMin |
| stretch_stack_gap_below_min | 31 | stretch-stack-gap-below-min | stretchStackGapBelowMin |
| stretch_stack_top_shift_up | 28 | stretch-stack-top-shift-up | stretchStackTopShiftUp |
| sub_superscript_gap_min | 15 | sub-superscript-gap-min | subSuperscriptGapMin |
| subscript_baseline_drop_min | 10 | subscript-baseline-drop-min | subscriptBaselineDropMin |
| subscript_shift_down | 8 | subscript-shift-down | subscriptShiftDown |
| subscript_top_max | 9 | subscript-top-max | subscriptTopMax |
| superscript_baseline_drop_max | 14 | superscript-baseline-drop-max | superscriptBaselineDropMax |
| superscript_bottom_max_with_subscript | 16 | superscript-bottom-max-with-subscript | superscriptBottomMaxWithSubscript |
| superscript_bottom_min | 13 | superscript-bottom-min | superscriptBottomMin |
| superscript_shift_up | 11 | superscript-shift-up | superscriptShiftUp |
| superscript_shift_up_cramped | 12 | superscript-shift-up-cramped | superscriptShiftUpCramped |
| underbar_extra_descender | 48 | underbar-extra-descender | underbarExtraDescender |
| underbar_rule_thickness | 47 | underbar-rule-thickness | underbarRuleThickness |
| underbar_vertical_gap | 46 | underbar-vertical-gap | underbarVerticalGap |
| upper_limit_baseline_rise_min | 19 | upper-limit-baseline-rise-min | upperLimitBaselineRiseMin |
| upper_limit_gap_min | 18 | upper-limit-gap-min | upperLimitGapMin |

### HarfBuzz.ot_math_kern_t

GType: `hb_ot_math_kern_t` ?? C type: `hb_ot_math_kern_t`

The math kerning-table types defined for the four corners of a glyph.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bottom_left | 3 | bottom-left | The bottom left corner of the glyph. |
| bottom_right | 2 | bottom-right | The bottom right corner of the glyph. |
| top_left | 1 | top-left | The top left corner of the glyph. |
| top_right | 0 | top-right | The top right corner of the glyph. |

### HarfBuzz.ot_meta_tag_t

GType: `hb_ot_meta_tag_t` ?? C type: `hb_ot_meta_tag_t`

Known metadata tags from https://docs.microsoft.com/en-us/typography/opentype/spec/meta

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| design_languages | 1684827751 | design-languages | Design languages. Text, using only Basic Latin (ASCII) characters. Indicates languages and/or scripts for the user audiences that the font was prim... |
| supported_languages | 1936485991 | supported-languages | Supported languages. Text, using only Basic Latin (ASCII) characters. Indicates languages and/or scripts that the font is declared to be capable of... |

### HarfBuzz.ot_metrics_tag_t

GType: `hb_ot_metrics_tag_t` ?? C type: `hb_ot_metrics_tag_t`

Metric tags corresponding to MVAR Value Tags

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cap_height | 1668311156 | cap-height | cap height. |
| horizontal_ascender | 1751216995 | horizontal-ascender | horizontal ascender. |
| horizontal_caret_offset | 1751347046 | horizontal-caret-offset | horizontal caret offset. |
| horizontal_caret_rise | 1751347827 | horizontal-caret-rise | horizontal caret rise. |
| horizontal_caret_run | 1751347822 | horizontal-caret-run | horizontal caret run. |
| horizontal_clipping_ascent | 1751346273 | horizontal-clipping-ascent | horizontal clipping ascent. |
| horizontal_clipping_descent | 1751346276 | horizontal-clipping-descent | horizontal clipping descent. |
| horizontal_descender | 1751413603 | horizontal-descender | horizontal descender. |
| horizontal_line_gap | 1751934832 | horizontal-line-gap | horizontal line gap. |
| strikeout_offset | 1937011311 | strikeout-offset | strikeout offset. |
| strikeout_size | 1937011315 | strikeout-size | strikeout size. |
| subscript_em_x_offset | 1935833199 | subscript-em-x-offset | subscript em x offset. |
| subscript_em_x_size | 1935833203 | subscript-em-x-size | subscript em x size. |
| subscript_em_y_offset | 1935833455 | subscript-em-y-offset | subscript em y offset. |
| subscript_em_y_size | 1935833459 | subscript-em-y-size | subscript em y size. |
| superscript_em_x_offset | 1936750703 | superscript-em-x-offset | superscript em x offset. |
| superscript_em_x_size | 1936750707 | superscript-em-x-size | superscript em x size. |
| superscript_em_y_offset | 1936750959 | superscript-em-y-offset | superscript em y offset. |
| superscript_em_y_size | 1936750963 | superscript-em-y-size | superscript em y size. |
| underline_offset | 1970168943 | underline-offset | underline offset. |
| underline_size | 1970168947 | underline-size | underline size. |
| vertical_ascender | 1986098019 | vertical-ascender | vertical ascender. |
| vertical_caret_offset | 1986228070 | vertical-caret-offset | vertical caret offset. |
| vertical_caret_rise | 1986228851 | vertical-caret-rise | vertical caret rise. |
| vertical_caret_run | 1986228846 | vertical-caret-run | vertical caret run. |
| vertical_descender | 1986294627 | vertical-descender | vertical descender. |
| vertical_line_gap | 1986815856 | vertical-line-gap | vertical line gap. |
| x_height | 2020108148 | x-height | x height. |

### HarfBuzz.ot_name_id_predefined_t

GType: `hb_ot_name_id_predefined_t` ?? C type: `hb_ot_name_id_predefined_t`

An enum type representing the pre-defined name IDs. For more information on these fields, see the OpenType spec.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cid_findfont_name | 20 | cid-findfont-name | PostScript CID findfont name |
| copyright | 0 | copyright | Copyright notice |
| dark_background | 24 | dark-background | Dark Background Palette |
| description | 10 | description | Description |
| designer | 9 | designer | Designer |
| designer_url | 12 | designer-url | URL of typeface designer |
| font_family | 1 | font-family | Font Family name |
| font_subfamily | 2 | font-subfamily | Font Subfamily name |
| full_name | 4 | full-name | Full font name that reflects all family and relevant subfamily descriptors |
| invalid | 65535 | invalid | Value to represent a nonexistent name ID. |
| license | 13 | license | License Description |
| license_url | 14 | license-url | URL where additional licensing information can be found |
| light_background | 23 | light-background | Light Background Palette |
| mac_full_name | 18 | mac-full-name | Compatible Full Name for MacOS |
| manufacturer | 8 | manufacturer | Manufacturer Name |
| postscript_name | 6 | postscript-name | PostScript name for the font |
| sample_text | 19 | sample-text | Sample text |
| trademark | 7 | trademark | Trademark |
| typographic_family | 16 | typographic-family | Typographic Family name |
| typographic_subfamily | 17 | typographic-subfamily | Typographic Subfamily name |
| unique_id | 3 | unique-id | Unique font identifier |
| variations_ps_prefix | 25 | variations-ps-prefix | Variations PostScript Name Prefix |
| vendor_url | 11 | vendor-url | URL of font vendor |
| version_string | 5 | version-string | Version string |
| wws_family | 21 | wws-family | WWS Family Name |
| wws_subfamily | 22 | wws-subfamily | WWS Subfamily Name |

### HarfBuzz.paint_composite_mode_t

GType: `hb_paint_composite_mode_t` ?? C type: `hb_paint_composite_mode_t`

The values of this enumeration describe the compositing modes that can be used when combining temporary redirected drawing with the backdrop. See t...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| clear | 0 | clear | clear destination layer (bounded) |
| color_burn | 18 | color-burn | darkens the destination color to reflect the source color. |
| color_dodge | 17 | color-dodge | brightens the destination color to reflect the source color. |
| darken | 15 | darken | replaces the destination with the source if it is darker, otherwise keeps the source. |
| dest | 2 | dest | ignore the source |
| dest_atop | 10 | dest-atop | leave destination on top of source content and only there (unbounded) |
| dest_in | 6 | dest-in | leave destination only where there was source content (unbounded) |
| dest_out | 8 | dest-out | leave destination only where there was no source content |
| dest_over | 4 | dest-over | draw destination on top of source |
| difference | 21 | difference | Takes the difference of the source and destination color. |
| exclusion | 22 | exclusion | Produces an effect similar to difference, but with lower contrast. |
| hard_light | 19 | hard-light | Multiplies or screens, dependent on source color. |
| hsl_color | 26 | hsl-color | Creates a color with the hue and saturation of the source and the luminosity of the target. This preserves the gray levels of the target and is use... |
| hsl_hue | 24 | hsl-hue | Creates a color with the hue of the source and the saturation and luminosity of the target. |
| hsl_luminosity | 27 | hsl-luminosity | Creates a color with the luminosity of the source and the hue and saturation of the target. This produces an inverse effect to @HB_PAINT_COMPOSITE_... |
| hsl_saturation | 25 | hsl-saturation | Creates a color with the saturation of the source and the hue and luminosity of the target. Painting with this mode onto a gray area produces no ch... |
| lighten | 16 | lighten | replaces the destination with the source if it is lighter, otherwise keeps the source. |
| multiply | 23 | multiply | source and destination layers are multiplied. This causes the result to be at least as dark as the darker inputs. |
| overlay | 14 | overlay | multiplies or screens, depending on the lightness of the destination color. |
| plus | 12 | plus | source and destination layers are accumulated |
| screen | 13 | screen | source and destination are complemented and multiplied. This causes the result to be at least as light as the lighter inputs. |
| soft_light | 20 | soft-light | Darkens or lightens, dependent on source color. |
| src | 1 | src | replace destination layer (bounded) |
| src_atop | 9 | src-atop | draw source on top of destination content and only there |
| src_in | 5 | src-in | draw source where there was destination content (unbounded) |
| src_out | 7 | src-out | draw source where there was no destination content (unbounded) |
| src_over | 3 | src-over | draw source layer on top of destination layer (bounded) |
| xor | 11 | xor | source and destination are shown where there is only one of them |

### HarfBuzz.paint_extend_t

GType: `hb_paint_extend_t` ?? C type: `hb_paint_extend_t`

The values of this enumeration determine how color values outside the minimum and maximum defined offset on a #hb_color_line_t are determined. See ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| pad | 0 | pad | Outside the defined interval, the color of the closest color stop is used. |
| reflect | 2 | reflect | The color line is repeated over repeated intervals, as for the repeat mode. However, in each repeated interval, the ordering of color stops is the ... |
| repeat | 1 | repeat | The color line is repeated over repeated multiples of the defined interval |

### HarfBuzz.script_t

GType: `hb_script_t` ?? C type: `hb_script_t`

Data type for scripts. Each #hb_script_t's value is an #hb_tag_t corresponding to the four-letter values defined by ISO 15924. See also the Script ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| adlam | 1097100397 | adlam | `Adlm`, Since: 1.3.0 |
| ahom | 1097363309 | ahom | `Ahom`, Since: 0.9.30 |
| anatolian_hieroglyphs | 1215067511 | anatolian-hieroglyphs | `Hluw`, Since: 0.9.30 |
| arabic | 1098015074 | arabic | `Arab` |
| armenian | 1098018158 | armenian | `Armn` |
| avestan | 1098281844 | avestan | `Avst` |
| balinese | 1113681001 | balinese | `Bali` |
| bamum | 1113681269 | bamum | `Bamu` |
| bassa_vah | 1113682803 | bassa-vah | `Bass`, Since: 0.9.30 |
| batak | 1113683051 | batak | `Batk` |
| bengali | 1113943655 | bengali | `Beng` |
| bhaiksuki | 1114139507 | bhaiksuki | `Bhks`, Since: 1.3.0 |
| bopomofo | 1114599535 | bopomofo | `Bopo` |
| brahmi | 1114792296 | brahmi | `Brah` |
| braille | 1114792297 | braille | `Brai` |
| buginese | 1114990441 | buginese | `Bugi` |
| buhid | 1114990692 | buhid | `Buhd` |
| canadian_syllabics | 1130458739 | canadian-syllabics | `Cans` |
| carian | 1130459753 | carian | `Cari` |
| caucasian_albanian | 1097295970 | caucasian-albanian | `Aghb`, Since: 0.9.30 |
| chakma | 1130457965 | chakma | `Cakm` |
| cham | 1130914157 | cham | `Cham` |
| cherokee | 1130915186 | cherokee | `Cher` |
| chorasmian | 1130918515 | chorasmian | `Chrs`, Since: 2.6.7 |
| common | 1517910393 | common | `Zyyy` |
| coptic | 1131376756 | coptic | `Copt` |
| cuneiform | 1483961720 | cuneiform | `Xsux` |
| cypriot | 1131442804 | cypriot | `Cprt` |
| cypro_minoan | 1131441518 | cypro-minoan | `Cpmn`, Since: 3.0.0 |
| cyrillic | 1132032620 | cyrillic | `Cyrl` |
| deseret | 1148416628 | deseret | `Dsrt` |
| devanagari | 1147500129 | devanagari | `Deva` |
| dives_akuru | 1147756907 | dives-akuru | `Diak`, Since: 2.6.7 |
| dogra | 1148151666 | dogra | `Dogr`, Since: 1.8.0 |
| duployan | 1148547180 | duployan | `Dupl`, Since: 0.9.30 |
| egyptian_hieroglyphs | 1164409200 | egyptian-hieroglyphs | `Egyp` |
| elbasan | 1164730977 | elbasan | `Elba`, Since: 0.9.30 |
| elymaic | 1164736877 | elymaic | `Elym`, Since: 2.4.0 |
| ethiopic | 1165256809 | ethiopic | `Ethi` |
| georgian | 1197830002 | georgian | `Geor` |
| glagolitic | 1198285159 | glagolitic | `Glag` |
| gothic | 1198486632 | gothic | `Goth` |
| grantha | 1198678382 | grantha | `Gran`, Since: 0.9.30 |
| greek | 1198679403 | greek | `Grek` |
| gujarati | 1198877298 | gujarati | `Gujr` |
| gunjala_gondi | 1198485095 | gunjala-gondi | `Gong`, Since: 1.8.0 |
| gurmukhi | 1198879349 | gurmukhi | `Guru` |
| han | 1214344809 | han | `Hani` |
| hangul | 1214344807 | hangul | `Hang` |
| hanifi_rohingya | 1383032935 | hanifi-rohingya | `Rohg`, Since: 1.8.0 |
| hanunoo | 1214344815 | hanunoo | `Hano` |
| hatran | 1214346354 | hatran | `Hatr`, Since: 0.9.30 |
| hebrew | 1214603890 | hebrew | `Hebr` |
| hiragana | 1214870113 | hiragana | `Hira` |
| imperial_aramaic | 1098018153 | imperial-aramaic | `Armi` |
| inherited | 1516858984 | inherited | `Zinh` |
| inscriptional_pahlavi | 1349020777 | inscriptional-pahlavi | `Phli` |
| inscriptional_parthian | 1349678185 | inscriptional-parthian | `Prti` |
| invalid | 0 | invalid | No script set |
| javanese | 1247901281 | javanese | `Java` |
| kaithi | 1265920105 | kaithi | `Kthi` |
| kannada | 1265525857 | kannada | `Knda` |
| katakana | 1264676449 | katakana | `Kana` |
| kawi | 1264678761 | kawi | `Kawi`, Since: 5.2.0 |
| kayah_li | 1264675945 | kayah-li | `Kali` |
| kharoshthi | 1265131890 | kharoshthi | `Khar` |
| khitan_small_script | 1265202291 | khitan-small-script | `Kits`, Since: 2.6.7 |
| khmer | 1265134962 | khmer | `Khmr` |
| khojki | 1265135466 | khojki | `Khoj`, Since: 0.9.30 |
| khudawadi | 1399418468 | khudawadi | `Sind`, Since: 0.9.30 |
| lao | 1281453935 | lao | `Laoo` |
| latin | 1281455214 | latin | `Latn` |
| lepcha | 1281716323 | lepcha | `Lepc` |
| limbu | 1281977698 | limbu | `Limb` |
| linear_a | 1281977953 | linear-a | `Lina`, Since: 0.9.30 |
| linear_b | 1281977954 | linear-b | `Linb` |
| lisu | 1281979253 | lisu | `Lisu` |
| lycian | 1283023721 | lycian | `Lyci` |
| lydian | 1283023977 | lydian | `Lydi` |
| mahajani | 1298229354 | mahajani | `Mahj`, Since: 0.9.30 |
| makasar | 1298230113 | makasar | `Maka`, Since: 1.8.0 |
| malayalam | 1298954605 | malayalam | `Mlym` |
| mandaic | 1298230884 | mandaic | `Mand` |
| manichaean | 1298230889 | manichaean | `Mani`, Since: 0.9.30 |
| marchen | 1298231907 | marchen | `Marc`, Since: 1.3.0 |
| masaram_gondi | 1198485101 | masaram-gondi | `Gonm`, Since: 1.6.0 |
| math | 1517122664 | math | `Zmth`, Since: 3.4.0 |
| medefaidrin | 1298490470 | medefaidrin | `Medf`, Since: 1.8.0 |
| meetei_mayek | 1299473769 | meetei-mayek | `Mtei` |
| mende_kikakui | 1298493028 | mende-kikakui | `Mend`, Since: 0.9.30 |
| meroitic_cursive | 1298494051 | meroitic-cursive | `Merc` |
| meroitic_hieroglyphs | 1298494063 | meroitic-hieroglyphs | `Mero` |
| miao | 1349284452 | miao | `Plrd` |
| modi | 1299145833 | modi | `Modi`, Since: 0.9.30 |
| mongolian | 1299148391 | mongolian | `Mong` |
| mro | 1299345263 | mro | `Mroo`, Since: 0.9.30 |
| multani | 1299541108 | multani | `Mult`, Since: 0.9.30 |
| myanmar | 1299803506 | myanmar | `Mymr` |
| nabataean | 1315070324 | nabataean | `Nbat`, Since: 0.9.30 |
| nag_mundari | 1315006317 | nag-mundari | `Nagm`, Since: 5.2.0 |
| nandinagari | 1315008100 | nandinagari | `Nand`, Since: 2.4.0 |
| new_tai_lue | 1415670901 | new-tai-lue | `Talu` |
| newa | 1315272545 | newa | `Newa`, Since: 1.3.0 |
| nko | 1315663727 | nko | `Nkoo` |
| nushu | 1316186229 | nushu | `Nshu`, Since: 1.6.0 |
| nyiakeng_puachue_hmong | 1215131248 | nyiakeng-puachue-hmong | `Hmnp`, Since: 2.4.0 |
| ogham | 1332175213 | ogham | `Ogam` |
| ol_chiki | 1332503403 | ol-chiki | `Olck` |
| old_hungarian | 1215655527 | old-hungarian | `Hung`, Since: 0.9.30 |
| old_italic | 1232363884 | old-italic | `Ital` |
| old_north_arabian | 1315009122 | old-north-arabian | `Narb`, Since: 0.9.30 |
| old_permic | 1348825709 | old-permic | `Perm`, Since: 0.9.30 |
| old_persian | 1483761007 | old-persian | `Xpeo` |
| old_sogdian | 1399809903 | old-sogdian | `Sogo`, Since: 1.8.0 |
| old_south_arabian | 1398895202 | old-south-arabian | `Sarb` |
| old_turkic | 1332898664 | old-turkic | `Orkh` |
| old_uyghur | 1333094258 | old-uyghur | `Ougr`, Since: 3.0.0 |
| oriya | 1332902241 | oriya | `Orya` |
| osage | 1332963173 | osage | `Osge`, Since: 1.3.0 |
| osmanya | 1332964705 | osmanya | `Osma` |
| pahawh_hmong | 1215131239 | pahawh-hmong | `Hmng`, Since: 0.9.30 |
| palmyrene | 1348562029 | palmyrene | `Palm`, Since: 0.9.30 |
| pau_cin_hau | 1348564323 | pau-cin-hau | `Pauc`, Since: 0.9.30 |
| phags_pa | 1349017959 | phags-pa | `Phag` |
| phoenician | 1349021304 | phoenician | `Phnx` |
| psalter_pahlavi | 1349020784 | psalter-pahlavi | `Phlp`, Since: 0.9.30 |
| rejang | 1382706791 | rejang | `Rjng` |
| runic | 1383427698 | runic | `Runr` |
| samaritan | 1398893938 | samaritan | `Samr` |
| saurashtra | 1398895986 | saurashtra | `Saur` |
| sharada | 1399353956 | sharada | `Shrd` |
| shavian | 1399349623 | shavian | `Shaw` |
| siddham | 1399415908 | siddham | `Sidd`, Since: 0.9.30 |
| signwriting | 1399287415 | signwriting | `Sgnw`, Since: 0.9.30 |
| sinhala | 1399418472 | sinhala | `Sinh` |
| sogdian | 1399809892 | sogdian | `Sogd`, Since: 1.8.0 |
| sora_sompeng | 1399812705 | sora-sompeng | `Sora` |
| soyombo | 1399814511 | soyombo | `Soyo`, Since: 1.6.0 |
| sundanese | 1400204900 | sundanese | `Sund` |
| syloti_nagri | 1400466543 | syloti-nagri | `Sylo` |
| syriac | 1400468067 | syriac | `Syrc` |
| tagalog | 1416064103 | tagalog | `Tglg` |
| tagbanwa | 1415669602 | tagbanwa | `Tagb` |
| tai_le | 1415670885 | tai-le | `Tale` |
| tai_tham | 1281453665 | tai-tham | `Lana` |
| tai_viet | 1415673460 | tai-viet | `Tavt` |
| takri | 1415670642 | takri | `Takr` |
| tamil | 1415671148 | tamil | `Taml` |
| tangsa | 1416524641 | tangsa | `Tnsa`, Since: 3.0.0 |
| tangut | 1415671399 | tangut | `Tang`, Since: 1.3.0 |
| telugu | 1415933045 | telugu | `Telu` |
| thaana | 1416126817 | thaana | `Thaa` |
| thai | 1416126825 | thai | `Thai` |
| tibetan | 1416192628 | tibetan | `Tibt` |
| tifinagh | 1415999079 | tifinagh | `Tfng` |
| tirhuta | 1416196712 | tirhuta | `Tirh`, Since: 0.9.30 |
| toto | 1416590447 | toto | `Toto`, Since: 3.0.0 |
| ugaritic | 1432838514 | ugaritic | `Ugar` |
| unknown | 1517976186 | unknown | `Zzzz` |
| vai | 1449224553 | vai | `Vaii` |
| vithkuqi | 1449751656 | vithkuqi | `Vith`, Since: 3.0.0 |
| wancho | 1466132591 | wancho | `Wcho`, Since: 2.4.0 |
| warang_citi | 1466004065 | warang-citi | `Wara`, Since: 0.9.30 |
| yezidi | 1499822697 | yezidi | `Yezi`, Since: 2.6.7 |
| yi | 1500080489 | yi | `Yiii` |
| zanabazar_square | 1516334690 | zanabazar-square | `Zanb`, Since: 1.6.0 |

### HarfBuzz.style_tag_t

GType: `hb_style_tag_t` ?? C type: `hb_style_tag_t`

Defined by OpenType Design-Variation Axis Tag Registry.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| italic | 1769234796 | italic | Used to vary between non-italic and italic. A value of 0 can be interpreted as "Roman" (non-italic); a value of 1 can be interpreted as (fully) ita... |
| optical_size | 1869640570 | optical-size | Used to vary design to suit different text sizes. Non-zero. Values can be interpreted as text size, in points. |
| slant_angle | 1936486004 | slant-angle | Used to vary between upright and slanted text. Values must be greater than -90 and less than +90. Values can be interpreted as the angle, in counte... |
| slant_ratio | 1399615092 | slant-ratio | same as @HB_STYLE_TAG_SLANT_ANGLE expression as ratio. Typical right-leaning Italic fonts have a positive slant ratio (typically around 0.2) |
| weight | 2003265652 | weight | Used to vary stroke thicknesses or other design details to give variation from lighter to blacker. Values can be interpreted in direct comparison t... |
| width | 2003072104 | width | Used to vary width of text from narrower to wider. Non-zero. Values can be interpreted as a percentage of whatever the font designer considers ???n... |

### HarfBuzz.unicode_combining_class_t

GType: `hb_unicode_combining_class_t` ?? C type: `hb_unicode_combining_class_t`

Data type for the Canonical_Combining_Class (ccc) property from the Unicode Character Database. <note>Note: newer versions of Unicode may add new v...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| above | 230 | above | Distinct marks directly above |
| above_left | 228 | above-left | Distinct marks at the top left |
| above_right | 232 | above-right | Distinct marks at the top right |
| attached_above | 214 | attached-above | Marks attached directly above |
| attached_above_right | 216 | attached-above-right | Marks attached at the top right |
| attached_below | 202 | attached-below | Marks attached directly below |
| attached_below_left | 200 | attached-below-left | Marks attached at the bottom left |
| below | 220 | below | Distinct marks directly below |
| below_left | 218 | below-left | Distinct marks at the bottom left |
| below_right | 222 | below-right | Distinct marks at the bottom right |
| ccc10 | 10 | ccc10 | [Hebrew] |
| ccc103 | 103 | ccc103 | [Thai] |
| ccc107 | 107 | ccc107 | [Thai] |
| ccc11 | 11 | ccc11 | [Hebrew] |
| ccc118 | 118 | ccc118 | [Lao] |
| ccc12 | 12 | ccc12 | [Hebrew] |
| ccc122 | 122 | ccc122 | [Lao] |
| ccc129 | 129 | ccc129 | [Tibetan] |
| ccc13 | 13 | ccc13 | [Hebrew] |
| ccc130 | 130 | ccc130 | [Tibetan] |
| ccc132 | 132 | ccc132 | [Tibetan] Since: 7.2.0 |
| ccc14 | 14 | ccc14 | [Hebrew] |
| ccc15 | 15 | ccc15 | [Hebrew] |
| ccc16 | 16 | ccc16 | [Hebrew] |
| ccc17 | 17 | ccc17 | [Hebrew] |
| ccc18 | 18 | ccc18 | [Hebrew] |
| ccc19 | 19 | ccc19 | [Hebrew] |
| ccc20 | 20 | ccc20 | [Hebrew] |
| ccc21 | 21 | ccc21 | [Hebrew] |
| ccc22 | 22 | ccc22 | [Hebrew] |
| ccc23 | 23 | ccc23 | [Hebrew] |
| ccc24 | 24 | ccc24 | [Hebrew] |
| ccc25 | 25 | ccc25 | [Hebrew] |
| ccc26 | 26 | ccc26 | [Hebrew] |
| ccc27 | 27 | ccc27 | [Arabic] |
| ccc28 | 28 | ccc28 | [Arabic] |
| ccc29 | 29 | ccc29 | [Arabic] |
| ccc30 | 30 | ccc30 | [Arabic] |
| ccc31 | 31 | ccc31 | [Arabic] |
| ccc32 | 32 | ccc32 | [Arabic] |
| ccc33 | 33 | ccc33 | [Arabic] |
| ccc34 | 34 | ccc34 | [Arabic] |
| ccc35 | 35 | ccc35 | [Arabic] |
| ccc36 | 36 | ccc36 | [Syriac] |
| ccc84 | 84 | ccc84 | [Telugu] |
| ccc91 | 91 | ccc91 | [Telugu] |
| double_above | 234 | double-above | Distinct marks extending above two bases |
| double_below | 233 | double-below | Distinct marks subtending two bases |
| invalid | 255 | invalid | Invalid combining class |
| iota_subscript | 240 | iota-subscript | Greek iota subscript only |
| kana_voicing | 8 | kana-voicing | Hiragana/Katakana voicing marks |
| left | 224 | left | Distinct marks to the left |
| not_reordered | 0 | not-reordered | Spacing and enclosing marks; also many vowel and consonant signs, even if nonspacing |
| nukta | 7 | nukta | Diacritic nukta marks in Brahmi-derived scripts |
| overlay | 1 | overlay | Marks which overlay a base letter or symbol |
| right | 226 | right | Distinct marks to the right |
| virama | 9 | virama | Viramas |

### HarfBuzz.unicode_general_category_t

GType: `hb_unicode_general_category_t` ?? C type: `hb_unicode_general_category_t`

Data type for the "General_Category" (gc) property from the Unicode Character Database.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| close_punctuation | 18 | close-punctuation | [Pe] |
| connect_punctuation | 16 | connect-punctuation | [Pc] |
| control | 0 | control | [Cc] |
| currency_symbol | 23 | currency-symbol | [Sc] |
| dash_punctuation | 17 | dash-punctuation | [Pd] |
| decimal_number | 13 | decimal-number | [Nd] |
| enclosing_mark | 11 | enclosing-mark | [Me] |
| final_punctuation | 19 | final-punctuation | [Pf] |
| format | 1 | format | [Cf] |
| initial_punctuation | 20 | initial-punctuation | [Pi] |
| letter_number | 14 | letter-number | [Nl] |
| line_separator | 27 | line-separator | [Zl] |
| lowercase_letter | 5 | lowercase-letter | [Ll] |
| math_symbol | 25 | math-symbol | [Sm] |
| modifier_letter | 6 | modifier-letter | [Lm] |
| modifier_symbol | 24 | modifier-symbol | [Sk] |
| non_spacing_mark | 12 | non-spacing-mark | [Mn] |
| open_punctuation | 22 | open-punctuation | [Ps] |
| other_letter | 7 | other-letter | [Lo] |
| other_number | 15 | other-number | [No] |
| other_punctuation | 21 | other-punctuation | [Po] |
| other_symbol | 26 | other-symbol | [So] |
| paragraph_separator | 28 | paragraph-separator | [Zp] |
| private_use | 3 | private-use | [Co] |
| space_separator | 29 | space-separator | [Zs] |
| spacing_mark | 10 | spacing-mark | [Mc] |
| surrogate | 4 | surrogate | [Cs] |
| titlecase_letter | 8 | titlecase-letter | [Lt] |
| unassigned | 2 | unassigned | [Cn] |
| uppercase_letter | 9 | uppercase-letter | [Lu] |

## Flags

### HarfBuzz.buffer_diff_flags_t

GType: `hb_buffer_diff_flags_t` ?? C type: `hb_buffer_diff_flags_t`

Flags from comparing two #hb_buffer_t's. Buffer with different #hb_buffer_content_type_t cannot be meaningfully compared in any further detail. For...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cluster_mismatch | 32 | cluster-mismatch | difference in #hb_glyph_info_t.cluster |
| codepoint_mismatch | 16 | codepoint-mismatch | difference in #hb_glyph_info_t.codepoint |
| content_type_mismatch | 1 | content-type-mismatch | buffers with different #hb_buffer_content_type_t. |
| dotted_circle_present | 8 | dotted-circle-present | dotted circle glyph is present in the reference buffer. |
| equal | 0 | equal | equal buffers. |
| glyph_flags_mismatch | 64 | glyph-flags-mismatch | difference in #hb_glyph_flags_t. |
| length_mismatch | 2 | length-mismatch | buffers with differing length. |
| notdef_present | 4 | notdef-present | `.notdef` glyph is present in the reference buffer. |
| position_mismatch | 128 | position-mismatch | difference in #hb_glyph_position_t. |

### HarfBuzz.buffer_flags_t

GType: `hb_buffer_flags_t` ?? C type: `hb_buffer_flags_t`

Flags for #hb_buffer_t.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bot | 1 | bot | flag indicating that special handling of the beginning of text paragraph can be applied to this buffer. Should usually be set, unless you are passi... |
| default | 0 | default | the default buffer flag. |
| defined | 255 | defined | All currently defined flags: Since: 4.4.0 |
| do_not_insert_dotted_circle | 16 | do-not-insert-dotted-circle | flag indicating that a dotted circle should not be inserted in the rendering of incorrect character sequences (such at <0905 093E>). Since: 2.4.0 |
| eot | 2 | eot | flag indicating that special handling of the end of text paragraph can be applied to this buffer, similar to @HB_BUFFER_FLAG_BOT. |
| preserve_default_ignorables | 4 | preserve-default-ignorables | flag indication that character with Default_Ignorable Unicode property should use the corresponding glyph from the font, instead of hiding them (do... |
| produce_safe_to_insert_tatweel | 128 | produce-safe-to-insert-tatweel | flag indicating that the @HB_GLYPH_FLAG_SAFE_TO_INSERT_TATWEEL glyph-flag should be produced by the shaper. By default it will not be produced. Sin... |
| produce_unsafe_to_concat | 64 | produce-unsafe-to-concat | flag indicating that the @HB_GLYPH_FLAG_UNSAFE_TO_CONCAT glyph-flag should be produced by the shaper. By default it will not be produced since it i... |
| remove_default_ignorables | 8 | remove-default-ignorables | flag indication that character with Default_Ignorable Unicode property should be removed from glyph string instead of hiding them (done by replacin... |
| verify | 32 | verify | flag indicating that the hb_shape() call and its variants should perform various verification processes on the results of the shaping operation on ... |

### HarfBuzz.buffer_serialize_flags_t

GType: `hb_buffer_serialize_flags_t` ?? C type: `hb_buffer_serialize_flags_t`

Flags that control what glyph information are serialized in hb_buffer_serialize_glyphs().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| default | 0 | default | serialize glyph names, clusters and positions. |
| defined | 63 | defined | All currently defined flags. Since: 4.4.0 |
| glyph_extents | 8 | glyph-extents | serialize glyph extents. |
| glyph_flags | 16 | glyph-flags | serialize glyph flags. Since: 1.5.0 |
| no_advances | 32 | no-advances | do not serialize glyph advances, glyph offsets will reflect absolute glyph positions. Since: 1.8.0 |
| no_clusters | 1 | no-clusters | do not serialize glyph cluster. |
| no_glyph_names | 4 | no-glyph-names | do no serialize glyph name. |
| no_positions | 2 | no-positions | do not serialize glyph position information. |

### HarfBuzz.glyph_flags_t

GType: `hb_glyph_flags_t` ?? C type: `hb_glyph_flags_t`

Flags for #hb_glyph_info_t.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| defined | 7 | defined | All the currently defined flags. |
| safe_to_insert_tatweel | 4 | safe-to-insert-tatweel | In scripts that use elongation (Arabic, Mongolian, Syriac, etc.), this flag signifies that it is safe to insert a U+0640 TATWEEL character before t... |
| unsafe_to_break | 1 | unsafe-to-break | Indicates that if input text is broken at the beginning of the cluster this glyph is part of, then both sides need to be re-shaped, as the result m... |
| unsafe_to_concat | 2 | unsafe-to-concat | Indicates that if input text is changed on one side of the beginning of the cluster this glyph is part of, then the shaping results for the other s... |

### HarfBuzz.ot_color_palette_flags_t

GType: `hb_ot_color_palette_flags_t` ?? C type: `hb_ot_color_palette_flags_t`

Flags that describe the properties of color palette.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| default | 0 | default | Default indicating that there is nothing special to note about a color palette. |
| usable_with_dark_background | 2 | usable-with-dark-background | Flag indicating that the color palette is appropriate to use when displaying the font on a dark background such as black. |
| usable_with_light_background | 1 | usable-with-light-background | Flag indicating that the color palette is appropriate to use when displaying the font on a light background such as white. |

### HarfBuzz.ot_math_glyph_part_flags_t

GType: `hb_ot_math_glyph_part_flags_t` ?? C type: `hb_ot_math_glyph_part_flags_t`

Flags for math glyph parts.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| extender | 1 | extender | This is an extender glyph part that can be repeated to reach the desired length. |

### HarfBuzz.ot_var_axis_flags_t

GType: `hb_ot_var_axis_flags_t` ?? C type: `hb_ot_var_axis_flags_t`

Flags for #hb_ot_var_axis_info_t.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| hidden | 1 | hidden | The axis should not be exposed directly in user interfaces. |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| aat_layout_feature_selector_info_t |  | 0 | 0 | 0 | Structure representing a setting for an #hb_aat_layout_feature_type_t. |
| blob_t |  | 0 | 0 | 0 | Data type for blobs. A blob wraps a chunk of binary data and facilitates its lifecycle management between a client program and HarfBuzz. |
| buffer_t |  | 0 | 0 | 0 | The main structure holding the input text and its properties before shaping, and output glyphs and their information after shaping. |
| color_line_t |  | 0 | 0 | 0 | A struct containing color information for a gradient. |
| color_stop_t |  | 0 | 0 | 0 | Information about a color stop on a color line. Color lines typically have offsets ranging between 0 and 1, but that is not required. Note: despite... |
| draw_funcs_t |  | 0 | 0 | 0 | Glyph draw callbacks. #hb_draw_move_to_func_t, #hb_draw_line_to_func_t and #hb_draw_cubic_to_func_t calls are necessary to be defined but we transl... |
| draw_state_t |  | 0 | 0 | 0 | Current drawing state. |
| face_t |  | 0 | 0 | 0 | Data type for holding font faces. |
| feature_t |  | 0 | 0 | 1 | The #hb_feature_t is the structure that holds information about requested feature application. The feature will be applied with the given value to ... |
| font_extents_t |  | 0 | 0 | 0 | Font-wide extent values, measured in font units. Note that typically @ascender is positive and @descender negative, in coordinate systems that grow... |
| font_funcs_t |  | 0 | 0 | 0 | Data type containing a set of virtual methods used for working on #hb_font_t font objects. HarfBuzz provides a lightweight default function for eac... |
| font_t |  | 0 | 0 | 0 | Data type for holding fonts. |
| glyph_extents_t |  | 0 | 0 | 0 | Glyph extent values, measured in font units. Note that @height is negative, in coordinate systems that grow up. |
| glyph_info_t |  | 0 | 0 | 0 | The #hb_glyph_info_t is the structure that holds information about the glyphs and their relation to input text. |
| glyph_position_t |  | 0 | 0 | 0 | The #hb_glyph_position_t is the structure that holds the positions of the glyph in both horizontal and vertical directions. All positions in #hb_gl... |
| language_t |  | 0 | 0 | 1 | Data type for languages. Each #hb_language_t corresponds to a BCP 47 language tag. |
| map_t |  | 0 | 0 | 0 | Data type for holding integer-to-integer hash maps. |
| ot_color_layer_t |  | 0 | 0 | 0 | Pairs of glyph and color index. A color index of 0xFFFF does not refer to a palette color, but indicates that the foreground color should be used. |
| ot_math_glyph_part_t |  | 0 | 0 | 0 | Data type to hold information for a "part" component of a math-variant glyph. Large variants for stretchable math glyphs (such as parentheses) can ... |
| ot_math_glyph_variant_t |  | 0 | 0 | 0 | Data type to hold math-variant information for a glyph. |
| ot_math_kern_entry_t |  | 0 | 0 | 0 | Data type to hold math kerning (cut-in) information for a glyph. |
| ot_name_entry_t |  | 0 | 0 | 0 | Structure representing a name ID in a particular language. |
| ot_var_axis_info_t |  | 0 | 0 | 0 | Data type for holding variation-axis values. The minimum, default, and maximum values are in un-normalized, user scales. <note>Note: at present, th... |
| ot_var_axis_t |  | 0 | 0 | 0 | Use #hb_ot_var_axis_info_t instead. |
| paint_funcs_t |  | 0 | 0 | 0 | Glyph paint callbacks. The callbacks assume that the caller maintains a stack of current transforms, clips and intermediate surfaces, as evidenced ... |
| segment_properties_t |  | 0 | 0 | 0 | The structure that holds various text properties of an #hb_buffer_t. Can be set and retrieved using hb_buffer_set_segment_properties() and hb_buffe... |
| set_t |  | 0 | 0 | 0 | Data type for holding a set of integers. #hb_set_t's are used to gather and contain glyph IDs, Unicode code points, and various other collections o... |
| shape_plan_t |  | 0 | 0 | 0 | Data type for holding a shaping plan. Shape plans contain information about how HarfBuzz will shape a particular text segment, based on the segment... |
| unicode_funcs_t |  | 0 | 0 | 0 | Data type containing a set of virtual methods used for accessing various Unicode character properties. HarfBuzz provides a default function for eac... |
| user_data_key_t |  | 0 | 0 | 0 | Data structure for holding user-data keys. |
| variation_t |  | 0 | 0 | 1 | Data type for holding variation data. Registered OpenType variation-axis tags are listed in OpenType Axis Tag Registry. |

### HarfBuzz.aat_layout_feature_selector_info_t

C type: `hb_aat_layout_feature_selector_info_t`

Structure representing a setting for an #hb_aat_layout_feature_type_t.

#### Fields

| Field | Type |
| --- | --- |
| disable | aat_layout_feature_selector_t |
| enable | aat_layout_feature_selector_t |
| name_id | ot_name_id_t |
| reserved | guint |

### HarfBuzz.blob_t

GType: `hb_blob_t` ?? C type: `hb_blob_t`

Data type for blobs. A blob wraps a chunk of binary data and facilitates its lifecycle management between a client program and HarfBuzz.

### HarfBuzz.buffer_t

GType: `hb_buffer_t` ?? C type: `hb_buffer_t`

The main structure holding the input text and its properties before shaping, and output glyphs and their information after shaping.

### HarfBuzz.color_line_t

GType: `hb_color_line_t` ?? C type: `hb_color_line_t`

A struct containing color information for a gradient.

#### Fields

| Field | Type |
| --- | --- |
| data | gpointer |
| get_color_stops | color_line_get_color_stops_func_t |
| get_color_stops_user_data | gpointer |
| get_extend | color_line_get_extend_func_t |
| get_extend_user_data | gpointer |
| reserved0 | gpointer |
| reserved1 | gpointer |
| reserved2 | gpointer |
| reserved3 | gpointer |
| reserved5 | gpointer |
| reserved6 | gpointer |
| reserved7 | gpointer |
| reserved8 | gpointer |

### HarfBuzz.color_stop_t

GType: `hb_color_stop_t` ?? C type: `hb_color_stop_t`

Information about a color stop on a color line. Color lines typically have offsets ranging between 0 and 1, but that is not required. Note: despite...

#### Fields

| Field | Type |
| --- | --- |
| color | color_t |
| is_foreground | bool_t |
| offset | gfloat |

### HarfBuzz.draw_funcs_t

GType: `hb_draw_funcs_t` ?? C type: `hb_draw_funcs_t`

Glyph draw callbacks. #hb_draw_move_to_func_t, #hb_draw_line_to_func_t and #hb_draw_cubic_to_func_t calls are necessary to be defined but we transl...

### HarfBuzz.draw_state_t

GType: `hb_draw_state_t` ?? C type: `hb_draw_state_t`

Current drawing state.

#### Fields

| Field | Type |
| --- | --- |
| current_x | gfloat |
| current_y | gfloat |
| path_open | bool_t |
| path_start_x | gfloat |
| path_start_y | gfloat |
| reserved1 | var_num_t |
| reserved2 | var_num_t |
| reserved3 | var_num_t |
| reserved4 | var_num_t |
| reserved5 | var_num_t |
| reserved6 | var_num_t |
| reserved7 | var_num_t |

### HarfBuzz.face_t

GType: `hb_face_t` ?? C type: `hb_face_t`

Data type for holding font faces.

### HarfBuzz.feature_t

GType: `hb_feature_t` ?? C type: `hb_feature_t`

The #hb_feature_t is the structure that holds information about requested feature application. The feature will be applied with the given value to ...

#### Fields

| Field | Type |
| --- | --- |
| end | guint |
| start | guint |
| tag | tag_t |
| value | guint32 |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| _string | `feature_t._string(buf: out utf8, size: out guint) -> none` | hb_feature_to_string | 0.9.5 | Converts a #hb_feature_t into a `NULL`-terminated string in the format understood by hb_feature_from_string(). The client in responsible for alloca... |

### HarfBuzz.font_extents_t

C type: `hb_font_extents_t`

Font-wide extent values, measured in font units. Note that typically @ascender is positive and @descender negative, in coordinate systems that grow...

#### Fields

| Field | Type |
| --- | --- |
| ascender | position_t |
| descender | position_t |
| line_gap | position_t |
| reserved1 | position_t |
| reserved2 | position_t |
| reserved3 | position_t |
| reserved4 | position_t |
| reserved5 | position_t |
| reserved6 | position_t |
| reserved7 | position_t |
| reserved8 | position_t |
| reserved9 | position_t |

### HarfBuzz.font_funcs_t

GType: `hb_font_funcs_t` ?? C type: `hb_font_funcs_t`

Data type containing a set of virtual methods used for working on #hb_font_t font objects. HarfBuzz provides a lightweight default function for eac...

### HarfBuzz.font_t

GType: `hb_font_t` ?? C type: `hb_font_t`

Data type for holding fonts.

### HarfBuzz.glyph_extents_t

C type: `hb_glyph_extents_t`

Glyph extent values, measured in font units. Note that @height is negative, in coordinate systems that grow up.

#### Fields

| Field | Type |
| --- | --- |
| height | position_t |
| width | position_t |
| x_bearing | position_t |
| y_bearing | position_t |

### HarfBuzz.glyph_info_t

GType: `hb_glyph_info_t` ?? C type: `hb_glyph_info_t`

The #hb_glyph_info_t is the structure that holds information about the glyphs and their relation to input text.

#### Fields

| Field | Type |
| --- | --- |
| cluster | guint32 |
| codepoint | codepoint_t |
| mask | mask_t |
| var1 | var_int_t |
| var2 | var_int_t |

### HarfBuzz.glyph_position_t

GType: `hb_glyph_position_t` ?? C type: `hb_glyph_position_t`

The #hb_glyph_position_t is the structure that holds the positions of the glyph in both horizontal and vertical directions. All positions in #hb_gl...

#### Fields

| Field | Type |
| --- | --- |
| var | var_int_t |
| x_advance | position_t |
| x_offset | position_t |
| y_advance | position_t |
| y_offset | position_t |

### HarfBuzz.language_t

C type: `hb_language_t`

Data type for languages. Each #hb_language_t corresponds to a BCP 47 language tag.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| _string | `language_t._string() -> utf8` | hb_language_to_string | 0.9.2 | Converts an #hb_language_t to a string. |

### HarfBuzz.map_t

GType: `hb_map_t` ?? C type: `hb_map_t`

Data type for holding integer-to-integer hash maps.

### HarfBuzz.ot_color_layer_t

C type: `hb_ot_color_layer_t`

Pairs of glyph and color index. A color index of 0xFFFF does not refer to a palette color, but indicates that the foreground color should be used.

#### Fields

| Field | Type |
| --- | --- |
| color_index | guint |
| glyph | codepoint_t |

### HarfBuzz.ot_math_glyph_part_t

GType: `hb_ot_math_glyph_part_t` ?? C type: `hb_ot_math_glyph_part_t`

Data type to hold information for a "part" component of a math-variant glyph. Large variants for stretchable math glyphs (such as parentheses) can ...

#### Fields

| Field | Type |
| --- | --- |
| end_connector_length | position_t |
| flags | ot_math_glyph_part_flags_t |
| full_advance | position_t |
| glyph | codepoint_t |
| start_connector_length | position_t |

### HarfBuzz.ot_math_glyph_variant_t

GType: `hb_ot_math_glyph_variant_t` ?? C type: `hb_ot_math_glyph_variant_t`

Data type to hold math-variant information for a glyph.

#### Fields

| Field | Type |
| --- | --- |
| advance | position_t |
| glyph | codepoint_t |

### HarfBuzz.ot_math_kern_entry_t

C type: `hb_ot_math_kern_entry_t`

Data type to hold math kerning (cut-in) information for a glyph.

#### Fields

| Field | Type |
| --- | --- |
| kern_value | position_t |
| max_correction_height | position_t |

### HarfBuzz.ot_name_entry_t

C type: `hb_ot_name_entry_t`

Structure representing a name ID in a particular language.

#### Fields

| Field | Type |
| --- | --- |
| language | language_t |
| name_id | ot_name_id_t |
| var | var_int_t |

### HarfBuzz.ot_var_axis_info_t

GType: `hb_ot_var_axis_info_t` ?? C type: `hb_ot_var_axis_info_t`

Data type for holding variation-axis values. The minimum, default, and maximum values are in un-normalized, user scales. <note>Note: at present, th...

#### Fields

| Field | Type |
| --- | --- |
| axis_index | guint |
| default_value | gfloat |
| flags | ot_var_axis_flags_t |
| max_value | gfloat |
| min_value | gfloat |
| name_id | ot_name_id_t |
| reserved | guint |
| tag | tag_t |

### HarfBuzz.ot_var_axis_t

C type: `hb_ot_var_axis_t`

Use #hb_ot_var_axis_info_t instead.

#### Fields

| Field | Type |
| --- | --- |
| default_value | gfloat |
| max_value | gfloat |
| min_value | gfloat |
| name_id | ot_name_id_t |
| tag | tag_t |

### HarfBuzz.paint_funcs_t

GType: `hb_paint_funcs_t` ?? C type: `hb_paint_funcs_t`

Glyph paint callbacks. The callbacks assume that the caller maintains a stack of current transforms, clips and intermediate surfaces, as evidenced ...

### HarfBuzz.segment_properties_t

GType: `hb_segment_properties_t` ?? C type: `hb_segment_properties_t`

The structure that holds various text properties of an #hb_buffer_t. Can be set and retrieved using hb_buffer_set_segment_properties() and hb_buffe...

#### Fields

| Field | Type |
| --- | --- |
| direction | direction_t |
| language | language_t |
| reserved1 | gpointer |
| reserved2 | gpointer |
| script | script_t |

### HarfBuzz.set_t

GType: `hb_set_t` ?? C type: `hb_set_t`

Data type for holding a set of integers. #hb_set_t's are used to gather and contain glyph IDs, Unicode code points, and various other collections o...

### HarfBuzz.shape_plan_t

GType: `hb_shape_plan_t` ?? C type: `hb_shape_plan_t`

Data type for holding a shaping plan. Shape plans contain information about how HarfBuzz will shape a particular text segment, based on the segment...

### HarfBuzz.unicode_funcs_t

GType: `hb_unicode_funcs_t` ?? C type: `hb_unicode_funcs_t`

Data type containing a set of virtual methods used for accessing various Unicode character properties. HarfBuzz provides a default function for eac...

### HarfBuzz.user_data_key_t

GType: `hb_user_data_key_t` ?? C type: `hb_user_data_key_t`

Data structure for holding user-data keys.

#### Fields

| Field | Type |
| --- | --- |
| unused | gchar |

### HarfBuzz.variation_t

C type: `hb_variation_t`

Data type for holding variation data. Registered OpenType variation-axis tags are listed in OpenType Axis Tag Registry.

#### Fields

| Field | Type |
| --- | --- |
| tag | tag_t |
| value | gfloat |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| _string | `variation_t._string(buf: out utf8, size: out guint) -> none` | hb_variation_to_string | 1.4.2 | Converts an #hb_variation_t into a `NULL`-terminated string in the format understood by hb_variation_from_string(). The client in responsible for a... |

## Unions

### HarfBuzz.var_int_t

C type: `hb_var_int_t`

#### Fields

| Field | Type |
| --- | --- |
| i16 | gint16 |
| i32 | gint32 |
| i8 | gint8 |
| u16 | guint16 |
| u32 | guint32 |
| u8 | guint8 |

### HarfBuzz.var_num_t

C type: `hb_var_num_t`

#### Fields

| Field | Type |
| --- | --- |
| f | gfloat |
| i16 | gint16 |
| i32 | gint32 |
| i8 | gint8 |
| u16 | guint16 |
| u32 | guint32 |
| u8 | guint8 |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| aat_layout_feature_type_get_name_id | `aat_layout_feature_type_get_name_id(face: face_t, feature_type: aat_layout_feature_type_t) -> ot_name_id_t` | hb_aat_layout_feature_type_get_name_id | 2.2.0 | Fetches the name identifier of the specified feature type in the face's `name` table. |
| aat_layout_feature_type_get_selector_infos | `aat_layout_feature_type_get_selector_infos(face: face_t, feature_type: aat_layout_feature_type_t, start_offset: guint, selector_count: out guint?, selectors: out aat_layout_feature_selector_info_t?, default_index: out guint?) -> guint` | hb_aat_layout_feature_type_get_selector_infos | 2.2.0 | Fetches a list of the selectors available for the specified feature in the given face. If upon return, @default_index is set to #HB_AAT_LAYOUT_NO_S... |
| aat_layout_get_feature_types | `aat_layout_get_feature_types(face: face_t, start_offset: guint, feature_count: out guint?, features: out aat_layout_feature_type_t) -> guint` | hb_aat_layout_get_feature_types | 2.2.0 | Fetches a list of the AAT feature types included in the specified face. |
| aat_layout_has_positioning | `aat_layout_has_positioning(face: face_t) -> bool_t` | hb_aat_layout_has_positioning | 2.3.0 | Tests whether the specified face includes any positioning information in the `kerx` table. <note>Note: does not examine the `GPOS` table.</note> |
| aat_layout_has_substitution | `aat_layout_has_substitution(face: face_t) -> bool_t` | hb_aat_layout_has_substitution | 2.3.0 | Tests whether the specified face includes any substitutions in the `morx` or `mort` tables. <note>Note: does not examine the `GSUB` table.</note> |
| aat_layout_has_tracking | `aat_layout_has_tracking(face: face_t) -> bool_t` | hb_aat_layout_has_tracking | 2.3.0 | Tests whether the specified face includes any tracking information in the `trak` table. |
| blob_copy_writable_or_fail | `blob_copy_writable_or_fail(blob: blob_t) -> blob_t` | hb_blob_copy_writable_or_fail | 1.8.0 | Makes a writable copy of @blob. |
| blob_create | `blob_create(data: utf8, length: guint, mode: memory_mode_t, user_data: gpointer?, destroy: destroy_func_t?) -> blob_t` | hb_blob_create | 0.9.2 | Creates a new "blob" object wrapping @data. The @mode parameter is used to negotiate ownership and lifecycle of @data. |
| blob_create_from_file | `blob_create_from_file(file_name: utf8) -> blob_t` | hb_blob_create_from_file | 1.7.7 | Creates a new blob containing the data from the specified binary font file. |
| blob_create_from_file_or_fail | `blob_create_from_file_or_fail(file_name: utf8) -> blob_t` | hb_blob_create_from_file_or_fail | 2.8.2 | Creates a new blob containing the data from the specified binary font file. |
| blob_create_or_fail | `blob_create_or_fail(data: utf8, length: guint, mode: memory_mode_t, user_data: gpointer?, destroy: destroy_func_t?) -> blob_t` | hb_blob_create_or_fail | 2.8.2 | Creates a new "blob" object wrapping @data. The @mode parameter is used to negotiate ownership and lifecycle of @data. Note that this function retu... |
| blob_create_sub_blob | `blob_create_sub_blob(parent: blob_t, offset: guint, length: guint) -> blob_t` | hb_blob_create_sub_blob | 0.9.2 | Returns a blob that represents a range of bytes in @parent. The new blob is always created with #HB_MEMORY_MODE_READONLY, meaning that it will neve... |
| blob_destroy | `blob_destroy(blob: blob_t) -> none` | hb_blob_destroy | 0.9.2 | Decreases the reference count on @blob, and if it reaches zero, destroys @blob, freeing all memory, possibly calling the destroy-callback the blob ... |
| blob_get_data | `blob_get_data(blob: blob_t, length: out guint) -> utf8` | hb_blob_get_data | 0.9.2 | Fetches the data from a blob. |
| blob_get_data_writable | `blob_get_data_writable(blob: blob_t, length: out guint) -> utf8` | hb_blob_get_data_writable | 0.9.2 | Tries to make blob data writable (possibly copying it) and return pointer to data. Fails if blob has been made immutable, or if memory allocation f... |
| blob_get_empty | `blob_get_empty() -> blob_t` | hb_blob_get_empty | 0.9.2 | Returns the singleton empty blob. See TODO:link object types for more information. |
| blob_get_length | `blob_get_length(blob: blob_t) -> guint` | hb_blob_get_length | 0.9.2 | Fetches the length of a blob's data. |
| blob_get_user_data | `blob_get_user_data(blob: blob_t, key: user_data_key_t) -> gpointer` | hb_blob_get_user_data | 0.9.2 | Fetches the user data associated with the specified key, attached to the specified font-functions structure. |
| blob_is_immutable | `blob_is_immutable(blob: blob_t) -> bool_t` | hb_blob_is_immutable | 0.9.2 | Tests whether a blob is immutable. |
| blob_make_immutable | `blob_make_immutable(blob: blob_t) -> none` | hb_blob_make_immutable | 0.9.2 | Makes a blob immutable. |
| blob_reference | `blob_reference(blob: blob_t) -> blob_t` | hb_blob_reference | 0.9.2 | Increases the reference count on @blob. See TODO:link object types for more information. |
| blob_set_user_data | `blob_set_user_data(blob: blob_t, key: user_data_key_t, data: gpointer?, destroy: destroy_func_t?, replace: bool_t) -> bool_t` | hb_blob_set_user_data | 0.9.2 | Attaches a user-data key/data pair to the specified blob. |
| buffer_add | `buffer_add(buffer: buffer_t, codepoint: codepoint_t, cluster: guint) -> none` | hb_buffer_add | 0.9.7 | Appends a character with the Unicode value of @codepoint to @buffer, and gives it the initial cluster value of @cluster. Clusters can be any thing ... |
| buffer_add_codepoints | `buffer_add_codepoints(buffer: buffer_t, text: codepoint_t, text_length: gint, item_offset: guint, item_length: gint) -> none` | hb_buffer_add_codepoints | 0.9.31 | Appends characters from @text array to @buffer. The @item_offset is the position of the first character from @text that will be appended, and @item... |
| buffer_add_latin1 | `buffer_add_latin1(buffer: buffer_t, text: guint8, text_length: gint, item_offset: guint, item_length: gint) -> none` | hb_buffer_add_latin1 | 0.9.39 | Similar to hb_buffer_add_codepoints(), but allows only access to first 256 Unicode code points that can fit in 8-bit strings. <note>Has nothing to ... |
| buffer_add_utf16 | `buffer_add_utf16(buffer: buffer_t, text: guint16, text_length: gint, item_offset: guint, item_length: gint) -> none` | hb_buffer_add_utf16 | 0.9.2 | See hb_buffer_add_codepoints(). Replaces invalid UTF-16 characters with the @buffer replacement code point, see hb_buffer_set_replacement_codepoint(). |
| buffer_add_utf32 | `buffer_add_utf32(buffer: buffer_t, text: guint32, text_length: gint, item_offset: guint, item_length: gint) -> none` | hb_buffer_add_utf32 | 0.9.2 | See hb_buffer_add_codepoints(). Replaces invalid UTF-32 characters with the @buffer replacement code point, see hb_buffer_set_replacement_codepoint(). |
| buffer_add_utf8 | `buffer_add_utf8(buffer: buffer_t, text: guint8, text_length: gint, item_offset: guint, item_length: gint) -> none` | hb_buffer_add_utf8 | 0.9.2 | See hb_buffer_add_codepoints(). Replaces invalid UTF-8 characters with the @buffer replacement code point, see hb_buffer_set_replacement_codepoint(). |
| buffer_allocation_successful | `buffer_allocation_successful(buffer: buffer_t) -> bool_t` | hb_buffer_allocation_successful | 0.9.2 | Check if allocating memory for the buffer succeeded. |
| buffer_append | `buffer_append(buffer: buffer_t, source: buffer_t, start: guint, end: guint) -> none` | hb_buffer_append | 1.5.0 | Append (part of) contents of another buffer to this buffer. |
| buffer_clear_contents | `buffer_clear_contents(buffer: buffer_t) -> none` | hb_buffer_clear_contents | 0.9.11 | Similar to hb_buffer_reset(), but does not clear the Unicode functions and the replacement code point. |
| buffer_create | `buffer_create() -> buffer_t` | hb_buffer_create | 0.9.2 | Creates a new #hb_buffer_t with all properties to defaults. |
| buffer_create_similar | `buffer_create_similar(src: buffer_t) -> buffer_t` | hb_buffer_create_similar | 3.3.0 | Creates a new #hb_buffer_t, similar to hb_buffer_create(). The only difference is that the buffer is configured similarly to @src. |
| buffer_deserialize_glyphs | `buffer_deserialize_glyphs(buffer: buffer_t, buf: utf8, buf_len: gint, end_ptr: out utf8?, font: font_t?, format: buffer_serialize_format_t) -> bool_t` | hb_buffer_deserialize_glyphs | 0.9.7 | Deserializes glyphs @buffer from textual representation in the format produced by hb_buffer_serialize_glyphs(). |
| buffer_deserialize_unicode | `buffer_deserialize_unicode(buffer: buffer_t, buf: utf8, buf_len: gint, end_ptr: out utf8?, format: buffer_serialize_format_t) -> bool_t` | hb_buffer_deserialize_unicode | 2.7.3 | Deserializes Unicode @buffer from textual representation in the format produced by hb_buffer_serialize_unicode(). |
| buffer_destroy | `buffer_destroy(buffer: buffer_t) -> none` | hb_buffer_destroy | 0.9.2 | Deallocate the @buffer. Decreases the reference count on @buffer by one. If the result is zero, then @buffer and all associated resources are freed... |
| buffer_diff | `buffer_diff(buffer: buffer_t, reference: buffer_t, dottedcircle_glyph: codepoint_t, position_fuzz: guint) -> buffer_diff_flags_t` | hb_buffer_diff | 1.5.0 | If dottedcircle_glyph is (hb_codepoint_t) -1 then #HB_BUFFER_DIFF_FLAG_DOTTED_CIRCLE_PRESENT and #HB_BUFFER_DIFF_FLAG_NOTDEF_PRESENT are never retu... |
| buffer_get_cluster_level | `buffer_get_cluster_level(buffer: buffer_t) -> buffer_cluster_level_t` | hb_buffer_get_cluster_level | 0.9.42 | Fetches the cluster level of a buffer. The #hb_buffer_cluster_level_t dictates one aspect of how HarfBuzz will treat non-base characters during sha... |
| buffer_get_content_type | `buffer_get_content_type(buffer: buffer_t) -> buffer_content_type_t` | hb_buffer_get_content_type | 0.9.5 | Fetches the type of @buffer contents. Buffers are either empty, contain characters (before shaping), or contain glyphs (the result of shaping). |
| buffer_get_direction | `buffer_get_direction(buffer: buffer_t) -> direction_t` | hb_buffer_get_direction | 0.9.2 | See hb_buffer_set_direction() |
| buffer_get_empty | `buffer_get_empty() -> buffer_t` | hb_buffer_get_empty | 0.9.2 | Fetches an empty #hb_buffer_t. |
| buffer_get_flags | `buffer_get_flags(buffer: buffer_t) -> buffer_flags_t` | hb_buffer_get_flags | 0.9.7 | Fetches the #hb_buffer_flags_t of @buffer. |
| buffer_get_glyph_infos | `buffer_get_glyph_infos(buffer: buffer_t, length: out guint) -> glyph_info_t` | hb_buffer_get_glyph_infos | 0.9.2 | Returns @buffer glyph information array. Returned pointer is valid as long as @buffer contents are not modified. |
| buffer_get_glyph_positions | `buffer_get_glyph_positions(buffer: buffer_t, length: out guint) -> glyph_position_t` | hb_buffer_get_glyph_positions | 0.9.2 | Returns @buffer glyph position array. Returned pointer is valid as long as @buffer contents are not modified. If buffer did not have positions befo... |
| buffer_get_invisible_glyph | `buffer_get_invisible_glyph(buffer: buffer_t) -> codepoint_t` | hb_buffer_get_invisible_glyph | 2.0.0 | See hb_buffer_set_invisible_glyph(). |
| buffer_get_language | `buffer_get_language(buffer: buffer_t) -> language_t` | hb_buffer_get_language | 0.9.2 | See hb_buffer_set_language(). |
| buffer_get_length | `buffer_get_length(buffer: buffer_t) -> guint` | hb_buffer_get_length | 0.9.2 | Returns the number of items in the buffer. |
| buffer_get_not_found_glyph | `buffer_get_not_found_glyph(buffer: buffer_t) -> codepoint_t` | hb_buffer_get_not_found_glyph | 3.1.0 | See hb_buffer_set_not_found_glyph(). |
| buffer_get_replacement_codepoint | `buffer_get_replacement_codepoint(buffer: buffer_t) -> codepoint_t` | hb_buffer_get_replacement_codepoint | 0.9.31 | Fetches the #hb_codepoint_t that replaces invalid entries for a given encoding when adding text to @buffer. |
| buffer_get_script | `buffer_get_script(buffer: buffer_t) -> script_t` | hb_buffer_get_script | 0.9.2 | Fetches the script of @buffer. |
| buffer_get_segment_properties | `buffer_get_segment_properties(buffer: buffer_t, props: out segment_properties_t) -> none` | hb_buffer_get_segment_properties | 0.9.7 | Sets @props to the #hb_segment_properties_t of @buffer. |
| buffer_get_unicode_funcs | `buffer_get_unicode_funcs(buffer: buffer_t) -> unicode_funcs_t` | hb_buffer_get_unicode_funcs | 0.9.2 | Fetches the Unicode-functions structure of a buffer. |
| buffer_get_user_data | `buffer_get_user_data(buffer: buffer_t, key: user_data_key_t) -> gpointer` | hb_buffer_get_user_data | 0.9.2 | Fetches the user data associated with the specified key, attached to the specified buffer. |
| buffer_guess_segment_properties | `buffer_guess_segment_properties(buffer: buffer_t) -> none` | hb_buffer_guess_segment_properties | 0.9.7 | Sets unset buffer segment properties based on buffer Unicode contents. If buffer is not empty, it must have content type #HB_BUFFER_CONTENT_TYPE_UN... |
| buffer_has_positions | `buffer_has_positions(buffer: buffer_t) -> bool_t` | hb_buffer_has_positions | 2.7.3 | Returns whether @buffer has glyph position data. A buffer gains position data when hb_buffer_get_glyph_positions() is called on it, and cleared of ... |
| buffer_normalize_glyphs | `buffer_normalize_glyphs(buffer: buffer_t) -> none` | hb_buffer_normalize_glyphs | 0.9.2 | Reorders a glyph buffer to have canonical in-cluster glyph order / position. The resulting clusters should behave identical to pre-reordering clust... |
| buffer_pre_allocate | `buffer_pre_allocate(buffer: buffer_t, size: guint) -> bool_t` | hb_buffer_pre_allocate | 0.9.2 | Pre allocates memory for @buffer to fit at least @size number of items. |
| buffer_reference | `buffer_reference(buffer: buffer_t) -> buffer_t` | hb_buffer_reference | 0.9.2 | Increases the reference count on @buffer by one. This prevents @buffer from being destroyed until a matching call to hb_buffer_destroy() is made. |
| buffer_reset | `buffer_reset(buffer: buffer_t) -> none` | hb_buffer_reset | 0.9.2 | Resets the buffer to its initial status, as if it was just newly created with hb_buffer_create(). |
| buffer_reverse | `buffer_reverse(buffer: buffer_t) -> none` | hb_buffer_reverse | 0.9.2 | Reverses buffer contents. |
| buffer_reverse_clusters | `buffer_reverse_clusters(buffer: buffer_t) -> none` | hb_buffer_reverse_clusters | 0.9.2 | Reverses buffer clusters. That is, the buffer contents are reversed, then each cluster (consecutive items having the same cluster number) are rever... |
| buffer_reverse_range | `buffer_reverse_range(buffer: buffer_t, start: guint, end: guint) -> none` | hb_buffer_reverse_range | 0.9.41 | Reverses buffer contents between @start and @end. |
| buffer_serialize | `buffer_serialize(buffer: buffer_t, start: guint, end: guint, buf: out guint8, buf_size: out guint, buf_consumed: out guint?, font: font_t?, format: buffer_serialize_format_t, flags: buffer_serialize_flags_t) -> guint` | hb_buffer_serialize | 2.7.3 | Serializes @buffer into a textual representation of its content, whether Unicode codepoints or glyph identifiers and positioning information. This ... |
| buffer_serialize_format_from_string | `buffer_serialize_format_from_string(str: guint8, len: gint) -> buffer_serialize_format_t` | hb_buffer_serialize_format_from_string | 0.9.7 | Parses a string into an #hb_buffer_serialize_format_t. Does not check if @str is a valid buffer serialization format, use hb_buffer_serialize_list_... |
| buffer_serialize_format_to_string | `buffer_serialize_format_to_string(format: buffer_serialize_format_t) -> utf8` | hb_buffer_serialize_format_to_string | 0.9.7 | Converts @format to the string corresponding it, or `NULL` if it is not a valid #hb_buffer_serialize_format_t. |
| buffer_serialize_glyphs | `buffer_serialize_glyphs(buffer: buffer_t, start: guint, end: guint, buf: out guint8, buf_size: out guint, buf_consumed: out guint?, font: font_t?, format: buffer_serialize_format_t, flags: buffer_serialize_flags_t) -> guint` | hb_buffer_serialize_glyphs | 0.9.7 | Serializes @buffer into a textual representation of its glyph content, useful for showing the contents of the buffer, for example during debugging.... |
| buffer_serialize_list_formats | `buffer_serialize_list_formats() -> utf8` | hb_buffer_serialize_list_formats | 0.9.7 | Returns a list of supported buffer serialization formats. |
| buffer_serialize_unicode | `buffer_serialize_unicode(buffer: buffer_t, start: guint, end: guint, buf: out guint8, buf_size: out guint, buf_consumed: out guint?, format: buffer_serialize_format_t, flags: buffer_serialize_flags_t) -> guint` | hb_buffer_serialize_unicode | 2.7.3 | Serializes @buffer into a textual representation of its content, when the buffer contains Unicode codepoints (i.e., before shaping). This is useful... |
| buffer_set_cluster_level | `buffer_set_cluster_level(buffer: buffer_t, cluster_level: buffer_cluster_level_t) -> none` | hb_buffer_set_cluster_level | 0.9.42 | Sets the cluster level of a buffer. The #hb_buffer_cluster_level_t dictates one aspect of how HarfBuzz will treat non-base characters during shaping. |
| buffer_set_content_type | `buffer_set_content_type(buffer: buffer_t, content_type: buffer_content_type_t) -> none` | hb_buffer_set_content_type | 0.9.5 | Sets the type of @buffer contents. Buffers are either empty, contain characters (before shaping), or contain glyphs (the result of shaping). You ra... |
| buffer_set_direction | `buffer_set_direction(buffer: buffer_t, direction: direction_t) -> none` | hb_buffer_set_direction | 0.9.2 | Set the text flow direction of the buffer. No shaping can happen without setting @buffer direction, and it controls the visual direction for the ou... |
| buffer_set_flags | `buffer_set_flags(buffer: buffer_t, flags: buffer_flags_t) -> none` | hb_buffer_set_flags | 0.9.7 | Sets @buffer flags to @flags. See #hb_buffer_flags_t. |
| buffer_set_invisible_glyph | `buffer_set_invisible_glyph(buffer: buffer_t, invisible: codepoint_t) -> none` | hb_buffer_set_invisible_glyph | 2.0.0 | Sets the #hb_codepoint_t that replaces invisible characters in the shaping result. If set to zero (default), the glyph for the U+0020 SPACE charact... |
| buffer_set_language | `buffer_set_language(buffer: buffer_t, language: language_t) -> none` | hb_buffer_set_language | 0.9.2 | Sets the language of @buffer to @language. Languages are crucial for selecting which OpenType feature to apply to the buffer which can result in ap... |
| buffer_set_length | `buffer_set_length(buffer: buffer_t, length: guint) -> bool_t` | hb_buffer_set_length | 0.9.2 | Similar to hb_buffer_pre_allocate(), but clears any new items added at the end. |
| buffer_set_message_func | `buffer_set_message_func(buffer: buffer_t, func: buffer_message_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_buffer_set_message_func | 1.1.3 | Sets the implementation function for #hb_buffer_message_func_t. |
| buffer_set_not_found_glyph | `buffer_set_not_found_glyph(buffer: buffer_t, not_found: codepoint_t) -> none` | hb_buffer_set_not_found_glyph | 3.1.0 | Sets the #hb_codepoint_t that replaces characters not found in the font during shaping. The not-found glyph defaults to zero, sometimes known as th... |
| buffer_set_replacement_codepoint | `buffer_set_replacement_codepoint(buffer: buffer_t, replacement: codepoint_t) -> none` | hb_buffer_set_replacement_codepoint | 0.9.31 | Sets the #hb_codepoint_t that replaces invalid entries for a given encoding when adding text to @buffer. Default is #HB_BUFFER_REPLACEMENT_CODEPOIN... |
| buffer_set_script | `buffer_set_script(buffer: buffer_t, script: script_t) -> none` | hb_buffer_set_script | 0.9.2 | Sets the script of @buffer to @script. Script is crucial for choosing the proper shaping behaviour for scripts that require it (e.g. Arabic) and th... |
| buffer_set_segment_properties | `buffer_set_segment_properties(buffer: buffer_t, props: segment_properties_t) -> none` | hb_buffer_set_segment_properties | 0.9.7 | Sets the segment properties of the buffer, a shortcut for calling hb_buffer_set_direction(), hb_buffer_set_script() and hb_buffer_set_language() in... |
| buffer_set_unicode_funcs | `buffer_set_unicode_funcs(buffer: buffer_t, unicode_funcs: unicode_funcs_t) -> none` | hb_buffer_set_unicode_funcs | 0.9.2 | Sets the Unicode-functions structure of a buffer to @unicode_funcs. |
| buffer_set_user_data | `buffer_set_user_data(buffer: buffer_t, key: user_data_key_t, data: gpointer?, destroy: destroy_func_t?, replace: bool_t) -> bool_t` | hb_buffer_set_user_data | 0.9.2 | Attaches a user-data key/data pair to the specified buffer. |
| color_get_alpha | `color_get_alpha(color: color_t) -> guint8` | hb_color_get_alpha | 2.1.0 | Fetches the alpha channel of the given @color. |
| color_get_blue | `color_get_blue(color: color_t) -> guint8` | hb_color_get_blue | 2.1.0 | Fetches the blue channel of the given @color. |
| color_get_green | `color_get_green(color: color_t) -> guint8` | hb_color_get_green | 2.1.0 | Fetches the green channel of the given @color. |
| color_get_red | `color_get_red(color: color_t) -> guint8` | hb_color_get_red | 2.1.0 | Fetches the red channel of the given @color. |
| color_line_get_color_stops | `color_line_get_color_stops(color_line: color_line_t, start: guint, count: out guint?, color_stops: out color_stop_t?) -> guint` | hb_color_line_get_color_stops | 7.0.0 | Fetches a list of color stops from the given color line object. Note that due to variations being applied, the returned color stops may be out of o... |
| color_line_get_extend | `color_line_get_extend(color_line: color_line_t) -> paint_extend_t` | hb_color_line_get_extend | 7.0.0 | Fetches the extend mode of the color line object. |
| direction_from_string | `direction_from_string(str: guint8, len: gint) -> direction_t` | hb_direction_from_string | 0.9.2 | Converts a string to an #hb_direction_t. Matching is loose and applies only to the first letter. For examples, "LTR" and "left-to-right" will both ... |
| direction_to_string | `direction_to_string(direction: direction_t) -> utf8` | hb_direction_to_string | 0.9.2 | Converts an #hb_direction_t to a string. |
| draw_close_path | `draw_close_path(dfuncs: draw_funcs_t, draw_data: gpointer?, st: draw_state_t) -> none` | hb_draw_close_path | 4.0.0 | Perform a "close-path" draw operation. |
| draw_cubic_to | `draw_cubic_to(dfuncs: draw_funcs_t, draw_data: gpointer?, st: draw_state_t, control1_x: gfloat, control1_y: gfloat, control2_x: gfloat, control2_y: gfloat, to_x: gfloat, to_y: gfloat) -> none` | hb_draw_cubic_to | 4.0.0 | Perform a "cubic-to" draw operation. |
| draw_funcs_create | `draw_funcs_create() -> draw_funcs_t` | hb_draw_funcs_create | 4.0.0 | Creates a new draw callbacks object. |
| draw_funcs_destroy | `draw_funcs_destroy(dfuncs: draw_funcs_t) -> none` | hb_draw_funcs_destroy | 4.0.0 | Deallocate the @dfuncs. Decreases the reference count on @dfuncs by one. If the result is zero, then @dfuncs and all associated resources are freed... |
| draw_funcs_get_empty | `draw_funcs_get_empty() -> draw_funcs_t` | hb_draw_funcs_get_empty | 7.0.0 | Fetches the singleton empty draw-functions structure. |
| draw_funcs_get_user_data | `draw_funcs_get_user_data(dfuncs: draw_funcs_t, key: user_data_key_t) -> gpointer` | hb_draw_funcs_get_user_data | 7.0.0 | Fetches the user-data associated with the specified key, attached to the specified draw-functions structure. |
| draw_funcs_is_immutable | `draw_funcs_is_immutable(dfuncs: draw_funcs_t) -> bool_t` | hb_draw_funcs_is_immutable | 4.0.0 | Checks whether @dfuncs is immutable. |
| draw_funcs_make_immutable | `draw_funcs_make_immutable(dfuncs: draw_funcs_t) -> none` | hb_draw_funcs_make_immutable | 4.0.0 | Makes @dfuncs object immutable. |
| draw_funcs_reference | `draw_funcs_reference(dfuncs: draw_funcs_t) -> draw_funcs_t` | hb_draw_funcs_reference | 4.0.0 | Increases the reference count on @dfuncs by one. This prevents @dfuncs from being destroyed until a matching call to hb_draw_funcs_destroy() is made. |
| draw_funcs_set_close_path_func | `draw_funcs_set_close_path_func(dfuncs: draw_funcs_t, func: draw_close_path_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_draw_funcs_set_close_path_func | 4.0.0 | Sets close-path callback to the draw functions object. |
| draw_funcs_set_cubic_to_func | `draw_funcs_set_cubic_to_func(dfuncs: draw_funcs_t, func: draw_cubic_to_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_draw_funcs_set_cubic_to_func | 4.0.0 | Sets cubic-to callback to the draw functions object. |
| draw_funcs_set_line_to_func | `draw_funcs_set_line_to_func(dfuncs: draw_funcs_t, func: draw_line_to_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_draw_funcs_set_line_to_func | 4.0.0 | Sets line-to callback to the draw functions object. |
| draw_funcs_set_move_to_func | `draw_funcs_set_move_to_func(dfuncs: draw_funcs_t, func: draw_move_to_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_draw_funcs_set_move_to_func | 4.0.0 | Sets move-to callback to the draw functions object. |
| draw_funcs_set_quadratic_to_func | `draw_funcs_set_quadratic_to_func(dfuncs: draw_funcs_t, func: draw_quadratic_to_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_draw_funcs_set_quadratic_to_func | 4.0.0 | Sets quadratic-to callback to the draw functions object. |
| draw_funcs_set_user_data | `draw_funcs_set_user_data(dfuncs: draw_funcs_t, key: user_data_key_t, data: gpointer?, destroy: destroy_func_t?, replace: bool_t) -> bool_t` | hb_draw_funcs_set_user_data | 7.0.0 | Attaches a user-data key/data pair to the specified draw-functions structure. |
| draw_line_to | `draw_line_to(dfuncs: draw_funcs_t, draw_data: gpointer?, st: draw_state_t, to_x: gfloat, to_y: gfloat) -> none` | hb_draw_line_to | 4.0.0 | Perform a "line-to" draw operation. |
| draw_move_to | `draw_move_to(dfuncs: draw_funcs_t, draw_data: gpointer?, st: draw_state_t, to_x: gfloat, to_y: gfloat) -> none` | hb_draw_move_to | 4.0.0 | Perform a "move-to" draw operation. |
| draw_quadratic_to | `draw_quadratic_to(dfuncs: draw_funcs_t, draw_data: gpointer?, st: draw_state_t, control_x: gfloat, control_y: gfloat, to_x: gfloat, to_y: gfloat) -> none` | hb_draw_quadratic_to | 4.0.0 | Perform a "quadratic-to" draw operation. |
| face_builder_add_table | `face_builder_add_table(face: face_t, tag: tag_t, blob: blob_t) -> bool_t` | hb_face_builder_add_table | 1.9.0 | Add table for @tag with data provided by @blob to the face. @face must be created using hb_face_builder_create(). |
| face_builder_create | `face_builder_create() -> face_t` | hb_face_builder_create | 1.9.0 | Creates a #hb_face_t that can be used with hb_face_builder_add_table(). After tables are added to the face, it can be compiled to a binary font fil... |
| face_builder_sort_tables | `face_builder_sort_tables(face: face_t, tags: tag_t) -> none` | hb_face_builder_sort_tables | 5.3.0 | Set the ordering of tables for serialization. Any tables not specified in the tags list will be ordered after the tables in tags, ordered by the de... |
| face_collect_nominal_glyph_mapping | `face_collect_nominal_glyph_mapping(face: face_t, mapping: out map_t, unicodes: out set_t?) -> none` | hb_face_collect_nominal_glyph_mapping | 7.0.0 | Collects the mapping from Unicode characters to nominal glyphs of the @face, and optionally all of the Unicode characters covered by @face. |
| face_collect_unicodes | `face_collect_unicodes(face: face_t, out: out set_t) -> none` | hb_face_collect_unicodes | 1.9.0 | Collects all of the Unicode characters covered by @face and adds them to the #hb_set_t set @out. |
| face_collect_variation_selectors | `face_collect_variation_selectors(face: face_t, out: out set_t) -> none` | hb_face_collect_variation_selectors | 1.9.0 | Collects all Unicode "Variation Selector" characters covered by @face and adds them to the #hb_set_t set @out. |
| face_collect_variation_unicodes | `face_collect_variation_unicodes(face: face_t, variation_selector: codepoint_t, out: out set_t) -> none` | hb_face_collect_variation_unicodes | 1.9.0 | Collects all Unicode characters for @variation_selector covered by @face and adds them to the #hb_set_t set @out. |
| face_count | `face_count(blob: blob_t) -> guint` | hb_face_count | 1.7.7 | Fetches the number of faces in a blob. |
| face_create | `face_create(blob: blob_t, index: guint) -> face_t` | hb_face_create | 0.9.2 | Constructs a new face object from the specified blob and a face index into that blob. The face index is used for blobs of file formats such as TTC ... |
| face_create_for_tables | `face_create_for_tables(reference_table_func: reference_table_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> face_t` | hb_face_create_for_tables | 0.9.2 | Variant of hb_face_create(), built for those cases where it is more convenient to provide data for individual tables instead of the whole font data... |
| face_destroy | `face_destroy(face: face_t) -> none` | hb_face_destroy | 0.9.2 | Decreases the reference count on a face object. When the reference count reaches zero, the face is destroyed, freeing all memory. |
| face_get_empty | `face_get_empty() -> face_t` | hb_face_get_empty | 0.9.2 | Fetches the singleton empty face object. |
| face_get_glyph_count | `face_get_glyph_count(face: face_t) -> guint` | hb_face_get_glyph_count | 0.9.7 | Fetches the glyph-count value of the specified face object. |
| face_get_index | `face_get_index(face: face_t) -> guint` | hb_face_get_index | 0.9.2 | Fetches the face-index corresponding to the given face. <note>Note: face indices within a collection are zero-based.</note> |
| face_get_table_tags | `face_get_table_tags(face: face_t, start_offset: guint, table_count: out guint, table_tags: out tag_t) -> guint` | hb_face_get_table_tags | 1.6.0 | Fetches a list of all table tags for a face, if possible. The list returned will begin at the offset provided |
| face_get_upem | `face_get_upem(face: face_t) -> guint` | hb_face_get_upem | 0.9.2 | Fetches the units-per-em (UPEM) value of the specified face object. Typical UPEM values for fonts are 1000, or 2048, but any value in between 16 an... |
| face_get_user_data | `face_get_user_data(face: face_t, key: user_data_key_t) -> gpointer` | hb_face_get_user_data | 0.9.2 | Fetches the user data associated with the specified key, attached to the specified face object. |
| face_is_immutable | `face_is_immutable(face: face_t) -> bool_t` | hb_face_is_immutable | 0.9.2 | Tests whether the given face object is immutable. |
| face_make_immutable | `face_make_immutable(face: face_t) -> none` | hb_face_make_immutable | 0.9.2 | Makes the given face object immutable. |
| face_reference | `face_reference(face: face_t) -> face_t` | hb_face_reference | 0.9.2 | Increases the reference count on a face object. |
| face_reference_blob | `face_reference_blob(face: face_t) -> blob_t` | hb_face_reference_blob | 0.9.2 | Fetches a pointer to the binary blob that contains the specified face. Returns an empty blob if referencing face data is not possible. |
| face_reference_table | `face_reference_table(face: face_t, tag: tag_t) -> blob_t` | hb_face_reference_table | 0.9.2 | Fetches a reference to the specified table within the specified face. |
| face_set_glyph_count | `face_set_glyph_count(face: face_t, glyph_count: guint) -> none` | hb_face_set_glyph_count | 0.9.7 | Sets the glyph count for a face object to the specified value. This API is used in rare circumstances. |
| face_set_index | `face_set_index(face: face_t, index: guint) -> none` | hb_face_set_index | 0.9.2 | Assigns the specified face-index to @face. Fails if the face is immutable. <note>Note: changing the index has no effect on the face itself This onl... |
| face_set_upem | `face_set_upem(face: face_t, upem: guint) -> none` | hb_face_set_upem | 0.9.2 | Sets the units-per-em (upem) for a face object to the specified value. This API is used in rare circumstances. |
| face_set_user_data | `face_set_user_data(face: face_t, key: user_data_key_t, data: gpointer?, destroy: destroy_func_t?, replace: bool_t) -> bool_t` | hb_face_set_user_data | 0.9.2 | Attaches a user-data key/data pair to the given face object. |
| feature_from_string | `feature_from_string(str: guint8, len: gint, feature: out feature_t) -> bool_t` | hb_feature_from_string | 0.9.5 | Parses a string into a #hb_feature_t. The format for specifying feature strings follows. All valid CSS font-feature-settings values other than 'nor... |
| feature_to_string | `feature_to_string(feature: feature_t, buf: out utf8, size: out guint) -> none` | hb_feature_to_string | 0.9.5 | Converts a #hb_feature_t into a `NULL`-terminated string in the format understood by hb_feature_from_string(). The client in responsible for alloca... |
| font_add_glyph_origin_for_direction | `font_add_glyph_origin_for_direction(font: font_t, glyph: codepoint_t, direction: direction_t, x: inout position_t, y: inout position_t) -> none` | hb_font_add_glyph_origin_for_direction | 0.9.2 | Adds the origin coordinates to an (X,Y) point coordinate, in the specified glyph ID in the specified font. Calls the appropriate direction-specific... |
| font_changed | `font_changed(font: font_t) -> none` | hb_font_changed | 4.4.0 | Notifies the @font that underlying font data has changed. This has the effect of increasing the serial as returned by hb_font_get_serial(), which i... |
| font_create | `font_create(face: face_t) -> font_t` | hb_font_create | 0.9.2 | Constructs a new font object from the specified face. <note>Note: If @face's index value (as passed to hb_face_create() has non-zero top 16-bits, t... |
| font_create_sub_font | `font_create_sub_font(parent: font_t) -> font_t` | hb_font_create_sub_font | 0.9.2 | Constructs a sub-font font object from the specified @parent font, replicating the parent's properties. |
| font_destroy | `font_destroy(font: font_t) -> none` | hb_font_destroy | 0.9.2 | Decreases the reference count on the given font object. When the reference count reaches zero, the font is destroyed, freeing all memory. |
| font_draw_glyph | `font_draw_glyph(font: font_t, glyph: codepoint_t, dfuncs: draw_funcs_t, draw_data: gpointer?) -> none` | hb_font_draw_glyph | 7.0.0 | Draws the outline that corresponds to a glyph in the specified @font. The outline is returned by way of calls to the callbacks of the @dfuncs objec... |
| font_funcs_create | `font_funcs_create() -> font_funcs_t` | hb_font_funcs_create | 0.9.2 | Creates a new #hb_font_funcs_t structure of font functions. |
| font_funcs_destroy | `font_funcs_destroy(ffuncs: font_funcs_t) -> none` | hb_font_funcs_destroy | 0.9.2 | Decreases the reference count on a font-functions structure. When the reference count reaches zero, the font-functions structure is destroyed, free... |
| font_funcs_get_empty | `font_funcs_get_empty() -> font_funcs_t` | hb_font_funcs_get_empty | 0.9.2 | Fetches an empty font-functions structure. |
| font_funcs_get_user_data | `font_funcs_get_user_data(ffuncs: font_funcs_t, key: user_data_key_t) -> gpointer` | hb_font_funcs_get_user_data | 0.9.2 | Fetches the user data associated with the specified key, attached to the specified font-functions structure. |
| font_funcs_is_immutable | `font_funcs_is_immutable(ffuncs: font_funcs_t) -> bool_t` | hb_font_funcs_is_immutable | 0.9.2 | Tests whether a font-functions structure is immutable. |
| font_funcs_make_immutable | `font_funcs_make_immutable(ffuncs: font_funcs_t) -> none` | hb_font_funcs_make_immutable | 0.9.2 | Makes a font-functions structure immutable. |
| font_funcs_reference | `font_funcs_reference(ffuncs: font_funcs_t) -> font_funcs_t` | hb_font_funcs_reference | 0.9.2 | Increases the reference count on a font-functions structure. |
| font_funcs_set_draw_glyph_func | `font_funcs_set_draw_glyph_func(ffuncs: font_funcs_t, func: font_draw_glyph_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_draw_glyph_func | 7.0.0 | Sets the implementation function for #hb_font_draw_glyph_func_t. |
| font_funcs_set_font_h_extents_func | `font_funcs_set_font_h_extents_func(ffuncs: font_funcs_t, func: font_get_font_h_extents_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_font_h_extents_func | 1.1.2 | Sets the implementation function for #hb_font_get_font_h_extents_func_t. |
| font_funcs_set_font_v_extents_func | `font_funcs_set_font_v_extents_func(ffuncs: font_funcs_t, func: font_get_font_v_extents_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_font_v_extents_func | 1.1.2 | Sets the implementation function for #hb_font_get_font_v_extents_func_t. |
| font_funcs_set_glyph_contour_point_func | `font_funcs_set_glyph_contour_point_func(ffuncs: font_funcs_t, func: font_get_glyph_contour_point_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_glyph_contour_point_func | 0.9.2 | Sets the implementation function for #hb_font_get_glyph_contour_point_func_t. |
| font_funcs_set_glyph_extents_func | `font_funcs_set_glyph_extents_func(ffuncs: font_funcs_t, func: font_get_glyph_extents_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_glyph_extents_func | 0.9.2 | Sets the implementation function for #hb_font_get_glyph_extents_func_t. |
| font_funcs_set_glyph_from_name_func | `font_funcs_set_glyph_from_name_func(ffuncs: font_funcs_t, func: font_get_glyph_from_name_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_glyph_from_name_func | 0.9.2 | Sets the implementation function for #hb_font_get_glyph_from_name_func_t. |
| font_funcs_set_glyph_func | `font_funcs_set_glyph_func(ffuncs: font_funcs_t, func: font_get_glyph_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_glyph_func | 0.9.2 | Deprecated. Use hb_font_funcs_set_nominal_glyph_func() and hb_font_funcs_set_variation_glyph_func() instead. |
| font_funcs_set_glyph_h_advance_func | `font_funcs_set_glyph_h_advance_func(ffuncs: font_funcs_t, func: font_get_glyph_h_advance_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_glyph_h_advance_func | 0.9.2 | Sets the implementation function for #hb_font_get_glyph_h_advance_func_t. |
| font_funcs_set_glyph_h_advances_func | `font_funcs_set_glyph_h_advances_func(ffuncs: font_funcs_t, func: font_get_glyph_h_advances_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_glyph_h_advances_func | 1.8.6 | Sets the implementation function for #hb_font_get_glyph_h_advances_func_t. |
| font_funcs_set_glyph_h_kerning_func | `font_funcs_set_glyph_h_kerning_func(ffuncs: font_funcs_t, func: font_get_glyph_h_kerning_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_glyph_h_kerning_func | 0.9.2 | Sets the implementation function for #hb_font_get_glyph_h_kerning_func_t. |
| font_funcs_set_glyph_h_origin_func | `font_funcs_set_glyph_h_origin_func(ffuncs: font_funcs_t, func: font_get_glyph_h_origin_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_glyph_h_origin_func | 0.9.2 | Sets the implementation function for #hb_font_get_glyph_h_origin_func_t. |
| font_funcs_set_glyph_name_func | `font_funcs_set_glyph_name_func(ffuncs: font_funcs_t, func: font_get_glyph_name_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_glyph_name_func | 0.9.2 | Sets the implementation function for #hb_font_get_glyph_name_func_t. |
| font_funcs_set_glyph_shape_func | `font_funcs_set_glyph_shape_func(ffuncs: font_funcs_t, func: font_get_glyph_shape_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_glyph_shape_func | 4.0.0 | Sets the implementation function for #hb_font_get_glyph_shape_func_t, which is the same as #hb_font_draw_glyph_func_t. |
| font_funcs_set_glyph_v_advance_func | `font_funcs_set_glyph_v_advance_func(ffuncs: font_funcs_t, func: font_get_glyph_v_advance_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_glyph_v_advance_func | 0.9.2 | Sets the implementation function for #hb_font_get_glyph_v_advance_func_t. |
| font_funcs_set_glyph_v_advances_func | `font_funcs_set_glyph_v_advances_func(ffuncs: font_funcs_t, func: font_get_glyph_v_advances_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_glyph_v_advances_func | 1.8.6 | Sets the implementation function for #hb_font_get_glyph_v_advances_func_t. |
| font_funcs_set_glyph_v_kerning_func | `font_funcs_set_glyph_v_kerning_func(ffuncs: font_funcs_t, func: font_get_glyph_v_kerning_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_glyph_v_kerning_func | 0.9.2 | Sets the implementation function for #hb_font_get_glyph_v_kerning_func_t. |
| font_funcs_set_glyph_v_origin_func | `font_funcs_set_glyph_v_origin_func(ffuncs: font_funcs_t, func: font_get_glyph_v_origin_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_glyph_v_origin_func | 0.9.2 | Sets the implementation function for #hb_font_get_glyph_v_origin_func_t. |
| font_funcs_set_nominal_glyph_func | `font_funcs_set_nominal_glyph_func(ffuncs: font_funcs_t, func: font_get_nominal_glyph_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_nominal_glyph_func | 1.2.3 | Sets the implementation function for #hb_font_get_nominal_glyph_func_t. |
| font_funcs_set_nominal_glyphs_func | `font_funcs_set_nominal_glyphs_func(ffuncs: font_funcs_t, func: font_get_nominal_glyphs_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_nominal_glyphs_func | 2.0.0 | Sets the implementation function for #hb_font_get_nominal_glyphs_func_t. |
| font_funcs_set_paint_glyph_func | `font_funcs_set_paint_glyph_func(ffuncs: font_funcs_t, func: font_paint_glyph_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_paint_glyph_func | 7.0.0 | Sets the implementation function for #hb_font_paint_glyph_func_t. |
| font_funcs_set_user_data | `font_funcs_set_user_data(ffuncs: font_funcs_t, key: user_data_key_t, data: gpointer?, destroy: destroy_func_t?, replace: bool_t) -> bool_t` | hb_font_funcs_set_user_data | 0.9.2 | Attaches a user-data key/data pair to the specified font-functions structure. |
| font_funcs_set_variation_glyph_func | `font_funcs_set_variation_glyph_func(ffuncs: font_funcs_t, func: font_get_variation_glyph_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_funcs_set_variation_glyph_func | 1.2.3 | Sets the implementation function for #hb_font_get_variation_glyph_func_t. |
| font_get_empty | `font_get_empty() -> font_t` | hb_font_get_empty | 0.9.2 | Fetches the empty font object. |
| font_get_extents_for_direction | `font_get_extents_for_direction(font: font_t, direction: direction_t, extents: out font_extents_t) -> none` | hb_font_get_extents_for_direction | 1.1.3 | Fetches the extents for a font in a text segment of the specified direction. Calls the appropriate direction-specific variant (horizontal or vertic... |
| font_get_face | `font_get_face(font: font_t) -> face_t` | hb_font_get_face | 0.9.2 | Fetches the face associated with the specified font object. |
| font_get_glyph | `font_get_glyph(font: font_t, unicode: codepoint_t, variation_selector: codepoint_t, glyph: out codepoint_t) -> bool_t` | hb_font_get_glyph | 0.9.2 | Fetches the glyph ID for a Unicode code point in the specified font, with an optional variation selector. If @variation_selector is 0, calls hb_fon... |
| font_get_glyph_advance_for_direction | `font_get_glyph_advance_for_direction(font: font_t, glyph: codepoint_t, direction: direction_t, x: out position_t, y: out position_t) -> none` | hb_font_get_glyph_advance_for_direction | 0.9.2 | Fetches the advance for a glyph ID from the specified font, in a text segment of the specified direction. Calls the appropriate direction-specific ... |
| font_get_glyph_advances_for_direction | `font_get_glyph_advances_for_direction(font: font_t, direction: direction_t, count: guint, first_glyph: codepoint_t, glyph_stride: guint, first_advance: out position_t, advance_stride: out guint) -> none` | hb_font_get_glyph_advances_for_direction | 1.8.6 | Fetches the advances for a sequence of glyph IDs in the specified font, in a text segment of the specified direction. Calls the appropriate directi... |
| font_get_glyph_contour_point | `font_get_glyph_contour_point(font: font_t, glyph: codepoint_t, point_index: guint, x: out position_t, y: out position_t) -> bool_t` | hb_font_get_glyph_contour_point | 0.9.2 | Fetches the (x,y) coordinates of a specified contour-point index in the specified glyph, within the specified font. |
| font_get_glyph_contour_point_for_origin | `font_get_glyph_contour_point_for_origin(font: font_t, glyph: codepoint_t, point_index: guint, direction: direction_t, x: out position_t, y: out position_t) -> bool_t` | hb_font_get_glyph_contour_point_for_origin | 0.9.2 | Fetches the (X,Y) coordinates of a specified contour-point index in the specified glyph ID in the specified font, with respect to the origin in a t... |
| font_get_glyph_extents | `font_get_glyph_extents(font: font_t, glyph: codepoint_t, extents: out glyph_extents_t) -> bool_t` | hb_font_get_glyph_extents | 0.9.2 | Fetches the #hb_glyph_extents_t data for a glyph ID in the specified font. |
| font_get_glyph_extents_for_origin | `font_get_glyph_extents_for_origin(font: font_t, glyph: codepoint_t, direction: direction_t, extents: out glyph_extents_t) -> bool_t` | hb_font_get_glyph_extents_for_origin | 0.9.2 | Fetches the #hb_glyph_extents_t data for a glyph ID in the specified font, with respect to the origin in a text segment in the specified direction.... |
| font_get_glyph_from_name | `font_get_glyph_from_name(font: font_t, name: utf8, len: gint, glyph: out codepoint_t) -> bool_t` | hb_font_get_glyph_from_name | 0.9.2 | Fetches the glyph ID that corresponds to a name string in the specified @font. <note>Note: @len == -1 means the name string is null-terminated.</note> |
| font_get_glyph_h_advance | `font_get_glyph_h_advance(font: font_t, glyph: codepoint_t) -> position_t` | hb_font_get_glyph_h_advance | 0.9.2 | Fetches the advance for a glyph ID in the specified font, for horizontal text segments. |
| font_get_glyph_h_advances | `font_get_glyph_h_advances(font: font_t, count: guint, first_glyph: codepoint_t, glyph_stride: guint, first_advance: out position_t, advance_stride: guint) -> none` | hb_font_get_glyph_h_advances | 1.8.6 | Fetches the advances for a sequence of glyph IDs in the specified font, for horizontal text segments. |
| font_get_glyph_h_kerning | `font_get_glyph_h_kerning(font: font_t, left_glyph: codepoint_t, right_glyph: codepoint_t) -> position_t` | hb_font_get_glyph_h_kerning | 0.9.2 | Fetches the kerning-adjustment value for a glyph-pair in the specified font, for horizontal text segments. <note>It handles legacy kerning only (as... |
| font_get_glyph_h_origin | `font_get_glyph_h_origin(font: font_t, glyph: codepoint_t, x: out position_t, y: out position_t) -> bool_t` | hb_font_get_glyph_h_origin | 0.9.2 | Fetches the (X,Y) coordinates of the origin for a glyph ID in the specified font, for horizontal text segments. |
| font_get_glyph_kerning_for_direction | `font_get_glyph_kerning_for_direction(font: font_t, first_glyph: codepoint_t, second_glyph: codepoint_t, direction: direction_t, x: out position_t, y: out position_t) -> none` | hb_font_get_glyph_kerning_for_direction | 0.9.2 | Fetches the kerning-adjustment value for a glyph-pair in the specified font. Calls the appropriate direction-specific variant (horizontal or vertic... |
| font_get_glyph_name | `font_get_glyph_name(font: font_t, glyph: codepoint_t, name: out utf8, size: out guint) -> bool_t` | hb_font_get_glyph_name | 0.9.2 | Fetches the glyph-name string for a glyph ID in the specified @font. According to the OpenType specification, glyph names are limited to 63 charact... |
| font_get_glyph_origin_for_direction | `font_get_glyph_origin_for_direction(font: font_t, glyph: codepoint_t, direction: direction_t, x: out position_t, y: out position_t) -> none` | hb_font_get_glyph_origin_for_direction | 0.9.2 | Fetches the (X,Y) coordinates of the origin for a glyph in the specified font. Calls the appropriate direction-specific variant (horizontal or vert... |
| font_get_glyph_shape | `font_get_glyph_shape(font: font_t, glyph: codepoint_t, dfuncs: draw_funcs_t, draw_data: gpointer?) -> none` | hb_font_get_glyph_shape | 4.0.0 | Fetches the glyph shape that corresponds to a glyph in the specified @font. The shape is returned by way of calls to the callbacks of the @dfuncs o... |
| font_get_glyph_v_advance | `font_get_glyph_v_advance(font: font_t, glyph: codepoint_t) -> position_t` | hb_font_get_glyph_v_advance | 0.9.2 | Fetches the advance for a glyph ID in the specified font, for vertical text segments. |
| font_get_glyph_v_advances | `font_get_glyph_v_advances(font: font_t, count: guint, first_glyph: codepoint_t, glyph_stride: guint, first_advance: out position_t, advance_stride: out guint) -> none` | hb_font_get_glyph_v_advances | 1.8.6 | Fetches the advances for a sequence of glyph IDs in the specified font, for vertical text segments. |
| font_get_glyph_v_kerning | `font_get_glyph_v_kerning(font: font_t, top_glyph: codepoint_t, bottom_glyph: codepoint_t) -> position_t` | hb_font_get_glyph_v_kerning | 0.9.2 | Fetches the kerning-adjustment value for a glyph-pair in the specified font, for vertical text segments. <note>It handles legacy kerning only (as r... |
| font_get_glyph_v_origin | `font_get_glyph_v_origin(font: font_t, glyph: codepoint_t, x: out position_t, y: out position_t) -> bool_t` | hb_font_get_glyph_v_origin | 0.9.2 | Fetches the (X,Y) coordinates of the origin for a glyph ID in the specified font, for vertical text segments. |
| font_get_h_extents | `font_get_h_extents(font: font_t, extents: out font_extents_t) -> bool_t` | hb_font_get_h_extents | 1.1.3 | Fetches the extents for a specified font, for horizontal text segments. |
| font_get_nominal_glyph | `font_get_nominal_glyph(font: font_t, unicode: codepoint_t, glyph: out codepoint_t) -> bool_t` | hb_font_get_nominal_glyph | 1.2.3 | Fetches the nominal glyph ID for a Unicode code point in the specified font. This version of the function should not be used to fetch glyph IDs for... |
| font_get_nominal_glyphs | `font_get_nominal_glyphs(font: font_t, count: guint, first_unicode: codepoint_t, unicode_stride: guint, first_glyph: out codepoint_t, glyph_stride: guint) -> guint` | hb_font_get_nominal_glyphs | 2.6.3 | Fetches the nominal glyph IDs for a sequence of Unicode code points. Glyph IDs must be returned in a #hb_codepoint_t output parameter. Stops at the... |
| font_get_parent | `font_get_parent(font: font_t) -> font_t` | hb_font_get_parent | 0.9.2 | Fetches the parent font of @font. |
| font_get_ppem | `font_get_ppem(font: font_t, x_ppem: out guint, y_ppem: out guint) -> none` | hb_font_get_ppem | 0.9.2 | Fetches the horizontal and vertical points-per-em (ppem) of a font. |
| font_get_ptem | `font_get_ptem(font: font_t) -> gfloat` | hb_font_get_ptem | 1.6.0 | Fetches the "point size" of a font. Used in CoreText to implement optical sizing. |
| font_get_scale | `font_get_scale(font: font_t, x_scale: out gint, y_scale: out gint) -> none` | hb_font_get_scale | 0.9.2 | Fetches the horizontal and vertical scale of a font. |
| font_get_serial | `font_get_serial(font: font_t) -> guint` | hb_font_get_serial | 4.4.0 | Returns the internal serial number of the font. The serial number is increased every time a setting on the font is changed, using a setter function. |
| font_get_synthetic_bold | `font_get_synthetic_bold(font: font_t, x_embolden: out gfloat, y_embolden: out gfloat, in_place: out bool_t) -> none` | hb_font_get_synthetic_bold | 7.0.0 | Fetches the "synthetic boldness" parameters of a font. |
| font_get_synthetic_slant | `font_get_synthetic_slant(font: font_t) -> gfloat` | hb_font_get_synthetic_slant | 3.3.0 | Fetches the "synthetic slant" of a font. |
| font_get_user_data | `font_get_user_data(font: font_t, key: user_data_key_t) -> gpointer` | hb_font_get_user_data | 0.9.2 | Fetches the user-data object associated with the specified key, attached to the specified font object. |
| font_get_v_extents | `font_get_v_extents(font: font_t, extents: out font_extents_t) -> bool_t` | hb_font_get_v_extents | 1.1.3 | Fetches the extents for a specified font, for vertical text segments. |
| font_get_var_coords_design | `font_get_var_coords_design(font: font_t, length: out guint) -> gfloat` | hb_font_get_var_coords_design | 3.3.0 | Fetches the list of variation coordinates (in design-space units) currently set on a font. Note that this returned array may only contain values fo... |
| font_get_var_coords_normalized | `font_get_var_coords_normalized(font: font_t, length: out guint) -> gint` | hb_font_get_var_coords_normalized | 1.4.2 | Fetches the list of normalized variation coordinates currently set on a font. Note that this returned array may only contain values for some (or no... |
| font_get_var_named_instance | `font_get_var_named_instance(font: font_t) -> guint` | hb_font_get_var_named_instance | 7.0.0 | Returns the currently-set named-instance index of the font. |
| font_get_variation_glyph | `font_get_variation_glyph(font: font_t, unicode: codepoint_t, variation_selector: codepoint_t, glyph: out codepoint_t) -> bool_t` | hb_font_get_variation_glyph | 1.2.3 | Fetches the glyph ID for a Unicode code point when followed by by the specified variation-selector code point, in the specified font. |
| font_glyph_from_string | `font_glyph_from_string(font: font_t, s: guint8, len: gint, glyph: out codepoint_t) -> bool_t` | hb_font_glyph_from_string | 0.9.2 | Fetches the glyph ID from @font that matches the specified string. Strings of the format `gidDDD` or `uniUUUU` are parsed automatically. <note>Note... |
| font_glyph_to_string | `font_glyph_to_string(font: font_t, glyph: codepoint_t, s: out utf8, size: out guint) -> none` | hb_font_glyph_to_string | 0.9.2 | Fetches the name of the specified glyph ID in @font and returns it in string @s. If the glyph ID has no name in @font, a string of the form `gidDDD... |
| font_is_immutable | `font_is_immutable(font: font_t) -> bool_t` | hb_font_is_immutable | 0.9.2 | Tests whether a font object is immutable. |
| font_make_immutable | `font_make_immutable(font: font_t) -> none` | hb_font_make_immutable | 0.9.2 | Makes @font immutable. |
| font_paint_glyph | `font_paint_glyph(font: font_t, glyph: codepoint_t, pfuncs: paint_funcs_t, paint_data: gpointer?, palette_index: guint, foreground: color_t) -> none` | hb_font_paint_glyph | 7.0.0 | Paints the glyph. The painting instructions are returned by way of calls to the callbacks of the @funcs object, with @paint_data passed to them. If... |
| font_reference | `font_reference(font: font_t) -> font_t` | hb_font_reference | 0.9.2 | Increases the reference count on the given font object. |
| font_set_face | `font_set_face(font: font_t, face: face_t) -> none` | hb_font_set_face | 1.4.3 | Sets @face as the font-face value of @font. |
| font_set_funcs | `font_set_funcs(font: font_t, klass: font_funcs_t, font_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_set_funcs | 0.9.2 | Replaces the font-functions structure attached to a font, updating the font's user-data with @font-data and the @destroy callback. |
| font_set_funcs_data | `font_set_funcs_data(font: font_t, font_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_font_set_funcs_data | 0.9.2 | Replaces the user data attached to a font, updating the font's @destroy callback. |
| font_set_parent | `font_set_parent(font: font_t, parent: font_t) -> none` | hb_font_set_parent | 1.0.5 | Sets the parent font of @font. |
| font_set_ppem | `font_set_ppem(font: font_t, x_ppem: guint, y_ppem: guint) -> none` | hb_font_set_ppem | 0.9.2 | Sets the horizontal and vertical pixels-per-em (PPEM) of a font. These values are used for pixel-size-specific adjustment to shaping and draw resul... |
| font_set_ptem | `font_set_ptem(font: font_t, ptem: gfloat) -> none` | hb_font_set_ptem | 1.6.0 | Sets the "point size" of a font. Set to zero to unset. Used in CoreText to implement optical sizing. <note>Note: There are 72 points in an inch.</n... |
| font_set_scale | `font_set_scale(font: font_t, x_scale: gint, y_scale: gint) -> none` | hb_font_set_scale | 0.9.2 | Sets the horizontal and vertical scale of a font. The font scale is a number related to, but not the same as, font size. Typically the client estab... |
| font_set_synthetic_bold | `font_set_synthetic_bold(font: font_t, x_embolden: gfloat, y_embolden: gfloat, in_place: bool_t) -> none` | hb_font_set_synthetic_bold | 7.0.0 | Sets the "synthetic boldness" of a font. Positive values for @x_embolden / @y_embolden make a font bolder, negative values thinner. Typical values ... |
| font_set_synthetic_slant | `font_set_synthetic_slant(font: font_t, slant: gfloat) -> none` | hb_font_set_synthetic_slant | 3.3.0 | Sets the "synthetic slant" of a font. By default is zero. Synthetic slant is the graphical skew applied to the font at rendering time. HarfBuzz nee... |
| font_set_user_data | `font_set_user_data(font: font_t, key: user_data_key_t, data: gpointer?, destroy: destroy_func_t?, replace: bool_t) -> bool_t` | hb_font_set_user_data | 0.9.2 | Attaches a user-data key/data pair to the specified font object. |
| font_set_var_coords_design | `font_set_var_coords_design(font: font_t, coords: gfloat, coords_length: guint) -> none` | hb_font_set_var_coords_design | 1.4.2 | Applies a list of variation coordinates (in design-space units) to a font. Note that this overrides all existing variations set on @font. Axes not ... |
| font_set_var_coords_normalized | `font_set_var_coords_normalized(font: font_t, coords: gint, coords_length: guint) -> none` | hb_font_set_var_coords_normalized | 1.4.2 | Applies a list of variation coordinates (in normalized units) to a font. Note that this overrides all existing variations set on @font. Axes not in... |
| font_set_var_named_instance | `font_set_var_named_instance(font: font_t, instance_index: guint) -> none` | hb_font_set_var_named_instance | 2.6.0 | Sets design coords of a font from a named-instance index. |
| font_set_variation | `font_set_variation(font: font_t, tag: tag_t, value: gfloat) -> none` | hb_font_set_variation | 7.1.0 | Change the value of one variation axis on the font. Note: This function is expensive to be called repeatedly. If you want to set multiple variation... |
| font_set_variations | `font_set_variations(font: font_t, variations: variation_t, variations_length: guint) -> none` | hb_font_set_variations | 1.4.2 | Applies a list of font-variation settings to a font. Note that this overrides all existing variations set on @font. Axes not included in @variation... |
| font_subtract_glyph_origin_for_direction | `font_subtract_glyph_origin_for_direction(font: font_t, glyph: codepoint_t, direction: direction_t, x: inout position_t, y: inout position_t) -> none` | hb_font_subtract_glyph_origin_for_direction | 0.9.2 | Subtracts the origin coordinates from an (X,Y) point coordinate, in the specified glyph ID in the specified font. Calls the appropriate direction-s... |
| ft_face_create | `ft_face_create(ft_face: freetype2.Face, destroy: destroy_func_t?) -> face_t` | hb_ft_face_create | 0.9.2 | Creates an #hb_face_t face object from the specified FT_Face. Note that this is using the FT_Face object just to get at the underlying font data, a... |
| ft_face_create_cached | `ft_face_create_cached(ft_face: freetype2.Face) -> face_t` | hb_ft_face_create_cached | 0.9.2 | Creates an #hb_face_t face object from the specified FT_Face. Note that this is using the FT_Face object just to get at the underlying font data, a... |
| ft_face_create_referenced | `ft_face_create_referenced(ft_face: freetype2.Face) -> face_t` | hb_ft_face_create_referenced | 0.9.38 | Creates an #hb_face_t face object from the specified FT_Face. Note that this is using the FT_Face object just to get at the underlying font data, a... |
| ft_font_changed | `ft_font_changed(font: font_t) -> none` | hb_ft_font_changed | 1.0.5 | Refreshes the state of @font when the underlying FT_Face has changed. This function should be called after changing the size or variation-axis sett... |
| ft_font_create | `ft_font_create(ft_face: freetype2.Face, destroy: destroy_func_t?) -> font_t` | hb_ft_font_create | 0.9.2 | Creates an #hb_font_t font object from the specified FT_Face. <note>Note: You must set the face size on @ft_face before calling hb_ft_font_create()... |
| ft_font_create_referenced | `ft_font_create_referenced(ft_face: freetype2.Face) -> font_t` | hb_ft_font_create_referenced | 0.9.38 | Creates an #hb_font_t font object from the specified FT_Face. <note>Note: You must set the face size on @ft_face before calling hb_ft_font_create_r... |
| ft_font_get_face | `ft_font_get_face(font: font_t) -> freetype2.Face` | hb_ft_font_get_face | 0.9.2 | Fetches the FT_Face associated with the specified #hb_font_t font object. This function works with #hb_font_t objects created by hb_ft_font_create(... |
| ft_font_get_load_flags | `ft_font_get_load_flags(font: font_t) -> gint` | hb_ft_font_get_load_flags | 1.0.5 | Fetches the FT_Load_Glyph load flags of the specified #hb_font_t. For more information, see <https://freetype.org/freetype2/docs/reference/ft2-glyp... |
| ft_font_lock_face | `ft_font_lock_face(font: font_t) -> freetype2.Face` | hb_ft_font_lock_face | 2.6.5 | Gets the FT_Face associated with @font. This face will be kept around and access to the FT_Face object from other HarfBuzz API wil be blocked until... |
| ft_font_set_funcs | `ft_font_set_funcs(font: font_t) -> none` | hb_ft_font_set_funcs | 1.0.5 | Configures the font-functions structure of the specified #hb_font_t font object to use FreeType font functions. In particular, you can use this fun... |
| ft_font_set_load_flags | `ft_font_set_load_flags(font: font_t, load_flags: gint) -> none` | hb_ft_font_set_load_flags | 1.0.5 | Sets the FT_Load_Glyph load flags for the specified #hb_font_t. For more information, see <https://freetype.org/freetype2/docs/reference/ft2-glyph_... |
| ft_font_unlock_face | `ft_font_unlock_face(font: font_t) -> none` | hb_ft_font_unlock_face | 2.6.5 | Releases an FT_Face previously obtained with hb_ft_font_lock_face(). |
| ft_hb_font_changed | `ft_hb_font_changed(font: font_t) -> bool_t` | hb_ft_hb_font_changed | 4.4.0 | Refreshes the state of the underlying FT_Face of @font when the hb_font_t @font has changed. This function should be called after changing the size... |
| glib_blob_create | `glib_blob_create(gbytes: GLib.Bytes) -> blob_t` | hb_glib_blob_create | 0.9.38 | Creates an #hb_blob_t blob from the specified GBytes data structure. |
| glib_get_unicode_funcs | `glib_get_unicode_funcs() -> unicode_funcs_t` | hb_glib_get_unicode_funcs | 0.9.38 | Fetches a Unicode-functions structure that is populated with the appropriate GLib function for each method. |
| glib_script_from_script | `glib_script_from_script(script: script_t) -> GLib.UnicodeScript` | hb_glib_script_from_script | 0.9.38 | Fetches the GUnicodeScript identifier that corresponds to the specified #hb_script_t script. |
| glib_script_to_script | `glib_script_to_script(script: GLib.UnicodeScript) -> script_t` | hb_glib_script_to_script | 0.9.38 | Fetches the #hb_script_t script that corresponds to the specified GUnicodeScript identifier. |
| glyph_info_get_glyph_flags | `glyph_info_get_glyph_flags(info: glyph_info_t) -> glyph_flags_t` | hb_glyph_info_get_glyph_flags | 1.5.0 | Returns glyph flags encoded within a #hb_glyph_info_t. |
| language_from_string | `language_from_string(str: guint8, len: gint) -> language_t` | hb_language_from_string | 0.9.2 | Converts @str representing a BCP 47 language tag to the corresponding #hb_language_t. |
| language_get_default | `language_get_default() -> language_t` | hb_language_get_default | 0.9.2 | Fetch the default language from current locale. <note>Note that the first time this function is called, it calls "setlocale (LC_CTYPE, nullptr)" to... |
| language_matches | `language_matches(language: language_t, specific: language_t) -> bool_t` | hb_language_matches | 5.0.0 | Check whether a second language tag is the same or a more specific version of the provided language tag. For example, "fa_IR.utf8" is a more specif... |
| language_to_string | `language_to_string(language: language_t) -> utf8` | hb_language_to_string | 0.9.2 | Converts an #hb_language_t to a string. |
| map_allocation_successful | `map_allocation_successful(map: map_t) -> bool_t` | hb_map_allocation_successful | 1.7.7 | Tests whether memory allocation for a set was successful. |
| map_clear | `map_clear(map: map_t) -> none` | hb_map_clear | 1.7.7 | Clears out the contents of @map. |
| map_copy | `map_copy(map: map_t) -> map_t` | hb_map_copy | 4.4.0 | Allocate a copy of @map. |
| map_create | `map_create() -> map_t` | hb_map_create | 1.7.7 | Creates a new, initially empty map. |
| map_del | `map_del(map: map_t, key: codepoint_t) -> none` | hb_map_del | 1.7.7 | Removes @key and its stored value from @map. |
| map_destroy | `map_destroy(map: map_t) -> none` | hb_map_destroy | 1.7.7 | Decreases the reference count on a map. When the reference count reaches zero, the map is destroyed, freeing all memory. |
| map_get | `map_get(map: map_t, key: codepoint_t) -> codepoint_t` | hb_map_get | 1.7.7 | Fetches the value stored for @key in @map. |
| map_get_empty | `map_get_empty() -> map_t` | hb_map_get_empty | 1.7.7 | Fetches the singleton empty #hb_map_t. |
| map_get_population | `map_get_population(map: map_t) -> guint` | hb_map_get_population | 1.7.7 | Returns the number of key-value pairs in the map. |
| map_get_user_data | `map_get_user_data(map: map_t, key: user_data_key_t) -> gpointer` | hb_map_get_user_data | 1.7.7 | Fetches the user data associated with the specified key, attached to the specified map. |
| map_has | `map_has(map: map_t, key: codepoint_t) -> bool_t` | hb_map_has | 1.7.7 | Tests whether @key is an element of @map. |
| map_hash | `map_hash(map: map_t) -> guint` | hb_map_hash | 4.4.0 | Creates a hash representing @map. |
| map_is_empty | `map_is_empty(map: map_t) -> bool_t` | hb_map_is_empty | 1.7.7 | Tests whether @map is empty (contains no elements). |
| map_is_equal | `map_is_equal(map: map_t, other: map_t) -> bool_t` | hb_map_is_equal | 4.3.0 | Tests whether @map and @other are equal (contain the same elements). |
| map_keys | `map_keys(map: map_t, keys: set_t) -> none` | hb_map_keys | 7.0.0 | Add the keys of @map to @keys. |
| map_next | `map_next(map: map_t, idx: inout gint, key: out codepoint_t, value: out codepoint_t) -> bool_t` | hb_map_next | 7.0.0 | Fetches the next key/value pair in @map. Set @idx to -1 to get started. If the map is modified during iteration, the behavior is undefined. The ord... |
| map_reference | `map_reference(map: map_t) -> map_t` | hb_map_reference | 1.7.7 | Increases the reference count on a map. |
| map_set | `map_set(map: map_t, key: codepoint_t, value: codepoint_t) -> none` | hb_map_set | 1.7.7 | Stores @key:@value in the map. |
| map_set_user_data | `map_set_user_data(map: map_t, key: user_data_key_t, data: gpointer?, destroy: destroy_func_t?, replace: bool_t) -> bool_t` | hb_map_set_user_data | 1.7.7 | Attaches a user-data key/data pair to the specified map. |
| map_update | `map_update(map: map_t, other: map_t) -> none` | hb_map_update | 7.0.0 | Add the contents of @other to @map. |
| map_values | `map_values(map: map_t, values: set_t) -> none` | hb_map_values | 7.0.0 | Add the values of @map to @values. |
| ot_color_glyph_get_layers | `ot_color_glyph_get_layers(face: face_t, glyph: codepoint_t, start_offset: guint, layer_count: out guint?, layers: out ot_color_layer_t?) -> guint` | hb_ot_color_glyph_get_layers | 2.1.0 | Fetches a list of all color layers for the specified glyph index in the specified face. The list returned will begin at the offset provided. |
| ot_color_glyph_has_paint | `ot_color_glyph_has_paint(face: face_t, glyph: codepoint_t) -> bool_t` | hb_ot_color_glyph_has_paint | 7.0.0 | Tests where a face includes COLRv1 paint data for @glyph. |
| ot_color_glyph_reference_png | `ot_color_glyph_reference_png(font: font_t, glyph: codepoint_t) -> blob_t` | hb_ot_color_glyph_reference_png | 2.1.0 | Fetches the PNG image for a glyph. This function takes a font object, not a face object, as input. To get an optimally sized PNG blob, the PPEM val... |
| ot_color_glyph_reference_svg | `ot_color_glyph_reference_svg(face: face_t, glyph: codepoint_t) -> blob_t` | hb_ot_color_glyph_reference_svg | 2.1.0 | Fetches the SVG document for a glyph. The blob may be either plain text or gzip-encoded. If the glyph has no SVG document, the singleton empty blob... |
| ot_color_has_layers | `ot_color_has_layers(face: face_t) -> bool_t` | hb_ot_color_has_layers | 2.1.0 | Tests whether a face includes a `COLR` table with data according to COLRv0. |
| ot_color_has_paint | `ot_color_has_paint(face: face_t) -> bool_t` | hb_ot_color_has_paint | 7.0.0 | Tests where a face includes a `COLR` table with data according to COLRv1. |
| ot_color_has_palettes | `ot_color_has_palettes(face: face_t) -> bool_t` | hb_ot_color_has_palettes | 2.1.0 | Tests whether a face includes a `CPAL` color-palette table. |
| ot_color_has_png | `ot_color_has_png(face: face_t) -> bool_t` | hb_ot_color_has_png | 2.1.0 | Tests whether a face has PNG glyph images (either in `CBDT` or `sbix` tables). |
| ot_color_has_svg | `ot_color_has_svg(face: face_t) -> bool_t` | hb_ot_color_has_svg | 2.1.0 | Tests whether a face includes any `SVG` glyph images. |
| ot_color_palette_color_get_name_id | `ot_color_palette_color_get_name_id(face: face_t, color_index: guint) -> ot_name_id_t` | hb_ot_color_palette_color_get_name_id | 2.1.0 | Fetches the `name` table Name ID that provides display names for the specified color in a face's `CPAL` color palette. Display names can be generic... |
| ot_color_palette_get_colors | `ot_color_palette_get_colors(face: face_t, palette_index: guint, start_offset: guint, color_count: out guint?, colors: out color_t?) -> guint` | hb_ot_color_palette_get_colors | 2.1.0 | Fetches a list of the colors in a color palette. After calling this function, @colors will be filled with the palette colors. If @colors is NULL, t... |
| ot_color_palette_get_count | `ot_color_palette_get_count(face: face_t) -> guint` | hb_ot_color_palette_get_count | 2.1.0 | Fetches the number of color palettes in a face. |
| ot_color_palette_get_flags | `ot_color_palette_get_flags(face: face_t, palette_index: guint) -> ot_color_palette_flags_t` | hb_ot_color_palette_get_flags | 2.1.0 | Fetches the flags defined for a color palette. |
| ot_color_palette_get_name_id | `ot_color_palette_get_name_id(face: face_t, palette_index: guint) -> ot_name_id_t` | hb_ot_color_palette_get_name_id | 2.1.0 | Fetches the `name` table Name ID that provides display names for a `CPAL` color palette. Palette display names can be generic (e.g., "Default") or ... |
| ot_font_set_funcs | `ot_font_set_funcs(font: font_t) -> none` | hb_ot_font_set_funcs | 0.9.28 | Sets the font functions to use when working with @font. |
| ot_layout_collect_features | `ot_layout_collect_features(face: face_t, table_tag: tag_t, scripts: tag_t?, languages: tag_t?, features: tag_t?, feature_indexes: out set_t) -> none` | hb_ot_layout_collect_features | 1.8.5 | Fetches a list of all feature indexes in the specified face's GSUB table or GPOS table, underneath the specified scripts, languages, and features. ... |
| ot_layout_collect_features_map | `ot_layout_collect_features_map(face: face_t, table_tag: tag_t, script_index: guint, language_index: guint, feature_map: out map_t) -> none` | hb_ot_layout_collect_features_map | 8.1.0 | Fetches the mapping from feature tags to feature indexes for the specified script and language. |
| ot_layout_collect_lookups | `ot_layout_collect_lookups(face: face_t, table_tag: tag_t, scripts: tag_t?, languages: tag_t?, features: tag_t?, lookup_indexes: out set_t) -> none` | hb_ot_layout_collect_lookups | 0.9.8 | Fetches a list of all feature-lookup indexes in the specified face's GSUB table or GPOS table, underneath the specified scripts, languages, and fea... |
| ot_layout_feature_get_characters | `ot_layout_feature_get_characters(face: face_t, table_tag: tag_t, feature_index: guint, start_offset: guint, char_count: out guint?, characters: out codepoint_t) -> guint` | hb_ot_layout_feature_get_characters | 2.0.0 | Fetches a list of the characters defined as having a variant under the specified "Character Variant" ("cvXX") feature tag. |
| ot_layout_feature_get_lookups | `ot_layout_feature_get_lookups(face: face_t, table_tag: tag_t, feature_index: guint, start_offset: guint, lookup_count: out guint?, lookup_indexes: out guint) -> guint` | hb_ot_layout_feature_get_lookups | 0.9.7 | Fetches a list of all lookups enumerated for the specified feature, in the specified face's GSUB table or GPOS table. The list returned will begin ... |
| ot_layout_feature_get_name_ids | `ot_layout_feature_get_name_ids(face: face_t, table_tag: tag_t, feature_index: guint, label_id: out ot_name_id_t?, tooltip_id: out ot_name_id_t?, sample_id: out ot_name_id_t?, num_named_parameters: out guint?, first_param_id: out ot_name_id_t?) -> bool_t` | hb_ot_layout_feature_get_name_ids | 2.0.0 | Fetches name indices from feature parameters for "Stylistic Set" ('ssXX') or "Character Variant" ('cvXX') features. |
| ot_layout_feature_with_variations_get_lookups | `ot_layout_feature_with_variations_get_lookups(face: face_t, table_tag: tag_t, feature_index: guint, variations_index: guint, start_offset: guint, lookup_count: out guint?, lookup_indexes: out guint) -> guint` | hb_ot_layout_feature_with_variations_get_lookups | 1.4.0 | Fetches a list of all lookups enumerated for the specified feature, in the specified face's GSUB table or GPOS table, enabled at the specified vari... |
| ot_layout_get_attach_points | `ot_layout_get_attach_points(face: face_t, glyph: codepoint_t, start_offset: guint, point_count: out guint?, point_array: out guint) -> guint` | hb_ot_layout_get_attach_points |  | Fetches a list of all attachment points for the specified glyph in the GDEF table of the face. The list returned will begin at the offset provided.... |
| ot_layout_get_baseline | `ot_layout_get_baseline(font: font_t, baseline_tag: ot_layout_baseline_tag_t, direction: direction_t, script_tag: tag_t, language_tag: tag_t, coord: out position_t?) -> bool_t` | hb_ot_layout_get_baseline | 2.6.0 | Fetches a baseline value from the face. |
| ot_layout_get_baseline2 | `ot_layout_get_baseline2(font: font_t, baseline_tag: ot_layout_baseline_tag_t, direction: direction_t, script: script_t, language: language_t?, coord: out position_t?) -> bool_t` | hb_ot_layout_get_baseline2 | 8.0.0 | Fetches a baseline value from the face. This function is like hb_ot_layout_get_baseline() but takes #hb_script_t and #hb_language_t instead of Open... |
| ot_layout_get_baseline_with_fallback | `ot_layout_get_baseline_with_fallback(font: font_t, baseline_tag: ot_layout_baseline_tag_t, direction: direction_t, script_tag: tag_t, language_tag: tag_t, coord: out position_t) -> none` | hb_ot_layout_get_baseline_with_fallback | 4.0.0 | Fetches a baseline value from the face, and synthesizes it if the font does not have it. |
| ot_layout_get_baseline_with_fallback2 | `ot_layout_get_baseline_with_fallback2(font: font_t, baseline_tag: ot_layout_baseline_tag_t, direction: direction_t, script: script_t, language: language_t?, coord: out position_t) -> none` | hb_ot_layout_get_baseline_with_fallback2 | 8.0.0 | Fetches a baseline value from the face, and synthesizes it if the font does not have it. This function is like hb_ot_layout_get_baseline_with_fallb... |
| ot_layout_get_font_extents | `ot_layout_get_font_extents(font: font_t, direction: direction_t, script_tag: tag_t, language_tag: tag_t, extents: out font_extents_t?) -> bool_t` | hb_ot_layout_get_font_extents | 8.0.0 | Fetches script/language-specific font extents. These values are looked up in the `BASE` table's `MinMax` records. If no such extents are found, the... |
| ot_layout_get_font_extents2 | `ot_layout_get_font_extents2(font: font_t, direction: direction_t, script: script_t, language: language_t?, extents: out font_extents_t?) -> bool_t` | hb_ot_layout_get_font_extents2 | 8.0.0 | Fetches script/language-specific font extents. These values are looked up in the `BASE` table's `MinMax` records. If no such extents are found, the... |
| ot_layout_get_glyph_class | `ot_layout_get_glyph_class(face: face_t, glyph: codepoint_t) -> ot_layout_glyph_class_t` | hb_ot_layout_get_glyph_class | 0.9.7 | Fetches the GDEF class of the requested glyph in the specified face. |
| ot_layout_get_glyphs_in_class | `ot_layout_get_glyphs_in_class(face: face_t, klass: ot_layout_glyph_class_t, glyphs: out set_t) -> none` | hb_ot_layout_get_glyphs_in_class | 0.9.7 | Retrieves the set of all glyphs from the face that belong to the requested glyph class in the face's GDEF table. |
| ot_layout_get_horizontal_baseline_tag_for_script | `ot_layout_get_horizontal_baseline_tag_for_script(script: script_t) -> ot_layout_baseline_tag_t` | hb_ot_layout_get_horizontal_baseline_tag_for_script | 4.0.0 | Fetches the dominant horizontal baseline tag used by @script. |
| ot_layout_get_ligature_carets | `ot_layout_get_ligature_carets(font: font_t, direction: direction_t, glyph: codepoint_t, start_offset: guint, caret_count: out guint?, caret_array: out position_t) -> guint` | hb_ot_layout_get_ligature_carets |  | Fetches a list of the caret positions defined for a ligature glyph in the GDEF table of the font. The list returned will begin at the offset provid... |
| ot_layout_get_size_params | `ot_layout_get_size_params(face: face_t, design_size: out guint, subfamily_id: out guint, subfamily_name_id: out ot_name_id_t, range_start: out guint, range_end: out guint) -> bool_t` | hb_ot_layout_get_size_params | 0.9.10 | Fetches optical-size feature data (i.e., the `size` feature from GPOS). Note that the subfamily_id and the subfamily name string (accessible via th... |
| ot_layout_has_glyph_classes | `ot_layout_has_glyph_classes(face: face_t) -> bool_t` | hb_ot_layout_has_glyph_classes |  | Tests whether a face has any glyph classes defined in its GDEF table. |
| ot_layout_has_positioning | `ot_layout_has_positioning(face: face_t) -> bool_t` | hb_ot_layout_has_positioning |  | Tests whether the specified face includes any GPOS positioning. |
| ot_layout_has_substitution | `ot_layout_has_substitution(face: face_t) -> bool_t` | hb_ot_layout_has_substitution | 0.6.0 | Tests whether the specified face includes any GSUB substitutions. |
| ot_layout_language_find_feature | `ot_layout_language_find_feature(face: face_t, table_tag: tag_t, script_index: guint, language_index: guint, feature_tag: tag_t, feature_index: out guint) -> bool_t` | hb_ot_layout_language_find_feature | 0.6.0 | Fetches the index of a given feature tag in the specified face's GSUB table or GPOS table, underneath the specified script and language. |
| ot_layout_language_get_feature_indexes | `ot_layout_language_get_feature_indexes(face: face_t, table_tag: tag_t, script_index: guint, language_index: guint, start_offset: guint, feature_count: out guint?, feature_indexes: out guint) -> guint` | hb_ot_layout_language_get_feature_indexes | 0.6.0 | Fetches a list of all features in the specified face's GSUB table or GPOS table, underneath the specified script and language. The list returned wi... |
| ot_layout_language_get_feature_tags | `ot_layout_language_get_feature_tags(face: face_t, table_tag: tag_t, script_index: guint, language_index: guint, start_offset: guint, feature_count: out guint?, feature_tags: out tag_t) -> guint` | hb_ot_layout_language_get_feature_tags | 0.6.0 | Fetches a list of all features in the specified face's GSUB table or GPOS table, underneath the specified script and language. The list returned wi... |
| ot_layout_language_get_required_feature | `ot_layout_language_get_required_feature(face: face_t, table_tag: tag_t, script_index: guint, language_index: guint, feature_index: out guint, feature_tag: out tag_t) -> bool_t` | hb_ot_layout_language_get_required_feature | 0.9.30 | Fetches the tag of a requested feature index in the given face's GSUB or GPOS table, underneath the specified script and language. |
| ot_layout_language_get_required_feature_index | `ot_layout_language_get_required_feature_index(face: face_t, table_tag: tag_t, script_index: guint, language_index: guint, feature_index: out guint) -> bool_t` | hb_ot_layout_language_get_required_feature_index | 0.6.0 | Fetches the index of a requested feature in the given face's GSUB or GPOS table, underneath the specified script and language. |
| ot_layout_lookup_collect_glyphs | `ot_layout_lookup_collect_glyphs(face: face_t, table_tag: tag_t, lookup_index: guint, glyphs_before: out set_t, glyphs_input: out set_t, glyphs_after: out set_t, glyphs_output: out set_t) -> none` | hb_ot_layout_lookup_collect_glyphs | 0.9.7 | Fetches a list of all glyphs affected by the specified lookup in the specified face's GSUB table or GPOS table. |
| ot_layout_lookup_get_glyph_alternates | `ot_layout_lookup_get_glyph_alternates(face: face_t, lookup_index: guint, glyph: codepoint_t, start_offset: guint, alternate_count: out guint?, alternate_glyphs: out codepoint_t) -> guint` | hb_ot_layout_lookup_get_glyph_alternates | 2.6.8 | Fetches alternates of a glyph from a given GSUB lookup index. |
| ot_layout_lookup_get_optical_bound | `ot_layout_lookup_get_optical_bound(font: font_t, lookup_index: guint, direction: direction_t, glyph: codepoint_t) -> position_t` | hb_ot_layout_lookup_get_optical_bound | 5.3.0 | Fetches the optical bound of a glyph positioned at the margin of text. The direction identifies which edge of the glyph to query. |
| ot_layout_lookup_substitute_closure | `ot_layout_lookup_substitute_closure(face: face_t, lookup_index: guint, glyphs: out set_t) -> none` | hb_ot_layout_lookup_substitute_closure | 0.9.7 | Compute the transitive closure of glyphs needed for a specified lookup. |
| ot_layout_lookup_would_substitute | `ot_layout_lookup_would_substitute(face: face_t, lookup_index: guint, glyphs: codepoint_t, glyphs_length: guint, zero_context: bool_t) -> bool_t` | hb_ot_layout_lookup_would_substitute | 0.9.7 | Tests whether a specified lookup in the specified face would trigger a substitution on the given glyph sequence. |
| ot_layout_lookups_substitute_closure | `ot_layout_lookups_substitute_closure(face: face_t, lookups: set_t, glyphs: out set_t) -> none` | hb_ot_layout_lookups_substitute_closure | 1.8.1 | Compute the transitive closure of glyphs needed for all of the provided lookups. |
| ot_layout_script_find_language | `ot_layout_script_find_language(face: face_t, table_tag: tag_t, script_index: guint, language_tag: tag_t, language_index: guint) -> bool_t` | hb_ot_layout_script_find_language | 0.6.0 | Fetches the index of a given language tag in the specified face's GSUB table or GPOS table, underneath the specified script tag. |
| ot_layout_script_get_language_tags | `ot_layout_script_get_language_tags(face: face_t, table_tag: tag_t, script_index: guint, start_offset: guint, language_count: out guint?, language_tags: out tag_t) -> guint` | hb_ot_layout_script_get_language_tags | 0.6.0 | Fetches a list of language tags in the given face's GSUB or GPOS table, underneath the specified script index. The list returned will begin at the ... |
| ot_layout_script_select_language | `ot_layout_script_select_language(face: face_t, table_tag: tag_t, script_index: guint, language_count: guint, language_tags: tag_t, language_index: out guint) -> bool_t` | hb_ot_layout_script_select_language | 2.0.0 | Fetches the index of the first language tag fom @language_tags that is present in the specified face's GSUB or GPOS table, underneath the specified... |
| ot_layout_script_select_language2 | `ot_layout_script_select_language2(face: face_t, table_tag: tag_t, script_index: guint, language_count: guint, language_tags: tag_t, language_index: out guint, chosen_language: out tag_t) -> bool_t` | hb_ot_layout_script_select_language2 | 7.0.0 | Fetches the index of the first language tag fom @language_tags that is present in the specified face's GSUB or GPOS table, underneath the specified... |
| ot_layout_table_choose_script | `ot_layout_table_choose_script(face: face_t, table_tag: tag_t, script_tags: tag_t, script_index: out guint, chosen_script: out tag_t) -> bool_t` | hb_ot_layout_table_choose_script |  | Deprecated since 2.0.0 |
| ot_layout_table_find_feature_variations | `ot_layout_table_find_feature_variations(face: face_t, table_tag: tag_t, coords: gint, num_coords: guint, variations_index: out guint) -> bool_t` | hb_ot_layout_table_find_feature_variations | 1.4.0 | Fetches a list of feature variations in the specified face's GSUB table or GPOS table, at the specified variation coordinates. |
| ot_layout_table_find_script | `ot_layout_table_find_script(face: face_t, table_tag: tag_t, script_tag: tag_t, script_index: out guint) -> bool_t` | hb_ot_layout_table_find_script |  | Fetches the index if a given script tag in the specified face's GSUB table or GPOS table. |
| ot_layout_table_get_feature_tags | `ot_layout_table_get_feature_tags(face: face_t, table_tag: tag_t, start_offset: guint, feature_count: out guint?, feature_tags: out tag_t) -> guint` | hb_ot_layout_table_get_feature_tags | 0.6.0 | Fetches a list of all feature tags in the given face's GSUB or GPOS table. Note that there might be duplicate feature tags, belonging to different ... |
| ot_layout_table_get_lookup_count | `ot_layout_table_get_lookup_count(face: face_t, table_tag: tag_t) -> guint` | hb_ot_layout_table_get_lookup_count | 0.9.22 | Fetches the total number of lookups enumerated in the specified face's GSUB table or GPOS table. |
| ot_layout_table_get_script_tags | `ot_layout_table_get_script_tags(face: face_t, table_tag: tag_t, start_offset: guint, script_count: out guint?, script_tags: out tag_t) -> guint` | hb_ot_layout_table_get_script_tags |  | Fetches a list of all scripts enumerated in the specified face's GSUB table or GPOS table. The list returned will begin at the offset provided. |
| ot_layout_table_select_script | `ot_layout_table_select_script(face: face_t, table_tag: tag_t, script_count: guint, script_tags: tag_t, script_index: out guint?, chosen_script: out tag_t?) -> bool_t` | hb_ot_layout_table_select_script | 2.0.0 | Selects an OpenType script for @table_tag from the @script_tags array. If the table does not have any of the requested scripts, then `DFLT`, `dflt`... |
| ot_math_get_constant | `ot_math_get_constant(font: font_t, constant: ot_math_constant_t) -> position_t` | hb_ot_math_get_constant | 1.3.3 | Fetches the specified math constant. For most constants, the value returned is an #hb_position_t. However, if the requested constant is #HB_OT_MATH... |
| ot_math_get_glyph_assembly | `ot_math_get_glyph_assembly(font: font_t, glyph: codepoint_t, direction: direction_t, start_offset: guint, parts_count: out guint, parts: out ot_math_glyph_part_t, italics_correction: out position_t) -> guint` | hb_ot_math_get_glyph_assembly | 1.3.3 | Fetches the GlyphAssembly for the specified font, glyph index, and direction. Returned are a list of #hb_ot_math_glyph_part_t glyph parts that can ... |
| ot_math_get_glyph_italics_correction | `ot_math_get_glyph_italics_correction(font: font_t, glyph: codepoint_t) -> position_t` | hb_ot_math_get_glyph_italics_correction | 1.3.3 | Fetches an italics-correction value (if one exists) for the specified glyph index. |
| ot_math_get_glyph_kerning | `ot_math_get_glyph_kerning(font: font_t, glyph: codepoint_t, kern: ot_math_kern_t, correction_height: position_t) -> position_t` | hb_ot_math_get_glyph_kerning | 1.3.3 | Fetches the math kerning (cut-ins) value for the specified font, glyph index, and @kern. If the MathKern table is found, the function examines it t... |
| ot_math_get_glyph_kernings | `ot_math_get_glyph_kernings(font: font_t, glyph: codepoint_t, kern: ot_math_kern_t, start_offset: guint, entries_count: out guint?, kern_entries: out ot_math_kern_entry_t) -> guint` | hb_ot_math_get_glyph_kernings | 3.4.0 | Fetches the raw MathKern (cut-in) data for the specified font, glyph index, and @kern. The corresponding list of kern values and correction heights... |
| ot_math_get_glyph_top_accent_attachment | `ot_math_get_glyph_top_accent_attachment(font: font_t, glyph: codepoint_t) -> position_t` | hb_ot_math_get_glyph_top_accent_attachment | 1.3.3 | Fetches a top-accent-attachment value (if one exists) for the specified glyph index. For any glyph that does not have a top-accent-attachment value... |
| ot_math_get_glyph_variants | `ot_math_get_glyph_variants(font: font_t, glyph: codepoint_t, direction: direction_t, start_offset: guint, variants_count: out guint, variants: out ot_math_glyph_variant_t) -> guint` | hb_ot_math_get_glyph_variants | 1.3.3 | Fetches the MathGlyphConstruction for the specified font, glyph index, and direction. The corresponding list of size variants is returned as a list... |
| ot_math_get_min_connector_overlap | `ot_math_get_min_connector_overlap(font: font_t, direction: direction_t) -> position_t` | hb_ot_math_get_min_connector_overlap | 1.3.3 | Fetches the MathVariants table for the specified font and returns the minimum overlap of connecting glyphs that are required to draw a glyph assemb... |
| ot_math_has_data | `ot_math_has_data(face: face_t) -> bool_t` | hb_ot_math_has_data | 1.3.3 | Tests whether a face has a `MATH` table. |
| ot_math_is_glyph_extended_shape | `ot_math_is_glyph_extended_shape(face: face_t, glyph: codepoint_t) -> bool_t` | hb_ot_math_is_glyph_extended_shape | 1.3.3 | Tests whether the given glyph index is an extended shape in the face. |
| ot_meta_get_entry_tags | `ot_meta_get_entry_tags(face: face_t, start_offset: guint, entries_count: out guint?, entries: out ot_meta_tag_t) -> guint` | hb_ot_meta_get_entry_tags | 2.6.0 | Fetches all available feature types. |
| ot_meta_reference_entry | `ot_meta_reference_entry(face: face_t, meta_tag: ot_meta_tag_t) -> blob_t` | hb_ot_meta_reference_entry | 2.6.0 | It fetches metadata entry of a given tag from a font. |
| ot_metrics_get_position | `ot_metrics_get_position(font: font_t, metrics_tag: ot_metrics_tag_t, position: out position_t?) -> bool_t` | hb_ot_metrics_get_position | 2.6.0 | Fetches metrics value corresponding to @metrics_tag from @font. |
| ot_metrics_get_position_with_fallback | `ot_metrics_get_position_with_fallback(font: font_t, metrics_tag: ot_metrics_tag_t, position: out position_t?) -> none` | hb_ot_metrics_get_position_with_fallback | 4.0.0 | Fetches metrics value corresponding to @metrics_tag from @font, and synthesizes a value if it the value is missing in the font. |
| ot_metrics_get_variation | `ot_metrics_get_variation(font: font_t, metrics_tag: ot_metrics_tag_t) -> gfloat` | hb_ot_metrics_get_variation | 2.6.0 | Fetches metrics value corresponding to @metrics_tag from @font with the current font variation settings applied. |
| ot_metrics_get_x_variation | `ot_metrics_get_x_variation(font: font_t, metrics_tag: ot_metrics_tag_t) -> position_t` | hb_ot_metrics_get_x_variation | 2.6.0 | Fetches horizontal metrics value corresponding to @metrics_tag from @font with the current font variation settings applied. |
| ot_metrics_get_y_variation | `ot_metrics_get_y_variation(font: font_t, metrics_tag: ot_metrics_tag_t) -> position_t` | hb_ot_metrics_get_y_variation | 2.6.0 | Fetches vertical metrics value corresponding to @metrics_tag from @font with the current font variation settings applied. |
| ot_name_get_utf16 | `ot_name_get_utf16(face: face_t, name_id: ot_name_id_t, language: language_t, text_size: out guint?, text: out guint16) -> guint` | hb_ot_name_get_utf16 | 2.1.0 | Fetches a font name from the OpenType 'name' table. If @language is #HB_LANGUAGE_INVALID, English ("en") is assumed. Returns string in UTF-16 encod... |
| ot_name_get_utf32 | `ot_name_get_utf32(face: face_t, name_id: ot_name_id_t, language: language_t, text_size: out guint?, text: out guint32) -> guint` | hb_ot_name_get_utf32 | 2.1.0 | Fetches a font name from the OpenType 'name' table. If @language is #HB_LANGUAGE_INVALID, English ("en") is assumed. Returns string in UTF-32 encod... |
| ot_name_get_utf8 | `ot_name_get_utf8(face: face_t, name_id: ot_name_id_t, language: language_t, text_size: out guint?, text: out utf8) -> guint` | hb_ot_name_get_utf8 | 2.1.0 | Fetches a font name from the OpenType 'name' table. If @language is #HB_LANGUAGE_INVALID, English ("en") is assumed. Returns string in UTF-8 encodi... |
| ot_name_list_names | `ot_name_list_names(face: face_t, num_entries: out guint?) -> ot_name_entry_t` | hb_ot_name_list_names | 2.1.0 | Enumerates all available name IDs and language combinations. Returned array is owned by the @face and should not be modified. It can be used as lon... |
| ot_shape_glyphs_closure | `ot_shape_glyphs_closure(font: font_t, buffer: buffer_t, features: feature_t, num_features: guint, glyphs: out set_t) -> none` | hb_ot_shape_glyphs_closure | 0.9.2 | Computes the transitive closure of glyphs needed for a specified input buffer under the given font and feature list. The closure is computed as a s... |
| ot_shape_plan_collect_lookups | `ot_shape_plan_collect_lookups(shape_plan: shape_plan_t, table_tag: tag_t, lookup_indexes: out set_t) -> none` | hb_ot_shape_plan_collect_lookups | 0.9.7 | Computes the complete set of GSUB or GPOS lookups that are applicable under a given @shape_plan. |
| ot_tag_from_language | `ot_tag_from_language(language: language_t) -> tag_t` | hb_ot_tag_from_language | 0.6.0 | Converts an #hb_language_t to an #hb_tag_t. |
| ot_tag_to_language | `ot_tag_to_language(tag: tag_t) -> language_t` | hb_ot_tag_to_language | 0.9.2 | Converts a language tag to an #hb_language_t. |
| ot_tag_to_script | `ot_tag_to_script(tag: tag_t) -> script_t` | hb_ot_tag_to_script |  | Converts a script tag to an #hb_script_t. |
| ot_tags_from_script | `ot_tags_from_script(script: script_t, script_tag_1: out tag_t, script_tag_2: out tag_t) -> none` | hb_ot_tags_from_script | 0.6.0 | Converts an #hb_script_t to script tags. |
| ot_tags_from_script_and_language | `ot_tags_from_script_and_language(script: script_t, language: language_t?, script_count: inout guint?, script_tags: out tag_t?, language_count: inout guint?, language_tags: out tag_t?) -> none` | hb_ot_tags_from_script_and_language | 2.0.0 | Converts an #hb_script_t and an #hb_language_t to script and language tags. |
| ot_tags_to_script_and_language | `ot_tags_to_script_and_language(script_tag: tag_t, language_tag: tag_t, script: out script_t?, language: out language_t?) -> none` | hb_ot_tags_to_script_and_language | 2.0.0 | Converts a script tag and a language tag to an #hb_script_t and an #hb_language_t. |
| ot_var_find_axis | `ot_var_find_axis(face: face_t, axis_tag: tag_t, axis_index: guint, axis_info: out ot_var_axis_t) -> bool_t` | hb_ot_var_find_axis | 1.4.2 | Fetches the variation-axis information corresponding to the specified axis tag in the specified face. |
| ot_var_find_axis_info | `ot_var_find_axis_info(face: face_t, axis_tag: tag_t, axis_info: out ot_var_axis_info_t) -> bool_t` | hb_ot_var_find_axis_info | 2.2.0 | Fetches the variation-axis information corresponding to the specified axis tag in the specified face. |
| ot_var_get_axes | `ot_var_get_axes(face: face_t, start_offset: guint, axes_count: out guint?, axes_array: out ot_var_axis_t) -> guint` | hb_ot_var_get_axes | 1.4.2 | Fetches a list of all variation axes in the specified face. The list returned will begin at the offset provided. |
| ot_var_get_axis_count | `ot_var_get_axis_count(face: face_t) -> guint` | hb_ot_var_get_axis_count | 1.4.2 | Fetches the number of OpenType variation axes included in the face. |
| ot_var_get_axis_infos | `ot_var_get_axis_infos(face: face_t, start_offset: guint, axes_count: out guint?, axes_array: out ot_var_axis_info_t) -> guint` | hb_ot_var_get_axis_infos | 2.2.0 | Fetches a list of all variation axes in the specified face. The list returned will begin at the offset provided. |
| ot_var_get_named_instance_count | `ot_var_get_named_instance_count(face: face_t) -> guint` | hb_ot_var_get_named_instance_count | 2.2.0 | Fetches the number of named instances included in the face. |
| ot_var_has_data | `ot_var_has_data(face: face_t) -> bool_t` | hb_ot_var_has_data | 1.4.2 | Tests whether a face includes any OpenType variation data in the `fvar` table. |
| ot_var_named_instance_get_design_coords | `ot_var_named_instance_get_design_coords(face: face_t, instance_index: guint, coords_length: out guint?, coords: out gfloat) -> guint` | hb_ot_var_named_instance_get_design_coords | 2.2.0 | Fetches the design-space coordinates corresponding to the given named instance in the face. |
| ot_var_named_instance_get_postscript_name_id | `ot_var_named_instance_get_postscript_name_id(face: face_t, instance_index: guint) -> ot_name_id_t` | hb_ot_var_named_instance_get_postscript_name_id | 2.2.0 | Fetches the `name` table Name ID that provides display names for the "PostScript name" defined for the given named instance in the face. |
| ot_var_named_instance_get_subfamily_name_id | `ot_var_named_instance_get_subfamily_name_id(face: face_t, instance_index: guint) -> ot_name_id_t` | hb_ot_var_named_instance_get_subfamily_name_id | 2.2.0 | Fetches the `name` table Name ID that provides display names for the "Subfamily name" defined for the given named instance in the face. |
| ot_var_normalize_coords | `ot_var_normalize_coords(face: face_t, coords_length: guint, design_coords: gfloat, normalized_coords: out gint) -> none` | hb_ot_var_normalize_coords | 1.4.2 | Normalizes the given design-space coordinates. The minimum and maximum values for the axis are mapped to the interval [-1,1], with the default axis... |
| ot_var_normalize_variations | `ot_var_normalize_variations(face: face_t, variations: variation_t, variations_length: guint, coords: out gint, coords_length: out guint) -> none` | hb_ot_var_normalize_variations | 1.4.2 | Normalizes all of the coordinates in the given list of variation axes. |
| paint_color | `paint_color(funcs: paint_funcs_t, paint_data: gpointer?, is_foreground: bool_t, color: color_t) -> none` | hb_paint_color | 7.0.0 | Perform a "color" paint operation. |
| paint_color_glyph | `paint_color_glyph(funcs: paint_funcs_t, paint_data: gpointer?, glyph: codepoint_t, font: font_t) -> bool_t` | hb_paint_color_glyph | 8.2.0 | Perform a "color-glyph" paint operation. |
| paint_custom_palette_color | `paint_custom_palette_color(funcs: paint_funcs_t, paint_data: gpointer?, color_index: guint, color: out color_t) -> bool_t` | hb_paint_custom_palette_color | 7.0.0 | Gets the custom palette color for @color_index. |
| paint_funcs_create | `paint_funcs_create() -> paint_funcs_t` | hb_paint_funcs_create | 7.0.0 | Creates a new #hb_paint_funcs_t structure of paint functions. The initial reference count of 1 should be released with hb_paint_funcs_destroy() whe... |
| paint_funcs_destroy | `paint_funcs_destroy(funcs: paint_funcs_t) -> none` | hb_paint_funcs_destroy | 7.0.0 | Decreases the reference count on a paint-functions structure. When the reference count reaches zero, the structure is destroyed, freeing all memory. |
| paint_funcs_get_empty | `paint_funcs_get_empty() -> paint_funcs_t` | hb_paint_funcs_get_empty | 7.0.0 | Fetches the singleton empty paint-functions structure. |
| paint_funcs_get_user_data | `paint_funcs_get_user_data(funcs: paint_funcs_t, key: user_data_key_t) -> gpointer` | hb_paint_funcs_get_user_data | 7.0.0 | Fetches the user-data associated with the specified key, attached to the specified paint-functions structure. |
| paint_funcs_is_immutable | `paint_funcs_is_immutable(funcs: paint_funcs_t) -> bool_t` | hb_paint_funcs_is_immutable | 7.0.0 | Tests whether a paint-functions structure is immutable. |
| paint_funcs_make_immutable | `paint_funcs_make_immutable(funcs: paint_funcs_t) -> none` | hb_paint_funcs_make_immutable | 7.0.0 | Makes a paint-functions structure immutable. After this call, all attempts to set one of the callbacks on @funcs will fail. |
| paint_funcs_reference | `paint_funcs_reference(funcs: paint_funcs_t) -> paint_funcs_t` | hb_paint_funcs_reference | 7.0.0 | Increases the reference count on a paint-functions structure. This prevents @funcs from being destroyed until a matching call to hb_paint_funcs_des... |
| paint_funcs_set_color_func | `paint_funcs_set_color_func(funcs: paint_funcs_t, func: paint_color_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_paint_funcs_set_color_func | 7.0.0 | Sets the paint-color callback on the paint functions struct. |
| paint_funcs_set_color_glyph_func | `paint_funcs_set_color_glyph_func(funcs: paint_funcs_t, func: paint_color_glyph_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_paint_funcs_set_color_glyph_func | 8.2.0 | Sets the color-glyph callback on the paint functions struct. |
| paint_funcs_set_custom_palette_color_func | `paint_funcs_set_custom_palette_color_func(funcs: paint_funcs_t, func: paint_custom_palette_color_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_paint_funcs_set_custom_palette_color_func | 7.0.0 | Sets the custom-palette-color callback on the paint functions struct. |
| paint_funcs_set_image_func | `paint_funcs_set_image_func(funcs: paint_funcs_t, func: paint_image_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_paint_funcs_set_image_func | 7.0.0 | Sets the paint-image callback on the paint functions struct. |
| paint_funcs_set_linear_gradient_func | `paint_funcs_set_linear_gradient_func(funcs: paint_funcs_t, func: paint_linear_gradient_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_paint_funcs_set_linear_gradient_func | 7.0.0 | Sets the linear-gradient callback on the paint functions struct. |
| paint_funcs_set_pop_clip_func | `paint_funcs_set_pop_clip_func(funcs: paint_funcs_t, func: paint_pop_clip_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_paint_funcs_set_pop_clip_func | 7.0.0 | Sets the pop-clip callback on the paint functions struct. |
| paint_funcs_set_pop_group_func | `paint_funcs_set_pop_group_func(funcs: paint_funcs_t, func: paint_pop_group_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_paint_funcs_set_pop_group_func | 7.0.0 | Sets the pop-group callback on the paint functions struct. |
| paint_funcs_set_pop_transform_func | `paint_funcs_set_pop_transform_func(funcs: paint_funcs_t, func: paint_pop_transform_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_paint_funcs_set_pop_transform_func | 7.0.0 | Sets the pop-transform callback on the paint functions struct. |
| paint_funcs_set_push_clip_glyph_func | `paint_funcs_set_push_clip_glyph_func(funcs: paint_funcs_t, func: paint_push_clip_glyph_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_paint_funcs_set_push_clip_glyph_func | 7.0.0 | Sets the push-clip-glyph callback on the paint functions struct. |
| paint_funcs_set_push_clip_rectangle_func | `paint_funcs_set_push_clip_rectangle_func(funcs: paint_funcs_t, func: paint_push_clip_rectangle_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_paint_funcs_set_push_clip_rectangle_func | 7.0.0 | Sets the push-clip-rect callback on the paint functions struct. |
| paint_funcs_set_push_group_func | `paint_funcs_set_push_group_func(funcs: paint_funcs_t, func: paint_push_group_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_paint_funcs_set_push_group_func | 7.0.0 | Sets the push-group callback on the paint functions struct. |
| paint_funcs_set_push_transform_func | `paint_funcs_set_push_transform_func(funcs: paint_funcs_t, func: paint_push_transform_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_paint_funcs_set_push_transform_func | 7.0.0 | Sets the push-transform callback on the paint functions struct. |
| paint_funcs_set_radial_gradient_func | `paint_funcs_set_radial_gradient_func(funcs: paint_funcs_t, func: paint_radial_gradient_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_paint_funcs_set_radial_gradient_func | 7.0.0 | Sets the radial-gradient callback on the paint functions struct. |
| paint_funcs_set_sweep_gradient_func | `paint_funcs_set_sweep_gradient_func(funcs: paint_funcs_t, func: paint_sweep_gradient_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_paint_funcs_set_sweep_gradient_func | 7.0.0 | Sets the sweep-gradient callback on the paint functions struct. |
| paint_funcs_set_user_data | `paint_funcs_set_user_data(funcs: paint_funcs_t, key: user_data_key_t, data: gpointer?, destroy: destroy_func_t?, replace: bool_t) -> bool_t` | hb_paint_funcs_set_user_data | 7.0.0 | Attaches a user-data key/data pair to the specified paint-functions structure. |
| paint_image | `paint_image(funcs: paint_funcs_t, paint_data: gpointer?, image: blob_t, width: guint, height: guint, format: tag_t, slant: gfloat, extents: glyph_extents_t?) -> none` | hb_paint_image | 7.0.0 | Perform a "image" paint operation. |
| paint_linear_gradient | `paint_linear_gradient(funcs: paint_funcs_t, paint_data: gpointer?, color_line: color_line_t, x0: gfloat, y0: gfloat, x1: gfloat, y1: gfloat, x2: gfloat, y2: gfloat) -> none` | hb_paint_linear_gradient | 7.0.0 | Perform a "linear-gradient" paint operation. |
| paint_pop_clip | `paint_pop_clip(funcs: paint_funcs_t, paint_data: gpointer?) -> none` | hb_paint_pop_clip | 7.0.0 | Perform a "pop-clip" paint operation. |
| paint_pop_group | `paint_pop_group(funcs: paint_funcs_t, paint_data: gpointer?, mode: paint_composite_mode_t) -> none` | hb_paint_pop_group | 7.0.0 | Perform a "pop-group" paint operation. |
| paint_pop_transform | `paint_pop_transform(funcs: paint_funcs_t, paint_data: gpointer?) -> none` | hb_paint_pop_transform | 7.0.0 | Perform a "pop-transform" paint operation. |
| paint_push_clip_glyph | `paint_push_clip_glyph(funcs: paint_funcs_t, paint_data: gpointer?, glyph: codepoint_t, font: font_t) -> none` | hb_paint_push_clip_glyph | 7.0.0 | Perform a "push-clip-glyph" paint operation. |
| paint_push_clip_rectangle | `paint_push_clip_rectangle(funcs: paint_funcs_t, paint_data: gpointer?, xmin: gfloat, ymin: gfloat, xmax: gfloat, ymax: gfloat) -> none` | hb_paint_push_clip_rectangle | 7.0.0 | Perform a "push-clip-rect" paint operation. |
| paint_push_group | `paint_push_group(funcs: paint_funcs_t, paint_data: gpointer?) -> none` | hb_paint_push_group | 7.0.0 | Perform a "push-group" paint operation. |
| paint_push_transform | `paint_push_transform(funcs: paint_funcs_t, paint_data: gpointer?, xx: gfloat, yx: gfloat, xy: gfloat, yy: gfloat, dx: gfloat, dy: gfloat) -> none` | hb_paint_push_transform | 7.0.0 | Perform a "push-transform" paint operation. |
| paint_radial_gradient | `paint_radial_gradient(funcs: paint_funcs_t, paint_data: gpointer?, color_line: color_line_t, x0: gfloat, y0: gfloat, r0: gfloat, x1: gfloat, y1: gfloat, r1: gfloat) -> none` | hb_paint_radial_gradient | 7.0.0 | Perform a "radial-gradient" paint operation. |
| paint_sweep_gradient | `paint_sweep_gradient(funcs: paint_funcs_t, paint_data: gpointer?, color_line: color_line_t, x0: gfloat, y0: gfloat, start_angle: gfloat, end_angle: gfloat) -> none` | hb_paint_sweep_gradient | 7.0.0 | Perform a "sweep-gradient" paint operation. |
| script_from_iso15924_tag | `script_from_iso15924_tag(tag: tag_t) -> script_t` | hb_script_from_iso15924_tag | 0.9.2 | Converts an ISO 15924 script tag to a corresponding #hb_script_t. |
| script_from_string | `script_from_string(str: guint8, len: gint) -> script_t` | hb_script_from_string | 0.9.2 | Converts a string @str representing an ISO 15924 script tag to a corresponding #hb_script_t. Shorthand for hb_tag_from_string() then hb_script_from... |
| script_get_horizontal_direction | `script_get_horizontal_direction(script: script_t) -> direction_t` | hb_script_get_horizontal_direction | 0.9.2 | Fetches the #hb_direction_t of a script when it is set horizontally. All right-to-left scripts will return #HB_DIRECTION_RTL. All left-to-right scr... |
| script_to_iso15924_tag | `script_to_iso15924_tag(script: script_t) -> tag_t` | hb_script_to_iso15924_tag | 0.9.2 | Converts an #hb_script_t to a corresponding ISO??15924 script tag. |
| segment_properties_equal | `segment_properties_equal(a: segment_properties_t, b: segment_properties_t) -> bool_t` | hb_segment_properties_equal | 0.9.7 | Checks the equality of two #hb_segment_properties_t's. |
| segment_properties_hash | `segment_properties_hash(p: segment_properties_t) -> guint` | hb_segment_properties_hash | 0.9.7 | Creates a hash representing @p. |
| segment_properties_overlay | `segment_properties_overlay(p: segment_properties_t, src: segment_properties_t) -> none` | hb_segment_properties_overlay | 3.3.0 | Fills in missing fields of @p from @src in a considered manner. First, if @p does not have direction set, direction is copied from @src. Next, if @... |
| set_add | `set_add(set: set_t, codepoint: codepoint_t) -> none` | hb_set_add | 0.9.2 | Adds @codepoint to @set. |
| set_add_range | `set_add_range(set: set_t, first: codepoint_t, last: codepoint_t) -> none` | hb_set_add_range | 0.9.7 | Adds all of the elements from @first to @last (inclusive) to @set. |
| set_add_sorted_array | `set_add_sorted_array(set: set_t, sorted_codepoints: codepoint_t, num_codepoints: guint) -> none` | hb_set_add_sorted_array | 4.1.0 | Adds @num_codepoints codepoints to a set at once. The codepoints array must be in increasing order, with size at least @num_codepoints. |
| set_allocation_successful | `set_allocation_successful(set: set_t) -> bool_t` | hb_set_allocation_successful | 0.9.2 | Tests whether memory allocation for a set was successful. |
| set_clear | `set_clear(set: set_t) -> none` | hb_set_clear | 0.9.2 | Clears out the contents of a set. |
| set_copy | `set_copy(set: set_t) -> set_t` | hb_set_copy | 2.8.2 | Allocate a copy of @set. |
| set_create | `set_create() -> set_t` | hb_set_create | 0.9.2 | Creates a new, initially empty set. |
| set_del | `set_del(set: set_t, codepoint: codepoint_t) -> none` | hb_set_del | 0.9.2 | Removes @codepoint from @set. |
| set_del_range | `set_del_range(set: set_t, first: codepoint_t, last: codepoint_t) -> none` | hb_set_del_range | 0.9.7 | Removes all of the elements from @first to @last (inclusive) from @set. If @last is #HB_SET_VALUE_INVALID, then all values greater than or equal to... |
| set_destroy | `set_destroy(set: set_t) -> none` | hb_set_destroy | 0.9.2 | Decreases the reference count on a set. When the reference count reaches zero, the set is destroyed, freeing all memory. |
| set_get_empty | `set_get_empty() -> set_t` | hb_set_get_empty | 0.9.2 | Fetches the singleton empty #hb_set_t. |
| set_get_max | `set_get_max(set: set_t) -> codepoint_t` | hb_set_get_max | 0.9.7 | Finds the largest element in the set. |
| set_get_min | `set_get_min(set: set_t) -> codepoint_t` | hb_set_get_min | 0.9.7 | Finds the smallest element in the set. |
| set_get_population | `set_get_population(set: set_t) -> guint` | hb_set_get_population | 0.9.7 | Returns the number of elements in the set. |
| set_get_user_data | `set_get_user_data(set: set_t, key: user_data_key_t) -> gpointer` | hb_set_get_user_data | 0.9.2 | Fetches the user data associated with the specified key, attached to the specified set. |
| set_has | `set_has(set: set_t, codepoint: codepoint_t) -> bool_t` | hb_set_has | 0.9.2 | Tests whether @codepoint belongs to @set. |
| set_hash | `set_hash(set: set_t) -> guint` | hb_set_hash | 4.4.0 | Creates a hash representing @set. |
| set_intersect | `set_intersect(set: set_t, other: set_t) -> none` | hb_set_intersect | 0.9.2 | Makes @set the intersection of @set and @other. |
| set_invert | `set_invert(set: set_t) -> none` | hb_set_invert | 3.0.0 | Inverts the contents of @set. |
| set_is_empty | `set_is_empty(set: set_t) -> bool_t` | hb_set_is_empty | 0.9.7 | Tests whether a set is empty (contains no elements). |
| set_is_equal | `set_is_equal(set: set_t, other: set_t) -> bool_t` | hb_set_is_equal | 0.9.7 | Tests whether @set and @other are equal (contain the same elements). |
| set_is_inverted | `set_is_inverted(set: set_t) -> bool_t` | hb_set_is_inverted | 7.0.0 | Returns whether the set is inverted. |
| set_is_subset | `set_is_subset(set: set_t, larger_set: set_t) -> bool_t` | hb_set_is_subset | 1.8.1 | Tests whether @set is a subset of @larger_set. |
| set_next | `set_next(set: set_t, codepoint: inout codepoint_t) -> bool_t` | hb_set_next | 0.9.2 | Fetches the next element in @set that is greater than current value of @codepoint. Set @codepoint to #HB_SET_VALUE_INVALID to get started. |
| set_next_many | `set_next_many(set: set_t, codepoint: codepoint_t, out: codepoint_t, size: guint) -> guint` | hb_set_next_many | 4.2.0 | Finds the next element in @set that is greater than @codepoint. Writes out codepoints to @out, until either the set runs out of elements, or @size ... |
| set_next_range | `set_next_range(set: set_t, first: out codepoint_t, last: inout codepoint_t) -> bool_t` | hb_set_next_range | 0.9.7 | Fetches the next consecutive range of elements in @set that are greater than current value of @last. Set @last to #HB_SET_VALUE_INVALID to get star... |
| set_previous | `set_previous(set: set_t, codepoint: inout codepoint_t) -> bool_t` | hb_set_previous | 1.8.0 | Fetches the previous element in @set that is lower than current value of @codepoint. Set @codepoint to #HB_SET_VALUE_INVALID to get started. |
| set_previous_range | `set_previous_range(set: set_t, first: inout codepoint_t, last: out codepoint_t) -> bool_t` | hb_set_previous_range | 1.8.0 | Fetches the previous consecutive range of elements in @set that are greater than current value of @last. Set @first to #HB_SET_VALUE_INVALID to get... |
| set_reference | `set_reference(set: set_t) -> set_t` | hb_set_reference | 0.9.2 | Increases the reference count on a set. |
| set_set | `set_set(set: set_t, other: set_t) -> none` | hb_set_set | 0.9.2 | Makes the contents of @set equal to the contents of @other. |
| set_set_user_data | `set_set_user_data(set: set_t, key: user_data_key_t, data: gpointer?, destroy: destroy_func_t?, replace: bool_t) -> bool_t` | hb_set_set_user_data | 0.9.2 | Attaches a user-data key/data pair to the specified set. |
| set_subtract | `set_subtract(set: set_t, other: set_t) -> none` | hb_set_subtract | 0.9.2 | Subtracts the contents of @other from @set. |
| set_symmetric_difference | `set_symmetric_difference(set: set_t, other: set_t) -> none` | hb_set_symmetric_difference | 0.9.2 | Makes @set the symmetric difference of @set and @other. |
| set_union | `set_union(set: set_t, other: set_t) -> none` | hb_set_union | 0.9.2 | Makes @set the union of @set and @other. |
| shape | `shape(font: font_t, buffer: buffer_t, features: feature_t?, num_features: guint) -> none` | hb_shape | 0.9.2 | Shapes @buffer using @font turning its Unicode characters content to positioned glyphs. If @features is not `NULL`, it will be used to control the ... |
| shape_full | `shape_full(font: font_t, buffer: buffer_t, features: feature_t?, num_features: guint, shaper_list: utf8?) -> bool_t` | hb_shape_full | 0.9.2 | See hb_shape() for details. If @shaper_list is not `NULL`, the specified shapers will be used in the given order, otherwise the default shapers lis... |
| shape_justify | `shape_justify(font: font_t, buffer: buffer_t, features: feature_t?, num_features: guint, shaper_list: utf8?, min_target_advance: gfloat, max_target_advance: gfloat, advance: inout gfloat, var_tag: out tag_t, var_value: out gfloat) -> bool_t` | hb_shape_justify |  | See hb_shape_full() for basic details. If @shaper_list is not `NULL`, the specified shapers will be used in the given order, otherwise the default ... |
| shape_list_shapers | `shape_list_shapers() -> utf8` | hb_shape_list_shapers | 0.9.2 | Retrieves the list of shapers supported by HarfBuzz. |
| shape_plan_create | `shape_plan_create(face: face_t, props: segment_properties_t, user_features: feature_t, num_user_features: guint, shaper_list: utf8) -> shape_plan_t` | hb_shape_plan_create | 0.9.7 | Constructs a shaping plan for a combination of @face, @user_features, @props, and @shaper_list. |
| shape_plan_create2 | `shape_plan_create2(face: face_t, props: segment_properties_t, user_features: feature_t, num_user_features: guint, coords: gint, num_coords: guint, shaper_list: utf8) -> shape_plan_t` | hb_shape_plan_create2 | 1.4.0 | The variable-font version of #hb_shape_plan_create. Constructs a shaping plan for a combination of @face, @user_features, @props, and @shaper_list,... |
| shape_plan_create_cached | `shape_plan_create_cached(face: face_t, props: segment_properties_t, user_features: feature_t, num_user_features: guint, shaper_list: utf8) -> shape_plan_t` | hb_shape_plan_create_cached | 0.9.7 | Creates a cached shaping plan suitable for reuse, for a combination of @face, @user_features, @props, and @shaper_list. |
| shape_plan_create_cached2 | `shape_plan_create_cached2(face: face_t, props: segment_properties_t, user_features: feature_t, num_user_features: guint, coords: gint, num_coords: guint, shaper_list: utf8) -> shape_plan_t` | hb_shape_plan_create_cached2 | 1.4.0 | The variable-font version of #hb_shape_plan_create_cached. Creates a cached shaping plan suitable for reuse, for a combination of @face, @user_feat... |
| shape_plan_destroy | `shape_plan_destroy(shape_plan: shape_plan_t) -> none` | hb_shape_plan_destroy | 0.9.7 | Decreases the reference count on the given shaping plan. When the reference count reaches zero, the shaping plan is destroyed, freeing all memory. |
| shape_plan_execute | `shape_plan_execute(shape_plan: shape_plan_t, font: font_t, buffer: buffer_t, features: feature_t, num_features: guint) -> bool_t` | hb_shape_plan_execute | 0.9.7 | Executes the given shaping plan on the specified buffer, using the given @font and @features. |
| shape_plan_get_empty | `shape_plan_get_empty() -> shape_plan_t` | hb_shape_plan_get_empty | 0.9.7 | Fetches the singleton empty shaping plan. |
| shape_plan_get_shaper | `shape_plan_get_shaper(shape_plan: shape_plan_t) -> utf8` | hb_shape_plan_get_shaper | 0.9.7 | Fetches the shaper from a given shaping plan. |
| shape_plan_get_user_data | `shape_plan_get_user_data(shape_plan: shape_plan_t, key: user_data_key_t) -> gpointer` | hb_shape_plan_get_user_data | 0.9.7 | Fetches the user data associated with the specified key, attached to the specified shaping plan. |
| shape_plan_reference | `shape_plan_reference(shape_plan: shape_plan_t) -> shape_plan_t` | hb_shape_plan_reference | 0.9.7 | Increases the reference count on the given shaping plan. |
| shape_plan_set_user_data | `shape_plan_set_user_data(shape_plan: shape_plan_t, key: user_data_key_t, data: gpointer?, destroy: destroy_func_t?, replace: bool_t) -> bool_t` | hb_shape_plan_set_user_data | 0.9.7 | Attaches a user-data key/data pair to the given shaping plan. |
| style_get_value | `style_get_value(font: font_t, style_tag: style_tag_t) -> gfloat` | hb_style_get_value | 3.0.0 | Searches variation axes of a #hb_font_t object for a specific axis first, if not set, then tries to get default style values from different tables ... |
| tag_from_string | `tag_from_string(str: guint8, len: gint) -> tag_t` | hb_tag_from_string | 0.9.2 | Converts a string into an #hb_tag_t. Valid tags are four characters. Shorter input strings will be padded with spaces. Longer input strings will be... |
| tag_to_string | `tag_to_string(tag: tag_t, buf: out guint8) -> none` | hb_tag_to_string | 0.9.5 | Converts an #hb_tag_t to a string and returns it in @buf. Strings will be four characters long. |
| unicode_combining_class | `unicode_combining_class(ufuncs: unicode_funcs_t, unicode: codepoint_t) -> unicode_combining_class_t` | hb_unicode_combining_class | 0.9.2 | Retrieves the Canonical Combining Class (ccc) property of code point @unicode. |
| unicode_compose | `unicode_compose(ufuncs: unicode_funcs_t, a: codepoint_t, b: codepoint_t, ab: out codepoint_t) -> bool_t` | hb_unicode_compose | 0.9.2 | Fetches the composition of a sequence of two Unicode code points. Calls the composition function of the specified Unicode-functions structure @ufuncs. |
| unicode_decompose | `unicode_decompose(ufuncs: unicode_funcs_t, ab: codepoint_t, a: out codepoint_t, b: out codepoint_t) -> bool_t` | hb_unicode_decompose | 0.9.2 | Fetches the decomposition of a Unicode code point. Calls the decomposition function of the specified Unicode-functions structure @ufuncs. |
| unicode_decompose_compatibility | `unicode_decompose_compatibility(ufuncs: unicode_funcs_t, u: codepoint_t, decomposed: out codepoint_t) -> guint` | hb_unicode_decompose_compatibility | 0.9.2 | Fetches the compatibility decomposition of a Unicode code point. Deprecated. |
| unicode_eastasian_width | `unicode_eastasian_width(ufuncs: unicode_funcs_t, unicode: codepoint_t) -> guint` | hb_unicode_eastasian_width | 0.9.2 | Don't use. Not used by HarfBuzz. |
| unicode_funcs_create | `unicode_funcs_create(parent: unicode_funcs_t?) -> unicode_funcs_t` | hb_unicode_funcs_create | 0.9.2 | Creates a new #hb_unicode_funcs_t structure of Unicode functions. |
| unicode_funcs_destroy | `unicode_funcs_destroy(ufuncs: unicode_funcs_t) -> none` | hb_unicode_funcs_destroy | 0.9.2 | Decreases the reference count on a Unicode-functions structure. When the reference count reaches zero, the Unicode-functions structure is destroyed... |
| unicode_funcs_get_default | `unicode_funcs_get_default() -> unicode_funcs_t` | hb_unicode_funcs_get_default | 0.9.2 | Fetches a pointer to the default Unicode-functions structure that is used when no functions are explicitly set on #hb_buffer_t. |
| unicode_funcs_get_empty | `unicode_funcs_get_empty() -> unicode_funcs_t` | hb_unicode_funcs_get_empty | 0.9.2 | Fetches the singleton empty Unicode-functions structure. |
| unicode_funcs_get_parent | `unicode_funcs_get_parent(ufuncs: unicode_funcs_t) -> unicode_funcs_t` | hb_unicode_funcs_get_parent | 0.9.2 | Fetches the parent of the Unicode-functions structure @ufuncs. |
| unicode_funcs_get_user_data | `unicode_funcs_get_user_data(ufuncs: unicode_funcs_t, key: user_data_key_t) -> gpointer` | hb_unicode_funcs_get_user_data | 0.9.2 | Fetches the user-data associated with the specified key, attached to the specified Unicode-functions structure. |
| unicode_funcs_is_immutable | `unicode_funcs_is_immutable(ufuncs: unicode_funcs_t) -> bool_t` | hb_unicode_funcs_is_immutable | 0.9.2 | Tests whether the specified Unicode-functions structure is immutable. |
| unicode_funcs_make_immutable | `unicode_funcs_make_immutable(ufuncs: unicode_funcs_t) -> none` | hb_unicode_funcs_make_immutable | 0.9.2 | Makes the specified Unicode-functions structure immutable. |
| unicode_funcs_reference | `unicode_funcs_reference(ufuncs: unicode_funcs_t) -> unicode_funcs_t` | hb_unicode_funcs_reference | 0.9.2 | Increases the reference count on a Unicode-functions structure. |
| unicode_funcs_set_combining_class_func | `unicode_funcs_set_combining_class_func(ufuncs: unicode_funcs_t, func: unicode_combining_class_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_unicode_funcs_set_combining_class_func | 0.9.2 | Sets the implementation function for #hb_unicode_combining_class_func_t. |
| unicode_funcs_set_compose_func | `unicode_funcs_set_compose_func(ufuncs: unicode_funcs_t, func: unicode_compose_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_unicode_funcs_set_compose_func | 0.9.2 | Sets the implementation function for #hb_unicode_compose_func_t. |
| unicode_funcs_set_decompose_compatibility_func | `unicode_funcs_set_decompose_compatibility_func(ufuncs: unicode_funcs_t, func: unicode_decompose_compatibility_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_unicode_funcs_set_decompose_compatibility_func | 0.9.2 | Sets the implementation function for #hb_unicode_decompose_compatibility_func_t. |
| unicode_funcs_set_decompose_func | `unicode_funcs_set_decompose_func(ufuncs: unicode_funcs_t, func: unicode_decompose_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_unicode_funcs_set_decompose_func | 0.9.2 | Sets the implementation function for #hb_unicode_decompose_func_t. |
| unicode_funcs_set_eastasian_width_func | `unicode_funcs_set_eastasian_width_func(ufuncs: unicode_funcs_t, func: unicode_eastasian_width_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_unicode_funcs_set_eastasian_width_func | 0.9.2 | Sets the implementation function for #hb_unicode_eastasian_width_func_t. |
| unicode_funcs_set_general_category_func | `unicode_funcs_set_general_category_func(ufuncs: unicode_funcs_t, func: unicode_general_category_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_unicode_funcs_set_general_category_func | 0.9.2 | Sets the implementation function for #hb_unicode_general_category_func_t. |
| unicode_funcs_set_mirroring_func | `unicode_funcs_set_mirroring_func(ufuncs: unicode_funcs_t, func: unicode_mirroring_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_unicode_funcs_set_mirroring_func | 0.9.2 | Sets the implementation function for #hb_unicode_mirroring_func_t. |
| unicode_funcs_set_script_func | `unicode_funcs_set_script_func(ufuncs: unicode_funcs_t, func: unicode_script_func_t, user_data: gpointer?, destroy: destroy_func_t?) -> none` | hb_unicode_funcs_set_script_func | 0.9.2 | Sets the implementation function for #hb_unicode_script_func_t. |
| unicode_funcs_set_user_data | `unicode_funcs_set_user_data(ufuncs: unicode_funcs_t, key: user_data_key_t, data: gpointer?, destroy: destroy_func_t?, replace: bool_t) -> bool_t` | hb_unicode_funcs_set_user_data | 0.9.2 | Attaches a user-data key/data pair to the specified Unicode-functions structure. |
| unicode_general_category | `unicode_general_category(ufuncs: unicode_funcs_t, unicode: codepoint_t) -> unicode_general_category_t` | hb_unicode_general_category | 0.9.2 | Retrieves the General Category (gc) property of code point @unicode. |
| unicode_mirroring | `unicode_mirroring(ufuncs: unicode_funcs_t, unicode: codepoint_t) -> codepoint_t` | hb_unicode_mirroring | 0.9.2 | Retrieves the Bi-directional Mirroring Glyph code point defined for code point @unicode. |
| unicode_script | `unicode_script(ufuncs: unicode_funcs_t, unicode: codepoint_t) -> script_t` | hb_unicode_script | 0.9.2 | Retrieves the #hb_script_t script to which code point @unicode belongs. |
| variation_from_string | `variation_from_string(str: guint8, len: gint, variation: out variation_t) -> bool_t` | hb_variation_from_string | 1.4.2 | Parses a string into a #hb_variation_t. The format for specifying variation settings follows. All valid CSS font-variation-settings values other th... |
| variation_to_string | `variation_to_string(variation: variation_t, buf: out utf8, size: out guint) -> none` | hb_variation_to_string | 1.4.2 | Converts an #hb_variation_t into a `NULL`-terminated string in the format understood by hb_variation_from_string(). The client in responsible for a... |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| buffer_message_func_t | `buffer_message_func_t(buffer: buffer_t, font: font_t, message: utf8, user_data: gpointer?) -> bool_t` |  | 1.1.3 | A callback method for #hb_buffer_t. The method gets called with the #hb_buffer_t it was set on, the #hb_font_t the buffer is shaped with and a mess... |
| color_line_get_color_stops_func_t | `color_line_get_color_stops_func_t(color_line: color_line_t, color_line_data: gpointer?, start: guint, count: out guint?, color_stops: out color_stop_t?, user_data: gpointer?) -> guint` |  | 7.0.0 | A virtual method for the #hb_color_line_t to fetch color stops. |
| color_line_get_extend_func_t | `color_line_get_extend_func_t(color_line: color_line_t, color_line_data: gpointer?, user_data: gpointer?) -> paint_extend_t` |  | 7.0.0 | A virtual method for the @hb_color_line_t to fetches the extend mode. |
| destroy_func_t | `destroy_func_t(user_data: gpointer?) -> none` |  |  | A virtual method for destroy user-data callbacks. |
| draw_close_path_func_t | `draw_close_path_func_t(dfuncs: draw_funcs_t, draw_data: gpointer?, st: draw_state_t, user_data: gpointer?) -> none` |  | 4.0.0 | A virtual method for the #hb_draw_funcs_t to perform a "close-path" draw operation. |
| draw_cubic_to_func_t | `draw_cubic_to_func_t(dfuncs: draw_funcs_t, draw_data: gpointer?, st: draw_state_t, control1_x: gfloat, control1_y: gfloat, control2_x: gfloat, control2_y: gfloat, to_x: gfloat, to_y: gfloat, user_data: gpointer?) -> none` |  | 4.0.0 | A virtual method for the #hb_draw_funcs_t to perform a "cubic-to" draw operation. |
| draw_line_to_func_t | `draw_line_to_func_t(dfuncs: draw_funcs_t, draw_data: gpointer?, st: draw_state_t, to_x: gfloat, to_y: gfloat, user_data: gpointer?) -> none` |  | 4.0.0 | A virtual method for the #hb_draw_funcs_t to perform a "line-to" draw operation. |
| draw_move_to_func_t | `draw_move_to_func_t(dfuncs: draw_funcs_t, draw_data: gpointer?, st: draw_state_t, to_x: gfloat, to_y: gfloat, user_data: gpointer?) -> none` |  | 4.0.0 | A virtual method for the #hb_draw_funcs_t to perform a "move-to" draw operation. |
| draw_quadratic_to_func_t | `draw_quadratic_to_func_t(dfuncs: draw_funcs_t, draw_data: gpointer?, st: draw_state_t, control_x: gfloat, control_y: gfloat, to_x: gfloat, to_y: gfloat, user_data: gpointer?) -> none` |  | 4.0.0 | A virtual method for the #hb_draw_funcs_t to perform a "quadratic-to" draw operation. |
| font_draw_glyph_func_t | `font_draw_glyph_func_t(font: font_t, font_data: gpointer?, glyph: codepoint_t, draw_funcs: draw_funcs_t, draw_data: gpointer?, user_data: gpointer?) -> none` |  | 7.0.0 | A virtual method for the #hb_font_funcs_t of an #hb_font_t object. |
| font_get_font_extents_func_t | `font_get_font_extents_func_t(font: font_t, font_data: gpointer?, extents: out font_extents_t, user_data: gpointer?) -> bool_t` |  |  | This method should retrieve the extents for a font. |
| font_get_glyph_advance_func_t | `font_get_glyph_advance_func_t(font: font_t, font_data: gpointer?, glyph: codepoint_t, user_data: gpointer?) -> position_t` |  |  | A virtual method for the #hb_font_funcs_t of an #hb_font_t object. This method should retrieve the advance for a specified glyph. The method must r... |
| font_get_glyph_advances_func_t | `font_get_glyph_advances_func_t(font: font_t, font_data: gpointer?, count: guint, first_glyph: codepoint_t, glyph_stride: guint, first_advance: out position_t, advance_stride: guint, user_data: gpointer?) -> none` |  |  | A virtual method for the #hb_font_funcs_t of an #hb_font_t object. This method should retrieve the advances for a sequence of glyphs. |
| font_get_glyph_contour_point_func_t | `font_get_glyph_contour_point_func_t(font: font_t, font_data: gpointer?, glyph: codepoint_t, point_index: guint, x: out position_t, y: out position_t, user_data: gpointer?) -> bool_t` |  |  | A virtual method for the #hb_font_funcs_t of an #hb_font_t object. This method should retrieve the (X,Y) coordinates (in font units) for a specifie... |
| font_get_glyph_extents_func_t | `font_get_glyph_extents_func_t(font: font_t, font_data: gpointer?, glyph: codepoint_t, extents: out glyph_extents_t, user_data: gpointer?) -> bool_t` |  |  | A virtual method for the #hb_font_funcs_t of an #hb_font_t object. This method should retrieve the extents for a specified glyph. Extents must be r... |
| font_get_glyph_from_name_func_t | `font_get_glyph_from_name_func_t(font: font_t, font_data: gpointer?, name: utf8, len: gint, glyph: out codepoint_t, user_data: gpointer?) -> bool_t` |  |  | A virtual method for the #hb_font_funcs_t of an #hb_font_t object. This method should retrieve the glyph ID that corresponds to a glyph-name string. |
| font_get_glyph_func_t | `font_get_glyph_func_t(font: font_t, font_data: gpointer?, unicode: codepoint_t, variation_selector: codepoint_t, glyph: out codepoint_t, user_data: gpointer?) -> bool_t` |  |  | A virtual method for the #hb_font_funcs_t of an #hb_font_t object. This method should retrieve the glyph ID for a specified Unicode code point font... |
| font_get_glyph_kerning_func_t | `font_get_glyph_kerning_func_t(font: font_t, font_data: gpointer?, first_glyph: codepoint_t, second_glyph: codepoint_t, user_data: gpointer?) -> position_t` |  |  | This method should retrieve the kerning-adjustment value for a glyph-pair in the specified font, for horizontal text segments. |
| font_get_glyph_name_func_t | `font_get_glyph_name_func_t(font: font_t, font_data: gpointer?, glyph: codepoint_t, name: out utf8, size: out guint, user_data: gpointer?) -> bool_t` |  |  | A virtual method for the #hb_font_funcs_t of an #hb_font_t object. This method should retrieve the glyph name that corresponds to a glyph ID. The n... |
| font_get_glyph_origin_func_t | `font_get_glyph_origin_func_t(font: font_t, font_data: gpointer?, glyph: codepoint_t, x: out position_t, y: out position_t, user_data: gpointer?) -> bool_t` |  |  | A virtual method for the #hb_font_funcs_t of an #hb_font_t object. This method should retrieve the (X,Y) coordinates (in font units) of the origin ... |
| font_get_glyph_shape_func_t | `font_get_glyph_shape_func_t(font: font_t, font_data: gpointer?, glyph: codepoint_t, draw_funcs: draw_funcs_t, draw_data: gpointer?, user_data: gpointer?) -> none` |  | 4.0.0 | A virtual method for the #hb_font_funcs_t of an #hb_font_t object. |
| font_get_nominal_glyph_func_t | `font_get_nominal_glyph_func_t(font: font_t, font_data: gpointer?, unicode: codepoint_t, glyph: out codepoint_t, user_data: gpointer?) -> bool_t` |  |  | A virtual method for the #hb_font_funcs_t of an #hb_font_t object. This method should retrieve the nominal glyph ID for a specified Unicode code po... |
| font_get_nominal_glyphs_func_t | `font_get_nominal_glyphs_func_t(font: font_t, font_data: gpointer?, count: guint, first_unicode: codepoint_t, unicode_stride: guint, first_glyph: out codepoint_t, glyph_stride: guint, user_data: gpointer?) -> guint` |  |  | A virtual method for the #hb_font_funcs_t of an #hb_font_t object. This method should retrieve the nominal glyph IDs for a sequence of Unicode code... |
| font_get_variation_glyph_func_t | `font_get_variation_glyph_func_t(font: font_t, font_data: gpointer?, unicode: codepoint_t, variation_selector: codepoint_t, glyph: out codepoint_t, user_data: gpointer?) -> bool_t` |  |  | A virtual method for the #hb_font_funcs_t of an #hb_font_t object. This method should retrieve the glyph ID for a specified Unicode code point foll... |
| font_paint_glyph_func_t | `font_paint_glyph_func_t(font: font_t, font_data: gpointer?, glyph: codepoint_t, paint_funcs: paint_funcs_t, paint_data: gpointer?, palette_index: guint, foreground: color_t, user_data: gpointer?) -> none` |  | 7.0.0 | A virtual method for the #hb_font_funcs_t of an #hb_font_t object. |
| paint_color_func_t | `paint_color_func_t(funcs: paint_funcs_t, paint_data: gpointer?, is_foreground: bool_t, color: color_t, user_data: gpointer?) -> none` |  | 7.0.0 | A virtual method for the #hb_paint_funcs_t to paint a color everywhere within the current clip. |
| paint_color_glyph_func_t | `paint_color_glyph_func_t(funcs: paint_funcs_t, paint_data: gpointer?, glyph: codepoint_t, font: font_t, user_data: gpointer?) -> bool_t` |  | 8.2.0 | A virtual method for the #hb_paint_funcs_t to render a color glyph by glyph index. |
| paint_custom_palette_color_func_t | `paint_custom_palette_color_func_t(funcs: paint_funcs_t, paint_data: gpointer?, color_index: guint, color: out color_t, user_data: gpointer?) -> bool_t` |  | 7.0.0 | A virtual method for the #hb_paint_funcs_t to fetch a color from the custom color palette. Custom palette colors override the colors from the fonts... |
| paint_image_func_t | `paint_image_func_t(funcs: paint_funcs_t, paint_data: gpointer?, image: blob_t, width: guint, height: guint, format: tag_t, slant: gfloat, extents: glyph_extents_t?, user_data: gpointer?) -> bool_t` |  | 7.0.0 | A virtual method for the #hb_paint_funcs_t to paint a glyph image. This method is called for glyphs with image blobs in the CBDT, sbix or SVG table... |
| paint_linear_gradient_func_t | `paint_linear_gradient_func_t(funcs: paint_funcs_t, paint_data: gpointer?, color_line: color_line_t, x0: gfloat, y0: gfloat, x1: gfloat, y1: gfloat, x2: gfloat, y2: gfloat, user_data: gpointer?) -> none` |  | 7.0.0 | A virtual method for the #hb_paint_funcs_t to paint a linear gradient everywhere within the current clip. The @color_line object contains informati... |
| paint_pop_clip_func_t | `paint_pop_clip_func_t(funcs: paint_funcs_t, paint_data: gpointer?, user_data: gpointer?) -> none` |  | 7.0.0 | A virtual method for the #hb_paint_funcs_t to undo the effect of a prior call to the #hb_paint_funcs_push_clip_glyph_func_t or #hb_paint_funcs_push... |
| paint_pop_group_func_t | `paint_pop_group_func_t(funcs: paint_funcs_t, paint_data: gpointer?, mode: paint_composite_mode_t, user_data: gpointer?) -> none` |  | 7.0.0 | A virtual method for the #hb_paint_funcs_t to undo the effect of a prior call to the #hb_paint_funcs_push_group_func_t vfunc. This call stops the r... |
| paint_pop_transform_func_t | `paint_pop_transform_func_t(funcs: paint_funcs_t, paint_data: gpointer?, user_data: gpointer?) -> none` |  | 7.0.0 | A virtual method for the #hb_paint_funcs_t to undo the effect of a prior call to the #hb_paint_funcs_push_transform_func_t vfunc. |
| paint_push_clip_glyph_func_t | `paint_push_clip_glyph_func_t(funcs: paint_funcs_t, paint_data: gpointer?, glyph: codepoint_t, font: font_t, user_data: gpointer?) -> none` |  | 7.0.0 | A virtual method for the #hb_paint_funcs_t to clip subsequent paint calls to the outline of a glyph. The coordinates of the glyph outline are inter... |
| paint_push_clip_rectangle_func_t | `paint_push_clip_rectangle_func_t(funcs: paint_funcs_t, paint_data: gpointer?, xmin: gfloat, ymin: gfloat, xmax: gfloat, ymax: gfloat, user_data: gpointer?) -> none` |  | 7.0.0 | A virtual method for the #hb_paint_funcs_t to clip subsequent paint calls to a rectangle. The coordinates of the rectangle are interpreted accordin... |
| paint_push_group_func_t | `paint_push_group_func_t(funcs: paint_funcs_t, paint_data: gpointer?, user_data: gpointer?) -> none` |  | 7.0.0 | A virtual method for the #hb_paint_funcs_t to use an intermediate surface for subsequent paint calls. The drawing will be redirected to an intermed... |
| paint_push_transform_func_t | `paint_push_transform_func_t(funcs: paint_funcs_t, paint_data: gpointer?, xx: gfloat, yx: gfloat, xy: gfloat, yy: gfloat, dx: gfloat, dy: gfloat, user_data: gpointer?) -> none` |  | 7.0.0 | A virtual method for the #hb_paint_funcs_t to apply a transform to subsequent paint calls. This transform is applied after the current transform, a... |
| paint_radial_gradient_func_t | `paint_radial_gradient_func_t(funcs: paint_funcs_t, paint_data: gpointer?, color_line: color_line_t, x0: gfloat, y0: gfloat, r0: gfloat, x1: gfloat, y1: gfloat, r1: gfloat, user_data: gpointer?) -> none` |  | 7.0.0 | A virtual method for the #hb_paint_funcs_t to paint a radial gradient everywhere within the current clip. The @color_line object contains informati... |
| paint_sweep_gradient_func_t | `paint_sweep_gradient_func_t(funcs: paint_funcs_t, paint_data: gpointer?, color_line: color_line_t, x0: gfloat, y0: gfloat, start_angle: gfloat, end_angle: gfloat, user_data: gpointer?) -> none` |  | 7.0.0 | A virtual method for the #hb_paint_funcs_t to paint a sweep gradient everywhere within the current clip. The @color_line object contains informatio... |
| reference_table_func_t | `reference_table_func_t(face: face_t, tag: tag_t, user_data: gpointer?) -> blob_t` |  | 0.9.2 | Callback function for hb_face_create_for_tables(). |
| unicode_combining_class_func_t | `unicode_combining_class_func_t(ufuncs: unicode_funcs_t, unicode: codepoint_t, user_data: gpointer?) -> unicode_combining_class_t` |  |  | A virtual method for the #hb_unicode_funcs_t structure. This method should retrieve the Canonical Combining Class (ccc) property for a specified Un... |
| unicode_compose_func_t | `unicode_compose_func_t(ufuncs: unicode_funcs_t, a: codepoint_t, b: codepoint_t, ab: out codepoint_t, user_data: gpointer?) -> bool_t` |  |  | A virtual method for the #hb_unicode_funcs_t structure. This method should compose a sequence of two input Unicode code points by canonical equival... |
| unicode_decompose_compatibility_func_t | `unicode_decompose_compatibility_func_t(ufuncs: unicode_funcs_t, u: codepoint_t, decomposed: codepoint_t, user_data: gpointer?) -> guint` |  |  | Fully decompose @u to its Unicode compatibility decomposition. The codepoints of the decomposition will be written to @decomposed. The complete len... |
| unicode_decompose_func_t | `unicode_decompose_func_t(ufuncs: unicode_funcs_t, ab: codepoint_t, a: out codepoint_t, b: out codepoint_t, user_data: gpointer?) -> bool_t` |  |  | A virtual method for the #hb_unicode_funcs_t structure. This method should decompose an input Unicode code point, returning the two decomposed code... |
| unicode_eastasian_width_func_t | `unicode_eastasian_width_func_t(ufuncs: unicode_funcs_t, unicode: codepoint_t, user_data: gpointer?) -> guint` |  |  | A virtual method for the #hb_unicode_funcs_t structure. |
| unicode_general_category_func_t | `unicode_general_category_func_t(ufuncs: unicode_funcs_t, unicode: codepoint_t, user_data: gpointer?) -> unicode_general_category_t` |  |  | A virtual method for the #hb_unicode_funcs_t structure. This method should retrieve the General Category property for a specified Unicode code point. |
| unicode_mirroring_func_t | `unicode_mirroring_func_t(ufuncs: unicode_funcs_t, unicode: codepoint_t, user_data: gpointer?) -> codepoint_t` |  |  | A virtual method for the #hb_unicode_funcs_t structure. This method should retrieve the Bi-Directional Mirroring Glyph code point for a specified U... |
| unicode_script_func_t | `unicode_script_func_t(ufuncs: unicode_funcs_t, unicode: codepoint_t, user_data: gpointer?) -> script_t` |  |  | A virtual method for the #hb_unicode_funcs_t structure. This method should retrieve the Script property for a specified Unicode code point. |

## Constants

| Name | Type |
| --- | --- |
| AAT_LAYOUT_NO_SELECTOR_INDEX | gint |
| BUFFER_REPLACEMENT_CODEPOINT_DEFAULT | gint |
| CODEPOINT_INVALID | codepoint_t |
| FEATURE_GLOBAL_START | gint |
| FONT_NO_VAR_NAMED_INSTANCE | gint |
| LANGUAGE_INVALID | language_t |
| OT_LAYOUT_DEFAULT_LANGUAGE_INDEX | gint |
| OT_LAYOUT_NO_FEATURE_INDEX | gint |
| OT_LAYOUT_NO_SCRIPT_INDEX | gint |
| OT_LAYOUT_NO_VARIATIONS_INDEX | gint |
| OT_MAX_TAGS_PER_LANGUAGE | gint |
| OT_MAX_TAGS_PER_SCRIPT | gint |
| OT_VAR_NO_AXIS_INDEX | gint |
| UNICODE_COMBINING_CLASS_CCC133 | gint |
| UNICODE_MAX | gint |
| UNICODE_MAX_DECOMPOSITION_LEN | gint |
| VERSION_MAJOR | gint |
| VERSION_MICRO | gint |
| VERSION_MINOR | gint |
| VERSION_STRING | utf8 |

## Aliases

| Name | Type |
| --- | --- |
| bool_t | gint |
| codepoint_t | guint32 |
| color_t | guint32 |
| font_get_font_h_extents_func_t | font_get_font_extents_func_t |
| font_get_font_v_extents_func_t | font_get_font_extents_func_t |
| font_get_glyph_h_advance_func_t | font_get_glyph_advance_func_t |
| font_get_glyph_h_advances_func_t | font_get_glyph_advances_func_t |
| font_get_glyph_h_kerning_func_t | font_get_glyph_kerning_func_t |
| font_get_glyph_h_origin_func_t | font_get_glyph_origin_func_t |
| font_get_glyph_v_advance_func_t | font_get_glyph_advance_func_t |
| font_get_glyph_v_advances_func_t | font_get_glyph_advances_func_t |
| font_get_glyph_v_kerning_func_t | font_get_glyph_kerning_func_t |
| font_get_glyph_v_origin_func_t | font_get_glyph_origin_func_t |
| mask_t | guint32 |
| ot_name_id_t | guint |
| position_t | gint32 |
| tag_t | guint32 |

