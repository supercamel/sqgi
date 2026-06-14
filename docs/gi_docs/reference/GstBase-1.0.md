# GstBase 1.0

SQGI import: `import("GstBase", "1.0")`

Packages: `gstreamer-base-1.0`
Includes: `GLib-2.0`, `GModule-2.0`, `GObject-2.0`, `Gst-1.0`
Libraries: `libgstbase-1.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 10 |
| Interfaces | 0 |
| Records | 30 |
| Unions | 1 |
| Enums | 1 |
| Flags | 3 |
| Functions | 22 |
| Callbacks | 12 |
| Constants | 4 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Adapter | GObject.Object | 0 | 0 | 30 | This class is for elements that receive buffers in an undesired size. While for example raw video contains one image per buffer, the same is not tr... |
| Aggregator | Gst.Element | 0 | 1 | 16 | Manages a set of pads with the purpose of aggregating their buffers. Control is given to the subclass when all pads have data. * Base class for mix... |
| AggregatorPad | Gst.Pad | 0 | 1 | 6 | Pads managed by a #GstAggregator subclass. This class used to live in gst-plugins-bad and was moved to core. |
| BaseParse | Gst.Element | 0 | 0 | 17 | This base class is for parser elements that process data and splits it into separate audio/video/whatever frames. It provides for: * provides one s... |
| BaseSink | Gst.Element | 0 | 0 | 32 | #GstBaseSink is the base class for sink elements in GStreamer, such as xvimagesink or filesink. It is a layer on top of #GstElement that provides a... |
| BaseSrc | Gst.Element | 1 | 0 | 23 | This is a generic base class for source elements. The following types of sources are supported: * random access sources like files * seekable sourc... |
| BaseTransform | Gst.Element | 0 | 0 | 15 | This base class is for filter elements that process data. Elements that are suitable for implementation using #GstBaseTransform are ones where the ... |
| CollectPads | Gst.Object | 0 | 0 | 24 | Manages a set of pads that operate in collect mode. This means that control is given to the manager of this object when all pads have data. * Colle... |
| DataQueue | GObject.Object | 0 | 2 | 12 | #GstDataQueue is an object that handles threadsafe queueing of objects. It also provides size-related functionality. This object should be used for... |
| PushSrc | BaseSrc | 0 | 0 | 0 | This class is mostly useful for elements that cannot do random access, or at least very slowly. The source usually prefers to push out a fixed size... |

### GstBase.Adapter

Parent: `GObject.Object` ?? GType: `GstAdapter` ?? C type: `GstAdapter`

This class is for elements that receive buffers in an undesired size. While for example raw video contains one image per buffer, the same is not tr...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Adapter.new() -> Adapter` | gst_adapter_new |  | Creates a new #GstAdapter. Free with g_object_unref(). |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| available | `Adapter.available() -> gsize` | gst_adapter_available |  | Gets the maximum amount of bytes available, that is it returns the maximum value that can be supplied to gst_adapter_map() without that function re... |
| available_fast | `Adapter.available_fast() -> gsize` | gst_adapter_available_fast |  | Gets the maximum number of bytes that are immediately available without requiring any expensive operations (like copying the data into a temporary ... |
| clear | `Adapter.clear() -> none` | gst_adapter_clear |  | Removes all buffers from @adapter. |
| copy | `Adapter.copy(dest: out guint8, offset: gsize, size: gsize) -> none` | gst_adapter_copy |  | Copies @size bytes of data starting at @offset out of the buffers contained in #GstAdapter into an array @dest provided by the caller. The array @d... |
| copy_bytes | `Adapter.copy_bytes(offset: gsize, size: gsize) -> GLib.Bytes` | gst_adapter_copy_bytes | 1.4 | Similar to gst_adapter_copy, but more suitable for language bindings. @size bytes of data starting at @offset will be copied out of the buffers con... |
| distance_from_discont | `Adapter.distance_from_discont() -> guint64` | gst_adapter_distance_from_discont | 1.10 | Get the distance in bytes since the last buffer with the %GST_BUFFER_FLAG_DISCONT flag. The distance will be reset to 0 for all buffers with %GST_B... |
| dts_at_discont | `Adapter.dts_at_discont() -> Gst.ClockTime` | gst_adapter_dts_at_discont | 1.10 | Get the DTS that was on the last buffer with the GST_BUFFER_FLAG_DISCONT flag, or GST_CLOCK_TIME_NONE. |
| flush | `Adapter.flush(flush: gsize) -> none` | gst_adapter_flush |  | Flushes the first @flush bytes in the @adapter. The caller must ensure that at least this many bytes are available. See also: gst_adapter_map(), gs... |
| get_buffer | `Adapter.get_buffer(nbytes: gsize) -> Gst.Buffer` | gst_adapter_get_buffer | 1.6 | Returns a #GstBuffer containing the first @nbytes of the @adapter, but does not flush them from the adapter. See gst_adapter_take_buffer() for deta... |
| get_buffer_fast | `Adapter.get_buffer_fast(nbytes: gsize) -> Gst.Buffer` | gst_adapter_get_buffer_fast | 1.6 | Returns a #GstBuffer containing the first @nbytes of the @adapter, but does not flush them from the adapter. See gst_adapter_take_buffer_fast() for... |
| get_buffer_list | `Adapter.get_buffer_list(nbytes: gsize) -> Gst.BufferList` | gst_adapter_get_buffer_list | 1.6 | Returns a #GstBufferList of buffers containing the first @nbytes bytes of the @adapter but does not flush them from the adapter. See gst_adapter_ta... |
| get_list | `Adapter.get_list(nbytes: gsize) -> GLib.List` | gst_adapter_get_list | 1.6 | Returns a #GList of buffers containing the first @nbytes bytes of the @adapter, but does not flush them from the adapter. See gst_adapter_take_list... |
| map | `Adapter.map(size: out gsize) -> guint8` | gst_adapter_map |  | Gets the first @size bytes stored in the @adapter. The returned pointer is valid until the next function is called on the adapter. Note that settin... |
| masked_scan_uint32 | `Adapter.masked_scan_uint32(mask: guint32, pattern: guint32, offset: gsize, size: gsize) -> gssize` | gst_adapter_masked_scan_uint32 |  | Scan for pattern @pattern with applied mask @mask in the adapter data, starting from offset @offset. The bytes in @pattern and @mask are interprete... |
| masked_scan_uint32_peek | `Adapter.masked_scan_uint32_peek(mask: guint32, pattern: guint32, offset: gsize, size: gsize, value: out guint32?) -> gssize` | gst_adapter_masked_scan_uint32_peek |  | Scan for pattern @pattern with applied mask @mask in the adapter data, starting from offset @offset. If a match is found, the value that matched is... |
| offset_at_discont | `Adapter.offset_at_discont() -> guint64` | gst_adapter_offset_at_discont | 1.10 | Get the offset that was on the last buffer with the GST_BUFFER_FLAG_DISCONT flag, or GST_BUFFER_OFFSET_NONE. |
| prev_dts | `Adapter.prev_dts(distance: out guint64?) -> Gst.ClockTime` | gst_adapter_prev_dts |  | Get the dts that was before the current byte in the adapter. When @distance is given, the amount of bytes between the dts and the current position ... |
| prev_dts_at_offset | `Adapter.prev_dts_at_offset(offset: gsize, distance: out guint64?) -> Gst.ClockTime` | gst_adapter_prev_dts_at_offset | 1.2 | Get the dts that was before the byte at offset @offset in the adapter. When @distance is given, the amount of bytes between the dts and the current... |
| prev_offset | `Adapter.prev_offset(distance: out guint64?) -> guint64` | gst_adapter_prev_offset | 1.10 | Get the offset that was before the current byte in the adapter. When @distance is given, the amount of bytes between the offset and the current pos... |
| prev_pts | `Adapter.prev_pts(distance: out guint64?) -> Gst.ClockTime` | gst_adapter_prev_pts |  | Get the pts that was before the current byte in the adapter. When @distance is given, the amount of bytes between the pts and the current position ... |
| prev_pts_at_offset | `Adapter.prev_pts_at_offset(offset: gsize, distance: out guint64?) -> Gst.ClockTime` | gst_adapter_prev_pts_at_offset | 1.2 | Get the pts that was before the byte at offset @offset in the adapter. When @distance is given, the amount of bytes between the pts and the current... |
| pts_at_discont | `Adapter.pts_at_discont() -> Gst.ClockTime` | gst_adapter_pts_at_discont | 1.10 | Get the PTS that was on the last buffer with the GST_BUFFER_FLAG_DISCONT flag, or GST_CLOCK_TIME_NONE. |
| push | `Adapter.push(buf: Gst.Buffer) -> none` | gst_adapter_push |  | Adds the data from @buf to the data stored inside @adapter and takes ownership of the buffer. |
| take | `Adapter.take(nbytes: out gsize) -> guint8` | gst_adapter_take |  | Returns a freshly allocated buffer containing the first @nbytes bytes of the @adapter. The returned bytes will be flushed from the adapter. Caller ... |
| take_buffer | `Adapter.take_buffer(nbytes: gsize) -> Gst.Buffer` | gst_adapter_take_buffer |  | Returns a #GstBuffer containing the first @nbytes bytes of the @adapter. The returned bytes will be flushed from the adapter. This function is pote... |
| take_buffer_fast | `Adapter.take_buffer_fast(nbytes: gsize) -> Gst.Buffer` | gst_adapter_take_buffer_fast | 1.2 | Returns a #GstBuffer containing the first @nbytes of the @adapter. The returned bytes will be flushed from the adapter. This function is potentiall... |
| take_buffer_list | `Adapter.take_buffer_list(nbytes: gsize) -> Gst.BufferList` | gst_adapter_take_buffer_list | 1.6 | Returns a #GstBufferList of buffers containing the first @nbytes bytes of the @adapter. The returned bytes will be flushed from the adapter. When t... |
| take_list | `Adapter.take_list(nbytes: gsize) -> GLib.List` | gst_adapter_take_list |  | Returns a #GList of buffers containing the first @nbytes bytes of the @adapter. The returned bytes will be flushed from the adapter. When the calle... |
| unmap | `Adapter.unmap() -> none` | gst_adapter_unmap |  | Releases the memory obtained with the last gst_adapter_map(). |

### GstBase.Aggregator

Parent: `Gst.Element` ?? GType: `GstAggregator` ?? C type: `GstAggregator` ?? Abstract

Manages a set of pads with the purpose of aggregating their buffers. Control is given to the subclass when all pads have data. * Base class for mix...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent | Gst.Element |
| priv | AggregatorPrivate |
| srcpad | Gst.Pad |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| finish_buffer | `Aggregator.finish_buffer(buffer: Gst.Buffer) -> Gst.FlowReturn` | gst_aggregator_finish_buffer |  | This method will push the provided output buffer downstream. If needed, mandatory events such as stream-start, caps, and segment events will be sen... |
| finish_buffer_list | `Aggregator.finish_buffer_list(bufferlist: Gst.BufferList) -> Gst.FlowReturn` | gst_aggregator_finish_buffer_list | 1.18 | This method will push the provided output buffer list downstream. If needed, mandatory events such as stream-start, caps, and segment events will b... |
| get_allocator | `Aggregator.get_allocator(allocator: out Gst.Allocator?, params: out Gst.AllocationParams?) -> none` | gst_aggregator_get_allocator |  | Lets #GstAggregator sub-classes get the memory @allocator acquired by the base class and its @params. Unref the @allocator after use it. |
| get_buffer_pool | `Aggregator.get_buffer_pool() -> Gst.BufferPool` | gst_aggregator_get_buffer_pool |  | the instance of the #GstBufferPool used by @trans; free it after use it |
| get_force_live | `Aggregator.get_force_live() -> gboolean` | gst_aggregator_get_force_live | 1.22 | Subclasses may use the return value to inform whether they should return %GST_FLOW_EOS from their aggregate implementation. |
| get_ignore_inactive_pads | `Aggregator.get_ignore_inactive_pads() -> gboolean` | gst_aggregator_get_ignore_inactive_pads | 1.20 | whether inactive pads will not be waited on |
| get_latency | `Aggregator.get_latency() -> Gst.ClockTime` | gst_aggregator_get_latency |  | Retrieves the latency values reported by @self in response to the latency query, or %GST_CLOCK_TIME_NONE if there is not live source connected and ... |
| negotiate | `Aggregator.negotiate() -> gboolean` | gst_aggregator_negotiate | 1.18 | Negotiates src pad caps with downstream elements. Unmarks GST_PAD_FLAG_NEED_RECONFIGURE in any case. But marks it again if #GstAggregatorClass::neg... |
| peek_next_sample | `Aggregator.peek_next_sample(pad: AggregatorPad) -> Gst.Sample` | gst_aggregator_peek_next_sample | 1.18 | Use this function to determine what input buffers will be aggregated to produce the next output buffer. This should only be called from a #GstAggre... |
| selected_samples | `Aggregator.selected_samples(pts: Gst.ClockTime, dts: Gst.ClockTime, duration: Gst.ClockTime, info: Gst.Structure?) -> none` | gst_aggregator_selected_samples | 1.18 | Subclasses should call this when they have prepared the buffers they will aggregate for each of their sink pads, but before using any of the proper... |
| set_force_live | `Aggregator.set_force_live(force_live: gboolean) -> none` | gst_aggregator_set_force_live | 1.22 | Subclasses should call this at construction time in order for @self to aggregate on a timeout even when no live source is connected. |
| set_ignore_inactive_pads | `Aggregator.set_ignore_inactive_pads(ignore: gboolean) -> none` | gst_aggregator_set_ignore_inactive_pads | 1.20 | Subclasses should call this when they don't want to time out waiting for a pad that hasn't yet received any buffers in live mode. #GstAggregator wi... |
| set_latency | `Aggregator.set_latency(min_latency: Gst.ClockTime, max_latency: Gst.ClockTime) -> none` | gst_aggregator_set_latency |  | Lets #GstAggregator sub-classes tell the baseclass what their internal latency is. Will also post a LATENCY message on the bus so the pipeline can ... |
| set_src_caps | `Aggregator.set_src_caps(caps: Gst.Caps) -> none` | gst_aggregator_set_src_caps |  | Sets the caps to be used on the src pad. |
| simple_get_next_time | `Aggregator.simple_get_next_time() -> Gst.ClockTime` | gst_aggregator_simple_get_next_time | 1.16 | This is a simple #GstAggregatorClass::get_next_time implementation that just looks at the #GstSegment on the srcpad of the aggregator and bases the... |
| update_segment | `Aggregator.update_segment(segment: Gst.Segment) -> none` | gst_aggregator_update_segment | 1.18 | Subclasses should use this to update the segment on their source pad, instead of directly pushing new segment events downstream. Subclasses MUST ca... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| emit-signals | gboolean | read, write | Enables the emission of signals such as #GstAggregator::samples-selected |
| latency | guint64 | read, write |  |
| min-upstream-latency | guint64 | read, write | Force minimum upstream latency (in nanoseconds). When sources with a higher latency are expected to be plugged in dynamically after the aggregator ... |
| start-time | guint64 | read, write |  |
| start-time-selection | AggregatorStartTimeSelection | read, write |  |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| samples-selected | `segment: Gst.Segment, pts: guint64, dts: guint64, duration: guint64, info: Gst.Structure?` | none | first | 1.18 | Signals that the #GstAggregator subclass has selected the next set of input samples it will aggregate. Handlers may call gst_aggregator_peek_next_s... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| aggregate | `aggregate(timeout: gboolean) -> Gst.FlowReturn` |  |  | Mandatory. Called when buffers are queued on all sinkpads. Classes should iterate the GstElement->sinkpads and peek or steal buffers from the #GstA... |
| clip | `clip(aggregator_pad: AggregatorPad, buf: Gst.Buffer) -> Gst.Buffer` |  |  | Optional. Called when a buffer is received on a sink pad, the task of clipping it and translating it to the current segment falls on the subclass. ... |
| create_new_pad | `create_new_pad(templ: Gst.PadTemplate, req_name: utf8, caps: Gst.Caps) -> AggregatorPad` |  |  | Optional. Called when a new pad needs to be created. Allows subclass that don't have a single sink pad template to provide a pad based on the provi... |
| decide_allocation | `decide_allocation(query: Gst.Query) -> gboolean` |  |  | Optional. Allows the subclass to influence the allocation choices. Setup the allocation parameters for allocating output buffers. The passed in que... |
| finish_buffer | `finish_buffer(buffer: Gst.Buffer) -> Gst.FlowReturn` |  |  | This method will push the provided output buffer downstream. If needed, mandatory events such as stream-start, caps, and segment events will be sen... |
| finish_buffer_list | `finish_buffer_list(bufferlist: Gst.BufferList) -> Gst.FlowReturn` |  | 1.18 | This method will push the provided output buffer list downstream. If needed, mandatory events such as stream-start, caps, and segment events will b... |
| fixate_src_caps | `fixate_src_caps(caps: Gst.Caps) -> Gst.Caps` |  |  | Optional. Fixate and return the src pad caps provided. The function takes ownership of @caps and returns a fixated version of @caps. @caps is not g... |
| flush | `flush() -> Gst.FlowReturn` |  |  | Optional. Called after a successful flushing seek, once all the flush stops have been received. Flush pad-specific data in #GstAggregatorPad->flush. |
| get_next_time | `get_next_time() -> Gst.ClockTime` |  |  | Optional. Called when the element needs to know the running time of the next rendered buffer for live pipelines. This causes deadline based aggrega... |
| negotiate | `negotiate() -> gboolean` |  | 1.18 | Negotiates src pad caps with downstream elements. Unmarks GST_PAD_FLAG_NEED_RECONFIGURE in any case. But marks it again if #GstAggregatorClass::neg... |
| negotiated_src_caps | `negotiated_src_caps(caps: Gst.Caps) -> gboolean` |  |  | Optional. Notifies subclasses what caps format has been negotiated |
| peek_next_sample | `peek_next_sample(aggregator_pad: AggregatorPad) -> Gst.Sample` |  | 1.18 | Use this function to determine what input buffers will be aggregated to produce the next output buffer. This should only be called from a #GstAggre... |
| propose_allocation | `propose_allocation(pad: AggregatorPad, decide_query: Gst.Query, query: Gst.Query) -> gboolean` |  |  | Optional. Allows the subclass to handle the allocation query from upstream. |
| sink_event | `sink_event(aggregator_pad: AggregatorPad, event: Gst.Event) -> gboolean` |  |  | Optional. Called when an event is received on a sink pad, the subclass should always chain up. |
| sink_event_pre_queue | `sink_event_pre_queue(aggregator_pad: AggregatorPad, event: Gst.Event) -> Gst.FlowReturn` |  |  | Optional. Called when an event is received on a sink pad before queueing up serialized events. The subclass should always chain up (Since: 1.18). |
| sink_query | `sink_query(aggregator_pad: AggregatorPad, query: Gst.Query) -> gboolean` |  |  | Optional. Called when a query is received on a sink pad, the subclass should always chain up. |
| sink_query_pre_queue | `sink_query_pre_queue(aggregator_pad: AggregatorPad, query: Gst.Query) -> gboolean` |  |  | Optional. Called when a query is received on a sink pad before queueing up serialized queries. The subclass should always chain up (Since: 1.18). |
| src_activate | `src_activate(mode: Gst.PadMode, active: gboolean) -> gboolean` |  |  | Optional. Called when the src pad is activated, it will start/stop its pad task right after that call. |
| src_event | `src_event(event: Gst.Event) -> gboolean` |  |  | Optional. Called when an event is received on the src pad, the subclass should always chain up. |
| src_query | `src_query(query: Gst.Query) -> gboolean` |  |  | Optional. Called when a query is received on the src pad, the subclass should always chain up. |
| start | `start() -> gboolean` |  |  | Optional. Called when the element goes from READY to PAUSED. The subclass should get ready to process aggregated buffers. |
| stop | `stop() -> gboolean` |  |  | Optional. Called when the element goes from PAUSED to READY. The subclass should free all resources and reset its state. |
| update_src_caps | `update_src_caps(caps: Gst.Caps, ret: out Gst.Caps?) -> Gst.FlowReturn` |  |  |  |

### GstBase.AggregatorPad

Parent: `Gst.Pad` ?? GType: `GstAggregatorPad` ?? C type: `GstAggregatorPad`

Pads managed by a #GstAggregator subclass. This class used to live in gst-plugins-bad and was moved to core.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent | Gst.Pad |
| priv | AggregatorPadPrivate |
| segment | Gst.Segment |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| drop_buffer | `AggregatorPad.drop_buffer() -> gboolean` | gst_aggregator_pad_drop_buffer |  | Drop the buffer currently queued in @pad. |
| has_buffer | `AggregatorPad.has_buffer() -> gboolean` | gst_aggregator_pad_has_buffer | 1.14.1 | This checks if a pad has a buffer available that will be returned by a call to gst_aggregator_pad_peek_buffer() or gst_aggregator_pad_pop_buffer(). |
| is_eos | `AggregatorPad.is_eos() -> gboolean` | gst_aggregator_pad_is_eos |  | %TRUE if the pad is EOS, otherwise %FALSE. |
| is_inactive | `AggregatorPad.is_inactive() -> gboolean` | gst_aggregator_pad_is_inactive | 1.20 | It is only valid to call this method from #GstAggregatorClass::aggregate() |
| peek_buffer | `AggregatorPad.peek_buffer() -> Gst.Buffer` | gst_aggregator_pad_peek_buffer |  | A reference to the buffer in @pad or NULL if no buffer was queued. You should unref the buffer after usage. |
| pop_buffer | `AggregatorPad.pop_buffer() -> Gst.Buffer` | gst_aggregator_pad_pop_buffer |  | Steal the ref to the buffer currently queued in @pad. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| emit-signals | gboolean | read, write | Enables the emission of signals such as #GstAggregatorPad::buffer-consumed |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| buffer-consumed | `object: Gst.Buffer` | none | first |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| flush | `flush(aggregator: Aggregator) -> Gst.FlowReturn` |  |  | Optional Called when the pad has received a flush stop, this is the place to flush any information specific to the pad, it allows for individual pa... |
| skip_buffer | `skip_buffer(aggregator: Aggregator, buffer: Gst.Buffer) -> gboolean` |  |  | Optional Called before input buffers are queued in the pad, return %TRUE if the buffer should be skipped. |

### GstBase.BaseParse

Parent: `Gst.Element` ?? GType: `GstBaseParse` ?? C type: `GstBaseParse` ?? Abstract

This base class is for parser elements that process data and splits it into separate audio/video/whatever frames. It provides for: * provides one s...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| element | Gst.Element |
| flags | guint |
| priv | BaseParsePrivate |
| segment | Gst.Segment |
| sinkpad | Gst.Pad |
| srcpad | Gst.Pad |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_index_entry | `BaseParse.add_index_entry(offset: guint64, ts: Gst.ClockTime, key: gboolean, force: gboolean) -> gboolean` | gst_base_parse_add_index_entry |  | Adds an entry to the index associating @offset to @ts. It is recommended to only add keyframe entries. @force allows to bypass checks, such as whet... |
| convert_default | `BaseParse.convert_default(src_format: Gst.Format, src_value: gint64, dest_format: Gst.Format, dest_value: out gint64) -> gboolean` | gst_base_parse_convert_default |  | Default implementation of #GstBaseParseClass::convert. |
| drain | `BaseParse.drain() -> none` | gst_base_parse_drain | 1.12 | Drains the adapter until it is empty. It decreases the min_frame_size to match the current adapter size and calls chain method until the adapter is... |
| finish_frame | `BaseParse.finish_frame(frame: BaseParseFrame, size: gint) -> Gst.FlowReturn` | gst_base_parse_finish_frame |  | Collects parsed data and pushes it downstream. Source pad caps must be set when this is called. If @frame's out_buffer is set, that will be used as... |
| merge_tags | `BaseParse.merge_tags(tags: Gst.TagList?, mode: Gst.TagMergeMode) -> none` | gst_base_parse_merge_tags | 1.6 | Sets the parser subclass's tags and how they should be merged with any upstream stream tags. This will override any tags previously-set with gst_ba... |
| push_frame | `BaseParse.push_frame(frame: BaseParseFrame) -> Gst.FlowReturn` | gst_base_parse_push_frame |  | Pushes the frame's buffer downstream, sends any pending events and does some timestamp and segment handling. Takes ownership of frame's buffer, tho... |
| set_average_bitrate | `BaseParse.set_average_bitrate(bitrate: guint) -> none` | gst_base_parse_set_average_bitrate |  | Optionally sets the average bitrate detected in media (if non-zero), e.g. based on metadata, as it will be posted to the application. By default, a... |
| set_duration | `BaseParse.set_duration(fmt: Gst.Format, duration: gint64, interval: gint) -> none` | gst_base_parse_set_duration |  | Sets the duration of the currently playing media. Subclass can use this when it is able to determine duration and/or notices a change in the media ... |
| set_frame_rate | `BaseParse.set_frame_rate(fps_num: guint, fps_den: guint, lead_in: guint, lead_out: guint) -> none` | gst_base_parse_set_frame_rate |  | If frames per second is configured, parser can take care of buffer duration and timestamping. When performing segment clipping, or seeking to a spe... |
| set_has_timing_info | `BaseParse.set_has_timing_info(has_timing: gboolean) -> none` | gst_base_parse_set_has_timing_info |  | Set if frames carry timing information which the subclass can (generally) parse and provide. In particular, intrinsic (rather than estimated) time ... |
| set_infer_ts | `BaseParse.set_infer_ts(infer_ts: gboolean) -> none` | gst_base_parse_set_infer_ts |  | By default, the base class might try to infer PTS from DTS and vice versa. While this is generally correct for audio data, it may not be otherwise.... |
| set_latency | `BaseParse.set_latency(min_latency: Gst.ClockTime, max_latency: Gst.ClockTime) -> none` | gst_base_parse_set_latency |  | Sets the minimum and maximum (which may likely be equal) latency introduced by the parsing process. If there is such a latency, which depends on th... |
| set_min_frame_size | `BaseParse.set_min_frame_size(min_size: guint) -> none` | gst_base_parse_set_min_frame_size |  | Subclass can use this function to tell the base class that it needs to be given buffers of at least @min_size bytes. |
| set_passthrough | `BaseParse.set_passthrough(passthrough: gboolean) -> none` | gst_base_parse_set_passthrough |  | Set if the nature of the format or configuration does not allow (much) parsing, and the parser should operate in passthrough mode (which only appli... |
| set_pts_interpolation | `BaseParse.set_pts_interpolation(pts_interpolate: gboolean) -> none` | gst_base_parse_set_pts_interpolation |  | By default, the base class will guess PTS timestamps using a simple interpolation (previous timestamp + duration), which is incorrect for data stre... |
| set_syncable | `BaseParse.set_syncable(syncable: gboolean) -> none` | gst_base_parse_set_syncable |  | Set if frame starts can be identified. This is set by default and determines whether seeking based on bitrate averages is possible for a format/str... |
| set_ts_at_offset | `BaseParse.set_ts_at_offset(offset: gsize) -> none` | gst_base_parse_set_ts_at_offset | 1.2 | This function should only be called from a @handle_frame implementation. #GstBaseParse creates initial timestamps for frames by using the last time... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| disable-passthrough | gboolean | read, write | If set to %TRUE, baseparse will unconditionally force parsing of the incoming data. This can be required in the rare cases where the incoming side-... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| convert | `convert(src_format: Gst.Format, src_value: gint64, dest_format: Gst.Format, dest_value: gint64) -> gboolean` |  |  | Optional. Convert between formats. |
| detect | `detect(buffer: Gst.Buffer) -> Gst.FlowReturn` |  |  | Optional. Called until it doesn't return GST_FLOW_OK anymore for the first buffers. Can be used by the subclass to detect the stream format. |
| get_sink_caps | `get_sink_caps(filter: Gst.Caps) -> Gst.Caps` |  |  | Optional. Allows the subclass to do its own sink get caps if needed. |
| handle_frame | `handle_frame(frame: BaseParseFrame, skipsize: out gint) -> Gst.FlowReturn` |  |  | Parses the input data into valid frames as defined by subclass which should be passed to gst_base_parse_finish_frame(). The frame's input buffer is... |
| pre_push_frame | `pre_push_frame(frame: BaseParseFrame) -> Gst.FlowReturn` |  |  | Optional. Called just prior to pushing a frame (after any pending events have been sent) to give subclass a chance to perform additional actions at... |
| set_sink_caps | `set_sink_caps(caps: Gst.Caps) -> gboolean` |  |  | Optional. Allows the subclass to be notified of the actual caps set. |
| sink_event | `sink_event(event: Gst.Event) -> gboolean` |  |  | Optional. Event handler on the sink pad. This function should chain up to the parent implementation to let the default handler run. |
| sink_query | `sink_query(query: Gst.Query) -> gboolean` |  |  | Optional. Query handler on the sink pad. This function should chain up to the parent implementation to let the default handler run (Since: 1.2) |
| src_event | `src_event(event: Gst.Event) -> gboolean` |  |  | Optional. Event handler on the source pad. Should chain up to the parent to let the default handler run. |
| src_query | `src_query(query: Gst.Query) -> gboolean` |  |  | Optional. Query handler on the source pad. Should chain up to the parent to let the default handler run (Since: 1.2) |
| start | `start() -> gboolean` |  |  | Optional. Called when the element starts processing. Allows opening external resources. |
| stop | `stop() -> gboolean` |  |  | Optional. Called when the element stops processing. Allows closing external resources. |

### GstBase.BaseSink

Parent: `Gst.Element` ?? GType: `GstBaseSink` ?? C type: `GstBaseSink` ?? Abstract

#GstBaseSink is the base class for sink elements in GStreamer, such as xvimagesink or filesink. It is a layer on top of #GstElement that provides a...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| can_activate_pull | gboolean |
| can_activate_push | gboolean |
| clock_id | Gst.ClockID |
| element | Gst.Element |
| eos | gboolean |
| flushing | gboolean |
| have_newsegment | gboolean |
| have_preroll | gboolean |
| max_lateness | gint64 |
| need_preroll | gboolean |
| offset | guint64 |
| pad_mode | Gst.PadMode |
| playing_async | gboolean |
| preroll_cond | GLib.Cond |
| preroll_lock | GLib.Mutex |
| priv | BaseSinkPrivate |
| running | gboolean |
| segment | Gst.Segment |
| sinkpad | Gst.Pad |
| sync | gboolean |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| do_preroll | `BaseSink.do_preroll(obj: Gst.MiniObject) -> Gst.FlowReturn` | gst_base_sink_do_preroll |  | If the @sink spawns its own thread for pulling buffers from upstream it should call this method after it has pulled a buffer. If the element needed... |
| get_blocksize | `BaseSink.get_blocksize() -> guint` | gst_base_sink_get_blocksize |  | Get the number of bytes that the sink will pull when it is operating in pull mode. |
| get_drop_out_of_segment | `BaseSink.get_drop_out_of_segment() -> gboolean` | gst_base_sink_get_drop_out_of_segment | 1.12 | Checks if @sink is currently configured to drop buffers which are outside the current segment |
| get_last_sample | `BaseSink.get_last_sample() -> Gst.Sample` | gst_base_sink_get_last_sample |  | Get the last sample that arrived in the sink and was used for preroll or for rendering. This property can be used to generate thumbnails. The #GstC... |
| get_latency | `BaseSink.get_latency() -> Gst.ClockTime` | gst_base_sink_get_latency |  | Get the currently configured latency. |
| get_max_bitrate | `BaseSink.get_max_bitrate() -> guint64` | gst_base_sink_get_max_bitrate | 1.2 | Get the maximum amount of bits per second that the sink will render. |
| get_max_lateness | `BaseSink.get_max_lateness() -> gint64` | gst_base_sink_get_max_lateness |  | Gets the max lateness value. See gst_base_sink_set_max_lateness() for more details. |
| get_processing_deadline | `BaseSink.get_processing_deadline() -> Gst.ClockTime` | gst_base_sink_get_processing_deadline | 1.16 | Get the processing deadline of @sink. see gst_base_sink_set_processing_deadline() for more information about the processing deadline. |
| get_render_delay | `BaseSink.get_render_delay() -> Gst.ClockTime` | gst_base_sink_get_render_delay |  | Get the render delay of @sink. see gst_base_sink_set_render_delay() for more information about the render delay. |
| get_stats | `BaseSink.get_stats() -> Gst.Structure` | gst_base_sink_get_stats | 1.18 | Return various #GstBaseSink statistics. This function returns a #GstStructure with name `application/x-gst-base-sink-stats` with the following fiel... |
| get_sync | `BaseSink.get_sync() -> gboolean` | gst_base_sink_get_sync |  | Checks if @sink is currently configured to synchronize against the clock. |
| get_throttle_time | `BaseSink.get_throttle_time() -> guint64` | gst_base_sink_get_throttle_time |  | Get the time that will be inserted between frames to control the maximum buffers per second. |
| get_ts_offset | `BaseSink.get_ts_offset() -> Gst.ClockTimeDiff` | gst_base_sink_get_ts_offset |  | Get the synchronisation offset of @sink. |
| is_async_enabled | `BaseSink.is_async_enabled() -> gboolean` | gst_base_sink_is_async_enabled |  | Checks if @sink is currently configured to perform asynchronous state changes to PAUSED. |
| is_last_sample_enabled | `BaseSink.is_last_sample_enabled() -> gboolean` | gst_base_sink_is_last_sample_enabled |  | Checks if @sink is currently configured to store the last received sample in the last-sample property. |
| is_qos_enabled | `BaseSink.is_qos_enabled() -> gboolean` | gst_base_sink_is_qos_enabled |  | Checks if @sink is currently configured to send Quality-of-Service events upstream. |
| query_latency | `BaseSink.query_latency(live: out gboolean?, upstream_live: out gboolean?, min_latency: out Gst.ClockTime?, max_latency: out Gst.ClockTime?) -> gboolean` | gst_base_sink_query_latency |  | Query the sink for the latency parameters. The latency will be queried from the upstream elements. @live will be %TRUE if @sink is configured to sy... |
| set_async_enabled | `BaseSink.set_async_enabled(enabled: gboolean) -> none` | gst_base_sink_set_async_enabled |  | Configures @sink to perform all state changes asynchronously. When async is disabled, the sink will immediately go to PAUSED instead of waiting for... |
| set_blocksize | `BaseSink.set_blocksize(blocksize: guint) -> none` | gst_base_sink_set_blocksize |  | Set the number of bytes that the sink will pull when it is operating in pull mode. |
| set_drop_out_of_segment | `BaseSink.set_drop_out_of_segment(drop_out_of_segment: gboolean) -> none` | gst_base_sink_set_drop_out_of_segment | 1.12 | Configure @sink to drop buffers which are outside the current segment |
| set_last_sample_enabled | `BaseSink.set_last_sample_enabled(enabled: gboolean) -> none` | gst_base_sink_set_last_sample_enabled |  | Configures @sink to store the last received sample in the last-sample property. |
| set_max_bitrate | `BaseSink.set_max_bitrate(max_bitrate: guint64) -> none` | gst_base_sink_set_max_bitrate | 1.2 | Set the maximum amount of bits per second that the sink will render. |
| set_max_lateness | `BaseSink.set_max_lateness(max_lateness: gint64) -> none` | gst_base_sink_set_max_lateness |  | Sets the new max lateness value to @max_lateness. This value is used to decide if a buffer should be dropped or not based on the buffer timestamp a... |
| set_processing_deadline | `BaseSink.set_processing_deadline(processing_deadline: Gst.ClockTime) -> none` | gst_base_sink_set_processing_deadline | 1.16 | Maximum amount of time (in nanoseconds) that the pipeline can take for processing the buffer. This is added to the latency of live pipelines. This ... |
| set_qos_enabled | `BaseSink.set_qos_enabled(enabled: gboolean) -> none` | gst_base_sink_set_qos_enabled |  | Configures @sink to send Quality-of-Service events upstream. |
| set_render_delay | `BaseSink.set_render_delay(delay: Gst.ClockTime) -> none` | gst_base_sink_set_render_delay |  | Set the render delay in @sink to @delay. The render delay is the time between actual rendering of a buffer and its synchronisation time. Some devic... |
| set_sync | `BaseSink.set_sync(sync: gboolean) -> none` | gst_base_sink_set_sync |  | Configures @sink to synchronize on the clock or not. When @sync is %FALSE, incoming samples will be played as fast as possible. If @sync is %TRUE, ... |
| set_throttle_time | `BaseSink.set_throttle_time(throttle: guint64) -> none` | gst_base_sink_set_throttle_time |  | Set the time that will be inserted between rendered buffers. This can be used to control the maximum buffers per second that the sink will render. |
| set_ts_offset | `BaseSink.set_ts_offset(offset: Gst.ClockTimeDiff) -> none` | gst_base_sink_set_ts_offset |  | Adjust the synchronisation of @sink with @offset. A negative value will render buffers earlier than their timestamp. A positive value will delay re... |
| wait | `BaseSink.wait(time: Gst.ClockTime, jitter: out Gst.ClockTimeDiff?) -> Gst.FlowReturn` | gst_base_sink_wait |  | This function will wait for preroll to complete and will then block until @time is reached. It is usually called by subclasses that use their own i... |
| wait_clock | `BaseSink.wait_clock(time: Gst.ClockTime, jitter: out Gst.ClockTimeDiff?) -> Gst.ClockReturn` | gst_base_sink_wait_clock |  | This function will block until @time is reached. It is usually called by subclasses that use their own internal synchronisation. If @time is not va... |
| wait_preroll | `BaseSink.wait_preroll() -> Gst.FlowReturn` | gst_base_sink_wait_preroll |  | If the #GstBaseSinkClass::render method performs its own synchronisation against the clock it must unblock when going from PLAYING to the PAUSED st... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| async | gboolean | read, write | If set to %TRUE, the basesink will perform asynchronous state changes. When set to %FALSE, the sink will not signal the parent when it prerolls. Us... |
| blocksize | guint | read, write | The amount of bytes to pull when operating in pull mode. |
| enable-last-sample | gboolean | read, write | Enable the last-sample property. If %FALSE, basesink doesn't keep a reference to the last buffer arrived and the last-sample property is always set... |
| last-sample | Gst.Sample | read | The last buffer that arrived in the sink and was used for preroll or for rendering. This property can be used to generate thumbnails. This property... |
| max-bitrate | guint64 | read, write | Control the maximum amount of bits that will be rendered per second. Setting this property to a value bigger than 0 will make the sink delay render... |
| max-lateness | gint64 | read, write |  |
| processing-deadline | guint64 | read, write | Maximum amount of time (in nanoseconds) that the pipeline can take for processing the buffer. This is added to the latency of live pipelines. |
| qos | gboolean | read, write |  |
| render-delay | guint64 | read, write | The additional delay between synchronisation and actual rendering of the media. This property will add additional latency to the device in order to... |
| stats | Gst.Structure | read | Various #GstBaseSink statistics. This property returns a #GstStructure with name `application/x-gst-base-sink-stats` with the following fields: - "... |
| sync | gboolean | read, write |  |
| throttle-time | guint64 | read, write | The time to insert between buffers. This property can be used to control the maximum amount of buffers per second to render. Setting this property ... |
| ts-offset | gint64 | read, write | Controls the final synchronisation, a negative value will render the buffer earlier while a positive value delays playback. This property can be us... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| activate_pull | `activate_pull(active: gboolean) -> gboolean` |  |  | Subclasses should override this when they can provide an alternate method of spawning a thread to drive the pipeline in pull mode. Should start or ... |
| event | `event(event: Gst.Event) -> gboolean` |  |  | Override this to handle events arriving on the sink pad |
| fixate | `fixate(caps: Gst.Caps) -> Gst.Caps` |  |  | Only useful in pull mode. Implement if you have ideas about what should be the default values for the caps you support. |
| get_caps | `get_caps(filter: Gst.Caps?) -> Gst.Caps` |  |  | Called to get sink pad caps from the subclass. |
| get_times | `get_times(buffer: Gst.Buffer, start: out Gst.ClockTime, end: out Gst.ClockTime) -> none` |  |  | Get the start and end times for syncing on this buffer. |
| prepare | `prepare(buffer: Gst.Buffer) -> Gst.FlowReturn` |  |  | Called to prepare the buffer for @render and @preroll. This function is called before synchronisation is performed. |
| prepare_list | `prepare_list(buffer_list: Gst.BufferList) -> Gst.FlowReturn` |  |  | Called to prepare the buffer list for @render_list. This function is called before synchronisation is performed. |
| preroll | `preroll(buffer: Gst.Buffer) -> Gst.FlowReturn` |  |  | Called to present the preroll buffer if desired. |
| propose_allocation | `propose_allocation(query: Gst.Query) -> gboolean` |  |  | configure the allocation query |
| query | `query(query: Gst.Query) -> gboolean` |  |  | perform a #GstQuery on the element. |
| render | `render(buffer: Gst.Buffer) -> Gst.FlowReturn` |  |  | Called when a buffer should be presented or output, at the correct moment if the #GstBaseSink has been set to sync to the clock. |
| render_list | `render_list(buffer_list: Gst.BufferList) -> Gst.FlowReturn` |  |  | Same as @render but used with buffer lists instead of buffers. |
| set_caps | `set_caps(caps: Gst.Caps) -> gboolean` |  |  | Notify subclass of changed caps |
| start | `start() -> gboolean` |  |  | Start processing. Ideal for opening resources in the subclass |
| stop | `stop() -> gboolean` |  |  | Stop processing. Subclasses should use this to close resources. |
| unlock | `unlock() -> gboolean` |  |  | Unlock any pending access to the resource. Subclasses should unblock any blocked function ASAP and call gst_base_sink_wait_preroll() |
| unlock_stop | `unlock_stop() -> gboolean` |  |  | Clear the previous unlock request. Subclasses should clear any state they set during #GstBaseSinkClass::unlock, and be ready to continue where they... |
| wait_event | `wait_event(event: Gst.Event) -> Gst.FlowReturn` |  |  | Override this to implement custom logic to wait for the event time (for events like EOS and GAP). Subclasses should always first chain up to the de... |

### GstBase.BaseSrc

Parent: `Gst.Element` ?? Subclasses: `PushSrc` ?? GType: `GstBaseSrc` ?? C type: `GstBaseSrc` ?? Abstract

This is a generic base class for source elements. The following types of sources are supported: * random access sources like files * seekable sourc...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| blocksize | guint |
| can_activate_push | gboolean |
| clock_id | Gst.ClockID |
| element | Gst.Element |
| is_live | gboolean |
| live_cond | GLib.Cond |
| live_lock | GLib.Mutex |
| live_running | gboolean |
| need_newsegment | gboolean |
| num_buffers | gint |
| num_buffers_left | gint |
| pending_seek | Gst.Event |
| priv | BaseSrcPrivate |
| random_access | gboolean |
| running | gboolean |
| segment | Gst.Segment |
| srcpad | Gst.Pad |
| typefind | gboolean |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_allocator | `BaseSrc.get_allocator(allocator: out Gst.Allocator?, params: out Gst.AllocationParams?) -> none` | gst_base_src_get_allocator |  | Lets #GstBaseSrc sub-classes to know the memory @allocator used by the base class and its @params. Unref the @allocator after usage. |
| get_blocksize | `BaseSrc.get_blocksize() -> guint` | gst_base_src_get_blocksize |  | Get the number of bytes that @src will push out with each buffer. |
| get_buffer_pool | `BaseSrc.get_buffer_pool() -> Gst.BufferPool` | gst_base_src_get_buffer_pool |  | the instance of the #GstBufferPool used by the src; unref it after usage. |
| get_do_timestamp | `BaseSrc.get_do_timestamp() -> gboolean` | gst_base_src_get_do_timestamp |  | Query if @src timestamps outgoing buffers based on the current running_time. |
| is_async | `BaseSrc.is_async() -> gboolean` | gst_base_src_is_async |  | Get the current async behaviour of @src. See also gst_base_src_set_async(). |
| is_live | `BaseSrc.is_live() -> gboolean` | gst_base_src_is_live |  | Check if an element is in live mode. |
| negotiate | `BaseSrc.negotiate() -> gboolean` | gst_base_src_negotiate | 1.18 | Negotiates src pad caps with downstream elements. Unmarks GST_PAD_FLAG_NEED_RECONFIGURE in any case. But marks it again if #GstBaseSrcClass::negoti... |
| new_seamless_segment | `BaseSrc.new_seamless_segment(start: gint64, stop: gint64, time: gint64) -> gboolean` | gst_base_src_new_seamless_segment |  | Prepare a new seamless segment for emission downstream. This function must only be called by derived sub-classes, and only from the #GstBaseSrcClas... |
| new_segment | `BaseSrc.new_segment(segment: Gst.Segment) -> gboolean` | gst_base_src_new_segment | 1.18 | Prepare a new segment for emission downstream. This function must only be called by derived sub-classes, and only from the #GstBaseSrcClass::create... |
| push_segment | `BaseSrc.push_segment(segment: Gst.Segment) -> gboolean` | gst_base_src_push_segment | 1.24 | Send a new segment downstream. This function must only be called by derived sub-classes, and only from the #GstBaseSrcClass::create function, as th... |
| query_latency | `BaseSrc.query_latency(live: out gboolean?, min_latency: out Gst.ClockTime?, max_latency: out Gst.ClockTime?) -> gboolean` | gst_base_src_query_latency |  | Query the source for the latency parameters. @live will be %TRUE when @src is configured as a live source. @min_latency and @max_latency will be se... |
| set_async | `BaseSrc.set_async(async: gboolean) -> none` | gst_base_src_set_async |  | Configure async behaviour in @src, no state change will block. The open, close, start, stop, play and pause virtual methods will be executed in a d... |
| set_automatic_eos | `BaseSrc.set_automatic_eos(automatic_eos: gboolean) -> none` | gst_base_src_set_automatic_eos | 1.4 | If @automatic_eos is %TRUE, @src will automatically go EOS if a buffer after the total size is returned. By default this is %TRUE but sources that ... |
| set_blocksize | `BaseSrc.set_blocksize(blocksize: guint) -> none` | gst_base_src_set_blocksize |  | Set the number of bytes that @src will push out with each buffer. When @blocksize is set to -1, a default length will be used. |
| set_caps | `BaseSrc.set_caps(caps: Gst.Caps) -> gboolean` | gst_base_src_set_caps |  | Set new caps on the basesrc source pad. |
| set_do_timestamp | `BaseSrc.set_do_timestamp(timestamp: gboolean) -> none` | gst_base_src_set_do_timestamp |  | Configure @src to automatically timestamp outgoing buffers based on the current running_time of the pipeline. This property is mostly useful for li... |
| set_dynamic_size | `BaseSrc.set_dynamic_size(dynamic: gboolean) -> none` | gst_base_src_set_dynamic_size |  | If not @dynamic, size is only updated when needed, such as when trying to read past current tracked size. Otherwise, size is checked for upon each ... |
| set_format | `BaseSrc.set_format(format: Gst.Format) -> none` | gst_base_src_set_format |  | Sets the default format of the source. This will be the format used for sending SEGMENT events and for performing seeks. If a format of GST_FORMAT_... |
| set_live | `BaseSrc.set_live(live: gboolean) -> none` | gst_base_src_set_live |  | If the element listens to a live source, @live should be set to %TRUE. A live source will not produce data in the PAUSED state and will therefore n... |
| start_complete | `BaseSrc.start_complete(ret: Gst.FlowReturn) -> none` | gst_base_src_start_complete |  | Complete an asynchronous start operation. When the subclass overrides the start method, it should call gst_base_src_start_complete() when the start... |
| start_wait | `BaseSrc.start_wait() -> Gst.FlowReturn` | gst_base_src_start_wait |  | Wait until the start operation completes. |
| submit_buffer_list | `BaseSrc.submit_buffer_list(buffer_list: Gst.BufferList) -> none` | gst_base_src_submit_buffer_list | 1.14 | Subclasses can call this from their create virtual method implementation to submit a buffer list to be pushed out later. This is useful in cases wh... |
| wait_playing | `BaseSrc.wait_playing() -> Gst.FlowReturn` | gst_base_src_wait_playing |  | If the #GstBaseSrcClass::create method performs its own synchronisation against the clock it must unblock when going from PLAYING to the PAUSED sta... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| automatic-eos | gboolean | read, write | See gst_base_src_set_automatic_eos() |
| blocksize | guint | read, write |  |
| do-timestamp | gboolean | read, write |  |
| num-buffers | gint | read, write |  |
| typefind | gboolean | read, write |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `alloc(offset: guint64, size: guint, buf: out Gst.Buffer?) -> Gst.FlowReturn` |  |  | Ask the subclass to allocate an output buffer with @offset and @size, the default implementation will use the negotiated allocator. |
| create | `create(offset: guint64, size: guint, buf: inout Gst.Buffer?) -> Gst.FlowReturn` |  |  | Ask the subclass to create a buffer with @offset and @size, the default implementation will call alloc if no allocated @buf is provided and then ca... |
| decide_allocation | `decide_allocation(query: Gst.Query) -> gboolean` |  |  | configure the allocation query |
| do_seek | `do_seek(segment: Gst.Segment) -> gboolean` |  |  | Perform seeking on the resource to the indicated segment. |
| event | `event(event: Gst.Event) -> gboolean` |  |  | Override this to implement custom event handling. |
| fill | `fill(offset: guint64, size: guint, buf: Gst.Buffer) -> Gst.FlowReturn` |  |  | Ask the subclass to fill the buffer with data for offset and size. The passed buffer is guaranteed to hold the requested amount of bytes. |
| fixate | `fixate(caps: Gst.Caps) -> Gst.Caps` |  |  | Called if, in negotiation, caps need fixating. |
| get_caps | `get_caps(filter: Gst.Caps?) -> Gst.Caps` |  |  | Called to get the caps to report. |
| get_size | `get_size(size: out guint64) -> gboolean` |  |  | Get the total size of the resource in the format set by gst_base_src_set_format(). |
| get_times | `get_times(buffer: Gst.Buffer, start: out Gst.ClockTime, end: out Gst.ClockTime) -> none` |  |  | Given @buffer, return @start and @end time when it should be pushed out. The base class will sync on the clock using these times. |
| is_seekable | `is_seekable() -> gboolean` |  |  | Check if the source can seek |
| negotiate | `negotiate() -> gboolean` |  | 1.18 | Negotiates src pad caps with downstream elements. Unmarks GST_PAD_FLAG_NEED_RECONFIGURE in any case. But marks it again if #GstBaseSrcClass::negoti... |
| prepare_seek_segment | `prepare_seek_segment(seek: Gst.Event, segment: Gst.Segment) -> gboolean` |  |  | Prepare the #GstSegment that will be passed to the #GstBaseSrcClass::do_seek vmethod for executing a seek request. Sub-classes should override this... |
| query | `query(query: Gst.Query) -> gboolean` |  |  | Handle a requested query. |
| set_caps | `set_caps(caps: Gst.Caps) -> gboolean` |  |  | Set new caps on the basesrc source pad. |
| start | `start() -> gboolean` |  |  | Start processing. Subclasses should open resources and prepare to produce data. Implementation should call gst_base_src_start_complete() when the o... |
| stop | `stop() -> gboolean` |  |  | Stop processing. Subclasses should use this to close resources. |
| unlock | `unlock() -> gboolean` |  |  | Unlock any pending access to the resource. Subclasses should unblock any blocked function ASAP. In particular, any `create()` function in progress ... |
| unlock_stop | `unlock_stop() -> gboolean` |  |  | Clear the previous unlock request. Subclasses should clear any state they set during #GstBaseSrcClass::unlock, such as clearing command queues. |

### GstBase.BaseTransform

Parent: `Gst.Element` ?? GType: `GstBaseTransform` ?? C type: `GstBaseTransform` ?? Abstract

This base class is for filter elements that process data. Elements that are suitable for implementation using #GstBaseTransform are ones where the ...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| element | Gst.Element |
| have_segment | gboolean |
| priv | BaseTransformPrivate |
| queued_buf | Gst.Buffer |
| segment | Gst.Segment |
| sinkpad | Gst.Pad |
| srcpad | Gst.Pad |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_allocator | `BaseTransform.get_allocator(allocator: out Gst.Allocator?, params: out Gst.AllocationParams?) -> none` | gst_base_transform_get_allocator |  | Lets #GstBaseTransform sub-classes know the memory @allocator used by the base class and its @params. Unref the @allocator after use. |
| get_buffer_pool | `BaseTransform.get_buffer_pool() -> Gst.BufferPool` | gst_base_transform_get_buffer_pool |  | the instance of the #GstBufferPool used by @trans; free it after use |
| is_in_place | `BaseTransform.is_in_place() -> gboolean` | gst_base_transform_is_in_place |  | See if @trans is configured as a in_place transform. |
| is_passthrough | `BaseTransform.is_passthrough() -> gboolean` | gst_base_transform_is_passthrough |  | See if @trans is configured as a passthrough transform. |
| is_qos_enabled | `BaseTransform.is_qos_enabled() -> gboolean` | gst_base_transform_is_qos_enabled |  | Queries if the transform will handle QoS. |
| reconfigure | `BaseTransform.reconfigure() -> gboolean` | gst_base_transform_reconfigure | 1.18 | Negotiates src pad caps with downstream elements if the source pad is marked as needing reconfiguring. Unmarks GST_PAD_FLAG_NEED_RECONFIGURE in any... |
| reconfigure_sink | `BaseTransform.reconfigure_sink() -> none` | gst_base_transform_reconfigure_sink |  | Instructs @trans to request renegotiation upstream. This function is typically called after properties on the transform were set that influence the... |
| reconfigure_src | `BaseTransform.reconfigure_src() -> none` | gst_base_transform_reconfigure_src |  | Instructs @trans to renegotiate a new downstream transform on the next buffer. This function is typically called after properties on the transform ... |
| set_gap_aware | `BaseTransform.set_gap_aware(gap_aware: gboolean) -> none` | gst_base_transform_set_gap_aware |  | If @gap_aware is %FALSE (the default), output buffers will have the %GST_BUFFER_FLAG_GAP flag unset. If set to %TRUE, the element must handle outpu... |
| set_in_place | `BaseTransform.set_in_place(in_place: gboolean) -> none` | gst_base_transform_set_in_place |  | Determines whether a non-writable buffer will be copied before passing to the transform_ip function. * Always %TRUE if no transform function is imp... |
| set_passthrough | `BaseTransform.set_passthrough(passthrough: gboolean) -> none` | gst_base_transform_set_passthrough |  | Set passthrough mode for this filter by default. This is mostly useful for filters that do not care about negotiation. Always %TRUE for filters whi... |
| set_prefer_passthrough | `BaseTransform.set_prefer_passthrough(prefer_passthrough: gboolean) -> none` | gst_base_transform_set_prefer_passthrough | 1.0.1 | If @prefer_passthrough is %TRUE (the default), @trans will check and prefer passthrough caps from the list of caps returned by the transform_caps v... |
| set_qos_enabled | `BaseTransform.set_qos_enabled(enabled: gboolean) -> none` | gst_base_transform_set_qos_enabled |  | Enable or disable QoS handling in the transform. MT safe. |
| update_qos | `BaseTransform.update_qos(proportion: gdouble, diff: Gst.ClockTimeDiff, timestamp: Gst.ClockTime) -> none` | gst_base_transform_update_qos |  | Set the QoS parameters in the transform. This function is called internally when a QOS event is received but subclasses can provide custom informat... |
| update_src_caps | `BaseTransform.update_src_caps(updated_caps: Gst.Caps) -> gboolean` | gst_base_transform_update_src_caps | 1.6 | Updates the srcpad caps and sends the caps downstream. This function can be used by subclasses when they have already negotiated their caps but fou... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| qos | gboolean | read, write |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| accept_caps | `accept_caps(direction: Gst.PadDirection, caps: Gst.Caps) -> gboolean` |  |  | Optional. Subclasses can override this method to check if @caps can be handled by the element. The default implementation might not be the most opt... |
| before_transform | `before_transform(buffer: Gst.Buffer) -> none` |  |  | Optional. This method is called right before the base class will start processing. Dynamic properties or other delayed configuration could be perfo... |
| copy_metadata | `copy_metadata(input: Gst.Buffer, outbuf: Gst.Buffer) -> gboolean` |  |  | Optional. Copy the metadata from the input buffer to the output buffer. The default implementation will copy the flags, timestamps and offsets of t... |
| decide_allocation | `decide_allocation(query: Gst.Query) -> gboolean` |  |  | Setup the allocation parameters for allocating output buffers. The passed in query contains the result of the downstream allocation query. This fun... |
| filter_meta | `filter_meta(query: Gst.Query, api: GType, params: Gst.Structure) -> gboolean` |  |  | Return %TRUE if the metadata API should be proposed in the upstream allocation query. The default implementation is %NULL and will cause all metada... |
| fixate_caps | `fixate_caps(direction: Gst.PadDirection, caps: Gst.Caps, othercaps: Gst.Caps) -> Gst.Caps` |  |  |  |
| generate_output | `generate_output(outbuf: out Gst.Buffer) -> Gst.FlowReturn` |  |  |  |
| get_unit_size | `get_unit_size(caps: Gst.Caps, size: out gsize) -> gboolean` |  |  |  |
| prepare_output_buffer | `prepare_output_buffer(input: Gst.Buffer, outbuf: out Gst.Buffer) -> Gst.FlowReturn` |  |  |  |
| propose_allocation | `propose_allocation(decide_query: Gst.Query, query: Gst.Query) -> gboolean` |  |  | Propose buffer allocation parameters for upstream elements. This function must be implemented if the element reads or writes the buffer content. Th... |
| query | `query(direction: Gst.PadDirection, query: Gst.Query) -> gboolean` |  |  | Optional. Handle a requested query. Subclasses that implement this must chain up to the parent if they didn't handle the query |
| set_caps | `set_caps(incaps: Gst.Caps, outcaps: Gst.Caps) -> gboolean` |  |  | Allows the subclass to be notified of the actual caps set. |
| sink_event | `sink_event(event: Gst.Event) -> gboolean` |  |  |  |
| src_event | `src_event(event: Gst.Event) -> gboolean` |  |  |  |
| start | `start() -> gboolean` |  |  | Optional. Called when the element starts processing. Allows opening external resources. |
| stop | `stop() -> gboolean` |  |  | Optional. Called when the element stops processing. Allows closing external resources. |
| submit_input_buffer | `submit_input_buffer(is_discont: gboolean, input: Gst.Buffer) -> Gst.FlowReturn` |  |  | Function which accepts a new input buffer and pre-processes it. The default implementation performs caps (re)negotiation, then QoS if needed, and p... |
| transform | `transform(inbuf: Gst.Buffer, outbuf: Gst.Buffer) -> Gst.FlowReturn` |  |  | Required if the element does not operate in-place. Transforms one incoming buffer to one outgoing buffer. The function is allowed to change size/ti... |
| transform_caps | `transform_caps(direction: Gst.PadDirection, caps: Gst.Caps, filter: Gst.Caps) -> Gst.Caps` |  |  | Optional. Given the pad in this direction and the given caps, what caps are allowed on the other pad in this element ? |
| transform_ip | `transform_ip(buf: Gst.Buffer) -> Gst.FlowReturn` |  |  | Required if the element operates in-place. Transform the incoming buffer in-place. |
| transform_meta | `transform_meta(outbuf: Gst.Buffer, meta: Gst.Meta, inbuf: Gst.Buffer) -> gboolean` |  |  | Optional. Transform the metadata on the input buffer to the output buffer. By default this method copies all meta without tags. Subclasses can impl... |
| transform_size | `transform_size(direction: Gst.PadDirection, caps: Gst.Caps, size: gsize, othercaps: Gst.Caps, othersize: out gsize) -> gboolean` |  |  |  |

### GstBase.CollectPads

Parent: `Gst.Object` ?? GType: `GstCollectPads` ?? C type: `GstCollectPads`

Manages a set of pads that operate in collect mode. This means that control is given to the manager of this object when all pads have data. * Colle...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| data | GLib.SList |
| object | Gst.Object |
| priv | CollectPadsPrivate |
| stream_lock | GLib.RecMutex |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `CollectPads.new() -> CollectPads` | gst_collect_pads_new |  | Create a new instance of #GstCollectPads. MT safe. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_pad | `CollectPads.add_pad(pad: Gst.Pad, size: guint, destroy_notify: CollectDataDestroyNotify, lock: gboolean) -> CollectData` | gst_collect_pads_add_pad |  | Add a pad to the collection of collect pads. The pad has to be a sinkpad. The refcount of the pad is incremented. Use gst_collect_pads_remove_pad()... |
| available | `CollectPads.available() -> guint` | gst_collect_pads_available |  | Query how much bytes can be read from each queued buffer. This means that the result of this call is the maximum number of bytes that can be read f... |
| clip_running_time | `CollectPads.clip_running_time(cdata: CollectData, buf: Gst.Buffer, outbuf: out Gst.Buffer?, user_data: gpointer?) -> Gst.FlowReturn` | gst_collect_pads_clip_running_time |  | Convenience clipping function that converts incoming buffer's timestamp to running time, or clips the buffer if outside configured segment. Since 1... |
| event_default | `CollectPads.event_default(data: CollectData, event: Gst.Event, discard: gboolean) -> gboolean` | gst_collect_pads_event_default |  | Default #GstCollectPads event handling that elements should always chain up to to ensure proper operation. Element might however indicate event sho... |
| flush | `CollectPads.flush(data: CollectData, size: guint) -> guint` | gst_collect_pads_flush |  | Flush @size bytes from the pad @data. This function should be called with @pads STREAM_LOCK held, such as in the callback. MT safe. |
| peek | `CollectPads.peek(data: CollectData) -> Gst.Buffer` | gst_collect_pads_peek |  | Peek at the buffer currently queued in @data. This function should be called with the @pads STREAM_LOCK held, such as in the callback handler. MT s... |
| pop | `CollectPads.pop(data: CollectData) -> Gst.Buffer` | gst_collect_pads_pop |  | Pop the buffer currently queued in @data. This function should be called with the @pads STREAM_LOCK held, such as in the callback handler. MT safe. |
| query_default | `CollectPads.query_default(data: CollectData, query: Gst.Query, discard: gboolean) -> gboolean` | gst_collect_pads_query_default |  | Default #GstCollectPads query handling that elements should always chain up to to ensure proper operation. Element might however indicate query sho... |
| read_buffer | `CollectPads.read_buffer(data: CollectData, size: guint) -> Gst.Buffer` | gst_collect_pads_read_buffer |  | Get a subbuffer of @size bytes from the given pad @data. This function should be called with @pads STREAM_LOCK held, such as in the callback. MT safe. |
| remove_pad | `CollectPads.remove_pad(pad: Gst.Pad) -> gboolean` | gst_collect_pads_remove_pad |  | Remove a pad from the collection of collect pads. This function will also free the #GstCollectData and all the resources that were allocated with g... |
| set_buffer_function | `CollectPads.set_buffer_function(func: CollectPadsBufferFunction, user_data: gpointer?) -> none` | gst_collect_pads_set_buffer_function |  | Set the callback function and user data that will be called with the oldest buffer when all pads have been collected, or %NULL on EOS. If a buffer ... |
| set_clip_function | `CollectPads.set_clip_function(clipfunc: CollectPadsClipFunction, user_data: gpointer?) -> none` | gst_collect_pads_set_clip_function |  | Install a clipping function that is called right after a buffer is received on a pad managed by @pads. See #GstCollectPadsClipFunction for more info. |
| set_compare_function | `CollectPads.set_compare_function(func: CollectPadsCompareFunction, user_data: gpointer?) -> none` | gst_collect_pads_set_compare_function |  | Set the timestamp comparison function. MT safe. |
| set_event_function | `CollectPads.set_event_function(func: CollectPadsEventFunction, user_data: gpointer?) -> none` | gst_collect_pads_set_event_function |  | Set the event callback function and user data that will be called when collectpads has received an event originating from one of the collected pads... |
| set_flush_function | `CollectPads.set_flush_function(func: CollectPadsFlushFunction, user_data: gpointer?) -> none` | gst_collect_pads_set_flush_function | 1.4 | Install a flush function that is called when the internal state of all pads should be flushed as part of flushing seek handling. See #GstCollectPad... |
| set_flushing | `CollectPads.set_flushing(flushing: gboolean) -> none` | gst_collect_pads_set_flushing |  | Change the flushing state of all the pads in the collection. No pad is able to accept anymore data when @flushing is %TRUE. Calling this function w... |
| set_function | `CollectPads.set_function(func: CollectPadsFunction, user_data: gpointer?) -> none` | gst_collect_pads_set_function |  | CollectPads provides a default collection algorithm that will determine the oldest buffer available on all of its pads, and then delegate to a conf... |
| set_query_function | `CollectPads.set_query_function(func: CollectPadsQueryFunction, user_data: gpointer?) -> none` | gst_collect_pads_set_query_function |  | Set the query callback function and user data that will be called after collectpads has received a query originating from one of the collected pads... |
| set_waiting | `CollectPads.set_waiting(data: CollectData, waiting: gboolean) -> none` | gst_collect_pads_set_waiting |  | Sets a pad to waiting or non-waiting mode, if at least this pad has not been created with locked waiting state, in which case nothing happens. This... |
| src_event_default | `CollectPads.src_event_default(pad: Gst.Pad, event: Gst.Event) -> gboolean` | gst_collect_pads_src_event_default | 1.4 | Default #GstCollectPads event handling for the src pad of elements. Elements can chain up to this to let flushing seek event handling be done by #G... |
| start | `CollectPads.start() -> none` | gst_collect_pads_start |  | Starts the processing of data in the collect_pads. MT safe. |
| stop | `CollectPads.stop() -> none` | gst_collect_pads_stop |  | Stops the processing of data in the collect_pads. this function will also unblock any blocking operations. MT safe. |
| take_buffer | `CollectPads.take_buffer(data: CollectData, size: guint) -> Gst.Buffer` | gst_collect_pads_take_buffer |  | Get a subbuffer of @size bytes from the given pad @data. Flushes the amount of read bytes. This function should be called with @pads STREAM_LOCK he... |

### GstBase.DataQueue

Parent: `GObject.Object` ?? GType: `GstDataQueue` ?? C type: `GstDataQueue`

#GstDataQueue is an object that handles threadsafe queueing of objects. It also provides size-related functionality. This object should be used for...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| object | GObject.Object |
| priv | DataQueuePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DataQueue.new(checkfull: DataQueueCheckFullFunction, fullcallback: DataQueueFullCallback, emptycallback: DataQueueEmptyCallback, checkdata: gpointer?) -> DataQueue` | gst_data_queue_new | 1.2 | Creates a new #GstDataQueue. If @fullcallback or @emptycallback are supplied, then the #GstDataQueue will call the respective callback to signal fu... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| drop_head | `DataQueue.drop_head(type: GType) -> gboolean` | gst_data_queue_drop_head | 1.2 | Pop and unref the head-most #GstMiniObject with the given #GType. |
| flush | `DataQueue.flush() -> none` | gst_data_queue_flush | 1.2 | Flushes all the contents of the @queue. Any call to #gst_data_queue_push and #gst_data_queue_pop will be released. MT safe. |
| get_level | `DataQueue.get_level(level: out DataQueueSize) -> none` | gst_data_queue_get_level | 1.2 | Get the current level of the queue. |
| is_empty | `DataQueue.is_empty() -> gboolean` | gst_data_queue_is_empty | 1.2 | Queries if there are any items in the @queue. MT safe. |
| is_full | `DataQueue.is_full() -> gboolean` | gst_data_queue_is_full | 1.2 | Queries if @queue is full. This check will be done using the #GstDataQueueCheckFullFunction registered with @queue. MT safe. |
| limits_changed | `DataQueue.limits_changed() -> none` | gst_data_queue_limits_changed | 1.2 | Inform the queue that the limits for the fullness check have changed and that any blocking gst_data_queue_push() should be unblocked to recheck the... |
| peek | `DataQueue.peek(item: out DataQueueItem) -> gboolean` | gst_data_queue_peek | 1.2 | Retrieves the first @item available on the @queue without removing it. If the queue is currently empty, the call will block until at least one item... |
| pop | `DataQueue.pop(item: out DataQueueItem) -> gboolean` | gst_data_queue_pop | 1.2 | Retrieves the first @item available on the @queue. If the queue is currently empty, the call will block until at least one item is available, OR th... |
| push | `DataQueue.push(item: DataQueueItem) -> gboolean` | gst_data_queue_push | 1.2 | Pushes a #GstDataQueueItem (or a structure that begins with the same fields) on the @queue. If the @queue is full, the call will block until space ... |
| push_force | `DataQueue.push_force(item: DataQueueItem) -> gboolean` | gst_data_queue_push_force | 1.2 | Pushes a #GstDataQueueItem (or a structure that begins with the same fields) on the @queue. It ignores if the @queue is full or not and forces the ... |
| set_flushing | `DataQueue.set_flushing(flushing: gboolean) -> none` | gst_data_queue_set_flushing | 1.2 | Sets the queue to flushing state if @flushing is %TRUE. If set to flushing state, any incoming data on the @queue will be discarded. Any call curre... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| current-level-bytes | guint | read |  |
| current-level-time | guint64 | read |  |
| current-level-visible | guint | read |  |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| empty | `` | none | first |  | Reports that the queue became empty (empty). A queue is empty if the total amount of visible items inside it (num-visible, time, size) is lower tha... |
| full | `` | none | first |  | Reports that the queue became full (full). A queue is full if the total amount of data inside it (num-visible, time, size) is higher than the bound... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| empty | `empty() -> none` |  |  |  |
| full | `full() -> none` |  |  |  |

### GstBase.PushSrc

Parent: `BaseSrc` ?? GType: `GstPushSrc` ?? C type: `GstPushSrc`

This class is mostly useful for elements that cannot do random access, or at least very slowly. The source usually prefers to push out a fixed size...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent | BaseSrc |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `alloc(buf: out Gst.Buffer?) -> Gst.FlowReturn` |  |  | Allocate memory for a buffer. |
| create | `create(buf: inout Gst.Buffer?) -> Gst.FlowReturn` |  |  | Ask the subclass to create a buffer, the default implementation will call alloc if no allocated @buf is provided and then call fill. |
| fill | `fill(buf: Gst.Buffer) -> Gst.FlowReturn` |  |  | Ask the subclass to fill the buffer with data. |

## Enums

### GstBase.AggregatorStartTimeSelection

GType: `GstAggregatorStartTimeSelection` ?? C type: `GstAggregatorStartTimeSelection`

Start at running time 0.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| first | 1 | first | Start at the running time of the first buffer that is received. |
| set | 2 | set | Start at the running time selected by the `start-time` property. |
| zero | 0 | zero | Start at running time 0. |

## Flags

### GstBase.BaseParseFrameFlags

C type: `GstBaseParseFrameFlags`

Flags to be used in a #GstBaseParseFrame.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| clip | 4 |  | @pre_push_frame can set this to indicate that regular segment clipping can still be performed (as opposed to any custom one having been done). |
| drop | 8 |  | indicates to @finish_frame that the the frame should be dropped (and might be handled internally by subclass) |
| new_frame | 1 |  | set by baseclass if current frame is passed for processing to the subclass for the first time (and not set on subsequent calls with same data). |
| no_frame | 2 |  | set to indicate this buffer should not be counted as frame, e.g. if this frame is dependent on a previous one. As it is not counted as a frame, bit... |
| none | 0 |  | no flag |
| queue | 16 |  | indicates to @finish_frame that the the frame should be queued for now and processed fully later when the first non-queued frame is finished |

### GstBase.BaseSrcFlags

C type: `GstBaseSrcFlags`

The #GstElement flags that a basesrc element may have.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| last | 1048576 |  | offset to define more flags |
| started | 32768 |  | has source been started |
| starting | 16384 |  | has source is starting |

### GstBase.CollectPadsStateFlags

C type: `GstCollectPadsStateFlags`

Set if collectdata's pad is EOS.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| eos | 1 |  | Set if collectdata's pad is EOS. |
| flushing | 2 |  | Set if collectdata's pad is flushing. |
| locked | 16 |  | Set collectdata's pad WAITING state must not be changed. #GstCollectPadsStateFlags indicate private state of a collectdata('s pad). |
| new_segment | 4 |  | Set if collectdata's pad received a new_segment event. |
| waiting | 8 |  | Set if collectdata's pad must be waited for when collecting. |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| AdapterClass |  | 0 | 0 | 0 |  |
| AggregatorClass |  | 0 | 0 | 0 | The aggregator base class will handle in a thread-safe way all manners of concurrent flushes, seeks, pad additions and removals, leaving to the sub... |
| AggregatorPadClass |  | 0 | 0 | 0 | Optional Called when the pad has received a flush stop, this is the place to flush any information specific to the pad, it allows for individual pa... |
| AggregatorPadPrivate |  | 0 | 0 | 0 |  |
| AggregatorPrivate |  | 0 | 0 | 0 |  |
| BaseParseClass |  | 0 | 0 | 0 | Subclasses can override any of the available virtual methods or not, as needed. At minimum @handle_frame needs to be overridden. |
| BaseParseFrame |  | 0 | 0 | 4 | Frame (context) data passed to each frame parsing virtual methods. In addition to providing the data to be checked for a valid frame or an already ... |
| BaseParsePrivate |  | 0 | 0 | 0 |  |
| BaseSinkClass |  | 0 | 0 | 0 | Subclasses can override any of the available virtual methods or not, as needed. At the minimum, the @render method should be overridden to output/p... |
| BaseSinkPrivate |  | 0 | 0 | 0 |  |
| BaseSrcClass |  | 0 | 0 | 0 | Subclasses can override any of the available virtual methods or not, as needed. At the minimum, the @create method should be overridden to produce ... |
| BaseSrcPrivate |  | 0 | 0 | 0 |  |
| BaseTransformClass |  | 0 | 0 | 0 | Subclasses can override any of the available virtual methods or not, as needed. At minimum either @transform or @transform_ip need to be overridden... |
| BaseTransformPrivate |  | 0 | 0 | 0 |  |
| BitReader |  | 0 | 0 | 17 | #GstBitReader provides a bit reader that can read any number of bits from a memory buffer. It provides functions for reading any number of bits int... |
| BitWriter |  | 0 | 0 | 22 | #GstBitWriter provides a bit writer that can write any number of bits into a memory buffer. It provides functions for writing any number of bits in... |
| ByteReader |  | 0 | 0 | 67 | #GstByteReader provides a byte reader that can read different integer and floating point types from a memory buffer. It provides functions for read... |
| ByteWriter |  | 0 | 0 | 42 | #GstByteWriter provides a byte writer and reader that can write/read different integer and floating point types to/from a memory buffer. It provide... |
| CollectData |  | 0 | 0 | 0 | Structure used by the collect_pads. |
| CollectDataPrivate |  | 0 | 0 | 0 |  |
| CollectPadsClass |  | 0 | 0 | 0 |  |
| CollectPadsPrivate |  | 0 | 0 | 0 |  |
| DataQueueClass |  | 0 | 0 | 0 |  |
| DataQueueItem |  | 0 | 0 | 0 | Structure used by #GstDataQueue. You can supply a different structure, as long as the top of the structure is identical to this structure. |
| DataQueuePrivate |  | 0 | 0 | 0 |  |
| DataQueueSize |  | 0 | 0 | 0 | Structure describing the size of a queue. |
| FlowCombiner |  | 0 | 0 | 10 | Utility struct to help handling #GstFlowReturn combination. Useful for #GstElement<!-- -->s that have multiple source pads and need to combine the ... |
| PushSrcClass |  | 0 | 0 | 0 | Subclasses can override any of the available virtual methods or not, as needed. At the minimum, the @fill method should be overridden to produce bu... |
| QueueArray |  | 0 | 0 | 25 | #GstQueueArray is an object that provides standard queue functionality based on an array instead of linked lists. This reduces the overhead caused ... |
| TypeFindData |  | 0 | 0 | 5 | The opaque #GstTypeFindData structure. |

### GstBase.AdapterClass

C type: `GstAdapterClass`

### GstBase.AggregatorClass

C type: `GstAggregatorClass`

The aggregator base class will handle in a thread-safe way all manners of concurrent flushes, seeks, pad additions and removals, leaving to the sub...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| aggregate | Gst.FlowReturn |
| clip | Gst.Buffer |
| create_new_pad | AggregatorPad |
| decide_allocation | gboolean |
| finish_buffer | Gst.FlowReturn |
| finish_buffer_list | Gst.FlowReturn |
| fixate_src_caps | Gst.Caps |
| flush | Gst.FlowReturn |
| get_next_time | Gst.ClockTime |
| negotiate | gboolean |
| negotiated_src_caps | gboolean |
| parent_class | Gst.ElementClass |
| peek_next_sample | Gst.Sample |
| propose_allocation | gboolean |
| sink_event | gboolean |
| sink_event_pre_queue | Gst.FlowReturn |
| sink_query | gboolean |
| sink_query_pre_queue | gboolean |
| src_activate | gboolean |
| src_event | gboolean |
| src_query | gboolean |
| start | gboolean |
| stop | gboolean |
| update_src_caps | Gst.FlowReturn |

### GstBase.AggregatorPadClass

C type: `GstAggregatorPadClass`

Optional Called when the pad has received a flush stop, this is the place to flush any information specific to the pad, it allows for individual pa...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| flush | Gst.FlowReturn |
| parent_class | Gst.PadClass |
| skip_buffer | gboolean |

### GstBase.AggregatorPadPrivate

C type: `GstAggregatorPadPrivate`

### GstBase.AggregatorPrivate

C type: `GstAggregatorPrivate`

### GstBase.BaseParseClass

C type: `GstBaseParseClass`

Subclasses can override any of the available virtual methods or not, as needed. At minimum @handle_frame needs to be overridden.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| convert | gboolean |
| detect | Gst.FlowReturn |
| get_sink_caps | Gst.Caps |
| handle_frame | Gst.FlowReturn |
| parent_class | Gst.ElementClass |
| pre_push_frame | Gst.FlowReturn |
| set_sink_caps | gboolean |
| sink_event | gboolean |
| sink_query | gboolean |
| src_event | gboolean |
| src_query | gboolean |
| start | gboolean |
| stop | gboolean |

### GstBase.BaseParseFrame

GType: `GstBaseParseFrame` ?? C type: `GstBaseParseFrame`

Frame (context) data passed to each frame parsing virtual methods. In addition to providing the data to be checked for a valid frame or an already ...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved_i | guint |
| _gst_reserved_p | gpointer |
| _private_flags | guint |
| buffer | Gst.Buffer |
| flags | guint |
| offset | guint64 |
| out_buffer | Gst.Buffer |
| overhead | gint |
| size | gint |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `BaseParseFrame.new(buffer: Gst.Buffer, flags: BaseParseFrameFlags, overhead: gint) -> BaseParseFrame` | gst_base_parse_frame_new |  | Allocates a new #GstBaseParseFrame. This function is mainly for bindings, elements written in C should usually allocate the frame on the stack and ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `BaseParseFrame.copy() -> BaseParseFrame` | gst_base_parse_frame_copy | 1.12.1 | Copies a #GstBaseParseFrame. |
| free | `BaseParseFrame.free() -> none` | gst_base_parse_frame_free |  | Frees the provided @frame. |
| init | `BaseParseFrame.init() -> none` | gst_base_parse_frame_init |  | Sets a #GstBaseParseFrame to initial state. Currently this means all public fields are zero-ed and a private flag is set to make sure gst_base_pars... |

### GstBase.BaseParsePrivate

C type: `GstBaseParsePrivate`

### GstBase.BaseSinkClass

C type: `GstBaseSinkClass`

Subclasses can override any of the available virtual methods or not, as needed. At the minimum, the @render method should be overridden to output/p...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| activate_pull | gboolean |
| event | gboolean |
| fixate | Gst.Caps |
| get_caps | Gst.Caps |
| get_times | none |
| parent_class | Gst.ElementClass |
| prepare | Gst.FlowReturn |
| prepare_list | Gst.FlowReturn |
| preroll | Gst.FlowReturn |
| propose_allocation | gboolean |
| query | gboolean |
| render | Gst.FlowReturn |
| render_list | Gst.FlowReturn |
| set_caps | gboolean |
| start | gboolean |
| stop | gboolean |
| unlock | gboolean |
| unlock_stop | gboolean |
| wait_event | Gst.FlowReturn |

### GstBase.BaseSinkPrivate

C type: `GstBaseSinkPrivate`

### GstBase.BaseSrcClass

C type: `GstBaseSrcClass`

Subclasses can override any of the available virtual methods or not, as needed. At the minimum, the @create method should be overridden to produce ...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| alloc | Gst.FlowReturn |
| create | Gst.FlowReturn |
| decide_allocation | gboolean |
| do_seek | gboolean |
| event | gboolean |
| fill | Gst.FlowReturn |
| fixate | Gst.Caps |
| get_caps | Gst.Caps |
| get_size | gboolean |
| get_times | none |
| is_seekable | gboolean |
| negotiate | gboolean |
| parent_class | Gst.ElementClass |
| prepare_seek_segment | gboolean |
| query | gboolean |
| set_caps | gboolean |
| start | gboolean |
| stop | gboolean |
| unlock | gboolean |
| unlock_stop | gboolean |

### GstBase.BaseSrcPrivate

C type: `GstBaseSrcPrivate`

### GstBase.BaseTransformClass

C type: `GstBaseTransformClass`

Subclasses can override any of the available virtual methods or not, as needed. At minimum either @transform or @transform_ip need to be overridden...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| accept_caps | gboolean |
| before_transform | none |
| copy_metadata | gboolean |
| decide_allocation | gboolean |
| filter_meta | gboolean |
| fixate_caps | Gst.Caps |
| generate_output | Gst.FlowReturn |
| get_unit_size | gboolean |
| parent_class | Gst.ElementClass |
| passthrough_on_same_caps | gboolean |
| prepare_output_buffer | Gst.FlowReturn |
| propose_allocation | gboolean |
| query | gboolean |
| set_caps | gboolean |
| sink_event | gboolean |
| src_event | gboolean |
| start | gboolean |
| stop | gboolean |
| submit_input_buffer | Gst.FlowReturn |
| transform | Gst.FlowReturn |
| transform_caps | Gst.Caps |
| transform_ip | Gst.FlowReturn |
| transform_ip_on_passthrough | gboolean |
| transform_meta | gboolean |
| transform_size | gboolean |

### GstBase.BaseTransformPrivate

C type: `GstBaseTransformPrivate`

### GstBase.BitReader

C type: `GstBitReader`

#GstBitReader provides a bit reader that can read any number of bits from a memory buffer. It provides functions for reading any number of bits int...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| bit | guint |
| byte | guint |
| data | guint8 |
| size | guint |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(data: guint8, size: guint) -> BitReader` | gst_bit_reader_new |  | Create a new #GstBitReader instance, which will read from @data. Free-function: gst_bit_reader_free |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free | `BitReader.free() -> none` | gst_bit_reader_free |  | Frees a #GstBitReader instance, which was previously allocated by gst_bit_reader_new(). |
| get_bits_uint16 | `BitReader.get_bits_uint16(val: out guint16, nbits: guint) -> gboolean` | gst_bit_reader_get_bits_uint16 |  | Read @nbits bits into @val and update the current position. |
| get_bits_uint32 | `BitReader.get_bits_uint32(val: out guint32, nbits: guint) -> gboolean` | gst_bit_reader_get_bits_uint32 |  | Read @nbits bits into @val and update the current position. |
| get_bits_uint64 | `BitReader.get_bits_uint64(val: out guint64, nbits: guint) -> gboolean` | gst_bit_reader_get_bits_uint64 |  | Read @nbits bits into @val and update the current position. |
| get_bits_uint8 | `BitReader.get_bits_uint8(val: out guint8, nbits: guint) -> gboolean` | gst_bit_reader_get_bits_uint8 |  | Read @nbits bits into @val and update the current position. |
| get_pos | `BitReader.get_pos() -> guint` | gst_bit_reader_get_pos |  | Returns the current position of a #GstBitReader instance in bits. |
| get_remaining | `BitReader.get_remaining() -> guint` | gst_bit_reader_get_remaining |  | Returns the remaining number of bits of a #GstBitReader instance. |
| get_size | `BitReader.get_size() -> guint` | gst_bit_reader_get_size |  | Returns the total number of bits of a #GstBitReader instance. |
| init | `BitReader.init(data: guint8, size: guint) -> none` | gst_bit_reader_init |  | Initializes a #GstBitReader instance to read from @data. This function can be called on already initialized instances. |
| peek_bits_uint16 | `BitReader.peek_bits_uint16(val: out guint16, nbits: guint) -> gboolean` | gst_bit_reader_peek_bits_uint16 |  | Read @nbits bits into @val but keep the current position. |
| peek_bits_uint32 | `BitReader.peek_bits_uint32(val: out guint32, nbits: guint) -> gboolean` | gst_bit_reader_peek_bits_uint32 |  | Read @nbits bits into @val but keep the current position. |
| peek_bits_uint64 | `BitReader.peek_bits_uint64(val: out guint64, nbits: guint) -> gboolean` | gst_bit_reader_peek_bits_uint64 |  | Read @nbits bits into @val but keep the current position. |
| peek_bits_uint8 | `BitReader.peek_bits_uint8(val: out guint8, nbits: guint) -> gboolean` | gst_bit_reader_peek_bits_uint8 |  | Read @nbits bits into @val but keep the current position. |
| set_pos | `BitReader.set_pos(pos: guint) -> gboolean` | gst_bit_reader_set_pos |  | Sets the new position of a #GstBitReader instance to @pos in bits. |
| skip | `BitReader.skip(nbits: guint) -> gboolean` | gst_bit_reader_skip |  | Skips @nbits bits of the #GstBitReader instance. |
| skip_to_byte | `BitReader.skip_to_byte() -> gboolean` | gst_bit_reader_skip_to_byte |  | Skips until the next byte. |

### GstBase.BitWriter

C type: `GstBitWriter`

#GstBitWriter provides a bit writer that can write any number of bits into a memory buffer. It provides functions for writing any number of bits in...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| auto_grow | gboolean |
| bit_capacity | guint |
| bit_size | guint |
| data | guint8 |
| owned | gboolean |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new() -> BitWriter` | gst_bit_writer_new |  | Creates a new, empty #GstBitWriter instance. Free-function: gst_bit_writer_free |
| new_with_data | `new_with_data(data: guint8, size: guint, initialized: gboolean) -> BitWriter` | gst_bit_writer_new_with_data |  | Creates a new #GstBitWriter instance with the given memory area. If @initialized is %TRUE it is possible to read @size bits from the #GstBitWriter ... |
| new_with_size | `new_with_size(size: guint32, fixed: gboolean) -> BitWriter` | gst_bit_writer_new_with_size |  | Creates a #GstBitWriter instance with the given initial data size. Free-function: gst_bit_writer_free |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| align_bytes | `BitWriter.align_bytes(trailing_bit: guint8) -> gboolean` | gst_bit_writer_align_bytes |  | Write trailing bit to align last byte of @data. @trailing_bit can only be 1 or 0. |
| free | `BitWriter.free() -> none` | gst_bit_writer_free |  | Frees @bitwriter and the allocated data inside. |
| free_and_get_buffer | `BitWriter.free_and_get_buffer() -> Gst.Buffer` | gst_bit_writer_free_and_get_buffer |  | Frees @bitwriter without destroying the internal data, which is returned as #GstBuffer. Free-function: gst_buffer_unref |
| free_and_get_data | `BitWriter.free_and_get_data() -> guint8` | gst_bit_writer_free_and_get_data |  | Frees @bitwriter without destroying the internal data, which is returned. Free-function: g_free |
| get_data | `BitWriter.get_data() -> guint8` | gst_bit_writer_get_data |  | Get written data pointer |
| get_remaining | `BitWriter.get_remaining() -> guint` | gst_bit_writer_get_remaining |  |  |
| get_size | `BitWriter.get_size() -> guint` | gst_bit_writer_get_size |  | Get size of written @data |
| init | `BitWriter.init() -> none` | gst_bit_writer_init |  | Initializes @bitwriter to an empty instance. |
| init_with_data | `BitWriter.init_with_data(data: guint8, size: guint, initialized: gboolean) -> none` | gst_bit_writer_init_with_data |  | Initializes @bitwriter with the given memory area @data. IF @initialized is %TRUE it is possible to read @size bits from the #GstBitWriter from the... |
| init_with_size | `BitWriter.init_with_size(size: guint32, fixed: gboolean) -> none` | gst_bit_writer_init_with_size |  | Initializes a #GstBitWriter instance and allocates the given data @size. |
| put_bits_uint16 | `BitWriter.put_bits_uint16(value: guint16, nbits: guint) -> gboolean` | gst_bit_writer_put_bits_uint16 |  | Write @nbits bits of @value to #GstBitWriter. |
| put_bits_uint32 | `BitWriter.put_bits_uint32(value: guint32, nbits: guint) -> gboolean` | gst_bit_writer_put_bits_uint32 |  | Write @nbits bits of @value to #GstBitWriter. |
| put_bits_uint64 | `BitWriter.put_bits_uint64(value: guint64, nbits: guint) -> gboolean` | gst_bit_writer_put_bits_uint64 |  | Write @nbits bits of @value to #GstBitWriter. |
| put_bits_uint8 | `BitWriter.put_bits_uint8(value: guint8, nbits: guint) -> gboolean` | gst_bit_writer_put_bits_uint8 |  | Write @nbits bits of @value to #GstBitWriter. |
| put_bytes | `BitWriter.put_bytes(data: guint8, nbytes: guint) -> gboolean` | gst_bit_writer_put_bytes |  | Write @nbytes bytes of @data to #GstBitWriter. |
| reset | `BitWriter.reset() -> none` | gst_bit_writer_reset |  | Resets @bitwriter and frees the data if it's owned by @bitwriter. |
| reset_and_get_buffer | `BitWriter.reset_and_get_buffer() -> Gst.Buffer` | gst_bit_writer_reset_and_get_buffer |  | Resets @bitwriter and returns the current data as #GstBuffer. Free-function: gst_buffer_unref |
| reset_and_get_data | `BitWriter.reset_and_get_data() -> guint8` | gst_bit_writer_reset_and_get_data |  | Resets @bitwriter and returns the current data. Free-function: g_free |
| set_pos | `BitWriter.set_pos(pos: guint) -> gboolean` | gst_bit_writer_set_pos |  |  |

### GstBase.ByteReader

C type: `GstByteReader`

#GstByteReader provides a byte reader that can read different integer and floating point types from a memory buffer. It provides functions for read...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| byte | guint |
| data | guint8 |
| size | guint |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(data: guint8, size: guint) -> ByteReader` | gst_byte_reader_new |  | Create a new #GstByteReader instance, which will read from @data. Free-function: gst_byte_reader_free |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| dup_data | `ByteReader.dup_data(size: out guint, val: out guint8) -> gboolean` | gst_byte_reader_dup_data |  | Free-function: g_free Returns a newly-allocated copy of the current data position if at least @size bytes are left and updates the current position... |
| dup_string_utf16 | `ByteReader.dup_string_utf16(str: out guint16) -> gboolean` | gst_byte_reader_dup_string_utf16 |  | Free-function: g_free Returns a newly-allocated copy of the current data position if there is a NUL-terminated UTF-16 string in the data (this coul... |
| dup_string_utf32 | `ByteReader.dup_string_utf32(str: out guint32) -> gboolean` | gst_byte_reader_dup_string_utf32 |  | Free-function: g_free Returns a newly-allocated copy of the current data position if there is a NUL-terminated UTF-32 string in the data (this coul... |
| dup_string_utf8 | `ByteReader.dup_string_utf8(str: out utf8) -> gboolean` | gst_byte_reader_dup_string_utf8 |  | Free-function: g_free FIXME:Reads (copies) a NUL-terminated string in the #GstByteReader instance, advancing the current position to the byte after... |
| free | `ByteReader.free() -> none` | gst_byte_reader_free |  | Frees a #GstByteReader instance, which was previously allocated by gst_byte_reader_new(). |
| get_data | `ByteReader.get_data(size: out guint, val: out guint8) -> gboolean` | gst_byte_reader_get_data |  | Returns a constant pointer to the current data position if at least @size bytes are left and updates the current position. |
| get_float32_be | `ByteReader.get_float32_be(val: out gfloat) -> gboolean` | gst_byte_reader_get_float32_be |  | Read a 32 bit big endian floating point value into @val and update the current position. |
| get_float32_le | `ByteReader.get_float32_le(val: out gfloat) -> gboolean` | gst_byte_reader_get_float32_le |  | Read a 32 bit little endian floating point value into @val and update the current position. |
| get_float64_be | `ByteReader.get_float64_be(val: out gdouble) -> gboolean` | gst_byte_reader_get_float64_be |  | Read a 64 bit big endian floating point value into @val and update the current position. |
| get_float64_le | `ByteReader.get_float64_le(val: out gdouble) -> gboolean` | gst_byte_reader_get_float64_le |  | Read a 64 bit little endian floating point value into @val and update the current position. |
| get_int16_be | `ByteReader.get_int16_be(val: out gint16) -> gboolean` | gst_byte_reader_get_int16_be |  | Read a signed 16 bit big endian integer into @val and update the current position. |
| get_int16_le | `ByteReader.get_int16_le(val: out gint16) -> gboolean` | gst_byte_reader_get_int16_le |  | Read a signed 16 bit little endian integer into @val and update the current position. |
| get_int24_be | `ByteReader.get_int24_be(val: out gint32) -> gboolean` | gst_byte_reader_get_int24_be |  | Read a signed 24 bit big endian integer into @val and update the current position. |
| get_int24_le | `ByteReader.get_int24_le(val: out gint32) -> gboolean` | gst_byte_reader_get_int24_le |  | Read a signed 24 bit little endian integer into @val and update the current position. |
| get_int32_be | `ByteReader.get_int32_be(val: out gint32) -> gboolean` | gst_byte_reader_get_int32_be |  | Read a signed 32 bit big endian integer into @val and update the current position. |
| get_int32_le | `ByteReader.get_int32_le(val: out gint32) -> gboolean` | gst_byte_reader_get_int32_le |  | Read a signed 32 bit little endian integer into @val and update the current position. |
| get_int64_be | `ByteReader.get_int64_be(val: out gint64) -> gboolean` | gst_byte_reader_get_int64_be |  | Read a signed 64 bit big endian integer into @val and update the current position. |
| get_int64_le | `ByteReader.get_int64_le(val: out gint64) -> gboolean` | gst_byte_reader_get_int64_le |  | Read a signed 64 bit little endian integer into @val and update the current position. |
| get_int8 | `ByteReader.get_int8(val: out gint8) -> gboolean` | gst_byte_reader_get_int8 |  | Read a signed 8 bit integer into @val and update the current position. |
| get_pos | `ByteReader.get_pos() -> guint` | gst_byte_reader_get_pos |  | Returns the current position of a #GstByteReader instance in bytes. |
| get_remaining | `ByteReader.get_remaining() -> guint` | gst_byte_reader_get_remaining |  | Returns the remaining number of bytes of a #GstByteReader instance. |
| get_size | `ByteReader.get_size() -> guint` | gst_byte_reader_get_size |  | Returns the total number of bytes of a #GstByteReader instance. |
| get_string_utf8 | `ByteReader.get_string_utf8(str: out utf8) -> gboolean` | gst_byte_reader_get_string_utf8 |  | Returns a constant pointer to the current data position if there is a NUL-terminated string in the data (this could be just a NUL terminator), adva... |
| get_sub_reader | `ByteReader.get_sub_reader(sub_reader: ByteReader, size: guint) -> gboolean` | gst_byte_reader_get_sub_reader | 1.6 | Initializes a #GstByteReader sub-reader instance to contain @size bytes of data from the current position of @reader. This is useful to read chunke... |
| get_uint16_be | `ByteReader.get_uint16_be(val: out guint16) -> gboolean` | gst_byte_reader_get_uint16_be |  | Read an unsigned 16 bit big endian integer into @val and update the current position. |
| get_uint16_le | `ByteReader.get_uint16_le(val: out guint16) -> gboolean` | gst_byte_reader_get_uint16_le |  | Read an unsigned 16 bit little endian integer into @val and update the current position. |
| get_uint24_be | `ByteReader.get_uint24_be(val: out guint32) -> gboolean` | gst_byte_reader_get_uint24_be |  | Read an unsigned 24 bit big endian integer into @val and update the current position. |
| get_uint24_le | `ByteReader.get_uint24_le(val: out guint32) -> gboolean` | gst_byte_reader_get_uint24_le |  | Read an unsigned 24 bit little endian integer into @val and update the current position. |
| get_uint32_be | `ByteReader.get_uint32_be(val: out guint32) -> gboolean` | gst_byte_reader_get_uint32_be |  | Read an unsigned 32 bit big endian integer into @val and update the current position. |
| get_uint32_le | `ByteReader.get_uint32_le(val: out guint32) -> gboolean` | gst_byte_reader_get_uint32_le |  | Read an unsigned 32 bit little endian integer into @val and update the current position. |
| get_uint64_be | `ByteReader.get_uint64_be(val: out guint64) -> gboolean` | gst_byte_reader_get_uint64_be |  | Read an unsigned 64 bit big endian integer into @val and update the current position. |
| get_uint64_le | `ByteReader.get_uint64_le(val: out guint64) -> gboolean` | gst_byte_reader_get_uint64_le |  | Read an unsigned 64 bit little endian integer into @val and update the current position. |
| get_uint8 | `ByteReader.get_uint8(val: out guint8) -> gboolean` | gst_byte_reader_get_uint8 |  | Read an unsigned 8 bit integer into @val and update the current position. |
| init | `ByteReader.init(data: guint8, size: guint) -> none` | gst_byte_reader_init |  | Initializes a #GstByteReader instance to read from @data. This function can be called on already initialized instances. |
| masked_scan_uint32 | `ByteReader.masked_scan_uint32(mask: guint32, pattern: guint32, offset: guint, size: guint) -> guint` | gst_byte_reader_masked_scan_uint32 |  | Scan for pattern @pattern with applied mask @mask in the byte reader data, starting from offset @offset relative to the current position. The bytes... |
| masked_scan_uint32_peek | `ByteReader.masked_scan_uint32_peek(mask: guint32, pattern: guint32, offset: guint, size: guint, value: out guint32) -> guint` | gst_byte_reader_masked_scan_uint32_peek | 1.6 | Scan for pattern @pattern with applied mask @mask in the byte reader data, starting from offset @offset relative to the current position. The bytes... |
| peek_data | `ByteReader.peek_data(size: out guint, val: out guint8) -> gboolean` | gst_byte_reader_peek_data |  | Returns a constant pointer to the current data position if at least @size bytes are left and keeps the current position. |
| peek_float32_be | `ByteReader.peek_float32_be(val: out gfloat) -> gboolean` | gst_byte_reader_peek_float32_be |  | Read a 32 bit big endian floating point value into @val but keep the current position. |
| peek_float32_le | `ByteReader.peek_float32_le(val: out gfloat) -> gboolean` | gst_byte_reader_peek_float32_le |  | Read a 32 bit little endian floating point value into @val but keep the current position. |
| peek_float64_be | `ByteReader.peek_float64_be(val: out gdouble) -> gboolean` | gst_byte_reader_peek_float64_be |  | Read a 64 bit big endian floating point value into @val but keep the current position. |
| peek_float64_le | `ByteReader.peek_float64_le(val: out gdouble) -> gboolean` | gst_byte_reader_peek_float64_le |  | Read a 64 bit little endian floating point value into @val but keep the current position. |
| peek_int16_be | `ByteReader.peek_int16_be(val: out gint16) -> gboolean` | gst_byte_reader_peek_int16_be |  | Read a signed 16 bit big endian integer into @val but keep the current position. |
| peek_int16_le | `ByteReader.peek_int16_le(val: out gint16) -> gboolean` | gst_byte_reader_peek_int16_le |  | Read a signed 16 bit little endian integer into @val but keep the current position. |
| peek_int24_be | `ByteReader.peek_int24_be(val: out gint32) -> gboolean` | gst_byte_reader_peek_int24_be |  | Read a signed 24 bit big endian integer into @val but keep the current position. |
| peek_int24_le | `ByteReader.peek_int24_le(val: out gint32) -> gboolean` | gst_byte_reader_peek_int24_le |  | Read a signed 24 bit little endian integer into @val but keep the current position. |
| peek_int32_be | `ByteReader.peek_int32_be(val: out gint32) -> gboolean` | gst_byte_reader_peek_int32_be |  | Read a signed 32 bit big endian integer into @val but keep the current position. |
| peek_int32_le | `ByteReader.peek_int32_le(val: out gint32) -> gboolean` | gst_byte_reader_peek_int32_le |  | Read a signed 32 bit little endian integer into @val but keep the current position. |
| peek_int64_be | `ByteReader.peek_int64_be(val: out gint64) -> gboolean` | gst_byte_reader_peek_int64_be |  | Read a signed 64 bit big endian integer into @val but keep the current position. |
| peek_int64_le | `ByteReader.peek_int64_le(val: out gint64) -> gboolean` | gst_byte_reader_peek_int64_le |  | Read a signed 64 bit little endian integer into @val but keep the current position. |
| peek_int8 | `ByteReader.peek_int8(val: out gint8) -> gboolean` | gst_byte_reader_peek_int8 |  | Read a signed 8 bit integer into @val but keep the current position. |
| peek_string_utf8 | `ByteReader.peek_string_utf8(str: out utf8) -> gboolean` | gst_byte_reader_peek_string_utf8 |  | Returns a constant pointer to the current data position if there is a NUL-terminated string in the data (this could be just a NUL terminator). The ... |
| peek_sub_reader | `ByteReader.peek_sub_reader(sub_reader: ByteReader, size: guint) -> gboolean` | gst_byte_reader_peek_sub_reader | 1.6 | Initializes a #GstByteReader sub-reader instance to contain @size bytes of data from the current position of @reader. This is useful to read chunke... |
| peek_uint16_be | `ByteReader.peek_uint16_be(val: out guint16) -> gboolean` | gst_byte_reader_peek_uint16_be |  | Read an unsigned 16 bit big endian integer into @val but keep the current position. |
| peek_uint16_le | `ByteReader.peek_uint16_le(val: out guint16) -> gboolean` | gst_byte_reader_peek_uint16_le |  | Read an unsigned 16 bit little endian integer into @val but keep the current position. |
| peek_uint24_be | `ByteReader.peek_uint24_be(val: out guint32) -> gboolean` | gst_byte_reader_peek_uint24_be |  | Read an unsigned 24 bit big endian integer into @val but keep the current position. |
| peek_uint24_le | `ByteReader.peek_uint24_le(val: out guint32) -> gboolean` | gst_byte_reader_peek_uint24_le |  | Read an unsigned 24 bit little endian integer into @val but keep the current position. |
| peek_uint32_be | `ByteReader.peek_uint32_be(val: out guint32) -> gboolean` | gst_byte_reader_peek_uint32_be |  | Read an unsigned 32 bit big endian integer into @val but keep the current position. |
| peek_uint32_le | `ByteReader.peek_uint32_le(val: out guint32) -> gboolean` | gst_byte_reader_peek_uint32_le |  | Read an unsigned 32 bit little endian integer into @val but keep the current position. |
| peek_uint64_be | `ByteReader.peek_uint64_be(val: out guint64) -> gboolean` | gst_byte_reader_peek_uint64_be |  | Read an unsigned 64 bit big endian integer into @val but keep the current position. |
| peek_uint64_le | `ByteReader.peek_uint64_le(val: out guint64) -> gboolean` | gst_byte_reader_peek_uint64_le |  | Read an unsigned 64 bit little endian integer into @val but keep the current position. |
| peek_uint8 | `ByteReader.peek_uint8(val: out guint8) -> gboolean` | gst_byte_reader_peek_uint8 |  | Read an unsigned 8 bit integer into @val but keep the current position. |
| set_pos | `ByteReader.set_pos(pos: guint) -> gboolean` | gst_byte_reader_set_pos |  | Sets the new position of a #GstByteReader instance to @pos in bytes. |
| skip | `ByteReader.skip(nbytes: guint) -> gboolean` | gst_byte_reader_skip |  | Skips @nbytes bytes of the #GstByteReader instance. |
| skip_string_utf16 | `ByteReader.skip_string_utf16() -> gboolean` | gst_byte_reader_skip_string_utf16 |  | Skips a NUL-terminated UTF-16 string in the #GstByteReader instance, advancing the current position to the byte after the string. No input checking... |
| skip_string_utf32 | `ByteReader.skip_string_utf32() -> gboolean` | gst_byte_reader_skip_string_utf32 |  | Skips a NUL-terminated UTF-32 string in the #GstByteReader instance, advancing the current position to the byte after the string. No input checking... |
| skip_string_utf8 | `ByteReader.skip_string_utf8() -> gboolean` | gst_byte_reader_skip_string_utf8 |  | Skips a NUL-terminated string in the #GstByteReader instance, advancing the current position to the byte after the string. This will work for any N... |

### GstBase.ByteWriter

C type: `GstByteWriter`

#GstByteWriter provides a byte writer and reader that can write/read different integer and floating point types to/from a memory buffer. It provide...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| alloc_size | guint |
| fixed | gboolean |
| owned | gboolean |
| parent | ByteReader |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new() -> ByteWriter` | gst_byte_writer_new |  | Creates a new, empty #GstByteWriter instance Free-function: gst_byte_writer_free |
| new_with_data | `new_with_data(data: guint8, size: guint, initialized: gboolean) -> ByteWriter` | gst_byte_writer_new_with_data |  | Creates a new #GstByteWriter instance with the given memory area. If @initialized is %TRUE it is possible to read @size bytes from the #GstByteWrit... |
| new_with_size | `new_with_size(size: guint, fixed: gboolean) -> ByteWriter` | gst_byte_writer_new_with_size |  | Creates a new #GstByteWriter instance with the given initial data size. Free-function: gst_byte_writer_free |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ensure_free_space | `ByteWriter.ensure_free_space(size: guint) -> gboolean` | gst_byte_writer_ensure_free_space |  | Checks if enough free space from the current write cursor is available and reallocates if necessary. |
| fill | `ByteWriter.fill(value: guint8, size: guint) -> gboolean` | gst_byte_writer_fill |  | Writes @size bytes containing @value to @writer. |
| free | `ByteWriter.free() -> none` | gst_byte_writer_free |  | Frees @writer and all memory allocated by it. |
| free_and_get_buffer | `ByteWriter.free_and_get_buffer() -> Gst.Buffer` | gst_byte_writer_free_and_get_buffer |  | Frees @writer and all memory allocated by it except the current data, which is returned as #GstBuffer. Free-function: gst_buffer_unref |
| free_and_get_data | `ByteWriter.free_and_get_data() -> guint8` | gst_byte_writer_free_and_get_data |  | Frees @writer and all memory allocated by it except the current data, which is returned. Free-function: g_free |
| get_remaining | `ByteWriter.get_remaining() -> guint` | gst_byte_writer_get_remaining |  | Returns the remaining size of data that can still be written. If -1 is returned the remaining size is only limited by system resources. |
| init | `ByteWriter.init() -> none` | gst_byte_writer_init |  | Initializes @writer to an empty instance |
| init_with_data | `ByteWriter.init_with_data(data: guint8, size: guint, initialized: gboolean) -> none` | gst_byte_writer_init_with_data |  | Initializes @writer with the given memory area. If @initialized is %TRUE it is possible to read @size bytes from the #GstByteWriter from the beginn... |
| init_with_size | `ByteWriter.init_with_size(size: guint, fixed: gboolean) -> none` | gst_byte_writer_init_with_size |  | Initializes @writer with the given initial data size. |
| put_buffer | `ByteWriter.put_buffer(buffer: Gst.Buffer, offset: gsize, size: gssize) -> gboolean` | gst_byte_writer_put_buffer |  | Writes @size bytes of @data to @writer. |
| put_data | `ByteWriter.put_data(data: guint8, size: guint) -> gboolean` | gst_byte_writer_put_data |  | Writes @size bytes of @data to @writer. |
| put_float32_be | `ByteWriter.put_float32_be(val: gfloat) -> gboolean` | gst_byte_writer_put_float32_be |  | Writes a big endian 32 bit float to @writer. |
| put_float32_le | `ByteWriter.put_float32_le(val: gfloat) -> gboolean` | gst_byte_writer_put_float32_le |  | Writes a little endian 32 bit float to @writer. |
| put_float64_be | `ByteWriter.put_float64_be(val: gdouble) -> gboolean` | gst_byte_writer_put_float64_be |  | Writes a big endian 64 bit float to @writer. |
| put_float64_le | `ByteWriter.put_float64_le(val: gdouble) -> gboolean` | gst_byte_writer_put_float64_le |  | Writes a little endian 64 bit float to @writer. |
| put_int16_be | `ByteWriter.put_int16_be(val: gint16) -> gboolean` | gst_byte_writer_put_int16_be |  | Writes a signed big endian 16 bit integer to @writer. |
| put_int16_le | `ByteWriter.put_int16_le(val: gint16) -> gboolean` | gst_byte_writer_put_int16_le |  | Writes a signed little endian 16 bit integer to @writer. |
| put_int24_be | `ByteWriter.put_int24_be(val: gint32) -> gboolean` | gst_byte_writer_put_int24_be |  | Writes a signed big endian 24 bit integer to @writer. |
| put_int24_le | `ByteWriter.put_int24_le(val: gint32) -> gboolean` | gst_byte_writer_put_int24_le |  | Writes a signed little endian 24 bit integer to @writer. |
| put_int32_be | `ByteWriter.put_int32_be(val: gint32) -> gboolean` | gst_byte_writer_put_int32_be |  | Writes a signed big endian 32 bit integer to @writer. |
| put_int32_le | `ByteWriter.put_int32_le(val: gint32) -> gboolean` | gst_byte_writer_put_int32_le |  | Writes a signed little endian 32 bit integer to @writer. |
| put_int64_be | `ByteWriter.put_int64_be(val: gint64) -> gboolean` | gst_byte_writer_put_int64_be |  | Writes a signed big endian 64 bit integer to @writer. |
| put_int64_le | `ByteWriter.put_int64_le(val: gint64) -> gboolean` | gst_byte_writer_put_int64_le |  | Writes a signed little endian 64 bit integer to @writer. |
| put_int8 | `ByteWriter.put_int8(val: gint8) -> gboolean` | gst_byte_writer_put_int8 |  | Writes a signed 8 bit integer to @writer. |
| put_string_utf16 | `ByteWriter.put_string_utf16(data: guint16) -> gboolean` | gst_byte_writer_put_string_utf16 |  | Writes a NUL-terminated UTF16 string to @writer (including the terminator). |
| put_string_utf32 | `ByteWriter.put_string_utf32(data: guint32) -> gboolean` | gst_byte_writer_put_string_utf32 |  | Writes a NUL-terminated UTF32 string to @writer (including the terminator). |
| put_string_utf8 | `ByteWriter.put_string_utf8(data: utf8) -> gboolean` | gst_byte_writer_put_string_utf8 |  | Writes a NUL-terminated UTF8 string to @writer (including the terminator). |
| put_uint16_be | `ByteWriter.put_uint16_be(val: guint16) -> gboolean` | gst_byte_writer_put_uint16_be |  | Writes a unsigned big endian 16 bit integer to @writer. |
| put_uint16_le | `ByteWriter.put_uint16_le(val: guint16) -> gboolean` | gst_byte_writer_put_uint16_le |  | Writes a unsigned little endian 16 bit integer to @writer. |
| put_uint24_be | `ByteWriter.put_uint24_be(val: guint32) -> gboolean` | gst_byte_writer_put_uint24_be |  | Writes a unsigned big endian 24 bit integer to @writer. |
| put_uint24_le | `ByteWriter.put_uint24_le(val: guint32) -> gboolean` | gst_byte_writer_put_uint24_le |  | Writes a unsigned little endian 24 bit integer to @writer. |
| put_uint32_be | `ByteWriter.put_uint32_be(val: guint32) -> gboolean` | gst_byte_writer_put_uint32_be |  | Writes a unsigned big endian 32 bit integer to @writer. |
| put_uint32_le | `ByteWriter.put_uint32_le(val: guint32) -> gboolean` | gst_byte_writer_put_uint32_le |  | Writes a unsigned little endian 32 bit integer to @writer. |
| put_uint64_be | `ByteWriter.put_uint64_be(val: guint64) -> gboolean` | gst_byte_writer_put_uint64_be |  | Writes a unsigned big endian 64 bit integer to @writer. |
| put_uint64_le | `ByteWriter.put_uint64_le(val: guint64) -> gboolean` | gst_byte_writer_put_uint64_le |  | Writes a unsigned little endian 64 bit integer to @writer. |
| put_uint8 | `ByteWriter.put_uint8(val: guint8) -> gboolean` | gst_byte_writer_put_uint8 |  | Writes a unsigned 8 bit integer to @writer. |
| reset | `ByteWriter.reset() -> none` | gst_byte_writer_reset |  | Resets @writer and frees the data if it's owned by @writer. |
| reset_and_get_buffer | `ByteWriter.reset_and_get_buffer() -> Gst.Buffer` | gst_byte_writer_reset_and_get_buffer |  | Resets @writer and returns the current data as buffer. Free-function: gst_buffer_unref |
| reset_and_get_data | `ByteWriter.reset_and_get_data() -> guint8` | gst_byte_writer_reset_and_get_data |  | Resets @writer and returns the current data. Free-function: g_free |

### GstBase.CollectData

C type: `GstCollectData`

Structure used by the collect_pads.

#### Fields

| Field | Type |
| --- | --- |
| buffer | Gst.Buffer |
| collect | CollectPads |
| dts | gint64 |
| pad | Gst.Pad |
| pos | guint |
| priv | CollectDataPrivate |
| segment | Gst.Segment |
| state | CollectPadsStateFlags |

### GstBase.CollectDataPrivate

C type: `GstCollectDataPrivate`

### GstBase.CollectPadsClass

C type: `GstCollectPadsClass`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | Gst.ObjectClass |

### GstBase.CollectPadsPrivate

C type: `GstCollectPadsPrivate`

### GstBase.DataQueueClass

C type: `GstDataQueueClass`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| empty | none |
| full | none |
| parent_class | GObject.ObjectClass |

### GstBase.DataQueueItem

C type: `GstDataQueueItem`

Structure used by #GstDataQueue. You can supply a different structure, as long as the top of the structure is identical to this structure.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| destroy | GLib.DestroyNotify |
| duration | guint64 |
| object | Gst.MiniObject |
| size | guint |
| visible | gboolean |

### GstBase.DataQueuePrivate

C type: `GstDataQueuePrivate`

### GstBase.DataQueueSize

C type: `GstDataQueueSize`

Structure describing the size of a queue.

#### Fields

| Field | Type |
| --- | --- |
| bytes | guint |
| time | guint64 |
| visible | guint |

### GstBase.FlowCombiner

GType: `GstFlowCombiner` ?? C type: `GstFlowCombiner`

Utility struct to help handling #GstFlowReturn combination. Useful for #GstElement<!-- -->s that have multiple source pads and need to combine the ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `FlowCombiner.new() -> FlowCombiner` | gst_flow_combiner_new | 1.4 | Creates a new #GstFlowCombiner, use gst_flow_combiner_free() to free it. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_pad | `FlowCombiner.add_pad(pad: Gst.Pad) -> none` | gst_flow_combiner_add_pad | 1.4 | Adds a new #GstPad to the #GstFlowCombiner. |
| clear | `FlowCombiner.clear() -> none` | gst_flow_combiner_clear | 1.6 | Removes all pads from a #GstFlowCombiner and resets it to its initial state. |
| free | `FlowCombiner.free() -> none` | gst_flow_combiner_free | 1.4 | Frees a #GstFlowCombiner struct and all its internal data. |
| ref | `FlowCombiner.ref() -> FlowCombiner` | gst_flow_combiner_ref | 1.12.1 | Increments the reference count on the #GstFlowCombiner. |
| remove_pad | `FlowCombiner.remove_pad(pad: Gst.Pad) -> none` | gst_flow_combiner_remove_pad | 1.4 | Removes a #GstPad from the #GstFlowCombiner. |
| reset | `FlowCombiner.reset() -> none` | gst_flow_combiner_reset | 1.6 | Reset flow combiner and all pads to their initial state without removing pads. |
| unref | `FlowCombiner.unref() -> none` | gst_flow_combiner_unref | 1.12.1 | Decrements the reference count on the #GstFlowCombiner. |
| update_flow | `FlowCombiner.update_flow(fret: Gst.FlowReturn) -> Gst.FlowReturn` | gst_flow_combiner_update_flow | 1.4 | Computes the combined flow return for the pads in it. The #GstFlowReturn parameter should be the last flow return update for a pad in this #GstFlow... |
| update_pad_flow | `FlowCombiner.update_pad_flow(pad: Gst.Pad, fret: Gst.FlowReturn) -> Gst.FlowReturn` | gst_flow_combiner_update_pad_flow | 1.6 | Sets the provided pad's last flow return to provided value and computes the combined flow return for the pads in it. The #GstFlowReturn parameter s... |

### GstBase.PushSrcClass

C type: `GstPushSrcClass`

Subclasses can override any of the available virtual methods or not, as needed. At the minimum, the @fill method should be overridden to produce bu...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| alloc | Gst.FlowReturn |
| create | Gst.FlowReturn |
| fill | Gst.FlowReturn |
| parent_class | BaseSrcClass |

### GstBase.QueueArray

C type: `GstQueueArray`

#GstQueueArray is an object that provides standard queue functionality based on an array instead of linked lists. This reduces the overhead caused ...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(initial_size: guint) -> QueueArray` | gst_queue_array_new | 1.2 | Allocates a new #GstQueueArray object with an initial queue size of @initial_size. |
| new_for_struct | `new_for_struct(struct_size: gsize, initial_size: guint) -> QueueArray` | gst_queue_array_new_for_struct | 1.6 | Allocates a new #GstQueueArray object for elements (e.g. structures) of size @struct_size, with an initial queue size of @initial_size. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `QueueArray.clear() -> none` | gst_queue_array_clear | 1.16 | Clears queue @array and frees all memory associated to it. |
| drop_element | `QueueArray.drop_element(idx: guint) -> gpointer` | gst_queue_array_drop_element | 1.2 | Drops the queue element at position @idx from queue @array. |
| drop_struct | `QueueArray.drop_struct(idx: guint, p_struct: gpointer?) -> gboolean` | gst_queue_array_drop_struct | 1.6 | Drops the queue element at position @idx from queue @array and copies the data of the element or structure that was removed into @p_struct if @p_st... |
| find | `QueueArray.find(func: GLib.CompareFunc?, data: gpointer?) -> guint` | gst_queue_array_find | 1.2 | Finds an element in the queue @array, either by comparing every element with @func or by looking up @data if no compare function @func is provided,... |
| free | `QueueArray.free() -> none` | gst_queue_array_free | 1.2 | Frees queue @array and all memory associated to it. |
| get_length | `QueueArray.get_length() -> guint` | gst_queue_array_get_length | 1.2 | Returns the length of the queue @array |
| is_empty | `QueueArray.is_empty() -> gboolean` | gst_queue_array_is_empty | 1.2 | Checks if the queue @array is empty. |
| peek_head | `QueueArray.peek_head() -> gpointer` | gst_queue_array_peek_head | 1.2 | Returns the head of the queue @array and does not remove it from the queue. |
| peek_head_struct | `QueueArray.peek_head_struct() -> gpointer` | gst_queue_array_peek_head_struct | 1.6 | Returns the head of the queue @array without removing it from the queue. |
| peek_nth | `QueueArray.peek_nth(idx: guint) -> gpointer` | gst_queue_array_peek_nth | 1.16 | Returns the item at @idx in @array, but does not remove it from the queue. |
| peek_nth_struct | `QueueArray.peek_nth_struct(idx: guint) -> gpointer` | gst_queue_array_peek_nth_struct | 1.16 | Returns the item at @idx in @array, but does not remove it from the queue. |
| peek_tail | `QueueArray.peek_tail() -> gpointer` | gst_queue_array_peek_tail | 1.14 | Returns the tail of the queue @array, but does not remove it from the queue. |
| peek_tail_struct | `QueueArray.peek_tail_struct() -> gpointer` | gst_queue_array_peek_tail_struct | 1.14 | Returns the tail of the queue @array, but does not remove it from the queue. |
| pop_head | `QueueArray.pop_head() -> gpointer` | gst_queue_array_pop_head | 1.2 | Returns and head of the queue @array and removes it from the queue. |
| pop_head_struct | `QueueArray.pop_head_struct() -> gpointer` | gst_queue_array_pop_head_struct | 1.6 | Returns the head of the queue @array and removes it from the queue. |
| pop_tail | `QueueArray.pop_tail() -> gpointer` | gst_queue_array_pop_tail | 1.14 | Returns the tail of the queue @array and removes it from the queue. |
| pop_tail_struct | `QueueArray.pop_tail_struct() -> gpointer` | gst_queue_array_pop_tail_struct | 1.14 | Returns the tail of the queue @array and removes it from the queue. |
| push_sorted | `QueueArray.push_sorted(data: gpointer?, func: GLib.CompareDataFunc, user_data: gpointer?) -> none` | gst_queue_array_push_sorted | 1.24 | Pushes @data to the queue @array, finding the correct position by comparing @data with each array element using @func. This has a time complexity o... |
| push_sorted_struct | `QueueArray.push_sorted_struct(p_struct: gpointer?, func: GLib.CompareDataFunc, user_data: gpointer?) -> none` | gst_queue_array_push_sorted_struct | 1.24 | Pushes the element at address @p_struct into the queue @array (copying the contents of a structure of the struct_size specified when creating the q... |
| push_tail | `QueueArray.push_tail(data: gpointer?) -> none` | gst_queue_array_push_tail | 1.2 | Pushes @data to the tail of the queue @array. |
| push_tail_struct | `QueueArray.push_tail_struct(p_struct: gpointer?) -> none` | gst_queue_array_push_tail_struct |  |  |
| set_clear_func | `QueueArray.set_clear_func(clear_func: GLib.DestroyNotify) -> none` | gst_queue_array_set_clear_func | 1.16 | Sets a function to clear an element of @array. The @clear_func will be called when an element in the array data segment is removed and when the arr... |
| sort | `QueueArray.sort(compare_func: GLib.CompareDataFunc, user_data: gpointer?) -> none` | gst_queue_array_sort | 1.24 | Sorts the queue @array by comparing elements against each other using the provided @compare_func. |

### GstBase.TypeFindData

C type: `GstTypeFindData`

The opaque #GstTypeFindData structure.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(obj: Gst.Object?, data: guint8, size: gsize) -> TypeFindData` | gst_type_find_data_new | 1.22 | Free-function: gst_type_find_data_free |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free | `TypeFindData.free() -> none` | gst_type_find_data_free | 1.22 | GstTypeFindData * to free |
| get_caps | `TypeFindData.get_caps() -> Gst.Caps` | gst_type_find_data_get_caps | 1.22 | Returns #GstCaps associated with #GstTypeFindData |
| get_probability | `TypeFindData.get_probability() -> Gst.TypeFindProbability` | gst_type_find_data_get_probability | 1.22 | Returns #GstTypeFindProbability associated with #GstTypeFindData |
| get_typefind | `TypeFindData.get_typefind() -> Gst.TypeFind` | gst_type_find_data_get_typefind | 1.22 | Returns #GstTypeFind associated with #GstTypeFindData |

## Unions

### GstBase.ABI

C type: `ABI`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| dts | gint64 |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| bit_reader_new | `bit_reader_new(data: guint8, size: guint) -> BitReader` | gst_bit_reader_new |  | Create a new #GstBitReader instance, which will read from @data. Free-function: gst_bit_reader_free |
| bit_writer_new | `bit_writer_new() -> BitWriter` | gst_bit_writer_new |  | Creates a new, empty #GstBitWriter instance. Free-function: gst_bit_writer_free |
| bit_writer_new_with_data | `bit_writer_new_with_data(data: guint8, size: guint, initialized: gboolean) -> BitWriter` | gst_bit_writer_new_with_data |  | Creates a new #GstBitWriter instance with the given memory area. If @initialized is %TRUE it is possible to read @size bits from the #GstBitWriter ... |
| bit_writer_new_with_size | `bit_writer_new_with_size(size: guint32, fixed: gboolean) -> BitWriter` | gst_bit_writer_new_with_size |  | Creates a #GstBitWriter instance with the given initial data size. Free-function: gst_bit_writer_free |
| byte_reader_new | `byte_reader_new(data: guint8, size: guint) -> ByteReader` | gst_byte_reader_new |  | Create a new #GstByteReader instance, which will read from @data. Free-function: gst_byte_reader_free |
| byte_writer_new | `byte_writer_new() -> ByteWriter` | gst_byte_writer_new |  | Creates a new, empty #GstByteWriter instance Free-function: gst_byte_writer_free |
| byte_writer_new_with_data | `byte_writer_new_with_data(data: guint8, size: guint, initialized: gboolean) -> ByteWriter` | gst_byte_writer_new_with_data |  | Creates a new #GstByteWriter instance with the given memory area. If @initialized is %TRUE it is possible to read @size bytes from the #GstByteWrit... |
| byte_writer_new_with_size | `byte_writer_new_with_size(size: guint, fixed: gboolean) -> ByteWriter` | gst_byte_writer_new_with_size |  | Creates a new #GstByteWriter instance with the given initial data size. Free-function: gst_byte_writer_free |
| queue_array_new | `queue_array_new(initial_size: guint) -> QueueArray` | gst_queue_array_new | 1.2 | Allocates a new #GstQueueArray object with an initial queue size of @initial_size. |
| queue_array_new_for_struct | `queue_array_new_for_struct(struct_size: gsize, initial_size: guint) -> QueueArray` | gst_queue_array_new_for_struct | 1.6 | Allocates a new #GstQueueArray object for elements (e.g. structures) of size @struct_size, with an initial queue size of @initial_size. |
| type_find_data_new | `type_find_data_new(obj: Gst.Object?, data: guint8, size: gsize) -> TypeFindData` | gst_type_find_data_new | 1.22 | Free-function: gst_type_find_data_free |
| type_find_helper | `type_find_helper(src: Gst.Pad, size: guint64) -> Gst.Caps` | gst_type_find_helper |  | Tries to find what type of data is flowing from the given source #GstPad. Free-function: gst_caps_unref |
| type_find_helper_for_buffer | `type_find_helper_for_buffer(obj: Gst.Object?, buf: Gst.Buffer, prob: out Gst.TypeFindProbability?) -> Gst.Caps` | gst_type_find_helper_for_buffer |  | Tries to find what type of data is contained in the given #GstBuffer, the assumption being that the buffer represents the beginning of the stream o... |
| type_find_helper_for_buffer_with_caps | `type_find_helper_for_buffer_with_caps(obj: Gst.Object?, buf: Gst.Buffer, caps: Gst.Caps, prob: out Gst.TypeFindProbability?) -> Gst.Caps` | gst_type_find_helper_for_buffer_with_caps | 1.22 | Tries to find if type of media contained in the given #GstBuffer, matches @caps specified, assumption being that the buffer represents the beginnin... |
| type_find_helper_for_buffer_with_extension | `type_find_helper_for_buffer_with_extension(obj: Gst.Object?, buf: Gst.Buffer, extension: utf8?, prob: out Gst.TypeFindProbability?) -> Gst.Caps` | gst_type_find_helper_for_buffer_with_extension | 1.16 | Tries to find what type of data is contained in the given #GstBuffer, the assumption being that the buffer represents the beginning of the stream o... |
| type_find_helper_for_data | `type_find_helper_for_data(obj: Gst.Object?, data: guint8, size: gsize, prob: out Gst.TypeFindProbability?) -> Gst.Caps` | gst_type_find_helper_for_data |  | Tries to find what type of data is contained in the given @data, the assumption being that the data represents the beginning of the stream or file.... |
| type_find_helper_for_data_with_caps | `type_find_helper_for_data_with_caps(obj: Gst.Object?, data: guint8, size: gsize, caps: Gst.Caps, prob: out Gst.TypeFindProbability?) -> Gst.Caps` | gst_type_find_helper_for_data_with_caps | 1.22 | Tries to find if type of media contained in the given @data, matches the @caps specified, assumption being that the data represents the beginning o... |
| type_find_helper_for_data_with_extension | `type_find_helper_for_data_with_extension(obj: Gst.Object?, data: guint8, size: gsize, extension: utf8?, prob: out Gst.TypeFindProbability?) -> Gst.Caps` | gst_type_find_helper_for_data_with_extension | 1.16 | Tries to find what type of data is contained in the given @data, the assumption being that the data represents the beginning of the stream or file.... |
| type_find_helper_for_extension | `type_find_helper_for_extension(obj: Gst.Object?, extension: utf8) -> Gst.Caps` | gst_type_find_helper_for_extension |  | Tries to find the best #GstCaps associated with @extension. All available typefinders will be checked against the extension in order of rank. The c... |
| type_find_helper_get_range | `type_find_helper_get_range(obj: Gst.Object, parent: Gst.Object?, func: TypeFindHelperGetRangeFunction, size: guint64, extension: utf8?, prob: out Gst.TypeFindProbability?) -> Gst.Caps` | gst_type_find_helper_get_range |  | Utility function to do pull-based typefinding. Unlike gst_type_find_helper() however, this function will use the specified function @func to obtain... |
| type_find_helper_get_range_full | `type_find_helper_get_range_full(obj: Gst.Object, parent: Gst.Object?, func: TypeFindHelperGetRangeFunction, size: guint64, extension: utf8?, caps: out Gst.Caps, prob: out Gst.TypeFindProbability?) -> Gst.FlowReturn` | gst_type_find_helper_get_range_full | 1.14.3 | Utility function to do pull-based typefinding. Unlike gst_type_find_helper() however, this function will use the specified function @func to obtain... |
| type_find_list_factories_for_caps | `type_find_list_factories_for_caps(obj: Gst.Object?, caps: Gst.Caps) -> GLib.List` | gst_type_find_list_factories_for_caps | 1.22 | Tries to find the best #GstTypeFindFactory associated with @caps. The typefinder that can handle @caps will be returned. Free-function: g_list_free |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| CollectDataDestroyNotify | `CollectDataDestroyNotify(data: CollectData) -> none` |  |  | A function that will be called when the #GstCollectData will be freed. It is passed the pointer to the structure and should free any custom memory ... |
| CollectPadsBufferFunction | `CollectPadsBufferFunction(pads: CollectPads, data: CollectData, buffer: Gst.Buffer, user_data: gpointer?) -> Gst.FlowReturn` |  |  | A function that will be called when a (considered oldest) buffer can be muxed. If all pads have reached EOS, this function is called with %NULL @bu... |
| CollectPadsClipFunction | `CollectPadsClipFunction(pads: CollectPads, data: CollectData, inbuffer: Gst.Buffer, outbuffer: out Gst.Buffer, user_data: gpointer?) -> Gst.FlowReturn` |  |  | A function that will be called when @inbuffer is received on the pad managed by @data in the collectpad object @pads. The function should use the s... |
| CollectPadsCompareFunction | `CollectPadsCompareFunction(pads: CollectPads, data1: CollectData, timestamp1: Gst.ClockTime, data2: CollectData, timestamp2: Gst.ClockTime, user_data: gpointer?) -> gint` |  |  | A function for comparing two timestamps of buffers or newsegments collected on one pad. |
| CollectPadsEventFunction | `CollectPadsEventFunction(pads: CollectPads, pad: CollectData, event: Gst.Event, user_data: gpointer?) -> gboolean` |  |  | A function that will be called while processing an event. It takes ownership of the event and is responsible for chaining up (to gst_collect_pads_e... |
| CollectPadsFlushFunction | `CollectPadsFlushFunction(pads: CollectPads, user_data: gpointer?) -> none` |  | 1.4 | A function that will be called while processing a flushing seek event. The function should flush any internal state of the element and the state of... |
| CollectPadsFunction | `CollectPadsFunction(pads: CollectPads, user_data: gpointer?) -> Gst.FlowReturn` |  |  | A function that will be called when all pads have received data. |
| CollectPadsQueryFunction | `CollectPadsQueryFunction(pads: CollectPads, pad: CollectData, query: Gst.Query, user_data: gpointer?) -> gboolean` |  |  | A function that will be called while processing a query. It takes ownership of the query and is responsible for chaining up (to events downstream (... |
| DataQueueCheckFullFunction | `DataQueueCheckFullFunction(queue: DataQueue, visible: guint, bytes: guint, time: guint64, checkdata: gpointer?) -> gboolean` |  |  | The prototype of the function used to inform the queue that it should be considered as full. |
| DataQueueEmptyCallback | `DataQueueEmptyCallback(queue: DataQueue, checkdata: gpointer?) -> none` |  |  |  |
| DataQueueFullCallback | `DataQueueFullCallback(queue: DataQueue, checkdata: gpointer?) -> none` |  |  |  |
| TypeFindHelperGetRangeFunction | `TypeFindHelperGetRangeFunction(obj: Gst.Object, parent: Gst.Object?, offset: guint64, length: guint, buffer: out Gst.Buffer) -> Gst.FlowReturn` |  |  | This function will be called by gst_type_find_helper_get_range() when typefinding functions request to peek at the data of a stream at certain offs... |

## Constants

| Name | Type |
| --- | --- |
| BASE_PARSE_FLAG_DRAINING | gint |
| BASE_PARSE_FLAG_LOST_SYNC | gint |
| BASE_TRANSFORM_SINK_NAME | utf8 |
| BASE_TRANSFORM_SRC_NAME | utf8 |

