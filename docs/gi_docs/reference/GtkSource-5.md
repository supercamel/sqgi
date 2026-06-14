# GtkSource 5

SQGI import: `import("GtkSource", "5")`

Packages: `gtksourceview-5`
Includes: `Gtk-4.0`
Libraries: `libgtksourceview-5.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 40 |
| Interfaces | 5 |
| Records | 47 |
| Unions | 0 |
| Enums | 12 |
| Flags | 4 |
| Functions | 18 |
| Callbacks | 2 |
| Constants | 3 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Buffer | Gtk.TextBuffer | 0 | 4 | 28 | Subclass of [class@Gtk.TextBuffer]. A `GtkSourceBuffer` object is the model for [class@View] widgets. It extends the [class@Gtk.TextBuffer] class b... |
| Completion | GObject.Object | 0 | 4 | 12 | Main Completion Object. The completion system helps the user when they writes some text, such as words, command names, functions, and suchlike. Pro... |
| CompletionCell | Gtk.Widget | 0 | 0 | 9 | Widget for single cell of completion proposal. The `GtkSourceCompletionCell` widget provides a container to display various types of information wi... |
| CompletionContext | GObject.Object | 0 | 1 | 12 | The context of a completion. `GtkSourceCompletionContext` contains information about an attept to display completion proposals to the user based on... |
| CompletionSnippets | GObject.Object | 0 | 0 | 1 | A [iface@CompletionProvider] for the completion of snippets. The `GtkSourceCompletionSnippets` is an example of an implementation of the [iface@Com... |
| CompletionWords | GObject.Object | 0 | 0 | 3 | A [iface@CompletionProvider] for the completion of words. The `GtkSourceCompletionWords` is an example of an implementation of the [iface@Completio... |
| File | GObject.Object | 0 | 0 | 12 | On-disk representation of a [class@Buffer]. A `GtkSourceFile` object is the on-disk representation of a [class@Buffer]. With a `GtkSourceFile`, you... |
| FileLoader | GObject.Object | 0 | 0 | 12 | Load a file into a GtkSourceBuffer. A `GtkSourceFileLoader` object permits to load the contents of a [iface@Gio.File] or a [class@Gio.InputStream] ... |
| FileSaver | GObject.Object | 0 | 0 | 15 | Save a [class@Buffer] into a file. A `GtkSourceFileSaver` object permits to save a [class@Buffer] into a [iface@Gio.File]. A file saver should be u... |
| Gutter | Gtk.Widget | 0 | 0 | 4 | Gutter object for [class@View]. The `GtkSourceGutter` object represents the left or right gutter of the text view. It is used by [class@View] to dr... |
| GutterLines | GObject.Object | 0 | 0 | 16 | Collected information about visible lines. The `GtkSourceGutterLines` object is used to collect information about visible lines. Use this from your... |
| GutterRenderer | Gtk.Widget | 2 | 3 | 15 | Gutter cell renderer. A `GtkSourceGutterRenderer` represents a column in a [class@Gutter]. The column contains one cell for each visible line of th... |
| GutterRendererPixbuf | GutterRenderer | 0 | 0 | 10 | Renders a pixbuf in the gutter. A `GtkSourceGutterRendererPixbuf` can be used to render an image in a cell of [class@Gutter]. |
| GutterRendererText | GutterRenderer | 0 | 0 | 5 | Renders text in the gutter. A `GtkSourceGutterRendererText` can be used to render text in a cell of [class@Gutter]. |
| Hover | GObject.Object | 0 | 0 | 2 | Interactive tooltips. `GtkSourceHover` allows a [class@View] to provide contextual information. When enabled, if the user hovers over a word in the... |
| HoverContext | GObject.Object | 0 | 0 | 4 | Context for populating [class@HoverDisplay] contents. `GtkSourceHoverContext` contains information about the request to populate contents for a [cl... |
| HoverDisplay | Gtk.Widget | 0 | 0 | 4 | Display for interactive tooltips. `GtkSourceHoverDisplay` is a [class@Gtk.Widget] that may be populated with widgets to be displayed to the user in... |
| Language | GObject.Object | 0 | 0 | 10 | Represents a syntax highlighted language. A `GtkSourceLanguage` represents a programming or markup language, affecting syntax highlighting and cont... |
| LanguageManager | GObject.Object | 0 | 0 | 9 | Provides access to [class@Language]s. `GtkSourceLanguageManager` is an object which processes language description files and creates and stores [cl... |
| Map | View | 0 | 0 | 3 | Widget that displays a map for a specific [class@View]. `GtkSourceMap` is a widget that maps the content of a [class@View] into a smaller view so t... |
| Mark | Gtk.TextMark | 0 | 0 | 4 | Mark object for [class@Buffer]. A `GtkSourceMark` marks a position in the text where you want to display additional info. It is based on [class@Gtk... |
| MarkAttributes | GObject.Object | 0 | 2 | 12 | The source mark attributes object. `GtkSourceMarkAttributes` is an object specifying attributes used by a [class@View] to visually show lines marke... |
| PrintCompositor | GObject.Object | 0 | 0 | 38 | Compose a [class@Buffer] for printing. The `GtkSourcePrintCompositor` object is used to compose a [class@Buffer] for printing. You can set various ... |
| Region | GObject.Object | 0 | 0 | 12 | Region utility. A `GtkSourceRegion` permits to store a group of subregions of a [class@Gtk.TextBuffer]. `GtkSourceRegion` stores the subregions wit... |
| SearchContext | GObject.Object | 0 | 0 | 18 | Search context. A `GtkSourceSearchContext` is used for the search and replace in a [class@Buffer]. The search settings are represented by a [class@... |
| SearchSettings | GObject.Object | 0 | 0 | 13 | Search settings. A `GtkSourceSearchSettings` object represents the settings of a search. The search settings can be associated with one or several ... |
| Snippet | GObject.Object | 0 | 0 | 16 | Quick insertion code snippets. The `GtkSourceSnippet` represents a series of chunks that can quickly be inserted into the [class@View]. Snippets ar... |
| SnippetChunk | GObject.InitiallyUnowned | 0 | 0 | 14 | A chunk of text within the source snippet. The `GtkSourceSnippetChunk` represents a single chunk of text that may or may not be an edit point withi... |
| SnippetContext | GObject.Object | 0 | 1 | 9 | Context for expanding [class@SnippetChunk]. This class is currently used primary as a hashtable. However, the longer term goal is to have it hold o... |
| SnippetManager | GObject.Object | 0 | 0 | 7 | Provides access to [class@Snippet]. `GtkSourceSnippetManager` is an object which processes snippet description files and creates [class@Snippet] ob... |
| SpaceDrawer | GObject.Object | 0 | 0 | 8 | Represent white space characters with symbols. #GtkSourceSpaceDrawer provides a way to visualize white spaces, by drawing symbols. Call [method@Vie... |
| Style | GObject.Object | 0 | 0 | 2 | Represents a style. The `GtkSourceStyle` structure is used to describe text attributes which are set when given style is used. |
| StyleScheme | GObject.Object | 0 | 0 | 7 | Controls the appearance of [class@View]. #GtkSourceStyleScheme contains all the text styles to be used in [class@View] and [class@Buffer]. For inst... |
| StyleSchemeChooserButton | Gtk.Button | 0 | 0 | 1 | A button to launch a style scheme selection dialog. The `GtkSourceStyleSchemeChooserButton` is a button which displays the currently selected style... |
| StyleSchemeChooserWidget | Gtk.Widget | 0 | 0 | 1 | A widget for choosing style schemes. The `GtkSourceStyleSchemeChooserWidget` widget lets the user select a style scheme. By default, the chooser pr... |
| StyleSchemeManager | GObject.Object | 0 | 0 | 9 | Provides access to [class@StyleScheme]s. |
| StyleSchemePreview | Gtk.Widget | 0 | 1 | 4 | A preview widget for [class@StyleScheme]. This widget provides a convenient [class@Gtk.Widget] to preview a [class@StyleScheme]. The [property@Styl... |
| Tag | Gtk.TextTag | 0 | 0 | 1 | A tag that can be applied to text in a [class@Buffer]. `GtkSourceTag` is a subclass of [class@Gtk.TextTag] that adds properties useful for the GtkS... |
| View | Gtk.TextView | 1 | 10 | 42 | Subclass of [class@Gtk.TextView]. `GtkSourceView` is the main class of the GtkSourceView library. Use a [class@Buffer] to display text with a `GtkS... |
| VimIMContext | Gtk.IMContext | 0 | 4 | 4 | Vim emulation. The `GtkSourceVimIMContext` is a [class@Gtk.IMContext] implementation that can be used to provide Vim-like editing controls within a... |

### GtkSource.Buffer

Parent: `Gtk.TextBuffer` ?? GType: `GtkSourceBuffer` ?? C type: `GtkSourceBuffer`

Subclass of [class@Gtk.TextBuffer]. A `GtkSourceBuffer` object is the model for [class@View] widgets. It extends the [class@Gtk.TextBuffer] class b...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.TextBuffer |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Buffer.new(table: Gtk.TextTagTable?) -> Buffer` | gtk_source_buffer_new |  | Creates a new source buffer. |
| new_with_language | `Buffer.new_with_language(language: Language) -> Buffer` | gtk_source_buffer_new_with_language |  | Creates a new source buffer using the highlighting patterns in `language`. This is equivalent to creating a new source buffer with a new tag table ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| backward_iter_to_source_mark | `Buffer.backward_iter_to_source_mark(iter: inout Gtk.TextIter, category: utf8?) -> gboolean` | gtk_source_buffer_backward_iter_to_source_mark |  | Moves `iter` to the position of the previous [class@Mark] of the given category. Returns %TRUE if `iter` was moved. If `category` is NULL, the prev... |
| change_case | `Buffer.change_case(case_type: ChangeCaseType, start: Gtk.TextIter, end: Gtk.TextIter) -> none` | gtk_source_buffer_change_case |  | Changes the case of the text between the specified iterators. Since 5.4, this function will update the position of `start` and `end` to surround th... |
| create_source_mark | `Buffer.create_source_mark(name: utf8?, category: utf8, where: Gtk.TextIter) -> Mark` | gtk_source_buffer_create_source_mark |  | Creates a source mark in the `buffer` of category `category`. A source mark is a [class@Gtk.TextMark] but organized into categories. Depending on t... |
| create_source_tag | `Buffer.create_source_tag(tag_name: utf8?, first_property_name: utf8?, ...: void) -> Gtk.TextTag` | gtk_source_buffer_create_source_tag |  | In short, this is the same function as [method@Gtk.TextBuffer.create_tag] but instead of creating a [class@Gtk.TextTag], this function creates a [c... |
| ensure_highlight | `Buffer.ensure_highlight(start: Gtk.TextIter, end: Gtk.TextIter) -> none` | gtk_source_buffer_ensure_highlight |  | Forces buffer to analyze and highlight the given area synchronously. **Note**: This is a potentially slow operation and should be used only when yo... |
| forward_iter_to_source_mark | `Buffer.forward_iter_to_source_mark(iter: inout Gtk.TextIter, category: utf8?) -> gboolean` | gtk_source_buffer_forward_iter_to_source_mark |  | Moves `iter` to the position of the next [class@Mark] of the given `category`. Returns %TRUE if `iter` was moved. If `category` is NULL, the next s... |
| get_context_classes_at_iter | `Buffer.get_context_classes_at_iter(iter: Gtk.TextIter) -> utf8` | gtk_source_buffer_get_context_classes_at_iter |  | Get all defined context classes at @iter. See the [class@Buffer] description for the list of default context classes. |
| get_highlight_matching_brackets | `Buffer.get_highlight_matching_brackets() -> gboolean` | gtk_source_buffer_get_highlight_matching_brackets |  | Determines whether bracket match highlighting is activated for the source buffer. |
| get_highlight_syntax | `Buffer.get_highlight_syntax() -> gboolean` | gtk_source_buffer_get_highlight_syntax |  | Determines whether syntax highlighting is activated in the source buffer. |
| get_implicit_trailing_newline | `Buffer.get_implicit_trailing_newline() -> gboolean` | gtk_source_buffer_get_implicit_trailing_newline |  | whether the @buffer has an implicit trailing newline. |
| get_language | `Buffer.get_language() -> Language` | gtk_source_buffer_get_language |  | Returns the [class@Language] associated with the buffer, see [method@Buffer.set_language]. The returned object should not be unreferenced by the user. |
| get_loading | `Buffer.get_loading() -> gboolean` | gtk_source_buffer_get_loading |  |  |
| get_source_marks_at_iter | `Buffer.get_source_marks_at_iter(iter: Gtk.TextIter, category: utf8?) -> GLib.SList` | gtk_source_buffer_get_source_marks_at_iter |  | Returns the list of marks of the given category at @iter. If @category is %NULL it returns all marks at @iter. |
| get_source_marks_at_line | `Buffer.get_source_marks_at_line(line: gint, category: utf8?) -> GLib.SList` | gtk_source_buffer_get_source_marks_at_line |  | Returns the list of marks of the given category at @line. If @category is %NULL, all marks at @line are returned. |
| get_style_scheme | `Buffer.get_style_scheme() -> StyleScheme` | gtk_source_buffer_get_style_scheme |  | Returns the [class@StyleScheme] associated with the buffer, see [method@Buffer.set_style_scheme]. The returned object should not be unreferenced by... |
| iter_backward_to_context_class_toggle | `Buffer.iter_backward_to_context_class_toggle(iter: inout Gtk.TextIter, context_class: utf8) -> gboolean` | gtk_source_buffer_iter_backward_to_context_class_toggle |  | Moves backward to the next toggle (on or off) of the context class. If no matching context class toggles are found, returns %FALSE, otherwise %TRUE... |
| iter_forward_to_context_class_toggle | `Buffer.iter_forward_to_context_class_toggle(iter: inout Gtk.TextIter, context_class: utf8) -> gboolean` | gtk_source_buffer_iter_forward_to_context_class_toggle |  | Moves forward to the next toggle (on or off) of the context class. If no matching context class toggles are found, returns %FALSE, otherwise %TRUE.... |
| iter_has_context_class | `Buffer.iter_has_context_class(iter: Gtk.TextIter, context_class: utf8) -> gboolean` | gtk_source_buffer_iter_has_context_class |  | Check if the class @context_class is set on @iter. See the [class@Buffer] description for the list of default context classes. |
| join_lines | `Buffer.join_lines(start: Gtk.TextIter, end: Gtk.TextIter) -> none` | gtk_source_buffer_join_lines |  | Joins the lines of text between the specified iterators. |
| remove_source_marks | `Buffer.remove_source_marks(start: Gtk.TextIter, end: Gtk.TextIter, category: utf8?) -> none` | gtk_source_buffer_remove_source_marks |  | Remove all marks of @category between @start and @end from the buffer. If @category is NULL, all marks in the range will be removed. |
| set_highlight_matching_brackets | `Buffer.set_highlight_matching_brackets(highlight: gboolean) -> none` | gtk_source_buffer_set_highlight_matching_brackets |  | Controls the bracket match highlighting function in the buffer. If activated, when you position your cursor over a bracket character (a parenthesis... |
| set_highlight_syntax | `Buffer.set_highlight_syntax(highlight: gboolean) -> none` | gtk_source_buffer_set_highlight_syntax |  | Controls whether syntax is highlighted in the buffer. If @highlight is %TRUE, the text will be highlighted according to the syntax patterns specifi... |
| set_implicit_trailing_newline | `Buffer.set_implicit_trailing_newline(implicit_trailing_newline: gboolean) -> none` | gtk_source_buffer_set_implicit_trailing_newline |  | Sets whether the @buffer has an implicit trailing newline. If an explicit trailing newline is present in a [class@Gtk.TextBuffer], [class@Gtk.TextV... |
| set_language | `Buffer.set_language(language: Language?) -> none` | gtk_source_buffer_set_language |  | Associates a [class@Language] with the buffer. Note that a [class@Language] affects not only the syntax highlighting, but also the context classes.... |
| set_style_scheme | `Buffer.set_style_scheme(scheme: StyleScheme?) -> none` | gtk_source_buffer_set_style_scheme |  | Sets a [class@StyleScheme] to be used by the buffer and the view. Note that a [class@StyleScheme] affects not only the syntax highlighting, but als... |
| sort_lines | `Buffer.sort_lines(start: Gtk.TextIter, end: Gtk.TextIter, flags: SortFlags, column: gint) -> none` | gtk_source_buffer_sort_lines |  | Sort the lines of text between the specified iterators. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| highlight-matching-brackets | gboolean | read, write | Whether to highlight matching brackets in the buffer. |
| highlight-syntax | gboolean | read, write | Whether to highlight syntax in the buffer. |
| implicit-trailing-newline | gboolean | read, write | Whether the buffer has an implicit trailing newline. See [method@Buffer.set_implicit_trailing_newline]. |
| language | Language | read, write |  |
| loading | gboolean | read | The "loading" property denotes that a `GtkSourceFileLoader` is currently loading the buffer. Applications may want to use this setting to avoid doi... |
| style-scheme | StyleScheme | read, write | Style scheme. It contains styles for syntax highlighting, optionally foreground, background, cursor color, current line color, and matching bracket... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| bracket-matched | `iter: Gtk.TextIter?, state: BracketMatchType` | none | last |  | @iter is set to a valid iterator pointing to the matching bracket if @state is %GTK_SOURCE_BRACKET_MATCH_FOUND. Otherwise @iter is meaningless. The... |
| cursor-moved | `` | none | last |  | The "cursor-moved" signal is emitted when then insertion mark has moved. |
| highlight-updated | `start: Gtk.TextIter, end: Gtk.TextIter` | none | last |  | The ::highlight-updated signal is emitted when the syntax highlighting and context classes are updated in a certain region of the @buffer. |
| source-mark-updated | `mark: Gtk.TextMark` | none | last |  | The ::source-mark-updated signal is emitted each time a mark is added to, moved or removed from the @buffer. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| bracket_matched | `bracket_matched(iter: Gtk.TextIter, state: BracketMatchType) -> none` |  |  |  |

### GtkSource.Completion

Parent: `GObject.Object` ?? GType: `GtkSourceCompletion` ?? C type: `GtkSourceCompletion`

Main Completion Object. The completion system helps the user when they writes some text, such as words, command names, functions, and suchlike. Pro...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| fuzzy_highlight | `fuzzy_highlight(haystack: utf8, casefold_query: utf8) -> Pango.AttrList` | gtk_source_completion_fuzzy_highlight |  | This will add `<b>` tags around matched characters in @haystack based on @casefold_query. |
| fuzzy_match | `fuzzy_match(haystack: utf8?, casefold_needle: utf8, priority: out guint?) -> gboolean` | gtk_source_completion_fuzzy_match |  | This helper function can do a fuzzy match for you giving a haystack and casefolded needle. Casefold your needle using [func@GLib.utf8_casefold] bef... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_provider | `Completion.add_provider(provider: CompletionProvider) -> none` | gtk_source_completion_add_provider |  | Adds a [iface@CompletionProvider] to the list of providers to be queried for completion results. |
| block_interactive | `Completion.block_interactive() -> none` | gtk_source_completion_block_interactive |  |  |
| get_buffer | `Completion.get_buffer() -> Buffer` | gtk_source_completion_get_buffer |  | Gets the connected [class@View]'s [class@Buffer] |
| get_page_size | `Completion.get_page_size() -> guint` | gtk_source_completion_get_page_size |  |  |
| get_view | `Completion.get_view() -> View` | gtk_source_completion_get_view |  | Gets the [class@View] that owns the [class@Completion]. |
| hide | `Completion.hide() -> none` | gtk_source_completion_hide |  | Emits the "hide" signal. When the "hide" signal is emitted, the completion window will be dismissed. |
| remove_provider | `Completion.remove_provider(provider: CompletionProvider) -> none` | gtk_source_completion_remove_provider |  | Removes a [iface@CompletionProvider] previously added with [method@Completion.add_provider]. |
| set_page_size | `Completion.set_page_size(page_size: guint) -> none` | gtk_source_completion_set_page_size |  |  |
| show | `Completion.show() -> none` | gtk_source_completion_show |  | Emits the "show" signal. When the "show" signal is emitted, the completion window will be displayed if there are any results available. |
| unblock_interactive | `Completion.unblock_interactive() -> none` | gtk_source_completion_unblock_interactive |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| buffer | Gtk.TextView | read | The #GtkTextBuffer for the #GtkSourceCompletion:view. This is a convenience property for providers. |
| page-size | guint | read, write | The number of rows to display to the user before scrolling. |
| remember-info-visibility | gboolean | read, write | Determines whether the visibility of the info window should be saved when the completion is hidden, and restored when the completion is shown again. |
| select-on-show | gboolean | read, write | Determines whether the first proposal should be selected when the completion is first shown. |
| show-icons | gboolean | read, write | The "show-icons" property denotes if icons should be displayed within the list of completions presented to the user. |
| view | View | read, write, construct-only | The "view" property is the #GtkTextView for which this #GtkSourceCompletion is providing completion features. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| hide | `` | none | last |  | The "hide" signal is emitted when the completion window should be hidden. |
| provider-added | `provider: CompletionProvider` | none | last |  | The "provided-added" signal is emitted when a new provider is added to the completion. |
| provider-removed | `provider: CompletionProvider` | none | last |  | The "provided-removed" signal is emitted when a provider has been removed from the completion. |
| show | `` | none | last |  | The "show" signal is emitted when the completion window should be shown. |

### GtkSource.CompletionCell

Parent: `Gtk.Widget` ?? Implements: `Gtk.Accessible`, `Gtk.Buildable`, `Gtk.ConstraintTarget` ?? GType: `GtkSourceCompletionCell` ?? C type: `GtkSourceCompletionCell`

Widget for single cell of completion proposal. The `GtkSourceCompletionCell` widget provides a container to display various types of information wi...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_column | `CompletionCell.get_column() -> CompletionColumn` | gtk_source_completion_cell_get_column |  |  |
| get_widget | `CompletionCell.get_widget() -> Gtk.Widget` | gtk_source_completion_cell_get_widget |  | Gets the child #GtkWidget, if any. |
| set_gicon | `CompletionCell.set_gicon(gicon: Gio.Icon) -> none` | gtk_source_completion_cell_set_gicon |  |  |
| set_icon_name | `CompletionCell.set_icon_name(icon_name: utf8) -> none` | gtk_source_completion_cell_set_icon_name |  |  |
| set_markup | `CompletionCell.set_markup(markup: utf8) -> none` | gtk_source_completion_cell_set_markup |  |  |
| set_paintable | `CompletionCell.set_paintable(paintable: Gdk.Paintable) -> none` | gtk_source_completion_cell_set_paintable |  |  |
| set_text | `CompletionCell.set_text(text: utf8?) -> none` | gtk_source_completion_cell_set_text |  | Sets the text for the column cell. Use %NULL to unset. |
| set_text_with_attributes | `CompletionCell.set_text_with_attributes(text: utf8, attrs: Pango.AttrList) -> none` | gtk_source_completion_cell_set_text_with_attributes |  |  |
| set_widget | `CompletionCell.set_widget(child: Gtk.Widget) -> none` | gtk_source_completion_cell_set_widget |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| column | CompletionColumn | read, write, construct-only |  |
| markup | utf8 | read, write |  |
| paintable | Gdk.Paintable | read, write |  |
| text | utf8 | read, write |  |
| widget | Gtk.Widget | read, write |  |

### GtkSource.CompletionContext

Parent: `GObject.Object` ?? Implements: `Gio.ListModel` ?? GType: `GtkSourceCompletionContext` ?? C type: `GtkSourceCompletionContext`

The context of a completion. `GtkSourceCompletionContext` contains information about an attept to display completion proposals to the user based on...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_activation | `CompletionContext.get_activation() -> CompletionActivation` | gtk_source_completion_context_get_activation |  | Gets the mode for which the context was activated. |
| get_bounds | `CompletionContext.get_bounds(begin: out Gtk.TextIter?, end: out Gtk.TextIter?) -> gboolean` | gtk_source_completion_context_get_bounds |  | Gets the bounds for the completion, which is the beginning of the current word (taking break characters into account) to the current insertion curs... |
| get_buffer | `CompletionContext.get_buffer() -> Buffer` | gtk_source_completion_context_get_buffer |  | Gets the underlying buffer used by the context. This is a convenience function to get the buffer via the #GtkSourceCompletion property. |
| get_busy | `CompletionContext.get_busy() -> gboolean` | gtk_source_completion_context_get_busy |  | Gets the "busy" property. This is set to %TRUE while the completion context is actively fetching proposals from registered #GtkSourceCompletionProv... |
| get_completion | `CompletionContext.get_completion() -> Completion` | gtk_source_completion_context_get_completion |  | Gets the #GtkSourceCompletion that created the context. |
| get_empty | `CompletionContext.get_empty() -> gboolean` | gtk_source_completion_context_get_empty |  | Checks if any proposals have been provided to the context. Out of convenience, this function will return %TRUE if @self is %NULL. |
| get_language | `CompletionContext.get_language() -> Language` | gtk_source_completion_context_get_language |  | Gets the language of the underlying buffer, if any. |
| get_proposals_for_provider | `CompletionContext.get_proposals_for_provider(provider: CompletionProvider) -> Gio.ListModel` | gtk_source_completion_context_get_proposals_for_provider | 5.6 | Gets the #GListModel associated with the provider. You can connect to #GtkSourceCompletionContext::model-changed to receive notifications about whe... |
| get_view | `CompletionContext.get_view() -> View` | gtk_source_completion_context_get_view |  | Gets the text view for the context. |
| get_word | `CompletionContext.get_word() -> utf8` | gtk_source_completion_context_get_word |  | Gets the word that is being completed up to the position of the insert mark. |
| list_providers | `CompletionContext.list_providers() -> Gio.ListModel` | gtk_source_completion_context_list_providers | 5.6 | Gets the providers that are associated with the context. |
| set_proposals_for_provider | `CompletionContext.set_proposals_for_provider(provider: CompletionProvider, results: Gio.ListModel?) -> none` | gtk_source_completion_context_set_proposals_for_provider |  | This function allows providers to update their results for a context outside of a call to [method@CompletionProvider.populate_async]. This can be u... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| busy | gboolean | read | The "busy" property is %TRUE while the completion context is populating completion proposals. |
| completion | Completion | read, write, construct-only | The "completion" is the #GtkSourceCompletion that was used to create the context. |
| empty | gboolean | read | The "empty" property is %TRUE when there are no results. It will be notified when the first result is added or the last result is removed. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| provider-model-changed | `provider: CompletionProvider, model: Gio.ListModel?` | none | last | 5.6 | Emitted when a provider changes a model. This signal is primarily useful for #GtkSourceCompletionProvider's that want to track other providers in c... |

### GtkSource.CompletionSnippets

Parent: `GObject.Object` ?? Implements: `CompletionProvider` ?? GType: `GtkSourceCompletionSnippets` ?? C type: `GtkSourceCompletionSnippets`

A [iface@CompletionProvider] for the completion of snippets. The `GtkSourceCompletionSnippets` is an example of an implementation of the [iface@Com...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `CompletionSnippets.new() -> CompletionSnippets` | gtk_source_completion_snippets_new |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| priority | gint | read, write |  |
| title | utf8 | read, write |  |

### GtkSource.CompletionWords

Parent: `GObject.Object` ?? Implements: `CompletionProvider` ?? GType: `GtkSourceCompletionWords` ?? C type: `GtkSourceCompletionWords`

A [iface@CompletionProvider] for the completion of words. The `GtkSourceCompletionWords` is an example of an implementation of the [iface@Completio...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `CompletionWords.new(title: utf8?) -> CompletionWords` | gtk_source_completion_words_new |  | a new #GtkSourceCompletionWords provider |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| register | `CompletionWords.register(buffer: Gtk.TextBuffer) -> none` | gtk_source_completion_words_register |  | Registers @buffer in the @words provider. |
| unregister | `CompletionWords.unregister(buffer: Gtk.TextBuffer) -> none` | gtk_source_completion_words_unregister |  | Unregisters @buffer from the @words provider. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| minimum-word-size | guint | read, write |  |
| priority | gint | read, write |  |
| proposals-batch-size | guint | read, write |  |
| scan-batch-size | guint | read, write |  |
| title | utf8 | read, write |  |

### GtkSource.File

Parent: `GObject.Object` ?? GType: `GtkSourceFile` ?? C type: `GtkSourceFile`

On-disk representation of a [class@Buffer]. A `GtkSourceFile` object is the on-disk representation of a [class@Buffer]. With a `GtkSourceFile`, you...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `File.new() -> File` | gtk_source_file_new |  | a new #GtkSourceFile object. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| check_file_on_disk | `File.check_file_on_disk() -> none` | gtk_source_file_check_file_on_disk |  | Checks synchronously the file on disk, to know whether the file is externally modified, or has been deleted, and whether the file is read-only. #Gt... |
| get_compression_type | `File.get_compression_type() -> CompressionType` | gtk_source_file_get_compression_type |  | the compression type. |
| get_encoding | `File.get_encoding() -> Encoding` | gtk_source_file_get_encoding |  | The encoding is initially %NULL. After a successful file loading or saving operation, the encoding is non-%NULL. |
| get_location | `File.get_location() -> Gio.File` | gtk_source_file_get_location |  | the #GFile. |
| get_newline_type | `File.get_newline_type() -> NewlineType` | gtk_source_file_get_newline_type |  | the newline type. |
| is_deleted | `File.is_deleted() -> gboolean` | gtk_source_file_is_deleted |  | Returns whether the file has been deleted. If the [property@File:location] is %NULL, returns %FALSE. To have an up-to-date value, you must first ca... |
| is_externally_modified | `File.is_externally_modified() -> gboolean` | gtk_source_file_is_externally_modified |  | Returns whether the file is externally modified. If the [property@File:location] is %NULL, returns %FALSE. To have an up-to-date value, you must fi... |
| is_local | `File.is_local() -> gboolean` | gtk_source_file_is_local |  | Returns whether the file is local. If the [property@File:location] is %NULL, returns %FALSE. |
| is_readonly | `File.is_readonly() -> gboolean` | gtk_source_file_is_readonly |  | Returns whether the file is read-only. If the [property@File:location] is %NULL, returns %FALSE. To have an up-to-date value, you must first call [... |
| set_location | `File.set_location(location: Gio.File?) -> none` | gtk_source_file_set_location |  | Sets the location. |
| set_mount_operation_factory | `File.set_mount_operation_factory(callback: MountOperationFactory, user_data: gpointer?, notify: GLib.DestroyNotify?) -> none` | gtk_source_file_set_mount_operation_factory |  | Sets a [callback@MountOperationFactory] function that will be called when a [class@Gio.MountOperation] must be created. This is useful for creating... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| compression-type | CompressionType | read | The compression type. |
| encoding | Encoding | read | The character encoding, initially %NULL. After a successful file loading or saving operation, the encoding is non-%NULL. |
| location | Gio.File | read, write | The location. |
| newline-type | NewlineType | read | The line ending type. |
| read-only | gboolean | read | Whether the file is read-only or not. The value of this property is not updated automatically (there is no file monitors). |

### GtkSource.FileLoader

Parent: `GObject.Object` ?? GType: `GtkSourceFileLoader` ?? C type: `GtkSourceFileLoader`

Load a file into a GtkSourceBuffer. A `GtkSourceFileLoader` object permits to load the contents of a [iface@Gio.File] or a [class@Gio.InputStream] ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `FileLoader.new(buffer: Buffer, file: File) -> FileLoader` | gtk_source_file_loader_new |  | Creates a new `GtkSourceFileLoader` object. The contents is read from the [class@File]'s location. If not already done, call [method@File.set_locat... |
| new_from_stream | `FileLoader.new_from_stream(buffer: Buffer, file: File, stream: Gio.InputStream) -> FileLoader` | gtk_source_file_loader_new_from_stream |  | Creates a new #GtkSourceFileLoader object. The contents is read from @stream. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_buffer | `FileLoader.get_buffer() -> Buffer` | gtk_source_file_loader_get_buffer |  | the #GtkSourceBuffer to load the contents into. |
| get_compression_type | `FileLoader.get_compression_type() -> CompressionType` | gtk_source_file_loader_get_compression_type |  | the detected compression type. |
| get_encoding | `FileLoader.get_encoding() -> Encoding` | gtk_source_file_loader_get_encoding |  | the detected file encoding. |
| get_file | `FileLoader.get_file() -> File` | gtk_source_file_loader_get_file |  | the #GtkSourceFile. |
| get_input_stream | `FileLoader.get_input_stream() -> Gio.InputStream` | gtk_source_file_loader_get_input_stream |  | the #GInputStream to load, or %NULL if a #GFile is used. |
| get_location | `FileLoader.get_location() -> Gio.File` | gtk_source_file_loader_get_location |  | the #GFile to load, or %NULL if an input stream is used. |
| get_newline_type | `FileLoader.get_newline_type() -> NewlineType` | gtk_source_file_loader_get_newline_type |  | the detected newline type. |
| load_async | `FileLoader.load_async(io_priority: gint, cancellable: Gio.Cancellable?, progress_callback: Gio.FileProgressCallback?, progress_callback_data: gpointer?, progress_callback_notify: GLib.DestroyNotify?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gtk_source_file_loader_load_async |  | Loads asynchronously the file or input stream contents into the [class@Buffer]. See the [iface@Gio.AsyncResult] documentation to know how to use th... |
| load_finish | `FileLoader.load_finish(result: Gio.AsyncResult) -> gboolean throws` | gtk_source_file_loader_load_finish |  | Finishes a file loading started with [method@FileLoader.load_async]. If the contents has been loaded, the following [class@File] properties will be... |
| set_candidate_encodings | `FileLoader.set_candidate_encodings(candidate_encodings: GLib.SList) -> none` | gtk_source_file_loader_set_candidate_encodings |  | Sets the candidate encodings for the file loading. The encodings are tried in the same order as the list. For convenience, @candidate_encodings can... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| buffer | Buffer | read, write, construct-only | The #GtkSourceBuffer to load the contents into. The #GtkSourceFileLoader object has a weak reference to the buffer. |
| file | File | read, write, construct-only | The #GtkSourceFile. The #GtkSourceFileLoader object has a weak reference to the file. |
| input-stream | Gio.InputStream | read, write, construct-only | The #GInputStream to load. Useful for reading stdin. If this property is set, the #GtkSourceFileLoader:location property is ignored. |
| location | Gio.File | read, write, construct-only | The #GFile to load. If the #GtkSourceFileLoader:input-stream is %NULL, by default the location is taken from the #GtkSourceFile at construction time. |

### GtkSource.FileSaver

Parent: `GObject.Object` ?? GType: `GtkSourceFileSaver` ?? C type: `GtkSourceFileSaver`

Save a [class@Buffer] into a file. A `GtkSourceFileSaver` object permits to save a [class@Buffer] into a [iface@Gio.File]. A file saver should be u...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `FileSaver.new(buffer: Buffer, file: File) -> FileSaver` | gtk_source_file_saver_new |  | Creates a new #GtkSourceFileSaver object. The @buffer will be saved to the [class@File]'s location. This constructor is suitable for a simple "save... |
| new_with_target | `FileSaver.new_with_target(buffer: Buffer, file: File, target_location: Gio.File) -> FileSaver` | gtk_source_file_saver_new_with_target |  | Creates a new #GtkSourceFileSaver object with a target location. When the file saving is finished successfully, @target_location is set to the @fil... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_buffer | `FileSaver.get_buffer() -> Buffer` | gtk_source_file_saver_get_buffer |  | the #GtkSourceBuffer to save. |
| get_compression_type | `FileSaver.get_compression_type() -> CompressionType` | gtk_source_file_saver_get_compression_type |  | the compression type. |
| get_encoding | `FileSaver.get_encoding() -> Encoding` | gtk_source_file_saver_get_encoding |  | the encoding. |
| get_file | `FileSaver.get_file() -> File` | gtk_source_file_saver_get_file |  | the #GtkSourceFile. |
| get_flags | `FileSaver.get_flags() -> FileSaverFlags` | gtk_source_file_saver_get_flags |  | the flags. |
| get_location | `FileSaver.get_location() -> Gio.File` | gtk_source_file_saver_get_location |  | the #GFile where to save the buffer to. |
| get_newline_type | `FileSaver.get_newline_type() -> NewlineType` | gtk_source_file_saver_get_newline_type |  | the newline type. |
| save_async | `FileSaver.save_async(io_priority: gint, cancellable: Gio.Cancellable?, progress_callback: Gio.FileProgressCallback?, progress_callback_data: gpointer?, progress_callback_notify: GLib.DestroyNotify?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gtk_source_file_saver_save_async |  | Saves asynchronously the buffer into the file. See the [iface@Gio.AsyncResult] documentation to know how to use this function. |
| save_finish | `FileSaver.save_finish(result: Gio.AsyncResult) -> gboolean throws` | gtk_source_file_saver_save_finish |  | Finishes a file saving started with [method@FileSaver.save_async]. If the file has been saved successfully, the following [class@File] properties w... |
| set_compression_type | `FileSaver.set_compression_type(compression_type: CompressionType) -> none` | gtk_source_file_saver_set_compression_type |  | Sets the compression type. By default the compression type is taken from the #GtkSourceFile. |
| set_encoding | `FileSaver.set_encoding(encoding: Encoding?) -> none` | gtk_source_file_saver_set_encoding |  | Sets the encoding. If @encoding is %NULL, the UTF-8 encoding will be set. By default the encoding is taken from the #GtkSourceFile. |
| set_flags | `FileSaver.set_flags(flags: FileSaverFlags) -> none` | gtk_source_file_saver_set_flags |  | a #GtkSourceFileSaver. |
| set_newline_type | `FileSaver.set_newline_type(newline_type: NewlineType) -> none` | gtk_source_file_saver_set_newline_type |  | Sets the newline type. By default the newline type is taken from the #GtkSourceFile. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| buffer | Buffer | read, write, construct-only | The #GtkSourceBuffer to save. The #GtkSourceFileSaver object has a weak reference to the buffer. |
| compression-type | CompressionType | read, write | The compression type. |
| encoding | Encoding | read, write | The file's encoding. |
| file | File | read, write, construct-only | The #GtkSourceFile. The #GtkSourceFileSaver object has a weak reference to the file. |
| flags | FileSaverFlags | read, write | File saving flags. |
| location | Gio.File | read, write, construct-only | The #GFile where to save the buffer. By default the location is taken from the #GtkSourceFile at construction time. |
| newline-type | NewlineType | read, write | The newline type. |

### GtkSource.Gutter

Parent: `Gtk.Widget` ?? Implements: `Gtk.Accessible`, `Gtk.Buildable`, `Gtk.ConstraintTarget` ?? GType: `GtkSourceGutter` ?? C type: `GtkSourceGutter`

Gutter object for [class@View]. The `GtkSourceGutter` object represents the left or right gutter of the text view. It is used by [class@View] to dr...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_view | `Gutter.get_view() -> View` | gtk_source_gutter_get_view |  | the associated #GtkSourceView. |
| insert | `Gutter.insert(renderer: GutterRenderer, position: gint) -> gboolean` | gtk_source_gutter_insert |  | Insert @renderer into the gutter. If @renderer is yet unowned then gutter claims its ownership. Otherwise just increases renderer's reference count... |
| remove | `Gutter.remove(renderer: GutterRenderer) -> none` | gtk_source_gutter_remove |  |  |
| reorder | `Gutter.reorder(renderer: GutterRenderer, position: gint) -> none` | gtk_source_gutter_reorder |  | Reorders @renderer in @gutter to new @position. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| view | View | read, write, construct-only | The #GtkSourceView of the gutter. |
| window-type | Gtk.TextWindowType | read, write, construct-only | The text window type on which the window is placed. |

### GtkSource.GutterLines

Parent: `GObject.Object` ?? GType: `GtkSourceGutterLines` ?? C type: `GtkSourceGutterLines`

Collected information about visible lines. The `GtkSourceGutterLines` object is used to collect information about visible lines. Use this from your...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_class | `GutterLines.add_class(line: guint, name: utf8) -> none` | gtk_source_gutter_lines_add_class |  | Adds the class @name to @line. @name will be converted to a [alias@GLib.Quark] as part of this process. A faster version of this function is availa... |
| add_qclass | `GutterLines.add_qclass(line: guint, qname: GLib.Quark) -> none` | gtk_source_gutter_lines_add_qclass |  | Adds the class denoted by @qname to @line. You may check if a line has @qname by calling [method@GutterLines.has_qclass]. You can remove @qname by ... |
| get_buffer | `GutterLines.get_buffer() -> Gtk.TextBuffer` | gtk_source_gutter_lines_get_buffer |  | Gets the [class@Gtk.TextBuffer] that the `GtkSourceGutterLines` represents. |
| get_first | `GutterLines.get_first() -> guint` | gtk_source_gutter_lines_get_first |  | Gets the line number (starting from 0) for the first line that is user visible. |
| get_iter_at_line | `GutterLines.get_iter_at_line(iter: out Gtk.TextIter, line: guint) -> none` | gtk_source_gutter_lines_get_iter_at_line |  | Gets a #GtkTextIter for the current buffer at @line |
| get_last | `GutterLines.get_last() -> guint` | gtk_source_gutter_lines_get_last |  | Gets the line number (starting from 0) for the last line that is user visible. |
| get_line_yrange | `GutterLines.get_line_yrange(line: guint, mode: GutterRendererAlignmentMode, y: out gint, height: out gint) -> none` | gtk_source_gutter_lines_get_line_yrange |  | Gets the Y range for a line based on @mode. The value for @y is relative to the renderers widget coordinates. |
| get_view | `GutterLines.get_view() -> Gtk.TextView` | gtk_source_gutter_lines_get_view |  | Gets the [class@Gtk.TextView] that the `GtkSourceGutterLines` represents. |
| has_any_class | `GutterLines.has_any_class(line: guint) -> gboolean` | gtk_source_gutter_lines_has_any_class | 5.6 | Checks to see if the line has any GQuark classes set. This can be used to help renderer implementations avoid work if nothing has been set on the c... |
| has_class | `GutterLines.has_class(line: guint, name: utf8) -> gboolean` | gtk_source_gutter_lines_has_class |  | Checks to see if [method@GutterLines.add_class] was called with the @name for @line. A faster version of this function is provided via [method@Gutt... |
| has_qclass | `GutterLines.has_qclass(line: guint, qname: GLib.Quark) -> gboolean` | gtk_source_gutter_lines_has_qclass |  | Checks to see if [method@GutterLines.add_qclass] was called with the quark denoted by @qname for @line. |
| is_cursor | `GutterLines.is_cursor(line: guint) -> gboolean` | gtk_source_gutter_lines_is_cursor |  | Checks to see if @line contains the insertion cursor. |
| is_prelit | `GutterLines.is_prelit(line: guint) -> gboolean` | gtk_source_gutter_lines_is_prelit |  | Checks to see if @line is marked as prelit. Generally, this means the mouse pointer is over the line within the gutter. |
| is_selected | `GutterLines.is_selected(line: guint) -> gboolean` | gtk_source_gutter_lines_is_selected |  | Checks to see if the view had a selection and if that selection overlaps @line in some way. |
| remove_class | `GutterLines.remove_class(line: guint, name: utf8) -> none` | gtk_source_gutter_lines_remove_class |  | Removes the class matching @name from @line. A faster version of this function is available via [method@GutterLines.remove_qclass] for situations w... |
| remove_qclass | `GutterLines.remove_qclass(line: guint, qname: GLib.Quark) -> none` | gtk_source_gutter_lines_remove_qclass |  | Reverses a call to [method@GutterLines.add_qclass] by removing the [alias@GLib.Quark] matching @qname. |

### GtkSource.GutterRenderer

Parent: `Gtk.Widget` ?? Subclasses: `GutterRendererPixbuf`, `GutterRendererText` ?? Implements: `Gtk.Accessible`, `Gtk.Buildable`, `Gtk.ConstraintTarget` ?? GType: `GtkSourceGutterRenderer` ?? C type: `GtkSourceGutterRenderer` ?? Abstract

Gutter cell renderer. A `GtkSourceGutterRenderer` represents a column in a [class@Gutter]. The column contains one cell for each visible line of th...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.Widget |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| activate | `GutterRenderer.activate(iter: Gtk.TextIter, area: Gdk.Rectangle, button: guint, state: Gdk.ModifierType, n_presses: gint) -> none` | gtk_source_gutter_renderer_activate |  | Emits the [signal@GutterRenderer::activate] signal of the renderer. This is called from [class@Gutter] and should never have to be called manually. |
| align_cell | `GutterRenderer.align_cell(line: guint, width: gfloat, height: gfloat, x: out gfloat, y: out gfloat) -> none` | gtk_source_gutter_renderer_align_cell |  | Locates where to render content that is @width x @height based on the renderers alignment and padding. The location will be placed into @x and @y a... |
| get_alignment_mode | `GutterRenderer.get_alignment_mode() -> GutterRendererAlignmentMode` | gtk_source_gutter_renderer_get_alignment_mode |  | Get the alignment mode. The alignment mode describes the manner in which the renderer is aligned (see [property@GutterRenderer:xalign] and [propert... |
| get_buffer | `GutterRenderer.get_buffer() -> Buffer` | gtk_source_gutter_renderer_get_buffer |  | Gets the [class@Buffer] for which the gutter renderer is drawing. |
| get_view | `GutterRenderer.get_view() -> View` | gtk_source_gutter_renderer_get_view |  | Get the view associated to the gutter renderer |
| get_xalign | `GutterRenderer.get_xalign() -> gfloat` | gtk_source_gutter_renderer_get_xalign |  | Gets the `xalign` property. This may be used to adjust where within the cell rectangle the renderer will draw. |
| get_xpad | `GutterRenderer.get_xpad() -> gint` | gtk_source_gutter_renderer_get_xpad |  | Gets the `xpad` property. This may be used to adjust the cell rectangle that the renderer will use to draw. |
| get_yalign | `GutterRenderer.get_yalign() -> gfloat` | gtk_source_gutter_renderer_get_yalign |  | Gets the `yalign` property. This may be used to adjust where within the cell rectangle the renderer will draw. |
| get_ypad | `GutterRenderer.get_ypad() -> gint` | gtk_source_gutter_renderer_get_ypad |  | Gets the `ypad` property. This may be used to adjust the cell rectangle that the renderer will use to draw. |
| query_activatable | `GutterRenderer.query_activatable(iter: Gtk.TextIter, area: Gdk.Rectangle) -> gboolean` | gtk_source_gutter_renderer_query_activatable |  | Get whether the renderer is activatable at the location provided. This is called from [class@Gutter] to determine whether a renderer is activatable... |
| set_alignment_mode | `GutterRenderer.set_alignment_mode(mode: GutterRendererAlignmentMode) -> none` | gtk_source_gutter_renderer_set_alignment_mode |  | Set the alignment mode. The alignment mode describes the manner in which the renderer is aligned (see [property@GutterRenderer:xalign] and [propert... |
| set_xalign | `GutterRenderer.set_xalign(xalign: gfloat) -> none` | gtk_source_gutter_renderer_set_xalign |  | Adjusts the `xalign` property. This may be used to adjust where within the cell rectangle the renderer will draw. |
| set_xpad | `GutterRenderer.set_xpad(xpad: gint) -> none` | gtk_source_gutter_renderer_set_xpad |  | Adjusts the `xpad` property. This may be used to adjust the cell rectangle that the renderer will use to draw. |
| set_yalign | `GutterRenderer.set_yalign(yalign: gfloat) -> none` | gtk_source_gutter_renderer_set_yalign |  | Adjusts the `yalign` property. This may be used to adjust where within the cell rectangle the renderer will draw. |
| set_ypad | `GutterRenderer.set_ypad(ypad: gint) -> none` | gtk_source_gutter_renderer_set_ypad |  | Adjusts the `ypad` property. This may be used to adjust the cell rectangle that the renderer will use to draw. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| alignment-mode | GutterRendererAlignmentMode | read, write | The alignment mode of the renderer. This can be used to indicate that in the case a cell spans multiple lines (due to text wrapping) the alignment ... |
| lines | GutterLines | read | Contains information about the lines to be rendered. It should be used by #GtkSourceGutterRenderer implementations from [vfunc@Gtk.Widget.snapshot]. |
| view | Gtk.TextView | read | The view on which the renderer is placed. |
| xalign | gfloat | read, write | The horizontal alignment of the renderer. Set to 0 for a left alignment. 1 for a right alignment. And 0.5 for centering the cells. A value lower th... |
| xpad | gint | read, write | The left and right padding of the renderer. |
| yalign | gfloat | read, write | The vertical alignment of the renderer. Set to 0 for a top alignment. 1 for a bottom alignment. And 0.5 for centering the cells. A value lower than... |
| ypad | gint | read, write | The top and bottom padding of the renderer. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| activate | `iter: Gtk.TextIter, area: Gdk.Rectangle, button: guint, state: Gdk.ModifierType, n_presses: gint` | none | last |  | The signal is emitted when the renderer is activated. |
| query-activatable | `iter: Gtk.TextIter, area: Gdk.Rectangle` | gboolean | last |  | The signal is emitted when the renderer can possibly be activated. |
| query-data | `object: GObject.Object, p0: guint` | none | last |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| activate | `activate(iter: Gtk.TextIter, area: Gdk.Rectangle, button: guint, state: Gdk.ModifierType, n_presses: gint) -> none` |  |  | Emits the [signal@GutterRenderer::activate] signal of the renderer. This is called from [class@Gutter] and should never have to be called manually. |
| begin | `begin(lines: GutterLines) -> none` |  |  |  |
| change_buffer | `change_buffer(old_buffer: Buffer?) -> none` |  |  | This is called when the text buffer changes for @renderer. |
| change_view | `change_view(old_view: View?) -> none` |  |  | This is called when the text view changes for @renderer. |
| end | `end() -> none` |  |  |  |
| query_activatable | `query_activatable(iter: Gtk.TextIter, area: Gdk.Rectangle) -> gboolean` |  |  | Get whether the renderer is activatable at the location provided. This is called from [class@Gutter] to determine whether a renderer is activatable... |
| query_data | `query_data(lines: GutterLines, line: guint) -> none` |  |  |  |
| snapshot_line | `snapshot_line(snapshot: Gtk.Snapshot, lines: GutterLines, line: guint) -> none` |  |  |  |

### GtkSource.GutterRendererPixbuf

Parent: `GutterRenderer` ?? Implements: `Gtk.Accessible`, `Gtk.Buildable`, `Gtk.ConstraintTarget` ?? GType: `GtkSourceGutterRendererPixbuf` ?? C type: `GtkSourceGutterRendererPixbuf`

Renders a pixbuf in the gutter. A `GtkSourceGutterRendererPixbuf` can be used to render an image in a cell of [class@Gutter].

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GutterRenderer |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `GutterRendererPixbuf.new() -> GutterRenderer` | gtk_source_gutter_renderer_pixbuf_new |  | Create a new #GtkSourceGutterRendererPixbuf. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_gicon | `GutterRendererPixbuf.get_gicon() -> Gio.Icon` | gtk_source_gutter_renderer_pixbuf_get_gicon |  | Get the gicon of the renderer |
| get_icon_name | `GutterRendererPixbuf.get_icon_name() -> utf8` | gtk_source_gutter_renderer_pixbuf_get_icon_name |  |  |
| get_paintable | `GutterRendererPixbuf.get_paintable() -> Gdk.Paintable` | gtk_source_gutter_renderer_pixbuf_get_paintable |  | Gets a [iface@Gdk.Paintable] that was set with [method@GutterRendererPixbuf.set_paintable] |
| get_pixbuf | `GutterRendererPixbuf.get_pixbuf() -> GdkPixbuf.Pixbuf` | gtk_source_gutter_renderer_pixbuf_get_pixbuf |  | Get the pixbuf of the renderer. |
| overlay_paintable | `GutterRendererPixbuf.overlay_paintable(paintable: Gdk.Paintable) -> none` | gtk_source_gutter_renderer_pixbuf_overlay_paintable |  | Allows overlaying a paintable on top of any other image that has been set for the pixbuf. This will be applied when the widget is next snapshot. |
| set_gicon | `GutterRendererPixbuf.set_gicon(icon: Gio.Icon?) -> none` | gtk_source_gutter_renderer_pixbuf_set_gicon |  | a #GtkSourceGutterRendererPixbuf |
| set_icon_name | `GutterRendererPixbuf.set_icon_name(icon_name: utf8?) -> none` | gtk_source_gutter_renderer_pixbuf_set_icon_name |  | a #GtkSourceGutterRendererPixbuf |
| set_paintable | `GutterRendererPixbuf.set_paintable(paintable: Gdk.Paintable?) -> none` | gtk_source_gutter_renderer_pixbuf_set_paintable |  | a #GtkSourceGutterRendererPixbuf |
| set_pixbuf | `GutterRendererPixbuf.set_pixbuf(pixbuf: GdkPixbuf.Pixbuf?) -> none` | gtk_source_gutter_renderer_pixbuf_set_pixbuf |  | a #GtkSourceGutterRendererPixbuf |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| gicon | Gio.Icon | read, write |  |
| icon-name | utf8 | read, write |  |
| paintable | Gdk.Paintable | read, write |  |
| pixbuf | GdkPixbuf.Pixbuf | read, write |  |

### GtkSource.GutterRendererText

Parent: `GutterRenderer` ?? Implements: `Gtk.Accessible`, `Gtk.Buildable`, `Gtk.ConstraintTarget` ?? GType: `GtkSourceGutterRendererText` ?? C type: `GtkSourceGutterRendererText`

Renders text in the gutter. A `GtkSourceGutterRendererText` can be used to render text in a cell of [class@Gutter].

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GutterRenderer |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `GutterRendererText.new() -> GutterRenderer` | gtk_source_gutter_renderer_text_new |  | Create a new #GtkSourceGutterRendererText. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| measure | `GutterRendererText.measure(text: utf8, width: out gint?, height: out gint?) -> none` | gtk_source_gutter_renderer_text_measure |  | Measures the text provided using the pango layout used by the #GtkSourceGutterRendererText. |
| measure_markup | `GutterRendererText.measure_markup(markup: utf8, width: out gint?, height: out gint?) -> none` | gtk_source_gutter_renderer_text_measure_markup |  | Measures the pango markup provided using the pango layout used by the #GtkSourceGutterRendererText. |
| set_markup | `GutterRendererText.set_markup(markup: utf8, length: gint) -> none` | gtk_source_gutter_renderer_text_set_markup |  |  |
| set_text | `GutterRendererText.set_text(text: utf8, length: gint) -> none` | gtk_source_gutter_renderer_text_set_text |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| markup | utf8 | read, write |  |
| text | utf8 | read, write |  |

### GtkSource.Hover

Parent: `GObject.Object` ?? GType: `GtkSourceHover` ?? C type: `GtkSourceHover`

Interactive tooltips. `GtkSourceHover` allows a [class@View] to provide contextual information. When enabled, if the user hovers over a word in the...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_provider | `Hover.add_provider(provider: HoverProvider) -> none` | gtk_source_hover_add_provider |  |  |
| remove_provider | `Hover.remove_provider(provider: HoverProvider) -> none` | gtk_source_hover_remove_provider |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| hover-delay | guint | read, write | Contains the number of milliseconds to delay before showing the hover assistant. |

### GtkSource.HoverContext

Parent: `GObject.Object` ?? GType: `GtkSourceHoverContext` ?? C type: `GtkSourceHoverContext`

Context for populating [class@HoverDisplay] contents. `GtkSourceHoverContext` contains information about the request to populate contents for a [cl...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_bounds | `HoverContext.get_bounds(begin: out Gtk.TextIter?, end: out Gtk.TextIter?) -> gboolean` | gtk_source_hover_context_get_bounds |  | Gets the current word bounds of the hover. If @begin is non-%NULL, it will be set to the start position of the current word being hovered. If @end ... |
| get_buffer | `HoverContext.get_buffer() -> Buffer` | gtk_source_hover_context_get_buffer |  | A convenience function to get the buffer. |
| get_iter | `HoverContext.get_iter(iter: Gtk.TextIter) -> gboolean` | gtk_source_hover_context_get_iter |  |  |
| get_view | `HoverContext.get_view() -> View` | gtk_source_hover_context_get_view |  | the #GtkSourceView that owns the context |

### GtkSource.HoverDisplay

Parent: `Gtk.Widget` ?? Implements: `Gtk.Accessible`, `Gtk.Buildable`, `Gtk.ConstraintTarget` ?? GType: `GtkSourceHoverDisplay` ?? C type: `GtkSourceHoverDisplay`

Display for interactive tooltips. `GtkSourceHoverDisplay` is a [class@Gtk.Widget] that may be populated with widgets to be displayed to the user in...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append | `HoverDisplay.append(child: Gtk.Widget) -> none` | gtk_source_hover_display_append |  |  |
| insert_after | `HoverDisplay.insert_after(child: Gtk.Widget, sibling: Gtk.Widget) -> none` | gtk_source_hover_display_insert_after |  |  |
| prepend | `HoverDisplay.prepend(child: Gtk.Widget) -> none` | gtk_source_hover_display_prepend |  |  |
| remove | `HoverDisplay.remove(child: Gtk.Widget) -> none` | gtk_source_hover_display_remove |  |  |

### GtkSource.Language

Parent: `GObject.Object` ?? GType: `GtkSourceLanguage` ?? C type: `GtkSourceLanguage`

Represents a syntax highlighted language. A `GtkSourceLanguage` represents a programming or markup language, affecting syntax highlighting and cont...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_globs | `Language.get_globs() -> utf8` | gtk_source_language_get_globs |  | Returns the globs associated to this language. This is just an utility wrapper around [method@Language.get_metadata] to retrieve the "globs" metada... |
| get_hidden | `Language.get_hidden() -> gboolean` | gtk_source_language_get_hidden |  | Returns whether the language should be hidden from the user. |
| get_id | `Language.get_id() -> utf8` | gtk_source_language_get_id |  | Returns the ID of the language. The ID is not locale-dependent.The returned string is owned by @language and should not be freed or modified. |
| get_metadata | `Language.get_metadata(name: utf8) -> utf8` | gtk_source_language_get_metadata |  | value of property @name stored in the metadata of @language or %NULL if language does not contain the specified metadata property. The returned str... |
| get_mime_types | `Language.get_mime_types() -> utf8` | gtk_source_language_get_mime_types |  | Returns the mime types associated to this language. This is just an utility wrapper around [method@Language.get_metadata] to retrieve the "mimetype... |
| get_name | `Language.get_name() -> utf8` | gtk_source_language_get_name |  | Returns the localized name of the language. The returned string is owned by @language and should not be freed or modified. |
| get_section | `Language.get_section() -> utf8` | gtk_source_language_get_section |  | Returns the localized section of the language. Each language belong to a section (ex. HTML belongs to the Markup section). The returned string is o... |
| get_style_fallback | `Language.get_style_fallback(style_id: utf8) -> utf8` | gtk_source_language_get_style_fallback |  | Returns the ID of the style to use if the specified @style_id is not present in the current style scheme. |
| get_style_ids | `Language.get_style_ids() -> utf8` | gtk_source_language_get_style_ids |  | Returns the ids of the styles defined by this @language. |
| get_style_name | `Language.get_style_name(style_id: utf8) -> utf8` | gtk_source_language_get_style_name |  | Returns the name of the style with ID @style_id defined by this @language. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| hidden | gboolean | read |  |
| id | utf8 | read |  |
| name | utf8 | read |  |
| section | utf8 | read |  |

### GtkSource.LanguageManager

Parent: `GObject.Object` ?? GType: `GtkSourceLanguageManager` ?? C type: `GtkSourceLanguageManager`

Provides access to [class@Language]s. `GtkSourceLanguageManager` is an object which processes language description files and creates and stores [cl...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `LanguageManager.new() -> LanguageManager` | gtk_source_language_manager_new |  | Creates a new language manager. If you do not need more than one language manager or a private language manager instance then use [func@LanguageMan... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default | `get_default() -> LanguageManager` | gtk_source_language_manager_get_default |  | Returns the default #GtkSourceLanguageManager instance. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_search_path | `LanguageManager.append_search_path(path: utf8) -> none` | gtk_source_language_manager_append_search_path | 5.4 | Appends @path to the list of directories where the @manager looks for language files. See [method@LanguageManager.set_search_path] for details. |
| get_language | `LanguageManager.get_language(id: utf8) -> Language` | gtk_source_language_manager_get_language |  | Gets the [class@Language] identified by the given @id in the language manager. |
| get_language_ids | `LanguageManager.get_language_ids() -> utf8` | gtk_source_language_manager_get_language_ids |  | Returns the ids of the available languages. |
| get_search_path | `LanguageManager.get_search_path() -> utf8` | gtk_source_language_manager_get_search_path |  | Gets the list directories where @lm looks for language files. |
| guess_language | `LanguageManager.guess_language(filename: filename?, content_type: utf8?) -> Language` | gtk_source_language_manager_guess_language |  | Picks a [class@Language] for given file name and content type, according to the information in lang files. Either @filename or @content_type may be... |
| prepend_search_path | `LanguageManager.prepend_search_path(path: utf8) -> none` | gtk_source_language_manager_prepend_search_path | 5.4 | Prepends @path to the list of directories where the @manager looks for language files. See [method@LanguageManager.set_search_path] for details. |
| set_search_path | `LanguageManager.set_search_path(dirs: utf8?) -> none` | gtk_source_language_manager_set_search_path |  | Sets the list of directories where the @lm looks for language files. If @dirs is %NULL, the search path is reset to default. At the moment this fun... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| language-ids | utf8 | read |  |
| search-path | utf8 | read, write |  |

### GtkSource.Map

Parent: `View` ?? Implements: `Gtk.Accessible`, `Gtk.AccessibleText`, `Gtk.Buildable`, `Gtk.ConstraintTarget`, `Gtk.Scrollable` ?? GType: `GtkSourceMap` ?? C type: `GtkSourceMap`

Widget that displays a map for a specific [class@View]. `GtkSourceMap` is a widget that maps the content of a [class@View] into a smaller view so t...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | View |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Map.new() -> Gtk.Widget` | gtk_source_map_new |  | Creates a new `GtkSourceMap`. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_view | `Map.get_view() -> View` | gtk_source_map_get_view |  | Gets the [property@Map:view] property, which is the view this widget is mapping. |
| set_view | `Map.set_view(view: View) -> none` | gtk_source_map_set_view |  | Sets the view that @map will be doing the mapping to. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| font-desc | Pango.FontDescription | read, write |  |
| view | View | read, write |  |

### GtkSource.Mark

Parent: `Gtk.TextMark` ?? GType: `GtkSourceMark` ?? C type: `GtkSourceMark`

Mark object for [class@Buffer]. A `GtkSourceMark` marks a position in the text where you want to display additional info. It is based on [class@Gtk...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.TextMark |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Mark.new(name: utf8?, category: utf8) -> Mark` | gtk_source_mark_new |  | Creates a text mark. Add it to a buffer using [method@Gtk.TextBuffer.add_mark]. If name is NULL, the mark is anonymous; otherwise, the mark can be ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_category | `Mark.get_category() -> utf8` | gtk_source_mark_get_category |  | Returns the mark category. |
| next | `Mark.next(category: utf8?) -> Mark` | gtk_source_mark_next |  | Returns the next `GtkSourceMark` in the buffer or %NULL if the mark was not added to a buffer. If there is no next mark, %NULL will be returned. If... |
| prev | `Mark.prev(category: utf8?) -> Mark` | gtk_source_mark_prev |  | Returns the previous `GtkSourceMark` in the buffer or %NULL if the mark was not added to a buffer. If there is no previous mark, %NULL is returned.... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| category | utf8 | read, write, construct-only | The category of the `GtkSourceMark`, classifies the mark and controls which pixbuf is used and with which priority it is drawn. |

### GtkSource.MarkAttributes

Parent: `GObject.Object` ?? GType: `GtkSourceMarkAttributes` ?? C type: `GtkSourceMarkAttributes`

The source mark attributes object. `GtkSourceMarkAttributes` is an object specifying attributes used by a [class@View] to visually show lines marke...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MarkAttributes.new() -> MarkAttributes` | gtk_source_mark_attributes_new |  | Creates a new source mark attributes. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_background | `MarkAttributes.get_background(background: out Gdk.RGBA) -> gboolean` | gtk_source_mark_attributes_get_background |  | Stores background color in @background. |
| get_gicon | `MarkAttributes.get_gicon() -> Gio.Icon` | gtk_source_mark_attributes_get_gicon |  | Gets a [iface@Gio.Icon] to be used as a base for rendered icon. Note that the icon can be %NULL if it wasn't set earlier. |
| get_icon_name | `MarkAttributes.get_icon_name() -> utf8` | gtk_source_mark_attributes_get_icon_name |  | Gets a name of an icon to be used as a base for rendered icon. Note that the icon name can be %NULL if it wasn't set earlier. |
| get_pixbuf | `MarkAttributes.get_pixbuf() -> GdkPixbuf.Pixbuf` | gtk_source_mark_attributes_get_pixbuf |  | Gets a [class@GdkPixbuf.Pixbuf] to be used as a base for rendered icon. Note that the pixbuf can be %NULL if it wasn't set earlier. |
| get_tooltip_markup | `MarkAttributes.get_tooltip_markup(mark: Mark) -> utf8` | gtk_source_mark_attributes_get_tooltip_markup |  | Queries for a tooltip by emitting a [signal@MarkAttributes::query-tooltip-markup] signal. The tooltip may contain a markup. |
| get_tooltip_text | `MarkAttributes.get_tooltip_text(mark: Mark) -> utf8` | gtk_source_mark_attributes_get_tooltip_text |  | Queries for a tooltip by emitting a [signal@MarkAttributes::query-tooltip-text] signal. The tooltip is a plain text. |
| render_icon | `MarkAttributes.render_icon(widget: Gtk.Widget, size: gint) -> Gdk.Paintable` | gtk_source_mark_attributes_render_icon |  | Renders an icon of given size. The base of the icon is set by the last call to one of: - [method@MarkAttributes.set_pixbuf] - [method@MarkAttribute... |
| set_background | `MarkAttributes.set_background(background: Gdk.RGBA) -> none` | gtk_source_mark_attributes_set_background |  | Sets background color to the one given in @background. |
| set_gicon | `MarkAttributes.set_gicon(gicon: Gio.Icon) -> none` | gtk_source_mark_attributes_set_gicon |  | Sets an icon to be used as a base for rendered icon. |
| set_icon_name | `MarkAttributes.set_icon_name(icon_name: utf8) -> none` | gtk_source_mark_attributes_set_icon_name |  | Sets a name of an icon to be used as a base for rendered icon. |
| set_pixbuf | `MarkAttributes.set_pixbuf(pixbuf: GdkPixbuf.Pixbuf) -> none` | gtk_source_mark_attributes_set_pixbuf |  | Sets a pixbuf to be used as a base for rendered icon. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| background | Gdk.RGBA | read, write | A color used for background of a line. |
| gicon | Gio.Icon | read, write | A #GIcon that may be a base of a rendered icon. |
| icon-name | utf8 | read, write | An icon name that may be a base of a rendered icon. |
| pixbuf | GdkPixbuf.Pixbuf | read, write | A #GdkPixbuf that may be a base of a rendered icon. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| query-tooltip-markup | `mark: Mark` | utf8 | last |  | The code should connect to this signal to provide a tooltip for given @mark. The tooltip can contain a markup. |
| query-tooltip-text | `mark: Mark` | utf8 | last |  | The code should connect to this signal to provide a tooltip for given @mark. The tooltip should be just a plain text. |

### GtkSource.PrintCompositor

Parent: `GObject.Object` ?? GType: `GtkSourcePrintCompositor` ?? C type: `GtkSourcePrintCompositor`

Compose a [class@Buffer] for printing. The `GtkSourcePrintCompositor` object is used to compose a [class@Buffer] for printing. You can set various ...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `PrintCompositor.new(buffer: Buffer) -> PrintCompositor` | gtk_source_print_compositor_new |  | Creates a new print compositor that can be used to print @buffer. |
| new_from_view | `PrintCompositor.new_from_view(view: View) -> PrintCompositor` | gtk_source_print_compositor_new_from_view |  | Creates a new print compositor that can be used to print the buffer associated with @view. This constructor sets some configuration properties to m... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| draw_page | `PrintCompositor.draw_page(context: Gtk.PrintContext, page_nr: gint) -> none` | gtk_source_print_compositor_draw_page |  | Draw page @page_nr for printing on the the Cairo context encapsuled in @context. This method has been designed to be called in the handler of the [... |
| get_body_font_name | `PrintCompositor.get_body_font_name() -> utf8` | gtk_source_print_compositor_get_body_font_name |  | Returns the name of the font used to print the text body. The returned string must be freed with g_free(). |
| get_bottom_margin | `PrintCompositor.get_bottom_margin(unit: Gtk.Unit) -> gdouble` | gtk_source_print_compositor_get_bottom_margin |  | Gets the bottom margin in units of @unit. |
| get_buffer | `PrintCompositor.get_buffer() -> Buffer` | gtk_source_print_compositor_get_buffer |  | Gets the [class@Buffer] associated with the compositor. The returned object reference is owned by the compositor object and should not be unreferen... |
| get_footer_font_name | `PrintCompositor.get_footer_font_name() -> utf8` | gtk_source_print_compositor_get_footer_font_name |  | Returns the name of the font used to print the page footer. The returned string must be freed with g_free(). |
| get_header_font_name | `PrintCompositor.get_header_font_name() -> utf8` | gtk_source_print_compositor_get_header_font_name |  | Returns the name of the font used to print the page header. The returned string must be freed with g_free(). |
| get_highlight_syntax | `PrintCompositor.get_highlight_syntax() -> gboolean` | gtk_source_print_compositor_get_highlight_syntax |  | Determines whether the printed text will be highlighted according to the buffer rules. Note that highlighting will happen only if the buffer to pri... |
| get_left_margin | `PrintCompositor.get_left_margin(unit: Gtk.Unit) -> gdouble` | gtk_source_print_compositor_get_left_margin |  | Gets the left margin in units of @unit. |
| get_line_numbers_font_name | `PrintCompositor.get_line_numbers_font_name() -> utf8` | gtk_source_print_compositor_get_line_numbers_font_name |  | Returns the name of the font used to print line numbers on the left margin. The returned string must be freed with g_free(). |
| get_n_pages | `PrintCompositor.get_n_pages() -> gint` | gtk_source_print_compositor_get_n_pages |  | Returns the number of pages in the document or <code>-1</code> if the document has not been completely paginated. |
| get_pagination_progress | `PrintCompositor.get_pagination_progress() -> gdouble` | gtk_source_print_compositor_get_pagination_progress |  | Returns the current fraction of the document pagination that has been completed. |
| get_print_footer | `PrintCompositor.get_print_footer() -> gboolean` | gtk_source_print_compositor_get_print_footer |  | Determines if a footer is set to be printed for each page. A footer will be printed if this function returns %TRUE **and** some format strings have... |
| get_print_header | `PrintCompositor.get_print_header() -> gboolean` | gtk_source_print_compositor_get_print_header |  | Determines if a header is set to be printed for each page. A header will be printed if this function returns %TRUE **and** some format strings have... |
| get_print_line_numbers | `PrintCompositor.get_print_line_numbers() -> guint` | gtk_source_print_compositor_get_print_line_numbers |  | Returns the interval used for line number printing. If the value is 0, no line numbers will be printed. The default value is 1 (i.e. numbers printe... |
| get_right_margin | `PrintCompositor.get_right_margin(unit: Gtk.Unit) -> gdouble` | gtk_source_print_compositor_get_right_margin |  | Gets the right margin in units of @unit. |
| get_tab_width | `PrintCompositor.get_tab_width() -> guint` | gtk_source_print_compositor_get_tab_width |  | Returns the width of tabulation in characters for printed text. |
| get_top_margin | `PrintCompositor.get_top_margin(unit: Gtk.Unit) -> gdouble` | gtk_source_print_compositor_get_top_margin |  | Gets the top margin in units of @unit. |
| get_wrap_mode | `PrintCompositor.get_wrap_mode() -> Gtk.WrapMode` | gtk_source_print_compositor_get_wrap_mode |  | Gets the line wrapping mode for the printed text. |
| ignore_tag | `PrintCompositor.ignore_tag(tag: Gtk.TextTag) -> none` | gtk_source_print_compositor_ignore_tag | 5.2 | Specifies a tag whose style should be ignored when compositing the document to the printable page. |
| paginate | `PrintCompositor.paginate(context: Gtk.PrintContext) -> gboolean` | gtk_source_print_compositor_paginate |  | Paginate the document associated with the @compositor. In order to support non-blocking pagination, document is paginated in small chunks. Each tim... |
| set_body_font_name | `PrintCompositor.set_body_font_name(font_name: utf8) -> none` | gtk_source_print_compositor_set_body_font_name |  | Sets the default font for the printed text. @font_name should be a string representation of a font description Pango can understand. (e.g. &quot;Mo... |
| set_bottom_margin | `PrintCompositor.set_bottom_margin(margin: gdouble, unit: Gtk.Unit) -> none` | gtk_source_print_compositor_set_bottom_margin |  | Sets the bottom margin used by @compositor. |
| set_footer_font_name | `PrintCompositor.set_footer_font_name(font_name: utf8?) -> none` | gtk_source_print_compositor_set_footer_font_name |  | Sets the font for printing the page footer. If %NULL is supplied, the default font (i.e. the one being used for the text) will be used instead. @fo... |
| set_footer_format | `PrintCompositor.set_footer_format(separator: gboolean, left: utf8?, center: utf8?, right: utf8?) -> none` | gtk_source_print_compositor_set_footer_format |  | See [method@PrintCompositor.set_header_format] for more information about the parameters. |
| set_header_font_name | `PrintCompositor.set_header_font_name(font_name: utf8?) -> none` | gtk_source_print_compositor_set_header_font_name |  | Sets the font for printing the page header. If %NULL is supplied, the default font (i.e. the one being used for the text) will be used instead. @fo... |
| set_header_format | `PrintCompositor.set_header_format(separator: gboolean, left: utf8?, center: utf8?, right: utf8?) -> none` | gtk_source_print_compositor_set_header_format |  | Sets strftime like header format strings, to be printed on the left, center and right of the top of each page. The strings may include strftime(3) ... |
| set_highlight_syntax | `PrintCompositor.set_highlight_syntax(highlight: gboolean) -> none` | gtk_source_print_compositor_set_highlight_syntax |  | Sets whether the printed text will be highlighted according to the buffer rules. Both color and font style are applied. This function cannot be cal... |
| set_left_margin | `PrintCompositor.set_left_margin(margin: gdouble, unit: Gtk.Unit) -> none` | gtk_source_print_compositor_set_left_margin |  | Sets the left margin used by @compositor. |
| set_line_numbers_font_name | `PrintCompositor.set_line_numbers_font_name(font_name: utf8?) -> none` | gtk_source_print_compositor_set_line_numbers_font_name |  | Sets the font for printing line numbers on the left margin. If %NULL is supplied, the default font (i.e. the one being used for the text) will be u... |
| set_print_footer | `PrintCompositor.set_print_footer(print: gboolean) -> none` | gtk_source_print_compositor_set_print_footer |  | Sets whether you want to print a footer in each page. The footer consists of three pieces of text and an optional line separator, configurable with... |
| set_print_header | `PrintCompositor.set_print_header(print: gboolean) -> none` | gtk_source_print_compositor_set_print_header |  | Sets whether you want to print a header in each page. The header consists of three pieces of text and an optional line separator, configurable with... |
| set_print_line_numbers | `PrintCompositor.set_print_line_numbers(interval: guint) -> none` | gtk_source_print_compositor_set_print_line_numbers |  | Sets the interval for printed line numbers. If @interval is 0 no numbers will be printed. If greater than 0, a number will be printed every @interv... |
| set_right_margin | `PrintCompositor.set_right_margin(margin: gdouble, unit: Gtk.Unit) -> none` | gtk_source_print_compositor_set_right_margin |  | Sets the right margin used by @compositor. |
| set_tab_width | `PrintCompositor.set_tab_width(width: guint) -> none` | gtk_source_print_compositor_set_tab_width |  | Sets the width of tabulation in characters for printed text. This function cannot be called anymore after the first call to the [method@PrintCompos... |
| set_top_margin | `PrintCompositor.set_top_margin(margin: gdouble, unit: Gtk.Unit) -> none` | gtk_source_print_compositor_set_top_margin |  | Sets the top margin used by @compositor. |
| set_wrap_mode | `PrintCompositor.set_wrap_mode(wrap_mode: Gtk.WrapMode) -> none` | gtk_source_print_compositor_set_wrap_mode |  | Sets the line wrapping mode for the printed text. This function cannot be called anymore after the first call to the [method@PrintCompositor.pagina... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| body-font-name | utf8 | read, write | Name of the font used for the text body. Accepted values are strings representing a font description Pango can understand. (e.g. &quot;Monospace 10... |
| buffer | Buffer | read, write, construct-only | The [class@Buffer] object to print. |
| footer-font-name | utf8 | read, write | Name of the font used to print page footer. If this property is unspecified, the text body font is used. Accepted values are strings representing a... |
| header-font-name | utf8 | read, write | Name of the font used to print page header. If this property is unspecified, the text body font is used. Accepted values are strings representing a... |
| highlight-syntax | gboolean | read, write | Whether to print the document with highlighted syntax. The value of this property cannot be changed anymore after the first call to the [method@Pri... |
| line-numbers-font-name | utf8 | read, write | Name of the font used to print line numbers on the left margin. If this property is unspecified, the text body font is used. Accepted values are st... |
| n-pages | gint | read | The number of pages in the document or <code>-1</code> if the document has not been completely paginated. |
| print-footer | gboolean | read, write | Whether to print a footer in each page. Note that by default the footer format is unspecified, and if it is unspecified the footer will not be prin... |
| print-header | gboolean | read, write | Whether to print a header in each page. Note that by default the header format is unspecified, and if it is unspecified the header will not be prin... |
| print-line-numbers | guint | read, write | Interval of printed line numbers. If this property is set to 0 no numbers will be printed. If greater than 0, a number will be printed every "print... |
| tab-width | guint | read, write | Width of a tab character expressed in spaces. The value of this property cannot be changed anymore after the first call to the [method@PrintComposi... |
| wrap-mode | Gtk.WrapMode | read, write | Whether to wrap lines never, at word boundaries, or at character boundaries. The value of this property cannot be changed anymore after the first c... |

### GtkSource.Region

Parent: `GObject.Object` ?? GType: `GtkSourceRegion` ?? C type: `GtkSourceRegion`

Region utility. A `GtkSourceRegion` permits to store a group of subregions of a [class@Gtk.TextBuffer]. `GtkSourceRegion` stores the subregions wit...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Region.new(buffer: Gtk.TextBuffer) -> Region` | gtk_source_region_new |  | a new #GtkSourceRegion object for @buffer. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_region | `Region.add_region(region_to_add: Region?) -> none` | gtk_source_region_add_region |  | Adds @region_to_add to @region. @region_to_add is not modified. |
| add_subregion | `Region.add_subregion(_start: Gtk.TextIter, _end: Gtk.TextIter) -> none` | gtk_source_region_add_subregion |  | Adds the subregion delimited by @_start and @_end to @region. |
| get_bounds | `Region.get_bounds(start: out Gtk.TextIter?, end: out Gtk.TextIter?) -> gboolean` | gtk_source_region_get_bounds |  | Gets the @start and @end bounds of the @region. |
| get_buffer | `Region.get_buffer() -> Gtk.TextBuffer` | gtk_source_region_get_buffer |  | the #GtkTextBuffer. |
| get_start_region_iter | `Region.get_start_region_iter(iter: out RegionIter) -> none` | gtk_source_region_get_start_region_iter |  | Initializes a [struct@RegionIter] to the first subregion of @region. If @region is empty, @iter will be initialized to the end iterator. |
| intersect_region | `Region.intersect_region(region2: Region?) -> Region` | gtk_source_region_intersect_region |  | Returns the intersection between @region1 and @region2. @region1 and @region2 are not modified. |
| intersect_subregion | `Region.intersect_subregion(_start: Gtk.TextIter, _end: Gtk.TextIter) -> Region` | gtk_source_region_intersect_subregion |  | Returns the intersection between @region and the subregion delimited by @_start and @_end. @region is not modified. |
| is_empty | `Region.is_empty() -> gboolean` | gtk_source_region_is_empty |  | Returns whether the @region is empty. A %NULL @region is considered empty. |
| subtract_region | `Region.subtract_region(region_to_subtract: Region?) -> none` | gtk_source_region_subtract_region |  | Subtracts @region_to_subtract from @region. @region_to_subtract is not modified. |
| subtract_subregion | `Region.subtract_subregion(_start: Gtk.TextIter, _end: Gtk.TextIter) -> none` | gtk_source_region_subtract_subregion |  | Subtracts the subregion delimited by @_start and @_end from @region. |
| to_string | `Region.to_string() -> utf8` | gtk_source_region_to_string |  | Gets a string represention of @region, for debugging purposes. The returned string contains the character offsets of the subregions. It doesn't inc... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| buffer | Gtk.TextBuffer | read, write, construct-only | The [class@Gtk.TextBuffer]. The #GtkSourceRegion has a weak reference to the buffer. |

### GtkSource.SearchContext

Parent: `GObject.Object` ?? GType: `GtkSourceSearchContext` ?? C type: `GtkSourceSearchContext`

Search context. A `GtkSourceSearchContext` is used for the search and replace in a [class@Buffer]. The search settings are represented by a [class@...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SearchContext.new(buffer: Buffer, settings: SearchSettings?) -> SearchContext` | gtk_source_search_context_new |  | Creates a new search context, associated with @buffer, and customized with @settings. If @settings is %NULL, a new [class@SearchSettings] object wi... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| backward | `SearchContext.backward(iter: Gtk.TextIter, match_start: out Gtk.TextIter?, match_end: out Gtk.TextIter?, has_wrapped_around: out gboolean?) -> gboolean` | gtk_source_search_context_backward |  | Synchronous backward search. It is recommended to use the asynchronous functions instead, to not block the user interface. However, if you are sure... |
| backward_async | `SearchContext.backward_async(iter: Gtk.TextIter, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gtk_source_search_context_backward_async |  | The asynchronous version of [method@SearchContext.backward]. See the [iface@Gio.AsyncResult] documentation to know how to use this function. If the... |
| backward_finish | `SearchContext.backward_finish(result: Gio.AsyncResult, match_start: out Gtk.TextIter?, match_end: out Gtk.TextIter?, has_wrapped_around: out gboolean?) -> gboolean throws` | gtk_source_search_context_backward_finish |  | Finishes a backward search started with [method@SearchContext.backward_async]. See the documentation of [method@SearchContext.backward] for more de... |
| forward | `SearchContext.forward(iter: Gtk.TextIter, match_start: out Gtk.TextIter?, match_end: out Gtk.TextIter?, has_wrapped_around: out gboolean?) -> gboolean` | gtk_source_search_context_forward |  | Synchronous forward search. It is recommended to use the asynchronous functions instead, to not block the user interface. However, if you are sure ... |
| forward_async | `SearchContext.forward_async(iter: Gtk.TextIter, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gtk_source_search_context_forward_async |  | The asynchronous version of [method@SearchContext.forward]. See the [iface@Gio.AsyncResult] documentation to know how to use this function. If the ... |
| forward_finish | `SearchContext.forward_finish(result: Gio.AsyncResult, match_start: out Gtk.TextIter?, match_end: out Gtk.TextIter?, has_wrapped_around: out gboolean?) -> gboolean throws` | gtk_source_search_context_forward_finish |  | Finishes a forward search started with [method@SearchContext.forward_async]. See the documentation of [method@SearchContext.forward] for more details. |
| get_buffer | `SearchContext.get_buffer() -> Buffer` | gtk_source_search_context_get_buffer |  | the associated buffer. |
| get_highlight | `SearchContext.get_highlight() -> gboolean` | gtk_source_search_context_get_highlight |  | whether to highlight the search occurrences. |
| get_match_style | `SearchContext.get_match_style() -> Style` | gtk_source_search_context_get_match_style |  | the #GtkSourceStyle to apply on search matches. |
| get_occurrence_position | `SearchContext.get_occurrence_position(match_start: Gtk.TextIter, match_end: Gtk.TextIter) -> gint` | gtk_source_search_context_get_occurrence_position |  | Gets the position of a search occurrence. If the buffer is not already fully scanned, the position may be unknown, and -1 is returned. If 0 is retu... |
| get_occurrences_count | `SearchContext.get_occurrences_count() -> gint` | gtk_source_search_context_get_occurrences_count |  | Gets the total number of search occurrences. If the buffer is not already fully scanned, the total number of occurrences is unknown, and -1 is retu... |
| get_regex_error | `SearchContext.get_regex_error() -> GLib.Error` | gtk_source_search_context_get_regex_error |  | Regular expression patterns must follow certain rules. If [property@SearchSettings:search-text] breaks a rule, the error can be retrieved with this... |
| get_settings | `SearchContext.get_settings() -> SearchSettings` | gtk_source_search_context_get_settings |  | the search settings. |
| replace | `SearchContext.replace(match_start: Gtk.TextIter, match_end: Gtk.TextIter, replace: utf8, replace_length: gint) -> gboolean throws` | gtk_source_search_context_replace |  | Replaces a search match by another text. If @match_start and @match_end doesn't correspond to a search match, %FALSE is returned. @match_start and ... |
| replace_all | `SearchContext.replace_all(replace: utf8, replace_length: gint) -> guint throws` | gtk_source_search_context_replace_all |  | Replaces all search matches by another text. It is a synchronous function, so it can block the user interface. For a regular expression replacement... |
| set_highlight | `SearchContext.set_highlight(highlight: gboolean) -> none` | gtk_source_search_context_set_highlight |  | Enables or disables the search occurrences highlighting. |
| set_match_style | `SearchContext.set_match_style(match_style: Style?) -> none` | gtk_source_search_context_set_match_style |  | Set the style to apply on search matches. If @match_style is %NULL, default theme's scheme 'match-style' will be used. To enable or disable the sea... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| buffer | Buffer | read, write, construct-only | The [class@Buffer] associated to the search context. |
| highlight | gboolean | read, write | Highlight the search occurrences. |
| match-style | Style | read, write | A [class@Style], or %NULL for theme's scheme default style. |
| occurrences-count | gint | read | The total number of search occurrences. If the search is disabled, the value is 0. If the buffer is not already fully scanned, the value is -1. |
| regex-error | GLib.Error | read | If the regex search pattern doesn't follow all the rules, this #GError property will be set. If the pattern is valid, the value is %NULL. Free with... |
| settings | SearchSettings | read, write, construct-only | The [class@SearchSettings] associated to the search context. This property is construct-only since version 4.0. |

### GtkSource.SearchSettings

Parent: `GObject.Object` ?? GType: `GtkSourceSearchSettings` ?? C type: `GtkSourceSearchSettings`

Search settings. A `GtkSourceSearchSettings` object represents the settings of a search. The search settings can be associated with one or several ...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SearchSettings.new() -> SearchSettings` | gtk_source_search_settings_new |  | Creates a new search settings object. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_at_word_boundaries | `SearchSettings.get_at_word_boundaries() -> gboolean` | gtk_source_search_settings_get_at_word_boundaries |  | whether to search at word boundaries. |
| get_case_sensitive | `SearchSettings.get_case_sensitive() -> gboolean` | gtk_source_search_settings_get_case_sensitive |  | whether the search is case sensitive. |
| get_regex_enabled | `SearchSettings.get_regex_enabled() -> gboolean` | gtk_source_search_settings_get_regex_enabled |  | whether to search by regular expressions. |
| get_search_text | `SearchSettings.get_search_text() -> utf8` | gtk_source_search_settings_get_search_text |  | Gets the text to search. The return value must not be freed. You may be interested to call [func@utils_escape_search_text] after this function. |
| get_visible_only | `SearchSettings.get_visible_only() -> gboolean` | gtk_source_search_settings_get_visible_only | 5.12 | whether to exclude invisible text from the search. |
| get_wrap_around | `SearchSettings.get_wrap_around() -> gboolean` | gtk_source_search_settings_get_wrap_around |  | whether to wrap around the search. |
| set_at_word_boundaries | `SearchSettings.set_at_word_boundaries(at_word_boundaries: gboolean) -> none` | gtk_source_search_settings_set_at_word_boundaries |  | Change whether the search is done at word boundaries. If @at_word_boundaries is %TRUE, a search match must start and end a word. The match can span... |
| set_case_sensitive | `SearchSettings.set_case_sensitive(case_sensitive: gboolean) -> none` | gtk_source_search_settings_set_case_sensitive |  | Enables or disables the case sensitivity for the search. |
| set_regex_enabled | `SearchSettings.set_regex_enabled(regex_enabled: gboolean) -> none` | gtk_source_search_settings_set_regex_enabled |  | Enables or disables whether to search by regular expressions. If enabled, the [property@SearchSettings:search-text] property contains the pattern o... |
| set_search_text | `SearchSettings.set_search_text(search_text: utf8?) -> none` | gtk_source_search_settings_set_search_text |  | Sets the text to search. If @search_text is %NULL or is empty, the search will be disabled. A copy of @search_text will be made, so you can safely ... |
| set_visible_only | `SearchSettings.set_visible_only(visible_only: gboolean) -> none` | gtk_source_search_settings_set_visible_only | 5.12 | Enables or disables whether to exclude invisible text from the search. If enabled, only visible text will be searched. A search match may have invi... |
| set_wrap_around | `SearchSettings.set_wrap_around(wrap_around: gboolean) -> none` | gtk_source_search_settings_set_wrap_around |  | Enables or disables the wrap around search. If @wrap_around is %TRUE, the forward search continues at the beginning of the buffer if no search occu... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| at-word-boundaries | gboolean | read, write | If %TRUE, a search match must start and end a word. The match can span multiple words. |
| case-sensitive | gboolean | read, write | Whether the search is case sensitive. |
| regex-enabled | gboolean | read, write | Search by regular expressions with [property@SearchSettings:search-text] as the pattern. |
| search-text | utf8 | read, write | A search string, or %NULL if the search is disabled. If the regular expression search is enabled, [property@SearchSettings:search-text] is the patt... |
| visible-only | gboolean | read, write | Exclude invisible text from the search. A search match may have invisible text interspersed. |
| wrap-around | gboolean | read, write | For a forward search, continue at the beginning of the buffer if no search occurrence is found. For a backward search, continue at the end of the b... |

### GtkSource.Snippet

Parent: `GObject.Object` ?? GType: `GtkSourceSnippet` ?? C type: `GtkSourceSnippet`

Quick insertion code snippets. The `GtkSourceSnippet` represents a series of chunks that can quickly be inserted into the [class@View]. Snippets ar...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Snippet.new(trigger: utf8?, language_id: utf8?) -> Snippet` | gtk_source_snippet_new |  | Creates a new #GtkSourceSnippet |
| new_parsed | `Snippet.new_parsed(text: utf8) -> Snippet throws` | gtk_source_snippet_new_parsed | 5.6 | Parses the snippet formatted @text into a series of chunks and adds them to a new #GtkSourceSnippet. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_chunk | `Snippet.add_chunk(chunk: SnippetChunk) -> none` | gtk_source_snippet_add_chunk |  | Appends @chunk to the @snippet. This may only be called before the snippet has been expanded. |
| copy | `Snippet.copy() -> Snippet` | gtk_source_snippet_copy |  | Does a deep copy of the snippet. |
| get_context | `Snippet.get_context() -> SnippetContext` | gtk_source_snippet_get_context |  | Gets the context used for expanding the snippet. |
| get_description | `Snippet.get_description() -> utf8` | gtk_source_snippet_get_description |  | Gets the description for the snippet. |
| get_focus_position | `Snippet.get_focus_position() -> gint` | gtk_source_snippet_get_focus_position |  | Gets the current focus for the snippet. This is changed as the user tabs through focus locations. |
| get_language_id | `Snippet.get_language_id() -> utf8` | gtk_source_snippet_get_language_id |  | Gets the language-id used for the source snippet. The language identifier should be one that matches a source language [property@Language:id] prope... |
| get_n_chunks | `Snippet.get_n_chunks() -> guint` | gtk_source_snippet_get_n_chunks |  | Gets the number of chunks in the snippet. Note that not all chunks are editable. |
| get_name | `Snippet.get_name() -> utf8` | gtk_source_snippet_get_name |  | Gets the name for the snippet. |
| get_nth_chunk | `Snippet.get_nth_chunk(nth: guint) -> SnippetChunk` | gtk_source_snippet_get_nth_chunk |  | Gets the chunk at @nth. |
| get_trigger | `Snippet.get_trigger() -> utf8` | gtk_source_snippet_get_trigger |  | Gets the trigger for the source snippet. A trigger is a word that can be expanded into the full snippet when the user presses Tab. |
| set_description | `Snippet.set_description(description: utf8) -> none` | gtk_source_snippet_set_description |  | Sets the description for the snippet. |
| set_language_id | `Snippet.set_language_id(language_id: utf8) -> none` | gtk_source_snippet_set_language_id |  | Sets the language identifier for the snippet. This should match the [property@Language:id] identifier. |
| set_name | `Snippet.set_name(name: utf8) -> none` | gtk_source_snippet_set_name |  | Sets the name for the snippet. |
| set_trigger | `Snippet.set_trigger(trigger: utf8) -> none` | gtk_source_snippet_set_trigger |  | Sets the trigger for the snippet. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| buffer | Gtk.TextBuffer | read |  |
| description | utf8 | read, write |  |
| focus-position | gint | read |  |
| language-id | utf8 | read, write |  |
| name | utf8 | read, write |  |
| trigger | utf8 | read, write |  |

### GtkSource.SnippetChunk

Parent: `GObject.InitiallyUnowned` ?? GType: `GtkSourceSnippetChunk` ?? C type: `GtkSourceSnippetChunk`

A chunk of text within the source snippet. The `GtkSourceSnippetChunk` represents a single chunk of text that may or may not be an edit point withi...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SnippetChunk.new() -> SnippetChunk` | gtk_source_snippet_chunk_new |  | Create a new `GtkSourceSnippetChunk` that can be added to a [class@Snippet]. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `SnippetChunk.copy() -> SnippetChunk` | gtk_source_snippet_chunk_copy |  | Copies the source snippet. |
| get_context | `SnippetChunk.get_context() -> SnippetContext` | gtk_source_snippet_chunk_get_context |  | Gets the context for the snippet insertion. |
| get_focus_position | `SnippetChunk.get_focus_position() -> gint` | gtk_source_snippet_chunk_get_focus_position |  | Gets the [property@SnippetChunk:focus-position]. The focus-position is used to determine how many tabs it takes for the snippet to advanced to this... |
| get_spec | `SnippetChunk.get_spec() -> utf8` | gtk_source_snippet_chunk_get_spec |  | Gets the specification for the chunk. The specification is evaluated for variables when other chunks are edited within the snippet context. If the ... |
| get_text | `SnippetChunk.get_text() -> utf8` | gtk_source_snippet_chunk_get_text |  | Gets the [property@SnippetChunk:text] property. The text property is updated when the user edits the text of the chunk. If it has not been edited, ... |
| get_text_set | `SnippetChunk.get_text_set() -> gboolean` | gtk_source_snippet_chunk_get_text_set |  | Gets the [property@SnippetChunk:text-set] property. This is typically set when the user has edited a snippet chunk. |
| get_tooltip_text | `SnippetChunk.get_tooltip_text() -> utf8` | gtk_source_snippet_chunk_get_tooltip_text |  |  |
| set_context | `SnippetChunk.set_context(context: SnippetContext) -> none` | gtk_source_snippet_chunk_set_context |  |  |
| set_focus_position | `SnippetChunk.set_focus_position(focus_position: gint) -> none` | gtk_source_snippet_chunk_set_focus_position |  | Sets the [property@SnippetChunk:focus-position] property. The focus-position is used to determine how many tabs it takes for the snippet to advance... |
| set_spec | `SnippetChunk.set_spec(spec: utf8) -> none` | gtk_source_snippet_chunk_set_spec |  | Sets the specification for the chunk. The specification is evaluated for variables when other chunks are edited within the snippet context. If the ... |
| set_text | `SnippetChunk.set_text(text: utf8) -> none` | gtk_source_snippet_chunk_set_text |  | Sets the text for the snippet chunk. This is usually used by the snippet engine to update the text, but may be useful when creating custom snippets... |
| set_text_set | `SnippetChunk.set_text_set(text_set: gboolean) -> none` | gtk_source_snippet_chunk_set_text_set |  | Sets the [property@SnippetChunk:text-set] property. This is typically set when the user has edited a snippet chunk by the snippet engine. |
| set_tooltip_text | `SnippetChunk.set_tooltip_text(tooltip_text: utf8) -> none` | gtk_source_snippet_chunk_set_tooltip_text |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| context | SnippetContext | read, write |  |
| focus-position | gint | read, write |  |
| spec | utf8 | read, write |  |
| text | utf8 | read, write |  |
| text-set | gboolean | read, write |  |
| tooltip-text | utf8 | read, write |  |

### GtkSource.SnippetContext

Parent: `GObject.Object` ?? GType: `GtkSourceSnippetContext` ?? C type: `GtkSourceSnippetContext`

Context for expanding [class@SnippetChunk]. This class is currently used primary as a hashtable. However, the longer term goal is to have it hold o...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SnippetContext.new() -> SnippetContext` | gtk_source_snippet_context_new |  | Creates a new #GtkSourceSnippetContext. Generally, this isn't needed unless you are controlling the expansion of snippets manually. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear_variables | `SnippetContext.clear_variables() -> none` | gtk_source_snippet_context_clear_variables |  | Removes all variables from the context. |
| expand | `SnippetContext.expand(input: utf8) -> utf8` | gtk_source_snippet_context_expand |  |  |
| get_variable | `SnippetContext.get_variable(key: utf8) -> utf8` | gtk_source_snippet_context_get_variable |  | Gets the current value for a variable named @key. |
| set_constant | `SnippetContext.set_constant(key: utf8, value: utf8) -> none` | gtk_source_snippet_context_set_constant |  | Sets a constatnt within the context. This is similar to a variable set with [method@SnippetContext.set_variable] but is expected to not change duri... |
| set_line_prefix | `SnippetContext.set_line_prefix(line_prefix: utf8) -> none` | gtk_source_snippet_context_set_line_prefix |  |  |
| set_tab_width | `SnippetContext.set_tab_width(tab_width: gint) -> none` | gtk_source_snippet_context_set_tab_width |  |  |
| set_use_spaces | `SnippetContext.set_use_spaces(use_spaces: gboolean) -> none` | gtk_source_snippet_context_set_use_spaces |  |  |
| set_variable | `SnippetContext.set_variable(key: utf8, value: utf8) -> none` | gtk_source_snippet_context_set_variable |  | Sets a variable within the context. This variable may be overridden by future updates to the context. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| changed | `` | none | first |  | The signal is emitted when a change has been discovered in one of the chunks of the snippet which has caused a variable or other dynamic data withi... |

### GtkSource.SnippetManager

Parent: `GObject.Object` ?? GType: `GtkSourceSnippetManager` ?? C type: `GtkSourceSnippetManager`

Provides access to [class@Snippet]. `GtkSourceSnippetManager` is an object which processes snippet description files and creates [class@Snippet] ob...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default | `get_default() -> SnippetManager` | gtk_source_snippet_manager_get_default |  | Returns the default #GtkSourceSnippetManager instance. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_search_path | `SnippetManager.get_search_path() -> utf8` | gtk_source_snippet_manager_get_search_path |  | Gets the list directories where @self looks for snippet files. |
| get_snippet | `SnippetManager.get_snippet(group: utf8?, language_id: utf8?, trigger: utf8) -> Snippet` | gtk_source_snippet_manager_get_snippet |  | Queries the known snippets for the first matching @group, @language_id, and/or @trigger. If @group or @language_id are %NULL, they will be ignored. |
| list_all | `SnippetManager.list_all() -> Gio.ListModel` | gtk_source_snippet_manager_list_all | 5.6 | Gets a [iface@Gio.ListModel] of all snippets. This can be used to get an unfiltered list of all of the snippets known to the snippet manager. |
| list_groups | `SnippetManager.list_groups() -> utf8` | gtk_source_snippet_manager_list_groups |  | List all the known groups within the snippet manager. The result should be freed with g_free(), and the individual strings are owned by @self and s... |
| list_matching | `SnippetManager.list_matching(group: utf8?, language_id: utf8?, trigger_prefix: utf8?) -> Gio.ListModel` | gtk_source_snippet_manager_list_matching |  | Queries the known snippets for those matching @group, @language_id, and/or @trigger_prefix. If any of these are %NULL, they will be ignored when fi... |
| set_search_path | `SnippetManager.set_search_path(dirs: utf8?) -> none` | gtk_source_snippet_manager_set_search_path |  | Sets the list of directories in which the `GtkSourceSnippetManager` looks for snippet files. If @dirs is %NULL, the search path is reset to default... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| search-path | utf8 | read, write | Contains a list of directories to search for files containing snippets (*.snippets). |

### GtkSource.SpaceDrawer

Parent: `GObject.Object` ?? GType: `GtkSourceSpaceDrawer` ?? C type: `GtkSourceSpaceDrawer`

Represent white space characters with symbols. #GtkSourceSpaceDrawer provides a way to visualize white spaces, by drawing symbols. Call [method@Vie...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SpaceDrawer.new() -> SpaceDrawer` | gtk_source_space_drawer_new |  | Creates a new #GtkSourceSpaceDrawer object. Useful for storing space drawing settings independently of a [class@View]. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| bind_matrix_setting | `SpaceDrawer.bind_matrix_setting(settings: Gio.Settings, key: utf8, flags: Gio.SettingsBindFlags) -> none` | gtk_source_space_drawer_bind_matrix_setting |  | Binds the [property@SpaceDrawer:matrix] property to a [class@Gio.Settings] key. The [class@Gio.Settings] key must be of the same type as the [prope... |
| get_enable_matrix | `SpaceDrawer.get_enable_matrix() -> gboolean` | gtk_source_space_drawer_get_enable_matrix |  | whether the #GtkSourceSpaceDrawer:matrix property is enabled. |
| get_matrix | `SpaceDrawer.get_matrix() -> GLib.Variant` | gtk_source_space_drawer_get_matrix |  | Gets the value of the [property@SpaceDrawer:matrix] property, as a [struct@GLib.Variant]. An empty array can be returned in case the matrix is a ze... |
| get_types_for_locations | `SpaceDrawer.get_types_for_locations(locations: SpaceLocationFlags) -> SpaceTypeFlags` | gtk_source_space_drawer_get_types_for_locations |  | If only one location is specified, this function returns what kind of white spaces are drawn at that location. The value is retrieved from the [pro... |
| set_enable_matrix | `SpaceDrawer.set_enable_matrix(enable_matrix: gboolean) -> none` | gtk_source_space_drawer_set_enable_matrix |  | Sets whether the [property@SpaceDrawer:matrix] property is enabled. |
| set_matrix | `SpaceDrawer.set_matrix(matrix: GLib.Variant?) -> none` | gtk_source_space_drawer_set_matrix |  | Sets a new value to the [property@SpaceDrawer:matrix] property, as a [struct@GLib.Variant]. If @matrix is %NULL, then an empty array is set. If @ma... |
| set_types_for_locations | `SpaceDrawer.set_types_for_locations(locations: SpaceLocationFlags, types: SpaceTypeFlags) -> none` | gtk_source_space_drawer_set_types_for_locations |  | Modifies the [property@SpaceDrawer:matrix] property at the specified @locations. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| enable-matrix | gboolean | read, write | Whether the [property@SpaceDrawer:matrix] property is enabled. |
| matrix | GLib.Variant | read, write | The property is a [struct@GLib.Variant] property to specify where and what kind of white spaces to draw. The [struct@GLib.Variant] is of type `"au"... |

### GtkSource.Style

Parent: `GObject.Object` ?? GType: `GtkSourceStyle` ?? C type: `GtkSourceStyle`

Represents a style. The `GtkSourceStyle` structure is used to describe text attributes which are set when given style is used.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| apply | `Style.apply(tag: Gtk.TextTag) -> none` | gtk_source_style_apply |  | This function modifies the [class@Gtk.TextTag] properties that are related to the #GtkSourceStyle properties. Other [class@Gtk.TextTag] properties ... |
| copy | `Style.copy() -> Style` | gtk_source_style_copy |  | Creates a copy of @style, that is a new #GtkSourceStyle instance which has the same attributes set. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| background | utf8 | read, write, construct-only |  |
| background-set | gboolean | read, write, construct-only |  |
| bold | gboolean | read, write, construct-only |  |
| bold-set | gboolean | read, write, construct-only |  |
| foreground | utf8 | read, write, construct-only |  |
| foreground-set | gboolean | read, write, construct-only |  |
| italic | gboolean | read, write, construct-only |  |
| italic-set | gboolean | read, write, construct-only |  |
| line-background | utf8 | read, write, construct-only |  |
| line-background-set | gboolean | read, write, construct-only |  |
| pango-underline | Pango.Underline | read, write, construct-only |  |
| scale | utf8 | read, write, construct-only |  |
| scale-set | gboolean | read, write, construct-only |  |
| strikethrough | gboolean | read, write, construct-only |  |
| strikethrough-set | gboolean | read, write, construct-only |  |
| underline-color | utf8 | read, write, construct-only |  |
| underline-color-set | gboolean | read, write, construct-only |  |
| underline-set | gboolean | read, write, construct-only |  |
| weight | Pango.Weight | read, write, construct-only |  |
| weight-set | gboolean | read, write, construct-only |  |

### GtkSource.StyleScheme

Parent: `GObject.Object` ?? GType: `GtkSourceStyleScheme` ?? C type: `GtkSourceStyleScheme`

Controls the appearance of [class@View]. #GtkSourceStyleScheme contains all the text styles to be used in [class@View] and [class@Buffer]. For inst...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_authors | `StyleScheme.get_authors() -> utf8` | gtk_source_style_scheme_get_authors |  | a %NULL-terminated array containing the @scheme authors or %NULL if no author is specified by the style scheme. |
| get_description | `StyleScheme.get_description() -> utf8` | gtk_source_style_scheme_get_description |  | @scheme description (if defined), or %NULL. |
| get_filename | `StyleScheme.get_filename() -> utf8` | gtk_source_style_scheme_get_filename |  | @scheme file name if the scheme was created parsing a style scheme file or %NULL in the other cases. |
| get_id | `StyleScheme.get_id() -> utf8` | gtk_source_style_scheme_get_id |  | @scheme id. |
| get_metadata | `StyleScheme.get_metadata(name: utf8) -> utf8` | gtk_source_style_scheme_get_metadata | 5.4 | Gets a metadata property from the style scheme. |
| get_name | `StyleScheme.get_name() -> utf8` | gtk_source_style_scheme_get_name |  | @scheme name. |
| get_style | `StyleScheme.get_style(style_id: utf8) -> Style` | gtk_source_style_scheme_get_style |  | style which corresponds to @style_id in the @scheme, or %NULL when no style with this name found. It is owned by @scheme and may not be unref'ed. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| description | utf8 | read | Style scheme description, a translatable string to present to the user. |
| filename | utf8 | read | Style scheme filename or %NULL. |
| id | utf8 | read, write, construct-only | Style scheme id, a unique string used to identify the style scheme in [class@StyleSchemeManager]. |
| name | utf8 | read | Style scheme name, a translatable string to present to the user. |

### GtkSource.StyleSchemeChooserButton

Parent: `Gtk.Button` ?? Implements: `Gtk.Accessible`, `Gtk.Actionable`, `Gtk.Buildable`, `Gtk.ConstraintTarget`, `StyleSchemeChooser` ?? GType: `GtkSourceStyleSchemeChooserButton` ?? C type: `GtkSourceStyleSchemeChooserButton`

A button to launch a style scheme selection dialog. The `GtkSourceStyleSchemeChooserButton` is a button which displays the currently selected style...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.Button |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `StyleSchemeChooserButton.new() -> Gtk.Widget` | gtk_source_style_scheme_chooser_button_new |  | Creates a new #GtkSourceStyleSchemeChooserButton. |

### GtkSource.StyleSchemeChooserWidget

Parent: `Gtk.Widget` ?? Implements: `Gtk.Accessible`, `Gtk.Buildable`, `Gtk.ConstraintTarget`, `StyleSchemeChooser` ?? GType: `GtkSourceStyleSchemeChooserWidget` ?? C type: `GtkSourceStyleSchemeChooserWidget`

A widget for choosing style schemes. The `GtkSourceStyleSchemeChooserWidget` widget lets the user select a style scheme. By default, the chooser pr...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.Widget |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `StyleSchemeChooserWidget.new() -> Gtk.Widget` | gtk_source_style_scheme_chooser_widget_new |  | Creates a new #GtkSourceStyleSchemeChooserWidget. |

### GtkSource.StyleSchemeManager

Parent: `GObject.Object` ?? GType: `GtkSourceStyleSchemeManager` ?? C type: `GtkSourceStyleSchemeManager`

Provides access to [class@StyleScheme]s.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `StyleSchemeManager.new() -> StyleSchemeManager` | gtk_source_style_scheme_manager_new |  | Creates a new style manager. If you do not need more than one style manager then use [func@StyleSchemeManager.get_default] instead. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default | `get_default() -> StyleSchemeManager` | gtk_source_style_scheme_manager_get_default |  | Returns the default #GtkSourceStyleSchemeManager instance. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_search_path | `StyleSchemeManager.append_search_path(path: utf8) -> none` | gtk_source_style_scheme_manager_append_search_path |  | Appends @path to the list of directories where the @manager looks for style scheme files. See [method@StyleSchemeManager.set_search_path] for details. |
| force_rescan | `StyleSchemeManager.force_rescan() -> none` | gtk_source_style_scheme_manager_force_rescan |  | Mark any currently cached information about the available style schems as invalid. All the available style schemes will be reloaded next time the @... |
| get_scheme | `StyleSchemeManager.get_scheme(scheme_id: utf8) -> StyleScheme` | gtk_source_style_scheme_manager_get_scheme |  | Looks up style scheme by id. |
| get_scheme_ids | `StyleSchemeManager.get_scheme_ids() -> utf8` | gtk_source_style_scheme_manager_get_scheme_ids |  | Returns the ids of the available style schemes. |
| get_search_path | `StyleSchemeManager.get_search_path() -> utf8` | gtk_source_style_scheme_manager_get_search_path |  | Returns the current search path for the @manager. See [method@StyleSchemeManager.set_search_path] for details. |
| prepend_search_path | `StyleSchemeManager.prepend_search_path(path: utf8) -> none` | gtk_source_style_scheme_manager_prepend_search_path |  | Prepends @path to the list of directories where the @manager looks for style scheme files. See [method@StyleSchemeManager.set_search_path] for deta... |
| set_search_path | `StyleSchemeManager.set_search_path(path: utf8?) -> none` | gtk_source_style_scheme_manager_set_search_path |  | Sets the list of directories where the @manager looks for style scheme files. If @path is %NULL, the search path is reset to default. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| scheme-ids | utf8 | read |  |
| search-path | utf8 | read, write |  |

### GtkSource.StyleSchemePreview

Parent: `Gtk.Widget` ?? Implements: `Gtk.Accessible`, `Gtk.Actionable`, `Gtk.Buildable`, `Gtk.ConstraintTarget` ?? GType: `GtkSourceStyleSchemePreview` ?? C type: `GtkSourceStyleSchemePreview`

A preview widget for [class@StyleScheme]. This widget provides a convenient [class@Gtk.Widget] to preview a [class@StyleScheme]. The [property@Styl...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `StyleSchemePreview.new(scheme: StyleScheme) -> Gtk.Widget` | gtk_source_style_scheme_preview_new | 5.4 | Creates a new #GtkSourceStyleSchemePreview to preview the style scheme provided in @scheme. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_scheme | `StyleSchemePreview.get_scheme() -> StyleScheme` | gtk_source_style_scheme_preview_get_scheme | 5.4 | Gets the #GtkSourceStyleScheme previewed by the widget. |
| get_selected | `StyleSchemePreview.get_selected() -> gboolean` | gtk_source_style_scheme_preview_get_selected |  |  |
| set_selected | `StyleSchemePreview.set_selected(selected: gboolean) -> none` | gtk_source_style_scheme_preview_set_selected |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| scheme | StyleScheme | read, write, construct-only |  |
| selected | gboolean | read, write |  |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| activate | `` | none | last |  |  |

### GtkSource.Tag

Parent: `Gtk.TextTag` ?? GType: `GtkSourceTag` ?? C type: `GtkSourceTag`

A tag that can be applied to text in a [class@Buffer]. `GtkSourceTag` is a subclass of [class@Gtk.TextTag] that adds properties useful for the GtkS...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.TextTag |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Tag.new(name: utf8?) -> Gtk.TextTag` | gtk_source_tag_new |  | Creates a `GtkSourceTag`. Configure the tag using object arguments, i.e. using [method@GObject.Object.set]. For usual cases, [method@Buffer.create_... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| draw-spaces | gboolean | read, write | Whether to draw white spaces. This property takes precedence over the value defined by the [class@SpaceDrawer]'s [property@SpaceDrawer:matrix] prop... |
| draw-spaces-set | gboolean | read, write | Whether the [property@Tag:draw-spaces] property is set and must be taken into account. |

### GtkSource.View

Parent: `Gtk.TextView` ?? Subclasses: `Map` ?? Implements: `Gtk.Accessible`, `Gtk.AccessibleText`, `Gtk.Buildable`, `Gtk.ConstraintTarget`, `Gtk.Scrollable` ?? GType: `GtkSourceView` ?? C type: `GtkSourceView`

Subclass of [class@Gtk.TextView]. `GtkSourceView` is the main class of the GtkSourceView library. Use a [class@Buffer] to display text with a `GtkS...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.TextView |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `View.new() -> Gtk.Widget` | gtk_source_view_new |  | Creates a new `GtkSourceView`. By default, an empty [class@Buffer] will be lazily created and can be retrieved with [method@Gtk.TextView.get_buffer... |
| new_with_buffer | `View.new_with_buffer(buffer: Buffer) -> Gtk.Widget` | gtk_source_view_new_with_buffer |  | Creates a new #GtkSourceView widget displaying the buffer @buffer. One buffer can be shared among many widgets. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_auto_indent | `View.get_auto_indent() -> gboolean` | gtk_source_view_get_auto_indent |  | Returns whether auto-indentation of text is enabled. |
| get_background_pattern | `View.get_background_pattern() -> BackgroundPatternType` | gtk_source_view_get_background_pattern |  | Returns the #GtkSourceBackgroundPatternType specifying if and how the background pattern should be displayed for this @view. |
| get_completion | `View.get_completion() -> Completion` | gtk_source_view_get_completion |  | Gets the [class@Completion] associated with @view. The returned object is guaranteed to be the same for the lifetime of @view. Each `GtkSourceView`... |
| get_enable_snippets | `View.get_enable_snippets() -> gboolean` | gtk_source_view_get_enable_snippets |  | Gets the [property@View:enable-snippets] property. If %TRUE, matching snippets found in the [class@SnippetManager] may be expanded when the user pr... |
| get_gutter | `View.get_gutter(window_type: Gtk.TextWindowType) -> Gutter` | gtk_source_view_get_gutter |  | Returns the [class@Gutter] object associated with @window_type for @view. Only %GTK_TEXT_WINDOW_LEFT and %GTK_TEXT_WINDOW_RIGHT are supported, resp... |
| get_highlight_current_line | `View.get_highlight_current_line() -> gboolean` | gtk_source_view_get_highlight_current_line |  | Returns whether the current line is highlighted. |
| get_hover | `View.get_hover() -> Hover` | gtk_source_view_get_hover |  | Gets the [class@Hover] associated with @view. The returned object is guaranteed to be the same for the lifetime of @view. Each [class@View] object ... |
| get_indent_on_tab | `View.get_indent_on_tab() -> gboolean` | gtk_source_view_get_indent_on_tab |  | Returns whether when the tab key is pressed the current selection should get indented instead of replaced with the `\t` character. |
| get_indent_width | `View.get_indent_width() -> gint` | gtk_source_view_get_indent_width |  | Returns the number of spaces to use for each step of indent. See [method@View.set_indent_width] for details. |
| get_indenter | `View.get_indenter() -> Indenter` | gtk_source_view_get_indenter |  | Gets the [property@View:indenter] property. |
| get_insert_spaces_instead_of_tabs | `View.get_insert_spaces_instead_of_tabs() -> gboolean` | gtk_source_view_get_insert_spaces_instead_of_tabs |  | Returns whether when inserting a tabulator character it should be replaced by a group of space characters. |
| get_mark_attributes | `View.get_mark_attributes(category: utf8, priority: gint) -> MarkAttributes` | gtk_source_view_get_mark_attributes |  | Gets attributes and priority for the @category. |
| get_right_margin_position | `View.get_right_margin_position() -> guint` | gtk_source_view_get_right_margin_position |  | Gets the position of the right margin in the given @view. |
| get_show_line_marks | `View.get_show_line_marks() -> gboolean` | gtk_source_view_get_show_line_marks |  | Returns whether line marks are displayed beside the text. |
| get_show_line_numbers | `View.get_show_line_numbers() -> gboolean` | gtk_source_view_get_show_line_numbers |  | Returns whether line numbers are displayed beside the text. |
| get_show_right_margin | `View.get_show_right_margin() -> gboolean` | gtk_source_view_get_show_right_margin |  | Returns whether a right margin is displayed. |
| get_smart_backspace | `View.get_smart_backspace() -> gboolean` | gtk_source_view_get_smart_backspace |  | Returns %TRUE if pressing the Backspace key will try to delete spaces up to the previous tab stop. |
| get_smart_home_end | `View.get_smart_home_end() -> SmartHomeEndType` | gtk_source_view_get_smart_home_end |  | Returns a [enum@SmartHomeEndType] end value specifying how the cursor will move when HOME and END keys are pressed. |
| get_space_drawer | `View.get_space_drawer() -> SpaceDrawer` | gtk_source_view_get_space_drawer |  | Gets the [class@SpaceDrawer] associated with @view. The returned object is guaranteed to be the same for the lifetime of @view. Each [class@View] o... |
| get_tab_width | `View.get_tab_width() -> guint` | gtk_source_view_get_tab_width |  | Returns the width of tabulation in characters. |
| get_visual_column | `View.get_visual_column(iter: Gtk.TextIter) -> guint` | gtk_source_view_get_visual_column |  | Determines the visual column at @iter taking into consideration the [property@View:tab-width] of @view. |
| indent_lines | `View.indent_lines(start: Gtk.TextIter, end: Gtk.TextIter) -> none` | gtk_source_view_indent_lines |  | Inserts one indentation level at the beginning of the specified lines. The empty lines are not indented. |
| push_snippet | `View.push_snippet(snippet: Snippet, location: Gtk.TextIter?) -> none` | gtk_source_view_push_snippet |  | Inserts a new snippet at @location If another snippet was already active, it will be paused and the new snippet will become active. Once the focus ... |
| set_auto_indent | `View.set_auto_indent(enable: gboolean) -> none` | gtk_source_view_set_auto_indent |  | If %TRUE auto-indentation of text is enabled. When Enter is pressed to create a new line, the auto-indentation inserts the same indentation as the ... |
| set_background_pattern | `View.set_background_pattern(background_pattern: BackgroundPatternType) -> none` | gtk_source_view_set_background_pattern |  | Set if and how the background pattern should be displayed. |
| set_enable_snippets | `View.set_enable_snippets(enable_snippets: gboolean) -> none` | gtk_source_view_set_enable_snippets |  | Sets the [property@View:enable-snippets] property. If @enable_snippets is %TRUE, matching snippets found in the [class@SnippetManager] may be expan... |
| set_highlight_current_line | `View.set_highlight_current_line(highlight: gboolean) -> none` | gtk_source_view_set_highlight_current_line |  | If @highlight is %TRUE the current line will be highlighted. |
| set_indent_on_tab | `View.set_indent_on_tab(enable: gboolean) -> none` | gtk_source_view_set_indent_on_tab |  | If %TRUE, when the tab key is pressed when several lines are selected, the selected lines are indented of one level instead of being replaced with ... |
| set_indent_width | `View.set_indent_width(width: gint) -> none` | gtk_source_view_set_indent_width |  | Sets the number of spaces to use for each step of indent when the tab key is pressed. If @width is -1, the value of the [property@View:tab-width] p... |
| set_indenter | `View.set_indenter(indenter: Indenter?) -> none` | gtk_source_view_set_indenter |  | Sets the indenter for @view to @indenter. Note that the indenter will not be used unless #GtkSourceView:auto-indent has been set to %TRUE. |
| set_insert_spaces_instead_of_tabs | `View.set_insert_spaces_instead_of_tabs(enable: gboolean) -> none` | gtk_source_view_set_insert_spaces_instead_of_tabs |  | If %TRUE a tab key pressed is replaced by a group of space characters. Of course it is still possible to insert a real `\t` programmatically with t... |
| set_mark_attributes | `View.set_mark_attributes(category: utf8, attributes: MarkAttributes, priority: gint) -> none` | gtk_source_view_set_mark_attributes |  | Sets attributes and priority for the @category. |
| set_right_margin_position | `View.set_right_margin_position(pos: guint) -> none` | gtk_source_view_set_right_margin_position |  | Sets the position of the right margin in the given @view. |
| set_show_line_marks | `View.set_show_line_marks(show: gboolean) -> none` | gtk_source_view_set_show_line_marks |  | If %TRUE line marks will be displayed beside the text. |
| set_show_line_numbers | `View.set_show_line_numbers(show: gboolean) -> none` | gtk_source_view_set_show_line_numbers |  | If %TRUE line numbers will be displayed beside the text. |
| set_show_right_margin | `View.set_show_right_margin(show: gboolean) -> none` | gtk_source_view_set_show_right_margin |  | If %TRUE a right margin is displayed. |
| set_smart_backspace | `View.set_smart_backspace(smart_backspace: gboolean) -> none` | gtk_source_view_set_smart_backspace |  | When set to %TRUE, pressing the Backspace key will try to delete spaces up to the previous tab stop. |
| set_smart_home_end | `View.set_smart_home_end(smart_home_end: SmartHomeEndType) -> none` | gtk_source_view_set_smart_home_end |  | Set the desired movement of the cursor when HOME and END keys are pressed. |
| set_tab_width | `View.set_tab_width(width: guint) -> none` | gtk_source_view_set_tab_width |  | Sets the width of tabulation in characters. The #GtkTextBuffer still contains `\t` characters, but they can take a different visual width in a [cla... |
| unindent_lines | `View.unindent_lines(start: Gtk.TextIter, end: Gtk.TextIter) -> none` | gtk_source_view_unindent_lines |  | Removes one indentation level at the beginning of the specified lines. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| auto-indent | gboolean | read, write |  |
| background-pattern | BackgroundPatternType | read, write | Draw a specific background pattern on the view. |
| completion | Completion | read | The completion object associated with the view |
| enable-snippets | gboolean | read, write | The property denotes if snippets should be expanded when the user presses Tab after having typed a word matching the snippets found in [class@Snipp... |
| highlight-current-line | gboolean | read, write |  |
| indent-on-tab | gboolean | read, write |  |
| indent-width | gint | read, write | Width of an indentation step expressed in number of spaces. |
| indenter | Indenter | read, write | The property is a [iface@Indenter] to use to indent as the user types into the [class@View]. |
| insert-spaces-instead-of-tabs | gboolean | read, write |  |
| right-margin-position | guint | read, write | Position of the right margin. |
| show-line-marks | gboolean | read, write | Whether to display line mark pixbufs |
| show-line-numbers | gboolean | read, write | Whether to display line numbers |
| show-right-margin | gboolean | read, write | Whether to display the right margin. |
| smart-backspace | gboolean | read, write | Whether smart Backspace should be used. |
| smart-home-end | SmartHomeEndType | read, write | Set the behavior of the HOME and END keys. |
| space-drawer | SpaceDrawer | read | The [class@SpaceDrawer] object associated with the view.4 |
| tab-width | guint | read, write | Width of a tab character expressed in number of spaces. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| change-case | `case_type: ChangeCaseType` | none | last |  | Keybinding signal to change case of the text at the current cursor position. |
| change-number | `count: gint` | none | last |  | Keybinding signal to edit a number at the current cursor position. |
| join-lines | `` | none | last |  | Keybinding signal to join the lines currently selected. |
| line-mark-activated | `iter: Gtk.TextIter, button: guint, state: Gdk.ModifierType, n_presses: gint` | none | last |  | Emitted when a line mark has been activated (for instance when there was a button press in the line marks gutter). You can use @iter to determine o... |
| move-lines | `down: gboolean` | none | last |  | The signal is a keybinding which gets emitted when the user initiates moving a line. The default binding key is Alt+Up/Down arrow. And moves the cu... |
| move-to-matching-bracket | `extend_selection: gboolean` | none | last |  | Keybinding signal to move the cursor to the matching bracket. |
| move-words | `count: gint` | none | last |  | The signal is a keybinding which gets emitted when the user initiates moving a word. The default binding key is Alt+Left/Right Arrow and moves the ... |
| push-snippet | `snippet: Snippet, location: inout Gtk.TextIter` | none | last |  | The signal is emitted to insert a new snippet into the view. If another snippet was active, it will be paused until all focus positions of @snippet... |
| show-completion | `` | none | last |  | The signal is a key binding signal which gets emitted when the user requests a completion, by pressing <keycombo><keycap>Control</keycap><keycap>sp... |
| smart-home-end | `iter: Gtk.TextIter, count: gint` | none | last |  | Emitted when a the cursor was moved according to the smart home end setting. The signal is emitted after the cursor is moved, but during the [signa... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| line_mark_activated | `line_mark_activated(iter: Gtk.TextIter, button: guint, state: Gdk.ModifierType, n_presses: gint) -> none` |  |  |  |
| move_lines | `move_lines(down: gboolean) -> none` |  |  |  |
| move_words | `move_words(step: gint) -> none` |  |  |  |
| push_snippet | `push_snippet(snippet: Snippet, location: Gtk.TextIter?) -> none` |  |  | Inserts a new snippet at @location If another snippet was already active, it will be paused and the new snippet will become active. Once the focus ... |
| show_completion | `show_completion() -> none` |  |  |  |

### GtkSource.VimIMContext

Parent: `Gtk.IMContext` ?? GType: `GtkSourceVimIMContext` ?? C type: `GtkSourceVimIMContext`

Vim emulation. The `GtkSourceVimIMContext` is a [class@Gtk.IMContext] implementation that can be used to provide Vim-like editing controls within a...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `VimIMContext.new() -> Gtk.IMContext` | gtk_source_vim_im_context_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| execute_command | `VimIMContext.execute_command(command: utf8) -> none` | gtk_source_vim_im_context_execute_command | 5.4 | Executes @command as if it was typed into the command bar by the user except that this does not emit the [signal@VimIMContext::execute-command] sig... |
| get_command_bar_text | `VimIMContext.get_command_bar_text() -> utf8` | gtk_source_vim_im_context_get_command_bar_text | 5.4 | Gets the current command-bar text as it is entered by the user. |
| get_command_text | `VimIMContext.get_command_text() -> utf8` | gtk_source_vim_im_context_get_command_text | 5.4 | Gets the current command text as it is entered by the user. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| command-bar-text | utf8 | read |  |
| command-text | utf8 | read |  |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| edit | `view: View, path: utf8?` | none | last | 5.4 | Requests the application open the file found at @path. If @path is %NULL, then the current file should be reloaded from storage. This may be execut... |
| execute-command | `command: utf8` | gboolean | last | 5.4 | The signal is emitted when a command should be executed. This might be something like `:wq` or `:e <path>`. If the application chooses to implement... |
| format-text | `begin: Gtk.TextIter, end: Gtk.TextIter` | none | last | 5.4 | Requests that the application format the text between @begin and @end. |
| write | `view: View, path: utf8?` | none | last | 5.4 | Requests the application save the file. If a filename was provided, it will be available to the signal handler as @path. This may be executed in re... |

## Interfaces

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| CompletionProposal |  | 0 | 0 | 1 | Interface for completion proposals. This interface is used to denote that an object is capable of being a completion proposal for [class@Completion... |
| CompletionProvider |  | 0 | 0 | 10 | Completion provider interface. You must implement this interface to provide proposals to [class@Completion]. In most cases, implementations of this... |
| HoverProvider |  | 0 | 0 | 2 | Interface to populate interactive tooltips. `GtkSourceHoverProvider` is an interface that should be implemented to extend the contents of a [class@... |
| Indenter |  | 0 | 0 | 2 | Auto-indentation interface. By default, [class@View] can auto-indent as you type when [property@View:auto-indent] is enabled. The indentation simpl... |
| StyleSchemeChooser |  | 0 | 0 | 2 | Interface implemented by widgets for choosing style schemes. `GtkSourceStyleSchemeChooser` is an interface that is implemented by widgets for choos... |

### GtkSource.CompletionProposal

GType: `GtkSourceCompletionProposal` ?? C type: `GtkSourceCompletionProposal`

Interface for completion proposals. This interface is used to denote that an object is capable of being a completion proposal for [class@Completion...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_typed_text | `CompletionProposal.get_typed_text() -> utf8` | gtk_source_completion_proposal_get_typed_text | 5.6 | Gets the typed-text for the proposal, if supported by the implementation. Implementing this virtual-function is optional, but can be useful to allo... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_typed_text | `get_typed_text() -> utf8` |  | 5.6 | Gets the typed-text for the proposal, if supported by the implementation. Implementing this virtual-function is optional, but can be useful to allo... |

### GtkSource.CompletionProvider

GType: `GtkSourceCompletionProvider` ?? C type: `GtkSourceCompletionProvider`

Completion provider interface. You must implement this interface to provide proposals to [class@Completion]. In most cases, implementations of this...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| activate | `CompletionProvider.activate(context: CompletionContext, proposal: CompletionProposal) -> none` | gtk_source_completion_provider_activate |  | This function requests @proposal to be activated by the #GtkSourceCompletionProvider. What the provider does to activate the proposal is specific t... |
| display | `CompletionProvider.display(context: CompletionContext, proposal: CompletionProposal, cell: CompletionCell) -> none` | gtk_source_completion_provider_display |  | This function requests that the #GtkSourceCompletionProvider prepares @cell to display the contents of @proposal. Based on @cells column type, you ... |
| get_priority | `CompletionProvider.get_priority(context: CompletionContext) -> gint` | gtk_source_completion_provider_get_priority |  | This function should return the priority of @self in @context. The priority is used to sort groups of completion proposals by provider so that high... |
| get_title | `CompletionProvider.get_title() -> utf8` | gtk_source_completion_provider_get_title |  | Gets the title of the completion provider, if any. Currently, titles are not displayed in the completion results, but may be at some point in the f... |
| is_trigger | `CompletionProvider.is_trigger(iter: Gtk.TextIter, ch: gunichar) -> gboolean` | gtk_source_completion_provider_is_trigger |  | This function is used to determine if a character inserted into the text editor should cause a new completion request to be triggered. An example w... |
| key_activates | `CompletionProvider.key_activates(context: CompletionContext, proposal: CompletionProposal, keyval: guint, state: Gdk.ModifierType) -> gboolean` | gtk_source_completion_provider_key_activates |  | This function is used to determine if a key typed by the user should activate @proposal (resulting in committing the text to the editor). This is u... |
| list_alternates | `CompletionProvider.list_alternates(context: CompletionContext, proposal: CompletionProposal) -> CompletionProposal` | gtk_source_completion_provider_list_alternates |  | Providers should return a list of alternates to @proposal or %NULL if there are no alternates available. This can be used by the completion view to... |
| populate_async | `CompletionProvider.populate_async(context: CompletionContext, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gtk_source_completion_provider_populate_async |  | Asynchronously requests that the provider populates the completion results for @context. For providers that would like to populate a [iface@Gio.Lis... |
| populate_finish | `CompletionProvider.populate_finish(result: Gio.AsyncResult) -> Gio.ListModel throws` | gtk_source_completion_provider_populate_finish |  | Completes an asynchronous operation to populate a completion provider. |
| refilter | `CompletionProvider.refilter(context: CompletionContext, model: Gio.ListModel) -> none` | gtk_source_completion_provider_refilter |  | This function can be used to filter results previously provided to the [class@CompletionContext] by the #GtkSourceCompletionProvider. This can happ... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| activate | `activate(context: CompletionContext, proposal: CompletionProposal) -> none` |  |  | This function requests @proposal to be activated by the #GtkSourceCompletionProvider. What the provider does to activate the proposal is specific t... |
| display | `display(context: CompletionContext, proposal: CompletionProposal, cell: CompletionCell) -> none` |  |  | This function requests that the #GtkSourceCompletionProvider prepares @cell to display the contents of @proposal. Based on @cells column type, you ... |
| get_priority | `get_priority(context: CompletionContext) -> gint` |  |  | This function should return the priority of @self in @context. The priority is used to sort groups of completion proposals by provider so that high... |
| get_title | `get_title() -> utf8` |  |  | Gets the title of the completion provider, if any. Currently, titles are not displayed in the completion results, but may be at some point in the f... |
| is_trigger | `is_trigger(iter: Gtk.TextIter, ch: gunichar) -> gboolean` |  |  | This function is used to determine if a character inserted into the text editor should cause a new completion request to be triggered. An example w... |
| key_activates | `key_activates(context: CompletionContext, proposal: CompletionProposal, keyval: guint, state: Gdk.ModifierType) -> gboolean` |  |  | This function is used to determine if a key typed by the user should activate @proposal (resulting in committing the text to the editor). This is u... |
| list_alternates | `list_alternates(context: CompletionContext, proposal: CompletionProposal) -> CompletionProposal` |  |  | Providers should return a list of alternates to @proposal or %NULL if there are no alternates available. This can be used by the completion view to... |
| populate | `populate(context: CompletionContext) -> Gio.ListModel throws` |  |  |  |
| populate_async | `populate_async(context: CompletionContext, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Asynchronously requests that the provider populates the completion results for @context. For providers that would like to populate a [iface@Gio.Lis... |
| populate_finish | `populate_finish(result: Gio.AsyncResult) -> Gio.ListModel throws` |  |  | Completes an asynchronous operation to populate a completion provider. |
| refilter | `refilter(context: CompletionContext, model: Gio.ListModel) -> none` |  |  | This function can be used to filter results previously provided to the [class@CompletionContext] by the #GtkSourceCompletionProvider. This can happ... |

### GtkSource.HoverProvider

GType: `GtkSourceHoverProvider` ?? C type: `GtkSourceHoverProvider`

Interface to populate interactive tooltips. `GtkSourceHoverProvider` is an interface that should be implemented to extend the contents of a [class@...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| populate_async | `HoverProvider.populate_async(context: HoverContext, display: HoverDisplay, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gtk_source_hover_provider_populate_async |  |  |
| populate_finish | `HoverProvider.populate_finish(result: Gio.AsyncResult) -> gboolean throws` | gtk_source_hover_provider_populate_finish |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| populate | `populate(context: HoverContext, display: HoverDisplay) -> gboolean throws` |  |  |  |
| populate_async | `populate_async(context: HoverContext, display: HoverDisplay, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  |  |
| populate_finish | `populate_finish(result: Gio.AsyncResult) -> gboolean throws` |  |  |  |

### GtkSource.Indenter

GType: `GtkSourceIndenter` ?? C type: `GtkSourceIndenter`

Auto-indentation interface. By default, [class@View] can auto-indent as you type when [property@View:auto-indent] is enabled. The indentation simpl...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| indent | `Indenter.indent(view: View, iter: inout Gtk.TextIter) -> none` | gtk_source_indenter_indent |  | This function should be implemented to alter the indentation of text within the view. @view is provided so that the indenter may retrieve settings ... |
| is_trigger | `Indenter.is_trigger(view: View, location: Gtk.TextIter, state: Gdk.ModifierType, keyval: guint) -> gboolean` | gtk_source_indenter_is_trigger |  | This function is used to determine if a key pressed should cause the indenter to automatically indent. The default implementation of this virtual m... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| indent | `indent(view: View, iter: inout Gtk.TextIter) -> none` |  |  | This function should be implemented to alter the indentation of text within the view. @view is provided so that the indenter may retrieve settings ... |
| is_trigger | `is_trigger(view: View, location: Gtk.TextIter, state: Gdk.ModifierType, keyval: guint) -> gboolean` |  |  | This function is used to determine if a key pressed should cause the indenter to automatically indent. The default implementation of this virtual m... |

### GtkSource.StyleSchemeChooser

GType: `GtkSourceStyleSchemeChooser` ?? C type: `GtkSourceStyleSchemeChooser`

Interface implemented by widgets for choosing style schemes. `GtkSourceStyleSchemeChooser` is an interface that is implemented by widgets for choos...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_style_scheme | `StyleSchemeChooser.get_style_scheme() -> StyleScheme` | gtk_source_style_scheme_chooser_get_style_scheme |  | Gets the currently-selected scheme. |
| set_style_scheme | `StyleSchemeChooser.set_style_scheme(scheme: StyleScheme) -> none` | gtk_source_style_scheme_chooser_set_style_scheme |  | Sets the scheme. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| style-scheme | StyleScheme | read, write | Contains the currently selected style scheme. The property can be set to change the current selection programmatically. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_style_scheme | `get_style_scheme() -> StyleScheme` |  |  | Gets the currently-selected scheme. |
| set_style_scheme | `set_style_scheme(scheme: StyleScheme) -> none` |  |  | Sets the scheme. |

## Enums

### GtkSource.BackgroundPatternType

GType: `GtkSourceBackgroundPatternType` ?? C type: `GtkSourceBackgroundPatternType`

no pattern

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| grid | 1 | grid | grid pattern |
| none | 0 | none | no pattern |

### GtkSource.BracketMatchType

GType: `GtkSourceBracketMatchType` ?? C type: `GtkSourceBracketMatchType`

there is no bracket to match.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| found | 3 | found | a matching bracket was found. |
| none | 0 | none | there is no bracket to match. |
| not_found | 2 | not-found | a matching bracket was not found. |
| out_of_range | 1 | out-of-range | matching a bracket failed because the maximum range was reached. |

### GtkSource.ChangeCaseType

GType: `GtkSourceChangeCaseType` ?? C type: `GtkSourceChangeCaseType`

change case to lowercase.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| lower | 0 | lower | change case to lowercase. |
| title | 3 | title | capitalize each word. |
| toggle | 2 | toggle | toggle case of each character. |
| upper | 1 | upper | change case to uppercase. |

### GtkSource.CompletionActivation

GType: `GtkSourceCompletionActivation` ?? C type: `GtkSourceCompletionActivation`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| interactive | 1 | interactive |  |
| none | 0 | none |  |
| user_requested | 2 | user-requested |  |

### GtkSource.CompletionColumn

GType: `GtkSourceCompletionColumn` ?? C type: `GtkSourceCompletionColumn`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| after | 3 | after |  |
| before | 1 | before |  |
| comment | 4 | comment |  |
| details | 5 | details |  |
| icon | 0 | icon |  |
| typed_text | 2 | typed-text |  |

### GtkSource.CompressionType

GType: `GtkSourceCompressionType` ?? C type: `GtkSourceCompressionType`

plain text.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| gzip | 1 | gzip | gzip compression. |
| none | 0 | none | plain text. |

### GtkSource.FileLoaderError

GType: `GtkSourceFileLoaderError` ?? C type: `GtkSourceFileLoaderError`

An error code used with the %GTK_SOURCE_FILE_LOADER_ERROR domain.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| conversion_fallback | 2 | conversion-fallback | There was an encoding conversion error and it was needed to use a fallback character. |
| encoding_auto_detection_failed | 1 | encoding-auto-detection-failed | It is not possible to detect the encoding automatically. |
| too_big | 0 | too-big | The file is too big. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | gtk_source_file_loader_error_quark |  |  |

### GtkSource.FileSaverError

GType: `GtkSourceFileSaverError` ?? C type: `GtkSourceFileSaverError`

An error code used with the %GTK_SOURCE_FILE_SAVER_ERROR domain.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| externally_modified | 1 | externally-modified | The file is externally modified. |
| invalid_chars | 0 | invalid-chars | The buffer contains invalid characters. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | gtk_source_file_saver_error_quark |  |  |

### GtkSource.GutterRendererAlignmentMode

GType: `GtkSourceGutterRendererAlignmentMode` ?? C type: `GtkSourceGutterRendererAlignmentMode`

The alignment mode of the renderer, when a cell spans multiple lines (due to text wrapping).

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cell | 0 | cell | The full cell. |
| first | 1 | first | The first line. |
| last | 2 | last | The last line. |

### GtkSource.NewlineType

GType: `GtkSourceNewlineType` ?? C type: `GtkSourceNewlineType`

line feed, used on UNIX.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cr | 1 | cr | carriage return, used on Mac. |
| cr_lf | 2 | cr-lf | carriage return followed by a line feed, used on Windows. |
| lf | 0 | lf | line feed, used on UNIX. |

### GtkSource.SmartHomeEndType

GType: `GtkSourceSmartHomeEndType` ?? C type: `GtkSourceSmartHomeEndType`

smart-home-end disabled.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| after | 2 | after | move to the beginning/end of the line on the first press of the HOME/END keys and to the first/last non-whitespace character on the second press. |
| always | 3 | always | always move to the first/last non-whitespace character when the HOME/END keys are pressed. |
| before | 1 | before | move to the first/last non-whitespace character on the first press of the HOME/END keys and to the beginning/end of the line on the second press. |
| disabled | 0 | disabled | smart-home-end disabled. |

### GtkSource.ViewGutterPosition

GType: `GtkSourceViewGutterPosition` ?? C type: `GtkSourceViewGutterPosition`

the gutter position of the lines renderer

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| lines | -30 | lines | the gutter position of the lines renderer |
| marks | -20 | marks | the gutter position of the marks renderer |

## Flags

### GtkSource.FileSaverFlags

GType: `GtkSourceFileSaverFlags` ?? C type: `GtkSourceFileSaverFlags`

Flags to define the behavior of a [flags@FileSaverFlags].

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| create_backup | 4 | create-backup | Create a backup before saving the file. |
| ignore_invalid_chars | 1 | ignore-invalid-chars | Ignore invalid characters. |
| ignore_modification_time | 2 | ignore-modification-time | Save file despite external modifications. |
| none | 0 | none | No flags. |

### GtkSource.SortFlags

GType: `GtkSourceSortFlags` ?? C type: `GtkSourceSortFlags`

no flags specified

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| case_sensitive | 1 | case-sensitive | case sensitive sort |
| none | 0 | none | no flags specified |
| remove_duplicates | 4 | remove-duplicates | remove duplicates |
| reverse_order | 2 | reverse-order | sort in reverse order |

### GtkSource.SpaceLocationFlags

GType: `GtkSourceSpaceLocationFlags` ?? C type: `GtkSourceSpaceLocationFlags`

#GtkSourceSpaceLocationFlags contains flags for white space locations. If a line contains only white spaces (no text), the white spaces match both ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all | 7 | all | White spaces anywhere. |
| inside_text | 2 | inside-text | White spaces inside a line of text. |
| leading | 1 | leading | Leading white spaces on a line, i.e. the indentation. |
| none | 0 | none | No flags. |
| trailing | 4 | trailing | Trailing white spaces on a line. |

### GtkSource.SpaceTypeFlags

GType: `GtkSourceSpaceTypeFlags` ?? C type: `GtkSourceSpaceTypeFlags`

#GtkSourceSpaceTypeFlags contains flags for white space types.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all | 15 | all | All white spaces. |
| nbsp | 8 | nbsp | Non-breaking space character. |
| newline | 4 | newline | Line break character. If the #GtkSourceBuffer:implicit-trailing-newline property is %TRUE, #GtkSourceSpaceDrawer also draws a line break at the end... |
| none | 0 | none | No flags. |
| space | 1 | space | Space character. |
| tab | 2 | tab | Tab character. |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| BufferClass |  | 0 | 0 | 0 |  |
| CompletionCellClass |  | 0 | 0 | 0 |  |
| CompletionClass |  | 0 | 0 | 0 |  |
| CompletionContextClass |  | 0 | 0 | 0 |  |
| CompletionProposalInterface |  | 0 | 0 | 0 | a newly allocated string, or %NULL |
| CompletionProviderInterface |  | 0 | 0 | 0 | a title for the provider or %NULL |
| CompletionSnippetsClass |  | 0 | 0 | 0 |  |
| CompletionWordsClass |  | 0 | 0 | 0 |  |
| Encoding |  | 0 | 0 | 10 | Character encoding. The #GtkSourceEncoding boxed type represents a character encoding. It is used for example by #GtkSourceFile. Note that the text... |
| FileClass |  | 0 | 0 | 0 |  |
| FileLoaderClass |  | 0 | 0 | 0 |  |
| FileSaverClass |  | 0 | 0 | 0 |  |
| GutterClass |  | 0 | 0 | 0 |  |
| GutterLinesClass |  | 0 | 0 | 0 |  |
| GutterRendererClass |  | 0 | 0 | 0 | a #GtkSourceGutterRenderer. |
| GutterRendererPixbufClass |  | 0 | 0 | 0 |  |
| GutterRendererTextClass |  | 0 | 0 | 0 |  |
| HoverClass |  | 0 | 0 | 0 |  |
| HoverContextClass |  | 0 | 0 | 0 |  |
| HoverDisplayClass |  | 0 | 0 | 0 |  |
| HoverProviderInterface |  | 0 | 0 | 0 |  |
| IndenterInterface |  | 0 | 0 | 0 | The virtual function table for #GtkSourceIndenter. |
| LanguageClass |  | 0 | 0 | 0 |  |
| LanguageManagerClass |  | 0 | 0 | 0 |  |
| MapClass |  | 0 | 0 | 0 |  |
| MarkAttributesClass |  | 0 | 0 | 0 |  |
| MarkClass |  | 0 | 0 | 0 |  |
| PrintCompositorClass |  | 0 | 0 | 0 |  |
| RegionClass |  | 0 | 0 | 0 |  |
| RegionIter |  | 0 | 0 | 3 | An opaque datatype. Ignore all its fields and initialize the iter with [method@Region.get_start_region_iter]. |
| SearchContextClass |  | 0 | 0 | 0 |  |
| SearchSettingsClass |  | 0 | 0 | 0 |  |
| SnippetChunkClass |  | 0 | 0 | 0 |  |
| SnippetClass |  | 0 | 0 | 0 |  |
| SnippetContextClass |  | 0 | 0 | 0 |  |
| SnippetManagerClass |  | 0 | 0 | 0 |  |
| SpaceDrawerClass |  | 0 | 0 | 0 |  |
| StyleClass |  | 0 | 0 | 0 |  |
| StyleSchemeChooserButtonClass |  | 0 | 0 | 0 |  |
| StyleSchemeChooserInterface |  | 0 | 0 | 0 | the currently-selected scheme. |
| StyleSchemeChooserWidgetClass |  | 0 | 0 | 0 |  |
| StyleSchemeClass |  | 0 | 0 | 0 |  |
| StyleSchemeManagerClass |  | 0 | 0 | 0 |  |
| StyleSchemePreviewClass |  | 0 | 0 | 0 |  |
| TagClass |  | 0 | 0 | 0 |  |
| ViewClass |  | 0 | 0 | 0 | a #GtkSourceView |
| VimIMContextClass |  | 0 | 0 | 0 |  |

### GtkSource.BufferClass

C type: `GtkSourceBufferClass`

#### Fields

| Field | Type |
| --- | --- |
| _reserved | gpointer |
| bracket_matched | none |
| parent_class | Gtk.TextBufferClass |

### GtkSource.CompletionCellClass

C type: `GtkSourceCompletionCellClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.WidgetClass |

### GtkSource.CompletionClass

C type: `GtkSourceCompletionClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GtkSource.CompletionContextClass

C type: `GtkSourceCompletionContextClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GtkSource.CompletionProposalInterface

C type: `GtkSourceCompletionProposalInterface`

a newly allocated string, or %NULL

#### Fields

| Field | Type |
| --- | --- |
| get_typed_text | utf8 |
| parent_iface | GObject.TypeInterface |

### GtkSource.CompletionProviderInterface

C type: `GtkSourceCompletionProviderInterface`

a title for the provider or %NULL

#### Fields

| Field | Type |
| --- | --- |
| activate | none |
| display | none |
| get_priority | gint |
| get_title | utf8 |
| is_trigger | gboolean |
| key_activates | gboolean |
| list_alternates | CompletionProposal |
| parent_iface | GObject.TypeInterface |
| populate | Gio.ListModel |
| populate_async | none |
| populate_finish | Gio.ListModel |
| refilter | none |

### GtkSource.CompletionSnippetsClass

C type: `GtkSourceCompletionSnippetsClass`

#### Fields

| Field | Type |
| --- | --- |
| _reserved | gpointer |
| parent_class | GObject.ObjectClass |

### GtkSource.CompletionWordsClass

C type: `GtkSourceCompletionWordsClass`

#### Fields

| Field | Type |
| --- | --- |
| _reserved | gpointer |
| parent_class | GObject.ObjectClass |

### GtkSource.Encoding

GType: `GtkSourceEncoding` ?? C type: `GtkSourceEncoding`

Character encoding. The #GtkSourceEncoding boxed type represents a character encoding. It is used for example by #GtkSourceFile. Note that the text...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_all | `get_all() -> GLib.SList` | gtk_source_encoding_get_all |  | Gets all encodings. |
| get_current | `get_current() -> Encoding` | gtk_source_encoding_get_current |  | Gets the #GtkSourceEncoding for the current locale. See also [func@GLib.get_charset]. |
| get_default_candidates | `get_default_candidates() -> GLib.SList` | gtk_source_encoding_get_default_candidates |  | Gets the list of default candidate encodings to try when loading a file. See [method@FileLoader.set_candidate_encodings]. This function returns a d... |
| get_from_charset | `get_from_charset(charset: utf8) -> Encoding` | gtk_source_encoding_get_from_charset |  | Gets a #GtkSourceEncoding from a character set such as "UTF-8" or "ISO-8859-1". |
| get_utf8 | `get_utf8() -> Encoding` | gtk_source_encoding_get_utf8 |  | the UTF-8 encoding. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Encoding.copy() -> Encoding` | gtk_source_encoding_copy |  | Used by language bindings. |
| free | `Encoding.free() -> none` | gtk_source_encoding_free |  | Used by language bindings. |
| get_charset | `Encoding.get_charset() -> utf8` | gtk_source_encoding_get_charset |  | Gets the character set of the #GtkSourceEncoding, such as "UTF-8" or "ISO-8859-1". |
| get_name | `Encoding.get_name() -> utf8` | gtk_source_encoding_get_name |  | Gets the name of the #GtkSourceEncoding such as "Unicode" or "Western". |
| to_string | `Encoding.to_string() -> utf8` | gtk_source_encoding_to_string |  | a string representation. Free with g_free() when no longer needed. |

### GtkSource.FileClass

C type: `GtkSourceFileClass`

#### Fields

| Field | Type |
| --- | --- |
| _reserved | gpointer |
| parent_class | GObject.ObjectClass |

### GtkSource.FileLoaderClass

C type: `GtkSourceFileLoaderClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GtkSource.FileSaverClass

C type: `GtkSourceFileSaverClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GtkSource.GutterClass

C type: `GtkSourceGutterClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.WidgetClass |

### GtkSource.GutterLinesClass

C type: `GtkSourceGutterLinesClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GtkSource.GutterRendererClass

C type: `GtkSourceGutterRendererClass`

a #GtkSourceGutterRenderer.

#### Fields

| Field | Type |
| --- | --- |
| _reserved | gpointer |
| activate | none |
| begin | none |
| change_buffer | none |
| change_view | none |
| end | none |
| parent_class | Gtk.WidgetClass |
| query_activatable | gboolean |
| query_data | none |
| snapshot_line | none |

### GtkSource.GutterRendererPixbufClass

C type: `GtkSourceGutterRendererPixbufClass`

#### Fields

| Field | Type |
| --- | --- |
| _reserved | gpointer |
| parent_class | GutterRendererClass |

### GtkSource.GutterRendererTextClass

C type: `GtkSourceGutterRendererTextClass`

#### Fields

| Field | Type |
| --- | --- |
| _reserved | gpointer |
| parent_class | GutterRendererClass |

### GtkSource.HoverClass

C type: `GtkSourceHoverClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GtkSource.HoverContextClass

C type: `GtkSourceHoverContextClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GtkSource.HoverDisplayClass

C type: `GtkSourceHoverDisplayClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.WidgetClass |

### GtkSource.HoverProviderInterface

C type: `GtkSourceHoverProviderInterface`

#### Fields

| Field | Type |
| --- | --- |
| parent_iface | GObject.TypeInterface |
| populate | gboolean |
| populate_async | none |
| populate_finish | gboolean |

### GtkSource.IndenterInterface

C type: `GtkSourceIndenterInterface`

The virtual function table for #GtkSourceIndenter.

#### Fields

| Field | Type |
| --- | --- |
| indent | none |
| is_trigger | gboolean |
| parent_iface | GObject.TypeInterface |

### GtkSource.LanguageClass

C type: `GtkSourceLanguageClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GtkSource.LanguageManagerClass

C type: `GtkSourceLanguageManagerClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GtkSource.MapClass

C type: `GtkSourceMapClass`

#### Fields

| Field | Type |
| --- | --- |
| _reserved | gpointer |
| parent_class | ViewClass |

### GtkSource.MarkAttributesClass

C type: `GtkSourceMarkAttributesClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GtkSource.MarkClass

C type: `GtkSourceMarkClass`

#### Fields

| Field | Type |
| --- | --- |
| _reserved | gpointer |
| parent_class | Gtk.TextMarkClass |

### GtkSource.PrintCompositorClass

C type: `GtkSourcePrintCompositorClass`

#### Fields

| Field | Type |
| --- | --- |
| _reserved | gpointer |
| parent_class | GObject.ObjectClass |

### GtkSource.RegionClass

C type: `GtkSourceRegionClass`

#### Fields

| Field | Type |
| --- | --- |
| _reserved | gpointer |
| parent_class | GObject.ObjectClass |

### GtkSource.RegionIter

C type: `GtkSourceRegionIter`

An opaque datatype. Ignore all its fields and initialize the iter with [method@Region.get_start_region_iter].

#### Fields

| Field | Type |
| --- | --- |
| dummy1 | gpointer |
| dummy2 | guint32 |
| dummy3 | gpointer |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_subregion | `RegionIter.get_subregion(start: out Gtk.TextIter?, end: out Gtk.TextIter?) -> gboolean` | gtk_source_region_iter_get_subregion |  | Gets the subregion at this iterator. |
| is_end | `RegionIter.is_end() -> gboolean` | gtk_source_region_iter_is_end |  | whether @iter is the end iterator. |
| next | `RegionIter.next() -> gboolean` | gtk_source_region_iter_next |  | Moves @iter to the next subregion. |

### GtkSource.SearchContextClass

C type: `GtkSourceSearchContextClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GtkSource.SearchSettingsClass

C type: `GtkSourceSearchSettingsClass`

#### Fields

| Field | Type |
| --- | --- |
| _reserved | gpointer |
| parent_class | GObject.ObjectClass |

### GtkSource.SnippetChunkClass

C type: `GtkSourceSnippetChunkClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.InitiallyUnownedClass |

### GtkSource.SnippetClass

C type: `GtkSourceSnippetClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GtkSource.SnippetContextClass

C type: `GtkSourceSnippetContextClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GtkSource.SnippetManagerClass

C type: `GtkSourceSnippetManagerClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GtkSource.SpaceDrawerClass

C type: `GtkSourceSpaceDrawerClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GtkSource.StyleClass

C type: `GtkSourceStyleClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GtkSource.StyleSchemeChooserButtonClass

C type: `GtkSourceStyleSchemeChooserButtonClass`

#### Fields

| Field | Type |
| --- | --- |
| _reserved | gpointer |
| parent | Gtk.ButtonClass |

### GtkSource.StyleSchemeChooserInterface

C type: `GtkSourceStyleSchemeChooserInterface`

the currently-selected scheme.

#### Fields

| Field | Type |
| --- | --- |
| _reserved | gpointer |
| base_interface | GObject.TypeInterface |
| get_style_scheme | StyleScheme |
| set_style_scheme | none |

### GtkSource.StyleSchemeChooserWidgetClass

C type: `GtkSourceStyleSchemeChooserWidgetClass`

#### Fields

| Field | Type |
| --- | --- |
| _reserved | gpointer |
| parent | Gtk.WidgetClass |

### GtkSource.StyleSchemeClass

C type: `GtkSourceStyleSchemeClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GtkSource.StyleSchemeManagerClass

C type: `GtkSourceStyleSchemeManagerClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GtkSource.StyleSchemePreviewClass

C type: `GtkSourceStyleSchemePreviewClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.WidgetClass |

### GtkSource.TagClass

C type: `GtkSourceTagClass`

#### Fields

| Field | Type |
| --- | --- |
| _reserved | gpointer |
| parent_class | Gtk.TextTagClass |

### GtkSource.ViewClass

C type: `GtkSourceViewClass`

a #GtkSourceView

#### Fields

| Field | Type |
| --- | --- |
| _reserved | gpointer |
| line_mark_activated | none |
| move_lines | none |
| move_words | none |
| parent_class | Gtk.TextViewClass |
| push_snippet | none |
| show_completion | none |

### GtkSource.VimIMContextClass

C type: `GtkSourceVimIMContextClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.IMContextClass |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| check_version | `check_version(major: guint, minor: guint, micro: guint) -> gboolean` | gtk_source_check_version |  | Like GTK_SOURCE_CHECK_VERSION, but the check for gtk_source_check_version is at runtime instead of compile time. This is useful for compiling again... |
| encoding_get_all | `encoding_get_all() -> GLib.SList` | gtk_source_encoding_get_all |  | Gets all encodings. |
| encoding_get_current | `encoding_get_current() -> Encoding` | gtk_source_encoding_get_current |  | Gets the #GtkSourceEncoding for the current locale. See also [func@GLib.get_charset]. |
| encoding_get_default_candidates | `encoding_get_default_candidates() -> GLib.SList` | gtk_source_encoding_get_default_candidates |  | Gets the list of default candidate encodings to try when loading a file. See [method@FileLoader.set_candidate_encodings]. This function returns a d... |
| encoding_get_from_charset | `encoding_get_from_charset(charset: utf8) -> Encoding` | gtk_source_encoding_get_from_charset |  | Gets a #GtkSourceEncoding from a character set such as "UTF-8" or "ISO-8859-1". |
| encoding_get_utf8 | `encoding_get_utf8() -> Encoding` | gtk_source_encoding_get_utf8 |  | the UTF-8 encoding. |
| file_loader_error_quark | `file_loader_error_quark() -> GLib.Quark` | gtk_source_file_loader_error_quark |  |  |
| file_saver_error_quark | `file_saver_error_quark() -> GLib.Quark` | gtk_source_file_saver_error_quark |  |  |
| finalize | `finalize() -> none` | gtk_source_finalize |  | Free the resources allocated by GtkSourceView. For example it unrefs the singleton objects. It is not mandatory to call this function, it's just to... |
| get_major_version | `get_major_version() -> guint` | gtk_source_get_major_version |  | Returns the major version number of the GtkSourceView library. (e.g. in GtkSourceView version 3.20.0 this is 3.) This function is in the library, s... |
| get_micro_version | `get_micro_version() -> guint` | gtk_source_get_micro_version |  | Returns the micro version number of the GtkSourceView library. (e.g. in GtkSourceView version 3.20.0 this is 0.) This function is in the library, s... |
| get_minor_version | `get_minor_version() -> guint` | gtk_source_get_minor_version |  | Returns the minor version number of the GtkSourceView library. (e.g. in GtkSourceView version 3.20.0 this is 20.) This function is in the library, ... |
| init | `init() -> none` | gtk_source_init |  | Initializes the GtkSourceView library (e.g. for the internationalization). This function can be called several times, but is meant to be called at ... |
| scheduler_add | `scheduler_add(callback: SchedulerCallback, user_data: gpointer?) -> gsize` | gtk_source_scheduler_add | 5.2 | Simplified version of [func@scheduler_add_full]. |
| scheduler_add_full | `scheduler_add_full(callback: SchedulerCallback, user_data: gpointer?, notify: GLib.DestroyNotify) -> gsize` | gtk_source_scheduler_add_full | 5.2 | Adds a new callback that will be executed as time permits on the main thread. This is useful when you need to do a lot of background work but want ... |
| scheduler_remove | `scheduler_remove(handler_id: gsize) -> none` | gtk_source_scheduler_remove | 5.2 | Removes a scheduler callback previously registered with [func@scheduler_add] or [func@scheduler_add_full]. |
| utils_escape_search_text | `utils_escape_search_text(text: utf8) -> utf8` | gtk_source_utils_escape_search_text |  | Use this function to escape the following characters: `\n`, `\r`, `\t` and `\`. For a regular expression search, use g_regex_escape_string() instea... |
| utils_unescape_search_text | `utils_unescape_search_text(text: utf8) -> utf8` | gtk_source_utils_unescape_search_text |  | Use this function before [method@SearchSettings.set_search_text], to unescape the following sequences of characters: `\n`, `\r`, `\t` and `\\`. The... |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| MountOperationFactory | `MountOperationFactory(file: File, userdata: gpointer?) -> Gio.MountOperation` |  |  | Type definition for a function that will be called to create a [class@Gio.MountOperation]. This is useful for creating a [class@Gtk.MountOperation]. |
| SchedulerCallback | `SchedulerCallback(deadline: gint64, user_data: gpointer?) -> gboolean` |  | 5.2 | This function is called incrementally to process additional background work. A deadline is provided which can be checked using [func@GLib.get_monot... |

## Constants

| Name | Type |
| --- | --- |
| MAJOR_VERSION | gint |
| MICRO_VERSION | gint |
| MINOR_VERSION | gint |

