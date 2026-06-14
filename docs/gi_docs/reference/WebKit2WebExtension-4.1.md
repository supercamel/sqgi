# WebKit2WebExtension 4.1

SQGI import: `import("WebKit2WebExtension", "4.1")`

Packages: `webkit2gtk-web-extension-4.1`
Includes: `Gtk-3.0`, `JavaScriptCore-4.1`, `Soup-3.0`
Libraries: `libwebkit2gtk-4.1.so.0`, `libjavascriptcoregtk-4.1.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 113 |
| Interfaces | 3 |
| Records | 129 |
| Unions | 0 |
| Enums | 5 |
| Flags | 1 |
| Functions | 0 |
| Callbacks | 2 |
| Constants | 87 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| ContextMenu | GObject.Object | 0 | 0 | 17 | Represents the context menu in a #WebKitWebView. #WebKitContextMenu represents a context menu containing #WebKitContextMenuItem<!-- -->s in a #WebK... |
| ContextMenuItem | GObject.InitiallyUnowned | 0 | 0 | 14 | One item of a #WebKitContextMenu. The #WebKitContextMenu is composed of #WebKitContextMenuItem<!-- -->s. These items can be created from a #GtkActi... |
| DOMAttr | DOMNode | 0 | 0 | 8 | A #gchar |
| DOMBlob | DOMObject | 1 | 0 | 1 | A #guint64 |
| DOMCDATASection | DOMText | 0 | 0 | 0 |  |
| DOMCharacterData | DOMNode | 3 | 0 | 8 | A #WebKitDOMCharacterData |
| DOMClientRect | DOMObject | 0 | 0 | 6 | Returns the bottom coordinate of @self, relative to the viewport. |
| DOMClientRectList | DOMObject | 0 | 0 | 2 | Returns the number of #WebKitDOMClientRect objects that @self contains. |
| DOMComment | DOMCharacterData | 0 | 0 | 0 |  |
| DOMCSSRule | DOMObject | 0 | 0 | 5 | A #gchar |
| DOMCSSRuleList | DOMObject | 0 | 0 | 2 | A #gulong |
| DOMCSSStyleDeclaration | DOMObject | 0 | 0 | 11 | A #gchar |
| DOMCSSStyleSheet | DOMStyleSheet | 0 | 0 | 7 | A #glong |
| DOMCSSValue | DOMObject | 0 | 0 | 3 | A #gchar |
| DOMDocument | DOMNode | 1 | 0 | 105 | A #WebKitDOMNode |
| DOMDocumentFragment | DOMNode | 0 | 0 | 7 | A #gulong |
| DOMDocumentType | DOMNode | 0 | 0 | 6 | A #WebKitDOMNamedNodeMap |
| DOMDOMImplementation | DOMObject | 0 | 0 | 5 | A #WebKitDOMCSSStyleSheet |
| DOMDOMSelection | DOMObject | 0 | 0 | 25 | A #WebKitDOMDOMSelection |
| DOMDOMTokenList | DOMObject | 0 | 0 | 9 | A #WebKitDOMDOMTokenList |
| DOMDOMWindow | DOMObject | 0 | 0 | 51 | A #WebKitDOMDOMWindow |
| DOMElement | DOMNode | 1 | 0 | 80 | A #WebKitDOMElement |
| DOMEntityReference | DOMNode | 0 | 0 | 0 |  |
| DOMEvent | DOMObject | 1 | 0 | 15 | A #gboolean |
| DOMFile | DOMBlob | 0 | 0 | 1 | A #gchar |
| DOMFileList | DOMObject | 0 | 0 | 2 | A #gulong |
| DOMHTMLAnchorElement | DOMHTMLElement | 0 | 0 | 36 | A #gchar |
| DOMHTMLAppletElement | DOMHTMLElement | 0 | 0 | 22 | A #gchar |
| DOMHTMLAreaElement | DOMHTMLElement | 0 | 0 | 26 | A #gchar |
| DOMHTMLBaseElement | DOMHTMLElement | 0 | 0 | 4 | A #gchar |
| DOMHTMLBaseFontElement | DOMHTMLElement | 0 | 0 | 6 | This function has been removed from the DOM spec and it just returns %NULL. |
| DOMHTMLBodyElement | DOMHTMLElement | 0 | 0 | 12 | A #gchar |
| DOMHTMLBRElement | DOMHTMLElement | 0 | 0 | 2 | A #gchar |
| DOMHTMLButtonElement | DOMHTMLElement | 0 | 0 | 12 | A #gboolean |
| DOMHTMLCanvasElement | DOMHTMLElement | 0 | 0 | 4 | A #glong |
| DOMHTMLCollection | DOMObject | 1 | 0 | 3 | A #gulong |
| DOMHTMLDirectoryElement | DOMHTMLElement | 0 | 0 | 2 | A #gboolean |
| DOMHTMLDivElement | DOMHTMLElement | 0 | 0 | 2 | A #gchar |
| DOMHTMLDListElement | DOMHTMLElement | 0 | 0 | 2 | A #gboolean |
| DOMHTMLDocument | DOMDocument | 0 | 0 | 24 | A #WebKitDOMHTMLDocument |
| DOMHTMLElement | DOMElement | 54 | 0 | 33 | A #WebKitDOMHTMLElement |
| DOMHTMLEmbedElement | DOMHTMLElement | 0 | 0 | 12 | A #gchar |
| DOMHTMLFieldSetElement | DOMHTMLElement | 0 | 0 | 1 | A #WebKitDOMHTMLFormElement |
| DOMHTMLFontElement | DOMHTMLElement | 0 | 0 | 6 | A #gchar |
| DOMHTMLFormElement | DOMHTMLElement | 0 | 0 | 18 | A #gchar |
| DOMHTMLFrameElement | DOMHTMLElement | 0 | 0 | 20 | A #WebKitDOMDocument |
| DOMHTMLFrameSetElement | DOMHTMLElement | 0 | 0 | 4 | A #gchar |
| DOMHTMLHeadElement | DOMHTMLElement | 0 | 0 | 2 | A #gchar |
| DOMHTMLHeadingElement | DOMHTMLElement | 0 | 0 | 2 | A #gchar |
| DOMHTMLHRElement | DOMHTMLElement | 0 | 0 | 8 | A #gchar |
| DOMHTMLHtmlElement | DOMHTMLElement | 0 | 0 | 2 | A #gchar |
| DOMHTMLIFrameElement | DOMHTMLElement | 0 | 0 | 22 | A #gchar |
| DOMHTMLImageElement | DOMHTMLElement | 0 | 0 | 31 | A #gchar |
| DOMHTMLInputElement | DOMHTMLElement | 0 | 0 | 52 | A #gchar |
| DOMHTMLLabelElement | DOMHTMLElement | 0 | 0 | 3 | A #WebKitDOMHTMLFormElement |
| DOMHTMLLegendElement | DOMHTMLElement | 0 | 0 | 3 | A #gchar |
| DOMHTMLLIElement | DOMHTMLElement | 0 | 0 | 4 | A #gchar |
| DOMHTMLLinkElement | DOMHTMLElement | 0 | 0 | 21 | A #gchar |
| DOMHTMLMapElement | DOMHTMLElement | 0 | 0 | 3 | A #WebKitDOMHTMLCollection |
| DOMHTMLMarqueeElement | DOMHTMLElement | 0 | 0 | 2 | A #WebKitDOMHTMLMarqueeElement |
| DOMHTMLMenuElement | DOMHTMLElement | 0 | 0 | 2 | A #gboolean |
| DOMHTMLMetaElement | DOMHTMLElement | 0 | 0 | 8 | A #gchar |
| DOMHTMLModElement | DOMHTMLElement | 0 | 0 | 4 | A #gchar |
| DOMHTMLObjectElement | DOMHTMLElement | 0 | 0 | 34 | A #gchar |
| DOMHTMLOListElement | DOMHTMLElement | 0 | 0 | 6 | A #gboolean |
| DOMHTMLOptGroupElement | DOMHTMLElement | 0 | 0 | 4 | A #gboolean |
| DOMHTMLOptionElement | DOMHTMLElement | 0 | 0 | 13 | A #gboolean |
| DOMHTMLOptionsCollection | DOMHTMLCollection | 0 | 0 | 4 | A #gulong |
| DOMHTMLParagraphElement | DOMHTMLElement | 0 | 0 | 2 | A #gchar |
| DOMHTMLParamElement | DOMHTMLElement | 0 | 0 | 8 | A #gchar |
| DOMHTMLPreElement | DOMHTMLElement | 0 | 0 | 4 | A #glong |
| DOMHTMLQuoteElement | DOMHTMLElement | 0 | 0 | 2 | A #gchar |
| DOMHTMLScriptElement | DOMHTMLElement | 0 | 0 | 14 | A #gchar |
| DOMHTMLSelectElement | DOMHTMLElement | 0 | 0 | 24 | A #WebKitDOMHTMLSelectElement |
| DOMHTMLStyleElement | DOMHTMLElement | 0 | 0 | 7 | A #gboolean |
| DOMHTMLTableCaptionElement | DOMHTMLElement | 0 | 0 | 2 | A #gchar |
| DOMHTMLTableCellElement | DOMHTMLElement | 0 | 0 | 29 | A #gchar |
| DOMHTMLTableColElement | DOMHTMLElement | 0 | 0 | 12 | A #gchar |
| DOMHTMLTableElement | DOMHTMLElement | 0 | 0 | 32 | A #WebKitDOMHTMLElement |
| DOMHTMLTableRowElement | DOMHTMLElement | 0 | 0 | 15 | A #WebKitDOMHTMLTableRowElement |
| DOMHTMLTableSectionElement | DOMHTMLElement | 0 | 0 | 11 | A #WebKitDOMHTMLTableSectionElement |
| DOMHTMLTextAreaElement | DOMHTMLElement | 0 | 0 | 26 | A #gchar |
| DOMHTMLTitleElement | DOMHTMLElement | 0 | 0 | 2 | A #gchar |
| DOMHTMLUListElement | DOMHTMLElement | 0 | 0 | 4 | A #gboolean |
| DOMKeyboardEvent | DOMUIEvent | 0 | 0 | 9 | A #gboolean |
| DOMMediaList | DOMObject | 0 | 0 | 6 | A #WebKitDOMMediaList |
| DOMMouseEvent | DOMUIEvent | 1 | 0 | 17 | A #gboolean |
| DOMNamedNodeMap | DOMObject | 0 | 0 | 8 | A #gulong |
| DOMNode | DOMObject | 7 | 0 | 36 | Get the #WebKitDOMNode for the DOM node referenced by @value. |
| DOMNodeIterator | DOMObject | 0 | 0 | 9 | A #WebKitDOMNodeIterator |
| DOMNodeList | DOMObject | 0 | 0 | 2 | A #gulong |
| DOMObject | GObject.Object | 25 | 0 | 0 |  |
| DOMProcessingInstruction | DOMCharacterData | 0 | 0 | 2 | A #WebKitDOMStyleSheet |
| DOMRange | DOMObject | 0 | 0 | 31 | A #WebKitDOMDocumentFragment |
| DOMStyleSheet | DOMObject | 1 | 0 | 8 | A #gchar |
| DOMStyleSheetList | DOMObject | 0 | 0 | 2 | A #gulong |
| DOMText | DOMCharacterData | 1 | 0 | 3 | A #gchar |
| DOMTreeWalker | DOMObject | 0 | 0 | 13 | A #WebKitDOMNode |
| DOMUIEvent | DOMEvent | 2 | 0 | 9 | A #glong |
| DOMWheelEvent | DOMMouseEvent | 0 | 0 | 4 | A #glong |
| DOMXPathExpression | DOMObject | 0 | 0 | 1 | A #WebKitDOMXPathResult |
| DOMXPathResult | DOMObject | 0 | 0 | 9 | A #gboolean |
| Frame | GObject.Object | 0 | 0 | 9 | A web page frame. Each `WebKitWebPage` has at least one main frame, and can have any number of subframes. |
| HitTestResult | GObject.Object | 1 | 0 | 12 | Result of a Hit Test. A Hit Test is an operation to get context information about a given point in a #WebKitWebView. #WebKitHitTestResult represent... |
| ScriptWorld | GObject.Object | 0 | 1 | 4 | Creates a new isolated #WebKitScriptWorld. Scripts executed in isolated worlds have access to the DOM but not to other variable or functions create... |
| URIRequest | GObject.Object | 0 | 0 | 5 | Represents a URI request. A #WebKitURIRequest can be created with a URI using the webkit_uri_request_new() method, and you can get the URI of an ex... |
| URIResponse | GObject.Object | 0 | 0 | 6 | Represents an URI response. A #WebKitURIResponse contains information such as the URI, the status code, the content length, the mime type, the HTTP... |
| UserMessage | GObject.InitiallyUnowned | 0 | 0 | 7 | Message that can be sent between the UI process and web process extensions. A WebKitUserMessage is a message that can be used for the communication... |
| WebEditor | GObject.Object | 0 | 1 | 1 | Access to editing capabilities of a #WebKitWebPage. The WebKitWebEditor provides access to various editing capabilities of a #WebKitWebPage such as... |
| WebExtension | GObject.Object | 0 | 2 | 3 | Represents an extension of the WebProcess. WebKitWebExtension is a loadable module for the WebProcess. It allows you to execute code in the WebProc... |
| WebFormManager | GObject.Object | 0 | 3 | 3 | Form manager of a #WebKitWebPage in a #WebKitScriptWorld |
| WebHitTestResult | HitTestResult | 0 | 0 | 2 | Result of a Hit Test (Web Process Extensions). WebKitWebHitTestResult extends #WebKitHitTestResult to provide information about the #WebKitDOMNode ... |
| WebPage | GObject.Object | 0 | 8 | 8 | A loaded web page. |

### WebKit2WebExtension.ContextMenu

Parent: `GObject.Object` ?? GType: `WebKitContextMenu` ?? C type: `WebKitContextMenu`

Represents the context menu in a #WebKitWebView. #WebKitContextMenu represents a context menu containing #WebKitContextMenuItem<!-- -->s in a #WebK...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | ContextMenuPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ContextMenu.new() -> ContextMenu` | webkit_context_menu_new |  | Creates a new #WebKitContextMenu object. Creates a new #WebKitContextMenu object to be used as a submenu of an existing #WebKitContextMenu. The con... |
| new_with_items | `ContextMenu.new_with_items(items: GLib.List) -> ContextMenu` | webkit_context_menu_new_with_items |  | Creates a new #WebKitContextMenu object with the given items. Creates a new #WebKitContextMenu object to be used as a submenu of an existing #WebKi... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append | `ContextMenu.append(item: ContextMenuItem) -> none` | webkit_context_menu_append |  | Adds @item at the end of the @menu. |
| first | `ContextMenu.first() -> ContextMenuItem` | webkit_context_menu_first |  | Gets the first item in the @menu. |
| get_event | `ContextMenu.get_event() -> Gdk.Event` | webkit_context_menu_get_event | 2.40 | Gets the #GdkEvent that triggered the context menu. This function only returns a valid #GdkEvent when called for a #WebKitContextMenu passed to #We... |
| get_item_at_position | `ContextMenu.get_item_at_position(position: guint) -> ContextMenuItem` | webkit_context_menu_get_item_at_position |  | Gets the item at the given position in the @menu. |
| get_items | `ContextMenu.get_items() -> GLib.List` | webkit_context_menu_get_items |  | Returns the item list of @menu. |
| get_n_items | `ContextMenu.get_n_items() -> guint` | webkit_context_menu_get_n_items |  | Gets the length of the @menu. |
| get_position | `ContextMenu.get_position(x: out gint?, y: out gint?) -> gboolean` | webkit_context_menu_get_position | 2.52 | Gets the position in view coordinates where the context menu was triggered. This function only returns valid coordinates when called for a #WebKitC... |
| get_user_data | `ContextMenu.get_user_data() -> GLib.Variant` | webkit_context_menu_get_user_data | 2.8 | Gets the user data of @menu. This function can be used from the UI Process to get user data previously set from the Web Process with webkit_context... |
| insert | `ContextMenu.insert(item: ContextMenuItem, position: gint) -> none` | webkit_context_menu_insert |  | Inserts @item into the @menu at the given position. If @position is negative, or is larger than the number of items in the #WebKitContextMenu, the ... |
| last | `ContextMenu.last() -> ContextMenuItem` | webkit_context_menu_last |  | Gets the last item in the @menu. |
| move_item | `ContextMenu.move_item(item: ContextMenuItem, position: gint) -> none` | webkit_context_menu_move_item |  | Moves @item to the given position in the @menu. If @position is negative, or is larger than the number of items in the #WebKitContextMenu, the item... |
| prepend | `ContextMenu.prepend(item: ContextMenuItem) -> none` | webkit_context_menu_prepend |  | Adds @item at the beginning of the @menu. |
| remove | `ContextMenu.remove(item: ContextMenuItem) -> none` | webkit_context_menu_remove |  | Removes @item from the @menu. See also webkit_context_menu_remove_all() to remove all items. |
| remove_all | `ContextMenu.remove_all() -> none` | webkit_context_menu_remove_all |  | Removes all items of the @menu. |
| set_user_data | `ContextMenu.set_user_data(user_data: GLib.Variant) -> none` | webkit_context_menu_set_user_data | 2.8 | Sets user data to @menu. This function can be used from a Web Process extension to set user data that can be retrieved from the UI Process using we... |

### WebKit2WebExtension.ContextMenuItem

Parent: `GObject.InitiallyUnowned` ?? GType: `WebKitContextMenuItem` ?? C type: `WebKitContextMenuItem`

One item of a #WebKitContextMenu. The #WebKitContextMenu is composed of #WebKitContextMenuItem<!-- -->s. These items can be created from a #GtkActi...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.InitiallyUnowned |
| priv | ContextMenuItemPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ContextMenuItem.new(action: Gtk.Action) -> ContextMenuItem` | webkit_context_menu_item_new |  | Creates a new #WebKitContextMenuItem for the given @action. |
| new_from_gaction | `ContextMenuItem.new_from_gaction(action: Gio.Action, label: utf8, target: GLib.Variant?) -> ContextMenuItem` | webkit_context_menu_item_new_from_gaction | 2.18 | Creates a new #WebKitContextMenuItem for the given @action and @label. On activation @target will be passed as parameter to the callback. |
| new_from_stock_action | `ContextMenuItem.new_from_stock_action(action: ContextMenuAction) -> ContextMenuItem` | webkit_context_menu_item_new_from_stock_action |  | Creates a new #WebKitContextMenuItem for the given stock action. Stock actions are handled automatically by WebKit so that, for example, when a men... |
| new_from_stock_action_with_label | `ContextMenuItem.new_from_stock_action_with_label(action: ContextMenuAction, label: utf8) -> ContextMenuItem` | webkit_context_menu_item_new_from_stock_action_with_label |  | Creates a new #WebKitContextMenuItem for the given stock action using the given @label. Stock actions have a predefined label, this method can be u... |
| new_separator | `ContextMenuItem.new_separator() -> ContextMenuItem` | webkit_context_menu_item_new_separator |  | Creates a new #WebKitContextMenuItem representing a separator. |
| new_with_submenu | `ContextMenuItem.new_with_submenu(label: utf8, submenu: ContextMenu) -> ContextMenuItem` | webkit_context_menu_item_new_with_submenu |  | Creates a new #WebKitContextMenuItem using the given @label with a submenu. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_action | `ContextMenuItem.get_action() -> Gtk.Action` | webkit_context_menu_item_get_action |  | Gets the action associated to @item as a #GtkAction. |
| get_gaction | `ContextMenuItem.get_gaction() -> Gio.Action` | webkit_context_menu_item_get_gaction | 2.18 | Gets the action associated to @item as a #GAction. |
| get_gaction_target | `ContextMenuItem.get_gaction_target() -> GLib.Variant` | webkit_context_menu_item_get_gaction_target | 2.52 | Gets the target #GVariant associated with @item. |
| get_stock_action | `ContextMenuItem.get_stock_action() -> ContextMenuAction` | webkit_context_menu_item_get_stock_action |  | Gets the #WebKitContextMenuAction of @item. If the #WebKitContextMenuItem was not created for a stock action %WEBKIT_CONTEXT_MENU_ACTION_CUSTOM wil... |
| get_submenu | `ContextMenuItem.get_submenu() -> ContextMenu` | webkit_context_menu_item_get_submenu |  | Gets the submenu of @item. |
| get_title | `ContextMenuItem.get_title() -> utf8` | webkit_context_menu_item_get_title | 2.52 | Gets the title of @item. |
| is_separator | `ContextMenuItem.is_separator() -> gboolean` | webkit_context_menu_item_is_separator |  | Checks whether @item is a separator. |
| set_submenu | `ContextMenuItem.set_submenu(submenu: ContextMenu?) -> none` | webkit_context_menu_item_set_submenu |  | Sets or replaces the @item submenu. If @submenu is %NULL the current submenu of @item is removed. |

### WebKit2WebExtension.DOMAttr

Parent: `DOMNode` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMAttr` ?? C type: `WebKitDOMAttr`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMNode |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_local_name | `DOMAttr.get_local_name() -> utf8` | webkit_dom_attr_get_local_name | 2.14 | A #gchar |
| get_name | `DOMAttr.get_name() -> utf8` | webkit_dom_attr_get_name |  | A #gchar |
| get_namespace_uri | `DOMAttr.get_namespace_uri() -> utf8` | webkit_dom_attr_get_namespace_uri | 2.14 | A #gchar |
| get_owner_element | `DOMAttr.get_owner_element() -> DOMElement` | webkit_dom_attr_get_owner_element |  | A #WebKitDOMElement |
| get_prefix | `DOMAttr.get_prefix() -> utf8` | webkit_dom_attr_get_prefix | 2.14 | A #gchar |
| get_specified | `DOMAttr.get_specified() -> gboolean` | webkit_dom_attr_get_specified |  | A #gboolean |
| get_value | `DOMAttr.get_value() -> utf8` | webkit_dom_attr_get_value |  | A #gchar |
| set_value | `DOMAttr.set_value(value: utf8) -> none throws` | webkit_dom_attr_set_value |  | A #WebKitDOMAttr |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| local-name | utf8 | read |  |
| name | utf8 | read |  |
| namespace-uri | utf8 | read |  |
| owner-element | DOMElement | read |  |
| prefix | utf8 | read |  |
| specified | gboolean | read |  |
| value | utf8 | read, write |  |

### WebKit2WebExtension.DOMBlob

Parent: `DOMObject` ?? Subclasses: `DOMFile` ?? GType: `WebKitDOMBlob` ?? C type: `WebKitDOMBlob`

A #guint64

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_size | `DOMBlob.get_size() -> guint64` | webkit_dom_blob_get_size |  | A #guint64 |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| size | guint64 | read |  |

### WebKit2WebExtension.DOMCDATASection

Parent: `DOMText` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMCDATASection` ?? C type: `WebKitDOMCDATASection`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMText |

### WebKit2WebExtension.DOMCharacterData

Parent: `DOMNode` ?? Subclasses: `DOMComment`, `DOMProcessingInstruction`, `DOMText` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMCharacterData` ?? C type: `WebKitDOMCharacterData`

A #WebKitDOMCharacterData

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMNode |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_data | `DOMCharacterData.append_data(data: utf8) -> none throws` | webkit_dom_character_data_append_data |  | A #WebKitDOMCharacterData |
| delete_data | `DOMCharacterData.delete_data(offset: gulong, length: gulong) -> none throws` | webkit_dom_character_data_delete_data |  | A #WebKitDOMCharacterData |
| get_data | `DOMCharacterData.get_data() -> utf8` | webkit_dom_character_data_get_data |  | A #gchar |
| get_length | `DOMCharacterData.get_length() -> gulong` | webkit_dom_character_data_get_length |  | A #gulong |
| insert_data | `DOMCharacterData.insert_data(offset: gulong, data: utf8) -> none throws` | webkit_dom_character_data_insert_data |  | A #WebKitDOMCharacterData |
| replace_data | `DOMCharacterData.replace_data(offset: gulong, length: gulong, data: utf8) -> none throws` | webkit_dom_character_data_replace_data |  | A #WebKitDOMCharacterData |
| set_data | `DOMCharacterData.set_data(value: utf8) -> none throws` | webkit_dom_character_data_set_data |  | A #WebKitDOMCharacterData |
| substring_data | `DOMCharacterData.substring_data(offset: gulong, length: gulong) -> utf8 throws` | webkit_dom_character_data_substring_data |  | A #gchar |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| data | utf8 | read, write |  |
| length | gulong | read |  |

### WebKit2WebExtension.DOMClientRect

Parent: `DOMObject` ?? GType: `WebKitDOMClientRect` ?? C type: `WebKitDOMClientRect`

Returns the bottom coordinate of @self, relative to the viewport.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_bottom | `DOMClientRect.get_bottom() -> gfloat` | webkit_dom_client_rect_get_bottom | 2.18 | Returns the bottom coordinate of @self, relative to the viewport. |
| get_height | `DOMClientRect.get_height() -> gfloat` | webkit_dom_client_rect_get_height | 2.18 | Returns the height of @self. |
| get_left | `DOMClientRect.get_left() -> gfloat` | webkit_dom_client_rect_get_left | 2.18 | Returns the left coordinate of @self, relative to the viewport. |
| get_right | `DOMClientRect.get_right() -> gfloat` | webkit_dom_client_rect_get_right | 2.18 | Returns the right coordinate of @self, relative to the viewport. |
| get_top | `DOMClientRect.get_top() -> gfloat` | webkit_dom_client_rect_get_top | 2.18 | Returns the top coordinate of @self, relative to the viewport. |
| get_width | `DOMClientRect.get_width() -> gfloat` | webkit_dom_client_rect_get_width | 2.18 | Returns the width of @self. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| bottom | gfloat | read |  |
| height | gfloat | read |  |
| left | gfloat | read |  |
| right | gfloat | read |  |
| top | gfloat | read |  |
| width | gfloat | read |  |

### WebKit2WebExtension.DOMClientRectList

Parent: `DOMObject` ?? GType: `WebKitDOMClientRectList` ?? C type: `WebKitDOMClientRectList`

Returns the number of #WebKitDOMClientRect objects that @self contains.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_length | `DOMClientRectList.get_length() -> gulong` | webkit_dom_client_rect_list_get_length | 2.18 | Returns the number of #WebKitDOMClientRect objects that @self contains. |
| item | `DOMClientRectList.item(index: gulong) -> DOMClientRect` | webkit_dom_client_rect_list_item | 2.18 | Returns the #WebKitDOMClientRect object that @self contains at @index. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| length | gulong | read |  |

### WebKit2WebExtension.DOMComment

Parent: `DOMCharacterData` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMComment` ?? C type: `WebKitDOMComment`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMCharacterData |

### WebKit2WebExtension.DOMCSSRule

Parent: `DOMObject` ?? GType: `WebKitDOMCSSRule` ?? C type: `WebKitDOMCSSRule`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_css_text | `DOMCSSRule.get_css_text() -> utf8` | webkit_dom_css_rule_get_css_text |  | A #gchar |
| get_parent_rule | `DOMCSSRule.get_parent_rule() -> DOMCSSRule` | webkit_dom_css_rule_get_parent_rule |  | A #WebKitDOMCSSRule |
| get_parent_style_sheet | `DOMCSSRule.get_parent_style_sheet() -> DOMCSSStyleSheet` | webkit_dom_css_rule_get_parent_style_sheet |  | A #WebKitDOMCSSStyleSheet |
| get_rule_type | `DOMCSSRule.get_rule_type() -> gushort` | webkit_dom_css_rule_get_rule_type |  | A #gushort |
| set_css_text | `DOMCSSRule.set_css_text(value: utf8) -> none throws` | webkit_dom_css_rule_set_css_text |  | A #WebKitDOMCSSRule |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| css-text | utf8 | read, write |  |
| parent-rule | DOMCSSRule | read |  |
| parent-style-sheet | DOMCSSStyleSheet | read |  |
| type | guint | read |  |

### WebKit2WebExtension.DOMCSSRuleList

Parent: `DOMObject` ?? GType: `WebKitDOMCSSRuleList` ?? C type: `WebKitDOMCSSRuleList`

A #gulong

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_length | `DOMCSSRuleList.get_length() -> gulong` | webkit_dom_css_rule_list_get_length |  | A #gulong |
| item | `DOMCSSRuleList.item(index: gulong) -> DOMCSSRule` | webkit_dom_css_rule_list_item |  | A #WebKitDOMCSSRule |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| length | gulong | read |  |

### WebKit2WebExtension.DOMCSSStyleDeclaration

Parent: `DOMObject` ?? GType: `WebKitDOMCSSStyleDeclaration` ?? C type: `WebKitDOMCSSStyleDeclaration`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_css_text | `DOMCSSStyleDeclaration.get_css_text() -> utf8` | webkit_dom_css_style_declaration_get_css_text |  | A #gchar |
| get_length | `DOMCSSStyleDeclaration.get_length() -> gulong` | webkit_dom_css_style_declaration_get_length |  | A #gulong |
| get_parent_rule | `DOMCSSStyleDeclaration.get_parent_rule() -> DOMCSSRule` | webkit_dom_css_style_declaration_get_parent_rule |  | A #WebKitDOMCSSRule |
| get_property_priority | `DOMCSSStyleDeclaration.get_property_priority(propertyName: utf8) -> utf8` | webkit_dom_css_style_declaration_get_property_priority |  | A #gchar |
| get_property_shorthand | `DOMCSSStyleDeclaration.get_property_shorthand(propertyName: utf8) -> utf8` | webkit_dom_css_style_declaration_get_property_shorthand |  | A #gchar |
| get_property_value | `DOMCSSStyleDeclaration.get_property_value(propertyName: utf8) -> utf8` | webkit_dom_css_style_declaration_get_property_value |  | A #gchar |
| is_property_implicit | `DOMCSSStyleDeclaration.is_property_implicit(propertyName: utf8) -> gboolean` | webkit_dom_css_style_declaration_is_property_implicit |  | A #gboolean |
| item | `DOMCSSStyleDeclaration.item(index: gulong) -> utf8` | webkit_dom_css_style_declaration_item |  | A #gchar |
| remove_property | `DOMCSSStyleDeclaration.remove_property(propertyName: utf8) -> utf8 throws` | webkit_dom_css_style_declaration_remove_property |  | A #gchar |
| set_css_text | `DOMCSSStyleDeclaration.set_css_text(value: utf8) -> none throws` | webkit_dom_css_style_declaration_set_css_text |  | A #WebKitDOMCSSStyleDeclaration |
| set_property | `DOMCSSStyleDeclaration.set_property(propertyName: utf8, value: utf8, priority: utf8) -> none throws` | webkit_dom_css_style_declaration_set_property |  | A #WebKitDOMCSSStyleDeclaration |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| css-text | utf8 | read, write |  |
| length | gulong | read |  |
| parent-rule | DOMCSSRule | read |  |

### WebKit2WebExtension.DOMCSSStyleSheet

Parent: `DOMStyleSheet` ?? GType: `WebKitDOMCSSStyleSheet` ?? C type: `WebKitDOMCSSStyleSheet`

A #glong

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMStyleSheet |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_rule | `DOMCSSStyleSheet.add_rule(selector: utf8, style: utf8, index: gulong) -> glong throws` | webkit_dom_css_style_sheet_add_rule |  | A #glong |
| delete_rule | `DOMCSSStyleSheet.delete_rule(index: gulong) -> none throws` | webkit_dom_css_style_sheet_delete_rule |  | A #WebKitDOMCSSStyleSheet |
| get_css_rules | `DOMCSSStyleSheet.get_css_rules() -> DOMCSSRuleList` | webkit_dom_css_style_sheet_get_css_rules |  | A #WebKitDOMCSSRuleList |
| get_owner_rule | `DOMCSSStyleSheet.get_owner_rule() -> DOMCSSRule` | webkit_dom_css_style_sheet_get_owner_rule |  | A #WebKitDOMCSSRule |
| get_rules | `DOMCSSStyleSheet.get_rules() -> DOMCSSRuleList` | webkit_dom_css_style_sheet_get_rules |  | A #WebKitDOMCSSRuleList |
| insert_rule | `DOMCSSStyleSheet.insert_rule(rule: utf8, index: gulong) -> gulong throws` | webkit_dom_css_style_sheet_insert_rule |  | A #gulong |
| remove_rule | `DOMCSSStyleSheet.remove_rule(index: gulong) -> none throws` | webkit_dom_css_style_sheet_remove_rule |  | A #WebKitDOMCSSStyleSheet |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| css-rules | DOMCSSRuleList | read |  |
| owner-rule | DOMCSSRule | read |  |
| rules | DOMCSSRuleList | read |  |

### WebKit2WebExtension.DOMCSSValue

Parent: `DOMObject` ?? GType: `WebKitDOMCSSValue` ?? C type: `WebKitDOMCSSValue`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_css_text | `DOMCSSValue.get_css_text() -> utf8` | webkit_dom_css_value_get_css_text |  | A #gchar |
| get_css_value_type | `DOMCSSValue.get_css_value_type() -> gushort` | webkit_dom_css_value_get_css_value_type |  | A #gushort |
| set_css_text | `DOMCSSValue.set_css_text(value: utf8) -> none throws` | webkit_dom_css_value_set_css_text |  | A #WebKitDOMCSSValue |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| css-text | utf8 | read, write |  |
| css-value-type | guint | read |  |

### WebKit2WebExtension.DOMDocument

Parent: `DOMNode` ?? Subclasses: `DOMHTMLDocument` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMDocument` ?? C type: `WebKitDOMDocument`

A #WebKitDOMNode

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMNode |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| adopt_node | `DOMDocument.adopt_node(source: DOMNode) -> DOMNode throws` | webkit_dom_document_adopt_node |  | A #WebKitDOMNode |
| caret_range_from_point | `DOMDocument.caret_range_from_point(x: glong, y: glong) -> DOMRange` | webkit_dom_document_caret_range_from_point | 2.16 | A #WebKitDOMRange |
| create_attribute | `DOMDocument.create_attribute(name: utf8) -> DOMAttr throws` | webkit_dom_document_create_attribute |  | A #WebKitDOMAttr |
| create_attribute_ns | `DOMDocument.create_attribute_ns(namespaceURI: utf8?, qualifiedName: utf8) -> DOMAttr throws` | webkit_dom_document_create_attribute_ns |  | A #WebKitDOMAttr |
| create_cdata_section | `DOMDocument.create_cdata_section(data: utf8) -> DOMCDATASection throws` | webkit_dom_document_create_cdata_section |  | A #WebKitDOMCDATASection |
| create_comment | `DOMDocument.create_comment(data: utf8) -> DOMComment` | webkit_dom_document_create_comment |  | A #WebKitDOMComment |
| create_css_style_declaration | `DOMDocument.create_css_style_declaration() -> DOMCSSStyleDeclaration` | webkit_dom_document_create_css_style_declaration |  | A #WebKitDOMCSSStyleDeclaration |
| create_document_fragment | `DOMDocument.create_document_fragment() -> DOMDocumentFragment` | webkit_dom_document_create_document_fragment |  | A #WebKitDOMDocumentFragment |
| create_element | `DOMDocument.create_element(tagName: utf8) -> DOMElement throws` | webkit_dom_document_create_element |  | A #WebKitDOMElement |
| create_element_ns | `DOMDocument.create_element_ns(namespaceURI: utf8?, qualifiedName: utf8) -> DOMElement throws` | webkit_dom_document_create_element_ns |  | A #WebKitDOMElement |
| create_entity_reference | `DOMDocument.create_entity_reference(name: utf8?) -> DOMEntityReference throws` | webkit_dom_document_create_entity_reference |  | This function has been removed from the DOM spec and it just returns %NULL. |
| create_event | `DOMDocument.create_event(eventType: utf8) -> DOMEvent throws` | webkit_dom_document_create_event |  | A #WebKitDOMEvent |
| create_expression | `DOMDocument.create_expression(expression: utf8, resolver: DOMXPathNSResolver) -> DOMXPathExpression throws` | webkit_dom_document_create_expression |  | A #WebKitDOMXPathExpression |
| create_node_iterator | `DOMDocument.create_node_iterator(root: DOMNode, whatToShow: gulong, filter: DOMNodeFilter?, expandEntityReferences: gboolean) -> DOMNodeIterator throws` | webkit_dom_document_create_node_iterator |  | A #WebKitDOMNodeIterator |
| create_ns_resolver | `DOMDocument.create_ns_resolver(nodeResolver: DOMNode) -> DOMXPathNSResolver` | webkit_dom_document_create_ns_resolver |  | A #WebKitDOMXPathNSResolver |
| create_processing_instruction | `DOMDocument.create_processing_instruction(target: utf8, data: utf8) -> DOMProcessingInstruction throws` | webkit_dom_document_create_processing_instruction |  | A #WebKitDOMProcessingInstruction |
| create_range | `DOMDocument.create_range() -> DOMRange` | webkit_dom_document_create_range |  | A #WebKitDOMRange |
| create_text_node | `DOMDocument.create_text_node(data: utf8) -> DOMText` | webkit_dom_document_create_text_node |  | A #WebKitDOMText |
| create_tree_walker | `DOMDocument.create_tree_walker(root: DOMNode, whatToShow: gulong, filter: DOMNodeFilter?, expandEntityReferences: gboolean) -> DOMTreeWalker throws` | webkit_dom_document_create_tree_walker |  | A #WebKitDOMTreeWalker |
| element_from_point | `DOMDocument.element_from_point(x: glong, y: glong) -> DOMElement` | webkit_dom_document_element_from_point |  | A #WebKitDOMElement |
| evaluate | `DOMDocument.evaluate(expression: utf8, contextNode: DOMNode, resolver: DOMXPathNSResolver?, type: gushort, inResult: DOMXPathResult?) -> DOMXPathResult throws` | webkit_dom_document_evaluate |  | A #WebKitDOMXPathResult |
| exec_command | `DOMDocument.exec_command(command: utf8, userInterface: gboolean, value: utf8) -> gboolean` | webkit_dom_document_exec_command |  | A #gboolean |
| exit_pointer_lock | `DOMDocument.exit_pointer_lock() -> none` | webkit_dom_document_exit_pointer_lock | 2.16 | A #WebKitDOMDocument |
| get_active_element | `DOMDocument.get_active_element() -> DOMElement` | webkit_dom_document_get_active_element |  | A #WebKitDOMElement |
| get_anchors | `DOMDocument.get_anchors() -> DOMHTMLCollection` | webkit_dom_document_get_anchors |  | A #WebKitDOMHTMLCollection |
| get_applets | `DOMDocument.get_applets() -> DOMHTMLCollection` | webkit_dom_document_get_applets |  | A #WebKitDOMHTMLCollection |
| get_body | `DOMDocument.get_body() -> DOMHTMLElement` | webkit_dom_document_get_body |  | A #WebKitDOMHTMLElement |
| get_character_set | `DOMDocument.get_character_set() -> utf8` | webkit_dom_document_get_character_set |  | A #gchar |
| get_charset | `DOMDocument.get_charset() -> utf8` | webkit_dom_document_get_charset |  | A #gchar |
| get_child_element_count | `DOMDocument.get_child_element_count() -> gulong` | webkit_dom_document_get_child_element_count | 2.16 | A #gulong |
| get_children | `DOMDocument.get_children() -> DOMHTMLCollection` | webkit_dom_document_get_children | 2.16 | A #WebKitDOMHTMLCollection |
| get_compat_mode | `DOMDocument.get_compat_mode() -> utf8` | webkit_dom_document_get_compat_mode | 2.14 | A #gchar |
| get_content_type | `DOMDocument.get_content_type() -> utf8` | webkit_dom_document_get_content_type | 2.16 | A #gchar |
| get_cookie | `DOMDocument.get_cookie() -> utf8 throws` | webkit_dom_document_get_cookie |  | A #gchar |
| get_current_script | `DOMDocument.get_current_script() -> DOMHTMLScriptElement` | webkit_dom_document_get_current_script | 2.16 | A #WebKitDOMHTMLScriptElement |
| get_default_charset | `DOMDocument.get_default_charset() -> utf8` | webkit_dom_document_get_default_charset |  | A #gchar |
| get_default_view | `DOMDocument.get_default_view() -> DOMDOMWindow` | webkit_dom_document_get_default_view |  | A #WebKitDOMDOMWindow |
| get_design_mode | `DOMDocument.get_design_mode() -> utf8` | webkit_dom_document_get_design_mode | 2.14 | A #gchar |
| get_dir | `DOMDocument.get_dir() -> utf8` | webkit_dom_document_get_dir | 2.16 | A #gchar |
| get_doctype | `DOMDocument.get_doctype() -> DOMDocumentType` | webkit_dom_document_get_doctype |  | A #WebKitDOMDocumentType |
| get_document_element | `DOMDocument.get_document_element() -> DOMElement` | webkit_dom_document_get_document_element |  | A #WebKitDOMElement |
| get_document_uri | `DOMDocument.get_document_uri() -> utf8` | webkit_dom_document_get_document_uri |  | A #gchar |
| get_domain | `DOMDocument.get_domain() -> utf8` | webkit_dom_document_get_domain |  | A #gchar |
| get_element_by_id | `DOMDocument.get_element_by_id(elementId: utf8) -> DOMElement` | webkit_dom_document_get_element_by_id |  | A #WebKitDOMElement |
| get_elements_by_class_name | `DOMDocument.get_elements_by_class_name(class_name: utf8) -> DOMNodeList` | webkit_dom_document_get_elements_by_class_name |  | a #WebKitDOMNodeList |
| get_elements_by_class_name_as_html_collection | `DOMDocument.get_elements_by_class_name_as_html_collection(classNames: utf8) -> DOMHTMLCollection` | webkit_dom_document_get_elements_by_class_name_as_html_collection | 2.12 | A #WebKitDOMHTMLCollection |
| get_elements_by_name | `DOMDocument.get_elements_by_name(elementName: utf8) -> DOMNodeList` | webkit_dom_document_get_elements_by_name |  | A #WebKitDOMNodeList |
| get_elements_by_tag_name | `DOMDocument.get_elements_by_tag_name(tag_name: utf8) -> DOMNodeList` | webkit_dom_document_get_elements_by_tag_name |  | a #WebKitDOMNodeList |
| get_elements_by_tag_name_as_html_collection | `DOMDocument.get_elements_by_tag_name_as_html_collection(tagname: utf8) -> DOMHTMLCollection` | webkit_dom_document_get_elements_by_tag_name_as_html_collection | 2.12 | A #WebKitDOMHTMLCollection |
| get_elements_by_tag_name_ns | `DOMDocument.get_elements_by_tag_name_ns(namespace_uri: utf8, tag_name: utf8) -> DOMNodeList` | webkit_dom_document_get_elements_by_tag_name_ns |  | a #WebKitDOMNodeList |
| get_elements_by_tag_name_ns_as_html_collection | `DOMDocument.get_elements_by_tag_name_ns_as_html_collection(namespaceURI: utf8, localName: utf8) -> DOMHTMLCollection` | webkit_dom_document_get_elements_by_tag_name_ns_as_html_collection | 2.12 | A #WebKitDOMHTMLCollection |
| get_embeds | `DOMDocument.get_embeds() -> DOMHTMLCollection` | webkit_dom_document_get_embeds | 2.14 | A #WebKitDOMHTMLCollection |
| get_first_element_child | `DOMDocument.get_first_element_child() -> DOMElement` | webkit_dom_document_get_first_element_child | 2.16 | A #WebKitDOMElement |
| get_forms | `DOMDocument.get_forms() -> DOMHTMLCollection` | webkit_dom_document_get_forms |  | A #WebKitDOMHTMLCollection |
| get_head | `DOMDocument.get_head() -> DOMHTMLHeadElement` | webkit_dom_document_get_head |  | A #WebKitDOMHTMLHeadElement |
| get_hidden | `DOMDocument.get_hidden() -> gboolean` | webkit_dom_document_get_hidden | 2.16 | A #gboolean |
| get_images | `DOMDocument.get_images() -> DOMHTMLCollection` | webkit_dom_document_get_images |  | A #WebKitDOMHTMLCollection |
| get_implementation | `DOMDocument.get_implementation() -> DOMDOMImplementation` | webkit_dom_document_get_implementation |  | A #WebKitDOMDOMImplementation |
| get_input_encoding | `DOMDocument.get_input_encoding() -> utf8` | webkit_dom_document_get_input_encoding |  | A #gchar |
| get_last_element_child | `DOMDocument.get_last_element_child() -> DOMElement` | webkit_dom_document_get_last_element_child | 2.16 | A #WebKitDOMElement |
| get_last_modified | `DOMDocument.get_last_modified() -> utf8` | webkit_dom_document_get_last_modified |  | A #gchar |
| get_links | `DOMDocument.get_links() -> DOMHTMLCollection` | webkit_dom_document_get_links |  | A #WebKitDOMHTMLCollection |
| get_origin | `DOMDocument.get_origin() -> utf8` | webkit_dom_document_get_origin | 2.16 | A #gchar |
| get_override_style | `DOMDocument.get_override_style(element: DOMElement, pseudoElement: utf8?) -> DOMCSSStyleDeclaration` | webkit_dom_document_get_override_style |  | A #WebKitDOMCSSStyleDeclaration |
| get_plugins | `DOMDocument.get_plugins() -> DOMHTMLCollection` | webkit_dom_document_get_plugins | 2.14 | A #WebKitDOMHTMLCollection |
| get_pointer_lock_element | `DOMDocument.get_pointer_lock_element() -> DOMElement` | webkit_dom_document_get_pointer_lock_element | 2.16 | A #WebKitDOMElement |
| get_preferred_stylesheet_set | `DOMDocument.get_preferred_stylesheet_set() -> utf8` | webkit_dom_document_get_preferred_stylesheet_set |  | This function has been removed and does nothing. |
| get_ready_state | `DOMDocument.get_ready_state() -> utf8` | webkit_dom_document_get_ready_state |  | A #gchar |
| get_referrer | `DOMDocument.get_referrer() -> utf8` | webkit_dom_document_get_referrer |  | A #gchar |
| get_scripts | `DOMDocument.get_scripts() -> DOMHTMLCollection` | webkit_dom_document_get_scripts | 2.14 | A #WebKitDOMHTMLCollection |
| get_scrolling_element | `DOMDocument.get_scrolling_element() -> DOMElement` | webkit_dom_document_get_scrolling_element | 2.16 | A #WebKitDOMElement |
| get_selected_stylesheet_set | `DOMDocument.get_selected_stylesheet_set() -> utf8` | webkit_dom_document_get_selected_stylesheet_set |  | This function has been removed and does nothing. |
| get_style_sheets | `DOMDocument.get_style_sheets() -> DOMStyleSheetList` | webkit_dom_document_get_style_sheets |  | A #WebKitDOMStyleSheetList |
| get_title | `DOMDocument.get_title() -> utf8` | webkit_dom_document_get_title |  | A #gchar |
| get_url | `DOMDocument.get_url() -> utf8` | webkit_dom_document_get_url |  | A #gchar |
| get_visibility_state | `DOMDocument.get_visibility_state() -> utf8` | webkit_dom_document_get_visibility_state | 2.16 | A #gchar |
| get_webkit_current_fullscreen_element | `DOMDocument.get_webkit_current_fullscreen_element() -> DOMElement` | webkit_dom_document_get_webkit_current_fullscreen_element | 2.16 | A #WebKitDOMElement |
| get_webkit_fullscreen_element | `DOMDocument.get_webkit_fullscreen_element() -> DOMElement` | webkit_dom_document_get_webkit_fullscreen_element | 2.16 | A #WebKitDOMElement |
| get_webkit_fullscreen_enabled | `DOMDocument.get_webkit_fullscreen_enabled() -> gboolean` | webkit_dom_document_get_webkit_fullscreen_enabled | 2.16 | A #gboolean |
| get_webkit_fullscreen_keyboard_input_allowed | `DOMDocument.get_webkit_fullscreen_keyboard_input_allowed() -> gboolean` | webkit_dom_document_get_webkit_fullscreen_keyboard_input_allowed | 2.16 | A #gboolean |
| get_webkit_is_fullscreen | `DOMDocument.get_webkit_is_fullscreen() -> gboolean` | webkit_dom_document_get_webkit_is_fullscreen | 2.16 | A #gboolean |
| get_xml_encoding | `DOMDocument.get_xml_encoding() -> utf8` | webkit_dom_document_get_xml_encoding |  | A #gchar |
| get_xml_standalone | `DOMDocument.get_xml_standalone() -> gboolean` | webkit_dom_document_get_xml_standalone |  | A #gboolean |
| get_xml_version | `DOMDocument.get_xml_version() -> utf8` | webkit_dom_document_get_xml_version |  | A #gchar |
| has_focus | `DOMDocument.has_focus() -> gboolean` | webkit_dom_document_has_focus |  | A #gboolean |
| import_node | `DOMDocument.import_node(importedNode: DOMNode, deep: gboolean) -> DOMNode throws` | webkit_dom_document_import_node |  | A #WebKitDOMNode |
| query_command_enabled | `DOMDocument.query_command_enabled(command: utf8) -> gboolean` | webkit_dom_document_query_command_enabled |  | A #gboolean |
| query_command_indeterm | `DOMDocument.query_command_indeterm(command: utf8) -> gboolean` | webkit_dom_document_query_command_indeterm |  | A #gboolean |
| query_command_state | `DOMDocument.query_command_state(command: utf8) -> gboolean` | webkit_dom_document_query_command_state |  | A #gboolean |
| query_command_supported | `DOMDocument.query_command_supported(command: utf8) -> gboolean` | webkit_dom_document_query_command_supported |  | A #gboolean |
| query_command_value | `DOMDocument.query_command_value(command: utf8) -> utf8` | webkit_dom_document_query_command_value |  | A #gchar |
| query_selector | `DOMDocument.query_selector(selectors: utf8) -> DOMElement throws` | webkit_dom_document_query_selector |  | A #WebKitDOMElement |
| query_selector_all | `DOMDocument.query_selector_all(selectors: utf8) -> DOMNodeList throws` | webkit_dom_document_query_selector_all |  | A #WebKitDOMNodeList |
| set_body | `DOMDocument.set_body(value: DOMHTMLElement) -> none throws` | webkit_dom_document_set_body |  | A #WebKitDOMDocument |
| set_charset | `DOMDocument.set_charset(value: utf8) -> none` | webkit_dom_document_set_charset |  | A #WebKitDOMDocument |
| set_cookie | `DOMDocument.set_cookie(value: utf8) -> none throws` | webkit_dom_document_set_cookie |  | A #WebKitDOMDocument |
| set_design_mode | `DOMDocument.set_design_mode(value: utf8) -> none` | webkit_dom_document_set_design_mode | 2.14 | A #WebKitDOMDocument |
| set_dir | `DOMDocument.set_dir(value: utf8) -> none` | webkit_dom_document_set_dir | 2.16 | A #WebKitDOMDocument |
| set_document_uri | `DOMDocument.set_document_uri(value: utf8) -> none` | webkit_dom_document_set_document_uri |  | A #WebKitDOMDocument |
| set_selected_stylesheet_set | `DOMDocument.set_selected_stylesheet_set(value: utf8) -> none` | webkit_dom_document_set_selected_stylesheet_set |  | This function has been removed and does nothing. |
| set_title | `DOMDocument.set_title(value: utf8) -> none` | webkit_dom_document_set_title |  | A #WebKitDOMDocument |
| set_xml_standalone | `DOMDocument.set_xml_standalone(value: gboolean) -> none throws` | webkit_dom_document_set_xml_standalone |  | A #WebKitDOMDocument |
| set_xml_version | `DOMDocument.set_xml_version(value: utf8) -> none throws` | webkit_dom_document_set_xml_version |  | A #WebKitDOMDocument |
| webkit_cancel_fullscreen | `DOMDocument.webkit_cancel_fullscreen() -> none` | webkit_dom_document_webkit_cancel_fullscreen | 2.16 | A #WebKitDOMDocument |
| webkit_exit_fullscreen | `DOMDocument.webkit_exit_fullscreen() -> none` | webkit_dom_document_webkit_exit_fullscreen | 2.16 | A #WebKitDOMDocument |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| active-element | DOMElement | read |  |
| anchors | DOMHTMLCollection | read |  |
| applets | DOMHTMLCollection | read |  |
| body | DOMHTMLElement | read |  |
| character-set | utf8 | read |  |
| charset | utf8 | read, write |  |
| child-element-count | gulong | read |  |
| children | DOMHTMLCollection | read |  |
| compat-mode | utf8 | read |  |
| content-type | utf8 | read |  |
| cookie | utf8 | read, write |  |
| current-script | DOMHTMLScriptElement | read |  |
| default-view | DOMDOMWindow | read |  |
| design-mode | utf8 | read, write |  |
| dir | utf8 | read, write |  |
| doctype | DOMDocumentType | read |  |
| document-element | DOMElement | read |  |
| document-uri | utf8 | read, write |  |
| domain | utf8 | read |  |
| embeds | DOMHTMLCollection | read |  |
| first-element-child | DOMElement | read |  |
| forms | DOMHTMLCollection | read |  |
| head | DOMHTMLHeadElement | read |  |
| hidden | gboolean | read |  |
| images | DOMHTMLCollection | read |  |
| implementation | DOMDOMImplementation | read |  |
| input-encoding | utf8 | read |  |
| last-element-child | DOMElement | read |  |
| last-modified | utf8 | read |  |
| links | DOMHTMLCollection | read |  |
| origin | utf8 | read |  |
| plugins | DOMHTMLCollection | read |  |
| pointer-lock-element | DOMElement | read |  |
| preferred-stylesheet-set | utf8 | read |  |
| ready-state | utf8 | read |  |
| referrer | utf8 | read |  |
| scripts | DOMHTMLCollection | read |  |
| scrolling-element | DOMElement | read |  |
| selected-stylesheet-set | utf8 | read, write |  |
| style-sheets | DOMStyleSheetList | read |  |
| title | utf8 | read, write |  |
| url | utf8 | read |  |
| visibility-state | utf8 | read |  |
| webkit-current-full-screen-element | DOMElement | read |  |
| webkit-full-screen-keyboard-input-allowed | gboolean | read |  |
| webkit-fullscreen-element | DOMElement | read |  |
| webkit-fullscreen-enabled | gboolean | read |  |
| webkit-is-full-screen | gboolean | read |  |
| xml-encoding | utf8 | read |  |
| xml-standalone | gboolean | read, write |  |
| xml-version | utf8 | read, write |  |

### WebKit2WebExtension.DOMDocumentFragment

Parent: `DOMNode` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMDocumentFragment` ?? C type: `WebKitDOMDocumentFragment`

A #gulong

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMNode |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_child_element_count | `DOMDocumentFragment.get_child_element_count() -> gulong` | webkit_dom_document_fragment_get_child_element_count | 2.16 | A #gulong |
| get_children | `DOMDocumentFragment.get_children() -> DOMHTMLCollection` | webkit_dom_document_fragment_get_children | 2.16 | A #WebKitDOMHTMLCollection |
| get_element_by_id | `DOMDocumentFragment.get_element_by_id(elementId: utf8) -> DOMElement` | webkit_dom_document_fragment_get_element_by_id | 2.16 | A #WebKitDOMElement |
| get_first_element_child | `DOMDocumentFragment.get_first_element_child() -> DOMElement` | webkit_dom_document_fragment_get_first_element_child | 2.16 | A #WebKitDOMElement |
| get_last_element_child | `DOMDocumentFragment.get_last_element_child() -> DOMElement` | webkit_dom_document_fragment_get_last_element_child | 2.16 | A #WebKitDOMElement |
| query_selector | `DOMDocumentFragment.query_selector(selectors: utf8) -> DOMElement throws` | webkit_dom_document_fragment_query_selector | 2.16 | A #WebKitDOMElement |
| query_selector_all | `DOMDocumentFragment.query_selector_all(selectors: utf8) -> DOMNodeList throws` | webkit_dom_document_fragment_query_selector_all | 2.16 | A #WebKitDOMNodeList |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| child-element-count | gulong | read |  |
| children | DOMHTMLCollection | read |  |
| first-element-child | DOMElement | read |  |
| last-element-child | DOMElement | read |  |

### WebKit2WebExtension.DOMDocumentType

Parent: `DOMNode` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMDocumentType` ?? C type: `WebKitDOMDocumentType`

A #WebKitDOMNamedNodeMap

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMNode |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_entities | `DOMDocumentType.get_entities() -> DOMNamedNodeMap` | webkit_dom_document_type_get_entities |  | A #WebKitDOMNamedNodeMap |
| get_internal_subset | `DOMDocumentType.get_internal_subset() -> utf8` | webkit_dom_document_type_get_internal_subset |  | A #gchar |
| get_name | `DOMDocumentType.get_name() -> utf8` | webkit_dom_document_type_get_name |  | A #gchar |
| get_notations | `DOMDocumentType.get_notations() -> DOMNamedNodeMap` | webkit_dom_document_type_get_notations |  | A #WebKitDOMNamedNodeMap |
| get_public_id | `DOMDocumentType.get_public_id() -> utf8` | webkit_dom_document_type_get_public_id |  | A #gchar |
| get_system_id | `DOMDocumentType.get_system_id() -> utf8` | webkit_dom_document_type_get_system_id |  | A #gchar |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| entities | DOMNamedNodeMap | read |  |
| internal-subset | utf8 | read |  |
| name | utf8 | read |  |
| notations | DOMNamedNodeMap | read |  |
| public-id | utf8 | read |  |
| system-id | utf8 | read |  |

### WebKit2WebExtension.DOMDOMImplementation

Parent: `DOMObject` ?? GType: `WebKitDOMDOMImplementation` ?? C type: `WebKitDOMDOMImplementation`

A #WebKitDOMCSSStyleSheet

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| create_css_style_sheet | `DOMDOMImplementation.create_css_style_sheet(title: utf8, media: utf8) -> DOMCSSStyleSheet throws` | webkit_dom_dom_implementation_create_css_style_sheet |  | A #WebKitDOMCSSStyleSheet |
| create_document | `DOMDOMImplementation.create_document(namespaceURI: utf8?, qualifiedName: utf8, doctype: DOMDocumentType?) -> DOMDocument throws` | webkit_dom_dom_implementation_create_document |  | A #WebKitDOMDocument |
| create_document_type | `DOMDOMImplementation.create_document_type(qualifiedName: utf8, publicId: utf8, systemId: utf8) -> DOMDocumentType throws` | webkit_dom_dom_implementation_create_document_type |  | A #WebKitDOMDocumentType |
| create_html_document | `DOMDOMImplementation.create_html_document(title: utf8) -> DOMHTMLDocument` | webkit_dom_dom_implementation_create_html_document |  | A #WebKitDOMHTMLDocument |
| has_feature | `DOMDOMImplementation.has_feature(feature: utf8, version: utf8) -> gboolean` | webkit_dom_dom_implementation_has_feature |  | A #gboolean |

### WebKit2WebExtension.DOMDOMSelection

Parent: `DOMObject` ?? GType: `WebKitDOMDOMSelection` ?? C type: `WebKitDOMDOMSelection`

A #WebKitDOMDOMSelection

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_range | `DOMDOMSelection.add_range(range: DOMRange) -> none` | webkit_dom_dom_selection_add_range | 2.16 | A #WebKitDOMDOMSelection |
| collapse | `DOMDOMSelection.collapse(node: DOMNode, offset: gulong) -> none` | webkit_dom_dom_selection_collapse | 2.16 | A #WebKitDOMDOMSelection |
| collapse_to_end | `DOMDOMSelection.collapse_to_end() -> none throws` | webkit_dom_dom_selection_collapse_to_end | 2.16 | A #WebKitDOMDOMSelection |
| collapse_to_start | `DOMDOMSelection.collapse_to_start() -> none throws` | webkit_dom_dom_selection_collapse_to_start | 2.16 | A #WebKitDOMDOMSelection |
| contains_node | `DOMDOMSelection.contains_node(node: DOMNode, allowPartial: gboolean) -> gboolean` | webkit_dom_dom_selection_contains_node | 2.16 | A #gboolean |
| delete_from_document | `DOMDOMSelection.delete_from_document() -> none` | webkit_dom_dom_selection_delete_from_document | 2.16 | A #WebKitDOMDOMSelection |
| empty | `DOMDOMSelection.empty() -> none` | webkit_dom_dom_selection_empty | 2.16 | A #WebKitDOMDOMSelection |
| extend | `DOMDOMSelection.extend(node: DOMNode, offset: gulong) -> none throws` | webkit_dom_dom_selection_extend | 2.16 | A #WebKitDOMDOMSelection |
| get_anchor_node | `DOMDOMSelection.get_anchor_node() -> DOMNode` | webkit_dom_dom_selection_get_anchor_node | 2.16 | A #WebKitDOMNode |
| get_anchor_offset | `DOMDOMSelection.get_anchor_offset() -> gulong` | webkit_dom_dom_selection_get_anchor_offset | 2.16 | A #gulong |
| get_base_node | `DOMDOMSelection.get_base_node() -> DOMNode` | webkit_dom_dom_selection_get_base_node | 2.16 | A #WebKitDOMNode |
| get_base_offset | `DOMDOMSelection.get_base_offset() -> gulong` | webkit_dom_dom_selection_get_base_offset | 2.16 | A #gulong |
| get_extent_node | `DOMDOMSelection.get_extent_node() -> DOMNode` | webkit_dom_dom_selection_get_extent_node | 2.16 | A #WebKitDOMNode |
| get_extent_offset | `DOMDOMSelection.get_extent_offset() -> gulong` | webkit_dom_dom_selection_get_extent_offset | 2.16 | A #gulong |
| get_focus_node | `DOMDOMSelection.get_focus_node() -> DOMNode` | webkit_dom_dom_selection_get_focus_node | 2.16 | A #WebKitDOMNode |
| get_focus_offset | `DOMDOMSelection.get_focus_offset() -> gulong` | webkit_dom_dom_selection_get_focus_offset | 2.16 | A #gulong |
| get_is_collapsed | `DOMDOMSelection.get_is_collapsed() -> gboolean` | webkit_dom_dom_selection_get_is_collapsed | 2.16 | A #gboolean |
| get_range_at | `DOMDOMSelection.get_range_at(index: gulong) -> DOMRange throws` | webkit_dom_dom_selection_get_range_at | 2.16 | A #WebKitDOMRange |
| get_range_count | `DOMDOMSelection.get_range_count() -> gulong` | webkit_dom_dom_selection_get_range_count | 2.16 | A #gulong |
| get_selection_type | `DOMDOMSelection.get_selection_type() -> utf8` | webkit_dom_dom_selection_get_selection_type | 2.16 | A #gchar |
| modify | `DOMDOMSelection.modify(alter: utf8, direction: utf8, granularity: utf8) -> none` | webkit_dom_dom_selection_modify | 2.16 | A #WebKitDOMDOMSelection |
| remove_all_ranges | `DOMDOMSelection.remove_all_ranges() -> none` | webkit_dom_dom_selection_remove_all_ranges | 2.16 | A #WebKitDOMDOMSelection |
| select_all_children | `DOMDOMSelection.select_all_children(node: DOMNode) -> none` | webkit_dom_dom_selection_select_all_children | 2.16 | A #WebKitDOMDOMSelection |
| set_base_and_extent | `DOMDOMSelection.set_base_and_extent(baseNode: DOMNode, baseOffset: gulong, extentNode: DOMNode, extentOffset: gulong) -> none` | webkit_dom_dom_selection_set_base_and_extent | 2.16 | A #WebKitDOMDOMSelection |
| set_position | `DOMDOMSelection.set_position(node: DOMNode, offset: gulong) -> none` | webkit_dom_dom_selection_set_position | 2.16 | A #WebKitDOMDOMSelection |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| anchor-node | DOMNode | read |  |
| anchor-offset | gulong | read |  |
| base-node | DOMNode | read |  |
| base-offset | gulong | read |  |
| extent-node | DOMNode | read |  |
| extent-offset | gulong | read |  |
| focus-node | DOMNode | read |  |
| focus-offset | gulong | read |  |
| is-collapsed | gboolean | read |  |
| range-count | gulong | read |  |
| type | utf8 | read |  |

### WebKit2WebExtension.DOMDOMTokenList

Parent: `DOMObject` ?? GType: `WebKitDOMDOMTokenList` ?? C type: `WebKitDOMDOMTokenList`

A #WebKitDOMDOMTokenList

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `DOMDOMTokenList.add(error: GLib.Error, ...: void) -> none` | webkit_dom_dom_token_list_add | 2.16 | A #WebKitDOMDOMTokenList |
| contains | `DOMDOMTokenList.contains(token: utf8) -> gboolean` | webkit_dom_dom_token_list_contains | 2.16 | A #gboolean |
| get_length | `DOMDOMTokenList.get_length() -> gulong` | webkit_dom_dom_token_list_get_length | 2.16 | A #gulong |
| get_value | `DOMDOMTokenList.get_value() -> utf8` | webkit_dom_dom_token_list_get_value | 2.16 | A #gchar |
| item | `DOMDOMTokenList.item(index: gulong) -> utf8` | webkit_dom_dom_token_list_item | 2.16 | A #gchar |
| remove | `DOMDOMTokenList.remove(error: GLib.Error, ...: void) -> none` | webkit_dom_dom_token_list_remove | 2.16 | A #WebKitDOMDOMTokenList |
| replace | `DOMDOMTokenList.replace(token: utf8, newToken: utf8) -> none throws` | webkit_dom_dom_token_list_replace | 2.16 | A #WebKitDOMDOMTokenList |
| set_value | `DOMDOMTokenList.set_value(value: utf8) -> none` | webkit_dom_dom_token_list_set_value | 2.16 | A #WebKitDOMDOMTokenList |
| toggle | `DOMDOMTokenList.toggle(token: utf8, force: gboolean) -> gboolean throws` | webkit_dom_dom_token_list_toggle | 2.16 | A #gboolean |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| length | gulong | read |  |
| value | utf8 | read, write |  |

### WebKit2WebExtension.DOMDOMWindow

Parent: `DOMObject` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMDOMWindow` ?? C type: `WebKitDOMDOMWindow`

A #WebKitDOMDOMWindow

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alert | `DOMDOMWindow.alert(message: utf8) -> none` | webkit_dom_dom_window_alert | 2.16 | A #WebKitDOMDOMWindow |
| blur | `DOMDOMWindow.blur() -> none` | webkit_dom_dom_window_blur | 2.16 | A #WebKitDOMDOMWindow |
| capture_events | `DOMDOMWindow.capture_events() -> none` | webkit_dom_dom_window_capture_events | 2.16 | A #WebKitDOMDOMWindow |
| close | `DOMDOMWindow.close() -> none` | webkit_dom_dom_window_close | 2.16 | A #WebKitDOMDOMWindow |
| confirm | `DOMDOMWindow.confirm(message: utf8) -> gboolean` | webkit_dom_dom_window_confirm | 2.16 | A #gboolean |
| find | `DOMDOMWindow.find(string: utf8, caseSensitive: gboolean, backwards: gboolean, wrap: gboolean, wholeWord: gboolean, searchInFrames: gboolean, showDialog: gboolean) -> gboolean` | webkit_dom_dom_window_find | 2.16 | A #gboolean |
| focus | `DOMDOMWindow.focus() -> none` | webkit_dom_dom_window_focus | 2.16 | A #WebKitDOMDOMWindow |
| get_closed | `DOMDOMWindow.get_closed() -> gboolean` | webkit_dom_dom_window_get_closed | 2.16 | A #gboolean |
| get_computed_style | `DOMDOMWindow.get_computed_style(element: DOMElement, pseudoElement: utf8?) -> DOMCSSStyleDeclaration` | webkit_dom_dom_window_get_computed_style | 2.16 | A #WebKitDOMCSSStyleDeclaration |
| get_default_status | `DOMDOMWindow.get_default_status() -> utf8` | webkit_dom_dom_window_get_default_status | 2.16 | A #gchar |
| get_device_pixel_ratio | `DOMDOMWindow.get_device_pixel_ratio() -> gdouble` | webkit_dom_dom_window_get_device_pixel_ratio | 2.16 | A #gdouble |
| get_document | `DOMDOMWindow.get_document() -> DOMDocument` | webkit_dom_dom_window_get_document | 2.16 | A #WebKitDOMDocument |
| get_frame_element | `DOMDOMWindow.get_frame_element() -> DOMElement` | webkit_dom_dom_window_get_frame_element | 2.16 | A #WebKitDOMElement |
| get_frames | `DOMDOMWindow.get_frames() -> DOMDOMWindow` | webkit_dom_dom_window_get_frames | 2.16 | A #WebKitDOMDOMWindow |
| get_inner_height | `DOMDOMWindow.get_inner_height() -> glong` | webkit_dom_dom_window_get_inner_height | 2.16 | A #glong |
| get_inner_width | `DOMDOMWindow.get_inner_width() -> glong` | webkit_dom_dom_window_get_inner_width | 2.16 | A #glong |
| get_length | `DOMDOMWindow.get_length() -> gulong` | webkit_dom_dom_window_get_length | 2.16 | A #gulong |
| get_name | `DOMDOMWindow.get_name() -> utf8` | webkit_dom_dom_window_get_name | 2.16 | A #gchar |
| get_offscreen_buffering | `DOMDOMWindow.get_offscreen_buffering() -> gboolean` | webkit_dom_dom_window_get_offscreen_buffering | 2.16 | A #gboolean |
| get_opener | `DOMDOMWindow.get_opener() -> DOMDOMWindow` | webkit_dom_dom_window_get_opener | 2.16 | A #WebKitDOMDOMWindow |
| get_orientation | `DOMDOMWindow.get_orientation() -> glong` | webkit_dom_dom_window_get_orientation | 2.16 | A #glong |
| get_outer_height | `DOMDOMWindow.get_outer_height() -> glong` | webkit_dom_dom_window_get_outer_height | 2.16 | A #glong |
| get_outer_width | `DOMDOMWindow.get_outer_width() -> glong` | webkit_dom_dom_window_get_outer_width | 2.16 | A #glong |
| get_page_x_offset | `DOMDOMWindow.get_page_x_offset() -> glong` | webkit_dom_dom_window_get_page_x_offset | 2.16 | A #glong |
| get_page_y_offset | `DOMDOMWindow.get_page_y_offset() -> glong` | webkit_dom_dom_window_get_page_y_offset | 2.16 | A #glong |
| get_parent | `DOMDOMWindow.get_parent() -> DOMDOMWindow` | webkit_dom_dom_window_get_parent | 2.16 | A #WebKitDOMDOMWindow |
| get_screen_left | `DOMDOMWindow.get_screen_left() -> glong` | webkit_dom_dom_window_get_screen_left | 2.16 | A #glong |
| get_screen_top | `DOMDOMWindow.get_screen_top() -> glong` | webkit_dom_dom_window_get_screen_top | 2.16 | A #glong |
| get_screen_x | `DOMDOMWindow.get_screen_x() -> glong` | webkit_dom_dom_window_get_screen_x | 2.16 | A #glong |
| get_screen_y | `DOMDOMWindow.get_screen_y() -> glong` | webkit_dom_dom_window_get_screen_y | 2.16 | A #glong |
| get_scroll_x | `DOMDOMWindow.get_scroll_x() -> glong` | webkit_dom_dom_window_get_scroll_x | 2.16 | A #glong |
| get_scroll_y | `DOMDOMWindow.get_scroll_y() -> glong` | webkit_dom_dom_window_get_scroll_y | 2.16 | A #glong |
| get_selection | `DOMDOMWindow.get_selection() -> DOMDOMSelection` | webkit_dom_dom_window_get_selection | 2.16 | A #WebKitDOMDOMSelection |
| get_self | `DOMDOMWindow.get_self() -> DOMDOMWindow` | webkit_dom_dom_window_get_self | 2.16 | A #WebKitDOMDOMWindow |
| get_status | `DOMDOMWindow.get_status() -> utf8` | webkit_dom_dom_window_get_status | 2.16 | A #gchar |
| get_top | `DOMDOMWindow.get_top() -> DOMDOMWindow` | webkit_dom_dom_window_get_top | 2.16 | A #WebKitDOMDOMWindow |
| get_window | `DOMDOMWindow.get_window() -> DOMDOMWindow` | webkit_dom_dom_window_get_window | 2.16 | A #WebKitDOMDOMWindow |
| move_by | `DOMDOMWindow.move_by(x: gfloat, y: gfloat) -> none` | webkit_dom_dom_window_move_by | 2.16 | A #WebKitDOMDOMWindow |
| move_to | `DOMDOMWindow.move_to(x: gfloat, y: gfloat) -> none` | webkit_dom_dom_window_move_to | 2.16 | A #WebKitDOMDOMWindow |
| print | `DOMDOMWindow.print() -> none` | webkit_dom_dom_window_print | 2.16 | A #WebKitDOMDOMWindow |
| prompt | `DOMDOMWindow.prompt(message: utf8, defaultValue: utf8) -> utf8` | webkit_dom_dom_window_prompt | 2.16 | A #gchar |
| release_events | `DOMDOMWindow.release_events() -> none` | webkit_dom_dom_window_release_events | 2.16 | A #WebKitDOMDOMWindow |
| resize_by | `DOMDOMWindow.resize_by(x: gfloat, y: gfloat) -> none` | webkit_dom_dom_window_resize_by | 2.16 | A #WebKitDOMDOMWindow |
| resize_to | `DOMDOMWindow.resize_to(width: gfloat, height: gfloat) -> none` | webkit_dom_dom_window_resize_to | 2.16 | A #WebKitDOMDOMWindow |
| scroll_by | `DOMDOMWindow.scroll_by(x: gdouble, y: gdouble) -> none` | webkit_dom_dom_window_scroll_by | 2.16 | A #WebKitDOMDOMWindow |
| scroll_to | `DOMDOMWindow.scroll_to(x: gdouble, y: gdouble) -> none` | webkit_dom_dom_window_scroll_to | 2.16 | A #WebKitDOMDOMWindow |
| set_default_status | `DOMDOMWindow.set_default_status(value: utf8) -> none` | webkit_dom_dom_window_set_default_status | 2.16 | A #WebKitDOMDOMWindow |
| set_name | `DOMDOMWindow.set_name(value: utf8) -> none` | webkit_dom_dom_window_set_name | 2.16 | A #WebKitDOMDOMWindow |
| set_status | `DOMDOMWindow.set_status(value: utf8) -> none` | webkit_dom_dom_window_set_status | 2.16 | A #WebKitDOMDOMWindow |
| stop | `DOMDOMWindow.stop() -> none` | webkit_dom_dom_window_stop | 2.16 | A #WebKitDOMDOMWindow |
| webkit_message_handlers_post_message | `DOMDOMWindow.webkit_message_handlers_post_message(handler: utf8, message: utf8) -> gboolean` | webkit_dom_dom_window_webkit_message_handlers_post_message |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| closed | gboolean | read |  |
| default-status | utf8 | read, write |  |
| device-pixel-ratio | gdouble | read |  |
| document | DOMDocument | read |  |
| frame-element | DOMElement | read |  |
| frames | DOMDOMWindow | read |  |
| inner-height | glong | read |  |
| inner-width | glong | read |  |
| length | gulong | read |  |
| name | utf8 | read, write |  |
| offscreen-buffering | gboolean | read |  |
| opener | DOMDOMWindow | read |  |
| orientation | glong | read |  |
| outer-height | glong | read |  |
| outer-width | glong | read |  |
| page-x-offset | glong | read |  |
| page-y-offset | glong | read |  |
| parent | DOMDOMWindow | read |  |
| screen-left | glong | read |  |
| screen-top | glong | read |  |
| screen-x | glong | read |  |
| screen-y | glong | read |  |
| scroll-x | glong | read |  |
| scroll-y | glong | read |  |
| self | DOMDOMWindow | read |  |
| status | utf8 | read, write |  |
| top | DOMDOMWindow | read |  |
| window | DOMDOMWindow | read |  |

### WebKit2WebExtension.DOMElement

Parent: `DOMNode` ?? Subclasses: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMElement` ?? C type: `WebKitDOMElement`

A #WebKitDOMElement

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMNode |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| blur | `DOMElement.blur() -> none` | webkit_dom_element_blur |  | A #WebKitDOMElement |
| closest | `DOMElement.closest(selectors: utf8) -> DOMElement throws` | webkit_dom_element_closest | 2.16 | A #WebKitDOMElement |
| focus | `DOMElement.focus() -> none` | webkit_dom_element_focus |  | A #WebKitDOMElement |
| get_attribute | `DOMElement.get_attribute(name: utf8) -> utf8` | webkit_dom_element_get_attribute |  | A #gchar |
| get_attribute_node | `DOMElement.get_attribute_node(name: utf8) -> DOMAttr` | webkit_dom_element_get_attribute_node |  | A #WebKitDOMAttr |
| get_attribute_node_ns | `DOMElement.get_attribute_node_ns(namespaceURI: utf8, localName: utf8) -> DOMAttr` | webkit_dom_element_get_attribute_node_ns |  | A #WebKitDOMAttr |
| get_attribute_ns | `DOMElement.get_attribute_ns(namespaceURI: utf8, localName: utf8) -> utf8` | webkit_dom_element_get_attribute_ns |  | A #gchar |
| get_attributes | `DOMElement.get_attributes() -> DOMNamedNodeMap` | webkit_dom_element_get_attributes |  | A #WebKitDOMNamedNodeMap |
| get_bounding_client_rect | `DOMElement.get_bounding_client_rect() -> DOMClientRect` | webkit_dom_element_get_bounding_client_rect | 2.18 | Returns a #WebKitDOMClientRect representing the size and position of @self relative to the viewport. |
| get_child_element_count | `DOMElement.get_child_element_count() -> gulong` | webkit_dom_element_get_child_element_count |  | A #gulong |
| get_children | `DOMElement.get_children() -> DOMHTMLCollection` | webkit_dom_element_get_children | 2.10 | A #WebKitDOMHTMLCollection |
| get_class_list | `DOMElement.get_class_list() -> DOMDOMTokenList` | webkit_dom_element_get_class_list | 2.16 | A #WebKitDOMDOMTokenList |
| get_class_name | `DOMElement.get_class_name() -> utf8` | webkit_dom_element_get_class_name |  | A #gchar |
| get_client_height | `DOMElement.get_client_height() -> gdouble` | webkit_dom_element_get_client_height |  | A #gdouble |
| get_client_left | `DOMElement.get_client_left() -> gdouble` | webkit_dom_element_get_client_left |  | A #gdouble |
| get_client_rects | `DOMElement.get_client_rects() -> DOMClientRectList` | webkit_dom_element_get_client_rects | 2.18 | Returns a collection of #WebKitDOMClientRect objects, each of which describe the size and position of a CSS border box relative to the viewport. |
| get_client_top | `DOMElement.get_client_top() -> gdouble` | webkit_dom_element_get_client_top |  | A #gdouble |
| get_client_width | `DOMElement.get_client_width() -> gdouble` | webkit_dom_element_get_client_width |  | A #gdouble |
| get_elements_by_class_name | `DOMElement.get_elements_by_class_name(class_name: utf8) -> DOMNodeList` | webkit_dom_element_get_elements_by_class_name |  | a #WebKitDOMNodeList |
| get_elements_by_class_name_as_html_collection | `DOMElement.get_elements_by_class_name_as_html_collection(name: utf8) -> DOMHTMLCollection` | webkit_dom_element_get_elements_by_class_name_as_html_collection | 2.12 | A #WebKitDOMHTMLCollection |
| get_elements_by_tag_name | `DOMElement.get_elements_by_tag_name(tag_name: utf8) -> DOMNodeList` | webkit_dom_element_get_elements_by_tag_name |  | a #WebKitDOMNodeList |
| get_elements_by_tag_name_as_html_collection | `DOMElement.get_elements_by_tag_name_as_html_collection(name: utf8) -> DOMHTMLCollection` | webkit_dom_element_get_elements_by_tag_name_as_html_collection | 2.12 | A #WebKitDOMHTMLCollection |
| get_elements_by_tag_name_ns | `DOMElement.get_elements_by_tag_name_ns(namespace_uri: utf8, tag_name: utf8) -> DOMNodeList` | webkit_dom_element_get_elements_by_tag_name_ns |  | a #WebKitDOMNodeList |
| get_elements_by_tag_name_ns_as_html_collection | `DOMElement.get_elements_by_tag_name_ns_as_html_collection(namespaceURI: utf8, localName: utf8) -> DOMHTMLCollection` | webkit_dom_element_get_elements_by_tag_name_ns_as_html_collection | 2.12 | A #WebKitDOMHTMLCollection |
| get_first_element_child | `DOMElement.get_first_element_child() -> DOMElement` | webkit_dom_element_get_first_element_child |  | A #WebKitDOMElement |
| get_id | `DOMElement.get_id() -> utf8` | webkit_dom_element_get_id |  | A #gchar |
| get_inner_html | `DOMElement.get_inner_html() -> utf8` | webkit_dom_element_get_inner_html | 2.8 | A #gchar |
| get_last_element_child | `DOMElement.get_last_element_child() -> DOMElement` | webkit_dom_element_get_last_element_child |  | A #WebKitDOMElement |
| get_local_name | `DOMElement.get_local_name() -> utf8` | webkit_dom_element_get_local_name | 2.14 | A #gchar |
| get_namespace_uri | `DOMElement.get_namespace_uri() -> utf8` | webkit_dom_element_get_namespace_uri | 2.14 | A #gchar |
| get_next_element_sibling | `DOMElement.get_next_element_sibling() -> DOMElement` | webkit_dom_element_get_next_element_sibling |  | A #WebKitDOMElement |
| get_offset_height | `DOMElement.get_offset_height() -> gdouble` | webkit_dom_element_get_offset_height |  | A #gdouble |
| get_offset_left | `DOMElement.get_offset_left() -> gdouble` | webkit_dom_element_get_offset_left |  | A #gdouble |
| get_offset_parent | `DOMElement.get_offset_parent() -> DOMElement` | webkit_dom_element_get_offset_parent |  | A #WebKitDOMElement |
| get_offset_top | `DOMElement.get_offset_top() -> gdouble` | webkit_dom_element_get_offset_top |  | A #gdouble |
| get_offset_width | `DOMElement.get_offset_width() -> gdouble` | webkit_dom_element_get_offset_width |  | A #gdouble |
| get_outer_html | `DOMElement.get_outer_html() -> utf8` | webkit_dom_element_get_outer_html | 2.8 | A #gchar |
| get_prefix | `DOMElement.get_prefix() -> utf8` | webkit_dom_element_get_prefix | 2.14 | A #gchar |
| get_previous_element_sibling | `DOMElement.get_previous_element_sibling() -> DOMElement` | webkit_dom_element_get_previous_element_sibling |  | A #WebKitDOMElement |
| get_scroll_height | `DOMElement.get_scroll_height() -> glong` | webkit_dom_element_get_scroll_height |  | A #glong |
| get_scroll_left | `DOMElement.get_scroll_left() -> glong` | webkit_dom_element_get_scroll_left |  | A #glong |
| get_scroll_top | `DOMElement.get_scroll_top() -> glong` | webkit_dom_element_get_scroll_top |  | A #glong |
| get_scroll_width | `DOMElement.get_scroll_width() -> glong` | webkit_dom_element_get_scroll_width |  | A #glong |
| get_style | `DOMElement.get_style() -> DOMCSSStyleDeclaration` | webkit_dom_element_get_style |  | A #WebKitDOMCSSStyleDeclaration |
| get_tag_name | `DOMElement.get_tag_name() -> utf8` | webkit_dom_element_get_tag_name |  | A #gchar |
| get_webkit_region_overset | `DOMElement.get_webkit_region_overset() -> utf8` | webkit_dom_element_get_webkit_region_overset |  | CSS Regions support has been removed. This function does nothing. |
| has_attribute | `DOMElement.has_attribute(name: utf8) -> gboolean` | webkit_dom_element_has_attribute |  | A #gboolean |
| has_attribute_ns | `DOMElement.has_attribute_ns(namespaceURI: utf8, localName: utf8) -> gboolean` | webkit_dom_element_has_attribute_ns |  | A #gboolean |
| has_attributes | `DOMElement.has_attributes() -> gboolean` | webkit_dom_element_has_attributes |  | A #gboolean |
| html_input_element_get_auto_filled | `DOMElement.html_input_element_get_auto_filled() -> gboolean` | webkit_dom_element_html_input_element_get_auto_filled | 2.22 | Get whether the element is an HTML input element that has been filled automatically. |
| html_input_element_is_user_edited | `DOMElement.html_input_element_is_user_edited() -> gboolean` | webkit_dom_element_html_input_element_is_user_edited | 2.22 | Get whether @element is an HTML text input element that has been edited by a user action. |
| html_input_element_set_auto_filled | `DOMElement.html_input_element_set_auto_filled(auto_filled: gboolean) -> none` | webkit_dom_element_html_input_element_set_auto_filled | 2.22 | Set whether the element is an HTML input element that has been filled automatically. If @element is not an HTML input element this function does no... |
| html_input_element_set_editing_value | `DOMElement.html_input_element_set_editing_value(value: utf8) -> none` | webkit_dom_element_html_input_element_set_editing_value | 2.22 | Set the value of an HTML input element as if it had been edited by the user, triggering a change event. If @element is not an HTML input element th... |
| insert_adjacent_element | `DOMElement.insert_adjacent_element(where: utf8, element: DOMElement) -> DOMElement throws` | webkit_dom_element_insert_adjacent_element | 2.16 | A #WebKitDOMElement |
| insert_adjacent_html | `DOMElement.insert_adjacent_html(where: utf8, html: utf8) -> none throws` | webkit_dom_element_insert_adjacent_html | 2.16 | A #WebKitDOMElement |
| insert_adjacent_text | `DOMElement.insert_adjacent_text(where: utf8, text: utf8) -> none throws` | webkit_dom_element_insert_adjacent_text | 2.16 | A #WebKitDOMElement |
| matches | `DOMElement.matches(selectors: utf8) -> gboolean throws` | webkit_dom_element_matches | 2.16 | A #gboolean |
| query_selector | `DOMElement.query_selector(selectors: utf8) -> DOMElement throws` | webkit_dom_element_query_selector |  | A #WebKitDOMElement |
| query_selector_all | `DOMElement.query_selector_all(selectors: utf8) -> DOMNodeList throws` | webkit_dom_element_query_selector_all |  | A #WebKitDOMNodeList |
| remove | `DOMElement.remove() -> none throws` | webkit_dom_element_remove | 2.16 | A #WebKitDOMElement |
| remove_attribute | `DOMElement.remove_attribute(name: utf8) -> none` | webkit_dom_element_remove_attribute |  | A #WebKitDOMElement |
| remove_attribute_node | `DOMElement.remove_attribute_node(oldAttr: DOMAttr) -> DOMAttr throws` | webkit_dom_element_remove_attribute_node |  | A #WebKitDOMAttr |
| remove_attribute_ns | `DOMElement.remove_attribute_ns(namespaceURI: utf8, localName: utf8) -> none` | webkit_dom_element_remove_attribute_ns |  | A #WebKitDOMElement |
| request_pointer_lock | `DOMElement.request_pointer_lock() -> none` | webkit_dom_element_request_pointer_lock | 2.16 | A #WebKitDOMElement |
| scroll_by_lines | `DOMElement.scroll_by_lines(lines: glong) -> none` | webkit_dom_element_scroll_by_lines |  | A #WebKitDOMElement |
| scroll_by_pages | `DOMElement.scroll_by_pages(pages: glong) -> none` | webkit_dom_element_scroll_by_pages |  | A #WebKitDOMElement |
| scroll_into_view | `DOMElement.scroll_into_view(alignWithTop: gboolean) -> none` | webkit_dom_element_scroll_into_view |  | A #WebKitDOMElement |
| scroll_into_view_if_needed | `DOMElement.scroll_into_view_if_needed(centerIfNeeded: gboolean) -> none` | webkit_dom_element_scroll_into_view_if_needed |  | A #WebKitDOMElement |
| set_attribute | `DOMElement.set_attribute(name: utf8, value: utf8) -> none throws` | webkit_dom_element_set_attribute |  | A #WebKitDOMElement |
| set_attribute_node | `DOMElement.set_attribute_node(newAttr: DOMAttr) -> DOMAttr throws` | webkit_dom_element_set_attribute_node |  | A #WebKitDOMAttr |
| set_attribute_node_ns | `DOMElement.set_attribute_node_ns(newAttr: DOMAttr) -> DOMAttr throws` | webkit_dom_element_set_attribute_node_ns |  | A #WebKitDOMAttr |
| set_attribute_ns | `DOMElement.set_attribute_ns(namespaceURI: utf8?, qualifiedName: utf8, value: utf8) -> none throws` | webkit_dom_element_set_attribute_ns |  | A #WebKitDOMElement |
| set_class_name | `DOMElement.set_class_name(value: utf8) -> none` | webkit_dom_element_set_class_name |  | A #WebKitDOMElement |
| set_id | `DOMElement.set_id(value: utf8) -> none` | webkit_dom_element_set_id |  | A #WebKitDOMElement |
| set_inner_html | `DOMElement.set_inner_html(value: utf8) -> none throws` | webkit_dom_element_set_inner_html | 2.8 | A #WebKitDOMElement |
| set_outer_html | `DOMElement.set_outer_html(value: utf8) -> none throws` | webkit_dom_element_set_outer_html | 2.8 | A #WebKitDOMElement |
| set_scroll_left | `DOMElement.set_scroll_left(value: glong) -> none` | webkit_dom_element_set_scroll_left |  | A #WebKitDOMElement |
| set_scroll_top | `DOMElement.set_scroll_top(value: glong) -> none` | webkit_dom_element_set_scroll_top |  | A #WebKitDOMElement |
| webkit_matches_selector | `DOMElement.webkit_matches_selector(selectors: utf8) -> gboolean throws` | webkit_dom_element_webkit_matches_selector | 2.16 | A #gboolean |
| webkit_request_fullscreen | `DOMElement.webkit_request_fullscreen() -> none` | webkit_dom_element_webkit_request_fullscreen | 2.16 | A #WebKitDOMElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| attributes | DOMNamedNodeMap | read |  |
| child-element-count | gulong | read |  |
| children | DOMHTMLCollection | read |  |
| class-list | DOMDOMTokenList | read |  |
| class-name | utf8 | read, write |  |
| client-height | gdouble | read |  |
| client-left | gdouble | read |  |
| client-top | gdouble | read |  |
| client-width | gdouble | read |  |
| first-element-child | DOMElement | read |  |
| id | utf8 | read, write |  |
| inner-html | utf8 | read, write |  |
| last-element-child | DOMElement | read |  |
| local-name | utf8 | read |  |
| namespace-uri | utf8 | read |  |
| next-element-sibling | DOMElement | read |  |
| offset-height | gdouble | read |  |
| offset-left | gdouble | read |  |
| offset-parent | DOMElement | read |  |
| offset-top | gdouble | read |  |
| offset-width | gdouble | read |  |
| outer-html | utf8 | read, write |  |
| prefix | utf8 | read |  |
| previous-element-sibling | DOMElement | read |  |
| scroll-height | glong | read |  |
| scroll-left | glong | read, write |  |
| scroll-top | glong | read, write |  |
| scroll-width | glong | read |  |
| style | DOMCSSStyleDeclaration | read |  |
| tag-name | utf8 | read |  |
| webkit-region-overset | utf8 | read |  |

### WebKit2WebExtension.DOMEntityReference

Parent: `DOMNode` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMEntityReference` ?? C type: `WebKitDOMEntityReference`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMNode |

### WebKit2WebExtension.DOMEvent

Parent: `DOMObject` ?? Subclasses: `DOMUIEvent` ?? GType: `WebKitDOMEvent` ?? C type: `WebKitDOMEvent`

A #gboolean

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_bubbles | `DOMEvent.get_bubbles() -> gboolean` | webkit_dom_event_get_bubbles |  | A #gboolean |
| get_cancel_bubble | `DOMEvent.get_cancel_bubble() -> gboolean` | webkit_dom_event_get_cancel_bubble |  | A #gboolean |
| get_cancelable | `DOMEvent.get_cancelable() -> gboolean` | webkit_dom_event_get_cancelable |  | A #gboolean |
| get_current_target | `DOMEvent.get_current_target() -> DOMEventTarget` | webkit_dom_event_get_current_target |  | A #WebKitDOMEventTarget |
| get_event_phase | `DOMEvent.get_event_phase() -> gushort` | webkit_dom_event_get_event_phase |  | A #gushort |
| get_event_type | `DOMEvent.get_event_type() -> utf8` | webkit_dom_event_get_event_type |  | A #gchar |
| get_return_value | `DOMEvent.get_return_value() -> gboolean` | webkit_dom_event_get_return_value |  | A #gboolean |
| get_src_element | `DOMEvent.get_src_element() -> DOMEventTarget` | webkit_dom_event_get_src_element |  | A #WebKitDOMEventTarget |
| get_target | `DOMEvent.get_target() -> DOMEventTarget` | webkit_dom_event_get_target |  | A #WebKitDOMEventTarget |
| get_time_stamp | `DOMEvent.get_time_stamp() -> guint32` | webkit_dom_event_get_time_stamp |  | A #guint32 |
| init_event | `DOMEvent.init_event(eventTypeArg: utf8, canBubbleArg: gboolean, cancelableArg: gboolean) -> none` | webkit_dom_event_init_event |  | A #WebKitDOMEvent |
| prevent_default | `DOMEvent.prevent_default() -> none` | webkit_dom_event_prevent_default |  | A #WebKitDOMEvent |
| set_cancel_bubble | `DOMEvent.set_cancel_bubble(value: gboolean) -> none` | webkit_dom_event_set_cancel_bubble |  | A #WebKitDOMEvent |
| set_return_value | `DOMEvent.set_return_value(value: gboolean) -> none` | webkit_dom_event_set_return_value |  | A #WebKitDOMEvent |
| stop_propagation | `DOMEvent.stop_propagation() -> none` | webkit_dom_event_stop_propagation |  | A #WebKitDOMEvent |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| bubbles | gboolean | read |  |
| cancel-bubble | gboolean | read, write |  |
| cancelable | gboolean | read |  |
| current-target | DOMEventTarget | read |  |
| event-phase | guint | read |  |
| return-value | gboolean | read, write |  |
| src-element | DOMEventTarget | read |  |
| target | DOMEventTarget | read |  |
| time-stamp | guint | read |  |
| type | utf8 | read |  |

### WebKit2WebExtension.DOMFile

Parent: `DOMBlob` ?? GType: `WebKitDOMFile` ?? C type: `WebKitDOMFile`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMBlob |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_name | `DOMFile.get_name() -> utf8` | webkit_dom_file_get_name |  | A #gchar |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| name | utf8 | read |  |

### WebKit2WebExtension.DOMFileList

Parent: `DOMObject` ?? GType: `WebKitDOMFileList` ?? C type: `WebKitDOMFileList`

A #gulong

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_length | `DOMFileList.get_length() -> gulong` | webkit_dom_file_list_get_length |  | A #gulong |
| item | `DOMFileList.item(index: gulong) -> DOMFile` | webkit_dom_file_list_item |  | A #WebKitDOMFile |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| length | gulong | read |  |

### WebKit2WebExtension.DOMHTMLAnchorElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLAnchorElement` ?? C type: `WebKitDOMHTMLAnchorElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_charset | `DOMHTMLAnchorElement.get_charset() -> utf8` | webkit_dom_html_anchor_element_get_charset |  | A #gchar |
| get_coords | `DOMHTMLAnchorElement.get_coords() -> utf8` | webkit_dom_html_anchor_element_get_coords |  | A #gchar |
| get_hash | `DOMHTMLAnchorElement.get_hash() -> utf8` | webkit_dom_html_anchor_element_get_hash |  | A #gchar |
| get_host | `DOMHTMLAnchorElement.get_host() -> utf8` | webkit_dom_html_anchor_element_get_host |  | A #gchar |
| get_hostname | `DOMHTMLAnchorElement.get_hostname() -> utf8` | webkit_dom_html_anchor_element_get_hostname |  | A #gchar |
| get_href | `DOMHTMLAnchorElement.get_href() -> utf8` | webkit_dom_html_anchor_element_get_href |  | A #gchar |
| get_hreflang | `DOMHTMLAnchorElement.get_hreflang() -> utf8` | webkit_dom_html_anchor_element_get_hreflang |  | A #gchar |
| get_name | `DOMHTMLAnchorElement.get_name() -> utf8` | webkit_dom_html_anchor_element_get_name |  | A #gchar |
| get_pathname | `DOMHTMLAnchorElement.get_pathname() -> utf8` | webkit_dom_html_anchor_element_get_pathname |  | A #gchar |
| get_port | `DOMHTMLAnchorElement.get_port() -> utf8` | webkit_dom_html_anchor_element_get_port |  | A #gchar |
| get_protocol | `DOMHTMLAnchorElement.get_protocol() -> utf8` | webkit_dom_html_anchor_element_get_protocol |  | A #gchar |
| get_rel | `DOMHTMLAnchorElement.get_rel() -> utf8` | webkit_dom_html_anchor_element_get_rel |  | A #gchar |
| get_rev | `DOMHTMLAnchorElement.get_rev() -> utf8` | webkit_dom_html_anchor_element_get_rev |  | A #gchar |
| get_search | `DOMHTMLAnchorElement.get_search() -> utf8` | webkit_dom_html_anchor_element_get_search |  | A #gchar |
| get_shape | `DOMHTMLAnchorElement.get_shape() -> utf8` | webkit_dom_html_anchor_element_get_shape |  | A #gchar |
| get_target | `DOMHTMLAnchorElement.get_target() -> utf8` | webkit_dom_html_anchor_element_get_target |  | A #gchar |
| get_text | `DOMHTMLAnchorElement.get_text() -> utf8` | webkit_dom_html_anchor_element_get_text |  | A #gchar |
| get_type_attr | `DOMHTMLAnchorElement.get_type_attr() -> utf8` | webkit_dom_html_anchor_element_get_type_attr |  | A #gchar |
| set_charset | `DOMHTMLAnchorElement.set_charset(value: utf8) -> none` | webkit_dom_html_anchor_element_set_charset |  | A #WebKitDOMHTMLAnchorElement |
| set_coords | `DOMHTMLAnchorElement.set_coords(value: utf8) -> none` | webkit_dom_html_anchor_element_set_coords |  | A #WebKitDOMHTMLAnchorElement |
| set_hash | `DOMHTMLAnchorElement.set_hash(value: utf8) -> none` | webkit_dom_html_anchor_element_set_hash |  | A #WebKitDOMHTMLAnchorElement |
| set_host | `DOMHTMLAnchorElement.set_host(value: utf8) -> none` | webkit_dom_html_anchor_element_set_host |  | A #WebKitDOMHTMLAnchorElement |
| set_hostname | `DOMHTMLAnchorElement.set_hostname(value: utf8) -> none` | webkit_dom_html_anchor_element_set_hostname |  | A #WebKitDOMHTMLAnchorElement |
| set_href | `DOMHTMLAnchorElement.set_href(value: utf8) -> none` | webkit_dom_html_anchor_element_set_href |  | A #WebKitDOMHTMLAnchorElement |
| set_hreflang | `DOMHTMLAnchorElement.set_hreflang(value: utf8) -> none` | webkit_dom_html_anchor_element_set_hreflang |  | A #WebKitDOMHTMLAnchorElement |
| set_name | `DOMHTMLAnchorElement.set_name(value: utf8) -> none` | webkit_dom_html_anchor_element_set_name |  | A #WebKitDOMHTMLAnchorElement |
| set_pathname | `DOMHTMLAnchorElement.set_pathname(value: utf8) -> none` | webkit_dom_html_anchor_element_set_pathname |  | A #WebKitDOMHTMLAnchorElement |
| set_port | `DOMHTMLAnchorElement.set_port(value: utf8) -> none` | webkit_dom_html_anchor_element_set_port |  | A #WebKitDOMHTMLAnchorElement |
| set_protocol | `DOMHTMLAnchorElement.set_protocol(value: utf8) -> none` | webkit_dom_html_anchor_element_set_protocol |  | A #WebKitDOMHTMLAnchorElement |
| set_rel | `DOMHTMLAnchorElement.set_rel(value: utf8) -> none` | webkit_dom_html_anchor_element_set_rel |  | A #WebKitDOMHTMLAnchorElement |
| set_rev | `DOMHTMLAnchorElement.set_rev(value: utf8) -> none` | webkit_dom_html_anchor_element_set_rev |  | A #WebKitDOMHTMLAnchorElement |
| set_search | `DOMHTMLAnchorElement.set_search(value: utf8) -> none` | webkit_dom_html_anchor_element_set_search |  | A #WebKitDOMHTMLAnchorElement |
| set_shape | `DOMHTMLAnchorElement.set_shape(value: utf8) -> none` | webkit_dom_html_anchor_element_set_shape |  | A #WebKitDOMHTMLAnchorElement |
| set_target | `DOMHTMLAnchorElement.set_target(value: utf8) -> none` | webkit_dom_html_anchor_element_set_target |  | A #WebKitDOMHTMLAnchorElement |
| set_text | `DOMHTMLAnchorElement.set_text(value: utf8) -> none` | webkit_dom_html_anchor_element_set_text | 2.16 | A #WebKitDOMHTMLAnchorElement |
| set_type_attr | `DOMHTMLAnchorElement.set_type_attr(value: utf8) -> none` | webkit_dom_html_anchor_element_set_type_attr |  | A #WebKitDOMHTMLAnchorElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| charset | utf8 | read, write |  |
| coords | utf8 | read, write |  |
| hash | utf8 | read, write |  |
| host | utf8 | read, write |  |
| hostname | utf8 | read, write |  |
| href | utf8 | read, write |  |
| hreflang | utf8 | read, write |  |
| name | utf8 | read, write |  |
| pathname | utf8 | read, write |  |
| port | utf8 | read, write |  |
| protocol | utf8 | read, write |  |
| rel | utf8 | read, write |  |
| rev | utf8 | read, write |  |
| search | utf8 | read, write |  |
| shape | utf8 | read, write |  |
| target | utf8 | read, write |  |
| text | utf8 | read, write |  |
| type | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLAppletElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLAppletElement` ?? C type: `WebKitDOMHTMLAppletElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_align | `DOMHTMLAppletElement.get_align() -> utf8` | webkit_dom_html_applet_element_get_align |  | A #gchar |
| get_alt | `DOMHTMLAppletElement.get_alt() -> utf8` | webkit_dom_html_applet_element_get_alt |  | A #gchar |
| get_archive | `DOMHTMLAppletElement.get_archive() -> utf8` | webkit_dom_html_applet_element_get_archive |  | A #gchar |
| get_code | `DOMHTMLAppletElement.get_code() -> utf8` | webkit_dom_html_applet_element_get_code |  | A #gchar |
| get_code_base | `DOMHTMLAppletElement.get_code_base() -> utf8` | webkit_dom_html_applet_element_get_code_base |  | A #gchar |
| get_height | `DOMHTMLAppletElement.get_height() -> utf8` | webkit_dom_html_applet_element_get_height |  | A #gchar |
| get_hspace | `DOMHTMLAppletElement.get_hspace() -> glong` | webkit_dom_html_applet_element_get_hspace |  | A #glong |
| get_name | `DOMHTMLAppletElement.get_name() -> utf8` | webkit_dom_html_applet_element_get_name |  | A #gchar |
| get_object | `DOMHTMLAppletElement.get_object() -> utf8` | webkit_dom_html_applet_element_get_object |  | A #gchar |
| get_vspace | `DOMHTMLAppletElement.get_vspace() -> glong` | webkit_dom_html_applet_element_get_vspace |  | A #glong |
| get_width | `DOMHTMLAppletElement.get_width() -> utf8` | webkit_dom_html_applet_element_get_width |  | A #gchar |
| set_align | `DOMHTMLAppletElement.set_align(value: utf8) -> none` | webkit_dom_html_applet_element_set_align |  | A #WebKitDOMHTMLAppletElement |
| set_alt | `DOMHTMLAppletElement.set_alt(value: utf8) -> none` | webkit_dom_html_applet_element_set_alt |  | A #WebKitDOMHTMLAppletElement |
| set_archive | `DOMHTMLAppletElement.set_archive(value: utf8) -> none` | webkit_dom_html_applet_element_set_archive |  | A #WebKitDOMHTMLAppletElement |
| set_code | `DOMHTMLAppletElement.set_code(value: utf8) -> none` | webkit_dom_html_applet_element_set_code |  | A #WebKitDOMHTMLAppletElement |
| set_code_base | `DOMHTMLAppletElement.set_code_base(value: utf8) -> none` | webkit_dom_html_applet_element_set_code_base |  | A #WebKitDOMHTMLAppletElement |
| set_height | `DOMHTMLAppletElement.set_height(value: utf8) -> none` | webkit_dom_html_applet_element_set_height |  | A #WebKitDOMHTMLAppletElement |
| set_hspace | `DOMHTMLAppletElement.set_hspace(value: glong) -> none` | webkit_dom_html_applet_element_set_hspace |  | A #WebKitDOMHTMLAppletElement |
| set_name | `DOMHTMLAppletElement.set_name(value: utf8) -> none` | webkit_dom_html_applet_element_set_name |  | A #WebKitDOMHTMLAppletElement |
| set_object | `DOMHTMLAppletElement.set_object(value: utf8) -> none` | webkit_dom_html_applet_element_set_object |  | A #WebKitDOMHTMLAppletElement |
| set_vspace | `DOMHTMLAppletElement.set_vspace(value: glong) -> none` | webkit_dom_html_applet_element_set_vspace |  | A #WebKitDOMHTMLAppletElement |
| set_width | `DOMHTMLAppletElement.set_width(value: utf8) -> none` | webkit_dom_html_applet_element_set_width |  | A #WebKitDOMHTMLAppletElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| align | utf8 | read, write |  |
| alt | utf8 | read, write |  |
| archive | utf8 | read, write |  |
| code | utf8 | read, write |  |
| code-base | utf8 | read, write |  |
| height | utf8 | read, write |  |
| hspace | glong | read, write |  |
| name | utf8 | read, write |  |
| object | utf8 | read, write |  |
| vspace | glong | read, write |  |
| width | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLAreaElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLAreaElement` ?? C type: `WebKitDOMHTMLAreaElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_alt | `DOMHTMLAreaElement.get_alt() -> utf8` | webkit_dom_html_area_element_get_alt |  | A #gchar |
| get_coords | `DOMHTMLAreaElement.get_coords() -> utf8` | webkit_dom_html_area_element_get_coords |  | A #gchar |
| get_hash | `DOMHTMLAreaElement.get_hash() -> utf8` | webkit_dom_html_area_element_get_hash |  | A #gchar |
| get_host | `DOMHTMLAreaElement.get_host() -> utf8` | webkit_dom_html_area_element_get_host |  | A #gchar |
| get_hostname | `DOMHTMLAreaElement.get_hostname() -> utf8` | webkit_dom_html_area_element_get_hostname |  | A #gchar |
| get_href | `DOMHTMLAreaElement.get_href() -> utf8` | webkit_dom_html_area_element_get_href |  | A #gchar |
| get_no_href | `DOMHTMLAreaElement.get_no_href() -> gboolean` | webkit_dom_html_area_element_get_no_href |  | A #gboolean |
| get_pathname | `DOMHTMLAreaElement.get_pathname() -> utf8` | webkit_dom_html_area_element_get_pathname |  | A #gchar |
| get_port | `DOMHTMLAreaElement.get_port() -> utf8` | webkit_dom_html_area_element_get_port |  | A #gchar |
| get_protocol | `DOMHTMLAreaElement.get_protocol() -> utf8` | webkit_dom_html_area_element_get_protocol |  | A #gchar |
| get_search | `DOMHTMLAreaElement.get_search() -> utf8` | webkit_dom_html_area_element_get_search |  | A #gchar |
| get_shape | `DOMHTMLAreaElement.get_shape() -> utf8` | webkit_dom_html_area_element_get_shape |  | A #gchar |
| get_target | `DOMHTMLAreaElement.get_target() -> utf8` | webkit_dom_html_area_element_get_target |  | A #gchar |
| set_alt | `DOMHTMLAreaElement.set_alt(value: utf8) -> none` | webkit_dom_html_area_element_set_alt |  | A #WebKitDOMHTMLAreaElement |
| set_coords | `DOMHTMLAreaElement.set_coords(value: utf8) -> none` | webkit_dom_html_area_element_set_coords |  | A #WebKitDOMHTMLAreaElement |
| set_hash | `DOMHTMLAreaElement.set_hash(value: utf8) -> none` | webkit_dom_html_area_element_set_hash |  | A #WebKitDOMHTMLAreaElement |
| set_host | `DOMHTMLAreaElement.set_host(value: utf8) -> none` | webkit_dom_html_area_element_set_host | 2.16 | A #WebKitDOMHTMLAreaElement |
| set_hostname | `DOMHTMLAreaElement.set_hostname(value: utf8) -> none` | webkit_dom_html_area_element_set_hostname | 2.16 | A #WebKitDOMHTMLAreaElement |
| set_href | `DOMHTMLAreaElement.set_href(value: utf8) -> none` | webkit_dom_html_area_element_set_href |  | A #WebKitDOMHTMLAreaElement |
| set_no_href | `DOMHTMLAreaElement.set_no_href(value: gboolean) -> none` | webkit_dom_html_area_element_set_no_href |  | A #WebKitDOMHTMLAreaElement |
| set_pathname | `DOMHTMLAreaElement.set_pathname(value: utf8) -> none` | webkit_dom_html_area_element_set_pathname | 2.16 | A #WebKitDOMHTMLAreaElement |
| set_port | `DOMHTMLAreaElement.set_port(value: utf8) -> none` | webkit_dom_html_area_element_set_port | 2.16 | A #WebKitDOMHTMLAreaElement |
| set_protocol | `DOMHTMLAreaElement.set_protocol(value: utf8) -> none` | webkit_dom_html_area_element_set_protocol | 2.16 | A #WebKitDOMHTMLAreaElement |
| set_search | `DOMHTMLAreaElement.set_search(value: utf8) -> none` | webkit_dom_html_area_element_set_search | 2.16 | A #WebKitDOMHTMLAreaElement |
| set_shape | `DOMHTMLAreaElement.set_shape(value: utf8) -> none` | webkit_dom_html_area_element_set_shape |  | A #WebKitDOMHTMLAreaElement |
| set_target | `DOMHTMLAreaElement.set_target(value: utf8) -> none` | webkit_dom_html_area_element_set_target |  | A #WebKitDOMHTMLAreaElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| alt | utf8 | read, write |  |
| coords | utf8 | read, write |  |
| hash | utf8 | read, write |  |
| host | utf8 | read, write |  |
| hostname | utf8 | read, write |  |
| href | utf8 | read, write |  |
| no-href | gboolean | read, write |  |
| pathname | utf8 | read, write |  |
| port | utf8 | read, write |  |
| protocol | utf8 | read, write |  |
| search | utf8 | read, write |  |
| shape | utf8 | read, write |  |
| target | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLBaseElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLBaseElement` ?? C type: `WebKitDOMHTMLBaseElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_href | `DOMHTMLBaseElement.get_href() -> utf8` | webkit_dom_html_base_element_get_href |  | A #gchar |
| get_target | `DOMHTMLBaseElement.get_target() -> utf8` | webkit_dom_html_base_element_get_target |  | A #gchar |
| set_href | `DOMHTMLBaseElement.set_href(value: utf8) -> none` | webkit_dom_html_base_element_set_href |  | A #WebKitDOMHTMLBaseElement |
| set_target | `DOMHTMLBaseElement.set_target(value: utf8) -> none` | webkit_dom_html_base_element_set_target |  | A #WebKitDOMHTMLBaseElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| href | utf8 | read, write |  |
| target | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLBaseFontElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLBaseFontElement` ?? C type: `WebKitDOMHTMLBaseFontElement`

This function has been removed from the DOM spec and it just returns %NULL.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_color | `DOMHTMLBaseFontElement.get_color() -> utf8` | webkit_dom_html_base_font_element_get_color |  | This function has been removed from the DOM spec and it just returns %NULL. |
| get_face | `DOMHTMLBaseFontElement.get_face() -> utf8` | webkit_dom_html_base_font_element_get_face |  | This function has been removed from the DOM spec and it just returns %NULL. |
| get_size | `DOMHTMLBaseFontElement.get_size() -> glong` | webkit_dom_html_base_font_element_get_size |  | This function has been removed from the DOM spec and it just returns 0. |
| set_color | `DOMHTMLBaseFontElement.set_color(value: utf8) -> none` | webkit_dom_html_base_font_element_set_color |  | This function has been removed from the DOM spec and it does nothing. |
| set_face | `DOMHTMLBaseFontElement.set_face(value: utf8) -> none` | webkit_dom_html_base_font_element_set_face |  | This function has been removed from the DOM spec and it does nothing. |
| set_size | `DOMHTMLBaseFontElement.set_size(value: glong) -> none` | webkit_dom_html_base_font_element_set_size |  | This function has been removed from the DOM spec and it does nothing. |

### WebKit2WebExtension.DOMHTMLBodyElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLBodyElement` ?? C type: `WebKitDOMHTMLBodyElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_a_link | `DOMHTMLBodyElement.get_a_link() -> utf8` | webkit_dom_html_body_element_get_a_link |  | A #gchar |
| get_background | `DOMHTMLBodyElement.get_background() -> utf8` | webkit_dom_html_body_element_get_background |  | A #gchar |
| get_bg_color | `DOMHTMLBodyElement.get_bg_color() -> utf8` | webkit_dom_html_body_element_get_bg_color |  | A #gchar |
| get_link | `DOMHTMLBodyElement.get_link() -> utf8` | webkit_dom_html_body_element_get_link |  | A #gchar |
| get_text | `DOMHTMLBodyElement.get_text() -> utf8` | webkit_dom_html_body_element_get_text |  | A #gchar |
| get_v_link | `DOMHTMLBodyElement.get_v_link() -> utf8` | webkit_dom_html_body_element_get_v_link |  | A #gchar |
| set_a_link | `DOMHTMLBodyElement.set_a_link(value: utf8) -> none` | webkit_dom_html_body_element_set_a_link |  | A #WebKitDOMHTMLBodyElement |
| set_background | `DOMHTMLBodyElement.set_background(value: utf8) -> none` | webkit_dom_html_body_element_set_background |  | A #WebKitDOMHTMLBodyElement |
| set_bg_color | `DOMHTMLBodyElement.set_bg_color(value: utf8) -> none` | webkit_dom_html_body_element_set_bg_color |  | A #WebKitDOMHTMLBodyElement |
| set_link | `DOMHTMLBodyElement.set_link(value: utf8) -> none` | webkit_dom_html_body_element_set_link |  | A #WebKitDOMHTMLBodyElement |
| set_text | `DOMHTMLBodyElement.set_text(value: utf8) -> none` | webkit_dom_html_body_element_set_text |  | A #WebKitDOMHTMLBodyElement |
| set_v_link | `DOMHTMLBodyElement.set_v_link(value: utf8) -> none` | webkit_dom_html_body_element_set_v_link |  | A #WebKitDOMHTMLBodyElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| a-link | utf8 | read, write |  |
| background | utf8 | read, write |  |
| bg-color | utf8 | read, write |  |
| link | utf8 | read, write |  |
| text | utf8 | read, write |  |
| v-link | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLBRElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLBRElement` ?? C type: `WebKitDOMHTMLBRElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_clear | `DOMHTMLBRElement.get_clear() -> utf8` | webkit_dom_html_br_element_get_clear |  | A #gchar |
| set_clear | `DOMHTMLBRElement.set_clear(value: utf8) -> none` | webkit_dom_html_br_element_set_clear |  | A #WebKitDOMHTMLBRElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| clear | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLButtonElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLButtonElement` ?? C type: `WebKitDOMHTMLButtonElement`

A #gboolean

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_autofocus | `DOMHTMLButtonElement.get_autofocus() -> gboolean` | webkit_dom_html_button_element_get_autofocus |  | A #gboolean |
| get_button_type | `DOMHTMLButtonElement.get_button_type() -> utf8` | webkit_dom_html_button_element_get_button_type |  | A #gchar |
| get_disabled | `DOMHTMLButtonElement.get_disabled() -> gboolean` | webkit_dom_html_button_element_get_disabled |  | A #gboolean |
| get_form | `DOMHTMLButtonElement.get_form() -> DOMHTMLFormElement` | webkit_dom_html_button_element_get_form |  | A #WebKitDOMHTMLFormElement |
| get_name | `DOMHTMLButtonElement.get_name() -> utf8` | webkit_dom_html_button_element_get_name |  | A #gchar |
| get_value | `DOMHTMLButtonElement.get_value() -> utf8` | webkit_dom_html_button_element_get_value |  | A #gchar |
| get_will_validate | `DOMHTMLButtonElement.get_will_validate() -> gboolean` | webkit_dom_html_button_element_get_will_validate |  | A #gboolean |
| set_autofocus | `DOMHTMLButtonElement.set_autofocus(value: gboolean) -> none` | webkit_dom_html_button_element_set_autofocus |  | A #WebKitDOMHTMLButtonElement |
| set_button_type | `DOMHTMLButtonElement.set_button_type(value: utf8) -> none` | webkit_dom_html_button_element_set_button_type |  | A #WebKitDOMHTMLButtonElement |
| set_disabled | `DOMHTMLButtonElement.set_disabled(value: gboolean) -> none` | webkit_dom_html_button_element_set_disabled |  | A #WebKitDOMHTMLButtonElement |
| set_name | `DOMHTMLButtonElement.set_name(value: utf8) -> none` | webkit_dom_html_button_element_set_name |  | A #WebKitDOMHTMLButtonElement |
| set_value | `DOMHTMLButtonElement.set_value(value: utf8) -> none` | webkit_dom_html_button_element_set_value |  | A #WebKitDOMHTMLButtonElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| autofocus | gboolean | read, write |  |
| disabled | gboolean | read, write |  |
| form | DOMHTMLFormElement | read |  |
| name | utf8 | read, write |  |
| type | utf8 | read, write |  |
| value | utf8 | read, write |  |
| will-validate | gboolean | read |  |

### WebKit2WebExtension.DOMHTMLCanvasElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLCanvasElement` ?? C type: `WebKitDOMHTMLCanvasElement`

A #glong

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_height | `DOMHTMLCanvasElement.get_height() -> glong` | webkit_dom_html_canvas_element_get_height |  | A #glong |
| get_width | `DOMHTMLCanvasElement.get_width() -> glong` | webkit_dom_html_canvas_element_get_width |  | A #glong |
| set_height | `DOMHTMLCanvasElement.set_height(value: glong) -> none` | webkit_dom_html_canvas_element_set_height |  | A #WebKitDOMHTMLCanvasElement |
| set_width | `DOMHTMLCanvasElement.set_width(value: glong) -> none` | webkit_dom_html_canvas_element_set_width |  | A #WebKitDOMHTMLCanvasElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| height | glong | read, write |  |
| width | glong | read, write |  |

### WebKit2WebExtension.DOMHTMLCollection

Parent: `DOMObject` ?? Subclasses: `DOMHTMLOptionsCollection` ?? GType: `WebKitDOMHTMLCollection` ?? C type: `WebKitDOMHTMLCollection`

A #gulong

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_length | `DOMHTMLCollection.get_length() -> gulong` | webkit_dom_html_collection_get_length |  | A #gulong |
| item | `DOMHTMLCollection.item(index: gulong) -> DOMNode` | webkit_dom_html_collection_item |  | A #WebKitDOMNode |
| named_item | `DOMHTMLCollection.named_item(name: utf8) -> DOMNode` | webkit_dom_html_collection_named_item |  | A #WebKitDOMNode |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| length | gulong | read |  |

### WebKit2WebExtension.DOMHTMLDirectoryElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLDirectoryElement` ?? C type: `WebKitDOMHTMLDirectoryElement`

A #gboolean

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_compact | `DOMHTMLDirectoryElement.get_compact() -> gboolean` | webkit_dom_html_directory_element_get_compact |  | A #gboolean |
| set_compact | `DOMHTMLDirectoryElement.set_compact(value: gboolean) -> none` | webkit_dom_html_directory_element_set_compact |  | A #WebKitDOMHTMLDirectoryElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| compact | gboolean | read, write |  |

### WebKit2WebExtension.DOMHTMLDivElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLDivElement` ?? C type: `WebKitDOMHTMLDivElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_align | `DOMHTMLDivElement.get_align() -> utf8` | webkit_dom_html_div_element_get_align |  | A #gchar |
| set_align | `DOMHTMLDivElement.set_align(value: utf8) -> none` | webkit_dom_html_div_element_set_align |  | A #WebKitDOMHTMLDivElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| align | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLDListElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLDListElement` ?? C type: `WebKitDOMHTMLDListElement`

A #gboolean

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_compact | `DOMHTMLDListElement.get_compact() -> gboolean` | webkit_dom_html_d_list_element_get_compact |  | A #gboolean |
| set_compact | `DOMHTMLDListElement.set_compact(value: gboolean) -> none` | webkit_dom_html_d_list_element_set_compact |  | A #WebKitDOMHTMLDListElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| compact | gboolean | read, write |  |

### WebKit2WebExtension.DOMHTMLDocument

Parent: `DOMDocument` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLDocument` ?? C type: `WebKitDOMHTMLDocument`

A #WebKitDOMHTMLDocument

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMDocument |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| capture_events | `DOMHTMLDocument.capture_events() -> none` | webkit_dom_html_document_capture_events |  | A #WebKitDOMHTMLDocument |
| clear | `DOMHTMLDocument.clear() -> none` | webkit_dom_html_document_clear |  | A #WebKitDOMHTMLDocument |
| close | `DOMHTMLDocument.close() -> none` | webkit_dom_html_document_close |  | A #WebKitDOMHTMLDocument |
| get_alink_color | `DOMHTMLDocument.get_alink_color() -> utf8` | webkit_dom_html_document_get_alink_color |  | A #gchar |
| get_bg_color | `DOMHTMLDocument.get_bg_color() -> utf8` | webkit_dom_html_document_get_bg_color |  | A #gchar |
| get_compat_mode | `DOMHTMLDocument.get_compat_mode() -> utf8` | webkit_dom_html_document_get_compat_mode |  | A #gchar |
| get_design_mode | `DOMHTMLDocument.get_design_mode() -> utf8` | webkit_dom_html_document_get_design_mode |  | A #gchar |
| get_dir | `DOMHTMLDocument.get_dir() -> utf8` | webkit_dom_html_document_get_dir |  | A #gchar |
| get_embeds | `DOMHTMLDocument.get_embeds() -> DOMHTMLCollection` | webkit_dom_html_document_get_embeds |  | A #WebKitDOMHTMLCollection |
| get_fg_color | `DOMHTMLDocument.get_fg_color() -> utf8` | webkit_dom_html_document_get_fg_color |  | A #gchar |
| get_height | `DOMHTMLDocument.get_height() -> glong` | webkit_dom_html_document_get_height |  | A #glong |
| get_link_color | `DOMHTMLDocument.get_link_color() -> utf8` | webkit_dom_html_document_get_link_color |  | A #gchar |
| get_plugins | `DOMHTMLDocument.get_plugins() -> DOMHTMLCollection` | webkit_dom_html_document_get_plugins |  | A #WebKitDOMHTMLCollection |
| get_scripts | `DOMHTMLDocument.get_scripts() -> DOMHTMLCollection` | webkit_dom_html_document_get_scripts |  | A #WebKitDOMHTMLCollection |
| get_vlink_color | `DOMHTMLDocument.get_vlink_color() -> utf8` | webkit_dom_html_document_get_vlink_color |  | A #gchar |
| get_width | `DOMHTMLDocument.get_width() -> glong` | webkit_dom_html_document_get_width |  | A #glong |
| release_events | `DOMHTMLDocument.release_events() -> none` | webkit_dom_html_document_release_events |  | A #WebKitDOMHTMLDocument |
| set_alink_color | `DOMHTMLDocument.set_alink_color(value: utf8) -> none` | webkit_dom_html_document_set_alink_color |  | A #WebKitDOMHTMLDocument |
| set_bg_color | `DOMHTMLDocument.set_bg_color(value: utf8) -> none` | webkit_dom_html_document_set_bg_color |  | A #WebKitDOMHTMLDocument |
| set_design_mode | `DOMHTMLDocument.set_design_mode(value: utf8) -> none` | webkit_dom_html_document_set_design_mode |  | A #WebKitDOMHTMLDocument |
| set_dir | `DOMHTMLDocument.set_dir(value: utf8) -> none` | webkit_dom_html_document_set_dir |  | A #WebKitDOMHTMLDocument |
| set_fg_color | `DOMHTMLDocument.set_fg_color(value: utf8) -> none` | webkit_dom_html_document_set_fg_color |  | A #WebKitDOMHTMLDocument |
| set_link_color | `DOMHTMLDocument.set_link_color(value: utf8) -> none` | webkit_dom_html_document_set_link_color |  | A #WebKitDOMHTMLDocument |
| set_vlink_color | `DOMHTMLDocument.set_vlink_color(value: utf8) -> none` | webkit_dom_html_document_set_vlink_color |  | A #WebKitDOMHTMLDocument |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| alink-color | utf8 | read, write |  |
| bg-color | utf8 | read, write |  |
| dir | utf8 | read, write |  |
| fg-color | utf8 | read, write |  |
| height | glong | read |  |
| link-color | utf8 | read, write |  |
| vlink-color | utf8 | read, write |  |
| width | glong | read |  |

### WebKit2WebExtension.DOMHTMLElement

Parent: `DOMElement` ?? Subclasses: `DOMHTMLAnchorElement`, `DOMHTMLAppletElement`, `DOMHTMLAreaElement`, `DOMHTMLBaseElement`, `DOMHTMLBaseFontElement`, `DOMHTMLBodyElement`, `DOMHTMLBRElement`, `DOMHTMLButtonElement`, `DOMHTMLCanvasElement`, `DOMHTMLDirectoryElement`, `DOMHTMLDivElement`, `DOMHTMLDListElement`, `DOMHTMLEmbedElement`, `DOMHTMLFieldSetElement`, `DOMHTMLFontElement`, `DOMHTMLFormElement`, `DOMHTMLFrameElement`, `DOMHTMLFrameSetElement`, `DOMHTMLHeadElement`, `DOMHTMLHeadingElement`, `DOMHTMLHRElement`, `DOMHTMLHtmlElement`, `DOMHTMLIFrameElement`, `DOMHTMLImageElement`, `DOMHTMLInputElement`, `DOMHTMLLabelElement`, `DOMHTMLLegendElement`, `DOMHTMLLIElement`, `DOMHTMLLinkElement`, `DOMHTMLMapElement`, `DOMHTMLMarqueeElement`, `DOMHTMLMenuElement`, `DOMHTMLMetaElement`, `DOMHTMLModElement`, `DOMHTMLObjectElement`, `DOMHTMLOListElement`, `DOMHTMLOptGroupElement`, `DOMHTMLOptionElement`, `DOMHTMLParagraphElement`, `DOMHTMLParamElement`, `DOMHTMLPreElement`, `DOMHTMLQuoteElement`, `DOMHTMLScriptElement`, `DOMHTMLSelectElement`, `DOMHTMLStyleElement`, `DOMHTMLTableCaptionElement`, `DOMHTMLTableCellElement`, `DOMHTMLTableColElement`, `DOMHTMLTableElement`, `DOMHTMLTableRowElement`, `DOMHTMLTableSectionElement`, `DOMHTMLTextAreaElement`, `DOMHTMLTitleElement`, `DOMHTMLUListElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLElement` ?? C type: `WebKitDOMHTMLElement`

A #WebKitDOMHTMLElement

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| click | `DOMHTMLElement.click() -> none` | webkit_dom_html_element_click |  | A #WebKitDOMHTMLElement |
| get_access_key | `DOMHTMLElement.get_access_key() -> utf8` | webkit_dom_html_element_get_access_key |  | A #gchar |
| get_children | `DOMHTMLElement.get_children() -> DOMHTMLCollection` | webkit_dom_html_element_get_children |  | A #WebKitDOMHTMLCollection |
| get_content_editable | `DOMHTMLElement.get_content_editable() -> utf8` | webkit_dom_html_element_get_content_editable |  | A #gchar |
| get_dir | `DOMHTMLElement.get_dir() -> utf8` | webkit_dom_html_element_get_dir |  | A #gchar |
| get_draggable | `DOMHTMLElement.get_draggable() -> gboolean` | webkit_dom_html_element_get_draggable | 2.16 | A #gboolean |
| get_hidden | `DOMHTMLElement.get_hidden() -> gboolean` | webkit_dom_html_element_get_hidden | 2.16 | A #gboolean |
| get_inner_html | `DOMHTMLElement.get_inner_html() -> utf8` | webkit_dom_html_element_get_inner_html |  | a #gchar |
| get_inner_text | `DOMHTMLElement.get_inner_text() -> utf8` | webkit_dom_html_element_get_inner_text |  | A #gchar |
| get_is_content_editable | `DOMHTMLElement.get_is_content_editable() -> gboolean` | webkit_dom_html_element_get_is_content_editable |  | A #gboolean |
| get_lang | `DOMHTMLElement.get_lang() -> utf8` | webkit_dom_html_element_get_lang |  | A #gchar |
| get_outer_html | `DOMHTMLElement.get_outer_html() -> utf8` | webkit_dom_html_element_get_outer_html |  | a #gchar |
| get_outer_text | `DOMHTMLElement.get_outer_text() -> utf8` | webkit_dom_html_element_get_outer_text |  | A #gchar |
| get_spellcheck | `DOMHTMLElement.get_spellcheck() -> gboolean` | webkit_dom_html_element_get_spellcheck | 2.16 | A #gboolean |
| get_tab_index | `DOMHTMLElement.get_tab_index() -> glong` | webkit_dom_html_element_get_tab_index |  | A #glong |
| get_title | `DOMHTMLElement.get_title() -> utf8` | webkit_dom_html_element_get_title |  | A #gchar |
| get_translate | `DOMHTMLElement.get_translate() -> gboolean` | webkit_dom_html_element_get_translate | 2.16 | A #gboolean |
| get_webkitdropzone | `DOMHTMLElement.get_webkitdropzone() -> utf8` | webkit_dom_html_element_get_webkitdropzone | 2.16 | A #gchar |
| set_access_key | `DOMHTMLElement.set_access_key(value: utf8) -> none` | webkit_dom_html_element_set_access_key |  | A #WebKitDOMHTMLElement |
| set_content_editable | `DOMHTMLElement.set_content_editable(value: utf8) -> none throws` | webkit_dom_html_element_set_content_editable |  | A #WebKitDOMHTMLElement |
| set_dir | `DOMHTMLElement.set_dir(value: utf8) -> none` | webkit_dom_html_element_set_dir |  | A #WebKitDOMHTMLElement |
| set_draggable | `DOMHTMLElement.set_draggable(value: gboolean) -> none` | webkit_dom_html_element_set_draggable | 2.16 | A #WebKitDOMHTMLElement |
| set_hidden | `DOMHTMLElement.set_hidden(value: gboolean) -> none` | webkit_dom_html_element_set_hidden | 2.16 | A #WebKitDOMHTMLElement |
| set_inner_html | `DOMHTMLElement.set_inner_html(contents: utf8) -> none throws` | webkit_dom_html_element_set_inner_html |  | a #WebKitDOMHTMLElement |
| set_inner_text | `DOMHTMLElement.set_inner_text(value: utf8) -> none throws` | webkit_dom_html_element_set_inner_text |  | A #WebKitDOMHTMLElement |
| set_lang | `DOMHTMLElement.set_lang(value: utf8) -> none` | webkit_dom_html_element_set_lang |  | A #WebKitDOMHTMLElement |
| set_outer_html | `DOMHTMLElement.set_outer_html(contents: utf8) -> none throws` | webkit_dom_html_element_set_outer_html |  | a #WebKitDOMHTMLElement |
| set_outer_text | `DOMHTMLElement.set_outer_text(value: utf8) -> none throws` | webkit_dom_html_element_set_outer_text |  | A #WebKitDOMHTMLElement |
| set_spellcheck | `DOMHTMLElement.set_spellcheck(value: gboolean) -> none` | webkit_dom_html_element_set_spellcheck | 2.16 | A #WebKitDOMHTMLElement |
| set_tab_index | `DOMHTMLElement.set_tab_index(value: glong) -> none` | webkit_dom_html_element_set_tab_index |  | A #WebKitDOMHTMLElement |
| set_title | `DOMHTMLElement.set_title(value: utf8) -> none` | webkit_dom_html_element_set_title |  | A #WebKitDOMHTMLElement |
| set_translate | `DOMHTMLElement.set_translate(value: gboolean) -> none` | webkit_dom_html_element_set_translate | 2.16 | A #WebKitDOMHTMLElement |
| set_webkitdropzone | `DOMHTMLElement.set_webkitdropzone(value: utf8) -> none` | webkit_dom_html_element_set_webkitdropzone | 2.16 | A #WebKitDOMHTMLElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| access-key | utf8 | read, write |  |
| content-editable | utf8 | read, write |  |
| dir | utf8 | read, write |  |
| draggable | gboolean | read, write |  |
| hidden | gboolean | read, write |  |
| inner-text | utf8 | read, write |  |
| is-content-editable | gboolean | read |  |
| lang | utf8 | read, write |  |
| outer-text | utf8 | read, write |  |
| spellcheck | gboolean | read, write |  |
| tab-index | glong | read, write |  |
| title | utf8 | read, write |  |
| translate | gboolean | read, write |  |
| webkitdropzone | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLEmbedElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLEmbedElement` ?? C type: `WebKitDOMHTMLEmbedElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_align | `DOMHTMLEmbedElement.get_align() -> utf8` | webkit_dom_html_embed_element_get_align |  | A #gchar |
| get_height | `DOMHTMLEmbedElement.get_height() -> glong` | webkit_dom_html_embed_element_get_height |  | A #glong |
| get_name | `DOMHTMLEmbedElement.get_name() -> utf8` | webkit_dom_html_embed_element_get_name |  | A #gchar |
| get_src | `DOMHTMLEmbedElement.get_src() -> utf8` | webkit_dom_html_embed_element_get_src |  | A #gchar |
| get_type_attr | `DOMHTMLEmbedElement.get_type_attr() -> utf8` | webkit_dom_html_embed_element_get_type_attr |  | A #gchar |
| get_width | `DOMHTMLEmbedElement.get_width() -> glong` | webkit_dom_html_embed_element_get_width |  | A #glong |
| set_align | `DOMHTMLEmbedElement.set_align(value: utf8) -> none` | webkit_dom_html_embed_element_set_align |  | A #WebKitDOMHTMLEmbedElement |
| set_height | `DOMHTMLEmbedElement.set_height(value: glong) -> none` | webkit_dom_html_embed_element_set_height |  | A #WebKitDOMHTMLEmbedElement |
| set_name | `DOMHTMLEmbedElement.set_name(value: utf8) -> none` | webkit_dom_html_embed_element_set_name |  | A #WebKitDOMHTMLEmbedElement |
| set_src | `DOMHTMLEmbedElement.set_src(value: utf8) -> none` | webkit_dom_html_embed_element_set_src |  | A #WebKitDOMHTMLEmbedElement |
| set_type_attr | `DOMHTMLEmbedElement.set_type_attr(value: utf8) -> none` | webkit_dom_html_embed_element_set_type_attr |  | A #WebKitDOMHTMLEmbedElement |
| set_width | `DOMHTMLEmbedElement.set_width(value: glong) -> none` | webkit_dom_html_embed_element_set_width |  | A #WebKitDOMHTMLEmbedElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| align | utf8 | read, write |  |
| height | glong | read, write |  |
| name | utf8 | read, write |  |
| src | utf8 | read, write |  |
| type | utf8 | read, write |  |
| width | glong | read, write |  |

### WebKit2WebExtension.DOMHTMLFieldSetElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLFieldSetElement` ?? C type: `WebKitDOMHTMLFieldSetElement`

A #WebKitDOMHTMLFormElement

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_form | `DOMHTMLFieldSetElement.get_form() -> DOMHTMLFormElement` | webkit_dom_html_field_set_element_get_form |  | A #WebKitDOMHTMLFormElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| form | DOMHTMLFormElement | read |  |

### WebKit2WebExtension.DOMHTMLFontElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLFontElement` ?? C type: `WebKitDOMHTMLFontElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_color | `DOMHTMLFontElement.get_color() -> utf8` | webkit_dom_html_font_element_get_color |  | A #gchar |
| get_face | `DOMHTMLFontElement.get_face() -> utf8` | webkit_dom_html_font_element_get_face |  | A #gchar |
| get_size | `DOMHTMLFontElement.get_size() -> utf8` | webkit_dom_html_font_element_get_size |  | A #gchar |
| set_color | `DOMHTMLFontElement.set_color(value: utf8) -> none` | webkit_dom_html_font_element_set_color |  | A #WebKitDOMHTMLFontElement |
| set_face | `DOMHTMLFontElement.set_face(value: utf8) -> none` | webkit_dom_html_font_element_set_face |  | A #WebKitDOMHTMLFontElement |
| set_size | `DOMHTMLFontElement.set_size(value: utf8) -> none` | webkit_dom_html_font_element_set_size |  | A #WebKitDOMHTMLFontElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| color | utf8 | read, write |  |
| face | utf8 | read, write |  |
| size | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLFormElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLFormElement` ?? C type: `WebKitDOMHTMLFormElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_accept_charset | `DOMHTMLFormElement.get_accept_charset() -> utf8` | webkit_dom_html_form_element_get_accept_charset |  | A #gchar |
| get_action | `DOMHTMLFormElement.get_action() -> utf8` | webkit_dom_html_form_element_get_action |  | A #gchar |
| get_elements | `DOMHTMLFormElement.get_elements() -> DOMHTMLCollection` | webkit_dom_html_form_element_get_elements |  | A #WebKitDOMHTMLCollection |
| get_encoding | `DOMHTMLFormElement.get_encoding() -> utf8` | webkit_dom_html_form_element_get_encoding |  | A #gchar |
| get_enctype | `DOMHTMLFormElement.get_enctype() -> utf8` | webkit_dom_html_form_element_get_enctype |  | A #gchar |
| get_length | `DOMHTMLFormElement.get_length() -> glong` | webkit_dom_html_form_element_get_length |  | A #glong |
| get_method | `DOMHTMLFormElement.get_method() -> utf8` | webkit_dom_html_form_element_get_method |  | A #gchar |
| get_name | `DOMHTMLFormElement.get_name() -> utf8` | webkit_dom_html_form_element_get_name |  | A #gchar |
| get_target | `DOMHTMLFormElement.get_target() -> utf8` | webkit_dom_html_form_element_get_target |  | A #gchar |
| reset | `DOMHTMLFormElement.reset() -> none` | webkit_dom_html_form_element_reset |  | A #WebKitDOMHTMLFormElement |
| set_accept_charset | `DOMHTMLFormElement.set_accept_charset(value: utf8) -> none` | webkit_dom_html_form_element_set_accept_charset |  | A #WebKitDOMHTMLFormElement |
| set_action | `DOMHTMLFormElement.set_action(value: utf8) -> none` | webkit_dom_html_form_element_set_action |  | A #WebKitDOMHTMLFormElement |
| set_encoding | `DOMHTMLFormElement.set_encoding(value: utf8) -> none` | webkit_dom_html_form_element_set_encoding |  | A #WebKitDOMHTMLFormElement |
| set_enctype | `DOMHTMLFormElement.set_enctype(value: utf8) -> none` | webkit_dom_html_form_element_set_enctype |  | A #WebKitDOMHTMLFormElement |
| set_method | `DOMHTMLFormElement.set_method(value: utf8) -> none` | webkit_dom_html_form_element_set_method |  | A #WebKitDOMHTMLFormElement |
| set_name | `DOMHTMLFormElement.set_name(value: utf8) -> none` | webkit_dom_html_form_element_set_name |  | A #WebKitDOMHTMLFormElement |
| set_target | `DOMHTMLFormElement.set_target(value: utf8) -> none` | webkit_dom_html_form_element_set_target |  | A #WebKitDOMHTMLFormElement |
| submit | `DOMHTMLFormElement.submit() -> none` | webkit_dom_html_form_element_submit |  | A #WebKitDOMHTMLFormElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| accept-charset | utf8 | read, write |  |
| action | utf8 | read, write |  |
| elements | DOMHTMLCollection | read |  |
| encoding | utf8 | read, write |  |
| enctype | utf8 | read, write |  |
| length | glong | read |  |
| method | utf8 | read, write |  |
| name | utf8 | read, write |  |
| target | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLFrameElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLFrameElement` ?? C type: `WebKitDOMHTMLFrameElement`

A #WebKitDOMDocument

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_content_document | `DOMHTMLFrameElement.get_content_document() -> DOMDocument` | webkit_dom_html_frame_element_get_content_document |  | A #WebKitDOMDocument |
| get_content_window | `DOMHTMLFrameElement.get_content_window() -> DOMDOMWindow` | webkit_dom_html_frame_element_get_content_window |  | A #WebKitDOMDOMWindow |
| get_frame_border | `DOMHTMLFrameElement.get_frame_border() -> utf8` | webkit_dom_html_frame_element_get_frame_border |  | A #gchar |
| get_height | `DOMHTMLFrameElement.get_height() -> glong` | webkit_dom_html_frame_element_get_height |  | 0 |
| get_long_desc | `DOMHTMLFrameElement.get_long_desc() -> utf8` | webkit_dom_html_frame_element_get_long_desc |  | A #gchar |
| get_margin_height | `DOMHTMLFrameElement.get_margin_height() -> utf8` | webkit_dom_html_frame_element_get_margin_height |  | A #gchar |
| get_margin_width | `DOMHTMLFrameElement.get_margin_width() -> utf8` | webkit_dom_html_frame_element_get_margin_width |  | A #gchar |
| get_name | `DOMHTMLFrameElement.get_name() -> utf8` | webkit_dom_html_frame_element_get_name |  | A #gchar |
| get_no_resize | `DOMHTMLFrameElement.get_no_resize() -> gboolean` | webkit_dom_html_frame_element_get_no_resize |  | A #gboolean |
| get_scrolling | `DOMHTMLFrameElement.get_scrolling() -> utf8` | webkit_dom_html_frame_element_get_scrolling |  | A #gchar |
| get_src | `DOMHTMLFrameElement.get_src() -> utf8` | webkit_dom_html_frame_element_get_src |  | A #gchar |
| get_width | `DOMHTMLFrameElement.get_width() -> glong` | webkit_dom_html_frame_element_get_width |  | 0 |
| set_frame_border | `DOMHTMLFrameElement.set_frame_border(value: utf8) -> none` | webkit_dom_html_frame_element_set_frame_border |  | A #WebKitDOMHTMLFrameElement |
| set_long_desc | `DOMHTMLFrameElement.set_long_desc(value: utf8) -> none` | webkit_dom_html_frame_element_set_long_desc |  | A #WebKitDOMHTMLFrameElement |
| set_margin_height | `DOMHTMLFrameElement.set_margin_height(value: utf8) -> none` | webkit_dom_html_frame_element_set_margin_height |  | A #WebKitDOMHTMLFrameElement |
| set_margin_width | `DOMHTMLFrameElement.set_margin_width(value: utf8) -> none` | webkit_dom_html_frame_element_set_margin_width |  | A #WebKitDOMHTMLFrameElement |
| set_name | `DOMHTMLFrameElement.set_name(value: utf8) -> none` | webkit_dom_html_frame_element_set_name |  | A #WebKitDOMHTMLFrameElement |
| set_no_resize | `DOMHTMLFrameElement.set_no_resize(value: gboolean) -> none` | webkit_dom_html_frame_element_set_no_resize |  | A #WebKitDOMHTMLFrameElement |
| set_scrolling | `DOMHTMLFrameElement.set_scrolling(value: utf8) -> none` | webkit_dom_html_frame_element_set_scrolling |  | A #WebKitDOMHTMLFrameElement |
| set_src | `DOMHTMLFrameElement.set_src(value: utf8) -> none` | webkit_dom_html_frame_element_set_src |  | A #WebKitDOMHTMLFrameElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| content-document | DOMDocument | read |  |
| content-window | DOMDOMWindow | read |  |
| frame-border | utf8 | read, write |  |
| height | glong | read |  |
| long-desc | utf8 | read, write |  |
| margin-height | utf8 | read, write |  |
| margin-width | utf8 | read, write |  |
| name | utf8 | read, write |  |
| no-resize | gboolean | read, write |  |
| scrolling | utf8 | read, write |  |
| src | utf8 | read, write |  |
| width | glong | read |  |

### WebKit2WebExtension.DOMHTMLFrameSetElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLFrameSetElement` ?? C type: `WebKitDOMHTMLFrameSetElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_cols | `DOMHTMLFrameSetElement.get_cols() -> utf8` | webkit_dom_html_frame_set_element_get_cols |  | A #gchar |
| get_rows | `DOMHTMLFrameSetElement.get_rows() -> utf8` | webkit_dom_html_frame_set_element_get_rows |  | A #gchar |
| set_cols | `DOMHTMLFrameSetElement.set_cols(value: utf8) -> none` | webkit_dom_html_frame_set_element_set_cols |  | A #WebKitDOMHTMLFrameSetElement |
| set_rows | `DOMHTMLFrameSetElement.set_rows(value: utf8) -> none` | webkit_dom_html_frame_set_element_set_rows |  | A #WebKitDOMHTMLFrameSetElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| cols | utf8 | read, write |  |
| rows | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLHeadElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLHeadElement` ?? C type: `WebKitDOMHTMLHeadElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_profile | `DOMHTMLHeadElement.get_profile() -> utf8` | webkit_dom_html_head_element_get_profile |  | A #gchar |
| set_profile | `DOMHTMLHeadElement.set_profile(value: utf8) -> none` | webkit_dom_html_head_element_set_profile |  | A #WebKitDOMHTMLHeadElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| profile | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLHeadingElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLHeadingElement` ?? C type: `WebKitDOMHTMLHeadingElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_align | `DOMHTMLHeadingElement.get_align() -> utf8` | webkit_dom_html_heading_element_get_align |  | A #gchar |
| set_align | `DOMHTMLHeadingElement.set_align(value: utf8) -> none` | webkit_dom_html_heading_element_set_align |  | A #WebKitDOMHTMLHeadingElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| align | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLHRElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLHRElement` ?? C type: `WebKitDOMHTMLHRElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_align | `DOMHTMLHRElement.get_align() -> utf8` | webkit_dom_html_hr_element_get_align |  | A #gchar |
| get_no_shade | `DOMHTMLHRElement.get_no_shade() -> gboolean` | webkit_dom_html_hr_element_get_no_shade |  | A #gboolean |
| get_size | `DOMHTMLHRElement.get_size() -> utf8` | webkit_dom_html_hr_element_get_size |  | A #gchar |
| get_width | `DOMHTMLHRElement.get_width() -> utf8` | webkit_dom_html_hr_element_get_width |  | A #gchar |
| set_align | `DOMHTMLHRElement.set_align(value: utf8) -> none` | webkit_dom_html_hr_element_set_align |  | A #WebKitDOMHTMLHRElement |
| set_no_shade | `DOMHTMLHRElement.set_no_shade(value: gboolean) -> none` | webkit_dom_html_hr_element_set_no_shade |  | A #WebKitDOMHTMLHRElement |
| set_size | `DOMHTMLHRElement.set_size(value: utf8) -> none` | webkit_dom_html_hr_element_set_size |  | A #WebKitDOMHTMLHRElement |
| set_width | `DOMHTMLHRElement.set_width(value: utf8) -> none` | webkit_dom_html_hr_element_set_width |  | A #WebKitDOMHTMLHRElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| align | utf8 | read, write |  |
| no-shade | gboolean | read, write |  |
| size | utf8 | read, write |  |
| width | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLHtmlElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLHtmlElement` ?? C type: `WebKitDOMHTMLHtmlElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_version | `DOMHTMLHtmlElement.get_version() -> utf8` | webkit_dom_html_html_element_get_version |  | A #gchar |
| set_version | `DOMHTMLHtmlElement.set_version(value: utf8) -> none` | webkit_dom_html_html_element_set_version |  | A #WebKitDOMHTMLHtmlElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| version | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLIFrameElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLIFrameElement` ?? C type: `WebKitDOMHTMLIFrameElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_align | `DOMHTMLIFrameElement.get_align() -> utf8` | webkit_dom_html_iframe_element_get_align |  | A #gchar |
| get_content_document | `DOMHTMLIFrameElement.get_content_document() -> DOMDocument` | webkit_dom_html_iframe_element_get_content_document |  | A #WebKitDOMDocument |
| get_content_window | `DOMHTMLIFrameElement.get_content_window() -> DOMDOMWindow` | webkit_dom_html_iframe_element_get_content_window |  | A #WebKitDOMDOMWindow |
| get_frame_border | `DOMHTMLIFrameElement.get_frame_border() -> utf8` | webkit_dom_html_iframe_element_get_frame_border |  | A #gchar |
| get_height | `DOMHTMLIFrameElement.get_height() -> utf8` | webkit_dom_html_iframe_element_get_height |  | A #gchar |
| get_long_desc | `DOMHTMLIFrameElement.get_long_desc() -> utf8` | webkit_dom_html_iframe_element_get_long_desc |  | A #gchar |
| get_margin_height | `DOMHTMLIFrameElement.get_margin_height() -> utf8` | webkit_dom_html_iframe_element_get_margin_height |  | A #gchar |
| get_margin_width | `DOMHTMLIFrameElement.get_margin_width() -> utf8` | webkit_dom_html_iframe_element_get_margin_width |  | A #gchar |
| get_name | `DOMHTMLIFrameElement.get_name() -> utf8` | webkit_dom_html_iframe_element_get_name |  | A #gchar |
| get_scrolling | `DOMHTMLIFrameElement.get_scrolling() -> utf8` | webkit_dom_html_iframe_element_get_scrolling |  | A #gchar |
| get_src | `DOMHTMLIFrameElement.get_src() -> utf8` | webkit_dom_html_iframe_element_get_src |  | A #gchar |
| get_width | `DOMHTMLIFrameElement.get_width() -> utf8` | webkit_dom_html_iframe_element_get_width |  | A #gchar |
| set_align | `DOMHTMLIFrameElement.set_align(value: utf8) -> none` | webkit_dom_html_iframe_element_set_align |  | A #WebKitDOMHTMLIFrameElement |
| set_frame_border | `DOMHTMLIFrameElement.set_frame_border(value: utf8) -> none` | webkit_dom_html_iframe_element_set_frame_border |  | A #WebKitDOMHTMLIFrameElement |
| set_height | `DOMHTMLIFrameElement.set_height(value: utf8) -> none` | webkit_dom_html_iframe_element_set_height |  | A #WebKitDOMHTMLIFrameElement |
| set_long_desc | `DOMHTMLIFrameElement.set_long_desc(value: utf8) -> none` | webkit_dom_html_iframe_element_set_long_desc |  | A #WebKitDOMHTMLIFrameElement |
| set_margin_height | `DOMHTMLIFrameElement.set_margin_height(value: utf8) -> none` | webkit_dom_html_iframe_element_set_margin_height |  | A #WebKitDOMHTMLIFrameElement |
| set_margin_width | `DOMHTMLIFrameElement.set_margin_width(value: utf8) -> none` | webkit_dom_html_iframe_element_set_margin_width |  | A #WebKitDOMHTMLIFrameElement |
| set_name | `DOMHTMLIFrameElement.set_name(value: utf8) -> none` | webkit_dom_html_iframe_element_set_name |  | A #WebKitDOMHTMLIFrameElement |
| set_scrolling | `DOMHTMLIFrameElement.set_scrolling(value: utf8) -> none` | webkit_dom_html_iframe_element_set_scrolling |  | A #WebKitDOMHTMLIFrameElement |
| set_src | `DOMHTMLIFrameElement.set_src(value: utf8) -> none` | webkit_dom_html_iframe_element_set_src |  | A #WebKitDOMHTMLIFrameElement |
| set_width | `DOMHTMLIFrameElement.set_width(value: utf8) -> none` | webkit_dom_html_iframe_element_set_width |  | A #WebKitDOMHTMLIFrameElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| align | utf8 | read, write |  |
| content-document | DOMDocument | read |  |
| content-window | DOMDOMWindow | read |  |
| frame-border | utf8 | read, write |  |
| height | utf8 | read, write |  |
| long-desc | utf8 | read, write |  |
| margin-height | utf8 | read, write |  |
| margin-width | utf8 | read, write |  |
| name | utf8 | read, write |  |
| scrolling | utf8 | read, write |  |
| src | utf8 | read, write |  |
| width | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLImageElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLImageElement` ?? C type: `WebKitDOMHTMLImageElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_align | `DOMHTMLImageElement.get_align() -> utf8` | webkit_dom_html_image_element_get_align |  | A #gchar |
| get_alt | `DOMHTMLImageElement.get_alt() -> utf8` | webkit_dom_html_image_element_get_alt |  | A #gchar |
| get_border | `DOMHTMLImageElement.get_border() -> utf8` | webkit_dom_html_image_element_get_border |  | A #gchar |
| get_complete | `DOMHTMLImageElement.get_complete() -> gboolean` | webkit_dom_html_image_element_get_complete |  | A #gboolean |
| get_height | `DOMHTMLImageElement.get_height() -> glong` | webkit_dom_html_image_element_get_height |  | A #glong |
| get_hspace | `DOMHTMLImageElement.get_hspace() -> glong` | webkit_dom_html_image_element_get_hspace |  | A #glong |
| get_is_map | `DOMHTMLImageElement.get_is_map() -> gboolean` | webkit_dom_html_image_element_get_is_map |  | A #gboolean |
| get_long_desc | `DOMHTMLImageElement.get_long_desc() -> utf8` | webkit_dom_html_image_element_get_long_desc |  | A #gchar |
| get_lowsrc | `DOMHTMLImageElement.get_lowsrc() -> utf8` | webkit_dom_html_image_element_get_lowsrc |  | A #gchar |
| get_name | `DOMHTMLImageElement.get_name() -> utf8` | webkit_dom_html_image_element_get_name |  | A #gchar |
| get_natural_height | `DOMHTMLImageElement.get_natural_height() -> glong` | webkit_dom_html_image_element_get_natural_height |  | A #glong |
| get_natural_width | `DOMHTMLImageElement.get_natural_width() -> glong` | webkit_dom_html_image_element_get_natural_width |  | A #glong |
| get_src | `DOMHTMLImageElement.get_src() -> utf8` | webkit_dom_html_image_element_get_src |  | A #gchar |
| get_use_map | `DOMHTMLImageElement.get_use_map() -> utf8` | webkit_dom_html_image_element_get_use_map |  | A #gchar |
| get_vspace | `DOMHTMLImageElement.get_vspace() -> glong` | webkit_dom_html_image_element_get_vspace |  | A #glong |
| get_width | `DOMHTMLImageElement.get_width() -> glong` | webkit_dom_html_image_element_get_width |  | A #glong |
| get_x | `DOMHTMLImageElement.get_x() -> glong` | webkit_dom_html_image_element_get_x |  | A #glong |
| get_y | `DOMHTMLImageElement.get_y() -> glong` | webkit_dom_html_image_element_get_y |  | A #glong |
| set_align | `DOMHTMLImageElement.set_align(value: utf8) -> none` | webkit_dom_html_image_element_set_align |  | A #WebKitDOMHTMLImageElement |
| set_alt | `DOMHTMLImageElement.set_alt(value: utf8) -> none` | webkit_dom_html_image_element_set_alt |  | A #WebKitDOMHTMLImageElement |
| set_border | `DOMHTMLImageElement.set_border(value: utf8) -> none` | webkit_dom_html_image_element_set_border |  | A #WebKitDOMHTMLImageElement |
| set_height | `DOMHTMLImageElement.set_height(value: glong) -> none` | webkit_dom_html_image_element_set_height |  | A #WebKitDOMHTMLImageElement |
| set_hspace | `DOMHTMLImageElement.set_hspace(value: glong) -> none` | webkit_dom_html_image_element_set_hspace |  | A #WebKitDOMHTMLImageElement |
| set_is_map | `DOMHTMLImageElement.set_is_map(value: gboolean) -> none` | webkit_dom_html_image_element_set_is_map |  | A #WebKitDOMHTMLImageElement |
| set_long_desc | `DOMHTMLImageElement.set_long_desc(value: utf8) -> none` | webkit_dom_html_image_element_set_long_desc |  | A #WebKitDOMHTMLImageElement |
| set_lowsrc | `DOMHTMLImageElement.set_lowsrc(value: utf8) -> none` | webkit_dom_html_image_element_set_lowsrc |  | A #WebKitDOMHTMLImageElement |
| set_name | `DOMHTMLImageElement.set_name(value: utf8) -> none` | webkit_dom_html_image_element_set_name |  | A #WebKitDOMHTMLImageElement |
| set_src | `DOMHTMLImageElement.set_src(value: utf8) -> none` | webkit_dom_html_image_element_set_src |  | A #WebKitDOMHTMLImageElement |
| set_use_map | `DOMHTMLImageElement.set_use_map(value: utf8) -> none` | webkit_dom_html_image_element_set_use_map |  | A #WebKitDOMHTMLImageElement |
| set_vspace | `DOMHTMLImageElement.set_vspace(value: glong) -> none` | webkit_dom_html_image_element_set_vspace |  | A #WebKitDOMHTMLImageElement |
| set_width | `DOMHTMLImageElement.set_width(value: glong) -> none` | webkit_dom_html_image_element_set_width |  | A #WebKitDOMHTMLImageElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| align | utf8 | read, write |  |
| alt | utf8 | read, write |  |
| border | utf8 | read, write |  |
| complete | gboolean | read |  |
| height | glong | read, write |  |
| hspace | glong | read, write |  |
| is-map | gboolean | read, write |  |
| long-desc | utf8 | read, write |  |
| lowsrc | utf8 | read, write |  |
| name | utf8 | read, write |  |
| natural-height | glong | read |  |
| natural-width | glong | read |  |
| src | utf8 | read, write |  |
| use-map | utf8 | read, write |  |
| vspace | glong | read, write |  |
| width | glong | read, write |  |
| x | glong | read |  |
| y | glong | read |  |

### WebKit2WebExtension.DOMHTMLInputElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLInputElement` ?? C type: `WebKitDOMHTMLInputElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_accept | `DOMHTMLInputElement.get_accept() -> utf8` | webkit_dom_html_input_element_get_accept |  | A #gchar |
| get_align | `DOMHTMLInputElement.get_align() -> utf8` | webkit_dom_html_input_element_get_align |  | A #gchar |
| get_alt | `DOMHTMLInputElement.get_alt() -> utf8` | webkit_dom_html_input_element_get_alt |  | A #gchar |
| get_auto_filled | `DOMHTMLInputElement.get_auto_filled() -> gboolean` | webkit_dom_html_input_element_get_auto_filled | 2.16 | A #gboolean |
| get_autofocus | `DOMHTMLInputElement.get_autofocus() -> gboolean` | webkit_dom_html_input_element_get_autofocus |  | A #gboolean |
| get_capture | `DOMHTMLInputElement.get_capture() -> gboolean` | webkit_dom_html_input_element_get_capture |  | A #gboolean |
| get_capture_type | `DOMHTMLInputElement.get_capture_type() -> utf8` | webkit_dom_html_input_element_get_capture_type | 2.14 | A #gchar |
| get_checked | `DOMHTMLInputElement.get_checked() -> gboolean` | webkit_dom_html_input_element_get_checked |  | A #gboolean |
| get_default_checked | `DOMHTMLInputElement.get_default_checked() -> gboolean` | webkit_dom_html_input_element_get_default_checked |  | A #gboolean |
| get_default_value | `DOMHTMLInputElement.get_default_value() -> utf8` | webkit_dom_html_input_element_get_default_value |  | A #gchar |
| get_disabled | `DOMHTMLInputElement.get_disabled() -> gboolean` | webkit_dom_html_input_element_get_disabled |  | A #gboolean |
| get_files | `DOMHTMLInputElement.get_files() -> DOMFileList` | webkit_dom_html_input_element_get_files |  | A #WebKitDOMFileList |
| get_form | `DOMHTMLInputElement.get_form() -> DOMHTMLFormElement` | webkit_dom_html_input_element_get_form |  | A #WebKitDOMHTMLFormElement |
| get_height | `DOMHTMLInputElement.get_height() -> gulong` | webkit_dom_html_input_element_get_height |  | A #gulong |
| get_indeterminate | `DOMHTMLInputElement.get_indeterminate() -> gboolean` | webkit_dom_html_input_element_get_indeterminate |  | A #gboolean |
| get_input_type | `DOMHTMLInputElement.get_input_type() -> utf8` | webkit_dom_html_input_element_get_input_type |  | A #gchar |
| get_max_length | `DOMHTMLInputElement.get_max_length() -> glong` | webkit_dom_html_input_element_get_max_length |  | A #glong |
| get_multiple | `DOMHTMLInputElement.get_multiple() -> gboolean` | webkit_dom_html_input_element_get_multiple |  | A #gboolean |
| get_name | `DOMHTMLInputElement.get_name() -> utf8` | webkit_dom_html_input_element_get_name |  | A #gchar |
| get_read_only | `DOMHTMLInputElement.get_read_only() -> gboolean` | webkit_dom_html_input_element_get_read_only | 2.16 | A #gboolean |
| get_size | `DOMHTMLInputElement.get_size() -> gulong` | webkit_dom_html_input_element_get_size |  | A #gulong |
| get_src | `DOMHTMLInputElement.get_src() -> utf8` | webkit_dom_html_input_element_get_src |  | A #gchar |
| get_use_map | `DOMHTMLInputElement.get_use_map() -> utf8` | webkit_dom_html_input_element_get_use_map |  | A #gchar |
| get_value | `DOMHTMLInputElement.get_value() -> utf8` | webkit_dom_html_input_element_get_value |  | A #gchar |
| get_width | `DOMHTMLInputElement.get_width() -> gulong` | webkit_dom_html_input_element_get_width |  | A #gulong |
| get_will_validate | `DOMHTMLInputElement.get_will_validate() -> gboolean` | webkit_dom_html_input_element_get_will_validate |  | A #gboolean |
| is_edited | `DOMHTMLInputElement.is_edited() -> gboolean` | webkit_dom_html_input_element_is_edited |  | A #gboolean |
| select | `DOMHTMLInputElement.select() -> none` | webkit_dom_html_input_element_select |  | A #WebKitDOMHTMLInputElement |
| set_accept | `DOMHTMLInputElement.set_accept(value: utf8) -> none` | webkit_dom_html_input_element_set_accept |  | A #WebKitDOMHTMLInputElement |
| set_align | `DOMHTMLInputElement.set_align(value: utf8) -> none` | webkit_dom_html_input_element_set_align |  | A #WebKitDOMHTMLInputElement |
| set_alt | `DOMHTMLInputElement.set_alt(value: utf8) -> none` | webkit_dom_html_input_element_set_alt |  | A #WebKitDOMHTMLInputElement |
| set_auto_filled | `DOMHTMLInputElement.set_auto_filled(value: gboolean) -> none` | webkit_dom_html_input_element_set_auto_filled | 2.16 | A #WebKitDOMHTMLInputElement |
| set_autofocus | `DOMHTMLInputElement.set_autofocus(value: gboolean) -> none` | webkit_dom_html_input_element_set_autofocus |  | A #WebKitDOMHTMLInputElement |
| set_capture_type | `DOMHTMLInputElement.set_capture_type(value: utf8) -> none` | webkit_dom_html_input_element_set_capture_type | 2.16 | A #WebKitDOMHTMLInputElement |
| set_checked | `DOMHTMLInputElement.set_checked(value: gboolean) -> none` | webkit_dom_html_input_element_set_checked |  | A #WebKitDOMHTMLInputElement |
| set_default_checked | `DOMHTMLInputElement.set_default_checked(value: gboolean) -> none` | webkit_dom_html_input_element_set_default_checked | 2.16 | A #WebKitDOMHTMLInputElement |
| set_default_value | `DOMHTMLInputElement.set_default_value(value: utf8) -> none` | webkit_dom_html_input_element_set_default_value |  | A #WebKitDOMHTMLInputElement |
| set_disabled | `DOMHTMLInputElement.set_disabled(value: gboolean) -> none` | webkit_dom_html_input_element_set_disabled |  | A #WebKitDOMHTMLInputElement |
| set_editing_value | `DOMHTMLInputElement.set_editing_value(value: utf8) -> none` | webkit_dom_html_input_element_set_editing_value | 2.16 | A #WebKitDOMHTMLInputElement |
| set_files | `DOMHTMLInputElement.set_files(value: DOMFileList) -> none` | webkit_dom_html_input_element_set_files |  | A #WebKitDOMHTMLInputElement |
| set_height | `DOMHTMLInputElement.set_height(value: gulong) -> none` | webkit_dom_html_input_element_set_height |  | A #WebKitDOMHTMLInputElement |
| set_indeterminate | `DOMHTMLInputElement.set_indeterminate(value: gboolean) -> none` | webkit_dom_html_input_element_set_indeterminate |  | A #WebKitDOMHTMLInputElement |
| set_input_type | `DOMHTMLInputElement.set_input_type(value: utf8) -> none` | webkit_dom_html_input_element_set_input_type |  | A #WebKitDOMHTMLInputElement |
| set_max_length | `DOMHTMLInputElement.set_max_length(value: glong) -> none throws` | webkit_dom_html_input_element_set_max_length |  | A #WebKitDOMHTMLInputElement |
| set_multiple | `DOMHTMLInputElement.set_multiple(value: gboolean) -> none` | webkit_dom_html_input_element_set_multiple |  | A #WebKitDOMHTMLInputElement |
| set_name | `DOMHTMLInputElement.set_name(value: utf8) -> none` | webkit_dom_html_input_element_set_name |  | A #WebKitDOMHTMLInputElement |
| set_read_only | `DOMHTMLInputElement.set_read_only(value: gboolean) -> none` | webkit_dom_html_input_element_set_read_only |  | A #WebKitDOMHTMLInputElement |
| set_size | `DOMHTMLInputElement.set_size(value: gulong) -> none throws` | webkit_dom_html_input_element_set_size |  | A #WebKitDOMHTMLInputElement |
| set_src | `DOMHTMLInputElement.set_src(value: utf8) -> none` | webkit_dom_html_input_element_set_src |  | A #WebKitDOMHTMLInputElement |
| set_use_map | `DOMHTMLInputElement.set_use_map(value: utf8) -> none` | webkit_dom_html_input_element_set_use_map |  | A #WebKitDOMHTMLInputElement |
| set_value | `DOMHTMLInputElement.set_value(value: utf8) -> none` | webkit_dom_html_input_element_set_value |  | A #WebKitDOMHTMLInputElement |
| set_width | `DOMHTMLInputElement.set_width(value: gulong) -> none` | webkit_dom_html_input_element_set_width |  | A #WebKitDOMHTMLInputElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| accept | utf8 | read, write |  |
| align | utf8 | read, write |  |
| alt | utf8 | read, write |  |
| autofocus | gboolean | read, write |  |
| capture | utf8 | read, write |  |
| checked | gboolean | read, write |  |
| default-checked | gboolean | read, write |  |
| default-value | utf8 | read, write |  |
| disabled | gboolean | read, write |  |
| files | DOMFileList | read |  |
| form | DOMHTMLFormElement | read |  |
| height | gulong | read, write |  |
| indeterminate | gboolean | read, write |  |
| max-length | glong | read, write |  |
| multiple | gboolean | read, write |  |
| name | utf8 | read, write |  |
| read-only | gboolean | read, write |  |
| size | gulong | read, write |  |
| src | utf8 | read, write |  |
| type | utf8 | read, write |  |
| use-map | utf8 | read, write |  |
| value | utf8 | read, write |  |
| width | gulong | read, write |  |
| will-validate | gboolean | read |  |

### WebKit2WebExtension.DOMHTMLLabelElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLLabelElement` ?? C type: `WebKitDOMHTMLLabelElement`

A #WebKitDOMHTMLFormElement

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_form | `DOMHTMLLabelElement.get_form() -> DOMHTMLFormElement` | webkit_dom_html_label_element_get_form |  | A #WebKitDOMHTMLFormElement |
| get_html_for | `DOMHTMLLabelElement.get_html_for() -> utf8` | webkit_dom_html_label_element_get_html_for |  | A #gchar |
| set_html_for | `DOMHTMLLabelElement.set_html_for(value: utf8) -> none` | webkit_dom_html_label_element_set_html_for |  | A #WebKitDOMHTMLLabelElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| form | DOMHTMLFormElement | read |  |
| html-for | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLLegendElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLLegendElement` ?? C type: `WebKitDOMHTMLLegendElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_align | `DOMHTMLLegendElement.get_align() -> utf8` | webkit_dom_html_legend_element_get_align |  | A #gchar |
| get_form | `DOMHTMLLegendElement.get_form() -> DOMHTMLFormElement` | webkit_dom_html_legend_element_get_form |  | A #WebKitDOMHTMLFormElement |
| set_align | `DOMHTMLLegendElement.set_align(value: utf8) -> none` | webkit_dom_html_legend_element_set_align |  | A #WebKitDOMHTMLLegendElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| align | utf8 | read, write |  |
| form | DOMHTMLFormElement | read |  |

### WebKit2WebExtension.DOMHTMLLIElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLLIElement` ?? C type: `WebKitDOMHTMLLIElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_type_attr | `DOMHTMLLIElement.get_type_attr() -> utf8` | webkit_dom_html_li_element_get_type_attr |  | A #gchar |
| get_value | `DOMHTMLLIElement.get_value() -> glong` | webkit_dom_html_li_element_get_value |  | A #glong |
| set_type_attr | `DOMHTMLLIElement.set_type_attr(value: utf8) -> none` | webkit_dom_html_li_element_set_type_attr |  | A #WebKitDOMHTMLLIElement |
| set_value | `DOMHTMLLIElement.set_value(value: glong) -> none` | webkit_dom_html_li_element_set_value |  | A #WebKitDOMHTMLLIElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| type | utf8 | read, write |  |
| value | glong | read, write |  |

### WebKit2WebExtension.DOMHTMLLinkElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLLinkElement` ?? C type: `WebKitDOMHTMLLinkElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_charset | `DOMHTMLLinkElement.get_charset() -> utf8` | webkit_dom_html_link_element_get_charset |  | A #gchar |
| get_disabled | `DOMHTMLLinkElement.get_disabled() -> gboolean` | webkit_dom_html_link_element_get_disabled |  | A #gboolean |
| get_href | `DOMHTMLLinkElement.get_href() -> utf8` | webkit_dom_html_link_element_get_href |  | A #gchar |
| get_hreflang | `DOMHTMLLinkElement.get_hreflang() -> utf8` | webkit_dom_html_link_element_get_hreflang |  | A #gchar |
| get_media | `DOMHTMLLinkElement.get_media() -> utf8` | webkit_dom_html_link_element_get_media |  | A #gchar |
| get_rel | `DOMHTMLLinkElement.get_rel() -> utf8` | webkit_dom_html_link_element_get_rel |  | A #gchar |
| get_rev | `DOMHTMLLinkElement.get_rev() -> utf8` | webkit_dom_html_link_element_get_rev |  | A #gchar |
| get_sheet | `DOMHTMLLinkElement.get_sheet() -> DOMStyleSheet` | webkit_dom_html_link_element_get_sheet |  | A #WebKitDOMStyleSheet |
| get_sizes | `DOMHTMLLinkElement.get_sizes() -> DOMDOMTokenList` | webkit_dom_html_link_element_get_sizes | 2.16 | A #WebKitDOMDOMTokenList |
| get_target | `DOMHTMLLinkElement.get_target() -> utf8` | webkit_dom_html_link_element_get_target |  | A #gchar |
| get_type_attr | `DOMHTMLLinkElement.get_type_attr() -> utf8` | webkit_dom_html_link_element_get_type_attr |  | A #gchar |
| set_charset | `DOMHTMLLinkElement.set_charset(value: utf8) -> none` | webkit_dom_html_link_element_set_charset |  | A #WebKitDOMHTMLLinkElement |
| set_disabled | `DOMHTMLLinkElement.set_disabled(value: gboolean) -> none` | webkit_dom_html_link_element_set_disabled |  | A #WebKitDOMHTMLLinkElement |
| set_href | `DOMHTMLLinkElement.set_href(value: utf8) -> none` | webkit_dom_html_link_element_set_href |  | A #WebKitDOMHTMLLinkElement |
| set_hreflang | `DOMHTMLLinkElement.set_hreflang(value: utf8) -> none` | webkit_dom_html_link_element_set_hreflang |  | A #WebKitDOMHTMLLinkElement |
| set_media | `DOMHTMLLinkElement.set_media(value: utf8) -> none` | webkit_dom_html_link_element_set_media |  | A #WebKitDOMHTMLLinkElement |
| set_rel | `DOMHTMLLinkElement.set_rel(value: utf8) -> none` | webkit_dom_html_link_element_set_rel |  | A #WebKitDOMHTMLLinkElement |
| set_rev | `DOMHTMLLinkElement.set_rev(value: utf8) -> none` | webkit_dom_html_link_element_set_rev |  | A #WebKitDOMHTMLLinkElement |
| set_sizes | `DOMHTMLLinkElement.set_sizes(value: utf8) -> none` | webkit_dom_html_link_element_set_sizes | 2.16 | A #WebKitDOMHTMLLinkElement |
| set_target | `DOMHTMLLinkElement.set_target(value: utf8) -> none` | webkit_dom_html_link_element_set_target |  | A #WebKitDOMHTMLLinkElement |
| set_type_attr | `DOMHTMLLinkElement.set_type_attr(value: utf8) -> none` | webkit_dom_html_link_element_set_type_attr |  | A #WebKitDOMHTMLLinkElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| charset | utf8 | read, write |  |
| disabled | gboolean | read, write |  |
| href | utf8 | read, write |  |
| hreflang | utf8 | read, write |  |
| media | utf8 | read, write |  |
| rel | utf8 | read, write |  |
| rev | utf8 | read, write |  |
| sheet | DOMStyleSheet | read |  |
| sizes | DOMDOMTokenList | read |  |
| target | utf8 | read, write |  |
| type | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLMapElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLMapElement` ?? C type: `WebKitDOMHTMLMapElement`

A #WebKitDOMHTMLCollection

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_areas | `DOMHTMLMapElement.get_areas() -> DOMHTMLCollection` | webkit_dom_html_map_element_get_areas |  | A #WebKitDOMHTMLCollection |
| get_name | `DOMHTMLMapElement.get_name() -> utf8` | webkit_dom_html_map_element_get_name |  | A #gchar |
| set_name | `DOMHTMLMapElement.set_name(value: utf8) -> none` | webkit_dom_html_map_element_set_name |  | A #WebKitDOMHTMLMapElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| areas | DOMHTMLCollection | read |  |
| name | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLMarqueeElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLMarqueeElement` ?? C type: `WebKitDOMHTMLMarqueeElement`

A #WebKitDOMHTMLMarqueeElement

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| start | `DOMHTMLMarqueeElement.start() -> none` | webkit_dom_html_marquee_element_start |  | A #WebKitDOMHTMLMarqueeElement |
| stop | `DOMHTMLMarqueeElement.stop() -> none` | webkit_dom_html_marquee_element_stop |  | A #WebKitDOMHTMLMarqueeElement |

### WebKit2WebExtension.DOMHTMLMenuElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLMenuElement` ?? C type: `WebKitDOMHTMLMenuElement`

A #gboolean

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_compact | `DOMHTMLMenuElement.get_compact() -> gboolean` | webkit_dom_html_menu_element_get_compact |  | A #gboolean |
| set_compact | `DOMHTMLMenuElement.set_compact(value: gboolean) -> none` | webkit_dom_html_menu_element_set_compact |  | A #WebKitDOMHTMLMenuElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| compact | gboolean | read, write |  |

### WebKit2WebExtension.DOMHTMLMetaElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLMetaElement` ?? C type: `WebKitDOMHTMLMetaElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_content | `DOMHTMLMetaElement.get_content() -> utf8` | webkit_dom_html_meta_element_get_content |  | A #gchar |
| get_http_equiv | `DOMHTMLMetaElement.get_http_equiv() -> utf8` | webkit_dom_html_meta_element_get_http_equiv |  | A #gchar |
| get_name | `DOMHTMLMetaElement.get_name() -> utf8` | webkit_dom_html_meta_element_get_name |  | A #gchar |
| get_scheme | `DOMHTMLMetaElement.get_scheme() -> utf8` | webkit_dom_html_meta_element_get_scheme |  | A #gchar |
| set_content | `DOMHTMLMetaElement.set_content(value: utf8) -> none` | webkit_dom_html_meta_element_set_content |  | A #WebKitDOMHTMLMetaElement |
| set_http_equiv | `DOMHTMLMetaElement.set_http_equiv(value: utf8) -> none` | webkit_dom_html_meta_element_set_http_equiv |  | A #WebKitDOMHTMLMetaElement |
| set_name | `DOMHTMLMetaElement.set_name(value: utf8) -> none` | webkit_dom_html_meta_element_set_name |  | A #WebKitDOMHTMLMetaElement |
| set_scheme | `DOMHTMLMetaElement.set_scheme(value: utf8) -> none` | webkit_dom_html_meta_element_set_scheme |  | A #WebKitDOMHTMLMetaElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| content | utf8 | read, write |  |
| http-equiv | utf8 | read, write |  |
| name | utf8 | read, write |  |
| scheme | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLModElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLModElement` ?? C type: `WebKitDOMHTMLModElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_cite | `DOMHTMLModElement.get_cite() -> utf8` | webkit_dom_html_mod_element_get_cite |  | A #gchar |
| get_date_time | `DOMHTMLModElement.get_date_time() -> utf8` | webkit_dom_html_mod_element_get_date_time |  | A #gchar |
| set_cite | `DOMHTMLModElement.set_cite(value: utf8) -> none` | webkit_dom_html_mod_element_set_cite |  | A #WebKitDOMHTMLModElement |
| set_date_time | `DOMHTMLModElement.set_date_time(value: utf8) -> none` | webkit_dom_html_mod_element_set_date_time |  | A #WebKitDOMHTMLModElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| cite | utf8 | read, write |  |
| date-time | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLObjectElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLObjectElement` ?? C type: `WebKitDOMHTMLObjectElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_align | `DOMHTMLObjectElement.get_align() -> utf8` | webkit_dom_html_object_element_get_align |  | A #gchar |
| get_archive | `DOMHTMLObjectElement.get_archive() -> utf8` | webkit_dom_html_object_element_get_archive |  | A #gchar |
| get_border | `DOMHTMLObjectElement.get_border() -> utf8` | webkit_dom_html_object_element_get_border |  | A #gchar |
| get_code | `DOMHTMLObjectElement.get_code() -> utf8` | webkit_dom_html_object_element_get_code |  | A #gchar |
| get_code_base | `DOMHTMLObjectElement.get_code_base() -> utf8` | webkit_dom_html_object_element_get_code_base |  | A #gchar |
| get_code_type | `DOMHTMLObjectElement.get_code_type() -> utf8` | webkit_dom_html_object_element_get_code_type |  | A #gchar |
| get_content_document | `DOMHTMLObjectElement.get_content_document() -> DOMDocument` | webkit_dom_html_object_element_get_content_document |  | A #WebKitDOMDocument |
| get_data | `DOMHTMLObjectElement.get_data() -> utf8` | webkit_dom_html_object_element_get_data |  | A #gchar |
| get_declare | `DOMHTMLObjectElement.get_declare() -> gboolean` | webkit_dom_html_object_element_get_declare |  | A #gboolean |
| get_form | `DOMHTMLObjectElement.get_form() -> DOMHTMLFormElement` | webkit_dom_html_object_element_get_form |  | A #WebKitDOMHTMLFormElement |
| get_height | `DOMHTMLObjectElement.get_height() -> utf8` | webkit_dom_html_object_element_get_height |  | A #gchar |
| get_hspace | `DOMHTMLObjectElement.get_hspace() -> glong` | webkit_dom_html_object_element_get_hspace |  | A #glong |
| get_name | `DOMHTMLObjectElement.get_name() -> utf8` | webkit_dom_html_object_element_get_name |  | A #gchar |
| get_standby | `DOMHTMLObjectElement.get_standby() -> utf8` | webkit_dom_html_object_element_get_standby |  | A #gchar |
| get_type_attr | `DOMHTMLObjectElement.get_type_attr() -> utf8` | webkit_dom_html_object_element_get_type_attr |  | A #gchar |
| get_use_map | `DOMHTMLObjectElement.get_use_map() -> utf8` | webkit_dom_html_object_element_get_use_map |  | A #gchar |
| get_vspace | `DOMHTMLObjectElement.get_vspace() -> glong` | webkit_dom_html_object_element_get_vspace |  | A #glong |
| get_width | `DOMHTMLObjectElement.get_width() -> utf8` | webkit_dom_html_object_element_get_width |  | A #gchar |
| set_align | `DOMHTMLObjectElement.set_align(value: utf8) -> none` | webkit_dom_html_object_element_set_align |  | A #WebKitDOMHTMLObjectElement |
| set_archive | `DOMHTMLObjectElement.set_archive(value: utf8) -> none` | webkit_dom_html_object_element_set_archive |  | A #WebKitDOMHTMLObjectElement |
| set_border | `DOMHTMLObjectElement.set_border(value: utf8) -> none` | webkit_dom_html_object_element_set_border |  | A #WebKitDOMHTMLObjectElement |
| set_code | `DOMHTMLObjectElement.set_code(value: utf8) -> none` | webkit_dom_html_object_element_set_code |  | A #WebKitDOMHTMLObjectElement |
| set_code_base | `DOMHTMLObjectElement.set_code_base(value: utf8) -> none` | webkit_dom_html_object_element_set_code_base |  | A #WebKitDOMHTMLObjectElement |
| set_code_type | `DOMHTMLObjectElement.set_code_type(value: utf8) -> none` | webkit_dom_html_object_element_set_code_type |  | A #WebKitDOMHTMLObjectElement |
| set_data | `DOMHTMLObjectElement.set_data(value: utf8) -> none` | webkit_dom_html_object_element_set_data |  | A #WebKitDOMHTMLObjectElement |
| set_declare | `DOMHTMLObjectElement.set_declare(value: gboolean) -> none` | webkit_dom_html_object_element_set_declare |  | A #WebKitDOMHTMLObjectElement |
| set_height | `DOMHTMLObjectElement.set_height(value: utf8) -> none` | webkit_dom_html_object_element_set_height |  | A #WebKitDOMHTMLObjectElement |
| set_hspace | `DOMHTMLObjectElement.set_hspace(value: glong) -> none` | webkit_dom_html_object_element_set_hspace |  | A #WebKitDOMHTMLObjectElement |
| set_name | `DOMHTMLObjectElement.set_name(value: utf8) -> none` | webkit_dom_html_object_element_set_name |  | A #WebKitDOMHTMLObjectElement |
| set_standby | `DOMHTMLObjectElement.set_standby(value: utf8) -> none` | webkit_dom_html_object_element_set_standby |  | A #WebKitDOMHTMLObjectElement |
| set_type_attr | `DOMHTMLObjectElement.set_type_attr(value: utf8) -> none` | webkit_dom_html_object_element_set_type_attr |  | A #WebKitDOMHTMLObjectElement |
| set_use_map | `DOMHTMLObjectElement.set_use_map(value: utf8) -> none` | webkit_dom_html_object_element_set_use_map |  | A #WebKitDOMHTMLObjectElement |
| set_vspace | `DOMHTMLObjectElement.set_vspace(value: glong) -> none` | webkit_dom_html_object_element_set_vspace |  | A #WebKitDOMHTMLObjectElement |
| set_width | `DOMHTMLObjectElement.set_width(value: utf8) -> none` | webkit_dom_html_object_element_set_width |  | A #WebKitDOMHTMLObjectElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| align | utf8 | read, write |  |
| archive | utf8 | read, write |  |
| border | utf8 | read, write |  |
| code | utf8 | read, write |  |
| code-base | utf8 | read, write |  |
| code-type | utf8 | read, write |  |
| content-document | DOMDocument | read |  |
| data | utf8 | read, write |  |
| declare | gboolean | read, write |  |
| form | DOMHTMLFormElement | read |  |
| height | utf8 | read, write |  |
| hspace | glong | read, write |  |
| name | utf8 | read, write |  |
| standby | utf8 | read, write |  |
| type | utf8 | read, write |  |
| use-map | utf8 | read, write |  |
| vspace | glong | read, write |  |
| width | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLOListElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLOListElement` ?? C type: `WebKitDOMHTMLOListElement`

A #gboolean

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_compact | `DOMHTMLOListElement.get_compact() -> gboolean` | webkit_dom_html_o_list_element_get_compact |  | A #gboolean |
| get_start | `DOMHTMLOListElement.get_start() -> glong` | webkit_dom_html_o_list_element_get_start |  | A #glong |
| get_type_attr | `DOMHTMLOListElement.get_type_attr() -> utf8` | webkit_dom_html_o_list_element_get_type_attr |  | A #gchar |
| set_compact | `DOMHTMLOListElement.set_compact(value: gboolean) -> none` | webkit_dom_html_o_list_element_set_compact |  | A #WebKitDOMHTMLOListElement |
| set_start | `DOMHTMLOListElement.set_start(value: glong) -> none` | webkit_dom_html_o_list_element_set_start |  | A #WebKitDOMHTMLOListElement |
| set_type_attr | `DOMHTMLOListElement.set_type_attr(value: utf8) -> none` | webkit_dom_html_o_list_element_set_type_attr |  | A #WebKitDOMHTMLOListElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| compact | gboolean | read, write |  |
| start | glong | read, write |  |
| type | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLOptGroupElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLOptGroupElement` ?? C type: `WebKitDOMHTMLOptGroupElement`

A #gboolean

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_disabled | `DOMHTMLOptGroupElement.get_disabled() -> gboolean` | webkit_dom_html_opt_group_element_get_disabled |  | A #gboolean |
| get_label | `DOMHTMLOptGroupElement.get_label() -> utf8` | webkit_dom_html_opt_group_element_get_label |  | A #gchar |
| set_disabled | `DOMHTMLOptGroupElement.set_disabled(value: gboolean) -> none` | webkit_dom_html_opt_group_element_set_disabled |  | A #WebKitDOMHTMLOptGroupElement |
| set_label | `DOMHTMLOptGroupElement.set_label(value: utf8) -> none` | webkit_dom_html_opt_group_element_set_label |  | A #WebKitDOMHTMLOptGroupElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| disabled | gboolean | read, write |  |
| label | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLOptionElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLOptionElement` ?? C type: `WebKitDOMHTMLOptionElement`

A #gboolean

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default_selected | `DOMHTMLOptionElement.get_default_selected() -> gboolean` | webkit_dom_html_option_element_get_default_selected |  | A #gboolean |
| get_disabled | `DOMHTMLOptionElement.get_disabled() -> gboolean` | webkit_dom_html_option_element_get_disabled |  | A #gboolean |
| get_form | `DOMHTMLOptionElement.get_form() -> DOMHTMLFormElement` | webkit_dom_html_option_element_get_form |  | A #WebKitDOMHTMLFormElement |
| get_index | `DOMHTMLOptionElement.get_index() -> glong` | webkit_dom_html_option_element_get_index |  | A #glong |
| get_label | `DOMHTMLOptionElement.get_label() -> utf8` | webkit_dom_html_option_element_get_label |  | A #gchar |
| get_selected | `DOMHTMLOptionElement.get_selected() -> gboolean` | webkit_dom_html_option_element_get_selected |  | A #gboolean |
| get_text | `DOMHTMLOptionElement.get_text() -> utf8` | webkit_dom_html_option_element_get_text |  | A #gchar |
| get_value | `DOMHTMLOptionElement.get_value() -> utf8` | webkit_dom_html_option_element_get_value |  | A #gchar |
| set_default_selected | `DOMHTMLOptionElement.set_default_selected(value: gboolean) -> none` | webkit_dom_html_option_element_set_default_selected |  | A #WebKitDOMHTMLOptionElement |
| set_disabled | `DOMHTMLOptionElement.set_disabled(value: gboolean) -> none` | webkit_dom_html_option_element_set_disabled |  | A #WebKitDOMHTMLOptionElement |
| set_label | `DOMHTMLOptionElement.set_label(value: utf8) -> none` | webkit_dom_html_option_element_set_label |  | A #WebKitDOMHTMLOptionElement |
| set_selected | `DOMHTMLOptionElement.set_selected(value: gboolean) -> none` | webkit_dom_html_option_element_set_selected |  | A #WebKitDOMHTMLOptionElement |
| set_value | `DOMHTMLOptionElement.set_value(value: utf8) -> none` | webkit_dom_html_option_element_set_value |  | A #WebKitDOMHTMLOptionElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| default-selected | gboolean | read, write |  |
| disabled | gboolean | read, write |  |
| form | DOMHTMLFormElement | read |  |
| index | glong | read |  |
| label | utf8 | read, write |  |
| selected | gboolean | read, write |  |
| text | utf8 | read |  |
| value | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLOptionsCollection

Parent: `DOMHTMLCollection` ?? GType: `WebKitDOMHTMLOptionsCollection` ?? C type: `WebKitDOMHTMLOptionsCollection`

A #gulong

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLCollection |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_length | `DOMHTMLOptionsCollection.get_length() -> gulong` | webkit_dom_html_options_collection_get_length |  | A #gulong |
| get_selected_index | `DOMHTMLOptionsCollection.get_selected_index() -> glong` | webkit_dom_html_options_collection_get_selected_index |  | A #glong |
| named_item | `DOMHTMLOptionsCollection.named_item(name: utf8) -> DOMNode` | webkit_dom_html_options_collection_named_item |  | A #WebKitDOMNode |
| set_selected_index | `DOMHTMLOptionsCollection.set_selected_index(value: glong) -> none` | webkit_dom_html_options_collection_set_selected_index |  | A #WebKitDOMHTMLOptionsCollection |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| length | gulong | read |  |
| selected-index | glong | read, write |  |

### WebKit2WebExtension.DOMHTMLParagraphElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLParagraphElement` ?? C type: `WebKitDOMHTMLParagraphElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_align | `DOMHTMLParagraphElement.get_align() -> utf8` | webkit_dom_html_paragraph_element_get_align |  | A #gchar |
| set_align | `DOMHTMLParagraphElement.set_align(value: utf8) -> none` | webkit_dom_html_paragraph_element_set_align |  | A #WebKitDOMHTMLParagraphElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| align | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLParamElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLParamElement` ?? C type: `WebKitDOMHTMLParamElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_name | `DOMHTMLParamElement.get_name() -> utf8` | webkit_dom_html_param_element_get_name |  | A #gchar |
| get_type_attr | `DOMHTMLParamElement.get_type_attr() -> utf8` | webkit_dom_html_param_element_get_type_attr |  | A #gchar |
| get_value | `DOMHTMLParamElement.get_value() -> utf8` | webkit_dom_html_param_element_get_value |  | A #gchar |
| get_value_type | `DOMHTMLParamElement.get_value_type() -> utf8` | webkit_dom_html_param_element_get_value_type |  | A #gchar |
| set_name | `DOMHTMLParamElement.set_name(value: utf8) -> none` | webkit_dom_html_param_element_set_name |  | A #WebKitDOMHTMLParamElement |
| set_type_attr | `DOMHTMLParamElement.set_type_attr(value: utf8) -> none` | webkit_dom_html_param_element_set_type_attr |  | A #WebKitDOMHTMLParamElement |
| set_value | `DOMHTMLParamElement.set_value(value: utf8) -> none` | webkit_dom_html_param_element_set_value |  | A #WebKitDOMHTMLParamElement |
| set_value_type | `DOMHTMLParamElement.set_value_type(value: utf8) -> none` | webkit_dom_html_param_element_set_value_type |  | A #WebKitDOMHTMLParamElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| name | utf8 | read, write |  |
| type | utf8 | read, write |  |
| value | utf8 | read, write |  |
| value-type | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLPreElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLPreElement` ?? C type: `WebKitDOMHTMLPreElement`

A #glong

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_width | `DOMHTMLPreElement.get_width() -> glong` | webkit_dom_html_pre_element_get_width |  | A #glong |
| get_wrap | `DOMHTMLPreElement.get_wrap() -> gboolean` | webkit_dom_html_pre_element_get_wrap |  | A #gboolean |
| set_width | `DOMHTMLPreElement.set_width(value: glong) -> none` | webkit_dom_html_pre_element_set_width |  | A #WebKitDOMHTMLPreElement |
| set_wrap | `DOMHTMLPreElement.set_wrap(value: gboolean) -> none` | webkit_dom_html_pre_element_set_wrap |  | A #WebKitDOMHTMLPreElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| width | glong | read, write |  |
| wrap | gboolean | read, write |  |

### WebKit2WebExtension.DOMHTMLQuoteElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLQuoteElement` ?? C type: `WebKitDOMHTMLQuoteElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_cite | `DOMHTMLQuoteElement.get_cite() -> utf8` | webkit_dom_html_quote_element_get_cite |  | A #gchar |
| set_cite | `DOMHTMLQuoteElement.set_cite(value: utf8) -> none` | webkit_dom_html_quote_element_set_cite |  | A #WebKitDOMHTMLQuoteElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| cite | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLScriptElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLScriptElement` ?? C type: `WebKitDOMHTMLScriptElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_charset | `DOMHTMLScriptElement.get_charset() -> utf8` | webkit_dom_html_script_element_get_charset |  | A #gchar |
| get_defer | `DOMHTMLScriptElement.get_defer() -> gboolean` | webkit_dom_html_script_element_get_defer |  | A #gboolean |
| get_event | `DOMHTMLScriptElement.get_event() -> utf8` | webkit_dom_html_script_element_get_event |  | A #gchar |
| get_html_for | `DOMHTMLScriptElement.get_html_for() -> utf8` | webkit_dom_html_script_element_get_html_for |  | A #gchar |
| get_src | `DOMHTMLScriptElement.get_src() -> utf8` | webkit_dom_html_script_element_get_src |  | A #gchar |
| get_text | `DOMHTMLScriptElement.get_text() -> utf8` | webkit_dom_html_script_element_get_text |  | A #gchar |
| get_type_attr | `DOMHTMLScriptElement.get_type_attr() -> utf8` | webkit_dom_html_script_element_get_type_attr |  | A #gchar |
| set_charset | `DOMHTMLScriptElement.set_charset(value: utf8) -> none` | webkit_dom_html_script_element_set_charset | 2.16 | A #WebKitDOMHTMLScriptElement |
| set_defer | `DOMHTMLScriptElement.set_defer(value: gboolean) -> none` | webkit_dom_html_script_element_set_defer |  | A #WebKitDOMHTMLScriptElement |
| set_event | `DOMHTMLScriptElement.set_event(value: utf8) -> none` | webkit_dom_html_script_element_set_event |  | A #WebKitDOMHTMLScriptElement |
| set_html_for | `DOMHTMLScriptElement.set_html_for(value: utf8) -> none` | webkit_dom_html_script_element_set_html_for |  | A #WebKitDOMHTMLScriptElement |
| set_src | `DOMHTMLScriptElement.set_src(value: utf8) -> none` | webkit_dom_html_script_element_set_src |  | A #WebKitDOMHTMLScriptElement |
| set_text | `DOMHTMLScriptElement.set_text(value: utf8) -> none` | webkit_dom_html_script_element_set_text |  | A #WebKitDOMHTMLScriptElement |
| set_type_attr | `DOMHTMLScriptElement.set_type_attr(value: utf8) -> none` | webkit_dom_html_script_element_set_type_attr |  | A #WebKitDOMHTMLScriptElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| charset | utf8 | read, write |  |
| defer | gboolean | read, write |  |
| event | utf8 | read, write |  |
| html-for | utf8 | read, write |  |
| src | utf8 | read, write |  |
| text | utf8 | read, write |  |
| type | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLSelectElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLSelectElement` ?? C type: `WebKitDOMHTMLSelectElement`

A #WebKitDOMHTMLSelectElement

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `DOMHTMLSelectElement.add(element: DOMHTMLElement, before: DOMHTMLElement) -> none throws` | webkit_dom_html_select_element_add |  | A #WebKitDOMHTMLSelectElement |
| get_autofocus | `DOMHTMLSelectElement.get_autofocus() -> gboolean` | webkit_dom_html_select_element_get_autofocus |  | A #gboolean |
| get_disabled | `DOMHTMLSelectElement.get_disabled() -> gboolean` | webkit_dom_html_select_element_get_disabled |  | A #gboolean |
| get_form | `DOMHTMLSelectElement.get_form() -> DOMHTMLFormElement` | webkit_dom_html_select_element_get_form |  | A #WebKitDOMHTMLFormElement |
| get_length | `DOMHTMLSelectElement.get_length() -> gulong` | webkit_dom_html_select_element_get_length |  | A #gulong |
| get_multiple | `DOMHTMLSelectElement.get_multiple() -> gboolean` | webkit_dom_html_select_element_get_multiple |  | A #gboolean |
| get_name | `DOMHTMLSelectElement.get_name() -> utf8` | webkit_dom_html_select_element_get_name |  | A #gchar |
| get_options | `DOMHTMLSelectElement.get_options() -> DOMHTMLOptionsCollection` | webkit_dom_html_select_element_get_options |  | A #WebKitDOMHTMLOptionsCollection |
| get_select_type | `DOMHTMLSelectElement.get_select_type() -> utf8` | webkit_dom_html_select_element_get_select_type |  | A #gchar |
| get_selected_index | `DOMHTMLSelectElement.get_selected_index() -> glong` | webkit_dom_html_select_element_get_selected_index |  | A #glong |
| get_size | `DOMHTMLSelectElement.get_size() -> glong` | webkit_dom_html_select_element_get_size |  | A #glong |
| get_value | `DOMHTMLSelectElement.get_value() -> utf8` | webkit_dom_html_select_element_get_value |  | A #gchar |
| get_will_validate | `DOMHTMLSelectElement.get_will_validate() -> gboolean` | webkit_dom_html_select_element_get_will_validate |  | A #gboolean |
| item | `DOMHTMLSelectElement.item(index: gulong) -> DOMNode` | webkit_dom_html_select_element_item |  | A #WebKitDOMNode |
| named_item | `DOMHTMLSelectElement.named_item(name: utf8) -> DOMNode` | webkit_dom_html_select_element_named_item |  | A #WebKitDOMNode |
| remove | `DOMHTMLSelectElement.remove(index: glong) -> none` | webkit_dom_html_select_element_remove |  | A #WebKitDOMHTMLSelectElement |
| set_autofocus | `DOMHTMLSelectElement.set_autofocus(value: gboolean) -> none` | webkit_dom_html_select_element_set_autofocus |  | A #WebKitDOMHTMLSelectElement |
| set_disabled | `DOMHTMLSelectElement.set_disabled(value: gboolean) -> none` | webkit_dom_html_select_element_set_disabled |  | A #WebKitDOMHTMLSelectElement |
| set_length | `DOMHTMLSelectElement.set_length(value: gulong) -> none throws` | webkit_dom_html_select_element_set_length |  | A #WebKitDOMHTMLSelectElement |
| set_multiple | `DOMHTMLSelectElement.set_multiple(value: gboolean) -> none` | webkit_dom_html_select_element_set_multiple |  | A #WebKitDOMHTMLSelectElement |
| set_name | `DOMHTMLSelectElement.set_name(value: utf8) -> none` | webkit_dom_html_select_element_set_name |  | A #WebKitDOMHTMLSelectElement |
| set_selected_index | `DOMHTMLSelectElement.set_selected_index(value: glong) -> none` | webkit_dom_html_select_element_set_selected_index |  | A #WebKitDOMHTMLSelectElement |
| set_size | `DOMHTMLSelectElement.set_size(value: glong) -> none` | webkit_dom_html_select_element_set_size |  | A #WebKitDOMHTMLSelectElement |
| set_value | `DOMHTMLSelectElement.set_value(value: utf8) -> none` | webkit_dom_html_select_element_set_value |  | A #WebKitDOMHTMLSelectElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| autofocus | gboolean | read, write |  |
| disabled | gboolean | read, write |  |
| form | DOMHTMLFormElement | read |  |
| length | gulong | read, write |  |
| multiple | gboolean | read, write |  |
| name | utf8 | read, write |  |
| options | DOMHTMLOptionsCollection | read |  |
| selected-index | glong | read, write |  |
| size | glong | read, write |  |
| type | utf8 | read |  |
| value | utf8 | read, write |  |
| will-validate | gboolean | read |  |

### WebKit2WebExtension.DOMHTMLStyleElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLStyleElement` ?? C type: `WebKitDOMHTMLStyleElement`

A #gboolean

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_disabled | `DOMHTMLStyleElement.get_disabled() -> gboolean` | webkit_dom_html_style_element_get_disabled |  | A #gboolean |
| get_media | `DOMHTMLStyleElement.get_media() -> utf8` | webkit_dom_html_style_element_get_media |  | A #gchar |
| get_sheet | `DOMHTMLStyleElement.get_sheet() -> DOMStyleSheet` | webkit_dom_html_style_element_get_sheet |  | A #WebKitDOMStyleSheet |
| get_type_attr | `DOMHTMLStyleElement.get_type_attr() -> utf8` | webkit_dom_html_style_element_get_type_attr |  | A #gchar |
| set_disabled | `DOMHTMLStyleElement.set_disabled(value: gboolean) -> none` | webkit_dom_html_style_element_set_disabled |  | A #WebKitDOMHTMLStyleElement |
| set_media | `DOMHTMLStyleElement.set_media(value: utf8) -> none` | webkit_dom_html_style_element_set_media |  | A #WebKitDOMHTMLStyleElement |
| set_type_attr | `DOMHTMLStyleElement.set_type_attr(value: utf8) -> none` | webkit_dom_html_style_element_set_type_attr |  | A #WebKitDOMHTMLStyleElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| disabled | gboolean | read, write |  |
| media | utf8 | read, write |  |
| sheet | DOMStyleSheet | read |  |
| type | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLTableCaptionElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLTableCaptionElement` ?? C type: `WebKitDOMHTMLTableCaptionElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_align | `DOMHTMLTableCaptionElement.get_align() -> utf8` | webkit_dom_html_table_caption_element_get_align |  | A #gchar |
| set_align | `DOMHTMLTableCaptionElement.set_align(value: utf8) -> none` | webkit_dom_html_table_caption_element_set_align |  | A #WebKitDOMHTMLTableCaptionElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| align | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLTableCellElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLTableCellElement` ?? C type: `WebKitDOMHTMLTableCellElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_abbr | `DOMHTMLTableCellElement.get_abbr() -> utf8` | webkit_dom_html_table_cell_element_get_abbr |  | A #gchar |
| get_align | `DOMHTMLTableCellElement.get_align() -> utf8` | webkit_dom_html_table_cell_element_get_align |  | A #gchar |
| get_axis | `DOMHTMLTableCellElement.get_axis() -> utf8` | webkit_dom_html_table_cell_element_get_axis |  | A #gchar |
| get_bg_color | `DOMHTMLTableCellElement.get_bg_color() -> utf8` | webkit_dom_html_table_cell_element_get_bg_color |  | A #gchar |
| get_cell_index | `DOMHTMLTableCellElement.get_cell_index() -> glong` | webkit_dom_html_table_cell_element_get_cell_index |  | A #glong |
| get_ch | `DOMHTMLTableCellElement.get_ch() -> utf8` | webkit_dom_html_table_cell_element_get_ch |  | A #gchar |
| get_ch_off | `DOMHTMLTableCellElement.get_ch_off() -> utf8` | webkit_dom_html_table_cell_element_get_ch_off |  | A #gchar |
| get_col_span | `DOMHTMLTableCellElement.get_col_span() -> glong` | webkit_dom_html_table_cell_element_get_col_span |  | A #glong |
| get_headers | `DOMHTMLTableCellElement.get_headers() -> utf8` | webkit_dom_html_table_cell_element_get_headers |  | A #gchar |
| get_height | `DOMHTMLTableCellElement.get_height() -> utf8` | webkit_dom_html_table_cell_element_get_height |  | A #gchar |
| get_no_wrap | `DOMHTMLTableCellElement.get_no_wrap() -> gboolean` | webkit_dom_html_table_cell_element_get_no_wrap |  | A #gboolean |
| get_row_span | `DOMHTMLTableCellElement.get_row_span() -> glong` | webkit_dom_html_table_cell_element_get_row_span |  | A #glong |
| get_scope | `DOMHTMLTableCellElement.get_scope() -> utf8` | webkit_dom_html_table_cell_element_get_scope |  | A #gchar |
| get_v_align | `DOMHTMLTableCellElement.get_v_align() -> utf8` | webkit_dom_html_table_cell_element_get_v_align |  | A #gchar |
| get_width | `DOMHTMLTableCellElement.get_width() -> utf8` | webkit_dom_html_table_cell_element_get_width |  | A #gchar |
| set_abbr | `DOMHTMLTableCellElement.set_abbr(value: utf8) -> none` | webkit_dom_html_table_cell_element_set_abbr |  | A #WebKitDOMHTMLTableCellElement |
| set_align | `DOMHTMLTableCellElement.set_align(value: utf8) -> none` | webkit_dom_html_table_cell_element_set_align |  | A #WebKitDOMHTMLTableCellElement |
| set_axis | `DOMHTMLTableCellElement.set_axis(value: utf8) -> none` | webkit_dom_html_table_cell_element_set_axis |  | A #WebKitDOMHTMLTableCellElement |
| set_bg_color | `DOMHTMLTableCellElement.set_bg_color(value: utf8) -> none` | webkit_dom_html_table_cell_element_set_bg_color |  | A #WebKitDOMHTMLTableCellElement |
| set_ch | `DOMHTMLTableCellElement.set_ch(value: utf8) -> none` | webkit_dom_html_table_cell_element_set_ch |  | A #WebKitDOMHTMLTableCellElement |
| set_ch_off | `DOMHTMLTableCellElement.set_ch_off(value: utf8) -> none` | webkit_dom_html_table_cell_element_set_ch_off |  | A #WebKitDOMHTMLTableCellElement |
| set_col_span | `DOMHTMLTableCellElement.set_col_span(value: glong) -> none` | webkit_dom_html_table_cell_element_set_col_span |  | A #WebKitDOMHTMLTableCellElement |
| set_headers | `DOMHTMLTableCellElement.set_headers(value: utf8) -> none` | webkit_dom_html_table_cell_element_set_headers |  | A #WebKitDOMHTMLTableCellElement |
| set_height | `DOMHTMLTableCellElement.set_height(value: utf8) -> none` | webkit_dom_html_table_cell_element_set_height |  | A #WebKitDOMHTMLTableCellElement |
| set_no_wrap | `DOMHTMLTableCellElement.set_no_wrap(value: gboolean) -> none` | webkit_dom_html_table_cell_element_set_no_wrap |  | A #WebKitDOMHTMLTableCellElement |
| set_row_span | `DOMHTMLTableCellElement.set_row_span(value: glong) -> none` | webkit_dom_html_table_cell_element_set_row_span |  | A #WebKitDOMHTMLTableCellElement |
| set_scope | `DOMHTMLTableCellElement.set_scope(value: utf8) -> none` | webkit_dom_html_table_cell_element_set_scope |  | A #WebKitDOMHTMLTableCellElement |
| set_v_align | `DOMHTMLTableCellElement.set_v_align(value: utf8) -> none` | webkit_dom_html_table_cell_element_set_v_align |  | A #WebKitDOMHTMLTableCellElement |
| set_width | `DOMHTMLTableCellElement.set_width(value: utf8) -> none` | webkit_dom_html_table_cell_element_set_width |  | A #WebKitDOMHTMLTableCellElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| abbr | utf8 | read, write |  |
| align | utf8 | read, write |  |
| axis | utf8 | read, write |  |
| bg-color | utf8 | read, write |  |
| cell-index | glong | read |  |
| ch | utf8 | read, write |  |
| ch-off | utf8 | read, write |  |
| col-span | glong | read, write |  |
| headers | utf8 | read, write |  |
| height | utf8 | read, write |  |
| no-wrap | gboolean | read, write |  |
| row-span | glong | read, write |  |
| scope | utf8 | read, write |  |
| v-align | utf8 | read, write |  |
| width | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLTableColElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLTableColElement` ?? C type: `WebKitDOMHTMLTableColElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_align | `DOMHTMLTableColElement.get_align() -> utf8` | webkit_dom_html_table_col_element_get_align |  | A #gchar |
| get_ch | `DOMHTMLTableColElement.get_ch() -> utf8` | webkit_dom_html_table_col_element_get_ch |  | A #gchar |
| get_ch_off | `DOMHTMLTableColElement.get_ch_off() -> utf8` | webkit_dom_html_table_col_element_get_ch_off |  | A #gchar |
| get_span | `DOMHTMLTableColElement.get_span() -> glong` | webkit_dom_html_table_col_element_get_span |  | A #glong |
| get_v_align | `DOMHTMLTableColElement.get_v_align() -> utf8` | webkit_dom_html_table_col_element_get_v_align |  | A #gchar |
| get_width | `DOMHTMLTableColElement.get_width() -> utf8` | webkit_dom_html_table_col_element_get_width |  | A #gchar |
| set_align | `DOMHTMLTableColElement.set_align(value: utf8) -> none` | webkit_dom_html_table_col_element_set_align |  | A #WebKitDOMHTMLTableColElement |
| set_ch | `DOMHTMLTableColElement.set_ch(value: utf8) -> none` | webkit_dom_html_table_col_element_set_ch |  | A #WebKitDOMHTMLTableColElement |
| set_ch_off | `DOMHTMLTableColElement.set_ch_off(value: utf8) -> none` | webkit_dom_html_table_col_element_set_ch_off |  | A #WebKitDOMHTMLTableColElement |
| set_span | `DOMHTMLTableColElement.set_span(value: glong) -> none` | webkit_dom_html_table_col_element_set_span |  | A #WebKitDOMHTMLTableColElement |
| set_v_align | `DOMHTMLTableColElement.set_v_align(value: utf8) -> none` | webkit_dom_html_table_col_element_set_v_align |  | A #WebKitDOMHTMLTableColElement |
| set_width | `DOMHTMLTableColElement.set_width(value: utf8) -> none` | webkit_dom_html_table_col_element_set_width |  | A #WebKitDOMHTMLTableColElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| align | utf8 | read, write |  |
| ch | utf8 | read, write |  |
| ch-off | utf8 | read, write |  |
| span | glong | read, write |  |
| v-align | utf8 | read, write |  |
| width | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLTableElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLTableElement` ?? C type: `WebKitDOMHTMLTableElement`

A #WebKitDOMHTMLElement

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| create_caption | `DOMHTMLTableElement.create_caption() -> DOMHTMLElement` | webkit_dom_html_table_element_create_caption |  | A #WebKitDOMHTMLElement |
| create_t_foot | `DOMHTMLTableElement.create_t_foot() -> DOMHTMLElement` | webkit_dom_html_table_element_create_t_foot |  | A #WebKitDOMHTMLElement |
| create_t_head | `DOMHTMLTableElement.create_t_head() -> DOMHTMLElement` | webkit_dom_html_table_element_create_t_head |  | A #WebKitDOMHTMLElement |
| delete_caption | `DOMHTMLTableElement.delete_caption() -> none` | webkit_dom_html_table_element_delete_caption |  | A #WebKitDOMHTMLTableElement |
| delete_row | `DOMHTMLTableElement.delete_row(index: glong) -> none throws` | webkit_dom_html_table_element_delete_row |  | A #WebKitDOMHTMLTableElement |
| delete_t_foot | `DOMHTMLTableElement.delete_t_foot() -> none` | webkit_dom_html_table_element_delete_t_foot |  | A #WebKitDOMHTMLTableElement |
| delete_t_head | `DOMHTMLTableElement.delete_t_head() -> none` | webkit_dom_html_table_element_delete_t_head |  | A #WebKitDOMHTMLTableElement |
| get_align | `DOMHTMLTableElement.get_align() -> utf8` | webkit_dom_html_table_element_get_align |  | A #gchar |
| get_bg_color | `DOMHTMLTableElement.get_bg_color() -> utf8` | webkit_dom_html_table_element_get_bg_color |  | A #gchar |
| get_border | `DOMHTMLTableElement.get_border() -> utf8` | webkit_dom_html_table_element_get_border |  | A #gchar |
| get_caption | `DOMHTMLTableElement.get_caption() -> DOMHTMLTableCaptionElement` | webkit_dom_html_table_element_get_caption |  | A #WebKitDOMHTMLTableCaptionElement |
| get_cell_padding | `DOMHTMLTableElement.get_cell_padding() -> utf8` | webkit_dom_html_table_element_get_cell_padding |  | A #gchar |
| get_cell_spacing | `DOMHTMLTableElement.get_cell_spacing() -> utf8` | webkit_dom_html_table_element_get_cell_spacing |  | A #gchar |
| get_rows | `DOMHTMLTableElement.get_rows() -> DOMHTMLCollection` | webkit_dom_html_table_element_get_rows |  | A #WebKitDOMHTMLCollection |
| get_rules | `DOMHTMLTableElement.get_rules() -> utf8` | webkit_dom_html_table_element_get_rules |  | A #gchar |
| get_summary | `DOMHTMLTableElement.get_summary() -> utf8` | webkit_dom_html_table_element_get_summary |  | A #gchar |
| get_t_bodies | `DOMHTMLTableElement.get_t_bodies() -> DOMHTMLCollection` | webkit_dom_html_table_element_get_t_bodies |  | A #WebKitDOMHTMLCollection |
| get_t_foot | `DOMHTMLTableElement.get_t_foot() -> DOMHTMLTableSectionElement` | webkit_dom_html_table_element_get_t_foot |  | A #WebKitDOMHTMLTableSectionElement |
| get_t_head | `DOMHTMLTableElement.get_t_head() -> DOMHTMLTableSectionElement` | webkit_dom_html_table_element_get_t_head |  | A #WebKitDOMHTMLTableSectionElement |
| get_width | `DOMHTMLTableElement.get_width() -> utf8` | webkit_dom_html_table_element_get_width |  | A #gchar |
| insert_row | `DOMHTMLTableElement.insert_row(index: glong) -> DOMHTMLElement throws` | webkit_dom_html_table_element_insert_row |  | A #WebKitDOMHTMLElement |
| set_align | `DOMHTMLTableElement.set_align(value: utf8) -> none` | webkit_dom_html_table_element_set_align |  | A #WebKitDOMHTMLTableElement |
| set_bg_color | `DOMHTMLTableElement.set_bg_color(value: utf8) -> none` | webkit_dom_html_table_element_set_bg_color |  | A #WebKitDOMHTMLTableElement |
| set_border | `DOMHTMLTableElement.set_border(value: utf8) -> none` | webkit_dom_html_table_element_set_border |  | A #WebKitDOMHTMLTableElement |
| set_caption | `DOMHTMLTableElement.set_caption(value: DOMHTMLTableCaptionElement) -> none throws` | webkit_dom_html_table_element_set_caption |  | A #WebKitDOMHTMLTableElement |
| set_cell_padding | `DOMHTMLTableElement.set_cell_padding(value: utf8) -> none` | webkit_dom_html_table_element_set_cell_padding |  | A #WebKitDOMHTMLTableElement |
| set_cell_spacing | `DOMHTMLTableElement.set_cell_spacing(value: utf8) -> none` | webkit_dom_html_table_element_set_cell_spacing |  | A #WebKitDOMHTMLTableElement |
| set_rules | `DOMHTMLTableElement.set_rules(value: utf8) -> none` | webkit_dom_html_table_element_set_rules |  | A #WebKitDOMHTMLTableElement |
| set_summary | `DOMHTMLTableElement.set_summary(value: utf8) -> none` | webkit_dom_html_table_element_set_summary |  | A #WebKitDOMHTMLTableElement |
| set_t_foot | `DOMHTMLTableElement.set_t_foot(value: DOMHTMLTableSectionElement) -> none throws` | webkit_dom_html_table_element_set_t_foot |  | A #WebKitDOMHTMLTableElement |
| set_t_head | `DOMHTMLTableElement.set_t_head(value: DOMHTMLTableSectionElement) -> none throws` | webkit_dom_html_table_element_set_t_head |  | A #WebKitDOMHTMLTableElement |
| set_width | `DOMHTMLTableElement.set_width(value: utf8) -> none` | webkit_dom_html_table_element_set_width |  | A #WebKitDOMHTMLTableElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| align | utf8 | read, write |  |
| bg-color | utf8 | read, write |  |
| border | utf8 | read, write |  |
| caption | DOMHTMLTableCaptionElement | read |  |
| cell-padding | utf8 | read, write |  |
| cell-spacing | utf8 | read, write |  |
| rows | DOMHTMLCollection | read |  |
| rules | utf8 | read, write |  |
| summary | utf8 | read, write |  |
| t-bodies | DOMHTMLCollection | read |  |
| t-foot | DOMHTMLTableSectionElement | read |  |
| t-head | DOMHTMLTableSectionElement | read |  |
| width | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLTableRowElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLTableRowElement` ?? C type: `WebKitDOMHTMLTableRowElement`

A #WebKitDOMHTMLTableRowElement

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| delete_cell | `DOMHTMLTableRowElement.delete_cell(index: glong) -> none throws` | webkit_dom_html_table_row_element_delete_cell |  | A #WebKitDOMHTMLTableRowElement |
| get_align | `DOMHTMLTableRowElement.get_align() -> utf8` | webkit_dom_html_table_row_element_get_align |  | A #gchar |
| get_bg_color | `DOMHTMLTableRowElement.get_bg_color() -> utf8` | webkit_dom_html_table_row_element_get_bg_color |  | A #gchar |
| get_cells | `DOMHTMLTableRowElement.get_cells() -> DOMHTMLCollection` | webkit_dom_html_table_row_element_get_cells |  | A #WebKitDOMHTMLCollection |
| get_ch | `DOMHTMLTableRowElement.get_ch() -> utf8` | webkit_dom_html_table_row_element_get_ch |  | A #gchar |
| get_ch_off | `DOMHTMLTableRowElement.get_ch_off() -> utf8` | webkit_dom_html_table_row_element_get_ch_off |  | A #gchar |
| get_row_index | `DOMHTMLTableRowElement.get_row_index() -> glong` | webkit_dom_html_table_row_element_get_row_index |  | A #glong |
| get_section_row_index | `DOMHTMLTableRowElement.get_section_row_index() -> glong` | webkit_dom_html_table_row_element_get_section_row_index |  | A #glong |
| get_v_align | `DOMHTMLTableRowElement.get_v_align() -> utf8` | webkit_dom_html_table_row_element_get_v_align |  | A #gchar |
| insert_cell | `DOMHTMLTableRowElement.insert_cell(index: glong) -> DOMHTMLElement throws` | webkit_dom_html_table_row_element_insert_cell |  | A #WebKitDOMHTMLElement |
| set_align | `DOMHTMLTableRowElement.set_align(value: utf8) -> none` | webkit_dom_html_table_row_element_set_align |  | A #WebKitDOMHTMLTableRowElement |
| set_bg_color | `DOMHTMLTableRowElement.set_bg_color(value: utf8) -> none` | webkit_dom_html_table_row_element_set_bg_color |  | A #WebKitDOMHTMLTableRowElement |
| set_ch | `DOMHTMLTableRowElement.set_ch(value: utf8) -> none` | webkit_dom_html_table_row_element_set_ch |  | A #WebKitDOMHTMLTableRowElement |
| set_ch_off | `DOMHTMLTableRowElement.set_ch_off(value: utf8) -> none` | webkit_dom_html_table_row_element_set_ch_off |  | A #WebKitDOMHTMLTableRowElement |
| set_v_align | `DOMHTMLTableRowElement.set_v_align(value: utf8) -> none` | webkit_dom_html_table_row_element_set_v_align |  | A #WebKitDOMHTMLTableRowElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| align | utf8 | read, write |  |
| bg-color | utf8 | read, write |  |
| cells | DOMHTMLCollection | read |  |
| ch | utf8 | read, write |  |
| ch-off | utf8 | read, write |  |
| row-index | glong | read |  |
| section-row-index | glong | read |  |
| v-align | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLTableSectionElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLTableSectionElement` ?? C type: `WebKitDOMHTMLTableSectionElement`

A #WebKitDOMHTMLTableSectionElement

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| delete_row | `DOMHTMLTableSectionElement.delete_row(index: glong) -> none throws` | webkit_dom_html_table_section_element_delete_row |  | A #WebKitDOMHTMLTableSectionElement |
| get_align | `DOMHTMLTableSectionElement.get_align() -> utf8` | webkit_dom_html_table_section_element_get_align |  | A #gchar |
| get_ch | `DOMHTMLTableSectionElement.get_ch() -> utf8` | webkit_dom_html_table_section_element_get_ch |  | A #gchar |
| get_ch_off | `DOMHTMLTableSectionElement.get_ch_off() -> utf8` | webkit_dom_html_table_section_element_get_ch_off |  | A #gchar |
| get_rows | `DOMHTMLTableSectionElement.get_rows() -> DOMHTMLCollection` | webkit_dom_html_table_section_element_get_rows |  | A #WebKitDOMHTMLCollection |
| get_v_align | `DOMHTMLTableSectionElement.get_v_align() -> utf8` | webkit_dom_html_table_section_element_get_v_align |  | A #gchar |
| insert_row | `DOMHTMLTableSectionElement.insert_row(index: glong) -> DOMHTMLElement throws` | webkit_dom_html_table_section_element_insert_row |  | A #WebKitDOMHTMLElement |
| set_align | `DOMHTMLTableSectionElement.set_align(value: utf8) -> none` | webkit_dom_html_table_section_element_set_align |  | A #WebKitDOMHTMLTableSectionElement |
| set_ch | `DOMHTMLTableSectionElement.set_ch(value: utf8) -> none` | webkit_dom_html_table_section_element_set_ch |  | A #WebKitDOMHTMLTableSectionElement |
| set_ch_off | `DOMHTMLTableSectionElement.set_ch_off(value: utf8) -> none` | webkit_dom_html_table_section_element_set_ch_off |  | A #WebKitDOMHTMLTableSectionElement |
| set_v_align | `DOMHTMLTableSectionElement.set_v_align(value: utf8) -> none` | webkit_dom_html_table_section_element_set_v_align |  | A #WebKitDOMHTMLTableSectionElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| align | utf8 | read, write |  |
| ch | utf8 | read, write |  |
| ch-off | utf8 | read, write |  |
| rows | DOMHTMLCollection | read |  |
| v-align | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLTextAreaElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLTextAreaElement` ?? C type: `WebKitDOMHTMLTextAreaElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_area_type | `DOMHTMLTextAreaElement.get_area_type() -> utf8` | webkit_dom_html_text_area_element_get_area_type |  | A #gchar |
| get_autofocus | `DOMHTMLTextAreaElement.get_autofocus() -> gboolean` | webkit_dom_html_text_area_element_get_autofocus |  | A #gboolean |
| get_cols | `DOMHTMLTextAreaElement.get_cols() -> glong` | webkit_dom_html_text_area_element_get_cols |  | A #glong |
| get_default_value | `DOMHTMLTextAreaElement.get_default_value() -> utf8` | webkit_dom_html_text_area_element_get_default_value |  | A #gchar |
| get_disabled | `DOMHTMLTextAreaElement.get_disabled() -> gboolean` | webkit_dom_html_text_area_element_get_disabled |  | A #gboolean |
| get_form | `DOMHTMLTextAreaElement.get_form() -> DOMHTMLFormElement` | webkit_dom_html_text_area_element_get_form |  | A #WebKitDOMHTMLFormElement |
| get_name | `DOMHTMLTextAreaElement.get_name() -> utf8` | webkit_dom_html_text_area_element_get_name |  | A #gchar |
| get_read_only | `DOMHTMLTextAreaElement.get_read_only() -> gboolean` | webkit_dom_html_text_area_element_get_read_only |  | A #gboolean |
| get_rows | `DOMHTMLTextAreaElement.get_rows() -> glong` | webkit_dom_html_text_area_element_get_rows |  | A #glong |
| get_selection_end | `DOMHTMLTextAreaElement.get_selection_end() -> glong` | webkit_dom_html_text_area_element_get_selection_end |  | A #glong |
| get_selection_start | `DOMHTMLTextAreaElement.get_selection_start() -> glong` | webkit_dom_html_text_area_element_get_selection_start |  | A #glong |
| get_value | `DOMHTMLTextAreaElement.get_value() -> utf8` | webkit_dom_html_text_area_element_get_value |  | A #gchar |
| get_will_validate | `DOMHTMLTextAreaElement.get_will_validate() -> gboolean` | webkit_dom_html_text_area_element_get_will_validate |  | A #gboolean |
| is_edited | `DOMHTMLTextAreaElement.is_edited() -> gboolean` | webkit_dom_html_text_area_element_is_edited |  | A #gboolean |
| select | `DOMHTMLTextAreaElement.select() -> none` | webkit_dom_html_text_area_element_select |  | A #WebKitDOMHTMLTextAreaElement |
| set_autofocus | `DOMHTMLTextAreaElement.set_autofocus(value: gboolean) -> none` | webkit_dom_html_text_area_element_set_autofocus |  | A #WebKitDOMHTMLTextAreaElement |
| set_cols | `DOMHTMLTextAreaElement.set_cols(value: glong) -> none` | webkit_dom_html_text_area_element_set_cols |  | A #WebKitDOMHTMLTextAreaElement |
| set_default_value | `DOMHTMLTextAreaElement.set_default_value(value: utf8) -> none` | webkit_dom_html_text_area_element_set_default_value |  | A #WebKitDOMHTMLTextAreaElement |
| set_disabled | `DOMHTMLTextAreaElement.set_disabled(value: gboolean) -> none` | webkit_dom_html_text_area_element_set_disabled |  | A #WebKitDOMHTMLTextAreaElement |
| set_name | `DOMHTMLTextAreaElement.set_name(value: utf8) -> none` | webkit_dom_html_text_area_element_set_name |  | A #WebKitDOMHTMLTextAreaElement |
| set_read_only | `DOMHTMLTextAreaElement.set_read_only(value: gboolean) -> none` | webkit_dom_html_text_area_element_set_read_only |  | A #WebKitDOMHTMLTextAreaElement |
| set_rows | `DOMHTMLTextAreaElement.set_rows(value: glong) -> none` | webkit_dom_html_text_area_element_set_rows |  | A #WebKitDOMHTMLTextAreaElement |
| set_selection_end | `DOMHTMLTextAreaElement.set_selection_end(value: glong) -> none` | webkit_dom_html_text_area_element_set_selection_end |  | A #WebKitDOMHTMLTextAreaElement |
| set_selection_range | `DOMHTMLTextAreaElement.set_selection_range(start: glong, end: glong, direction: utf8) -> none` | webkit_dom_html_text_area_element_set_selection_range |  | A #WebKitDOMHTMLTextAreaElement |
| set_selection_start | `DOMHTMLTextAreaElement.set_selection_start(value: glong) -> none` | webkit_dom_html_text_area_element_set_selection_start |  | A #WebKitDOMHTMLTextAreaElement |
| set_value | `DOMHTMLTextAreaElement.set_value(value: utf8) -> none` | webkit_dom_html_text_area_element_set_value |  | A #WebKitDOMHTMLTextAreaElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| autofocus | gboolean | read, write |  |
| cols | glong | read, write |  |
| default-value | utf8 | read, write |  |
| disabled | gboolean | read, write |  |
| form | DOMHTMLFormElement | read |  |
| name | utf8 | read, write |  |
| read-only | gboolean | read, write |  |
| rows | glong | read, write |  |
| selection-end | glong | read, write |  |
| selection-start | glong | read, write |  |
| type | utf8 | read |  |
| value | utf8 | read, write |  |
| will-validate | gboolean | read |  |

### WebKit2WebExtension.DOMHTMLTitleElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLTitleElement` ?? C type: `WebKitDOMHTMLTitleElement`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_text | `DOMHTMLTitleElement.get_text() -> utf8` | webkit_dom_html_title_element_get_text |  | A #gchar |
| set_text | `DOMHTMLTitleElement.set_text(value: utf8) -> none` | webkit_dom_html_title_element_set_text |  | A #WebKitDOMHTMLTitleElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| text | utf8 | read, write |  |

### WebKit2WebExtension.DOMHTMLUListElement

Parent: `DOMHTMLElement` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMHTMLUListElement` ?? C type: `WebKitDOMHTMLUListElement`

A #gboolean

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMHTMLElement |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_compact | `DOMHTMLUListElement.get_compact() -> gboolean` | webkit_dom_html_u_list_element_get_compact |  | A #gboolean |
| get_type_attr | `DOMHTMLUListElement.get_type_attr() -> utf8` | webkit_dom_html_u_list_element_get_type_attr |  | A #gchar |
| set_compact | `DOMHTMLUListElement.set_compact(value: gboolean) -> none` | webkit_dom_html_u_list_element_set_compact |  | A #WebKitDOMHTMLUListElement |
| set_type_attr | `DOMHTMLUListElement.set_type_attr(value: utf8) -> none` | webkit_dom_html_u_list_element_set_type_attr |  | A #WebKitDOMHTMLUListElement |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| compact | gboolean | read, write |  |
| type | utf8 | read, write |  |

### WebKit2WebExtension.DOMKeyboardEvent

Parent: `DOMUIEvent` ?? GType: `WebKitDOMKeyboardEvent` ?? C type: `WebKitDOMKeyboardEvent`

A #gboolean

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMUIEvent |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_alt_graph_key | `DOMKeyboardEvent.get_alt_graph_key() -> gboolean` | webkit_dom_keyboard_event_get_alt_graph_key |  | A #gboolean |
| get_alt_key | `DOMKeyboardEvent.get_alt_key() -> gboolean` | webkit_dom_keyboard_event_get_alt_key |  | A #gboolean |
| get_ctrl_key | `DOMKeyboardEvent.get_ctrl_key() -> gboolean` | webkit_dom_keyboard_event_get_ctrl_key |  | A #gboolean |
| get_key_identifier | `DOMKeyboardEvent.get_key_identifier() -> utf8` | webkit_dom_keyboard_event_get_key_identifier |  | A #gchar |
| get_key_location | `DOMKeyboardEvent.get_key_location() -> gulong` | webkit_dom_keyboard_event_get_key_location |  | A #gulong |
| get_meta_key | `DOMKeyboardEvent.get_meta_key() -> gboolean` | webkit_dom_keyboard_event_get_meta_key |  | A #gboolean |
| get_modifier_state | `DOMKeyboardEvent.get_modifier_state(keyIdentifierArg: utf8) -> gboolean` | webkit_dom_keyboard_event_get_modifier_state |  | A #gboolean |
| get_shift_key | `DOMKeyboardEvent.get_shift_key() -> gboolean` | webkit_dom_keyboard_event_get_shift_key |  | A #gboolean |
| init_keyboard_event | `DOMKeyboardEvent.init_keyboard_event(type: utf8, canBubble: gboolean, cancelable: gboolean, view: DOMDOMWindow, keyIdentifier: utf8, location: gulong, ctrlKey: gboolean, altKey: gboolean, shiftKey: gboolean, metaKey: gboolean, altGraphKey: gboolean) -> none` | webkit_dom_keyboard_event_init_keyboard_event |  | A #WebKitDOMKeyboardEvent |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| alt-graph-key | gboolean | read |  |
| alt-key | gboolean | read |  |
| ctrl-key | gboolean | read |  |
| key-identifier | utf8 | read |  |
| key-location | gulong | read |  |
| meta-key | gboolean | read |  |
| shift-key | gboolean | read |  |

### WebKit2WebExtension.DOMMediaList

Parent: `DOMObject` ?? GType: `WebKitDOMMediaList` ?? C type: `WebKitDOMMediaList`

A #WebKitDOMMediaList

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_medium | `DOMMediaList.append_medium(newMedium: utf8) -> none throws` | webkit_dom_media_list_append_medium |  | A #WebKitDOMMediaList |
| delete_medium | `DOMMediaList.delete_medium(oldMedium: utf8) -> none throws` | webkit_dom_media_list_delete_medium |  | A #WebKitDOMMediaList |
| get_length | `DOMMediaList.get_length() -> gulong` | webkit_dom_media_list_get_length |  | A #gulong |
| get_media_text | `DOMMediaList.get_media_text() -> utf8` | webkit_dom_media_list_get_media_text |  | A #gchar |
| item | `DOMMediaList.item(index: gulong) -> utf8` | webkit_dom_media_list_item |  | A #gchar |
| set_media_text | `DOMMediaList.set_media_text(value: utf8) -> none throws` | webkit_dom_media_list_set_media_text |  | A #WebKitDOMMediaList |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| length | gulong | read |  |
| media-text | utf8 | read, write |  |

### WebKit2WebExtension.DOMMouseEvent

Parent: `DOMUIEvent` ?? Subclasses: `DOMWheelEvent` ?? GType: `WebKitDOMMouseEvent` ?? C type: `WebKitDOMMouseEvent`

A #gboolean

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMUIEvent |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_alt_key | `DOMMouseEvent.get_alt_key() -> gboolean` | webkit_dom_mouse_event_get_alt_key |  | A #gboolean |
| get_button | `DOMMouseEvent.get_button() -> gushort` | webkit_dom_mouse_event_get_button |  | A #gushort |
| get_client_x | `DOMMouseEvent.get_client_x() -> glong` | webkit_dom_mouse_event_get_client_x |  | A #glong |
| get_client_y | `DOMMouseEvent.get_client_y() -> glong` | webkit_dom_mouse_event_get_client_y |  | A #glong |
| get_ctrl_key | `DOMMouseEvent.get_ctrl_key() -> gboolean` | webkit_dom_mouse_event_get_ctrl_key |  | A #gboolean |
| get_from_element | `DOMMouseEvent.get_from_element() -> DOMNode` | webkit_dom_mouse_event_get_from_element |  | A #WebKitDOMNode |
| get_meta_key | `DOMMouseEvent.get_meta_key() -> gboolean` | webkit_dom_mouse_event_get_meta_key |  | A #gboolean |
| get_offset_x | `DOMMouseEvent.get_offset_x() -> glong` | webkit_dom_mouse_event_get_offset_x |  | A #glong |
| get_offset_y | `DOMMouseEvent.get_offset_y() -> glong` | webkit_dom_mouse_event_get_offset_y |  | A #glong |
| get_related_target | `DOMMouseEvent.get_related_target() -> DOMEventTarget` | webkit_dom_mouse_event_get_related_target |  | A #WebKitDOMEventTarget |
| get_screen_x | `DOMMouseEvent.get_screen_x() -> glong` | webkit_dom_mouse_event_get_screen_x |  | A #glong |
| get_screen_y | `DOMMouseEvent.get_screen_y() -> glong` | webkit_dom_mouse_event_get_screen_y |  | A #glong |
| get_shift_key | `DOMMouseEvent.get_shift_key() -> gboolean` | webkit_dom_mouse_event_get_shift_key |  | A #gboolean |
| get_to_element | `DOMMouseEvent.get_to_element() -> DOMNode` | webkit_dom_mouse_event_get_to_element |  | A #WebKitDOMNode |
| get_x | `DOMMouseEvent.get_x() -> glong` | webkit_dom_mouse_event_get_x |  | A #glong |
| get_y | `DOMMouseEvent.get_y() -> glong` | webkit_dom_mouse_event_get_y |  | A #glong |
| init_mouse_event | `DOMMouseEvent.init_mouse_event(type: utf8, canBubble: gboolean, cancelable: gboolean, view: DOMDOMWindow, detail: glong, screenX: glong, screenY: glong, clientX: glong, clientY: glong, ctrlKey: gboolean, altKey: gboolean, shiftKey: gboolean, metaKey: gboolean, button: gushort, relatedTarget: DOMEventTarget) -> none` | webkit_dom_mouse_event_init_mouse_event |  | A #WebKitDOMMouseEvent |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| alt-key | gboolean | read |  |
| button | guint | read |  |
| client-x | glong | read |  |
| client-y | glong | read |  |
| ctrl-key | gboolean | read |  |
| from-element | DOMNode | read |  |
| meta-key | gboolean | read |  |
| offset-x | glong | read |  |
| offset-y | glong | read |  |
| related-target | DOMEventTarget | read |  |
| screen-x | glong | read |  |
| screen-y | glong | read |  |
| shift-key | gboolean | read |  |
| to-element | DOMNode | read |  |
| x | glong | read |  |
| y | glong | read |  |

### WebKit2WebExtension.DOMNamedNodeMap

Parent: `DOMObject` ?? GType: `WebKitDOMNamedNodeMap` ?? C type: `WebKitDOMNamedNodeMap`

A #gulong

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_length | `DOMNamedNodeMap.get_length() -> gulong` | webkit_dom_named_node_map_get_length |  | A #gulong |
| get_named_item | `DOMNamedNodeMap.get_named_item(name: utf8) -> DOMNode` | webkit_dom_named_node_map_get_named_item |  | A #WebKitDOMNode |
| get_named_item_ns | `DOMNamedNodeMap.get_named_item_ns(namespaceURI: utf8, localName: utf8) -> DOMNode` | webkit_dom_named_node_map_get_named_item_ns |  | A #WebKitDOMNode |
| item | `DOMNamedNodeMap.item(index: gulong) -> DOMNode` | webkit_dom_named_node_map_item |  | A #WebKitDOMNode |
| remove_named_item | `DOMNamedNodeMap.remove_named_item(name: utf8) -> DOMNode throws` | webkit_dom_named_node_map_remove_named_item |  | A #WebKitDOMNode |
| remove_named_item_ns | `DOMNamedNodeMap.remove_named_item_ns(namespaceURI: utf8, localName: utf8) -> DOMNode throws` | webkit_dom_named_node_map_remove_named_item_ns |  | A #WebKitDOMNode |
| set_named_item | `DOMNamedNodeMap.set_named_item(node: DOMNode) -> DOMNode throws` | webkit_dom_named_node_map_set_named_item |  | A #WebKitDOMNode |
| set_named_item_ns | `DOMNamedNodeMap.set_named_item_ns(node: DOMNode) -> DOMNode throws` | webkit_dom_named_node_map_set_named_item_ns |  | A #WebKitDOMNode |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| length | gulong | read |  |

### WebKit2WebExtension.DOMNode

Parent: `DOMObject` ?? Subclasses: `DOMAttr`, `DOMCharacterData`, `DOMDocument`, `DOMDocumentFragment`, `DOMDocumentType`, `DOMElement`, `DOMEntityReference` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMNode` ?? C type: `WebKitDOMNode`

Get the #WebKitDOMNode for the DOM node referenced by @value.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| for_js_value | `for_js_value(value: JavaScriptCore.Value) -> DOMNode` | webkit_dom_node_for_js_value | 2.22 | Get the #WebKitDOMNode for the DOM node referenced by @value. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_child | `DOMNode.append_child(newChild: DOMNode) -> DOMNode throws` | webkit_dom_node_append_child |  | A #WebKitDOMNode |
| clone_node | `DOMNode.clone_node(deep: gboolean) -> DOMNode throws` | webkit_dom_node_clone_node |  | A #WebKitDOMNode |
| clone_node_with_error | `DOMNode.clone_node_with_error(deep: gboolean) -> DOMNode throws` | webkit_dom_node_clone_node_with_error | 2.14 | A #WebKitDOMNode |
| compare_document_position | `DOMNode.compare_document_position(other: DOMNode) -> gushort` | webkit_dom_node_compare_document_position |  | A #gushort |
| contains | `DOMNode.contains(other: DOMNode) -> gboolean` | webkit_dom_node_contains |  | A #gboolean |
| get_base_uri | `DOMNode.get_base_uri() -> utf8` | webkit_dom_node_get_base_uri |  | A #gchar |
| get_child_nodes | `DOMNode.get_child_nodes() -> DOMNodeList` | webkit_dom_node_get_child_nodes |  | A #WebKitDOMNodeList |
| get_first_child | `DOMNode.get_first_child() -> DOMNode` | webkit_dom_node_get_first_child |  | A #WebKitDOMNode |
| get_last_child | `DOMNode.get_last_child() -> DOMNode` | webkit_dom_node_get_last_child |  | A #WebKitDOMNode |
| get_local_name | `DOMNode.get_local_name() -> utf8` | webkit_dom_node_get_local_name |  | A #gchar |
| get_namespace_uri | `DOMNode.get_namespace_uri() -> utf8` | webkit_dom_node_get_namespace_uri |  | A #gchar |
| get_next_sibling | `DOMNode.get_next_sibling() -> DOMNode` | webkit_dom_node_get_next_sibling |  | A #WebKitDOMNode |
| get_node_name | `DOMNode.get_node_name() -> utf8` | webkit_dom_node_get_node_name |  | A #gchar |
| get_node_type | `DOMNode.get_node_type() -> gushort` | webkit_dom_node_get_node_type |  | A #gushort |
| get_node_value | `DOMNode.get_node_value() -> utf8` | webkit_dom_node_get_node_value |  | A #gchar |
| get_owner_document | `DOMNode.get_owner_document() -> DOMDocument` | webkit_dom_node_get_owner_document |  | A #WebKitDOMDocument |
| get_parent_element | `DOMNode.get_parent_element() -> DOMElement` | webkit_dom_node_get_parent_element |  | A #WebKitDOMElement |
| get_parent_node | `DOMNode.get_parent_node() -> DOMNode` | webkit_dom_node_get_parent_node |  | A #WebKitDOMNode |
| get_prefix | `DOMNode.get_prefix() -> utf8` | webkit_dom_node_get_prefix |  | A #gchar |
| get_previous_sibling | `DOMNode.get_previous_sibling() -> DOMNode` | webkit_dom_node_get_previous_sibling |  | A #WebKitDOMNode |
| get_text_content | `DOMNode.get_text_content() -> utf8` | webkit_dom_node_get_text_content |  | A #gchar |
| has_child_nodes | `DOMNode.has_child_nodes() -> gboolean` | webkit_dom_node_has_child_nodes |  | A #gboolean |
| insert_before | `DOMNode.insert_before(newChild: DOMNode, refChild: DOMNode?) -> DOMNode throws` | webkit_dom_node_insert_before |  | A #WebKitDOMNode |
| is_default_namespace | `DOMNode.is_default_namespace(namespaceURI: utf8) -> gboolean` | webkit_dom_node_is_default_namespace |  | A #gboolean |
| is_equal_node | `DOMNode.is_equal_node(other: DOMNode) -> gboolean` | webkit_dom_node_is_equal_node |  | A #gboolean |
| is_same_node | `DOMNode.is_same_node(other: DOMNode) -> gboolean` | webkit_dom_node_is_same_node |  | A #gboolean |
| is_supported | `DOMNode.is_supported(feature: utf8, version: utf8) -> gboolean` | webkit_dom_node_is_supported |  | A #gboolean |
| lookup_namespace_uri | `DOMNode.lookup_namespace_uri(prefix: utf8) -> utf8` | webkit_dom_node_lookup_namespace_uri |  | A #gchar |
| lookup_prefix | `DOMNode.lookup_prefix(namespaceURI: utf8) -> utf8` | webkit_dom_node_lookup_prefix |  | A #gchar |
| normalize | `DOMNode.normalize() -> none` | webkit_dom_node_normalize |  | A #WebKitDOMNode |
| remove_child | `DOMNode.remove_child(oldChild: DOMNode) -> DOMNode throws` | webkit_dom_node_remove_child |  | A #WebKitDOMNode |
| replace_child | `DOMNode.replace_child(newChild: DOMNode, oldChild: DOMNode) -> DOMNode throws` | webkit_dom_node_replace_child |  | A #WebKitDOMNode |
| set_node_value | `DOMNode.set_node_value(value: utf8) -> none throws` | webkit_dom_node_set_node_value |  | A #WebKitDOMNode |
| set_prefix | `DOMNode.set_prefix(value: utf8) -> none throws` | webkit_dom_node_set_prefix |  | A #WebKitDOMNode |
| set_text_content | `DOMNode.set_text_content(value: utf8) -> none throws` | webkit_dom_node_set_text_content |  | A #WebKitDOMNode |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| base-uri | utf8 | read |  |
| child-nodes | DOMNodeList | read |  |
| first-child | DOMNode | read |  |
| last-child | DOMNode | read |  |
| next-sibling | DOMNode | read |  |
| node-name | utf8 | read |  |
| node-type | guint | read |  |
| node-value | utf8 | read, write |  |
| owner-document | DOMDocument | read |  |
| parent-element | DOMElement | read |  |
| parent-node | DOMNode | read |  |
| previous-sibling | DOMNode | read |  |
| text-content | utf8 | read, write |  |

### WebKit2WebExtension.DOMNodeIterator

Parent: `DOMObject` ?? GType: `WebKitDOMNodeIterator` ?? C type: `WebKitDOMNodeIterator`

A #WebKitDOMNodeIterator

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| detach | `DOMNodeIterator.detach() -> none` | webkit_dom_node_iterator_detach |  | A #WebKitDOMNodeIterator |
| get_expand_entity_references | `DOMNodeIterator.get_expand_entity_references() -> gboolean` | webkit_dom_node_iterator_get_expand_entity_references |  | This function has been removed from the DOM spec and it just returns %FALSE. |
| get_filter | `DOMNodeIterator.get_filter() -> DOMNodeFilter` | webkit_dom_node_iterator_get_filter |  | A #WebKitDOMNodeFilter |
| get_pointer_before_reference_node | `DOMNodeIterator.get_pointer_before_reference_node() -> gboolean` | webkit_dom_node_iterator_get_pointer_before_reference_node |  | A #gboolean |
| get_reference_node | `DOMNodeIterator.get_reference_node() -> DOMNode` | webkit_dom_node_iterator_get_reference_node |  | A #WebKitDOMNode |
| get_root | `DOMNodeIterator.get_root() -> DOMNode` | webkit_dom_node_iterator_get_root |  | A #WebKitDOMNode |
| get_what_to_show | `DOMNodeIterator.get_what_to_show() -> gulong` | webkit_dom_node_iterator_get_what_to_show |  | A #gulong |
| next_node | `DOMNodeIterator.next_node() -> DOMNode throws` | webkit_dom_node_iterator_next_node |  | A #WebKitDOMNode |
| previous_node | `DOMNodeIterator.previous_node() -> DOMNode throws` | webkit_dom_node_iterator_previous_node |  | A #WebKitDOMNode |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| filter | DOMNodeFilter | read |  |
| pointer-before-reference-node | gboolean | read |  |
| reference-node | DOMNode | read |  |
| root | DOMNode | read |  |
| what-to-show | gulong | read |  |

### WebKit2WebExtension.DOMNodeList

Parent: `DOMObject` ?? GType: `WebKitDOMNodeList` ?? C type: `WebKitDOMNodeList`

A #gulong

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_length | `DOMNodeList.get_length() -> gulong` | webkit_dom_node_list_get_length |  | A #gulong |
| item | `DOMNodeList.item(index: gulong) -> DOMNode` | webkit_dom_node_list_item |  | A #WebKitDOMNode |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| length | gulong | read |  |

### WebKit2WebExtension.DOMObject

Parent: `GObject.Object` ?? Subclasses: `DOMBlob`, `DOMClientRect`, `DOMClientRectList`, `DOMCSSRule`, `DOMCSSRuleList`, `DOMCSSStyleDeclaration`, `DOMCSSValue`, `DOMDOMImplementation`, `DOMDOMSelection`, `DOMDOMTokenList`, `DOMDOMWindow`, `DOMEvent`, `DOMFileList`, `DOMHTMLCollection`, `DOMMediaList`, `DOMNamedNodeMap`, `DOMNode`, `DOMNodeIterator`, `DOMNodeList`, `DOMRange`, `DOMStyleSheet`, `DOMStyleSheetList`, `DOMTreeWalker`, `DOMXPathExpression`, `DOMXPathResult` ?? GType: `WebKitDOMObject` ?? C type: `WebKitDOMObject`

#### Fields

| Field | Type |
| --- | --- |
| coreObject | gpointer |
| parentInstance | GObject.Object |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| core-object | gpointer | write, construct-only |  |

### WebKit2WebExtension.DOMProcessingInstruction

Parent: `DOMCharacterData` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMProcessingInstruction` ?? C type: `WebKitDOMProcessingInstruction`

A #WebKitDOMStyleSheet

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMCharacterData |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_sheet | `DOMProcessingInstruction.get_sheet() -> DOMStyleSheet` | webkit_dom_processing_instruction_get_sheet |  | A #WebKitDOMStyleSheet |
| get_target | `DOMProcessingInstruction.get_target() -> utf8` | webkit_dom_processing_instruction_get_target |  | A #gchar |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| sheet | DOMStyleSheet | read |  |
| target | utf8 | read |  |

### WebKit2WebExtension.DOMRange

Parent: `DOMObject` ?? GType: `WebKitDOMRange` ?? C type: `WebKitDOMRange`

A #WebKitDOMDocumentFragment

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clone_contents | `DOMRange.clone_contents() -> DOMDocumentFragment throws` | webkit_dom_range_clone_contents |  | A #WebKitDOMDocumentFragment |
| clone_range | `DOMRange.clone_range() -> DOMRange throws` | webkit_dom_range_clone_range |  | A #WebKitDOMRange |
| collapse | `DOMRange.collapse(toStart: gboolean) -> none throws` | webkit_dom_range_collapse |  | A #WebKitDOMRange |
| compare_boundary_points | `DOMRange.compare_boundary_points(how: gushort, sourceRange: DOMRange) -> gshort throws` | webkit_dom_range_compare_boundary_points |  | A #gshort |
| compare_node | `DOMRange.compare_node(refNode: DOMNode) -> gshort throws` | webkit_dom_range_compare_node |  | A #gshort |
| compare_point | `DOMRange.compare_point(refNode: DOMNode, offset: glong) -> gshort throws` | webkit_dom_range_compare_point |  | A #gshort |
| create_contextual_fragment | `DOMRange.create_contextual_fragment(html: utf8) -> DOMDocumentFragment throws` | webkit_dom_range_create_contextual_fragment |  | A #WebKitDOMDocumentFragment |
| delete_contents | `DOMRange.delete_contents() -> none throws` | webkit_dom_range_delete_contents |  | A #WebKitDOMRange |
| detach | `DOMRange.detach() -> none throws` | webkit_dom_range_detach |  | A #WebKitDOMRange |
| expand | `DOMRange.expand(unit: utf8) -> none throws` | webkit_dom_range_expand | 2.16 | A #WebKitDOMRange |
| extract_contents | `DOMRange.extract_contents() -> DOMDocumentFragment throws` | webkit_dom_range_extract_contents |  | A #WebKitDOMDocumentFragment |
| get_collapsed | `DOMRange.get_collapsed() -> gboolean throws` | webkit_dom_range_get_collapsed |  | A #gboolean |
| get_common_ancestor_container | `DOMRange.get_common_ancestor_container() -> DOMNode throws` | webkit_dom_range_get_common_ancestor_container |  | A #WebKitDOMNode |
| get_end_container | `DOMRange.get_end_container() -> DOMNode throws` | webkit_dom_range_get_end_container |  | A #WebKitDOMNode |
| get_end_offset | `DOMRange.get_end_offset() -> glong throws` | webkit_dom_range_get_end_offset |  | A #glong |
| get_start_container | `DOMRange.get_start_container() -> DOMNode throws` | webkit_dom_range_get_start_container |  | A #WebKitDOMNode |
| get_start_offset | `DOMRange.get_start_offset() -> glong throws` | webkit_dom_range_get_start_offset |  | A #glong |
| get_text | `DOMRange.get_text() -> utf8` | webkit_dom_range_get_text |  | A #gchar |
| insert_node | `DOMRange.insert_node(newNode: DOMNode) -> none throws` | webkit_dom_range_insert_node |  | A #WebKitDOMRange |
| intersects_node | `DOMRange.intersects_node(refNode: DOMNode) -> gboolean throws` | webkit_dom_range_intersects_node |  | A #gboolean |
| is_point_in_range | `DOMRange.is_point_in_range(refNode: DOMNode, offset: glong) -> gboolean throws` | webkit_dom_range_is_point_in_range |  | A #gboolean |
| select_node | `DOMRange.select_node(refNode: DOMNode) -> none throws` | webkit_dom_range_select_node |  | A #WebKitDOMRange |
| select_node_contents | `DOMRange.select_node_contents(refNode: DOMNode) -> none throws` | webkit_dom_range_select_node_contents |  | A #WebKitDOMRange |
| set_end | `DOMRange.set_end(refNode: DOMNode, offset: glong) -> none throws` | webkit_dom_range_set_end |  | A #WebKitDOMRange |
| set_end_after | `DOMRange.set_end_after(refNode: DOMNode) -> none throws` | webkit_dom_range_set_end_after |  | A #WebKitDOMRange |
| set_end_before | `DOMRange.set_end_before(refNode: DOMNode) -> none throws` | webkit_dom_range_set_end_before |  | A #WebKitDOMRange |
| set_start | `DOMRange.set_start(refNode: DOMNode, offset: glong) -> none throws` | webkit_dom_range_set_start |  | A #WebKitDOMRange |
| set_start_after | `DOMRange.set_start_after(refNode: DOMNode) -> none throws` | webkit_dom_range_set_start_after |  | A #WebKitDOMRange |
| set_start_before | `DOMRange.set_start_before(refNode: DOMNode) -> none throws` | webkit_dom_range_set_start_before |  | A #WebKitDOMRange |
| surround_contents | `DOMRange.surround_contents(newParent: DOMNode) -> none throws` | webkit_dom_range_surround_contents |  | A #WebKitDOMRange |
| to_string | `DOMRange.to_string() -> utf8 throws` | webkit_dom_range_to_string |  | A #gchar |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| collapsed | gboolean | read |  |
| common-ancestor-container | DOMNode | read |  |
| end-container | DOMNode | read |  |
| end-offset | glong | read |  |
| start-container | DOMNode | read |  |
| start-offset | glong | read |  |
| text | utf8 | read |  |

### WebKit2WebExtension.DOMStyleSheet

Parent: `DOMObject` ?? Subclasses: `DOMCSSStyleSheet` ?? GType: `WebKitDOMStyleSheet` ?? C type: `WebKitDOMStyleSheet`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_content_type | `DOMStyleSheet.get_content_type() -> utf8` | webkit_dom_style_sheet_get_content_type |  | A #gchar |
| get_disabled | `DOMStyleSheet.get_disabled() -> gboolean` | webkit_dom_style_sheet_get_disabled |  | A #gboolean |
| get_href | `DOMStyleSheet.get_href() -> utf8` | webkit_dom_style_sheet_get_href |  | A #gchar |
| get_media | `DOMStyleSheet.get_media() -> DOMMediaList` | webkit_dom_style_sheet_get_media |  | A #WebKitDOMMediaList |
| get_owner_node | `DOMStyleSheet.get_owner_node() -> DOMNode` | webkit_dom_style_sheet_get_owner_node |  | A #WebKitDOMNode |
| get_parent_style_sheet | `DOMStyleSheet.get_parent_style_sheet() -> DOMStyleSheet` | webkit_dom_style_sheet_get_parent_style_sheet |  | A #WebKitDOMStyleSheet |
| get_title | `DOMStyleSheet.get_title() -> utf8` | webkit_dom_style_sheet_get_title |  | A #gchar |
| set_disabled | `DOMStyleSheet.set_disabled(value: gboolean) -> none` | webkit_dom_style_sheet_set_disabled |  | A #WebKitDOMStyleSheet |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| disabled | gboolean | read, write |  |
| href | utf8 | read |  |
| media | DOMMediaList | read |  |
| owner-node | DOMNode | read |  |
| parent-style-sheet | DOMStyleSheet | read |  |
| title | utf8 | read |  |
| type | utf8 | read |  |

### WebKit2WebExtension.DOMStyleSheetList

Parent: `DOMObject` ?? GType: `WebKitDOMStyleSheetList` ?? C type: `WebKitDOMStyleSheetList`

A #gulong

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_length | `DOMStyleSheetList.get_length() -> gulong` | webkit_dom_style_sheet_list_get_length |  | A #gulong |
| item | `DOMStyleSheetList.item(index: gulong) -> DOMStyleSheet` | webkit_dom_style_sheet_list_item |  | A #WebKitDOMStyleSheet |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| length | gulong | read |  |

### WebKit2WebExtension.DOMText

Parent: `DOMCharacterData` ?? Subclasses: `DOMCDATASection` ?? Implements: `DOMEventTarget` ?? GType: `WebKitDOMText` ?? C type: `WebKitDOMText`

A #gchar

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMCharacterData |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_whole_text | `DOMText.get_whole_text() -> utf8` | webkit_dom_text_get_whole_text |  | A #gchar |
| replace_whole_text | `DOMText.replace_whole_text(content: utf8) -> DOMText throws` | webkit_dom_text_replace_whole_text |  | A #WebKitDOMText |
| split_text | `DOMText.split_text(offset: gulong) -> DOMText throws` | webkit_dom_text_split_text |  | A #WebKitDOMText |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| whole-text | utf8 | read |  |

### WebKit2WebExtension.DOMTreeWalker

Parent: `DOMObject` ?? GType: `WebKitDOMTreeWalker` ?? C type: `WebKitDOMTreeWalker`

A #WebKitDOMNode

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| first_child | `DOMTreeWalker.first_child() -> DOMNode` | webkit_dom_tree_walker_first_child |  | A #WebKitDOMNode |
| get_current_node | `DOMTreeWalker.get_current_node() -> DOMNode` | webkit_dom_tree_walker_get_current_node |  | A #WebKitDOMNode |
| get_expand_entity_references | `DOMTreeWalker.get_expand_entity_references() -> gboolean` | webkit_dom_tree_walker_get_expand_entity_references |  | This function has been removed from the DOM spec and it just returns %FALSE. |
| get_filter | `DOMTreeWalker.get_filter() -> DOMNodeFilter` | webkit_dom_tree_walker_get_filter |  | A #WebKitDOMNodeFilter |
| get_root | `DOMTreeWalker.get_root() -> DOMNode` | webkit_dom_tree_walker_get_root |  | A #WebKitDOMNode |
| get_what_to_show | `DOMTreeWalker.get_what_to_show() -> gulong` | webkit_dom_tree_walker_get_what_to_show |  | A #gulong |
| last_child | `DOMTreeWalker.last_child() -> DOMNode` | webkit_dom_tree_walker_last_child |  | A #WebKitDOMNode |
| next_node | `DOMTreeWalker.next_node() -> DOMNode` | webkit_dom_tree_walker_next_node |  | A #WebKitDOMNode |
| next_sibling | `DOMTreeWalker.next_sibling() -> DOMNode` | webkit_dom_tree_walker_next_sibling |  | A #WebKitDOMNode |
| parent_node | `DOMTreeWalker.parent_node() -> DOMNode` | webkit_dom_tree_walker_parent_node |  | A #WebKitDOMNode |
| previous_node | `DOMTreeWalker.previous_node() -> DOMNode` | webkit_dom_tree_walker_previous_node |  | A #WebKitDOMNode |
| previous_sibling | `DOMTreeWalker.previous_sibling() -> DOMNode` | webkit_dom_tree_walker_previous_sibling |  | A #WebKitDOMNode |
| set_current_node | `DOMTreeWalker.set_current_node(value: DOMNode) -> none throws` | webkit_dom_tree_walker_set_current_node |  | A #WebKitDOMTreeWalker |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| current-node | DOMNode | read |  |
| filter | DOMNodeFilter | read |  |
| root | DOMNode | read |  |
| what-to-show | gulong | read |  |

### WebKit2WebExtension.DOMUIEvent

Parent: `DOMEvent` ?? Subclasses: `DOMKeyboardEvent`, `DOMMouseEvent` ?? GType: `WebKitDOMUIEvent` ?? C type: `WebKitDOMUIEvent`

A #glong

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMEvent |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_char_code | `DOMUIEvent.get_char_code() -> glong` | webkit_dom_ui_event_get_char_code |  | A #glong |
| get_detail | `DOMUIEvent.get_detail() -> glong` | webkit_dom_ui_event_get_detail |  | A #glong |
| get_key_code | `DOMUIEvent.get_key_code() -> glong` | webkit_dom_ui_event_get_key_code |  | A #glong |
| get_layer_x | `DOMUIEvent.get_layer_x() -> glong` | webkit_dom_ui_event_get_layer_x |  | A #glong |
| get_layer_y | `DOMUIEvent.get_layer_y() -> glong` | webkit_dom_ui_event_get_layer_y |  | A #glong |
| get_page_x | `DOMUIEvent.get_page_x() -> glong` | webkit_dom_ui_event_get_page_x |  | A #glong |
| get_page_y | `DOMUIEvent.get_page_y() -> glong` | webkit_dom_ui_event_get_page_y |  | A #glong |
| get_view | `DOMUIEvent.get_view() -> DOMDOMWindow` | webkit_dom_ui_event_get_view |  | A #WebKitDOMDOMWindow |
| init_ui_event | `DOMUIEvent.init_ui_event(type: utf8, canBubble: gboolean, cancelable: gboolean, view: DOMDOMWindow, detail: glong) -> none` | webkit_dom_ui_event_init_ui_event |  | A #WebKitDOMUIEvent |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| char-code | glong | read |  |
| detail | glong | read |  |
| key-code | glong | read |  |
| layer-x | glong | read |  |
| layer-y | glong | read |  |
| page-x | glong | read |  |
| page-y | glong | read |  |
| view | DOMDOMWindow | read |  |

### WebKit2WebExtension.DOMWheelEvent

Parent: `DOMMouseEvent` ?? GType: `WebKitDOMWheelEvent` ?? C type: `WebKitDOMWheelEvent`

A #glong

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMMouseEvent |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_wheel_delta | `DOMWheelEvent.get_wheel_delta() -> glong` | webkit_dom_wheel_event_get_wheel_delta |  | A #glong |
| get_wheel_delta_x | `DOMWheelEvent.get_wheel_delta_x() -> glong` | webkit_dom_wheel_event_get_wheel_delta_x |  | A #glong |
| get_wheel_delta_y | `DOMWheelEvent.get_wheel_delta_y() -> glong` | webkit_dom_wheel_event_get_wheel_delta_y |  | A #glong |
| init_wheel_event | `DOMWheelEvent.init_wheel_event(wheelDeltaX: glong, wheelDeltaY: glong, view: DOMDOMWindow, screenX: glong, screenY: glong, clientX: glong, clientY: glong, ctrlKey: gboolean, altKey: gboolean, shiftKey: gboolean, metaKey: gboolean) -> none` | webkit_dom_wheel_event_init_wheel_event |  | A #WebKitDOMWheelEvent |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| wheel-delta | glong | read |  |
| wheel-delta-x | glong | read |  |
| wheel-delta-y | glong | read |  |

### WebKit2WebExtension.DOMXPathExpression

Parent: `DOMObject` ?? GType: `WebKitDOMXPathExpression` ?? C type: `WebKitDOMXPathExpression`

A #WebKitDOMXPathResult

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| evaluate | `DOMXPathExpression.evaluate(contextNode: DOMNode, type: gushort, inResult: DOMXPathResult) -> DOMXPathResult throws` | webkit_dom_xpath_expression_evaluate |  | A #WebKitDOMXPathResult |

### WebKit2WebExtension.DOMXPathResult

Parent: `DOMObject` ?? GType: `WebKitDOMXPathResult` ?? C type: `WebKitDOMXPathResult`

A #gboolean

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | DOMObject |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_boolean_value | `DOMXPathResult.get_boolean_value() -> gboolean throws` | webkit_dom_xpath_result_get_boolean_value |  | A #gboolean |
| get_invalid_iterator_state | `DOMXPathResult.get_invalid_iterator_state() -> gboolean` | webkit_dom_xpath_result_get_invalid_iterator_state |  | A #gboolean |
| get_number_value | `DOMXPathResult.get_number_value() -> gdouble throws` | webkit_dom_xpath_result_get_number_value |  | A #gdouble |
| get_result_type | `DOMXPathResult.get_result_type() -> gushort` | webkit_dom_xpath_result_get_result_type |  | A #gushort |
| get_single_node_value | `DOMXPathResult.get_single_node_value() -> DOMNode throws` | webkit_dom_xpath_result_get_single_node_value |  | A #WebKitDOMNode |
| get_snapshot_length | `DOMXPathResult.get_snapshot_length() -> gulong throws` | webkit_dom_xpath_result_get_snapshot_length |  | A #gulong |
| get_string_value | `DOMXPathResult.get_string_value() -> utf8 throws` | webkit_dom_xpath_result_get_string_value |  | A #gchar |
| iterate_next | `DOMXPathResult.iterate_next() -> DOMNode throws` | webkit_dom_xpath_result_iterate_next |  | A #WebKitDOMNode |
| snapshot_item | `DOMXPathResult.snapshot_item(index: gulong) -> DOMNode throws` | webkit_dom_xpath_result_snapshot_item |  | A #WebKitDOMNode |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| boolean-value | gboolean | read |  |
| invalid-iterator-state | gboolean | read |  |
| number-value | gdouble | read |  |
| result-type | guint | read |  |
| single-node-value | DOMNode | read |  |
| snapshot-length | gulong | read |  |
| string-value | utf8 | read |  |

### WebKit2WebExtension.Frame

Parent: `GObject.Object` ?? GType: `WebKitFrame` ?? C type: `WebKitFrame`

A web page frame. Each `WebKitWebPage` has at least one main frame, and can have any number of subframes.

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | FramePrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_id | `Frame.get_id() -> guint64` | webkit_frame_get_id | 2.26 | Gets the process-unique identifier of this #WebKitFrame. No other frame in the same web process will have the same ID; however, frames in other web... |
| get_javascript_context_for_script_world | `Frame.get_javascript_context_for_script_world(world: ScriptWorld) -> JSGlobalContextRef` | webkit_frame_get_javascript_context_for_script_world | 2.2 | Gets the JavaScript execution context of @frame for the given #WebKitScriptWorld. |
| get_javascript_global_context | `Frame.get_javascript_global_context() -> JSGlobalContextRef` | webkit_frame_get_javascript_global_context | 2.2 | Gets the global JavaScript execution context. Use this function to bridge between the WebKit and JavaScriptCore APIs. |
| get_js_context | `Frame.get_js_context() -> JavaScriptCore.Context` | webkit_frame_get_js_context | 2.22 | Get the JavaScript execution context of @frame. Use this function to bridge between the WebKit and JavaScriptCore APIs. |
| get_js_context_for_script_world | `Frame.get_js_context_for_script_world(world: ScriptWorld) -> JavaScriptCore.Context` | webkit_frame_get_js_context_for_script_world | 2.22 | Get the JavaScript execution context of @frame for the given #WebKitScriptWorld. |
| get_js_value_for_dom_object | `Frame.get_js_value_for_dom_object(dom_object: DOMObject) -> JavaScriptCore.Value` | webkit_frame_get_js_value_for_dom_object | 2.22 | Get a #JSCValue referencing the given DOM object. The value is created in the JavaScript execution context of @frame. |
| get_js_value_for_dom_object_in_script_world | `Frame.get_js_value_for_dom_object_in_script_world(dom_object: DOMObject, world: ScriptWorld) -> JavaScriptCore.Value` | webkit_frame_get_js_value_for_dom_object_in_script_world | 2.22 | Get a #JSCValue referencing the given DOM object. The value is created in the JavaScript execution context of @frame for the given #WebKitScriptWorld. |
| get_uri | `Frame.get_uri() -> utf8` | webkit_frame_get_uri | 2.2 | Gets the current active URI of @frame. |
| is_main_frame | `Frame.is_main_frame() -> gboolean` | webkit_frame_is_main_frame | 2.2 | Gets whether @frame is the main frame of a #WebKitWebPage |

### WebKit2WebExtension.HitTestResult

Parent: `GObject.Object` ?? Subclasses: `WebHitTestResult` ?? GType: `WebKitHitTestResult` ?? C type: `WebKitHitTestResult`

Result of a Hit Test. A Hit Test is an operation to get context information about a given point in a #WebKitWebView. #WebKitHitTestResult represent...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | HitTestResultPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| context_is_editable | `HitTestResult.context_is_editable() -> gboolean` | webkit_hit_test_result_context_is_editable |  | Gets whether %WEBKIT_HIT_TEST_RESULT_CONTEXT_EDITABLE flag is present in #WebKitHitTestResult:context. |
| context_is_image | `HitTestResult.context_is_image() -> gboolean` | webkit_hit_test_result_context_is_image |  | Gets whether %WEBKIT_HIT_TEST_RESULT_CONTEXT_IMAGE flag is present in #WebKitHitTestResult:context. |
| context_is_link | `HitTestResult.context_is_link() -> gboolean` | webkit_hit_test_result_context_is_link |  | Gets whether %WEBKIT_HIT_TEST_RESULT_CONTEXT_LINK flag is present in #WebKitHitTestResult:context. |
| context_is_media | `HitTestResult.context_is_media() -> gboolean` | webkit_hit_test_result_context_is_media |  | Gets whether %WEBKIT_HIT_TEST_RESULT_CONTEXT_MEDIA flag is present in #WebKitHitTestResult:context. |
| context_is_scrollbar | `HitTestResult.context_is_scrollbar() -> gboolean` | webkit_hit_test_result_context_is_scrollbar |  | Gets whether %WEBKIT_HIT_TEST_RESULT_CONTEXT_SCROLLBAR flag is present in #WebKitHitTestResult:context. |
| context_is_selection | `HitTestResult.context_is_selection() -> gboolean` | webkit_hit_test_result_context_is_selection | 2.8 | Gets whether %WEBKIT_HIT_TEST_RESULT_CONTEXT_SELECTION flag is present in #WebKitHitTestResult:context. |
| get_context | `HitTestResult.get_context() -> guint` | webkit_hit_test_result_get_context |  | Gets the value of the #WebKitHitTestResult:context property. |
| get_image_uri | `HitTestResult.get_image_uri() -> utf8` | webkit_hit_test_result_get_image_uri |  | Gets the value of the #WebKitHitTestResult:image-uri property. |
| get_link_label | `HitTestResult.get_link_label() -> utf8` | webkit_hit_test_result_get_link_label |  | Gets the value of the #WebKitHitTestResult:link-label property. |
| get_link_title | `HitTestResult.get_link_title() -> utf8` | webkit_hit_test_result_get_link_title |  | Gets the value of the #WebKitHitTestResult:link-title property. |
| get_link_uri | `HitTestResult.get_link_uri() -> utf8` | webkit_hit_test_result_get_link_uri |  | Gets the value of the #WebKitHitTestResult:link-uri property. |
| get_media_uri | `HitTestResult.get_media_uri() -> utf8` | webkit_hit_test_result_get_media_uri |  | Gets the value of the #WebKitHitTestResult:media-uri property. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| context | guint | read, write, construct-only | Bitmask of #WebKitHitTestResultContext flags representing the context of the #WebKitHitTestResult. |
| image-uri | utf8 | read, write, construct-only | The URI of the image if flag %WEBKIT_HIT_TEST_RESULT_CONTEXT_IMAGE is present in #WebKitHitTestResult:context |
| link-label | utf8 | read, write, construct-only | The label of the link if flag %WEBKIT_HIT_TEST_RESULT_CONTEXT_LINK is present in #WebKitHitTestResult:context |
| link-title | utf8 | read, write, construct-only | The title of the link if flag %WEBKIT_HIT_TEST_RESULT_CONTEXT_LINK is present in #WebKitHitTestResult:context |
| link-uri | utf8 | read, write, construct-only | The URI of the link if flag %WEBKIT_HIT_TEST_RESULT_CONTEXT_LINK is present in #WebKitHitTestResult:context |
| media-uri | utf8 | read, write, construct-only | The URI of the media if flag %WEBKIT_HIT_TEST_RESULT_CONTEXT_MEDIA is present in #WebKitHitTestResult:context |

### WebKit2WebExtension.ScriptWorld

Parent: `GObject.Object` ?? GType: `WebKitScriptWorld` ?? C type: `WebKitScriptWorld`

Creates a new isolated #WebKitScriptWorld. Scripts executed in isolated worlds have access to the DOM but not to other variable or functions create...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | ScriptWorldPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ScriptWorld.new() -> ScriptWorld` | webkit_script_world_new | 2.2 | Creates a new isolated #WebKitScriptWorld. Scripts executed in isolated worlds have access to the DOM but not to other variable or functions create... |
| new_with_name | `ScriptWorld.new_with_name(name: utf8) -> ScriptWorld` | webkit_script_world_new_with_name | 2.22 | Creates a new isolated #WebKitScriptWorld with a name. Scripts executed in isolated worlds have access to the DOM but not to other variable or func... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default | `get_default() -> ScriptWorld` | webkit_script_world_get_default | 2.2 | Get the default #WebKitScriptWorld. This is the normal script world where all scripts are executed by default. You can get the JavaScript execution... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_name | `ScriptWorld.get_name() -> utf8` | webkit_script_world_get_name | 2.22 | Get the name of a #WebKitScriptWorld. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| window-object-cleared | `page: WebPage, frame: Frame` | none | last | 2.2 | Emitted when the JavaScript window object in a #WebKitScriptWorld has been cleared. This is the preferred place to set custom properties on the win... |

### WebKit2WebExtension.URIRequest

Parent: `GObject.Object` ?? GType: `WebKitURIRequest` ?? C type: `WebKitURIRequest`

Represents a URI request. A #WebKitURIRequest can be created with a URI using the webkit_uri_request_new() method, and you can get the URI of an ex...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | URIRequestPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `URIRequest.new(uri: utf8) -> URIRequest` | webkit_uri_request_new |  | Creates a new #WebKitURIRequest for the given URI. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_http_headers | `URIRequest.get_http_headers() -> Soup.MessageHeaders` | webkit_uri_request_get_http_headers |  | Get the HTTP headers of a #WebKitURIRequest as a #SoupMessageHeaders. |
| get_http_method | `URIRequest.get_http_method() -> utf8` | webkit_uri_request_get_http_method | 2.12 | Get the HTTP method of the #WebKitURIRequest. |
| get_uri | `URIRequest.get_uri() -> utf8` | webkit_uri_request_get_uri |  | Obtains the request URI. |
| set_uri | `URIRequest.set_uri(uri: utf8) -> none` | webkit_uri_request_set_uri |  | Set the URI of @request |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| uri | utf8 | read, write | The URI to which the request will be made. |

### WebKit2WebExtension.URIResponse

Parent: `GObject.Object` ?? GType: `WebKitURIResponse` ?? C type: `WebKitURIResponse`

Represents an URI response. A #WebKitURIResponse contains information such as the URI, the status code, the content length, the mime type, the HTTP...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | URIResponsePrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_content_length | `URIResponse.get_content_length() -> guint64` | webkit_uri_response_get_content_length |  | Get the expected content length of the #WebKitURIResponse. It can be 0 if the server provided an incorrect or missing Content-Length. |
| get_http_headers | `URIResponse.get_http_headers() -> Soup.MessageHeaders` | webkit_uri_response_get_http_headers | 2.6 | Get the HTTP headers of a #WebKitURIResponse as a #SoupMessageHeaders. |
| get_mime_type | `URIResponse.get_mime_type() -> utf8` | webkit_uri_response_get_mime_type |  | Gets the MIME type of the response. |
| get_status_code | `URIResponse.get_status_code() -> guint` | webkit_uri_response_get_status_code |  | Get the status code of the #WebKitURIResponse. Get the status code of the #WebKitURIResponse as returned by the server. It will normally be a #Soup... |
| get_suggested_filename | `URIResponse.get_suggested_filename() -> utf8` | webkit_uri_response_get_suggested_filename |  | Get the suggested filename for @response. Get the suggested filename for @response, as specified by the 'Content-Disposition' HTTP header, or %NULL... |
| get_uri | `URIResponse.get_uri() -> utf8` | webkit_uri_response_get_uri |  | Gets the URI which resulted in the response. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| content-length | guint64 | read | The expected content length of the response. |
| http-headers | Soup.MessageHeaders | read | The HTTP headers of the response, or %NULL if the response is not an HTTP response. |
| mime-type | utf8 | read | The MIME type of the response. |
| status-code | guint | read | The status code of the response as returned by the server. |
| suggested-filename | utf8 | read | The suggested filename for the URI response. |
| uri | utf8 | read | The URI for which the response was made. |

### WebKit2WebExtension.UserMessage

Parent: `GObject.InitiallyUnowned` ?? GType: `WebKitUserMessage` ?? C type: `WebKitUserMessage`

Message that can be sent between the UI process and web process extensions. A WebKitUserMessage is a message that can be used for the communication...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.InitiallyUnowned |
| priv | UserMessagePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `UserMessage.new(name: utf8, parameters: GLib.Variant?) -> UserMessage` | webkit_user_message_new | 2.28 | Create a new #WebKitUserMessage with @name. |
| new_with_fd_list | `UserMessage.new_with_fd_list(name: utf8, parameters: GLib.Variant?, fd_list: Gio.UnixFDList?) -> UserMessage` | webkit_user_message_new_with_fd_list | 2.28 | Create a new #WebKitUserMessage including also a list of UNIX file descriptors to be sent. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| error_quark | `error_quark() -> GLib.Quark` | webkit_user_message_error_quark |  | Gets the quark for the domain of user message errors. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_fd_list | `UserMessage.get_fd_list() -> Gio.UnixFDList` | webkit_user_message_get_fd_list | 2.28 | Get the @message list of file descritpor. |
| get_name | `UserMessage.get_name() -> utf8` | webkit_user_message_get_name | 2.28 | Get the @message name. |
| get_parameters | `UserMessage.get_parameters() -> GLib.Variant` | webkit_user_message_get_parameters | 2.28 | Get the @message parameters. |
| send_reply | `UserMessage.send_reply(reply: UserMessage) -> none` | webkit_user_message_send_reply | 2.28 | Send a reply to an user message. If @reply is floating, it's consumed. You can only send a reply to a #WebKitUserMessage that has been received. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| fd-list | Gio.UnixFDList | read, write, construct-only | The UNIX file descriptors of the user message. |
| name | utf8 | read, write, construct-only | The name of the user message. |
| parameters | GLib.Variant | read, write, construct-only | The parameters of the user message as a #GVariant, or %NULL if the message doesn't include parameters. Note that only complete types are allowed. |

### WebKit2WebExtension.WebEditor

Parent: `GObject.Object` ?? GType: `WebKitWebEditor` ?? C type: `WebKitWebEditor`

Access to editing capabilities of a #WebKitWebPage. The WebKitWebEditor provides access to various editing capabilities of a #WebKitWebPage such as...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | WebEditorPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_page | `WebEditor.get_page() -> WebPage` | webkit_web_editor_get_page | 2.10 | Gets the #WebKitWebPage that is associated with the #WebKitWebEditor. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| selection-changed | `` | none | last | 2.10 | This signal is emitted for every selection change inside a #WebKitWebPage as well as for every caret position change as the caret is a collapsed se... |

### WebKit2WebExtension.WebExtension

Parent: `GObject.Object` ?? GType: `WebKitWebExtension` ?? C type: `WebKitWebExtension`

Represents an extension of the WebProcess. WebKitWebExtension is a loadable module for the WebProcess. It allows you to execute code in the WebProc...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | WebExtensionPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_page | `WebExtension.get_page(page_id: guint64) -> WebPage` | webkit_web_extension_get_page |  | Get the web page of the given @page_id. |
| send_message_to_context | `WebExtension.send_message_to_context(message: UserMessage, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_web_extension_send_message_to_context | 2.28 | Send @message to the #WebKitWebContext corresponding to @extension. If @message is floating, it's consumed. If you don't expect any reply, or you s... |
| send_message_to_context_finish | `WebExtension.send_message_to_context_finish(result: Gio.AsyncResult) -> UserMessage throws` | webkit_web_extension_send_message_to_context_finish | 2.28 | Finish an asynchronous operation started with webkit_web_extension_send_message_to_context(). |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| page-created | `web_page: WebPage` | none | last |  | This signal is emitted when a new #WebKitWebPage is created in the Web Process. |
| user-message-received | `message: UserMessage` | none | last | 2.28 | This signal is emitted when a #WebKitUserMessage is received from the #WebKitWebContext corresponding to @extension. Messages sent by #WebKitWebCon... |

### WebKit2WebExtension.WebFormManager

Parent: `GObject.Object` ?? GType: `WebKitWebFormManager` ?? C type: `WebKitWebFormManager`

Form manager of a #WebKitWebPage in a #WebKitScriptWorld

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| input_element_auto_fill | `input_element_auto_fill(element: JavaScriptCore.Value, value: utf8) -> none` | webkit_web_form_manager_input_element_auto_fill | 2.40 | Set the value of an HTML input element as if it had been edited by the user, triggering a change event, and set it as filled automatically. If @ele... |
| input_element_is_auto_filled | `input_element_is_auto_filled(element: JavaScriptCore.Value) -> gboolean` | webkit_web_form_manager_input_element_is_auto_filled | 2.40 | Get whether @element is an HTML input element that has been filled automatically. |
| input_element_is_user_edited | `input_element_is_user_edited(element: JavaScriptCore.Value) -> gboolean` | webkit_web_form_manager_input_element_is_user_edited | 2.40 | Get whether @element is an HTML text input element that has been edited by a user action. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| form-controls-associated | `frame: Frame, elements: JavaScriptCore.Value` | none | last | 2.40 | Emitted after form elements (or form associated elements) are associated to @frame. This is useful to implement form auto filling for web pages whe... |
| will-send-submit-event | `form: JavaScriptCore.Value, source_frame: Frame, target_frame: Frame` | none | last | 2.40 | This signal is emitted when the DOM submit event is about to be fired for @form. JavaScript code may rely on the submit event to detect that the us... |
| will-submit-form | `form: JavaScriptCore.Value, source_frame: Frame, target_frame: Frame` | none | last | 2.40 | This signal is emitted when @form will imminently be submitted. It can no longer be cancelled. This event always occurs immediately before a form i... |

### WebKit2WebExtension.WebHitTestResult

Parent: `HitTestResult` ?? GType: `WebKitWebHitTestResult` ?? C type: `WebKitWebHitTestResult`

Result of a Hit Test (Web Process Extensions). WebKitWebHitTestResult extends #WebKitHitTestResult to provide information about the #WebKitDOMNode ...

#### Fields

| Field | Type |
| --- | --- |
| parent | HitTestResult |
| priv | WebHitTestResultPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_js_node | `WebHitTestResult.get_js_node(world: ScriptWorld?) -> JavaScriptCore.Value` | webkit_web_hit_test_result_get_js_node | 2.40 | Get the #JSCValue for the DOM node in @world at the coordinates of the Hit Test. |
| get_node | `WebHitTestResult.get_node() -> DOMNode` | webkit_web_hit_test_result_get_node | 2.8 | Get the #WebKitDOMNode in the coordinates of the Hit Test. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| node | DOMNode | read, write, construct-only | The #WebKitDOMNode |

### WebKit2WebExtension.WebPage

Parent: `GObject.Object` ?? GType: `WebKitWebPage` ?? C type: `WebKitWebPage`

A loaded web page.

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | WebPagePrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_dom_document | `WebPage.get_dom_document() -> DOMDocument` | webkit_web_page_get_dom_document |  | Get the #WebKitDOMDocument currently loaded in @web_page |
| get_editor | `WebPage.get_editor() -> WebEditor` | webkit_web_page_get_editor | 2.10 | Gets the #WebKitWebEditor of a #WebKitWebPage. |
| get_form_manager | `WebPage.get_form_manager(world: ScriptWorld?) -> WebFormManager` | webkit_web_page_get_form_manager | 2.40 | Get the #WebKitWebFormManager of @web_page in @world. |
| get_id | `WebPage.get_id() -> guint64` | webkit_web_page_get_id |  | Get the identifier of the #WebKitWebPage |
| get_main_frame | `WebPage.get_main_frame() -> Frame` | webkit_web_page_get_main_frame | 2.2 | Returns the main frame of a #WebKitWebPage. |
| get_uri | `WebPage.get_uri() -> utf8` | webkit_web_page_get_uri |  | Returns the current active URI of @web_page. You can monitor the active URI by connecting to the notify::uri signal of @web_page. |
| send_message_to_view | `WebPage.send_message_to_view(message: UserMessage, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_web_page_send_message_to_view | 2.28 | Send @message to the #WebKitWebView corresponding to @web_page. If @message is floating, it's consumed. If you don't expect any reply, or you simpl... |
| send_message_to_view_finish | `WebPage.send_message_to_view_finish(result: Gio.AsyncResult) -> UserMessage throws` | webkit_web_page_send_message_to_view_finish | 2.28 | Finish an asynchronous operation started with webkit_web_page_send_message_to_view(). |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| uri | utf8 | read | The current active URI of the #WebKitWebPage. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| console-message-sent | `console_message: ConsoleMessage` | none | last | 2.12 | Emitted when a message is sent to the console. This can be a message produced by the use of JavaScript console API, a JavaScript exception, a secur... |
| context-menu | `context_menu: ContextMenu, hit_test_result: WebHitTestResult` | gboolean | last | 2.8 | Emitted before a context menu is displayed in the UI Process to give the application a chance to customize the proposed menu, build its own context... |
| document-loaded | `` | none | last |  | This signal is emitted when the DOM document of a #WebKitWebPage has been loaded. You can wait for this signal to get the DOM document |
| form-controls-associated | `elements: DOMElement` | none | last | 2.16 | Emitted after form elements (or form associated elements) are associated to a particular web page. This is useful to implement form auto filling fo... |
| form-controls-associated-for-frame | `elements: DOMElement, frame: Frame` | none | last | 2.26 | Emitted after form elements (or form associated elements) are associated to a particular web page. This is useful to implement form auto filling fo... |
| send-request | `request: URIRequest, redirected_response: URIResponse` | gboolean | last |  | This signal is emitted when @request is about to be sent to the server. This signal can be used to modify the #WebKitURIRequest that will be sent t... |
| user-message-received | `message: UserMessage` | gboolean | last | 2.28 | This signal is emitted when a #WebKitUserMessage is received from the #WebKitWebView corresponding to @web_page. You can reply to the message using... |
| will-submit-form | `form: DOMElement, step: FormSubmissionStep, source_frame: Frame, target_frame: Frame, text_field_names: utf8, text_field_values: utf8` | none | last | 2.20 | This signal is emitted to indicate various points during form submission. @step indicates the current stage of form submission. If this signal is e... |

## Interfaces

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| DOMEventTarget |  | 0 | 0 | 5 | a #gboolean |
| DOMNodeFilter |  | 0 | 0 | 1 | a #gshort |
| DOMXPathNSResolver |  | 0 | 0 | 1 | a #gchar |

### WebKit2WebExtension.DOMEventTarget

GType: `WebKitDOMEventTarget` ?? C type: `WebKitDOMEventTarget`

a #gboolean

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_event_listener | `DOMEventTarget.add_event_listener(event_name: utf8, handler: GObject.Callback, use_capture: gboolean, user_data: gpointer?) -> gboolean` | webkit_dom_event_target_add_event_listener |  | a #gboolean |
| add_event_listener_with_closure | `DOMEventTarget.add_event_listener_with_closure(event_name: utf8, handler: GObject.Closure, use_capture: gboolean) -> gboolean` | webkit_dom_event_target_add_event_listener_with_closure |  | Version of webkit_dom_event_target_add_event_listener() using a closure instead of a callbacks for easier binding in other languages. |
| dispatch_event | `DOMEventTarget.dispatch_event(event: DOMEvent) -> gboolean throws` | webkit_dom_event_target_dispatch_event |  | a #gboolean |
| remove_event_listener | `DOMEventTarget.remove_event_listener(event_name: utf8, handler: gpointer?, use_capture: gboolean) -> gboolean` | webkit_dom_event_target_remove_event_listener |  | a #gboolean |
| remove_event_listener_with_closure | `DOMEventTarget.remove_event_listener_with_closure(event_name: utf8, handler: GObject.Closure, use_capture: gboolean) -> gboolean` | webkit_dom_event_target_remove_event_listener_with_closure |  | Version of webkit_dom_event_target_remove_event_listener() using a closure instead of a callbacks for easier binding in other languages. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_event_listener | `add_event_listener(event_name: utf8, handler: GObject.Closure, use_capture: gboolean) -> gboolean` |  |  |  |
| dispatch_event | `dispatch_event(event: DOMEvent) -> gboolean throws` |  |  | a #gboolean |
| remove_event_listener | `remove_event_listener(event_name: utf8, handler: gpointer?, use_capture: gboolean) -> gboolean` |  |  | a #gboolean |

### WebKit2WebExtension.DOMNodeFilter

GType: `WebKitDOMNodeFilter` ?? C type: `WebKitDOMNodeFilter`

a #gshort

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| accept_node | `DOMNodeFilter.accept_node(node: DOMNode) -> gshort` | webkit_dom_node_filter_accept_node |  | a #gshort |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| accept_node | `accept_node(node: DOMNode) -> gshort` |  |  | a #gshort |

### WebKit2WebExtension.DOMXPathNSResolver

GType: `WebKitDOMXPathNSResolver` ?? C type: `WebKitDOMXPathNSResolver`

a #gchar

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| lookup_namespace_uri | `DOMXPathNSResolver.lookup_namespace_uri(prefix: utf8) -> utf8` | webkit_dom_xpath_ns_resolver_lookup_namespace_uri |  | a #gchar |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| lookup_namespace_uri | `lookup_namespace_uri(prefix: utf8) -> utf8` |  |  | a #gchar |

## Enums

### WebKit2WebExtension.ConsoleMessageLevel

GType: `WebKitConsoleMessageLevel` ?? C type: `WebKitConsoleMessageLevel`

Enum values used to denote the various levels of console messages.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| debug | 4 | debug | Debug message. |
| error | 3 | error | Error message. |
| info | 0 | info | Information message. |
| log | 1 | log | Log message. |
| warning | 2 | warning | Warning message. |

### WebKit2WebExtension.ConsoleMessageSource

GType: `WebKitConsoleMessageSource` ?? C type: `WebKitConsoleMessageSource`

Enum values used to denote the various sources of console messages.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| console_api | 2 | console-api | Messages produced by console API. |
| javascript | 0 | javascript | Message produced by JavaScript. |
| network | 1 | network | Network messages. |
| other | 4 | other | Other messages. |
| security | 3 | security | Security messages. |

### WebKit2WebExtension.ContextMenuAction

C type: `WebKitContextMenuAction`

Enum values used to denote the stock actions for #WebKitContextMenuItem<!-- -->s

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bold | 27 |  | Bold. |
| copy | 14 |  | Copy current selection the clipboard. |
| copy_audio_link_to_clipboard | 35 |  | Copy audio link location in to the clipboard. |
| copy_image_to_clipboard | 7 |  | Copy current image to the clipboard. |
| copy_image_url_to_clipboard | 8 |  | Copy current image location to the clipboard. |
| copy_link_to_clipboard | 4 |  | Copy link location to the clipboard. |
| copy_video_link_to_clipboard | 34 |  | Copy video link location in to the clipboard. |
| custom | 10000 |  | Custom action defined by applications. |
| cut | 15 |  | Cut current selection to the clipboard. |
| delete | 17 |  | Delete current selection. |
| download_audio_to_disk | 43 |  | Download audio to disk. Since 2.2 |
| download_image_to_disk | 6 |  | Download current image. |
| download_link_to_disk | 3 |  | Download link destination. |
| download_video_to_disk | 42 |  | Download video to disk. Since 2.2 |
| enter_video_fullscreen | 38 |  | Show current video element in fullscreen mode. |
| font_menu | 26 |  | Font options menu. |
| go_back | 10 |  | Load the previous history item. |
| go_forward | 11 |  | Load the next history item. |
| ignore_grammar | 25 |  | Ignore grammar. |
| ignore_spelling | 23 |  | Causes the spellchecker to ignore the word for this session. |
| input_methods | 19 |  | Input methods menu. |
| insert_emoji | 44 |  | Insert an emoji. Since 2.26 |
| inspect_element | 31 |  | Open current element in the inspector. |
| italic | 28 |  | Italic. |
| learn_spelling | 24 |  | Causes the spellchecker to add the word to the dictionary. |
| media_mute | 41 |  | Mute current media element. |
| media_pause | 40 |  | Pause current media element. |
| media_play | 39 |  | Play current media element. |
| no_action | 0 |  | No action, used by separator menu items. |
| no_guesses_found | 22 |  | An indicator that spellchecking found no proposed replacements. |
| open_audio_in_new_window | 33 |  | Open current audio element in a new window. |
| open_frame_in_new_window | 9 |  | Open current frame in a new window. |
| open_image_in_new_window | 5 |  | Open current image in a new window. |
| open_link | 1 |  | Open current link. |
| open_link_in_new_window | 2 |  | Open current link in a new window. |
| open_video_in_new_window | 32 |  | Open current video element in a new window. |
| outline | 30 |  | Outline. |
| paste | 16 |  | Paste clipboard contents. |
| paste_as_plain_text | 45 |  | Paste clipboard contents as plain text. Since 2.30 |
| reload | 13 |  | Reload the contents of current view. |
| select_all | 18 |  | Select all text. |
| spelling_guess | 21 |  | A proposed replacement for a misspelled word. |
| stop | 12 |  | Stop any ongoing loading operation. |
| toggle_media_controls | 36 |  | Enable or disable media controls. |
| toggle_media_loop | 37 |  | Enable or disable media loop. |
| underline | 29 |  | Underline. |
| unicode | 20 |  | Unicode menu. |

### WebKit2WebExtension.FormSubmissionStep

GType: `WebKitFormSubmissionStep` ?? C type: `WebKitFormSubmissionStep`

Used to indicate a particular stage in form submission. See #WebKitWebPage::will-submit-form.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| complete | 1 | complete | indicates the form is about to be submitted. |
| send_dom_event | 0 | send-dom-event | indicates the form's DOM submit event is about to be emitted. |

### WebKit2WebExtension.UserMessageError

C type: `WebKitUserMessageError`

Enum values used to denote errors happening when sending user messages.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| user_message_unhandled_message | 0 |  | The message was not handled by the receiver. |

## Flags

### WebKit2WebExtension.HitTestResultContext

C type: `WebKitHitTestResultContext`

Enum values with flags representing the context of a #WebKitHitTestResult.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| document | 2 |  | anywhere in the document. |
| editable | 32 |  | an editable element |
| image | 8 |  | an image element. |
| link | 4 |  | a hyperlink element. |
| media | 16 |  | a video or audio element. |
| scrollbar | 64 |  | a scrollbar element. |
| selection | 128 |  | a selected element. Since 2.8 |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| ConsoleMessage |  | 0 | 0 | 7 | Make a copy of @console_message. |
| ContextMenuClass |  | 0 | 0 | 0 |  |
| ContextMenuItemClass |  | 0 | 0 | 0 |  |
| ContextMenuItemPrivate |  | 0 | 0 | 0 |  |
| ContextMenuPrivate |  | 0 | 0 | 0 |  |
| DOMAttrClass |  | 0 | 0 | 0 |  |
| DOMBlobClass |  | 0 | 0 | 0 |  |
| DOMCDATASectionClass |  | 0 | 0 | 0 |  |
| DOMCharacterDataClass |  | 0 | 0 | 0 |  |
| DOMClientRectClass |  | 0 | 0 | 0 |  |
| DOMClientRectListClass |  | 0 | 0 | 0 |  |
| DOMCommentClass |  | 0 | 0 | 0 |  |
| DOMCSSRuleClass |  | 0 | 0 | 0 |  |
| DOMCSSRuleListClass |  | 0 | 0 | 0 |  |
| DOMCSSStyleDeclarationClass |  | 0 | 0 | 0 |  |
| DOMCSSStyleSheetClass |  | 0 | 0 | 0 |  |
| DOMCSSValueClass |  | 0 | 0 | 0 |  |
| DOMDocumentClass |  | 0 | 0 | 0 |  |
| DOMDocumentFragmentClass |  | 0 | 0 | 0 |  |
| DOMDocumentTypeClass |  | 0 | 0 | 0 |  |
| DOMDOMImplementationClass |  | 0 | 0 | 0 |  |
| DOMDOMSelectionClass |  | 0 | 0 | 0 |  |
| DOMDOMTokenListClass |  | 0 | 0 | 0 |  |
| DOMDOMWindowClass |  | 0 | 0 | 0 |  |
| DOMElementClass |  | 0 | 0 | 0 |  |
| DOMEntityReferenceClass |  | 0 | 0 | 0 |  |
| DOMEventClass |  | 0 | 0 | 0 |  |
| DOMEventTargetIface |  | 0 | 0 | 0 | a #gboolean |
| DOMFileClass |  | 0 | 0 | 0 |  |
| DOMFileListClass |  | 0 | 0 | 0 |  |
| DOMHTMLAnchorElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLAppletElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLAreaElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLBaseElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLBaseFontElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLBodyElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLBRElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLButtonElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLCanvasElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLCollectionClass |  | 0 | 0 | 0 |  |
| DOMHTMLDirectoryElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLDivElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLDListElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLDocumentClass |  | 0 | 0 | 0 |  |
| DOMHTMLElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLEmbedElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLFieldSetElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLFontElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLFormElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLFrameElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLFrameSetElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLHeadElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLHeadingElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLHRElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLHtmlElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLIFrameElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLImageElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLInputElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLLabelElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLLegendElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLLIElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLLinkElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLMapElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLMarqueeElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLMenuElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLMetaElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLModElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLObjectElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLOListElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLOptGroupElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLOptionElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLOptionsCollectionClass |  | 0 | 0 | 0 |  |
| DOMHTMLParagraphElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLParamElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLPreElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLQuoteElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLScriptElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLSelectElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLStyleElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLTableCaptionElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLTableCellElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLTableColElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLTableElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLTableRowElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLTableSectionElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLTextAreaElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLTitleElementClass |  | 0 | 0 | 0 |  |
| DOMHTMLUListElementClass |  | 0 | 0 | 0 |  |
| DOMKeyboardEventClass |  | 0 | 0 | 0 |  |
| DOMMediaListClass |  | 0 | 0 | 0 |  |
| DOMMouseEventClass |  | 0 | 0 | 0 |  |
| DOMNamedNodeMapClass |  | 0 | 0 | 0 |  |
| DOMNodeClass |  | 0 | 0 | 0 |  |
| DOMNodeFilterIface |  | 0 | 0 | 0 | a #gshort |
| DOMNodeIteratorClass |  | 0 | 0 | 0 |  |
| DOMNodeListClass |  | 0 | 0 | 0 |  |
| DOMObjectClass |  | 0 | 0 | 0 |  |
| DOMProcessingInstructionClass |  | 0 | 0 | 0 |  |
| DOMRangeClass |  | 0 | 0 | 0 |  |
| DOMStyleSheetClass |  | 0 | 0 | 0 |  |
| DOMStyleSheetListClass |  | 0 | 0 | 0 |  |
| DOMTextClass |  | 0 | 0 | 0 |  |
| DOMTreeWalkerClass |  | 0 | 0 | 0 |  |
| DOMUIEventClass |  | 0 | 0 | 0 |  |
| DOMWheelEventClass |  | 0 | 0 | 0 |  |
| DOMXPathExpressionClass |  | 0 | 0 | 0 |  |
| DOMXPathNSResolverIface |  | 0 | 0 | 0 | a #gchar |
| DOMXPathResultClass |  | 0 | 0 | 0 |  |
| FrameClass |  | 0 | 0 | 0 |  |
| FramePrivate |  | 0 | 0 | 0 |  |
| HitTestResultClass |  | 0 | 0 | 0 |  |
| HitTestResultPrivate |  | 0 | 0 | 0 |  |
| ScriptWorldClass |  | 0 | 0 | 0 |  |
| ScriptWorldPrivate |  | 0 | 0 | 0 |  |
| URIRequestClass |  | 0 | 0 | 0 |  |
| URIRequestPrivate |  | 0 | 0 | 0 |  |
| URIResponseClass |  | 0 | 0 | 0 |  |
| URIResponsePrivate |  | 0 | 0 | 0 |  |
| UserMessageClass |  | 0 | 0 | 0 |  |
| UserMessagePrivate |  | 0 | 0 | 0 |  |
| WebEditorClass |  | 0 | 0 | 0 |  |
| WebEditorPrivate |  | 0 | 0 | 0 |  |
| WebExtensionClass |  | 0 | 0 | 0 |  |
| WebExtensionPrivate |  | 0 | 0 | 0 |  |
| WebFormManagerClass |  | 0 | 0 | 0 |  |
| WebHitTestResultClass |  | 0 | 0 | 0 |  |
| WebHitTestResultPrivate |  | 0 | 0 | 0 |  |
| WebPageClass |  | 0 | 0 | 0 |  |
| WebPagePrivate |  | 0 | 0 | 0 |  |

### WebKit2WebExtension.ConsoleMessage

GType: `WebKitConsoleMessage` ?? C type: `WebKitConsoleMessage`

Make a copy of @console_message.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `ConsoleMessage.copy() -> ConsoleMessage` | webkit_console_message_copy | 2.12 | Make a copy of @console_message. |
| free | `ConsoleMessage.free() -> none` | webkit_console_message_free | 2.12 | Free the #WebKitConsoleMessage |
| get_level | `ConsoleMessage.get_level() -> ConsoleMessageLevel` | webkit_console_message_get_level | 2.12 | Gets the log level of a #WebKitConsoleMessage |
| get_line | `ConsoleMessage.get_line() -> guint` | webkit_console_message_get_line | 2.12 | Gets the line number of a #WebKitConsoleMessage |
| get_source | `ConsoleMessage.get_source() -> ConsoleMessageSource` | webkit_console_message_get_source | 2.12 | Gets the source of a #WebKitConsoleMessage |
| get_source_id | `ConsoleMessage.get_source_id() -> utf8` | webkit_console_message_get_source_id | 2.12 | Gets the source identifier of a #WebKitConsoleMessage |
| get_text | `ConsoleMessage.get_text() -> utf8` | webkit_console_message_get_text | 2.12 | Gets the text message of a #WebKitConsoleMessage |

### WebKit2WebExtension.ContextMenuClass

C type: `WebKitContextMenuClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2WebExtension.ContextMenuItemClass

C type: `WebKitContextMenuItemClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.InitiallyUnownedClass |

### WebKit2WebExtension.ContextMenuItemPrivate

C type: `WebKitContextMenuItemPrivate`

### WebKit2WebExtension.ContextMenuPrivate

C type: `WebKitContextMenuPrivate`

### WebKit2WebExtension.DOMAttrClass

C type: `WebKitDOMAttrClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMNodeClass |

### WebKit2WebExtension.DOMBlobClass

C type: `WebKitDOMBlobClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMCDATASectionClass

C type: `WebKitDOMCDATASectionClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMTextClass |

### WebKit2WebExtension.DOMCharacterDataClass

C type: `WebKitDOMCharacterDataClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMNodeClass |

### WebKit2WebExtension.DOMClientRectClass

C type: `WebKitDOMClientRectClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMClientRectListClass

C type: `WebKitDOMClientRectListClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMCommentClass

C type: `WebKitDOMCommentClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMCharacterDataClass |

### WebKit2WebExtension.DOMCSSRuleClass

C type: `WebKitDOMCSSRuleClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMCSSRuleListClass

C type: `WebKitDOMCSSRuleListClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMCSSStyleDeclarationClass

C type: `WebKitDOMCSSStyleDeclarationClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMCSSStyleSheetClass

C type: `WebKitDOMCSSStyleSheetClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMStyleSheetClass |

### WebKit2WebExtension.DOMCSSValueClass

C type: `WebKitDOMCSSValueClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMDocumentClass

C type: `WebKitDOMDocumentClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMNodeClass |

### WebKit2WebExtension.DOMDocumentFragmentClass

C type: `WebKitDOMDocumentFragmentClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMNodeClass |

### WebKit2WebExtension.DOMDocumentTypeClass

C type: `WebKitDOMDocumentTypeClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMNodeClass |

### WebKit2WebExtension.DOMDOMImplementationClass

C type: `WebKitDOMDOMImplementationClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMDOMSelectionClass

C type: `WebKitDOMDOMSelectionClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMDOMTokenListClass

C type: `WebKitDOMDOMTokenListClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMDOMWindowClass

C type: `WebKitDOMDOMWindowClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMElementClass

C type: `WebKitDOMElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMNodeClass |

### WebKit2WebExtension.DOMEntityReferenceClass

C type: `WebKitDOMEntityReferenceClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMNodeClass |

### WebKit2WebExtension.DOMEventClass

C type: `WebKitDOMEventClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMEventTargetIface

C type: `WebKitDOMEventTargetIface`

a #gboolean

#### Fields

| Field | Type |
| --- | --- |
| _webkitdom_reserved0 | none |
| _webkitdom_reserved1 | none |
| _webkitdom_reserved2 | none |
| _webkitdom_reserved3 | none |
| add_event_listener | gboolean |
| dispatch_event | gboolean |
| gIface | GObject.TypeInterface |
| remove_event_listener | gboolean |

### WebKit2WebExtension.DOMFileClass

C type: `WebKitDOMFileClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMBlobClass |

### WebKit2WebExtension.DOMFileListClass

C type: `WebKitDOMFileListClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMHTMLAnchorElementClass

C type: `WebKitDOMHTMLAnchorElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLAppletElementClass

C type: `WebKitDOMHTMLAppletElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLAreaElementClass

C type: `WebKitDOMHTMLAreaElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLBaseElementClass

C type: `WebKitDOMHTMLBaseElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLBaseFontElementClass

C type: `WebKitDOMHTMLBaseFontElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLBodyElementClass

C type: `WebKitDOMHTMLBodyElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLBRElementClass

C type: `WebKitDOMHTMLBRElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLButtonElementClass

C type: `WebKitDOMHTMLButtonElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLCanvasElementClass

C type: `WebKitDOMHTMLCanvasElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLCollectionClass

C type: `WebKitDOMHTMLCollectionClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMHTMLDirectoryElementClass

C type: `WebKitDOMHTMLDirectoryElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLDivElementClass

C type: `WebKitDOMHTMLDivElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLDListElementClass

C type: `WebKitDOMHTMLDListElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLDocumentClass

C type: `WebKitDOMHTMLDocumentClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMDocumentClass |

### WebKit2WebExtension.DOMHTMLElementClass

C type: `WebKitDOMHTMLElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMElementClass |

### WebKit2WebExtension.DOMHTMLEmbedElementClass

C type: `WebKitDOMHTMLEmbedElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLFieldSetElementClass

C type: `WebKitDOMHTMLFieldSetElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLFontElementClass

C type: `WebKitDOMHTMLFontElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLFormElementClass

C type: `WebKitDOMHTMLFormElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLFrameElementClass

C type: `WebKitDOMHTMLFrameElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLFrameSetElementClass

C type: `WebKitDOMHTMLFrameSetElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLHeadElementClass

C type: `WebKitDOMHTMLHeadElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLHeadingElementClass

C type: `WebKitDOMHTMLHeadingElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLHRElementClass

C type: `WebKitDOMHTMLHRElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLHtmlElementClass

C type: `WebKitDOMHTMLHtmlElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLIFrameElementClass

C type: `WebKitDOMHTMLIFrameElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLImageElementClass

C type: `WebKitDOMHTMLImageElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLInputElementClass

C type: `WebKitDOMHTMLInputElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLLabelElementClass

C type: `WebKitDOMHTMLLabelElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLLegendElementClass

C type: `WebKitDOMHTMLLegendElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLLIElementClass

C type: `WebKitDOMHTMLLIElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLLinkElementClass

C type: `WebKitDOMHTMLLinkElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLMapElementClass

C type: `WebKitDOMHTMLMapElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLMarqueeElementClass

C type: `WebKitDOMHTMLMarqueeElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLMenuElementClass

C type: `WebKitDOMHTMLMenuElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLMetaElementClass

C type: `WebKitDOMHTMLMetaElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLModElementClass

C type: `WebKitDOMHTMLModElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLObjectElementClass

C type: `WebKitDOMHTMLObjectElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLOListElementClass

C type: `WebKitDOMHTMLOListElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLOptGroupElementClass

C type: `WebKitDOMHTMLOptGroupElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLOptionElementClass

C type: `WebKitDOMHTMLOptionElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLOptionsCollectionClass

C type: `WebKitDOMHTMLOptionsCollectionClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLCollectionClass |

### WebKit2WebExtension.DOMHTMLParagraphElementClass

C type: `WebKitDOMHTMLParagraphElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLParamElementClass

C type: `WebKitDOMHTMLParamElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLPreElementClass

C type: `WebKitDOMHTMLPreElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLQuoteElementClass

C type: `WebKitDOMHTMLQuoteElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLScriptElementClass

C type: `WebKitDOMHTMLScriptElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLSelectElementClass

C type: `WebKitDOMHTMLSelectElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLStyleElementClass

C type: `WebKitDOMHTMLStyleElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLTableCaptionElementClass

C type: `WebKitDOMHTMLTableCaptionElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLTableCellElementClass

C type: `WebKitDOMHTMLTableCellElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLTableColElementClass

C type: `WebKitDOMHTMLTableColElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLTableElementClass

C type: `WebKitDOMHTMLTableElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLTableRowElementClass

C type: `WebKitDOMHTMLTableRowElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLTableSectionElementClass

C type: `WebKitDOMHTMLTableSectionElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLTextAreaElementClass

C type: `WebKitDOMHTMLTextAreaElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLTitleElementClass

C type: `WebKitDOMHTMLTitleElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMHTMLUListElementClass

C type: `WebKitDOMHTMLUListElementClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMHTMLElementClass |

### WebKit2WebExtension.DOMKeyboardEventClass

C type: `WebKitDOMKeyboardEventClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMUIEventClass |

### WebKit2WebExtension.DOMMediaListClass

C type: `WebKitDOMMediaListClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMMouseEventClass

C type: `WebKitDOMMouseEventClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMUIEventClass |

### WebKit2WebExtension.DOMNamedNodeMapClass

C type: `WebKitDOMNamedNodeMapClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMNodeClass

C type: `WebKitDOMNodeClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMNodeFilterIface

C type: `WebKitDOMNodeFilterIface`

a #gshort

#### Fields

| Field | Type |
| --- | --- |
| _webkitdom_reserved0 | none |
| _webkitdom_reserved1 | none |
| _webkitdom_reserved2 | none |
| _webkitdom_reserved3 | none |
| accept_node | gshort |
| gIface | GObject.TypeInterface |

### WebKit2WebExtension.DOMNodeIteratorClass

C type: `WebKitDOMNodeIteratorClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMNodeListClass

C type: `WebKitDOMNodeListClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMObjectClass

C type: `WebKitDOMObjectClass`

#### Fields

| Field | Type |
| --- | --- |
| parentClass | GObject.ObjectClass |

### WebKit2WebExtension.DOMProcessingInstructionClass

C type: `WebKitDOMProcessingInstructionClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMCharacterDataClass |

### WebKit2WebExtension.DOMRangeClass

C type: `WebKitDOMRangeClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMStyleSheetClass

C type: `WebKitDOMStyleSheetClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMStyleSheetListClass

C type: `WebKitDOMStyleSheetListClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMTextClass

C type: `WebKitDOMTextClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMCharacterDataClass |

### WebKit2WebExtension.DOMTreeWalkerClass

C type: `WebKitDOMTreeWalkerClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMUIEventClass

C type: `WebKitDOMUIEventClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMEventClass |

### WebKit2WebExtension.DOMWheelEventClass

C type: `WebKitDOMWheelEventClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMMouseEventClass |

### WebKit2WebExtension.DOMXPathExpressionClass

C type: `WebKitDOMXPathExpressionClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.DOMXPathNSResolverIface

C type: `WebKitDOMXPathNSResolverIface`

a #gchar

#### Fields

| Field | Type |
| --- | --- |
| _webkitdom_reserved0 | none |
| _webkitdom_reserved1 | none |
| _webkitdom_reserved2 | none |
| _webkitdom_reserved3 | none |
| gIface | GObject.TypeInterface |
| lookup_namespace_uri | utf8 |

### WebKit2WebExtension.DOMXPathResultClass

C type: `WebKitDOMXPathResultClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DOMObjectClass |

### WebKit2WebExtension.FrameClass

C type: `WebKitFrameClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### WebKit2WebExtension.FramePrivate

C type: `WebKitFramePrivate`

### WebKit2WebExtension.HitTestResultClass

C type: `WebKitHitTestResultClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2WebExtension.HitTestResultPrivate

C type: `WebKitHitTestResultPrivate`

### WebKit2WebExtension.ScriptWorldClass

C type: `WebKitScriptWorldClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2WebExtension.ScriptWorldPrivate

C type: `WebKitScriptWorldPrivate`

### WebKit2WebExtension.URIRequestClass

C type: `WebKitURIRequestClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2WebExtension.URIRequestPrivate

C type: `WebKitURIRequestPrivate`

### WebKit2WebExtension.URIResponseClass

C type: `WebKitURIResponseClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2WebExtension.URIResponsePrivate

C type: `WebKitURIResponsePrivate`

### WebKit2WebExtension.UserMessageClass

C type: `WebKitUserMessageClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.InitiallyUnownedClass |

### WebKit2WebExtension.UserMessagePrivate

C type: `WebKitUserMessagePrivate`

### WebKit2WebExtension.WebEditorClass

C type: `WebKitWebEditorClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### WebKit2WebExtension.WebEditorPrivate

C type: `WebKitWebEditorPrivate`

### WebKit2WebExtension.WebExtensionClass

C type: `WebKitWebExtensionClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### WebKit2WebExtension.WebExtensionPrivate

C type: `WebKitWebExtensionPrivate`

### WebKit2WebExtension.WebFormManagerClass

C type: `WebKitWebFormManagerClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### WebKit2WebExtension.WebHitTestResultClass

C type: `WebKitWebHitTestResultClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | HitTestResultClass |

### WebKit2WebExtension.WebHitTestResultPrivate

C type: `WebKitWebHitTestResultPrivate`

### WebKit2WebExtension.WebPageClass

C type: `WebKitWebPageClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### WebKit2WebExtension.WebPagePrivate

C type: `WebKitWebPagePrivate`

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| WebExtensionInitializeFunction | `WebExtensionInitializeFunction(extension: WebExtension) -> none` |  |  | Type definition for a function that will be called to initialize the web extension when the web process starts. |
| WebExtensionInitializeWithUserDataFunction | `WebExtensionInitializeWithUserDataFunction(extension: WebExtension, user_data: GLib.Variant) -> none` |  | 2.4 | Type definition for a function that will be called to initialize the web extensions when the web process starts, and which receives as additional a... |

## Constants

| Name | Type |
| --- | --- |
| DOM_CSS_RULE_CHARSET_RULE | gint |
| DOM_CSS_RULE_FONT_FACE_RULE | gint |
| DOM_CSS_RULE_IMPORT_RULE | gint |
| DOM_CSS_RULE_MEDIA_RULE | gint |
| DOM_CSS_RULE_PAGE_RULE | gint |
| DOM_CSS_RULE_STYLE_RULE | gint |
| DOM_CSS_RULE_UNKNOWN_RULE | gint |
| DOM_CSS_VALUE_CSS_CUSTOM | gint |
| DOM_CSS_VALUE_CSS_INHERIT | gint |
| DOM_CSS_VALUE_CSS_PRIMITIVE_VALUE | gint |
| DOM_CSS_VALUE_CSS_VALUE_LIST | gint |
| DOM_ELEMENT_ALLOW_KEYBOARD_INPUT | gint |
| DOM_EVENT_AT_TARGET | gint |
| DOM_EVENT_BLUR | gint |
| DOM_EVENT_BUBBLING_PHASE | gint |
| DOM_EVENT_CAPTURING_PHASE | gint |
| DOM_EVENT_CHANGE | gint |
| DOM_EVENT_CLICK | gint |
| DOM_EVENT_DBLCLICK | gint |
| DOM_EVENT_DRAGDROP | gint |
| DOM_EVENT_FOCUS | gint |
| DOM_EVENT_KEYDOWN | gint |
| DOM_EVENT_KEYPRESS | gint |
| DOM_EVENT_KEYUP | gint |
| DOM_EVENT_MOUSEDOWN | gint |
| DOM_EVENT_MOUSEDRAG | gint |
| DOM_EVENT_MOUSEMOVE | gint |
| DOM_EVENT_MOUSEOUT | gint |
| DOM_EVENT_MOUSEOVER | gint |
| DOM_EVENT_MOUSEUP | gint |
| DOM_EVENT_NONE | gint |
| DOM_EVENT_SELECT | gint |
| DOM_KEYBOARD_EVENT_KEY_LOCATION_LEFT | gint |
| DOM_KEYBOARD_EVENT_KEY_LOCATION_NUMPAD | gint |
| DOM_KEYBOARD_EVENT_KEY_LOCATION_RIGHT | gint |
| DOM_KEYBOARD_EVENT_KEY_LOCATION_STANDARD | gint |
| DOM_NODE_ATTRIBUTE_NODE | gint |
| DOM_NODE_CDATA_SECTION_NODE | gint |
| DOM_NODE_COMMENT_NODE | gint |
| DOM_NODE_DOCUMENT_FRAGMENT_NODE | gint |
| DOM_NODE_DOCUMENT_NODE | gint |
| DOM_NODE_DOCUMENT_POSITION_CONTAINED_BY | gint |
| DOM_NODE_DOCUMENT_POSITION_CONTAINS | gint |
| DOM_NODE_DOCUMENT_POSITION_DISCONNECTED | gint |
| DOM_NODE_DOCUMENT_POSITION_FOLLOWING | gint |
| DOM_NODE_DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC | gint |
| DOM_NODE_DOCUMENT_POSITION_PRECEDING | gint |
| DOM_NODE_DOCUMENT_TYPE_NODE | gint |
| DOM_NODE_ELEMENT_NODE | gint |
| DOM_NODE_ENTITY_NODE | gint |
| DOM_NODE_ENTITY_REFERENCE_NODE | gint |
| DOM_NODE_FILTER_ACCEPT | gint |
| DOM_NODE_FILTER_REJECT | gint |
| DOM_NODE_FILTER_SHOW_ALL | gint |
| DOM_NODE_FILTER_SHOW_ATTRIBUTE | gint |
| DOM_NODE_FILTER_SHOW_CDATA_SECTION | gint |
| DOM_NODE_FILTER_SHOW_COMMENT | gint |
| DOM_NODE_FILTER_SHOW_DOCUMENT | gint |
| DOM_NODE_FILTER_SHOW_DOCUMENT_FRAGMENT | gint |
| DOM_NODE_FILTER_SHOW_DOCUMENT_TYPE | gint |
| DOM_NODE_FILTER_SHOW_ELEMENT | gint |
| DOM_NODE_FILTER_SHOW_ENTITY | gint |
| DOM_NODE_FILTER_SHOW_ENTITY_REFERENCE | gint |
| DOM_NODE_FILTER_SHOW_NOTATION | gint |
| DOM_NODE_FILTER_SHOW_PROCESSING_INSTRUCTION | gint |
| DOM_NODE_FILTER_SHOW_TEXT | gint |
| DOM_NODE_FILTER_SKIP | gint |
| DOM_NODE_PROCESSING_INSTRUCTION_NODE | gint |
| DOM_NODE_TEXT_NODE | gint |
| DOM_RANGE_END_TO_END | gint |
| DOM_RANGE_END_TO_START | gint |
| DOM_RANGE_NODE_AFTER | gint |
| DOM_RANGE_NODE_BEFORE | gint |
| DOM_RANGE_NODE_BEFORE_AND_AFTER | gint |
| DOM_RANGE_NODE_INSIDE | gint |
| DOM_RANGE_START_TO_END | gint |
| DOM_RANGE_START_TO_START | gint |
| DOM_XPATH_RESULT_ANY_TYPE | gint |
| DOM_XPATH_RESULT_ANY_UNORDERED_NODE_TYPE | gint |
| DOM_XPATH_RESULT_BOOLEAN_TYPE | gint |
| DOM_XPATH_RESULT_FIRST_ORDERED_NODE_TYPE | gint |
| DOM_XPATH_RESULT_NUMBER_TYPE | gint |
| DOM_XPATH_RESULT_ORDERED_NODE_ITERATOR_TYPE | gint |
| DOM_XPATH_RESULT_ORDERED_NODE_SNAPSHOT_TYPE | gint |
| DOM_XPATH_RESULT_STRING_TYPE | gint |
| DOM_XPATH_RESULT_UNORDERED_NODE_ITERATOR_TYPE | gint |
| DOM_XPATH_RESULT_UNORDERED_NODE_SNAPSHOT_TYPE | gint |

