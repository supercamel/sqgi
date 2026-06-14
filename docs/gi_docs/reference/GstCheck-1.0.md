# GstCheck 1.0

SQGI import: `import("GstCheck", "1.0")`

Packages: `gstreamer-check-1.0`
Includes: `GLib-2.0`, `GModule-2.0`, `GObject-2.0`, `Gst-1.0`
Libraries: `libgstcheck-1.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 1 |
| Interfaces | 0 |
| Records | 8 |
| Unions | 0 |
| Enums | 0 |
| Flags | 0 |
| Functions | 45 |
| Callbacks | 3 |
| Constants | 0 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| TestClock | Gst.Clock | 0 | 0 | 17 | GstTestClock is an implementation of #GstClock which has different behaviour compared to #GstSystemClock. Time for #GstSystemClock advances accordi... |

### GstCheck.TestClock

Parent: `Gst.Clock` ?? GType: `GstTestClock` ?? C type: `GstTestClock`

GstTestClock is an implementation of #GstClock which has different behaviour compared to #GstSystemClock. Time for #GstSystemClock advances accordi...

#### Fields

| Field | Type |
| --- | --- |
| parent | Gst.Clock |
| priv | TestClockPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TestClock.new() -> Gst.Clock` | gst_test_clock_new | 1.2 | Creates a new test clock with its time set to zero. MT safe. |
| new_with_start_time | `TestClock.new_with_start_time(start_time: Gst.ClockTime) -> Gst.Clock` | gst_test_clock_new_with_start_time | 1.2 | Creates a new test clock with its time set to the specified time. MT safe. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| id_list_get_latest_time | `id_list_get_latest_time(pending_list: GLib.List?) -> Gst.ClockTime` | gst_test_clock_id_list_get_latest_time | 1.4 | Finds the latest time inside the list. MT safe. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| advance_time | `TestClock.advance_time(delta: Gst.ClockTimeDiff) -> none` | gst_test_clock_advance_time | 1.2 | Advances the time of the @test_clock by the amount given by @delta. The time of @test_clock is monotonically increasing, therefore providing a @del... |
| crank | `TestClock.crank() -> gboolean` | gst_test_clock_crank | 1.8 | A "crank" consists of three steps: 1: Wait for a #GstClockID to be registered with the #GstTestClock. 2: Advance the #GstTestClock to the time the ... |
| get_next_entry_time | `TestClock.get_next_entry_time() -> Gst.ClockTime` | gst_test_clock_get_next_entry_time | 1.2 | Retrieve the requested time for the next pending clock notification. MT safe. |
| has_id | `TestClock.has_id(id: Gst.ClockID) -> gboolean` | gst_test_clock_has_id | 1.2 | Checks whether @test_clock was requested to provide the clock notification given by @id. MT safe. |
| peek_id_count | `TestClock.peek_id_count() -> guint` | gst_test_clock_peek_id_count | 1.2 | Determine the number of pending clock notifications that have been requested from the @test_clock. MT safe. |
| peek_next_pending_id | `TestClock.peek_next_pending_id(pending_id: out Gst.ClockID?) -> gboolean` | gst_test_clock_peek_next_pending_id | 1.2 | Determines if the @pending_id is the next clock notification scheduled to be triggered given the current time of the @test_clock. MT safe. |
| process_id | `TestClock.process_id(pending_id: Gst.ClockID) -> gboolean` | gst_test_clock_process_id | 1.18 | Processes and releases the pending ID. MT safe. |
| process_id_list | `TestClock.process_id_list(pending_list: GLib.List?) -> guint` | gst_test_clock_process_id_list | 1.4 | Processes and releases the pending IDs in the list. MT safe. |
| process_next_clock_id | `TestClock.process_next_clock_id() -> Gst.ClockID` | gst_test_clock_process_next_clock_id | 1.2 | MT safe. |
| set_time | `TestClock.set_time(new_time: Gst.ClockTime) -> none` | gst_test_clock_set_time | 1.2 | Sets the time of @test_clock to the time given by @new_time. The time of @test_clock is monotonically increasing, therefore providing a @new_time w... |
| timed_wait_for_multiple_pending_ids | `TestClock.timed_wait_for_multiple_pending_ids(count: guint, timeout_ms: guint, pending_list: out GLib.List?) -> gboolean` | gst_test_clock_timed_wait_for_multiple_pending_ids | 1.16 | Blocks until at least @count clock notifications have been requested from @test_clock, or the timeout expires. MT safe. |
| wait_for_multiple_pending_ids | `TestClock.wait_for_multiple_pending_ids(count: guint, pending_list: out GLib.List?) -> none` | gst_test_clock_wait_for_multiple_pending_ids | 1.4 | Blocks until at least @count clock notifications have been requested from @test_clock. There is no timeout for this wait, see the main description ... |
| wait_for_next_pending_id | `TestClock.wait_for_next_pending_id(pending_id: out Gst.ClockID?) -> none` | gst_test_clock_wait_for_next_pending_id | 1.2 | Waits until a clock notification is requested from @test_clock. There is no timeout for this wait, see the main description of #GstTestClock. A ref... |
| wait_for_pending_id_count | `TestClock.wait_for_pending_id_count(count: guint) -> none` | gst_test_clock_wait_for_pending_id_count | 1.2 | Blocks until at least @count clock notifications have been requested from @test_clock. There is no timeout for this wait, see the main description ... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| clock-type | Gst.ClockType | read, write |  |
| start-time | guint64 | read, write, construct-only | When a #GstTestClock is constructed it will have a certain start time set. If the clock was created using gst_test_clock_new_with_start_time() then... |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| CheckABIStruct |  | 0 | 0 | 0 | The name of the structure |
| CheckLogFilter |  | 0 | 0 | 0 | Opaque structure containing data about a log filter function. |
| Harness |  | 0 | 0 | 84 | #GstHarness is meant to make writing unit test for GStreamer much easier. It can be thought of as a way of treating a #GstElement as a black box, d... |
| HarnessPrivate |  | 0 | 0 | 0 |  |
| HarnessThread |  | 0 | 0 | 0 | Opaque handle representing a GstHarness stress testing thread. |
| StreamConsistency |  | 0 | 0 | 0 | Opaque consistency checker handle. |
| TestClockClass |  | 0 | 0 | 0 | The class of a #GstTestClock, which has no virtual methods to override. |
| TestClockPrivate |  | 0 | 0 | 0 |  |

### GstCheck.CheckABIStruct

C type: `GstCheckABIStruct`

The name of the structure

#### Fields

| Field | Type |
| --- | --- |
| abi_size | gint |
| name | utf8 |
| size | gint |

### GstCheck.CheckLogFilter

C type: `GstCheckLogFilter`

Opaque structure containing data about a log filter function.

### GstCheck.Harness

C type: `GstHarness`

#GstHarness is meant to make writing unit test for GStreamer much easier. It can be thought of as a way of treating a #GstElement as a black box, d...

#### Fields

| Field | Type |
| --- | --- |
| element | Gst.Element |
| priv | HarnessPrivate |
| sink_harness | Harness |
| sinkpad | Gst.Pad |
| src_harness | Harness |
| srcpad | Gst.Pad |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(element_name: utf8) -> Harness` | gst_harness_new | 1.6 | Creates a new harness. Works like gst_harness_new_with_padnames(), except it assumes the #GstElement sinkpad is named "sink" and srcpad is named "s... |
| new_empty | `new_empty() -> Harness` | gst_harness_new_empty | 1.8 | Creates a new empty harness. Use gst_harness_add_element_full() to add an #GstElement to it. MT safe. |
| new_full | `new_full(element: Gst.Element, hsrc: Gst.StaticPadTemplate?, element_sinkpad_name: utf8?, hsink: Gst.StaticPadTemplate?, element_srcpad_name: utf8?) -> Harness` | gst_harness_new_full | 1.6 | Creates a new harness. MT safe. |
| new_parse | `new_parse(launchline: utf8) -> Harness` | gst_harness_new_parse | 1.6 | Creates a new harness, parsing the @launchline and putting that in a #GstBin, and then attches the harness to the bin. MT safe. |
| new_with_element | `new_with_element(element: Gst.Element, element_sinkpad_name: utf8?, element_srcpad_name: utf8?) -> Harness` | gst_harness_new_with_element | 1.6 | Creates a new harness. Works in the same way as gst_harness_new_full(), only that generic padtemplates are used for the harness src and sinkpads, w... |
| new_with_padnames | `new_with_padnames(element_name: utf8, element_sinkpad_name: utf8?, element_srcpad_name: utf8?) -> Harness` | gst_harness_new_with_padnames | 1.6 | Creates a new harness. Works like gst_harness_new_with_element(), except you specify the factoryname of the #GstElement MT safe. |
| new_with_templates | `new_with_templates(element_name: utf8, hsrc: Gst.StaticPadTemplate?, hsink: Gst.StaticPadTemplate?) -> Harness` | gst_harness_new_with_templates | 1.6 | Creates a new harness, like gst_harness_new_full(), except it assumes the #GstElement sinkpad is named "sink" and srcpad is named "src" MT safe. |
| stress_thread_stop | `stress_thread_stop(t: HarnessThread) -> guint` | gst_harness_stress_thread_stop | 1.6 | Stop the running #GstHarnessThread MT safe. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_element_full | `Harness.add_element_full(element: Gst.Element, hsrc: Gst.StaticPadTemplate?, element_sinkpad_name: utf8?, hsink: Gst.StaticPadTemplate?, element_srcpad_name: utf8?) -> none` | gst_harness_add_element_full | 1.6 | Adds a #GstElement to an empty #GstHarness MT safe. |
| add_element_sink_pad | `Harness.add_element_sink_pad(sinkpad: Gst.Pad) -> none` | gst_harness_add_element_sink_pad | 1.6 | Links the specified #GstPad the @GstHarness srcpad. MT safe. |
| add_element_src_pad | `Harness.add_element_src_pad(srcpad: Gst.Pad) -> none` | gst_harness_add_element_src_pad | 1.6 | Links the specified #GstPad the @GstHarness sinkpad. This can be useful if perhaps the srcpad did not exist at the time of creating the harness, li... |
| add_parse | `Harness.add_parse(launchline: utf8) -> none` | gst_harness_add_parse | 1.6 | Parses the @launchline and puts that in a #GstBin, and then attches the supplied #GstHarness to the bin. MT safe. |
| add_probe | `Harness.add_probe(element_name: utf8, pad_name: utf8, mask: Gst.PadProbeType, callback: Gst.PadProbeCallback, user_data: gpointer?, destroy_data: GLib.DestroyNotify) -> none` | gst_harness_add_probe | 1.6 | A convenience function to allows you to call gst_pad_add_probe on a #GstPad of a #GstElement that are residing inside the #GstHarness, by using nor... |
| add_propose_allocation_meta | `Harness.add_propose_allocation_meta(api: GType, params: Gst.Structure?) -> none` | gst_harness_add_propose_allocation_meta | 1.16 | Add api with params as one of the supported metadata API to propose when receiving an allocation query. MT safe. |
| add_sink | `Harness.add_sink(sink_element_name: utf8) -> none` | gst_harness_add_sink | 1.6 | Similar to gst_harness_add_sink_harness, this is a convenience to directly create a sink-harness using the @sink_element_name name specified. MT safe. |
| add_sink_harness | `Harness.add_sink_harness(sink_harness: Harness) -> none` | gst_harness_add_sink_harness | 1.6 | Similar to gst_harness_add_src, this allows you to send the data coming out of your harnessed #GstElement to a sink-element, allowing to test diffe... |
| add_sink_parse | `Harness.add_sink_parse(launchline: utf8) -> none` | gst_harness_add_sink_parse | 1.6 | Similar to gst_harness_add_sink, this allows you to specify a launch-line instead of just an element name. See gst_harness_add_src_parse for detail... |
| add_src | `Harness.add_src(src_element_name: utf8, has_clock_wait: gboolean) -> none` | gst_harness_add_src | 1.6 | Similar to gst_harness_add_src_harness, this is a convenience to directly create a src-harness using the @src_element_name name specified. MT safe. |
| add_src_harness | `Harness.add_src_harness(src_harness: Harness, has_clock_wait: gboolean) -> none` | gst_harness_add_src_harness | 1.6 | A src-harness is a great way of providing the #GstHarness with data. By adding a src-type #GstElement, it is then easy to use functions like gst_ha... |
| add_src_parse | `Harness.add_src_parse(launchline: utf8, has_clock_wait: gboolean) -> none` | gst_harness_add_src_parse | 1.6 | Similar to gst_harness_add_src, this allows you to specify a launch-line, which can be useful for both having more then one #GstElement acting as y... |
| buffers_in_queue | `Harness.buffers_in_queue() -> guint` | gst_harness_buffers_in_queue | 1.6 | The number of #GstBuffers currently in the #GstHarness sinkpad #GAsyncQueue MT safe. |
| buffers_received | `Harness.buffers_received() -> guint` | gst_harness_buffers_received | 1.6 | The total number of #GstBuffers that has arrived on the #GstHarness sinkpad. This number includes buffers that have been dropped as well as buffers... |
| crank_multiple_clock_waits | `Harness.crank_multiple_clock_waits(waits: guint) -> gboolean` | gst_harness_crank_multiple_clock_waits | 1.6 | Similar to gst_harness_crank_single_clock_wait(), this is the function to use if your harnessed element(s) are using more then one gst_clock_id_wai... |
| crank_single_clock_wait | `Harness.crank_single_clock_wait() -> gboolean` | gst_harness_crank_single_clock_wait | 1.6 | A "crank" consists of three steps: 1: Wait for a #GstClockID to be registered with the #GstTestClock. 2: Advance the #GstTestClock to the time the ... |
| create_buffer | `Harness.create_buffer(size: gsize) -> Gst.Buffer` | gst_harness_create_buffer | 1.6 | Allocates a buffer using a #GstBufferPool if present, or else using the configured #GstAllocator and #GstAllocationParams MT safe. |
| dump_to_file | `Harness.dump_to_file(filename: utf8) -> none` | gst_harness_dump_to_file | 1.6 | Allows you to dump the #GstBuffers the #GstHarness sinkpad #GAsyncQueue to a file. MT safe. |
| events_in_queue | `Harness.events_in_queue() -> guint` | gst_harness_events_in_queue | 1.6 | The number of #GstEvents currently in the #GstHarness sinkpad #GAsyncQueue MT safe. |
| events_received | `Harness.events_received() -> guint` | gst_harness_events_received | 1.6 | The total number of #GstEvents that has arrived on the #GstHarness sinkpad This number includes events handled by the harness as well as events tha... |
| find_element | `Harness.find_element(element_name: utf8) -> Gst.Element` | gst_harness_find_element | 1.6 | Most useful in conjunction with gst_harness_new_parse, this will scan the #GstElements inside the #GstHarness, and check if any of them matches @el... |
| get | `Harness.get(element_name: utf8, first_property_name: utf8, ...: void) -> none` | gst_harness_get | 1.6 | A convenience function to allows you to call g_object_get on a #GstElement that are residing inside the #GstHarness, by using normal g_object_get s... |
| get_allocator | `Harness.get_allocator(allocator: out Gst.Allocator?, params: out Gst.AllocationParams?) -> none` | gst_harness_get_allocator | 1.6 | Gets the @allocator and its @params that has been decided to use after an allocation query. MT safe. |
| get_last_pushed_timestamp | `Harness.get_last_pushed_timestamp() -> Gst.ClockTime` | gst_harness_get_last_pushed_timestamp | 1.6 | Get the timestamp of the last #GstBuffer pushed on the #GstHarness srcpad, typically with gst_harness_push or gst_harness_push_from_src. MT safe. |
| get_testclock | `Harness.get_testclock() -> TestClock` | gst_harness_get_testclock | 1.6 | Get the #GstTestClock. Useful if specific operations on the testclock is needed. MT safe. |
| play | `Harness.play() -> none` | gst_harness_play | 1.6 | This will set the harnessed #GstElement to %GST_STATE_PLAYING. #GstElements without a sink-#GstPad and with the %GST_ELEMENT_FLAG_SOURCE flag set i... |
| pull | `Harness.pull() -> Gst.Buffer` | gst_harness_pull | 1.6 | Pulls a #GstBuffer from the #GAsyncQueue on the #GstHarness sinkpad. The pull will timeout in 60 seconds. This is the standard way of getting a buf... |
| pull_event | `Harness.pull_event() -> Gst.Event` | gst_harness_pull_event | 1.6 | Pulls an #GstEvent from the #GAsyncQueue on the #GstHarness sinkpad. Timeouts after 60 seconds similar to gst_harness_pull. MT safe. |
| pull_until_eos | `Harness.pull_until_eos(buf: out Gst.Buffer?) -> gboolean` | gst_harness_pull_until_eos | 1.18 | Pulls a #GstBuffer from the #GAsyncQueue on the #GstHarness sinkpad. The pull will block until an EOS event is received, or timeout in 60 seconds. ... |
| pull_upstream_event | `Harness.pull_upstream_event() -> Gst.Event` | gst_harness_pull_upstream_event | 1.6 | Pulls an #GstEvent from the #GAsyncQueue on the #GstHarness srcpad. Timeouts after 60 seconds similar to gst_harness_pull. MT safe. |
| push | `Harness.push(buffer: Gst.Buffer) -> Gst.FlowReturn` | gst_harness_push | 1.6 | Pushes a #GstBuffer on the #GstHarness srcpad. The standard way of interacting with an harnessed element. MT safe. |
| push_and_pull | `Harness.push_and_pull(buffer: Gst.Buffer) -> Gst.Buffer` | gst_harness_push_and_pull | 1.6 | Basically a gst_harness_push and a gst_harness_pull in one line. Reflects the fact that you often want to do exactly this in your test: Push one bu... |
| push_event | `Harness.push_event(event: Gst.Event) -> gboolean` | gst_harness_push_event | 1.6 | Pushes an #GstEvent on the #GstHarness srcpad. MT safe. |
| push_from_src | `Harness.push_from_src() -> Gst.FlowReturn` | gst_harness_push_from_src | 1.6 | Transfer data from the src-#GstHarness to the main-#GstHarness. It consists of 4 steps: 1: Make sure the src is started. (see: gst_harness_play) 2:... |
| push_to_sink | `Harness.push_to_sink() -> Gst.FlowReturn` | gst_harness_push_to_sink | 1.6 | Transfer one #GstBuffer from the main-#GstHarness to the sink-#GstHarness. See gst_harness_push_from_src for details. MT safe. |
| push_upstream_event | `Harness.push_upstream_event(event: Gst.Event) -> gboolean` | gst_harness_push_upstream_event | 1.6 | Pushes an #GstEvent on the #GstHarness sinkpad. MT safe. |
| query_latency | `Harness.query_latency() -> Gst.ClockTime` | gst_harness_query_latency | 1.6 | Get the min latency reported by any harnessed #GstElement. MT safe. |
| set | `Harness.set(element_name: utf8, first_property_name: utf8, ...: void) -> none` | gst_harness_set | 1.6 | A convenience function to allows you to call g_object_set on a #GstElement that are residing inside the #GstHarness, by using normal g_object_set s... |
| set_blocking_push_mode | `Harness.set_blocking_push_mode() -> none` | gst_harness_set_blocking_push_mode | 1.6 | Setting this will make the harness block in the chain-function, and then release when gst_harness_pull() or gst_harness_try_pull() is called. Can b... |
| set_caps | `Harness.set_caps(in: Gst.Caps, out: Gst.Caps) -> none` | gst_harness_set_caps | 1.6 | Sets the @GstHarness srcpad and sinkpad caps. MT safe. |
| set_caps_str | `Harness.set_caps_str(in: utf8, out: utf8) -> none` | gst_harness_set_caps_str | 1.6 | Sets the @GstHarness srcpad and sinkpad caps using strings. MT safe. |
| set_drop_buffers | `Harness.set_drop_buffers(drop_buffers: gboolean) -> none` | gst_harness_set_drop_buffers | 1.6 | When set to %TRUE, instead of placing the buffers arriving from the harnessed #GstElement inside the sinkpads #GAsyncQueue, they are instead unreff... |
| set_forwarding | `Harness.set_forwarding(forwarding: gboolean) -> none` | gst_harness_set_forwarding | 1.6 | As a convenience, a src-harness will forward %GST_EVENT_STREAM_START, %GST_EVENT_CAPS and %GST_EVENT_SEGMENT to the main-harness if forwarding is e... |
| set_live | `Harness.set_live(is_live: gboolean) -> none` | gst_harness_set_live | 1.20 | Sets the liveness reported by #GstHarness when receiving a latency-query. The default is %TRUE. |
| set_propose_allocator | `Harness.set_propose_allocator(allocator: Gst.Allocator?, params: Gst.AllocationParams?) -> none` | gst_harness_set_propose_allocator | 1.6 | Sets the @allocator and @params to propose when receiving an allocation query. MT safe. |
| set_sink_caps | `Harness.set_sink_caps(caps: Gst.Caps) -> none` | gst_harness_set_sink_caps | 1.6 | Sets the @GstHarness sinkpad caps. MT safe. |
| set_sink_caps_str | `Harness.set_sink_caps_str(str: utf8) -> none` | gst_harness_set_sink_caps_str | 1.6 | Sets the @GstHarness sinkpad caps using a string. MT safe. |
| set_src_caps | `Harness.set_src_caps(caps: Gst.Caps) -> none` | gst_harness_set_src_caps | 1.6 | Sets the @GstHarness srcpad caps. This must be done before any buffers can legally be pushed from the harness to the element. MT safe. |
| set_src_caps_str | `Harness.set_src_caps_str(str: utf8) -> none` | gst_harness_set_src_caps_str | 1.6 | Sets the @GstHarness srcpad caps using a string. This must be done before any buffers can legally be pushed from the harness to the element. MT safe. |
| set_time | `Harness.set_time(time: Gst.ClockTime) -> gboolean` | gst_harness_set_time | 1.6 | Advance the #GstTestClock to a specific time. MT safe. |
| set_upstream_latency | `Harness.set_upstream_latency(latency: Gst.ClockTime) -> none` | gst_harness_set_upstream_latency | 1.6 | Sets the min latency reported by #GstHarness when receiving a latency-query |
| sink_push_many | `Harness.sink_push_many(pushes: gint) -> Gst.FlowReturn` | gst_harness_sink_push_many | 1.6 | Convenience that calls gst_harness_push_to_sink @pushes number of times. Will abort the pushing if any one push fails. MT safe. |
| src_crank_and_push_many | `Harness.src_crank_and_push_many(cranks: gint, pushes: gint) -> Gst.FlowReturn` | gst_harness_src_crank_and_push_many | 1.6 | Transfer data from the src-#GstHarness to the main-#GstHarness. Similar to gst_harness_push_from_src, this variant allows you to specify how many c... |
| src_push_event | `Harness.src_push_event() -> gboolean` | gst_harness_src_push_event | 1.6 | Similar to what gst_harness_src_push does with #GstBuffers, this transfers a #GstEvent from the src-#GstHarness to the main-#GstHarness. Note that ... |
| stress_custom_start | `Harness.stress_custom_start(init: GLib.Func?, callback: GLib.Func, data: gpointer?, sleep: gulong) -> HarnessThread` | gst_harness_stress_custom_start | 1.6 | Start a custom stress-thread that will call your @callback for every iteration allowing you to do something nasty. MT safe. |
| stress_property_start_full | `Harness.stress_property_start_full(name: utf8, value: GObject.Value, sleep: gulong) -> HarnessThread` | gst_harness_stress_property_start_full | 1.6 | Call g_object_set with @name and @value in intervals of @sleep microseconds MT safe. |
| stress_push_buffer_start_full | `Harness.stress_push_buffer_start_full(caps: Gst.Caps, segment: Gst.Segment, buf: Gst.Buffer, sleep: gulong) -> HarnessThread` | gst_harness_stress_push_buffer_start_full | 1.6 | Push a #GstBuffer in intervals of @sleep microseconds. MT safe. |
| stress_push_buffer_with_cb_start_full | `Harness.stress_push_buffer_with_cb_start_full(caps: Gst.Caps, segment: Gst.Segment, func: HarnessPrepareBufferFunc, data: gpointer?, notify: GLib.DestroyNotify, sleep: gulong) -> HarnessThread` | gst_harness_stress_push_buffer_with_cb_start_full | 1.6 | Push a #GstBuffer returned by @func in intervals of @sleep microseconds. MT safe. |
| stress_push_event_start_full | `Harness.stress_push_event_start_full(event: Gst.Event, sleep: gulong) -> HarnessThread` | gst_harness_stress_push_event_start_full | 1.6 | Push the @event onto the harnessed #GstElement sinkpad in intervals of @sleep microseconds MT safe. |
| stress_push_event_with_cb_start_full | `Harness.stress_push_event_with_cb_start_full(func: HarnessPrepareEventFunc, data: gpointer?, notify: GLib.DestroyNotify, sleep: gulong) -> HarnessThread` | gst_harness_stress_push_event_with_cb_start_full | 1.8 | Push a #GstEvent returned by @func onto the harnessed #GstElement sinkpad in intervals of @sleep microseconds. MT safe. |
| stress_push_upstream_event_start_full | `Harness.stress_push_upstream_event_start_full(event: Gst.Event, sleep: gulong) -> HarnessThread` | gst_harness_stress_push_upstream_event_start_full | 1.6 | Push the @event onto the harnessed #GstElement srcpad in intervals of @sleep microseconds. MT safe. |
| stress_push_upstream_event_with_cb_start_full | `Harness.stress_push_upstream_event_with_cb_start_full(func: HarnessPrepareEventFunc, data: gpointer?, notify: GLib.DestroyNotify, sleep: gulong) -> HarnessThread` | gst_harness_stress_push_upstream_event_with_cb_start_full | 1.8 | Push a #GstEvent returned by @func onto the harnessed #GstElement srcpad in intervals of @sleep microseconds. MT safe. |
| stress_requestpad_start_full | `Harness.stress_requestpad_start_full(templ: Gst.PadTemplate, name: utf8, caps: Gst.Caps, release: gboolean, sleep: gulong) -> HarnessThread` | gst_harness_stress_requestpad_start_full | 1.6 | Call gst_element_request_pad in intervals of @sleep microseconds MT safe. |
| stress_statechange_start_full | `Harness.stress_statechange_start_full(sleep: gulong) -> HarnessThread` | gst_harness_stress_statechange_start_full | 1.6 | Change the state of your harnessed #GstElement from NULL to PLAYING and back again, only pausing for @sleep microseconds every time. MT safe. |
| take_all_data | `Harness.take_all_data(size: out gsize) -> guint8` | gst_harness_take_all_data | 1.14 | Pulls all pending data from the harness and returns it as a single data slice. |
| take_all_data_as_buffer | `Harness.take_all_data_as_buffer() -> Gst.Buffer` | gst_harness_take_all_data_as_buffer | 1.14 | Pulls all pending data from the harness and returns it as a single buffer. |
| take_all_data_as_bytes | `Harness.take_all_data_as_bytes() -> GLib.Bytes` | gst_harness_take_all_data_as_bytes | 1.14 | Pulls all pending data from the harness and returns it as a single #GBytes. |
| teardown | `Harness.teardown() -> none` | gst_harness_teardown | 1.6 | Tears down a @GstHarness, freeing all resources allocated using it. MT safe. |
| try_pull | `Harness.try_pull() -> Gst.Buffer` | gst_harness_try_pull | 1.6 | Pulls a #GstBuffer from the #GAsyncQueue on the #GstHarness sinkpad. Unlike gst_harness_pull this will not wait for any buffers if not any are pres... |
| try_pull_event | `Harness.try_pull_event() -> Gst.Event` | gst_harness_try_pull_event | 1.6 | Pulls an #GstEvent from the #GAsyncQueue on the #GstHarness sinkpad. See gst_harness_try_pull for details. MT safe. |
| try_pull_upstream_event | `Harness.try_pull_upstream_event() -> Gst.Event` | gst_harness_try_pull_upstream_event | 1.6 | Pulls an #GstEvent from the #GAsyncQueue on the #GstHarness srcpad. See gst_harness_try_pull for details. MT safe. |
| upstream_events_in_queue | `Harness.upstream_events_in_queue() -> guint` | gst_harness_upstream_events_in_queue | 1.6 | The number of #GstEvents currently in the #GstHarness srcpad #GAsyncQueue MT safe. |
| upstream_events_received | `Harness.upstream_events_received() -> guint` | gst_harness_upstream_events_received | 1.6 | The total number of #GstEvents that has arrived on the #GstHarness srcpad This number includes events handled by the harness as well as events that... |
| use_systemclock | `Harness.use_systemclock() -> none` | gst_harness_use_systemclock | 1.6 | Sets the system #GstClock on the @GstHarness #GstElement MT safe. |
| use_testclock | `Harness.use_testclock() -> none` | gst_harness_use_testclock | 1.6 | Sets the #GstTestClock on the #GstHarness #GstElement MT safe. |
| wait_for_clock_id_waits | `Harness.wait_for_clock_id_waits(waits: guint, timeout: guint) -> gboolean` | gst_harness_wait_for_clock_id_waits | 1.6 | Waits for @timeout seconds until @waits number of #GstClockID waits is registered with the #GstTestClock. Useful for writing deterministic tests, w... |

### GstCheck.HarnessPrivate

C type: `GstHarnessPrivate`

### GstCheck.HarnessThread

C type: `GstHarnessThread`

Opaque handle representing a GstHarness stress testing thread.

### GstCheck.StreamConsistency

C type: `GstStreamConsistency`

Opaque consistency checker handle.

### GstCheck.TestClockClass

C type: `GstTestClockClass`

The class of a #GstTestClock, which has no virtual methods to override.

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gst.ClockClass |

### GstCheck.TestClockPrivate

C type: `GstTestClockPrivate`

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| buffer_straw_get_buffer | `buffer_straw_get_buffer(bin: Gst.Element, pad: Gst.Pad) -> Gst.Buffer` | gst_buffer_straw_get_buffer |  | Get one buffer from @pad. Implemented via buffer probes. This function will block until the pipeline passes a buffer over @pad, so for robust behav... |
| buffer_straw_start_pipeline | `buffer_straw_start_pipeline(bin: Gst.Element, pad: Gst.Pad) -> none` | gst_buffer_straw_start_pipeline |  | Sets up a pipeline for buffer sucking. This will allow you to call gst_buffer_straw_get_buffer() to access buffers as they pass over @pad. This fun... |
| buffer_straw_stop_pipeline | `buffer_straw_stop_pipeline(bin: Gst.Element, pad: Gst.Pad) -> none` | gst_buffer_straw_stop_pipeline |  | Set @bin to #GST_STATE_NULL and release resource allocated in gst_buffer_straw_start_pipeline(). You must have previously called gst_buffer_straw_s... |
| check_abi_list | `check_abi_list(list: CheckABIStruct, have_abi_sizes: gboolean) -> none` | gst_check_abi_list |  | Verifies that reference values and current values are equals in @list. |
| check_add_log_filter | `check_add_log_filter(log_domain: utf8, log_level: GLib.LogLevelFlags, regex: GLib.Regex, func: CheckLogFilterFunc, user_data: gpointer?, destroy_data: GLib.DestroyNotify) -> CheckLogFilter` | gst_check_add_log_filter | 1.12 | Add a callback @func to be called for all log messages that matches @log_domain, @log_level and @regex. If @func is NULL the matching logs will be ... |
| check_buffer_data | `check_buffer_data(buffer: Gst.Buffer, data: gpointer?, size: gsize) -> none` | gst_check_buffer_data |  | Compare the buffer contents with @data and @size. |
| check_caps_equal | `check_caps_equal(caps1: Gst.Caps, caps2: Gst.Caps) -> none` | gst_check_caps_equal |  | Compare two caps with gst_caps_is_equal and fail unless they are equal. |
| check_chain_func | `check_chain_func(pad: Gst.Pad, parent: Gst.Object, buffer: Gst.Buffer) -> Gst.FlowReturn` | gst_check_chain_func |  | A fake chain function that appends the buffer to the internal list of buffers. |
| check_clear_log_filter | `check_clear_log_filter() -> none` | gst_check_clear_log_filter | 1.12 | Clear all filters added by @gst_check_add_log_filter. MT safe. |
| check_drop_buffers | `check_drop_buffers() -> none` | gst_check_drop_buffers |  | Unref and remove all buffers that are in the global @buffers GList, emptying the list. |
| check_element_push_buffer | `check_element_push_buffer(element_name: utf8, buffer_in: Gst.Buffer, caps_in: Gst.Caps, buffer_out: Gst.Buffer, caps_out: Gst.Caps) -> none` | gst_check_element_push_buffer |  | Create an element using the factory providing the @element_name and push the @buffer_in to this element. The element should create one buffer and t... |
| check_element_push_buffer_list | `check_element_push_buffer_list(element_name: utf8, buffer_in: GLib.List, caps_in: Gst.Caps, buffer_out: GLib.List, caps_out: Gst.Caps, last_flow_return: Gst.FlowReturn) -> none` | gst_check_element_push_buffer_list |  | Create an element using the factory providing the @element_name and push the buffers in @buffer_in to this element. The element should create the b... |
| check_init | `check_init(argc: gint, argv: utf8) -> none` | gst_check_init |  |  |
| check_message_error | `check_message_error(message: Gst.Message, type: Gst.MessageType, domain: GLib.Quark, code: gint) -> none` | gst_check_message_error |  |  |
| check_object_destroyed_on_unref | `check_object_destroyed_on_unref(object_to_unref: gpointer?) -> none` | gst_check_object_destroyed_on_unref | 1.6 | Unrefs @object_to_unref and checks that is has properly been destroyed. |
| check_objects_destroyed_on_unref | `check_objects_destroyed_on_unref(object_to_unref: gpointer?, first_object: gpointer?, ...: void) -> none` | gst_check_objects_destroyed_on_unref | 1.6 | Unrefs @object_to_unref and checks that is has properly been destroyed, also checks that the other objects passed in parameter have been destroyed ... |
| check_remove_log_filter | `check_remove_log_filter(filter: CheckLogFilter) -> none` | gst_check_remove_log_filter | 1.12 | Remove a filter that has been added by @gst_check_add_log_filter. MT safe. |
| check_run_suite | `check_run_suite(suite: Suite*, name: utf8, fname: utf8) -> gint` | gst_check_run_suite |  | number of failed tests |
| check_setup_element | `check_setup_element(factory: utf8) -> Gst.Element` | gst_check_setup_element |  | setup an element for a filter test with mysrcpad and mysinkpad |
| check_setup_events | `check_setup_events(srcpad: Gst.Pad, element: Gst.Element, caps: Gst.Caps?, format: Gst.Format) -> none` | gst_check_setup_events |  | Push stream-start, caps and segment event, which consist of the minimum required events to allow streaming. Caps is optional to allow raw src testi... |
| check_setup_events_with_stream_id | `check_setup_events_with_stream_id(srcpad: Gst.Pad, element: Gst.Element, caps: Gst.Caps?, format: Gst.Format, stream_id: utf8) -> none` | gst_check_setup_events_with_stream_id |  | Push stream-start, caps and segment event, which consist of the minimum required events to allow streaming. Caps is optional to allow raw src testing. |
| check_setup_sink_pad | `check_setup_sink_pad(element: Gst.Element, tmpl: Gst.StaticPadTemplate) -> Gst.Pad` | gst_check_setup_sink_pad |  | Does the same as #gst_check_setup_sink_pad_by_name with the <emphasis> name </emphasis> parameter equal to "src". |
| check_setup_sink_pad_by_name | `check_setup_sink_pad_by_name(element: Gst.Element, tmpl: Gst.StaticPadTemplate, name: utf8) -> Gst.Pad` | gst_check_setup_sink_pad_by_name |  | Creates a new sink pad (based on the given @tmpl) and links it to the given @element src pad (the pad that matches the given @name). You can set ev... |
| check_setup_sink_pad_by_name_from_template | `check_setup_sink_pad_by_name_from_template(element: Gst.Element, tmpl: Gst.PadTemplate, name: utf8) -> Gst.Pad` | gst_check_setup_sink_pad_by_name_from_template | 1.4 | a new pad |
| check_setup_sink_pad_from_template | `check_setup_sink_pad_from_template(element: Gst.Element, tmpl: Gst.PadTemplate) -> Gst.Pad` | gst_check_setup_sink_pad_from_template | 1.4 | a new pad |
| check_setup_src_pad | `check_setup_src_pad(element: Gst.Element, tmpl: Gst.StaticPadTemplate) -> Gst.Pad` | gst_check_setup_src_pad |  | Does the same as #gst_check_setup_src_pad_by_name with the <emphasis> name </emphasis> parameter equal to "sink". |
| check_setup_src_pad_by_name | `check_setup_src_pad_by_name(element: Gst.Element, tmpl: Gst.StaticPadTemplate, name: utf8) -> Gst.Pad` | gst_check_setup_src_pad_by_name |  | Creates a new src pad (based on the given @tmpl) and links it to the given @element sink pad (the pad that matches the given @name). Before using t... |
| check_setup_src_pad_by_name_from_template | `check_setup_src_pad_by_name_from_template(element: Gst.Element, tmpl: Gst.PadTemplate, name: utf8) -> Gst.Pad` | gst_check_setup_src_pad_by_name_from_template | 1.4 | a new pad |
| check_setup_src_pad_from_template | `check_setup_src_pad_from_template(element: Gst.Element, tmpl: Gst.PadTemplate) -> Gst.Pad` | gst_check_setup_src_pad_from_template | 1.4 | a new pad |
| check_teardown_element | `check_teardown_element(element: Gst.Element) -> none` | gst_check_teardown_element |  |  |
| check_teardown_pad_by_name | `check_teardown_pad_by_name(element: Gst.Element, name: utf8) -> none` | gst_check_teardown_pad_by_name |  |  |
| check_teardown_sink_pad | `check_teardown_sink_pad(element: Gst.Element) -> none` | gst_check_teardown_sink_pad |  |  |
| check_teardown_src_pad | `check_teardown_src_pad(element: Gst.Element) -> none` | gst_check_teardown_src_pad |  |  |
| consistency_checker_add_pad | `consistency_checker_add_pad(consist: StreamConsistency, pad: Gst.Pad) -> gboolean` | gst_consistency_checker_add_pad |  | Sets up a data probe on the given pad which will raise assertions if the data flow is inconsistent. |
| consistency_checker_free | `consistency_checker_free(consist: StreamConsistency) -> none` | gst_consistency_checker_free |  | Frees the allocated data and probes associated with @consist. |
| consistency_checker_new | `consistency_checker_new(pad: Gst.Pad) -> StreamConsistency` | gst_consistency_checker_new |  | Sets up a data probe on the given pad which will raise assertions if the data flow is inconsistent. |
| consistency_checker_reset | `consistency_checker_reset(consist: StreamConsistency) -> none` | gst_consistency_checker_reset |  | Reset the stream checker's internal variables. |
| harness_new | `harness_new(element_name: utf8) -> Harness` | gst_harness_new | 1.6 | Creates a new harness. Works like gst_harness_new_with_padnames(), except it assumes the #GstElement sinkpad is named "sink" and srcpad is named "s... |
| harness_new_empty | `harness_new_empty() -> Harness` | gst_harness_new_empty | 1.8 | Creates a new empty harness. Use gst_harness_add_element_full() to add an #GstElement to it. MT safe. |
| harness_new_full | `harness_new_full(element: Gst.Element, hsrc: Gst.StaticPadTemplate?, element_sinkpad_name: utf8?, hsink: Gst.StaticPadTemplate?, element_srcpad_name: utf8?) -> Harness` | gst_harness_new_full | 1.6 | Creates a new harness. MT safe. |
| harness_new_parse | `harness_new_parse(launchline: utf8) -> Harness` | gst_harness_new_parse | 1.6 | Creates a new harness, parsing the @launchline and putting that in a #GstBin, and then attches the harness to the bin. MT safe. |
| harness_new_with_element | `harness_new_with_element(element: Gst.Element, element_sinkpad_name: utf8?, element_srcpad_name: utf8?) -> Harness` | gst_harness_new_with_element | 1.6 | Creates a new harness. Works in the same way as gst_harness_new_full(), only that generic padtemplates are used for the harness src and sinkpads, w... |
| harness_new_with_padnames | `harness_new_with_padnames(element_name: utf8, element_sinkpad_name: utf8?, element_srcpad_name: utf8?) -> Harness` | gst_harness_new_with_padnames | 1.6 | Creates a new harness. Works like gst_harness_new_with_element(), except you specify the factoryname of the #GstElement MT safe. |
| harness_new_with_templates | `harness_new_with_templates(element_name: utf8, hsrc: Gst.StaticPadTemplate?, hsink: Gst.StaticPadTemplate?) -> Harness` | gst_harness_new_with_templates | 1.6 | Creates a new harness, like gst_harness_new_full(), except it assumes the #GstElement sinkpad is named "sink" and srcpad is named "src" MT safe. |
| harness_stress_thread_stop | `harness_stress_thread_stop(t: HarnessThread) -> guint` | gst_harness_stress_thread_stop | 1.6 | Stop the running #GstHarnessThread MT safe. |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| CheckLogFilterFunc | `CheckLogFilterFunc(log_domain: utf8, log_level: GLib.LogLevelFlags, message: utf8, user_data: gpointer?) -> gboolean` |  | 1.12 | A function that is called for messages matching the filter added by @gst_check_add_log_filter. |
| HarnessPrepareBufferFunc | `HarnessPrepareBufferFunc(h: Harness, data: gpointer?) -> Gst.Buffer` |  | 1.6 | a #GstHarness |
| HarnessPrepareEventFunc | `HarnessPrepareEventFunc(h: Harness, data: gpointer?) -> Gst.Event` |  | 1.8 | a #GstHarness |

