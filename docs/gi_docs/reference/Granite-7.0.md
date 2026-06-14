# Granite 7.0

SQGI import: `import("Granite", "7.0")`

Packages: `granite-7`
Includes: `GLib-2.0`, `Gio-2.0`, `GObject-2.0`, `Gee-0.8`, `Gtk-4.0`, `Gdk-4.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 19 |
| Interfaces | 2 |
| Records | 40 |
| Unions | 0 |
| Enums | 3 |
| Flags | 0 |
| Functions | 18 |
| Callbacks | 0 |
| Constants | 49 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| AccelLabel | Gtk.Box | 0 | 0 | 8 |  |
| DatePicker | Gtk.Entry | 0 | 0 | 5 |  |
| Dialog | Gtk.Dialog | 1 | 0 | 1 |  |
| HeaderLabel | Gtk.Widget | 0 | 0 | 7 |  |
| HyperTextView | Gtk.TextView | 0 | 0 | 1 |  |
| MessageDialog | Granite.Dialog | 0 | 0 | 14 |  |
| ModeSwitch | Gtk.Box | 0 | 0 | 16 |  |
| OverlayBar | Gtk.Widget | 0 | 0 | 6 |  |
| Placeholder | Gtk.Widget | 0 | 0 | 8 |  |
| ServicesContractorProxy | GObject.Object | 0 | 1 | 6 |  |
| ServicesSystem | GObject.Object | 0 | 0 | 2 |  |
| Settings | GObject.Object | 0 | 0 | 2 |  |
| SettingsPage | Gtk.Box | 1 | 0 | 12 |  |
| SettingsSidebar | Gtk.Widget | 0 | 0 | 4 |  |
| SimpleSettingsPage | Granite.SettingsPage | 0 | 0 | 6 |  |
| SwitchModelButton | Gtk.ToggleButton | 0 | 0 | 5 |  |
| TimePicker | Gtk.Entry | 0 | 1 | 6 |  |
| Toast | Gtk.Widget | 0 | 2 | 6 |  |
| ValidatedEntry | Gtk.Entry | 0 | 0 | 8 |  |

### Granite.AccelLabel

Parent: `Gtk.Box` ?? GType: `GraniteAccelLabel` ?? C type: `GraniteAccelLabel`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.Box |
| priv | AccelLabelPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| from_action_name | `AccelLabel.from_action_name(label: utf8, action_name: utf8) -> Granite.AccelLabel` | granite_accel_label_new_from_action_name |  |  |
| new | `AccelLabel.new(label: utf8, accel_string: utf8?) -> Granite.AccelLabel` | granite_accel_label_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_accel_string | `AccelLabel.get_accel_string() -> utf8` | granite_accel_label_get_accel_string |  |  |
| get_action_name | `AccelLabel.get_action_name() -> utf8` | granite_accel_label_get_action_name |  |  |
| get_label | `AccelLabel.get_label() -> utf8` | granite_accel_label_get_label |  |  |
| set_accel_string | `AccelLabel.set_accel_string(value: utf8?) -> none` | granite_accel_label_set_accel_string |  |  |
| set_action_name | `AccelLabel.set_action_name(value: utf8) -> none` | granite_accel_label_set_action_name |  |  |
| set_label | `AccelLabel.set_label(value: utf8) -> none` | granite_accel_label_set_label |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| accel-string | utf8 | read, write |  |
| action-name | utf8 | read, write |  |
| label | utf8 | read, write |  |

### Granite.DatePicker

Parent: `Gtk.Entry` ?? Implements: `Gtk.Buildable` ?? GType: `GraniteDatePicker` ?? C type: `GraniteDatePicker`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.Entry |
| priv | DatePickerPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DatePicker.new() -> Granite.DatePicker` | granite_date_picker_new |  |  |
| with_format | `DatePicker.with_format(format: utf8) -> Granite.DatePicker` | granite_date_picker_new_with_format |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_date | `DatePicker.get_date() -> GLib.DateTime` | granite_date_picker_get_date |  |  |
| get_format | `DatePicker.get_format() -> utf8` | granite_date_picker_get_format |  |  |
| set_date | `DatePicker.set_date(value: GLib.DateTime) -> none` | granite_date_picker_set_date |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| date | GLib.DateTime | read, write |  |
| format | utf8 | read, write, construct-only |  |

### Granite.Dialog

Parent: `Gtk.Dialog` ?? Subclasses: `MessageDialog` ?? GType: `GraniteDialog` ?? C type: `GraniteDialog`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.Dialog |
| priv | DialogPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Dialog.new() -> Granite.Dialog` | granite_dialog_new |  |  |

### Granite.HeaderLabel

Parent: `Gtk.Widget` ?? GType: `GraniteHeaderLabel` ?? C type: `GraniteHeaderLabel`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.Widget |
| priv | HeaderLabelPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `HeaderLabel.new(label: utf8) -> Granite.HeaderLabel` | granite_header_label_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_label | `HeaderLabel.get_label() -> utf8` | granite_header_label_get_label |  |  |
| get_mnemonic_widget | `HeaderLabel.get_mnemonic_widget() -> Gtk.Widget` | granite_header_label_get_mnemonic_widget |  |  |
| get_secondary_text | `HeaderLabel.get_secondary_text() -> utf8` | granite_header_label_get_secondary_text |  |  |
| set_label | `HeaderLabel.set_label(value: utf8) -> none` | granite_header_label_set_label |  |  |
| set_mnemonic_widget | `HeaderLabel.set_mnemonic_widget(value: Gtk.Widget?) -> none` | granite_header_label_set_mnemonic_widget |  |  |
| set_secondary_text | `HeaderLabel.set_secondary_text(value: utf8?) -> none` | granite_header_label_set_secondary_text |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| label | utf8 | read, write |  |
| mnemonic-widget | Gtk.Widget | read, write |  |
| secondary-text | utf8 | read, write |  |

### Granite.HyperTextView

Parent: `Gtk.TextView` ?? GType: `GraniteHyperTextView` ?? C type: `GraniteHyperTextView`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.TextView |
| priv | HyperTextViewPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `HyperTextView.new() -> Granite.HyperTextView` | granite_hyper_text_view_new |  |  |

### Granite.MessageDialog

Parent: `Granite.Dialog` ?? GType: `GraniteMessageDialog` ?? C type: `GraniteMessageDialog`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Granite.Dialog |
| priv | MessageDialogPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MessageDialog.new(primary_text: utf8, secondary_text: utf8, image_icon: Gio.Icon, buttons: Gtk.ButtonsType) -> Granite.MessageDialog` | granite_message_dialog_new |  |  |
| with_image_from_icon_name | `MessageDialog.with_image_from_icon_name(primary_text: utf8, secondary_text: utf8, image_icon_name: utf8, buttons: Gtk.ButtonsType) -> Granite.MessageDialog` | granite_message_dialog_new_with_image_from_icon_name |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_badge_icon | `MessageDialog.get_badge_icon() -> Gio.Icon` | granite_message_dialog_get_badge_icon |  |  |
| get_custom_bin | `MessageDialog.get_custom_bin() -> Gtk.Box` | granite_message_dialog_get_custom_bin |  |  |
| get_image_icon | `MessageDialog.get_image_icon() -> Gio.Icon` | granite_message_dialog_get_image_icon |  |  |
| get_primary_label | `MessageDialog.get_primary_label() -> Gtk.Label` | granite_message_dialog_get_primary_label |  |  |
| get_primary_text | `MessageDialog.get_primary_text() -> utf8` | granite_message_dialog_get_primary_text |  |  |
| get_secondary_label | `MessageDialog.get_secondary_label() -> Gtk.Label` | granite_message_dialog_get_secondary_label |  |  |
| get_secondary_text | `MessageDialog.get_secondary_text() -> utf8` | granite_message_dialog_get_secondary_text |  |  |
| set_badge_icon | `MessageDialog.set_badge_icon(value: Gio.Icon) -> none` | granite_message_dialog_set_badge_icon |  |  |
| set_image_icon | `MessageDialog.set_image_icon(value: Gio.Icon) -> none` | granite_message_dialog_set_image_icon |  |  |
| set_primary_text | `MessageDialog.set_primary_text(value: utf8) -> none` | granite_message_dialog_set_primary_text |  |  |
| set_secondary_text | `MessageDialog.set_secondary_text(value: utf8) -> none` | granite_message_dialog_set_secondary_text |  |  |
| show_error_details | `MessageDialog.show_error_details(error_message: utf8) -> none` | granite_message_dialog_show_error_details |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| badge-icon | Gio.Icon | read, write |  |
| buttons | Gtk.ButtonsType | write, construct-only |  |
| custom-bin | Gtk.Box | read, write, construct-only |  |
| image-icon | Gio.Icon | read, write |  |
| primary-label | Gtk.Label | read, write, construct-only |  |
| primary-text | utf8 | read, write |  |
| secondary-label | Gtk.Label | read, write, construct-only |  |
| secondary-text | utf8 | read, write |  |

### Granite.ModeSwitch

Parent: `Gtk.Box` ?? GType: `GraniteModeSwitch` ?? C type: `GraniteModeSwitch`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.Box |
| priv | ModeSwitchPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| from_icon_name | `ModeSwitch.from_icon_name(primary_icon_name: utf8, secondary_icon_name: utf8) -> Granite.ModeSwitch` | granite_mode_switch_new_from_icon_name |  |  |
| new | `ModeSwitch.new(primary_icon_gicon: Gio.Icon, secondary_icon_gicon: Gio.Icon) -> Granite.ModeSwitch` | granite_mode_switch_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_active | `ModeSwitch.get_active() -> gboolean` | granite_mode_switch_get_active |  |  |
| get_primary_icon_gicon | `ModeSwitch.get_primary_icon_gicon() -> Gio.Icon` | granite_mode_switch_get_primary_icon_gicon |  |  |
| get_primary_icon_name | `ModeSwitch.get_primary_icon_name() -> utf8` | granite_mode_switch_get_primary_icon_name |  |  |
| get_primary_icon_tooltip_text | `ModeSwitch.get_primary_icon_tooltip_text() -> utf8` | granite_mode_switch_get_primary_icon_tooltip_text |  |  |
| get_secondary_icon_gicon | `ModeSwitch.get_secondary_icon_gicon() -> Gio.Icon` | granite_mode_switch_get_secondary_icon_gicon |  |  |
| get_secondary_icon_name | `ModeSwitch.get_secondary_icon_name() -> utf8` | granite_mode_switch_get_secondary_icon_name |  |  |
| get_secondary_icon_tooltip_text | `ModeSwitch.get_secondary_icon_tooltip_text() -> utf8` | granite_mode_switch_get_secondary_icon_tooltip_text |  |  |
| set_active | `ModeSwitch.set_active(value: gboolean) -> none` | granite_mode_switch_set_active |  |  |
| set_primary_icon_gicon | `ModeSwitch.set_primary_icon_gicon(value: Gio.Icon) -> none` | granite_mode_switch_set_primary_icon_gicon |  |  |
| set_primary_icon_name | `ModeSwitch.set_primary_icon_name(value: utf8) -> none` | granite_mode_switch_set_primary_icon_name |  |  |
| set_primary_icon_tooltip_text | `ModeSwitch.set_primary_icon_tooltip_text(value: utf8) -> none` | granite_mode_switch_set_primary_icon_tooltip_text |  |  |
| set_secondary_icon_gicon | `ModeSwitch.set_secondary_icon_gicon(value: Gio.Icon) -> none` | granite_mode_switch_set_secondary_icon_gicon |  |  |
| set_secondary_icon_name | `ModeSwitch.set_secondary_icon_name(value: utf8) -> none` | granite_mode_switch_set_secondary_icon_name |  |  |
| set_secondary_icon_tooltip_text | `ModeSwitch.set_secondary_icon_tooltip_text(value: utf8) -> none` | granite_mode_switch_set_secondary_icon_tooltip_text |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| active | gboolean | read, write |  |
| primary-icon-gicon | Gio.Icon | read, write |  |
| primary-icon-name | utf8 | read, write |  |
| primary-icon-tooltip-text | utf8 | read, write |  |
| secondary-icon-gicon | Gio.Icon | read, write |  |
| secondary-icon-name | utf8 | read, write |  |
| secondary-icon-tooltip-text | utf8 | read, write |  |

### Granite.OverlayBar

Parent: `Gtk.Widget` ?? GType: `GraniteOverlayBar` ?? C type: `GraniteOverlayBar`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.Widget |
| priv | OverlayBarPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `OverlayBar.new(overlay: Gtk.Overlay?) -> Granite.OverlayBar` | granite_overlay_bar_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_active | `OverlayBar.get_active() -> gboolean` | granite_overlay_bar_get_active |  |  |
| get_label | `OverlayBar.get_label() -> utf8` | granite_overlay_bar_get_label |  |  |
| get_overlay | `OverlayBar.get_overlay() -> Gtk.Overlay` | granite_overlay_bar_get_overlay |  |  |
| set_active | `OverlayBar.set_active(value: gboolean) -> none` | granite_overlay_bar_set_active |  |  |
| set_label | `OverlayBar.set_label(value: utf8) -> none` | granite_overlay_bar_set_label |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| active | gboolean | read, write |  |
| label | utf8 | read, write |  |
| overlay | Gtk.Overlay | read, write, construct-only |  |

### Granite.Placeholder

Parent: `Gtk.Widget` ?? GType: `GranitePlaceholder` ?? C type: `GranitePlaceholder`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.Widget |
| priv | PlaceholderPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Placeholder.new(title: utf8) -> Granite.Placeholder` | granite_placeholder_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_button | `Placeholder.append_button(icon: Gio.Icon, label: utf8, description: utf8) -> Gtk.Button` | granite_placeholder_append_button |  |  |
| get_description | `Placeholder.get_description() -> utf8` | granite_placeholder_get_description |  |  |
| get_icon | `Placeholder.get_icon() -> Gio.Icon` | granite_placeholder_get_icon |  |  |
| get_title | `Placeholder.get_title() -> utf8` | granite_placeholder_get_title |  |  |
| set_description | `Placeholder.set_description(value: utf8) -> none` | granite_placeholder_set_description |  |  |
| set_icon | `Placeholder.set_icon(value: Gio.Icon) -> none` | granite_placeholder_set_icon |  |  |
| set_title | `Placeholder.set_title(value: utf8) -> none` | granite_placeholder_set_title |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| description | utf8 | read, write |  |
| icon | Gio.Icon | read, write |  |
| title | utf8 | read, write |  |

### Granite.ServicesContractorProxy

Parent: `GObject.Object` ?? GType: `GraniteServicesContractorProxy` ?? C type: `GraniteServicesContractorProxy`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | ServicesContractorProxyPrivate |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_all_contracts | `get_all_contracts() -> Gee.List throws` | granite_services_contractor_proxy_get_all_contracts |  |  |
| get_contracts_by_mime | `get_contracts_by_mime(mime_type: utf8) -> Gee.List throws` | granite_services_contractor_proxy_get_contracts_by_mime |  |  |
| get_contracts_by_mimelist | `get_contracts_by_mimelist(mime_types: utf8, mime_types_length1: gint) -> Gee.List throws` | granite_services_contractor_proxy_get_contracts_by_mimelist |  |  |
| get_contracts_for_file | `get_contracts_for_file(file: Gio.File) -> Gee.List throws` | granite_services_contractor_proxy_get_contracts_for_file |  |  |
| get_contracts_for_files | `get_contracts_for_files(files: Gio.File, files_length1: gint) -> Gee.List throws` | granite_services_contractor_proxy_get_contracts_for_files |  |  |
| get_instance | `get_instance() -> Granite.GraniteServicesContractorProxy throws` | granite_services_contractor_proxy_get_instance |  |  |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| contracts-changed | `` | none |  |  |  |

### Granite.ServicesSystem

Parent: `GObject.Object` ?? GType: `GraniteServicesSystem` ?? C type: `GraniteServicesSystem`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | ServicesSystemPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ServicesSystem.new() -> Granite.GraniteServicesSystem` | granite_services_system_new |  |  |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| history_is_enabled | `history_is_enabled() -> gboolean` | granite_services_system_history_is_enabled |  |  |

### Granite.Settings

Parent: `GObject.Object` ?? GType: `GraniteSettings` ?? C type: `GraniteSettings`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | SettingsPrivate |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default | `get_default() -> Granite.Settings` | granite_settings_get_default |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_prefers_color_scheme | `Settings.get_prefers_color_scheme() -> Granite.SettingsColorScheme` | granite_settings_get_prefers_color_scheme |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| prefers-color-scheme | Granite.SettingsColorScheme | read, write |  |

### Granite.SettingsPage

Parent: `Gtk.Box` ?? Subclasses: `SimpleSettingsPage` ?? GType: `GraniteSettingsPage` ?? C type: `GraniteSettingsPage` ?? Abstract

#### Fields

| Field | Type |
| --- | --- |
| _icon_name | utf8 |
| _title | utf8 |
| parent_instance | Gtk.Box |
| priv | SettingsPagePrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_child | `SettingsPage.get_child() -> Gtk.Widget` | granite_settings_page_get_child |  |  |
| get_display_widget | `SettingsPage.get_display_widget() -> Gtk.Widget` | granite_settings_page_get_display_widget |  |  |
| get_header | `SettingsPage.get_header() -> utf8` | granite_settings_page_get_header |  |  |
| get_icon_name | `SettingsPage.get_icon_name() -> utf8` | granite_settings_page_get_icon_name |  |  |
| get_status | `SettingsPage.get_status() -> utf8` | granite_settings_page_get_status |  |  |
| get_status_type | `SettingsPage.get_status_type() -> Granite.SettingsPageStatusType` | granite_settings_page_get_status_type |  |  |
| get_title | `SettingsPage.get_title() -> utf8` | granite_settings_page_get_title |  |  |
| set_child | `SettingsPage.set_child(value: Gtk.Widget) -> none` | granite_settings_page_set_child |  |  |
| set_icon_name | `SettingsPage.set_icon_name(value: utf8?) -> none` | granite_settings_page_set_icon_name |  |  |
| set_status | `SettingsPage.set_status(value: utf8) -> none` | granite_settings_page_set_status |  |  |
| set_status_type | `SettingsPage.set_status_type(value: Granite.SettingsPageStatusType) -> none` | granite_settings_page_set_status_type |  |  |
| set_title | `SettingsPage.set_title(value: utf8) -> none` | granite_settings_page_set_title |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| child | Gtk.Widget | read, write |  |
| display-widget | Gtk.Widget | read, write, construct-only |  |
| header | utf8 | read, write, construct-only |  |
| icon-name | utf8 | read, write |  |
| status | utf8 | read, write |  |
| status-type | Granite.SettingsPageStatusType | read, write |  |
| title | utf8 | read, write |  |

### Granite.SettingsSidebar

Parent: `Gtk.Widget` ?? GType: `GraniteSettingsSidebar` ?? C type: `GraniteSettingsSidebar`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.Widget |
| priv | SettingsSidebarPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SettingsSidebar.new(stack: Gtk.Stack) -> Granite.SettingsSidebar` | granite_settings_sidebar_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_stack | `SettingsSidebar.get_stack() -> Gtk.Stack` | granite_settings_sidebar_get_stack |  |  |
| get_visible_child_name | `SettingsSidebar.get_visible_child_name() -> utf8` | granite_settings_sidebar_get_visible_child_name |  |  |
| set_visible_child_name | `SettingsSidebar.set_visible_child_name(value: utf8?) -> none` | granite_settings_sidebar_set_visible_child_name |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| stack | Gtk.Stack | read, write, construct-only |  |
| visible-child-name | utf8 | read, write |  |

### Granite.SimpleSettingsPage

Parent: `Granite.SettingsPage` ?? GType: `GraniteSimpleSettingsPage` ?? C type: `GraniteSimpleSettingsPage` ?? Abstract

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Granite.SettingsPage |
| priv | SimpleSettingsPagePrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_action_area | `SimpleSettingsPage.get_action_area() -> Gtk.Box` | granite_simple_settings_page_get_action_area |  |  |
| get_activatable | `SimpleSettingsPage.get_activatable() -> gboolean` | granite_simple_settings_page_get_activatable |  |  |
| get_content_area | `SimpleSettingsPage.get_content_area() -> Gtk.Grid` | granite_simple_settings_page_get_content_area |  |  |
| get_description | `SimpleSettingsPage.get_description() -> utf8` | granite_simple_settings_page_get_description |  |  |
| get_status_switch | `SimpleSettingsPage.get_status_switch() -> Gtk.Switch` | granite_simple_settings_page_get_status_switch |  |  |
| set_description | `SimpleSettingsPage.set_description(value: utf8) -> none` | granite_simple_settings_page_set_description |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| action-area | Gtk.Box | read, write, construct-only |  |
| activatable | gboolean | read, write, construct-only |  |
| content-area | Gtk.Grid | read, write, construct-only |  |
| description | utf8 | read, write |  |
| status-switch | Gtk.Switch | read, write, construct-only |  |

### Granite.SwitchModelButton

Parent: `Gtk.ToggleButton` ?? GType: `GraniteSwitchModelButton` ?? C type: `GraniteSwitchModelButton`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.ToggleButton |
| priv | SwitchModelButtonPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SwitchModelButton.new(text: utf8) -> Granite.SwitchModelButton` | granite_switch_model_button_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_description | `SwitchModelButton.get_description() -> utf8` | granite_switch_model_button_get_description |  |  |
| get_text | `SwitchModelButton.get_text() -> utf8` | granite_switch_model_button_get_text |  |  |
| set_description | `SwitchModelButton.set_description(value: utf8?) -> none` | granite_switch_model_button_set_description |  |  |
| set_text | `SwitchModelButton.set_text(value: utf8) -> none` | granite_switch_model_button_set_text |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| description | utf8 | read, write |  |
| text | utf8 | read, write |  |

### Granite.TimePicker

Parent: `Gtk.Entry` ?? GType: `GraniteTimePicker` ?? C type: `GraniteTimePicker`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.Entry |
| priv | TimePickerPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TimePicker.new() -> Granite.TimePicker` | granite_time_picker_new |  |  |
| with_format | `TimePicker.with_format(format_12: utf8, format_24: utf8) -> Granite.TimePicker` | granite_time_picker_new_with_format |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_format_12 | `TimePicker.get_format_12() -> utf8` | granite_time_picker_get_format_12 |  |  |
| get_format_24 | `TimePicker.get_format_24() -> utf8` | granite_time_picker_get_format_24 |  |  |
| get_time | `TimePicker.get_time() -> GLib.DateTime` | granite_time_picker_get_time |  |  |
| set_time | `TimePicker.set_time(value: GLib.DateTime) -> none` | granite_time_picker_set_time |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| format-12 | utf8 | read, write, construct-only |  |
| format-24 | utf8 | read, write, construct-only |  |
| time | GLib.DateTime | read, write |  |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| time-changed | `` | none |  |  |  |

### Granite.Toast

Parent: `Gtk.Widget` ?? GType: `GraniteToast` ?? C type: `GraniteToast`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.Widget |
| priv | ToastPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Toast.new(title: utf8) -> Granite.Toast` | granite_toast_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_title | `Toast.get_title() -> utf8` | granite_toast_get_title |  |  |
| send_notification | `Toast.send_notification() -> none` | granite_toast_send_notification |  |  |
| set_default_action | `Toast.set_default_action(label: utf8?) -> none` | granite_toast_set_default_action |  |  |
| set_title | `Toast.set_title(value: utf8) -> none` | granite_toast_set_title |  |  |
| withdraw | `Toast.withdraw() -> none` | granite_toast_withdraw | 7.4.0 |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| title | utf8 | read, write |  |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| closed | `` | none |  |  |  |
| default-action | `` | none |  |  |  |

### Granite.ValidatedEntry

Parent: `Gtk.Entry` ?? GType: `GraniteValidatedEntry` ?? C type: `GraniteValidatedEntry`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gtk.Entry |
| priv | ValidatedEntryPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| from_regex | `ValidatedEntry.from_regex(regex_arg: GLib.Regex) -> Granite.ValidatedEntry` | granite_validated_entry_new_from_regex |  |  |
| new | `ValidatedEntry.new() -> Granite.ValidatedEntry` | granite_validated_entry_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_is_valid | `ValidatedEntry.get_is_valid() -> gboolean` | granite_validated_entry_get_is_valid |  |  |
| get_min_length | `ValidatedEntry.get_min_length() -> gint` | granite_validated_entry_get_min_length |  |  |
| get_regex | `ValidatedEntry.get_regex() -> GLib.Regex` | granite_validated_entry_get_regex |  |  |
| set_is_valid | `ValidatedEntry.set_is_valid(value: gboolean) -> none` | granite_validated_entry_set_is_valid |  |  |
| set_min_length | `ValidatedEntry.set_min_length(value: gint) -> none` | granite_validated_entry_set_min_length |  |  |
| set_regex | `ValidatedEntry.set_regex(value: GLib.Regex) -> none` | granite_validated_entry_set_regex |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| is-valid | gboolean | read, write |  |
| min-length | gint | read, write |  |
| regex | GLib.Regex | read, write |  |

## Interfaces

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| ServicesContract |  | 0 | 0 | 5 |  |
| ServicesSettingsSerializable |  | 0 | 0 | 2 |  |

### Granite.ServicesContract

GType: `GraniteServicesContract` ?? C type: `GraniteServicesContract`

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| execute_with_file | `ServicesContract.execute_with_file(file: Gio.File) -> none throws` | granite_services_contract_execute_with_file |  |  |
| execute_with_files | `ServicesContract.execute_with_files(files: Gio.File, files_length1: gint) -> none throws` | granite_services_contract_execute_with_files |  |  |
| get_description | `ServicesContract.get_description() -> utf8` | granite_services_contract_get_description |  |  |
| get_display_name | `ServicesContract.get_display_name() -> utf8` | granite_services_contract_get_display_name |  |  |
| get_icon | `ServicesContract.get_icon() -> Gio.Icon` | granite_services_contract_get_icon |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| execute_with_file | `execute_with_file(file: Gio.File) -> none throws` |  |  |  |
| execute_with_files | `execute_with_files(files: Gio.File, files_length1: gint) -> none throws` |  |  |  |
| get_description | `get_description() -> utf8` |  |  |  |
| get_display_name | `get_display_name() -> utf8` |  |  |  |
| get_icon | `get_icon() -> Gio.Icon` |  |  |  |

### Granite.ServicesSettingsSerializable

GType: `GraniteServicesSettingsSerializable` ?? C type: `GraniteServicesSettingsSerializable`

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| settings_deserialize | `ServicesSettingsSerializable.settings_deserialize(s: utf8) -> none` | granite_services_settings_serializable_settings_deserialize |  |  |
| settings_serialize | `ServicesSettingsSerializable.settings_serialize() -> utf8` | granite_services_settings_serializable_settings_serialize |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| settings_deserialize | `settings_deserialize(s: utf8) -> none` |  |  |  |
| settings_serialize | `settings_serialize() -> utf8` |  |  |  |

## Enums

### Granite.ServicesContractorError

GType: `GraniteServicesContractorError` ?? C type: `GraniteServicesContractorError`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| service_not_available | 0 |  |  |

### Granite.SettingsColorScheme

GType: `GraniteSettingsColorScheme` ?? C type: `GraniteSettingsColorScheme`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| dark | 1 |  |  |
| light | 2 |  |  |
| no_preference | 0 |  |  |

### Granite.SettingsPageStatusType

GType: `GraniteSettingsPageStatusType` ?? C type: `GraniteSettingsPageStatusType`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| error | 0 |  |  |
| none | 4 |  |  |
| offline | 1 |  |  |
| success | 2 |  |  |
| warning | 3 |  |  |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| AccelLabelClass |  | 0 | 0 | 0 |  |
| AccelLabelPrivate |  | 0 | 0 | 0 |  |
| DatePickerClass |  | 0 | 0 | 0 |  |
| DatePickerPrivate |  | 0 | 0 | 0 |  |
| DialogClass |  | 0 | 0 | 0 |  |
| DialogPrivate |  | 0 | 0 | 0 |  |
| HeaderLabelClass |  | 0 | 0 | 0 |  |
| HeaderLabelPrivate |  | 0 | 0 | 0 |  |
| HyperTextViewClass |  | 0 | 0 | 0 |  |
| HyperTextViewPrivate |  | 0 | 0 | 0 |  |
| MessageDialogClass |  | 0 | 0 | 0 |  |
| MessageDialogPrivate |  | 0 | 0 | 0 |  |
| ModeSwitchClass |  | 0 | 0 | 0 |  |
| ModeSwitchPrivate |  | 0 | 0 | 0 |  |
| OverlayBarClass |  | 0 | 0 | 0 |  |
| OverlayBarPrivate |  | 0 | 0 | 0 |  |
| PlaceholderClass |  | 0 | 0 | 0 |  |
| PlaceholderPrivate |  | 0 | 0 | 0 |  |
| ServicesContractIface |  | 0 | 0 | 0 |  |
| ServicesContractorProxyClass |  | 0 | 0 | 0 |  |
| ServicesContractorProxyPrivate |  | 0 | 0 | 0 |  |
| ServicesSettingsSerializableIface |  | 0 | 0 | 0 |  |
| ServicesSystemClass |  | 0 | 0 | 0 |  |
| ServicesSystemPrivate |  | 0 | 0 | 0 |  |
| SettingsClass |  | 0 | 0 | 0 |  |
| SettingsPageClass |  | 0 | 0 | 0 |  |
| SettingsPagePrivate |  | 0 | 0 | 0 |  |
| SettingsPrivate |  | 0 | 0 | 0 |  |
| SettingsSidebarClass |  | 0 | 0 | 0 |  |
| SettingsSidebarPrivate |  | 0 | 0 | 0 |  |
| SimpleSettingsPageClass |  | 0 | 0 | 0 |  |
| SimpleSettingsPagePrivate |  | 0 | 0 | 0 |  |
| SwitchModelButtonClass |  | 0 | 0 | 0 |  |
| SwitchModelButtonPrivate |  | 0 | 0 | 0 |  |
| TimePickerClass |  | 0 | 0 | 0 |  |
| TimePickerPrivate |  | 0 | 0 | 0 |  |
| ToastClass |  | 0 | 0 | 0 |  |
| ToastPrivate |  | 0 | 0 | 0 |  |
| ValidatedEntryClass |  | 0 | 0 | 0 |  |
| ValidatedEntryPrivate |  | 0 | 0 | 0 |  |

### Granite.AccelLabelClass

C type: `GraniteAccelLabelClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.BoxClass |

### Granite.AccelLabelPrivate

C type: `GraniteAccelLabelPrivate`

### Granite.DatePickerClass

C type: `GraniteDatePickerClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.EntryClass |

### Granite.DatePickerPrivate

C type: `GraniteDatePickerPrivate`

### Granite.DialogClass

C type: `GraniteDialogClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.DialogClass |

### Granite.DialogPrivate

C type: `GraniteDialogPrivate`

### Granite.HeaderLabelClass

C type: `GraniteHeaderLabelClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.WidgetClass |

### Granite.HeaderLabelPrivate

C type: `GraniteHeaderLabelPrivate`

### Granite.HyperTextViewClass

C type: `GraniteHyperTextViewClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.TextViewClass |

### Granite.HyperTextViewPrivate

C type: `GraniteHyperTextViewPrivate`

### Granite.MessageDialogClass

C type: `GraniteMessageDialogClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Granite.DialogClass |

### Granite.MessageDialogPrivate

C type: `GraniteMessageDialogPrivate`

### Granite.ModeSwitchClass

C type: `GraniteModeSwitchClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.BoxClass |

### Granite.ModeSwitchPrivate

C type: `GraniteModeSwitchPrivate`

### Granite.OverlayBarClass

C type: `GraniteOverlayBarClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.WidgetClass |

### Granite.OverlayBarPrivate

C type: `GraniteOverlayBarPrivate`

### Granite.PlaceholderClass

C type: `GranitePlaceholderClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.WidgetClass |

### Granite.PlaceholderPrivate

C type: `GranitePlaceholderPrivate`

### Granite.ServicesContractIface

C type: `GraniteServicesContractIface`

#### Fields

| Field | Type |
| --- | --- |
| execute_with_file | none |
| execute_with_files | none |
| get_description | utf8 |
| get_display_name | utf8 |
| get_icon | Gio.Icon |
| parent_iface | GObject.TypeInterface |

### Granite.ServicesContractorProxyClass

C type: `GraniteServicesContractorProxyClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Granite.ServicesContractorProxyPrivate

C type: `GraniteServicesContractorProxyPrivate`

### Granite.ServicesSettingsSerializableIface

C type: `GraniteServicesSettingsSerializableIface`

#### Fields

| Field | Type |
| --- | --- |
| parent_iface | GObject.TypeInterface |
| settings_deserialize | none |
| settings_serialize | utf8 |

### Granite.ServicesSystemClass

C type: `GraniteServicesSystemClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Granite.ServicesSystemPrivate

C type: `GraniteServicesSystemPrivate`

### Granite.SettingsClass

C type: `GraniteSettingsClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Granite.SettingsPageClass

C type: `GraniteSettingsPageClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.BoxClass |

### Granite.SettingsPagePrivate

C type: `GraniteSettingsPagePrivate`

### Granite.SettingsPrivate

C type: `GraniteSettingsPrivate`

### Granite.SettingsSidebarClass

C type: `GraniteSettingsSidebarClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.WidgetClass |

### Granite.SettingsSidebarPrivate

C type: `GraniteSettingsSidebarPrivate`

### Granite.SimpleSettingsPageClass

C type: `GraniteSimpleSettingsPageClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Granite.SettingsPageClass |

### Granite.SimpleSettingsPagePrivate

C type: `GraniteSimpleSettingsPagePrivate`

### Granite.SwitchModelButtonClass

C type: `GraniteSwitchModelButtonClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.ToggleButtonClass |

### Granite.SwitchModelButtonPrivate

C type: `GraniteSwitchModelButtonPrivate`

### Granite.TimePickerClass

C type: `GraniteTimePickerClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.EntryClass |

### Granite.TimePickerPrivate

C type: `GraniteTimePickerPrivate`

### Granite.ToastClass

C type: `GraniteToastClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.WidgetClass |

### Granite.ToastPrivate

C type: `GraniteToastPrivate`

### Granite.ValidatedEntryClass

C type: `GraniteValidatedEntryClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gtk.EntryClass |

### Granite.ValidatedEntryPrivate

C type: `GraniteValidatedEntryPrivate`

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| accel_to_string | `accel_to_string(accel: utf8?) -> utf8` | granite_accel_to_string |  |  |
| contrasting_foreground_color | `contrasting_foreground_color(bg_color: Gdk.RGBA, result: out Gdk.RGBA) -> none` | granite_contrasting_foreground_color |  |  |
| date_time_get_default_date_format | `date_time_get_default_date_format(with_weekday: gboolean, with_day: gboolean, with_year: gboolean) -> utf8` | granite_date_time_get_default_date_format |  |  |
| date_time_get_default_time_format | `date_time_get_default_time_format(is_12h: gboolean, with_second: gboolean) -> utf8` | granite_date_time_get_default_time_format |  |  |
| date_time_get_relative_datetime | `date_time_get_relative_datetime(date_time: GLib.DateTime) -> utf8` | granite_date_time_get_relative_datetime |  |  |
| date_time_is_same_day | `date_time_is_same_day(day1: GLib.DateTime, day2: GLib.DateTime) -> gboolean` | granite_date_time_is_same_day |  |  |
| date_time_seconds_to_time | `date_time_seconds_to_time(seconds: gint) -> utf8` | granite_date_time_seconds_to_time |  |  |
| init | `init() -> none` | granite_init | 7.2.0 |  |
| markup_accel_tooltip | `markup_accel_tooltip(accels: utf8?, accels_length1: gint, description: utf8?) -> utf8` | granite_markup_accel_tooltip |  |  |
| services_application_set_badge | `services_application_set_badge(count: gint64, _callback_: Gio.AsyncReadyCallback?, _callback__target: gpointer?) -> none` | granite_services_application_set_badge |  |  |
| services_application_set_badge_finish | `services_application_set_badge_finish(_res_: Gio.AsyncResult) -> gboolean throws` | granite_services_application_set_badge_finish |  |  |
| services_application_set_badge_visible | `services_application_set_badge_visible(visible: gboolean, _callback_: Gio.AsyncReadyCallback?, _callback__target: gpointer?) -> none` | granite_services_application_set_badge_visible |  |  |
| services_application_set_badge_visible_finish | `services_application_set_badge_visible_finish(_res_: Gio.AsyncResult) -> gboolean throws` | granite_services_application_set_badge_visible_finish |  |  |
| services_application_set_progress | `services_application_set_progress(progress: gdouble, _callback_: Gio.AsyncReadyCallback?, _callback__target: gpointer?) -> none` | granite_services_application_set_progress |  |  |
| services_application_set_progress_finish | `services_application_set_progress_finish(_res_: Gio.AsyncResult) -> gboolean throws` | granite_services_application_set_progress_finish |  |  |
| services_application_set_progress_visible | `services_application_set_progress_visible(visible: gboolean, _callback_: Gio.AsyncReadyCallback?, _callback__target: gpointer?) -> none` | granite_services_application_set_progress_visible |  |  |
| services_application_set_progress_visible_finish | `services_application_set_progress_visible_finish(_res_: Gio.AsyncResult) -> gboolean throws` | granite_services_application_set_progress_visible_finish |  |  |
| widgets_utils_set_color_primary | `widgets_utils_set_color_primary(window: Gtk.Widget, color: Gdk.RGBA, priority: gint) -> Gtk.CssProvider` | granite_widgets_utils_set_color_primary |  |  |

## Constants

| Name | Type |
| --- | --- |
| SettingsUriLOCATION | utf8 |
| SettingsUriNETWORK | utf8 |
| SettingsUriNOTIFICATIONS | utf8 |
| SettingsUriONLINE_ACCOUNTS | utf8 |
| SettingsUriPERMISSIONS | utf8 |
| SettingsUriSHORTCUTS | utf8 |
| SettingsUriSOUND_INPUT | utf8 |
| STYLE_CLASS_ACCENT | utf8 |
| STYLE_CLASS_BACK_BUTTON | utf8 |
| STYLE_CLASS_BACKGROUND | utf8 |
| STYLE_CLASS_BADGE | utf8 |
| STYLE_CLASS_CARD | utf8 |
| STYLE_CLASS_CHECKERBOARD | utf8 |
| STYLE_CLASS_CIRCULAR | utf8 |
| STYLE_CLASS_COLOR_BUTTON | utf8 |
| STYLE_CLASS_DEFAULT_DECORATION | utf8 |
| STYLE_CLASS_DESTRUCTIVE_ACTION | utf8 |
| STYLE_CLASS_DIALOG_CONTENT_AREA | utf8 |
| STYLE_CLASS_DIM_LABEL | utf8 |
| STYLE_CLASS_ERROR | utf8 |
| STYLE_CLASS_FLAT | utf8 |
| STYLE_CLASS_FRAME | utf8 |
| STYLE_CLASS_H1_LABEL | utf8 |
| STYLE_CLASS_H2_LABEL | utf8 |
| STYLE_CLASS_H3_LABEL | utf8 |
| STYLE_CLASS_H4_LABEL | utf8 |
| STYLE_CLASS_KEYCAP | utf8 |
| STYLE_CLASS_LARGE_ICONS | utf8 |
| STYLE_CLASS_LINKED | utf8 |
| STYLE_CLASS_MENU | utf8 |
| STYLE_CLASS_MENUITEM | utf8 |
| STYLE_CLASS_MESSAGE_DIALOG | utf8 |
| STYLE_CLASS_MODE_SWITCH | utf8 |
| STYLE_CLASS_OSD | utf8 |
| STYLE_CLASS_RICH_LIST | utf8 |
| STYLE_CLASS_ROUNDED | utf8 |
| STYLE_CLASS_SIDEBAR | utf8 |
| STYLE_CLASS_SMALL_LABEL | utf8 |
| STYLE_CLASS_SUGGESTED_ACTION | utf8 |
| STYLE_CLASS_TEMPERATURE | utf8 |
| STYLE_CLASS_TERMINAL | utf8 |
| STYLE_CLASS_TITLE_LABEL | utf8 |
| STYLE_CLASS_VIEW | utf8 |
| STYLE_CLASS_WARMTH | utf8 |
| STYLE_CLASS_WARNING | utf8 |
| TOOLTIP_SECONDARY_TEXT_MARKUP | utf8 |
| TRANSITION_DURATION_CLOSE | gint |
| TRANSITION_DURATION_IN_PLACE | gint |
| TRANSITION_DURATION_OPEN | gint |

