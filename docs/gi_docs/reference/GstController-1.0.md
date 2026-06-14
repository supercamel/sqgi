# GstController 1.0

SQGI import: `import("GstController", "1.0")`

Packages: `gstreamer-controller-1.0`
Includes: `GLib-2.0`, `GModule-2.0`, `GObject-2.0`, `Gst-1.0`
Libraries: `libgstcontroller-1.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 7 |
| Interfaces | 0 |
| Records | 14 |
| Unions | 2 |
| Enums | 2 |
| Flags | 0 |
| Functions | 1 |
| Callbacks | 2 |
| Constants | 0 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| ARGBControlBinding | Gst.ControlBinding | 0 | 0 | 1 | A value mapping object that attaches multiple control sources to a guint gobject properties representing a color. A control value of 0.0 will turn ... |
| DirectControlBinding | Gst.ControlBinding | 0 | 0 | 2 | A value mapping object that attaches control sources to gobject properties. It will map the control values directly to the target property range. I... |
| InterpolationControlSource | TimedValueControlSource | 0 | 0 | 1 | #GstInterpolationControlSource is a #GstControlSource, that interpolates values between user-given control points. It supports several interpolatio... |
| LFOControlSource | Gst.ControlSource | 0 | 0 | 1 | #GstLFOControlSource is a #GstControlSource, that provides several periodic waveforms as control values. To use #GstLFOControlSource get a new inst... |
| ProxyControlBinding | Gst.ControlBinding | 0 | 0 | 1 | A #GstControlBinding that forwards requests to another #GstControlBinding |
| TimedValueControlSource | Gst.ControlSource | 2 | 3 | 7 | Base class for #GstControlSource that use time-stamped values. When overriding bind, chain up first to give this bind implementation a chance to se... |
| TriggerControlSource | TimedValueControlSource | 0 | 0 | 1 | #GstTriggerControlSource is a #GstControlSource, that returns values from user-given control points. It allows for a tolerance on the time-stamps. ... |

### GstController.ARGBControlBinding

Parent: `Gst.ControlBinding` ?? GType: `GstARGBControlBinding` ?? C type: `GstARGBControlBinding`

A value mapping object that attaches multiple control sources to a guint gobject properties representing a color. A control value of 0.0 will turn ...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| cs_a | Gst.ControlSource |
| cs_b | Gst.ControlSource |
| cs_g | Gst.ControlSource |
| cs_r | Gst.ControlSource |
| cur_value | GObject.Value |
| last_value | guint32 |
| parent | Gst.ControlBinding |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ARGBControlBinding.new(object: Gst.Object, property_name: utf8, cs_a: Gst.ControlSource, cs_r: Gst.ControlSource, cs_g: Gst.ControlSource, cs_b: Gst.ControlSource) -> Gst.ControlBinding` | gst_argb_control_binding_new |  | Create a new control-binding that attaches the given #GstControlSource to the #GObject property. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| control-source-a | Gst.ControlSource | read, write |  |
| control-source-b | Gst.ControlSource | read, write |  |
| control-source-g | Gst.ControlSource | read, write |  |
| control-source-r | Gst.ControlSource | read, write |  |

### GstController.DirectControlBinding

Parent: `Gst.ControlBinding` ?? GType: `GstDirectControlBinding` ?? C type: `GstDirectControlBinding`

A value mapping object that attaches control sources to gobject properties. It will map the control values directly to the target property range. I...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| byte_size | gint |
| convert_g_value | DirectControlBindingConvertGValue |
| convert_value | DirectControlBindingConvertValue |
| cs | Gst.ControlSource |
| cur_value | GObject.Value |
| last_value | gdouble |
| parent | Gst.ControlBinding |
| want_absolute | gboolean |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DirectControlBinding.new(object: Gst.Object, property_name: utf8, cs: Gst.ControlSource) -> Gst.ControlBinding` | gst_direct_control_binding_new |  | Create a new control-binding that attaches the #GstControlSource to the #GObject property. It will map the control source range [0.0 ... 1.0] to th... |
| new_absolute | `DirectControlBinding.new_absolute(object: Gst.Object, property_name: utf8, cs: Gst.ControlSource) -> Gst.ControlBinding` | gst_direct_control_binding_new_absolute | 1.6 | Create a new control-binding that attaches the #GstControlSource to the #GObject property. It will directly map the control source values to the ta... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| absolute | gboolean | read, write, construct-only |  |
| control-source | Gst.ControlSource | read, write |  |

### GstController.InterpolationControlSource

Parent: `TimedValueControlSource` ?? GType: `GstInterpolationControlSource` ?? C type: `GstInterpolationControlSource`

#GstInterpolationControlSource is a #GstControlSource, that interpolates values between user-given control points. It supports several interpolatio...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent | TimedValueControlSource |
| priv | InterpolationControlSourcePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `InterpolationControlSource.new() -> Gst.ControlSource` | gst_interpolation_control_source_new |  | This returns a new, unbound #GstInterpolationControlSource. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| mode | InterpolationMode | read, write |  |

### GstController.LFOControlSource

Parent: `Gst.ControlSource` ?? GType: `GstLFOControlSource` ?? C type: `GstLFOControlSource`

#GstLFOControlSource is a #GstControlSource, that provides several periodic waveforms as control values. To use #GstLFOControlSource get a new inst...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| lock | GLib.Mutex |
| parent | Gst.ControlSource |
| priv | LFOControlSourcePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `LFOControlSource.new() -> Gst.ControlSource` | gst_lfo_control_source_new |  | This returns a new, unbound #GstLFOControlSource. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| amplitude | gdouble | read, write | Specifies the amplitude for the waveform of this #GstLFOControlSource. |
| frequency | gdouble | read, write | Specifies the frequency that should be used for the waveform of this #GstLFOControlSource. It should be large enough so that the period is longer t... |
| offset | gdouble | read, write | Specifies the value offset for the waveform of this #GstLFOControlSource. |
| timeshift | guint64 | read, write | Specifies the timeshift to the right that should be used for the waveform of this #GstLFOControlSource in nanoseconds. To get a n nanosecond shift ... |
| waveform | LFOWaveform | read, write | Specifies the waveform that should be used for this #GstLFOControlSource. |

### GstController.ProxyControlBinding

Parent: `Gst.ControlBinding` ?? GType: `GstProxyControlBinding` ?? C type: `GstProxyControlBinding`

A #GstControlBinding that forwards requests to another #GstControlBinding

#### Fields

| Field | Type |
| --- | --- |
| _padding | gpointer |
| parent | Gst.ControlBinding |
| property_name | utf8 |
| ref_object | GObject.WeakRef |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ProxyControlBinding.new(object: Gst.Object, property_name: utf8, ref_object: Gst.Object, ref_property_name: utf8) -> Gst.ControlBinding` | gst_proxy_control_binding_new | 1.12 | #GstProxyControlBinding forwards all access to data or `sync_values()` requests from @property_name on @object to the control binding at @ref_prope... |

### GstController.TimedValueControlSource

Parent: `Gst.ControlSource` ?? Subclasses: `InterpolationControlSource`, `TriggerControlSource` ?? GType: `GstTimedValueControlSource` ?? C type: `GstTimedValueControlSource` ?? Abstract

Base class for #GstControlSource that use time-stamped values. When overriding bind, chain up first to give this bind implementation a chance to se...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| lock | GLib.Mutex |
| nvalues | gint |
| parent | Gst.ControlSource |
| priv | TimedValueControlSourcePrivate |
| valid_cache | gboolean |
| values | GLib.Sequence |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| find_control_point_iter | `TimedValueControlSource.find_control_point_iter(timestamp: Gst.ClockTime) -> GLib.SequenceIter` | gst_timed_value_control_source_find_control_point_iter |  | Find last value before given timestamp in control point list. If all values in the control point list come after the given timestamp or no values e... |
| get_all | `TimedValueControlSource.get_all() -> GLib.List` | gst_timed_value_control_source_get_all |  | Returns a read-only copy of the list of #GstTimedValue for the given property. Free the list after done with it. |
| get_count | `TimedValueControlSource.get_count() -> gint` | gst_timed_value_control_source_get_count |  | Get the number of control points that are set. |
| set | `TimedValueControlSource.set(timestamp: Gst.ClockTime, value: gdouble) -> gboolean` | gst_timed_value_control_source_set |  | Set the value of given controller-handled property at a certain time. |
| set_from_list | `TimedValueControlSource.set_from_list(timedvalues: GLib.SList) -> gboolean` | gst_timed_value_control_source_set_from_list |  | Sets multiple timed values at once. |
| unset | `TimedValueControlSource.unset(timestamp: Gst.ClockTime) -> gboolean` | gst_timed_value_control_source_unset |  | Used to remove the value of given controller-handled property at a certain time. |
| unset_all | `TimedValueControlSource.unset_all() -> none` | gst_timed_value_control_source_unset_all |  | Used to remove all time-stamped values of given controller-handled property |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| value-added | `timed_value: ControlPoint` | none | first | 1.6 | Emitted right after the new value has been added to @self |
| value-changed | `timed_value: ControlPoint` | none | first | 1.6 | Emitted right after the new value has been set on @timed_signals |
| value-removed | `timed_value: ControlPoint` | none | first | 1.6 | Emitted when @timed_value is removed from @self |

### GstController.TriggerControlSource

Parent: `TimedValueControlSource` ?? GType: `GstTriggerControlSource` ?? C type: `GstTriggerControlSource`

#GstTriggerControlSource is a #GstControlSource, that returns values from user-given control points. It allows for a tolerance on the time-stamps. ...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent | TimedValueControlSource |
| priv | TriggerControlSourcePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TriggerControlSource.new() -> Gst.ControlSource` | gst_trigger_control_source_new |  | This returns a new, unbound #GstTriggerControlSource. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| tolerance | gint64 | read, write |  |

## Enums

### GstController.InterpolationMode

GType: `GstInterpolationMode` ?? C type: `GstInterpolationMode`

The various interpolation modes available.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cubic | 2 | cubic | cubic interpolation (natural), may overshoot the min or max values set by the control point, but is more 'curvy' |
| cubic_monotonic | 3 | cubic-monotonic | monotonic cubic interpolation, will not produce any values outside of the min-max range set by the control points (Since: 1.8) |
| linear | 1 | linear | linear interpolation |
| none | 0 | none | steps-like interpolation, default |

### GstController.LFOWaveform

GType: `GstLFOWaveform` ?? C type: `GstLFOWaveform`

The various waveform modes available.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| reverse_saw | 3 | reverse-saw | reverse saw waveform |
| saw | 2 | saw | saw waveform |
| sine | 0 | sine | sine waveform |
| square | 1 | square | square waveform |
| triangle | 4 | triangle | triangle waveform |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| abi |  | 0 | 0 | 0 |  |
| ARGBControlBindingClass |  | 0 | 0 | 0 | The class structure of #GstARGBControlBinding. |
| ControlPoint |  | 0 | 0 | 0 | An internal structure for value+time and various temporary values used for interpolation. This "inherits" from GstTimedValue. |
| cubic_monotonic |  | 0 | 0 | 0 |  |
| DirectControlBindingClass |  | 0 | 0 | 0 | The class structure of #GstDirectControlBinding. |
| InterpolationControlSourceClass |  | 0 | 0 | 0 |  |
| InterpolationControlSourcePrivate |  | 0 | 0 | 0 |  |
| LFOControlSourceClass |  | 0 | 0 | 0 |  |
| LFOControlSourcePrivate |  | 0 | 0 | 0 |  |
| ProxyControlBindingClass |  | 0 | 0 | 0 | Opaque #GstProxyControlBindingClass struct |
| TimedValueControlSourceClass |  | 0 | 0 | 0 |  |
| TimedValueControlSourcePrivate |  | 0 | 0 | 0 |  |
| TriggerControlSourceClass |  | 0 | 0 | 0 |  |
| TriggerControlSourcePrivate |  | 0 | 0 | 0 |  |

### GstController.abi

C type: `abi`

#### Fields

| Field | Type |
| --- | --- |
| want_absolute | gboolean |

### GstController.ARGBControlBindingClass

C type: `GstARGBControlBindingClass`

The class structure of #GstARGBControlBinding.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | Gst.ControlBindingClass |

### GstController.ControlPoint

GType: `GstControlPoint` ?? C type: `GstControlPoint`

An internal structure for value+time and various temporary values used for interpolation. This "inherits" from GstTimedValue.

#### Fields

| Field | Type |
| --- | --- |
| h | gdouble |
| timestamp | Gst.ClockTime |
| value | gdouble |
| z | gdouble |

### GstController.cubic_monotonic

C type: `cubic_monotonic`

#### Fields

| Field | Type |
| --- | --- |
| c1s | gdouble |
| c2s | gdouble |
| c3s | gdouble |

### GstController.DirectControlBindingClass

C type: `GstDirectControlBindingClass`

The class structure of #GstDirectControlBinding.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | Gst.ControlBindingClass |

### GstController.InterpolationControlSourceClass

C type: `GstInterpolationControlSourceClass`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | TimedValueControlSourceClass |

### GstController.InterpolationControlSourcePrivate

C type: `GstInterpolationControlSourcePrivate`

### GstController.LFOControlSourceClass

C type: `GstLFOControlSourceClass`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | Gst.ControlSourceClass |

### GstController.LFOControlSourcePrivate

C type: `GstLFOControlSourcePrivate`

### GstController.ProxyControlBindingClass

C type: `GstProxyControlBindingClass`

Opaque #GstProxyControlBindingClass struct

#### Fields

| Field | Type |
| --- | --- |
| _padding | gpointer |
| parent_class | Gst.ControlBindingClass |

### GstController.TimedValueControlSourceClass

C type: `GstTimedValueControlSourceClass`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | Gst.ControlSourceClass |

### GstController.TimedValueControlSourcePrivate

C type: `GstTimedValueControlSourcePrivate`

### GstController.TriggerControlSourceClass

C type: `GstTriggerControlSourceClass`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | TimedValueControlSourceClass |

### GstController.TriggerControlSourcePrivate

C type: `GstTriggerControlSourcePrivate`

## Unions

### GstController.ABI

C type: `ABI`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| want_absolute | gboolean |

### GstController.cache

C type: `cache`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | guint8 |
| c1s | gdouble |
| c2s | gdouble |
| c3s | gdouble |
| h | gdouble |
| z | gdouble |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| timed_value_control_invalidate_cache | `timed_value_control_invalidate_cache(self: TimedValueControlSource) -> none` | gst_timed_value_control_invalidate_cache |  | Reset the controlled value cache. |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| DirectControlBindingConvertGValue | `DirectControlBindingConvertGValue(self: DirectControlBinding, src_value: gdouble, dest_value: GObject.Value) -> none` |  |  | Function to map a control-value to the target GValue. |
| DirectControlBindingConvertValue | `DirectControlBindingConvertValue(self: DirectControlBinding, src_value: gdouble, dest_value: gpointer?) -> none` |  |  | Function to map a control-value to the target plain data type. |

