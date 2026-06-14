# GstNet 1.0

SQGI import: `import("GstNet", "1.0")`

Packages: `gstreamer-net-1.0`
Includes: `GLib-2.0`, `GModule-2.0`, `GObject-2.0`, `Gio-2.0`, `Gst-1.0`
Libraries: `libgstnet-1.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 4 |
| Interfaces | 0 |
| Records | 10 |
| Unions | 0 |
| Enums | 0 |
| Flags | 0 |
| Functions | 16 |
| Callbacks | 1 |
| Constants | 6 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| NetClientClock | Gst.SystemClock | 1 | 0 | 1 | #GstNetClientClock implements a custom #GstClock that synchronizes its time to a remote time provider such as #GstNetTimeProvider. #GstNtpClock imp... |
| NetTimeProvider | Gst.Object | 0 | 0 | 1 | This object exposes the time of a #GstClock on the network. A #GstNetTimeProvider is created with gst_net_time_provider_new() which takes a #GstClo... |
| NtpClock | NetClientClock | 0 | 0 | 1 | Create a new #GstNtpClock that will report the time provided by the NTPv4 server on @remote_address and @remote_port. |
| PtpClock | Gst.SystemClock | 0 | 0 | 1 | GstPtpClock implements a PTP (IEEE1588:2008) ordinary clock in slave-only mode, that allows a GStreamer pipeline to synchronize to a PTP network cl... |

### GstNet.NetClientClock

Parent: `Gst.SystemClock` ?? Subclasses: `NtpClock` ?? GType: `GstNetClientClock` ?? C type: `GstNetClientClock`

#GstNetClientClock implements a custom #GstClock that synchronizes its time to a remote time provider such as #GstNetTimeProvider. #GstNtpClock imp...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| clock | Gst.SystemClock |
| priv | NetClientClockPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `NetClientClock.new(name: utf8?, remote_address: utf8, remote_port: gint, base_time: Gst.ClockTime) -> Gst.Clock` | gst_net_client_clock_new |  | Create a new #GstNetClientClock that will report the time provided by the #GstNetTimeProvider on @remote_address and @remote_port. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| address | utf8 | read, write |  |
| base-time | guint64 | read, write, construct-only |  |
| bus | Gst.Bus | read, write |  |
| internal-clock | Gst.Clock | read |  |
| minimum-update-interval | guint64 | read, write |  |
| port | gint | read, write |  |
| qos-dscp | gint | read, write |  |
| round-trip-limit | guint64 | read, write |  |

### GstNet.NetTimeProvider

Parent: `Gst.Object` ?? Implements: `Gio.Initable` ?? GType: `GstNetTimeProvider` ?? C type: `GstNetTimeProvider`

This object exposes the time of a #GstClock on the network. A #GstNetTimeProvider is created with gst_net_time_provider_new() which takes a #GstClo...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent | Gst.Object |
| priv | NetTimeProviderPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `NetTimeProvider.new(clock: Gst.Clock, address: utf8?, port: gint) -> NetTimeProvider` | gst_net_time_provider_new |  | Allows network clients to get the current time of @clock. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| active | gboolean | read, write |  |
| address | utf8 | read, write, construct-only |  |
| clock | Gst.Clock | read, write, construct-only |  |
| port | gint | read, write, construct-only |  |
| qos-dscp | gint | read, write |  |

### GstNet.NtpClock

Parent: `NetClientClock` ?? GType: `GstNtpClock` ?? C type: `GstNtpClock`

Create a new #GstNtpClock that will report the time provided by the NTPv4 server on @remote_address and @remote_port.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| clock | Gst.SystemClock |
| priv | NetClientClockPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `NtpClock.new(name: utf8?, remote_address: utf8, remote_port: gint, base_time: Gst.ClockTime) -> Gst.Clock` | gst_ntp_clock_new | 1.6 | Create a new #GstNtpClock that will report the time provided by the NTPv4 server on @remote_address and @remote_port. |

### GstNet.PtpClock

Parent: `Gst.SystemClock` ?? GType: `GstPtpClock` ?? C type: `GstPtpClock`

GstPtpClock implements a PTP (IEEE1588:2008) ordinary clock in slave-only mode, that allows a GStreamer pipeline to synchronize to a PTP network cl...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| clock | Gst.SystemClock |
| priv | PtpClockPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `PtpClock.new(name: utf8, domain: guint) -> Gst.Clock` | gst_ptp_clock_new | 1.6 | Creates a new PTP clock instance that exports the PTP time of the master clock in @domain. This clock can be slaved to other clocks as needed. If g... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| domain | guint | read, write, construct-only |  |
| grandmaster-clock-id | guint64 | read |  |
| internal-clock | Gst.Clock | read |  |
| master-clock-id | guint64 | read |  |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| NetAddressMeta |  | 0 | 0 | 1 | #GstNetAddressMeta can be used to store a network address (a #GSocketAddress) in a #GstBuffer so that it network elements can track the to and from... |
| NetClientClockClass |  | 0 | 0 | 0 |  |
| NetClientClockPrivate |  | 0 | 0 | 0 |  |
| NetControlMessageMeta |  | 0 | 0 | 1 | #GstNetControlMessageMeta can be used to store control messages (ancillary data) which was received with or is to be sent alongside the buffer data... |
| NetTimePacket |  | 0 | 0 | 6 | Various functions for receiving, sending an serializing #GstNetTimePacket structures. |
| NetTimeProviderClass |  | 0 | 0 | 0 |  |
| NetTimeProviderPrivate |  | 0 | 0 | 0 |  |
| NtpClockClass |  | 0 | 0 | 0 |  |
| PtpClockClass |  | 0 | 0 | 0 | Opaque #GstPtpClockClass structure. |
| PtpClockPrivate |  | 0 | 0 | 0 |  |

### GstNet.NetAddressMeta

C type: `GstNetAddressMeta`

#GstNetAddressMeta can be used to store a network address (a #GSocketAddress) in a #GstBuffer so that it network elements can track the to and from...

#### Fields

| Field | Type |
| --- | --- |
| addr | Gio.SocketAddress |
| meta | Gst.Meta |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_info | `get_info() -> Gst.MetaInfo` | gst_net_address_meta_get_info |  |  |

### GstNet.NetClientClockClass

C type: `GstNetClientClockClass`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | Gst.SystemClockClass |

### GstNet.NetClientClockPrivate

C type: `GstNetClientClockPrivate`

### GstNet.NetControlMessageMeta

C type: `GstNetControlMessageMeta`

#GstNetControlMessageMeta can be used to store control messages (ancillary data) which was received with or is to be sent alongside the buffer data...

#### Fields

| Field | Type |
| --- | --- |
| message | Gio.SocketControlMessage |
| meta | Gst.Meta |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_info | `get_info() -> Gst.MetaInfo` | gst_net_control_message_meta_get_info |  |  |

### GstNet.NetTimePacket

GType: `GstNetTimePacket` ?? C type: `GstNetTimePacket`

Various functions for receiving, sending an serializing #GstNetTimePacket structures.

#### Fields

| Field | Type |
| --- | --- |
| local_time | Gst.ClockTime |
| remote_time | Gst.ClockTime |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `NetTimePacket.new(buffer: guint8?) -> NetTimePacket` | gst_net_time_packet_new |  | Creates a new #GstNetTimePacket from a buffer received over the network. The caller is responsible for ensuring that @buffer is at least #GST_NET_T... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| receive | `receive(socket: Gio.Socket, src_address: out Gio.SocketAddress?) -> NetTimePacket throws` | gst_net_time_packet_receive |  | Receives a #GstNetTimePacket over a socket. Handles interrupted system calls, but otherwise returns NULL on error. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `NetTimePacket.copy() -> NetTimePacket` | gst_net_time_packet_copy |  | Make a copy of @packet. |
| free | `NetTimePacket.free() -> none` | gst_net_time_packet_free |  | Free @packet. |
| send | `NetTimePacket.send(socket: Gio.Socket, dest_address: Gio.SocketAddress) -> gboolean throws` | gst_net_time_packet_send |  | Sends a #GstNetTimePacket over a socket. MT safe. |
| serialize | `NetTimePacket.serialize() -> guint8` | gst_net_time_packet_serialize |  | Serialized a #GstNetTimePacket into a newly-allocated sequence of #GST_NET_TIME_PACKET_SIZE bytes, in network byte order. The value returned is sui... |

### GstNet.NetTimeProviderClass

C type: `GstNetTimeProviderClass`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | Gst.ObjectClass |

### GstNet.NetTimeProviderPrivate

C type: `GstNetTimeProviderPrivate`

### GstNet.NtpClockClass

C type: `GstNtpClockClass`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | Gst.SystemClockClass |

### GstNet.PtpClockClass

C type: `GstPtpClockClass`

Opaque #GstPtpClockClass structure.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | Gst.SystemClockClass |

### GstNet.PtpClockPrivate

C type: `GstPtpClockPrivate`

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| buffer_add_net_address_meta | `buffer_add_net_address_meta(buffer: Gst.Buffer, addr: Gio.SocketAddress) -> NetAddressMeta` | gst_buffer_add_net_address_meta |  | Attaches @addr as metadata in a #GstNetAddressMeta to @buffer. |
| buffer_add_net_control_message_meta | `buffer_add_net_control_message_meta(buffer: Gst.Buffer, message: Gio.SocketControlMessage) -> NetControlMessageMeta` | gst_buffer_add_net_control_message_meta |  | Attaches @message as metadata in a #GstNetControlMessageMeta to @buffer. |
| buffer_get_net_address_meta | `buffer_get_net_address_meta(buffer: Gst.Buffer) -> NetAddressMeta` | gst_buffer_get_net_address_meta |  | Find the #GstNetAddressMeta on @buffer. |
| net_address_meta_api_get_type | `net_address_meta_api_get_type() -> GType` | gst_net_address_meta_api_get_type |  |  |
| net_address_meta_get_info | `net_address_meta_get_info() -> Gst.MetaInfo` | gst_net_address_meta_get_info |  |  |
| net_control_message_meta_api_get_type | `net_control_message_meta_api_get_type() -> GType` | gst_net_control_message_meta_api_get_type |  |  |
| net_control_message_meta_get_info | `net_control_message_meta_get_info() -> Gst.MetaInfo` | gst_net_control_message_meta_get_info |  |  |
| net_time_packet_receive | `net_time_packet_receive(socket: Gio.Socket, src_address: out Gio.SocketAddress?) -> NetTimePacket throws` | gst_net_time_packet_receive |  | Receives a #GstNetTimePacket over a socket. Handles interrupted system calls, but otherwise returns NULL on error. |
| net_utils_set_socket_tos | `net_utils_set_socket_tos(socket: Gio.Socket, qos_dscp: gint) -> gboolean` | gst_net_utils_set_socket_tos | 1.18 | Configures IP_TOS value of socket, i.e. sets QoS DSCP. |
| ptp_deinit | `ptp_deinit() -> none` | gst_ptp_deinit | 1.6 | Deinitialize the GStreamer PTP subsystem and stop the PTP clock. If there are any remaining GstPtpClock instances, they won't be further synchroniz... |
| ptp_init | `ptp_init(clock_id: guint64, interfaces: utf8?) -> gboolean` | gst_ptp_init | 1.6 | Initialize the GStreamer PTP subsystem and create a PTP ordinary clock in slave-only mode for all domains on the given @interfaces with the given @... |
| ptp_init_full | `ptp_init_full(config: Gst.Structure) -> gboolean` | gst_ptp_init_full | 1.24 | Initialize the GStreamer PTP subsystem and create a PTP ordinary clock in slave-only mode according to the @config. @config is a #GstStructure with... |
| ptp_is_initialized | `ptp_is_initialized() -> gboolean` | gst_ptp_is_initialized | 1.6 | Check if the GStreamer PTP clock subsystem is initialized. |
| ptp_is_supported | `ptp_is_supported() -> gboolean` | gst_ptp_is_supported | 1.6 | Check if PTP clocks are generally supported on this system, and if previous initializations did not fail. |
| ptp_statistics_callback_add | `ptp_statistics_callback_add(callback: PtpStatisticsCallback, user_data: gpointer?, destroy_data: GLib.DestroyNotify) -> gulong` | gst_ptp_statistics_callback_add | 1.6 | Installs a new statistics callback for gathering PTP statistics. See GstPtpStatisticsCallback for a list of statistics that are provided. |
| ptp_statistics_callback_remove | `ptp_statistics_callback_remove(id: gulong) -> none` | gst_ptp_statistics_callback_remove | 1.6 | Removes a PTP statistics callback that was previously added with gst_ptp_statistics_callback_add(). |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| PtpStatisticsCallback | `PtpStatisticsCallback(domain: guint8, stats: Gst.Structure, user_data: gpointer?) -> gboolean` |  |  | The statistics can be the following structures: GST_PTP_STATISTICS_NEW_DOMAIN_FOUND: "domain" G_TYPE_UINT The domain identifier of the domain "cloc... |

## Constants

| Name | Type |
| --- | --- |
| NET_TIME_PACKET_SIZE | gint |
| PTP_CLOCK_ID_NONE | guint64 |
| PTP_STATISTICS_BEST_MASTER_CLOCK_SELECTED | utf8 |
| PTP_STATISTICS_NEW_DOMAIN_FOUND | utf8 |
| PTP_STATISTICS_PATH_DELAY_MEASURED | utf8 |
| PTP_STATISTICS_TIME_UPDATED | utf8 |

