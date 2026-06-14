# GLib 2.0

SQGI import: `import("GLib", "2.0")`

Packages: `glib-2.0`
Libraries: `libgobject-2.0.so.0`, `libglib-2.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 0 |
| Interfaces | 0 |
| Records | 93 |
| Unions | 6 |
| Enums | 40 |
| Flags | 22 |
| Functions | 726 |
| Callbacks | 58 |
| Constants | 136 |
| Aliases | 13 |

## Enums

### GLib.BookmarkFileError

C type: `GBookmarkFileError`

Error codes returned by bookmark file parsing.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| app_not_registered | 2 |  | a requested application did not register a bookmark |
| file_not_found | 7 |  | requested file was not found |
| invalid_uri | 0 |  | URI was ill-formed |
| invalid_value | 1 |  | a requested field was not found |
| read | 4 |  | document was ill formed |
| unknown_encoding | 5 |  | the text being parsed was in an unknown encoding |
| uri_not_found | 3 |  | a requested URI was not found |
| write | 6 |  | an error occurred while writing |

### GLib.ChecksumType

C type: `GChecksumType`

The hashing algorithm to be used by #GChecksum when performing the digest of some data. Note that the #GChecksumType enumeration may be extended at...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| md5 | 0 |  | Use the MD5 hashing algorithm |
| sha1 | 1 |  | Use the SHA-1 hashing algorithm |
| sha256 | 2 |  | Use the SHA-256 hashing algorithm |
| sha384 | 4 |  | Use the SHA-384 hashing algorithm (Since: 2.51) |
| sha512 | 3 |  | Use the SHA-512 hashing algorithm (Since: 2.36) |

### GLib.ConvertError

C type: `GConvertError`

Error codes returned by character set conversion routines.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bad_uri | 4 |  | URI is invalid. |
| embedded_nul | 7 |  | An embedded NUL character is present in conversion output where a NUL-terminated string is expected. Since: 2.56 |
| failed | 2 |  | Conversion failed for some reason. |
| illegal_sequence | 1 |  | Invalid byte sequence in conversion input; or the character sequence could not be represented in the target character set. |
| no_conversion | 0 |  | Conversion between the requested character sets is not supported. |
| no_memory | 6 |  | No memory available. Since: 2.40 |
| not_absolute_path | 5 |  | Pathname is not an absolute path. |
| partial_input | 3 |  | Partial character sequence at end of input. |

### GLib.DateDMY

C type: `GDateDMY`

This enumeration isn't used in the API, but may be useful if you need to mark a number as a day, month, or year.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| day | 0 |  | a day |
| month | 1 |  | a month |
| year | 2 |  | a year |

### GLib.DateMonth

C type: `GDateMonth`

Enumeration representing a month; values are %G_DATE_JANUARY, %G_DATE_FEBRUARY, etc. %G_DATE_BAD_MONTH is the invalid value.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| april | 4 |  | April |
| august | 8 |  | August |
| bad_month | 0 |  | invalid value |
| december | 12 |  | December |
| february | 2 |  | February |
| january | 1 |  | January |
| july | 7 |  | July |
| june | 6 |  | June |
| march | 3 |  | March |
| may | 5 |  | May |
| november | 11 |  | November |
| october | 10 |  | October |
| september | 9 |  | September |

### GLib.DateWeekday

C type: `GDateWeekday`

Enumeration representing a day of the week; %G_DATE_MONDAY, %G_DATE_TUESDAY, etc. %G_DATE_BAD_WEEKDAY is an invalid weekday.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bad_weekday | 0 |  | invalid value |
| friday | 5 |  | Friday |
| monday | 1 |  | Monday |
| saturday | 6 |  | Saturday |
| sunday | 7 |  | Sunday |
| thursday | 4 |  | Thursday |
| tuesday | 2 |  | Tuesday |
| wednesday | 3 |  | Wednesday |

### GLib.ErrorType

C type: `GErrorType`

The possible errors, used in the @v_error field of #GTokenValue, when the token is a %G_TOKEN_ERROR.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| digit_radix | 5 |  | digit beyond radix in a number |
| float_malformed | 7 |  | malformed floating point number |
| float_radix | 6 |  | non-decimal floating point number |
| non_digit_in_const | 4 |  | non-digit character in a number |
| unexp_eof | 1 |  | unexpected end of file |
| unexp_eof_in_comment | 3 |  | unterminated comment |
| unexp_eof_in_string | 2 |  | unterminated string constant |
| unknown | 0 |  | unknown error |

### GLib.FileError

C type: `GFileError`

Values corresponding to @errno codes returned from file operations on UNIX. Unlike @errno codes, GFileError values are available on all systems, ev...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| acces | 2 |  | Permission denied; the file permissions do not allow the attempted operation. |
| again | 19 |  | Resource temporarily unavailable; the call might work if you try again later. |
| badf | 16 |  | Bad file descriptor; for example, I/O on a descriptor that has been closed or reading from a descriptor open only for writing (or vice versa). |
| exist | 0 |  | Operation not permitted; only the owner of the file (or other resource) or processes with special privileges can perform the operation. |
| failed | 24 |  | Does not correspond to a UNIX error code; this is the standard "failed for unspecified reason" error code present in all #GError error code enumera... |
| fault | 10 |  | You passed in a pointer to bad memory. (GLib won't reliably return this, don't pass in pointers to bad memory.) |
| intr | 20 |  | Interrupted function call; an asynchronous signal occurred and prevented completion of the call. When this happens, you should try the call again. |
| inval | 17 |  | Invalid argument. This is used to indicate various kinds of problems with passing the wrong argument to a library function. |
| io | 21 |  | Input/output error; usually used for physical read or write errors. i.e. the disk or other physical device hardware is returning errors. |
| isdir | 1 |  | File is a directory; you cannot open a directory for writing, or create or remove hard links to it. |
| loop | 11 |  | Too many levels of symbolic links were encountered in looking up a file name. This often indicates a cycle of symbolic links. |
| mfile | 14 |  | The current process has too many files open and can't open any more. Duplicate descriptors do count toward this limit. |
| nametoolong | 3 |  | Filename too long. |
| nfile | 15 |  | There are too many distinct file openings in the entire system. |
| nodev | 7 |  | The underlying file system of the specified file does not support memory mapping. |
| noent | 4 |  | No such file or directory. This is a "file doesn't exist" error for ordinary files that are referenced in contexts where they are expected to alrea... |
| nomem | 13 |  | No memory available. The system cannot allocate more virtual memory because its capacity is full. |
| nospc | 12 |  | No space left on device; write operation on a file failed because the disk is full. |
| nosys | 23 |  | Function not implemented; this indicates that the system is missing some functionality. |
| notdir | 5 |  | A file that isn't a directory was specified when a directory is required. |
| nxio | 6 |  | No such device or address. The system tried to use the device represented by a file you specified, and it couldn't find the device. This can mean t... |
| perm | 22 |  | Operation not permitted; only the owner of the file (or other resource) or processes with special privileges can perform the operation. |
| pipe | 18 |  | Broken pipe; there is no process reading from the other end of a pipe. Every library function that returns this error code also generates a 'SIGPIP... |
| rofs | 8 |  | The directory containing the new link can't be modified because it's on a read-only file system. |
| txtbsy | 9 |  | Text file busy. |

### GLib.IOChannelError

C type: `GIOChannelError`

Error codes returned by #GIOChannel operations.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| failed | 8 |  | Some other error. |
| fbig | 0 |  | File too large. |
| inval | 1 |  | Invalid argument. |
| io | 2 |  | IO error. |
| isdir | 3 |  | File is a directory. |
| nospc | 4 |  | No space left on device. |
| nxio | 5 |  | No such device or address. |
| overflow | 6 |  | Value too large for defined datatype. |
| pipe | 7 |  | Broken pipe. |

### GLib.IOError

C type: `GIOError`

#GIOError is only used by the deprecated functions g_io_channel_read(), g_io_channel_write(), and g_io_channel_seek().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| again | 1 |  | an EAGAIN error occurred |
| inval | 2 |  | an EINVAL error occurred |
| none | 0 |  | no error |
| unknown | 3 |  | another error occurred |

### GLib.IOStatus

C type: `GIOStatus`

Statuses returned by most of the #GIOFuncs functions.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| again | 3 |  | Resource temporarily unavailable. |
| eof | 2 |  | End of file. |
| error | 0 |  | An error occurred. |
| normal | 1 |  | Success. |

### GLib.KeyFileError

C type: `GKeyFileError`

Error codes returned by key file parsing.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| group_not_found | 4 |  | a requested group was not found |
| invalid_value | 5 |  | a value could not be parsed |
| key_not_found | 3 |  | a requested key was not found |
| not_found | 2 |  | the file was not found |
| parse | 1 |  | document was ill-formed |
| unknown_encoding | 0 |  | the text being parsed was in an unknown encoding |

### GLib.LogWriterOutput

C type: `GLogWriterOutput`

Return values from #GLogWriterFuncs to indicate whether the given log entry was successfully handled by the writer, or whether there was an error i...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| handled | 1 |  | Log writer has handled the log entry. |
| unhandled | 0 |  | Log writer could not handle the log entry. |

### GLib.MarkupError

C type: `GMarkupError`

Error codes returned by markup parsing.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bad_utf8 | 0 |  | text being parsed was not valid UTF-8 |
| empty | 1 |  | document contained nothing, or only whitespace |
| invalid_content | 5 |  | error should be set by #GMarkupParser functions; content was invalid |
| missing_attribute | 6 |  | error should be set by #GMarkupParser functions; a required attribute was missing |
| parse | 2 |  | document was ill-formed |
| unknown_attribute | 4 |  | error should be set by #GMarkupParser functions; attribute wasn't known |
| unknown_element | 3 |  | error should be set by #GMarkupParser functions; element wasn't known |

### GLib.NormalizeMode

GType: `GNormalizeMode` ?? C type: `GNormalizeMode`

Defines how a Unicode string is transformed in a canonical form, standardizing such issues as whether a character with an accent is represented as ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all | 2 | all | beyond %G_NORMALIZE_DEFAULT also standardize the "compatibility" characters in Unicode, such as SUPERSCRIPT THREE to the standard forms (in this ca... |
| all_compose | 3 | all-compose | like %G_NORMALIZE_ALL, but with composed forms rather than a maximally decomposed form |
| default | 0 | default | standardize differences that do not affect the text content, such as the above-mentioned accent representation |
| default_compose | 1 | default-compose | like %G_NORMALIZE_DEFAULT, but with composed forms rather than a maximally decomposed form |
| nfc | 1 | nfc | another name for %G_NORMALIZE_DEFAULT_COMPOSE |
| nfd | 0 | nfd | another name for %G_NORMALIZE_DEFAULT |
| nfkc | 3 | nfkc | another name for %G_NORMALIZE_ALL_COMPOSE |
| nfkd | 2 | nfkd | another name for %G_NORMALIZE_ALL |

### GLib.NumberParserError

C type: `GNumberParserError`

Error codes returned by functions converting a string to a number.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| invalid | 0 |  | string was not a valid number |
| out_of_bounds | 1 |  | string was a number, but out of bounds |

### GLib.OnceStatus

C type: `GOnceStatus`

The possible statuses of a one-time initialization function controlled by a #GOnce struct.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| notcalled | 0 |  | the function has not been called yet. |
| progress | 1 |  | the function call is currently in progress. |
| ready | 2 |  | the function has been called. |

### GLib.OptionArg

C type: `GOptionArg`

The #GOptionArg enum values determine which type of extra argument the options expect to find. If an option expects an extra argument, it can be sp...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| callback | 3 |  | The option provides a callback (of type #GOptionArgFunc) to parse the extra argument. |
| double | 7 |  | The option takes a double argument. The argument can be formatted either for the user's locale or for the "C" locale. Since 2.12 |
| filename | 4 |  | The option takes a filename as argument, which will be in the GLib filename encoding rather than UTF-8. |
| filename_array | 6 |  | The option takes a filename as argument, multiple uses of the option are collected into an array of strings. |
| int | 2 |  | The option takes an integer argument. |
| int64 | 8 |  | The option takes a 64-bit integer. Like %G_OPTION_ARG_INT but for larger numbers. The number can be in decimal base, or in hexadecimal (when prefix... |
| none | 0 |  | No extra argument. This is useful for simple flags or booleans. |
| string | 1 |  | The option takes a UTF-8 string argument. |
| string_array | 5 |  | The option takes a string argument, multiple uses of the option are collected into an array of strings. |

### GLib.OptionError

C type: `GOptionError`

Error codes returned by option parsing.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bad_value | 1 |  | A value couldn't be parsed. |
| failed | 2 |  | A #GOptionArgFunc callback failed. |
| unknown_option | 0 |  | An option was not known to the parser. This error will only be reported, if the parser hasn't been instructed to ignore unknown options, see g_opti... |

### GLib.RegexError

C type: `GRegexError`

Error codes returned by regular expressions functions.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| assertion_expected | 128 |  | Assertion expected after "(?(". Since 2.16 |
| backtracking_control_verb_argument_forbidden | 159 |  | the backtracing control verb used does not allow an argument. Since: 2.34 |
| backtracking_control_verb_argument_required | 166 |  | the backtracing control verb requires an argument. Since: 2.34 |
| character_value_too_large | 176 |  | the character value in the \\u sequence is too large. Since: 2.34 |
| compile | 0 |  | Compilation of the regular expression failed. |
| define_repetion | 155 |  | Repeating a "DEFINE" group is not allowed. This error is never raised. Since: 2.16 Deprecated: 2.34 |
| duplicate_subpattern_name | 143 |  | Two named subpatterns have the same name. Since 2.16 |
| expression_too_large | 120 |  | Regular expression too large. Since 2.16 |
| extra_subpattern_name | 165 |  | different names for subpatterns of the same number are not allowed. Since: 2.34 |
| hex_code_too_large | 134 |  | Character value in "\\x{...}" sequence is too large. Since 2.16 |
| inconsistent_newline_options | 156 |  | Inconsistent newline options. Since 2.16 |
| inexistent_subpattern_reference | 115 |  | Reference to non-existent subpattern. Since 2.16 |
| infinite_loop | 140 |  | Recursive call could loop indefinitely. Since 2.16 |
| internal | 4 |  | Internal error of the regular expression engine. Since 2.16 |
| invalid_condition | 135 |  | Invalid condition "(?(0)". Since 2.16 |
| invalid_control_char | 168 |  | "\\c" must be followed by an ASCII character. Since: 2.34 |
| invalid_data_character | 164 |  | In JavaScript compatibility mode, "[" is an invalid data character. Since: 2.34 |
| invalid_escape_in_character_class | 107 |  | Invalid escape sequence in character class. Since 2.16 |
| invalid_octal_value | 151 |  | Octal value is greater than "\\377". Since 2.16 |
| invalid_relative_reference | 158 |  | relative reference must not be zero. Since: 2.34 |
| malformed_condition | 126 |  | Malformed number or name after "(?(". Since 2.16 |
| malformed_property | 146 |  | Malformed "\\P" or "\\p" sequence. Since 2.16 |
| match | 3 |  | The match process failed. |
| memory_error | 121 |  | Failed to get memory. Since 2.16 |
| missing_back_reference | 157 |  | "\\g" is not followed by a braced, angle-bracketed, or quoted name or number, or by a plain number. Since: 2.16 |
| missing_control_char | 102 |  | "\\c" at end of pattern. Since 2.16 |
| missing_digit | 163 |  | Missing digit. Since 2.34 |
| missing_name | 169 |  | "\\k" is not followed by a braced, angle-bracketed, or quoted name. Since: 2.34 |
| missing_subpattern_name | 162 |  | Missing subpattern name. Since: 2.34 |
| missing_subpattern_name_terminator | 142 |  | Missing terminator in subpattern name. Since 2.16 |
| name_too_long | 175 |  | the name is too long in "(*MARK)", "(*PRUNE)", "(*SKIP)", or "(*THEN)". Since: 2.34 |
| not_supported_in_class | 171 |  | "\\N" is not supported in a class. Since: 2.34 |
| nothing_to_repeat | 109 |  | Nothing to repeat. Since 2.16 |
| number_too_big | 161 |  | number is too big in escape sequence. Since: 2.34 |
| optimize | 1 |  | Optimization of the regular expression failed. |
| posix_collating_elements_not_supported | 131 |  | POSIX collating elements are not supported. Since 2.16 |
| posix_named_class_outside_class | 113 |  | POSIX named classes are supported only within a class. Since 2.16 |
| quantifier_too_big | 105 |  | Number too big in "{}" quantifier. Since 2.16 |
| quantifiers_out_of_order | 104 |  | Numbers out of order in "{}" quantifier. Since 2.16 |
| range_out_of_order | 108 |  | Range out of order in character class. Since 2.16 |
| replace | 2 |  | Replacement failed due to an ill-formed replacement string. |
| single_byte_match_in_lookbehind | 136 |  | \\C not allowed in lookbehind assertion. Since 2.16 |
| stray_backslash | 101 |  | "\\" at end of pattern. Since 2.16 |
| subpattern_name_too_long | 148 |  | Subpattern name is too long (maximum 32 characters). Since 2.16 |
| too_many_branches_in_define | 154 |  | "DEFINE" group contains more than one branch. Since 2.16 |
| too_many_conditional_branches | 127 |  | Conditional group contains more than two branches. Since 2.16 |
| too_many_forward_references | 172 |  | too many forward references. Since: 2.34 |
| too_many_subpatterns | 149 |  | Too many named subpatterns (maximum 10,000). Since 2.16 |
| unknown_backtracking_control_verb | 160 |  | unknown backtracing control verb. Since: 2.34 |
| unknown_posix_class_name | 130 |  | Unknown POSIX class name. Since 2.16 |
| unknown_property | 147 |  | Unknown property name after "\\P" or "\\p". Since 2.16 |
| unmatched_parenthesis | 114 |  | Missing terminating ")" or ")" without opening "(". Since 2.16 |
| unrecognized_character | 112 |  | Unrecognized character after "(?", "(?<" or "(?P". Since 2.16 |
| unrecognized_escape | 103 |  | Unrecognized character follows "\\". Since 2.16 |
| unterminated_character_class | 106 |  | Missing terminating "]" for character class. Since 2.16 |
| unterminated_comment | 118 |  | Missing terminating ")" after comment. Since 2.16 |
| variable_length_lookbehind | 125 |  | Lookbehind assertion is not fixed length. Since 2.16 |

### GLib.SeekType

C type: `GSeekType`

An enumeration specifying the base position for a g_io_channel_seek_position() operation.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cur | 0 |  | the current position in the file. |
| end | 2 |  | the end of the file. |
| set | 1 |  | the start of the file. |

### GLib.ShellError

C type: `GShellError`

Error codes returned by shell functions.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bad_quoting | 0 |  | Mismatched or otherwise mangled quoting. |
| empty_string | 1 |  | String to be parsed was empty. |
| failed | 2 |  | Some other error. |

### GLib.SliceConfig

C type: `GSliceConfig`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| always_malloc | 1 |  |  |
| bypass_magazines | 2 |  |  |
| chunk_sizes | 5 |  |  |
| color_increment | 4 |  |  |
| contention_counter | 6 |  |  |
| working_set_msecs | 3 |  |  |

### GLib.SpawnError

C type: `GSpawnError`

Error codes returned by spawning processes.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| 2big | 5 |  | deprecated alias for %G_SPAWN_ERROR_TOO_BIG (deprecated since GLib 2.32) |
| acces | 3 |  | execv() returned `EACCES` |
| chdir | 2 |  | Changing to working directory failed. |
| failed | 19 |  | Some other fatal failure, `error->message` should explain. |
| fork | 0 |  | Fork failed due to lack of memory. |
| inval | 16 |  | execv() returned `EINVAL` |
| io | 13 |  | execv() returned `EIO` |
| isdir | 17 |  | execv() returned `EISDIR` |
| libbad | 18 |  | execv() returned `ELIBBAD` |
| loop | 11 |  | execv() returned `ELOOP` |
| mfile | 15 |  | execv() returned `EMFILE` |
| nametoolong | 7 |  | execv() returned `ENAMETOOLONG` |
| nfile | 14 |  | execv() returned `ENFILE` |
| noent | 8 |  | execv() returned `ENOENT` |
| noexec | 6 |  | execv() returned `ENOEXEC` |
| nomem | 9 |  | execv() returned `ENOMEM` |
| notdir | 10 |  | execv() returned `ENOTDIR` |
| perm | 4 |  | execv() returned `EPERM` |
| read | 1 |  | Read or select on pipes failed. |
| too_big | 5 |  | execv() returned `E2BIG` |
| txtbusy | 12 |  | execv() returned `ETXTBUSY` |

### GLib.TestFileType

C type: `GTestFileType`

The type of file to return the filename for, when used with g_test_build_filename(). These two options correspond rather directly to the 'dist' and...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| built | 1 |  | a file that was built on the compiling machine |
| dist | 0 |  | a file that was included in the distribution tarball |

### GLib.TestLogType

C type: `GTestLogType`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| error | 1 |  |  |
| list_case | 3 |  |  |
| max_result | 8 |  |  |
| message | 9 |  |  |
| min_result | 7 |  |  |
| none | 0 |  |  |
| skip_case | 4 |  |  |
| start_binary | 2 |  |  |
| start_case | 5 |  |  |
| start_suite | 10 |  |  |
| stop_case | 6 |  |  |
| stop_suite | 11 |  |  |

### GLib.TestResult

C type: `GTestResult`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| failure | 2 |  |  |
| incomplete | 3 |  |  |
| skipped | 1 |  |  |
| success | 0 |  |  |

### GLib.ThreadError

C type: `GThreadError`

Possible errors of thread related functions.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| thread_error_again | 0 |  | a thread couldn't be created due to resource shortage. Try again later. |

### GLib.ThreadPriority

C type: `GThreadPriority`

Thread priorities.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| high | 2 |  | a priority higher than normal |
| low | 0 |  | a priority lower than normal |
| normal | 1 |  | the default priority |
| urgent | 3 |  | the highest priority |

### GLib.TimeType

C type: `GTimeType`

Disambiguates a given time in two ways. First, specifies if the given time is in universal or local time. Second, if the time is in local time, spe...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| daylight | 1 |  | the time is in local daylight time |
| standard | 0 |  | the time is in local standard time |
| universal | 2 |  | the time is in UTC |

### GLib.TokenType

C type: `GTokenType`

The possible types of token returned from each g_scanner_get_next_token() call.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| binary | 259 |  | a binary integer |
| char | 258 |  | a character |
| comma | 44 |  | a ',' character |
| comment_multi | 269 |  | multi line comment |
| comment_single | 268 |  | one line comment |
| eof | 0 |  | the end of the file |
| equal_sign | 61 |  | a '=' character |
| error | 257 |  | an error occurred |
| float | 263 |  | a floating point number |
| hex | 262 |  | a hex integer |
| identifier | 266 |  | an identifier |
| identifier_null | 267 |  | a null identifier |
| int | 261 |  | an integer |
| left_brace | 91 |  | a '[' character |
| left_curly | 123 |  | a '{' character |
| left_paren | 40 |  | a '(' character |
| none | 256 |  | not a token |
| octal | 260 |  | an octal integer |
| right_brace | 93 |  | a ']' character |
| right_curly | 125 |  | a '}' character |
| right_paren | 41 |  | a ')' character |
| string | 264 |  | a string |
| symbol | 265 |  | a symbol |

### GLib.TraverseType

C type: `GTraverseType`

Specifies the type of traversal performed by g_tree_traverse(), g_node_traverse() and g_node_find(). The different orders are illustrated here: - I...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| in_order | 0 |  | vists a node's left child first, then the node itself, then its right child. This is the one to use if you want the output sorted according to the ... |
| level_order | 3 |  | is not implemented for [balanced binary trees][glib-Balanced-Binary-Trees]. For [n-ary trees][glib-N-ary-Trees], it vists the root node first, then... |
| post_order | 2 |  | visits the node's children, then the node itself. |
| pre_order | 1 |  | visits a node, then its children. |

### GLib.UnicodeBreakType

GType: `GUnicodeBreakType` ?? C type: `GUnicodeBreakType`

These are the possible line break classifications. Since new Unicode versions may add new types here, applications should be ready to handle unknow...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| after | 10 | after | Break Opportunity After (BA) |
| aksara | 43 | aksara | Aksara (AK). Since: 2.80 @G_UNICODE_BREAK_AKSARA_PRE_BASE (AP). Since: 2.80 @G_UNICODE_BREAK_AKSARA_START (AS). Since: 2.80 @G_UNICODE_BREAK_VIRAMA... |
| aksara_pre_base | 44 | aksara-pre-base |  |
| aksara_start | 45 | aksara-start |  |
| alphabetic | 23 | alphabetic | Ordinary Alphabetic and Symbol Characters (AL) |
| ambiguous | 27 | ambiguous | Ambiguous (Alphabetic or Ideographic) (AI) |
| before | 11 | before | Break Opportunity Before (BB) |
| before_and_after | 12 | before-and-after | Break Opportunity Before and After (B2) |
| carriage_return | 1 | carriage-return | Carriage Return (CR) |
| close_paranthesis | 36 | close-paranthesis | Closing Parenthesis (CP). Since 2.28. Deprecated: 2.70: Use %G_UNICODE_BREAK_CLOSE_PARENTHESIS instead. |
| close_parenthesis | 36 | close-parenthesis | Closing Parenthesis (CP). Since 2.70 |
| close_punctuation | 16 | close-punctuation | Closing Punctuation (CL) |
| combining_mark | 3 | combining-mark | Attached Characters and Combining Marks (CM) |
| complex_context | 26 | complex-context | Complex Content Dependent (South East Asian) (SA) |
| conditional_japanese_starter | 37 | conditional-japanese-starter | Conditional Japanese Starter (CJ). Since: 2.32 |
| contingent | 8 | contingent | Contingent Break Opportunity (CB) |
| emoji_base | 40 | emoji-base | Emoji Base (EB). Since: 2.50 |
| emoji_modifier | 41 | emoji-modifier | Emoji Modifier (EM). Since: 2.50 |
| exclamation | 18 | exclamation | Exclamation/Interrogation (EX) |
| hangul_l_jamo | 31 | hangul-l-jamo | Hangul L Jamo (JL) |
| hangul_lv_syllable | 34 | hangul-lv-syllable | Hangul LV Syllable (H2) |
| hangul_lvt_syllable | 35 | hangul-lvt-syllable | Hangul LVT Syllable (H3) |
| hangul_t_jamo | 33 | hangul-t-jamo | Hangul T Jamo (JT) |
| hangul_v_jamo | 32 | hangul-v-jamo | Hangul V Jamo (JV) |
| hebrew_letter | 38 | hebrew-letter | Hebrew Letter (HL). Since: 2.32 |
| hyphen | 13 | hyphen | Hyphen (HY) |
| ideographic | 19 | ideographic | Ideographic (ID) |
| infix_separator | 21 | infix-separator | Infix Separator (Numeric) (IS) |
| inseparable | 6 | inseparable | Inseparable (IN) |
| line_feed | 2 | line-feed | Line Feed (LF) |
| mandatory | 0 | mandatory | Mandatory Break (BK) |
| next_line | 29 | next-line | Next Line (NL) |
| non_breaking_glue | 7 | non-breaking-glue | Non-breaking ("Glue") (GL) |
| non_starter | 14 | non-starter | Nonstarter (NS) |
| numeric | 20 | numeric | Numeric (NU) |
| open_punctuation | 15 | open-punctuation | Opening Punctuation (OP) |
| postfix | 25 | postfix | Postfix (Numeric) (PO) |
| prefix | 24 | prefix | Prefix (Numeric) (PR) |
| quotation | 17 | quotation | Ambiguous Quotation (QU) |
| regional_indicator | 39 | regional-indicator | Regional Indicator (RI). Since: 2.36 |
| space | 9 | space | Space (SP) |
| surrogate | 4 | surrogate | Surrogates (SG) |
| symbol | 22 | symbol | Symbols Allowing Break After (SY) |
| unknown | 28 | unknown | Unknown (XX) |
| virama | 47 | virama |  |
| virama_final | 46 | virama-final |  |
| word_joiner | 30 | word-joiner | Word Joiner (WJ) |
| zero_width_joiner | 42 | zero-width-joiner | Zero Width Joiner (ZWJ). Since: 2.50 |
| zero_width_space | 5 | zero-width-space | Zero Width Space (ZW) |

### GLib.UnicodeScript

GType: `GUnicodeScript` ?? C type: `GUnicodeScript`

The #GUnicodeScript enumeration identifies different writing systems. The values correspond to the names as defined in the Unicode standard. The en...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| adlam | 132 | adlam | Adlam. Since: 2.50 |
| ahom | 126 | ahom | Ahom. Since: 2.48 |
| anatolian_hieroglyphs | 127 | anatolian-hieroglyphs | Anatolian Hieroglyphs. Since: 2.48 |
| arabic | 2 | arabic | Arabic |
| armenian | 3 | armenian | Armenian |
| avestan | 78 | avestan | Avestan. Since 2.26 |
| balinese | 62 | balinese | Balinese |
| bamum | 79 | bamum | Bamum. Since 2.26 |
| bassa_vah | 103 | bassa-vah | Bassa. Since: 2.42 |
| batak | 93 | batak | Batak. Since 2.28 |
| bengali | 4 | bengali | Bengali |
| bhaiksuki | 133 | bhaiksuki | Bhaiksuki. Since: 2.50 |
| bopomofo | 5 | bopomofo | Bopomofo |
| brahmi | 94 | brahmi | Brahmi. Since 2.28 |
| braille | 46 | braille | Braille |
| buginese | 55 | buginese | Buginese |
| buhid | 44 | buhid | Buhid |
| canadian_aboriginal | 40 | canadian-aboriginal | Canadian Aboriginal |
| carian | 75 | carian | Carian. Since 2.16.3 |
| caucasian_albanian | 104 | caucasian-albanian | Caucasian Albanian. Since: 2.42 |
| chakma | 96 | chakma | Chakma. Since: 2.32 |
| cham | 72 | cham | Cham. Since 2.16.3 |
| cherokee | 6 | cherokee | Cherokee |
| chorasmian | 153 | chorasmian | Chorasmian. Since: 2.66 |
| common | 0 | common | a character used by multiple different scripts |
| coptic | 7 | coptic | Coptic |
| cuneiform | 63 | cuneiform | Cuneiform |
| cypriot | 47 | cypriot | Cypriot |
| cypro_minoan | 157 | cypro-minoan | Cypro-Minoan. Since: 2.72 |
| cyrillic | 8 | cyrillic | Cyrillic |
| deseret | 9 | deseret | Deseret |
| devanagari | 10 | devanagari | Devanagari |
| dives_akuru | 154 | dives-akuru | Dives Akuru. Since: 2.66 |
| dogra | 142 | dogra | Dogra. Since: 2.58 |
| duployan | 105 | duployan | Duployan. Since: 2.42 |
| egyptian_hieroglyphs | 80 | egyptian-hieroglyphs | Egyptian Hieroglpyhs. Since 2.26 |
| elbasan | 106 | elbasan | Elbasan. Since: 2.42 |
| elymaic | 149 | elymaic | Elym. Since: 2.62 |
| ethiopic | 11 | ethiopic | Ethiopic |
| georgian | 12 | georgian | Georgian |
| glagolitic | 56 | glagolitic | Glagolitic |
| gothic | 13 | gothic | Gothic |
| grantha | 107 | grantha | Grantha. Since: 2.42 |
| greek | 14 | greek | Greek |
| gujarati | 15 | gujarati | Gujarati |
| gunjala_gondi | 143 | gunjala-gondi | Gunjala Gondi. Since: 2.58 |
| gurmukhi | 16 | gurmukhi | Gurmukhi |
| han | 17 | han | Han |
| hangul | 18 | hangul | Hangul |
| hanifi_rohingya | 144 | hanifi-rohingya | Hanifi Rohingya. Since: 2.58 |
| hanunoo | 43 | hanunoo | Hanunoo |
| hatran | 128 | hatran | Hatran. Since: 2.48 |
| hebrew | 19 | hebrew | Hebrew |
| hiragana | 20 | hiragana | Hiragana |
| imperial_aramaic | 81 | imperial-aramaic | Imperial Aramaic. Since 2.26 |
| inherited | 1 | inherited | a mark glyph that takes its script from the base glyph to which it is attached |
| inscriptional_pahlavi | 82 | inscriptional-pahlavi | Inscriptional Pahlavi. Since 2.26 |
| inscriptional_parthian | 83 | inscriptional-parthian | Inscriptional Parthian. Since 2.26 |
| invalid_code | -1 | invalid-code | a value never returned from g_unichar_get_script() |
| javanese | 84 | javanese | Javanese. Since 2.26 |
| kaithi | 85 | kaithi | Kaithi. Since 2.26 |
| kannada | 21 | kannada | Kannada |
| katakana | 22 | katakana | Katakana |
| kawi | 163 | kawi | Kawi. Since 2.74 |
| kayah_li | 67 | kayah-li | Kayah Li. Since 2.16.3 |
| kharoshthi | 60 | kharoshthi | Kharoshthi |
| khitan_small_script | 155 | khitan-small-script | Khitan small script. Since: 2.66 |
| khmer | 23 | khmer | Khmer |
| khojki | 108 | khojki | Kjohki. Since: 2.42 |
| khudawadi | 109 | khudawadi | Khudawadi, Sindhi. Since: 2.42 |
| lao | 24 | lao | Lao |
| latin | 25 | latin | Latin |
| lepcha | 68 | lepcha | Lepcha. Since 2.16.3 |
| limbu | 48 | limbu | Limbu |
| linear_a | 110 | linear-a | Linear A. Since: 2.42 |
| linear_b | 51 | linear-b | Linear B |
| lisu | 86 | lisu | Lisu. Since 2.26 |
| lycian | 76 | lycian | Lycian. Since 2.16.3 |
| lydian | 77 | lydian | Lydian. Since 2.16.3 |
| mahajani | 111 | mahajani | Mahajani. Since: 2.42 |
| makasar | 145 | makasar | Makasar. Since: 2.58 |
| malayalam | 26 | malayalam | Malayalam |
| mandaic | 95 | mandaic | Mandaic. Since 2.28 |
| manichaean | 112 | manichaean | Manichaean. Since: 2.42 |
| marchen | 134 | marchen | Marchen. Since: 2.50 |
| masaram_gondi | 138 | masaram-gondi | Masaram Gondi. Since: 2.54 |
| math | 162 | math | Mathematical notation. Since: 2.72 |
| medefaidrin | 146 | medefaidrin | Medefaidrin. Since: 2.58 |
| meetei_mayek | 87 | meetei-mayek | Meetei Mayek. Since 2.26 |
| mende_kikakui | 113 | mende-kikakui | Mende Kikakui. Since: 2.42 |
| meroitic_cursive | 97 | meroitic-cursive | Meroitic Cursive. Since: 2.32 |
| meroitic_hieroglyphs | 98 | meroitic-hieroglyphs | Meroitic Hieroglyphs. Since: 2.32 |
| miao | 99 | miao | Miao. Since: 2.32 |
| modi | 114 | modi | Modi. Since: 2.42 |
| mongolian | 27 | mongolian | Mongolian |
| mro | 115 | mro | Mro. Since: 2.42 |
| multani | 129 | multani | Multani. Since: 2.48 |
| myanmar | 28 | myanmar | Myanmar |
| nabataean | 116 | nabataean | Nabataean. Since: 2.42 |
| nag_mundari | 164 | nag-mundari | Nag Mundari. Since 2.74 |
| nandinagari | 150 | nandinagari | Nand. Since: 2.62 |
| new_tai_lue | 54 | new-tai-lue | New Tai Lue |
| newa | 135 | newa | Newa. Since: 2.50 |
| nko | 66 | nko | N'Ko |
| nushu | 139 | nushu | Nushu. Since: 2.54 |
| nyiakeng_puachue_hmong | 151 | nyiakeng-puachue-hmong | Rohg. Since: 2.62 |
| ogham | 29 | ogham | Ogham |
| ol_chiki | 73 | ol-chiki | Ol Chiki. Since 2.16.3 |
| old_hungarian | 130 | old-hungarian | Old Hungarian. Since: 2.48 |
| old_italic | 30 | old-italic | Old Italic |
| old_north_arabian | 117 | old-north-arabian | Old North Arabian. Since: 2.42 |
| old_permic | 118 | old-permic | Old Permic. Since: 2.42 |
| old_persian | 59 | old-persian | Old Persian |
| old_sogdian | 147 | old-sogdian | Old Sogdian. Since: 2.58 |
| old_south_arabian | 88 | old-south-arabian | Old South Arabian. Since 2.26 |
| old_turkic | 89 | old-turkic | Old Turkic. Since 2.28 |
| old_uyghur | 158 | old-uyghur | Old Uyghur. Since: 2.72 |
| oriya | 31 | oriya | Oriya |
| osage | 136 | osage | Osage. Since: 2.50 |
| osmanya | 49 | osmanya | Osmanya |
| pahawh_hmong | 119 | pahawh-hmong | Pahawh Hmong. Since: 2.42 |
| palmyrene | 120 | palmyrene | Palmyrene. Since: 2.42 |
| pau_cin_hau | 121 | pau-cin-hau | Pau Cin Hau. Since: 2.42 |
| phags_pa | 65 | phags-pa | Phags-pa |
| phoenician | 64 | phoenician | Phoenician |
| psalter_pahlavi | 122 | psalter-pahlavi | Psalter Pahlavi. Since: 2.42 |
| rejang | 69 | rejang | Rejang. Since 2.16.3 |
| runic | 32 | runic | Runic |
| samaritan | 90 | samaritan | Samaritan. Since 2.26 |
| saurashtra | 71 | saurashtra | Saurashtra. Since 2.16.3 |
| sharada | 100 | sharada | Sharada. Since: 2.32 |
| shavian | 50 | shavian | Shavian |
| siddham | 123 | siddham | Siddham. Since: 2.42 |
| signwriting | 131 | signwriting | Signwriting. Since: 2.48 |
| sinhala | 33 | sinhala | Sinhala |
| sogdian | 148 | sogdian | Sogdian. Since: 2.58 |
| sora_sompeng | 101 | sora-sompeng | Sora Sompeng. Since: 2.32 |
| soyombo | 140 | soyombo | Soyombo. Since: 2.54 |
| sundanese | 70 | sundanese | Sundanese. Since 2.16.3 |
| syloti_nagri | 58 | syloti-nagri | Syloti Nagri |
| syriac | 34 | syriac | Syriac |
| tagalog | 42 | tagalog | Tagalog |
| tagbanwa | 45 | tagbanwa | Tagbanwa |
| tai_le | 52 | tai-le | Tai Le |
| tai_tham | 91 | tai-tham | Tai Tham. Since 2.26 |
| tai_viet | 92 | tai-viet | Tai Viet. Since 2.26 |
| takri | 102 | takri | Takri. Since: 2.32 |
| tamil | 35 | tamil | Tamil |
| tangsa | 159 | tangsa | Tangsa. Since: 2.72 |
| tangut | 137 | tangut | Tangut. Since: 2.50 |
| telugu | 36 | telugu | Telugu |
| thaana | 37 | thaana | Thaana |
| thai | 38 | thai | Thai |
| tibetan | 39 | tibetan | Tibetan |
| tifinagh | 57 | tifinagh | Tifinagh |
| tirhuta | 124 | tirhuta | Tirhuta. Since: 2.42 |
| toto | 160 | toto | Toto. Since: 2.72 |
| ugaritic | 53 | ugaritic | Ugaritic |
| unknown | 61 | unknown | an unassigned code point |
| vai | 74 | vai | Vai. Since 2.16.3 |
| vithkuqi | 161 | vithkuqi | Vithkuqi. Since: 2.72 |
| wancho | 152 | wancho | Wcho. Since: 2.62 |
| warang_citi | 125 | warang-citi | Warang Citi. Since: 2.42 |
| yezidi | 156 | yezidi | Yezidi. Since: 2.66 |
| yi | 41 | yi | Yi |
| zanabazar_square | 141 | zanabazar-square | Zanabazar Square. Since: 2.54 |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| from_iso15924 | `from_iso15924(iso15924: guint32) -> UnicodeScript` | g_unicode_script_from_iso15924 | 2.30 | Looks up the Unicode script for @iso15924. ISO 15924 assigns four-letter codes to scripts. For example, the code for Arabic is 'Arab'. This functio... |
| to_iso15924 | `to_iso15924(script: UnicodeScript) -> guint32` | g_unicode_script_to_iso15924 | 2.30 | Looks up the ISO 15924 code for @script. ISO 15924 assigns four-letter codes to scripts. For example, the code for Arabic is 'Arab'. The four lette... |

### GLib.UnicodeType

GType: `GUnicodeType` ?? C type: `GUnicodeType`

These are the possible character classifications from the Unicode specification. See Unicode Character Database.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| close_punctuation | 18 | close-punctuation | General category "Punctuation, Close" (Pe) |
| connect_punctuation | 16 | connect-punctuation | General category "Punctuation, Connector" (Pc) |
| control | 0 | control | General category "Other, Control" (Cc) |
| currency_symbol | 23 | currency-symbol | General category "Symbol, Currency" (Sc) |
| dash_punctuation | 17 | dash-punctuation | General category "Punctuation, Dash" (Pd) |
| decimal_number | 13 | decimal-number | General category "Number, Decimal Digit" (Nd) |
| enclosing_mark | 11 | enclosing-mark | General category "Mark, Enclosing" (Me) |
| final_punctuation | 19 | final-punctuation | General category "Punctuation, Final quote" (Pf) |
| format | 1 | format | General category "Other, Format" (Cf) |
| initial_punctuation | 20 | initial-punctuation | General category "Punctuation, Initial quote" (Pi) |
| letter_number | 14 | letter-number | General category "Number, Letter" (Nl) |
| line_separator | 27 | line-separator | General category "Separator, Line" (Zl) |
| lowercase_letter | 5 | lowercase-letter | General category "Letter, Lowercase" (Ll) |
| math_symbol | 25 | math-symbol | General category "Symbol, Math" (Sm) |
| modifier_letter | 6 | modifier-letter | General category "Letter, Modifier" (Lm) |
| modifier_symbol | 24 | modifier-symbol | General category "Symbol, Modifier" (Sk) |
| non_spacing_mark | 12 | non-spacing-mark | General category "Mark, Nonspacing" (Mn) |
| open_punctuation | 22 | open-punctuation | General category "Punctuation, Open" (Ps) |
| other_letter | 7 | other-letter | General category "Letter, Other" (Lo) |
| other_number | 15 | other-number | General category "Number, Other" (No) |
| other_punctuation | 21 | other-punctuation | General category "Punctuation, Other" (Po) |
| other_symbol | 26 | other-symbol | General category "Symbol, Other" (So) |
| paragraph_separator | 28 | paragraph-separator | General category "Separator, Paragraph" (Zp) |
| private_use | 3 | private-use | General category "Other, Private Use" (Co) |
| space_separator | 29 | space-separator | General category "Separator, Space" (Zs) |
| spacing_mark | 10 | spacing-mark | General category "Mark, Spacing" (Mc) |
| surrogate | 4 | surrogate | General category "Other, Surrogate" (Cs) |
| titlecase_letter | 8 | titlecase-letter | General category "Letter, Titlecase" (Lt) |
| unassigned | 2 | unassigned | General category "Other, Not Assigned" (Cn) |
| uppercase_letter | 9 | uppercase-letter | General category "Letter, Uppercase" (Lu) |

### GLib.UnixPipeEnd

C type: `GUnixPipeEnd`

Mnemonic constants for the ends of a Unix pipe.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| read | 0 |  | The readable file descriptor 0 |
| write | 1 |  | The writable file descriptor 1 |

### GLib.UriError

C type: `GUriError`

Error codes returned by #GUri methods.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bad_auth_params | 4 |  | The authentication parameters of a URI could not be parsed. |
| bad_fragment | 9 |  | The fragment of a URI could not be parsed. |
| bad_host | 5 |  | The host of a URI could not be parsed. |
| bad_password | 3 |  | The password of a URI could not be parsed. |
| bad_path | 7 |  | The path of a URI could not be parsed. |
| bad_port | 6 |  | The port of a URI could not be parsed. |
| bad_query | 8 |  | The query of a URI could not be parsed. |
| bad_scheme | 1 |  | The scheme of a URI could not be parsed. |
| bad_user | 2 |  | The user/userinfo of a URI could not be parsed. |
| failed | 0 |  | Generic error if no more specific error is available. See the error message for details. |

### GLib.UserDirectory

C type: `GUserDirectory`

These are logical ids for special directories which are defined depending on the platform used. You should use g_get_user_special_dir() to retrieve...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| directory_desktop | 0 |  | the user's Desktop directory |
| directory_documents | 1 |  | the user's Documents directory |
| directory_download | 2 |  | the user's Downloads directory |
| directory_music | 3 |  | the user's Music directory |
| directory_pictures | 4 |  | the user's Pictures directory |
| directory_public_share | 5 |  | the user's shared directory |
| directory_templates | 6 |  | the user's Templates directory |
| directory_videos | 7 |  | the user's Movies directory |
| n_directories | 8 |  | the number of enum values |

### GLib.VariantClass

C type: `GVariantClass`

The range of possible top-level types of #GVariant instances.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| array | 97 |  | The #GVariant is an array. |
| boolean | 98 |  | The #GVariant is a boolean. |
| byte | 121 |  | The #GVariant is a byte. |
| dict_entry | 123 |  | The #GVariant is a dictionary entry. |
| double | 100 |  | The #GVariant is a double precision floating point value. |
| handle | 104 |  | The #GVariant is a file handle index. |
| int16 | 110 |  | The #GVariant is a signed 16 bit integer. |
| int32 | 105 |  | The #GVariant is a signed 32 bit integer. |
| int64 | 120 |  | The #GVariant is a signed 64 bit integer. |
| maybe | 109 |  | The #GVariant is a maybe-typed value. |
| object_path | 111 |  | The #GVariant is a D-Bus object path string. |
| signature | 103 |  | The #GVariant is a D-Bus signature string. |
| string | 115 |  | The #GVariant is a normal string. |
| tuple | 40 |  | The #GVariant is a tuple. |
| uint16 | 113 |  | The #GVariant is an unsigned 16 bit integer. |
| uint32 | 117 |  | The #GVariant is an unsigned 32 bit integer. |
| uint64 | 116 |  | The #GVariant is an unsigned 64 bit integer. |
| variant | 118 |  | The #GVariant is a variant. |

### GLib.VariantParseError

C type: `GVariantParseError`

Error codes returned by parsing text-format GVariants.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| basic_type_expected | 1 |  | a non-basic #GVariantType was given where a basic type was expected |
| cannot_infer_type | 2 |  | cannot infer the #GVariantType |
| definite_type_expected | 3 |  | an indefinite #GVariantType was given where a definite type was expected |
| failed | 0 |  | generic error (unused) |
| input_not_at_end | 4 |  | extra data after parsing finished |
| invalid_character | 5 |  | invalid character in number or unicode escape |
| invalid_format_string | 6 |  | not a valid #GVariant format string |
| invalid_object_path | 7 |  | not a valid object path |
| invalid_signature | 8 |  | not a valid type signature |
| invalid_type_string | 9 |  | not a valid #GVariant type string |
| no_common_type | 10 |  | could not find a common type for array entries |
| number_out_of_range | 11 |  | the numerical value is out of range of the given type |
| number_too_big | 12 |  | the numerical value is out of range for any type |
| recursion | 18 |  | variant was too deeply nested; #GVariant is only guaranteed to handle nesting up to 64 levels (Since: 2.64) |
| type_error | 13 |  | cannot parse as variant of the specified type |
| unexpected_token | 14 |  | an unexpected token was encountered |
| unknown_keyword | 15 |  | an unknown keyword was encountered |
| unterminated_string_constant | 16 |  | unterminated string constant |
| value_expected | 17 |  | no value given |

## Flags

### GLib.AsciiType

C type: `GAsciiType`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| alnum | 1 |  |  |
| alpha | 2 |  |  |
| cntrl | 4 |  |  |
| digit | 8 |  |  |
| graph | 16 |  |  |
| lower | 32 |  |  |
| print | 64 |  |  |
| punct | 128 |  |  |
| space | 256 |  |  |
| upper | 512 |  |  |
| xdigit | 1024 |  |  |

### GLib.FileSetContentsFlags

C type: `GFileSetContentsFlags`

Flags to pass to g_file_set_contents_full() to affect its safety and performance.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| consistent | 1 |  | Guarantee file consistency: after a crash, either the old version of the file or the new version of the file will be available, but not a mixture. ... |
| durable | 2 |  | Guarantee file durability: after a crash, the new version of the file will be available. On Unix systems this equates to an `fsync()` on the file (... |
| none | 0 |  | No guarantees about file consistency or durability. The most dangerous setting, which is slightly faster than other settings. |
| only_existing | 4 |  | Only apply consistency and durability guarantees if the file already exists. This may speed up file operations if the file doesn???t currently exis... |

### GLib.FileTest

C type: `GFileTest`

A test to perform on a file using g_file_test().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| exists | 16 |  | %TRUE if the file exists. It may or may not be a regular file. |
| is_dir | 4 |  | %TRUE if the file is a directory. |
| is_executable | 8 |  | %TRUE if the file is executable. |
| is_regular | 1 |  | %TRUE if the file is a regular file (not a directory). Note that this test will also return %TRUE if the tested file is a symlink to a regular file. |
| is_symlink | 2 |  | %TRUE if the file is a symlink. |

### GLib.FormatSizeFlags

C type: `GFormatSizeFlags`

Flags to modify the format of the string returned by g_format_size_full().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bits | 4 |  | set the size as a quantity in bits, rather than bytes, and return units in bits. For example, ???Mbit??? rather than ???MB???. |
| default | 0 |  | behave the same as g_format_size() |
| iec_units | 2 |  | use IEC (base 1024) units with "KiB"-style suffixes. IEC units should only be used for reporting things with a strong "power of 2" basis, like RAM ... |
| long_format | 1 |  | include the exact number of bytes as part of the returned string. For example, "45.6 kB (45,612 bytes)". |
| only_unit | 16 |  | return only unit, without value; this should not be used together with @G_FORMAT_SIZE_LONG_FORMAT nor @G_FORMAT_SIZE_ONLY_VALUE. Since: 2.74 |
| only_value | 8 |  | return only value, without unit; this should not be used together with @G_FORMAT_SIZE_LONG_FORMAT nor @G_FORMAT_SIZE_ONLY_UNIT. Since: 2.74 |

### GLib.HookFlagMask

C type: `GHookFlagMask`

Flags used internally in the #GHook implementation.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| active | 1 |  | set if the hook has not been destroyed |
| in_call | 2 |  | set if the hook is currently being run |
| mask | 15 |  | A mask covering all bits reserved for hook flags; see %G_HOOK_FLAG_USER_SHIFT |

### GLib.IOCondition

GType: `GIOCondition` ?? C type: `GIOCondition`

A bitwise combination representing a condition to watch for on an event source.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| err | 8 | err | Error condition. |
| hup | 16 | hup | Hung up (the connection has been broken, usually for pipes and sockets). |
| in | 1 | in | There is data to read. |
| nval | 32 | nval | Invalid request. The file descriptor is not open. |
| out | 4 | out | Data can be written (without blocking). |
| pri | 2 | pri | There is urgent data to read. |

### GLib.IOFlags

C type: `GIOFlags`

Specifies properties of a #GIOChannel. Some of the flags can only be read with g_io_channel_get_flags(), but not changed with g_io_channel_set_flag...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| append | 1 |  | turns on append mode, corresponds to %O_APPEND (see the documentation of the UNIX open() syscall) |
| get_mask | 31 |  | the mask of the flags that are returned from g_io_channel_get_flags() |
| is_readable | 4 |  | indicates that the io channel is readable. This flag cannot be changed. |
| is_seekable | 16 |  | indicates that the io channel is seekable, i.e. that g_io_channel_seek_position() can be used on it. This flag cannot be changed. |
| is_writable | 8 |  | indicates that the io channel is writable. This flag cannot be changed. |
| is_writeable | 8 |  | a misspelled version of @G_IO_FLAG_IS_WRITABLE that existed before the spelling was fixed in GLib 2.30. It is kept here for compatibility reasons. ... |
| mask | 31 |  | the mask that specifies all the valid flags. |
| nonblock | 2 |  | turns on nonblocking mode, corresponds to %O_NONBLOCK/%O_NDELAY (see the documentation of the UNIX open() syscall) |
| none | 0 |  | no special flags set. Since: 2.74 |
| set_mask | 3 |  | the mask of the flags that the user can modify with g_io_channel_set_flags() |

### GLib.KeyFileFlags

C type: `GKeyFileFlags`

Flags which influence the parsing.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| keep_comments | 1 |  | Use this flag if you plan to write the (possibly modified) contents of the key file back to a file; otherwise all comments will be lost when the ke... |
| keep_translations | 2 |  | Use this flag if you plan to write the (possibly modified) contents of the key file back to a file; otherwise only the translations for the current... |
| none | 0 |  | No flags, default behaviour |

### GLib.LogLevelFlags

C type: `GLogLevelFlags`

Flags specifying the level of log messages. It is possible to change how GLib treats messages of the various levels using [func@GLib.log_set_handle...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| flag_fatal | 2 |  | internal flag |
| flag_recursion | 1 |  | internal flag |
| level_critical | 8 |  | log level for critical warning messages, see [func@GLib.critical]. This level is also used for messages produced by [func@GLib.return_if_fail] and ... |
| level_debug | 128 |  | log level for debug messages, see [func@GLib.debug] |
| level_error | 4 |  | log level for errors, see [func@GLib.error]. This level is also used for messages produced by [func@GLib.assert]. |
| level_info | 64 |  | log level for informational messages, see [func@GLib.info] |
| level_mask | -4 |  | a mask including all log levels |
| level_message | 32 |  | log level for messages, see [func@GLib.message] |
| level_warning | 16 |  | log level for warnings, see [func@GLib.warning] |

### GLib.MainContextFlags

C type: `GMainContextFlags`

Flags to pass to g_main_context_new_with_flags() which affect the behaviour of a #GMainContext.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 |  | Default behaviour. |
| ownerless_polling | 1 |  | Assume that polling for events will free the thread to process other jobs. That's useful if you're using `g_main_context_{prepare,query,check,dispa... |

### GLib.MarkupCollectType

C type: `GMarkupCollectType`

A mixed enumerated type and flags field. You must specify one type (string, strdup, boolean, tristate). Additionally, you may optionally bitwise OR...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| boolean | 3 |  | expects a parameter of type (gboolean *) and parses the attribute value as a boolean. Sets %FALSE if the attribute isn't present. Valid boolean val... |
| invalid | 0 |  | used to terminate the list of attributes to collect |
| optional | 65536 |  | can be bitwise ORed with the other fields. If present, allows the attribute not to appear. A default value is set depending on what value type is used |
| strdup | 2 |  | as with %G_MARKUP_COLLECT_STRING, but expects a parameter of type (char **) and g_strdup()s the returned pointer. The pointer must be freed with g_... |
| string | 1 |  | collect the string pointer directly from the attribute_values[] array. Expects a parameter of type (const char **). If %G_MARKUP_COLLECT_OPTIONAL i... |
| tristate | 4 |  | as with %G_MARKUP_COLLECT_BOOLEAN, but in the case of a missing attribute a value is set that compares equal to neither %FALSE nor %TRUE G_MARKUP_C... |

### GLib.MarkupParseFlags

C type: `GMarkupParseFlags`

Flags that affect the behaviour of the parser.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| default_flags | 0 |  | No special behaviour. Since: 2.74 |
| do_not_use_this_unsupported_flag | 1 |  | flag you should not use |
| ignore_qualified | 8 |  | Ignore (don't report) qualified attributes and tags, along with their contents. A qualified attribute or tag is one that contains ':' in its name (... |
| prefix_error_position | 4 |  | Normally errors caught by GMarkup itself have line/column information prefixed to them to let the caller know the location of the error. When this ... |
| treat_cdata_as_text | 2 |  | When this flag is set, CDATA marked sections are not passed literally to the @passthrough function of the parser. Instead, the content of the secti... |

### GLib.OptionFlags

C type: `GOptionFlags`

Flags which modify individual options.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| filename | 16 |  | For options of the %G_OPTION_ARG_CALLBACK kind, this flag indicates that the argument should be passed to the callback in the GLib filename encodin... |
| hidden | 1 |  | The option doesn't appear in `--help` output. |
| in_main | 2 |  | The option appears in the main section of the `--help` output, even if it is defined in a group. |
| no_arg | 8 |  | For options of the %G_OPTION_ARG_CALLBACK kind, this flag indicates that the callback does not take any argument (like a %G_OPTION_ARG_NONE option)... |
| noalias | 64 |  | This flag turns off the automatic conflict resolution which prefixes long option names with `groupname-` if there is a conflict. This option should... |
| none | 0 |  | No flags. Since: 2.42. |
| optional_arg | 32 |  | For options of the %G_OPTION_ARG_CALLBACK kind, this flag indicates that the argument supply is optional. If no argument is given then data of %GOp... |
| reverse | 4 |  | For options of the %G_OPTION_ARG_NONE kind, this flag indicates that the sense of the option is reversed. i.e. %FALSE will be stored into the argum... |

### GLib.RegexCompileFlags

C type: `GRegexCompileFlags`

Flags specifying compile-time options.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| anchored | 16 |  | The pattern is forced to be "anchored", that is, it is constrained to match only at the first matching point in the string that is being searched. ... |
| bsr_anycrlf | 8388608 |  | Usually any newline character or character sequence is recognised. If this option is set, then "\R" only recognizes the newline characters '\r', '\... |
| caseless | 1 |  | Letters in the pattern match both upper- and lowercase letters. This option can be changed within a pattern by a "(?i)" option setting. |
| default | 0 |  | No special options set. Since: 2.74 |
| dollar_endonly | 32 |  | A dollar metacharacter ("$") in the pattern matches only at the end of the string. Without this option, a dollar also matches immediately before th... |
| dotall | 4 |  | A dot metacharacter (".") in the pattern matches all characters, including newlines. Without it, newlines are excluded. This option can be changed ... |
| dupnames | 524288 |  | Names used to identify capturing subpatterns need not be unique. This can be helpful for certain types of pattern when it is known that only one in... |
| extended | 8 |  | Whitespace data characters in the pattern are totally ignored except when escaped or inside a character class. Whitespace does not include the VT c... |
| firstline | 262144 |  | Limits an unanchored pattern to match before (or at) the first newline. Since: 2.34 |
| javascript_compat | 33554432 |  | Changes behaviour so that it is compatible with JavaScript rather than PCRE. Since GLib 2.74 this is no longer supported, as libpcre2 does not supp... |
| multiline | 2 |  | By default, GRegex treats the strings as consisting of a single line of characters (even if it actually contains newlines). The "start of line" met... |
| newline_anycrlf | 5242880 |  | Usually any newline character or character sequence is recognized. If this option is set, the only recognized newline character sequences are '\r',... |
| newline_cr | 1048576 |  | Usually any newline character or character sequence is recognized. If this option is set, the only recognized newline character is '\r'. |
| newline_crlf | 3145728 |  | Usually any newline character or character sequence is recognized. If this option is set, the only recognized newline character sequence is '\r\n'. |
| newline_lf | 2097152 |  | Usually any newline character or character sequence is recognized. If this option is set, the only recognized newline character is '\n'. |
| no_auto_capture | 4096 |  | Disables the use of numbered capturing parentheses in the pattern. Any opening parenthesis that is not followed by "?" behaves as if it were follow... |
| optimize | 8192 |  | Since 2.74 and the port to pcre2, requests JIT compilation, which, if the just-in-time compiler is available, further processes a compiled pattern ... |
| raw | 2048 |  | Usually strings must be valid UTF-8 strings, using this flag they are considered as a raw sequence of bytes. |
| ungreedy | 512 |  | Inverts the "greediness" of the quantifiers so that they are not greedy by default, but become greedy if followed by "?". It can also be set by a "... |

### GLib.RegexMatchFlags

C type: `GRegexMatchFlags`

Flags specifying match-time options.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| anchored | 16 |  | The pattern is forced to be "anchored", that is, it is constrained to match only at the first matching point in the string that is being searched. ... |
| bsr_any | 16777216 |  | Overrides the newline definition for "\R" set when creating a new #GRegex; any Unicode newline character or character sequence are recognized as a ... |
| bsr_anycrlf | 8388608 |  | Overrides the newline definition for "\R" set when creating a new #GRegex; only '\r', '\n', or '\r\n' character sequences are recognized as a newli... |
| default | 0 |  | No special options set. Since: 2.74 |
| newline_any | 4194304 |  | Overrides the newline definition set when creating a new #GRegex, any Unicode newline sequence is recognised as a newline. These are '\r', '\n' and... |
| newline_anycrlf | 5242880 |  | Overrides the newline definition set when creating a new #GRegex; any '\r', '\n', or '\r\n' character sequence is recognized as a newline. Since: 2.34 |
| newline_cr | 1048576 |  | Overrides the newline definition set when creating a new #GRegex, setting the '\r' character as line terminator. |
| newline_crlf | 3145728 |  | Overrides the newline definition set when creating a new #GRegex, setting the '\r\n' characters sequence as line terminator. |
| newline_lf | 2097152 |  | Overrides the newline definition set when creating a new #GRegex, setting the '\n' character as line terminator. |
| notbol | 128 |  | Specifies that first character of the string is not the beginning of a line, so the circumflex metacharacter should not match before it. Setting th... |
| notempty | 1024 |  | An empty string is not considered to be a valid match if this option is set. If there are alternatives in the pattern, they are tried. If all the a... |
| notempty_atstart | 268435456 |  | Like %G_REGEX_MATCH_NOTEMPTY, but only applied to the start of the matched string. For anchored patterns this can only happen for pattern containin... |
| noteol | 256 |  | Specifies that the end of the subject string is not the end of a line, so the dollar metacharacter should not match it nor (except in multiline mod... |
| partial | 32768 |  | Turns on the partial matching feature, for more documentation on partial matching see g_match_info_is_partial_match(). |
| partial_hard | 134217728 |  | Turns on the partial matching feature. In contrast to to %G_REGEX_MATCH_PARTIAL_SOFT, this stops matching as soon as a partial match is found, with... |
| partial_soft | 32768 |  | An alias for %G_REGEX_MATCH_PARTIAL. Since: 2.34 |

### GLib.SpawnFlags

C type: `GSpawnFlags`

Flags passed to g_spawn_sync(), g_spawn_async() and g_spawn_async_with_pipes().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| child_inherits_stderr | 1024 |  | The child will inherit the parent's standard error. |
| child_inherits_stdin | 32 |  | the child will inherit the parent's standard input (by default, the child's standard input is attached to `/dev/null`). |
| child_inherits_stdout | 512 |  | The child will inherit the parent's standard output. |
| cloexec_pipes | 256 |  | create all pipes with the `O_CLOEXEC` flag set. Since: 2.40 |
| default | 0 |  | no flags, default behaviour |
| do_not_reap_child | 2 |  | the child will not be automatically reaped; you must use g_child_watch_add() yourself (or call waitpid() or handle `SIGCHLD` yourself), or the chil... |
| file_and_argv_zero | 64 |  | the first element of `argv` is the file to execute, while the remaining elements are the actual argument vector to pass to the file. Normally g_spa... |
| leave_descriptors_open | 1 |  | the parent's open file descriptors will be inherited by the child; otherwise all descriptors except stdin, stdout and stderr will be closed before ... |
| search_path | 4 |  | `argv[0]` need not be an absolute path, it will be looked for in the user's `PATH`. |
| search_path_from_envp | 128 |  | if `argv[0]` is not an absolute path, it will be looked for in the `PATH` from the passed child environment. Since: 2.34 |
| stderr_to_dev_null | 16 |  | the child's standard error will be discarded. |
| stdin_from_dev_null | 2048 |  | The child's standard input is attached to `/dev/null`. |
| stdout_to_dev_null | 8 |  | the child's standard output will be discarded, instead of going to the same location as the parent's standard output. |

### GLib.TestSubprocessFlags

C type: `GTestSubprocessFlags`

Flags to pass to g_test_trap_subprocess() to control input and output. Note that in contrast with g_test_trap_fork(), the default is to not show st...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| default | 0 |  | Default behaviour. Since: 2.74 |
| inherit_stderr | 4 |  | If this flag is given, the child process will inherit the parent's stderr. Otherwise, the child's stderr will not be visible, but it will be captur... |
| inherit_stdin | 1 |  | If this flag is given, the child process will inherit the parent's stdin. Otherwise, the child's stdin is redirected to `/dev/null`. |
| inherit_stdout | 2 |  | If this flag is given, the child process will inherit the parent's stdout. Otherwise, the child's stdout will not be visible, but it will be captur... |

### GLib.TestTrapFlags

C type: `GTestTrapFlags`

Test traps are guards around forked tests. These flags determine what traps to set.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| default | 0 |  | Default behaviour. Since: 2.74 |
| inherit_stdin | 512 |  | If this flag is given, stdin of the child process is shared with stdin of its parent process. It is redirected to `/dev/null` otherwise. |
| silence_stderr | 256 |  | Redirect stderr of the test child to `/dev/null` so it cannot be observed on the console during test runs. The actual output is still captured thou... |
| silence_stdout | 128 |  | Redirect stdout of the test child to `/dev/null` so it cannot be observed on the console during test runs. The actual output is still captured thou... |

### GLib.TraverseFlags

C type: `GTraverseFlags`

Specifies which nodes are visited during several of the tree functions, including g_node_traverse() and g_node_find().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all | 3 |  | all nodes should be visited. |
| leafs | 1 |  | identical to %G_TRAVERSE_LEAVES. |
| leaves | 1 |  | only leaf nodes should be visited. This name has been introduced in 2.6, for older version use %G_TRAVERSE_LEAFS. |
| mask | 3 |  | a mask of all traverse flags. |
| non_leafs | 2 |  | identical to %G_TRAVERSE_NON_LEAVES. |
| non_leaves | 2 |  | only non-leaf nodes should be visited. This name has been introduced in 2.6, for older version use %G_TRAVERSE_NON_LEAFS. |

### GLib.UriFlags

C type: `GUriFlags`

Flags that describe a URI. When parsing a URI, if you need to choose different flags based on the type of URI, you can use g_uri_peek_scheme() on t...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| encoded | 8 |  | When parsing a URI, this indicates that `%`-encoded characters in the userinfo, path, query, and fragment fields should not be decoded. (And likewi... |
| encoded_fragment | 128 |  | Same as %G_URI_FLAGS_ENCODED, for the fragment only. |
| encoded_path | 64 |  | Same as %G_URI_FLAGS_ENCODED, for the path only. |
| encoded_query | 32 |  | Same as %G_URI_FLAGS_ENCODED, for the query field only. |
| has_auth_params | 4 |  | The userinfo may contain additional authentication-related parameters, which will be separated from the username and/or password by `;`. |
| has_password | 2 |  | The userinfo field may contain a password, which will be separated from the username by `:`. |
| non_dns | 16 |  | The host component should not be assumed to be a DNS hostname or IP address (for example, for `smb` URIs with NetBIOS hostnames). |
| none | 0 |  | No flags set. |
| parse_relaxed | 1 |  | Parse the URI more relaxedly than the RFC 3986 grammar specifies, fixing up or ignoring common mistakes in URIs coming from external sources. This ... |
| scheme_normalize | 256 |  | A scheme-based normalization will be applied. For example, when parsing an HTTP URI changing omitted path to `/` and omitted port to `80`; and when... |

### GLib.UriHideFlags

C type: `GUriHideFlags`

Flags describing what parts of the URI to hide in g_uri_to_string_partial(). Note that %G_URI_HIDE_PASSWORD and %G_URI_HIDE_AUTH_PARAMS will only w...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| auth_params | 4 |  | Hide the auth_params. |
| fragment | 16 |  | Hide the fragment. |
| none | 0 |  | No flags set. |
| password | 2 |  | Hide the password. |
| query | 8 |  | Hide the query. |
| userinfo | 1 |  | Hide the userinfo. |

### GLib.UriParamsFlags

C type: `GUriParamsFlags`

Flags modifying the way parameters are handled by g_uri_parse_params() and #GUriParamsIter.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| case_insensitive | 1 |  | Parameter names are case insensitive. |
| none | 0 |  | No flags set. |
| parse_relaxed | 4 |  | See %G_URI_FLAGS_PARSE_RELAXED. |
| www_form | 2 |  | Replace `+` with space character. Only useful for URLs on the web, using the `https` or `http` schemas. |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Allocator |  | 0 | 0 | 2 |  |
| Array |  | 0 | 0 | 21 | Contains the public fields of a GArray. |
| AsyncQueue |  | 0 | 0 | 28 | An opaque data structure which represents an asynchronous queue. It should only be accessed through the `g_async_queue_*` functions. |
| BookmarkFile |  | 0 | 0 | 49 | `GBookmarkFile` lets you parse, edit or create files containing bookmarks. Bookmarks refer to a URI, along with some meta-data about the resource p... |
| ByteArray |  | 0 | 0 | 16 | Contains the public fields of a GByteArray. |
| Bytes |  | 0 | 0 | 15 | A simple refcounted data type representing an immutable sequence of zero or more bytes from an unspecified origin. The purpose of a #GBytes is to k... |
| Cache |  | 0 | 0 | 6 | A `GCache` allows sharing of complex data structures, in order to save system resources. `GCache` uses keys and values. A `GCache` key describes th... |
| Checksum |  | 0 | 0 | 8 | GLib provides a generic API for computing checksums (or ???digests???) for a sequence of arbitrary bytes, using various hashing algorithms like MD5... |
| Completion |  | 0 | 0 | 8 | `GCompletion` provides support for automatic completion of a string using any group of target strings. It is typically used for file name completio... |
| Cond |  | 0 | 0 | 9 | The #GCond struct is an opaque data structure that represents a condition. Threads can block on a #GCond if they find a certain condition to be fal... |
| Data |  | 0 | 0 | 0 | An opaque data structure that represents a keyed data list. See also: Keyed data lists. |
| Date |  | 0 | 0 | 49 | `GDate` is a struct for calendrical calculations. The `GDate` data structure represents a day between January 1, Year 1, and sometime a few thousan... |
| DateTime |  | 0 | 0 | 53 | `GDateTime` is a structure that combines a Gregorian date and time into a single structure. `GDateTime` provides many conversion and methods to man... |
| DebugKey |  | 0 | 0 | 0 | Associates a string with a bit flag. Used in g_parse_debug_string(). |
| Dir |  | 0 | 0 | 7 | An opaque structure representing an opened directory. |
| Error |  | 0 | 0 | 8 | The `GError` structure contains information about an error that has occurred. |
| HashTable |  | 0 | 0 | 29 | The #GHashTable struct is an opaque data structure to represent a [Hash Table][glib-Hash-Tables]. It should only be accessed via the following func... |
| HashTableIter |  | 0 | 0 | 6 | A GHashTableIter structure represents an iterator that can be used to iterate over the elements of a #GHashTable. GHashTableIter structures are typ... |
| Hmac |  | 0 | 0 | 7 | HMACs should be used when producing a cookie or hash based on data and a key. Simple mechanisms for using SHA1 and other algorithms to digest a key... |
| Hook |  | 0 | 0 | 17 | The #GHook struct represents a single hook function in a #GHookList. |
| HookList |  | 0 | 0 | 6 | The #GHookList struct represents a list of hook functions. |
| IConv |  | 0 | 0 | 3 | The GIConv struct wraps an iconv() conversion descriptor. It contains private data and should only be accessed using the following functions. |
| IOChannel |  | 0 | 0 | 35 | The `GIOChannel` data type aims to provide a portable method for using file descriptors, pipes, and sockets, and integrating them into the main eve... |
| IOFuncs |  | 0 | 0 | 0 | A table of functions used to handle different types of #GIOChannel in a generic way. |
| KeyFile |  | 0 | 0 | 50 | `GKeyFile` parses .ini-like config files. `GKeyFile` lets you parse, edit or create files containing groups of key-value pairs, which we call "key ... |
| List |  | 0 | 0 | 34 | The #GList struct is used for each element in a doubly-linked list. |
| LogField |  | 0 | 0 | 0 | Structure representing a single field in a structured log entry. See g_log_structured() for details. Log fields may contain arbitrary values, inclu... |
| MainContext |  | 0 | 0 | 29 | The `GMainContext` struct is an opaque data type representing a set of sources to be handled in a main loop. |
| MainLoop |  | 0 | 0 | 7 | The `GMainLoop` struct is an opaque data type representing the main event loop of a GLib or GTK application. |
| MappedFile |  | 0 | 0 | 8 | The #GMappedFile represents a file mapping created with g_mapped_file_new(). It has only private members and should not be accessed directly. |
| MarkupParseContext |  | 0 | 0 | 12 | A parse context is used to parse a stream of bytes that you expect to contain marked-up text. See g_markup_parse_context_new(), #GMarkupParser, and... |
| MarkupParser |  | 0 | 0 | 0 | Any of the fields in #GMarkupParser can be %NULL, in which case they will be ignored. Except for the @error function, any of these callbacks can se... |
| MatchInfo |  | 0 | 0 | 15 | A GMatchInfo is an opaque struct used to return information about matches. |
| MemChunk |  | 0 | 0 | 9 |  |
| MemVTable |  | 0 | 0 | 0 | A set of functions used to perform memory allocation. The same #GMemVTable must be used for all allocations in the same program; a call to g_mem_se... |
| mpn |  | 0 | 0 | 0 |  |
| mpn |  | 0 | 0 | 0 |  |
| Node |  | 0 | 0 | 28 | The #GNode struct represents one node in a [n-ary tree][glib-N-ary-Trees]. |
| Once |  | 0 | 0 | 6 | A #GOnce struct controls a one-time initialization function. Any one-time initialization function must have its own unique #GOnce struct. |
| OptionContext |  | 0 | 0 | 21 | A `GOptionContext` struct defines which options are accepted by the commandline option parser. The struct has only private fields and should not be... |
| OptionEntry |  | 0 | 0 | 0 | A GOptionEntry struct defines a single option. To have an effect, they must be added to a #GOptionGroup with g_option_context_add_main_entries() or... |
| OptionGroup |  | 0 | 0 | 9 | A `GOptionGroup` struct defines the options in a single group. The struct has only private fields and should not be directly accessed. All options ... |
| PathBuf |  | 0 | 0 | 15 | `GPathBuf` is a helper type that allows you to easily build paths from individual elements, using the platform specific conventions for path separa... |
| PatternSpec |  | 0 | 0 | 6 | A `GPatternSpec` struct is the 'compiled' form of a glob-style pattern. The [func@GLib.pattern_match_simple] and [method@GLib.PatternSpec.match] fu... |
| PollFD |  | 0 | 0 | 0 | Represents a file descriptor, which events to poll for, and which events occurred. |
| Private |  | 0 | 0 | 4 | The #GPrivate struct is an opaque data structure to represent a thread-local data key. It is approximately equivalent to the pthread_setspecific()/... |
| PtrArray |  | 0 | 0 | 35 | Contains the public fields of a pointer array. |
| Queue |  | 0 | 0 | 43 | Contains the public fields of a [Queue][glib-Double-ended-Queues]. |
| Rand |  | 0 | 0 | 11 | The GRand struct is an opaque data structure. It should only be accessed through the g_rand_* functions. |
| RecMutex |  | 0 | 0 | 5 | The GRecMutex struct is an opaque data structure to represent a recursive mutex. It is similar to a #GMutex with the difference that it is possible... |
| Regex |  | 0 | 0 | 26 | A `GRegex` is the "compiled" form of a regular expression pattern. `GRegex` implements regular expression pattern matching using syntax and semanti... |
| Relation |  | 0 | 0 | 9 | A `GRelation` is a table of data which can be indexed on any number of fields, rather like simple database tables. A `GRelation` contains a number ... |
| RWLock |  | 0 | 0 | 8 | The GRWLock struct is an opaque data structure to represent a reader-writer lock. It is similar to a #GMutex in that it allows multiple threads to ... |
| Scanner |  | 0 | 0 | 21 | `GScanner` provides a general-purpose lexical scanner. You should set @input_name after creating the scanner, since it is used by the default messa... |
| ScannerConfig |  | 0 | 0 | 0 | Specifies the #GScanner parser configuration. Most settings can be changed during the parsing phase and will affect the lexical parsing of the next... |
| Sequence |  | 0 | 0 | 30 | The #GSequence struct is an opaque data type representing a [sequence][glib-Sequences] data type. |
| SequenceIter |  | 0 | 0 | 8 | The #GSequenceIter struct is an opaque data type representing an iterator pointing into a #GSequence. |
| SList |  | 0 | 0 | 31 | The #GSList struct is used for each element in the singly-linked list. |
| Source |  | 0 | 0 | 35 | The `GSource` struct is an opaque data type representing an event source. |
| SourceCallbackFuncs |  | 0 | 0 | 0 | The `GSourceCallbackFuncs` struct contains functions for managing callback objects. |
| SourceFuncs |  | 0 | 0 | 0 | The `GSourceFuncs` struct contains a table of functions used to handle event sources in a generic manner. For idle sources, the prepare and check f... |
| SourcePrivate |  | 0 | 0 | 0 |  |
| StatBuf |  | 0 | 0 | 0 | A type corresponding to the appropriate struct type for the stat() system call, depending on the platform and/or compiler being used. See g_stat() ... |
| StaticMutex |  | 0 | 0 | 3 | A #GStaticMutex works like a #GMutex. Prior to GLib 2.32, GStaticMutex had the significant advantage that it doesn't need to be created at run-time... |
| StaticPrivate |  | 0 | 0 | 4 | A #GStaticPrivate works almost like a #GPrivate, but it has one significant advantage. It doesn't need to be created at run-time like a #GPrivate, ... |
| StaticRecMutex |  | 0 | 0 | 7 | A #GStaticRecMutex works like a #GStaticMutex, but it can be locked multiple times by one thread. If you enter it n times, you have to unlock it n ... |
| StaticRWLock |  | 0 | 0 | 8 | The #GStaticRWLock struct represents a read-write lock. A read-write lock can be used for protecting data that some portions of code only read from... |
| String |  | 0 | 0 | 37 | A `GString` is an object that handles the memory management of a C string. The emphasis of `GString` is on text, typically UTF-8. Crucially, the "s... |
| StringChunk |  | 0 | 0 | 6 | `GStringChunk` provides efficient storage of groups of strings String chunks are used to store groups of strings. Memory is allocated in blocks, an... |
| StrvBuilder |  | 0 | 0 | 8 | `GStrvBuilder` is a helper object to build a %NULL-terminated string arrays. The following example shows how to build a two element array: ```c g_a... |
| TestCase |  | 0 | 0 | 1 | An opaque structure representing a test case. |
| TestConfig |  | 0 | 0 | 0 |  |
| TestLogBuffer |  | 0 | 0 | 4 | Internal function for gtester to free test log messages, no ABI guarantees provided. |
| TestLogMsg |  | 0 | 0 | 1 | Internal function for gtester to free test log messages, no ABI guarantees provided. |
| TestSuite |  | 0 | 0 | 3 | An opaque structure representing a test suite. |
| Thread |  | 0 | 0 | 16 | The #GThread struct represents a running thread. This struct is returned by g_thread_new() or g_thread_try_new(). You can obtain the #GThread struc... |
| ThreadFunctions |  | 0 | 0 | 0 | This function table is no longer used by g_thread_init() to initialize the thread system. |
| ThreadPool |  | 0 | 0 | 16 | The `GThreadPool` struct represents a thread pool. A thread pool is useful when you wish to asynchronously fork out the execution of work and conti... |
| Timer |  | 0 | 0 | 8 | `GTimer` records a start time, and counts microseconds elapsed since that time. This is done somewhat differently on different platforms, and can b... |
| TimeVal |  | 0 | 0 | 3 | Represents a precise time, with seconds and microseconds. Similar to the struct timeval returned by the `gettimeofday()` UNIX system call. GLib is ... |
| TimeZone |  | 0 | 0 | 13 | A `GTimeZone` represents a time zone, at no particular point in time. The `GTimeZone` struct is refcounted and immutable. Each time zone has an ide... |
| TrashStack |  | 0 | 0 | 4 | A `GTrashStack` is an efficient way to keep a stack of unused allocated memory chunks. Each memory chunk is required to be large enough to hold a `... |
| Tree |  | 0 | 0 | 27 | The GTree struct is an opaque data structure representing a [balanced binary tree][glib-Balanced-Binary-Trees]. It should be accessed only by using... |
| TreeNode |  | 0 | 0 | 4 | An opaque type which identifies a specific node in a #GTree. |
| Tuples |  | 0 | 0 | 2 | The #GTuples struct is used to return records (or tuples) from the #GRelation by g_relation_select(). It only contains one public member - the numb... |
| UnixPipe |  | 0 | 0 | 0 | A Unix pipe. The advantage of this type over `int[2]` is that it can be closed automatically when it goes out of scope, using `g_auto(GUnixPipe)`, ... |
| Uri |  | 0 | 0 | 36 | The `GUri` type and related functions can be used to parse URIs into their components, and build valid URIs from individual components. Since `GUri... |
| UriParamsIter |  | 0 | 0 | 2 | Many URI schemes include one or more attribute/value pairs as part of the URI value. For example `scheme://server/path?query=string&is=there` has t... |
| Variant |  | 0 | 0 | 91 | `GVariant` is a variant datatype; it can contain one or more values along with information about the type of the values. A `GVariant` may contain s... |
| VariantBuilder |  | 0 | 0 | 0 | A utility type for constructing container-type #GVariant instances. This is an opaque structure and may only be accessed using the following functi... |
| VariantDict |  | 0 | 0 | 0 | #GVariantDict is a mutable interface to #GVariant dictionaries. It can be used for doing a sequence of dictionary lookups in an efficient way on an... |
| VariantIter |  | 0 | 0 | 7 | #GVariantIter is an opaque data structure and can only be accessed using the following functions. |
| VariantType |  | 0 | 0 | 31 | A type in the [type@GLib.Variant] type system. This section introduces the [type@GLib.Variant] type system. It is based, in large part, on the D-Bu... |

### GLib.Allocator

C type: `GAllocator`

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(name: utf8, n_preallocs: guint) -> Allocator` | g_allocator_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free | `Allocator.free() -> none` | g_allocator_free |  |  |

### GLib.Array

GType: `GArray` ?? C type: `GArray`

Contains the public fields of a GArray.

#### Fields

| Field | Type |
| --- | --- |
| data | utf8 |
| len | guint |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_vals | `append_vals(array: gpointer, data: gpointer, len: guint) -> gpointer` | g_array_append_vals |  | Adds @len elements onto the end of the array. |
| binary_search | `binary_search(array: gpointer, target: gpointer?, compare_func: CompareFunc, out_match_index: out guint?) -> gboolean` | g_array_binary_search | 2.62 | Checks whether @target exists in @array by performing a binary search based on the given comparison function @compare_func which get pointers to it... |
| copy | `copy(array: gpointer) -> gpointer` | g_array_copy | 2.62 | Create a shallow copy of a #GArray. If the array elements consist of pointers to data, the pointers are copied but the actual data is not. |
| free | `free(array: gpointer, free_segment: gboolean) -> utf8` | g_array_free |  | Frees the memory allocated for the #GArray. If @free_segment is %TRUE it frees the memory block holding the elements as well. Pass %FALSE if you wa... |
| get_element_size | `get_element_size(array: gpointer) -> guint` | g_array_get_element_size | 2.22 | Gets the size of the elements in @array. |
| insert_vals | `insert_vals(array: gpointer, index_: guint, data: gpointer?, len: guint) -> gpointer` | g_array_insert_vals |  | Inserts @len elements into a #GArray at the given index. If @index_ is greater than the array???s current length, the array is expanded. The elemen... |
| new | `new(zero_terminated: gboolean, clear_: gboolean, element_size: guint) -> gpointer` | g_array_new |  | Creates a new #GArray with a reference count of 1. |
| new_take | `new_take(data: gpointer?, len: gsize, clear: gboolean, element_size: gsize) -> gpointer` | g_array_new_take | 2.76 | Creates a new #GArray with @data as array data, @len as length and a reference count of 1. This avoids having to copy the data manually, when it ca... |
| new_take_zero_terminated | `new_take_zero_terminated(data: gpointer, clear: gboolean, element_size: gsize) -> gpointer` | g_array_new_take_zero_terminated | 2.76 | Creates a new #GArray with @data as array data, computing the length of it and setting the reference count to 1. This avoids having to copy the dat... |
| prepend_vals | `prepend_vals(array: gpointer, data: gpointer?, len: guint) -> gpointer` | g_array_prepend_vals |  | Adds @len elements onto the start of the array. @data may be %NULL if (and only if) @len is zero. If @len is zero, this function is a no-op. This o... |
| ref | `ref(array: gpointer) -> gpointer` | g_array_ref | 2.22 | Atomically increments the reference count of @array by one. This function is thread-safe and may be called from any thread. |
| remove_index | `remove_index(array: gpointer, index_: guint) -> gpointer` | g_array_remove_index |  | Removes the element at the given index from a #GArray. The following elements are moved down one place. |
| remove_index_fast | `remove_index_fast(array: gpointer, index_: guint) -> gpointer` | g_array_remove_index_fast |  | Removes the element at the given index from a #GArray. The last element in the array is used to fill in the space, so this function does not preser... |
| remove_range | `remove_range(array: gpointer, index_: guint, length: guint) -> gpointer` | g_array_remove_range | 2.4 | Removes the given number of elements starting at the given index from a #GArray. The following elements are moved to close the gap. |
| set_clear_func | `set_clear_func(array: gpointer, clear_func: DestroyNotify) -> none` | g_array_set_clear_func | 2.32 | Sets a function to clear an element of @array. The @clear_func will be called when an element in the array data segment is removed and when the arr... |
| set_size | `set_size(array: gpointer, length: guint) -> gpointer` | g_array_set_size |  | Sets the size of the array, expanding it if necessary. If the array was created with @clear_ set to %TRUE, the new elements are set to 0. |
| sized_new | `sized_new(zero_terminated: gboolean, clear_: gboolean, element_size: guint, reserved_size: guint) -> gpointer` | g_array_sized_new |  | Creates a new #GArray with @reserved_size elements preallocated and a reference count of 1. This avoids frequent reallocation, if you are going to ... |
| sort | `sort(array: gpointer, compare_func: CompareFunc) -> none` | g_array_sort |  | Sorts a #GArray using @compare_func which should be a qsort()-style comparison function (returns less than zero for first arg is less than second a... |
| sort_with_data | `sort_with_data(array: gpointer, compare_func: CompareDataFunc, user_data: gpointer?) -> none` | g_array_sort_with_data |  | Like g_array_sort(), but the comparison function receives an extra user data argument. This is guaranteed to be a stable sort since version 2.32. T... |
| steal | `steal(array: gpointer, len: out gsize?) -> gpointer` | g_array_steal | 2.64 | Frees the data in the array and resets the size to zero, while the underlying array is preserved for use elsewhere and returned to the caller. If t... |
| unref | `unref(array: gpointer) -> none` | g_array_unref | 2.22 | Atomically decrements the reference count of @array by one. If the reference count drops to 0, all memory allocated by the array is released. This ... |

### GLib.AsyncQueue

C type: `GAsyncQueue`

An opaque data structure which represents an asynchronous queue. It should only be accessed through the `g_async_queue_*` functions.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new() -> AsyncQueue` | g_async_queue_new |  | Creates a new asynchronous queue. |
| new_full | `new_full(item_free_func: DestroyNotify?) -> AsyncQueue` | g_async_queue_new_full | 2.16 | Creates a new asynchronous queue and sets up a destroy notify function that is used to free any remaining queue items when the queue is destroyed a... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| length | `AsyncQueue.length() -> gint` | g_async_queue_length |  | Returns the length of the queue. Actually this function returns the number of data items in the queue minus the number of waiting threads, so a neg... |
| length_unlocked | `AsyncQueue.length_unlocked() -> gint` | g_async_queue_length_unlocked |  | Returns the length of the queue. Actually this function returns the number of data items in the queue minus the number of waiting threads, so a neg... |
| lock | `AsyncQueue.lock() -> none` | g_async_queue_lock |  | Acquires the @queue's lock. If another thread is already holding the lock, this call will block until the lock becomes available. Call g_async_queu... |
| pop | `AsyncQueue.pop() -> gpointer` | g_async_queue_pop |  | Pops data from the @queue. If @queue is empty, this function blocks until data becomes available. |
| pop_unlocked | `AsyncQueue.pop_unlocked() -> gpointer` | g_async_queue_pop_unlocked |  | Pops data from the @queue. If @queue is empty, this function blocks until data becomes available. This function must be called while holding the @q... |
| push | `AsyncQueue.push(data: gpointer) -> none` | g_async_queue_push |  | Pushes the @data into the @queue. The @data parameter must not be %NULL. |
| push_front | `AsyncQueue.push_front(item: gpointer) -> none` | g_async_queue_push_front | 2.46 | Pushes the @item into the @queue. @item must not be %NULL. In contrast to g_async_queue_push(), this function pushes the new item ahead of the item... |
| push_front_unlocked | `AsyncQueue.push_front_unlocked(item: gpointer) -> none` | g_async_queue_push_front_unlocked | 2.46 | Pushes the @item into the @queue. @item must not be %NULL. In contrast to g_async_queue_push_unlocked(), this function pushes the new item ahead of... |
| push_sorted | `AsyncQueue.push_sorted(data: gpointer, func: CompareDataFunc, user_data: gpointer?) -> none` | g_async_queue_push_sorted | 2.10 | Inserts @data into @queue using @func to determine the new position. This function requires that the @queue is sorted before pushing on new element... |
| push_sorted_unlocked | `AsyncQueue.push_sorted_unlocked(data: gpointer?, func: CompareDataFunc, user_data: gpointer?) -> none` | g_async_queue_push_sorted_unlocked | 2.10 | Inserts @data into @queue using @func to determine the new position. The sort function @func is passed two elements of the @queue. It should return... |
| push_unlocked | `AsyncQueue.push_unlocked(data: gpointer) -> none` | g_async_queue_push_unlocked |  | Pushes the @data into the @queue. The @data parameter must not be %NULL. This function must be called while holding the @queue's lock. |
| ref | `AsyncQueue.ref() -> AsyncQueue` | g_async_queue_ref |  | Increases the reference count of the asynchronous @queue by 1. You do not need to hold the lock to call this function. |
| ref_unlocked | `AsyncQueue.ref_unlocked() -> none` | g_async_queue_ref_unlocked |  | Increases the reference count of the asynchronous @queue by 1. |
| remove | `AsyncQueue.remove(item: gpointer) -> gboolean` | g_async_queue_remove | 2.46 | Remove an item from the queue. |
| remove_unlocked | `AsyncQueue.remove_unlocked(item: gpointer?) -> gboolean` | g_async_queue_remove_unlocked | 2.46 | Remove an item from the queue. This function must be called while holding the @queue's lock. |
| sort | `AsyncQueue.sort(func: CompareDataFunc, user_data: gpointer?) -> none` | g_async_queue_sort | 2.10 | Sorts @queue using @func. The sort function @func is passed two elements of the @queue. It should return 0 if they are equal, a negative value if t... |
| sort_unlocked | `AsyncQueue.sort_unlocked(func: CompareDataFunc, user_data: gpointer?) -> none` | g_async_queue_sort_unlocked | 2.10 | Sorts @queue using @func. The sort function @func is passed two elements of the @queue. It should return 0 if they are equal, a negative value if t... |
| timed_pop | `AsyncQueue.timed_pop(end_time: TimeVal) -> gpointer` | g_async_queue_timed_pop |  | Pops data from the @queue. If the queue is empty, blocks until @end_time or until data becomes available. If no data is received before @end_time, ... |
| timed_pop_unlocked | `AsyncQueue.timed_pop_unlocked(end_time: TimeVal) -> gpointer` | g_async_queue_timed_pop_unlocked |  | Pops data from the @queue. If the queue is empty, blocks until @end_time or until data becomes available. If no data is received before @end_time, ... |
| timeout_pop | `AsyncQueue.timeout_pop(timeout: guint64) -> gpointer` | g_async_queue_timeout_pop |  | Pops data from the @queue. If the queue is empty, blocks for @timeout microseconds, or until data becomes available. If no data is received before ... |
| timeout_pop_unlocked | `AsyncQueue.timeout_pop_unlocked(timeout: guint64) -> gpointer` | g_async_queue_timeout_pop_unlocked |  | Pops data from the @queue. If the queue is empty, blocks for @timeout microseconds, or until data becomes available. If no data is received before ... |
| try_pop | `AsyncQueue.try_pop() -> gpointer` | g_async_queue_try_pop |  | Tries to pop data from the @queue. If no data is available, %NULL is returned. |
| try_pop_unlocked | `AsyncQueue.try_pop_unlocked() -> gpointer` | g_async_queue_try_pop_unlocked |  | Tries to pop data from the @queue. If no data is available, %NULL is returned. This function must be called while holding the @queue's lock. |
| unlock | `AsyncQueue.unlock() -> none` | g_async_queue_unlock |  | Releases the queue's lock. Calling this function when you have not acquired the with g_async_queue_lock() leads to undefined behaviour. |
| unref | `AsyncQueue.unref() -> none` | g_async_queue_unref |  | Decreases the reference count of the asynchronous @queue by 1. If the reference count went to 0, the @queue will be destroyed and the memory alloca... |
| unref_and_unlock | `AsyncQueue.unref_and_unlock() -> none` | g_async_queue_unref_and_unlock |  | Decreases the reference count of the asynchronous @queue by 1 and releases the lock. This function must be called while holding the @queue's lock. ... |

### GLib.BookmarkFile

GType: `GBookmarkFile` ?? C type: `GBookmarkFile`

`GBookmarkFile` lets you parse, edit or create files containing bookmarks. Bookmarks refer to a URI, along with some meta-data about the resource p...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `BookmarkFile.new() -> BookmarkFile` | g_bookmark_file_new | 2.12 | Creates a new empty #GBookmarkFile object. Use g_bookmark_file_load_from_file(), g_bookmark_file_load_from_data() or g_bookmark_file_load_from_data... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| error_quark | `error_quark() -> Quark` | g_bookmark_file_error_quark |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_application | `BookmarkFile.add_application(uri: utf8, name: utf8?, exec: utf8?) -> none` | g_bookmark_file_add_application | 2.12 | Adds the application with @name and @exec to the list of applications that have registered a bookmark for @uri into @bookmark. Every bookmark insid... |
| add_group | `BookmarkFile.add_group(uri: utf8, group: utf8) -> none` | g_bookmark_file_add_group | 2.12 | Adds @group to the list of groups to which the bookmark for @uri belongs to. If no bookmark for @uri is found then it is created. |
| copy | `BookmarkFile.copy() -> BookmarkFile` | g_bookmark_file_copy | 2.76 | Deeply copies a @bookmark #GBookmarkFile object to a new one. |
| free | `BookmarkFile.free() -> none` | g_bookmark_file_free | 2.12 | Frees a #GBookmarkFile. |
| get_added | `BookmarkFile.get_added(uri: utf8) -> time_t throws` | g_bookmark_file_get_added | 2.12 | Gets the time the bookmark for @uri was added to @bookmark In the event the URI cannot be found, -1 is returned and @error is set to %G_BOOKMARK_FI... |
| get_added_date_time | `BookmarkFile.get_added_date_time(uri: utf8) -> DateTime throws` | g_bookmark_file_get_added_date_time | 2.66 | Gets the time the bookmark for @uri was added to @bookmark In the event the URI cannot be found, %NULL is returned and @error is set to %G_BOOKMARK... |
| get_app_info | `BookmarkFile.get_app_info(uri: utf8, name: utf8, exec: out utf8?, count: out guint?, stamp: out time_t?) -> gboolean throws` | g_bookmark_file_get_app_info | 2.12 | Gets the registration information of @app_name for the bookmark for @uri. See g_bookmark_file_set_application_info() for more information about the... |
| get_application_info | `BookmarkFile.get_application_info(uri: utf8, name: utf8, exec: out utf8?, count: out guint?, stamp: out DateTime?) -> gboolean throws` | g_bookmark_file_get_application_info | 2.66 | Gets the registration information of @app_name for the bookmark for @uri. See g_bookmark_file_set_application_info() for more information about the... |
| get_applications | `BookmarkFile.get_applications(uri: utf8, length: out gsize?) -> utf8 throws` | g_bookmark_file_get_applications | 2.12 | Retrieves the names of the applications that have registered the bookmark for @uri. In the event the URI cannot be found, %NULL is returned and @er... |
| get_description | `BookmarkFile.get_description(uri: utf8) -> utf8 throws` | g_bookmark_file_get_description | 2.12 | Retrieves the description of the bookmark for @uri. In the event the URI cannot be found, %NULL is returned and @error is set to %G_BOOKMARK_FILE_E... |
| get_groups | `BookmarkFile.get_groups(uri: utf8, length: out gsize?) -> utf8 throws` | g_bookmark_file_get_groups | 2.12 | Retrieves the list of group names of the bookmark for @uri. In the event the URI cannot be found, %NULL is returned and @error is set to %G_BOOKMAR... |
| get_icon | `BookmarkFile.get_icon(uri: utf8, href: out utf8?, mime_type: out utf8?) -> gboolean throws` | g_bookmark_file_get_icon | 2.12 | Gets the icon of the bookmark for @uri. In the event the URI cannot be found, %FALSE is returned and @error is set to %G_BOOKMARK_FILE_ERROR_URI_NO... |
| get_is_private | `BookmarkFile.get_is_private(uri: utf8) -> gboolean throws` | g_bookmark_file_get_is_private | 2.12 | Gets whether the private flag of the bookmark for @uri is set. In the event the URI cannot be found, %FALSE is returned and @error is set to %G_BOO... |
| get_mime_type | `BookmarkFile.get_mime_type(uri: utf8) -> utf8 throws` | g_bookmark_file_get_mime_type | 2.12 | Retrieves the MIME type of the resource pointed by @uri. In the event the URI cannot be found, %NULL is returned and @error is set to %G_BOOKMARK_F... |
| get_modified | `BookmarkFile.get_modified(uri: utf8) -> time_t throws` | g_bookmark_file_get_modified | 2.12 | Gets the time when the bookmark for @uri was last modified. In the event the URI cannot be found, -1 is returned and @error is set to %G_BOOKMARK_F... |
| get_modified_date_time | `BookmarkFile.get_modified_date_time(uri: utf8) -> DateTime throws` | g_bookmark_file_get_modified_date_time | 2.66 | Gets the time when the bookmark for @uri was last modified. In the event the URI cannot be found, %NULL is returned and @error is set to %G_BOOKMAR... |
| get_size | `BookmarkFile.get_size() -> gint` | g_bookmark_file_get_size | 2.12 | Gets the number of bookmarks inside @bookmark. |
| get_title | `BookmarkFile.get_title(uri: utf8?) -> utf8 throws` | g_bookmark_file_get_title | 2.12 | Returns the title of the bookmark for @uri. If @uri is %NULL, the title of @bookmark is returned. In the event the URI cannot be found, %NULL is re... |
| get_uris | `BookmarkFile.get_uris(length: out gsize?) -> utf8` | g_bookmark_file_get_uris | 2.12 | Returns all URIs of the bookmarks in the bookmark file @bookmark. The array of returned URIs will be %NULL-terminated, so @length may optionally be... |
| get_visited | `BookmarkFile.get_visited(uri: utf8) -> time_t throws` | g_bookmark_file_get_visited | 2.12 | Gets the time the bookmark for @uri was last visited. In the event the URI cannot be found, -1 is returned and @error is set to %G_BOOKMARK_FILE_ER... |
| get_visited_date_time | `BookmarkFile.get_visited_date_time(uri: utf8) -> DateTime throws` | g_bookmark_file_get_visited_date_time | 2.66 | Gets the time the bookmark for @uri was last visited. In the event the URI cannot be found, %NULL is returned and @error is set to %G_BOOKMARK_FILE... |
| has_application | `BookmarkFile.has_application(uri: utf8, name: utf8) -> gboolean throws` | g_bookmark_file_has_application | 2.12 | Checks whether the bookmark for @uri inside @bookmark has been registered by application @name. In the event the URI cannot be found, %FALSE is ret... |
| has_group | `BookmarkFile.has_group(uri: utf8, group: utf8) -> gboolean throws` | g_bookmark_file_has_group | 2.12 | Checks whether @group appears in the list of groups to which the bookmark for @uri belongs to. In the event the URI cannot be found, %FALSE is retu... |
| has_item | `BookmarkFile.has_item(uri: utf8) -> gboolean` | g_bookmark_file_has_item | 2.12 | Looks whether the desktop bookmark has an item with its URI set to @uri. |
| load_from_data | `BookmarkFile.load_from_data(data: guint8, length: gsize) -> gboolean throws` | g_bookmark_file_load_from_data | 2.12 | Loads a bookmark file from memory into an empty #GBookmarkFile structure. If the object cannot be created then @error is set to a #GBookmarkFileError. |
| load_from_data_dirs | `BookmarkFile.load_from_data_dirs(file: filename, full_path: out filename?) -> gboolean throws` | g_bookmark_file_load_from_data_dirs | 2.12 | This function looks for a desktop bookmark file named @file in the paths returned from g_get_user_data_dir() and g_get_system_data_dirs(), loads th... |
| load_from_file | `BookmarkFile.load_from_file(filename: filename) -> gboolean throws` | g_bookmark_file_load_from_file | 2.12 | Loads a desktop bookmark file into an empty #GBookmarkFile structure. If the file could not be loaded then @error is set to either a #GFileError or... |
| move_item | `BookmarkFile.move_item(old_uri: utf8, new_uri: utf8?) -> gboolean throws` | g_bookmark_file_move_item | 2.12 | Changes the URI of a bookmark item from @old_uri to @new_uri. Any existing bookmark for @new_uri will be overwritten. If @new_uri is %NULL, then th... |
| remove_application | `BookmarkFile.remove_application(uri: utf8, name: utf8) -> gboolean throws` | g_bookmark_file_remove_application | 2.12 | Removes application registered with @name from the list of applications that have registered a bookmark for @uri inside @bookmark. In the event the... |
| remove_group | `BookmarkFile.remove_group(uri: utf8, group: utf8) -> gboolean throws` | g_bookmark_file_remove_group | 2.12 | Removes @group from the list of groups to which the bookmark for @uri belongs to. In the event the URI cannot be found, %FALSE is returned and @err... |
| remove_item | `BookmarkFile.remove_item(uri: utf8) -> gboolean throws` | g_bookmark_file_remove_item | 2.12 | Removes the bookmark for @uri from the bookmark file @bookmark. |
| set_added | `BookmarkFile.set_added(uri: utf8, added: time_t) -> none` | g_bookmark_file_set_added | 2.12 | Sets the time the bookmark for @uri was added into @bookmark. If no bookmark for @uri is found then it is created. |
| set_added_date_time | `BookmarkFile.set_added_date_time(uri: utf8, added: DateTime) -> none` | g_bookmark_file_set_added_date_time | 2.66 | Sets the time the bookmark for @uri was added into @bookmark. If no bookmark for @uri is found then it is created. |
| set_app_info | `BookmarkFile.set_app_info(uri: utf8, name: utf8, exec: utf8, count: gint, stamp: time_t) -> gboolean throws` | g_bookmark_file_set_app_info | 2.12 | Sets the meta-data of application @name inside the list of applications that have registered a bookmark for @uri inside @bookmark. You should rarel... |
| set_application_info | `BookmarkFile.set_application_info(uri: utf8, name: utf8, exec: utf8, count: gint, stamp: DateTime?) -> gboolean throws` | g_bookmark_file_set_application_info | 2.66 | Sets the meta-data of application @name inside the list of applications that have registered a bookmark for @uri inside @bookmark. You should rarel... |
| set_description | `BookmarkFile.set_description(uri: utf8?, description: utf8) -> none` | g_bookmark_file_set_description | 2.12 | Sets @description as the description of the bookmark for @uri. If @uri is %NULL, the description of @bookmark is set. If a bookmark for @uri cannot... |
| set_groups | `BookmarkFile.set_groups(uri: utf8, groups: utf8?, length: gsize) -> none` | g_bookmark_file_set_groups | 2.12 | Sets a list of group names for the item with URI @uri. Each previously set group name list is removed. If @uri cannot be found then an item for it ... |
| set_icon | `BookmarkFile.set_icon(uri: utf8, href: utf8?, mime_type: utf8) -> none` | g_bookmark_file_set_icon | 2.12 | Sets the icon for the bookmark for @uri. If @href is %NULL, unsets the currently set icon. @href can either be a full URL for the icon file or the ... |
| set_is_private | `BookmarkFile.set_is_private(uri: utf8, is_private: gboolean) -> none` | g_bookmark_file_set_is_private | 2.12 | Sets the private flag of the bookmark for @uri. If a bookmark for @uri cannot be found then it is created. |
| set_mime_type | `BookmarkFile.set_mime_type(uri: utf8, mime_type: utf8) -> none` | g_bookmark_file_set_mime_type | 2.12 | Sets @mime_type as the MIME type of the bookmark for @uri. If a bookmark for @uri cannot be found then it is created. |
| set_modified | `BookmarkFile.set_modified(uri: utf8, modified: time_t) -> none` | g_bookmark_file_set_modified | 2.12 | Sets the last time the bookmark for @uri was last modified. If no bookmark for @uri is found then it is created. The "modified" time should only be... |
| set_modified_date_time | `BookmarkFile.set_modified_date_time(uri: utf8, modified: DateTime) -> none` | g_bookmark_file_set_modified_date_time | 2.66 | Sets the last time the bookmark for @uri was last modified. If no bookmark for @uri is found then it is created. The "modified" time should only be... |
| set_title | `BookmarkFile.set_title(uri: utf8?, title: utf8) -> none` | g_bookmark_file_set_title | 2.12 | Sets @title as the title of the bookmark for @uri inside the bookmark file @bookmark. If @uri is %NULL, the title of @bookmark is set. If a bookmar... |
| set_visited | `BookmarkFile.set_visited(uri: utf8, visited: time_t) -> none` | g_bookmark_file_set_visited | 2.12 | Sets the time the bookmark for @uri was last visited. If no bookmark for @uri is found then it is created. The "visited" time should only be set if... |
| set_visited_date_time | `BookmarkFile.set_visited_date_time(uri: utf8, visited: DateTime) -> none` | g_bookmark_file_set_visited_date_time | 2.66 | Sets the time the bookmark for @uri was last visited. If no bookmark for @uri is found then it is created. The "visited" time should only be set if... |
| to_data | `BookmarkFile.to_data(length: out gsize?) -> guint8 throws` | g_bookmark_file_to_data | 2.12 | This function outputs @bookmark as a string. |
| to_file | `BookmarkFile.to_file(filename: filename) -> gboolean throws` | g_bookmark_file_to_file | 2.12 | This function outputs @bookmark into a file. The write process is guaranteed to be atomic by using g_file_set_contents() internally. |

### GLib.ByteArray

GType: `GByteArray` ?? C type: `GByteArray`

Contains the public fields of a GByteArray.

#### Fields

| Field | Type |
| --- | --- |
| data | guint8 |
| len | guint |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append | `append(array: guint8, data: guint8, len: guint) -> guint8` | g_byte_array_append |  | Adds the given bytes to the end of the #GByteArray. The array will grow in size automatically if necessary. |
| free | `free(array: guint8, free_segment: gboolean) -> guint8` | g_byte_array_free |  | Frees the memory allocated by the #GByteArray. If @free_segment is %TRUE it frees the actual byte data. If the reference count of @array is greater... |
| free_to_bytes | `free_to_bytes(array: guint8) -> Bytes` | g_byte_array_free_to_bytes | 2.32 | Transfers the data from the #GByteArray into a new immutable #GBytes. The #GByteArray is freed unless the reference count of @array is greater than... |
| new | `new() -> guint8` | g_byte_array_new |  | Creates a new #GByteArray with a reference count of 1. |
| new_take | `new_take(data: guint8, len: gsize) -> guint8` | g_byte_array_new_take | 2.32 | Creates a byte array containing the @data. After this call, @data belongs to the #GByteArray and may no longer be modified by the caller. The memor... |
| prepend | `prepend(array: guint8, data: guint8, len: guint) -> guint8` | g_byte_array_prepend |  | Adds the given data to the start of the #GByteArray. The array will grow in size automatically if necessary. |
| ref | `ref(array: guint8) -> guint8` | g_byte_array_ref | 2.22 | Atomically increments the reference count of @array by one. This function is thread-safe and may be called from any thread. |
| remove_index | `remove_index(array: guint8, index_: guint) -> guint8` | g_byte_array_remove_index |  | Removes the byte at the given index from a #GByteArray. The following bytes are moved down one place. |
| remove_index_fast | `remove_index_fast(array: guint8, index_: guint) -> guint8` | g_byte_array_remove_index_fast |  | Removes the byte at the given index from a #GByteArray. The last element in the array is used to fill in the space, so this function does not prese... |
| remove_range | `remove_range(array: guint8, index_: guint, length: guint) -> guint8` | g_byte_array_remove_range | 2.4 | Removes the given number of bytes starting at the given index from a #GByteArray. The following elements are moved to close the gap. |
| set_size | `set_size(array: guint8, length: guint) -> guint8` | g_byte_array_set_size |  | Sets the size of the #GByteArray, expanding it if necessary. |
| sized_new | `sized_new(reserved_size: guint) -> guint8` | g_byte_array_sized_new |  | Creates a new #GByteArray with @reserved_size bytes preallocated. This avoids frequent reallocation, if you are going to add many bytes to the arra... |
| sort | `sort(array: guint8, compare_func: CompareFunc) -> none` | g_byte_array_sort |  | Sorts a byte array, using @compare_func which should be a qsort()-style comparison function (returns less than zero for first arg is less than seco... |
| sort_with_data | `sort_with_data(array: guint8, compare_func: CompareDataFunc, user_data: gpointer?) -> none` | g_byte_array_sort_with_data |  | Like g_byte_array_sort(), but the comparison function takes an extra user data argument. |
| steal | `steal(array: guint8, len: out gsize?) -> guint8` | g_byte_array_steal | 2.64 | Frees the data in the array and resets the size to zero, while the underlying array is preserved for use elsewhere and returned to the caller. |
| unref | `unref(array: guint8) -> none` | g_byte_array_unref | 2.22 | Atomically decrements the reference count of @array by one. If the reference count drops to 0, all memory allocated by the array is released. This ... |

### GLib.Bytes

GType: `GBytes` ?? C type: `GBytes`

A simple refcounted data type representing an immutable sequence of zero or more bytes from an unspecified origin. The purpose of a #GBytes is to k...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Bytes.new(data: guint8?, size: gsize) -> Bytes` | g_bytes_new | 2.32 | Creates a new #GBytes from @data. @data is copied. If @size is 0, @data may be %NULL. |
| new_static | `Bytes.new_static(data: guint8?, size: gsize) -> Bytes` | g_bytes_new_static | 2.32 | Creates a new #GBytes from static data. @data must be static (ie: never modified or freed). It may be %NULL if @size is 0. |
| new_take | `Bytes.new_take(data: guint8?, size: gsize) -> Bytes` | g_bytes_new_take | 2.32 | Creates a new #GBytes from @data. After this call, @data belongs to the #GBytes and may no longer be modified by the caller. The memory of @data ha... |
| new_with_free_func | `Bytes.new_with_free_func(data: guint8?, size: gsize, free_func: DestroyNotify, user_data: gpointer?) -> Bytes` | g_bytes_new_with_free_func | 2.32 | Creates a #GBytes from @data. When the last reference is dropped, @free_func will be called with the @user_data argument. @data must not be modifie... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| compare | `Bytes.compare(bytes2: Bytes) -> gint` | g_bytes_compare | 2.32 | Compares the two #GBytes values. This function can be used to sort GBytes instances in lexicographical order. If @bytes1 and @bytes2 have different... |
| equal | `Bytes.equal(bytes2: Bytes) -> gboolean` | g_bytes_equal | 2.32 | Compares the two #GBytes values being pointed to and returns %TRUE if they are equal. This function can be passed to g_hash_table_new() as the @key... |
| get_data | `Bytes.get_data(size: out gsize?) -> guint8` | g_bytes_get_data | 2.32 | Get the byte data in the #GBytes. This data should not be modified. This function will always return the same pointer for a given #GBytes. %NULL ma... |
| get_region | `Bytes.get_region(element_size: gsize, offset: gsize, n_elements: gsize) -> gpointer` | g_bytes_get_region | 2.70 | Gets a pointer to a region in @bytes. The region starts at @offset many bytes from the start of the data and contains @n_elements many elements of ... |
| get_size | `Bytes.get_size() -> gsize` | g_bytes_get_size | 2.32 | Get the size of the byte data in the #GBytes. This function will always return the same value for a given #GBytes. |
| hash | `Bytes.hash() -> guint` | g_bytes_hash | 2.32 | Creates an integer hash code for the byte data in the #GBytes. This function can be passed to g_hash_table_new() as the @key_hash_func parameter, w... |
| new_from_bytes | `Bytes.new_from_bytes(offset: gsize, length: gsize) -> Bytes` | g_bytes_new_from_bytes | 2.32 | Creates a #GBytes which is a subsection of another #GBytes. The @offset + @length may not be longer than the size of @bytes. A reference to @bytes ... |
| ref | `Bytes.ref() -> Bytes` | g_bytes_ref | 2.32 | Increase the reference count on @bytes. |
| unref | `Bytes.unref() -> none` | g_bytes_unref | 2.32 | Releases a reference on @bytes. This may result in the bytes being freed. If @bytes is %NULL, it will return immediately. |
| unref_to_array | `Bytes.unref_to_array() -> guint8` | g_bytes_unref_to_array | 2.32 | Unreferences the bytes, and returns a new mutable #GByteArray containing the same byte data. As an optimization, the byte data is transferred to th... |
| unref_to_data | `Bytes.unref_to_data(size: out gsize) -> guint8` | g_bytes_unref_to_data | 2.32 | Unreferences the bytes, and returns a pointer the same byte data contents. As an optimization, the byte data is returned without copying if this wa... |

### GLib.Cache

C type: `GCache`

A `GCache` allows sharing of complex data structures, in order to save system resources. `GCache` uses keys and values. A `GCache` key describes th...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(value_new_func: CacheNewFunc, value_destroy_func: CacheDestroyFunc, key_dup_func: CacheDupFunc, key_destroy_func: CacheDestroyFunc, hash_key_func: HashFunc, hash_value_func: HashFunc, key_equal_func: EqualFunc) -> Cache` | g_cache_new |  | Creates a new #GCache. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| destroy | `Cache.destroy() -> none` | g_cache_destroy |  | Frees the memory allocated for the #GCache. Note that it does not destroy the keys and values which were contained in the #GCache. |
| insert | `Cache.insert(key: gpointer?) -> gpointer` | g_cache_insert |  | Gets the value corresponding to the given key, creating it if necessary. It first checks if the value already exists in the #GCache, by using the @... |
| key_foreach | `Cache.key_foreach(func: HFunc, user_data: gpointer?) -> none` | g_cache_key_foreach |  | Calls the given function for each of the keys in the #GCache. NOTE @func is passed three parameters, the value and key of a cache entry and the @us... |
| remove | `Cache.remove(value: gpointer?) -> none` | g_cache_remove |  | Decreases the reference count of the given value. If it drops to 0 then the value and its corresponding key are destroyed, using the @value_destroy... |
| value_foreach | `Cache.value_foreach(func: HFunc, user_data: gpointer?) -> none` | g_cache_value_foreach |  | Calls the given function for each of the values in the #GCache. |

### GLib.Checksum

GType: `GChecksum` ?? C type: `GChecksum`

GLib provides a generic API for computing checksums (or ???digests???) for a sequence of arbitrary bytes, using various hashing algorithms like MD5...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Checksum.new(checksum_type: ChecksumType) -> Checksum` | g_checksum_new | 2.16 | Creates a new #GChecksum, using the checksum algorithm @checksum_type. If the @checksum_type is not known, %NULL is returned. A #GChecksum can be u... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| type_get_length | `type_get_length(checksum_type: ChecksumType) -> gssize` | g_checksum_type_get_length | 2.16 | Gets the length in bytes of digests of type @checksum_type |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Checksum.copy() -> Checksum` | g_checksum_copy | 2.16 | Copies a #GChecksum. If @checksum has been closed, by calling g_checksum_get_string() or g_checksum_get_digest(), the copied checksum will be close... |
| free | `Checksum.free() -> none` | g_checksum_free | 2.16 | Frees the memory allocated for @checksum. |
| get_digest | `Checksum.get_digest(buffer: guint8, digest_len: inout gsize) -> none` | g_checksum_get_digest | 2.16 | Gets the digest from @checksum as a raw binary vector and places it into @buffer. The size of the digest depends on the type of checksum. Once this... |
| get_string | `Checksum.get_string() -> utf8` | g_checksum_get_string | 2.16 | Gets the digest as a hexadecimal string. Once this function has been called the #GChecksum can no longer be updated with g_checksum_update(). The h... |
| reset | `Checksum.reset() -> none` | g_checksum_reset | 2.18 | Resets the state of the @checksum back to its initial state. |
| update | `Checksum.update(data: guint8, length: gssize) -> none` | g_checksum_update | 2.16 | Feeds @data into an existing #GChecksum. The checksum must still be open, that is g_checksum_get_string() or g_checksum_get_digest() must not have ... |

### GLib.Completion

C type: `GCompletion`

`GCompletion` provides support for automatic completion of a string using any group of target strings. It is typically used for file name completio...

#### Fields

| Field | Type |
| --- | --- |
| cache | GLib.List |
| func | CompletionFunc |
| items | GLib.List |
| prefix | utf8 |
| strncmp_func | CompletionStrncmpFunc |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(func: CompletionFunc) -> Completion` | g_completion_new |  | Creates a new #GCompletion. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_items | `Completion.add_items(items: GLib.List) -> none` | g_completion_add_items |  | Adds items to the #GCompletion. |
| clear_items | `Completion.clear_items() -> none` | g_completion_clear_items |  | Removes all items from the #GCompletion. The items are not freed, so if the memory was dynamically allocated, it should be freed after calling this... |
| complete | `Completion.complete(prefix: utf8, new_prefix: utf8) -> GLib.List` | g_completion_complete |  | Attempts to complete the string @prefix using the #GCompletion target items. |
| complete_utf8 | `Completion.complete_utf8(prefix: utf8, new_prefix: utf8) -> GLib.List` | g_completion_complete_utf8 | 2.4 | Attempts to complete the string @prefix using the #GCompletion target items. In contrast to g_completion_complete(), this function returns the larg... |
| free | `Completion.free() -> none` | g_completion_free |  | Frees all memory used by the #GCompletion. The items are not freed, so if the memory was dynamically allocated, it should be freed after calling th... |
| remove_items | `Completion.remove_items(items: GLib.List) -> none` | g_completion_remove_items |  | Removes items from a #GCompletion. The items are not freed, so if the memory was dynamically allocated, free @items with g_list_free_full() after c... |
| set_compare | `Completion.set_compare(strncmp_func: CompletionStrncmpFunc) -> none` | g_completion_set_compare |  | Sets the function to use for string comparisons. The default string comparison function is strncmp(). |

### GLib.Cond

C type: `GCond`

The #GCond struct is an opaque data structure that represents a condition. Threads can block on a #GCond if they find a certain condition to be fal...

#### Fields

| Field | Type |
| --- | --- |
| i | guint |
| p | gpointer |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new() -> Cond` | g_cond_new |  | Allocates and initializes a new #GCond. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| broadcast | `Cond.broadcast() -> none` | g_cond_broadcast |  | If threads are waiting for @cond, all of them are unblocked. If no threads are waiting for @cond, this function has no effect. It is good practice ... |
| clear | `Cond.clear() -> none` | g_cond_clear | 2.32 | Frees the resources allocated to a #GCond with g_cond_init(). This function should not be used with a #GCond that has been statically allocated. Ca... |
| free | `Cond.free() -> none` | g_cond_free |  | Destroys a #GCond that has been created with g_cond_new(). Calling g_cond_free() for a #GCond on which threads are blocking leads to undefined beha... |
| init | `Cond.init() -> none` | g_cond_init | 2.32 | Initialises a #GCond so that it can be used. This function is useful to initialise a #GCond that has been allocated as part of a larger structure. ... |
| signal | `Cond.signal() -> none` | g_cond_signal |  | If threads are waiting for @cond, at least one of them is unblocked. If no threads are waiting for @cond, this function has no effect. It is good p... |
| timed_wait | `Cond.timed_wait(mutex: Mutex, abs_time: TimeVal) -> gboolean` | g_cond_timed_wait |  | Waits until this thread is woken up on @cond, but not longer than until the time specified by @abs_time. The @mutex is unlocked before falling asle... |
| wait | `Cond.wait(mutex: Mutex) -> none` | g_cond_wait |  | Atomically releases @mutex and waits until @cond is signalled. When this function returns, @mutex is locked again and owned by the calling thread. ... |
| wait_until | `Cond.wait_until(mutex: Mutex, end_time: gint64) -> gboolean` | g_cond_wait_until | 2.32 | Waits until either @cond is signalled or @end_time has passed. As with g_cond_wait() it is possible that a spurious or stolen wakeup could occur. F... |

### GLib.Data

C type: `GData`

An opaque data structure that represents a keyed data list. See also: Keyed data lists.

### GLib.Date

GType: `GDate` ?? C type: `GDate`

`GDate` is a struct for calendrical calculations. The `GDate` data structure represents a day between January 1, Year 1, and sometime a few thousan...

#### Fields

| Field | Type |
| --- | --- |
| day | guint |
| dmy | guint |
| julian | guint |
| julian_days | guint |
| month | guint |
| year | guint |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Date.new() -> Date` | g_date_new |  | Allocates a #GDate and initializes it to a safe state. The new date will be cleared (as if you'd called g_date_clear()) but invalid (it won't repre... |
| new_dmy | `Date.new_dmy(day: DateDay, month: DateMonth, year: DateYear) -> Date` | g_date_new_dmy |  | Create a new #GDate representing the given day-month-year triplet. The triplet you pass in must represent a valid date. Use g_date_valid_dmy() if n... |
| new_julian | `Date.new_julian(julian_day: guint32) -> Date` | g_date_new_julian |  | Create a new #GDate representing the given Julian date. The @julian_day you pass in must be valid. Use g_date_valid_julian() if needed to validate ... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_days_in_month | `get_days_in_month(month: DateMonth, year: DateYear) -> guint8` | g_date_get_days_in_month |  | Returns the number of days in a month, taking leap years into account. |
| get_monday_weeks_in_year | `get_monday_weeks_in_year(year: DateYear) -> guint8` | g_date_get_monday_weeks_in_year |  | Returns the number of weeks in the year, where weeks are taken to start on Monday. Will be 52 or 53. The date must be valid. (Years always have 52 ... |
| get_sunday_weeks_in_year | `get_sunday_weeks_in_year(year: DateYear) -> guint8` | g_date_get_sunday_weeks_in_year |  | Returns the number of weeks in the year, where weeks are taken to start on Sunday. Will be 52 or 53. The date must be valid. (Years always have 52 ... |
| is_leap_year | `is_leap_year(year: DateYear) -> gboolean` | g_date_is_leap_year |  | Returns %TRUE if the year is a leap year. For the purposes of this function, leap year is every year divisible by 4 unless that year is divisible b... |
| strftime | `strftime(s: utf8, slen: gsize, format: utf8, date: Date) -> gsize` | g_date_strftime |  | Generates a printed representation of the date, in a [locale][setlocale]-specific way. Works just like the platform's C library strftime() function... |
| valid_day | `valid_day(day: DateDay) -> gboolean` | g_date_valid_day |  | Returns %TRUE if the day of the month is valid (a day is valid if it's between 1 and 31 inclusive). |
| valid_dmy | `valid_dmy(day: DateDay, month: DateMonth, year: DateYear) -> gboolean` | g_date_valid_dmy |  | Returns %TRUE if the day-month-year triplet forms a valid, existing day in the range of days #GDate understands (Year 1 or later, no more than a fe... |
| valid_julian | `valid_julian(julian_date: guint32) -> gboolean` | g_date_valid_julian |  | Returns %TRUE if the Julian day is valid. Anything greater than zero is basically a valid Julian, though there is a 32-bit limit. |
| valid_month | `valid_month(month: DateMonth) -> gboolean` | g_date_valid_month |  | Returns %TRUE if the month value is valid. The 12 #GDateMonth enumeration values are the only valid months. |
| valid_weekday | `valid_weekday(weekday: DateWeekday) -> gboolean` | g_date_valid_weekday |  | Returns %TRUE if the weekday is valid. The seven #GDateWeekday enumeration values are the only valid weekdays. |
| valid_year | `valid_year(year: DateYear) -> gboolean` | g_date_valid_year |  | Returns %TRUE if the year is valid. Any year greater than 0 is valid, though there is a 16-bit limit to what #GDate will understand. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_days | `Date.add_days(n_days: guint) -> none` | g_date_add_days |  | Increments a date some number of days. To move forward by weeks, add weeks*7 days. The date must be valid. |
| add_months | `Date.add_months(n_months: guint) -> none` | g_date_add_months |  | Increments a date by some number of months. If the day of the month is greater than 28, this routine may change the day of the month (because the d... |
| add_years | `Date.add_years(n_years: guint) -> none` | g_date_add_years |  | Increments a date by some number of years. If the date is February 29, and the destination year is not a leap year, the date will be changed to Feb... |
| clamp | `Date.clamp(min_date: Date, max_date: Date) -> none` | g_date_clamp |  | If @date is prior to @min_date, sets @date equal to @min_date. If @date falls after @max_date, sets @date equal to @max_date. Otherwise, @date is u... |
| clear | `Date.clear(n_dates: guint) -> none` | g_date_clear |  | Initializes one or more #GDate structs to a safe but invalid state. The cleared dates will not represent an existing date, but will not contain gar... |
| compare | `Date.compare(rhs: Date) -> gint` | g_date_compare |  | qsort()-style comparison function for dates. Both dates must be valid. |
| copy | `Date.copy() -> Date` | g_date_copy | 2.56 | Copies a GDate to a newly-allocated GDate. If the input was invalid (as determined by g_date_valid()), the invalid state will be copied as is into ... |
| days_between | `Date.days_between(date2: Date) -> gint` | g_date_days_between |  | Computes the number of days between two dates. If @date2 is prior to @date1, the returned value is negative. Both dates must be valid. |
| free | `Date.free() -> none` | g_date_free |  | Frees a #GDate returned from g_date_new(). |
| get_day | `Date.get_day() -> DateDay` | g_date_get_day |  | Returns the day of the month. The date must be valid. |
| get_day_of_year | `Date.get_day_of_year() -> guint` | g_date_get_day_of_year |  | Returns the day of the year, where Jan 1 is the first day of the year. The date must be valid. |
| get_iso8601_week_of_year | `Date.get_iso8601_week_of_year() -> guint` | g_date_get_iso8601_week_of_year | 2.6 | Returns the week of the year, where weeks are interpreted according to ISO 8601. |
| get_julian | `Date.get_julian() -> guint32` | g_date_get_julian |  | Returns the Julian day or "serial number" of the #GDate. The Julian day is simply the number of days since January 1, Year 1; i.e., January 1, Year... |
| get_monday_week_of_year | `Date.get_monday_week_of_year() -> guint` | g_date_get_monday_week_of_year |  | Returns the week of the year, where weeks are understood to start on Monday. If the date is before the first Monday of the year, return 0. The date... |
| get_month | `Date.get_month() -> DateMonth` | g_date_get_month |  | Returns the month of the year. The date must be valid. |
| get_sunday_week_of_year | `Date.get_sunday_week_of_year() -> guint` | g_date_get_sunday_week_of_year |  | Returns the week of the year during which this date falls, if weeks are understood to begin on Sunday. The date must be valid. Can return 0 if the ... |
| get_weekday | `Date.get_weekday() -> DateWeekday` | g_date_get_weekday |  | Returns the day of the week for a #GDate. The date must be valid. |
| get_year | `Date.get_year() -> DateYear` | g_date_get_year |  | Returns the year of a #GDate. The date must be valid. |
| is_first_of_month | `Date.is_first_of_month() -> gboolean` | g_date_is_first_of_month |  | Returns %TRUE if the date is on the first of a month. The date must be valid. |
| is_last_of_month | `Date.is_last_of_month() -> gboolean` | g_date_is_last_of_month |  | Returns %TRUE if the date is the last day of the month. The date must be valid. |
| order | `Date.order(date2: Date) -> none` | g_date_order |  | Checks if @date1 is less than or equal to @date2, and swap the values if this is not the case. |
| set_day | `Date.set_day(day: DateDay) -> none` | g_date_set_day |  | Sets the day of the month for a #GDate. If the resulting day-month-year triplet is invalid, the date will be invalid. |
| set_dmy | `Date.set_dmy(day: DateDay, month: DateMonth, y: DateYear) -> none` | g_date_set_dmy |  | Sets the value of a #GDate from a day, month, and year. The day-month-year triplet must be valid; if you aren't sure it is, call g_date_valid_dmy()... |
| set_julian | `Date.set_julian(julian_date: guint32) -> none` | g_date_set_julian |  | Sets the value of a #GDate from a Julian day number. |
| set_month | `Date.set_month(month: DateMonth) -> none` | g_date_set_month |  | Sets the month of the year for a #GDate. If the resulting day-month-year triplet is invalid, the date will be invalid. |
| set_parse | `Date.set_parse(str: utf8) -> none` | g_date_set_parse |  | Parses a user-inputted string @str, and try to figure out what date it represents, taking the [current locale][setlocale] into account. If the stri... |
| set_time | `Date.set_time(time_: Time) -> none` | g_date_set_time |  | Sets the value of a date from a #GTime value. The time to date conversion is done using the user's current timezone. |
| set_time_t | `Date.set_time_t(timet: time_t) -> none` | g_date_set_time_t | 2.10 | Sets the value of a date to the date corresponding to a time specified as a time_t. The time to date conversion is done using the user's current ti... |
| set_time_val | `Date.set_time_val(timeval: TimeVal) -> none` | g_date_set_time_val | 2.10 | Sets the value of a date from a #GTimeVal value. Note that the @tv_usec member is ignored, because #GDate can't make use of the additional precisio... |
| set_year | `Date.set_year(year: DateYear) -> none` | g_date_set_year |  | Sets the year for a #GDate. If the resulting day-month-year triplet is invalid, the date will be invalid. |
| subtract_days | `Date.subtract_days(n_days: guint) -> none` | g_date_subtract_days |  | Moves a date some number of days into the past. To move by weeks, just move by weeks*7 days. The date must be valid. |
| subtract_months | `Date.subtract_months(n_months: guint) -> none` | g_date_subtract_months |  | Moves a date some number of months into the past. If the current day of the month doesn't exist in the destination month, the day of the month may ... |
| subtract_years | `Date.subtract_years(n_years: guint) -> none` | g_date_subtract_years |  | Moves a date some number of years into the past. If the current day doesn't exist in the destination year (i.e. it's February 29 and you move to a ... |
| to_struct_tm | `Date.to_struct_tm(tm: gpointer) -> none` | g_date_to_struct_tm |  | Fills in the date-related bits of a struct tm using the @date value. Initializes the non-date parts with something safe but meaningless. |
| valid | `Date.valid() -> gboolean` | g_date_valid |  | Returns %TRUE if the #GDate represents an existing day. The date must not contain garbage; it should have been initialized with g_date_clear() if i... |

### GLib.DateTime

GType: `GDateTime` ?? C type: `GDateTime`

`GDateTime` is a structure that combines a Gregorian date and time into a single structure. `GDateTime` provides many conversion and methods to man...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DateTime.new(tz: TimeZone, year: gint, month: gint, day: gint, hour: gint, minute: gint, seconds: gdouble) -> DateTime` | g_date_time_new | 2.26 | Creates a new #GDateTime corresponding to the given date and time in the time zone @tz. The @year must be between 1 and 9999, @month between 1 and ... |
| new_from_iso8601 | `DateTime.new_from_iso8601(text: utf8, default_tz: TimeZone?) -> DateTime` | g_date_time_new_from_iso8601 | 2.56 | Creates a #GDateTime corresponding to the given ISO 8601 formatted string @text. ISO 8601 strings of the form <date><sep><time><tz> are supported, ... |
| new_from_timeval_local | `DateTime.new_from_timeval_local(tv: TimeVal) -> DateTime` | g_date_time_new_from_timeval_local | 2.26 | Creates a #GDateTime corresponding to the given #GTimeVal @tv in the local time zone. The time contained in a #GTimeVal is always stored in the for... |
| new_from_timeval_utc | `DateTime.new_from_timeval_utc(tv: TimeVal) -> DateTime` | g_date_time_new_from_timeval_utc | 2.26 | Creates a #GDateTime corresponding to the given #GTimeVal @tv in UTC. The time contained in a #GTimeVal is always stored in the form of seconds ela... |
| new_from_unix_local | `DateTime.new_from_unix_local(t: gint64) -> DateTime` | g_date_time_new_from_unix_local | 2.26 | Creates a #GDateTime corresponding to the given Unix time @t in the local time zone. Unix time is the number of seconds that have elapsed since 197... |
| new_from_unix_local_usec | `DateTime.new_from_unix_local_usec(usecs: gint64) -> DateTime` | g_date_time_new_from_unix_local_usec | 2.80 | Creates a [struct@GLib.DateTime] corresponding to the given Unix time @t in the local time zone. Unix time is the number of microseconds that have ... |
| new_from_unix_utc | `DateTime.new_from_unix_utc(t: gint64) -> DateTime` | g_date_time_new_from_unix_utc | 2.26 | Creates a #GDateTime corresponding to the given Unix time @t in UTC. Unix time is the number of seconds that have elapsed since 1970-01-01 00:00:00... |
| new_from_unix_utc_usec | `DateTime.new_from_unix_utc_usec(usecs: gint64) -> DateTime` | g_date_time_new_from_unix_utc_usec | 2.80 | Creates a [struct@GLib.DateTime] corresponding to the given Unix time @t in UTC. Unix time is the number of microseconds that have elapsed since 19... |
| new_local | `DateTime.new_local(year: gint, month: gint, day: gint, hour: gint, minute: gint, seconds: gdouble) -> DateTime` | g_date_time_new_local | 2.26 | Creates a new #GDateTime corresponding to the given date and time in the local time zone. This call is equivalent to calling g_date_time_new() with... |
| new_now | `DateTime.new_now(tz: TimeZone) -> DateTime` | g_date_time_new_now | 2.26 | Creates a #GDateTime corresponding to this exact instant in the given time zone @tz. The time is as accurate as the system allows, to a maximum acc... |
| new_now_local | `DateTime.new_now_local() -> DateTime` | g_date_time_new_now_local | 2.26 | Creates a #GDateTime corresponding to this exact instant in the local time zone. This is equivalent to calling g_date_time_new_now() with the time ... |
| new_now_utc | `DateTime.new_now_utc() -> DateTime` | g_date_time_new_now_utc | 2.26 | Creates a #GDateTime corresponding to this exact instant in UTC. This is equivalent to calling g_date_time_new_now() with the time zone returned by... |
| new_utc | `DateTime.new_utc(year: gint, month: gint, day: gint, hour: gint, minute: gint, seconds: gdouble) -> DateTime` | g_date_time_new_utc | 2.26 | Creates a new #GDateTime corresponding to the given date and time in UTC. This call is equivalent to calling g_date_time_new() with the time zone r... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `DateTime.add(timespan: TimeSpan) -> DateTime` | g_date_time_add | 2.26 | Creates a copy of @datetime and adds the specified timespan to the copy. |
| add_days | `DateTime.add_days(days: gint) -> DateTime` | g_date_time_add_days | 2.26 | Creates a copy of @datetime and adds the specified number of days to the copy. Add negative values to subtract days. |
| add_full | `DateTime.add_full(years: gint, months: gint, days: gint, hours: gint, minutes: gint, seconds: gdouble) -> DateTime` | g_date_time_add_full | 2.26 | Creates a new #GDateTime adding the specified values to the current date and time in @datetime. Add negative values to subtract. |
| add_hours | `DateTime.add_hours(hours: gint) -> DateTime` | g_date_time_add_hours | 2.26 | Creates a copy of @datetime and adds the specified number of hours. Add negative values to subtract hours. |
| add_minutes | `DateTime.add_minutes(minutes: gint) -> DateTime` | g_date_time_add_minutes | 2.26 | Creates a copy of @datetime adding the specified number of minutes. Add negative values to subtract minutes. |
| add_months | `DateTime.add_months(months: gint) -> DateTime` | g_date_time_add_months | 2.26 | Creates a copy of @datetime and adds the specified number of months to the copy. Add negative values to subtract months. The day of the month of th... |
| add_seconds | `DateTime.add_seconds(seconds: gdouble) -> DateTime` | g_date_time_add_seconds | 2.26 | Creates a copy of @datetime and adds the specified number of seconds. Add negative values to subtract seconds. |
| add_weeks | `DateTime.add_weeks(weeks: gint) -> DateTime` | g_date_time_add_weeks | 2.26 | Creates a copy of @datetime and adds the specified number of weeks to the copy. Add negative values to subtract weeks. |
| add_years | `DateTime.add_years(years: gint) -> DateTime` | g_date_time_add_years | 2.26 | Creates a copy of @datetime and adds the specified number of years to the copy. Add negative values to subtract years. As with g_date_time_add_mont... |
| compare | `DateTime.compare(dt2: DateTime) -> gint` | g_date_time_compare | 2.26 | A comparison function for #GDateTimes that is suitable as a #GCompareFunc. Both #GDateTimes must be non-%NULL. |
| difference | `DateTime.difference(begin: DateTime) -> TimeSpan` | g_date_time_difference | 2.26 | Calculates the difference in time between @end and @begin. The #GTimeSpan that is returned is effectively @end - @begin (ie: positive if the first ... |
| equal | `DateTime.equal(dt2: DateTime) -> gboolean` | g_date_time_equal | 2.26 | Checks to see if @dt1 and @dt2 are equal. Equal here means that they represent the same moment after converting them to the same time zone. |
| format | `DateTime.format(format: utf8) -> utf8` | g_date_time_format | 2.26 | Creates a newly allocated string representing the requested @format. The format strings understood by this function are a subset of the `strftime()... |
| format_iso8601 | `DateTime.format_iso8601() -> utf8` | g_date_time_format_iso8601 | 2.62 | Format @datetime in ISO 8601 format, including the date, time and time zone, and return that as a UTF-8 encoded string. Since GLib 2.66, this will ... |
| get_day_of_month | `DateTime.get_day_of_month() -> gint` | g_date_time_get_day_of_month | 2.26 | Retrieves the day of the month represented by @datetime in the gregorian calendar. |
| get_day_of_week | `DateTime.get_day_of_week() -> gint` | g_date_time_get_day_of_week | 2.26 | Retrieves the ISO 8601 day of the week on which @datetime falls (1 is Monday, 2 is Tuesday... 7 is Sunday). |
| get_day_of_year | `DateTime.get_day_of_year() -> gint` | g_date_time_get_day_of_year | 2.26 | Retrieves the day of the year represented by @datetime in the Gregorian calendar. |
| get_hour | `DateTime.get_hour() -> gint` | g_date_time_get_hour | 2.26 | Retrieves the hour of the day represented by @datetime |
| get_microsecond | `DateTime.get_microsecond() -> gint` | g_date_time_get_microsecond | 2.26 | Retrieves the microsecond of the date represented by @datetime |
| get_minute | `DateTime.get_minute() -> gint` | g_date_time_get_minute | 2.26 | Retrieves the minute of the hour represented by @datetime |
| get_month | `DateTime.get_month() -> gint` | g_date_time_get_month | 2.26 | Retrieves the month of the year represented by @datetime in the Gregorian calendar. |
| get_second | `DateTime.get_second() -> gint` | g_date_time_get_second | 2.26 | Retrieves the second of the minute represented by @datetime |
| get_seconds | `DateTime.get_seconds() -> gdouble` | g_date_time_get_seconds | 2.26 | Retrieves the number of seconds since the start of the last minute, including the fractional part. |
| get_timezone | `DateTime.get_timezone() -> TimeZone` | g_date_time_get_timezone | 2.58 | Get the time zone for this @datetime. |
| get_timezone_abbreviation | `DateTime.get_timezone_abbreviation() -> utf8` | g_date_time_get_timezone_abbreviation | 2.26 | Determines the time zone abbreviation to be used at the time and in the time zone of @datetime. For example, in Toronto this is currently "EST" dur... |
| get_utc_offset | `DateTime.get_utc_offset() -> TimeSpan` | g_date_time_get_utc_offset | 2.26 | Determines the offset to UTC in effect at the time and in the time zone of @datetime. The offset is the number of microseconds that you add to UTC ... |
| get_week_numbering_year | `DateTime.get_week_numbering_year() -> gint` | g_date_time_get_week_numbering_year | 2.26 | Returns the ISO 8601 week-numbering year in which the week containing @datetime falls. This function, taken together with g_date_time_get_week_of_y... |
| get_week_of_year | `DateTime.get_week_of_year() -> gint` | g_date_time_get_week_of_year | 2.26 | Returns the ISO 8601 week number for the week containing @datetime. The ISO 8601 week number is the same for every day of the week (from Moday thro... |
| get_year | `DateTime.get_year() -> gint` | g_date_time_get_year | 2.26 | Retrieves the year represented by @datetime in the Gregorian calendar. |
| get_ymd | `DateTime.get_ymd(year: out gint?, month: out gint?, day: out gint?) -> none` | g_date_time_get_ymd | 2.26 | Retrieves the Gregorian day, month, and year of a given #GDateTime. |
| hash | `DateTime.hash() -> guint` | g_date_time_hash | 2.26 | Hashes @datetime into a #guint, suitable for use within #GHashTable. |
| is_daylight_savings | `DateTime.is_daylight_savings() -> gboolean` | g_date_time_is_daylight_savings | 2.26 | Determines if daylight savings time is in effect at the time and in the time zone of @datetime. |
| ref | `DateTime.ref() -> DateTime` | g_date_time_ref | 2.26 | Atomically increments the reference count of @datetime by one. |
| to_local | `DateTime.to_local() -> DateTime` | g_date_time_to_local | 2.26 | Creates a new #GDateTime corresponding to the same instant in time as @datetime, but in the local time zone. This call is equivalent to calling g_d... |
| to_timeval | `DateTime.to_timeval(tv: TimeVal) -> gboolean` | g_date_time_to_timeval | 2.26 | Stores the instant in time that @datetime represents into @tv. The time contained in a #GTimeVal is always stored in the form of seconds elapsed si... |
| to_timezone | `DateTime.to_timezone(tz: TimeZone) -> DateTime` | g_date_time_to_timezone | 2.26 | Create a new #GDateTime corresponding to the same instant in time as @datetime, but in the time zone @tz. This call can fail in the case that the t... |
| to_unix | `DateTime.to_unix() -> gint64` | g_date_time_to_unix | 2.26 | Gives the Unix time corresponding to @datetime, rounding down to the nearest second. Unix time is the number of seconds that have elapsed since 197... |
| to_unix_usec | `DateTime.to_unix_usec() -> gint64` | g_date_time_to_unix_usec | 2.80 | Gives the Unix time corresponding to @datetime, in microseconds. Unix time is the number of microseconds that have elapsed since 1970-01-01 00:00:0... |
| to_utc | `DateTime.to_utc() -> DateTime` | g_date_time_to_utc | 2.26 | Creates a new #GDateTime corresponding to the same instant in time as @datetime, but in UTC. This call is equivalent to calling g_date_time_to_time... |
| unref | `DateTime.unref() -> none` | g_date_time_unref | 2.26 | Atomically decrements the reference count of @datetime by one. When the reference count reaches zero, the resources allocated by @datetime are freed |

### GLib.DebugKey

C type: `GDebugKey`

Associates a string with a bit flag. Used in g_parse_debug_string().

#### Fields

| Field | Type |
| --- | --- |
| key | utf8 |
| value | guint |

### GLib.Dir

GType: `GDir` ?? C type: `GDir`

An opaque structure representing an opened directory.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| open | `Dir.open(path: utf8, flags: guint) -> Dir throws` | g_dir_open |  | Opens a directory for reading. The names of the files in the directory can then be retrieved using g_dir_read_name(). Note that the ordering is not... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| make_tmp | `make_tmp(tmpl: filename?) -> filename throws` | g_dir_make_tmp | 2.30 | Creates a subdirectory in the preferred directory for temporary files (as returned by g_get_tmp_dir()). @tmpl should be a string in the GLib file n... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| close | `Dir.close() -> none` | g_dir_close |  | Closes the directory immediately and decrements the reference count. Once the reference count reaches zero, the `GDir` structure itself will be fre... |
| read_name | `Dir.read_name() -> filename` | g_dir_read_name |  | Retrieves the name of another entry in the directory, or %NULL. The order of entries returned from this function is not defined, and may vary by fi... |
| ref | `Dir.ref() -> Dir` | g_dir_ref | 2.80 | Increment the reference count of `dir`. |
| rewind | `Dir.rewind() -> none` | g_dir_rewind |  | Resets the given directory. The next call to g_dir_read_name() will return the first entry again. |
| unref | `Dir.unref() -> none` | g_dir_unref | 2.80 | Decrements the reference count of `dir`. Once the reference count reaches zero, the directory will be closed and all resources associated with it w... |

### GLib.Error

GType: `GError` ?? C type: `GError`

The `GError` structure contains information about an error that has occurred.

#### Fields

| Field | Type |
| --- | --- |
| code | gint |
| domain | Quark |
| message | utf8 |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Error.new(domain: Quark, code: gint, format: utf8, ...: void) -> Error` | g_error_new |  | Creates a new #GError with the given @domain and @code, and a message formatted with @format. |
| new_literal | `Error.new_literal(domain: Quark, code: gint, message: utf8) -> Error` | g_error_new_literal |  | Creates a new #GError; unlike g_error_new(), @message is not a printf()-style format string. Use this function if @message contains text you don't ... |
| new_valist | `Error.new_valist(domain: Quark, code: gint, format: utf8, args: va_list) -> Error` | g_error_new_valist | 2.22 | Creates a new #GError with the given @domain and @code, and a message formatted with @format. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| domain_register | `domain_register(error_type_name: utf8, error_type_private_size: gsize, error_type_init: ErrorInitFunc, error_type_copy: ErrorCopyFunc, error_type_clear: ErrorClearFunc) -> Quark` | g_error_domain_register | 2.68 | This function registers an extended #GError domain. @error_type_name will be duplicated. Otherwise does the same as g_error_domain_register_static(). |
| domain_register_static | `domain_register_static(error_type_name: utf8, error_type_private_size: gsize, error_type_init: ErrorInitFunc, error_type_copy: ErrorCopyFunc, error_type_clear: ErrorClearFunc) -> Quark` | g_error_domain_register_static | 2.68 | This function registers an extended #GError domain. @error_type_name should not be freed. @error_type_private_size must be greater than 0. @error_t... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Error.copy() -> Error` | g_error_copy |  | Makes a copy of @error. |
| free | `Error.free() -> none` | g_error_free |  | Frees a #GError and associated resources. |
| matches | `Error.matches(domain: Quark, code: gint) -> gboolean` | g_error_matches |  | Returns %TRUE if @error matches @domain and @code, %FALSE otherwise. In particular, when @error is %NULL, %FALSE will be returned. If @domain conta... |

### GLib.HashTable

GType: `GHashTable` ?? C type: `GHashTable`

The #GHashTable struct is an opaque data structure to represent a [Hash Table][glib-Hash-Tables]. It should only be accessed via the following func...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `add(hash_table: GLib.HashTable, key: gpointer?) -> gboolean` | g_hash_table_add | 2.32 | This is a convenience function for using a #GHashTable as a set. It is equivalent to calling g_hash_table_replace() with @key as both the key and t... |
| contains | `contains(hash_table: GLib.HashTable, key: gpointer?) -> gboolean` | g_hash_table_contains | 2.32 | Checks if @key is in @hash_table. |
| destroy | `destroy(hash_table: GLib.HashTable) -> none` | g_hash_table_destroy |  | Destroys all keys and values in the #GHashTable and decrements its reference count by 1. If keys and/or values are dynamically allocated, you shoul... |
| find | `find(hash_table: GLib.HashTable, predicate: HRFunc, user_data: gpointer?) -> gpointer` | g_hash_table_find | 2.4 | Calls the given function for key/value pairs in the #GHashTable until @predicate returns %TRUE. The function is passed the key and value of each pa... |
| foreach | `foreach(hash_table: GLib.HashTable, func: HFunc, user_data: gpointer?) -> none` | g_hash_table_foreach |  | Calls the given function for each of the key/value pairs in the #GHashTable. The function is passed the key and value of each pair, and the given @... |
| foreach_remove | `foreach_remove(hash_table: GLib.HashTable, func: HRFunc, user_data: gpointer?) -> guint` | g_hash_table_foreach_remove |  | Calls the given function for each key/value pair in the #GHashTable. If the function returns %TRUE, then the key/value pair is removed from the #GH... |
| foreach_steal | `foreach_steal(hash_table: GLib.HashTable, func: HRFunc, user_data: gpointer?) -> guint` | g_hash_table_foreach_steal |  | Calls the given function for each key/value pair in the #GHashTable. If the function returns %TRUE, then the key/value pair is removed from the #GH... |
| get_keys | `get_keys(hash_table: GLib.HashTable) -> GLib.List` | g_hash_table_get_keys | 2.14 | Retrieves every key inside @hash_table. The returned data is valid until changes to the hash release those keys. This iterates over every entry in ... |
| get_keys_as_array | `get_keys_as_array(hash_table: GLib.HashTable, length: out guint?) -> gpointer` | g_hash_table_get_keys_as_array | 2.40 | Retrieves every key inside @hash_table, as an array. The returned array is %NULL-terminated but may contain %NULL as a key. Use @length to determin... |
| get_keys_as_ptr_array | `get_keys_as_ptr_array(hash_table: GLib.HashTable) -> gpointer` | g_hash_table_get_keys_as_ptr_array | 2.76 | Retrieves every key inside @hash_table, as a #GPtrArray. The returned data is valid until changes to the hash release those keys. This iterates ove... |
| get_values | `get_values(hash_table: GLib.HashTable) -> GLib.List` | g_hash_table_get_values | 2.14 | Retrieves every value inside @hash_table. The returned data is valid until @hash_table is modified. This iterates over every entry in the hash tabl... |
| get_values_as_ptr_array | `get_values_as_ptr_array(hash_table: GLib.HashTable) -> gpointer` | g_hash_table_get_values_as_ptr_array | 2.76 | Retrieves every value inside @hash_table, as a #GPtrArray. The returned data is valid until changes to the hash release those values. This iterates... |
| insert | `insert(hash_table: GLib.HashTable, key: gpointer?, value: gpointer?) -> gboolean` | g_hash_table_insert |  | Inserts a new key and value into a #GHashTable. If the key already exists in the #GHashTable its current value is replaced with the new value. If y... |
| lookup | `lookup(hash_table: GLib.HashTable, key: gpointer?) -> gpointer` | g_hash_table_lookup |  | Looks up a key in a #GHashTable. Note that this function cannot distinguish between a key that is not present and one which is present and has the ... |
| lookup_extended | `lookup_extended(hash_table: GLib.HashTable, lookup_key: gpointer?, orig_key: out gpointer?, value: out gpointer?) -> gboolean` | g_hash_table_lookup_extended |  | Looks up a key in the #GHashTable, returning the original key and the associated value and a #gboolean which is %TRUE if the key was found. This is... |
| new | `new(hash_func: HashFunc, key_equal_func: EqualFunc) -> GLib.HashTable` | g_hash_table_new |  | Creates a new #GHashTable with a reference count of 1. Hash values returned by @hash_func are used to determine where keys are stored within the #G... |
| new_full | `new_full(hash_func: HashFunc, key_equal_func: EqualFunc, key_destroy_func: DestroyNotify?, value_destroy_func: DestroyNotify?) -> GLib.HashTable` | g_hash_table_new_full |  | Creates a new #GHashTable like g_hash_table_new() with a reference count of 1 and allows to specify functions to free the memory allocated for the ... |
| new_similar | `new_similar(other_hash_table: GLib.HashTable) -> GLib.HashTable` | g_hash_table_new_similar | 2.72 | Creates a new #GHashTable like g_hash_table_new_full() with a reference count of 1. It inherits the hash function, the key equal function, the key ... |
| ref | `ref(hash_table: GLib.HashTable) -> GLib.HashTable` | g_hash_table_ref | 2.10 | Atomically increments the reference count of @hash_table by one. This function is MT-safe and may be called from any thread. |
| remove | `remove(hash_table: GLib.HashTable, key: gpointer?) -> gboolean` | g_hash_table_remove |  | Removes a key and its associated value from a #GHashTable. If the #GHashTable was created using g_hash_table_new_full(), the key and value are free... |
| remove_all | `remove_all(hash_table: GLib.HashTable) -> none` | g_hash_table_remove_all | 2.12 | Removes all keys and their associated values from a #GHashTable. If the #GHashTable was created using g_hash_table_new_full(), the keys and values ... |
| replace | `replace(hash_table: GLib.HashTable, key: gpointer?, value: gpointer?) -> gboolean` | g_hash_table_replace |  | Inserts a new key and value into a #GHashTable similar to g_hash_table_insert(). The difference is that if the key already exists in the #GHashTabl... |
| size | `size(hash_table: GLib.HashTable) -> guint` | g_hash_table_size |  | Returns the number of elements contained in the #GHashTable. |
| steal | `steal(hash_table: GLib.HashTable, key: gpointer?) -> gboolean` | g_hash_table_steal |  | Removes a key and its associated value from a #GHashTable without calling the key and value destroy functions. |
| steal_all | `steal_all(hash_table: GLib.HashTable) -> none` | g_hash_table_steal_all | 2.12 | Removes all keys and their associated values from a #GHashTable without calling the key and value destroy functions. |
| steal_all_keys | `steal_all_keys(hash_table: GLib.HashTable) -> gpointer` | g_hash_table_steal_all_keys | 2.76 | Removes all keys and their associated values from a #GHashTable without calling the key destroy functions, returning the keys as a #GPtrArray with ... |
| steal_all_values | `steal_all_values(hash_table: GLib.HashTable) -> gpointer` | g_hash_table_steal_all_values | 2.76 | Removes all keys and their associated values from a #GHashTable without calling the value destroy functions, returning the values as a #GPtrArray w... |
| steal_extended | `steal_extended(hash_table: GLib.HashTable, lookup_key: gpointer?, stolen_key: out gpointer?, stolen_value: out gpointer?) -> gboolean` | g_hash_table_steal_extended | 2.58 | Looks up a key in the #GHashTable, stealing the original key and the associated value and returning %TRUE if the key was found. If the key was not ... |
| unref | `unref(hash_table: GLib.HashTable) -> none` | g_hash_table_unref | 2.10 | Atomically decrements the reference count of @hash_table by one. If the reference count drops to 0, all keys and values will be destroyed, and all ... |

### GLib.HashTableIter

C type: `GHashTableIter`

A GHashTableIter structure represents an iterator that can be used to iterate over the elements of a #GHashTable. GHashTableIter structures are typ...

#### Fields

| Field | Type |
| --- | --- |
| dummy1 | gpointer |
| dummy2 | gpointer |
| dummy3 | gpointer |
| dummy4 | gint |
| dummy5 | gboolean |
| dummy6 | gpointer |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_hash_table | `HashTableIter.get_hash_table() -> GLib.HashTable` | g_hash_table_iter_get_hash_table | 2.16 | Returns the #GHashTable associated with @iter. |
| init | `HashTableIter.init(hash_table: GLib.HashTable) -> none` | g_hash_table_iter_init | 2.16 | Initializes a key/value pair iterator and associates it with @hash_table. Modifying the hash table after calling this function invalidates the retu... |
| next | `HashTableIter.next(key: out gpointer?, value: out gpointer?) -> gboolean` | g_hash_table_iter_next | 2.16 | Advances @iter and retrieves the key and/or value that are now pointed to as a result of this advancement. If %FALSE is returned, @key and @value a... |
| remove | `HashTableIter.remove() -> none` | g_hash_table_iter_remove | 2.16 | Removes the key/value pair currently pointed to by the iterator from its associated #GHashTable. Can only be called after g_hash_table_iter_next() ... |
| replace | `HashTableIter.replace(value: gpointer?) -> none` | g_hash_table_iter_replace | 2.30 | Replaces the value currently pointed to by the iterator from its associated #GHashTable. Can only be called after g_hash_table_iter_next() returned... |
| steal | `HashTableIter.steal() -> none` | g_hash_table_iter_steal | 2.16 | Removes the key/value pair currently pointed to by the iterator from its associated #GHashTable, without calling the key and value destroy function... |

### GLib.Hmac

GType: `GHmac` ?? C type: `GHmac`

HMACs should be used when producing a cookie or hash based on data and a key. Simple mechanisms for using SHA1 and other algorithms to digest a key...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Hmac.new(digest_type: ChecksumType, key: guint8, key_len: gsize) -> Hmac` | g_hmac_new | 2.30 | Creates a new #GHmac, using the digest algorithm @digest_type. If the @digest_type is not known, %NULL is returned. A #GHmac can be used to compute... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Hmac.copy() -> Hmac` | g_hmac_copy | 2.30 | Copies a #GHmac. If @hmac has been closed, by calling g_hmac_get_string() or g_hmac_get_digest(), the copied HMAC will be closed as well. |
| get_digest | `Hmac.get_digest(buffer: guint8, digest_len: inout gsize) -> none` | g_hmac_get_digest | 2.30 | Gets the digest from @checksum as a raw binary array and places it into @buffer. The size of the digest depends on the type of checksum. Once this ... |
| get_string | `Hmac.get_string() -> utf8` | g_hmac_get_string | 2.30 | Gets the HMAC as a hexadecimal string. Once this function has been called the #GHmac can no longer be updated with g_hmac_update(). The hexadecimal... |
| ref | `Hmac.ref() -> Hmac` | g_hmac_ref | 2.30 | Atomically increments the reference count of @hmac by one. This function is MT-safe and may be called from any thread. |
| unref | `Hmac.unref() -> none` | g_hmac_unref | 2.30 | Atomically decrements the reference count of @hmac by one. If the reference count drops to 0, all keys and values will be destroyed, and all memory... |
| update | `Hmac.update(data: guint8, length: gssize) -> none` | g_hmac_update | 2.30 | Feeds @data into an existing #GHmac. The HMAC must still be open, that is g_hmac_get_string() or g_hmac_get_digest() must not have been called on @... |

### GLib.Hook

C type: `GHook`

The #GHook struct represents a single hook function in a #GHookList.

#### Fields

| Field | Type |
| --- | --- |
| data | gpointer |
| destroy | DestroyNotify |
| flags | guint |
| func | gpointer |
| hook_id | gulong |
| next | Hook |
| prev | Hook |
| ref_count | guint |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `alloc(hook_list: HookList) -> Hook` | g_hook_alloc |  | Allocates space for a #GHook and initializes it. |
| destroy | `destroy(hook_list: HookList, hook_id: gulong) -> gboolean` | g_hook_destroy |  | Destroys a #GHook, given its ID. |
| destroy_link | `destroy_link(hook_list: HookList, hook: Hook) -> none` | g_hook_destroy_link |  | Removes one #GHook from a #GHookList, marking it inactive and calling g_hook_unref() on it. |
| find | `find(hook_list: HookList, need_valids: gboolean, func: HookFindFunc, data: gpointer?) -> Hook` | g_hook_find |  | Finds a #GHook in a #GHookList using the given function to test for a match. |
| find_data | `find_data(hook_list: HookList, need_valids: gboolean, data: gpointer?) -> Hook` | g_hook_find_data |  | Finds a #GHook in a #GHookList with the given data. |
| find_func | `find_func(hook_list: HookList, need_valids: gboolean, func: gpointer?) -> Hook` | g_hook_find_func |  | Finds a #GHook in a #GHookList with the given function. |
| find_func_data | `find_func_data(hook_list: HookList, need_valids: gboolean, func: gpointer, data: gpointer?) -> Hook` | g_hook_find_func_data |  | Finds a #GHook in a #GHookList with the given function and data. |
| first_valid | `first_valid(hook_list: HookList, may_be_in_call: gboolean) -> Hook` | g_hook_first_valid |  | Returns the first #GHook in a #GHookList which has not been destroyed. The reference count for the #GHook is incremented, so you must call g_hook_u... |
| free | `free(hook_list: HookList, hook: Hook) -> none` | g_hook_free |  | Calls the #GHookList @finalize_hook function if it exists, and frees the memory allocated for the #GHook. |
| get | `get(hook_list: HookList, hook_id: gulong) -> Hook` | g_hook_get |  | Returns the #GHook with the given id, or %NULL if it is not found. |
| insert_before | `insert_before(hook_list: HookList, sibling: Hook?, hook: Hook) -> none` | g_hook_insert_before |  | Inserts a #GHook into a #GHookList, before a given #GHook. |
| insert_sorted | `insert_sorted(hook_list: HookList, hook: Hook, func: HookCompareFunc) -> none` | g_hook_insert_sorted |  | Inserts a #GHook into a #GHookList, sorted by the given function. |
| next_valid | `next_valid(hook_list: HookList, hook: Hook, may_be_in_call: gboolean) -> Hook` | g_hook_next_valid |  | Returns the next #GHook in a #GHookList which has not been destroyed. The reference count for the #GHook is incremented, so you must call g_hook_un... |
| prepend | `prepend(hook_list: HookList, hook: Hook) -> none` | g_hook_prepend |  | Prepends a #GHook on the start of a #GHookList. |
| ref | `ref(hook_list: HookList, hook: Hook) -> Hook` | g_hook_ref |  | Increments the reference count for a #GHook. |
| unref | `unref(hook_list: HookList, hook: Hook) -> none` | g_hook_unref |  | Decrements the reference count of a #GHook. If the reference count falls to 0, the #GHook is removed from the #GHookList and g_hook_free() is calle... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| compare_ids | `Hook.compare_ids(sibling: Hook) -> gint` | g_hook_compare_ids |  | Compares the ids of two #GHook elements, returning a negative value if the second id is greater than the first. |

### GLib.HookList

C type: `GHookList`

The #GHookList struct represents a list of hook functions.

#### Fields

| Field | Type |
| --- | --- |
| dummy | gpointer |
| dummy3 | gpointer |
| finalize_hook | HookFinalizeFunc |
| hook_size | guint |
| hooks | Hook |
| is_setup | guint |
| seq_id | gulong |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `HookList.clear() -> none` | g_hook_list_clear |  | Removes all the #GHook elements from a #GHookList. |
| init | `HookList.init(hook_size: guint) -> none` | g_hook_list_init |  | Initializes a #GHookList. This must be called before the #GHookList is used. |
| invoke | `HookList.invoke(may_recurse: gboolean) -> none` | g_hook_list_invoke |  | Calls all of the #GHook functions in a #GHookList. |
| invoke_check | `HookList.invoke_check(may_recurse: gboolean) -> none` | g_hook_list_invoke_check |  | Calls all of the #GHook functions in a #GHookList. Any function which returns %FALSE is removed from the #GHookList. |
| marshal | `HookList.marshal(may_recurse: gboolean, marshaller: HookMarshaller, marshal_data: gpointer?) -> none` | g_hook_list_marshal |  | Calls a function on each valid #GHook. |
| marshal_check | `HookList.marshal_check(may_recurse: gboolean, marshaller: HookCheckMarshaller, marshal_data: gpointer?) -> none` | g_hook_list_marshal_check |  | Calls a function on each valid #GHook and destroys it if the function returns %FALSE. |

### GLib.IConv

C type: `GIConv`

The GIConv struct wraps an iconv() conversion descriptor. It contains private data and should only be accessed using the following functions.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| open | `open(to_codeset: utf8, from_codeset: utf8) -> IConv` | g_iconv_open |  | Same as the standard UNIX routine iconv_open(), but may be implemented via libiconv on UNIX flavors that lack a native implementation. GLib provide... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
|  | `IConv.(inbuf: utf8, inbytes_left: inout gsize, outbuf: utf8, outbytes_left: inout gsize) -> gsize` | g_iconv |  | Same as the standard UNIX routine iconv(), but may be implemented via libiconv on UNIX flavors that lack a native implementation. GLib provides g_c... |
| close | `IConv.close() -> gint` | g_iconv_close |  | Same as the standard UNIX routine iconv_close(), but may be implemented via libiconv on UNIX flavors that lack a native implementation. Should be c... |

### GLib.IOChannel

GType: `GIOChannel` ?? C type: `GIOChannel`

The `GIOChannel` data type aims to provide a portable method for using file descriptors, pipes, and sockets, and integrating them into the main eve...

#### Fields

| Field | Type |
| --- | --- |
| buf_size | gsize |
| close_on_unref | guint |
| do_encode | guint |
| encoded_read_buf | String |
| encoding | utf8 |
| funcs | IOFuncs |
| is_readable | guint |
| is_seekable | guint |
| is_writeable | guint |
| line_term | utf8 |
| line_term_len | guint |
| partial_write_buf | gchar |
| read_buf | String |
| read_cd | IConv |
| ref_count | gint |
| reserved1 | gpointer |
| reserved2 | gpointer |
| use_buffer | guint |
| write_buf | String |
| write_cd | IConv |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_file | `IOChannel.new_file(filename: filename, mode: utf8) -> IOChannel throws` | g_io_channel_new_file |  | Open a file @filename as a #GIOChannel using mode @mode. This channel will be closed when the last reference to it is dropped, so there is no need ... |
| unix_new | `IOChannel.unix_new(fd: gint) -> IOChannel` | g_io_channel_unix_new |  | Creates a new #GIOChannel given a file descriptor. On UNIX systems this works for plain files, pipes, and sockets. The returned #GIOChannel has a r... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| error_from_errno | `error_from_errno(en: gint) -> IOChannelError` | g_io_channel_error_from_errno |  | Converts an `errno` error number to a #GIOChannelError. |
| error_quark | `error_quark() -> Quark` | g_io_channel_error_quark |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| close | `IOChannel.close() -> none` | g_io_channel_close |  | Close an IO channel. Any pending data to be written will be flushed, ignoring errors. The channel will not be freed until the last reference is dro... |
| flush | `IOChannel.flush() -> IOStatus throws` | g_io_channel_flush |  | Flushes the write buffer for the GIOChannel. |
| get_buffer_condition | `IOChannel.get_buffer_condition() -> IOCondition` | g_io_channel_get_buffer_condition |  | This function returns a #GIOCondition depending on whether there is data to be read/space to write data in the internal buffers in the #GIOChannel.... |
| get_buffer_size | `IOChannel.get_buffer_size() -> gsize` | g_io_channel_get_buffer_size |  | Gets the buffer size. |
| get_buffered | `IOChannel.get_buffered() -> gboolean` | g_io_channel_get_buffered |  | Returns whether @channel is buffered. |
| get_close_on_unref | `IOChannel.get_close_on_unref() -> gboolean` | g_io_channel_get_close_on_unref |  | Returns whether the file/socket/whatever associated with @channel will be closed when @channel receives its final unref and is destroyed. The defau... |
| get_encoding | `IOChannel.get_encoding() -> utf8` | g_io_channel_get_encoding |  | Gets the encoding for the input/output of the channel. The internal encoding is always UTF-8. The encoding %NULL makes the channel safe for binary ... |
| get_flags | `IOChannel.get_flags() -> IOFlags` | g_io_channel_get_flags |  | Gets the current flags for a #GIOChannel, including read-only flags such as %G_IO_FLAG_IS_READABLE. The values of the flags %G_IO_FLAG_IS_READABLE ... |
| get_line_term | `IOChannel.get_line_term(length: out gint?) -> utf8` | g_io_channel_get_line_term |  | This returns the string that #GIOChannel uses to determine where in the file a line break occurs. A value of %NULL indicates autodetection. |
| init | `IOChannel.init() -> none` | g_io_channel_init |  | Initializes a #GIOChannel struct. This is called by each of the above functions when creating a #GIOChannel, and so is not often needed by the appl... |
| read | `IOChannel.read(buf: utf8, count: gsize, bytes_read: gsize) -> IOError` | g_io_channel_read |  | Reads data from a #GIOChannel. |
| read_chars | `IOChannel.read_chars(buf: out guint8, count: gsize, bytes_read: out gsize?) -> IOStatus throws` | g_io_channel_read_chars |  | Replacement for g_io_channel_read() with the new API. |
| read_line | `IOChannel.read_line(str_return: out utf8, length: out gsize?, terminator_pos: out gsize?) -> IOStatus throws` | g_io_channel_read_line |  | Reads a line, including the terminating character(s), from a #GIOChannel into a newly-allocated string. @str_return will contain allocated memory i... |
| read_line_string | `IOChannel.read_line_string(buffer: String, terminator_pos: gsize?) -> IOStatus throws` | g_io_channel_read_line_string |  | Reads a line from a #GIOChannel, using a #GString as a buffer. |
| read_to_end | `IOChannel.read_to_end(str_return: out guint8, length: out gsize) -> IOStatus throws` | g_io_channel_read_to_end |  | Reads all the remaining data from the file. |
| read_unichar | `IOChannel.read_unichar(thechar: out gunichar) -> IOStatus throws` | g_io_channel_read_unichar |  | Reads a Unicode character from @channel. This function cannot be called on a channel with %NULL encoding. |
| ref | `IOChannel.ref() -> IOChannel` | g_io_channel_ref |  | Increments the reference count of a #GIOChannel. |
| seek | `IOChannel.seek(offset: gint64, type: SeekType) -> IOError` | g_io_channel_seek |  | Sets the current position in the #GIOChannel, similar to the standard library function fseek(). |
| seek_position | `IOChannel.seek_position(offset: gint64, type: SeekType) -> IOStatus throws` | g_io_channel_seek_position |  | Replacement for g_io_channel_seek() with the new API. |
| set_buffer_size | `IOChannel.set_buffer_size(size: gsize) -> none` | g_io_channel_set_buffer_size |  | Sets the buffer size. |
| set_buffered | `IOChannel.set_buffered(buffered: gboolean) -> none` | g_io_channel_set_buffered |  | The buffering state can only be set if the channel's encoding is %NULL. For any other encoding, the channel must be buffered. A buffered channel ca... |
| set_close_on_unref | `IOChannel.set_close_on_unref(do_close: gboolean) -> none` | g_io_channel_set_close_on_unref |  | Whether to close the channel on the final unref of the #GIOChannel data structure. The default value of this is %TRUE for channels created by g_io_... |
| set_encoding | `IOChannel.set_encoding(encoding: utf8?) -> IOStatus throws` | g_io_channel_set_encoding |  | Sets the encoding for the input/output of the channel. The internal encoding is always UTF-8. The default encoding for the external file is UTF-8. ... |
| set_flags | `IOChannel.set_flags(flags: IOFlags) -> IOStatus throws` | g_io_channel_set_flags |  | Sets the (writeable) flags in @channel to (@flags & %G_IO_FLAG_SET_MASK). |
| set_line_term | `IOChannel.set_line_term(line_term: utf8?, length: gint) -> none` | g_io_channel_set_line_term |  | This sets the string that #GIOChannel uses to determine where in the file a line break occurs. |
| shutdown | `IOChannel.shutdown(flush: gboolean) -> IOStatus throws` | g_io_channel_shutdown |  | Close an IO channel. Any pending data to be written will be flushed if @flush is %TRUE. The channel will not be freed until the last reference is d... |
| unix_get_fd | `IOChannel.unix_get_fd() -> gint` | g_io_channel_unix_get_fd |  | Returns the file descriptor of the #GIOChannel. On Windows this function returns the file descriptor or socket of the #GIOChannel. |
| unref | `IOChannel.unref() -> none` | g_io_channel_unref |  | Decrements the reference count of a #GIOChannel. |
| write | `IOChannel.write(buf: utf8, count: gsize, bytes_written: gsize) -> IOError` | g_io_channel_write |  | Writes data to a #GIOChannel. |
| write_chars | `IOChannel.write_chars(buf: guint8, count: gssize, bytes_written: out gsize) -> IOStatus throws` | g_io_channel_write_chars |  | Replacement for g_io_channel_write() with the new API. On seekable channels with encodings other than %NULL or UTF-8, generic mixing of reading and... |
| write_unichar | `IOChannel.write_unichar(thechar: gunichar) -> IOStatus throws` | g_io_channel_write_unichar |  | Writes a Unicode character to @channel. This function cannot be called on a channel with %NULL encoding. |

### GLib.IOFuncs

C type: `GIOFuncs`

A table of functions used to handle different types of #GIOChannel in a generic way.

#### Fields

| Field | Type |
| --- | --- |
| io_close | IOStatus |
| io_create_watch | Source |
| io_free | none |
| io_get_flags | IOFlags |
| io_read | IOStatus |
| io_seek | IOStatus |
| io_set_flags | IOStatus |
| io_write | IOStatus |

### GLib.KeyFile

GType: `GKeyFile` ?? C type: `GKeyFile`

`GKeyFile` parses .ini-like config files. `GKeyFile` lets you parse, edit or create files containing groups of key-value pairs, which we call "key ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `KeyFile.new() -> KeyFile` | g_key_file_new | 2.6 | Creates a new empty #GKeyFile object. Use g_key_file_load_from_file(), g_key_file_load_from_data(), g_key_file_load_from_dirs() or g_key_file_load_... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| error_quark | `error_quark() -> Quark` | g_key_file_error_quark |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free | `KeyFile.free() -> none` | g_key_file_free | 2.6 | Clears all keys and groups from @key_file, and decreases the reference count by 1. If the reference count reaches zero, frees the key file and all ... |
| get_boolean | `KeyFile.get_boolean(group_name: utf8, key: utf8) -> gboolean throws` | g_key_file_get_boolean | 2.6 | Returns the value associated with @key under @group_name as a boolean. If @key cannot be found then %FALSE is returned and @error is set to %G_KEY_... |
| get_boolean_list | `KeyFile.get_boolean_list(group_name: utf8, key: utf8, length: out gsize) -> gboolean throws` | g_key_file_get_boolean_list | 2.6 | Returns the values associated with @key under @group_name as booleans. If @key cannot be found then %NULL is returned and @error is set to %G_KEY_F... |
| get_comment | `KeyFile.get_comment(group_name: utf8?, key: utf8?) -> utf8 throws` | g_key_file_get_comment | 2.6 | Retrieves a comment above @key from @group_name. If @key is %NULL then @comment will be read from above @group_name. If both @key and @group_name a... |
| get_double | `KeyFile.get_double(group_name: utf8, key: utf8) -> gdouble throws` | g_key_file_get_double | 2.12 | Returns the value associated with @key under @group_name as a double. If @group_name is %NULL, the start_group is used. If @key cannot be found the... |
| get_double_list | `KeyFile.get_double_list(group_name: utf8, key: utf8, length: out gsize) -> gdouble throws` | g_key_file_get_double_list | 2.12 | Returns the values associated with @key under @group_name as doubles. If @key cannot be found then %NULL is returned and @error is set to %G_KEY_FI... |
| get_groups | `KeyFile.get_groups(length: out gsize?) -> utf8` | g_key_file_get_groups | 2.6 | Returns all groups in the key file loaded with @key_file. The array of returned groups will be %NULL-terminated, so @length may optionally be %NULL. |
| get_int64 | `KeyFile.get_int64(group_name: utf8, key: utf8) -> gint64 throws` | g_key_file_get_int64 | 2.26 | Returns the value associated with @key under @group_name as a signed 64-bit integer. This is similar to g_key_file_get_integer() but can return 64-... |
| get_integer | `KeyFile.get_integer(group_name: utf8, key: utf8) -> gint throws` | g_key_file_get_integer | 2.6 | Returns the value associated with @key under @group_name as an integer. If @key cannot be found then 0 is returned and @error is set to %G_KEY_FILE... |
| get_integer_list | `KeyFile.get_integer_list(group_name: utf8, key: utf8, length: out gsize) -> gint throws` | g_key_file_get_integer_list | 2.6 | Returns the values associated with @key under @group_name as integers. If @key cannot be found then %NULL is returned and @error is set to %G_KEY_F... |
| get_keys | `KeyFile.get_keys(group_name: utf8, length: out gsize?) -> utf8 throws` | g_key_file_get_keys | 2.6 | Returns all keys for the group name @group_name. The array of returned keys will be %NULL-terminated, so @length may optionally be %NULL. In the ev... |
| get_locale_for_key | `KeyFile.get_locale_for_key(group_name: utf8, key: utf8, locale: utf8?) -> utf8` | g_key_file_get_locale_for_key | 2.56 | Returns the actual locale which the result of g_key_file_get_locale_string() or g_key_file_get_locale_string_list() came from. If calling g_key_fil... |
| get_locale_string | `KeyFile.get_locale_string(group_name: utf8, key: utf8, locale: utf8?) -> utf8 throws` | g_key_file_get_locale_string | 2.6 | Returns the value associated with @key under @group_name translated in the given @locale if available. If @locale is %NULL then the current locale ... |
| get_locale_string_list | `KeyFile.get_locale_string_list(group_name: utf8, key: utf8, locale: utf8?, length: out gsize?) -> utf8 throws` | g_key_file_get_locale_string_list | 2.6 | Returns the values associated with @key under @group_name translated in the given @locale if available. If @locale is %NULL then the current locale... |
| get_start_group | `KeyFile.get_start_group() -> utf8` | g_key_file_get_start_group | 2.6 | Returns the name of the start group of the file. |
| get_string | `KeyFile.get_string(group_name: utf8, key: utf8) -> utf8 throws` | g_key_file_get_string | 2.6 | Returns the string value associated with @key under @group_name. Unlike g_key_file_get_value(), this function handles escape sequences like \s. In ... |
| get_string_list | `KeyFile.get_string_list(group_name: utf8, key: utf8, length: out gsize?) -> utf8 throws` | g_key_file_get_string_list | 2.6 | Returns the values associated with @key under @group_name. In the event the key cannot be found, %NULL is returned and @error is set to %G_KEY_FILE... |
| get_uint64 | `KeyFile.get_uint64(group_name: utf8, key: utf8) -> guint64 throws` | g_key_file_get_uint64 | 2.26 | Returns the value associated with @key under @group_name as an unsigned 64-bit integer. This is similar to g_key_file_get_integer() but can return ... |
| get_value | `KeyFile.get_value(group_name: utf8, key: utf8) -> utf8 throws` | g_key_file_get_value | 2.6 | Returns the raw value associated with @key under @group_name. Use g_key_file_get_string() to retrieve an unescaped UTF-8 string. In the event the k... |
| has_group | `KeyFile.has_group(group_name: utf8) -> gboolean` | g_key_file_has_group | 2.6 | Looks whether the key file has the group @group_name. |
| has_key | `KeyFile.has_key(group_name: utf8, key: utf8) -> gboolean throws` | g_key_file_has_key | 2.6 | Looks whether the key file has the key @key in the group @group_name. Note that this function does not follow the rules for #GError strictly; the r... |
| load_from_bytes | `KeyFile.load_from_bytes(bytes: Bytes, flags: KeyFileFlags) -> gboolean throws` | g_key_file_load_from_bytes | 2.50 | Loads a key file from the data in @bytes into an empty #GKeyFile structure. If the object cannot be created then %error is set to a #GKeyFileError. |
| load_from_data | `KeyFile.load_from_data(data: utf8, length: gsize, flags: KeyFileFlags) -> gboolean throws` | g_key_file_load_from_data | 2.6 | Loads a key file from memory into an empty #GKeyFile structure. If the object cannot be created then %error is set to a #GKeyFileError. |
| load_from_data_dirs | `KeyFile.load_from_data_dirs(file: filename, full_path: out filename?, flags: KeyFileFlags) -> gboolean throws` | g_key_file_load_from_data_dirs | 2.6 | This function looks for a key file named @file in the paths returned from g_get_user_data_dir() and g_get_system_data_dirs(), loads the file into @... |
| load_from_dirs | `KeyFile.load_from_dirs(file: filename, search_dirs: filename, full_path: out filename?, flags: KeyFileFlags) -> gboolean throws` | g_key_file_load_from_dirs | 2.14 | This function looks for a key file named @file in the paths specified in @search_dirs, loads the file into @key_file and returns the file's full pa... |
| load_from_file | `KeyFile.load_from_file(file: filename, flags: KeyFileFlags) -> gboolean throws` | g_key_file_load_from_file | 2.6 | Loads a key file into an empty #GKeyFile structure. If the OS returns an error when opening or reading the file, a %G_FILE_ERROR is returned. If th... |
| ref | `KeyFile.ref() -> KeyFile` | g_key_file_ref | 2.32 | Increases the reference count of @key_file. |
| remove_comment | `KeyFile.remove_comment(group_name: utf8?, key: utf8?) -> gboolean throws` | g_key_file_remove_comment | 2.6 | Removes a comment above @key from @group_name. If @key is %NULL then @comment will be removed above @group_name. If both @key and @group_name are %... |
| remove_group | `KeyFile.remove_group(group_name: utf8) -> gboolean throws` | g_key_file_remove_group | 2.6 | Removes the specified group, @group_name, from the key file. |
| remove_key | `KeyFile.remove_key(group_name: utf8, key: utf8) -> gboolean throws` | g_key_file_remove_key | 2.6 | Removes @key in @group_name from the key file. |
| save_to_file | `KeyFile.save_to_file(filename: utf8) -> gboolean throws` | g_key_file_save_to_file | 2.40 | Writes the contents of @key_file to @filename using g_file_set_contents(). If you need stricter guarantees about durability of the written file tha... |
| set_boolean | `KeyFile.set_boolean(group_name: utf8, key: utf8, value: gboolean) -> none` | g_key_file_set_boolean | 2.6 | Associates a new boolean value with @key under @group_name. If @key cannot be found then it is created. |
| set_boolean_list | `KeyFile.set_boolean_list(group_name: utf8, key: utf8, list: gboolean, length: gsize) -> none` | g_key_file_set_boolean_list | 2.6 | Associates a list of boolean values with @key under @group_name. If @key cannot be found then it is created. If @group_name is %NULL, the start_gro... |
| set_comment | `KeyFile.set_comment(group_name: utf8?, key: utf8?, comment: utf8) -> gboolean throws` | g_key_file_set_comment | 2.6 | Places a comment above @key from @group_name. If @key is %NULL then @comment will be written above @group_name. If both @key and @group_name are %N... |
| set_double | `KeyFile.set_double(group_name: utf8, key: utf8, value: gdouble) -> none` | g_key_file_set_double | 2.12 | Associates a new double value with @key under @group_name. If @key cannot be found then it is created. |
| set_double_list | `KeyFile.set_double_list(group_name: utf8, key: utf8, list: gdouble, length: gsize) -> none` | g_key_file_set_double_list | 2.12 | Associates a list of double values with @key under @group_name. If @key cannot be found then it is created. |
| set_int64 | `KeyFile.set_int64(group_name: utf8, key: utf8, value: gint64) -> none` | g_key_file_set_int64 | 2.26 | Associates a new integer value with @key under @group_name. If @key cannot be found then it is created. |
| set_integer | `KeyFile.set_integer(group_name: utf8, key: utf8, value: gint) -> none` | g_key_file_set_integer | 2.6 | Associates a new integer value with @key under @group_name. If @key cannot be found then it is created. |
| set_integer_list | `KeyFile.set_integer_list(group_name: utf8, key: utf8, list: gint, length: gsize) -> none` | g_key_file_set_integer_list | 2.6 | Associates a list of integer values with @key under @group_name. If @key cannot be found then it is created. |
| set_list_separator | `KeyFile.set_list_separator(separator: gchar) -> none` | g_key_file_set_list_separator | 2.6 | Sets the character which is used to separate values in lists. Typically ';' or ',' are used as separators. The default list separator is ';'. |
| set_locale_string | `KeyFile.set_locale_string(group_name: utf8, key: utf8, locale: utf8, string: utf8) -> none` | g_key_file_set_locale_string | 2.6 | Associates a string value for @key and @locale under @group_name. If the translation for @key cannot be found then it is created. |
| set_locale_string_list | `KeyFile.set_locale_string_list(group_name: utf8, key: utf8, locale: utf8, list: utf8, length: gsize) -> none` | g_key_file_set_locale_string_list | 2.6 | Associates a list of string values for @key and @locale under @group_name. If the translation for @key cannot be found then it is created. |
| set_string | `KeyFile.set_string(group_name: utf8, key: utf8, string: utf8) -> none` | g_key_file_set_string | 2.6 | Associates a new string value with @key under @group_name. If @key cannot be found then it is created. If @group_name cannot be found then it is cr... |
| set_string_list | `KeyFile.set_string_list(group_name: utf8, key: utf8, list: utf8, length: gsize) -> none` | g_key_file_set_string_list | 2.6 | Associates a list of string values for @key under @group_name. If @key cannot be found then it is created. If @group_name cannot be found then it i... |
| set_uint64 | `KeyFile.set_uint64(group_name: utf8, key: utf8, value: guint64) -> none` | g_key_file_set_uint64 | 2.26 | Associates a new integer value with @key under @group_name. If @key cannot be found then it is created. |
| set_value | `KeyFile.set_value(group_name: utf8, key: utf8, value: utf8) -> none` | g_key_file_set_value | 2.6 | Associates a new value with @key under @group_name. If @key cannot be found then it is created. If @group_name cannot be found then it is created. ... |
| to_data | `KeyFile.to_data(length: out gsize?) -> utf8 throws` | g_key_file_to_data | 2.6 | This function outputs @key_file as a string. Note that this function never reports an error, so it is safe to pass %NULL as @error. |
| unref | `KeyFile.unref() -> none` | g_key_file_unref | 2.32 | Decreases the reference count of @key_file by 1. If the reference count reaches zero, frees the key file and all its allocated memory. |

### GLib.List

C type: `GList`

The #GList struct is used for each element in a doubly-linked list.

#### Fields

| Field | Type |
| --- | --- |
| data | gpointer |
| next | GLib.List |
| prev | GLib.List |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `alloc() -> GLib.List` | g_list_alloc |  | Allocates space for one #GList element. It is called by g_list_append(), g_list_prepend(), g_list_insert() and g_list_insert_sorted() and so is rar... |
| append | `append(list: GLib.List, data: gpointer?) -> GLib.List` | g_list_append |  | Adds a new element on to the end of the list. Note that the return value is the new start of the list, if @list was empty; make sure you store the ... |
| concat | `concat(list1: GLib.List, list2: GLib.List) -> GLib.List` | g_list_concat |  | Adds the second #GList onto the end of the first #GList. Note that the elements of the second #GList are not copied. They are used directly. This f... |
| copy | `copy(list: GLib.List) -> GLib.List` | g_list_copy |  | Copies a #GList. Note that this is a "shallow" copy. If the list elements consist of pointers to data, the pointers are copied but the actual data ... |
| copy_deep | `copy_deep(list: GLib.List, func: CopyFunc, user_data: gpointer?) -> GLib.List` | g_list_copy_deep | 2.34 | Makes a full (deep) copy of a #GList. In contrast with g_list_copy(), this function uses @func to make a copy of each list element, in addition to ... |
| delete_link | `delete_link(list: GLib.List, link_: GLib.List) -> GLib.List` | g_list_delete_link |  | Removes the node link_ from the list and frees it. Compare this to g_list_remove_link() which removes the node without freeing it. |
| find | `find(list: GLib.List, data: gpointer?) -> GLib.List` | g_list_find |  | Finds the element in a #GList which contains the given data. |
| find_custom | `find_custom(list: GLib.List, data: gpointer?, func: CompareFunc) -> GLib.List` | g_list_find_custom |  | Finds an element in a #GList, using a supplied function to find the desired element. It iterates over the list, calling the given function which sh... |
| first | `first(list: GLib.List) -> GLib.List` | g_list_first |  | Gets the first element in a #GList. |
| foreach | `foreach(list: GLib.List, func: Func, user_data: gpointer?) -> none` | g_list_foreach |  | Calls a function for each element of a #GList. It is safe for @func to remove the element from @list, but it must not modify any part of the list a... |
| free | `free(list: GLib.List) -> none` | g_list_free |  | Frees all of the memory used by a #GList. The freed elements are returned to the slice allocator. If list elements contain dynamically-allocated me... |
| free_1 | `free_1(list: GLib.List) -> none` | g_list_free_1 |  | Frees one #GList element, but does not update links from the next and previous elements in the list, so you should not call this function on an ele... |
| free_full | `free_full(list: GLib.List, free_func: DestroyNotify) -> none` | g_list_free_full | 2.28 | Convenience method, which frees all the memory used by a #GList, and calls @free_func on every element's data. @free_func must not modify the list ... |
| index | `index(list: GLib.List, data: gpointer?) -> gint` | g_list_index |  | Gets the position of the element containing the given data (starting from 0). |
| insert | `insert(list: GLib.List, data: gpointer?, position: gint) -> GLib.List` | g_list_insert |  | Inserts a new element into the list at the given position. |
| insert_before | `insert_before(list: GLib.List, sibling: GLib.List, data: gpointer?) -> GLib.List` | g_list_insert_before |  | Inserts a new element into the list before the given position. |
| insert_before_link | `insert_before_link(list: GLib.List, sibling: GLib.List?, link_: GLib.List) -> GLib.List` | g_list_insert_before_link | 2.62 | Inserts @link_ into the list before the given position. |
| insert_sorted | `insert_sorted(list: GLib.List, data: gpointer?, func: CompareFunc) -> GLib.List` | g_list_insert_sorted |  | Inserts a new element into the list, using the given comparison function to determine its position. If you are adding many new elements to a list, ... |
| insert_sorted_with_data | `insert_sorted_with_data(list: GLib.List, data: gpointer?, func: CompareDataFunc, user_data: gpointer?) -> GLib.List` | g_list_insert_sorted_with_data | 2.10 | Inserts a new element into the list, using the given comparison function to determine its position. If you are adding many new elements to a list, ... |
| last | `last(list: GLib.List) -> GLib.List` | g_list_last |  | Gets the last element in a #GList. |
| length | `length(list: GLib.List) -> guint` | g_list_length |  | Gets the number of elements in a #GList. This function iterates over the whole list to count its elements. Use a #GQueue instead of a GList if you ... |
| nth | `nth(list: GLib.List, n: guint) -> GLib.List` | g_list_nth |  | Gets the element at the given position in a #GList. This iterates over the list until it reaches the @n-th position. If you intend to iterate over ... |
| nth_data | `nth_data(list: GLib.List, n: guint) -> gpointer` | g_list_nth_data |  | Gets the data of the element at the given position. This iterates over the list until it reaches the @n-th position. If you intend to iterate over ... |
| nth_prev | `nth_prev(list: GLib.List, n: guint) -> GLib.List` | g_list_nth_prev |  | Gets the element @n places before @list. |
| pop_allocator | `pop_allocator() -> none` | g_list_pop_allocator |  |  |
| position | `position(list: GLib.List, llink: GLib.List) -> gint` | g_list_position |  | Gets the position of the given element in the #GList (starting from 0). |
| prepend | `prepend(list: GLib.List, data: gpointer?) -> GLib.List` | g_list_prepend |  | Prepends a new element on to the start of the list. Note that the return value is the new start of the list, which will have changed, so make sure ... |
| push_allocator | `push_allocator(allocator: Allocator) -> none` | g_list_push_allocator |  |  |
| remove | `remove(list: GLib.List, data: gpointer?) -> GLib.List` | g_list_remove |  | Removes an element from a #GList. If two elements contain the same data, only the first is removed. If none of the elements contain the data, the #... |
| remove_all | `remove_all(list: GLib.List, data: gpointer?) -> GLib.List` | g_list_remove_all |  | Removes all list nodes with data equal to @data. Returns the new head of the list. Contrast with g_list_remove() which removes only the first node ... |
| remove_link | `remove_link(list: GLib.List, llink: GLib.List) -> GLib.List` | g_list_remove_link |  | Removes an element from a #GList, without freeing the element. The removed element's prev and next links are set to %NULL, so that it becomes a sel... |
| reverse | `reverse(list: GLib.List) -> GLib.List` | g_list_reverse |  | Reverses a #GList. It simply switches the next and prev pointers of each element. |
| sort | `sort(list: GLib.List, compare_func: CompareFunc) -> GLib.List` | g_list_sort |  | Sorts a #GList using the given comparison function. The algorithm used is a stable sort. |
| sort_with_data | `sort_with_data(list: GLib.List, compare_func: CompareDataFunc, user_data: gpointer?) -> GLib.List` | g_list_sort_with_data |  | Like g_list_sort(), but the comparison function accepts a user data argument. |

### GLib.LogField

C type: `GLogField`

Structure representing a single field in a structured log entry. See g_log_structured() for details. Log fields may contain arbitrary values, inclu...

#### Fields

| Field | Type |
| --- | --- |
| key | utf8 |
| length | gssize |
| value | gpointer |

### GLib.MainContext

GType: `GMainContext` ?? C type: `GMainContext`

The `GMainContext` struct is an opaque data type representing a set of sources to be handled in a main loop.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MainContext.new() -> MainContext` | g_main_context_new |  | Creates a new #GMainContext structure. |
| new_with_flags | `MainContext.new_with_flags(flags: MainContextFlags) -> MainContext` | g_main_context_new_with_flags | 2.72 | Creates a new #GMainContext structure. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| default | `default() -> MainContext` | g_main_context_default |  | Returns the global-default main context. This is the main context used for main loop functions when a main loop is not explicitly specified, and co... |
| get_thread_default | `get_thread_default() -> MainContext` | g_main_context_get_thread_default | 2.22 | Gets the thread-default #GMainContext for this thread. Asynchronous operations that want to be able to be run in contexts other than the default on... |
| ref_thread_default | `ref_thread_default() -> MainContext` | g_main_context_ref_thread_default | 2.32 | Gets the thread-default #GMainContext for this thread, as with g_main_context_get_thread_default(), but also adds a reference to it with g_main_con... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| acquire | `MainContext.acquire() -> gboolean` | g_main_context_acquire |  | Tries to become the owner of the specified context. If some other thread is the owner of the context, returns %FALSE immediately. Ownership is prop... |
| add_poll | `MainContext.add_poll(fd: PollFD, priority: gint) -> none` | g_main_context_add_poll |  | Adds a file descriptor to the set of file descriptors polled for this context. This will very seldom be used directly. Instead a typical event sour... |
| check | `MainContext.check(max_priority: gint, fds: PollFD, n_fds: gint) -> gboolean` | g_main_context_check |  | Passes the results of polling back to the main loop. You should be careful to pass @fds and its length @n_fds as received from g_main_context_query... |
| dispatch | `MainContext.dispatch() -> none` | g_main_context_dispatch |  | Dispatches all pending sources. You must have successfully acquired the context with g_main_context_acquire() before you may call this function. Si... |
| find_source_by_funcs_user_data | `MainContext.find_source_by_funcs_user_data(funcs: SourceFuncs, user_data: gpointer?) -> Source` | g_main_context_find_source_by_funcs_user_data |  | Finds a source with the given source functions and user data. If multiple sources exist with the same source function and user data, the first one ... |
| find_source_by_id | `MainContext.find_source_by_id(source_id: guint) -> Source` | g_main_context_find_source_by_id |  | Finds a #GSource given a pair of context and ID. It is a programmer error to attempt to look up a non-existent source. More specifically: source ID... |
| find_source_by_user_data | `MainContext.find_source_by_user_data(user_data: gpointer?) -> Source` | g_main_context_find_source_by_user_data |  | Finds a source with the given user data for the callback. If multiple sources exist with the same user data, the first one found will be returned. |
| get_poll_func | `MainContext.get_poll_func() -> PollFunc` | g_main_context_get_poll_func |  | Gets the poll function set by g_main_context_set_poll_func(). |
| invoke | `MainContext.invoke(function: SourceFunc, data: gpointer?) -> none` | g_main_context_invoke | 2.28 | Invokes a function in such a way that @context is owned during the invocation of @function. If @context is %NULL then the global-default main conte... |
| invoke_full | `MainContext.invoke_full(priority: gint, function: SourceFunc, data: gpointer?, notify: DestroyNotify?) -> none` | g_main_context_invoke_full | 2.28 | Invokes a function in such a way that @context is owned during the invocation of @function. This function is the same as g_main_context_invoke() ex... |
| is_owner | `MainContext.is_owner() -> gboolean` | g_main_context_is_owner | 2.10 | Determines whether this thread holds the (recursive) ownership of this #GMainContext. This is useful to know before waiting on another thread that ... |
| iteration | `MainContext.iteration(may_block: gboolean) -> gboolean` | g_main_context_iteration |  | Runs a single iteration for the given main loop. This involves checking to see if any event sources are ready to be processed, then if no events so... |
| pending | `MainContext.pending() -> gboolean` | g_main_context_pending |  | Checks if any sources have pending events for the given context. |
| pop_thread_default | `MainContext.pop_thread_default() -> none` | g_main_context_pop_thread_default | 2.22 | Pops @context off the thread-default context stack (verifying that it was on the top of the stack). |
| prepare | `MainContext.prepare(priority: out gint?) -> gboolean` | g_main_context_prepare |  | Prepares to poll sources within a main loop. The resulting information for polling is determined by calling g_main_context_query (). You must have ... |
| push_thread_default | `MainContext.push_thread_default() -> none` | g_main_context_push_thread_default | 2.22 | Acquires @context and sets it as the thread-default context for the current thread. This will cause certain asynchronous operations (such as most [... |
| query | `MainContext.query(max_priority: gint, timeout_: out gint, fds: out PollFD, n_fds: gint) -> gint` | g_main_context_query |  | Determines information necessary to poll this main loop. You should be careful to pass the resulting @fds array and its length @n_fds as is when ca... |
| ref | `MainContext.ref() -> MainContext` | g_main_context_ref |  | Increases the reference count on a #GMainContext object by one. |
| release | `MainContext.release() -> none` | g_main_context_release |  | Releases ownership of a context previously acquired by this thread with g_main_context_acquire(). If the context was acquired multiple times, the o... |
| remove_poll | `MainContext.remove_poll(fd: PollFD) -> none` | g_main_context_remove_poll |  | Removes file descriptor from the set of file descriptors to be polled for a particular context. |
| set_poll_func | `MainContext.set_poll_func(func: PollFunc) -> none` | g_main_context_set_poll_func |  | Sets the function to use to handle polling of file descriptors. It will be used instead of the poll() system call (or GLib's replacement function, ... |
| unref | `MainContext.unref() -> none` | g_main_context_unref |  | Decreases the reference count on a #GMainContext object by one. If the result is zero, free the context and free all associated memory. |
| wait | `MainContext.wait(cond: Cond, mutex: Mutex) -> gboolean` | g_main_context_wait |  | Tries to become the owner of the specified context, as with g_main_context_acquire(). But if another thread is the owner, atomically drop @mutex an... |
| wakeup | `MainContext.wakeup() -> none` | g_main_context_wakeup |  | If @context is currently blocking in g_main_context_iteration() waiting for a source to become ready, cause it to stop blocking and return. Otherwi... |

### GLib.MainLoop

GType: `GMainLoop` ?? C type: `GMainLoop`

The `GMainLoop` struct is an opaque data type representing the main event loop of a GLib or GTK application.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MainLoop.new(context: MainContext?, is_running: gboolean) -> MainLoop` | g_main_loop_new |  | Creates a new #GMainLoop structure. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_context | `MainLoop.get_context() -> MainContext` | g_main_loop_get_context |  | Returns the #GMainContext of @loop. |
| is_running | `MainLoop.is_running() -> gboolean` | g_main_loop_is_running |  | Checks to see if the main loop is currently being run via g_main_loop_run(). |
| quit | `MainLoop.quit() -> none` | g_main_loop_quit |  | Stops a #GMainLoop from running. Any calls to g_main_loop_run() for the loop will return. Note that sources that have already been dispatched when ... |
| ref | `MainLoop.ref() -> MainLoop` | g_main_loop_ref |  | Increases the reference count on a #GMainLoop object by one. |
| run | `MainLoop.run() -> none` | g_main_loop_run |  | Runs a main loop until g_main_loop_quit() is called on the loop. If this is called for the thread of the loop's #GMainContext, it will process even... |
| unref | `MainLoop.unref() -> none` | g_main_loop_unref |  | Decreases the reference count on a #GMainLoop object by one. If the result is zero, free the loop and free all associated memory. |

### GLib.MappedFile

GType: `GMappedFile` ?? C type: `GMappedFile`

The #GMappedFile represents a file mapping created with g_mapped_file_new(). It has only private members and should not be accessed directly.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MappedFile.new(filename: filename, writable: gboolean) -> MappedFile throws` | g_mapped_file_new | 2.8 | Maps a file into memory. On UNIX, this is using the mmap() function. If @writable is %TRUE, the mapped buffer may be modified, otherwise it is an e... |
| new_from_fd | `MappedFile.new_from_fd(fd: gint, writable: gboolean) -> MappedFile throws` | g_mapped_file_new_from_fd | 2.32 | Maps a file into memory. On UNIX, this is using the mmap() function. If @writable is %TRUE, the mapped buffer may be modified, otherwise it is an e... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free | `MappedFile.free() -> none` | g_mapped_file_free | 2.8 | This call existed before #GMappedFile had refcounting and is currently exactly the same as g_mapped_file_unref(). |
| get_bytes | `MappedFile.get_bytes() -> Bytes` | g_mapped_file_get_bytes | 2.34 | Creates a new #GBytes which references the data mapped from @file. The mapped contents of the file must not be modified after creating this bytes o... |
| get_contents | `MappedFile.get_contents() -> utf8` | g_mapped_file_get_contents | 2.8 | Returns the contents of a #GMappedFile. Note that the contents may not be zero-terminated, even if the #GMappedFile is backed by a text file. If th... |
| get_length | `MappedFile.get_length() -> gsize` | g_mapped_file_get_length | 2.8 | Returns the length of the contents of a #GMappedFile. |
| ref | `MappedFile.ref() -> MappedFile` | g_mapped_file_ref | 2.22 | Increments the reference count of @file by one. It is safe to call this function from any thread. |
| unref | `MappedFile.unref() -> none` | g_mapped_file_unref |  | Decrements the reference count of @file by one. If the reference count drops to 0, unmaps the buffer of @file and frees it. It is safe to call this... |

### GLib.MarkupParseContext

GType: `GMarkupParseContext` ?? C type: `GMarkupParseContext`

A parse context is used to parse a stream of bytes that you expect to contain marked-up text. See g_markup_parse_context_new(), #GMarkupParser, and...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MarkupParseContext.new(parser: MarkupParser, flags: MarkupParseFlags, user_data: gpointer?, user_data_dnotify: DestroyNotify) -> MarkupParseContext` | g_markup_parse_context_new |  | Creates a new parse context. A parse context is used to parse marked-up documents. You can feed any number of documents into a context, as long as ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| end_parse | `MarkupParseContext.end_parse() -> gboolean throws` | g_markup_parse_context_end_parse |  | Signals to the #GMarkupParseContext that all data has been fed into the parse context with g_markup_parse_context_parse(). This function reports an... |
| free | `MarkupParseContext.free() -> none` | g_markup_parse_context_free |  | Frees a #GMarkupParseContext. This function can't be called from inside one of the #GMarkupParser functions or while a subparser is pushed. |
| get_element | `MarkupParseContext.get_element() -> utf8` | g_markup_parse_context_get_element | 2.2 | Retrieves the name of the currently open element. If called from the start_element or end_element handlers this will give the element_name as passe... |
| get_element_stack | `MarkupParseContext.get_element_stack() -> GLib.SList` | g_markup_parse_context_get_element_stack | 2.16 | Retrieves the element stack from the internal state of the parser. The returned #GSList is a list of strings where the first item is the currently ... |
| get_position | `MarkupParseContext.get_position(line_number: out gint?, char_number: out gint?) -> none` | g_markup_parse_context_get_position |  | Retrieves the current line number and the number of the character on that line. Intended for use in error messages; there are no strict semantics f... |
| get_user_data | `MarkupParseContext.get_user_data() -> gpointer` | g_markup_parse_context_get_user_data | 2.18 | Returns the user_data associated with @context. This will either be the user_data that was provided to g_markup_parse_context_new() or to the most ... |
| parse | `MarkupParseContext.parse(text: utf8, text_len: gssize) -> gboolean throws` | g_markup_parse_context_parse |  | Feed some data to the #GMarkupParseContext. The data need not be valid UTF-8; an error will be signaled if it's invalid. The data need not be an en... |
| pop | `MarkupParseContext.pop() -> gpointer` | g_markup_parse_context_pop | 2.18 | Completes the process of a temporary sub-parser redirection. This function exists to collect the user_data allocated by a matching call to g_markup... |
| push | `MarkupParseContext.push(parser: MarkupParser, user_data: gpointer?) -> none` | g_markup_parse_context_push | 2.18 | Temporarily redirects markup data to a sub-parser. This function may only be called from the start_element handler of a #GMarkupParser. It must be ... |
| ref | `MarkupParseContext.ref() -> MarkupParseContext` | g_markup_parse_context_ref | 2.36 | Increases the reference count of @context. |
| unref | `MarkupParseContext.unref() -> none` | g_markup_parse_context_unref | 2.36 | Decreases the reference count of @context. When its reference count drops to 0, it is freed. |

### GLib.MarkupParser

C type: `GMarkupParser`

Any of the fields in #GMarkupParser can be %NULL, in which case they will be ignored. Except for the @error function, any of these callbacks can se...

#### Fields

| Field | Type |
| --- | --- |
| end_element | none |
| error | none |
| passthrough | none |
| start_element | none |
| text | none |

### GLib.MatchInfo

GType: `GMatchInfo` ?? C type: `GMatchInfo`

A GMatchInfo is an opaque struct used to return information about matches.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| expand_references | `MatchInfo.expand_references(string_to_expand: utf8) -> utf8 throws` | g_match_info_expand_references | 2.14 | Returns a new string containing the text in @string_to_expand with references and escape sequences expanded. References refer to the last match don... |
| fetch | `MatchInfo.fetch(match_num: gint) -> utf8` | g_match_info_fetch | 2.14 | Retrieves the text matching the @match_num'th capturing parentheses. 0 is the full text of the match, 1 is the first paren set, 2 the second, and s... |
| fetch_all | `MatchInfo.fetch_all() -> utf8` | g_match_info_fetch_all | 2.14 | Bundles up pointers to each of the matching substrings from a match and stores them in an array of gchar pointers. The first element in the returne... |
| fetch_named | `MatchInfo.fetch_named(name: utf8) -> utf8` | g_match_info_fetch_named | 2.14 | Retrieves the text matching the capturing parentheses named @name. If @name is a valid sub pattern name but it didn't match anything (e.g. sub patt... |
| fetch_named_pos | `MatchInfo.fetch_named_pos(name: utf8, start_pos: out gint?, end_pos: out gint?) -> gboolean` | g_match_info_fetch_named_pos | 2.14 | Retrieves the position in bytes of the capturing parentheses named @name. If @name is a valid sub pattern name but it didn't match anything (e.g. s... |
| fetch_pos | `MatchInfo.fetch_pos(match_num: gint, start_pos: out gint?, end_pos: out gint?) -> gboolean` | g_match_info_fetch_pos | 2.14 | Retrieves the position in bytes of the @match_num'th capturing parentheses. 0 is the full text of the match, 1 is the first paren set, 2 the second... |
| free | `MatchInfo.free() -> none` | g_match_info_free | 2.14 | If @match_info is not %NULL, calls g_match_info_unref(); otherwise does nothing. |
| get_match_count | `MatchInfo.get_match_count() -> gint` | g_match_info_get_match_count | 2.14 | Retrieves the number of matched substrings (including substring 0, that is the whole matched text), so 1 is returned if the pattern has no substrin... |
| get_regex | `MatchInfo.get_regex() -> Regex` | g_match_info_get_regex | 2.14 | Returns #GRegex object used in @match_info. It belongs to Glib and must not be freed. Use g_regex_ref() if you need to keep it after you free @matc... |
| get_string | `MatchInfo.get_string() -> utf8` | g_match_info_get_string | 2.14 | Returns the string searched with @match_info. This is the string passed to g_regex_match() or g_regex_replace() so you may not free it before calli... |
| is_partial_match | `MatchInfo.is_partial_match() -> gboolean` | g_match_info_is_partial_match | 2.14 | Usually if the string passed to g_regex_match*() matches as far as it goes, but is too short to match the entire pattern, %FALSE is returned. There... |
| matches | `MatchInfo.matches() -> gboolean` | g_match_info_matches | 2.14 | Returns whether the previous match operation succeeded. |
| next | `MatchInfo.next() -> gboolean throws` | g_match_info_next | 2.14 | Scans for the next match using the same parameters of the previous call to g_regex_match_full() or g_regex_match() that returned @match_info. The m... |
| ref | `MatchInfo.ref() -> MatchInfo` | g_match_info_ref | 2.30 | Increases reference count of @match_info by 1. |
| unref | `MatchInfo.unref() -> none` | g_match_info_unref | 2.30 | Decreases reference count of @match_info by 1. When reference count drops to zero, it frees all the memory associated with the match_info structure. |

### GLib.MemChunk

C type: `GMemChunk`

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| info | `info() -> none` | g_mem_chunk_info |  |  |
| new | `new(name: utf8, atom_size: gint, area_size: gsize, type: gint) -> MemChunk` | g_mem_chunk_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `MemChunk.alloc() -> gpointer` | g_mem_chunk_alloc |  |  |
| alloc0 | `MemChunk.alloc0() -> gpointer` | g_mem_chunk_alloc0 |  |  |
| clean | `MemChunk.clean() -> none` | g_mem_chunk_clean |  |  |
| destroy | `MemChunk.destroy() -> none` | g_mem_chunk_destroy |  |  |
| free | `MemChunk.free(mem: gpointer?) -> none` | g_mem_chunk_free |  |  |
| print | `MemChunk.print() -> none` | g_mem_chunk_print |  |  |
| reset | `MemChunk.reset() -> none` | g_mem_chunk_reset |  |  |

### GLib.MemVTable

C type: `GMemVTable`

A set of functions used to perform memory allocation. The same #GMemVTable must be used for all allocations in the same program; a call to g_mem_se...

#### Fields

| Field | Type |
| --- | --- |
| calloc | gpointer |
| free | none |
| malloc | gpointer |
| realloc | gpointer |
| try_malloc | gpointer |
| try_realloc | gpointer |

### GLib.mpn

C type: `mpn`

#### Fields

| Field | Type |
| --- | --- |
| biased_exponent | guint |
| mantissa | guint |
| sign | guint |

### GLib.mpn

C type: `mpn`

#### Fields

| Field | Type |
| --- | --- |
| biased_exponent | guint |
| mantissa_high | guint |
| mantissa_low | guint |
| sign | guint |

### GLib.Node

C type: `GNode`

The #GNode struct represents one node in a [n-ary tree][glib-N-ary-Trees].

#### Fields

| Field | Type |
| --- | --- |
| children | Node |
| data | gpointer |
| next | Node |
| parent | Node |
| prev | Node |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(data: gpointer?) -> Node` | g_node_new |  | Creates a new #GNode containing the given data. Used to create the first node in a tree. |
| pop_allocator | `pop_allocator() -> none` | g_node_pop_allocator |  |  |
| push_allocator | `push_allocator(allocator: Allocator) -> none` | g_node_push_allocator |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| child_index | `Node.child_index(data: gpointer?) -> gint` | g_node_child_index |  | Gets the position of the first child of a #GNode which contains the given data. |
| child_position | `Node.child_position(child: Node) -> gint` | g_node_child_position |  | Gets the position of a #GNode with respect to its siblings. @child must be a child of @node. The first child is numbered 0, the second 1, and so on. |
| children_foreach | `Node.children_foreach(flags: TraverseFlags, func: NodeForeachFunc, data: gpointer?) -> none` | g_node_children_foreach |  | Calls a function for each of the children of a #GNode. Note that it doesn't descend beneath the child nodes. @func must not do anything that would ... |
| copy | `Node.copy() -> Node` | g_node_copy |  | Recursively copies a #GNode (but does not deep-copy the data inside the nodes, see g_node_copy_deep() if you need that). |
| copy_deep | `Node.copy_deep(copy_func: CopyFunc, data: gpointer?) -> Node` | g_node_copy_deep | 2.4 | Recursively copies a #GNode and its data. |
| depth | `Node.depth() -> guint` | g_node_depth |  | Gets the depth of a #GNode. If @node is %NULL the depth is 0. The root node has a depth of 1. For the children of the root node the depth is 2. And... |
| destroy | `Node.destroy() -> none` | g_node_destroy |  | Removes @root and its children from the tree, freeing any memory allocated. |
| find | `Node.find(order: TraverseType, flags: TraverseFlags, data: gpointer?) -> Node` | g_node_find |  | Finds a #GNode in a tree. |
| find_child | `Node.find_child(flags: TraverseFlags, data: gpointer?) -> Node` | g_node_find_child |  | Finds the first child of a #GNode with the given data. |
| first_sibling | `Node.first_sibling() -> Node` | g_node_first_sibling |  | Gets the first sibling of a #GNode. This could possibly be the node itself. |
| get_root | `Node.get_root() -> Node` | g_node_get_root |  | Gets the root of a tree. |
| insert | `Node.insert(position: gint, node: Node) -> Node` | g_node_insert |  | Inserts a #GNode beneath the parent at the given position. |
| insert_after | `Node.insert_after(sibling: Node, node: Node) -> Node` | g_node_insert_after |  | Inserts a #GNode beneath the parent after the given sibling. |
| insert_before | `Node.insert_before(sibling: Node, node: Node) -> Node` | g_node_insert_before |  | Inserts a #GNode beneath the parent before the given sibling. |
| is_ancestor | `Node.is_ancestor(descendant: Node) -> gboolean` | g_node_is_ancestor |  | Returns %TRUE if @node is an ancestor of @descendant. This is true if node is the parent of @descendant, or if node is the grandparent of @descenda... |
| last_child | `Node.last_child() -> Node` | g_node_last_child |  | Gets the last child of a #GNode. |
| last_sibling | `Node.last_sibling() -> Node` | g_node_last_sibling |  | Gets the last sibling of a #GNode. This could possibly be the node itself. |
| max_height | `Node.max_height() -> guint` | g_node_max_height |  | Gets the maximum height of all branches beneath a #GNode. This is the maximum distance from the #GNode to all leaf nodes. If @root is %NULL, 0 is r... |
| n_children | `Node.n_children() -> guint` | g_node_n_children |  | Gets the number of children of a #GNode. |
| n_nodes | `Node.n_nodes(flags: TraverseFlags) -> guint` | g_node_n_nodes |  | Gets the number of nodes in a tree. |
| nth_child | `Node.nth_child(n: guint) -> Node` | g_node_nth_child |  | Gets a child of a #GNode, using the given index. The first child is at index 0. If the index is too big, %NULL is returned. |
| prepend | `Node.prepend(node: Node) -> Node` | g_node_prepend |  | Inserts a #GNode as the first child of the given parent. |
| reverse_children | `Node.reverse_children() -> none` | g_node_reverse_children |  | Reverses the order of the children of a #GNode. (It doesn't change the order of the grandchildren.) |
| traverse | `Node.traverse(order: TraverseType, flags: TraverseFlags, max_depth: gint, func: NodeTraverseFunc, data: gpointer?) -> none` | g_node_traverse |  | Traverses a tree starting at the given root #GNode. It calls the given function for each node visited. The traversal can be halted at any point by ... |
| unlink | `Node.unlink() -> none` | g_node_unlink |  | Unlinks a #GNode from a tree, resulting in two separate trees. |

### GLib.Once

C type: `GOnce`

A #GOnce struct controls a one-time initialization function. Any one-time initialization function must have its own unique #GOnce struct.

#### Fields

| Field | Type |
| --- | --- |
| retval | gpointer |
| status | OnceStatus |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| init_enter | `init_enter(location: inout gpointer) -> gboolean` | g_once_init_enter | 2.14 | Function to be called when starting a critical initialization section. The argument @location must point to a static 0-initialized variable that wi... |
| init_enter_impl | `init_enter_impl(location: gsize) -> gboolean` | g_once_init_enter_impl |  |  |
| init_enter_pointer | `init_enter_pointer(location: gpointer) -> gboolean` | g_once_init_enter_pointer | 2.80 | This functions behaves in the same way as g_once_init_enter(), but can can be used to initialize pointers (or #guintptr) instead of #gsize. \|[<!-- ... |
| init_leave | `init_leave(location: inout gpointer, result: gsize) -> none` | g_once_init_leave | 2.14 | Counterpart to g_once_init_enter(). Expects a location of a static 0-initialized initialization variable, and an initialization value other than 0.... |
| init_leave_pointer | `init_leave_pointer(location: gpointer, result: gpointer?) -> none` | g_once_init_leave_pointer | 2.80 | Counterpart to g_once_init_enter_pointer(). Expects a location of a static `NULL`-initialized initialization variable, and an initialization value ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| impl | `Once.impl(func: ThreadFunc, arg: gpointer?) -> gpointer` | g_once_impl |  |  |

### GLib.OptionContext

C type: `GOptionContext`

A `GOptionContext` struct defines which options are accepted by the commandline option parser. The struct has only private fields and should not be...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(parameter_string: utf8?) -> OptionContext` | g_option_context_new | 2.6 | Creates a new option context. The @parameter_string can serve multiple purposes. It can be used to add descriptions for "rest" arguments, which are... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_group | `OptionContext.add_group(group: OptionGroup) -> none` | g_option_context_add_group | 2.6 | Adds a #GOptionGroup to the @context, so that parsing with @context will recognize the options in the group. Note that this will take ownership of ... |
| add_main_entries | `OptionContext.add_main_entries(entries: OptionEntry, translation_domain: utf8?) -> none` | g_option_context_add_main_entries | 2.6 | A convenience function which creates a main group if it doesn't exist, adds the @entries to it and sets the translation domain. |
| free | `OptionContext.free() -> none` | g_option_context_free | 2.6 | Frees context and all the groups which have been added to it. Please note that parsed arguments need to be freed separately (see #GOptionEntry). |
| get_description | `OptionContext.get_description() -> utf8` | g_option_context_get_description | 2.12 | Returns the description. See g_option_context_set_description(). |
| get_help | `OptionContext.get_help(main_help: gboolean, group: OptionGroup?) -> utf8` | g_option_context_get_help | 2.14 | Returns a formatted, translated help text for the given context. To obtain the text produced by `--help`, call `g_option_context_get_help (context,... |
| get_help_enabled | `OptionContext.get_help_enabled() -> gboolean` | g_option_context_get_help_enabled | 2.6 | Returns whether automatic `--help` generation is turned on for @context. See g_option_context_set_help_enabled(). |
| get_ignore_unknown_options | `OptionContext.get_ignore_unknown_options() -> gboolean` | g_option_context_get_ignore_unknown_options | 2.6 | Returns whether unknown options are ignored or not. See g_option_context_set_ignore_unknown_options(). |
| get_main_group | `OptionContext.get_main_group() -> OptionGroup` | g_option_context_get_main_group | 2.6 | Returns a pointer to the main group of @context. |
| get_strict_posix | `OptionContext.get_strict_posix() -> gboolean` | g_option_context_get_strict_posix | 2.44 | Returns whether strict POSIX code is enabled. See g_option_context_set_strict_posix() for more information. |
| get_summary | `OptionContext.get_summary() -> utf8` | g_option_context_get_summary | 2.12 | Returns the summary. See g_option_context_set_summary(). |
| parse | `OptionContext.parse(argc: inout gint?, argv: inout utf8?) -> gboolean throws` | g_option_context_parse | 2.6 | Parses the command line arguments, recognizing options which have been added to @context. A side-effect of calling this function is that g_set_prgn... |
| parse_strv | `OptionContext.parse_strv(arguments: inout utf8?) -> gboolean throws` | g_option_context_parse_strv | 2.40 | Parses the command line arguments. This function is similar to g_option_context_parse() except that it respects the normal memory rules when dealin... |
| set_description | `OptionContext.set_description(description: utf8?) -> none` | g_option_context_set_description | 2.12 | Adds a string to be displayed in `--help` output after the list of options. This text often includes a bug reporting address. Note that the summary... |
| set_help_enabled | `OptionContext.set_help_enabled(help_enabled: gboolean) -> none` | g_option_context_set_help_enabled | 2.6 | Enables or disables automatic generation of `--help` output. By default, g_option_context_parse() recognizes `--help`, `-h`, `-?`, `--help-all` and... |
| set_ignore_unknown_options | `OptionContext.set_ignore_unknown_options(ignore_unknown: gboolean) -> none` | g_option_context_set_ignore_unknown_options | 2.6 | Sets whether to ignore unknown options or not. If an argument is ignored, it is left in the @argv array after parsing. By default, g_option_context... |
| set_main_group | `OptionContext.set_main_group(group: OptionGroup) -> none` | g_option_context_set_main_group | 2.6 | Sets a #GOptionGroup as main group of the @context. This has the same effect as calling g_option_context_add_group(), the only difference is that t... |
| set_strict_posix | `OptionContext.set_strict_posix(strict_posix: gboolean) -> none` | g_option_context_set_strict_posix | 2.44 | Sets strict POSIX mode. By default, this mode is disabled. In strict POSIX mode, the first non-argument parameter encountered (eg: filename) termin... |
| set_summary | `OptionContext.set_summary(summary: utf8?) -> none` | g_option_context_set_summary | 2.12 | Adds a string to be displayed in `--help` output before the list of options. This is typically a summary of the program functionality. Note that th... |
| set_translate_func | `OptionContext.set_translate_func(func: TranslateFunc?, data: gpointer?, destroy_notify: DestroyNotify?) -> none` | g_option_context_set_translate_func | 2.12 | Sets the function which is used to translate the contexts user-visible strings, for `--help` output. If @func is %NULL, strings are not translated.... |
| set_translation_domain | `OptionContext.set_translation_domain(domain: utf8) -> none` | g_option_context_set_translation_domain | 2.12 | A convenience function to use gettext() for translating user-visible strings. |

### GLib.OptionEntry

C type: `GOptionEntry`

A GOptionEntry struct defines a single option. To have an effect, they must be added to a #GOptionGroup with g_option_context_add_main_entries() or...

#### Fields

| Field | Type |
| --- | --- |
| arg | OptionArg |
| arg_data | gpointer |
| arg_description | utf8 |
| description | utf8 |
| flags | gint |
| long_name | utf8 |
| short_name | gchar |

### GLib.OptionGroup

GType: `GOptionGroup` ?? C type: `GOptionGroup`

A `GOptionGroup` struct defines the options in a single group. The struct has only private fields and should not be directly accessed. All options ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `OptionGroup.new(name: utf8, description: utf8, help_description: utf8, user_data: gpointer?, destroy: DestroyNotify?) -> OptionGroup` | g_option_group_new | 2.6 | Creates a new #GOptionGroup. @description is typically used to provide a title for the group. If so, it is recommended that it???s written in title... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_entries | `OptionGroup.add_entries(entries: OptionEntry) -> none` | g_option_group_add_entries | 2.6 | Adds the options specified in @entries to @group. |
| free | `OptionGroup.free() -> none` | g_option_group_free | 2.6 | Frees a #GOptionGroup. Note that you must not free groups which have been added to a #GOptionContext. |
| ref | `OptionGroup.ref() -> OptionGroup` | g_option_group_ref | 2.44 | Increments the reference count of @group by one. |
| set_error_hook | `OptionGroup.set_error_hook(error_func: OptionErrorFunc) -> none` | g_option_group_set_error_hook | 2.6 | Associates a function with @group which will be called from g_option_context_parse() when an error occurs. Note that the user data to be passed to ... |
| set_parse_hooks | `OptionGroup.set_parse_hooks(pre_parse_func: OptionParseFunc?, post_parse_func: OptionParseFunc?) -> none` | g_option_group_set_parse_hooks | 2.6 | Associates two functions with @group which will be called from g_option_context_parse() before the first option is parsed and after the last option... |
| set_translate_func | `OptionGroup.set_translate_func(func: TranslateFunc?, data: gpointer?, destroy_notify: DestroyNotify?) -> none` | g_option_group_set_translate_func | 2.6 | Sets the function which is used to translate user-visible strings, for `--help` output. Different groups can use different #GTranslateFuncs. If @fu... |
| set_translation_domain | `OptionGroup.set_translation_domain(domain: utf8) -> none` | g_option_group_set_translation_domain | 2.6 | A convenience function to use gettext() for translating user-visible strings. |
| unref | `OptionGroup.unref() -> none` | g_option_group_unref | 2.44 | Decrements the reference count of @group by one. If the reference count drops to 0, the @group will be freed. and all memory allocated by the @grou... |

### GLib.PathBuf

C type: `GPathBuf`

`GPathBuf` is a helper type that allows you to easily build paths from individual elements, using the platform specific conventions for path separa...

#### Fields

| Field | Type |
| --- | --- |
| dummy | gpointer |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| equal | `equal(v1: gpointer, v2: gpointer) -> gboolean` | g_path_buf_equal | 2.76 | Compares two path buffers for equality and returns `TRUE` if they are equal. The path inside the paths buffers are not going to be normalized, so `... |
| new | `new() -> PathBuf` | g_path_buf_new | 2.76 | Allocates a new `GPathBuf`. |
| new_from_path | `new_from_path(path: filename?) -> PathBuf` | g_path_buf_new_from_path | 2.76 | Allocates a new `GPathBuf` with the given @path. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `PathBuf.clear() -> none` | g_path_buf_clear | 2.76 | Clears the contents of the path buffer. This function should be use to free the resources in a stack-allocated `GPathBuf` initialized using g_path_... |
| clear_to_path | `PathBuf.clear_to_path() -> filename` | g_path_buf_clear_to_path | 2.76 | Clears the contents of the path buffer and returns the built path. This function returns `NULL` if the `GPathBuf` is empty. See also: g_path_buf_to... |
| copy | `PathBuf.copy() -> PathBuf` | g_path_buf_copy | 2.76 | Copies the contents of a path buffer into a new `GPathBuf`. |
| free | `PathBuf.free() -> none` | g_path_buf_free | 2.76 | Frees a `GPathBuf` allocated by g_path_buf_new(). |
| free_to_path | `PathBuf.free_to_path() -> filename` | g_path_buf_free_to_path | 2.76 | Frees a `GPathBuf` allocated by g_path_buf_new(), and returns the path inside the buffer. This function returns `NULL` if the `GPathBuf` is empty. ... |
| init | `PathBuf.init() -> PathBuf` | g_path_buf_init | 2.76 | Initializes a `GPathBuf` instance. |
| init_from_path | `PathBuf.init_from_path(path: filename?) -> PathBuf` | g_path_buf_init_from_path | 2.76 | Initializes a `GPathBuf` instance with the given path. |
| pop | `PathBuf.pop() -> gboolean` | g_path_buf_pop | 2.76 | Removes the last element of the path buffer. If there is only one element in the path buffer (for example, `/` on Unix-like operating systems or th... |
| push | `PathBuf.push(path: filename) -> PathBuf` | g_path_buf_push | 2.76 | Extends the given path buffer with @path. If @path is absolute, it replaces the current path. If @path contains a directory separator, the buffer i... |
| set_extension | `PathBuf.set_extension(extension: filename?) -> gboolean` | g_path_buf_set_extension | 2.76 | Adds an extension to the file name in the path buffer. If @extension is `NULL`, the extension will be unset. If the path buffer does not have a fil... |
| set_filename | `PathBuf.set_filename(file_name: filename) -> gboolean` | g_path_buf_set_filename | 2.76 | Sets the file name of the path. If the path buffer is empty, the filename is left unset and this function returns `FALSE`. If the path buffer only ... |
| to_path | `PathBuf.to_path() -> filename` | g_path_buf_to_path | 2.76 | Retrieves the built path from the path buffer. On Windows, the result contains backslashes as directory separators, even if forward slashes were us... |

### GLib.PatternSpec

GType: `GPatternSpec` ?? C type: `GPatternSpec`

A `GPatternSpec` struct is the 'compiled' form of a glob-style pattern. The [func@GLib.pattern_match_simple] and [method@GLib.PatternSpec.match] fu...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `PatternSpec.new(pattern: utf8) -> PatternSpec` | g_pattern_spec_new |  | Compiles a pattern to a #GPatternSpec. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `PatternSpec.copy() -> PatternSpec` | g_pattern_spec_copy | 2.70 | Copies @pspec in a new #GPatternSpec. |
| equal | `PatternSpec.equal(pspec2: PatternSpec) -> gboolean` | g_pattern_spec_equal |  | Compares two compiled pattern specs and returns whether they will match the same set of strings. |
| free | `PatternSpec.free() -> none` | g_pattern_spec_free |  | Frees the memory allocated for the #GPatternSpec. |
| match | `PatternSpec.match(string_length: gsize, string: utf8, string_reversed: utf8?) -> gboolean` | g_pattern_spec_match | 2.70 | Matches a string against a compiled pattern. Passing the correct length of the string given is mandatory. The reversed string can be omitted by pas... |
| match_string | `PatternSpec.match_string(string: utf8) -> gboolean` | g_pattern_spec_match_string | 2.70 | Matches a string against a compiled pattern. If the string is to be matched against more than one pattern, consider using g_pattern_match() instead... |

### GLib.PollFD

GType: `GPollFD` ?? C type: `GPollFD`

Represents a file descriptor, which events to poll for, and which events occurred.

#### Fields

| Field | Type |
| --- | --- |
| events | gushort |
| fd | gint |
| revents | gushort |

### GLib.Private

C type: `GPrivate`

The #GPrivate struct is an opaque data structure to represent a thread-local data key. It is approximately equivalent to the pthread_setspecific()/...

#### Fields

| Field | Type |
| --- | --- |
| future | gpointer |
| notify | DestroyNotify |
| p | gpointer |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(notify: DestroyNotify) -> Private` | g_private_new |  | Creates a new #GPrivate. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `Private.get() -> gpointer` | g_private_get |  | Returns the current value of the thread local variable @key. If the value has not yet been set in this thread, %NULL is returned. Values are never ... |
| replace | `Private.replace(value: gpointer?) -> none` | g_private_replace | 2.32 | Sets the thread local variable @key to have the value @value in the current thread. This function differs from g_private_set() in the following way... |
| set | `Private.set(value: gpointer?) -> none` | g_private_set |  | Sets the thread local variable @key to have the value @value in the current thread. This function differs from g_private_replace() in the following... |

### GLib.PtrArray

GType: `GPtrArray` ?? C type: `GPtrArray`

Contains the public fields of a pointer array.

#### Fields

| Field | Type |
| --- | --- |
| len | guint |
| pdata | gpointer |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `add(array: gpointer, data: gpointer?) -> none` | g_ptr_array_add |  | Adds a pointer to the end of the pointer array. The array will grow in size automatically if necessary. |
| copy | `copy(array: gpointer, func: CopyFunc?, user_data: gpointer?) -> gpointer` | g_ptr_array_copy | 2.62 | Makes a full (deep) copy of a #GPtrArray. @func, as a #GCopyFunc, takes two arguments, the data to be copied and a @user_data pointer. On common pr... |
| extend | `extend(array_to_extend: gpointer, array: gpointer, func: CopyFunc?, user_data: gpointer?) -> none` | g_ptr_array_extend | 2.62 | Adds all pointers of @array to the end of the array @array_to_extend. The array will grow in size automatically if needed. @array_to_extend is modi... |
| extend_and_steal | `extend_and_steal(array_to_extend: gpointer, array: gpointer) -> none` | g_ptr_array_extend_and_steal | 2.62 | Adds all the pointers in @array to the end of @array_to_extend, transferring ownership of each element from @array to @array_to_extend and modifyin... |
| find | `find(haystack: gpointer, needle: gpointer?, index_: out guint?) -> gboolean` | g_ptr_array_find | 2.54 | Checks whether @needle exists in @haystack. If the element is found, %TRUE is returned and the element???s index is returned in @index_ (if non-%NU... |
| find_with_equal_func | `find_with_equal_func(haystack: gpointer, needle: gpointer?, equal_func: EqualFunc?, index_: out guint?) -> gboolean` | g_ptr_array_find_with_equal_func | 2.54 | Checks whether @needle exists in @haystack, using the given @equal_func. If the element is found, %TRUE is returned and the element???s index is re... |
| foreach | `foreach(array: gpointer, func: Func, user_data: gpointer?) -> none` | g_ptr_array_foreach | 2.4 | Calls a function for each element of a #GPtrArray. @func must not add elements to or remove elements from the array. |
| free | `free(array: gpointer, free_seg: gboolean) -> gpointer` | g_ptr_array_free |  | Frees the memory allocated for the #GPtrArray. If @free_seg is %TRUE it frees the memory block holding the elements as well. Pass %FALSE if you wan... |
| insert | `insert(array: gpointer, index_: gint, data: gpointer?) -> none` | g_ptr_array_insert | 2.40 | Inserts an element into the pointer array at the given index. The array will grow in size automatically if necessary. |
| is_null_terminated | `is_null_terminated(array: gpointer) -> gboolean` | g_ptr_array_is_null_terminated | 2.74 | Gets whether the @array was constructed as %NULL-terminated. This will only return %TRUE for arrays constructed by passing %TRUE to the `null_termi... |
| new | `new() -> gpointer` | g_ptr_array_new |  | Creates a new #GPtrArray with a reference count of 1. |
| new_from_array | `new_from_array(data: gpointer?, len: gsize, copy_func: CopyFunc?, copy_func_user_data: gpointer?, element_free_func: DestroyNotify?) -> gpointer` | g_ptr_array_new_from_array | 2.76 | Creates a new #GPtrArray, copying @len pointers from @data, and setting the array???s reference count to 1. This avoids having to manually add each... |
| new_from_null_terminated_array | `new_from_null_terminated_array(data: gpointer?, copy_func: CopyFunc?, copy_func_user_data: gpointer?, element_free_func: DestroyNotify?) -> gpointer` | g_ptr_array_new_from_null_terminated_array | 2.76 | Creates a new #GPtrArray copying the pointers from @data after having computed the length of it and with a reference count of 1. This avoids having... |
| new_full | `new_full(reserved_size: guint, element_free_func: DestroyNotify?) -> gpointer` | g_ptr_array_new_full | 2.30 | Creates a new #GPtrArray with @reserved_size pointers preallocated and a reference count of 1. This avoids frequent reallocation, if you are going ... |
| new_null_terminated | `new_null_terminated(reserved_size: guint, element_free_func: DestroyNotify?, null_terminated: gboolean) -> gpointer` | g_ptr_array_new_null_terminated | 2.74 | Like g_ptr_array_new_full() but also allows to set the array to be %NULL terminated. A %NULL terminated pointer array has an additional %NULL point... |
| new_take | `new_take(data: gpointer?, len: gsize, element_free_func: DestroyNotify?) -> gpointer` | g_ptr_array_new_take | 2.76 | Creates a new #GPtrArray with @data as pointers, @len as length and a reference count of 1. This avoids having to copy such data manually. After th... |
| new_take_null_terminated | `new_take_null_terminated(data: gpointer?, element_free_func: DestroyNotify?) -> gpointer` | g_ptr_array_new_take_null_terminated | 2.76 | Creates a new #GPtrArray with @data as pointers, computing the length of it and setting the reference count to 1. This avoids having to copy such d... |
| new_with_free_func | `new_with_free_func(element_free_func: DestroyNotify?) -> gpointer` | g_ptr_array_new_with_free_func | 2.22 | Creates a new #GPtrArray with a reference count of 1 and use @element_free_func for freeing each element when the array is destroyed either via g_p... |
| ref | `ref(array: gpointer) -> gpointer` | g_ptr_array_ref | 2.22 | Atomically increments the reference count of @array by one. This function is thread-safe and may be called from any thread. |
| remove | `remove(array: gpointer, data: gpointer?) -> gboolean` | g_ptr_array_remove |  | Removes the first occurrence of the given pointer from the pointer array. The following elements are moved down one place. If @array has a non-%NUL... |
| remove_fast | `remove_fast(array: gpointer, data: gpointer?) -> gboolean` | g_ptr_array_remove_fast |  | Removes the first occurrence of the given pointer from the pointer array. The last element in the array is used to fill in the space, so this funct... |
| remove_index | `remove_index(array: gpointer, index_: guint) -> gpointer` | g_ptr_array_remove_index |  | Removes the pointer at the given index from the pointer array. The following elements are moved down one place. If @array has a non-%NULL #GDestroy... |
| remove_index_fast | `remove_index_fast(array: gpointer, index_: guint) -> gpointer` | g_ptr_array_remove_index_fast |  | Removes the pointer at the given index from the pointer array. The last element in the array is used to fill in the space, so this function does no... |
| remove_range | `remove_range(array: gpointer, index_: guint, length: guint) -> gpointer` | g_ptr_array_remove_range | 2.4 | Removes the given number of pointers starting at the given index from a #GPtrArray. The following elements are moved to close the gap. If @array ha... |
| set_free_func | `set_free_func(array: gpointer, element_free_func: DestroyNotify?) -> none` | g_ptr_array_set_free_func | 2.22 | Sets a function for freeing each element when @array is destroyed either via g_ptr_array_unref(), when g_ptr_array_free() is called with @free_segm... |
| set_size | `set_size(array: gpointer, length: gint) -> none` | g_ptr_array_set_size |  | Sets the size of the array. When making the array larger, newly-added elements will be set to %NULL. When making it smaller, if @array has a non-%N... |
| sized_new | `sized_new(reserved_size: guint) -> gpointer` | g_ptr_array_sized_new |  | Creates a new #GPtrArray with @reserved_size pointers preallocated and a reference count of 1. This avoids frequent reallocation, if you are going ... |
| sort | `sort(array: gpointer, compare_func: CompareFunc) -> none` | g_ptr_array_sort |  | Sorts the array, using @compare_func which should be a qsort()-style comparison function (returns less than zero for first arg is less than second ... |
| sort_values | `sort_values(array: gpointer, compare_func: CompareFunc) -> none` | g_ptr_array_sort_values | 2.76 | Sorts the array, using @compare_func which should be a qsort()-style comparison function (returns less than zero for first arg is less than second ... |
| sort_values_with_data | `sort_values_with_data(array: gpointer, compare_func: CompareDataFunc, user_data: gpointer?) -> none` | g_ptr_array_sort_values_with_data | 2.76 | Like g_ptr_array_sort_values(), but the comparison function has an extra user data argument. This is guaranteed to be a stable sort. |
| sort_with_data | `sort_with_data(array: gpointer, compare_func: CompareDataFunc, user_data: gpointer?) -> none` | g_ptr_array_sort_with_data |  | Like g_ptr_array_sort(), but the comparison function has an extra user data argument. Note that the comparison function for g_ptr_array_sort_with_d... |
| steal | `steal(array: gpointer, len: out gsize?) -> gpointer` | g_ptr_array_steal | 2.64 | Frees the data in the array and resets the size to zero, while the underlying array is preserved for use elsewhere and returned to the caller. Note... |
| steal_index | `steal_index(array: gpointer, index_: guint) -> gpointer` | g_ptr_array_steal_index | 2.58 | Removes the pointer at the given index from the pointer array. The following elements are moved down one place. The #GDestroyNotify for @array is *... |
| steal_index_fast | `steal_index_fast(array: gpointer, index_: guint) -> gpointer` | g_ptr_array_steal_index_fast | 2.58 | Removes the pointer at the given index from the pointer array. The last element in the array is used to fill in the space, so this function does no... |
| unref | `unref(array: gpointer) -> none` | g_ptr_array_unref | 2.22 | Atomically decrements the reference count of @array by one. If the reference count drops to 0, the effect is the same as calling g_ptr_array_free()... |

### GLib.Queue

C type: `GQueue`

Contains the public fields of a [Queue][glib-Double-ended-Queues].

#### Fields

| Field | Type |
| --- | --- |
| head | GLib.List |
| length | guint |
| tail | GLib.List |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new() -> Queue` | g_queue_new |  | Creates a new #GQueue. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `Queue.clear() -> none` | g_queue_clear | 2.14 | Removes all the elements in @queue. If queue elements contain dynamically-allocated memory, they should be freed first. |
| clear_full | `Queue.clear_full(free_func: DestroyNotify?) -> none` | g_queue_clear_full | 2.60 | Convenience method, which frees all the memory used by a #GQueue, and calls the provided @free_func on each item in the #GQueue. |
| copy | `Queue.copy() -> Queue` | g_queue_copy | 2.4 | Copies a @queue. Note that is a shallow copy. If the elements in the queue consist of pointers to data, the pointers are copied, but the actual dat... |
| delete_link | `Queue.delete_link(link_: GLib.List) -> none` | g_queue_delete_link | 2.4 | Removes @link_ from @queue and frees it. @link_ must be part of @queue. |
| find | `Queue.find(data: gpointer?) -> GLib.List` | g_queue_find | 2.4 | Finds the first link in @queue which contains @data. |
| find_custom | `Queue.find_custom(data: gpointer?, func: CompareFunc) -> GLib.List` | g_queue_find_custom | 2.4 | Finds an element in a #GQueue, using a supplied function to find the desired element. It iterates over the queue, calling the given function which ... |
| foreach | `Queue.foreach(func: Func, user_data: gpointer?) -> none` | g_queue_foreach | 2.4 | Calls @func for each element in the queue passing @user_data to the function. It is safe for @func to remove the element from @queue, but it must n... |
| free | `Queue.free() -> none` | g_queue_free |  | Frees the memory allocated for the #GQueue. Only call this function if @queue was created with g_queue_new(). If queue elements contain dynamically... |
| free_full | `Queue.free_full(free_func: DestroyNotify) -> none` | g_queue_free_full | 2.32 | Convenience method, which frees all the memory used by a #GQueue, and calls the specified destroy function on every element's data. @free_func shou... |
| get_length | `Queue.get_length() -> guint` | g_queue_get_length | 2.4 | Returns the number of items in @queue. |
| index | `Queue.index(data: gpointer?) -> gint` | g_queue_index | 2.4 | Returns the position of the first element in @queue which contains @data. |
| init | `Queue.init() -> none` | g_queue_init | 2.14 | A statically-allocated #GQueue must be initialized with this function before it can be used. Alternatively you can initialize it with %G_QUEUE_INIT... |
| insert_after | `Queue.insert_after(sibling: GLib.List?, data: gpointer?) -> none` | g_queue_insert_after | 2.4 | Inserts @data into @queue after @sibling. @sibling must be part of @queue. Since GLib 2.44 a %NULL sibling pushes the data at the head of the queue. |
| insert_after_link | `Queue.insert_after_link(sibling: GLib.List?, link_: GLib.List) -> none` | g_queue_insert_after_link | 2.62 | Inserts @link_ into @queue after @sibling. @sibling must be part of @queue. |
| insert_before | `Queue.insert_before(sibling: GLib.List?, data: gpointer?) -> none` | g_queue_insert_before | 2.4 | Inserts @data into @queue before @sibling. @sibling must be part of @queue. Since GLib 2.44 a %NULL sibling pushes the data at the tail of the queue. |
| insert_before_link | `Queue.insert_before_link(sibling: GLib.List?, link_: GLib.List) -> none` | g_queue_insert_before_link | 2.62 | Inserts @link_ into @queue before @sibling. @sibling must be part of @queue. |
| insert_sorted | `Queue.insert_sorted(data: gpointer?, func: CompareDataFunc, user_data: gpointer?) -> none` | g_queue_insert_sorted | 2.4 | Inserts @data into @queue using @func to determine the new position. |
| is_empty | `Queue.is_empty() -> gboolean` | g_queue_is_empty |  | Returns %TRUE if the queue is empty. |
| link_index | `Queue.link_index(link_: GLib.List) -> gint` | g_queue_link_index | 2.4 | Returns the position of @link_ in @queue. |
| peek_head | `Queue.peek_head() -> gpointer` | g_queue_peek_head |  | Returns the first element of the queue. |
| peek_head_link | `Queue.peek_head_link() -> GLib.List` | g_queue_peek_head_link | 2.4 | Returns the first link in @queue. |
| peek_nth | `Queue.peek_nth(n: guint) -> gpointer` | g_queue_peek_nth | 2.4 | Returns the @n'th element of @queue. |
| peek_nth_link | `Queue.peek_nth_link(n: guint) -> GLib.List` | g_queue_peek_nth_link | 2.4 | Returns the link at the given position |
| peek_tail | `Queue.peek_tail() -> gpointer` | g_queue_peek_tail |  | Returns the last element of the queue. |
| peek_tail_link | `Queue.peek_tail_link() -> GLib.List` | g_queue_peek_tail_link | 2.4 | Returns the last link in @queue. |
| pop_head | `Queue.pop_head() -> gpointer` | g_queue_pop_head |  | Removes the first element of the queue and returns its data. |
| pop_head_link | `Queue.pop_head_link() -> GLib.List` | g_queue_pop_head_link |  | Removes and returns the first element of the queue. |
| pop_nth | `Queue.pop_nth(n: guint) -> gpointer` | g_queue_pop_nth | 2.4 | Removes the @n'th element of @queue and returns its data. |
| pop_nth_link | `Queue.pop_nth_link(n: guint) -> GLib.List` | g_queue_pop_nth_link | 2.4 | Removes and returns the link at the given position. |
| pop_tail | `Queue.pop_tail() -> gpointer` | g_queue_pop_tail |  | Removes the last element of the queue and returns its data. |
| pop_tail_link | `Queue.pop_tail_link() -> GLib.List` | g_queue_pop_tail_link |  | Removes and returns the last element of the queue. |
| push_head | `Queue.push_head(data: gpointer?) -> none` | g_queue_push_head |  | Adds a new element at the head of the queue. |
| push_head_link | `Queue.push_head_link(link_: GLib.List) -> none` | g_queue_push_head_link |  | Adds a new element at the head of the queue. |
| push_nth | `Queue.push_nth(data: gpointer?, n: gint) -> none` | g_queue_push_nth | 2.4 | Inserts a new element into @queue at the given position. |
| push_nth_link | `Queue.push_nth_link(n: gint, link_: GLib.List) -> none` | g_queue_push_nth_link | 2.4 | Inserts @link into @queue at the given position. |
| push_tail | `Queue.push_tail(data: gpointer?) -> none` | g_queue_push_tail |  | Adds a new element at the tail of the queue. |
| push_tail_link | `Queue.push_tail_link(link_: GLib.List) -> none` | g_queue_push_tail_link |  | Adds a new element at the tail of the queue. |
| remove | `Queue.remove(data: gpointer?) -> gboolean` | g_queue_remove | 2.4 | Removes the first element in @queue that contains @data. |
| remove_all | `Queue.remove_all(data: gpointer?) -> guint` | g_queue_remove_all | 2.4 | Remove all elements whose data equals @data from @queue. |
| reverse | `Queue.reverse() -> none` | g_queue_reverse | 2.4 | Reverses the order of the items in @queue. |
| sort | `Queue.sort(compare_func: CompareDataFunc, user_data: gpointer?) -> none` | g_queue_sort | 2.4 | Sorts @queue using @compare_func. |
| unlink | `Queue.unlink(link_: GLib.List) -> none` | g_queue_unlink | 2.4 | Unlinks @link_ so that it will no longer be part of @queue. The link is not freed. @link_ must be part of @queue. |

### GLib.Rand

GType: `GRand` ?? C type: `GRand`

The GRand struct is an opaque data structure. It should only be accessed through the g_rand_* functions.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Rand.new() -> Rand` | g_rand_new |  | Creates a new random number generator initialized with a seed taken either from `/dev/urandom` (if existing) or from the current time (as a fallbac... |
| new_with_seed | `Rand.new_with_seed(seed: guint32) -> Rand` | g_rand_new_with_seed |  | Creates a new random number generator initialized with @seed. |
| new_with_seed_array | `Rand.new_with_seed_array(seed: guint32, seed_length: guint) -> Rand` | g_rand_new_with_seed_array | 2.4 | Creates a new random number generator initialized with @seed. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Rand.copy() -> Rand` | g_rand_copy | 2.4 | Copies a #GRand into a new one with the same exact state as before. This way you can take a snapshot of the random number generator for replaying l... |
| double | `Rand.double() -> gdouble` | g_rand_double |  | Returns the next random #gdouble from @rand_ equally distributed over the range [0..1). |
| double_range | `Rand.double_range(begin: gdouble, end: gdouble) -> gdouble` | g_rand_double_range |  | Returns the next random #gdouble from @rand_ equally distributed over the range [@begin..@end). |
| free | `Rand.free() -> none` | g_rand_free |  | Frees the memory allocated for the #GRand. |
| int | `Rand.int() -> guint32` | g_rand_int |  | Returns the next random #guint32 from @rand_ equally distributed over the range [0..2^32-1]. |
| int_range | `Rand.int_range(begin: gint32, end: gint32) -> gint32` | g_rand_int_range |  | Returns the next random #gint32 from @rand_ equally distributed over the range [@begin..@end-1]. |
| set_seed | `Rand.set_seed(seed: guint32) -> none` | g_rand_set_seed |  | Sets the seed for the random number generator #GRand to @seed. |
| set_seed_array | `Rand.set_seed_array(seed: guint32, seed_length: guint) -> none` | g_rand_set_seed_array | 2.4 | Initializes the random number generator by an array of longs. Array can be of arbitrary size, though only the first 624 values are taken. This func... |

### GLib.RecMutex

C type: `GRecMutex`

The GRecMutex struct is an opaque data structure to represent a recursive mutex. It is similar to a #GMutex with the difference that it is possible...

#### Fields

| Field | Type |
| --- | --- |
| i | guint |
| p | gpointer |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `RecMutex.clear() -> none` | g_rec_mutex_clear | 2.32 | Frees the resources allocated to a recursive mutex with g_rec_mutex_init(). This function should not be used with a #GRecMutex that has been static... |
| init | `RecMutex.init() -> none` | g_rec_mutex_init | 2.32 | Initializes a #GRecMutex so that it can be used. This function is useful to initialize a recursive mutex that has been allocated on the stack, or a... |
| lock | `RecMutex.lock() -> none` | g_rec_mutex_lock | 2.32 | Locks @rec_mutex. If @rec_mutex is already locked by another thread, the current thread will block until @rec_mutex is unlocked by the other thread... |
| trylock | `RecMutex.trylock() -> gboolean` | g_rec_mutex_trylock | 2.32 | Tries to lock @rec_mutex. If @rec_mutex is already locked by another thread, it immediately returns %FALSE. Otherwise it locks @rec_mutex and retur... |
| unlock | `RecMutex.unlock() -> none` | g_rec_mutex_unlock | 2.32 | Unlocks @rec_mutex. If another thread is blocked in a g_rec_mutex_lock() call for @rec_mutex, it will become unblocked and can lock @rec_mutex itse... |

### GLib.Regex

GType: `GRegex` ?? C type: `GRegex`

A `GRegex` is the "compiled" form of a regular expression pattern. `GRegex` implements regular expression pattern matching using syntax and semanti...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Regex.new(pattern: utf8, compile_options: RegexCompileFlags, match_options: RegexMatchFlags) -> Regex throws` | g_regex_new | 2.14 | Compiles the regular expression to an internal form, and does the initial setup of the #GRegex structure. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| check_replacement | `check_replacement(replacement: utf8, has_references: out gboolean?) -> gboolean throws` | g_regex_check_replacement | 2.14 | Checks whether @replacement is a valid replacement string (see g_regex_replace()), i.e. that all escape sequences in it are valid. If @has_referenc... |
| error_quark | `error_quark() -> Quark` | g_regex_error_quark |  |  |
| escape_nul | `escape_nul(string: utf8, length: gint) -> utf8` | g_regex_escape_nul | 2.30 | Escapes the nul characters in @string to "\x00". It can be used to compile a regex with embedded nul characters. For completeness, @length can be -... |
| escape_string | `escape_string(string: utf8, length: gint) -> utf8` | g_regex_escape_string | 2.14 | Escapes the special characters used for regular expressions in @string, for instance "a.b*c" becomes "a\.b\*c". This function is useful to dynamica... |
| match_simple | `match_simple(pattern: utf8, string: utf8, compile_options: RegexCompileFlags, match_options: RegexMatchFlags) -> gboolean` | g_regex_match_simple | 2.14 | Scans for a match in @string for @pattern. This function is equivalent to g_regex_match() but it does not require to compile the pattern with g_reg... |
| split_simple | `split_simple(pattern: utf8, string: utf8, compile_options: RegexCompileFlags, match_options: RegexMatchFlags) -> utf8` | g_regex_split_simple | 2.14 | Breaks the string on the pattern, and returns an array of the tokens. If the pattern contains capturing parentheses, then the text for each of the ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_capture_count | `Regex.get_capture_count() -> gint` | g_regex_get_capture_count | 2.14 | Returns the number of capturing subpatterns in the pattern. |
| get_compile_flags | `Regex.get_compile_flags() -> RegexCompileFlags` | g_regex_get_compile_flags | 2.26 | Returns the compile options that @regex was created with. Depending on the version of PCRE that is used, this may or may not include flags set by o... |
| get_has_cr_or_lf | `Regex.get_has_cr_or_lf() -> gboolean` | g_regex_get_has_cr_or_lf | 2.34 | Checks whether the pattern contains explicit CR or LF references. |
| get_match_flags | `Regex.get_match_flags() -> RegexMatchFlags` | g_regex_get_match_flags | 2.26 | Returns the match options that @regex was created with. |
| get_max_backref | `Regex.get_max_backref() -> gint` | g_regex_get_max_backref | 2.14 | Returns the number of the highest back reference in the pattern, or 0 if the pattern does not contain back references. |
| get_max_lookbehind | `Regex.get_max_lookbehind() -> gint` | g_regex_get_max_lookbehind | 2.38 | Gets the number of characters in the longest lookbehind assertion in the pattern. This information is useful when doing multi-segment matching usin... |
| get_pattern | `Regex.get_pattern() -> utf8` | g_regex_get_pattern | 2.14 | Gets the pattern string associated with @regex, i.e. a copy of the string passed to g_regex_new(). |
| get_string_number | `Regex.get_string_number(name: utf8) -> gint` | g_regex_get_string_number | 2.14 | Retrieves the number of the subexpression named @name. |
| match | `Regex.match(string: utf8, match_options: RegexMatchFlags, match_info: out MatchInfo?) -> gboolean` | g_regex_match | 2.14 | Scans for a match in @string for the pattern in @regex. The @match_options are combined with the match options specified when the @regex structure ... |
| match_all | `Regex.match_all(string: utf8, match_options: RegexMatchFlags, match_info: out MatchInfo?) -> gboolean` | g_regex_match_all | 2.14 | Using the standard algorithm for regular expression matching only the longest match in the string is retrieved. This function uses a different algo... |
| match_all_full | `Regex.match_all_full(string: utf8, string_len: gssize, start_position: gint, match_options: RegexMatchFlags, match_info: out MatchInfo?) -> gboolean throws` | g_regex_match_all_full | 2.14 | Using the standard algorithm for regular expression matching only the longest match in the @string is retrieved, it is not possible to obtain all t... |
| match_full | `Regex.match_full(string: utf8, string_len: gssize, start_position: gint, match_options: RegexMatchFlags, match_info: out MatchInfo?) -> gboolean throws` | g_regex_match_full | 2.14 | Scans for a match in @string for the pattern in @regex. The @match_options are combined with the match options specified when the @regex structure ... |
| ref | `Regex.ref() -> Regex` | g_regex_ref | 2.14 | Increases reference count of @regex by 1. |
| replace | `Regex.replace(string: utf8, string_len: gssize, start_position: gint, replacement: utf8, match_options: RegexMatchFlags) -> utf8 throws` | g_regex_replace | 2.14 | Replaces all occurrences of the pattern in @regex with the replacement text. Backreferences of the form '\number' or '\g<number>' in the replacemen... |
| replace_eval | `Regex.replace_eval(string: utf8, string_len: gssize, start_position: gint, match_options: RegexMatchFlags, eval: RegexEvalCallback, user_data: gpointer?) -> utf8 throws` | g_regex_replace_eval | 2.14 | Replaces occurrences of the pattern in regex with the output of @eval for that occurrence. Setting @start_position differs from just passing over a... |
| replace_literal | `Regex.replace_literal(string: utf8, string_len: gssize, start_position: gint, replacement: utf8, match_options: RegexMatchFlags) -> utf8 throws` | g_regex_replace_literal | 2.14 | Replaces all occurrences of the pattern in @regex with the replacement text. @replacement is replaced literally, to include backreferences use g_re... |
| split | `Regex.split(string: utf8, match_options: RegexMatchFlags) -> utf8` | g_regex_split | 2.14 | Breaks the string on the pattern, and returns an array of the tokens. If the pattern contains capturing parentheses, then the text for each of the ... |
| split_full | `Regex.split_full(string: utf8, string_len: gssize, start_position: gint, match_options: RegexMatchFlags, max_tokens: gint) -> utf8 throws` | g_regex_split_full | 2.14 | Breaks the string on the pattern, and returns an array of the tokens. If the pattern contains capturing parentheses, then the text for each of the ... |
| unref | `Regex.unref() -> none` | g_regex_unref | 2.14 | Decreases reference count of @regex by 1. When reference count drops to zero, it frees all the memory associated with the regex structure. |

### GLib.Relation

C type: `GRelation`

A `GRelation` is a table of data which can be indexed on any number of fields, rather like simple database tables. A `GRelation` contains a number ...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(fields: gint) -> Relation` | g_relation_new |  | Creates a new #GRelation with the given number of fields. Note that currently the number of fields must be 2. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| count | `Relation.count(key: gpointer?, field: gint) -> gint` | g_relation_count |  | Returns the number of tuples in a #GRelation that have the given value in the given field. |
| delete | `Relation.delete(key: gpointer?, field: gint) -> gint` | g_relation_delete |  | Deletes any records from a #GRelation that have the given key value in the given field. |
| destroy | `Relation.destroy() -> none` | g_relation_destroy |  | Destroys the #GRelation, freeing all memory allocated. However, it does not free memory allocated for the tuple data, so you should free that first... |
| exists | `Relation.exists(...: void) -> gboolean` | g_relation_exists |  | Returns %TRUE if a record with the given values exists in a #GRelation. Note that the values are compared directly, so that, for example, two copie... |
| index | `Relation.index(field: gint, hash_func: HashFunc, key_equal_func: EqualFunc) -> none` | g_relation_index |  | Creates an index on the given field. Note that this must be called before any records are added to the #GRelation. |
| insert | `Relation.insert(...: void) -> none` | g_relation_insert |  | Inserts a record into a #GRelation. |
| print | `Relation.print() -> none` | g_relation_print |  | Outputs information about all records in a #GRelation, as well as the indexes. It is for debugging. |
| select | `Relation.select(key: gpointer?, field: gint) -> Tuples` | g_relation_select |  | Returns all of the tuples which have the given key in the given field. Use g_tuples_index() to access the returned records. The returned records sh... |

### GLib.RWLock

C type: `GRWLock`

The GRWLock struct is an opaque data structure to represent a reader-writer lock. It is similar to a #GMutex in that it allows multiple threads to ...

#### Fields

| Field | Type |
| --- | --- |
| i | guint |
| p | gpointer |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `RWLock.clear() -> none` | g_rw_lock_clear | 2.32 | Frees the resources allocated to a lock with g_rw_lock_init(). This function should not be used with a #GRWLock that has been statically allocated.... |
| init | `RWLock.init() -> none` | g_rw_lock_init | 2.32 | Initializes a #GRWLock so that it can be used. This function is useful to initialize a lock that has been allocated on the stack, or as part of a l... |
| reader_lock | `RWLock.reader_lock() -> none` | g_rw_lock_reader_lock | 2.32 | Obtain a read lock on @rw_lock. If another thread currently holds the write lock on @rw_lock, the current thread will block until the write lock wa... |
| reader_trylock | `RWLock.reader_trylock() -> gboolean` | g_rw_lock_reader_trylock | 2.32 | Tries to obtain a read lock on @rw_lock and returns %TRUE if the read lock was successfully obtained. Otherwise it returns %FALSE. |
| reader_unlock | `RWLock.reader_unlock() -> none` | g_rw_lock_reader_unlock | 2.32 | Release a read lock on @rw_lock. Calling g_rw_lock_reader_unlock() on a lock that is not held by the current thread leads to undefined behaviour. |
| writer_lock | `RWLock.writer_lock() -> none` | g_rw_lock_writer_lock | 2.32 | Obtain a write lock on @rw_lock. If another thread currently holds a read or write lock on @rw_lock, the current thread will block until all other ... |
| writer_trylock | `RWLock.writer_trylock() -> gboolean` | g_rw_lock_writer_trylock | 2.32 | Tries to obtain a write lock on @rw_lock. If another thread currently holds a read or write lock on @rw_lock, it immediately returns %FALSE. Otherw... |
| writer_unlock | `RWLock.writer_unlock() -> none` | g_rw_lock_writer_unlock | 2.32 | Release a write lock on @rw_lock. Calling g_rw_lock_writer_unlock() on a lock that is not held by the current thread leads to undefined behaviour. |

### GLib.Scanner

C type: `GScanner`

`GScanner` provides a general-purpose lexical scanner. You should set @input_name after creating the scanner, since it is used by the default messa...

#### Fields

| Field | Type |
| --- | --- |
| buffer | utf8 |
| config | ScannerConfig |
| input_fd | gint |
| input_name | utf8 |
| line | guint |
| max_parse_errors | guint |
| msg_handler | ScannerMsgFunc |
| next_line | guint |
| next_position | guint |
| next_token | TokenType |
| next_value | TokenValue |
| parse_errors | guint |
| position | guint |
| qdata | Data |
| scope_id | guint |
| symbol_table | GLib.HashTable |
| text | utf8 |
| text_end | utf8 |
| token | TokenType |
| user_data | gpointer |
| value | TokenValue |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(config_templ: ScannerConfig) -> Scanner` | g_scanner_new |  | Creates a new #GScanner. The @config_templ structure specifies the initial settings of the scanner, which are copied into the #GScanner @config fie... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| cur_line | `Scanner.cur_line() -> guint` | g_scanner_cur_line |  | Returns the current line in the input stream (counting from 1). This is the line of the last token parsed via g_scanner_get_next_token(). |
| cur_position | `Scanner.cur_position() -> guint` | g_scanner_cur_position |  | Returns the current position in the current line (counting from 0). This is the position of the last token parsed via g_scanner_get_next_token(). |
| cur_token | `Scanner.cur_token() -> TokenType` | g_scanner_cur_token |  | Gets the current token type. This is simply the @token field in the #GScanner structure. |
| cur_value | `Scanner.cur_value() -> TokenValue` | g_scanner_cur_value |  | Gets the current token value. This is simply the @value field in the #GScanner structure. |
| destroy | `Scanner.destroy() -> none` | g_scanner_destroy |  | Frees all memory used by the #GScanner. |
| eof | `Scanner.eof() -> gboolean` | g_scanner_eof |  | Returns %TRUE if the scanner has reached the end of the file or text buffer. |
| error | `Scanner.error(format: utf8, ...: void) -> none` | g_scanner_error |  | Outputs an error message, via the #GScanner message handler. |
| get_next_token | `Scanner.get_next_token() -> TokenType` | g_scanner_get_next_token |  | Parses the next token just like g_scanner_peek_next_token() and also removes it from the input stream. The token data is placed in the @token, @val... |
| input_file | `Scanner.input_file(input_fd: gint) -> none` | g_scanner_input_file |  | Prepares to scan a file. |
| input_text | `Scanner.input_text(text: utf8, text_len: guint) -> none` | g_scanner_input_text |  | Prepares to scan a text buffer. |
| lookup_symbol | `Scanner.lookup_symbol(symbol: utf8) -> gpointer` | g_scanner_lookup_symbol |  | Looks up a symbol in the current scope and return its value. If the symbol is not bound in the current scope, %NULL is returned. |
| peek_next_token | `Scanner.peek_next_token() -> TokenType` | g_scanner_peek_next_token |  | Parses the next token, without removing it from the input stream. The token data is placed in the @next_token, @next_value, @next_line, and @next_p... |
| scope_add_symbol | `Scanner.scope_add_symbol(scope_id: guint, symbol: utf8, value: gpointer?) -> none` | g_scanner_scope_add_symbol |  | Adds a symbol to the given scope. |
| scope_foreach_symbol | `Scanner.scope_foreach_symbol(scope_id: guint, func: HFunc, user_data: gpointer?) -> none` | g_scanner_scope_foreach_symbol |  | Calls the given function for each of the symbol/value pairs in the given scope of the #GScanner. The function is passed the symbol and value of eac... |
| scope_lookup_symbol | `Scanner.scope_lookup_symbol(scope_id: guint, symbol: utf8) -> gpointer` | g_scanner_scope_lookup_symbol |  | Looks up a symbol in a scope and return its value. If the symbol is not bound in the scope, %NULL is returned. |
| scope_remove_symbol | `Scanner.scope_remove_symbol(scope_id: guint, symbol: utf8) -> none` | g_scanner_scope_remove_symbol |  | Removes a symbol from a scope. |
| set_scope | `Scanner.set_scope(scope_id: guint) -> guint` | g_scanner_set_scope |  | Sets the current scope. |
| sync_file_offset | `Scanner.sync_file_offset() -> none` | g_scanner_sync_file_offset |  | Rewinds the filedescriptor to the current buffer position and blows the file read ahead buffer. This is useful for third party uses of the scanners... |
| unexp_token | `Scanner.unexp_token(expected_token: TokenType, identifier_spec: utf8, symbol_spec: utf8, symbol_name: utf8, message: utf8, is_error: gint) -> none` | g_scanner_unexp_token |  | Outputs a message through the scanner's msg_handler, resulting from an unexpected token in the input stream. Note that you should not call g_scanne... |
| warn | `Scanner.warn(format: utf8, ...: void) -> none` | g_scanner_warn |  | Outputs a warning message, via the #GScanner message handler. |

### GLib.ScannerConfig

C type: `GScannerConfig`

Specifies the #GScanner parser configuration. Most settings can be changed during the parsing phase and will affect the lexical parsing of the next...

#### Fields

| Field | Type |
| --- | --- |
| case_sensitive | guint |
| char_2_token | guint |
| cpair_comment_single | utf8 |
| cset_identifier_first | utf8 |
| cset_identifier_nth | utf8 |
| cset_skip_characters | utf8 |
| identifier_2_string | guint |
| int_2_float | guint |
| numbers_2_int | guint |
| padding_dummy | guint |
| scan_binary | guint |
| scan_comment_multi | guint |
| scan_float | guint |
| scan_hex | guint |
| scan_hex_dollar | guint |
| scan_identifier | guint |
| scan_identifier_1char | guint |
| scan_identifier_NULL | guint |
| scan_octal | guint |
| scan_string_dq | guint |
| scan_string_sq | guint |
| scan_symbols | guint |
| scope_0_fallback | guint |
| skip_comment_multi | guint |
| skip_comment_single | guint |
| store_int64 | guint |
| symbol_2_token | guint |

### GLib.Sequence

C type: `GSequence`

The #GSequence struct is an opaque data type representing a [sequence][glib-Sequences] data type.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| foreach_range | `foreach_range(begin: SequenceIter, end: SequenceIter, func: Func, user_data: gpointer?) -> none` | g_sequence_foreach_range | 2.14 | Calls @func for each item in the range (@begin, @end) passing @user_data to the function. @func must not modify the sequence itself. |
| get | `get(iter: SequenceIter) -> gpointer` | g_sequence_get | 2.14 | Returns the data that @iter points to. |
| insert_before | `insert_before(iter: SequenceIter, data: gpointer?) -> SequenceIter` | g_sequence_insert_before | 2.14 | Inserts a new item just before the item pointed to by @iter. |
| move | `move(src: SequenceIter, dest: SequenceIter) -> none` | g_sequence_move | 2.14 | Moves the item pointed to by @src to the position indicated by @dest. After calling this function @dest will point to the position immediately afte... |
| move_range | `move_range(dest: SequenceIter, begin: SequenceIter, end: SequenceIter) -> none` | g_sequence_move_range | 2.14 | Inserts the (@begin, @end) range at the destination pointed to by @dest. The @begin and @end iters must point into the same sequence. It is allowed... |
| new | `new(data_destroy: DestroyNotify?) -> Sequence` | g_sequence_new | 2.14 | Creates a new GSequence. The @data_destroy function, if non-%NULL will be called on all items when the sequence is destroyed and on items that are ... |
| range_get_midpoint | `range_get_midpoint(begin: SequenceIter, end: SequenceIter) -> SequenceIter` | g_sequence_range_get_midpoint | 2.14 | Finds an iterator somewhere in the range (@begin, @end). This iterator will be close to the middle of the range, but is not guaranteed to be exactl... |
| remove | `remove(iter: SequenceIter) -> none` | g_sequence_remove | 2.14 | Removes the item pointed to by @iter. It is an error to pass the end iterator to this function. If the sequence has a data destroy function associa... |
| remove_range | `remove_range(begin: SequenceIter, end: SequenceIter) -> none` | g_sequence_remove_range | 2.14 | Removes all items in the (@begin, @end) range. If the sequence has a data destroy function associated with it, this function is called on the data ... |
| set | `set(iter: SequenceIter, data: gpointer?) -> none` | g_sequence_set | 2.14 | Changes the data for the item pointed to by @iter to be @data. If the sequence has a data destroy function associated with it, that function is cal... |
| sort_changed | `sort_changed(iter: SequenceIter, cmp_func: CompareDataFunc, cmp_data: gpointer?) -> none` | g_sequence_sort_changed | 2.14 | Moves the data pointed to by @iter to a new position as indicated by @cmp_func. This function should be called for items in a sequence already sort... |
| sort_changed_iter | `sort_changed_iter(iter: SequenceIter, iter_cmp: SequenceIterCompareFunc, cmp_data: gpointer?) -> none` | g_sequence_sort_changed_iter | 2.14 | Like g_sequence_sort_changed(), but uses a #GSequenceIterCompareFunc instead of a #GCompareDataFunc as the compare function. @iter_cmp is called wi... |
| swap | `swap(a: SequenceIter, b: SequenceIter) -> none` | g_sequence_swap | 2.14 | Swaps the items pointed to by @a and @b. It is allowed for @a and @b to point into difference sequences. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append | `Sequence.append(data: gpointer?) -> SequenceIter` | g_sequence_append | 2.14 | Adds a new item to the end of @seq. |
| foreach | `Sequence.foreach(func: Func, user_data: gpointer?) -> none` | g_sequence_foreach | 2.14 | Calls @func for each item in the sequence passing @user_data to the function. @func must not modify the sequence itself. |
| free | `Sequence.free() -> none` | g_sequence_free | 2.14 | Frees the memory allocated for @seq. If @seq has a data destroy function associated with it, that function is called on all items in @seq. |
| get_begin_iter | `Sequence.get_begin_iter() -> SequenceIter` | g_sequence_get_begin_iter | 2.14 | Returns the begin iterator for @seq. |
| get_end_iter | `Sequence.get_end_iter() -> SequenceIter` | g_sequence_get_end_iter | 2.14 | Returns the end iterator for @seg |
| get_iter_at_pos | `Sequence.get_iter_at_pos(pos: gint) -> SequenceIter` | g_sequence_get_iter_at_pos | 2.14 | Returns the iterator at position @pos. If @pos is negative or larger than the number of items in @seq, the end iterator is returned. |
| get_length | `Sequence.get_length() -> gint` | g_sequence_get_length | 2.14 | Returns the positive length (>= 0) of @seq. Note that this method is O(h) where `h' is the height of the tree. It is thus more efficient to use g_s... |
| insert_sorted | `Sequence.insert_sorted(data: gpointer?, cmp_func: CompareDataFunc, cmp_data: gpointer?) -> SequenceIter` | g_sequence_insert_sorted | 2.14 | Inserts @data into @seq using @cmp_func to determine the new position. The sequence must already be sorted according to @cmp_func; otherwise the ne... |
| insert_sorted_iter | `Sequence.insert_sorted_iter(data: gpointer?, iter_cmp: SequenceIterCompareFunc, cmp_data: gpointer?) -> SequenceIter` | g_sequence_insert_sorted_iter | 2.14 | Like g_sequence_insert_sorted(), but uses a #GSequenceIterCompareFunc instead of a #GCompareDataFunc as the compare function. @iter_cmp is called w... |
| is_empty | `Sequence.is_empty() -> gboolean` | g_sequence_is_empty | 2.48 | Returns %TRUE if the sequence contains zero items. This function is functionally identical to checking the result of g_sequence_get_length() being ... |
| lookup | `Sequence.lookup(data: gpointer?, cmp_func: CompareDataFunc, cmp_data: gpointer?) -> SequenceIter` | g_sequence_lookup | 2.28 | Returns an iterator pointing to the position of the first item found equal to @data according to @cmp_func and @cmp_data. If more than one item is ... |
| lookup_iter | `Sequence.lookup_iter(data: gpointer?, iter_cmp: SequenceIterCompareFunc, cmp_data: gpointer?) -> SequenceIter` | g_sequence_lookup_iter | 2.28 | Like g_sequence_lookup(), but uses a #GSequenceIterCompareFunc instead of a #GCompareDataFunc as the compare function. @iter_cmp is called with two... |
| prepend | `Sequence.prepend(data: gpointer?) -> SequenceIter` | g_sequence_prepend | 2.14 | Adds a new item to the front of @seq |
| search | `Sequence.search(data: gpointer?, cmp_func: CompareDataFunc, cmp_data: gpointer?) -> SequenceIter` | g_sequence_search | 2.14 | Returns an iterator pointing to the position where @data would be inserted according to @cmp_func and @cmp_data. @cmp_func is called with two items... |
| search_iter | `Sequence.search_iter(data: gpointer?, iter_cmp: SequenceIterCompareFunc, cmp_data: gpointer?) -> SequenceIter` | g_sequence_search_iter | 2.14 | Like g_sequence_search(), but uses a #GSequenceIterCompareFunc instead of a #GCompareDataFunc as the compare function. @iter_cmp is called with two... |
| sort | `Sequence.sort(cmp_func: CompareDataFunc, cmp_data: gpointer?) -> none` | g_sequence_sort | 2.14 | Sorts @seq using @cmp_func. @cmp_func is passed two items of @seq and should return 0 if they are equal, a negative value if the first comes before... |
| sort_iter | `Sequence.sort_iter(cmp_func: SequenceIterCompareFunc, cmp_data: gpointer?) -> none` | g_sequence_sort_iter | 2.14 | Like g_sequence_sort(), but uses a #GSequenceIterCompareFunc instead of a #GCompareDataFunc as the compare function @cmp_func is called with two it... |

### GLib.SequenceIter

C type: `GSequenceIter`

The #GSequenceIter struct is an opaque data type representing an iterator pointing into a #GSequence.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| compare | `SequenceIter.compare(b: SequenceIter) -> gint` | g_sequence_iter_compare | 2.14 | Returns a negative number if @a comes before @b, 0 if they are equal, and a positive number if @a comes after @b. The @a and @b iterators must poin... |
| get_position | `SequenceIter.get_position() -> gint` | g_sequence_iter_get_position | 2.14 | Returns the position of @iter |
| get_sequence | `SequenceIter.get_sequence() -> Sequence` | g_sequence_iter_get_sequence | 2.14 | Returns the #GSequence that @iter points into. |
| is_begin | `SequenceIter.is_begin() -> gboolean` | g_sequence_iter_is_begin | 2.14 | Returns whether @iter is the begin iterator |
| is_end | `SequenceIter.is_end() -> gboolean` | g_sequence_iter_is_end | 2.14 | Returns whether @iter is the end iterator |
| move | `SequenceIter.move(delta: gint) -> SequenceIter` | g_sequence_iter_move | 2.14 | Returns the #GSequenceIter which is @delta positions away from @iter. If @iter is closer than -@delta positions to the beginning of the sequence, t... |
| next | `SequenceIter.next() -> SequenceIter` | g_sequence_iter_next | 2.14 | Returns an iterator pointing to the next position after @iter. If @iter is the end iterator, the end iterator is returned. |
| prev | `SequenceIter.prev() -> SequenceIter` | g_sequence_iter_prev | 2.14 | Returns an iterator pointing to the previous position before @iter. If @iter is the begin iterator, the begin iterator is returned. |

### GLib.SList

C type: `GSList`

The #GSList struct is used for each element in the singly-linked list.

#### Fields

| Field | Type |
| --- | --- |
| data | gpointer |
| next | GLib.SList |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `alloc() -> GLib.SList` | g_slist_alloc |  | Allocates space for one #GSList element. It is called by the g_slist_append(), g_slist_prepend(), g_slist_insert() and g_slist_insert_sorted() func... |
| append | `append(list: GLib.SList, data: gpointer?) -> GLib.SList` | g_slist_append |  | Adds a new element on to the end of the list. The return value is the new start of the list, which may have changed, so make sure you store the new... |
| concat | `concat(list1: GLib.SList, list2: GLib.SList) -> GLib.SList` | g_slist_concat |  | Adds the second #GSList onto the end of the first #GSList. Note that the elements of the second #GSList are not copied. They are used directly. |
| copy | `copy(list: GLib.SList) -> GLib.SList` | g_slist_copy |  | Copies a #GSList. Note that this is a "shallow" copy. If the list elements consist of pointers to data, the pointers are copied but the actual data... |
| copy_deep | `copy_deep(list: GLib.SList, func: CopyFunc, user_data: gpointer?) -> GLib.SList` | g_slist_copy_deep | 2.34 | Makes a full (deep) copy of a #GSList. In contrast with g_slist_copy(), this function uses @func to make a copy of each list element, in addition t... |
| delete_link | `delete_link(list: GLib.SList, link_: GLib.SList) -> GLib.SList` | g_slist_delete_link |  | Removes the node link_ from the list and frees it. Compare this to g_slist_remove_link() which removes the node without freeing it. Removing arbitr... |
| find | `find(list: GLib.SList, data: gpointer?) -> GLib.SList` | g_slist_find |  | Finds the element in a #GSList which contains the given data. |
| find_custom | `find_custom(list: GLib.SList, data: gpointer?, func: CompareFunc) -> GLib.SList` | g_slist_find_custom |  | Finds an element in a #GSList, using a supplied function to find the desired element. It iterates over the list, calling the given function which s... |
| foreach | `foreach(list: GLib.SList, func: Func, user_data: gpointer?) -> none` | g_slist_foreach |  | Calls a function for each element of a #GSList. It is safe for @func to remove the element from @list, but it must not modify any part of the list ... |
| free | `free(list: GLib.SList) -> none` | g_slist_free |  | Frees all of the memory used by a #GSList. The freed elements are returned to the slice allocator. If list elements contain dynamically-allocated m... |
| free_1 | `free_1(list: GLib.SList) -> none` | g_slist_free_1 |  | Frees one #GSList element. It is usually used after g_slist_remove_link(). |
| free_full | `free_full(list: GLib.SList, free_func: DestroyNotify) -> none` | g_slist_free_full | 2.28 | Convenience method, which frees all the memory used by a #GSList, and calls the specified destroy function on every element's data. @free_func must... |
| index | `index(list: GLib.SList, data: gpointer?) -> gint` | g_slist_index |  | Gets the position of the element containing the given data (starting from 0). |
| insert | `insert(list: GLib.SList, data: gpointer?, position: gint) -> GLib.SList` | g_slist_insert |  | Inserts a new element into the list at the given position. |
| insert_before | `insert_before(slist: GLib.SList, sibling: GLib.SList, data: gpointer?) -> GLib.SList` | g_slist_insert_before |  | Inserts a node before @sibling containing @data. |
| insert_sorted | `insert_sorted(list: GLib.SList, data: gpointer?, func: CompareFunc) -> GLib.SList` | g_slist_insert_sorted |  | Inserts a new element into the list, using the given comparison function to determine its position. |
| insert_sorted_with_data | `insert_sorted_with_data(list: GLib.SList, data: gpointer?, func: CompareDataFunc, user_data: gpointer?) -> GLib.SList` | g_slist_insert_sorted_with_data | 2.10 | Inserts a new element into the list, using the given comparison function to determine its position. |
| last | `last(list: GLib.SList) -> GLib.SList` | g_slist_last |  | Gets the last element in a #GSList. This function iterates over the whole list. |
| length | `length(list: GLib.SList) -> guint` | g_slist_length |  | Gets the number of elements in a #GSList. This function iterates over the whole list to count its elements. To check whether the list is non-empty,... |
| nth | `nth(list: GLib.SList, n: guint) -> GLib.SList` | g_slist_nth |  | Gets the element at the given position in a #GSList. |
| nth_data | `nth_data(list: GLib.SList, n: guint) -> gpointer` | g_slist_nth_data |  | Gets the data of the element at the given position. |
| pop_allocator | `pop_allocator() -> none` | g_slist_pop_allocator |  |  |
| position | `position(list: GLib.SList, llink: GLib.SList) -> gint` | g_slist_position |  | Gets the position of the given element in the #GSList (starting from 0). |
| prepend | `prepend(list: GLib.SList, data: gpointer?) -> GLib.SList` | g_slist_prepend |  | Adds a new element on to the start of the list. The return value is the new start of the list, which may have changed, so make sure you store the n... |
| push_allocator | `push_allocator(allocator: Allocator) -> none` | g_slist_push_allocator |  |  |
| remove | `remove(list: GLib.SList, data: gpointer?) -> GLib.SList` | g_slist_remove |  | Removes an element from a #GSList. If two elements contain the same data, only the first is removed. If none of the elements contain the data, the ... |
| remove_all | `remove_all(list: GLib.SList, data: gpointer?) -> GLib.SList` | g_slist_remove_all |  | Removes all list nodes with data equal to @data. Returns the new head of the list. Contrast with g_slist_remove() which removes only the first node... |
| remove_link | `remove_link(list: GLib.SList, link_: GLib.SList) -> GLib.SList` | g_slist_remove_link |  | Removes an element from a #GSList, without freeing the element. The removed element's next link is set to %NULL, so that it becomes a self-containe... |
| reverse | `reverse(list: GLib.SList) -> GLib.SList` | g_slist_reverse |  | Reverses a #GSList. |
| sort | `sort(list: GLib.SList, compare_func: CompareFunc) -> GLib.SList` | g_slist_sort |  | Sorts a #GSList using the given comparison function. The algorithm used is a stable sort. |
| sort_with_data | `sort_with_data(list: GLib.SList, compare_func: CompareDataFunc, user_data: gpointer?) -> GLib.SList` | g_slist_sort_with_data |  | Like g_slist_sort(), but the sort function accepts a user data argument. |

### GLib.Source

GType: `GSource` ?? C type: `GSource`

The `GSource` struct is an opaque data type representing an event source.

#### Fields

| Field | Type |
| --- | --- |
| callback_data | gpointer |
| callback_funcs | SourceCallbackFuncs |
| context | MainContext |
| flags | guint |
| name | utf8 |
| next | Source |
| poll_fds | GLib.SList |
| prev | Source |
| priority | gint |
| priv | SourcePrivate |
| ref_count | guint |
| source_funcs | SourceFuncs |
| source_id | guint |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Source.new(source_funcs: SourceFuncs, struct_size: guint) -> Source` | g_source_new |  | Creates a new #GSource structure. The size is specified to allow creating structures derived from #GSource that contain additional data. The size p... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| remove | `remove(tag: guint) -> gboolean` | g_source_remove |  | Removes the source with the given ID from the default main context. You must use g_source_destroy() for sources added to a non-default main context... |
| remove_by_funcs_user_data | `remove_by_funcs_user_data(funcs: SourceFuncs, user_data: gpointer?) -> gboolean` | g_source_remove_by_funcs_user_data |  | Removes a source from the default main loop context given the source functions and user data. If multiple sources exist with the same source functi... |
| remove_by_user_data | `remove_by_user_data(user_data: gpointer?) -> gboolean` | g_source_remove_by_user_data |  | Removes a source from the default main loop context given the user data for the callback. If multiple sources exist with the same user data, only o... |
| set_name_by_id | `set_name_by_id(tag: guint, name: utf8) -> none` | g_source_set_name_by_id | 2.26 | Sets the name of a source using its ID. This is a convenience utility to set source names from the return value of g_idle_add(), g_timeout_add(), e... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_child_source | `Source.add_child_source(child_source: Source) -> none` | g_source_add_child_source | 2.28 | Adds @child_source to @source as a "polled" source; when @source is added to a #GMainContext, @child_source will be automatically added with the sa... |
| add_poll | `Source.add_poll(fd: PollFD) -> none` | g_source_add_poll |  | Adds a file descriptor to the set of file descriptors polled for this source. This is usually combined with g_source_new() to add an event source. ... |
| add_unix_fd | `Source.add_unix_fd(fd: gint, events: IOCondition) -> gpointer` | g_source_add_unix_fd | 2.36 | Monitors @fd for the IO events in @events. The tag returned by this function can be used to remove or modify the monitoring of the fd using g_sourc... |
| attach | `Source.attach(context: MainContext?) -> guint` | g_source_attach |  | Adds a #GSource to a @context so that it will be executed within that context. Remove it by calling g_source_destroy(). This function is safe to ca... |
| destroy | `Source.destroy() -> none` | g_source_destroy |  | Removes a source from its #GMainContext, if any, and mark it as destroyed. The source cannot be subsequently added to another context. It is safe t... |
| get_can_recurse | `Source.get_can_recurse() -> gboolean` | g_source_get_can_recurse |  | Checks whether a source is allowed to be called recursively. see g_source_set_can_recurse(). |
| get_context | `Source.get_context() -> MainContext` | g_source_get_context |  | Gets the #GMainContext with which the source is associated. You can call this on a source that has been destroyed, provided that the #GMainContext ... |
| get_current_time | `Source.get_current_time(timeval: TimeVal) -> none` | g_source_get_current_time |  | This function ignores @source and is otherwise the same as g_get_current_time(). |
| get_id | `Source.get_id() -> guint` | g_source_get_id |  | Returns the numeric ID for a particular source. The ID of a source is a positive integer which is unique within a particular main loop context. The... |
| get_name | `Source.get_name() -> utf8` | g_source_get_name | 2.26 | Gets a name for the source, used in debugging and profiling. The name may be #NULL if it has never been set with g_source_set_name(). |
| get_priority | `Source.get_priority() -> gint` | g_source_get_priority |  | Gets the priority of a source. |
| get_ready_time | `Source.get_ready_time() -> gint64` | g_source_get_ready_time |  | Gets the "ready time" of @source, as set by g_source_set_ready_time(). Any time before or equal to the current monotonic time (including 0) is an i... |
| get_time | `Source.get_time() -> gint64` | g_source_get_time | 2.28 | Gets the time to be used when checking this source. The advantage of calling this function over calling g_get_monotonic_time() directly is that whe... |
| is_destroyed | `Source.is_destroyed() -> gboolean` | g_source_is_destroyed | 2.12 | Returns whether @source has been destroyed. This is important when you operate upon your objects from within idle handlers, but may have freed the ... |
| modify_unix_fd | `Source.modify_unix_fd(tag: gpointer, new_events: IOCondition) -> none` | g_source_modify_unix_fd | 2.36 | Updates the event mask to watch for the fd identified by @tag. @tag is the tag returned from g_source_add_unix_fd(). If you want to remove a fd, do... |
| query_unix_fd | `Source.query_unix_fd(tag: gpointer) -> IOCondition` | g_source_query_unix_fd | 2.36 | Queries the events reported for the fd corresponding to @tag on @source during the last poll. The return value of this function is only defined whe... |
| ref | `Source.ref() -> Source` | g_source_ref |  | Increases the reference count on a source by one. |
| remove_child_source | `Source.remove_child_source(child_source: Source) -> none` | g_source_remove_child_source | 2.28 | Detaches @child_source from @source and destroys it. This API is only intended to be used by implementations of #GSource. Do not call this API on a... |
| remove_poll | `Source.remove_poll(fd: PollFD) -> none` | g_source_remove_poll |  | Removes a file descriptor from the set of file descriptors polled for this source. This API is only intended to be used by implementations of #GSou... |
| remove_unix_fd | `Source.remove_unix_fd(tag: gpointer) -> none` | g_source_remove_unix_fd | 2.36 | Reverses the effect of a previous call to g_source_add_unix_fd(). You only need to call this if you want to remove an fd from being watched while k... |
| set_callback | `Source.set_callback(func: SourceFunc, data: gpointer?, notify: DestroyNotify?) -> none` | g_source_set_callback |  | Sets the callback function for a source. The callback for a source is called from the source's dispatch function. The exact type of @func depends o... |
| set_callback_indirect | `Source.set_callback_indirect(callback_data: gpointer?, callback_funcs: SourceCallbackFuncs) -> none` | g_source_set_callback_indirect |  | Sets the callback function storing the data as a refcounted callback "object". This is used internally. Note that calling g_source_set_callback_ind... |
| set_can_recurse | `Source.set_can_recurse(can_recurse: gboolean) -> none` | g_source_set_can_recurse |  | Sets whether a source can be called recursively. If @can_recurse is %TRUE, then while the source is being dispatched then this source will be proce... |
| set_dispose_function | `Source.set_dispose_function(dispose: SourceDisposeFunc) -> none` | g_source_set_dispose_function | 2.64 | Set @dispose as dispose function on @source. @dispose will be called once the reference count of @source reaches 0 but before any of the state of t... |
| set_funcs | `Source.set_funcs(funcs: SourceFuncs) -> none` | g_source_set_funcs | 2.12 | Sets the source functions (can be used to override default implementations) of an unattached source. |
| set_name | `Source.set_name(name: utf8) -> none` | g_source_set_name | 2.26 | Sets a name for the source, used in debugging and profiling. The name defaults to #NULL. The source name should describe in a human-readable way wh... |
| set_priority | `Source.set_priority(priority: gint) -> none` | g_source_set_priority |  | Sets the priority of a source. While the main loop is being run, a source will be dispatched if it is ready to be dispatched and no sources at a hi... |
| set_ready_time | `Source.set_ready_time(ready_time: gint64) -> none` | g_source_set_ready_time | 2.36 | Sets a #GSource to be dispatched when the given monotonic time is reached (or passed). If the monotonic time is in the past (as it always will be i... |
| set_static_name | `Source.set_static_name(name: utf8) -> none` | g_source_set_static_name | 2.70 | A variant of g_source_set_name() that does not duplicate the @name, and can only be used with string literals. |
| unref | `Source.unref() -> none` | g_source_unref |  | Decreases the reference count of a source by one. If the resulting reference count is zero the source and associated memory will be destroyed. |

### GLib.SourceCallbackFuncs

C type: `GSourceCallbackFuncs`

The `GSourceCallbackFuncs` struct contains functions for managing callback objects.

#### Fields

| Field | Type |
| --- | --- |
| get | none |
| ref | none |
| unref | none |

### GLib.SourceFuncs

C type: `GSourceFuncs`

The `GSourceFuncs` struct contains a table of functions used to handle event sources in a generic manner. For idle sources, the prepare and check f...

#### Fields

| Field | Type |
| --- | --- |
| check | gboolean |
| closure_callback | SourceFunc |
| closure_marshal | SourceDummyMarshal |
| dispatch | gboolean |
| finalize | none |
| prepare | gboolean |

### GLib.SourcePrivate

C type: `GSourcePrivate`

### GLib.StatBuf

C type: `GStatBuf`

A type corresponding to the appropriate struct type for the stat() system call, depending on the platform and/or compiler being used. See g_stat() ...

### GLib.StaticMutex

C type: `GStaticMutex`

A #GStaticMutex works like a #GMutex. Prior to GLib 2.32, GStaticMutex had the significant advantage that it doesn't need to be created at run-time...

#### Fields

| Field | Type |
| --- | --- |
| mutex | Mutex |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free | `StaticMutex.free() -> none` | g_static_mutex_free |  | Releases all resources allocated to @mutex. You don't have to call this functions for a #GStaticMutex with an unbounded lifetime, i.e. objects decl... |
| get_mutex_impl | `StaticMutex.get_mutex_impl() -> Mutex` | g_static_mutex_get_mutex_impl |  |  |
| init | `StaticMutex.init() -> none` | g_static_mutex_init |  | Initializes @mutex. Alternatively you can initialize it with %G_STATIC_MUTEX_INIT. |

### GLib.StaticPrivate

C type: `GStaticPrivate`

A #GStaticPrivate works almost like a #GPrivate, but it has one significant advantage. It doesn't need to be created at run-time like a #GPrivate, ...

#### Fields

| Field | Type |
| --- | --- |
| index | guint |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free | `StaticPrivate.free() -> none` | g_static_private_free |  | Releases all resources allocated to @private_key. You don't have to call this functions for a #GStaticPrivate with an unbounded lifetime, i.e. obje... |
| get | `StaticPrivate.get() -> gpointer` | g_static_private_get |  | Works like g_private_get() only for a #GStaticPrivate. This function works even if g_thread_init() has not yet been called. |
| init | `StaticPrivate.init() -> none` | g_static_private_init |  | Initializes @private_key. Alternatively you can initialize it with %G_STATIC_PRIVATE_INIT. |
| set | `StaticPrivate.set(data: gpointer?, notify: DestroyNotify) -> none` | g_static_private_set |  | Sets the pointer keyed to @private_key for the current thread and the function @notify to be called with that pointer (%NULL or non-%NULL), wheneve... |

### GLib.StaticRecMutex

C type: `GStaticRecMutex`

A #GStaticRecMutex works like a #GStaticMutex, but it can be locked multiple times by one thread. If you enter it n times, you have to unlock it n ...

#### Fields

| Field | Type |
| --- | --- |
| depth | guint |
| mutex | StaticMutex |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free | `StaticRecMutex.free() -> none` | g_static_rec_mutex_free |  | Releases all resources allocated to a #GStaticRecMutex. You don't have to call this functions for a #GStaticRecMutex with an unbounded lifetime, i.... |
| init | `StaticRecMutex.init() -> none` | g_static_rec_mutex_init |  | A #GStaticRecMutex must be initialized with this function before it can be used. Alternatively you can initialize it with %G_STATIC_REC_MUTEX_INIT. |
| lock | `StaticRecMutex.lock() -> none` | g_static_rec_mutex_lock |  | Locks @mutex. If @mutex is already locked by another thread, the current thread will block until @mutex is unlocked by the other thread. If @mutex ... |
| lock_full | `StaticRecMutex.lock_full(depth: guint) -> none` | g_static_rec_mutex_lock_full |  | Works like calling g_static_rec_mutex_lock() for @mutex @depth times. |
| trylock | `StaticRecMutex.trylock() -> gboolean` | g_static_rec_mutex_trylock |  | Tries to lock @mutex. If @mutex is already locked by another thread, it immediately returns %FALSE. Otherwise it locks @mutex and returns %TRUE. If... |
| unlock | `StaticRecMutex.unlock() -> none` | g_static_rec_mutex_unlock |  | Unlocks @mutex. Another thread will be allowed to lock @mutex only when it has been unlocked as many times as it had been locked before. If @mutex ... |
| unlock_full | `StaticRecMutex.unlock_full() -> guint` | g_static_rec_mutex_unlock_full |  | Completely unlocks @mutex. If another thread is blocked in a g_static_rec_mutex_lock() call for @mutex, it will be woken and can lock @mutex itself... |

### GLib.StaticRWLock

C type: `GStaticRWLock`

The #GStaticRWLock struct represents a read-write lock. A read-write lock can be used for protecting data that some portions of code only read from...

#### Fields

| Field | Type |
| --- | --- |
| have_writer | gboolean |
| mutex | StaticMutex |
| read_cond | Cond |
| read_counter | guint |
| want_to_read | guint |
| want_to_write | guint |
| write_cond | Cond |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free | `StaticRWLock.free() -> none` | g_static_rw_lock_free |  | Releases all resources allocated to @lock. You don't have to call this functions for a #GStaticRWLock with an unbounded lifetime, i.e. objects decl... |
| init | `StaticRWLock.init() -> none` | g_static_rw_lock_init |  | A #GStaticRWLock must be initialized with this function before it can be used. Alternatively you can initialize it with %G_STATIC_RW_LOCK_INIT. |
| reader_lock | `StaticRWLock.reader_lock() -> none` | g_static_rw_lock_reader_lock |  | Locks @lock for reading. There may be unlimited concurrent locks for reading of a #GStaticRWLock at the same time. If @lock is already locked for w... |
| reader_trylock | `StaticRWLock.reader_trylock() -> gboolean` | g_static_rw_lock_reader_trylock |  | Tries to lock @lock for reading. If @lock is already locked for writing by another thread or if another thread is already waiting to lock @lock for... |
| reader_unlock | `StaticRWLock.reader_unlock() -> none` | g_static_rw_lock_reader_unlock |  | Unlocks @lock. If a thread waits to lock @lock for writing and all locks for reading have been unlocked, the waiting thread is woken up and can loc... |
| writer_lock | `StaticRWLock.writer_lock() -> none` | g_static_rw_lock_writer_lock |  | Locks @lock for writing. If @lock is already locked for writing or reading by other threads, this function will block until @lock is completely unl... |
| writer_trylock | `StaticRWLock.writer_trylock() -> gboolean` | g_static_rw_lock_writer_trylock |  | Tries to lock @lock for writing. If @lock is already locked (for either reading or writing) by another thread, it immediately returns %FALSE. Other... |
| writer_unlock | `StaticRWLock.writer_unlock() -> none` | g_static_rw_lock_writer_unlock |  | Unlocks @lock. If a thread is waiting to lock @lock for writing and all locks for reading have been unlocked, the waiting thread is woken up and ca... |

### GLib.String

GType: `GString` ?? C type: `GString`

A `GString` is an object that handles the memory management of a C string. The emphasis of `GString` is on text, typically UTF-8. Crucially, the "s...

#### Fields

| Field | Type |
| --- | --- |
| allocated_len | gsize |
| len | gsize |
| str | utf8 |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `String.new(init: utf8?) -> String` | g_string_new |  | Creates a new #GString, initialized with the given string. |
| new_len | `String.new_len(init: utf8, len: gssize) -> String` | g_string_new_len |  | Creates a new #GString with @len bytes of the @init buffer. Because a length is provided, @init need not be nul-terminated, and can contain embedde... |
| new_take | `String.new_take(init: utf8?) -> String` | g_string_new_take | 2.78 | Creates a new #GString, initialized with the given string. After this call, @init belongs to the #GString and may no longer be modified by the call... |
| sized_new | `String.sized_new(dfl_size: gsize) -> String` | g_string_sized_new |  | Creates a new #GString, with enough space for @dfl_size bytes. This is useful if you are going to add a lot of text to the string and don't want it... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append | `String.append(val: utf8) -> String` | g_string_append |  | Adds a string onto the end of a #GString, expanding it if necessary. |
| append_c | `String.append_c(c: gchar) -> String` | g_string_append_c |  | Adds a byte onto the end of a #GString, expanding it if necessary. |
| append_len | `String.append_len(val: utf8, len: gssize) -> String` | g_string_append_len |  | Appends @len bytes of @val to @string. If @len is positive, @val may contain embedded nuls and need not be nul-terminated. It is the caller's respo... |
| append_printf | `String.append_printf(format: utf8, ...: void) -> none` | g_string_append_printf |  | Appends a formatted string onto the end of a #GString. This function is similar to g_string_printf() except that the text is appended to the #GString. |
| append_unichar | `String.append_unichar(wc: gunichar) -> String` | g_string_append_unichar |  | Converts a Unicode character into UTF-8, and appends it to the string. |
| append_uri_escaped | `String.append_uri_escaped(unescaped: utf8, reserved_chars_allowed: utf8, allow_utf8: gboolean) -> String` | g_string_append_uri_escaped | 2.16 | Appends @unescaped to @string, escaping any characters that are reserved in URIs using URI-style escape sequences. |
| append_vprintf | `String.append_vprintf(format: utf8, args: va_list) -> none` | g_string_append_vprintf | 2.14 | Appends a formatted string onto the end of a #GString. This function is similar to g_string_append_printf() except that the arguments to the format... |
| ascii_down | `String.ascii_down() -> String` | g_string_ascii_down |  | Converts all uppercase ASCII letters to lowercase ASCII letters. |
| ascii_up | `String.ascii_up() -> String` | g_string_ascii_up |  | Converts all lowercase ASCII letters to uppercase ASCII letters. |
| assign | `String.assign(rval: utf8) -> String` | g_string_assign |  | Copies the bytes from a string into a #GString, destroying any previous contents. It is rather like the standard strcpy() function, except that you... |
| down | `String.down() -> String` | g_string_down |  | Converts a #GString to lowercase. |
| equal | `String.equal(v2: String) -> gboolean` | g_string_equal |  | Compares two strings for equality, returning %TRUE if they are equal. For use with #GHashTable. |
| erase | `String.erase(pos: gssize, len: gssize) -> String` | g_string_erase |  | Removes @len bytes from a #GString, starting at position @pos. The rest of the #GString is shifted down to fill the gap. |
| free | `String.free(free_segment: gboolean) -> utf8` | g_string_free |  | Frees the memory allocated for the #GString. If @free_segment is %TRUE it also frees the character data. If it's %FALSE, the caller gains ownership... |
| free_and_steal | `String.free_and_steal() -> utf8` | g_string_free_and_steal | 2.76 | Frees the memory allocated for the #GString. The caller gains ownership of the buffer and must free it after use with g_free(). |
| free_to_bytes | `String.free_to_bytes() -> Bytes` | g_string_free_to_bytes | 2.34 | Transfers ownership of the contents of @string to a newly allocated #GBytes. The #GString structure itself is deallocated, and it is therefore inva... |
| hash | `String.hash() -> guint` | g_string_hash |  | Creates a hash code for @str; for use with #GHashTable. |
| insert | `String.insert(pos: gssize, val: utf8) -> String` | g_string_insert |  | Inserts a copy of a string into a #GString, expanding it if necessary. |
| insert_c | `String.insert_c(pos: gssize, c: gchar) -> String` | g_string_insert_c |  | Inserts a byte into a #GString, expanding it if necessary. |
| insert_len | `String.insert_len(pos: gssize, val: utf8, len: gssize) -> String` | g_string_insert_len |  | Inserts @len bytes of @val into @string at @pos. If @len is positive, @val may contain embedded nuls and need not be nul-terminated. It is the call... |
| insert_unichar | `String.insert_unichar(pos: gssize, wc: gunichar) -> String` | g_string_insert_unichar |  | Converts a Unicode character into UTF-8, and insert it into the string at the given position. |
| overwrite | `String.overwrite(pos: gsize, val: utf8) -> String` | g_string_overwrite | 2.14 | Overwrites part of a string, lengthening it if necessary. |
| overwrite_len | `String.overwrite_len(pos: gsize, val: utf8, len: gssize) -> String` | g_string_overwrite_len | 2.14 | Overwrites part of a string, lengthening it if necessary. This function will work with embedded nuls. |
| prepend | `String.prepend(val: utf8) -> String` | g_string_prepend |  | Adds a string on to the start of a #GString, expanding it if necessary. |
| prepend_c | `String.prepend_c(c: gchar) -> String` | g_string_prepend_c |  | Adds a byte onto the start of a #GString, expanding it if necessary. |
| prepend_len | `String.prepend_len(val: utf8, len: gssize) -> String` | g_string_prepend_len |  | Prepends @len bytes of @val to @string. If @len is positive, @val may contain embedded nuls and need not be nul-terminated. It is the caller's resp... |
| prepend_unichar | `String.prepend_unichar(wc: gunichar) -> String` | g_string_prepend_unichar |  | Converts a Unicode character into UTF-8, and prepends it to the string. |
| printf | `String.printf(format: utf8, ...: void) -> none` | g_string_printf |  | Writes a formatted string into a #GString. This is similar to the standard sprintf() function, except that the #GString buffer automatically expand... |
| replace | `String.replace(find: utf8, replace: utf8, limit: guint) -> guint` | g_string_replace | 2.68 | Replaces the string @find with the string @replace in a #GString up to @limit times. If the number of instances of @find in the #GString is less th... |
| set_size | `String.set_size(len: gsize) -> String` | g_string_set_size |  | Sets the length of a #GString. If the length is less than the current length, the string will be truncated. If the length is greater than the curre... |
| truncate | `String.truncate(len: gsize) -> String` | g_string_truncate |  | Cuts off the end of the GString, leaving the first @len bytes. |
| up | `String.up() -> String` | g_string_up |  | Converts a #GString to uppercase. |
| vprintf | `String.vprintf(format: utf8, args: va_list) -> none` | g_string_vprintf | 2.14 | Writes a formatted string into a #GString. This function is similar to g_string_printf() except that the arguments to the format string are passed ... |

### GLib.StringChunk

C type: `GStringChunk`

`GStringChunk` provides efficient storage of groups of strings String chunks are used to store groups of strings. Memory is allocated in blocks, an...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(size: gsize) -> StringChunk` | g_string_chunk_new |  | Creates a new #GStringChunk. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `StringChunk.clear() -> none` | g_string_chunk_clear | 2.14 | Frees all strings contained within the #GStringChunk. After calling g_string_chunk_clear() it is not safe to access any of the strings which were c... |
| free | `StringChunk.free() -> none` | g_string_chunk_free |  | Frees all memory allocated by the #GStringChunk. After calling g_string_chunk_free() it is not safe to access any of the strings which were contain... |
| insert | `StringChunk.insert(string: utf8) -> utf8` | g_string_chunk_insert |  | Adds a copy of @string to the #GStringChunk. It returns a pointer to the new copy of the string in the #GStringChunk. The characters in the string ... |
| insert_const | `StringChunk.insert_const(string: utf8) -> utf8` | g_string_chunk_insert_const |  | Adds a copy of @string to the #GStringChunk, unless the same string has already been added to the #GStringChunk with g_string_chunk_insert_const().... |
| insert_len | `StringChunk.insert_len(string: utf8, len: gssize) -> utf8` | g_string_chunk_insert_len | 2.4 | Adds a copy of the first @len bytes of @string to the #GStringChunk. The copy is nul-terminated. Since this function does not stop at nul bytes, it... |

### GLib.StrvBuilder

GType: `GStrvBuilder` ?? C type: `GStrvBuilder`

`GStrvBuilder` is a helper object to build a %NULL-terminated string arrays. The following example shows how to build a two element array: ```c g_a...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `StrvBuilder.new() -> StrvBuilder` | g_strv_builder_new | 2.68 | Creates a new #GStrvBuilder with a reference count of 1. Use g_strv_builder_unref() on the returned value when no longer needed. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `StrvBuilder.add(value: utf8) -> none` | g_strv_builder_add |  | Add a string to the end of the array. Since 2.68 |
| add_many | `StrvBuilder.add_many(...: void) -> none` | g_strv_builder_add_many |  | Appends all the given strings to the builder. Since 2.70 |
| addv | `StrvBuilder.addv(value: utf8) -> none` | g_strv_builder_addv |  | Appends all the strings in the given vector to the builder. Since 2.70 |
| end | `StrvBuilder.end() -> utf8` | g_strv_builder_end |  | Ends the builder process and returns the constructed NULL-terminated string array. The returned value should be freed with g_strfreev() when no lon... |
| ref | `StrvBuilder.ref() -> StrvBuilder` | g_strv_builder_ref | 2.68 | Atomically increments the reference count of @builder by one. This function is thread-safe and may be called from any thread. |
| take | `StrvBuilder.take(value: utf8) -> none` | g_strv_builder_take |  | Add a string to the end of the array. After @value belongs to the #GStrvBuilder and may no longer be modified by the caller. Since 2.80 |
| unref | `StrvBuilder.unref() -> none` | g_strv_builder_unref | 2.68 | Decreases the reference count on @builder. In the event that there are no more references, releases all memory associated with the #GStrvBuilder. |

### GLib.TestCase

C type: `GTestCase`

An opaque structure representing a test case.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free | `TestCase.free() -> none` | g_test_case_free | 2.70 | Free the @test_case. |

### GLib.TestConfig

C type: `GTestConfig`

#### Fields

| Field | Type |
| --- | --- |
| test_initialized | gboolean |
| test_perf | gboolean |
| test_quick | gboolean |
| test_quiet | gboolean |
| test_undefined | gboolean |
| test_verbose | gboolean |

### GLib.TestLogBuffer

C type: `GTestLogBuffer`

Internal function for gtester to free test log messages, no ABI guarantees provided.

#### Fields

| Field | Type |
| --- | --- |
| data | String |
| msgs | GLib.SList |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new() -> TestLogBuffer` | g_test_log_buffer_new |  | Internal function for gtester to decode test log messages, no ABI guarantees provided. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free | `TestLogBuffer.free() -> none` | g_test_log_buffer_free |  | Internal function for gtester to free test log messages, no ABI guarantees provided. |
| pop | `TestLogBuffer.pop() -> TestLogMsg` | g_test_log_buffer_pop |  | Internal function for gtester to retrieve test log messages, no ABI guarantees provided. |
| push | `TestLogBuffer.push(n_bytes: guint, bytes: guint8) -> none` | g_test_log_buffer_push |  | Internal function for gtester to decode test log messages, no ABI guarantees provided. |

### GLib.TestLogMsg

C type: `GTestLogMsg`

Internal function for gtester to free test log messages, no ABI guarantees provided.

#### Fields

| Field | Type |
| --- | --- |
| log_type | TestLogType |
| n_nums | guint |
| n_strings | guint |
| nums | long double |
| strings | utf8 |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free | `TestLogMsg.free() -> none` | g_test_log_msg_free |  | Internal function for gtester to free test log messages, no ABI guarantees provided. |

### GLib.TestSuite

C type: `GTestSuite`

An opaque structure representing a test suite.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `TestSuite.add(test_case: TestCase) -> none` | g_test_suite_add | 2.16 | Adds @test_case to @suite. |
| add_suite | `TestSuite.add_suite(nestedsuite: TestSuite) -> none` | g_test_suite_add_suite | 2.16 | Adds @nestedsuite to @suite. |
| free | `TestSuite.free() -> none` | g_test_suite_free | 2.70 | Free the @suite and all nested #GTestSuites. |

### GLib.Thread

GType: `GThread` ?? C type: `GThread`

The #GThread struct represents a running thread. This struct is returned by g_thread_new() or g_thread_try_new(). You can obtain the #GThread struc...

#### Fields

| Field | Type |
| --- | --- |
| data | gpointer |
| func | ThreadFunc |
| joinable | gboolean |
| priority | ThreadPriority |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Thread.new(name: utf8?, func: ThreadFunc, data: gpointer?) -> Thread` | g_thread_new | 2.32 | This function creates a new thread. The new thread starts by invoking @func with the argument data. The thread will run until @func returns or unti... |
| try_new | `Thread.try_new(name: utf8?, func: ThreadFunc, data: gpointer?) -> Thread throws` | g_thread_try_new | 2.32 | This function is the same as g_thread_new() except that it allows for the possibility of failure. If a thread can not be created (due to resource l... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| create | `create(func: ThreadFunc, data: gpointer?, joinable: gboolean) -> Thread throws` | g_thread_create |  | This function creates a new thread. The new thread executes the function @func with the argument @data. If the thread was created successfully, it ... |
| create_full | `create_full(func: ThreadFunc, data: gpointer?, stack_size: gulong, joinable: gboolean, bound: gboolean, priority: ThreadPriority) -> Thread throws` | g_thread_create_full |  | This function creates a new thread. |
| error_quark | `error_quark() -> Quark` | g_thread_error_quark |  |  |
| exit | `exit(retval: gpointer?) -> none` | g_thread_exit |  | Terminates the current thread. If another thread is waiting for us using g_thread_join() then the waiting thread will be woken up and get @retval a... |
| foreach | `foreach(thread_func: Func, user_data: gpointer?) -> none` | g_thread_foreach | 2.10 | Call @thread_func on all #GThreads that have been created with g_thread_create(). Note that threads may decide to exit while @thread_func is runnin... |
| get_initialized | `get_initialized() -> gboolean` | g_thread_get_initialized | 2.20 | Indicates if g_thread_init() has been called. |
| init | `init(vtable: gpointer?) -> none` | g_thread_init |  | If you use GLib from more than one thread, you must initialize the thread system by calling g_thread_init(). Since version 2.24, calling g_thread_i... |
| init_with_errorcheck_mutexes | `init_with_errorcheck_mutexes(vtable: gpointer?) -> none` | g_thread_init_with_errorcheck_mutexes |  |  |
| self | `self() -> Thread` | g_thread_self |  | This function returns the #GThread corresponding to the current thread. Note that this function does not increase the reference count of the return... |
| yield | `yield() -> none` | g_thread_yield |  | Causes the calling thread to voluntarily relinquish the CPU, so that other threads can run. This function is often used as a method to make busy wa... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| join | `Thread.join() -> gpointer` | g_thread_join |  | Waits until @thread finishes, i.e. the function @func, as given to g_thread_new(), returns or g_thread_exit() is called. If @thread has already ter... |
| ref | `Thread.ref() -> Thread` | g_thread_ref | 2.32 | Increase the reference count on @thread. |
| set_priority | `Thread.set_priority(priority: ThreadPriority) -> none` | g_thread_set_priority |  | This function does nothing. |
| unref | `Thread.unref() -> none` | g_thread_unref | 2.32 | Decrease the reference count on @thread, possibly freeing all resources associated with it. Note that each thread holds a reference to its #GThread... |

### GLib.ThreadFunctions

C type: `GThreadFunctions`

This function table is no longer used by g_thread_init() to initialize the thread system.

#### Fields

| Field | Type |
| --- | --- |
| cond_broadcast | none |
| cond_free | none |
| cond_new | Cond |
| cond_signal | none |
| cond_timed_wait | gboolean |
| cond_wait | none |
| mutex_free | none |
| mutex_lock | none |
| mutex_new | Mutex |
| mutex_trylock | gboolean |
| mutex_unlock | none |
| private_get | gpointer |
| private_new | Private |
| private_set | none |
| thread_create | none |
| thread_equal | gboolean |
| thread_exit | none |
| thread_join | none |
| thread_self | none |
| thread_set_priority | none |
| thread_yield | none |

### GLib.ThreadPool

C type: `GThreadPool`

The `GThreadPool` struct represents a thread pool. A thread pool is useful when you wish to asynchronously fork out the execution of work and conti...

#### Fields

| Field | Type |
| --- | --- |
| exclusive | gboolean |
| func | Func |
| user_data | gpointer |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_max_idle_time | `get_max_idle_time() -> guint` | g_thread_pool_get_max_idle_time | 2.10 | This function will return the maximum @interval that a thread will wait in the thread pool for new tasks before being stopped. If this function ret... |
| get_max_unused_threads | `get_max_unused_threads() -> gint` | g_thread_pool_get_max_unused_threads |  | Returns the maximal allowed number of unused threads. |
| get_num_unused_threads | `get_num_unused_threads() -> guint` | g_thread_pool_get_num_unused_threads |  | Returns the number of currently unused threads. |
| new | `new(func: Func, user_data: gpointer?, max_threads: gint, exclusive: gboolean) -> ThreadPool throws` | g_thread_pool_new |  | This function creates a new thread pool. Whenever you call g_thread_pool_push(), either a new thread is created or an unused one is reused. At most... |
| new_full | `new_full(func: Func, user_data: gpointer?, item_free_func: DestroyNotify?, max_threads: gint, exclusive: gboolean) -> ThreadPool throws` | g_thread_pool_new_full | 2.70 | This function creates a new thread pool similar to g_thread_pool_new() but allowing @item_free_func to be specified to free the data passed to g_th... |
| set_max_idle_time | `set_max_idle_time(interval: guint) -> none` | g_thread_pool_set_max_idle_time | 2.10 | This function will set the maximum @interval that a thread waiting in the pool for new tasks can be idle for before being stopped. This function is... |
| set_max_unused_threads | `set_max_unused_threads(max_threads: gint) -> none` | g_thread_pool_set_max_unused_threads |  | Sets the maximal number of unused threads to @max_threads. If @max_threads is -1, no limit is imposed on the number of unused threads. The default ... |
| stop_unused_threads | `stop_unused_threads() -> none` | g_thread_pool_stop_unused_threads |  | Stops all currently unused threads. This does not change the maximal number of unused threads. This function can be used to regularly stop all unus... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free | `ThreadPool.free(immediate: gboolean, wait_: gboolean) -> none` | g_thread_pool_free |  | Frees all resources allocated for @pool. If @immediate is %TRUE, no new task is processed for @pool. Otherwise @pool is not freed before the last t... |
| get_max_threads | `ThreadPool.get_max_threads() -> gint` | g_thread_pool_get_max_threads |  | Returns the maximal number of threads for @pool. |
| get_num_threads | `ThreadPool.get_num_threads() -> guint` | g_thread_pool_get_num_threads |  | Returns the number of threads currently running in @pool. |
| move_to_front | `ThreadPool.move_to_front(data: gpointer?) -> gboolean` | g_thread_pool_move_to_front | 2.46 | Moves the item to the front of the queue of unprocessed items, so that it will be processed next. |
| push | `ThreadPool.push(data: gpointer?) -> gboolean throws` | g_thread_pool_push |  | Inserts @data into the list of tasks to be executed by @pool. When the number of currently running threads is lower than the maximal allowed number... |
| set_max_threads | `ThreadPool.set_max_threads(max_threads: gint) -> gboolean throws` | g_thread_pool_set_max_threads |  | Sets the maximal allowed number of threads for @pool. A value of -1 means that the maximal number of threads is unlimited. If @pool is an exclusive... |
| set_sort_function | `ThreadPool.set_sort_function(func: CompareDataFunc, user_data: gpointer?) -> none` | g_thread_pool_set_sort_function | 2.10 | Sets the function used to sort the list of tasks. This allows the tasks to be processed by a priority determined by @func, and not just in the orde... |
| unprocessed | `ThreadPool.unprocessed() -> guint` | g_thread_pool_unprocessed |  | Returns the number of tasks still unprocessed in @pool. |

### GLib.Timer

C type: `GTimer`

`GTimer` records a start time, and counts microseconds elapsed since that time. This is done somewhat differently on different platforms, and can b...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new() -> Timer` | g_timer_new |  | Creates a new timer, and starts timing (i.e. g_timer_start() is implicitly called for you). |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| continue | `Timer.continue() -> none` | g_timer_continue | 2.4 | Resumes a timer that has previously been stopped with g_timer_stop(). g_timer_stop() must be called before using this function. |
| destroy | `Timer.destroy() -> none` | g_timer_destroy |  | Destroys a timer, freeing associated resources. |
| elapsed | `Timer.elapsed(microseconds: gulong) -> gdouble` | g_timer_elapsed |  | If @timer has been started but not stopped, obtains the time since the timer was started. If @timer has been stopped, obtains the elapsed time betw... |
| is_active | `Timer.is_active() -> gboolean` | g_timer_is_active | 2.62 | Exposes whether the timer is currently active. |
| reset | `Timer.reset() -> none` | g_timer_reset |  | This function is useless; it's fine to call g_timer_start() on an already-started timer to reset the start time, so g_timer_reset() serves no purpose. |
| start | `Timer.start() -> none` | g_timer_start |  | Marks a start time, so that future calls to g_timer_elapsed() will report the time since g_timer_start() was called. g_timer_new() automatically ma... |
| stop | `Timer.stop() -> none` | g_timer_stop |  | Marks an end time, so calls to g_timer_elapsed() will return the difference between this end time and the start time. |

### GLib.TimeVal

C type: `GTimeVal`

Represents a precise time, with seconds and microseconds. Similar to the struct timeval returned by the `gettimeofday()` UNIX system call. GLib is ...

#### Fields

| Field | Type |
| --- | --- |
| tv_sec | glong |
| tv_usec | glong |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| from_iso8601 | `from_iso8601(iso_date: utf8, time_: out TimeVal) -> gboolean` | g_time_val_from_iso8601 | 2.12 | Converts a string containing an ISO 8601 encoded date and time to a #GTimeVal and puts it into @time_. @iso_date must include year, month, day, hou... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `TimeVal.add(microseconds: glong) -> none` | g_time_val_add |  | Adds the given number of microseconds to @time_. @microseconds can also be negative to decrease the value of @time_. |
| to_iso8601 | `TimeVal.to_iso8601() -> utf8` | g_time_val_to_iso8601 | 2.12 | Converts @time_ into an RFC 3339 encoded string, relative to the Coordinated Universal Time (UTC). This is one of the many formats allowed by ISO 8... |

### GLib.TimeZone

GType: `GTimeZone` ?? C type: `GTimeZone`

A `GTimeZone` represents a time zone, at no particular point in time. The `GTimeZone` struct is refcounted and immutable. Each time zone has an ide...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TimeZone.new(identifier: utf8?) -> TimeZone` | g_time_zone_new | 2.26 | A version of g_time_zone_new_identifier() which returns the UTC time zone if @identifier could not be parsed or loaded. If you need to check whethe... |
| new_identifier | `TimeZone.new_identifier(identifier: utf8?) -> TimeZone` | g_time_zone_new_identifier | 2.68 | Creates a #GTimeZone corresponding to @identifier. If @identifier cannot be parsed or loaded, %NULL is returned. @identifier can either be an RFC33... |
| new_local | `TimeZone.new_local() -> TimeZone` | g_time_zone_new_local | 2.26 | Creates a #GTimeZone corresponding to local time. The local time zone may change between invocations to this function; for example, if the system a... |
| new_offset | `TimeZone.new_offset(seconds: gint32) -> TimeZone` | g_time_zone_new_offset | 2.58 | Creates a #GTimeZone corresponding to the given constant offset from UTC, in seconds. This is equivalent to calling g_time_zone_new() with a string... |
| new_utc | `TimeZone.new_utc() -> TimeZone` | g_time_zone_new_utc | 2.26 | Creates a #GTimeZone corresponding to UTC. This is equivalent to calling g_time_zone_new() with a value like "Z", "UTC", "+00", etc. You should rel... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| adjust_time | `TimeZone.adjust_time(type: TimeType, time_: inout gint64) -> gint` | g_time_zone_adjust_time | 2.26 | Finds an interval within @tz that corresponds to the given @time_, possibly adjusting @time_ if required to fit into an interval. The meaning of @t... |
| find_interval | `TimeZone.find_interval(type: TimeType, time_: gint64) -> gint` | g_time_zone_find_interval | 2.26 | Finds an interval within @tz that corresponds to the given @time_. The meaning of @time_ depends on @type. If @type is %G_TIME_TYPE_UNIVERSAL then ... |
| get_abbreviation | `TimeZone.get_abbreviation(interval: gint) -> utf8` | g_time_zone_get_abbreviation | 2.26 | Determines the time zone abbreviation to be used during a particular @interval of time in the time zone @tz. For example, in Toronto this is curren... |
| get_identifier | `TimeZone.get_identifier() -> utf8` | g_time_zone_get_identifier | 2.58 | Get the identifier of this #GTimeZone, as passed to g_time_zone_new(). If the identifier passed at construction time was not recognised, `UTC` will... |
| get_offset | `TimeZone.get_offset(interval: gint) -> gint32` | g_time_zone_get_offset | 2.26 | Determines the offset to UTC in effect during a particular @interval of time in the time zone @tz. The offset is the number of seconds that you add... |
| is_dst | `TimeZone.is_dst(interval: gint) -> gboolean` | g_time_zone_is_dst | 2.26 | Determines if daylight savings time is in effect during a particular @interval of time in the time zone @tz. |
| ref | `TimeZone.ref() -> TimeZone` | g_time_zone_ref | 2.26 | Increases the reference count on @tz. |
| unref | `TimeZone.unref() -> none` | g_time_zone_unref | 2.26 | Decreases the reference count on @tz. |

### GLib.TrashStack

C type: `GTrashStack`

A `GTrashStack` is an efficient way to keep a stack of unused allocated memory chunks. Each memory chunk is required to be large enough to hold a `...

#### Fields

| Field | Type |
| --- | --- |
| next | TrashStack |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| height | `height(stack_p: TrashStack) -> guint` | g_trash_stack_height |  | Returns the height of a #GTrashStack. Note that execution of this function is of O(N) complexity where N denotes the number of items on the stack. |
| peek | `peek(stack_p: TrashStack) -> gpointer` | g_trash_stack_peek |  | Returns the element at the top of a #GTrashStack which may be %NULL. |
| pop | `pop(stack_p: TrashStack) -> gpointer` | g_trash_stack_pop |  | Pops a piece of memory off a #GTrashStack. |
| push | `push(stack_p: TrashStack, data_p: gpointer) -> none` | g_trash_stack_push |  | Pushes a piece of memory onto a #GTrashStack. |

### GLib.Tree

GType: `GTree` ?? C type: `GTree`

The GTree struct is an opaque data structure representing a [balanced binary tree][glib-Balanced-Binary-Trees]. It should be accessed only by using...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Tree.new(key_compare_func: CompareFunc) -> Tree` | g_tree_new |  | Creates a new #GTree. |
| new_full | `Tree.new_full(key_compare_func: CompareDataFunc, key_compare_data: gpointer?, key_destroy_func: DestroyNotify, value_destroy_func: DestroyNotify) -> Tree` | g_tree_new_full |  | Creates a new #GTree like g_tree_new() and allows to specify functions to free the memory allocated for the key and value that get called when remo... |
| new_with_data | `Tree.new_with_data(key_compare_func: CompareDataFunc, key_compare_data: gpointer?) -> Tree` | g_tree_new_with_data |  | Creates a new #GTree with a comparison function that accepts user data. See g_tree_new() for more details. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| destroy | `Tree.destroy() -> none` | g_tree_destroy |  | Removes all keys and values from the #GTree and decreases its reference count by one. If keys and/or values are dynamically allocated, you should e... |
| foreach | `Tree.foreach(func: TraverseFunc, user_data: gpointer?) -> none` | g_tree_foreach |  | Calls the given function for each of the key/value pairs in the #GTree. The function is passed the key and value of each pair, and the given @data ... |
| foreach_node | `Tree.foreach_node(func: TraverseNodeFunc, user_data: gpointer?) -> none` | g_tree_foreach_node | 2.68 | Calls the given function for each of the nodes in the #GTree. The function is passed the pointer to the particular node, and the given @data parame... |
| height | `Tree.height() -> gint` | g_tree_height |  | Gets the height of a #GTree. If the #GTree contains no nodes, the height is 0. If the #GTree contains only one root node the height is 1. If the ro... |
| insert | `Tree.insert(key: gpointer?, value: gpointer?) -> none` | g_tree_insert |  | Inserts a key/value pair into a #GTree. Inserts a new key and value into a #GTree as g_tree_insert_node() does, only this function does not return ... |
| insert_node | `Tree.insert_node(key: gpointer?, value: gpointer?) -> TreeNode` | g_tree_insert_node | 2.68 | Inserts a key/value pair into a #GTree. If the given key already exists in the #GTree its corresponding value is set to the new value. If you suppl... |
| lookup | `Tree.lookup(key: gpointer?) -> gpointer` | g_tree_lookup |  | Gets the value corresponding to the given key. Since a #GTree is automatically balanced as key/value pairs are added, key lookup is O(log n) (where... |
| lookup_extended | `Tree.lookup_extended(lookup_key: gpointer?, orig_key: out gpointer?, value: out gpointer?) -> gboolean` | g_tree_lookup_extended |  | Looks up a key in the #GTree, returning the original key and the associated value. This is useful if you need to free the memory allocated for the ... |
| lookup_node | `Tree.lookup_node(key: gpointer?) -> TreeNode` | g_tree_lookup_node | 2.68 | Gets the tree node corresponding to the given key. Since a #GTree is automatically balanced as key/value pairs are added, key lookup is O(log n) (w... |
| lower_bound | `Tree.lower_bound(key: gpointer?) -> TreeNode` | g_tree_lower_bound | 2.68 | Gets the lower bound node corresponding to the given key, or %NULL if the tree is empty or all the nodes in the tree have keys that are strictly lo... |
| nnodes | `Tree.nnodes() -> gint` | g_tree_nnodes |  | Gets the number of nodes in a #GTree. |
| node_first | `Tree.node_first() -> TreeNode` | g_tree_node_first | 2.68 | Returns the first in-order node of the tree, or %NULL for an empty tree. |
| node_last | `Tree.node_last() -> TreeNode` | g_tree_node_last | 2.68 | Returns the last in-order node of the tree, or %NULL for an empty tree. |
| ref | `Tree.ref() -> Tree` | g_tree_ref | 2.22 | Increments the reference count of @tree by one. It is safe to call this function from any thread. |
| remove | `Tree.remove(key: gpointer?) -> gboolean` | g_tree_remove |  | Removes a key/value pair from a #GTree. If the #GTree was created using g_tree_new_full(), the key and value are freed using the supplied destroy f... |
| remove_all | `Tree.remove_all() -> none` | g_tree_remove_all | 2.70 | Removes all nodes from a #GTree and destroys their keys and values, then resets the #GTree???s root to %NULL. |
| replace | `Tree.replace(key: gpointer?, value: gpointer?) -> none` | g_tree_replace |  | Inserts a new key and value into a #GTree as g_tree_replace_node() does, only this function does not return the inserted or set node. |
| replace_node | `Tree.replace_node(key: gpointer?, value: gpointer?) -> TreeNode` | g_tree_replace_node | 2.68 | Inserts a new key and value into a #GTree similar to g_tree_insert_node(). The difference is that if the key already exists in the #GTree, it gets ... |
| search | `Tree.search(search_func: CompareFunc, user_data: gpointer?) -> gpointer` | g_tree_search |  | Searches a #GTree using @search_func. The @search_func is called with a pointer to the key of a key/value pair in the tree, and the passed in @user... |
| search_node | `Tree.search_node(search_func: CompareFunc, user_data: gpointer?) -> TreeNode` | g_tree_search_node | 2.68 | Searches a #GTree using @search_func. The @search_func is called with a pointer to the key of a key/value pair in the tree, and the passed in @user... |
| steal | `Tree.steal(key: gpointer?) -> gboolean` | g_tree_steal |  | Removes a key and its associated value from a #GTree without calling the key and value destroy functions. If the key does not exist in the #GTree, ... |
| traverse | `Tree.traverse(traverse_func: TraverseFunc, traverse_type: TraverseType, user_data: gpointer?) -> none` | g_tree_traverse |  | Calls the given function for each node in the #GTree. |
| unref | `Tree.unref() -> none` | g_tree_unref | 2.22 | Decrements the reference count of @tree by one. If the reference count drops to 0, all keys and values will be destroyed (if destroy functions were... |
| upper_bound | `Tree.upper_bound(key: gpointer?) -> TreeNode` | g_tree_upper_bound | 2.68 | Gets the upper bound node corresponding to the given key, or %NULL if the tree is empty or all the nodes in the tree have keys that are lower than ... |

### GLib.TreeNode

C type: `GTreeNode`

An opaque type which identifies a specific node in a #GTree.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| key | `TreeNode.key() -> gpointer` | g_tree_node_key | 2.68 | Gets the key stored at a particular tree node. |
| next | `TreeNode.next() -> TreeNode` | g_tree_node_next | 2.68 | Returns the next in-order node of the tree, or %NULL if the passed node was already the last one. |
| previous | `TreeNode.previous() -> TreeNode` | g_tree_node_previous | 2.68 | Returns the previous in-order node of the tree, or %NULL if the passed node was already the first one. |
| value | `TreeNode.value() -> gpointer` | g_tree_node_value | 2.68 | Gets the value stored at a particular tree node. |

### GLib.Tuples

C type: `GTuples`

The #GTuples struct is used to return records (or tuples) from the #GRelation by g_relation_select(). It only contains one public member - the numb...

#### Fields

| Field | Type |
| --- | --- |
| len | guint |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| destroy | `Tuples.destroy() -> none` | g_tuples_destroy |  | Frees the records which were returned by g_relation_select(). This should always be called after g_relation_select() when you are finished with the... |
| index | `Tuples.index(index_: gint, field: gint) -> gpointer` | g_tuples_index |  | Gets a field from the records returned by g_relation_select(). It returns the given field of the record at the given index. The returned value shou... |

### GLib.UnixPipe

C type: `GUnixPipe`

A Unix pipe. The advantage of this type over `int[2]` is that it can be closed automatically when it goes out of scope, using `g_auto(GUnixPipe)`, ...

#### Fields

| Field | Type |
| --- | --- |
| fds | gint |

### GLib.Uri

GType: `GUri` ?? C type: `GUri`

The `GUri` type and related functions can be used to parse URIs into their components, and build valid URIs from individual components. Since `GUri...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| build | `build(flags: UriFlags, scheme: utf8, userinfo: utf8?, host: utf8?, port: gint, path: utf8, query: utf8?, fragment: utf8?) -> Uri` | g_uri_build | 2.66 | Creates a new #GUri from the given components according to @flags. See also g_uri_build_with_user(), which allows specifying the components of the ... |
| build_with_user | `build_with_user(flags: UriFlags, scheme: utf8, user: utf8?, password: utf8?, auth_params: utf8?, host: utf8?, port: gint, path: utf8, query: utf8?, fragment: utf8?) -> Uri` | g_uri_build_with_user | 2.66 | Creates a new #GUri from the given components according to @flags (%G_URI_FLAGS_HAS_PASSWORD is added unconditionally). The @flags must be coherent... |
| error_quark | `error_quark() -> Quark` | g_uri_error_quark |  |  |
| escape_bytes | `escape_bytes(unescaped: guint8, length: gsize, reserved_chars_allowed: utf8?) -> utf8` | g_uri_escape_bytes | 2.66 | Escapes arbitrary data for use in a URI. Normally all characters that are not ???unreserved??? (i.e. ASCII alphanumerical characters plus dash, dot... |
| escape_string | `escape_string(unescaped: utf8, reserved_chars_allowed: utf8?, allow_utf8: gboolean) -> utf8` | g_uri_escape_string | 2.16 | Escapes a string for use in a URI. Normally all characters that are not "unreserved" (i.e. ASCII alphanumerical characters plus dash, dot, undersco... |
| is_valid | `is_valid(uri_string: utf8, flags: UriFlags) -> gboolean throws` | g_uri_is_valid | 2.66 | Parses @uri_string according to @flags, to determine whether it is a valid absolute URI, i.e. it does not need to be resolved relative to another U... |
| join | `join(flags: UriFlags, scheme: utf8?, userinfo: utf8?, host: utf8?, port: gint, path: utf8, query: utf8?, fragment: utf8?) -> utf8` | g_uri_join | 2.66 | Joins the given components together according to @flags to create an absolute URI string. @path may not be %NULL (though it may be the empty string... |
| join_with_user | `join_with_user(flags: UriFlags, scheme: utf8?, user: utf8?, password: utf8?, auth_params: utf8?, host: utf8?, port: gint, path: utf8, query: utf8?, fragment: utf8?) -> utf8` | g_uri_join_with_user | 2.66 | Joins the given components together according to @flags to create an absolute URI string. @path may not be %NULL (though it may be the empty string... |
| list_extract_uris | `list_extract_uris(uri_list: utf8) -> utf8` | g_uri_list_extract_uris | 2.6 | Splits an URI list conforming to the text/uri-list mime type defined in RFC 2483 into individual URIs, discarding any comments. The URIs are not va... |
| parse | `parse(uri_string: utf8, flags: UriFlags) -> Uri throws` | g_uri_parse | 2.66 | Parses @uri_string according to @flags. If the result is not a valid absolute URI, it will be discarded, and an error returned. |
| parse_params | `parse_params(params: utf8, length: gssize, separators: utf8, flags: UriParamsFlags) -> GLib.HashTable throws` | g_uri_parse_params | 2.66 | Many URI schemes include one or more attribute/value pairs as part of the URI value. This method can be used to parse them into a hash table. When ... |
| parse_scheme | `parse_scheme(uri: utf8) -> utf8` | g_uri_parse_scheme | 2.16 | Gets the scheme portion of a URI string. RFC 3986 decodes the scheme as: \|[ URI = scheme ":" hier-part [ "?" query ] [ "#" fragment ] ]\| Common sch... |
| peek_scheme | `peek_scheme(uri: utf8) -> utf8` | g_uri_peek_scheme | 2.66 | Gets the scheme portion of a URI string. RFC 3986 decodes the scheme as: \|[ URI = scheme ":" hier-part [ "?" query ] [ "#" fragment ] ]\| Common sch... |
| resolve_relative | `resolve_relative(base_uri_string: utf8?, uri_ref: utf8, flags: UriFlags) -> utf8 throws` | g_uri_resolve_relative | 2.66 | Parses @uri_ref according to @flags and, if it is a relative URI, resolves it relative to @base_uri_string. If the result is not a valid absolute U... |
| split | `split(uri_ref: utf8, flags: UriFlags, scheme: out utf8?, userinfo: out utf8?, host: out utf8?, port: out gint?, path: out utf8?, query: out utf8?, fragment: out utf8?) -> gboolean throws` | g_uri_split | 2.66 | Parses @uri_ref (which can be an absolute or relative URI) according to @flags, and returns the pieces. Any component that doesn't appear in @uri_r... |
| split_network | `split_network(uri_string: utf8, flags: UriFlags, scheme: out utf8?, host: out utf8?, port: out gint?) -> gboolean throws` | g_uri_split_network | 2.66 | Parses @uri_string (which must be an absolute URI) according to @flags, and returns the pieces relevant to connecting to a host. See the documentat... |
| split_with_user | `split_with_user(uri_ref: utf8, flags: UriFlags, scheme: out utf8?, user: out utf8?, password: out utf8?, auth_params: out utf8?, host: out utf8?, port: out gint?, path: out utf8?, query: out utf8?, fragment: out utf8?) -> gboolean throws` | g_uri_split_with_user | 2.66 | Parses @uri_ref (which can be an absolute or relative URI) according to @flags, and returns the pieces. Any component that doesn't appear in @uri_r... |
| unescape_bytes | `unescape_bytes(escaped_string: utf8, length: gssize, illegal_characters: utf8?) -> Bytes throws` | g_uri_unescape_bytes | 2.66 | Unescapes a segment of an escaped string as binary data. Note that in contrast to g_uri_unescape_string(), this does allow nul bytes to appear in t... |
| unescape_segment | `unescape_segment(escaped_string: utf8?, escaped_string_end: utf8?, illegal_characters: utf8?) -> utf8` | g_uri_unescape_segment | 2.16 | Unescapes a segment of an escaped string. If any of the characters in @illegal_characters or the NUL character appears as an escaped character in @... |
| unescape_string | `unescape_string(escaped_string: utf8, illegal_characters: utf8?) -> utf8` | g_uri_unescape_string | 2.16 | Unescapes a whole escaped string. If any of the characters in @illegal_characters or the NUL character appears as an escaped character in @escaped_... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_auth_params | `Uri.get_auth_params() -> utf8` | g_uri_get_auth_params | 2.66 | Gets @uri's authentication parameters, which may contain `%`-encoding, depending on the flags with which @uri was created. (If @uri was not created... |
| get_flags | `Uri.get_flags() -> UriFlags` | g_uri_get_flags | 2.66 | Gets @uri's flags set upon construction. |
| get_fragment | `Uri.get_fragment() -> utf8` | g_uri_get_fragment | 2.66 | Gets @uri's fragment, which may contain `%`-encoding, depending on the flags with which @uri was created. |
| get_host | `Uri.get_host() -> utf8` | g_uri_get_host | 2.66 | Gets @uri's host. This will never have `%`-encoded characters, unless it is non-UTF-8 (which can only be the case if @uri was created with %G_URI_F... |
| get_password | `Uri.get_password() -> utf8` | g_uri_get_password | 2.66 | Gets @uri's password, which may contain `%`-encoding, depending on the flags with which @uri was created. (If @uri was not created with %G_URI_FLAG... |
| get_path | `Uri.get_path() -> utf8` | g_uri_get_path | 2.66 | Gets @uri's path, which may contain `%`-encoding, depending on the flags with which @uri was created. |
| get_port | `Uri.get_port() -> gint` | g_uri_get_port | 2.66 | Gets @uri's port. |
| get_query | `Uri.get_query() -> utf8` | g_uri_get_query | 2.66 | Gets @uri's query, which may contain `%`-encoding, depending on the flags with which @uri was created. For queries consisting of a series of `name=... |
| get_scheme | `Uri.get_scheme() -> utf8` | g_uri_get_scheme | 2.66 | Gets @uri's scheme. Note that this will always be all-lowercase, regardless of the string or strings that @uri was created from. |
| get_user | `Uri.get_user() -> utf8` | g_uri_get_user | 2.66 | Gets the ???username??? component of @uri's userinfo, which may contain `%`-encoding, depending on the flags with which @uri was created. If @uri w... |
| get_userinfo | `Uri.get_userinfo() -> utf8` | g_uri_get_userinfo | 2.66 | Gets @uri's userinfo, which may contain `%`-encoding, depending on the flags with which @uri was created. |
| parse_relative | `Uri.parse_relative(uri_ref: utf8, flags: UriFlags) -> Uri throws` | g_uri_parse_relative | 2.66 | Parses @uri_ref according to @flags and, if it is a relative URI, resolves it relative to @base_uri. If the result is not a valid absolute URI, it ... |
| ref | `Uri.ref() -> Uri` | g_uri_ref | 2.66 | Increments the reference count of @uri by one. |
| to_string | `Uri.to_string() -> utf8` | g_uri_to_string | 2.66 | Returns a string representing @uri. This is not guaranteed to return a string which is identical to the string that @uri was parsed from. However, ... |
| to_string_partial | `Uri.to_string_partial(flags: UriHideFlags) -> utf8` | g_uri_to_string_partial | 2.66 | Returns a string representing @uri, subject to the options in @flags. See g_uri_to_string() and #GUriHideFlags for more details. |
| unref | `Uri.unref() -> none` | g_uri_unref | 2.66 | Atomically decrements the reference count of @uri by one. When the reference count reaches zero, the resources allocated by @uri are freed |

### GLib.UriParamsIter

C type: `GUriParamsIter`

Many URI schemes include one or more attribute/value pairs as part of the URI value. For example `scheme://server/path?query=string&is=there` has t...

#### Fields

| Field | Type |
| --- | --- |
| dummy0 | gint |
| dummy1 | gpointer |
| dummy2 | gpointer |
| dummy3 | guint8 |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| init | `UriParamsIter.init(params: utf8, length: gssize, separators: utf8, flags: UriParamsFlags) -> none` | g_uri_params_iter_init | 2.66 | Initializes an attribute/value pair iterator. The iterator keeps pointers to the @params and @separators arguments, those variables must thus outli... |
| next | `UriParamsIter.next(attribute: out utf8?, value: out utf8?) -> gboolean throws` | g_uri_params_iter_next | 2.66 | Advances @iter and retrieves the next attribute/value. %FALSE is returned if an error has occurred (in which case @error is set), or if the end of ... |

### GLib.Variant

GType: `GVariant` ?? C type: `GVariant`

`GVariant` is a variant datatype; it can contain one or more values along with information about the type of the values. A `GVariant` may contain s...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Variant.new(format_string: utf8, ...: void) -> Variant` | g_variant_new | 2.24 | Creates a new #GVariant instance. Think of this function as an analogue to g_strdup_printf(). The type of the created instance and the arguments th... |
| new_array | `Variant.new_array(child_type: VariantType?, children: Variant?, n_children: gsize) -> Variant` | g_variant_new_array | 2.24 | Creates a new #GVariant array from @children. @child_type must be non-%NULL if @n_children is zero. Otherwise, the child type is determined by insp... |
| new_boolean | `Variant.new_boolean(value: gboolean) -> Variant` | g_variant_new_boolean | 2.24 | Creates a new boolean #GVariant instance -- either %TRUE or %FALSE. |
| new_byte | `Variant.new_byte(value: guint8) -> Variant` | g_variant_new_byte | 2.24 | Creates a new byte #GVariant instance. |
| new_bytestring | `Variant.new_bytestring(string: guint8) -> Variant` | g_variant_new_bytestring | 2.26 | Creates an array-of-bytes #GVariant with the contents of @string. This function is just like g_variant_new_string() except that the string need not... |
| new_bytestring_array | `Variant.new_bytestring_array(strv: utf8, length: gssize) -> Variant` | g_variant_new_bytestring_array | 2.26 | Constructs an array of bytestring #GVariant from the given array of strings. If @length is -1 then @strv is %NULL-terminated. |
| new_dict_entry | `Variant.new_dict_entry(key: Variant, value: Variant) -> Variant` | g_variant_new_dict_entry | 2.24 | Creates a new dictionary entry #GVariant. @key and @value must be non-%NULL. @key must be a value of a basic type (ie: not a container). If the @ke... |
| new_double | `Variant.new_double(value: gdouble) -> Variant` | g_variant_new_double | 2.24 | Creates a new double #GVariant instance. |
| new_fixed_array | `Variant.new_fixed_array(element_type: VariantType, elements: gpointer?, n_elements: gsize, element_size: gsize) -> Variant` | g_variant_new_fixed_array | 2.32 | Constructs a new array #GVariant instance, where the elements are of @element_type type. @elements must be an array with fixed-sized elements. Nume... |
| new_from_bytes | `Variant.new_from_bytes(type: VariantType, bytes: Bytes, trusted: gboolean) -> Variant` | g_variant_new_from_bytes | 2.36 | Constructs a new serialized-mode #GVariant instance. This is the inner interface for creation of new serialized values that gets called from variou... |
| new_from_data | `Variant.new_from_data(type: VariantType, data: guint8, size: gsize, trusted: gboolean, notify: DestroyNotify, user_data: gpointer?) -> Variant` | g_variant_new_from_data | 2.24 | Creates a new #GVariant instance from serialized data. @type is the type of #GVariant instance that will be constructed. The interpretation of @dat... |
| new_handle | `Variant.new_handle(value: gint32) -> Variant` | g_variant_new_handle | 2.24 | Creates a new handle #GVariant instance. By convention, handles are indexes into an array of file descriptors that are sent alongside a D-Bus messa... |
| new_int16 | `Variant.new_int16(value: gint16) -> Variant` | g_variant_new_int16 | 2.24 | Creates a new int16 #GVariant instance. |
| new_int32 | `Variant.new_int32(value: gint32) -> Variant` | g_variant_new_int32 | 2.24 | Creates a new int32 #GVariant instance. |
| new_int64 | `Variant.new_int64(value: gint64) -> Variant` | g_variant_new_int64 | 2.24 | Creates a new int64 #GVariant instance. |
| new_maybe | `Variant.new_maybe(child_type: VariantType?, child: Variant?) -> Variant` | g_variant_new_maybe | 2.24 | Depending on if @child is %NULL, either wraps @child inside of a maybe container or creates a Nothing instance for the given @type. At least one of... |
| new_object_path | `Variant.new_object_path(object_path: utf8) -> Variant` | g_variant_new_object_path | 2.24 | Creates a D-Bus object path #GVariant with the contents of @object_path. @object_path must be a valid D-Bus object path. Use g_variant_is_object_pa... |
| new_objv | `Variant.new_objv(strv: utf8, length: gssize) -> Variant` | g_variant_new_objv | 2.30 | Constructs an array of object paths #GVariant from the given array of strings. Each string must be a valid #GVariant object path; see g_variant_is_... |
| new_parsed | `Variant.new_parsed(format: utf8, ...: void) -> Variant` | g_variant_new_parsed |  | Parses @format and returns the result. @format must be a text format #GVariant with one extension: at any point that a value may appear in the text... |
| new_parsed_va | `Variant.new_parsed_va(format: utf8, app: va_list) -> Variant` | g_variant_new_parsed_va |  | Parses @format and returns the result. This is the version of g_variant_new_parsed() intended to be used from libraries. The return value will be f... |
| new_printf | `Variant.new_printf(format_string: utf8, ...: void) -> Variant` | g_variant_new_printf | 2.38 | Creates a string-type GVariant using printf formatting. This is similar to calling g_strdup_printf() and then g_variant_new_string() but it saves a... |
| new_signature | `Variant.new_signature(signature: utf8) -> Variant` | g_variant_new_signature | 2.24 | Creates a D-Bus type signature #GVariant with the contents of @string. @string must be a valid D-Bus type signature. Use g_variant_is_signature() i... |
| new_string | `Variant.new_string(string: utf8) -> Variant` | g_variant_new_string | 2.24 | Creates a string #GVariant with the contents of @string. @string must be valid UTF-8, and must not be %NULL. To encode potentially-%NULL strings, u... |
| new_strv | `Variant.new_strv(strv: utf8, length: gssize) -> Variant` | g_variant_new_strv | 2.24 | Constructs an array of strings #GVariant from the given array of strings. If @length is -1 then @strv is %NULL-terminated. |
| new_take_string | `Variant.new_take_string(string: utf8) -> Variant` | g_variant_new_take_string | 2.38 | Creates a string #GVariant with the contents of @string. @string must be valid UTF-8, and must not be %NULL. To encode potentially-%NULL strings, u... |
| new_tuple | `Variant.new_tuple(children: Variant, n_children: gsize) -> Variant` | g_variant_new_tuple | 2.24 | Creates a new tuple #GVariant out of the items in @children. The type is determined from the types of @children. No entry in the @children array ma... |
| new_uint16 | `Variant.new_uint16(value: guint16) -> Variant` | g_variant_new_uint16 | 2.24 | Creates a new uint16 #GVariant instance. |
| new_uint32 | `Variant.new_uint32(value: guint32) -> Variant` | g_variant_new_uint32 | 2.24 | Creates a new uint32 #GVariant instance. |
| new_uint64 | `Variant.new_uint64(value: guint64) -> Variant` | g_variant_new_uint64 | 2.24 | Creates a new uint64 #GVariant instance. |
| new_va | `Variant.new_va(format_string: utf8, endptr: utf8?, app: va_list) -> Variant` | g_variant_new_va | 2.24 | This function is intended to be used by libraries based on #GVariant that want to provide g_variant_new()-like functionality to their users. The AP... |
| new_variant | `Variant.new_variant(value: Variant) -> Variant` | g_variant_new_variant | 2.24 | Boxes @value. The result is a #GVariant instance representing a variant containing the original value. If @child is a floating reference (see g_var... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| is_object_path | `is_object_path(string: utf8) -> gboolean` | g_variant_is_object_path | 2.24 | Determines if a given string is a valid D-Bus object path. You should ensure that a string is a valid D-Bus object path before passing it to g_vari... |
| is_signature | `is_signature(string: utf8) -> gboolean` | g_variant_is_signature | 2.24 | Determines if a given string is a valid D-Bus type signature. You should ensure that a string is a valid D-Bus type signature before passing it to ... |
| parse | `parse(type: VariantType?, text: utf8, limit: utf8?, endptr: utf8?) -> Variant throws` | g_variant_parse |  | Parses a #GVariant from a text representation. A single #GVariant is parsed from the content of @text. The format is described here. The memory at ... |
| parse_error_print_context | `parse_error_print_context(error: Error, source_str: utf8) -> utf8` | g_variant_parse_error_print_context | 2.40 | Pretty-prints a message showing the context of a #GVariant parse error within the string for which parsing was attempted. The resulting string is s... |
| parse_error_quark | `parse_error_quark() -> Quark` | g_variant_parse_error_quark |  |  |
| parser_get_error_quark | `parser_get_error_quark() -> Quark` | g_variant_parser_get_error_quark |  | Same as g_variant_error_quark(). |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| byteswap | `Variant.byteswap() -> Variant` | g_variant_byteswap | 2.24 | Performs a byteswapping operation on the contents of @value. The result is that all multi-byte numeric data contained in @value is byteswapped. Tha... |
| check_format_string | `Variant.check_format_string(format_string: utf8, copy_only: gboolean) -> gboolean` | g_variant_check_format_string | 2.34 | Checks if calling g_variant_get() with @format_string on @value would be valid from a type-compatibility standpoint. @format_string is assumed to b... |
| classify | `Variant.classify() -> VariantClass` | g_variant_classify | 2.24 | Classifies @value according to its top-level type. |
| compare | `Variant.compare(two: Variant) -> gint` | g_variant_compare | 2.26 | Compares @one and @two. The types of @one and @two are #gconstpointer only to allow use of this function with #GTree, #GPtrArray, etc. They must ea... |
| dup_bytestring | `Variant.dup_bytestring(length: out gsize?) -> guint8` | g_variant_dup_bytestring | 2.26 | Similar to g_variant_get_bytestring() except that instead of returning a constant string, the string is duplicated. The return value must be freed ... |
| dup_bytestring_array | `Variant.dup_bytestring_array(length: out gsize?) -> utf8` | g_variant_dup_bytestring_array | 2.26 | Gets the contents of an array of array of bytes #GVariant. This call makes a deep copy; the return result should be released with g_strfreev(). If ... |
| dup_objv | `Variant.dup_objv(length: out gsize?) -> utf8` | g_variant_dup_objv | 2.30 | Gets the contents of an array of object paths #GVariant. This call makes a deep copy; the return result should be released with g_strfreev(). If @l... |
| dup_string | `Variant.dup_string(length: out gsize) -> utf8` | g_variant_dup_string | 2.24 | Similar to g_variant_get_string() except that instead of returning a constant string, the string is duplicated. The string will always be UTF-8 enc... |
| dup_strv | `Variant.dup_strv(length: out gsize?) -> utf8` | g_variant_dup_strv | 2.24 | Gets the contents of an array of strings #GVariant. This call makes a deep copy; the return result should be released with g_strfreev(). If @length... |
| equal | `Variant.equal(two: Variant) -> gboolean` | g_variant_equal | 2.24 | Checks if @one and @two have the same type and value. The types of @one and @two are #gconstpointer only to allow use of this function with #GHashT... |
| get | `Variant.get(format_string: utf8, ...: void) -> none` | g_variant_get | 2.24 | Deconstructs a #GVariant instance. Think of this function as an analogue to scanf(). The arguments that are expected by this function are entirely ... |
| get_boolean | `Variant.get_boolean() -> gboolean` | g_variant_get_boolean | 2.24 | Returns the boolean value of @value. It is an error to call this function with a @value of any type other than %G_VARIANT_TYPE_BOOLEAN. |
| get_byte | `Variant.get_byte() -> guint8` | g_variant_get_byte | 2.24 | Returns the byte value of @value. It is an error to call this function with a @value of any type other than %G_VARIANT_TYPE_BYTE. |
| get_bytestring | `Variant.get_bytestring() -> guint8` | g_variant_get_bytestring | 2.26 | Returns the string value of a #GVariant instance with an array-of-bytes type. The string has no particular encoding. If the array does not end with... |
| get_bytestring_array | `Variant.get_bytestring_array(length: out gsize?) -> utf8` | g_variant_get_bytestring_array | 2.26 | Gets the contents of an array of array of bytes #GVariant. This call makes a shallow copy; the return result should be released with g_free(), but ... |
| get_child | `Variant.get_child(index_: gsize, format_string: utf8, ...: void) -> none` | g_variant_get_child | 2.24 | Reads a child item out of a container #GVariant instance and deconstructs it according to @format_string. This call is essentially a combination of... |
| get_child_value | `Variant.get_child_value(index_: gsize) -> Variant` | g_variant_get_child_value | 2.24 | Reads a child item out of a container #GVariant instance. This includes variants, maybes, arrays, tuples and dictionary entries. It is an error to ... |
| get_data | `Variant.get_data() -> gpointer` | g_variant_get_data | 2.24 | Returns a pointer to the serialized form of a #GVariant instance. The returned data may not be in fully-normalised form if read from an untrusted s... |
| get_data_as_bytes | `Variant.get_data_as_bytes() -> Bytes` | g_variant_get_data_as_bytes | 2.36 | Returns a pointer to the serialized form of a #GVariant instance. The semantics of this function are exactly the same as g_variant_get_data(), exce... |
| get_double | `Variant.get_double() -> gdouble` | g_variant_get_double | 2.24 | Returns the double precision floating point value of @value. It is an error to call this function with a @value of any type other than %G_VARIANT_T... |
| get_fixed_array | `Variant.get_fixed_array(n_elements: out gsize, element_size: gsize) -> gpointer` | g_variant_get_fixed_array | 2.24 | Provides access to the serialized data for an array of fixed-sized items. @value must be an array with fixed-sized elements. Numeric types are fixe... |
| get_handle | `Variant.get_handle() -> gint32` | g_variant_get_handle | 2.24 | Returns the 32-bit signed integer value of @value. It is an error to call this function with a @value of any type other than %G_VARIANT_TYPE_HANDLE... |
| get_int16 | `Variant.get_int16() -> gint16` | g_variant_get_int16 | 2.24 | Returns the 16-bit signed integer value of @value. It is an error to call this function with a @value of any type other than %G_VARIANT_TYPE_INT16. |
| get_int32 | `Variant.get_int32() -> gint32` | g_variant_get_int32 | 2.24 | Returns the 32-bit signed integer value of @value. It is an error to call this function with a @value of any type other than %G_VARIANT_TYPE_INT32. |
| get_int64 | `Variant.get_int64() -> gint64` | g_variant_get_int64 | 2.24 | Returns the 64-bit signed integer value of @value. It is an error to call this function with a @value of any type other than %G_VARIANT_TYPE_INT64. |
| get_maybe | `Variant.get_maybe() -> Variant` | g_variant_get_maybe | 2.24 | Given a maybe-typed #GVariant instance, extract its value. If the value is Nothing, then this function returns %NULL. |
| get_normal_form | `Variant.get_normal_form() -> Variant` | g_variant_get_normal_form | 2.24 | Gets a #GVariant instance that has the same value as @value and is trusted to be in normal form. If @value is already trusted to be in normal form ... |
| get_objv | `Variant.get_objv(length: out gsize?) -> utf8` | g_variant_get_objv | 2.30 | Gets the contents of an array of object paths #GVariant. This call makes a shallow copy; the return result should be released with g_free(), but th... |
| get_size | `Variant.get_size() -> gsize` | g_variant_get_size | 2.24 | Determines the number of bytes that would be required to store @value with g_variant_store(). If @value has a fixed-sized type then this function a... |
| get_string | `Variant.get_string(length: out gsize?) -> utf8` | g_variant_get_string | 2.24 | Returns the string value of a #GVariant instance with a string type. This includes the types %G_VARIANT_TYPE_STRING, %G_VARIANT_TYPE_OBJECT_PATH an... |
| get_strv | `Variant.get_strv(length: out gsize?) -> utf8` | g_variant_get_strv | 2.24 | Gets the contents of an array of strings #GVariant. This call makes a shallow copy; the return result should be released with g_free(), but the ind... |
| get_type | `Variant.get_type() -> VariantType` | g_variant_get_type | 2.24 | Determines the type of @value. The return value is valid for the lifetime of @value and must not be freed. |
| get_type_string | `Variant.get_type_string() -> utf8` | g_variant_get_type_string | 2.24 | Returns the type string of @value. Unlike the result of calling g_variant_type_peek_string(), this string is nul-terminated. This string belongs to... |
| get_uint16 | `Variant.get_uint16() -> guint16` | g_variant_get_uint16 | 2.24 | Returns the 16-bit unsigned integer value of @value. It is an error to call this function with a @value of any type other than %G_VARIANT_TYPE_UINT16. |
| get_uint32 | `Variant.get_uint32() -> guint32` | g_variant_get_uint32 | 2.24 | Returns the 32-bit unsigned integer value of @value. It is an error to call this function with a @value of any type other than %G_VARIANT_TYPE_UINT32. |
| get_uint64 | `Variant.get_uint64() -> guint64` | g_variant_get_uint64 | 2.24 | Returns the 64-bit unsigned integer value of @value. It is an error to call this function with a @value of any type other than %G_VARIANT_TYPE_UINT64. |
| get_va | `Variant.get_va(format_string: utf8, endptr: utf8?, app: va_list) -> none` | g_variant_get_va | 2.24 | This function is intended to be used by libraries based on #GVariant that want to provide g_variant_get()-like functionality to their users. The AP... |
| get_variant | `Variant.get_variant() -> Variant` | g_variant_get_variant | 2.24 | Unboxes @value. The result is the #GVariant instance that was contained in @value. |
| hash | `Variant.hash() -> guint` | g_variant_hash | 2.24 | Generates a hash value for a #GVariant instance. The output of this function is guaranteed to be the same for a given value only per-process. It ma... |
| is_container | `Variant.is_container() -> gboolean` | g_variant_is_container | 2.24 | Checks if @value is a container. |
| is_floating | `Variant.is_floating() -> gboolean` | g_variant_is_floating | 2.26 | Checks whether @value has a floating reference count. This function should only ever be used to assert that a given variant is or is not floating, ... |
| is_normal_form | `Variant.is_normal_form() -> gboolean` | g_variant_is_normal_form | 2.24 | Checks if @value is in normal form. The main reason to do this is to detect if a given chunk of serialized data is in normal form: load the data in... |
| is_of_type | `Variant.is_of_type(type: VariantType) -> gboolean` | g_variant_is_of_type | 2.24 | Checks if a value has a type matching the provided type. |
| iter_new | `Variant.iter_new() -> VariantIter` | g_variant_iter_new | 2.24 | Creates a heap-allocated #GVariantIter for iterating over the items in @value. Use g_variant_iter_free() to free the return value when you no longe... |
| lookup | `Variant.lookup(key: utf8, format_string: utf8, ...: void) -> gboolean` | g_variant_lookup | 2.28 | Looks up a value in a dictionary #GVariant. This function is a wrapper around g_variant_lookup_value() and g_variant_get(). In the case that %NULL ... |
| lookup_value | `Variant.lookup_value(key: utf8, expected_type: VariantType?) -> Variant` | g_variant_lookup_value | 2.28 | Looks up a value in a dictionary #GVariant. This function works with dictionaries of the type a{s*} (and equally well with type a{o*}, but we only ... |
| n_children | `Variant.n_children() -> gsize` | g_variant_n_children | 2.24 | Determines the number of children in a container #GVariant instance. This includes variants, maybes, arrays, tuples and dictionary entries. It is a... |
| print | `Variant.print(type_annotate: gboolean) -> utf8` | g_variant_print | 2.24 | Pretty-prints @value in the format understood by g_variant_parse(). The format is described [here][gvariant-text]. If @type_annotate is %TRUE, then... |
| print_string | `Variant.print_string(string: String?, type_annotate: gboolean) -> String` | g_variant_print_string | 2.24 | Behaves as g_variant_print(), but operates on a #GString. If @string is non-%NULL then it is appended to and returned. Else, a new empty #GString i... |
| ref | `Variant.ref() -> Variant` | g_variant_ref | 2.24 | Increases the reference count of @value. |
| ref_sink | `Variant.ref_sink() -> Variant` | g_variant_ref_sink | 2.24 | #GVariant uses a floating reference count system. All functions with names starting with `g_variant_new_` return floating references. Calling g_var... |
| store | `Variant.store(data: gpointer) -> none` | g_variant_store | 2.24 | Stores the serialized form of @value at @data. @data should be large enough. See g_variant_get_size(). The stored data is in machine native byte or... |
| take_ref | `Variant.take_ref() -> Variant` | g_variant_take_ref |  | If @value is floating, sink it. Otherwise, do nothing. Typically you want to use g_variant_ref_sink() in order to automatically do the correct thin... |
| unref | `Variant.unref() -> none` | g_variant_unref | 2.24 | Decreases the reference count of @value. When its reference count drops to 0, the memory used by the variant is freed. |

### GLib.VariantBuilder

GType: `GVariantBuilder` ?? C type: `GVariantBuilder`

A utility type for constructing container-type #GVariant instances. This is an opaque structure and may only be accessed using the following functi...

#### Fields

| Field | Type |
| --- | --- |
| partial_magic | gsize |
| type | VariantType |
| y | guintptr |

### GLib.VariantDict

GType: `GVariantDict` ?? C type: `GVariantDict`

#GVariantDict is a mutable interface to #GVariant dictionaries. It can be used for doing a sequence of dictionary lookups in an efficient way on an...

#### Fields

| Field | Type |
| --- | --- |
| asv | Variant |
| partial_magic | gsize |
| y | guintptr |

### GLib.VariantIter

C type: `GVariantIter`

#GVariantIter is an opaque data structure and can only be accessed using the following functions.

#### Fields

| Field | Type |
| --- | --- |
| x | guintptr |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `VariantIter.copy() -> VariantIter` | g_variant_iter_copy | 2.24 | Creates a new heap-allocated #GVariantIter to iterate over the container that was being iterated over by @iter. Iteration begins on the new iterato... |
| free | `VariantIter.free() -> none` | g_variant_iter_free | 2.24 | Frees a heap-allocated #GVariantIter. Only call this function on iterators that were returned by g_variant_iter_new() or g_variant_iter_copy(). |
| init | `VariantIter.init(value: Variant) -> gsize` | g_variant_iter_init | 2.24 | Initialises (without allocating) a #GVariantIter. @iter may be completely uninitialised prior to this call; its old value is ignored. The iterator ... |
| loop | `VariantIter.loop(format_string: utf8, ...: void) -> gboolean` | g_variant_iter_loop | 2.24 | Gets the next item in the container and unpacks it into the variable argument list according to @format_string, returning %TRUE. If no more items r... |
| n_children | `VariantIter.n_children() -> gsize` | g_variant_iter_n_children | 2.24 | Queries the number of child items in the container that we are iterating over. This is the total number of items -- not the number of items remaini... |
| next | `VariantIter.next(format_string: utf8, ...: void) -> gboolean` | g_variant_iter_next | 2.24 | Gets the next item in the container and unpacks it into the variable argument list according to @format_string, returning %TRUE. If no more items r... |
| next_value | `VariantIter.next_value() -> Variant` | g_variant_iter_next_value | 2.24 | Gets the next item in the container. If no more items remain then %NULL is returned. Use g_variant_unref() to drop your reference on the return val... |

### GLib.VariantType

GType: `GVariantType` ?? C type: `GVariantType`

A type in the [type@GLib.Variant] type system. This section introduces the [type@GLib.Variant] type system. It is based, in large part, on the D-Bu...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `VariantType.new(type_string: utf8) -> VariantType` | g_variant_type_new | 2.24 | Creates a new #GVariantType corresponding to the type string given by @type_string. It is appropriate to call g_variant_type_free() on the return v... |
| new_array | `VariantType.new_array(element: VariantType) -> VariantType` | g_variant_type_new_array |  | Constructs the type corresponding to an array of elements of the type @type. It is appropriate to call g_variant_type_free() on the return value. |
| new_dict_entry | `VariantType.new_dict_entry(key: VariantType, value: VariantType) -> VariantType` | g_variant_type_new_dict_entry |  | Constructs the type corresponding to a dictionary entry with a key of type @key and a value of type @value. It is appropriate to call g_variant_typ... |
| new_maybe | `VariantType.new_maybe(element: VariantType) -> VariantType` | g_variant_type_new_maybe |  | Constructs the type corresponding to a maybe instance containing type @type or Nothing. It is appropriate to call g_variant_type_free() on the retu... |
| new_tuple | `VariantType.new_tuple(items: VariantType, length: gint) -> VariantType` | g_variant_type_new_tuple |  | Constructs a new tuple type, from @items. @length is the number of items in @items, or -1 to indicate that @items is %NULL-terminated. It is approp... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| checked_ | `checked_(type_string: utf8) -> VariantType` | g_variant_type_checked_ |  |  |
| string_get_depth_ | `string_get_depth_(type_string: utf8) -> gsize` | g_variant_type_string_get_depth_ |  |  |
| string_is_valid | `string_is_valid(type_string: utf8) -> gboolean` | g_variant_type_string_is_valid |  | Checks if @type_string is a valid GVariant type string. This call is equivalent to calling g_variant_type_string_scan() and confirming that the fol... |
| string_scan | `string_scan(string: utf8, limit: utf8?, endptr: out utf8?) -> gboolean` | g_variant_type_string_scan | 2.24 | Scan for a single complete and valid GVariant type string in @string. The memory pointed to by @limit (or bytes beyond it) is never accessed. If a ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `VariantType.copy() -> VariantType` | g_variant_type_copy |  | Makes a copy of a #GVariantType. It is appropriate to call g_variant_type_free() on the return value. @type may not be %NULL. |
| dup_string | `VariantType.dup_string() -> utf8` | g_variant_type_dup_string |  | Returns a newly-allocated copy of the type string corresponding to @type. The returned string is nul-terminated. It is appropriate to call g_free()... |
| element | `VariantType.element() -> VariantType` | g_variant_type_element |  | Determines the element type of an array or maybe type. This function may only be used with array or maybe types. |
| equal | `VariantType.equal(type2: VariantType) -> gboolean` | g_variant_type_equal |  | Compares @type1 and @type2 for equality. Only returns %TRUE if the types are exactly equal. Even if one type is an indefinite type and the other is... |
| first | `VariantType.first() -> VariantType` | g_variant_type_first |  | Determines the first item type of a tuple or dictionary entry type. This function may only be used with tuple or dictionary entry types, but must n... |
| free | `VariantType.free() -> none` | g_variant_type_free |  | Frees a #GVariantType that was allocated with g_variant_type_copy(), g_variant_type_new() or one of the container type constructor functions. In th... |
| get_string_length | `VariantType.get_string_length() -> gsize` | g_variant_type_get_string_length |  | Returns the length of the type string corresponding to the given @type. This function must be used to determine the valid extent of the memory regi... |
| hash | `VariantType.hash() -> guint` | g_variant_type_hash |  | Hashes @type. The argument type of @type is only #gconstpointer to allow use with #GHashTable without function pointer casting. A valid #GVariantTy... |
| is_array | `VariantType.is_array() -> gboolean` | g_variant_type_is_array |  | Determines if the given @type is an array type. This is true if the type string for @type starts with an 'a'. This function returns %TRUE for any i... |
| is_basic | `VariantType.is_basic() -> gboolean` | g_variant_type_is_basic |  | Determines if the given @type is a basic type. Basic types are booleans, bytes, integers, doubles, strings, object paths and signatures. Only a bas... |
| is_container | `VariantType.is_container() -> gboolean` | g_variant_type_is_container |  | Determines if the given @type is a container type. Container types are any array, maybe, tuple, or dictionary entry types plus the variant type. Th... |
| is_definite | `VariantType.is_definite() -> gboolean` | g_variant_type_is_definite |  | Determines if the given @type is definite (ie: not indefinite). A type is definite if its type string does not contain any indefinite type characte... |
| is_dict_entry | `VariantType.is_dict_entry() -> gboolean` | g_variant_type_is_dict_entry |  | Determines if the given @type is a dictionary entry type. This is true if the type string for @type starts with a '{'. This function returns %TRUE ... |
| is_maybe | `VariantType.is_maybe() -> gboolean` | g_variant_type_is_maybe |  | Determines if the given @type is a maybe type. This is true if the type string for @type starts with an 'm'. This function returns %TRUE for any in... |
| is_subtype_of | `VariantType.is_subtype_of(supertype: VariantType) -> gboolean` | g_variant_type_is_subtype_of |  | Checks if @type is a subtype of @supertype. This function returns %TRUE if @type is a subtype of @supertype. All types are considered to be subtype... |
| is_tuple | `VariantType.is_tuple() -> gboolean` | g_variant_type_is_tuple |  | Determines if the given @type is a tuple type. This is true if the type string for @type starts with a '(' or if @type is %G_VARIANT_TYPE_TUPLE. Th... |
| is_variant | `VariantType.is_variant() -> gboolean` | g_variant_type_is_variant |  | Determines if the given @type is the variant type. |
| key | `VariantType.key() -> VariantType` | g_variant_type_key |  | Determines the key type of a dictionary entry type. This function may only be used with a dictionary entry type. Other than the additional restrict... |
| n_items | `VariantType.n_items() -> gsize` | g_variant_type_n_items |  | Determines the number of items contained in a tuple or dictionary entry type. This function may only be used with tuple or dictionary entry types, ... |
| next | `VariantType.next() -> VariantType` | g_variant_type_next |  | Determines the next item type of a tuple or dictionary entry type. @type must be the result of a previous call to g_variant_type_first() or g_varia... |
| peek_string | `VariantType.peek_string() -> utf8` | g_variant_type_peek_string |  | Returns the type string corresponding to the given @type. The result is not nul-terminated; in order to determine its length you must call g_varian... |
| value | `VariantType.value() -> VariantType` | g_variant_type_value |  | Determines the value type of a dictionary entry type. This function may only be used with a dictionary entry type. |

## Unions

### GLib.DoubleIEEE754

C type: `GDoubleIEEE754`

#### Fields

| Field | Type |
| --- | --- |
| biased_exponent | guint |
| mantissa_high | guint |
| mantissa_low | guint |
| sign | guint |
| v_double | gdouble |

### GLib.FloatIEEE754

C type: `GFloatIEEE754`

#### Fields

| Field | Type |
| --- | --- |
| biased_exponent | guint |
| mantissa | guint |
| sign | guint |
| v_float | gfloat |

### GLib.Mutex

C type: `GMutex`

The #GMutex struct is an opaque data structure to represent a mutex (mutual exclusion). It can be used to protect data against shared access. Take ...

#### Fields

| Field | Type |
| --- | --- |
| i | guint |
| p | gpointer |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new() -> Mutex` | g_mutex_new |  | Allocates and initializes a new #GMutex. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `Mutex.clear() -> none` | g_mutex_clear | 2.32 | Frees the resources allocated to a mutex with g_mutex_init(). This function should not be used with a #GMutex that has been statically allocated. C... |
| free | `Mutex.free() -> none` | g_mutex_free |  | Destroys a @mutex that has been created with g_mutex_new(). Calling g_mutex_free() on a locked mutex may result in undefined behaviour. |
| init | `Mutex.init() -> none` | g_mutex_init | 2.32 | Initializes a #GMutex so that it can be used. This function is useful to initialize a mutex that has been allocated on the stack, or as part of a l... |
| lock | `Mutex.lock() -> none` | g_mutex_lock |  | Locks @mutex. If @mutex is already locked by another thread, the current thread will block until @mutex is unlocked by the other thread. #GMutex is... |
| trylock | `Mutex.trylock() -> gboolean` | g_mutex_trylock |  | Tries to lock @mutex. If @mutex is already locked by another thread, it immediately returns %FALSE. Otherwise it locks @mutex and returns %TRUE. #G... |
| unlock | `Mutex.unlock() -> none` | g_mutex_unlock |  | Unlocks @mutex. If another thread is blocked in a g_mutex_lock() call for @mutex, it will become unblocked and can lock @mutex itself. Calling g_mu... |

### GLib.TokenValue

C type: `GTokenValue`

A union holding the value of the token.

#### Fields

| Field | Type |
| --- | --- |
| v_binary | gulong |
| v_char | guint8 |
| v_comment | utf8 |
| v_error | guint |
| v_float | gdouble |
| v_hex | gulong |
| v_identifier | utf8 |
| v_int | gulong |
| v_int64 | guint64 |
| v_octal | gulong |
| v_string | utf8 |
| v_symbol | gpointer |

### GLib.u

C type: `u`

#### Fields

| Field | Type |
| --- | --- |
| partial_magic | gsize |
| type | VariantType |
| x | guintptr |
| y | guintptr |

### GLib.u

C type: `u`

#### Fields

| Field | Type |
| --- | --- |
| asv | Variant |
| partial_magic | gsize |
| x | guintptr |
| y | guintptr |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| access | `access(filename: filename, mode: gint) -> gint` | g_access | 2.8 | A wrapper for the POSIX access() function. This function is used to test a pathname for one or several of read, write or execute permissions, or ju... |
| aligned_alloc | `aligned_alloc(n_blocks: gsize, n_block_bytes: gsize, alignment: gsize) -> gpointer` | g_aligned_alloc | 2.72 | This function is similar to g_malloc(), allocating (@n_blocks * @n_block_bytes) bytes, but care is taken to align the allocated memory to with the ... |
| aligned_alloc0 | `aligned_alloc0(n_blocks: gsize, n_block_bytes: gsize, alignment: gsize) -> gpointer` | g_aligned_alloc0 | 2.72 | This function is similar to g_aligned_alloc(), but it will also clear the allocated memory before returning it. |
| aligned_free | `aligned_free(mem: gpointer?) -> none` | g_aligned_free | 2.72 | Frees the memory allocated by g_aligned_alloc(). |
| aligned_free_sized | `aligned_free_sized(mem: gpointer?, alignment: gsize, size: gsize) -> none` | g_aligned_free_sized | 2.76 | Frees the memory pointed to by @mem, assuming it is has the given @size and @alignment. If @mem is %NULL this is a no-op (and @size is ignored). It... |
| array_new_take | `array_new_take(data: gpointer?, len: gsize, clear: gboolean, element_size: gsize) -> gpointer` | g_array_new_take | 2.76 | Creates a new #GArray with @data as array data, @len as length and a reference count of 1. This avoids having to copy the data manually, when it ca... |
| array_new_take_zero_terminated | `array_new_take_zero_terminated(data: gpointer, clear: gboolean, element_size: gsize) -> gpointer` | g_array_new_take_zero_terminated | 2.76 | Creates a new #GArray with @data as array data, computing the length of it and setting the reference count to 1. This avoids having to copy the dat... |
| ascii_digit_value | `ascii_digit_value(c: gchar) -> gint` | g_ascii_digit_value |  | Determines the numeric value of a character as a decimal digit. If the character is not a decimal digit according to [func@GLib.ascii_isdigit], `-1... |
| ascii_dtostr | `ascii_dtostr(buffer: utf8, buf_len: gint, d: gdouble) -> utf8` | g_ascii_dtostr |  | Converts a `gdouble` to a string, using the '.' as decimal point. This function generates enough precision that converting the string back using [f... |
| ascii_formatd | `ascii_formatd(buffer: utf8, buf_len: gint, format: utf8, d: gdouble) -> utf8` | g_ascii_formatd |  | Converts a `gdouble` to a string, using the '.' as decimal point. To format the number you pass in a `printf()`-style format string. Allowed conver... |
| ascii_strcasecmp | `ascii_strcasecmp(s1: utf8, s2: utf8) -> gint` | g_ascii_strcasecmp |  | Compare two strings, ignoring the case of ASCII characters. Unlike the BSD `strcasecmp()` function, this only recognizes standard ASCII letters and... |
| ascii_strdown | `ascii_strdown(str: utf8, len: gssize) -> utf8` | g_ascii_strdown |  | Converts all upper case ASCII letters to lower case ASCII letters, with semantics that exactly match [func@GLib.ascii_tolower]. |
| ascii_string_to_signed | `ascii_string_to_signed(str: utf8, base: guint, min: gint64, max: gint64, out_num: out gint64?) -> gboolean throws` | g_ascii_string_to_signed | 2.54 | A convenience function for converting a string to a signed number. This function assumes that @str contains only a number of the given @base that i... |
| ascii_string_to_unsigned | `ascii_string_to_unsigned(str: utf8, base: guint, min: guint64, max: guint64, out_num: out guint64?) -> gboolean throws` | g_ascii_string_to_unsigned | 2.54 | A convenience function for converting a string to an unsigned number. This function assumes that @str contains only a number of the given @base tha... |
| ascii_strncasecmp | `ascii_strncasecmp(s1: utf8, s2: utf8, n: gsize) -> gint` | g_ascii_strncasecmp |  | Compare @s1 and @s2, ignoring the case of ASCII characters and any characters after the first @n in each string. If either string is less than @n b... |
| ascii_strtod | `ascii_strtod(nptr: utf8, endptr: out utf8?) -> gdouble` | g_ascii_strtod |  | Converts a string to a floating point value. This function behaves like the standard `strtod()` function does in the C locale. It does this without... |
| ascii_strtoll | `ascii_strtoll(nptr: utf8, endptr: out utf8?, base: guint) -> gint64` | g_ascii_strtoll | 2.12 | Converts a string to a `gint64` value. This function behaves like the standard `strtoll()` function does in the C locale. It does this without actu... |
| ascii_strtoull | `ascii_strtoull(nptr: utf8, endptr: out utf8?, base: guint) -> guint64` | g_ascii_strtoull | 2.2 | Converts a string to a `guint64` value. This function behaves like the standard `strtoull()` function does in the C locale. It does this without ac... |
| ascii_strup | `ascii_strup(str: utf8, len: gssize) -> utf8` | g_ascii_strup |  | Converts all lower case ASCII letters to upper case ASCII letters, with semantics that exactly match [func@GLib.ascii_toupper]. |
| ascii_tolower | `ascii_tolower(c: gchar) -> gchar` | g_ascii_tolower |  | Convert a character to ASCII lower case. If the character is not an ASCII upper case letter, it is returned unchanged. Unlike the standard C librar... |
| ascii_toupper | `ascii_toupper(c: gchar) -> gchar` | g_ascii_toupper |  | Convert a character to ASCII upper case. If the character is not an ASCII lower case letter, it is returned unchanged. Unlike the standard C librar... |
| ascii_xdigit_value | `ascii_xdigit_value(c: gchar) -> gint` | g_ascii_xdigit_value |  | Determines the numeric value of a character as a hexadecimal digit. If the character is not a hex digit according to [func@GLib.ascii_isxdigit], `-... |
| assert_warning | `assert_warning(log_domain: utf8, file: utf8, line: gint, pretty_function: utf8, expression: utf8) -> none` | g_assert_warning |  |  |
| assertion_message | `assertion_message(domain: utf8, file: utf8, line: gint, func: utf8, message: utf8) -> none` | g_assertion_message |  |  |
| assertion_message_cmpint | `assertion_message_cmpint(domain: utf8, file: utf8, line: gint, func: utf8, expr: utf8, arg1: guint64, cmp: utf8, arg2: guint64, numtype: gchar) -> none` | g_assertion_message_cmpint |  |  |
| assertion_message_cmpnum | `assertion_message_cmpnum(domain: utf8, file: utf8, line: gint, func: utf8, expr: utf8, arg1: long double, cmp: utf8, arg2: long double, numtype: gchar) -> none` | g_assertion_message_cmpnum |  |  |
| assertion_message_cmpstr | `assertion_message_cmpstr(domain: utf8, file: utf8, line: gint, func: utf8, expr: utf8, arg1: utf8, cmp: utf8, arg2: utf8) -> none` | g_assertion_message_cmpstr |  |  |
| assertion_message_cmpstrv | `assertion_message_cmpstrv(domain: utf8, file: utf8, line: gint, func: utf8, expr: utf8, arg1: utf8, arg2: utf8, first_wrong_idx: gsize) -> none` | g_assertion_message_cmpstrv |  |  |
| assertion_message_error | `assertion_message_error(domain: utf8, file: utf8, line: gint, func: utf8, expr: utf8, error: Error, error_domain: Quark, error_code: gint) -> none` | g_assertion_message_error |  |  |
| assertion_message_expr | `assertion_message_expr(domain: utf8?, file: utf8, line: gint, func: utf8, expr: utf8?) -> none` | g_assertion_message_expr |  | Internal function used to print messages from the public g_assert() and g_assert_not_reached() macros. |
| atexit | `atexit(func: VoidFunc) -> none` | g_atexit |  | Specifies a function to be called at normal program termination. Since GLib 2.8.2, on Windows g_atexit() actually is a preprocessor macro that maps... |
| atomic_int_add | `atomic_int_add(atomic: gint, val: gint) -> gint` | g_atomic_int_add | 2.4 | Atomically adds @val to the value of @atomic. Think of this operation as an atomic version of `{ tmp = *atomic; *atomic += val; return tmp; }`. Thi... |
| atomic_int_and | `atomic_int_and(atomic: guint, val: guint) -> guint` | g_atomic_int_and | 2.30 | Performs an atomic bitwise 'and' of the value of @atomic and @val, storing the result back in @atomic. This call acts as a full compiler and hardwa... |
| atomic_int_compare_and_exchange | `atomic_int_compare_and_exchange(atomic: gint, oldval: gint, newval: gint) -> gboolean` | g_atomic_int_compare_and_exchange | 2.4 | Compares @atomic to @oldval and, if equal, sets it to @newval. If @atomic was not equal to @oldval then no change occurs. This compare and exchange... |
| atomic_int_compare_and_exchange_full | `atomic_int_compare_and_exchange_full(atomic: gint, oldval: gint, newval: gint, preval: out gint) -> gboolean` | g_atomic_int_compare_and_exchange_full | 2.74 | Compares @atomic to @oldval and, if equal, sets it to @newval. If @atomic was not equal to @oldval then no change occurs. In any case the value of ... |
| atomic_int_dec_and_test | `atomic_int_dec_and_test(atomic: gint) -> gboolean` | g_atomic_int_dec_and_test | 2.4 | Decrements the value of @atomic by 1. Think of this operation as an atomic version of `{ *atomic -= 1; return (*atomic == 0); }`. This call acts as... |
| atomic_int_exchange | `atomic_int_exchange(atomic: gint, newval: gint) -> gint` | g_atomic_int_exchange | 2.74 | Sets the @atomic to @newval and returns the old value from @atomic. This exchange is done atomically. Think of this operation as an atomic version ... |
| atomic_int_exchange_and_add | `atomic_int_exchange_and_add(atomic: gint, val: gint) -> gint` | g_atomic_int_exchange_and_add | 2.4 | This function existed before g_atomic_int_add() returned the prior value of the integer (which it now does). It is retained only for compatibility ... |
| atomic_int_get | `atomic_int_get(atomic: gint) -> gint` | g_atomic_int_get | 2.4 | Gets the current value of @atomic. This call acts as a full compiler and hardware memory barrier (before the get). While @atomic has a `volatile` q... |
| atomic_int_inc | `atomic_int_inc(atomic: gint) -> none` | g_atomic_int_inc | 2.4 | Increments the value of @atomic by 1. Think of this operation as an atomic version of `{ *atomic += 1; }`. This call acts as a full compiler and ha... |
| atomic_int_or | `atomic_int_or(atomic: guint, val: guint) -> guint` | g_atomic_int_or | 2.30 | Performs an atomic bitwise 'or' of the value of @atomic and @val, storing the result back in @atomic. Think of this operation as an atomic version ... |
| atomic_int_set | `atomic_int_set(atomic: gint, newval: gint) -> none` | g_atomic_int_set | 2.4 | Sets the value of @atomic to @newval. This call acts as a full compiler and hardware memory barrier (after the set). While @atomic has a `volatile`... |
| atomic_int_xor | `atomic_int_xor(atomic: guint, val: guint) -> guint` | g_atomic_int_xor | 2.30 | Performs an atomic bitwise 'xor' of the value of @atomic and @val, storing the result back in @atomic. Think of this operation as an atomic version... |
| atomic_pointer_add | `atomic_pointer_add(atomic: gpointer, val: gssize) -> gintptr` | g_atomic_pointer_add | 2.30 | Atomically adds @val to the value of @atomic. Think of this operation as an atomic version of `{ tmp = *atomic; *atomic += val; return tmp; }`. Thi... |
| atomic_pointer_and | `atomic_pointer_and(atomic: gpointer, val: gsize) -> guintptr` | g_atomic_pointer_and | 2.30 | Performs an atomic bitwise 'and' of the value of @atomic and @val, storing the result back in @atomic. Think of this operation as an atomic version... |
| atomic_pointer_compare_and_exchange | `atomic_pointer_compare_and_exchange(atomic: gpointer, oldval: gpointer?, newval: gpointer?) -> gboolean` | g_atomic_pointer_compare_and_exchange | 2.4 | Compares @atomic to @oldval and, if equal, sets it to @newval. If @atomic was not equal to @oldval then no change occurs. This compare and exchange... |
| atomic_pointer_compare_and_exchange_full | `atomic_pointer_compare_and_exchange_full(atomic: gpointer, oldval: gpointer?, newval: gpointer?, preval: out gpointer) -> gboolean` | g_atomic_pointer_compare_and_exchange_full | 2.74 | Compares @atomic to @oldval and, if equal, sets it to @newval. If @atomic was not equal to @oldval then no change occurs. In any case the value of ... |
| atomic_pointer_exchange | `atomic_pointer_exchange(atomic: gpointer?, newval: gpointer?) -> gpointer` | g_atomic_pointer_exchange | 2.74 | Sets the @atomic to @newval and returns the old value from @atomic. This exchange is done atomically. Think of this operation as an atomic version ... |
| atomic_pointer_get | `atomic_pointer_get(atomic: gpointer) -> gpointer` | g_atomic_pointer_get | 2.4 | Gets the current value of @atomic. This call acts as a full compiler and hardware memory barrier (before the get). While @atomic has a `volatile` q... |
| atomic_pointer_or | `atomic_pointer_or(atomic: gpointer, val: gsize) -> guintptr` | g_atomic_pointer_or | 2.30 | Performs an atomic bitwise 'or' of the value of @atomic and @val, storing the result back in @atomic. Think of this operation as an atomic version ... |
| atomic_pointer_set | `atomic_pointer_set(atomic: gpointer, newval: gpointer?) -> none` | g_atomic_pointer_set | 2.4 | Sets the value of @atomic to @newval. This call acts as a full compiler and hardware memory barrier (after the set). While @atomic has a `volatile`... |
| atomic_pointer_xor | `atomic_pointer_xor(atomic: gpointer, val: gsize) -> guintptr` | g_atomic_pointer_xor | 2.30 | Performs an atomic bitwise 'xor' of the value of @atomic and @val, storing the result back in @atomic. Think of this operation as an atomic version... |
| atomic_rc_box_acquire | `atomic_rc_box_acquire(mem_block: gpointer) -> gpointer` | g_atomic_rc_box_acquire | 2.58 | Atomically acquires a reference on the data pointed by @mem_block. |
| atomic_rc_box_alloc | `atomic_rc_box_alloc(block_size: gsize) -> gpointer` | g_atomic_rc_box_alloc | 2.58 | Allocates @block_size bytes of memory, and adds atomic reference counting semantics to it. The data will be freed when its reference count drops to... |
| atomic_rc_box_alloc0 | `atomic_rc_box_alloc0(block_size: gsize) -> gpointer` | g_atomic_rc_box_alloc0 | 2.58 | Allocates @block_size bytes of memory, and adds atomic reference counting semantics to it. The contents of the returned data is set to zero. The da... |
| atomic_rc_box_dup | `atomic_rc_box_dup(block_size: gsize, mem_block: gpointer) -> gpointer` | g_atomic_rc_box_dup | 2.58 | Allocates a new block of data with atomic reference counting semantics, and copies @block_size bytes of @mem_block into it. |
| atomic_rc_box_get_size | `atomic_rc_box_get_size(mem_block: gpointer) -> gsize` | g_atomic_rc_box_get_size | 2.58 | Retrieves the size of the reference counted data pointed by @mem_block. |
| atomic_rc_box_release | `atomic_rc_box_release(mem_block: gpointer) -> none` | g_atomic_rc_box_release | 2.58 | Atomically releases a reference on the data pointed by @mem_block. If the reference was the last one, it will free the resources allocated for @mem... |
| atomic_rc_box_release_full | `atomic_rc_box_release_full(mem_block: gpointer, clear_func: DestroyNotify) -> none` | g_atomic_rc_box_release_full | 2.58 | Atomically releases a reference on the data pointed by @mem_block. If the reference was the last one, it will call @clear_func to clear the content... |
| atomic_ref_count_compare | `atomic_ref_count_compare(arc: gint, val: gint) -> gboolean` | g_atomic_ref_count_compare | 2.58 | Atomically compares the current value of @arc with @val. |
| atomic_ref_count_dec | `atomic_ref_count_dec(arc: gint) -> gboolean` | g_atomic_ref_count_dec | 2.58 | Atomically decreases the reference count. If %TRUE is returned, the reference count reached 0. After this point, @arc is an undefined state and mus... |
| atomic_ref_count_inc | `atomic_ref_count_inc(arc: gint) -> none` | g_atomic_ref_count_inc | 2.58 | Atomically increases the reference count. |
| atomic_ref_count_init | `atomic_ref_count_init(arc: gint) -> none` | g_atomic_ref_count_init | 2.58 | Initializes a reference count variable to 1. |
| base64_decode | `base64_decode(text: utf8, out_len: out gsize) -> guint8` | g_base64_decode | 2.12 | Decode a sequence of Base-64 encoded text into binary data. Note that the returned binary data is not necessarily zero-terminated, so it should not... |
| base64_decode_inplace | `base64_decode_inplace(text: inout guint8, out_len: inout gsize) -> guint8` | g_base64_decode_inplace | 2.20 | Decode a sequence of Base-64 encoded text into binary data by overwriting the input data. |
| base64_decode_step | `base64_decode_step(in: guint8, len: gsize, out: out guint8, state: inout gint, save: inout guint) -> gsize` | g_base64_decode_step | 2.12 | Incrementally decode a sequence of binary data from its Base-64 stringified representation. By calling this function multiple times you can convert... |
| base64_encode | `base64_encode(data: guint8?, len: gsize) -> utf8` | g_base64_encode | 2.12 | Encode a sequence of binary data into its Base-64 stringified representation. |
| base64_encode_close | `base64_encode_close(break_lines: gboolean, out: out guint8, state: inout gint, save: inout gint) -> gsize` | g_base64_encode_close | 2.12 | Flush the status from a sequence of calls to g_base64_encode_step(). The output buffer must be large enough to fit all the data that will be writte... |
| base64_encode_step | `base64_encode_step(in: guint8, len: gsize, break_lines: gboolean, out: out guint8, state: inout gint, save: inout gint) -> gsize` | g_base64_encode_step | 2.12 | Incrementally encode a sequence of binary data into its Base-64 stringified representation. By calling this function multiple times you can convert... |
| basename | `basename(file_name: filename) -> filename` | g_basename |  | Gets the name of the file without any leading directory components. It returns a pointer into the given file name string. |
| bit_lock | `bit_lock(address: gint, lock_bit: gint) -> none` | g_bit_lock | 2.24 | Sets the indicated @lock_bit in @address. If the bit is already set, this call will block until g_bit_unlock() unsets the corresponding bit. Attemp... |
| bit_nth_lsf | `bit_nth_lsf(mask: gulong, nth_bit: gint) -> gint` | g_bit_nth_lsf |  | Find the position of the first bit set in @mask, searching from (but not including) @nth_bit upwards. Bits are numbered from 0 (least significant) ... |
| bit_nth_msf | `bit_nth_msf(mask: gulong, nth_bit: gint) -> gint` | g_bit_nth_msf |  | Find the position of the first bit set in @mask, searching from (but not including) @nth_bit downwards. Bits are numbered from 0 (least significant... |
| bit_storage | `bit_storage(number: gulong) -> guint` | g_bit_storage |  | Gets the number of bits used to hold @number, e.g. if @number is 4, 3 bits are needed. |
| bit_trylock | `bit_trylock(address: gint, lock_bit: gint) -> gboolean` | g_bit_trylock | 2.24 | Sets the indicated @lock_bit in @address, returning %TRUE if successful. If the bit is already set, returns %FALSE immediately. Attempting to lock ... |
| bit_unlock | `bit_unlock(address: gint, lock_bit: gint) -> none` | g_bit_unlock | 2.24 | Clears the indicated @lock_bit in @address. If another thread is currently blocked in g_bit_lock() on this same bit then it will be woken up. This ... |
| blow_chunks | `blow_chunks() -> none` | g_blow_chunks |  |  |
| bookmark_file_error_quark | `bookmark_file_error_quark() -> Quark` | g_bookmark_file_error_quark |  |  |
| build_filename | `build_filename(first_element: filename, ...: void) -> filename` | g_build_filename |  | Creates a filename from a series of elements using the correct separator for the current platform. On Unix, this function behaves identically to `g... |
| build_filename_valist | `build_filename_valist(first_element: filename, args: va_list) -> filename` | g_build_filename_valist | 2.56 | Creates a filename from a list of elements using the correct separator for the current platform. Behaves exactly like g_build_filename(), but takes... |
| build_filenamev | `build_filenamev(args: filename) -> filename` | g_build_filenamev | 2.8 | Creates a filename from a vector of elements using the correct separator for the current platform. This function behaves exactly like g_build_filen... |
| build_path | `build_path(separator: filename, first_element: filename, ...: void) -> filename` | g_build_path |  | Creates a path from a series of elements using @separator as the separator between elements. At the boundary between two elements, any trailing occ... |
| build_pathv | `build_pathv(separator: utf8, args: filename) -> filename` | g_build_pathv | 2.8 | Behaves exactly like g_build_path(), but takes the path elements as a string array, instead of variadic arguments. This function is mainly meant fo... |
| byte_array_append | `byte_array_append(array: guint8, data: guint8, len: guint) -> guint8` | g_byte_array_append |  | Adds the given bytes to the end of the #GByteArray. The array will grow in size automatically if necessary. |
| byte_array_free | `byte_array_free(array: guint8, free_segment: gboolean) -> guint8` | g_byte_array_free |  | Frees the memory allocated by the #GByteArray. If @free_segment is %TRUE it frees the actual byte data. If the reference count of @array is greater... |
| byte_array_free_to_bytes | `byte_array_free_to_bytes(array: guint8) -> Bytes` | g_byte_array_free_to_bytes | 2.32 | Transfers the data from the #GByteArray into a new immutable #GBytes. The #GByteArray is freed unless the reference count of @array is greater than... |
| byte_array_new | `byte_array_new() -> guint8` | g_byte_array_new |  | Creates a new #GByteArray with a reference count of 1. |
| byte_array_new_take | `byte_array_new_take(data: guint8, len: gsize) -> guint8` | g_byte_array_new_take | 2.32 | Creates a byte array containing the @data. After this call, @data belongs to the #GByteArray and may no longer be modified by the caller. The memor... |
| byte_array_prepend | `byte_array_prepend(array: guint8, data: guint8, len: guint) -> guint8` | g_byte_array_prepend |  | Adds the given data to the start of the #GByteArray. The array will grow in size automatically if necessary. |
| byte_array_ref | `byte_array_ref(array: guint8) -> guint8` | g_byte_array_ref | 2.22 | Atomically increments the reference count of @array by one. This function is thread-safe and may be called from any thread. |
| byte_array_remove_index | `byte_array_remove_index(array: guint8, index_: guint) -> guint8` | g_byte_array_remove_index |  | Removes the byte at the given index from a #GByteArray. The following bytes are moved down one place. |
| byte_array_remove_index_fast | `byte_array_remove_index_fast(array: guint8, index_: guint) -> guint8` | g_byte_array_remove_index_fast |  | Removes the byte at the given index from a #GByteArray. The last element in the array is used to fill in the space, so this function does not prese... |
| byte_array_remove_range | `byte_array_remove_range(array: guint8, index_: guint, length: guint) -> guint8` | g_byte_array_remove_range | 2.4 | Removes the given number of bytes starting at the given index from a #GByteArray. The following elements are moved to close the gap. |
| byte_array_set_size | `byte_array_set_size(array: guint8, length: guint) -> guint8` | g_byte_array_set_size |  | Sets the size of the #GByteArray, expanding it if necessary. |
| byte_array_sized_new | `byte_array_sized_new(reserved_size: guint) -> guint8` | g_byte_array_sized_new |  | Creates a new #GByteArray with @reserved_size bytes preallocated. This avoids frequent reallocation, if you are going to add many bytes to the arra... |
| byte_array_sort | `byte_array_sort(array: guint8, compare_func: CompareFunc) -> none` | g_byte_array_sort |  | Sorts a byte array, using @compare_func which should be a qsort()-style comparison function (returns less than zero for first arg is less than seco... |
| byte_array_sort_with_data | `byte_array_sort_with_data(array: guint8, compare_func: CompareDataFunc, user_data: gpointer?) -> none` | g_byte_array_sort_with_data |  | Like g_byte_array_sort(), but the comparison function takes an extra user data argument. |
| byte_array_steal | `byte_array_steal(array: guint8, len: out gsize?) -> guint8` | g_byte_array_steal | 2.64 | Frees the data in the array and resets the size to zero, while the underlying array is preserved for use elsewhere and returned to the caller. |
| byte_array_unref | `byte_array_unref(array: guint8) -> none` | g_byte_array_unref | 2.22 | Atomically decrements the reference count of @array by one. If the reference count drops to 0, all memory allocated by the array is released. This ... |
| canonicalize_filename | `canonicalize_filename(filename: filename, relative_to: filename?) -> filename` | g_canonicalize_filename | 2.58 | Gets the canonical file name from @filename. All triple slashes are turned into single slashes, and all `..` and `.`s resolved against @relative_to... |
| chdir | `chdir(path: filename) -> gint` | g_chdir | 2.8 | A wrapper for the POSIX chdir() function. The function changes the current directory of the process to @path. See your C library manual for more de... |
| check_version | `check_version(required_major: guint, required_minor: guint, required_micro: guint) -> utf8` | glib_check_version | 2.6 | Checks that the GLib library in use is compatible with the given version. Generally you would pass in the constants %GLIB_MAJOR_VERSION, %GLIB_MINO... |
| checksum_type_get_length | `checksum_type_get_length(checksum_type: ChecksumType) -> gssize` | g_checksum_type_get_length | 2.16 | Gets the length in bytes of digests of type @checksum_type |
| child_watch_add | `child_watch_add(pid: Pid, function: ChildWatchFunc, data: gpointer?) -> guint` | g_child_watch_add | 2.4 | Sets a function to be called when the child indicated by @pid exits, at a default priority, %G_PRIORITY_DEFAULT. If you obtain @pid from g_spawn_as... |
| child_watch_add_full | `child_watch_add_full(priority: gint, pid: Pid, function: ChildWatchFunc, data: gpointer?, notify: DestroyNotify?) -> guint` | g_child_watch_add_full | 2.4 | Sets a function to be called when the child indicated by @pid exits, at the priority @priority. If you obtain @pid from g_spawn_async() or g_spawn_... |
| child_watch_source_new | `child_watch_source_new(pid: Pid) -> Source` | g_child_watch_source_new | 2.4 | Creates a new child_watch source. The source will not initially be associated with any #GMainContext and must be added to one with g_source_attach(... |
| chmod | `chmod(filename: filename, mode: gint) -> gint` | g_chmod | 2.8 | A wrapper for the POSIX chmod() function. The chmod() function is used to set the permissions of a file system object. On Windows the file protecti... |
| clear_error | `clear_error() -> none throws` | g_clear_error |  | If @err or *@err is %NULL, does nothing. Otherwise, calls g_error_free() on *@err and sets *@err to %NULL. |
| clear_handle_id | `clear_handle_id(tag_ptr: guint, clear_func: ClearHandleFunc) -> none` | g_clear_handle_id | 2.56 | Clears a numeric handler, such as a #GSource ID. @tag_ptr must be a valid pointer to the variable holding the handler. If the ID is zero then this ... |
| clear_list | `clear_list(list_ptr: GLib.List, destroy: DestroyNotify?) -> none` | g_clear_list | 2.64 | Clears a pointer to a #GList, freeing it and, optionally, freeing its elements using @destroy. @list_ptr must be a valid pointer. If @list_ptr poin... |
| clear_pointer | `clear_pointer(pp: inout gpointer, destroy: DestroyNotify) -> none` | g_clear_pointer | 2.34 | Clears a reference to a variable. @pp must not be %NULL. If the reference is %NULL then this function does nothing. Otherwise, the variable is dest... |
| clear_slist | `clear_slist(slist_ptr: GLib.SList, destroy: DestroyNotify?) -> none` | g_clear_slist | 2.64 | Clears a pointer to a #GSList, freeing it and, optionally, freeing its elements using @destroy. @slist_ptr must be a valid pointer. If @slist_ptr p... |
| close | `close(fd: gint) -> gboolean throws` | g_close | 2.36 | This wraps the close() call. In case of error, %errno will be preserved, but the error will also be stored as a #GError in @error. In case of succe... |
| closefrom | `closefrom(lowfd: gint) -> gint` | g_closefrom | 2.80 | Close every file descriptor equal to or greater than @lowfd. Typically @lowfd will be 3, to leave standard input, standard output and standard erro... |
| compute_checksum_for_bytes | `compute_checksum_for_bytes(checksum_type: ChecksumType, data: Bytes) -> utf8` | g_compute_checksum_for_bytes | 2.34 | Computes the checksum for a binary @data. This is a convenience wrapper for g_checksum_new(), g_checksum_get_string() and g_checksum_free(). The he... |
| compute_checksum_for_data | `compute_checksum_for_data(checksum_type: ChecksumType, data: guint8, length: gsize) -> utf8` | g_compute_checksum_for_data | 2.16 | Computes the checksum for a binary @data of @length. This is a convenience wrapper for g_checksum_new(), g_checksum_get_string() and g_checksum_fre... |
| compute_checksum_for_string | `compute_checksum_for_string(checksum_type: ChecksumType, str: utf8, length: gssize) -> utf8` | g_compute_checksum_for_string | 2.16 | Computes the checksum of a string. The hexadecimal string returned will be in lower case. |
| compute_hmac_for_bytes | `compute_hmac_for_bytes(digest_type: ChecksumType, key: Bytes, data: Bytes) -> utf8` | g_compute_hmac_for_bytes | 2.50 | Computes the HMAC for a binary @data. This is a convenience wrapper for g_hmac_new(), g_hmac_get_string() and g_hmac_unref(). The hexadecimal strin... |
| compute_hmac_for_data | `compute_hmac_for_data(digest_type: ChecksumType, key: guint8, key_len: gsize, data: guint8, length: gsize) -> utf8` | g_compute_hmac_for_data | 2.30 | Computes the HMAC for a binary @data of @length. This is a convenience wrapper for g_hmac_new(), g_hmac_get_string() and g_hmac_unref(). The hexade... |
| compute_hmac_for_string | `compute_hmac_for_string(digest_type: ChecksumType, key: guint8, key_len: gsize, str: utf8, length: gssize) -> utf8` | g_compute_hmac_for_string | 2.30 | Computes the HMAC for a string. The hexadecimal string returned will be in lower case. |
| cond_new | `cond_new() -> Cond` | g_cond_new |  | Allocates and initializes a new #GCond. |
| convert | `convert(str: guint8, len: gssize, to_codeset: utf8, from_codeset: utf8, bytes_read: out gsize?, bytes_written: out gsize?) -> guint8 throws` | g_convert |  | Converts a string from one character set to another. Note that you should use g_iconv() for streaming conversions. Despite the fact that @bytes_rea... |
| convert_error_quark | `convert_error_quark() -> Quark` | g_convert_error_quark |  |  |
| convert_with_fallback | `convert_with_fallback(str: guint8, len: gssize, to_codeset: utf8, from_codeset: utf8, fallback: utf8, bytes_read: out gsize?, bytes_written: out gsize?) -> guint8 throws` | g_convert_with_fallback |  | Converts a string from one character set to another, possibly including fallback sequences for characters not representable in the output. Note tha... |
| convert_with_iconv | `convert_with_iconv(str: guint8, len: gssize, converter: IConv, bytes_read: out gsize?, bytes_written: out gsize?) -> guint8 throws` | g_convert_with_iconv |  | Converts a string from one character set to another. Note that you should use g_iconv() for streaming conversions. Despite the fact that @bytes_rea... |
| creat | `creat(filename: filename, mode: gint) -> gint` | g_creat | 2.8 | A wrapper for the POSIX creat() function. The creat() function is used to convert a pathname into a file descriptor, creating a file if necessary. ... |
| datalist_clear | `datalist_clear(datalist: Data) -> none` | g_datalist_clear |  | Frees all the data elements of the datalist. The data elements' destroy functions are called if they have been set. |
| datalist_foreach | `datalist_foreach(datalist: Data, func: DataForeachFunc, user_data: gpointer?) -> none` | g_datalist_foreach |  | Calls the given function for each data element of the datalist. The function is called with each data element's #GQuark id and data, together with ... |
| datalist_get_data | `datalist_get_data(datalist: Data, key: utf8) -> gpointer` | g_datalist_get_data |  | Gets a data element, using its string identifier. This is slower than g_datalist_id_get_data() because it compares strings. |
| datalist_get_flags | `datalist_get_flags(datalist: Data) -> guint` | g_datalist_get_flags | 2.8 | Gets flags values packed in together with the datalist. See g_datalist_set_flags(). |
| datalist_id_dup_data | `datalist_id_dup_data(datalist: Data, key_id: Quark, dup_func: DuplicateFunc?, user_data: gpointer?) -> gpointer` | g_datalist_id_dup_data | 2.34 | This is a variant of g_datalist_id_get_data() which returns a 'duplicate' of the value. @dup_func defines the meaning of 'duplicate' in this contex... |
| datalist_id_get_data | `datalist_id_get_data(datalist: Data, key_id: Quark) -> gpointer` | g_datalist_id_get_data |  | Retrieves the data element corresponding to @key_id. |
| datalist_id_remove_multiple | `datalist_id_remove_multiple(datalist: Data, keys: Quark, n_keys: gsize) -> none` | g_datalist_id_remove_multiple | 2.74 | Removes multiple keys from a datalist. This is more efficient than calling g_datalist_id_remove_data() multiple times in a row. Before 2.80, @n_key... |
| datalist_id_remove_no_notify | `datalist_id_remove_no_notify(datalist: Data, key_id: Quark) -> gpointer` | g_datalist_id_remove_no_notify |  | Removes an element, without calling its destroy notification function. |
| datalist_id_replace_data | `datalist_id_replace_data(datalist: Data, key_id: Quark, oldval: gpointer?, newval: gpointer?, destroy: DestroyNotify?, old_destroy: out DestroyNotify?) -> gboolean` | g_datalist_id_replace_data | 2.34 | Compares the member that is associated with @key_id in @datalist to @oldval, and if they are the same, replace @oldval with @newval. This is like a... |
| datalist_id_set_data_full | `datalist_id_set_data_full(datalist: Data, key_id: Quark, data: gpointer?, destroy_func: DestroyNotify?) -> none` | g_datalist_id_set_data_full |  | Sets the data corresponding to the given #GQuark id, and the function to be called when the element is removed from the datalist. Any previous data... |
| datalist_init | `datalist_init(datalist: Data) -> none` | g_datalist_init |  | Resets the datalist to %NULL. It does not free any memory or call any destroy functions. |
| datalist_set_flags | `datalist_set_flags(datalist: Data, flags: guint) -> none` | g_datalist_set_flags | 2.8 | Turns on flag values for a data list. This function is used to keep a small number of boolean flags in an object with a data list without using any... |
| datalist_unset_flags | `datalist_unset_flags(datalist: Data, flags: guint) -> none` | g_datalist_unset_flags | 2.8 | Turns off flag values for a data list. See g_datalist_unset_flags() |
| dataset_destroy | `dataset_destroy(dataset_location: gpointer) -> none` | g_dataset_destroy |  | Destroys the dataset, freeing all memory allocated, and calling any destroy functions set for data elements. |
| dataset_foreach | `dataset_foreach(dataset_location: gpointer, func: DataForeachFunc, user_data: gpointer?) -> none` | g_dataset_foreach |  | Calls the given function for each data element which is associated with the given location. Note that this function is NOT thread-safe. So unless @... |
| dataset_id_get_data | `dataset_id_get_data(dataset_location: gpointer, key_id: Quark) -> gpointer` | g_dataset_id_get_data |  | Gets the data element corresponding to a #GQuark. |
| dataset_id_remove_no_notify | `dataset_id_remove_no_notify(dataset_location: gpointer, key_id: Quark) -> gpointer` | g_dataset_id_remove_no_notify |  | Removes an element, without calling its destroy notification function. |
| dataset_id_set_data_full | `dataset_id_set_data_full(dataset_location: gpointer, key_id: Quark, data: gpointer?, destroy_func: DestroyNotify) -> none` | g_dataset_id_set_data_full |  | Sets the data element associated with the given #GQuark id, and also the function to call when the data element is destroyed. Any previous data wit... |
| date_get_days_in_month | `date_get_days_in_month(month: DateMonth, year: DateYear) -> guint8` | g_date_get_days_in_month |  | Returns the number of days in a month, taking leap years into account. |
| date_get_monday_weeks_in_year | `date_get_monday_weeks_in_year(year: DateYear) -> guint8` | g_date_get_monday_weeks_in_year |  | Returns the number of weeks in the year, where weeks are taken to start on Monday. Will be 52 or 53. The date must be valid. (Years always have 52 ... |
| date_get_sunday_weeks_in_year | `date_get_sunday_weeks_in_year(year: DateYear) -> guint8` | g_date_get_sunday_weeks_in_year |  | Returns the number of weeks in the year, where weeks are taken to start on Sunday. Will be 52 or 53. The date must be valid. (Years always have 52 ... |
| date_is_leap_year | `date_is_leap_year(year: DateYear) -> gboolean` | g_date_is_leap_year |  | Returns %TRUE if the year is a leap year. For the purposes of this function, leap year is every year divisible by 4 unless that year is divisible b... |
| date_strftime | `date_strftime(s: utf8, slen: gsize, format: utf8, date: Date) -> gsize` | g_date_strftime |  | Generates a printed representation of the date, in a [locale][setlocale]-specific way. Works just like the platform's C library strftime() function... |
| date_valid_day | `date_valid_day(day: DateDay) -> gboolean` | g_date_valid_day |  | Returns %TRUE if the day of the month is valid (a day is valid if it's between 1 and 31 inclusive). |
| date_valid_dmy | `date_valid_dmy(day: DateDay, month: DateMonth, year: DateYear) -> gboolean` | g_date_valid_dmy |  | Returns %TRUE if the day-month-year triplet forms a valid, existing day in the range of days #GDate understands (Year 1 or later, no more than a fe... |
| date_valid_julian | `date_valid_julian(julian_date: guint32) -> gboolean` | g_date_valid_julian |  | Returns %TRUE if the Julian day is valid. Anything greater than zero is basically a valid Julian, though there is a 32-bit limit. |
| date_valid_month | `date_valid_month(month: DateMonth) -> gboolean` | g_date_valid_month |  | Returns %TRUE if the month value is valid. The 12 #GDateMonth enumeration values are the only valid months. |
| date_valid_weekday | `date_valid_weekday(weekday: DateWeekday) -> gboolean` | g_date_valid_weekday |  | Returns %TRUE if the weekday is valid. The seven #GDateWeekday enumeration values are the only valid weekdays. |
| date_valid_year | `date_valid_year(year: DateYear) -> gboolean` | g_date_valid_year |  | Returns %TRUE if the year is valid. Any year greater than 0 is valid, though there is a 16-bit limit to what #GDate will understand. |
| dcgettext | `dcgettext(domain: utf8?, msgid: utf8, category: gint) -> utf8` | g_dcgettext | 2.26 | This is a variant of g_dgettext() that allows specifying a locale category instead of always using `LC_MESSAGES`. See g_dgettext() for more informa... |
| dgettext | `dgettext(domain: utf8?, msgid: utf8) -> utf8` | g_dgettext | 2.18 | This function is a wrapper of dgettext() which does not translate the message if the default domain as set with textdomain() has no translations fo... |
| dir_make_tmp | `dir_make_tmp(tmpl: filename?) -> filename throws` | g_dir_make_tmp | 2.30 | Creates a subdirectory in the preferred directory for temporary files (as returned by g_get_tmp_dir()). @tmpl should be a string in the GLib file n... |
| direct_equal | `direct_equal(v1: gpointer?, v2: gpointer?) -> gboolean` | g_direct_equal |  | Compares two #gpointer arguments and returns %TRUE if they are equal. It can be passed to g_hash_table_new() as the @key_equal_func parameter, when... |
| direct_hash | `direct_hash(v: gpointer?) -> guint` | g_direct_hash |  | Converts a gpointer to a hash value. It can be passed to g_hash_table_new() as the @hash_func parameter, when using opaque pointers compared by poi... |
| dngettext | `dngettext(domain: utf8?, msgid: utf8, msgid_plural: utf8, n: gulong) -> utf8` | g_dngettext | 2.18 | This function is a wrapper of dngettext() which does not translate the message if the default domain as set with textdomain() has no translations f... |
| double_equal | `double_equal(v1: gpointer, v2: gpointer) -> gboolean` | g_double_equal | 2.22 | Compares the two #gdouble values being pointed to and returns %TRUE if they are equal. It can be passed to g_hash_table_new() as the @key_equal_fun... |
| double_hash | `double_hash(v: gpointer) -> guint` | g_double_hash | 2.22 | Converts a pointer to a #gdouble to a hash value. It can be passed to g_hash_table_new() as the @hash_func parameter, It can be passed to g_hash_ta... |
| dpgettext | `dpgettext(domain: utf8?, msgctxtid: utf8, msgidoffset: gsize) -> utf8` | g_dpgettext | 2.16 | This function is a variant of g_dgettext() which supports a disambiguating message context. GNU gettext uses the '\004' character to separate the m... |
| dpgettext2 | `dpgettext2(domain: utf8?, context: utf8, msgid: utf8) -> utf8` | g_dpgettext2 | 2.18 | This function is a variant of g_dgettext() which supports a disambiguating message context. GNU gettext uses the '\004' character to separate the m... |
| environ_getenv | `environ_getenv(envp: filename?, variable: filename) -> filename` | g_environ_getenv | 2.32 | Returns the value of the environment variable @variable in the provided list @envp. |
| environ_setenv | `environ_setenv(envp: filename?, variable: filename, value: filename, overwrite: gboolean) -> filename` | g_environ_setenv | 2.32 | Sets the environment variable @variable in the provided list @envp to @value. |
| environ_unsetenv | `environ_unsetenv(envp: filename?, variable: filename) -> filename` | g_environ_unsetenv | 2.32 | Removes the environment variable @variable from the provided environment @envp. |
| error_domain_register | `error_domain_register(error_type_name: utf8, error_type_private_size: gsize, error_type_init: ErrorInitFunc, error_type_copy: ErrorCopyFunc, error_type_clear: ErrorClearFunc) -> Quark` | g_error_domain_register | 2.68 | This function registers an extended #GError domain. @error_type_name will be duplicated. Otherwise does the same as g_error_domain_register_static(). |
| error_domain_register_static | `error_domain_register_static(error_type_name: utf8, error_type_private_size: gsize, error_type_init: ErrorInitFunc, error_type_copy: ErrorCopyFunc, error_type_clear: ErrorClearFunc) -> Quark` | g_error_domain_register_static | 2.68 | This function registers an extended #GError domain. @error_type_name should not be freed. @error_type_private_size must be greater than 0. @error_t... |
| fdwalk_set_cloexec | `fdwalk_set_cloexec(lowfd: gint) -> gint` | g_fdwalk_set_cloexec | 2.80 | Mark every file descriptor equal to or greater than @lowfd to be closed at the next `execve()` or similar, as if via the `FD_CLOEXEC` flag. Typical... |
| file_error_from_errno | `file_error_from_errno(err_no: gint) -> FileError` | g_file_error_from_errno |  | Gets a #GFileError constant based on the passed-in @err_no. For example, if you pass in `EEXIST` this function returns %G_FILE_ERROR_EXIST. Unlike ... |
| file_error_quark | `file_error_quark() -> Quark` | g_file_error_quark |  |  |
| file_get_contents | `file_get_contents(filename: filename, contents: out guint8, length: out gsize?) -> gboolean throws` | g_file_get_contents |  | Reads an entire file into allocated memory, with good error checking. If the call was successful, it returns %TRUE and sets @contents to the file c... |
| file_open_tmp | `file_open_tmp(tmpl: filename?, name_used: out filename) -> gint throws` | g_file_open_tmp |  | Opens a file for writing in the preferred directory for temporary files (as returned by g_get_tmp_dir()). @tmpl should be a string in the GLib file... |
| file_read_link | `file_read_link(filename: filename) -> filename throws` | g_file_read_link | 2.4 | Reads the contents of the symbolic link @filename like the POSIX `readlink()` function. The returned string is in the encoding used for filenames. ... |
| file_set_contents | `file_set_contents(filename: filename, contents: guint8, length: gssize) -> gboolean throws` | g_file_set_contents | 2.8 | Writes all of @contents to a file named @filename. This is a convenience wrapper around calling g_file_set_contents_full() with `flags` set to `G_F... |
| file_set_contents_full | `file_set_contents_full(filename: filename, contents: guint8, length: gssize, flags: FileSetContentsFlags, mode: gint) -> gboolean throws` | g_file_set_contents_full | 2.66 | Writes all of @contents to a file named @filename, with good error checking. If a file called @filename already exists it will be overwritten. @fla... |
| file_test | `file_test(filename: filename, test: FileTest) -> gboolean` | g_file_test |  | Returns %TRUE if any of the tests in the bitfield @test are %TRUE. For example, `(G_FILE_TEST_EXISTS \| G_FILE_TEST_IS_DIR)` will return %TRUE if th... |
| filename_display_basename | `filename_display_basename(filename: filename) -> utf8` | g_filename_display_basename | 2.6 | Returns the display basename for the particular filename, guaranteed to be valid UTF-8. The display name might not be identical to the filename, fo... |
| filename_display_name | `filename_display_name(filename: filename) -> utf8` | g_filename_display_name | 2.6 | Converts a filename into a valid UTF-8 string. The conversion is not necessarily reversible, so you should keep the original around and use the ret... |
| filename_from_uri | `filename_from_uri(uri: utf8, hostname: out utf8?) -> filename throws` | g_filename_from_uri |  | Converts an escaped ASCII-encoded URI to a local filename in the encoding used for filenames. Since GLib 2.78, the query string and fragment can be... |
| filename_from_utf8 | `filename_from_utf8(utf8string: utf8, len: gssize, bytes_read: out gsize?, bytes_written: out gsize?) -> filename throws` | g_filename_from_utf8 |  | Converts a string from UTF-8 to the encoding GLib uses for filenames. Note that on Windows GLib uses UTF-8 for filenames; on other platforms, this ... |
| filename_to_uri | `filename_to_uri(filename: filename, hostname: utf8?) -> utf8 throws` | g_filename_to_uri |  | Converts an absolute filename to an escaped ASCII-encoded URI, with the path component following Section 3.3. of RFC 2396. |
| filename_to_utf8 | `filename_to_utf8(opsysstring: filename, len: gssize, bytes_read: out gsize?, bytes_written: out gsize?) -> utf8 throws` | g_filename_to_utf8 |  | Converts a string which is in the encoding used by GLib for filenames into a UTF-8 string. Note that on Windows GLib uses UTF-8 for filenames; on o... |
| find_program_in_path | `find_program_in_path(program: filename) -> filename` | g_find_program_in_path |  | Locates the first executable named @program in the user's path, in the same way that execvp() would locate it. Returns an allocated string with the... |
| fopen | `fopen(filename: filename, mode: utf8) -> gpointer` | g_fopen | 2.6 | A wrapper for the stdio `fopen()` function. The `fopen()` function opens a file and associates a new stream with it. Because file descriptors are s... |
| format_size | `format_size(size: guint64) -> utf8` | g_format_size | 2.30 | Formats a size (for example the size of a file) into a human readable string. Sizes are rounded to the nearest size prefix (kB, MB, GB) and are dis... |
| format_size_for_display | `format_size_for_display(size: gint64) -> utf8` | g_format_size_for_display | 2.16 | Formats a size (for example the size of a file) into a human readable string. Sizes are rounded to the nearest size prefix (KB, MB, GB) and are dis... |
| format_size_full | `format_size_full(size: guint64, flags: FormatSizeFlags) -> utf8` | g_format_size_full | 2.30 | Formats a size. This function is similar to g_format_size() but allows for flags that modify the output. See #GFormatSizeFlags. |
| fprintf | `fprintf(file: gpointer, format: utf8, ...: void) -> gint` | g_fprintf | 2.2 | An implementation of the standard `fprintf()` function which supports positional parameters, as specified in the Single Unix Specification. `glib/g... |
| free | `free(mem: gpointer?) -> none` | g_free |  | Frees the memory pointed to by @mem. If you know the allocated size of @mem, calling g_free_sized() may be faster, depending on the libc implementa... |
| free_sized | `free_sized(mem: gpointer?, size: gsize) -> none` | g_free_sized | 2.76 | Frees the memory pointed to by @mem, assuming it is has the given @size. If @mem is %NULL this is a no-op (and @size is ignored). It is an error if... |
| freopen | `freopen(filename: filename, mode: utf8, stream: gpointer?) -> gpointer` | g_freopen | 2.6 | A wrapper for the POSIX freopen() function. The freopen() function opens a file and associates it with an existing stream. See your C library manua... |
| fsync | `fsync(fd: gint) -> gint` | g_fsync | 2.64 | A wrapper for the POSIX `fsync()` function. On Windows, `_commit()` will be used. On macOS, `fcntl(F_FULLFSYNC)` will be used. The `fsync()` functi... |
| get_application_name | `get_application_name() -> utf8` | g_get_application_name | 2.2 | Gets a human-readable name for the application, as set by g_set_application_name(). This name should be localized if possible, and is intended for ... |
| get_charset | `get_charset(charset: out utf8?) -> gboolean` | g_get_charset |  | Obtains the character set for the [current locale][setlocale]; you might use this character set as an argument to g_convert(), to convert from the ... |
| get_codeset | `get_codeset() -> utf8` | g_get_codeset |  | Gets the character set for the current locale. |
| get_console_charset | `get_console_charset(charset: out utf8?) -> gboolean` | g_get_console_charset | 2.62 | Obtains the character set used by the console attached to the process, which is suitable for printing output to the terminal. Usually this matches ... |
| get_current_dir | `get_current_dir() -> filename` | g_get_current_dir |  | Gets the current directory. The returned string should be freed when no longer needed. The encoding of the returned string is system defined. On Wi... |
| get_current_time | `get_current_time(result: TimeVal) -> none` | g_get_current_time |  | Equivalent to the UNIX gettimeofday() function, but portable. You may find g_get_real_time() to be more convenient. |
| get_environ | `get_environ() -> filename` | g_get_environ | 2.28 | Gets the list of environment variables for the current process. The list is %NULL terminated and each item in the list is of the form 'NAME=VALUE'.... |
| get_filename_charsets | `get_filename_charsets(filename_charsets: out utf8) -> gboolean` | g_get_filename_charsets | 2.6 | Determines the preferred character sets used for filenames. The first character set from the @charsets is the filename encoding, the subsequent cha... |
| get_home_dir | `get_home_dir() -> filename` | g_get_home_dir |  | Gets the current user's home directory. As with most UNIX tools, this function will return the value of the `HOME` environment variable if it is se... |
| get_host_name | `get_host_name() -> utf8` | g_get_host_name | 2.8 | Return a name for the machine. The returned name is not necessarily a fully-qualified domain name, or even present in DNS or some other name servic... |
| get_language_names | `get_language_names() -> utf8` | g_get_language_names | 2.6 | Computes a list of applicable locale names, which can be used to e.g. construct locale-dependent filenames or search paths. The returned list is so... |
| get_language_names_with_category | `get_language_names_with_category(category_name: utf8) -> utf8` | g_get_language_names_with_category | 2.58 | Computes a list of applicable locale names with a locale category name, which can be used to construct the fallback locale-dependent filenames or s... |
| get_locale_variants | `get_locale_variants(locale: utf8) -> utf8` | g_get_locale_variants | 2.28 | Returns a list of derived variants of @locale, which can be used to e.g. construct locale-dependent filenames or search paths. The returned list is... |
| get_monotonic_time | `get_monotonic_time() -> gint64` | g_get_monotonic_time | 2.28 | Queries the system monotonic time. The monotonic clock will always increase and doesn't suffer discontinuities when the user (or NTP) changes the s... |
| get_num_processors | `get_num_processors() -> guint` | g_get_num_processors | 2.36 | Determine the approximate number of threads that the system will schedule simultaneously for this process. This is intended to be used as a paramet... |
| get_os_info | `get_os_info(key_name: utf8) -> utf8` | g_get_os_info | 2.64 | Get information about the operating system. On Linux this comes from the `/etc/os-release` file. On other systems, it may come from a variety of so... |
| get_prgname | `get_prgname() -> utf8` | g_get_prgname |  | Gets the name of the program. This name should not be localized, in contrast to g_get_application_name(). If you are using #GApplication the progra... |
| get_real_name | `get_real_name() -> filename` | g_get_real_name |  | Gets the real name of the user. This usually comes from the user's entry in the `passwd` file. The encoding of the returned string is system-define... |
| get_real_time | `get_real_time() -> gint64` | g_get_real_time | 2.28 | Queries the system wall-clock time. This call is functionally equivalent to g_get_current_time() except that the return value is often more conveni... |
| get_system_config_dirs | `get_system_config_dirs() -> filename` | g_get_system_config_dirs | 2.6 | Returns an ordered list of base directories in which to access system-wide configuration information. On UNIX platforms this is determined using th... |
| get_system_data_dirs | `get_system_data_dirs() -> filename` | g_get_system_data_dirs | 2.6 | Returns an ordered list of base directories in which to access system-wide application data. On UNIX platforms this is determined using the mechani... |
| get_tmp_dir | `get_tmp_dir() -> filename` | g_get_tmp_dir |  | Gets the directory to use for temporary files. On UNIX, this is taken from the `TMPDIR` environment variable. If the variable is not set, `P_tmpdir... |
| get_user_cache_dir | `get_user_cache_dir() -> filename` | g_get_user_cache_dir | 2.6 | Returns a base directory in which to store non-essential, cached data specific to particular user. On UNIX platforms this is determined using the m... |
| get_user_config_dir | `get_user_config_dir() -> filename` | g_get_user_config_dir | 2.6 | Returns a base directory in which to store user-specific application configuration information such as user preferences and settings. On UNIX platf... |
| get_user_data_dir | `get_user_data_dir() -> filename` | g_get_user_data_dir | 2.6 | Returns a base directory in which to access application data such as icons that is customized for a particular user. On UNIX platforms this is dete... |
| get_user_name | `get_user_name() -> filename` | g_get_user_name |  | Gets the user name of the current user. The encoding of the returned string is system-defined. On UNIX, it might be the preferred file name encodin... |
| get_user_runtime_dir | `get_user_runtime_dir() -> filename` | g_get_user_runtime_dir | 2.28 | Returns a directory that is unique to the current user on the local system. This is determined using the mechanisms described in the XDG Base Direc... |
| get_user_special_dir | `get_user_special_dir(directory: UserDirectory) -> filename` | g_get_user_special_dir | 2.14 | Returns the full path of a special directory using its logical id. On UNIX this is done using the XDG special user directories. For compatibility w... |
| get_user_state_dir | `get_user_state_dir() -> filename` | g_get_user_state_dir | 2.72 | Returns a base directory in which to store state files specific to particular user. On UNIX platforms this is determined using the mechanisms descr... |
| getenv | `getenv(variable: filename) -> filename` | g_getenv |  | Returns the value of an environment variable. On UNIX, the name and value are byte strings which might or might not be in some consistent character... |
| hash_table_add | `hash_table_add(hash_table: GLib.HashTable, key: gpointer?) -> gboolean` | g_hash_table_add | 2.32 | This is a convenience function for using a #GHashTable as a set. It is equivalent to calling g_hash_table_replace() with @key as both the key and t... |
| hash_table_contains | `hash_table_contains(hash_table: GLib.HashTable, key: gpointer?) -> gboolean` | g_hash_table_contains | 2.32 | Checks if @key is in @hash_table. |
| hash_table_destroy | `hash_table_destroy(hash_table: GLib.HashTable) -> none` | g_hash_table_destroy |  | Destroys all keys and values in the #GHashTable and decrements its reference count by 1. If keys and/or values are dynamically allocated, you shoul... |
| hash_table_find | `hash_table_find(hash_table: GLib.HashTable, predicate: HRFunc, user_data: gpointer?) -> gpointer` | g_hash_table_find | 2.4 | Calls the given function for key/value pairs in the #GHashTable until @predicate returns %TRUE. The function is passed the key and value of each pa... |
| hash_table_foreach | `hash_table_foreach(hash_table: GLib.HashTable, func: HFunc, user_data: gpointer?) -> none` | g_hash_table_foreach |  | Calls the given function for each of the key/value pairs in the #GHashTable. The function is passed the key and value of each pair, and the given @... |
| hash_table_foreach_remove | `hash_table_foreach_remove(hash_table: GLib.HashTable, func: HRFunc, user_data: gpointer?) -> guint` | g_hash_table_foreach_remove |  | Calls the given function for each key/value pair in the #GHashTable. If the function returns %TRUE, then the key/value pair is removed from the #GH... |
| hash_table_foreach_steal | `hash_table_foreach_steal(hash_table: GLib.HashTable, func: HRFunc, user_data: gpointer?) -> guint` | g_hash_table_foreach_steal |  | Calls the given function for each key/value pair in the #GHashTable. If the function returns %TRUE, then the key/value pair is removed from the #GH... |
| hash_table_get_keys_as_ptr_array | `hash_table_get_keys_as_ptr_array(hash_table: GLib.HashTable) -> gpointer` | g_hash_table_get_keys_as_ptr_array | 2.76 | Retrieves every key inside @hash_table, as a #GPtrArray. The returned data is valid until changes to the hash release those keys. This iterates ove... |
| hash_table_get_values_as_ptr_array | `hash_table_get_values_as_ptr_array(hash_table: GLib.HashTable) -> gpointer` | g_hash_table_get_values_as_ptr_array | 2.76 | Retrieves every value inside @hash_table, as a #GPtrArray. The returned data is valid until changes to the hash release those values. This iterates... |
| hash_table_insert | `hash_table_insert(hash_table: GLib.HashTable, key: gpointer?, value: gpointer?) -> gboolean` | g_hash_table_insert |  | Inserts a new key and value into a #GHashTable. If the key already exists in the #GHashTable its current value is replaced with the new value. If y... |
| hash_table_lookup | `hash_table_lookup(hash_table: GLib.HashTable, key: gpointer?) -> gpointer` | g_hash_table_lookup |  | Looks up a key in a #GHashTable. Note that this function cannot distinguish between a key that is not present and one which is present and has the ... |
| hash_table_lookup_extended | `hash_table_lookup_extended(hash_table: GLib.HashTable, lookup_key: gpointer?, orig_key: out gpointer?, value: out gpointer?) -> gboolean` | g_hash_table_lookup_extended |  | Looks up a key in the #GHashTable, returning the original key and the associated value and a #gboolean which is %TRUE if the key was found. This is... |
| hash_table_new_similar | `hash_table_new_similar(other_hash_table: GLib.HashTable) -> GLib.HashTable` | g_hash_table_new_similar | 2.72 | Creates a new #GHashTable like g_hash_table_new_full() with a reference count of 1. It inherits the hash function, the key equal function, the key ... |
| hash_table_ref | `hash_table_ref(hash_table: GLib.HashTable) -> GLib.HashTable` | g_hash_table_ref | 2.10 | Atomically increments the reference count of @hash_table by one. This function is MT-safe and may be called from any thread. |
| hash_table_remove | `hash_table_remove(hash_table: GLib.HashTable, key: gpointer?) -> gboolean` | g_hash_table_remove |  | Removes a key and its associated value from a #GHashTable. If the #GHashTable was created using g_hash_table_new_full(), the key and value are free... |
| hash_table_remove_all | `hash_table_remove_all(hash_table: GLib.HashTable) -> none` | g_hash_table_remove_all | 2.12 | Removes all keys and their associated values from a #GHashTable. If the #GHashTable was created using g_hash_table_new_full(), the keys and values ... |
| hash_table_replace | `hash_table_replace(hash_table: GLib.HashTable, key: gpointer?, value: gpointer?) -> gboolean` | g_hash_table_replace |  | Inserts a new key and value into a #GHashTable similar to g_hash_table_insert(). The difference is that if the key already exists in the #GHashTabl... |
| hash_table_size | `hash_table_size(hash_table: GLib.HashTable) -> guint` | g_hash_table_size |  | Returns the number of elements contained in the #GHashTable. |
| hash_table_steal | `hash_table_steal(hash_table: GLib.HashTable, key: gpointer?) -> gboolean` | g_hash_table_steal |  | Removes a key and its associated value from a #GHashTable without calling the key and value destroy functions. |
| hash_table_steal_all | `hash_table_steal_all(hash_table: GLib.HashTable) -> none` | g_hash_table_steal_all | 2.12 | Removes all keys and their associated values from a #GHashTable without calling the key and value destroy functions. |
| hash_table_steal_all_keys | `hash_table_steal_all_keys(hash_table: GLib.HashTable) -> gpointer` | g_hash_table_steal_all_keys | 2.76 | Removes all keys and their associated values from a #GHashTable without calling the key destroy functions, returning the keys as a #GPtrArray with ... |
| hash_table_steal_all_values | `hash_table_steal_all_values(hash_table: GLib.HashTable) -> gpointer` | g_hash_table_steal_all_values | 2.76 | Removes all keys and their associated values from a #GHashTable without calling the value destroy functions, returning the values as a #GPtrArray w... |
| hash_table_steal_extended | `hash_table_steal_extended(hash_table: GLib.HashTable, lookup_key: gpointer?, stolen_key: out gpointer?, stolen_value: out gpointer?) -> gboolean` | g_hash_table_steal_extended | 2.58 | Looks up a key in the #GHashTable, stealing the original key and the associated value and returning %TRUE if the key was found. If the key was not ... |
| hash_table_unref | `hash_table_unref(hash_table: GLib.HashTable) -> none` | g_hash_table_unref | 2.10 | Atomically decrements the reference count of @hash_table by one. If the reference count drops to 0, all keys and values will be destroyed, and all ... |
| hook_destroy | `hook_destroy(hook_list: HookList, hook_id: gulong) -> gboolean` | g_hook_destroy |  | Destroys a #GHook, given its ID. |
| hook_destroy_link | `hook_destroy_link(hook_list: HookList, hook: Hook) -> none` | g_hook_destroy_link |  | Removes one #GHook from a #GHookList, marking it inactive and calling g_hook_unref() on it. |
| hook_free | `hook_free(hook_list: HookList, hook: Hook) -> none` | g_hook_free |  | Calls the #GHookList @finalize_hook function if it exists, and frees the memory allocated for the #GHook. |
| hook_insert_before | `hook_insert_before(hook_list: HookList, sibling: Hook?, hook: Hook) -> none` | g_hook_insert_before |  | Inserts a #GHook into a #GHookList, before a given #GHook. |
| hook_insert_sorted | `hook_insert_sorted(hook_list: HookList, hook: Hook, func: HookCompareFunc) -> none` | g_hook_insert_sorted |  | Inserts a #GHook into a #GHookList, sorted by the given function. |
| hook_prepend | `hook_prepend(hook_list: HookList, hook: Hook) -> none` | g_hook_prepend |  | Prepends a #GHook on the start of a #GHookList. |
| hook_unref | `hook_unref(hook_list: HookList, hook: Hook) -> none` | g_hook_unref |  | Decrements the reference count of a #GHook. If the reference count falls to 0, the #GHook is removed from the #GHookList and g_hook_free() is calle... |
| hostname_is_ascii_encoded | `hostname_is_ascii_encoded(hostname: utf8) -> gboolean` | g_hostname_is_ascii_encoded | 2.22 | Tests if @hostname contains segments with an ASCII-compatible encoding of an Internationalized Domain Name. If this returns %TRUE, you should decod... |
| hostname_is_ip_address | `hostname_is_ip_address(hostname: utf8) -> gboolean` | g_hostname_is_ip_address | 2.22 | Tests if @hostname is the string form of an IPv4 or IPv6 address. (Eg, "192.168.0.1".) Since 2.66, IPv6 addresses with a zone-id are accepted (RFC6... |
| hostname_is_non_ascii | `hostname_is_non_ascii(hostname: utf8) -> gboolean` | g_hostname_is_non_ascii | 2.22 | Tests if @hostname contains Unicode characters. If this returns %TRUE, you need to encode the hostname with g_hostname_to_ascii() before using it i... |
| hostname_to_ascii | `hostname_to_ascii(hostname: utf8) -> utf8` | g_hostname_to_ascii | 2.22 | Converts @hostname to its canonical ASCII form; an ASCII-only string containing no uppercase letters and not ending with a trailing dot. |
| hostname_to_unicode | `hostname_to_unicode(hostname: utf8) -> utf8` | g_hostname_to_unicode | 2.22 | Converts @hostname to its canonical presentation form; a UTF-8 string in Unicode normalization form C, containing no uppercase letters, no forbidde... |
| iconv | `iconv(converter: IConv, inbuf: utf8, inbytes_left: inout gsize, outbuf: utf8, outbytes_left: inout gsize) -> gsize` | g_iconv |  | Same as the standard UNIX routine iconv(), but may be implemented via libiconv on UNIX flavors that lack a native implementation. GLib provides g_c... |
| iconv_open | `iconv_open(to_codeset: utf8, from_codeset: utf8) -> IConv` | g_iconv_open |  | Same as the standard UNIX routine iconv_open(), but may be implemented via libiconv on UNIX flavors that lack a native implementation. GLib provide... |
| idle_add | `idle_add(function: SourceFunc, data: gpointer?) -> guint` | g_idle_add |  | Adds a function to be called whenever there are no higher priority events pending to the default main loop. The function is given the default idle ... |
| idle_add_full | `idle_add_full(priority: gint, function: SourceFunc, data: gpointer?, notify: DestroyNotify?) -> guint` | g_idle_add_full |  | Adds a function to be called whenever there are no higher priority events pending. If the function returns %G_SOURCE_REMOVE or %FALSE it is automat... |
| idle_add_once | `idle_add_once(function: SourceOnceFunc, data: gpointer?) -> guint` | g_idle_add_once | 2.74 | Adds a function to be called whenever there are no higher priority events pending to the default main loop. The function is given the default idle ... |
| idle_remove_by_data | `idle_remove_by_data(data: gpointer?) -> gboolean` | g_idle_remove_by_data |  | Removes the idle function with the given data. |
| idle_source_new | `idle_source_new() -> Source` | g_idle_source_new |  | Creates a new idle source. The source will not initially be associated with any #GMainContext and must be added to one with g_source_attach() befor... |
| int64_equal | `int64_equal(v1: gpointer, v2: gpointer) -> gboolean` | g_int64_equal | 2.22 | Compares the two #gint64 values being pointed to and returns %TRUE if they are equal. It can be passed to g_hash_table_new() as the @key_equal_func... |
| int64_hash | `int64_hash(v: gpointer) -> guint` | g_int64_hash | 2.22 | Converts a pointer to a #gint64 to a hash value. It can be passed to g_hash_table_new() as the @hash_func parameter, when using non-%NULL pointers ... |
| int_equal | `int_equal(v1: gpointer, v2: gpointer) -> gboolean` | g_int_equal |  | Compares the two #gint values being pointed to and returns %TRUE if they are equal. It can be passed to g_hash_table_new() as the @key_equal_func p... |
| int_hash | `int_hash(v: gpointer) -> guint` | g_int_hash |  | Converts a pointer to a #gint to a hash value. It can be passed to g_hash_table_new() as the @hash_func parameter, when using non-%NULL pointers to... |
| intern_static_string | `intern_static_string(string: utf8?) -> utf8` | g_intern_static_string | 2.10 | Returns a canonical representation for @string. Interned strings can be compared for equality by comparing the pointers, instead of using strcmp().... |
| intern_string | `intern_string(string: utf8?) -> utf8` | g_intern_string | 2.10 | Returns a canonical representation for @string. Interned strings can be compared for equality by comparing the pointers, instead of using strcmp().... |
| io_add_watch | `io_add_watch(channel: IOChannel, condition: IOCondition, func: IOFunc, user_data: gpointer?) -> guint` | g_io_add_watch |  | Adds the #GIOChannel into the default main loop context with the default priority. |
| io_add_watch_full | `io_add_watch_full(channel: IOChannel, priority: gint, condition: IOCondition, func: IOFunc, user_data: gpointer?, notify: DestroyNotify) -> guint` | g_io_add_watch_full |  | Adds the #GIOChannel into the default main loop context with the given priority. This internally creates a main loop source using g_io_create_watch... |
| io_channel_error_from_errno | `io_channel_error_from_errno(en: gint) -> IOChannelError` | g_io_channel_error_from_errno |  | Converts an `errno` error number to a #GIOChannelError. |
| io_channel_error_quark | `io_channel_error_quark() -> Quark` | g_io_channel_error_quark |  |  |
| io_create_watch | `io_create_watch(channel: IOChannel, condition: IOCondition) -> Source` | g_io_create_watch |  | Creates a #GSource that's dispatched when @condition is met for the given @channel. For example, if condition is %G_IO_IN, the source will be dispa... |
| key_file_error_quark | `key_file_error_quark() -> Quark` | g_key_file_error_quark |  |  |
| list_pop_allocator | `list_pop_allocator() -> none` | g_list_pop_allocator |  |  |
| list_push_allocator | `list_push_allocator(allocator: Allocator) -> none` | g_list_push_allocator |  |  |
| listenv | `listenv() -> filename` | g_listenv | 2.8 | Gets the names of all variables set in the environment. Programs that want to be portable to Windows should typically use this function and g_geten... |
| locale_from_utf8 | `locale_from_utf8(utf8string: utf8, len: gssize, bytes_read: out gsize?, bytes_written: out gsize?) -> guint8 throws` | g_locale_from_utf8 |  | Converts a string from UTF-8 to the encoding used for strings by the C runtime (usually the same as that used by the operating system) in the [curr... |
| locale_to_utf8 | `locale_to_utf8(opsysstring: guint8, len: gssize, bytes_read: out gsize?, bytes_written: out gsize?) -> utf8 throws` | g_locale_to_utf8 |  | Converts a string which is in the encoding used for strings by the C runtime (usually the same as that used by the operating system) in the [curren... |
| log | `log(log_domain: utf8?, log_level: LogLevelFlags, format: utf8, ...: void) -> none` | g_log |  | Logs an error or debugging message. If the log level has been set as fatal, [func@GLib.BREAKPOINT] is called to terminate the program. See the docu... |
| log_default_handler | `log_default_handler(log_domain: utf8?, log_level: LogLevelFlags, message: utf8?, unused_data: gpointer?) -> none` | g_log_default_handler |  | The default log handler set up by GLib; [func@GLib.log_set_default_handler] allows to install an alternate default log handler. This is used if no ... |
| log_get_debug_enabled | `log_get_debug_enabled() -> gboolean` | g_log_get_debug_enabled | 2.72 | Return whether debug output from the GLib logging system is enabled. Note that this should not be used to conditionalise calls to [func@GLib.debug]... |
| log_remove_handler | `log_remove_handler(log_domain: utf8, handler_id: guint) -> none` | g_log_remove_handler |  | Removes the log handler. This has no effect if structured logging is enabled; see Using Structured Logging. |
| log_set_always_fatal | `log_set_always_fatal(fatal_mask: LogLevelFlags) -> LogLevelFlags` | g_log_set_always_fatal |  | Sets the message levels which are always fatal, in any log domain. When a message with any of these levels is logged the program terminates. You ca... |
| log_set_debug_enabled | `log_set_debug_enabled(enabled: gboolean) -> none` | g_log_set_debug_enabled | 2.72 | Enable or disable debug output from the GLib logging system for all domains. This value interacts disjunctively with `G_MESSAGES_DEBUG` and [func@G... |
| log_set_default_handler | `log_set_default_handler(log_func: LogFunc, user_data: gpointer?) -> LogFunc` | g_log_set_default_handler | 2.6 | Installs a default log handler which is used if no log handler has been set for the particular log domain and log level combination. By default, GL... |
| log_set_fatal_mask | `log_set_fatal_mask(log_domain: utf8, fatal_mask: LogLevelFlags) -> LogLevelFlags` | g_log_set_fatal_mask |  | Sets the log levels which are fatal in the given domain. [flags@GLib.LogLevelFlags.LEVEL_ERROR] is always fatal. This has no effect on structured l... |
| log_set_handler | `log_set_handler(log_domain: utf8?, log_levels: LogLevelFlags, log_func: LogFunc, user_data: gpointer?) -> guint` | g_log_set_handler |  | Sets the log handler for a domain and a set of log levels. To handle fatal and recursive messages the @log_levels parameter must be combined with t... |
| log_set_handler_full | `log_set_handler_full(log_domain: utf8?, log_levels: LogLevelFlags, log_func: LogFunc, user_data: gpointer?, destroy: DestroyNotify) -> guint` | g_log_set_handler_full | 2.46 | Like [func@GLib.log_set_handler], but takes a destroy notify for the @user_data. This has no effect if structured logging is enabled; see Using Str... |
| log_set_writer_func | `log_set_writer_func(func: LogWriterFunc?, user_data: gpointer?, user_data_free: DestroyNotify) -> none` | g_log_set_writer_func | 2.50 | Set a writer function which will be called to format and write out each log message. Each program should set a writer function, or the default writ... |
| log_structured | `log_structured(log_domain: utf8, log_level: LogLevelFlags, ...: void) -> none` | g_log_structured | 2.50 | Log a message with structured data. The message will be passed through to the log writer set by the application using [func@GLib.log_set_writer_fun... |
| log_structured_array | `log_structured_array(log_level: LogLevelFlags, fields: LogField, n_fields: gsize) -> none` | g_log_structured_array | 2.50 | Log a message with structured data. The message will be passed through to the log writer set by the application using [func@GLib.log_set_writer_fun... |
| log_structured_standard | `log_structured_standard(log_domain: utf8, log_level: LogLevelFlags, file: utf8, line: utf8, func: utf8, message_format: utf8, ...: void) -> none` | g_log_structured_standard |  |  |
| log_variant | `log_variant(log_domain: utf8?, log_level: LogLevelFlags, fields: Variant) -> none` | g_log_variant | 2.50 | Log a message with structured data, accepting the data within a [type@GLib.Variant]. This version is especially useful for use in other languages, ... |
| log_writer_default | `log_writer_default(log_level: LogLevelFlags, fields: LogField, n_fields: gsize, user_data: gpointer?) -> LogWriterOutput` | g_log_writer_default | 2.50 | Format a structured log message and output it to the default log destination for the platform. On Linux, this is typically the systemd journal, fal... |
| log_writer_default_set_debug_domains | `log_writer_default_set_debug_domains(domains: utf8?) -> none` | g_log_writer_default_set_debug_domains | 2.80 | Reset the list of domains to be logged, that might be initially set by the `G_MESSAGES_DEBUG` environment variable. This function is thread-safe. |
| log_writer_default_set_use_stderr | `log_writer_default_set_use_stderr(use_stderr: gboolean) -> none` | g_log_writer_default_set_use_stderr | 2.68 | Configure whether the built-in log functions will output all log messages to `stderr`. The built-in log functions are [func@GLib.log_default_handle... |
| log_writer_default_would_drop | `log_writer_default_would_drop(log_level: LogLevelFlags, log_domain: utf8?) -> gboolean` | g_log_writer_default_would_drop | 2.68 | Check whether [func@GLib.log_writer_default] and [func@GLib.log_default_handler] would ignore a message with the given domain and level. As with [f... |
| log_writer_format_fields | `log_writer_format_fields(log_level: LogLevelFlags, fields: LogField, n_fields: gsize, use_color: gboolean) -> utf8` | g_log_writer_format_fields | 2.50 | Format a structured log message as a string suitable for outputting to the terminal (or elsewhere). This will include the values of all fields it k... |
| log_writer_is_journald | `log_writer_is_journald(output_fd: gint) -> gboolean` | g_log_writer_is_journald | 2.50 | Check whether the given @output_fd file descriptor is a connection to the systemd journal, or something else (like a log file or `stdout` or `stder... |
| log_writer_journald | `log_writer_journald(log_level: LogLevelFlags, fields: LogField, n_fields: gsize, user_data: gpointer?) -> LogWriterOutput` | g_log_writer_journald | 2.50 | Format a structured log message and send it to the systemd journal as a set of key???value pairs. All fields are sent to the journal, but if a fiel... |
| log_writer_standard_streams | `log_writer_standard_streams(log_level: LogLevelFlags, fields: LogField, n_fields: gsize, user_data: gpointer?) -> LogWriterOutput` | g_log_writer_standard_streams | 2.50 | Format a structured log message and print it to either `stdout` or `stderr`, depending on its log level. [flags@GLib.LogLevelFlags.LEVEL_INFO] and ... |
| log_writer_supports_color | `log_writer_supports_color(output_fd: gint) -> gboolean` | g_log_writer_supports_color | 2.50 | Check whether the given @output_fd file descriptor supports ANSI color escape sequences. If so, they can safely be used when formatting log messages. |
| log_writer_syslog | `log_writer_syslog(log_level: LogLevelFlags, fields: LogField, n_fields: gsize, user_data: gpointer?) -> LogWriterOutput` | g_log_writer_syslog | 2.80 | Format a structured log message and send it to the syslog daemon. Only fields which are understood by this function are included in the formatted s... |
| logv | `logv(log_domain: utf8?, log_level: LogLevelFlags, format: utf8, args: va_list) -> none` | g_logv |  | Logs an error or debugging message. If the log level has been set as fatal, [func@GLib.BREAKPOINT] is called to terminate the program. See the docu... |
| lstat | `lstat(filename: filename, buf: StatBuf) -> gint` | g_lstat | 2.6 | A wrapper for the POSIX lstat() function. The lstat() function is like stat() except that in the case of symbolic links, it returns information abo... |
| main_context_default | `main_context_default() -> MainContext` | g_main_context_default |  | Returns the global-default main context. This is the main context used for main loop functions when a main loop is not explicitly specified, and co... |
| main_context_get_thread_default | `main_context_get_thread_default() -> MainContext` | g_main_context_get_thread_default | 2.22 | Gets the thread-default #GMainContext for this thread. Asynchronous operations that want to be able to be run in contexts other than the default on... |
| main_context_ref_thread_default | `main_context_ref_thread_default() -> MainContext` | g_main_context_ref_thread_default | 2.32 | Gets the thread-default #GMainContext for this thread, as with g_main_context_get_thread_default(), but also adds a reference to it with g_main_con... |
| main_current_source | `main_current_source() -> Source` | g_main_current_source | 2.12 | Returns the currently firing source for this thread. |
| main_depth | `main_depth() -> gint` | g_main_depth |  | Returns the depth of the stack of calls to g_main_context_dispatch() on any #GMainContext in the current thread. That is, when called from the topl... |
| malloc | `malloc(n_bytes: gsize) -> gpointer` | g_malloc |  | Allocates @n_bytes bytes of memory. If @n_bytes is 0 it returns %NULL. If the allocation fails (because the system is out of memory), the program i... |
| malloc0 | `malloc0(n_bytes: gsize) -> gpointer` | g_malloc0 |  | Allocates @n_bytes bytes of memory, initialized to 0's. If @n_bytes is 0 it returns %NULL. If the allocation fails (because the system is out of me... |
| malloc0_n | `malloc0_n(n_blocks: gsize, n_block_bytes: gsize) -> gpointer` | g_malloc0_n | 2.24 | This function is similar to g_malloc0(), allocating (@n_blocks * @n_block_bytes) bytes, but care is taken to detect possible overflow during multip... |
| malloc_n | `malloc_n(n_blocks: gsize, n_block_bytes: gsize) -> gpointer` | g_malloc_n | 2.24 | This function is similar to g_malloc(), allocating (@n_blocks * @n_block_bytes) bytes, but care is taken to detect possible overflow during multipl... |
| markup_collect_attributes | `markup_collect_attributes(element_name: utf8, attribute_names: utf8, attribute_values: utf8, error: Error, first_type: MarkupCollectType, first_attr: utf8, ...: void) -> gboolean` | g_markup_collect_attributes | 2.16 | Collects the attributes of the element from the data passed to the #GMarkupParser start_element function, dealing with common error conditions and ... |
| markup_error_quark | `markup_error_quark() -> Quark` | g_markup_error_quark |  |  |
| markup_escape_text | `markup_escape_text(text: utf8, length: gssize) -> utf8` | g_markup_escape_text |  | Escapes text so that the markup parser will parse it verbatim. Less than, greater than, ampersand, etc. are replaced with the corresponding entitie... |
| markup_printf_escaped | `markup_printf_escaped(format: utf8, ...: void) -> utf8` | g_markup_printf_escaped | 2.4 | Formats arguments according to @format, escaping all string and character arguments in the fashion of g_markup_escape_text(). This is useful when y... |
| markup_vprintf_escaped | `markup_vprintf_escaped(format: utf8, args: va_list) -> utf8` | g_markup_vprintf_escaped | 2.4 | Formats the data in @args according to @format, escaping all string and character arguments in the fashion of g_markup_escape_text(). See g_markup_... |
| mem_chunk_info | `mem_chunk_info() -> none` | g_mem_chunk_info |  |  |
| mem_is_system_malloc | `mem_is_system_malloc() -> gboolean` | g_mem_is_system_malloc |  | Checks whether the allocator used by g_malloc() is the system's malloc implementation. If it returns %TRUE memory allocated with malloc() can be us... |
| mem_profile | `mem_profile() -> none` | g_mem_profile |  | GLib used to support some tools for memory profiling, but this no longer works. There are many other useful tools for memory profiling these days w... |
| mem_set_vtable | `mem_set_vtable(vtable: MemVTable) -> none` | g_mem_set_vtable |  | This function used to let you override the memory allocation function. However, its use was incompatible with the use of global constructors in GLi... |
| memdup | `memdup(mem: gpointer?, byte_size: guint) -> gpointer` | g_memdup |  | Allocates @byte_size bytes of memory, and copies @byte_size bytes into it from @mem. If @mem is `NULL` it returns `NULL`. |
| memdup2 | `memdup2(mem: gpointer?, byte_size: gsize) -> gpointer` | g_memdup2 | 2.68 | Allocates @byte_size bytes of memory, and copies @byte_size bytes into it from @mem. If @mem is `NULL` it returns `NULL`. This replaces [func@GLib.... |
| mkdir | `mkdir(filename: filename, mode: gint) -> gint` | g_mkdir | 2.6 | A wrapper for the POSIX mkdir() function. The mkdir() function attempts to create a directory with the given name and permissions. The mode argumen... |
| mkdir_with_parents | `mkdir_with_parents(pathname: filename, mode: gint) -> gint` | g_mkdir_with_parents | 2.8 | Create a directory if it doesn't already exist. Create intermediate parent directories as needed, too. |
| mkdtemp | `mkdtemp(tmpl: filename) -> filename` | g_mkdtemp | 2.30 | Creates a temporary directory. See the mkdtemp() documentation on most UNIX-like systems. The parameter is a string that should follow the rules fo... |
| mkdtemp_full | `mkdtemp_full(tmpl: filename, mode: gint) -> filename` | g_mkdtemp_full | 2.30 | Creates a temporary directory. See the mkdtemp() documentation on most UNIX-like systems. The parameter is a string that should follow the rules fo... |
| mkstemp | `mkstemp(tmpl: filename) -> gint` | g_mkstemp |  | Opens a temporary file. See the mkstemp() documentation on most UNIX-like systems. The parameter is a string that should follow the rules for mkste... |
| mkstemp_full | `mkstemp_full(tmpl: filename, flags: gint, mode: gint) -> gint` | g_mkstemp_full | 2.22 | Opens a temporary file. See the mkstemp() documentation on most UNIX-like systems. The parameter is a string that should follow the rules for mkste... |
| mutex_new | `mutex_new() -> Mutex` | g_mutex_new |  | Allocates and initializes a new #GMutex. |
| node_pop_allocator | `node_pop_allocator() -> none` | g_node_pop_allocator |  |  |
| node_push_allocator | `node_push_allocator(allocator: Allocator) -> none` | g_node_push_allocator |  |  |
| nullify_pointer | `nullify_pointer(nullify_location: gpointer) -> none` | g_nullify_pointer |  | Set the pointer at the specified location to %NULL. |
| number_parser_error_quark | `number_parser_error_quark() -> Quark` | g_number_parser_error_quark |  |  |
| on_error_query | `on_error_query(prg_name: utf8) -> none` | g_on_error_query |  | Prompts the user with `[E]xit, [H]alt, show [S]tack trace or [P]roceed`. This function is intended to be used for debugging use only. The following... |
| on_error_stack_trace | `on_error_stack_trace(prg_name: utf8) -> none` | g_on_error_stack_trace |  | Invokes gdb, which attaches to the current process and shows a stack trace. Called by g_on_error_query() when the "[S]tack trace" option is selecte... |
| once_init_enter | `once_init_enter(location: inout gpointer) -> gboolean` | g_once_init_enter | 2.14 | Function to be called when starting a critical initialization section. The argument @location must point to a static 0-initialized variable that wi... |
| once_init_enter_impl | `once_init_enter_impl(location: gsize) -> gboolean` | g_once_init_enter_impl |  |  |
| once_init_enter_pointer | `once_init_enter_pointer(location: gpointer) -> gboolean` | g_once_init_enter_pointer | 2.80 | This functions behaves in the same way as g_once_init_enter(), but can can be used to initialize pointers (or #guintptr) instead of #gsize. \|[<!-- ... |
| once_init_leave | `once_init_leave(location: inout gpointer, result: gsize) -> none` | g_once_init_leave | 2.14 | Counterpart to g_once_init_enter(). Expects a location of a static 0-initialized initialization variable, and an initialization value other than 0.... |
| once_init_leave_pointer | `once_init_leave_pointer(location: gpointer, result: gpointer?) -> none` | g_once_init_leave_pointer | 2.80 | Counterpart to g_once_init_enter_pointer(). Expects a location of a static `NULL`-initialized initialization variable, and an initialization value ... |
| open | `open(filename: filename, flags: gint, mode: gint) -> gint` | g_open | 2.6 | A wrapper for the POSIX open() function. The open() function is used to convert a pathname into a file descriptor. On POSIX systems file descriptor... |
| option_error_quark | `option_error_quark() -> Quark` | g_option_error_quark |  |  |
| parse_debug_string | `parse_debug_string(string: utf8?, keys: DebugKey, nkeys: guint) -> guint` | g_parse_debug_string |  | Parses a string containing debugging options into a %guint containing bit flags. This is used within GDK and GTK to parse the debug options passed ... |
| path_buf_equal | `path_buf_equal(v1: gpointer, v2: gpointer) -> gboolean` | g_path_buf_equal | 2.76 | Compares two path buffers for equality and returns `TRUE` if they are equal. The path inside the paths buffers are not going to be normalized, so `... |
| path_get_basename | `path_get_basename(file_name: filename) -> filename` | g_path_get_basename |  | Gets the last component of the filename. If @file_name ends with a directory separator it gets the component before the last slash. If @file_name c... |
| path_get_dirname | `path_get_dirname(file_name: filename) -> filename` | g_path_get_dirname |  | Gets the directory components of a file name. For example, the directory component of `/usr/bin/test` is `/usr/bin`. The directory component of `/`... |
| path_is_absolute | `path_is_absolute(file_name: filename) -> gboolean` | g_path_is_absolute |  | Returns %TRUE if the given @file_name is an absolute file name. Note that this is a somewhat vague concept on Windows. On POSIX systems, an absolut... |
| path_skip_root | `path_skip_root(file_name: filename) -> filename` | g_path_skip_root |  | Returns a pointer into @file_name after the root component, i.e. after the "/" in UNIX or "C:\" under Windows. If @file_name is not an absolute pat... |
| pattern_match | `pattern_match(pspec: PatternSpec, string_length: guint, string: utf8, string_reversed: utf8?) -> gboolean` | g_pattern_match |  | Matches a string against a compiled pattern. Passing the correct length of the string given is mandatory. The reversed string can be omitted by pas... |
| pattern_match_simple | `pattern_match_simple(pattern: utf8, string: utf8) -> gboolean` | g_pattern_match_simple |  | Matches a string against a pattern given as a string. If this function is to be called in a loop, it's more efficient to compile the pattern once w... |
| pattern_match_string | `pattern_match_string(pspec: PatternSpec, string: utf8) -> gboolean` | g_pattern_match_string |  | Matches a string against a compiled pattern. If the string is to be matched against more than one pattern, consider using g_pattern_match() instead... |
| pointer_bit_lock | `pointer_bit_lock(address: gpointer, lock_bit: gint) -> none` | g_pointer_bit_lock | 2.30 | This is equivalent to g_bit_lock, but working on pointers (or other pointer-sized values). For portability reasons, you may only lock on the bottom... |
| pointer_bit_lock_and_get | `pointer_bit_lock_and_get(address: gpointer, lock_bit: guint, out_ptr: out guintptr?) -> none` | g_pointer_bit_lock_and_get | 2.80 | This is equivalent to g_bit_lock, but working on pointers (or other pointer-sized values). For portability reasons, you may only lock on the bottom... |
| pointer_bit_lock_mask_ptr | `pointer_bit_lock_mask_ptr(ptr: gpointer?, lock_bit: guint, set: gboolean, preserve_mask: guintptr, preserve_ptr: gpointer?) -> gpointer` | g_pointer_bit_lock_mask_ptr | 2.80 | This mangles @ptr as g_pointer_bit_lock() and g_pointer_bit_unlock() do. |
| pointer_bit_trylock | `pointer_bit_trylock(address: gpointer, lock_bit: gint) -> gboolean` | g_pointer_bit_trylock | 2.30 | This is equivalent to g_bit_trylock(), but working on pointers (or other pointer-sized values). For portability reasons, you may only lock on the b... |
| pointer_bit_unlock | `pointer_bit_unlock(address: gpointer, lock_bit: gint) -> none` | g_pointer_bit_unlock | 2.30 | This is equivalent to g_bit_unlock, but working on pointers (or other pointer-sized values). For portability reasons, you may only lock on the bott... |
| pointer_bit_unlock_and_set | `pointer_bit_unlock_and_set(address: gpointer, lock_bit: guint, ptr: gpointer?, preserve_mask: guintptr) -> none` | g_pointer_bit_unlock_and_set | 2.80 | This is equivalent to g_pointer_bit_unlock() and atomically setting the pointer value. Note that the lock bit will be cleared from the pointer. If ... |
| poll | `poll(fds: PollFD, nfds: guint, timeout: gint) -> gint` | g_poll | 2.20 | Polls @fds, as with the poll() system call, but portably. (On systems that don't have poll(), it is emulated using select().) This is used internal... |
| prefix_error | `prefix_error(err: inout Error?, format: utf8, ...: void) -> none` | g_prefix_error | 2.16 | Formats a string according to @format and prefix it to an existing error message. If @err is %NULL (ie: no error variable) then do nothing. If *@er... |
| prefix_error_literal | `prefix_error_literal(err: inout Error?, prefix: utf8) -> none` | g_prefix_error_literal | 2.70 | Prefixes @prefix to an existing error message. If @err or *@err is %NULL (i.e.: no error variable) then do nothing. |
| print | `print(format: utf8, ...: void) -> none` | g_print |  | Outputs a formatted message via the print handler. The default print handler outputs the encoded message to `stdout`, without appending a trailing ... |
| printerr | `printerr(format: utf8, ...: void) -> none` | g_printerr |  | Outputs a formatted message via the error message handler. The default handler outputs the encoded message to `stderr`, without appending a trailin... |
| printf | `printf(format: utf8, ...: void) -> gint` | g_printf | 2.2 | An implementation of the standard `printf()` function which supports positional parameters, as specified in the Single Unix Specification. As with ... |
| printf_string_upper_bound | `printf_string_upper_bound(format: utf8, args: va_list) -> gsize` | g_printf_string_upper_bound |  | Calculates the maximum space needed to store the output of the `sprintf()` function. If @format or @args are invalid, `0` is returned. This could h... |
| private_new | `private_new(notify: DestroyNotify) -> Private` | g_private_new |  | Creates a new #GPrivate. |
| propagate_error | `propagate_error(dest: out Error?, src: Error) -> none` | g_propagate_error |  | If @dest is %NULL, free @src; otherwise, moves @src into *@dest. The error variable @dest points to must be %NULL. @src must be non-%NULL. Note tha... |
| propagate_prefixed_error | `propagate_prefixed_error(dest: Error, src: Error, format: utf8, ...: void) -> none` | g_propagate_prefixed_error | 2.16 | If @dest is %NULL, free @src; otherwise, moves @src into *@dest. *@dest must be %NULL. After the move, add a prefix as with g_prefix_error(). |
| ptr_array_find | `ptr_array_find(haystack: gpointer, needle: gpointer?, index_: out guint?) -> gboolean` | g_ptr_array_find | 2.54 | Checks whether @needle exists in @haystack. If the element is found, %TRUE is returned and the element???s index is returned in @index_ (if non-%NU... |
| ptr_array_find_with_equal_func | `ptr_array_find_with_equal_func(haystack: gpointer, needle: gpointer?, equal_func: EqualFunc?, index_: out guint?) -> gboolean` | g_ptr_array_find_with_equal_func | 2.54 | Checks whether @needle exists in @haystack, using the given @equal_func. If the element is found, %TRUE is returned and the element???s index is re... |
| ptr_array_new_from_array | `ptr_array_new_from_array(data: gpointer?, len: gsize, copy_func: CopyFunc?, copy_func_user_data: gpointer?, element_free_func: DestroyNotify?) -> gpointer` | g_ptr_array_new_from_array | 2.76 | Creates a new #GPtrArray, copying @len pointers from @data, and setting the array???s reference count to 1. This avoids having to manually add each... |
| ptr_array_new_from_null_terminated_array | `ptr_array_new_from_null_terminated_array(data: gpointer?, copy_func: CopyFunc?, copy_func_user_data: gpointer?, element_free_func: DestroyNotify?) -> gpointer` | g_ptr_array_new_from_null_terminated_array | 2.76 | Creates a new #GPtrArray copying the pointers from @data after having computed the length of it and with a reference count of 1. This avoids having... |
| ptr_array_new_take | `ptr_array_new_take(data: gpointer?, len: gsize, element_free_func: DestroyNotify?) -> gpointer` | g_ptr_array_new_take | 2.76 | Creates a new #GPtrArray with @data as pointers, @len as length and a reference count of 1. This avoids having to copy such data manually. After th... |
| ptr_array_new_take_null_terminated | `ptr_array_new_take_null_terminated(data: gpointer?, element_free_func: DestroyNotify?) -> gpointer` | g_ptr_array_new_take_null_terminated | 2.76 | Creates a new #GPtrArray with @data as pointers, computing the length of it and setting the reference count to 1. This avoids having to copy such d... |
| qsort_with_data | `qsort_with_data(pbase: gpointer, total_elems: gint, size: gsize, compare_func: CompareDataFunc, user_data: gpointer?) -> none` | g_qsort_with_data |  | This is just like the standard C qsort() function, but the comparison routine accepts a user data argument. This is guaranteed to be a stable sort ... |
| quark_from_static_string | `quark_from_static_string(string: utf8?) -> Quark` | g_quark_from_static_string |  | Gets the #GQuark identifying the given (static) string. If the string does not currently have an associated #GQuark, a new #GQuark is created, link... |
| quark_from_string | `quark_from_string(string: utf8?) -> Quark` | g_quark_from_string |  | Gets the #GQuark identifying the given string. If the string does not currently have an associated #GQuark, a new #GQuark is created, using a copy ... |
| quark_to_string | `quark_to_string(quark: Quark) -> utf8` | g_quark_to_string |  | Gets the string associated with the given #GQuark. |
| quark_try_string | `quark_try_string(string: utf8?) -> Quark` | g_quark_try_string |  | Gets the #GQuark associated with the given string, or 0 if string is %NULL or it has no associated #GQuark. If you want the GQuark to be created if... |
| random_double | `random_double() -> gdouble` | g_random_double |  | Returns a random #gdouble equally distributed over the range [0..1). |
| random_double_range | `random_double_range(begin: gdouble, end: gdouble) -> gdouble` | g_random_double_range |  | Returns a random #gdouble equally distributed over the range [@begin..@end). |
| random_int | `random_int() -> guint32` | g_random_int |  | Return a random #guint32 equally distributed over the range [0..2^32-1]. |
| random_int_range | `random_int_range(begin: gint32, end: gint32) -> gint32` | g_random_int_range |  | Returns a random #gint32 equally distributed over the range [@begin..@end-1]. |
| random_set_seed | `random_set_seed(seed: guint32) -> none` | g_random_set_seed |  | Sets the seed for the global random number generator, which is used by the g_random_* functions, to @seed. |
| rc_box_acquire | `rc_box_acquire(mem_block: gpointer) -> gpointer` | g_rc_box_acquire | 2.58 | Acquires a reference on the data pointed by @mem_block. |
| rc_box_alloc | `rc_box_alloc(block_size: gsize) -> gpointer` | g_rc_box_alloc | 2.58 | Allocates @block_size bytes of memory, and adds reference counting semantics to it. The data will be freed when its reference count drops to zero. ... |
| rc_box_alloc0 | `rc_box_alloc0(block_size: gsize) -> gpointer` | g_rc_box_alloc0 | 2.58 | Allocates @block_size bytes of memory, and adds reference counting semantics to it. The contents of the returned data is set to zero. The data will... |
| rc_box_dup | `rc_box_dup(block_size: gsize, mem_block: gpointer) -> gpointer` | g_rc_box_dup | 2.58 | Allocates a new block of data with reference counting semantics, and copies @block_size bytes of @mem_block into it. |
| rc_box_get_size | `rc_box_get_size(mem_block: gpointer) -> gsize` | g_rc_box_get_size | 2.58 | Retrieves the size of the reference counted data pointed by @mem_block. |
| rc_box_release | `rc_box_release(mem_block: gpointer) -> none` | g_rc_box_release | 2.58 | Releases a reference on the data pointed by @mem_block. If the reference was the last one, it will free the resources allocated for @mem_block. |
| rc_box_release_full | `rc_box_release_full(mem_block: gpointer, clear_func: DestroyNotify) -> none` | g_rc_box_release_full | 2.58 | Releases a reference on the data pointed by @mem_block. If the reference was the last one, it will call @clear_func to clear the contents of @mem_b... |
| realloc | `realloc(mem: gpointer?, n_bytes: gsize) -> gpointer` | g_realloc |  | Reallocates the memory pointed to by @mem, so that it now has space for @n_bytes bytes of memory. It returns the new address of the memory, which m... |
| realloc_n | `realloc_n(mem: gpointer?, n_blocks: gsize, n_block_bytes: gsize) -> gpointer` | g_realloc_n | 2.24 | This function is similar to g_realloc(), allocating (@n_blocks * @n_block_bytes) bytes, but care is taken to detect possible overflow during multip... |
| ref_count_compare | `ref_count_compare(rc: gint, val: gint) -> gboolean` | g_ref_count_compare | 2.58 | Compares the current value of @rc with @val. |
| ref_count_dec | `ref_count_dec(rc: gint) -> gboolean` | g_ref_count_dec | 2.58 | Decreases the reference count. If %TRUE is returned, the reference count reached 0. After this point, @rc is an undefined state and must be reiniti... |
| ref_count_inc | `ref_count_inc(rc: gint) -> none` | g_ref_count_inc | 2.58 | Increases the reference count. |
| ref_count_init | `ref_count_init(rc: gint) -> none` | g_ref_count_init | 2.58 | Initializes a reference count variable to 1. |
| ref_string_acquire | `ref_string_acquire(str: utf8) -> utf8` | g_ref_string_acquire | 2.58 | Acquires a reference on a string. |
| ref_string_length | `ref_string_length(str: utf8) -> gsize` | g_ref_string_length | 2.58 | Retrieves the length of @str. |
| ref_string_new | `ref_string_new(str: utf8) -> utf8` | g_ref_string_new | 2.58 | Creates a new reference counted string and copies the contents of @str into it. |
| ref_string_new_intern | `ref_string_new_intern(str: utf8) -> utf8` | g_ref_string_new_intern | 2.58 | Creates a new reference counted string and copies the content of @str into it. If you call this function multiple times with the same @str, or with... |
| ref_string_new_len | `ref_string_new_len(str: utf8, len: gssize) -> utf8` | g_ref_string_new_len | 2.58 | Creates a new reference counted string and copies the contents of @str into it, up to @len bytes. Since this function does not stop at nul bytes, i... |
| ref_string_release | `ref_string_release(str: utf8) -> none` | g_ref_string_release | 2.58 | Releases a reference on a string; if it was the last reference, the resources allocated by the string are freed as well. |
| regex_check_replacement | `regex_check_replacement(replacement: utf8, has_references: out gboolean?) -> gboolean throws` | g_regex_check_replacement | 2.14 | Checks whether @replacement is a valid replacement string (see g_regex_replace()), i.e. that all escape sequences in it are valid. If @has_referenc... |
| regex_error_quark | `regex_error_quark() -> Quark` | g_regex_error_quark |  |  |
| regex_escape_nul | `regex_escape_nul(string: utf8, length: gint) -> utf8` | g_regex_escape_nul | 2.30 | Escapes the nul characters in @string to "\x00". It can be used to compile a regex with embedded nul characters. For completeness, @length can be -... |
| regex_escape_string | `regex_escape_string(string: utf8, length: gint) -> utf8` | g_regex_escape_string | 2.14 | Escapes the special characters used for regular expressions in @string, for instance "a.b*c" becomes "a\.b\*c". This function is useful to dynamica... |
| regex_match_simple | `regex_match_simple(pattern: utf8, string: utf8, compile_options: RegexCompileFlags, match_options: RegexMatchFlags) -> gboolean` | g_regex_match_simple | 2.14 | Scans for a match in @string for @pattern. This function is equivalent to g_regex_match() but it does not require to compile the pattern with g_reg... |
| regex_split_simple | `regex_split_simple(pattern: utf8, string: utf8, compile_options: RegexCompileFlags, match_options: RegexMatchFlags) -> utf8` | g_regex_split_simple | 2.14 | Breaks the string on the pattern, and returns an array of the tokens. If the pattern contains capturing parentheses, then the text for each of the ... |
| reload_user_special_dirs_cache | `reload_user_special_dirs_cache() -> none` | g_reload_user_special_dirs_cache | 2.22 | Resets the cache used for g_get_user_special_dir(), so that the latest on-disk version is used. Call this only if you just changed the data on disk... |
| remove | `remove(filename: filename) -> gint` | g_remove | 2.6 | A wrapper for the POSIX remove() function. The remove() function deletes a name from the filesystem. See your C library manual for more details abo... |
| rename | `rename(oldfilename: filename, newfilename: filename) -> gint` | g_rename | 2.6 | A wrapper for the POSIX rename() function. The rename() function renames a file, moving it between directories if required. See your C library manu... |
| return_if_fail_warning | `return_if_fail_warning(log_domain: utf8?, pretty_function: utf8, expression: utf8?) -> none` | g_return_if_fail_warning |  | Internal function used to print messages from the public [func@GLib.return_if_fail] and [func@GLib.return_val_if_fail] macros. |
| rmdir | `rmdir(filename: filename) -> gint` | g_rmdir | 2.6 | A wrapper for the POSIX rmdir() function. The rmdir() function deletes a directory from the filesystem. See your C library manual for more details ... |
| sequence_foreach_range | `sequence_foreach_range(begin: SequenceIter, end: SequenceIter, func: Func, user_data: gpointer?) -> none` | g_sequence_foreach_range | 2.14 | Calls @func for each item in the range (@begin, @end) passing @user_data to the function. @func must not modify the sequence itself. |
| sequence_get | `sequence_get(iter: SequenceIter) -> gpointer` | g_sequence_get | 2.14 | Returns the data that @iter points to. |
| sequence_insert_before | `sequence_insert_before(iter: SequenceIter, data: gpointer?) -> SequenceIter` | g_sequence_insert_before | 2.14 | Inserts a new item just before the item pointed to by @iter. |
| sequence_move | `sequence_move(src: SequenceIter, dest: SequenceIter) -> none` | g_sequence_move | 2.14 | Moves the item pointed to by @src to the position indicated by @dest. After calling this function @dest will point to the position immediately afte... |
| sequence_move_range | `sequence_move_range(dest: SequenceIter, begin: SequenceIter, end: SequenceIter) -> none` | g_sequence_move_range | 2.14 | Inserts the (@begin, @end) range at the destination pointed to by @dest. The @begin and @end iters must point into the same sequence. It is allowed... |
| sequence_range_get_midpoint | `sequence_range_get_midpoint(begin: SequenceIter, end: SequenceIter) -> SequenceIter` | g_sequence_range_get_midpoint | 2.14 | Finds an iterator somewhere in the range (@begin, @end). This iterator will be close to the middle of the range, but is not guaranteed to be exactl... |
| sequence_remove | `sequence_remove(iter: SequenceIter) -> none` | g_sequence_remove | 2.14 | Removes the item pointed to by @iter. It is an error to pass the end iterator to this function. If the sequence has a data destroy function associa... |
| sequence_remove_range | `sequence_remove_range(begin: SequenceIter, end: SequenceIter) -> none` | g_sequence_remove_range | 2.14 | Removes all items in the (@begin, @end) range. If the sequence has a data destroy function associated with it, this function is called on the data ... |
| sequence_set | `sequence_set(iter: SequenceIter, data: gpointer?) -> none` | g_sequence_set | 2.14 | Changes the data for the item pointed to by @iter to be @data. If the sequence has a data destroy function associated with it, that function is cal... |
| sequence_sort_changed | `sequence_sort_changed(iter: SequenceIter, cmp_func: CompareDataFunc, cmp_data: gpointer?) -> none` | g_sequence_sort_changed | 2.14 | Moves the data pointed to by @iter to a new position as indicated by @cmp_func. This function should be called for items in a sequence already sort... |
| sequence_sort_changed_iter | `sequence_sort_changed_iter(iter: SequenceIter, iter_cmp: SequenceIterCompareFunc, cmp_data: gpointer?) -> none` | g_sequence_sort_changed_iter | 2.14 | Like g_sequence_sort_changed(), but uses a #GSequenceIterCompareFunc instead of a #GCompareDataFunc as the compare function. @iter_cmp is called wi... |
| sequence_swap | `sequence_swap(a: SequenceIter, b: SequenceIter) -> none` | g_sequence_swap | 2.14 | Swaps the items pointed to by @a and @b. It is allowed for @a and @b to point into difference sequences. |
| set_application_name | `set_application_name(application_name: utf8) -> none` | g_set_application_name | 2.2 | Sets a human-readable name for the application. This name should be localized if possible, and is intended for display to the user. Contrast with g... |
| set_error | `set_error(err: out Error?, domain: Quark, code: gint, format: utf8, ...: void) -> none` | g_set_error |  | Does nothing if @err is %NULL; if @err is non-%NULL, then *@err must be %NULL. A new #GError is created and assigned to *@err. |
| set_error_literal | `set_error_literal(err: out Error?, domain: Quark, code: gint, message: utf8) -> none` | g_set_error_literal | 2.18 | Does nothing if @err is %NULL; if @err is non-%NULL, then *@err must be %NULL. A new #GError is created and assigned to *@err. Unlike g_set_error()... |
| set_prgname | `set_prgname(prgname: utf8) -> none` | g_set_prgname |  | Sets the name of the program. This name should not be localized, in contrast to g_set_application_name(). If you are using #GApplication the progra... |
| set_print_handler | `set_print_handler(func: PrintFunc?) -> PrintFunc` | g_set_print_handler |  | Sets the print handler to @func, or resets it to the default GLib handler if `NULL`. Any messages passed to [func@GLib.print] will be output via th... |
| set_printerr_handler | `set_printerr_handler(func: PrintFunc?) -> PrintFunc` | g_set_printerr_handler |  | Sets the handler for printing error messages to @func, or resets it to the default GLib handler if `NULL`. Any messages passed to [func@GLib.printe... |
| setenv | `setenv(variable: filename, value: filename, overwrite: gboolean) -> gboolean` | g_setenv | 2.4 | Sets an environment variable. On UNIX, both the variable's name and value can be arbitrary byte strings, except that the variable's name cannot con... |
| shell_error_quark | `shell_error_quark() -> Quark` | g_shell_error_quark |  |  |
| shell_parse_argv | `shell_parse_argv(command_line: filename, argcp: out gint?, argvp: out filename?) -> gboolean throws` | g_shell_parse_argv |  | Parses a command line into an argument vector, in much the same way the shell would, but without many of the expansions the shell would perform (va... |
| shell_quote | `shell_quote(unquoted_string: filename) -> filename` | g_shell_quote |  | Quotes a string so that the shell (/bin/sh) will interpret the quoted string to mean @unquoted_string. If you pass a filename to the shell, for exa... |
| shell_unquote | `shell_unquote(quoted_string: filename) -> filename throws` | g_shell_unquote |  | Unquotes a string as the shell (/bin/sh) would. This function only handles quotes; if a string contains file globs, arithmetic operators, variables... |
| slice_alloc | `slice_alloc(block_size: gsize) -> gpointer` | g_slice_alloc | 2.10 | Allocates a block of memory from the libc allocator. The block address handed out can be expected to be aligned to at least `1 * sizeof (void*)`. S... |
| slice_alloc0 | `slice_alloc0(block_size: gsize) -> gpointer` | g_slice_alloc0 | 2.10 | Allocates a block of memory via g_slice_alloc() and initializes the returned memory to 0. Since GLib 2.76 this always uses the system malloc() impl... |
| slice_copy | `slice_copy(block_size: gsize, mem_block: gpointer?) -> gpointer` | g_slice_copy | 2.14 | Allocates a block of memory from the slice allocator and copies @block_size bytes into it from @mem_block. @mem_block must be non-%NULL if @block_s... |
| slice_free1 | `slice_free1(block_size: gsize, mem_block: gpointer?) -> none` | g_slice_free1 | 2.10 | Frees a block of memory. The memory must have been allocated via g_slice_alloc() or g_slice_alloc0() and the @block_size has to match the size spec... |
| slice_free_chain_with_offset | `slice_free_chain_with_offset(block_size: gsize, mem_chain: gpointer?, next_offset: gsize) -> none` | g_slice_free_chain_with_offset | 2.10 | Frees a linked list of memory blocks of structure type @type. The memory blocks must be equal-sized, allocated via g_slice_alloc() or g_slice_alloc... |
| slice_get_config | `slice_get_config(ckey: SliceConfig) -> gint64` | g_slice_get_config |  |  |
| slice_get_config_state | `slice_get_config_state(ckey: SliceConfig, address: gint64, n_values: guint) -> gint64` | g_slice_get_config_state |  |  |
| slice_set_config | `slice_set_config(ckey: SliceConfig, value: gint64) -> none` | g_slice_set_config |  |  |
| slist_pop_allocator | `slist_pop_allocator() -> none` | g_slist_pop_allocator |  |  |
| slist_push_allocator | `slist_push_allocator(allocator: Allocator) -> none` | g_slist_push_allocator |  |  |
| snprintf | `snprintf(string: utf8, n: gulong, format: utf8, ...: void) -> gint` | g_snprintf |  | A safer form of the standard sprintf() function. The output is guaranteed to not exceed @n characters (including the terminating nul character), so... |
| source_remove | `source_remove(tag: guint) -> gboolean` | g_source_remove |  | Removes the source with the given ID from the default main context. You must use g_source_destroy() for sources added to a non-default main context... |
| source_remove_by_funcs_user_data | `source_remove_by_funcs_user_data(funcs: SourceFuncs, user_data: gpointer?) -> gboolean` | g_source_remove_by_funcs_user_data |  | Removes a source from the default main loop context given the source functions and user data. If multiple sources exist with the same source functi... |
| source_remove_by_user_data | `source_remove_by_user_data(user_data: gpointer?) -> gboolean` | g_source_remove_by_user_data |  | Removes a source from the default main loop context given the user data for the callback. If multiple sources exist with the same user data, only o... |
| source_set_name_by_id | `source_set_name_by_id(tag: guint, name: utf8) -> none` | g_source_set_name_by_id | 2.26 | Sets the name of a source using its ID. This is a convenience utility to set source names from the return value of g_idle_add(), g_timeout_add(), e... |
| spaced_primes_closest | `spaced_primes_closest(num: guint) -> guint` | g_spaced_primes_closest |  | Gets the smallest prime number from a built-in array of primes which is larger than @num. This is used within GLib to calculate the optimum size of... |
| spawn_async | `spawn_async(working_directory: filename?, argv: filename, envp: filename?, flags: SpawnFlags, child_setup: SpawnChildSetupFunc?, user_data: gpointer?, child_pid: out Pid?) -> gboolean throws` | g_spawn_async |  | Executes a child program asynchronously. See g_spawn_async_with_pipes() for a full description; this function simply calls the g_spawn_async_with_p... |
| spawn_async_with_fds | `spawn_async_with_fds(working_directory: filename?, argv: utf8, envp: utf8?, flags: SpawnFlags, child_setup: SpawnChildSetupFunc?, user_data: gpointer?, child_pid: out Pid?, stdin_fd: gint, stdout_fd: gint, stderr_fd: gint) -> gboolean throws` | g_spawn_async_with_fds | 2.58 | Executes a child program asynchronously. Identical to g_spawn_async_with_pipes_and_fds() but with `n_fds` set to zero, so no FD assignments are used. |
| spawn_async_with_pipes | `spawn_async_with_pipes(working_directory: filename?, argv: filename, envp: filename?, flags: SpawnFlags, child_setup: SpawnChildSetupFunc?, user_data: gpointer?, child_pid: out Pid?, standard_input: out gint?, standard_output: out gint?, standard_error: out gint?) -> gboolean throws` | g_spawn_async_with_pipes |  | Identical to g_spawn_async_with_pipes_and_fds() but with `n_fds` set to zero, so no FD assignments are used. |
| spawn_async_with_pipes_and_fds | `spawn_async_with_pipes_and_fds(working_directory: filename?, argv: filename, envp: filename?, flags: SpawnFlags, child_setup: SpawnChildSetupFunc?, user_data: gpointer?, stdin_fd: gint, stdout_fd: gint, stderr_fd: gint, source_fds: gint?, target_fds: gint?, n_fds: gsize, child_pid_out: out Pid?, stdin_pipe_out: out gint?, stdout_pipe_out: out gint?, stderr_pipe_out: out gint?) -> gboolean throws` | g_spawn_async_with_pipes_and_fds | 2.68 | Executes a child program asynchronously (your program will not block waiting for the child to exit). The child program is specified by the only arg... |
| spawn_check_exit_status | `spawn_check_exit_status(wait_status: gint) -> gboolean throws` | g_spawn_check_exit_status | 2.34 | An old name for g_spawn_check_wait_status(), deprecated because its name is misleading. Despite the name of the function, @wait_status must be the ... |
| spawn_check_wait_status | `spawn_check_wait_status(wait_status: gint) -> gboolean throws` | g_spawn_check_wait_status | 2.70 | Set @error if @wait_status indicates the child exited abnormally (e.g. with a nonzero exit code, or via a fatal signal). The g_spawn_sync() and g_c... |
| spawn_close_pid | `spawn_close_pid(pid: Pid) -> none` | g_spawn_close_pid |  | On some platforms, notably Windows, the #GPid type represents a resource which must be closed to prevent resource leaking. g_spawn_close_pid() is p... |
| spawn_command_line_async | `spawn_command_line_async(command_line: filename) -> gboolean throws` | g_spawn_command_line_async |  | A simple version of g_spawn_async() that parses a command line with g_shell_parse_argv() and passes it to g_spawn_async(). Runs a command line in t... |
| spawn_command_line_sync | `spawn_command_line_sync(command_line: filename, standard_output: out guint8?, standard_error: out guint8?, wait_status: out gint?) -> gboolean throws` | g_spawn_command_line_sync |  | A simple version of g_spawn_sync() with little-used parameters removed, taking a command line instead of an argument vector. See g_spawn_sync() for... |
| spawn_error_quark | `spawn_error_quark() -> Quark` | g_spawn_error_quark |  |  |
| spawn_exit_error_quark | `spawn_exit_error_quark() -> Quark` | g_spawn_exit_error_quark |  |  |
| spawn_sync | `spawn_sync(working_directory: filename?, argv: filename, envp: filename?, flags: SpawnFlags, child_setup: SpawnChildSetupFunc?, user_data: gpointer?, standard_output: out guint8?, standard_error: out guint8?, wait_status: out gint?) -> gboolean throws` | g_spawn_sync |  | Executes a child synchronously (waits for the child to exit before returning). All output from the child is stored in @standard_output and @standar... |
| sprintf | `sprintf(string: utf8, format: utf8, ...: void) -> gint` | g_sprintf | 2.2 | An implementation of the standard `sprintf()` function which supports positional parameters, as specified in the Single Unix Specification. Note th... |
| stat | `stat(filename: filename, buf: StatBuf) -> gint` | g_stat | 2.6 | A wrapper for the POSIX stat() function. The stat() function returns information about a file. On Windows the stat() function in the C library chec... |
| stpcpy | `stpcpy(dest: utf8, src: utf8) -> utf8` | g_stpcpy |  | Copies a nul-terminated string into the destination buffer, including the trailing nul byte, and returns a pointer to the trailing nul byte in `des... |
| str_equal | `str_equal(v1: gpointer, v2: gpointer) -> gboolean` | g_str_equal |  | Compares two strings for byte-by-byte equality and returns %TRUE if they are equal. It can be passed to g_hash_table_new() as the @key_equal_func p... |
| str_has_prefix | `str_has_prefix(str: utf8, prefix: utf8) -> gboolean` | g_str_has_prefix | 2.2 | Looks whether the string @str begins with @prefix. |
| str_has_suffix | `str_has_suffix(str: utf8, suffix: utf8) -> gboolean` | g_str_has_suffix | 2.2 | Looks whether a string ends with @suffix. |
| str_hash | `str_hash(v: gpointer) -> guint` | g_str_hash |  | Converts a string to a hash value. This function implements the widely used "djb" hash apparently posted by Daniel Bernstein to comp.lang.c some ti... |
| str_is_ascii | `str_is_ascii(str: utf8) -> gboolean` | g_str_is_ascii | 2.40 | Determines if a string is pure ASCII. A string is pure ASCII if it contains no bytes with the high bit set. |
| str_match_string | `str_match_string(search_term: utf8, potential_hit: utf8, accept_alternates: gboolean) -> gboolean` | g_str_match_string | 2.40 | Checks if a search conducted for @search_term should match @potential_hit. This function calls [func@GLib.str_tokenize_and_fold] on both @search_te... |
| str_to_ascii | `str_to_ascii(str: utf8, from_locale: utf8?) -> utf8` | g_str_to_ascii | 2.40 | Transliterate @str to plain ASCII. For best results, @str should be in composed normalised form. This function performs a reasonably good set of ch... |
| str_tokenize_and_fold | `str_tokenize_and_fold(string: utf8, translit_locale: utf8?, ascii_alternates: out utf8?) -> utf8` | g_str_tokenize_and_fold | 2.40 | Tokenizes @string and performs folding on each token. A token is a non-empty sequence of alphanumeric characters in the source string, separated by... |
| strcanon | `strcanon(string: utf8, valid_chars: utf8, substitutor: gchar) -> utf8` | g_strcanon |  | For each character in @string, if the character is not in @valid_chars, replaces the character with @substitutor. Modifies @string in place, and re... |
| strcasecmp | `strcasecmp(s1: utf8, s2: utf8) -> gint` | g_strcasecmp |  | A case-insensitive string comparison, corresponding to the standard `strcasecmp()` function on platforms which support it. |
| strchomp | `strchomp(string: utf8) -> utf8` | g_strchomp |  | Removes trailing whitespace from a string. This function doesn't allocate or reallocate any memory; it modifies @string in place. Therefore, it can... |
| strchug | `strchug(string: utf8) -> utf8` | g_strchug |  | Removes leading whitespace from a string, by moving the rest of the characters forward. This function doesn't allocate or reallocate any memory; it... |
| strcmp0 | `strcmp0(str1: utf8?, str2: utf8?) -> gint` | g_strcmp0 | 2.16 | Compares @str1 and @str2 like strcmp(). Handles %NULL gracefully by sorting it before non-%NULL strings. Comparing two %NULL pointers returns 0. |
| strcompress | `strcompress(source: utf8) -> utf8` | g_strcompress |  | Replaces all escaped characters with their one byte equivalent. This function does the reverse conversion of [func@GLib.strescape]. |
| strconcat | `strconcat(string1: utf8, ...: void) -> utf8` | g_strconcat |  | Concatenates all of the given strings into one long string. The variable argument list must end with `NULL`. If you forget the `NULL`, `g_strconcat... |
| strdelimit | `strdelimit(string: utf8, delimiters: utf8?, new_delimiter: gchar) -> utf8` | g_strdelimit |  | Converts any delimiter characters in @string to @new_delimiter. Any characters in @string which are found in @delimiters are changed to the @new_de... |
| strdown | `strdown(string: utf8) -> utf8` | g_strdown |  | Converts a string to lower case. |
| strdup | `strdup(str: utf8?) -> utf8` | g_strdup |  | Duplicates a string. If @str is `NULL` it returns `NULL`. |
| strdup_printf | `strdup_printf(format: utf8, ...: void) -> utf8` | g_strdup_printf |  | Similar to the standard C `sprintf()` function but safer, since it calculates the maximum space required and allocates memory to hold the result. T... |
| strdup_vprintf | `strdup_vprintf(format: utf8, args: va_list) -> utf8` | g_strdup_vprintf |  | Similar to the standard C `vsprintf()` function but safer, since it calculates the maximum space required and allocates memory to hold the result. ... |
| strdupv | `strdupv(str_array: utf8?) -> utf8` | g_strdupv |  | Copies an array of strings. The copy is a deep copy; each string is also copied. If called on a `NULL` value, `g_strdupv()` simply returns `NULL`. |
| strerror | `strerror(errnum: gint) -> utf8` | g_strerror |  | Returns a string corresponding to the given error code, e.g. "no such process". Unlike `strerror()`, this always returns a string in UTF-8 encoding... |
| strescape | `strescape(source: utf8, exceptions: utf8?) -> utf8` | g_strescape |  | Escapes the special characters '\b', '\f', '\n', '\r', '\t', '\v', '\' and '"' in the string @source by inserting a '\' before them. Additionally a... |
| strfreev | `strfreev(str_array: utf8?) -> none` | g_strfreev |  | Frees an array of strings, as well as each string it contains. If @str_array is `NULL`, this function simply returns. |
| strip_context | `strip_context(msgid: utf8, msgval: utf8) -> utf8` | g_strip_context | 2.4 | An auxiliary function for gettext() support (see Q_()). |
| strjoin | `strjoin(separator: utf8?, ...: void) -> utf8` | g_strjoin |  | Joins a number of strings together to form one long string, with the optional @separator inserted between each of them. |
| strjoinv | `strjoinv(separator: utf8?, str_array: utf8) -> utf8` | g_strjoinv |  | Joins an array of strings together to form one long string, with the optional @separator inserted between each of them. If @str_array has no items,... |
| strlcat | `strlcat(dest: utf8, src: utf8, dest_size: gsize) -> gsize` | g_strlcat |  | Portability wrapper that calls `strlcat()` on systems which have it, and emulates it otherwise. Appends nul-terminated @src string to @dest, guaran... |
| strlcpy | `strlcpy(dest: utf8, src: utf8, dest_size: gsize) -> gsize` | g_strlcpy |  | Portability wrapper that calls `strlcpy()` on systems which have it, and emulates `strlcpy()` otherwise. Copies @src to @dest; @dest is guaranteed ... |
| strncasecmp | `strncasecmp(s1: utf8, s2: utf8, n: guint) -> gint` | g_strncasecmp |  | A case-insensitive string comparison, corresponding to the standard `strncasecmp()` function on platforms which support it. It is similar to [func@... |
| strndup | `strndup(str: utf8?, n: gsize) -> utf8` | g_strndup |  | Duplicates the first @n bytes of a string, returning a newly-allocated buffer @n + 1 bytes long which will always be nul-terminated. If @str is les... |
| strnfill | `strnfill(length: gsize, fill_char: gchar) -> utf8` | g_strnfill |  | Creates a new string @length bytes long filled with @fill_char. |
| strreverse | `strreverse(string: utf8) -> utf8` | g_strreverse |  | Reverses all of the bytes in a string. For example, `g_strreverse ("abcdef")` will result in "fedcba". Note that `g_strreverse()` doesn't work on U... |
| strrstr | `strrstr(haystack: utf8, needle: utf8) -> utf8` | g_strrstr |  | Searches the string @haystack for the last occurrence of the string @needle. |
| strrstr_len | `strrstr_len(haystack: utf8, haystack_len: gssize, needle: utf8) -> utf8` | g_strrstr_len |  | Searches the string @haystack for the last occurrence of the string @needle, limiting the length of the search to @haystack_len. |
| strsignal | `strsignal(signum: gint) -> utf8` | g_strsignal |  | Returns a string describing the given signal, e.g. "Segmentation fault". If the signal is unknown, it returns ???unknown signal (<signum\>)???. You... |
| strsplit | `strsplit(string: utf8, delimiter: utf8, max_tokens: gint) -> utf8` | g_strsplit |  | Splits a string into a maximum of @max_tokens pieces, using the given @delimiter. If @max_tokens is reached, the remainder of @string is appended t... |
| strsplit_set | `strsplit_set(string: utf8, delimiters: utf8, max_tokens: gint) -> utf8` | g_strsplit_set | 2.4 | Splits @string into a number of tokens not containing any of the characters in @delimiters. A token is the (possibly empty) longest string that doe... |
| strstr_len | `strstr_len(haystack: utf8, haystack_len: gssize, needle: utf8) -> utf8` | g_strstr_len |  | Searches the string @haystack for the first occurrence of the string @needle, limiting the length of the search to @haystack_len or a nul terminato... |
| strtod | `strtod(nptr: utf8, endptr: out utf8?) -> gdouble` | g_strtod |  | Converts a string to a floating point value. It calls the standard `strtod()` function to handle the conversion, but if the string is not completel... |
| strup | `strup(string: utf8) -> utf8` | g_strup |  | Converts a string to upper case. |
| strv_contains | `strv_contains(strv: utf8, str: utf8) -> gboolean` | g_strv_contains | 2.44 | Checks if an array of strings contains the string @str according to [func@GLib.str_equal]. @strv must not be `NULL`. |
| strv_equal | `strv_equal(strv1: utf8, strv2: utf8) -> gboolean` | g_strv_equal | 2.60 | Checks if two arrays of strings contain exactly the same elements in exactly the same order. Elements are compared using [func@GLib.str_equal]. To ... |
| strv_get_type | `strv_get_type() -> GType` | g_strv_get_type |  |  |
| strv_length | `strv_length(str_array: utf8) -> guint` | g_strv_length | 2.6 | Returns the length of an array of strings. @str_array must not be `NULL`. |
| test_add_data_func | `test_add_data_func(testpath: utf8, test_data: gpointer?, test_func: TestDataFunc) -> none` | g_test_add_data_func | 2.16 | Create a new test case, similar to g_test_create_case(). However the test is assumed to use no fixture, and test suites are automatically created o... |
| test_add_data_func_full | `test_add_data_func_full(testpath: utf8, test_data: gpointer?, test_func: TestDataFunc, data_free_func: DestroyNotify) -> none` | g_test_add_data_func_full | 2.34 | Create a new test case, as with g_test_add_data_func(), but freeing @test_data after the test run is complete. |
| test_add_func | `test_add_func(testpath: utf8, test_func: TestFunc) -> none` | g_test_add_func | 2.16 | Create a new test case, similar to g_test_create_case(). However the test is assumed to use no fixture, and test suites are automatically created o... |
| test_add_vtable | `test_add_vtable(testpath: utf8, data_size: gsize, test_data: gpointer?, data_setup: TestFixtureFunc, data_test: TestFixtureFunc, data_teardown: TestFixtureFunc) -> none` | g_test_add_vtable |  |  |
| test_assert_expected_messages_internal | `test_assert_expected_messages_internal(domain: utf8, file: utf8, line: gint, func: utf8) -> none` | g_test_assert_expected_messages_internal |  |  |
| test_bug | `test_bug(bug_uri_snippet: utf8) -> none` | g_test_bug | 2.16 | This function adds a message to test reports that associates a bug URI with a test case. Bug URIs are constructed from a base URI set with g_test_b... |
| test_bug_base | `test_bug_base(uri_pattern: utf8) -> none` | g_test_bug_base | 2.16 | Specify the base URI for bug reports. The base URI is used to construct bug report messages for g_test_message() when g_test_bug() is called. Calli... |
| test_build_filename | `test_build_filename(file_type: TestFileType, first_path: utf8, ...: void) -> utf8` | g_test_build_filename | 2.38 | Creates the pathname to a data file that is required for a test. This function is conceptually similar to g_build_filename() except that the first ... |
| test_create_case | `test_create_case(test_name: utf8, data_size: gsize, test_data: gpointer?, data_setup: TestFixtureFunc, data_test: TestFixtureFunc, data_teardown: TestFixtureFunc) -> TestCase` | g_test_create_case | 2.16 | Create a new #GTestCase, named @test_name. This API is fairly low level, and calling g_test_add() or g_test_add_func() is preferable. When this tes... |
| test_create_suite | `test_create_suite(suite_name: utf8) -> TestSuite` | g_test_create_suite | 2.16 | Create a new test suite with the name @suite_name. |
| test_disable_crash_reporting | `test_disable_crash_reporting() -> none` | g_test_disable_crash_reporting | 2.78 | Attempt to disable system crash reporting infrastructure. This function should be called before exercising code paths that are expected or intended... |
| test_expect_message | `test_expect_message(log_domain: utf8?, log_level: LogLevelFlags, pattern: utf8) -> none` | g_test_expect_message | 2.34 | Indicates that a message with the given @log_domain and @log_level, with text matching @pattern, is expected to be logged. When this message is log... |
| test_fail | `test_fail() -> none` | g_test_fail | 2.30 | Indicates that a test failed. This function can be called multiple times from the same test. You can use this function if your test failed in a rec... |
| test_fail_printf | `test_fail_printf(format: utf8, ...: void) -> none` | g_test_fail_printf | 2.70 | Equivalent to g_test_fail(), but also record a message like g_test_skip_printf(). |
| test_failed | `test_failed() -> gboolean` | g_test_failed | 2.38 | Returns whether a test has already failed. This will be the case when g_test_fail(), g_test_incomplete() or g_test_skip() have been called, but als... |
| test_get_dir | `test_get_dir(file_type: TestFileType) -> filename` | g_test_get_dir | 2.38 | Gets the pathname of the directory containing test files of the type specified by @file_type. This is approximately the same as calling g_test_buil... |
| test_get_filename | `test_get_filename(file_type: TestFileType, first_path: utf8, ...: void) -> utf8` | g_test_get_filename | 2.38 | Gets the pathname to a data file that is required for a test. This is the same as g_test_build_filename() with two differences. The first differenc... |
| test_get_path | `test_get_path() -> utf8` | g_test_get_path | 2.68 | Gets the test path for the test currently being run. In essence, it will be the same string passed as the first argument to e.g. g_test_add() when ... |
| test_get_root | `test_get_root() -> TestSuite` | g_test_get_root | 2.16 | Get the toplevel test suite for the test path API. |
| test_incomplete | `test_incomplete(msg: utf8?) -> none` | g_test_incomplete | 2.38 | Indicates that a test failed because of some incomplete functionality. This function can be called multiple times from the same test. Calling this ... |
| test_incomplete_printf | `test_incomplete_printf(format: utf8, ...: void) -> none` | g_test_incomplete_printf | 2.70 | Equivalent to g_test_incomplete(), but the explanation is formatted as if by g_strdup_printf(). |
| test_init | `test_init(argc: gint, argv: utf8, ...: void) -> none` | g_test_init | 2.16 | Initialize the GLib testing framework, e.g. by seeding the test random number generator, the name for g_get_prgname() and parsing test related comm... |
| test_log_set_fatal_handler | `test_log_set_fatal_handler(log_func: TestLogFatalFunc, user_data: gpointer?) -> none` | g_test_log_set_fatal_handler | 2.22 | Installs a non-error fatal log handler which can be used to decide whether log messages which are counted as fatal abort the program. The use case ... |
| test_log_type_name | `test_log_type_name(log_type: TestLogType) -> utf8` | g_test_log_type_name |  |  |
| test_maximized_result | `test_maximized_result(maximized_quantity: gdouble, format: utf8, ...: void) -> none` | g_test_maximized_result | 2.16 | Report the result of a performance or measurement test. The test should generally strive to maximize the reported quantities (larger values are bet... |
| test_message | `test_message(format: utf8, ...: void) -> none` | g_test_message | 2.16 | Add a message to the test report. |
| test_minimized_result | `test_minimized_result(minimized_quantity: gdouble, format: utf8, ...: void) -> none` | g_test_minimized_result | 2.16 | Report the result of a performance or measurement test. The test should generally strive to minimize the reported quantities (smaller values are be... |
| test_queue_destroy | `test_queue_destroy(destroy_func: DestroyNotify, destroy_data: gpointer?) -> none` | g_test_queue_destroy | 2.16 | Enqueues a callback @destroy_func to be executed during the next test case teardown phase. This is most useful to auto destroy allocated test resou... |
| test_queue_free | `test_queue_free(gfree_pointer: gpointer?) -> none` | g_test_queue_free | 2.16 | Enqueue a pointer to be released with g_free() during the next teardown phase. This is equivalent to calling g_test_queue_destroy() with a destroy ... |
| test_rand_double | `test_rand_double() -> gdouble` | g_test_rand_double | 2.16 | Get a reproducible random floating point number, see g_test_rand_int() for details on test case random numbers. |
| test_rand_double_range | `test_rand_double_range(range_start: gdouble, range_end: gdouble) -> gdouble` | g_test_rand_double_range | 2.16 | Get a reproducible random floating pointer number out of a specified range, see g_test_rand_int() for details on test case random numbers. |
| test_rand_int | `test_rand_int() -> gint32` | g_test_rand_int | 2.16 | Get a reproducible random integer number. The random numbers generated by the g_test_rand_*() family of functions change with every new test progra... |
| test_rand_int_range | `test_rand_int_range(begin: gint32, end: gint32) -> gint32` | g_test_rand_int_range | 2.16 | Get a reproducible random integer number out of a specified range, see g_test_rand_int() for details on test case random numbers. |
| test_run | `test_run() -> gint` | g_test_run | 2.16 | Runs all tests under the toplevel suite which can be retrieved with g_test_get_root(). Similar to g_test_run_suite(), the test cases to be run are ... |
| test_run_suite | `test_run_suite(suite: TestSuite) -> gint` | g_test_run_suite | 2.16 | Execute the tests within @suite and all nested #GTestSuites. The test suites to be executed are filtered according to test path arguments (`-p test... |
| test_set_nonfatal_assertions | `test_set_nonfatal_assertions() -> none` | g_test_set_nonfatal_assertions | 2.38 | Changes the behaviour of the various `g_assert_*()` macros, g_test_assert_expected_messages() and the various `g_test_trap_assert_*()` macros to no... |
| test_skip | `test_skip(msg: utf8?) -> none` | g_test_skip | 2.38 | Indicates that a test was skipped. Calling this function will not stop the test from running, you need to return from the test function yourself. S... |
| test_skip_printf | `test_skip_printf(format: utf8, ...: void) -> none` | g_test_skip_printf | 2.70 | Equivalent to g_test_skip(), but the explanation is formatted as if by g_strdup_printf(). |
| test_subprocess | `test_subprocess() -> gboolean` | g_test_subprocess | 2.38 | Returns %TRUE (after g_test_init() has been called) if the test program is running under g_test_trap_subprocess(). |
| test_summary | `test_summary(summary: utf8) -> none` | g_test_summary | 2.62 | Set the summary for a test, which describes what the test checks, and how it goes about checking it. This may be included in test report output, an... |
| test_timer_elapsed | `test_timer_elapsed() -> gdouble` | g_test_timer_elapsed | 2.16 | Get the number of seconds since the last start of the timer with g_test_timer_start(). |
| test_timer_last | `test_timer_last() -> gdouble` | g_test_timer_last | 2.16 | Report the last result of g_test_timer_elapsed(). |
| test_timer_start | `test_timer_start() -> none` | g_test_timer_start | 2.16 | Start a timing test. Call g_test_timer_elapsed() when the task is supposed to be done. Call this function again to restart the timer. |
| test_trap_assertions | `test_trap_assertions(domain: utf8, file: utf8, line: gint, func: utf8, assertion_flags: guint64, pattern: utf8) -> none` | g_test_trap_assertions |  |  |
| test_trap_fork | `test_trap_fork(usec_timeout: guint64, test_trap_flags: TestTrapFlags) -> gboolean` | g_test_trap_fork | 2.16 | Fork the current test program to execute a test case that might not return or that might abort. If @usec_timeout is non-0, the forked test case is ... |
| test_trap_has_passed | `test_trap_has_passed() -> gboolean` | g_test_trap_has_passed | 2.16 | Check the result of the last g_test_trap_subprocess() call. |
| test_trap_reached_timeout | `test_trap_reached_timeout() -> gboolean` | g_test_trap_reached_timeout | 2.16 | Check the result of the last g_test_trap_subprocess() call. |
| test_trap_subprocess | `test_trap_subprocess(test_path: utf8?, usec_timeout: guint64, test_flags: TestSubprocessFlags) -> none` | g_test_trap_subprocess | 2.38 | Respawns the test program to run only @test_path in a subprocess. This is equivalent to calling g_test_trap_subprocess_with_envp() with `envp` set ... |
| test_trap_subprocess_with_envp | `test_trap_subprocess_with_envp(test_path: utf8?, envp: filename?, usec_timeout: guint64, test_flags: TestSubprocessFlags) -> none` | g_test_trap_subprocess_with_envp | 2.80 | Respawns the test program to run only @test_path in a subprocess with the given @envp environment. This can be used for a test case that might not ... |
| thread_create | `thread_create(func: ThreadFunc, data: gpointer?, joinable: gboolean) -> Thread throws` | g_thread_create |  | This function creates a new thread. The new thread executes the function @func with the argument @data. If the thread was created successfully, it ... |
| thread_create_full | `thread_create_full(func: ThreadFunc, data: gpointer?, stack_size: gulong, joinable: gboolean, bound: gboolean, priority: ThreadPriority) -> Thread throws` | g_thread_create_full |  | This function creates a new thread. |
| thread_error_quark | `thread_error_quark() -> Quark` | g_thread_error_quark |  |  |
| thread_exit | `thread_exit(retval: gpointer?) -> none` | g_thread_exit |  | Terminates the current thread. If another thread is waiting for us using g_thread_join() then the waiting thread will be woken up and get @retval a... |
| thread_foreach | `thread_foreach(thread_func: Func, user_data: gpointer?) -> none` | g_thread_foreach | 2.10 | Call @thread_func on all #GThreads that have been created with g_thread_create(). Note that threads may decide to exit while @thread_func is runnin... |
| thread_get_initialized | `thread_get_initialized() -> gboolean` | g_thread_get_initialized | 2.20 | Indicates if g_thread_init() has been called. |
| thread_init | `thread_init(vtable: gpointer?) -> none` | g_thread_init |  | If you use GLib from more than one thread, you must initialize the thread system by calling g_thread_init(). Since version 2.24, calling g_thread_i... |
| thread_init_with_errorcheck_mutexes | `thread_init_with_errorcheck_mutexes(vtable: gpointer?) -> none` | g_thread_init_with_errorcheck_mutexes |  |  |
| thread_pool_get_max_idle_time | `thread_pool_get_max_idle_time() -> guint` | g_thread_pool_get_max_idle_time | 2.10 | This function will return the maximum @interval that a thread will wait in the thread pool for new tasks before being stopped. If this function ret... |
| thread_pool_get_max_unused_threads | `thread_pool_get_max_unused_threads() -> gint` | g_thread_pool_get_max_unused_threads |  | Returns the maximal allowed number of unused threads. |
| thread_pool_get_num_unused_threads | `thread_pool_get_num_unused_threads() -> guint` | g_thread_pool_get_num_unused_threads |  | Returns the number of currently unused threads. |
| thread_pool_set_max_idle_time | `thread_pool_set_max_idle_time(interval: guint) -> none` | g_thread_pool_set_max_idle_time | 2.10 | This function will set the maximum @interval that a thread waiting in the pool for new tasks can be idle for before being stopped. This function is... |
| thread_pool_set_max_unused_threads | `thread_pool_set_max_unused_threads(max_threads: gint) -> none` | g_thread_pool_set_max_unused_threads |  | Sets the maximal number of unused threads to @max_threads. If @max_threads is -1, no limit is imposed on the number of unused threads. The default ... |
| thread_pool_stop_unused_threads | `thread_pool_stop_unused_threads() -> none` | g_thread_pool_stop_unused_threads |  | Stops all currently unused threads. This does not change the maximal number of unused threads. This function can be used to regularly stop all unus... |
| thread_self | `thread_self() -> Thread` | g_thread_self |  | This function returns the #GThread corresponding to the current thread. Note that this function does not increase the reference count of the return... |
| thread_yield | `thread_yield() -> none` | g_thread_yield |  | Causes the calling thread to voluntarily relinquish the CPU, so that other threads can run. This function is often used as a method to make busy wa... |
| time_val_from_iso8601 | `time_val_from_iso8601(iso_date: utf8, time_: out TimeVal) -> gboolean` | g_time_val_from_iso8601 | 2.12 | Converts a string containing an ISO 8601 encoded date and time to a #GTimeVal and puts it into @time_. @iso_date must include year, month, day, hou... |
| timeout_add | `timeout_add(interval: guint, function: SourceFunc, data: gpointer?) -> guint` | g_timeout_add |  | Sets a function to be called at regular intervals, with the default priority, %G_PRIORITY_DEFAULT. The given @function is called repeatedly until i... |
| timeout_add_full | `timeout_add_full(priority: gint, interval: guint, function: SourceFunc, data: gpointer?, notify: DestroyNotify?) -> guint` | g_timeout_add_full |  | Sets a function to be called at regular intervals, with the given priority. The function is called repeatedly until it returns %FALSE, at which poi... |
| timeout_add_once | `timeout_add_once(interval: guint, function: SourceOnceFunc, data: gpointer?) -> guint` | g_timeout_add_once | 2.74 | Sets a function to be called after @interval milliseconds have elapsed, with the default priority, %G_PRIORITY_DEFAULT. The given @function is call... |
| timeout_add_seconds | `timeout_add_seconds(interval: guint, function: SourceFunc, data: gpointer?) -> guint` | g_timeout_add_seconds | 2.14 | Sets a function to be called at regular intervals with the default priority, %G_PRIORITY_DEFAULT. The function is called repeatedly until it return... |
| timeout_add_seconds_full | `timeout_add_seconds_full(priority: gint, interval: guint, function: SourceFunc, data: gpointer?, notify: DestroyNotify?) -> guint` | g_timeout_add_seconds_full | 2.14 | Sets a function to be called at regular intervals, with @priority. The function is called repeatedly until it returns %G_SOURCE_REMOVE or %FALSE, a... |
| timeout_add_seconds_once | `timeout_add_seconds_once(interval: guint, function: SourceOnceFunc, data: gpointer?) -> guint` | g_timeout_add_seconds_once | 2.78 | This function behaves like g_timeout_add_once() but with a range in seconds. |
| timeout_source_new | `timeout_source_new(interval: guint) -> Source` | g_timeout_source_new |  | Creates a new timeout source. The source will not initially be associated with any #GMainContext and must be added to one with g_source_attach() be... |
| timeout_source_new_seconds | `timeout_source_new_seconds(interval: guint) -> Source` | g_timeout_source_new_seconds | 2.14 | Creates a new timeout source. The source will not initially be associated with any #GMainContext and must be added to one with g_source_attach() be... |
| trash_stack_height | `trash_stack_height(stack_p: TrashStack) -> guint` | g_trash_stack_height |  | Returns the height of a #GTrashStack. Note that execution of this function is of O(N) complexity where N denotes the number of items on the stack. |
| trash_stack_peek | `trash_stack_peek(stack_p: TrashStack) -> gpointer` | g_trash_stack_peek |  | Returns the element at the top of a #GTrashStack which may be %NULL. |
| trash_stack_pop | `trash_stack_pop(stack_p: TrashStack) -> gpointer` | g_trash_stack_pop |  | Pops a piece of memory off a #GTrashStack. |
| trash_stack_push | `trash_stack_push(stack_p: TrashStack, data_p: gpointer) -> none` | g_trash_stack_push |  | Pushes a piece of memory onto a #GTrashStack. |
| try_malloc | `try_malloc(n_bytes: gsize) -> gpointer` | g_try_malloc |  | Attempts to allocate @n_bytes, and returns %NULL on failure. Contrast with g_malloc(), which aborts the program on failure. |
| try_malloc0 | `try_malloc0(n_bytes: gsize) -> gpointer` | g_try_malloc0 | 2.8 | Attempts to allocate @n_bytes, initialized to 0's, and returns %NULL on failure. Contrast with g_malloc0(), which aborts the program on failure. |
| try_malloc0_n | `try_malloc0_n(n_blocks: gsize, n_block_bytes: gsize) -> gpointer` | g_try_malloc0_n | 2.24 | This function is similar to g_try_malloc0(), allocating (@n_blocks * @n_block_bytes) bytes, but care is taken to detect possible overflow during mu... |
| try_malloc_n | `try_malloc_n(n_blocks: gsize, n_block_bytes: gsize) -> gpointer` | g_try_malloc_n | 2.24 | This function is similar to g_try_malloc(), allocating (@n_blocks * @n_block_bytes) bytes, but care is taken to detect possible overflow during mul... |
| try_realloc | `try_realloc(mem: gpointer?, n_bytes: gsize) -> gpointer` | g_try_realloc |  | Attempts to realloc @mem to a new size, @n_bytes, and returns %NULL on failure. Contrast with g_realloc(), which aborts the program on failure. If ... |
| try_realloc_n | `try_realloc_n(mem: gpointer?, n_blocks: gsize, n_block_bytes: gsize) -> gpointer` | g_try_realloc_n | 2.24 | This function is similar to g_try_realloc(), allocating (@n_blocks * @n_block_bytes) bytes, but care is taken to detect possible overflow during mu... |
| ucs4_to_utf16 | `ucs4_to_utf16(str: gunichar, len: glong, items_read: out glong?, items_written: out glong?) -> guint16 throws` | g_ucs4_to_utf16 |  | Convert a string from UCS-4 to UTF-16. A 0 character will be added to the result after the converted text. |
| ucs4_to_utf8 | `ucs4_to_utf8(str: gunichar, len: glong, items_read: out glong?, items_written: out glong?) -> utf8 throws` | g_ucs4_to_utf8 |  | Convert a string from a 32-bit fixed width representation as UCS-4. to UTF-8. The result will be terminated with a 0 byte. |
| unichar_break_type | `unichar_break_type(c: gunichar) -> UnicodeBreakType` | g_unichar_break_type |  | Determines the break type of @c. @c should be a Unicode character (to derive a character from UTF-8 encoded text, use g_utf8_get_char()). The break... |
| unichar_combining_class | `unichar_combining_class(uc: gunichar) -> gint` | g_unichar_combining_class | 2.14 | Determines the canonical combining class of a Unicode character. |
| unichar_compose | `unichar_compose(a: gunichar, b: gunichar, ch: out gunichar) -> gboolean` | g_unichar_compose | 2.30 | Performs a single composition step of the Unicode canonical composition algorithm. This function includes algorithmic Hangul Jamo composition, but ... |
| unichar_decompose | `unichar_decompose(ch: gunichar, a: out gunichar, b: out gunichar) -> gboolean` | g_unichar_decompose | 2.30 | Performs a single decomposition step of the Unicode canonical decomposition algorithm. This function does not include compatibility decompositions.... |
| unichar_digit_value | `unichar_digit_value(c: gunichar) -> gint` | g_unichar_digit_value |  | Determines the numeric value of a character as a decimal digit. |
| unichar_fully_decompose | `unichar_fully_decompose(ch: gunichar, compat: gboolean, result: out gunichar?, result_len: gsize) -> gsize` | g_unichar_fully_decompose | 2.30 | Computes the canonical or compatibility decomposition of a Unicode character. For compatibility decomposition, pass %TRUE for @compat; for canonica... |
| unichar_get_mirror_char | `unichar_get_mirror_char(ch: gunichar, mirrored_ch: out gunichar) -> gboolean` | g_unichar_get_mirror_char | 2.4 | In Unicode, some characters are "mirrored". This means that their images are mirrored horizontally in text that is laid out from right to left. For... |
| unichar_get_script | `unichar_get_script(ch: gunichar) -> UnicodeScript` | g_unichar_get_script | 2.14 | Looks up the #GUnicodeScript for a particular character (as defined by Unicode Standard Annex \#24). No check is made for @ch being a valid Unicode... |
| unichar_isalnum | `unichar_isalnum(c: gunichar) -> gboolean` | g_unichar_isalnum |  | Determines whether a character is alphanumeric. Given some UTF-8 text, obtain a character value with g_utf8_get_char(). |
| unichar_isalpha | `unichar_isalpha(c: gunichar) -> gboolean` | g_unichar_isalpha |  | Determines whether a character is alphabetic (i.e. a letter). Given some UTF-8 text, obtain a character value with g_utf8_get_char(). |
| unichar_iscntrl | `unichar_iscntrl(c: gunichar) -> gboolean` | g_unichar_iscntrl |  | Determines whether a character is a control character. Given some UTF-8 text, obtain a character value with g_utf8_get_char(). |
| unichar_isdefined | `unichar_isdefined(c: gunichar) -> gboolean` | g_unichar_isdefined |  | Determines if a given character is assigned in the Unicode standard. |
| unichar_isdigit | `unichar_isdigit(c: gunichar) -> gboolean` | g_unichar_isdigit |  | Determines whether a character is numeric (i.e. a digit). This covers ASCII 0-9 and also digits in other languages/scripts. Given some UTF-8 text, ... |
| unichar_isgraph | `unichar_isgraph(c: gunichar) -> gboolean` | g_unichar_isgraph |  | Determines whether a character is printable and not a space (returns %FALSE for control characters, format characters, and spaces). g_unichar_ispri... |
| unichar_islower | `unichar_islower(c: gunichar) -> gboolean` | g_unichar_islower |  | Determines whether a character is a lowercase letter. Given some UTF-8 text, obtain a character value with g_utf8_get_char(). |
| unichar_ismark | `unichar_ismark(c: gunichar) -> gboolean` | g_unichar_ismark | 2.14 | Determines whether a character is a mark (non-spacing mark, combining mark, or enclosing mark in Unicode speak). Given some UTF-8 text, obtain a ch... |
| unichar_isprint | `unichar_isprint(c: gunichar) -> gboolean` | g_unichar_isprint |  | Determines whether a character is printable. Unlike g_unichar_isgraph(), returns %TRUE for spaces. Given some UTF-8 text, obtain a character value ... |
| unichar_ispunct | `unichar_ispunct(c: gunichar) -> gboolean` | g_unichar_ispunct |  | Determines whether a character is punctuation or a symbol. Given some UTF-8 text, obtain a character value with g_utf8_get_char(). |
| unichar_isspace | `unichar_isspace(c: gunichar) -> gboolean` | g_unichar_isspace |  | Determines whether a character is a space, tab, or line separator (newline, carriage return, etc.). Given some UTF-8 text, obtain a character value... |
| unichar_istitle | `unichar_istitle(c: gunichar) -> gboolean` | g_unichar_istitle |  | Determines if a character is titlecase. Some characters in Unicode which are composites, such as the DZ digraph have three case variants instead of... |
| unichar_isupper | `unichar_isupper(c: gunichar) -> gboolean` | g_unichar_isupper |  | Determines if a character is uppercase. |
| unichar_iswide | `unichar_iswide(c: gunichar) -> gboolean` | g_unichar_iswide |  | Determines if a character is typically rendered in a double-width cell. |
| unichar_iswide_cjk | `unichar_iswide_cjk(c: gunichar) -> gboolean` | g_unichar_iswide_cjk | 2.12 | Determines if a character is typically rendered in a double-width cell under legacy East Asian locales. If a character is wide according to g_unich... |
| unichar_isxdigit | `unichar_isxdigit(c: gunichar) -> gboolean` | g_unichar_isxdigit |  | Determines if a character is a hexadecimal digit. |
| unichar_iszerowidth | `unichar_iszerowidth(c: gunichar) -> gboolean` | g_unichar_iszerowidth | 2.14 | Determines if a given character typically takes zero width when rendered. The return value is %TRUE for all non-spacing and enclosing marks (e.g., ... |
| unichar_to_utf8 | `unichar_to_utf8(c: gunichar, outbuf: out utf8?) -> gint` | g_unichar_to_utf8 |  | Converts a single character to UTF-8. |
| unichar_tolower | `unichar_tolower(c: gunichar) -> gunichar` | g_unichar_tolower |  | Converts a character to lower case. |
| unichar_totitle | `unichar_totitle(c: gunichar) -> gunichar` | g_unichar_totitle |  | Converts a character to the titlecase. |
| unichar_toupper | `unichar_toupper(c: gunichar) -> gunichar` | g_unichar_toupper |  | Converts a character to uppercase. |
| unichar_type | `unichar_type(c: gunichar) -> UnicodeType` | g_unichar_type |  | Classifies a Unicode character by type. |
| unichar_validate | `unichar_validate(ch: gunichar) -> gboolean` | g_unichar_validate |  | Checks whether @ch is a valid Unicode character. Some possible integer values of @ch will not be valid. 0 is considered a valid character, though i... |
| unichar_xdigit_value | `unichar_xdigit_value(c: gunichar) -> gint` | g_unichar_xdigit_value |  | Determines the numeric value of a character as a hexadecimal digit. |
| unicode_canonical_decomposition | `unicode_canonical_decomposition(ch: gunichar, result_len: gsize) -> gunichar` | g_unicode_canonical_decomposition |  | Computes the canonical decomposition of a Unicode character. |
| unicode_canonical_ordering | `unicode_canonical_ordering(string: gunichar, len: gsize) -> none` | g_unicode_canonical_ordering |  | Computes the canonical ordering of a string in-place. This rearranges decomposed characters in the string according to their combining classes. See... |
| unicode_script_from_iso15924 | `unicode_script_from_iso15924(iso15924: guint32) -> UnicodeScript` | g_unicode_script_from_iso15924 | 2.30 | Looks up the Unicode script for @iso15924. ISO 15924 assigns four-letter codes to scripts. For example, the code for Arabic is 'Arab'. This functio... |
| unicode_script_to_iso15924 | `unicode_script_to_iso15924(script: UnicodeScript) -> guint32` | g_unicode_script_to_iso15924 | 2.30 | Looks up the ISO 15924 code for @script. ISO 15924 assigns four-letter codes to scripts. For example, the code for Arabic is 'Arab'. The four lette... |
| unix_error_quark | `unix_error_quark() -> Quark` | g_unix_error_quark |  |  |
| unix_fd_add | `unix_fd_add(fd: gint, condition: IOCondition, function: UnixFDSourceFunc, user_data: gpointer?) -> guint` | g_unix_fd_add | 2.36 | Sets a function to be called when the IO condition, as specified by @condition becomes true for @fd. @function will be called when the specified IO... |
| unix_fd_add_full | `unix_fd_add_full(priority: gint, fd: gint, condition: IOCondition, function: UnixFDSourceFunc, user_data: gpointer?, notify: DestroyNotify) -> guint` | g_unix_fd_add_full | 2.36 | Sets a function to be called when the IO condition, as specified by @condition becomes true for @fd. This is the same as g_unix_fd_add(), except th... |
| unix_fd_source_new | `unix_fd_source_new(fd: gint, condition: IOCondition) -> Source` | g_unix_fd_source_new | 2.36 | Creates a #GSource to watch for a particular I/O condition on a file descriptor. The source will never close the @fd ??? you must do it yourself. A... |
| unix_get_passwd_entry | `unix_get_passwd_entry(user_name: utf8) -> gpointer throws` | g_unix_get_passwd_entry | 2.64 | Get the `passwd` file entry for the given @user_name using `getpwnam_r()`. This can fail if the given @user_name doesn???t exist. The returned `str... |
| unix_open_pipe | `unix_open_pipe(fds: gint, flags: gint) -> gboolean throws` | g_unix_open_pipe | 2.30 | Similar to the UNIX pipe() call, but on modern systems like Linux uses the pipe2() system call, which atomically creates a pipe with the configured... |
| unix_set_fd_nonblocking | `unix_set_fd_nonblocking(fd: gint, nonblock: gboolean) -> gboolean throws` | g_unix_set_fd_nonblocking | 2.30 | Control the non-blocking state of the given file descriptor, according to @nonblock. On most systems this uses %O_NONBLOCK, but on some older ones ... |
| unix_signal_add | `unix_signal_add(signum: gint, handler: SourceFunc, user_data: gpointer?) -> guint` | g_unix_signal_add | 2.30 | A convenience function for g_unix_signal_source_new(), which attaches to the default #GMainContext. You can remove the watch using g_source_remove(). |
| unix_signal_add_full | `unix_signal_add_full(priority: gint, signum: gint, handler: SourceFunc, user_data: gpointer?, notify: DestroyNotify) -> guint` | g_unix_signal_add_full | 2.30 | A convenience function for g_unix_signal_source_new(), which attaches to the default #GMainContext. You can remove the watch using g_source_remove(). |
| unix_signal_source_new | `unix_signal_source_new(signum: gint) -> Source` | g_unix_signal_source_new | 2.30 | Create a #GSource that will be dispatched upon delivery of the UNIX signal @signum. In GLib versions before 2.36, only `SIGHUP`, `SIGINT`, `SIGTERM... |
| unlink | `unlink(filename: filename) -> gint` | g_unlink | 2.6 | A wrapper for the POSIX unlink() function. The unlink() function deletes a name from the filesystem. If this was the last link to the file and no p... |
| unsetenv | `unsetenv(variable: filename) -> none` | g_unsetenv | 2.4 | Removes an environment variable from the environment. Note that on some systems, when variables are overwritten, the memory used for the previous v... |
| uri_build | `uri_build(flags: UriFlags, scheme: utf8, userinfo: utf8?, host: utf8?, port: gint, path: utf8, query: utf8?, fragment: utf8?) -> Uri` | g_uri_build | 2.66 | Creates a new #GUri from the given components according to @flags. See also g_uri_build_with_user(), which allows specifying the components of the ... |
| uri_build_with_user | `uri_build_with_user(flags: UriFlags, scheme: utf8, user: utf8?, password: utf8?, auth_params: utf8?, host: utf8?, port: gint, path: utf8, query: utf8?, fragment: utf8?) -> Uri` | g_uri_build_with_user | 2.66 | Creates a new #GUri from the given components according to @flags (%G_URI_FLAGS_HAS_PASSWORD is added unconditionally). The @flags must be coherent... |
| uri_error_quark | `uri_error_quark() -> Quark` | g_uri_error_quark |  |  |
| uri_escape_bytes | `uri_escape_bytes(unescaped: guint8, length: gsize, reserved_chars_allowed: utf8?) -> utf8` | g_uri_escape_bytes | 2.66 | Escapes arbitrary data for use in a URI. Normally all characters that are not ???unreserved??? (i.e. ASCII alphanumerical characters plus dash, dot... |
| uri_escape_string | `uri_escape_string(unescaped: utf8, reserved_chars_allowed: utf8?, allow_utf8: gboolean) -> utf8` | g_uri_escape_string | 2.16 | Escapes a string for use in a URI. Normally all characters that are not "unreserved" (i.e. ASCII alphanumerical characters plus dash, dot, undersco... |
| uri_is_valid | `uri_is_valid(uri_string: utf8, flags: UriFlags) -> gboolean throws` | g_uri_is_valid | 2.66 | Parses @uri_string according to @flags, to determine whether it is a valid absolute URI, i.e. it does not need to be resolved relative to another U... |
| uri_join | `uri_join(flags: UriFlags, scheme: utf8?, userinfo: utf8?, host: utf8?, port: gint, path: utf8, query: utf8?, fragment: utf8?) -> utf8` | g_uri_join | 2.66 | Joins the given components together according to @flags to create an absolute URI string. @path may not be %NULL (though it may be the empty string... |
| uri_join_with_user | `uri_join_with_user(flags: UriFlags, scheme: utf8?, user: utf8?, password: utf8?, auth_params: utf8?, host: utf8?, port: gint, path: utf8, query: utf8?, fragment: utf8?) -> utf8` | g_uri_join_with_user | 2.66 | Joins the given components together according to @flags to create an absolute URI string. @path may not be %NULL (though it may be the empty string... |
| uri_list_extract_uris | `uri_list_extract_uris(uri_list: utf8) -> utf8` | g_uri_list_extract_uris | 2.6 | Splits an URI list conforming to the text/uri-list mime type defined in RFC 2483 into individual URIs, discarding any comments. The URIs are not va... |
| uri_parse | `uri_parse(uri_string: utf8, flags: UriFlags) -> Uri throws` | g_uri_parse | 2.66 | Parses @uri_string according to @flags. If the result is not a valid absolute URI, it will be discarded, and an error returned. |
| uri_parse_params | `uri_parse_params(params: utf8, length: gssize, separators: utf8, flags: UriParamsFlags) -> GLib.HashTable throws` | g_uri_parse_params | 2.66 | Many URI schemes include one or more attribute/value pairs as part of the URI value. This method can be used to parse them into a hash table. When ... |
| uri_parse_scheme | `uri_parse_scheme(uri: utf8) -> utf8` | g_uri_parse_scheme | 2.16 | Gets the scheme portion of a URI string. RFC 3986 decodes the scheme as: \|[ URI = scheme ":" hier-part [ "?" query ] [ "#" fragment ] ]\| Common sch... |
| uri_peek_scheme | `uri_peek_scheme(uri: utf8) -> utf8` | g_uri_peek_scheme | 2.66 | Gets the scheme portion of a URI string. RFC 3986 decodes the scheme as: \|[ URI = scheme ":" hier-part [ "?" query ] [ "#" fragment ] ]\| Common sch... |
| uri_resolve_relative | `uri_resolve_relative(base_uri_string: utf8?, uri_ref: utf8, flags: UriFlags) -> utf8 throws` | g_uri_resolve_relative | 2.66 | Parses @uri_ref according to @flags and, if it is a relative URI, resolves it relative to @base_uri_string. If the result is not a valid absolute U... |
| uri_split | `uri_split(uri_ref: utf8, flags: UriFlags, scheme: out utf8?, userinfo: out utf8?, host: out utf8?, port: out gint?, path: out utf8?, query: out utf8?, fragment: out utf8?) -> gboolean throws` | g_uri_split | 2.66 | Parses @uri_ref (which can be an absolute or relative URI) according to @flags, and returns the pieces. Any component that doesn't appear in @uri_r... |
| uri_split_network | `uri_split_network(uri_string: utf8, flags: UriFlags, scheme: out utf8?, host: out utf8?, port: out gint?) -> gboolean throws` | g_uri_split_network | 2.66 | Parses @uri_string (which must be an absolute URI) according to @flags, and returns the pieces relevant to connecting to a host. See the documentat... |
| uri_split_with_user | `uri_split_with_user(uri_ref: utf8, flags: UriFlags, scheme: out utf8?, user: out utf8?, password: out utf8?, auth_params: out utf8?, host: out utf8?, port: out gint?, path: out utf8?, query: out utf8?, fragment: out utf8?) -> gboolean throws` | g_uri_split_with_user | 2.66 | Parses @uri_ref (which can be an absolute or relative URI) according to @flags, and returns the pieces. Any component that doesn't appear in @uri_r... |
| uri_unescape_bytes | `uri_unescape_bytes(escaped_string: utf8, length: gssize, illegal_characters: utf8?) -> Bytes throws` | g_uri_unescape_bytes | 2.66 | Unescapes a segment of an escaped string as binary data. Note that in contrast to g_uri_unescape_string(), this does allow nul bytes to appear in t... |
| uri_unescape_segment | `uri_unescape_segment(escaped_string: utf8?, escaped_string_end: utf8?, illegal_characters: utf8?) -> utf8` | g_uri_unescape_segment | 2.16 | Unescapes a segment of an escaped string. If any of the characters in @illegal_characters or the NUL character appears as an escaped character in @... |
| uri_unescape_string | `uri_unescape_string(escaped_string: utf8, illegal_characters: utf8?) -> utf8` | g_uri_unescape_string | 2.16 | Unescapes a whole escaped string. If any of the characters in @illegal_characters or the NUL character appears as an escaped character in @escaped_... |
| usleep | `usleep(microseconds: gulong) -> none` | g_usleep |  | Pauses the current thread for the given number of microseconds. There are 1 million microseconds per second (represented by the %G_USEC_PER_SEC mac... |
| utf16_to_ucs4 | `utf16_to_ucs4(str: guint16, len: glong, items_read: out glong?, items_written: out glong?) -> gunichar throws` | g_utf16_to_ucs4 |  | Convert a string from UTF-16 to UCS-4. The result will be nul-terminated. |
| utf16_to_utf8 | `utf16_to_utf8(str: guint16, len: glong, items_read: out glong?, items_written: out glong?) -> utf8 throws` | g_utf16_to_utf8 |  | Convert a string from UTF-16 to UTF-8. The result will be terminated with a 0 byte. Note that the input is expected to be already in native endiann... |
| utf8_casefold | `utf8_casefold(str: utf8, len: gssize) -> utf8` | g_utf8_casefold |  | Converts a string into a form that is independent of case. The result will not correspond to any particular case, but can be compared for equality ... |
| utf8_collate | `utf8_collate(str1: utf8, str2: utf8) -> gint` | g_utf8_collate |  | Compares two strings for ordering using the linguistically correct rules for the [current locale][setlocale]. When sorting a large number of string... |
| utf8_collate_key | `utf8_collate_key(str: utf8, len: gssize) -> utf8` | g_utf8_collate_key |  | Converts a string into a collation key that can be compared with other collation keys produced by the same function using strcmp(). The results of ... |
| utf8_collate_key_for_filename | `utf8_collate_key_for_filename(str: utf8, len: gssize) -> utf8` | g_utf8_collate_key_for_filename | 2.8 | Converts a string into a collation key that can be compared with other collation keys produced by the same function using strcmp(). In order to sor... |
| utf8_find_next_char | `utf8_find_next_char(p: utf8, end: utf8?) -> utf8` | g_utf8_find_next_char |  | Finds the start of the next UTF-8 character in the string after @p. @p does not have to be at the beginning of a UTF-8 character. No check is made ... |
| utf8_find_prev_char | `utf8_find_prev_char(str: utf8, p: utf8) -> utf8` | g_utf8_find_prev_char |  | Given a position @p with a UTF-8 encoded string @str, find the start of the previous UTF-8 character starting before @p. Returns %NULL if no UTF-8 ... |
| utf8_get_char | `utf8_get_char(p: utf8) -> gunichar` | g_utf8_get_char |  | Converts a sequence of bytes encoded as UTF-8 to a Unicode character. If @p does not point to a valid UTF-8 encoded character, results are undefine... |
| utf8_get_char_validated | `utf8_get_char_validated(p: utf8, max_len: gssize) -> gunichar` | g_utf8_get_char_validated |  | Convert a sequence of bytes encoded as UTF-8 to a Unicode character. This function checks for incomplete characters, for invalid characters such as... |
| utf8_make_valid | `utf8_make_valid(str: utf8, len: gssize) -> utf8` | g_utf8_make_valid | 2.52 | If the provided string is valid UTF-8, return a copy of it. If not, return a copy in which bytes that could not be interpreted as valid Unicode are... |
| utf8_normalize | `utf8_normalize(str: utf8, len: gssize, mode: NormalizeMode) -> utf8` | g_utf8_normalize |  | Converts a string into canonical form, standardizing such issues as whether a character with an accent is represented as a base character and combi... |
| utf8_offset_to_pointer | `utf8_offset_to_pointer(str: utf8, offset: glong) -> utf8` | g_utf8_offset_to_pointer |  | Converts from an integer character offset to a pointer to a position within the string. Since 2.10, this function allows to pass a negative @offset... |
| utf8_pointer_to_offset | `utf8_pointer_to_offset(str: utf8, pos: utf8) -> glong` | g_utf8_pointer_to_offset |  | Converts from a pointer to position within a string to an integer character offset. Since 2.10, this function allows @pos to be before @str, and re... |
| utf8_prev_char | `utf8_prev_char(p: utf8) -> utf8` | g_utf8_prev_char |  | Finds the previous UTF-8 character in the string before @p. @p does not have to be at the beginning of a UTF-8 character. No check is made to see i... |
| utf8_strchr | `utf8_strchr(p: utf8, len: gssize, c: gunichar) -> utf8` | g_utf8_strchr |  | Finds the leftmost occurrence of the given Unicode character in a UTF-8 encoded string, while limiting the search to @len bytes. If @len is -1, all... |
| utf8_strdown | `utf8_strdown(str: utf8, len: gssize) -> utf8` | g_utf8_strdown |  | Converts all Unicode characters in the string that have a case to lowercase. The exact manner that this is done depends on the current locale, and ... |
| utf8_strlen | `utf8_strlen(p: utf8, max: gssize) -> glong` | g_utf8_strlen |  | Computes the length of the string in characters, not including the terminating nul character. If the @max'th byte falls in the middle of a characte... |
| utf8_strncpy | `utf8_strncpy(dest: utf8, src: utf8, n: gsize) -> utf8` | g_utf8_strncpy |  | Like the standard C strncpy() function, but copies a given number of characters instead of a given number of bytes. The @src string must be valid U... |
| utf8_strrchr | `utf8_strrchr(p: utf8, len: gssize, c: gunichar) -> utf8` | g_utf8_strrchr |  | Find the rightmost occurrence of the given Unicode character in a UTF-8 encoded string, while limiting the search to @len bytes. If @len is -1, all... |
| utf8_strreverse | `utf8_strreverse(str: utf8, len: gssize) -> utf8` | g_utf8_strreverse | 2.2 | Reverses a UTF-8 string. @str must be valid UTF-8 encoded text. (Use g_utf8_validate() on all text before trying to use UTF-8 utility functions wit... |
| utf8_strup | `utf8_strup(str: utf8, len: gssize) -> utf8` | g_utf8_strup |  | Converts all Unicode characters in the string that have a case to uppercase. The exact manner that this is done depends on the current locale, and ... |
| utf8_substring | `utf8_substring(str: utf8, start_pos: glong, end_pos: glong) -> utf8` | g_utf8_substring | 2.30 | Copies a substring out of a UTF-8 encoded string. The substring will contain @end_pos - @start_pos characters. Since GLib 2.72, `-1` can be passed ... |
| utf8_to_ucs4 | `utf8_to_ucs4(str: utf8, len: glong, items_read: out glong?, items_written: out glong?) -> gunichar throws` | g_utf8_to_ucs4 |  | Convert a string from UTF-8 to a 32-bit fixed width representation as UCS-4. A trailing 0 character will be added to the string after the converted... |
| utf8_to_ucs4_fast | `utf8_to_ucs4_fast(str: utf8, len: glong, items_written: out glong?) -> gunichar` | g_utf8_to_ucs4_fast |  | Convert a string from UTF-8 to a 32-bit fixed width representation as UCS-4, assuming valid UTF-8 input. This function is roughly twice as fast as ... |
| utf8_to_utf16 | `utf8_to_utf16(str: utf8, len: glong, items_read: out glong?, items_written: out glong?) -> guint16 throws` | g_utf8_to_utf16 |  | Convert a string from UTF-8 to UTF-16. A 0 character will be added to the result after the converted text. |
| utf8_truncate_middle | `utf8_truncate_middle(string: utf8, truncate_length: gsize) -> utf8` | g_utf8_truncate_middle | 2.78 | Cuts off the middle of the string, preserving half of @truncate_length characters at the beginning and half at the end. If @string is already short... |
| utf8_validate | `utf8_validate(str: guint8, max_len: gssize, end: out utf8?) -> gboolean` | g_utf8_validate |  | Validates UTF-8 encoded text. @str is the text to validate; if @str is nul-terminated, then @max_len can be -1, otherwise @max_len should be the nu... |
| utf8_validate_len | `utf8_validate_len(str: guint8, max_len: gsize, end: out utf8?) -> gboolean` | g_utf8_validate_len | 2.60 | Validates UTF-8 encoded text. As with g_utf8_validate(), but @max_len must be set, and hence this function will always return %FALSE if any of the ... |
| utime | `utime(filename: filename, utb: gpointer?) -> gint` | g_utime | 2.18 | A wrapper for the POSIX utime() function. The utime() function sets the access and modification timestamps of a file. See your C library manual for... |
| uuid_string_is_valid | `uuid_string_is_valid(str: utf8) -> gboolean` | g_uuid_string_is_valid | 2.52 | Parses the string @str and verify if it is a UUID. The function accepts the following syntax: - simple forms (e.g. `f81d4fae-7dec-11d0-a765-00a0c91... |
| uuid_string_random | `uuid_string_random() -> utf8` | g_uuid_string_random | 2.52 | Generates a random UUID (RFC 4122 version 4) as a string. It has the same randomness guarantees as #GRand, so must not be used for cryptographic pu... |
| variant_get_gtype | `variant_get_gtype() -> GType` | g_variant_get_gtype |  |  |
| variant_is_object_path | `variant_is_object_path(string: utf8) -> gboolean` | g_variant_is_object_path | 2.24 | Determines if a given string is a valid D-Bus object path. You should ensure that a string is a valid D-Bus object path before passing it to g_vari... |
| variant_is_signature | `variant_is_signature(string: utf8) -> gboolean` | g_variant_is_signature | 2.24 | Determines if a given string is a valid D-Bus type signature. You should ensure that a string is a valid D-Bus type signature before passing it to ... |
| variant_parse | `variant_parse(type: VariantType?, text: utf8, limit: utf8?, endptr: utf8?) -> Variant throws` | g_variant_parse |  | Parses a #GVariant from a text representation. A single #GVariant is parsed from the content of @text. The format is described here. The memory at ... |
| variant_parse_error_print_context | `variant_parse_error_print_context(error: Error, source_str: utf8) -> utf8` | g_variant_parse_error_print_context | 2.40 | Pretty-prints a message showing the context of a #GVariant parse error within the string for which parsing was attempted. The resulting string is s... |
| variant_parse_error_quark | `variant_parse_error_quark() -> Quark` | g_variant_parse_error_quark |  |  |
| variant_parser_get_error_quark | `variant_parser_get_error_quark() -> Quark` | g_variant_parser_get_error_quark |  | Same as g_variant_error_quark(). |
| variant_type_checked_ | `variant_type_checked_(type_string: utf8) -> VariantType` | g_variant_type_checked_ |  |  |
| variant_type_string_get_depth_ | `variant_type_string_get_depth_(type_string: utf8) -> gsize` | g_variant_type_string_get_depth_ |  |  |
| variant_type_string_is_valid | `variant_type_string_is_valid(type_string: utf8) -> gboolean` | g_variant_type_string_is_valid |  | Checks if @type_string is a valid GVariant type string. This call is equivalent to calling g_variant_type_string_scan() and confirming that the fol... |
| variant_type_string_scan | `variant_type_string_scan(string: utf8, limit: utf8?, endptr: out utf8?) -> gboolean` | g_variant_type_string_scan | 2.24 | Scan for a single complete and valid GVariant type string in @string. The memory pointed to by @limit (or bytes beyond it) is never accessed. If a ... |
| vasprintf | `vasprintf(string: out utf8, format: utf8, args: va_list) -> gint` | g_vasprintf | 2.4 | An implementation of the GNU `vasprintf()` function which supports positional parameters, as specified in the Single Unix Specification. This funct... |
| vfprintf | `vfprintf(file: gpointer, format: utf8, args: va_list) -> gint` | g_vfprintf | 2.2 | An implementation of the standard `fprintf()` function which supports positional parameters, as specified in the Single Unix Specification. `glib/g... |
| vprintf | `vprintf(format: utf8, args: va_list) -> gint` | g_vprintf | 2.2 | An implementation of the standard `vprintf()` function which supports positional parameters, as specified in the Single Unix Specification. `glib/g... |
| vsnprintf | `vsnprintf(string: utf8, n: gulong, format: utf8, args: va_list) -> gint` | g_vsnprintf |  | A safer form of the standard `vsprintf()` function. The output is guaranteed to not exceed @n characters (including the terminating nul character),... |
| vsprintf | `vsprintf(string: utf8, format: utf8, args: va_list) -> gint` | g_vsprintf | 2.2 | An implementation of the standard `vsprintf()` function which supports positional parameters, as specified in the Single Unix Specification. `glib/... |
| warn_message | `warn_message(domain: utf8?, file: utf8, line: gint, func: utf8, warnexpr: utf8?) -> none` | g_warn_message |  | Internal function used to print messages from the public [func@GLib.warn_if_reached] and [func@GLib.warn_if_fail] macros. |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| CacheDestroyFunc | `CacheDestroyFunc(value: gpointer?) -> none` |  |  | Specifies the type of the @value_destroy_func and @key_destroy_func functions passed to g_cache_new(). The functions are passed a pointer to the #G... |
| CacheDupFunc | `CacheDupFunc(value: gpointer?) -> gpointer` |  |  | Specifies the type of the @key_dup_func function passed to g_cache_new(). The function is passed a key (__not__ a value as the prototype implies) a... |
| CacheNewFunc | `CacheNewFunc(key: gpointer?) -> gpointer` |  |  | Specifies the type of the @value_new_func function passed to g_cache_new(). It is passed a #GCache key and should create the value corresponding to... |
| ChildWatchFunc | `ChildWatchFunc(pid: Pid, wait_status: gint, user_data: gpointer?) -> none` |  |  | Prototype of a #GChildWatchSource callback, called when a child process has exited. To interpret @wait_status, see the documentation for g_spawn_ch... |
| ClearHandleFunc | `ClearHandleFunc(handle_id: guint) -> none` |  | 2.56 | Specifies the type of function passed to g_clear_handle_id(). The implementation is expected to free the resource identified by @handle_id; for ins... |
| CompareDataFunc | `CompareDataFunc(a: gpointer?, b: gpointer?, user_data: gpointer?) -> gint` |  |  | Specifies the type of a comparison function used to compare two values. The function should return a negative integer if the first value comes befo... |
| CompareFunc | `CompareFunc(a: gpointer?, b: gpointer?) -> gint` |  |  | Specifies the type of a comparison function used to compare two values. The function should return a negative integer if the first value comes befo... |
| CompletionFunc | `CompletionFunc(item: gpointer?) -> utf8` |  |  | Specifies the type of the function passed to g_completion_new(). It should return the string corresponding to the given target item. This is used w... |
| CompletionStrncmpFunc | `CompletionStrncmpFunc(s1: utf8, s2: utf8, n: gsize) -> gint` |  |  | Specifies the type of the function passed to g_completion_set_compare(). This is used when you use strings as #GCompletion items. |
| CopyFunc | `CopyFunc(src: gpointer, data: gpointer?) -> gpointer` |  | 2.4 | A function of this signature is used to copy the node data when doing a deep-copy of a tree. |
| DataForeachFunc | `DataForeachFunc(key_id: Quark, data: gpointer?, user_data: gpointer?) -> none` |  |  | Specifies the type of function passed to g_dataset_foreach(). It is called with each #GQuark id and associated data element, together with the @use... |
| DestroyNotify | `DestroyNotify(data: gpointer?) -> none` |  |  | Specifies the type of function which is called when a data element is destroyed. It is passed the pointer to the data element and should free any m... |
| DuplicateFunc | `DuplicateFunc(data: gpointer?, user_data: gpointer?) -> gpointer` |  |  | The type of functions that are used to 'duplicate' an object. What this means depends on the context, it could just be incrementing the reference c... |
| EqualFunc | `EqualFunc(a: gpointer?, b: gpointer?) -> gboolean` |  |  | Specifies the type of a function used to test two values for equality. The function should return %TRUE if both values are equal and %FALSE otherwise. |
| EqualFuncFull | `EqualFuncFull(a: gpointer?, b: gpointer?, user_data: gpointer?) -> gboolean` |  | 2.74 | Specifies the type of a function used to test two values for equality. The function should return %TRUE if both values are equal and %FALSE otherwi... |
| ErrorClearFunc | `ErrorClearFunc(error: Error) -> none` |  | 2.68 | Specifies the type of function which is called when an extended error instance is freed. It is passed the error pointer about to be freed, and shou... |
| ErrorCopyFunc | `ErrorCopyFunc(src_error: Error, dest_error: Error) -> none` |  | 2.68 | Specifies the type of function which is called when an extended error instance is copied. It is passed the pointer to the destination error and sou... |
| ErrorInitFunc | `ErrorInitFunc(error: Error) -> none` |  | 2.68 | Specifies the type of function which is called just after an extended error instance is created and its fields filled. It should only initialize th... |
| FreeFunc | `FreeFunc(data: gpointer?) -> none` |  |  | Declares a type of function which takes an arbitrary data pointer argument and has no return value. It is not currently used in GLib or GTK. |
| Func | `Func(data: gpointer?, user_data: gpointer?) -> none` |  |  | Specifies the type of functions passed to g_list_foreach() and g_slist_foreach(). |
| HashFunc | `HashFunc(key: gpointer?) -> guint` |  |  | Specifies the type of the hash function which is passed to g_hash_table_new() when a #GHashTable is created. The function is passed a key and shoul... |
| HFunc | `HFunc(key: gpointer?, value: gpointer?, user_data: gpointer?) -> none` |  |  | Specifies the type of the function passed to g_hash_table_foreach(). It is called with each key/value pair, together with the @user_data parameter ... |
| HookCheckFunc | `HookCheckFunc(data: gpointer?) -> gboolean` |  |  | Defines the type of a hook function that can be invoked by g_hook_list_invoke_check(). |
| HookCheckMarshaller | `HookCheckMarshaller(hook: Hook, marshal_data: gpointer?) -> gboolean` |  |  | Defines the type of function used by g_hook_list_marshal_check(). |
| HookCompareFunc | `HookCompareFunc(new_hook: Hook, sibling: Hook) -> gint` |  |  | Defines the type of function used to compare #GHook elements in g_hook_insert_sorted(). |
| HookFinalizeFunc | `HookFinalizeFunc(hook_list: HookList, hook: Hook) -> none` |  |  | Defines the type of function to be called when a hook in a list of hooks gets finalized. |
| HookFindFunc | `HookFindFunc(hook: Hook, data: gpointer?) -> gboolean` |  |  | Defines the type of the function passed to g_hook_find(). |
| HookFunc | `HookFunc(data: gpointer?) -> none` |  |  | Defines the type of a hook function that can be invoked by g_hook_list_invoke(). |
| HookMarshaller | `HookMarshaller(hook: Hook, marshal_data: gpointer?) -> none` |  |  | Defines the type of function used by g_hook_list_marshal(). |
| HRFunc | `HRFunc(key: gpointer?, value: gpointer?, user_data: gpointer?) -> gboolean` |  |  | Specifies the type of the function passed to g_hash_table_foreach_remove(). It is called with each key/value pair, together with the @user_data par... |
| IOFunc | `IOFunc(source: IOChannel, condition: IOCondition, data: gpointer?) -> gboolean` |  |  | Specifies the type of function passed to g_io_add_watch() or g_io_add_watch_full(), which is called when the requested condition on a #GIOChannel i... |
| LogFunc | `LogFunc(log_domain: utf8, log_level: LogLevelFlags, message: utf8, user_data: gpointer?) -> none` |  |  | Specifies the prototype of log handler functions. The default log handler, [func@GLib.log_default_handler], automatically appends a new-line charac... |
| LogWriterFunc | `LogWriterFunc(log_level: LogLevelFlags, fields: LogField, n_fields: gsize, user_data: gpointer?) -> LogWriterOutput` |  | 2.50 | Writer function for log entries. A log entry is a collection of one or more #GLogFields, using the standard field names from journal specification.... |
| NodeForeachFunc | `NodeForeachFunc(node: Node, data: gpointer?) -> none` |  |  | Specifies the type of function passed to g_node_children_foreach(). The function is called with each child node, together with the user data passed... |
| NodeTraverseFunc | `NodeTraverseFunc(node: Node, data: gpointer?) -> gboolean` |  |  | Specifies the type of function passed to g_node_traverse(). The function is called with each of the nodes visited, together with the user data pass... |
| OptionArgFunc | `OptionArgFunc(option_name: utf8, value: utf8, data: gpointer?) -> gboolean throws` |  |  | The type of function to be passed as callback for %G_OPTION_ARG_CALLBACK options. |
| OptionErrorFunc | `OptionErrorFunc(context: OptionContext, group: OptionGroup, data: gpointer?) -> none throws` |  |  | The type of function to be used as callback when a parse error occurs. |
| OptionParseFunc | `OptionParseFunc(context: OptionContext, group: OptionGroup, data: gpointer?) -> gboolean throws` |  |  | The type of function that can be called before and after parsing. |
| PollFunc | `PollFunc(ufds: PollFD, nfsd: guint, timeout_: gint) -> gint` |  |  | Specifies the type of function passed to g_main_context_set_poll_func(). The semantics of the function should match those of the poll() system call. |
| PrintFunc | `PrintFunc(string: utf8) -> none` |  |  | Specifies the type of the print handler functions. These are called with the complete formatted string to output. |
| RegexEvalCallback | `RegexEvalCallback(match_info: MatchInfo, result: String, user_data: gpointer?) -> gboolean` |  | 2.14 | Specifies the type of the function passed to g_regex_replace_eval(). It is called for each occurrence of the pattern in the string passed to g_rege... |
| ScannerMsgFunc | `ScannerMsgFunc(scanner: Scanner, message: utf8, error: gboolean) -> none` |  |  | Specifies the type of the message handler function. |
| SequenceIterCompareFunc | `SequenceIterCompareFunc(a: SequenceIter, b: SequenceIter, data: gpointer?) -> gint` |  |  | A #GSequenceIterCompareFunc is a function used to compare iterators. It must return zero if the iterators compare equal, a negative value if @a com... |
| SourceDisposeFunc | `SourceDisposeFunc(source: Source) -> none` |  | 2.64 | Dispose function for @source. See g_source_set_dispose_function() for details. |
| SourceDummyMarshal | `SourceDummyMarshal() -> none` |  |  | This is just a placeholder for #GClosureMarshal, which cannot be used here for dependency reasons. |
| SourceFunc | `SourceFunc(user_data: gpointer?) -> gboolean` |  |  | Specifies the type of function passed to g_timeout_add(), g_timeout_add_full(), g_idle_add(), and g_idle_add_full(). When calling g_source_set_call... |
| SourceOnceFunc | `SourceOnceFunc(user_data: gpointer?) -> none` |  | 2.74 | A source function that is only called once before being removed from the main context automatically. See: g_idle_add_once(), g_timeout_add_once() |
| SpawnChildSetupFunc | `SpawnChildSetupFunc(data: gpointer?) -> none` |  |  | Specifies the type of the setup function passed to g_spawn_async(), g_spawn_sync() and g_spawn_async_with_pipes(), which can, in very limited ways,... |
| TestDataFunc | `TestDataFunc(user_data: gpointer?) -> none` |  | 2.28 | The type used for test case functions that take an extra pointer argument. |
| TestFixtureFunc | `TestFixtureFunc(fixture: gpointer, user_data: gpointer?) -> none` |  | 2.28 | The type used for functions that operate on test fixtures. This is used for the fixture setup and teardown functions as well as for the testcases t... |
| TestFunc | `TestFunc() -> none` |  | 2.28 | The type used for test case functions. |
| TestLogFatalFunc | `TestLogFatalFunc(log_domain: utf8, log_level: LogLevelFlags, message: utf8, user_data: gpointer?) -> gboolean` |  | 2.22 | Specifies the prototype of fatal log handler functions. |
| ThreadFunc | `ThreadFunc(data: gpointer?) -> gpointer` |  |  | Specifies the type of the @func functions passed to g_thread_new() or g_thread_try_new(). |
| TranslateFunc | `TranslateFunc(str: utf8, data: gpointer?) -> utf8` |  |  | The type of functions which are used to translate user-visible strings, for <option>--help</option> output. |
| TraverseFunc | `TraverseFunc(key: gpointer?, value: gpointer?, data: gpointer?) -> gboolean` |  |  | Specifies the type of function passed to g_tree_traverse(). It is passed the key and value of each node, together with the @user_data parameter pas... |
| TraverseNodeFunc | `TraverseNodeFunc(node: TreeNode, data: gpointer?) -> gboolean` |  | 2.68 | Specifies the type of function passed to g_tree_foreach_node(). It is passed each node, together with the @user_data parameter passed to g_tree_for... |
| UnixFDSourceFunc | `UnixFDSourceFunc(fd: gint, condition: IOCondition, user_data: gpointer?) -> gboolean` |  |  | The type of functions to be called when a UNIX fd watch source triggers. |
| VoidFunc | `VoidFunc() -> none` |  |  | Declares a type of function which takes no arguments and has no return value. It is used to specify the type function passed to g_atexit(). |

## Constants

| Name | Type |
| --- | --- |
| ALLOC_AND_FREE | gint |
| ALLOC_ONLY | gint |
| ALLOCATOR_LIST | gint |
| ALLOCATOR_NODE | gint |
| ALLOCATOR_SLIST | gint |
| ANALYZER_ANALYZING | gint |
| ASCII_DTOSTR_BUF_SIZE | gint |
| ATOMIC_REF_COUNT_INIT | gint |
| BIG_ENDIAN | gint |
| C_STD_VERSION | gint |
| CSET_A_2_Z | utf8 |
| CSET_a_2_z | utf8 |
| CSET_DIGITS | utf8 |
| DATALIST_FLAGS_MASK | gint |
| DATE_BAD_DAY | gint |
| DATE_BAD_JULIAN | gint |
| DATE_BAD_YEAR | gint |
| DIR_SEPARATOR | gint |
| DIR_SEPARATOR_S | utf8 |
| E | gdouble |
| GINT16_FORMAT | utf8 |
| GINT16_MODIFIER | utf8 |
| GINT32_FORMAT | utf8 |
| GINT32_MODIFIER | utf8 |
| GINT64_FORMAT | utf8 |
| GINT64_MODIFIER | utf8 |
| GINTPTR_FORMAT | utf8 |
| GINTPTR_MODIFIER | utf8 |
| GNUC_FUNCTION | utf8 |
| GNUC_PRETTY_FUNCTION | utf8 |
| GSIZE_FORMAT | utf8 |
| GSIZE_MODIFIER | utf8 |
| GSSIZE_FORMAT | utf8 |
| GSSIZE_MODIFIER | utf8 |
| GUINT16_FORMAT | utf8 |
| GUINT32_FORMAT | utf8 |
| GUINT64_FORMAT | utf8 |
| GUINTPTR_FORMAT | utf8 |
| HAVE_GINT64 | gint |
| HAVE_GNUC_VARARGS | gint |
| HAVE_GNUC_VISIBILITY | gint |
| HAVE_GROWING_STACK | gint |
| HAVE_ISO_VARARGS | gint |
| HOOK_FLAG_USER_SHIFT | gint |
| IEEE754_DOUBLE_BIAS | gint |
| IEEE754_FLOAT_BIAS | gint |
| KEY_FILE_DESKTOP_GROUP | utf8 |
| KEY_FILE_DESKTOP_KEY_ACTIONS | utf8 |
| KEY_FILE_DESKTOP_KEY_CATEGORIES | utf8 |
| KEY_FILE_DESKTOP_KEY_COMMENT | utf8 |
| KEY_FILE_DESKTOP_KEY_DBUS_ACTIVATABLE | utf8 |
| KEY_FILE_DESKTOP_KEY_EXEC | utf8 |
| KEY_FILE_DESKTOP_KEY_GENERIC_NAME | utf8 |
| KEY_FILE_DESKTOP_KEY_HIDDEN | utf8 |
| KEY_FILE_DESKTOP_KEY_ICON | utf8 |
| KEY_FILE_DESKTOP_KEY_MIME_TYPE | utf8 |
| KEY_FILE_DESKTOP_KEY_NAME | utf8 |
| KEY_FILE_DESKTOP_KEY_NO_DISPLAY | utf8 |
| KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN | utf8 |
| KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN | utf8 |
| KEY_FILE_DESKTOP_KEY_PATH | utf8 |
| KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY | utf8 |
| KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS | utf8 |
| KEY_FILE_DESKTOP_KEY_TERMINAL | utf8 |
| KEY_FILE_DESKTOP_KEY_TRY_EXEC | utf8 |
| KEY_FILE_DESKTOP_KEY_TYPE | utf8 |
| KEY_FILE_DESKTOP_KEY_URL | utf8 |
| KEY_FILE_DESKTOP_KEY_VERSION | utf8 |
| KEY_FILE_DESKTOP_TYPE_APPLICATION | utf8 |
| KEY_FILE_DESKTOP_TYPE_DIRECTORY | utf8 |
| KEY_FILE_DESKTOP_TYPE_LINK | utf8 |
| LITTLE_ENDIAN | gint |
| LN10 | gdouble |
| LN2 | gdouble |
| LOG_2_BASE_10 | gdouble |
| LOG_DOMAIN | gchar |
| LOG_FATAL_MASK | gint |
| LOG_LEVEL_USER_SHIFT | gint |
| macro__has_attribute___noreturn__ | gint |
| MAJOR_VERSION | gint |
| MAXINT16 | gint16 |
| MAXINT32 | gint32 |
| MAXINT64 | gint64 |
| MAXINT8 | gint8 |
| MAXUINT16 | guint16 |
| MAXUINT32 | guint32 |
| MAXUINT64 | guint64 |
| MAXUINT8 | guint8 |
| MICRO_VERSION | gint |
| MININT16 | gint16 |
| MININT32 | gint32 |
| MININT64 | gint64 |
| MININT8 | gint8 |
| MINOR_VERSION | gint |
| MODULE_SUFFIX | utf8 |
| OPTION_REMAINING | utf8 |
| PDP_ENDIAN | gint |
| PI | gdouble |
| PI_2 | gdouble |
| PI_4 | gdouble |
| PID_FORMAT | utf8 |
| POLLFD_FORMAT | utf8 |
| PRIORITY_DEFAULT | gint |
| PRIORITY_DEFAULT_IDLE | gint |
| PRIORITY_HIGH | gint |
| PRIORITY_HIGH_IDLE | gint |
| PRIORITY_LOW | gint |
| REF_COUNT_INIT | gint |
| SEARCHPATH_SEPARATOR | gint |
| SEARCHPATH_SEPARATOR_S | utf8 |
| SIZEOF_LONG | gint |
| SIZEOF_SIZE_T | gint |
| SIZEOF_SSIZE_T | gint |
| SIZEOF_VOID_P | gint |
| SOURCE_CONTINUE | gboolean |
| SOURCE_REMOVE | gboolean |
| SQRT2 | gdouble |
| STR_DELIMITERS | utf8 |
| SYSDEF_AF_INET | gint |
| SYSDEF_AF_INET6 | gint |
| SYSDEF_AF_UNIX | gint |
| SYSDEF_MSG_DONTROUTE | gint |
| SYSDEF_MSG_OOB | gint |
| SYSDEF_MSG_PEEK | gint |
| TEST_OPTION_ISOLATE_DIRS | utf8 |
| TIME_SPAN_DAY | gint64 |
| TIME_SPAN_HOUR | gint64 |
| TIME_SPAN_MILLISECOND | gint64 |
| TIME_SPAN_MINUTE | gint64 |
| TIME_SPAN_SECOND | gint64 |
| UNICHAR_MAX_DECOMPOSITION_LENGTH | gint |
| URI_RESERVED_CHARS_GENERIC_DELIMITERS | utf8 |
| URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS | utf8 |
| USEC_PER_SEC | gint |
| VERSION_MIN_REQUIRED | gint |
| WIN32_MSG_HANDLE | gint |

## Aliases

| Name | Type |
| --- | --- |
| DateDay | guint8 |
| DateYear | guint16 |
| MainContextPusher | none |
| MutexLocker | none |
| Pid | gint |
| Quark | guint32 |
| RecMutexLocker | none |
| RefString | gchar |
| RWLockReaderLocker | none |
| RWLockWriterLocker | none |
| Strv | utf8 |
| Time | gint32 |
| TimeSpan | gint64 |

