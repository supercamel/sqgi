# Json 1.0

SQGI import: `import("Json", "1.0")`

Packages: `json-glib-1.0`
Includes: `GObject-2.0`, `Gio-2.0`
Libraries: `libjson-glib-1.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 5 |
| Interfaces | 1 |
| Records | 14 |
| Unions | 0 |
| Enums | 4 |
| Flags | 0 |
| Functions | 24 |
| Callbacks | 4 |
| Constants | 4 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Builder | GObject.Object | 0 | 0 | 15 | `JsonBuilder` provides an object for generating a JSON tree. The root of the JSON tree can be either a [struct@Json.Object] or a [struct@Json.Array... |
| Generator | GObject.Object | 0 | 0 | 13 | `JsonGenerator` provides an object for generating a JSON data stream from a tree of [struct@Json.Node] instances, and put it into a buffer or a file. |
| Parser | GObject.Object | 0 | 9 | 13 | `JsonParser` provides an object for parsing a JSON data stream, either inside a file or inside a static buffer. ## Using `JsonParser` The `JsonPars... |
| Path | GObject.Object | 0 | 0 | 4 | `JsonPath` is a simple class implementing the JSONPath syntax for extracting data out of a JSON tree. While the semantics of the JSONPath expressio... |
| Reader | GObject.Object | 0 | 0 | 21 | `JsonReader` provides a simple, cursor-based API for parsing a JSON DOM. It is similar, in spirit, to the XML Reader API. ## Using `JsonReader` ```... |

### Json.Builder

Parent: `GObject.Object` ?? GType: `JsonBuilder` ?? C type: `JsonBuilder`

`JsonBuilder` provides an object for generating a JSON tree. The root of the JSON tree can be either a [struct@Json.Object] or a [struct@Json.Array...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | BuilderPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Builder.new() -> Builder` | json_builder_new |  | Creates a new `JsonBuilder`. You can use this object to generate a JSON tree and obtain the root node. |
| new_immutable | `Builder.new_immutable() -> Builder` | json_builder_new_immutable | 1.2 | Creates a new, immutable `JsonBuilder` instance. It is equivalent to setting the [property@Json.Builder:immutable] property set to `TRUE` at constr... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_boolean_value | `Builder.add_boolean_value(value: gboolean) -> Builder` | json_builder_add_boolean_value |  | Adds a boolean value to the currently open object member or array. If called after [method@Json.Builder.set_member_name], sets the given value as t... |
| add_double_value | `Builder.add_double_value(value: gdouble) -> Builder` | json_builder_add_double_value |  | Adds a floating point value to the currently open object member or array. If called after [method@Json.Builder.set_member_name], sets the given val... |
| add_int_value | `Builder.add_int_value(value: gint64) -> Builder` | json_builder_add_int_value |  | Adds an integer value to the currently open object member or array. If called after [method@Json.Builder.set_member_name], sets the given value as ... |
| add_null_value | `Builder.add_null_value() -> Builder` | json_builder_add_null_value |  | Adds a null value to the currently open object member or array. If called after [method@Json.Builder.set_member_name], sets the given value as the ... |
| add_string_value | `Builder.add_string_value(value: utf8) -> Builder` | json_builder_add_string_value |  | Adds a boolean value to the currently open object member or array. If called after [method@Json.Builder.set_member_name], sets the given value as t... |
| add_value | `Builder.add_value(node: Node) -> Builder` | json_builder_add_value |  | Adds a value to the currently open object member or array. If called after [method@Json.Builder.set_member_name], sets the given node as the value ... |
| begin_array | `Builder.begin_array() -> Builder` | json_builder_begin_array |  | Opens an array inside the given builder. You can add a new element to the array by using [method@Json.Builder.add_value]. Once you added all elemen... |
| begin_object | `Builder.begin_object() -> Builder` | json_builder_begin_object |  | Opens an object inside the given builder. You can add a new member to the object by using [method@Json.Builder.set_member_name], followed by [metho... |
| end_array | `Builder.end_array() -> Builder` | json_builder_end_array |  | Closes the array inside the given builder that was opened by the most recent call to [method@Json.Builder.begin_array]. This function cannot be cal... |
| end_object | `Builder.end_object() -> Builder` | json_builder_end_object |  | Closes the object inside the given builder that was opened by the most recent call to [method@Json.Builder.begin_object]. This function cannot be c... |
| get_root | `Builder.get_root() -> Node` | json_builder_get_root |  | Returns the root of the currently constructed tree. if the build is incomplete (ie: if there are any opened objects, or any open object members and... |
| reset | `Builder.reset() -> none` | json_builder_reset |  | Resets the state of the builder back to its initial state. |
| set_member_name | `Builder.set_member_name(member_name: utf8) -> Builder` | json_builder_set_member_name |  | Sets the name of the member in an object. This function must be followed by of these functions: - [method@Json.Builder.add_value], to add a scalar ... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| immutable | gboolean | read, write, construct-only | Whether the tree should be immutable when created. Making the output immutable on creation avoids the expense of traversing it to make it immutable... |

### Json.Generator

Parent: `GObject.Object` ?? GType: `JsonGenerator` ?? C type: `JsonGenerator`

`JsonGenerator` provides an object for generating a JSON data stream from a tree of [struct@Json.Node] instances, and put it into a buffer or a file.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | GeneratorPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Generator.new() -> Generator` | json_generator_new |  | Creates a new `JsonGenerator`. You can use this object to generate a JSON data stream starting from a data object model composed by [struct@Json.No... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_indent | `Generator.get_indent() -> guint` | json_generator_get_indent | 0.14 | Retrieves the value set using [method@Json.Generator.set_indent]. |
| get_indent_char | `Generator.get_indent_char() -> gunichar` | json_generator_get_indent_char | 0.14 | Retrieves the value set using [method@Json.Generator.set_indent_char]. |
| get_pretty | `Generator.get_pretty() -> gboolean` | json_generator_get_pretty | 0.14 | Retrieves the value set using [method@Json.Generator.set_pretty]. |
| get_root | `Generator.get_root() -> Node` | json_generator_get_root | 0.14 | Retrieves a pointer to the root node set using [method@Json.Generator.set_root]. |
| set_indent | `Generator.set_indent(indent_level: guint) -> none` | json_generator_set_indent | 0.14 | Sets the number of repetitions for each indentation level. |
| set_indent_char | `Generator.set_indent_char(indent_char: gunichar) -> none` | json_generator_set_indent_char | 0.14 | Sets the character to be used when indenting. |
| set_pretty | `Generator.set_pretty(is_pretty: gboolean) -> none` | json_generator_set_pretty | 0.14 | Sets whether the generated JSON should be pretty printed. Pretty printing will use indentation character specified in the [property@Json.Generator:... |
| set_root | `Generator.set_root(node: Node) -> none` | json_generator_set_root |  | Sets the root of the JSON data stream to be serialized by the given generator. The passed `node` is copied by the generator object, so it can be sa... |
| to_data | `Generator.to_data(length: out gsize?) -> utf8` | json_generator_to_data |  | Generates a JSON data stream from @generator and returns it as a buffer. |
| to_file | `Generator.to_file(filename: filename) -> gboolean throws` | json_generator_to_file |  | Creates a JSON data stream and puts it inside `filename`, overwriting the file's current contents. This operation is atomic, in the sense that the ... |
| to_gstring | `Generator.to_gstring(string: GLib.String) -> GLib.String` | json_generator_to_gstring | 1.4 | Generates a JSON data stream and appends it to the string buffer. |
| to_stream | `Generator.to_stream(stream: Gio.OutputStream, cancellable: Gio.Cancellable?) -> gboolean throws` | json_generator_to_stream | 0.12 | Outputs JSON data and writes it (synchronously) to the given stream. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| indent | guint | read, write | Number of spaces to be used to indent when pretty printing. |
| indent-char | guint | read, write | The character that should be used when indenting in pretty print. |
| pretty | gboolean | read, write | Whether the output should be "pretty-printed", with indentation and newlines. The indentation level can be controlled by using the [property@Json.G... |
| root | Node | read, write | The root node to be used when constructing a JSON data stream. |

### Json.Parser

Parent: `GObject.Object` ?? GType: `JsonParser` ?? C type: `JsonParser`

`JsonParser` provides an object for parsing a JSON data stream, either inside a file or inside a static buffer. ## Using `JsonParser` The `JsonPars...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | ParserPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Parser.new() -> Parser` | json_parser_new |  | Creates a new JSON parser. You can use the `JsonParser` to load a JSON stream from either a file or a buffer and then walk the hierarchy using the ... |
| new_immutable | `Parser.new_immutable() -> Parser` | json_parser_new_immutable | 1.2 | Creates a new parser instance with its [property@Json.Parser:immutable] property set to `TRUE` to create immutable output trees. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_current_line | `Parser.get_current_line() -> guint` | json_parser_get_current_line |  | Retrieves the line currently parsed, starting from 1. This function has defined behaviour only while parsing; calling this function from outside th... |
| get_current_pos | `Parser.get_current_pos() -> guint` | json_parser_get_current_pos |  | Retrieves the current position inside the current line, starting from 0. This function has defined behaviour only while parsing; calling this funct... |
| get_root | `Parser.get_root() -> Node` | json_parser_get_root |  | Retrieves the top level node from the parsed JSON stream. If the parser input was an empty string, or if parsing failed, the root will be `NULL`. I... |
| has_assignment | `Parser.has_assignment(variable_name: out utf8?) -> gboolean` | json_parser_has_assignment | 0.4 | A JSON data stream might sometimes contain an assignment, like: ``` var _json_data = { "member_name" : [ ... ``` even though it would technically c... |
| load_from_data | `Parser.load_from_data(data: utf8, length: gssize) -> gboolean throws` | json_parser_load_from_data |  | Loads a JSON stream from a buffer and parses it. You can call this function multiple times with the same parser, but the contents of the parser wil... |
| load_from_file | `Parser.load_from_file(filename: filename) -> gboolean throws` | json_parser_load_from_file |  | Loads a JSON stream from the content of `filename` and parses it. If the file is large or shared between processes, [method@Json.Parser.load_from_m... |
| load_from_mapped_file | `Parser.load_from_mapped_file(filename: filename) -> gboolean throws` | json_parser_load_from_mapped_file | 1.6 | Loads a JSON stream from the content of `filename` and parses it. Unlike [method@Json.Parser.load_from_file], `filename` will be memory mapped as r... |
| load_from_stream | `Parser.load_from_stream(stream: Gio.InputStream, cancellable: Gio.Cancellable?) -> gboolean throws` | json_parser_load_from_stream | 0.12 | Loads the contents of an input stream and parses them. If `cancellable` is not `NULL`, then the operation can be cancelled by triggering the cancel... |
| load_from_stream_async | `Parser.load_from_stream_async(stream: Gio.InputStream, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | json_parser_load_from_stream_async | 0.12 | Asynchronously reads the contents of a stream. For more details, see [method@Json.Parser.load_from_stream], which is the synchronous version of thi... |
| load_from_stream_finish | `Parser.load_from_stream_finish(result: Gio.AsyncResult) -> gboolean throws` | json_parser_load_from_stream_finish | 0.12 | Finishes an asynchronous stream loading started with [method@Json.Parser.load_from_stream_async]. |
| steal_root | `Parser.steal_root() -> Node` | json_parser_steal_root | 1.4 | Steals the top level node from the parsed JSON stream. This will be `NULL` in the same situations as [method@Json.Parser.get_root] return `NULL`. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| immutable | gboolean | read, write, construct-only | Whether the tree built by the parser should be immutable when created. Making the output immutable on creation avoids the expense of traversing it ... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| array-element | `array: Array, index_: gint` | none | last |  | The `::array-element` signal is emitted each time a parser has successfully parsed a single element of a JSON array. |
| array-end | `array: Array` | none | last |  | The `::array-end` signal is emitted each time a parser has successfully parsed an entire JSON array. |
| array-start | `` | none | last |  | The `::array-start` signal is emitted each time a parser starts parsing a JSON array. |
| error | `error: gpointer?` | none | last |  | The `::error` signal is emitted each time a parser encounters an error in a JSON stream. |
| object-end | `object: Object` | none | last |  | The `::object-end` signal is emitted each time a parser has successfully parsed an entire JSON object. |
| object-member | `object: Object, member_name: utf8` | none | last |  | The `::object-member` signal is emitted each time a parser has successfully parsed a single member of a JSON object |
| object-start | `` | none | last |  | This signal is emitted each time a parser starts parsing a JSON object. |
| parse-end | `` | none | last |  | This signal is emitted when a parser successfully finished parsing a JSON data stream |
| parse-start | `` | none | last |  | This signal is emitted when a parser starts parsing a JSON data stream. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| array_element | `array_element(array: Array, index_: gint) -> none` |  |  | class handler for the JsonParser::array-element signal |
| array_end | `array_end(array: Array) -> none` |  |  | class handler for the JsonParser::array-end signal |
| array_start | `array_start() -> none` |  |  | class handler for the JsonParser::array-start signal |
| error | `error(error: GLib.Error) -> none` |  |  | class handler for the JsonParser::error signal |
| object_end | `object_end(object: Object) -> none` |  |  | class handler for the JsonParser::object-end signal |
| object_member | `object_member(object: Object, member_name: utf8) -> none` |  |  | class handler for the JsonParser::object-member signal |
| object_start | `object_start() -> none` |  |  | class handler for the JsonParser::object-start signal |
| parse_end | `parse_end() -> none` |  |  | class handler for the JsonParser::parse-end signal |
| parse_start | `parse_start() -> none` |  |  | class handler for the JsonParser::parse-start signal |

### Json.Path

Parent: `GObject.Object` ?? GType: `JsonPath` ?? C type: `JsonPath`

`JsonPath` is a simple class implementing the JSONPath syntax for extracting data out of a JSON tree. While the semantics of the JSONPath expressio...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Path.new() -> Path` | json_path_new | 0.14 | Creates a new `JsonPath` instance. Once created, the `JsonPath` object should be used with [method@Json.Path.compile] and [method@Json.Path.match]. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| query | `query(expression: utf8, root: Node) -> Node throws` | json_path_query | 0.14 | Queries a JSON tree using a JSONPath expression. This function is a simple wrapper around [ctor@Json.Path.new], [method@Json.Path.compile], and [me... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| compile | `Path.compile(expression: utf8) -> gboolean throws` | json_path_compile | 0.14 | Validates and decomposes the given expression. A JSONPath expression must be compiled before calling [method@Json.Path.match]. |
| match | `Path.match(root: Node) -> Node` | json_path_match | 0.14 | Matches the JSON tree pointed by `root` using the expression compiled into the `JsonPath`. The nodes matching the expression will be copied into an... |

### Json.Reader

Parent: `GObject.Object` ?? GType: `JsonReader` ?? C type: `JsonReader`

`JsonReader` provides a simple, cursor-based API for parsing a JSON DOM. It is similar, in spirit, to the XML Reader API. ## Using `JsonReader` ```...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | ReaderPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Reader.new(node: Node?) -> Reader` | json_reader_new | 0.12 | Creates a new reader. You can use this object to read the contents of the JSON tree starting from the given node. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| count_elements | `Reader.count_elements() -> gint` | json_reader_count_elements | 0.12 | Counts the elements of the current position, if the reader is positioned on an array. In case of failure, the reader is set to an error state. |
| count_members | `Reader.count_members() -> gint` | json_reader_count_members | 0.12 | Counts the members of the current position, if the reader is positioned on an object. In case of failure, the reader is set to an error state. |
| end_element | `Reader.end_element() -> none` | json_reader_end_element | 0.12 | Moves the cursor back to the previous node after being positioned inside an array. This function resets the error state of the reader, if any was set. |
| end_member | `Reader.end_member() -> none` | json_reader_end_member | 0.12 | Moves the cursor back to the previous node after being positioned inside an object. This function resets the error state of the reader, if any was ... |
| get_boolean_value | `Reader.get_boolean_value() -> gboolean` | json_reader_get_boolean_value | 0.12 | Retrieves the boolean value of the current position of the reader. See also: [method@Json.Reader.get_value] |
| get_current_node | `Reader.get_current_node() -> Node` | json_reader_get_current_node | 1.8 | Retrieves the reader node at the current position. |
| get_double_value | `Reader.get_double_value() -> gdouble` | json_reader_get_double_value | 0.12 | Retrieves the floating point value of the current position of the reader. See also: [method@Json.Reader.get_value] |
| get_error | `Reader.get_error() -> GLib.Error` | json_reader_get_error | 0.12 | Retrieves the error currently set on the reader. |
| get_int_value | `Reader.get_int_value() -> gint64` | json_reader_get_int_value | 0.12 | Retrieves the integer value of the current position of the reader. See also: [method@Json.Reader.get_value] |
| get_member_name | `Reader.get_member_name() -> utf8` | json_reader_get_member_name | 0.14 | Retrieves the name of the current member. In case of failure, the reader is set to an error state. |
| get_null_value | `Reader.get_null_value() -> gboolean` | json_reader_get_null_value | 0.12 | Checks whether the value of the current position of the reader is `null`. See also: [method@Json.Reader.get_value] |
| get_string_value | `Reader.get_string_value() -> utf8` | json_reader_get_string_value | 0.12 | Retrieves the string value of the current position of the reader. See also: [method@Json.Reader.get_value] |
| get_value | `Reader.get_value() -> Node` | json_reader_get_value | 0.12 | Retrieves the value node at the current position of the reader. If the current position does not contain a scalar value, the reader is set to an er... |
| is_array | `Reader.is_array() -> gboolean` | json_reader_is_array | 0.12 | Checks whether the reader is currently on an array. |
| is_object | `Reader.is_object() -> gboolean` | json_reader_is_object | 0.12 | Checks whether the reader is currently on an object. |
| is_value | `Reader.is_value() -> gboolean` | json_reader_is_value | 0.12 | Checks whether the reader is currently on a value. |
| list_members | `Reader.list_members() -> utf8` | json_reader_list_members | 0.14 | Retrieves a list of member names from the current position, if the reader is positioned on an object. In case of failure, the reader is set to an e... |
| read_element | `Reader.read_element(index_: guint) -> gboolean` | json_reader_read_element | 0.12 | Advances the cursor of the reader to the element of the array or the member of the object at the given position. You can use [method@Json.Reader.ge... |
| read_member | `Reader.read_member(member_name: utf8) -> gboolean` | json_reader_read_member | 0.12 | Advances the cursor of the reader to the `member_name` of the object at the current position. You can use [method@Json.Reader.get_value] and its wr... |
| set_root | `Reader.set_root(root: Node?) -> none` | json_reader_set_root | 0.12 | Sets the root node of the JSON tree to be read by @reader. The reader will take a copy of the node. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| root | Node | read, write | The root of the JSON tree that the reader should read. |

## Interfaces

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Serializable |  | 0 | 0 | 8 | `JsonSerializable` is an interface for controlling the serialization and deserialization of `GObject` classes. Implementing this interface allows c... |

### Json.Serializable

GType: `JsonSerializable` ?? C type: `JsonSerializable`

`JsonSerializable` is an interface for controlling the serialization and deserialization of `GObject` classes. Implementing this interface allows c...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| default_deserialize_property | `Serializable.default_deserialize_property(property_name: utf8, value: GObject.Value, pspec: GObject.ParamSpec, property_node: Node) -> gboolean` | json_serializable_default_deserialize_property | 0.10 | Calls the default implementation of the [vfunc@Json.Serializable.deserialize_property] virtual function. This function can be used inside a custom ... |
| default_serialize_property | `Serializable.default_serialize_property(property_name: utf8, value: GObject.Value, pspec: GObject.ParamSpec) -> Node` | json_serializable_default_serialize_property | 0.10 | Calls the default implementation of the [vfunc@Json.Serializable.serialize_property] virtual function. This function can be used inside a custom im... |
| deserialize_property | `Serializable.deserialize_property(property_name: utf8, value: out GObject.Value, pspec: GObject.ParamSpec, property_node: Node) -> gboolean` | json_serializable_deserialize_property |  | Asks a `JsonSerializable` implementation to deserialize the property contained inside `property_node` and place its value into `value`. The `value`... |
| find_property | `Serializable.find_property(name: utf8) -> GObject.ParamSpec` | json_serializable_find_property | 0.14 | Calls the [vfunc@Json.Serializable.find_property] implementation on the `JsonSerializable` instance, which will return the property description for... |
| get_property | `Serializable.get_property(pspec: GObject.ParamSpec, value: out GObject.Value) -> none` | json_serializable_get_property | 0.14 | Calls the [vfunc@Json.Serializable.get_property] implementation on the `JsonSerializable` instance, which will get the value of the given property. |
| list_properties | `Serializable.list_properties(n_pspecs: out guint) -> GObject.ParamSpec` | json_serializable_list_properties | 0.14 | Calls the [vfunc@Json.Serializable.list_properties] implementation on the `JsonSerializable` instance, which will return the list of serializable p... |
| serialize_property | `Serializable.serialize_property(property_name: utf8, value: GObject.Value, pspec: GObject.ParamSpec) -> Node` | json_serializable_serialize_property |  | Asks a `JsonSerializable` implementation to serialize an object property into a JSON node. |
| set_property | `Serializable.set_property(pspec: GObject.ParamSpec, value: GObject.Value) -> none` | json_serializable_set_property | 0.14 | Calls the [vfunc@Json.Serializable.set_property] implementation on the `JsonSerializable` instance, which will set the property with the given value. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| deserialize_property | `deserialize_property(property_name: utf8, value: out GObject.Value, pspec: GObject.ParamSpec, property_node: Node) -> gboolean` |  |  | Asks a `JsonSerializable` implementation to deserialize the property contained inside `property_node` and place its value into `value`. The `value`... |
| find_property | `find_property(name: utf8) -> GObject.ParamSpec` |  | 0.14 | Calls the [vfunc@Json.Serializable.find_property] implementation on the `JsonSerializable` instance, which will return the property description for... |
| get_property | `get_property(pspec: GObject.ParamSpec, value: out GObject.Value) -> none` |  | 0.14 | Calls the [vfunc@Json.Serializable.get_property] implementation on the `JsonSerializable` instance, which will get the value of the given property. |
| list_properties | `list_properties(n_pspecs: guint) -> GObject.ParamSpec` |  |  | virtual function for listing the installed property definitions |
| serialize_property | `serialize_property(property_name: utf8, value: GObject.Value, pspec: GObject.ParamSpec) -> Node` |  |  | Asks a `JsonSerializable` implementation to serialize an object property into a JSON node. |
| set_property | `set_property(pspec: GObject.ParamSpec, value: GObject.Value) -> none` |  | 0.14 | Calls the [vfunc@Json.Serializable.set_property] implementation on the `JsonSerializable` instance, which will set the property with the given value. |

## Enums

### Json.NodeType

GType: `JsonNodeType` ?? C type: `JsonNodeType`

Indicates the content of a node.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| array | 1 | array | The node contains a JSON array |
| null | 3 | null | Special type, for nodes containing null |
| object | 0 | object | The node contains a JSON object |
| value | 2 | value | The node contains a fundamental type |

### Json.ParserError

GType: `JsonParserError` ?? C type: `JsonParserError`

Error codes for `JSON_PARSER_ERROR`. This enumeration can be extended at later date

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| empty_member_name | 5 | empty-member-name | empty member name (Since: 0.16) |
| invalid_bareword | 4 | invalid-bareword | invalid bareword |
| invalid_data | 6 | invalid-data | invalid data (Since: 0.18) |
| missing_colon | 3 | missing-colon | expected colon |
| missing_comma | 2 | missing-comma | expected comma |
| parse | 0 | parse | parse error |
| trailing_comma | 1 | trailing-comma | unexpected trailing comma |
| unknown | 7 | unknown | unknown error |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | json_parser_error_quark |  |  |

### Json.PathError

GType: `JsonPathError` ?? C type: `JsonPathError`

Error codes for `JSON_PATH_ERROR`. This enumeration can be extended at later date

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| query | 0 | query | Invalid query |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | json_path_error_quark |  |  |

### Json.ReaderError

GType: `JsonReaderError` ?? C type: `JsonReaderError`

Error codes for `JSON_READER_ERROR`. This enumeration can be extended at later date

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| invalid_index | 1 | invalid-index | Index out of bounds |
| invalid_member | 3 | invalid-member | Member not found |
| invalid_node | 4 | invalid-node | No valid node found at the current position |
| invalid_type | 6 | invalid-type | The node at the current position does not hold a value of the desired type |
| no_array | 0 | no-array | No array found at the current position |
| no_object | 2 | no-object | No object found at the current position |
| no_value | 5 | no-value | The node at the current position does not hold a value |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | json_reader_error_quark |  |  |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Array |  | 0 | 0 | 29 | `JsonArray` is the representation of the array type inside JSON. A `JsonArray` contains [struct@Json.Node] elements, which may contain fundamental ... |
| BuilderClass |  | 0 | 0 | 0 |  |
| BuilderPrivate |  | 0 | 0 | 0 |  |
| GeneratorClass |  | 0 | 0 | 0 |  |
| GeneratorPrivate |  | 0 | 0 | 0 |  |
| Node |  | 0 | 0 | 43 | A generic container of JSON data types. `JsonNode` can contain fundamental types (integers, booleans, floating point numbers, strings) and complex ... |
| Object |  | 0 | 0 | 35 | `JsonObject` is the representation of the object type inside JSON. A `JsonObject` contains [struct@Json.Node] "members", which may contain fundamen... |
| ObjectIter |  | 0 | 0 | 4 | An iterator object used to iterate over the members of a JSON object. `JsonObjectIter` must be allocated on the stack and initialised using [method... |
| ParserClass |  | 0 | 0 | 0 | The class structure for the JsonParser type. |
| ParserPrivate |  | 0 | 0 | 0 |  |
| PathClass |  | 0 | 0 | 0 |  |
| ReaderClass |  | 0 | 0 | 0 |  |
| ReaderPrivate |  | 0 | 0 | 0 |  |
| SerializableIface |  | 0 | 0 | 0 | Interface that allows serializing and deserializing object instances with properties storing complex data types. The [func@Json.gobject_from_data] ... |

### Json.Array

GType: `JsonArray` ?? C type: `JsonArray`

`JsonArray` is the representation of the array type inside JSON. A `JsonArray` contains [struct@Json.Node] elements, which may contain fundamental ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Array.new() -> Array` | json_array_new |  | Creates a new array. |
| sized_new | `Array.sized_new(n_elements: guint) -> Array` | json_array_sized_new |  | Creates a new array with `n_elements` slots already allocated. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_array_element | `Array.add_array_element(value: Array?) -> none` | json_array_add_array_element | 0.8 | Conveniently adds an array element into an array. If `value` is `NULL`, a `null` element will be added instead. See also: [method@Json.Array.add_el... |
| add_boolean_element | `Array.add_boolean_element(value: gboolean) -> none` | json_array_add_boolean_element | 0.8 | Conveniently adds the given boolean value into an array. See also: [method@Json.Array.add_element], [method@Json.Node.set_boolean] |
| add_double_element | `Array.add_double_element(value: gdouble) -> none` | json_array_add_double_element | 0.8 | Conveniently adds the given floating point value into an array. See also: [method@Json.Array.add_element], [method@Json.Node.set_double] |
| add_element | `Array.add_element(node: Node) -> none` | json_array_add_element |  | Appends the given `node` inside an array. |
| add_int_element | `Array.add_int_element(value: gint64) -> none` | json_array_add_int_element | 0.8 | Conveniently adds the given integer value into an array. See also: [method@Json.Array.add_element], [method@Json.Node.set_int] |
| add_null_element | `Array.add_null_element() -> none` | json_array_add_null_element | 0.8 | Conveniently adds a `null` element into an array See also: [method@Json.Array.add_element], `JSON_NODE_NULL` |
| add_object_element | `Array.add_object_element(value: Object?) -> none` | json_array_add_object_element | 0.8 | Conveniently adds an object into an array. If `value` is `NULL`, a `null` element will be added instead. See also: [method@Json.Array.add_element],... |
| add_string_element | `Array.add_string_element(value: utf8) -> none` | json_array_add_string_element | 0.8 | Conveniently adds the given string value into an array. See also: [method@Json.Array.add_element], [method@Json.Node.set_string] |
| dup_element | `Array.dup_element(index_: guint) -> Node` | json_array_dup_element | 0.6 | Retrieves a copy of the element at the given position in the array. |
| equal | `Array.equal(b: Array) -> gboolean` | json_array_equal | 1.2 | Check whether two arrays are equal. Equality is defined as: - the array have the same number of elements - the values of elements in corresponding ... |
| foreach_element | `Array.foreach_element(func: ArrayForeach, data: gpointer?) -> none` | json_array_foreach_element | 0.8 | Iterates over all elements of an array, and calls a function on each one of them. It is safe to change the value of an element of the array while i... |
| get_array_element | `Array.get_array_element(index_: guint) -> Array` | json_array_get_array_element | 0.8 | Conveniently retrieves the array at the given position inside an array. See also: [method@Json.Array.get_element], [method@Json.Node.get_array] |
| get_boolean_element | `Array.get_boolean_element(index_: guint) -> gboolean` | json_array_get_boolean_element | 0.8 | Conveniently retrieves the boolean value of the element at the given position inside an array. See also: [method@Json.Array.get_element], [method@J... |
| get_double_element | `Array.get_double_element(index_: guint) -> gdouble` | json_array_get_double_element | 0.8 | Conveniently retrieves the floating point value of the element at the given position inside an array. See also: [method@Json.Array.get_element], [m... |
| get_element | `Array.get_element(index_: guint) -> Node` | json_array_get_element |  | Retrieves the element at the given position in the array. |
| get_elements | `Array.get_elements() -> GLib.List` | json_array_get_elements |  | Retrieves all the elements of an array as a list of nodes. |
| get_int_element | `Array.get_int_element(index_: guint) -> gint64` | json_array_get_int_element | 0.8 | Conveniently retrieves the integer value of the element at the given position inside an array. See also: [method@Json.Array.get_element], [method@J... |
| get_length | `Array.get_length() -> guint` | json_array_get_length |  | Retrieves the length of the given array |
| get_null_element | `Array.get_null_element(index_: guint) -> gboolean` | json_array_get_null_element | 0.8 | Conveniently checks whether the element at the given position inside the array contains a `null` value. See also: [method@Json.Array.get_element], ... |
| get_object_element | `Array.get_object_element(index_: guint) -> Object` | json_array_get_object_element | 0.8 | Conveniently retrieves the object at the given position inside an array. See also: [method@Json.Array.get_element], [method@Json.Node.get_object] |
| get_string_element | `Array.get_string_element(index_: guint) -> utf8` | json_array_get_string_element | 0.8 | Conveniently retrieves the string value of the element at the given position inside an array. See also: [method@Json.Array.get_element], [method@Js... |
| hash | `Array.hash() -> guint` | json_array_hash | 1.2 | Calculates a hash value for the given `key`. The hash is calculated over the array and all its elements, recursively. If the array is immutable, th... |
| is_immutable | `Array.is_immutable() -> gboolean` | json_array_is_immutable | 1.2 | Check whether the given `array` has been marked as immutable by calling [method@Json.Array.seal] on it. |
| ref | `Array.ref() -> Array` | json_array_ref |  | Acquires a reference on the given array. |
| remove_element | `Array.remove_element(index_: guint) -> none` | json_array_remove_element |  | Removes the element at the given position inside an array. This function will release the reference held on the element. |
| seal | `Array.seal() -> none` | json_array_seal | 1.2 | Seals the given array, making it immutable to further changes. This function will recursively seal all elements in the array too. If the `array` is... |
| unref | `Array.unref() -> none` | json_array_unref |  | Releases a reference on the given array. If the reference count reaches zero, the array is destroyed and all its allocated resources are freed. |

### Json.BuilderClass

C type: `JsonBuilderClass`

#### Fields

| Field | Type |
| --- | --- |
| _json_reserved1 | none |
| _json_reserved2 | none |
| parent_class | GObject.ObjectClass |

### Json.BuilderPrivate

C type: `JsonBuilderPrivate`

### Json.GeneratorClass

C type: `JsonGeneratorClass`

#### Fields

| Field | Type |
| --- | --- |
| _json_reserved1 | none |
| _json_reserved2 | none |
| _json_reserved3 | none |
| _json_reserved4 | none |
| parent_class | GObject.ObjectClass |

### Json.GeneratorPrivate

C type: `JsonGeneratorPrivate`

### Json.Node

GType: `JsonNode` ?? C type: `JsonNode`

A generic container of JSON data types. `JsonNode` can contain fundamental types (integers, booleans, floating point numbers, strings) and complex ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `Node.alloc() -> Node` | json_node_alloc | 0.16 | Allocates a new, uninitialized node. Use [method@Json.Node.init] and its variants to initialize the returned value. |
| new | `Node.new(type: NodeType) -> Node` | json_node_new |  | Creates a new node holding the given @type. This is a convenience function for [ctor@Json.Node.alloc] and [method@Json.Node.init], and it's the equ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Node.copy() -> Node` | json_node_copy |  | Copies @node. If the node contains complex data types, their reference counts are increased, regardless of whether the node is mutable or immutable... |
| dup_array | `Node.dup_array() -> Array` | json_node_dup_array |  | Retrieves the JSON array inside @node. The reference count of the returned array is increased. It is a programmer error to call this on a node whic... |
| dup_object | `Node.dup_object() -> Object` | json_node_dup_object |  | Retrieves the object inside @node. The reference count of the returned object is increased. It is a programmer error to call this on a node which d... |
| dup_string | `Node.dup_string() -> utf8` | json_node_dup_string |  | Gets a copy of the string value stored inside a node. If the node does not hold a string value, `NULL` is returned. |
| equal | `Node.equal(b: Node) -> gboolean` | json_node_equal | 1.2 | Check whether @a and @b are equal node, meaning they have the same type and same values (checked recursively). Note that integer values are compare... |
| free | `Node.free() -> none` | json_node_free |  | Frees the resources allocated by the node. |
| get_array | `Node.get_array() -> Array` | json_node_get_array |  | Retrieves the JSON array stored inside a node. It is a programmer error to call this on a node which doesn???t hold an array value. Use `JSON_NODE_... |
| get_boolean | `Node.get_boolean() -> gboolean` | json_node_get_boolean |  | Gets the boolean value stored inside a node. If the node holds an integer or double value which is zero, `FALSE` is returned; otherwise `TRUE` is r... |
| get_double | `Node.get_double() -> gdouble` | json_node_get_double |  | Gets the double value stored inside a node. If the node holds an integer value, it is returned as a double. If the node holds a `FALSE` boolean val... |
| get_int | `Node.get_int() -> gint64` | json_node_get_int |  | Gets the integer value stored inside a node. If the node holds a double value, its integer component is returned. If the node holds a `FALSE` boole... |
| get_node_type | `Node.get_node_type() -> NodeType` | json_node_get_node_type | 0.8 | Retrieves the type of a @node. |
| get_object | `Node.get_object() -> Object` | json_node_get_object |  | Retrieves the object stored inside a node. It is a programmer error to call this on a node which doesn???t hold an object value. Use `JSON_NODE_HOL... |
| get_parent | `Node.get_parent() -> Node` | json_node_get_parent |  | Retrieves the parent node of the given @node. |
| get_string | `Node.get_string() -> utf8` | json_node_get_string |  | Gets the string value stored inside a node. If the node does not hold a string value, `NULL` is returned. |
| get_value | `Node.get_value(value: out GObject.Value) -> none` | json_node_get_value |  | Retrieves a value from a node and copies into @value. When done using it, call `g_value_unset()` on the `GValue` to free the associated resources. ... |
| get_value_type | `Node.get_value_type() -> GType` | json_node_get_value_type | 0.4 | Returns the `GType` of the payload of the node. For `JSON_NODE_NULL` nodes, the returned type is `G_TYPE_INVALID`. |
| hash | `Node.hash() -> guint` | json_node_hash | 1.2 | Calculate a hash value for the given @key. The hash is calculated over the node and its value, recursively. If the node is immutable, this is a fas... |
| init | `Node.init(type: NodeType) -> Node` | json_node_init | 0.16 | Initializes a @node to a specific @type. If the node has already been initialized once, it will be reset to the given type, and any data contained ... |
| init_array | `Node.init_array(array: Array?) -> Node` | json_node_init_array | 0.16 | Initializes @node to `JSON_NODE_ARRAY` and sets @array into it. This function will take a reference on @array. If the node has already been initial... |
| init_boolean | `Node.init_boolean(value: gboolean) -> Node` | json_node_init_boolean | 0.16 | Initializes @node to `JSON_NODE_VALUE` and sets @value into it. If the node has already been initialized once, it will be reset to the given type, ... |
| init_double | `Node.init_double(value: gdouble) -> Node` | json_node_init_double | 0.16 | Initializes @node to `JSON_NODE_VALUE` and sets @value into it. If the node has already been initialized once, it will be reset to the given type, ... |
| init_int | `Node.init_int(value: gint64) -> Node` | json_node_init_int | 0.16 | Initializes @node to `JSON_NODE_VALUE` and sets @value into it. If the node has already been initialized once, it will be reset to the given type, ... |
| init_null | `Node.init_null() -> Node` | json_node_init_null | 0.16 | Initializes @node to `JSON_NODE_NULL`. If the node has already been initialized once, it will be reset to the given type, and any data contained wi... |
| init_object | `Node.init_object(object: Object?) -> Node` | json_node_init_object | 0.16 | Initializes @node to `JSON_NODE_OBJECT` and sets @object into it. This function will take a reference on @object. If the node has already been init... |
| init_string | `Node.init_string(value: utf8?) -> Node` | json_node_init_string | 0.16 | Initializes @node to `JSON_NODE_VALUE` and sets @value into it. If the node has already been initialized once, it will be reset to the given type, ... |
| is_immutable | `Node.is_immutable() -> gboolean` | json_node_is_immutable | 1.2 | Check whether the given @node has been marked as immutable by calling [method@Json.Node.seal] on it. |
| is_null | `Node.is_null() -> gboolean` | json_node_is_null | 0.8 | Checks whether @node is a `JSON_NODE_NULL`. A `JSON_NODE_NULL` node is not the same as a `NULL` node; a `JSON_NODE_NULL` represents a literal `null... |
| ref | `Node.ref() -> Node` | json_node_ref | 1.2 | Increments the reference count of @node. |
| seal | `Node.seal() -> none` | json_node_seal | 1.2 | Seals the given node, making it immutable to further changes. In order to be sealed, the @node must have a type and value set. The value will be re... |
| set_array | `Node.set_array(array: Array) -> none` | json_node_set_array |  | Sets @array inside @node. The reference count of @array is increased. It is a programmer error to call this on a node which doesn???t hold an array... |
| set_boolean | `Node.set_boolean(value: gboolean) -> none` | json_node_set_boolean |  | Sets @value as the boolean content of the @node, replacing any existing content. It is an error to call this on an immutable node, or on a node whi... |
| set_double | `Node.set_double(value: gdouble) -> none` | json_node_set_double |  | Sets @value as the double content of the @node, replacing any existing content. It is an error to call this on an immutable node, or on a node whic... |
| set_int | `Node.set_int(value: gint64) -> none` | json_node_set_int |  | Sets @value as the integer content of the @node, replacing any existing content. It is an error to call this on an immutable node, or on a node whi... |
| set_object | `Node.set_object(object: Object?) -> none` | json_node_set_object |  | Sets @objects inside @node. The reference count of @object is increased. If @object is `NULL`, the node???s existing object is cleared. It is an er... |
| set_parent | `Node.set_parent(parent: Node?) -> none` | json_node_set_parent | 0.8 | Sets the parent node for the given `node`. It is an error to call this with an immutable @parent. The @node may be immutable. |
| set_string | `Node.set_string(value: utf8) -> none` | json_node_set_string |  | Sets @value as the string content of the @node, replacing any existing content. It is an error to call this on an immutable node, or on a node whic... |
| set_value | `Node.set_value(value: GObject.Value) -> none` | json_node_set_value |  | Sets a scalar value inside the given node. The contents of the given `GValue` are copied into the `JsonNode`. The following `GValue` types have a d... |
| take_array | `Node.take_array(array: Array) -> none` | json_node_take_array |  | Sets @array inside @node. The reference count of @array is not increased. It is a programmer error to call this on a node which doesn???t hold an a... |
| take_object | `Node.take_object(object: Object) -> none` | json_node_take_object |  | Sets @object inside @node. The reference count of @object is not increased. It is an error to call this on an immutable node, or on a node which is... |
| type_name | `Node.type_name() -> utf8` | json_node_type_name |  | Retrieves the user readable name of the data type contained by @node. **Note**: The name is only meant for debugging purposes, and there is no guar... |
| unref | `Node.unref() -> none` | json_node_unref | 1.2 | Decrements the reference count of @node. If the reference count reaches zero, the node is freed. |

### Json.Object

GType: `JsonObject` ?? C type: `JsonObject`

`JsonObject` is the representation of the object type inside JSON. A `JsonObject` contains [struct@Json.Node] "members", which may contain fundamen...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Object.new() -> Object` | json_object_new |  | Creates a new object. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_member | `Object.add_member(member_name: utf8, node: Node) -> none` | json_object_add_member |  | Adds a new member for the given name and value into an object. This function will return if the object already contains a member with the same name. |
| dup_member | `Object.dup_member(member_name: utf8) -> Node` | json_object_dup_member | 0.6 | Retrieves a copy of the value of the given member inside an object. |
| equal | `Object.equal(b: Object) -> gboolean` | json_object_equal | 1.2 | Check whether @a and @b are equal objects, meaning they have the same set of members, and the values of corresponding members are equal. |
| foreach_member | `Object.foreach_member(func: ObjectForeach, data: gpointer?) -> none` | json_object_foreach_member | 0.8 | Iterates over all members of @object and calls @func on each one of them. It is safe to change the value of a member of the oobject from within the... |
| get_array_member | `Object.get_array_member(member_name: utf8) -> Array` | json_object_get_array_member | 0.8 | Convenience function that retrieves the array stored in @member_name of @object. It is an error to specify a @member_name which does not exist. If ... |
| get_boolean_member | `Object.get_boolean_member(member_name: utf8) -> gboolean` | json_object_get_boolean_member | 0.8 | Convenience function that retrieves the boolean value stored in @member_name of @object. It is an error to specify a @member_name which does not ex... |
| get_boolean_member_with_default | `Object.get_boolean_member_with_default(member_name: utf8, default_value: gboolean) -> gboolean` | json_object_get_boolean_member_with_default | 1.6 | Convenience function that retrieves the boolean value stored in @member_name of @object. If @member_name does not exist, does not contain a scalar ... |
| get_double_member | `Object.get_double_member(member_name: utf8) -> gdouble` | json_object_get_double_member | 0.8 | Convenience function that retrieves the floating point value stored in @member_name of @object. It is an error to specify a @member_name which does... |
| get_double_member_with_default | `Object.get_double_member_with_default(member_name: utf8, default_value: gdouble) -> gdouble` | json_object_get_double_member_with_default | 1.6 | Convenience function that retrieves the floating point value stored in @member_name of @object. If @member_name does not exist, does not contain a ... |
| get_int_member | `Object.get_int_member(member_name: utf8) -> gint64` | json_object_get_int_member | 0.8 | Convenience function that retrieves the integer value stored in @member_name of @object. It is an error to specify a @member_name which does not ex... |
| get_int_member_with_default | `Object.get_int_member_with_default(member_name: utf8, default_value: gint64) -> gint64` | json_object_get_int_member_with_default | 1.6 | Convenience function that retrieves the integer value stored in @member_name of @object. If @member_name does not exist, does not contain a scalar ... |
| get_member | `Object.get_member(member_name: utf8) -> Node` | json_object_get_member |  | Retrieves the value of the given member inside an object. |
| get_members | `Object.get_members() -> GLib.List` | json_object_get_members |  | Retrieves all the names of the members of an object. You can obtain the value for each member by iterating the returned list and calling [method@Js... |
| get_null_member | `Object.get_null_member(member_name: utf8) -> gboolean` | json_object_get_null_member | 0.8 | Convenience function that checks whether the value stored in @member_name of @object is null. It is an error to specify a @member_name which does n... |
| get_object_member | `Object.get_object_member(member_name: utf8) -> Object` | json_object_get_object_member | 0.8 | Convenience function that retrieves the object stored in @member_name of @object. It is an error to specify a @member_name which does not exist. If... |
| get_size | `Object.get_size() -> guint` | json_object_get_size |  | Retrieves the number of members of a JSON object. |
| get_string_member | `Object.get_string_member(member_name: utf8) -> utf8` | json_object_get_string_member | 0.8 | Convenience function that retrieves the string value stored in @member_name of @object. It is an error to specify a @member_name that does not exis... |
| get_string_member_with_default | `Object.get_string_member_with_default(member_name: utf8, default_value: utf8) -> utf8` | json_object_get_string_member_with_default | 1.6 | Convenience function that retrieves the string value stored in @member_name of @object. If @member_name does not exist, does not contain a scalar v... |
| get_values | `Object.get_values() -> GLib.List` | json_object_get_values |  | Retrieves all the values of the members of an object. |
| has_member | `Object.has_member(member_name: utf8) -> gboolean` | json_object_has_member |  | Checks whether @object has a member named @member_name. |
| hash | `Object.hash() -> guint` | json_object_hash | 1.2 | Calculate a hash value for the given @key (a JSON object). The hash is calculated over the object and all its members, recursively. If the object i... |
| is_immutable | `Object.is_immutable() -> gboolean` | json_object_is_immutable | 1.2 | Checks whether the given object has been marked as immutable by calling [method@Json.Object.seal] on it. |
| ref | `Object.ref() -> Object` | json_object_ref |  | Acquires a reference on the given object. |
| remove_member | `Object.remove_member(member_name: utf8) -> none` | json_object_remove_member |  | Removes @member_name from @object, freeing its allocated resources. |
| seal | `Object.seal() -> none` | json_object_seal | 1.2 | Seals the object, making it immutable to further changes. This function will recursively seal all members of the object too. If the object is alrea... |
| set_array_member | `Object.set_array_member(member_name: utf8, value: Array) -> none` | json_object_set_array_member | 0.8 | Convenience function for setting an object member with an array value. See also: [method@Json.Object.set_member], [method@Json.Node.take_array] |
| set_boolean_member | `Object.set_boolean_member(member_name: utf8, value: gboolean) -> none` | json_object_set_boolean_member | 0.8 | Convenience function for setting an object member with a boolean value. See also: [method@Json.Object.set_member], [method@Json.Node.init_boolean] |
| set_double_member | `Object.set_double_member(member_name: utf8, value: gdouble) -> none` | json_object_set_double_member | 0.8 | Convenience function for setting an object member with a floating point value. See also: [method@Json.Object.set_member], [method@Json.Node.init_do... |
| set_int_member | `Object.set_int_member(member_name: utf8, value: gint64) -> none` | json_object_set_int_member | 0.8 | Convenience function for setting an object member with an integer value. See also: [method@Json.Object.set_member], [method@Json.Node.init_int] |
| set_member | `Object.set_member(member_name: utf8, node: Node) -> none` | json_object_set_member | 0.8 | Sets the value of a member inside an object. If the object does not have a member with the given name, a new member is created. If the object alrea... |
| set_null_member | `Object.set_null_member(member_name: utf8) -> none` | json_object_set_null_member | 0.8 | Convenience function for setting an object member with a `null` value. See also: [method@Json.Object.set_member], [method@Json.Node.init_null] |
| set_object_member | `Object.set_object_member(member_name: utf8, value: Object) -> none` | json_object_set_object_member | 0.8 | Convenience function for setting an object member with an object value. See also: [method@Json.Object.set_member], [method@Json.Node.take_object] |
| set_string_member | `Object.set_string_member(member_name: utf8, value: utf8) -> none` | json_object_set_string_member | 0.8 | Convenience function for setting an object member with a string value. See also: [method@Json.Object.set_member], [method@Json.Node.init_string] |
| unref | `Object.unref() -> none` | json_object_unref |  | Releases a reference on the given object. If the reference count reaches zero, the object is destroyed and all its resources are freed. |

### Json.ObjectIter

C type: `JsonObjectIter`

An iterator object used to iterate over the members of a JSON object. `JsonObjectIter` must be allocated on the stack and initialised using [method...

#### Fields

| Field | Type |
| --- | --- |
| priv_boolean | gboolean |
| priv_int | gint |
| priv_pointer | gpointer |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| init | `ObjectIter.init(object: Object) -> none` | json_object_iter_init | 1.2 | Initialises the @iter and associate it with @object. ```c JsonObjectIter iter; const gchar *member_name; JsonNode *member_node; json_object_iter_in... |
| init_ordered | `ObjectIter.init_ordered(object: Object) -> none` | json_object_iter_init_ordered | 1.6 | Initialises the @iter and associate it with @object. ```c JsonObjectIter iter; const gchar *member_name; JsonNode *member_node; json_object_iter_in... |
| next | `ObjectIter.next(member_name: out utf8?, member_node: out Node?) -> gboolean` | json_object_iter_next | 1.2 | Advances the iterator and retrieves the next member in the object. If the end of the object is reached, `FALSE` is returned and @member_name and @m... |
| next_ordered | `ObjectIter.next_ordered(member_name: out utf8?, member_node: out Node?) -> gboolean` | json_object_iter_next_ordered | 1.6 | Advances the iterator and retrieves the next member in the object. If the end of the object is reached, `FALSE` is returned and @member_name and @m... |

### Json.ParserClass

C type: `JsonParserClass`

The class structure for the JsonParser type.

#### Fields

| Field | Type |
| --- | --- |
| _json_reserved1 | none |
| _json_reserved2 | none |
| _json_reserved3 | none |
| _json_reserved4 | none |
| _json_reserved5 | none |
| _json_reserved6 | none |
| _json_reserved7 | none |
| _json_reserved8 | none |
| array_element | none |
| array_end | none |
| array_start | none |
| error | none |
| object_end | none |
| object_member | none |
| object_start | none |
| parent_class | GObject.ObjectClass |
| parse_end | none |
| parse_start | none |

### Json.ParserPrivate

C type: `JsonParserPrivate`

### Json.PathClass

C type: `JsonPathClass`

### Json.ReaderClass

C type: `JsonReaderClass`

#### Fields

| Field | Type |
| --- | --- |
| _json_padding0 | none |
| _json_padding1 | none |
| _json_padding2 | none |
| _json_padding3 | none |
| _json_padding4 | none |
| parent_class | GObject.ObjectClass |

### Json.ReaderPrivate

C type: `JsonReaderPrivate`

### Json.SerializableIface

C type: `JsonSerializableIface`

Interface that allows serializing and deserializing object instances with properties storing complex data types. The [func@Json.gobject_from_data] ...

#### Fields

| Field | Type |
| --- | --- |
| deserialize_property | gboolean |
| find_property | GObject.ParamSpec |
| g_iface | GObject.TypeInterface |
| get_property | none |
| list_properties | GObject.ParamSpec |
| serialize_property | Node |
| set_property | none |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| boxed_can_deserialize | `boxed_can_deserialize(gboxed_type: GType, node_type: NodeType) -> gboolean` | json_boxed_can_deserialize | 0.10 | Checks whether it is possible to deserialize a `GBoxed` of type `gboxed_type` from a [struct@Json.Node] of type `node_type`. |
| boxed_can_serialize | `boxed_can_serialize(gboxed_type: GType, node_type: out NodeType?) -> gboolean` | json_boxed_can_serialize | 0.10 | Checks whether it is possible to serialize a `GBoxed` of type `gboxed_type` into a [struct@Json.Node]. The type of the node is placed inside `node_... |
| boxed_deserialize | `boxed_deserialize(gboxed_type: GType, node: Node) -> gpointer` | json_boxed_deserialize | 0.10 | Deserializes the given [struct@Json.Node] into a `GBoxed` of the given type. |
| boxed_register_deserialize_func | `boxed_register_deserialize_func(gboxed_type: GType, node_type: NodeType, deserialize_func: BoxedDeserializeFunc) -> none` | json_boxed_register_deserialize_func | 0.10 | Registers a deserialization function for a `GBoxed` of type `gboxed_type` from a [struct@Json.Node] of type `node_type`. |
| boxed_register_serialize_func | `boxed_register_serialize_func(gboxed_type: GType, node_type: NodeType, serialize_func: BoxedSerializeFunc) -> none` | json_boxed_register_serialize_func | 0.10 | Registers a serialization function for a `GBoxed` of type `gboxed_type` to a [struct@Json.Node] of type `node_type`. |
| boxed_serialize | `boxed_serialize(gboxed_type: GType, boxed: gpointer?) -> Node` | json_boxed_serialize | 0.10 | Serializes a pointer to a `GBoxed` of the given type into a [struct@Json.Node]. If the serialization is not possible, this function will return `NU... |
| construct_gobject | `construct_gobject(gtype: GType, data: utf8, length: gsize) -> GObject.Object throws` | json_construct_gobject | 0.4 | Deserializes a JSON data stream and creates an instance of the given type. If the given type implements the [iface@Json.Serializable] interface, it... |
| from_string | `from_string(str: utf8) -> Node throws` | json_from_string | 1.2 | Parses the given string and returns the corresponding JSON tree. If the string is empty, this function will return `NULL`. In case of parsing error... |
| gobject_deserialize | `gobject_deserialize(gtype: GType, node: Node) -> GObject.Object` | json_gobject_deserialize | 0.10 | Creates a new `GObject` instance of the given type, and constructs it using the members of the object in the given node. |
| gobject_from_data | `gobject_from_data(gtype: GType, data: utf8, length: gssize) -> GObject.Object throws` | json_gobject_from_data | 0.10 | Deserializes a JSON data stream and creates an instance of the given type. If the type implements the [iface@Json.Serializable] interface, it will ... |
| gobject_serialize | `gobject_serialize(gobject: GObject.Object) -> Node` | json_gobject_serialize | 0.10 | Creates a JSON tree representing the passed object instance. Each member of the returned JSON object will map to a property of the object type. The... |
| gobject_to_data | `gobject_to_data(gobject: GObject.Object, length: out gsize?) -> utf8` | json_gobject_to_data | 0.10 | Serializes a `GObject` instance into a JSON data stream, iterating recursively over each property. If the given object implements the [iface@Json.S... |
| gvariant_deserialize | `gvariant_deserialize(json_node: Node, signature: utf8?) -> GLib.Variant throws` | json_gvariant_deserialize | 0.14 | Converts a JSON data structure to a `GVariant`. If `signature` is not `NULL`, it will be used to resolve ambiguous data types. If no error occurs, ... |
| gvariant_deserialize_data | `gvariant_deserialize_data(json: utf8, length: gssize, signature: utf8?) -> GLib.Variant throws` | json_gvariant_deserialize_data | 0.14 | Converts a JSON string to a `GVariant` value. This function works exactly like [func@Json.gvariant_deserialize], but takes a JSON encoded string in... |
| gvariant_serialize | `gvariant_serialize(variant: GLib.Variant) -> Node` | json_gvariant_serialize | 0.14 | Converts `variant` to a JSON tree. |
| gvariant_serialize_data | `gvariant_serialize_data(variant: GLib.Variant, length: out gsize?) -> utf8` | json_gvariant_serialize_data | 0.14 | Converts @variant to its JSON encoded string representation. This is a convenience function around [func@Json.gvariant_serialize], to obtain the JS... |
| parser_error_quark | `parser_error_quark() -> GLib.Quark` | json_parser_error_quark |  |  |
| path_error_quark | `path_error_quark() -> GLib.Quark` | json_path_error_quark |  |  |
| reader_error_quark | `reader_error_quark() -> GLib.Quark` | json_reader_error_quark |  |  |
| serialize_gobject | `serialize_gobject(gobject: GObject.Object, length: out gsize?) -> utf8` | json_serialize_gobject |  | Serializes a `GObject` instance into a JSON data stream. If the object implements the [iface@Json.Serializable] interface, it will be asked to seri... |
| string_compare | `string_compare(a: utf8, b: utf8) -> gint` | json_string_compare | 1.2 | Check whether @a and @b are equal UTF-8 JSON strings and return an ordering over them in `strcmp()` style. |
| string_equal | `string_equal(a: utf8, b: utf8) -> gboolean` | json_string_equal | 1.2 | Check whether @a and @b are equal UTF-8 JSON strings. |
| string_hash | `string_hash(key: utf8) -> guint` | json_string_hash | 1.2 | Calculate a hash value for the given @key (a UTF-8 JSON string). Note: Member names are compared byte-wise, without applying any Unicode decomposit... |
| to_string | `to_string(node: Node, pretty: gboolean) -> utf8` | json_to_string | 1.2 | Generates a stringified JSON representation of the contents of the given `node`. |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ArrayForeach | `ArrayForeach(array: Array, index_: guint, element_node: Node, user_data: gpointer?) -> none` |  | 0.8 | The function to be passed to [method@Json.Array.foreach_element]. You should not add or remove elements to and from @array within this function. It... |
| BoxedDeserializeFunc | `BoxedDeserializeFunc(node: Node) -> gpointer` |  | 0.10 | Deserializes the contents of the passed `JsonNode` into a `GBoxed`, for instance: ```c static gpointer my_point_deserialize (JsonNode *node) { doub... |
| BoxedSerializeFunc | `BoxedSerializeFunc(boxed: gpointer?) -> Node` |  | 0.10 | Serializes the passed `GBoxed` and stores it inside a `JsonNode`, for instance: ```c static JsonNode * my_point_serialize (gconstpointer boxed) { c... |
| ObjectForeach | `ObjectForeach(object: Object, member_name: utf8, member_node: Node, user_data: gpointer?) -> none` |  | 0.8 | The function to be passed to [method@Json.Object.foreach_member]. You should not add or remove members to and from @object within this function. It... |

## Constants

| Name | Type |
| --- | --- |
| MAJOR_VERSION | gint |
| MICRO_VERSION | gint |
| MINOR_VERSION | gint |
| VERSION_S | utf8 |

