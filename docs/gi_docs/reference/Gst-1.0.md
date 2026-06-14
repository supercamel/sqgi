# Gst 1.0

SQGI import: `import("Gst", "1.0")`

Packages: `gstreamer-1.0`
Includes: `GLib-2.0`, `GModule-2.0`, `GObject-2.0`
Libraries: `libgstreamer-1.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 44 |
| Interfaces | 5 |
| Records | 109 |
| Unions | 4 |
| Enums | 47 |
| Flags | 38 |
| Functions | 234 |
| Callbacks | 72 |
| Constants | 192 |
| Aliases | 6 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Allocator | Object | 0 | 0 | 5 | Memory is usually created by allocators with a gst_allocator_alloc() method call. When %NULL is used as the allocator, the default allocator will b... |
| Bin | Element | 1 | 5 | 20 | #GstBin is an element that can contain other #GstElement, allowing them to be managed as a group. Pads from the child elements can be ghosted to th... |
| Bitmask |  | 0 | 0 | 0 | A fundamental type that describes a 64-bit bitmask |
| BufferPool | Object | 0 | 0 | 19 | A #GstBufferPool is an object that can be used to pre-allocate and recycle buffers of the same size and with the same properties. A #GstBufferPool ... |
| Bus | Object | 0 | 2 | 23 | The #GstBus is an object responsible for delivering #GstMessage packets in a first-in first-out way from the streaming threads (see #GstTask) to th... |
| Clock | Object | 1 | 1 | 32 | GStreamer uses a global clock to synchronize the plugins in a pipeline. Different clock implementations are possible by implementing this abstract ... |
| ControlBinding | Object | 0 | 0 | 6 | A base class for value mapping objects that attaches control sources to #GObject properties. Such an object is taking one or more #GstControlSource... |
| ControlSource | Object | 0 | 0 | 2 | The #GstControlSource is a base class for control value sources that could be used to get timestamp-value pairs. A control source essentially is a ... |
| Device | Object | 0 | 1 | 8 | #GstDevice are objects representing a device, they contain relevant metadata about the device, such as its class and the #GstCaps representing the ... |
| DeviceMonitor | Object | 0 | 0 | 10 | Applications should create a #GstDeviceMonitor when they want to probe, list and monitor devices of a specific type. The #GstDeviceMonitor will cre... |
| DeviceProvider | Object | 0 | 2 | 15 | A #GstDeviceProvider subclass is provided by a plugin that handles devices if there is a way to programmatically list connected devices. It can als... |
| DeviceProviderFactory | PluginFeature | 0 | 0 | 9 | #GstDeviceProviderFactory is used to create instances of device providers. A GstDeviceProviderfactory can be added to a #GstPlugin as it is also a ... |
| DoubleRange |  | 0 | 0 | 0 | A fundamental type that describes a #gdouble range |
| DynamicTypeFactory | PluginFeature | 0 | 0 | 1 | #GstDynamicTypeFactory is used to represent a type that can be automatically loaded the first time it is used. For example, a non-standard type for... |
| Element | Object | 1 | 3 | 76 | GstElement is the abstract base class needed to construct an element that can be used in a GStreamer pipeline. Please refer to the plugin writers g... |
| ElementFactory | PluginFeature | 0 | 0 | 25 | #GstElementFactory is used to create instances of elements. A GstElementFactory can be added to a #GstPlugin as it is also a #GstPluginFeature. Use... |
| FlagSet |  | 0 | 0 | 1 | A fundamental type that describes a 32-bit flag bitfield, with 32-bit mask indicating which of the bits in the field are explicitly set. |
| Fraction |  | 0 | 0 | 0 | A fundamental type that describes a fraction of an integer numerator over an integer denominator |
| FractionRange |  | 0 | 0 | 0 | A fundamental type that describes a #GstFractionRange range |
| GhostPad | ProxyPad | 0 | 0 | 9 | GhostPads are useful when organizing pipelines with #GstBin like elements. The idea here is to create hierarchical element graphs. The bin element ... |
| Int64Range |  | 0 | 0 | 0 | A fundamental type that describes a #gint64 range |
| IntRange |  | 0 | 0 | 0 | A fundamental type that describes a #gint range |
| Object | GObject.InitiallyUnowned | 21 | 1 | 29 | #GstObject provides a root for the object hierarchy tree filed in by the GStreamer library. It is currently a thin wrapper on top of #GInitiallyUno... |
| Pad | Object | 1 | 2 | 86 | A #GstElement is linked to other elements via "pads", which are extremely light-weight generic link points. Pads have a #GstPadDirection, source pa... |
| PadTemplate | Object | 0 | 1 | 7 | Padtemplates describe the possible media types a pad or an elementfactory can handle. This allows for both inspection of handled types before loadi... |
| ParamArray | GObject.ParamSpec | 0 | 0 | 0 | A fundamental type that describes a #GParamSpec for arrays of values |
| ParamFraction | GObject.ParamSpec | 0 | 0 | 0 | A fundamental type that describes a #GParamSpec for fractional properties |
| Pipeline | Bin | 0 | 0 | 15 | A #GstPipeline is a special #GstBin used as the toplevel container for the filter graph. The #GstPipeline will manage the selection and distributio... |
| Plugin | Object | 0 | 0 | 26 | GStreamer is extensible, so #GstElement instances can be loaded at runtime. A plugin system can provide one or more of the basic GStreamer #GstPlug... |
| PluginFeature | Object | 5 | 0 | 10 | This is a base class for anything that can be added to a #GstPlugin. |
| ProxyPad | Pad | 1 | 0 | 5 | Invoke the default chain function of the proxy pad. |
| Registry | Object | 0 | 2 | 19 | One registry holds the metadata of a set of plugins. <emphasis role="bold">Design:</emphasis> The #GstRegistry object is a list of plugins and some... |
| SharedTaskPool | TaskPool | 0 | 0 | 3 | The #GstSharedTaskPool object. |
| Stream | Object | 0 | 0 | 10 | A high-level object representing a single stream. It might be backed, or not, by an actual flow of data in a pipeline (#GstPad). A #GstStream does ... |
| StreamCollection | Object | 0 | 1 | 5 | A collection of #GstStream that are available. A #GstStreamCollection will be provided by elements that can make those streams available. Applicati... |
| SystemClock | Clock | 0 | 0 | 2 | The GStreamer core provides a GstSystemClock based on the system time. Asynchronous callbacks are scheduled from an internal thread. Clock implemen... |
| Task | Object | 0 | 0 | 14 | #GstTask is used by #GstElement and #GstPad to provide the data passing threads in a #GstPipeline. A #GstPad will typically start a #GstTask to pus... |
| TaskPool | Object | 1 | 0 | 6 | This object provides an abstraction for creating threads. The default implementation uses a regular GThreadPool to start tasks. Subclasses can be m... |
| Tracer | Object | 0 | 0 | 1 | Tracing modules will subclass #GstTracer and register through gst_tracer_register(). Modules can attach to various hook-types - see gst_tracing_reg... |
| TracerFactory | PluginFeature | 0 | 0 | 2 | Use gst_tracer_factory_get_list() to get a list of tracer factories known to GStreamer. |
| TracerRecord | Object | 0 | 0 | 2 | Tracing modules will create instances of this class to announce the data they will log and create a log formatter. |
| TypeFindFactory | PluginFeature | 0 | 0 | 5 | These functions allow querying information about registered typefind functions. How to create and register these functions is described in the sect... |
| ValueArray |  | 0 | 0 | 6 | A fundamental type that describes an ordered list of #GValue |
| ValueList |  | 0 | 0 | 8 | A fundamental type that describes an unordered list of #GValue |

### Gst.Allocator

Parent: `Object` ?? GType: `GstAllocator` ?? C type: `GstAllocator` ?? Abstract

Memory is usually created by allocators with a gst_allocator_alloc() method call. When %NULL is used as the allocator, the default allocator will b...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| mem_copy | MemoryCopyFunction |
| mem_is_span | MemoryIsSpanFunction |
| mem_map | MemoryMapFunction |
| mem_map_full | MemoryMapFullFunction |
| mem_share | MemoryShareFunction |
| mem_type | utf8 |
| mem_unmap | MemoryUnmapFunction |
| mem_unmap_full | MemoryUnmapFullFunction |
| object | Object |
| priv | AllocatorPrivate |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| find | `find(name: utf8?) -> Allocator` | gst_allocator_find |  | Find a previously registered allocator with @name. When @name is %NULL, the default allocator will be returned. |
| register | `register(name: utf8, allocator: Allocator) -> none` | gst_allocator_register |  | Registers the memory @allocator with @name. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `Allocator.alloc(size: gsize, params: AllocationParams?) -> Memory` | gst_allocator_alloc |  | Use @allocator to allocate a new memory block with memory that is at least @size big. The optional @params can specify the prefix and padding for t... |
| free | `Allocator.free(memory: Memory) -> none` | gst_allocator_free |  | Free @memory that was previously allocated with gst_allocator_alloc(). |
| set_default | `Allocator.set_default() -> none` | gst_allocator_set_default |  | Set the default allocator. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `alloc(size: gsize, params: AllocationParams?) -> Memory` |  |  | Use @allocator to allocate a new memory block with memory that is at least @size big. The optional @params can specify the prefix and padding for t... |
| free | `free(memory: Memory) -> none` |  |  | Free @memory that was previously allocated with gst_allocator_alloc(). |

### Gst.Bin

Parent: `Element` ?? Subclasses: `Pipeline` ?? Implements: `ChildProxy` ?? GType: `GstBin` ?? C type: `GstBin`

#GstBin is an element that can contain other #GstElement, allowing them to be managed as a group. Pads from the child elements can be ghosted to th...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| child_bus | Bus |
| children | GLib.List |
| children_cookie | guint32 |
| clock_dirty | gboolean |
| clock_provider | Element |
| element | Element |
| messages | GLib.List |
| numchildren | gint |
| polling | gboolean |
| priv | BinPrivate |
| provided_clock | Clock |
| state_dirty | gboolean |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Bin.new(name: utf8?) -> Element` | gst_bin_new |  | Creates a new bin with the given name. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `Bin.add(element: Element) -> gboolean` | gst_bin_add |  | Adds the given element to the bin. Sets the element's parent, and thus takes ownership of the element. An element can only be added to one bin. If ... |
| add_many | `Bin.add_many(element_1: Element, ...: void) -> none` | gst_bin_add_many |  | Adds a %NULL-terminated list of elements to a bin. This function is equivalent to calling gst_bin_add() for each member of the list. The return val... |
| find_unlinked_pad | `Bin.find_unlinked_pad(direction: PadDirection) -> Pad` | gst_bin_find_unlinked_pad |  | Recursively looks for elements with an unlinked pad of the given direction within the specified bin and returns an unlinked pad if one is found, or... |
| get_by_interface | `Bin.get_by_interface(iface: GType) -> Element` | gst_bin_get_by_interface |  | Looks for an element inside the bin that implements the given interface. If such an element is found, it returns the element. You can cast this ele... |
| get_by_name | `Bin.get_by_name(name: utf8) -> Element` | gst_bin_get_by_name |  | Gets the element with the given name from a bin. This function recurses into child bins. |
| get_by_name_recurse_up | `Bin.get_by_name_recurse_up(name: utf8) -> Element` | gst_bin_get_by_name_recurse_up |  | Gets the element with the given name from this bin. If the element is not found, a recursion is performed on the parent bin. |
| get_suppressed_flags | `Bin.get_suppressed_flags() -> ElementFlags` | gst_bin_get_suppressed_flags | 1.10 | the bin's suppressed #GstElementFlags. |
| iterate_all_by_element_factory_name | `Bin.iterate_all_by_element_factory_name(factory_name: utf8) -> Iterator` | gst_bin_iterate_all_by_element_factory_name | 1.18 | Looks for all elements inside the bin with the given element factory name. The function recurses inside child bins. The iterator will yield a serie... |
| iterate_all_by_interface | `Bin.iterate_all_by_interface(iface: GType) -> Iterator` | gst_bin_iterate_all_by_interface |  | Looks for all elements inside the bin that implements the given interface. You can safely cast all returned elements to the given interface. The fu... |
| iterate_elements | `Bin.iterate_elements() -> Iterator` | gst_bin_iterate_elements |  | Gets an iterator for the elements in this bin. |
| iterate_recurse | `Bin.iterate_recurse() -> Iterator` | gst_bin_iterate_recurse |  | Gets an iterator for the elements in this bin. This iterator recurses into GstBin children. |
| iterate_sinks | `Bin.iterate_sinks() -> Iterator` | gst_bin_iterate_sinks |  | Gets an iterator for all elements in the bin that have the #GST_ELEMENT_FLAG_SINK flag set. |
| iterate_sorted | `Bin.iterate_sorted() -> Iterator` | gst_bin_iterate_sorted |  | Gets an iterator for the elements in this bin in topologically sorted order. This means that the elements are returned from the most downstream ele... |
| iterate_sources | `Bin.iterate_sources() -> Iterator` | gst_bin_iterate_sources |  | Gets an iterator for all elements in the bin that have the #GST_ELEMENT_FLAG_SOURCE flag set. |
| recalculate_latency | `Bin.recalculate_latency() -> gboolean` | gst_bin_recalculate_latency |  | Queries @bin for the current latency and reconfigures this latency on all the elements using a LATENCY event. This method is typically called on th... |
| remove | `Bin.remove(element: Element) -> gboolean` | gst_bin_remove |  | Removes the element from the bin, unparenting it as well. Unparenting the element means that the element will be dereferenced, so if the bin holds ... |
| remove_many | `Bin.remove_many(element_1: Element, ...: void) -> none` | gst_bin_remove_many |  | Removes a list of elements from a bin. This function is equivalent to calling gst_bin_remove() with each member of the list. |
| set_suppressed_flags | `Bin.set_suppressed_flags(flags: ElementFlags) -> none` | gst_bin_set_suppressed_flags | 1.10 | Suppresses the given flags on the bin. #GstElementFlags of a child element are propagated when it is added to the bin. When suppressed flags are se... |
| sync_children_states | `Bin.sync_children_states() -> gboolean` | gst_bin_sync_children_states | 1.6 | Synchronizes the state of every child of @bin with the state of @bin. See also gst_element_sync_state_with_parent(). |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| async-handling | gboolean | read, write | If set to %TRUE, the bin will handle asynchronous state changes. This should be used only if the bin subclass is modifying the state of its childre... |
| message-forward | gboolean | read, write | Forward all children messages, even those that would normally be filtered by the bin. This can be interesting when one wants to be notified of the ... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| deep-element-added | `sub_bin: Bin, element: Element` | none | first | 1.10 | Will be emitted after the element was added to @sub_bin. |
| deep-element-removed | `sub_bin: Bin, element: Element` | none | first | 1.10 | Will be emitted after the element was removed from @sub_bin. |
| do-latency | `` | gboolean | last |  | Will be emitted when the bin needs to perform latency calculations. This signal is only emitted for toplevel bins or when #GstBin:async-handling is... |
| element-added | `element: Element` | none | first |  | Will be emitted after the element was added to the bin. |
| element-removed | `element: Element` | none | first |  | Will be emitted after the element was removed from the bin. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_element | `add_element(element: Element) -> gboolean` |  |  | Method to add an element to the bin. |
| deep_element_added | `deep_element_added(sub_bin: Bin, child: Element) -> none` |  |  | Method called when an element was added somewhere in the bin hierarchy. |
| deep_element_removed | `deep_element_removed(sub_bin: Bin, child: Element) -> none` |  |  | Method called when an element was removed somewhere in the bin hierarchy. |
| do_latency | `do_latency() -> gboolean` |  |  |  |
| element_added | `element_added(child: Element) -> none` |  |  | Method called when an element was added to the bin. |
| element_removed | `element_removed(child: Element) -> none` |  |  | Method called when an element was removed from the bin. |
| handle_message | `handle_message(message: Message) -> none` |  |  | Method to handle a message from the children. |
| remove_element | `remove_element(element: Element) -> gboolean` |  |  | Method to remove an element from the bin. |

### Gst.Bitmask

GType: `GstBitmask`

A fundamental type that describes a 64-bit bitmask

### Gst.BufferPool

Parent: `Object` ?? GType: `GstBufferPool` ?? C type: `GstBufferPool`

A #GstBufferPool is an object that can be used to pre-allocate and recycle buffers of the same size and with the same properties. A #GstBufferPool ...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| flushing | gint |
| object | Object |
| priv | BufferPoolPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `BufferPool.new() -> BufferPool` | gst_buffer_pool_new |  | Creates a new #GstBufferPool instance. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| config_add_option | `config_add_option(config: Structure, option: utf8) -> none` | gst_buffer_pool_config_add_option |  | Enables the option in @config. This will instruct the @bufferpool to enable the specified option on the buffers that it allocates. The options supp... |
| config_get_allocator | `config_get_allocator(config: Structure, allocator: out Allocator?, params: out AllocationParams?) -> gboolean` | gst_buffer_pool_config_get_allocator |  | Gets the @allocator and @params from @config. |
| config_get_option | `config_get_option(config: Structure, index: guint) -> utf8` | gst_buffer_pool_config_get_option |  | Parses an available @config and gets the option at @index of the options API array. |
| config_get_params | `config_get_params(config: Structure, caps: out Caps?, size: out guint?, min_buffers: out guint?, max_buffers: out guint?) -> gboolean` | gst_buffer_pool_config_get_params |  | Gets the configuration values from @config. |
| config_has_option | `config_has_option(config: Structure, option: utf8) -> gboolean` | gst_buffer_pool_config_has_option |  | Checks if @config contains @option. |
| config_n_options | `config_n_options(config: Structure) -> guint` | gst_buffer_pool_config_n_options |  | Retrieves the number of values currently stored in the options array of the @config structure. |
| config_set_allocator | `config_set_allocator(config: Structure, allocator: Allocator?, params: AllocationParams?) -> none` | gst_buffer_pool_config_set_allocator |  | Sets the @allocator and @params on @config. One of @allocator and @params can be %NULL, but not both. When @allocator is %NULL, the default allocat... |
| config_set_params | `config_set_params(config: Structure, caps: Caps?, size: guint, min_buffers: guint, max_buffers: guint) -> none` | gst_buffer_pool_config_set_params |  | Configures @config with the given parameters. |
| config_validate_params | `config_validate_params(config: Structure, caps: Caps?, size: guint, min_buffers: guint, max_buffers: guint) -> gboolean` | gst_buffer_pool_config_validate_params | 1.4 | Validates that changes made to @config are still valid in the context of the expected parameters. This function is a helper that can be used to val... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| acquire_buffer | `BufferPool.acquire_buffer(buffer: out Buffer?, params: BufferPoolAcquireParams?) -> FlowReturn` | gst_buffer_pool_acquire_buffer |  | Acquires a buffer from @pool. @buffer should point to a memory location that can hold a pointer to the new buffer. When the pool is empty, this fun... |
| get_config | `BufferPool.get_config() -> Structure` | gst_buffer_pool_get_config |  | Gets a copy of the current configuration of the pool. This configuration can be modified and used for the gst_buffer_pool_set_config() call. |
| get_options | `BufferPool.get_options() -> utf8` | gst_buffer_pool_get_options |  | Gets a %NULL terminated array of string with supported bufferpool options for @pool. An option would typically be enabled with gst_buffer_pool_conf... |
| has_option | `BufferPool.has_option(option: utf8) -> gboolean` | gst_buffer_pool_has_option |  | Checks if the bufferpool supports @option. |
| is_active | `BufferPool.is_active() -> gboolean` | gst_buffer_pool_is_active |  | Checks if @pool is active. A pool can be activated with the gst_buffer_pool_set_active() call. |
| release_buffer | `BufferPool.release_buffer(buffer: Buffer) -> none` | gst_buffer_pool_release_buffer |  | Releases @buffer to @pool. @buffer should have previously been allocated from @pool with gst_buffer_pool_acquire_buffer(). This function is usually... |
| set_active | `BufferPool.set_active(active: gboolean) -> gboolean` | gst_buffer_pool_set_active |  | Controls the active state of @pool. When the pool is inactive, new calls to gst_buffer_pool_acquire_buffer() will return with %GST_FLOW_FLUSHING. A... |
| set_config | `BufferPool.set_config(config: Structure) -> gboolean` | gst_buffer_pool_set_config |  | Sets the configuration of the pool. If the pool is already configured, and the configuration hasn't changed, this function will return %TRUE. If th... |
| set_flushing | `BufferPool.set_flushing(flushing: gboolean) -> none` | gst_buffer_pool_set_flushing | 1.4 | Enables or disables the flushing state of a @pool without freeing or allocating buffers. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| acquire_buffer | `acquire_buffer(buffer: out Buffer?, params: BufferPoolAcquireParams?) -> FlowReturn` |  |  | Acquires a buffer from @pool. @buffer should point to a memory location that can hold a pointer to the new buffer. When the pool is empty, this fun... |
| alloc_buffer | `alloc_buffer(buffer: out Buffer?, params: BufferPoolAcquireParams?) -> FlowReturn` |  |  | Allocate a buffer. the default implementation allocates buffers from the configured memory allocator and with the configured parameters. All metada... |
| flush_start | `flush_start() -> none` |  | 1.4 | Enter the flushing state. |
| flush_stop | `flush_stop() -> none` |  | 1.4 | Leave the flushing state. |
| free_buffer | `free_buffer(buffer: Buffer) -> none` |  |  | Free a buffer. The default implementation unrefs the buffer. |
| get_options | `get_options() -> utf8` |  |  | Gets a %NULL terminated array of string with supported bufferpool options for @pool. An option would typically be enabled with gst_buffer_pool_conf... |
| release_buffer | `release_buffer(buffer: Buffer) -> none` |  |  | Releases @buffer to @pool. @buffer should have previously been allocated from @pool with gst_buffer_pool_acquire_buffer(). This function is usually... |
| reset_buffer | `reset_buffer(buffer: Buffer) -> none` |  |  | Reset the buffer to its state when it was freshly allocated. The default implementation will clear the flags, timestamps and will remove the metada... |
| set_config | `set_config(config: Structure) -> gboolean` |  |  | Sets the configuration of the pool. If the pool is already configured, and the configuration hasn't changed, this function will return %TRUE. If th... |
| start | `start() -> gboolean` |  |  | Start the bufferpool. The default implementation will preallocate min-buffers buffers and put them in the queue. |
| stop | `stop() -> gboolean` |  |  | Stop the bufferpool. the default implementation will free the preallocated buffers. This function is called when all the buffers are returned to th... |

### Gst.Bus

Parent: `Object` ?? GType: `GstBus` ?? C type: `GstBus`

The #GstBus is an object responsible for delivering #GstMessage packets in a first-in first-out way from the streaming threads (see #GstTask) to th...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| object | Object |
| priv | BusPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Bus.new() -> Bus` | gst_bus_new |  | Creates a new #GstBus instance. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_signal_watch | `Bus.add_signal_watch() -> none` | gst_bus_add_signal_watch |  | Adds a bus signal watch to the default main context with the default priority ( %G_PRIORITY_DEFAULT ). It is also possible to use a non-default mai... |
| add_signal_watch_full | `Bus.add_signal_watch_full(priority: gint) -> none` | gst_bus_add_signal_watch_full |  | Adds a bus signal watch to the default main context with the given @priority (e.g. %G_PRIORITY_DEFAULT). It is also possible to use a non-default m... |
| add_watch | `Bus.add_watch(func: BusFunc, user_data: gpointer?) -> guint` | gst_bus_add_watch |  | Adds a bus watch to the default main context with the default priority ( %G_PRIORITY_DEFAULT ). It is also possible to use a non-default main conte... |
| add_watch_full | `Bus.add_watch_full(priority: gint, func: BusFunc, user_data: gpointer?, notify: GLib.DestroyNotify) -> guint` | gst_bus_add_watch_full |  | Adds a bus watch to the default main context with the given @priority (e.g. %G_PRIORITY_DEFAULT). It is also possible to use a non-default main con... |
| async_signal_func | `Bus.async_signal_func(message: Message, data: gpointer?) -> gboolean` | gst_bus_async_signal_func |  | A helper #GstBusFunc that can be used to convert all asynchronous messages into signals. |
| create_watch | `Bus.create_watch() -> GLib.Source` | gst_bus_create_watch |  | Create watch for this bus. The #GSource will be dispatched whenever a message is on the bus. After the GSource is dispatched, the message is popped... |
| disable_sync_message_emission | `Bus.disable_sync_message_emission() -> none` | gst_bus_disable_sync_message_emission |  | Instructs GStreamer to stop emitting the "sync-message" signal for this bus. See gst_bus_enable_sync_message_emission() for more information. In th... |
| enable_sync_message_emission | `Bus.enable_sync_message_emission() -> none` | gst_bus_enable_sync_message_emission |  | Instructs GStreamer to emit the "sync-message" signal after running the bus's sync handler. This function is here so that code can ensure that they... |
| get_pollfd | `Bus.get_pollfd(fd: out GLib.PollFD) -> none` | gst_bus_get_pollfd | 1.14 | Gets the file descriptor from the bus which can be used to get notified about messages being available with functions like g_poll(), and allows int... |
| have_pending | `Bus.have_pending() -> gboolean` | gst_bus_have_pending |  | Checks if there are pending messages on the bus that should be handled. |
| peek | `Bus.peek() -> Message` | gst_bus_peek |  | Peeks the message on the top of the bus' queue. The message will remain on the bus' message queue. |
| poll | `Bus.poll(events: MessageType, timeout: ClockTime) -> Message` | gst_bus_poll |  | Polls the bus for messages. Will block while waiting for messages to come. You can specify a maximum time to poll with the @timeout parameter. If @... |
| pop | `Bus.pop() -> Message` | gst_bus_pop |  | Gets a message from the bus. |
| pop_filtered | `Bus.pop_filtered(types: MessageType) -> Message` | gst_bus_pop_filtered |  | Gets a message matching @type from the bus. Will discard all messages on the bus that do not match @type and that have been posted before the first... |
| post | `Bus.post(message: Message) -> gboolean` | gst_bus_post |  | Posts a message on the given bus. Ownership of the message is taken by the bus. |
| remove_signal_watch | `Bus.remove_signal_watch() -> none` | gst_bus_remove_signal_watch |  | Removes a signal watch previously added with gst_bus_add_signal_watch(). |
| remove_watch | `Bus.remove_watch() -> gboolean` | gst_bus_remove_watch | 1.6 | Removes an installed bus watch from @bus. |
| set_flushing | `Bus.set_flushing(flushing: gboolean) -> none` | gst_bus_set_flushing |  | If @flushing, flushes out and unrefs any messages queued in the bus. Releases references to the message origin objects. Will flush future messages ... |
| set_sync_handler | `Bus.set_sync_handler(func: BusSyncHandler?, user_data: gpointer?, notify: GLib.DestroyNotify) -> none` | gst_bus_set_sync_handler |  | Sets the synchronous handler on the bus. The function will be called every time a new message is posted on the bus. Note that the function will be ... |
| sync_signal_handler | `Bus.sync_signal_handler(message: Message, data: gpointer?) -> BusSyncReply` | gst_bus_sync_signal_handler |  | A helper #GstBusSyncHandler that can be used to convert all synchronous messages into signals. |
| timed_pop | `Bus.timed_pop(timeout: ClockTime) -> Message` | gst_bus_timed_pop |  | Gets a message from the bus, waiting up to the specified timeout. If @timeout is 0, this function behaves like gst_bus_pop(). If @timeout is #GST_C... |
| timed_pop_filtered | `Bus.timed_pop_filtered(timeout: ClockTime, types: MessageType) -> Message` | gst_bus_timed_pop_filtered |  | Gets a message from the bus whose type matches the message type mask @types, waiting up to the specified timeout (and discarding any messages that ... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| enable-async | gboolean | write, construct-only | Enables async message delivery support for bus watches, gst_bus_pop() and similar API. Without this only the synchronous message handlers are calle... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| message | `message: Message` | none | last detailed |  | A message has been posted on the bus. This signal is emitted from a #GSource added to the mainloop. this signal will only be emitted when there is ... |
| sync-message | `message: Message` | none | last detailed |  | A message has been posted on the bus. This signal is emitted from the thread that posted the message so one has to be careful with locking. This si... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| message | `message(message: Message) -> none` |  |  | A message has been posted on the bus. |
| sync_message | `sync_message(message: Message) -> none` |  |  | A message has been posted on the bus. |

### Gst.Clock

Parent: `Object` ?? Subclasses: `SystemClock` ?? GType: `GstClock` ?? C type: `GstClock` ?? Abstract

GStreamer uses a global clock to synchronize the plugins in a pipeline. Different clock implementations are possible by implementing this abstract ...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| object | Object |
| priv | ClockPrivate |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| id_compare_func | `id_compare_func(id1: gpointer?, id2: gpointer?) -> gint` | gst_clock_id_compare_func |  | Compares the two #GstClockID instances. This function can be used as a GCompareFunc when sorting ids. |
| id_get_clock | `id_get_clock(id: ClockID) -> Clock` | gst_clock_id_get_clock | 1.16 | This function returns the underlying clock. |
| id_get_time | `id_get_time(id: ClockID) -> ClockTime` | gst_clock_id_get_time |  | Gets the time of the clock ID |
| id_ref | `id_ref(id: ClockID) -> ClockID` | gst_clock_id_ref |  | Increases the refcount of given @id. |
| id_unref | `id_unref(id: ClockID) -> none` | gst_clock_id_unref |  | Unrefs given @id. When the refcount reaches 0 the #GstClockID will be freed. |
| id_unschedule | `id_unschedule(id: ClockID) -> none` | gst_clock_id_unschedule |  | Cancels an outstanding request with @id. This can either be an outstanding async notification or a pending sync notification. After this call, @id ... |
| id_uses_clock | `id_uses_clock(id: ClockID, clock: Clock) -> gboolean` | gst_clock_id_uses_clock | 1.16 | This function returns whether @id uses @clock as the underlying clock. @clock can be NULL, in which case the return value indicates whether the und... |
| id_wait | `id_wait(id: ClockID, jitter: out ClockTimeDiff?) -> ClockReturn` | gst_clock_id_wait |  | Performs a blocking wait on @id. @id should have been created with gst_clock_new_single_shot_id() or gst_clock_new_periodic_id() and should not hav... |
| id_wait_async | `id_wait_async(id: ClockID, func: ClockCallback, user_data: gpointer?, destroy_data: GLib.DestroyNotify) -> ClockReturn` | gst_clock_id_wait_async |  | Registers a callback on the given #GstClockID @id with the given function and user_data. When passing a #GstClockID with an invalid time to this fu... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_observation | `Clock.add_observation(slave: ClockTime, master: ClockTime, r_squared: out gdouble) -> gboolean` | gst_clock_add_observation |  | The time @master of the master clock and the time @slave of the slave clock are added to the list of observations. If enough observations are avail... |
| add_observation_unapplied | `Clock.add_observation_unapplied(slave: ClockTime, master: ClockTime, r_squared: out gdouble, internal: out ClockTime?, external: out ClockTime?, rate_num: out ClockTime?, rate_denom: out ClockTime?) -> gboolean` | gst_clock_add_observation_unapplied | 1.6 | Add a clock observation to the internal slaving algorithm the same as gst_clock_add_observation(), and return the result of the master clock estima... |
| adjust_unlocked | `Clock.adjust_unlocked(internal: ClockTime) -> ClockTime` | gst_clock_adjust_unlocked |  | Converts the given @internal clock time to the external time, adjusting for the rate and reference time set with gst_clock_set_calibration() and ma... |
| adjust_with_calibration | `Clock.adjust_with_calibration(internal_target: ClockTime, cinternal: ClockTime, cexternal: ClockTime, cnum: ClockTime, cdenom: ClockTime) -> ClockTime` | gst_clock_adjust_with_calibration | 1.6 | Converts the given @internal_target clock time to the external time, using the passed calibration parameters. This function performs the same calcu... |
| get_calibration | `Clock.get_calibration(internal: out ClockTime?, external: out ClockTime?, rate_num: out ClockTime?, rate_denom: out ClockTime?) -> none` | gst_clock_get_calibration |  | Gets the internal rate and reference time of @clock. See gst_clock_set_calibration() for more information. @internal, @external, @rate_num, and @ra... |
| get_internal_time | `Clock.get_internal_time() -> ClockTime` | gst_clock_get_internal_time |  | Gets the current internal time of the given clock. The time is returned unadjusted for the offset and the rate. |
| get_master | `Clock.get_master() -> Clock` | gst_clock_get_master |  | Gets the master clock that @clock is slaved to or %NULL when the clock is not slaved to any master clock. |
| get_resolution | `Clock.get_resolution() -> ClockTime` | gst_clock_get_resolution |  | Gets the accuracy of the clock. The accuracy of the clock is the granularity of the values returned by gst_clock_get_time(). |
| get_time | `Clock.get_time() -> ClockTime` | gst_clock_get_time |  | Gets the current time of the given clock. The time is always monotonically increasing and adjusted according to the current offset and rate. |
| get_timeout | `Clock.get_timeout() -> ClockTime` | gst_clock_get_timeout |  | Gets the amount of time that master and slave clocks are sampled. |
| is_synced | `Clock.is_synced() -> gboolean` | gst_clock_is_synced | 1.6 | Checks if the clock is currently synced, by looking at whether %GST_CLOCK_FLAG_NEEDS_STARTUP_SYNC is set. |
| new_periodic_id | `Clock.new_periodic_id(start_time: ClockTime, interval: ClockTime) -> ClockID` | gst_clock_new_periodic_id |  | Gets an ID from @clock to trigger a periodic notification. The periodic notifications will start at time @start_time and will then be fired with th... |
| new_single_shot_id | `Clock.new_single_shot_id(time: ClockTime) -> ClockID` | gst_clock_new_single_shot_id |  | Gets a #GstClockID from @clock to trigger a single shot notification at the requested time. |
| periodic_id_reinit | `Clock.periodic_id_reinit(id: ClockID, start_time: ClockTime, interval: ClockTime) -> gboolean` | gst_clock_periodic_id_reinit |  | Reinitializes the provided periodic @id to the provided start time and interval. Does not modify the reference count. |
| set_calibration | `Clock.set_calibration(internal: ClockTime, external: ClockTime, rate_num: ClockTime, rate_denom: ClockTime) -> none` | gst_clock_set_calibration |  | Adjusts the rate and time of @clock. A rate of 1/1 is the normal speed of the clock. Values bigger than 1/1 make the clock go faster. @internal and... |
| set_master | `Clock.set_master(master: Clock?) -> gboolean` | gst_clock_set_master |  | Sets @master as the master clock for @clock. @clock will be automatically calibrated so that gst_clock_get_time() reports the same time as the mast... |
| set_resolution | `Clock.set_resolution(resolution: ClockTime) -> ClockTime` | gst_clock_set_resolution |  | Sets the accuracy of the clock. Some clocks have the possibility to operate with different accuracy at the expense of more resource usage. There is... |
| set_synced | `Clock.set_synced(synced: gboolean) -> none` | gst_clock_set_synced | 1.6 | Sets @clock to synced and emits the #GstClock::synced signal, and wakes up any thread waiting in gst_clock_wait_for_sync(). This function must only... |
| set_timeout | `Clock.set_timeout(timeout: ClockTime) -> none` | gst_clock_set_timeout |  | Sets the amount of time, in nanoseconds, to sample master and slave clocks |
| single_shot_id_reinit | `Clock.single_shot_id_reinit(id: ClockID, time: ClockTime) -> gboolean` | gst_clock_single_shot_id_reinit |  | Reinitializes the provided single shot @id to the provided time. Does not modify the reference count. |
| unadjust_unlocked | `Clock.unadjust_unlocked(external: ClockTime) -> ClockTime` | gst_clock_unadjust_unlocked |  | Converts the given @external clock time to the internal time of @clock, using the rate and reference time set with gst_clock_set_calibration(). Thi... |
| unadjust_with_calibration | `Clock.unadjust_with_calibration(external_target: ClockTime, cinternal: ClockTime, cexternal: ClockTime, cnum: ClockTime, cdenom: ClockTime) -> ClockTime` | gst_clock_unadjust_with_calibration | 1.8 | Converts the given @external_target clock time to the internal time, using the passed calibration parameters. This function performs the same calcu... |
| wait_for_sync | `Clock.wait_for_sync(timeout: ClockTime) -> gboolean` | gst_clock_wait_for_sync | 1.6 | Waits until @clock is synced for reporting the current time. If @timeout is %GST_CLOCK_TIME_NONE it will wait forever, otherwise it will time out a... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| timeout | guint64 | read, write |  |
| window-size | gint | read, write |  |
| window-threshold | gint | read, write |  |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| synced | `synced: gboolean` | none | last | 1.6 | Signaled on clocks with %GST_CLOCK_FLAG_NEEDS_STARTUP_SYNC set once the clock is synchronized, or when it completely lost synchronization. This sig... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| change_resolution | `change_resolution(old_resolution: ClockTime, new_resolution: ClockTime) -> ClockTime` |  |  | Change the resolution of the clock. Not all values might be acceptable. |
| get_internal_time | `get_internal_time() -> ClockTime` |  |  | Gets the current internal time of the given clock. The time is returned unadjusted for the offset and the rate. |
| get_resolution | `get_resolution() -> ClockTime` |  |  | Gets the accuracy of the clock. The accuracy of the clock is the granularity of the values returned by gst_clock_get_time(). |
| unschedule | `unschedule(entry: ClockEntry) -> none` |  |  | Unblock a blocking or async wait operation. |
| wait | `wait(entry: ClockEntry, jitter: out ClockTimeDiff?) -> ClockReturn` |  |  | Perform a blocking wait on the given #GstClockEntry and return the jitter. |
| wait_async | `wait_async(entry: ClockEntry) -> ClockReturn` |  |  | Perform an asynchronous wait on the given #GstClockEntry. |

### Gst.ControlBinding

Parent: `Object` ?? GType: `GstControlBinding` ?? C type: `GstControlBinding` ?? Abstract

A base class for value mapping objects that attaches control sources to #GObject properties. Such an object is taking one or more #GstControlSource...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| disabled | gboolean |
| name | utf8 |
| object | Object |
| parent | Object |
| priv | ControlBindingPrivate |
| pspec | GObject.ParamSpec |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_g_value_array | `ControlBinding.get_g_value_array(timestamp: ClockTime, interval: ClockTime, n_values: guint, values: GObject.Value) -> gboolean` | gst_control_binding_get_g_value_array |  | Gets a number of #GValues for the given controlled property starting at the requested time. The array @values need to hold enough space for @n_valu... |
| get_value | `ControlBinding.get_value(timestamp: ClockTime) -> GObject.Value` | gst_control_binding_get_value |  | Gets the value for the given controlled property at the requested time. |
| get_value_array | `ControlBinding.get_value_array(timestamp: ClockTime, interval: ClockTime, n_values: guint, values: gpointer) -> gboolean` | gst_control_binding_get_value_array |  | Gets a number of values for the given controlled property starting at the requested time. The array @values needs to hold enough space for @n_value... |
| is_disabled | `ControlBinding.is_disabled() -> gboolean` | gst_control_binding_is_disabled |  | Checks if the control binding is disabled. |
| set_disabled | `ControlBinding.set_disabled(disabled: gboolean) -> none` | gst_control_binding_set_disabled |  | This function is used to disable a control binding for some time, i.e. gst_object_sync_values() will do nothing. |
| sync_values | `ControlBinding.sync_values(object: Object, timestamp: ClockTime, last_sync: ClockTime) -> gboolean` | gst_control_binding_sync_values |  | Sets the property of the @object, according to the #GstControlSources that handles it and for the given timestamp. If this function fails, it is mo... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| name | utf8 | read, write, construct-only |  |
| object | Object | read, write, construct-only |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_g_value_array | `get_g_value_array(timestamp: ClockTime, interval: ClockTime, n_values: guint, values: GObject.Value) -> gboolean` |  |  | Gets a number of #GValues for the given controlled property starting at the requested time. The array @values need to hold enough space for @n_valu... |
| get_value | `get_value(timestamp: ClockTime) -> GObject.Value` |  |  | Gets the value for the given controlled property at the requested time. |
| get_value_array | `get_value_array(timestamp: ClockTime, interval: ClockTime, n_values: guint, values: gpointer) -> gboolean` |  |  | Gets a number of values for the given controlled property starting at the requested time. The array @values needs to hold enough space for @n_value... |
| sync_values | `sync_values(object: Object, timestamp: ClockTime, last_sync: ClockTime) -> gboolean` |  |  | Sets the property of the @object, according to the #GstControlSources that handles it and for the given timestamp. If this function fails, it is mo... |

### Gst.ControlSource

Parent: `Object` ?? GType: `GstControlSource` ?? C type: `GstControlSource` ?? Abstract

The #GstControlSource is a base class for control value sources that could be used to get timestamp-value pairs. A control source essentially is a ...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| get_value | ControlSourceGetValue |
| get_value_array | ControlSourceGetValueArray |
| parent | Object |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| control_source_get_value | `ControlSource.control_source_get_value(timestamp: ClockTime, value: out gdouble) -> gboolean` | gst_control_source_get_value |  | Gets the value for this #GstControlSource at a given timestamp. |
| control_source_get_value_array | `ControlSource.control_source_get_value_array(timestamp: ClockTime, interval: ClockTime, n_values: guint, values: gdouble) -> gboolean` | gst_control_source_get_value_array |  | Gets an array of values for for this #GstControlSource. Values that are undefined contain NANs. |

### Gst.Device

Parent: `Object` ?? GType: `GstDevice` ?? C type: `GstDevice` ?? Abstract

#GstDevice are objects representing a device, they contain relevant metadata about the device, such as its class and the #GstCaps representing the ...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent | Object |
| priv | DevicePrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| create_element | `Device.create_element(name: utf8?) -> Element` | gst_device_create_element | 1.4 | Creates the element with all of the required parameters set to use this device. |
| get_caps | `Device.get_caps() -> Caps` | gst_device_get_caps | 1.4 | Getter for the #GstCaps that this device supports. |
| get_device_class | `Device.get_device_class() -> utf8` | gst_device_get_device_class | 1.4 | Gets the "class" of a device. This is a "/" separated list of classes that represent this device. They are a subset of the classes of the #GstDevic... |
| get_display_name | `Device.get_display_name() -> utf8` | gst_device_get_display_name | 1.4 | Gets the user-friendly name of the device. |
| get_properties | `Device.get_properties() -> Structure` | gst_device_get_properties | 1.6 | Gets the extra properties of a device. |
| has_classes | `Device.has_classes(classes: utf8) -> gboolean` | gst_device_has_classes | 1.4 | Check if @device matches all of the given classes |
| has_classesv | `Device.has_classesv(classes: utf8) -> gboolean` | gst_device_has_classesv | 1.4 | Check if @factory matches all of the given classes |
| reconfigure_element | `Device.reconfigure_element(element: Element) -> gboolean` | gst_device_reconfigure_element | 1.4 | Tries to reconfigure an existing element to use the device. If this function fails, then one must destroy the element and create a new one using gs... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| caps | Caps | read, write, construct-only |  |
| device-class | utf8 | read, write, construct-only |  |
| display-name | utf8 | read, write, construct-only |  |
| properties | Structure | read, write, construct-only |  |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| removed | `` | none | last |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| create_element | `create_element(name: utf8?) -> Element` |  | 1.4 | Creates the element with all of the required parameters set to use this device. |
| reconfigure_element | `reconfigure_element(element: Element) -> gboolean` |  | 1.4 | Tries to reconfigure an existing element to use the device. If this function fails, then one must destroy the element and create a new one using gs... |

### Gst.DeviceMonitor

Parent: `Object` ?? GType: `GstDeviceMonitor` ?? C type: `GstDeviceMonitor`

Applications should create a #GstDeviceMonitor when they want to probe, list and monitor devices of a specific type. The #GstDeviceMonitor will cre...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent | Object |
| priv | DeviceMonitorPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DeviceMonitor.new() -> DeviceMonitor` | gst_device_monitor_new | 1.4 | Create a new #GstDeviceMonitor |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_filter | `DeviceMonitor.add_filter(classes: utf8?, caps: Caps?) -> guint` | gst_device_monitor_add_filter | 1.4 | Adds a filter for which #GstDevice will be monitored, any device that matches all these classes and the #GstCaps will be returned. If this function... |
| get_bus | `DeviceMonitor.get_bus() -> Bus` | gst_device_monitor_get_bus | 1.4 | Gets the #GstBus of this #GstDeviceMonitor |
| get_devices | `DeviceMonitor.get_devices() -> GLib.List` | gst_device_monitor_get_devices | 1.4 | Gets a list of devices from all of the relevant monitors. This may actually probe the hardware if the monitor is not currently started. |
| get_providers | `DeviceMonitor.get_providers() -> utf8` | gst_device_monitor_get_providers | 1.6 | Get a list of the currently selected device provider factories. This |
| get_show_all_devices | `DeviceMonitor.get_show_all_devices() -> gboolean` | gst_device_monitor_get_show_all_devices | 1.6 | Get if @monitor is currently showing all devices, even those from hidden providers. |
| remove_filter | `DeviceMonitor.remove_filter(filter_id: guint) -> gboolean` | gst_device_monitor_remove_filter | 1.4 | Removes a filter from the #GstDeviceMonitor using the id that was returned by gst_device_monitor_add_filter(). |
| set_show_all_devices | `DeviceMonitor.set_show_all_devices(show_all: gboolean) -> none` | gst_device_monitor_set_show_all_devices | 1.6 | Set if all devices should be visible, even those devices from hidden providers. Setting @show_all to true might show some devices multiple times. |
| start | `DeviceMonitor.start() -> gboolean` | gst_device_monitor_start | 1.4 | Starts monitoring the devices, one this has succeeded, the %GST_MESSAGE_DEVICE_ADDED and %GST_MESSAGE_DEVICE_REMOVED messages will be emitted on th... |
| stop | `DeviceMonitor.stop() -> none` | gst_device_monitor_stop | 1.4 | Stops monitoring the devices. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| show-all | gboolean | read, write |  |

### Gst.DeviceProvider

Parent: `Object` ?? GType: `GstDeviceProvider` ?? C type: `GstDeviceProvider` ?? Abstract

A #GstDeviceProvider subclass is provided by a plugin that handles devices if there is a way to programmatically list connected devices. It can als...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| devices | GLib.List |
| parent | Object |
| priv | DeviceProviderPrivate |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| register | `register(plugin: Plugin?, name: utf8, rank: guint, type: GType) -> gboolean` | gst_device_provider_register | 1.4 | Create a new device providerfactory capable of instantiating objects of the @type and add the factory to @plugin. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_monitor | `DeviceProvider.can_monitor() -> gboolean` | gst_device_provider_can_monitor |  |  |
| device_add | `DeviceProvider.device_add(device: Device) -> none` | gst_device_provider_device_add | 1.4 | Posts a message on the provider's #GstBus to inform applications that a new device has been added. This is for use by subclasses. @device's referen... |
| device_changed | `DeviceProvider.device_changed(device: Device, changed_device: Device) -> none` | gst_device_provider_device_changed | 1.16 | This function is used when @changed_device was modified into its new form @device. This will post a `DEVICE_CHANGED` message on the bus to let the ... |
| device_remove | `DeviceProvider.device_remove(device: Device) -> none` | gst_device_provider_device_remove | 1.4 | Posts a message on the provider's #GstBus to inform applications that a device has been removed. This is for use by subclasses. |
| get_bus | `DeviceProvider.get_bus() -> Bus` | gst_device_provider_get_bus | 1.4 | Gets the #GstBus of this #GstDeviceProvider |
| get_devices | `DeviceProvider.get_devices() -> GLib.List` | gst_device_provider_get_devices | 1.4 | Gets a list of devices that this provider understands. This may actually probe the hardware if the provider is not currently started. If the provid... |
| get_factory | `DeviceProvider.get_factory() -> DeviceProviderFactory` | gst_device_provider_get_factory | 1.4 | Retrieves the factory that was used to create this device provider. |
| get_hidden_providers | `DeviceProvider.get_hidden_providers() -> utf8` | gst_device_provider_get_hidden_providers | 1.6 | Get the provider factory names of the #GstDeviceProvider instances that are hidden by @provider. |
| get_metadata | `DeviceProvider.get_metadata(key: utf8) -> utf8` | gst_device_provider_get_metadata | 1.14 | Get metadata with @key in @provider. |
| hide_provider | `DeviceProvider.hide_provider(name: utf8) -> none` | gst_device_provider_hide_provider | 1.6 | Make @provider hide the devices from the factory with @name. This function is used when @provider will also provide the devices reported by provide... |
| is_started | `DeviceProvider.is_started() -> gboolean` | gst_device_provider_is_started | 1.20 | This function can be used to know if the @provider was successfully started. |
| start | `DeviceProvider.start() -> gboolean` | gst_device_provider_start | 1.4 | Starts providering the devices. This will cause #GST_MESSAGE_DEVICE_ADDED and #GST_MESSAGE_DEVICE_REMOVED messages to be posted on the provider's b... |
| stop | `DeviceProvider.stop() -> none` | gst_device_provider_stop | 1.4 | Decreases the use-count by one. If the use count reaches zero, this #GstDeviceProvider will stop providering the devices. This needs to be called t... |
| unhide_provider | `DeviceProvider.unhide_provider(name: utf8) -> none` | gst_device_provider_unhide_provider | 1.6 | Make @provider unhide the devices from factory @name. This function is used when @provider will no longer provide the devices reported by provider ... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| provider-hidden | `object: utf8` | none | first |  |  |
| provider-unhidden | `object: utf8` | none | first |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| probe | `probe() -> GLib.List` |  |  | Returns a list of devices that are currently available. This should never block. The devices should not have a parent and should be floating. |
| start | `start() -> gboolean` |  | 1.4 | Starts providering the devices. This will cause #GST_MESSAGE_DEVICE_ADDED and #GST_MESSAGE_DEVICE_REMOVED messages to be posted on the provider's b... |
| stop | `stop() -> none` |  | 1.4 | Decreases the use-count by one. If the use count reaches zero, this #GstDeviceProvider will stop providering the devices. This needs to be called t... |

### Gst.DeviceProviderFactory

Parent: `PluginFeature` ?? GType: `GstDeviceProviderFactory` ?? C type: `GstDeviceProviderFactory`

#GstDeviceProviderFactory is used to create instances of device providers. A GstDeviceProviderfactory can be added to a #GstPlugin as it is also a ...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| find | `find(name: utf8) -> DeviceProviderFactory` | gst_device_provider_factory_find | 1.4 | Search for an device provider factory of the given name. Refs the returned device provider factory; caller is responsible for unreffing. |
| get_by_name | `get_by_name(factoryname: utf8) -> DeviceProvider` | gst_device_provider_factory_get_by_name | 1.4 | Returns the device provider of the type defined by the given device provider factory. |
| list_get_device_providers | `list_get_device_providers(minrank: Rank) -> GLib.List` | gst_device_provider_factory_list_get_device_providers | 1.4 | Get a list of factories with a rank greater or equal to @minrank. The list of factories is returned by decreasing rank. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `DeviceProviderFactory.get() -> DeviceProvider` | gst_device_provider_factory_get | 1.4 | Returns the device provider of the type defined by the given device providerfactory. |
| get_device_provider_type | `DeviceProviderFactory.get_device_provider_type() -> GType` | gst_device_provider_factory_get_device_provider_type | 1.4 | Get the #GType for device providers managed by this factory. The type can only be retrieved if the device provider factory is loaded, which can be ... |
| get_metadata | `DeviceProviderFactory.get_metadata(key: utf8) -> utf8` | gst_device_provider_factory_get_metadata | 1.4 | Get the metadata on @factory with @key. |
| get_metadata_keys | `DeviceProviderFactory.get_metadata_keys() -> utf8` | gst_device_provider_factory_get_metadata_keys | 1.4 | Get the available keys for the metadata on @factory. |
| has_classes | `DeviceProviderFactory.has_classes(classes: utf8?) -> gboolean` | gst_device_provider_factory_has_classes | 1.4 | Check if @factory matches all of the given @classes |
| has_classesv | `DeviceProviderFactory.has_classesv(classes: utf8?) -> gboolean` | gst_device_provider_factory_has_classesv | 1.4 | Check if @factory matches all of the given classes |

### Gst.DoubleRange

GType: `GstDoubleRange`

A fundamental type that describes a #gdouble range

### Gst.DynamicTypeFactory

Parent: `PluginFeature` ?? GType: `GstDynamicTypeFactory` ?? C type: `GstDynamicTypeFactory`

#GstDynamicTypeFactory is used to represent a type that can be automatically loaded the first time it is used. For example, a non-standard type for...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| load | `load(factoryname: utf8) -> GType` | gst_dynamic_type_factory_load |  |  |

### Gst.Element

Parent: `Object` ?? Subclasses: `Bin` ?? GType: `GstElement` ?? C type: `GstElement` ?? Abstract

GstElement is the abstract base class needed to construct an element that can be used in a GStreamer pipeline. Please refer to the plugin writers g...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| base_time | ClockTimeDiff |
| bus | Bus |
| clock | Clock |
| contexts | GLib.List |
| current_state | State |
| last_return | StateChangeReturn |
| next_state | State |
| numpads | guint16 |
| numsinkpads | guint16 |
| numsrcpads | guint16 |
| object | Object |
| pads | GLib.List |
| pads_cookie | guint32 |
| pending_state | State |
| sinkpads | GLib.List |
| srcpads | GLib.List |
| start_time | ClockTime |
| state_cond | GLib.Cond |
| state_cookie | guint32 |
| state_lock | GLib.RecMutex |
| target_state | State |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| make_from_uri | `make_from_uri(type: URIType, uri: utf8, elementname: utf8?) -> Element throws` | gst_element_make_from_uri |  | Creates an element for handling the given URI. |
| register | `register(plugin: Plugin?, name: utf8, rank: guint, type: GType) -> gboolean` | gst_element_register |  | Create a new elementfactory capable of instantiating objects of the @type and add the factory to @plugin. |
| state_change_return_get_name | `state_change_return_get_name(state_ret: StateChangeReturn) -> utf8` | gst_element_state_change_return_get_name |  | Gets a string representing the given state change result. |
| state_get_name | `state_get_name(state: State) -> utf8` | gst_element_state_get_name |  | Gets a string representing the given state. |
| type_set_skip_documentation | `type_set_skip_documentation(type: GType) -> none` | gst_element_type_set_skip_documentation | 1.20 | Marks @type as "documentation should be skipped". Can be useful for dynamically registered element to be excluded from plugin documentation system.... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| abort_state | `Element.abort_state() -> none` | gst_element_abort_state |  | Abort the state change of the element. This function is used by elements that do asynchronous state changes and find out something is wrong. This f... |
| add_pad | `Element.add_pad(pad: Pad) -> gboolean` | gst_element_add_pad |  | Adds a pad (link point) to @element. @pad's parent will be set to @element; see gst_object_set_parent() for refcounting information. Pads are autom... |
| add_property_deep_notify_watch | `Element.add_property_deep_notify_watch(property_name: utf8?, include_value: gboolean) -> gulong` | gst_element_add_property_deep_notify_watch | 1.10 | a watch id, which can be used in connection with gst_element_remove_property_notify_watch() to remove the watch again. |
| add_property_notify_watch | `Element.add_property_notify_watch(property_name: utf8?, include_value: gboolean) -> gulong` | gst_element_add_property_notify_watch | 1.10 | a watch id, which can be used in connection with gst_element_remove_property_notify_watch() to remove the watch again. |
| call_async | `Element.call_async(func: ElementCallAsyncFunc, user_data: gpointer?, destroy_notify: GLib.DestroyNotify) -> none` | gst_element_call_async | 1.10 | Calls @func from another thread and passes @user_data to it. This is to be used for cases when a state change has to be performed from a streaming ... |
| change_state | `Element.change_state(transition: StateChange) -> StateChangeReturn` | gst_element_change_state |  | Perform @transition on @element. This function must be called with STATE_LOCK held and is mainly used internally. |
| continue_state | `Element.continue_state(ret: StateChangeReturn) -> StateChangeReturn` | gst_element_continue_state |  | Commit the state change of the element and proceed to the next pending state if any. This function is used by elements that do asynchronous state c... |
| create_all_pads | `Element.create_all_pads() -> none` | gst_element_create_all_pads |  | Creates a pad for each pad template that is always available. This function is only useful during object initialization of subclasses of #GstElement. |
| decorate_stream_id | `Element.decorate_stream_id(stream_id: utf8) -> utf8` | gst_element_decorate_stream_id | 1.24 | Creates a stream-id for @element by combining the upstream information with the @stream_id. This function generates an unique stream-id by getting ... |
| decorate_stream_id_printf | `Element.decorate_stream_id_printf(format: utf8, ...: void) -> utf8` | gst_element_decorate_stream_id_printf | 1.24 | Creates a stream-id for @element by combining the upstream information with the @format. This function generates an unique stream-id by getting the... |
| decorate_stream_id_printf_valist | `Element.decorate_stream_id_printf_valist(format: utf8, var_args: va_list) -> utf8` | gst_element_decorate_stream_id_printf_valist | 1.24 | Creates a stream-id for @element by combining the upstream information with the @format. This function generates an unique stream-id by getting the... |
| foreach_pad | `Element.foreach_pad(func: ElementForeachPadFunc, user_data: gpointer?) -> gboolean` | gst_element_foreach_pad | 1.14 | Call @func with @user_data for each of @element's pads. @func will be called exactly once for each pad that exists at the time of this call, unless... |
| foreach_sink_pad | `Element.foreach_sink_pad(func: ElementForeachPadFunc, user_data: gpointer?) -> gboolean` | gst_element_foreach_sink_pad | 1.14 | Call @func with @user_data for each of @element's sink pads. @func will be called exactly once for each sink pad that exists at the time of this ca... |
| foreach_src_pad | `Element.foreach_src_pad(func: ElementForeachPadFunc, user_data: gpointer?) -> gboolean` | gst_element_foreach_src_pad | 1.14 | Call @func with @user_data for each of @element's source pads. @func will be called exactly once for each source pad that exists at the time of thi... |
| get_base_time | `Element.get_base_time() -> ClockTime` | gst_element_get_base_time |  | Returns the base time of the element. The base time is the absolute time of the clock when this element was last put to PLAYING. Subtracting the ba... |
| get_bus | `Element.get_bus() -> Bus` | gst_element_get_bus |  | Returns the bus of the element. Note that only a #GstPipeline will provide a bus for the application. |
| get_clock | `Element.get_clock() -> Clock` | gst_element_get_clock |  | Gets the currently configured clock of the element. This is the clock as was last set with gst_element_set_clock(). Elements in a pipeline will onl... |
| get_compatible_pad | `Element.get_compatible_pad(pad: Pad, caps: Caps?) -> Pad` | gst_element_get_compatible_pad |  | Looks for an unlinked pad to which the given pad can link. It is not guaranteed that linking the pads will work, though it should work in most case... |
| get_compatible_pad_template | `Element.get_compatible_pad_template(compattempl: PadTemplate) -> PadTemplate` | gst_element_get_compatible_pad_template |  | Retrieves a pad template from @element that is compatible with @compattempl. Pads from compatible templates can be linked together. |
| get_context | `Element.get_context(context_type: utf8) -> Context` | gst_element_get_context | 1.8 | Gets the context with @context_type set on the element or NULL. MT safe. |
| get_context_unlocked | `Element.get_context_unlocked(context_type: utf8) -> Context` | gst_element_get_context_unlocked | 1.8 | Gets the context with @context_type set on the element or NULL. |
| get_contexts | `Element.get_contexts() -> GLib.List` | gst_element_get_contexts | 1.8 | Gets the contexts set on the element. MT safe. |
| get_current_clock_time | `Element.get_current_clock_time() -> ClockTime` | gst_element_get_current_clock_time | 1.18 | Returns the current clock time of the element, as in, the time of the element's clock, or GST_CLOCK_TIME_NONE if there is no clock. |
| get_current_running_time | `Element.get_current_running_time() -> ClockTime` | gst_element_get_current_running_time | 1.18 | Returns the running time of the element. The running time is the element's clock time minus its base time. Will return GST_CLOCK_TIME_NONE if the e... |
| get_factory | `Element.get_factory() -> ElementFactory` | gst_element_get_factory |  | Retrieves the factory that was used to create this element. |
| get_metadata | `Element.get_metadata(key: utf8) -> utf8` | gst_element_get_metadata | 1.14 | Get metadata with @key in @klass. |
| get_pad_template | `Element.get_pad_template(name: utf8) -> PadTemplate` | gst_element_get_pad_template | 1.14 | Retrieves a padtemplate from @element with the given name. |
| get_pad_template_list | `Element.get_pad_template_list() -> GLib.List` | gst_element_get_pad_template_list | 1.14 | Retrieves a list of the pad templates associated with @element. The list must not be modified by the calling code. |
| get_request_pad | `Element.get_request_pad(name: utf8) -> Pad` | gst_element_get_request_pad |  | The name of this function is confusing to people learning GStreamer. gst_element_request_pad_simple() aims at making it more explicit it is a simpl... |
| get_start_time | `Element.get_start_time() -> ClockTime` | gst_element_get_start_time |  | Returns the start time of the element. The start time is the running time of the clock when this element was last put to PAUSED. Usually the start_... |
| get_state | `Element.get_state(state: out State?, pending: out State?, timeout: ClockTime) -> StateChangeReturn` | gst_element_get_state |  | Gets the state of the element. For elements that performed an ASYNC state change, as reported by gst_element_set_state(), this function will block ... |
| get_static_pad | `Element.get_static_pad(name: utf8) -> Pad` | gst_element_get_static_pad |  | Retrieves a pad from @element by name. This version only retrieves already-existing (i.e. 'static') pads. |
| is_locked_state | `Element.is_locked_state() -> gboolean` | gst_element_is_locked_state |  | Checks if the state of an element is locked. If the state of an element is locked, state changes of the parent don't affect the element. This way y... |
| iterate_pads | `Element.iterate_pads() -> Iterator` | gst_element_iterate_pads |  | Retrieves an iterator of @element's pads. The iterator should be freed after usage. Also more specialized iterators exists such as gst_element_iter... |
| iterate_sink_pads | `Element.iterate_sink_pads() -> Iterator` | gst_element_iterate_sink_pads |  | Retrieves an iterator of @element's sink pads. The order of pads returned by the iterator will be the order in which the pads were added to the ele... |
| iterate_src_pads | `Element.iterate_src_pads() -> Iterator` | gst_element_iterate_src_pads |  | Retrieves an iterator of @element's source pads. The order of pads returned by the iterator will be the order in which the pads were added to the e... |
| link | `Element.link(dest: Element) -> gboolean` | gst_element_link |  | Links @src to @dest. The link must be from source to destination; the other direction will not be tried. The function looks for existing pads that ... |
| link_filtered | `Element.link_filtered(dest: Element, filter: Caps?) -> gboolean` | gst_element_link_filtered |  | Links @src to @dest using the given caps as filtercaps. The link must be from source to destination; the other direction will not be tried. The fun... |
| link_many | `Element.link_many(element_2: Element, ...: void) -> gboolean` | gst_element_link_many |  | Chain together a series of elements. Uses gst_element_link(). Make sure you have added your elements to a bin or pipeline with gst_bin_add() before... |
| link_pads | `Element.link_pads(srcpadname: utf8?, dest: Element, destpadname: utf8?) -> gboolean` | gst_element_link_pads |  | Links the two named pads of the source and destination elements. Side effect is that if one of the pads has no parent, it becomes a child of the pa... |
| link_pads_filtered | `Element.link_pads_filtered(srcpadname: utf8?, dest: Element, destpadname: utf8?, filter: Caps?) -> gboolean` | gst_element_link_pads_filtered |  | Links the two named pads of the source and destination elements. Side effect is that if one of the pads has no parent, it becomes a child of the pa... |
| link_pads_full | `Element.link_pads_full(srcpadname: utf8?, dest: Element, destpadname: utf8?, flags: PadLinkCheck) -> gboolean` | gst_element_link_pads_full |  | Links the two named pads of the source and destination elements. Side effect is that if one of the pads has no parent, it becomes a child of the pa... |
| lost_state | `Element.lost_state() -> none` | gst_element_lost_state |  | Brings the element to the lost state. The current state of the element is copied to the pending state so that any call to gst_element_get_state() w... |
| message_full | `Element.message_full(type: MessageType, domain: GLib.Quark, code: gint, text: utf8?, debug: utf8?, file: utf8, function: utf8, line: gint) -> none` | gst_element_message_full |  | Post an error, warning or info message on the bus from inside an element. @type must be of #GST_MESSAGE_ERROR, #GST_MESSAGE_WARNING or #GST_MESSAGE... |
| message_full_with_details | `Element.message_full_with_details(type: MessageType, domain: GLib.Quark, code: gint, text: utf8?, debug: utf8?, file: utf8, function: utf8, line: gint, structure: Structure) -> none` | gst_element_message_full_with_details | 1.10 | Post an error, warning or info message on the bus from inside an element. @type must be of #GST_MESSAGE_ERROR, #GST_MESSAGE_WARNING or #GST_MESSAGE... |
| no_more_pads | `Element.no_more_pads() -> none` | gst_element_no_more_pads |  | Use this function to signal that the element does not expect any more pads to show up in the current pipeline. This function should be called whene... |
| post_message | `Element.post_message(message: Message) -> gboolean` | gst_element_post_message |  | Post a message on the element's #GstBus. This function takes ownership of the message; if you want to access the message after this call, you shoul... |
| provide_clock | `Element.provide_clock() -> Clock` | gst_element_provide_clock |  | Get the clock provided by the given element. > An element is only required to provide a clock in the PAUSED > state. Some elements can provide a cl... |
| query | `Element.query(query: Query) -> gboolean` | gst_element_query |  | Performs a query on the given element. For elements that don't implement a query handler, this function forwards the query to a random srcpad or to... |
| query_convert | `Element.query_convert(src_format: Format, src_val: gint64, dest_format: Format, dest_val: out gint64) -> gboolean` | gst_element_query_convert |  | Queries an element to convert @src_val in @src_format to @dest_format. |
| query_duration | `Element.query_duration(format: Format, duration: out gint64?) -> gboolean` | gst_element_query_duration |  | Queries an element (usually top-level pipeline or playbin element) for the total stream duration in nanoseconds. This query will only work once the... |
| query_position | `Element.query_position(format: Format, cur: out gint64?) -> gboolean` | gst_element_query_position |  | Queries an element (usually top-level pipeline or playbin element) for the stream position in nanoseconds. This will be a value between 0 and the s... |
| release_request_pad | `Element.release_request_pad(pad: Pad) -> none` | gst_element_release_request_pad |  | Makes the element free the previously requested pad as obtained with gst_element_request_pad(). This does not unref the pad. If the pad was created... |
| remove_pad | `Element.remove_pad(pad: Pad) -> gboolean` | gst_element_remove_pad |  | Removes @pad from @element. @pad will be destroyed if it has not been referenced elsewhere using gst_object_unparent(). This function is used by pl... |
| remove_property_notify_watch | `Element.remove_property_notify_watch(watch_id: gulong) -> none` | gst_element_remove_property_notify_watch | 1.10 | a #GstElement being watched for property changes |
| request_pad | `Element.request_pad(templ: PadTemplate, name: utf8?, caps: Caps?) -> Pad` | gst_element_request_pad |  | Retrieves a request pad from the element according to the provided template. Pad templates can be looked up using gst_element_factory_get_static_pa... |
| request_pad_simple | `Element.request_pad_simple(name: utf8) -> Pad` | gst_element_request_pad_simple | 1.20 | Retrieves a pad from the element by name (e.g. "src_\%d"). This version only retrieves request pads. The pad should be released with gst_element_re... |
| seek | `Element.seek(rate: gdouble, format: Format, flags: SeekFlags, start_type: SeekType, start: gint64, stop_type: SeekType, stop: gint64) -> gboolean` | gst_element_seek |  | Sends a seek event to an element. See gst_event_new_seek() for the details of the parameters. The seek event is sent to the element using gst_eleme... |
| seek_simple | `Element.seek_simple(format: Format, seek_flags: SeekFlags, seek_pos: gint64) -> gboolean` | gst_element_seek_simple |  | Simple API to perform a seek on the given element, meaning it just seeks to the given position relative to the start of the stream. For more comple... |
| send_event | `Element.send_event(event: Event) -> gboolean` | gst_element_send_event |  | Sends an event to an element. If the element doesn't implement an event handler, the event will be pushed on a random linked sink pad for downstrea... |
| set_base_time | `Element.set_base_time(time: ClockTime) -> none` | gst_element_set_base_time |  | Set the base time of an element. See gst_element_get_base_time(). MT safe. |
| set_bus | `Element.set_bus(bus: Bus?) -> none` | gst_element_set_bus |  | Sets the bus of the element. Increases the refcount on the bus. For internal use only, unless you're testing elements. MT safe. |
| set_clock | `Element.set_clock(clock: Clock?) -> gboolean` | gst_element_set_clock |  | Sets the clock for the element. This function increases the refcount on the clock. Any previously set clock on the object is unreffed. |
| set_context | `Element.set_context(context: Context) -> none` | gst_element_set_context |  | Sets the context of the element. Increases the refcount of the context. MT safe. |
| set_locked_state | `Element.set_locked_state(locked_state: gboolean) -> gboolean` | gst_element_set_locked_state |  | Locks the state of an element, so state changes of the parent don't affect this element anymore. Note that this is racy if the state lock of the pa... |
| set_start_time | `Element.set_start_time(time: ClockTime) -> none` | gst_element_set_start_time |  | Set the start time of an element. The start time of the element is the running time of the element when it last went to the PAUSED state. In READY ... |
| set_state | `Element.set_state(state: State) -> StateChangeReturn` | gst_element_set_state |  | Sets the state of the element. This function will try to set the requested state by going through all the intermediary states and calling the class... |
| sync_state_with_parent | `Element.sync_state_with_parent() -> gboolean` | gst_element_sync_state_with_parent |  | Tries to change the state of the element to the same as its parent. If this function returns %FALSE, the state of element is undefined. |
| unlink | `Element.unlink(dest: Element) -> none` | gst_element_unlink |  | Unlinks all source pads of the source element with all sink pads of the sink element to which they are linked. If the link has been made using gst_... |
| unlink_many | `Element.unlink_many(element_2: Element, ...: void) -> none` | gst_element_unlink_many |  | Unlinks a series of elements. Uses gst_element_unlink(). |
| unlink_pads | `Element.unlink_pads(srcpadname: utf8, dest: Element, destpadname: utf8) -> none` | gst_element_unlink_pads |  | Unlinks the two named pads of the source and destination elements. This is a convenience function for gst_pad_unlink(). |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| no-more-pads | `` | none | last |  | This signals that the element will not generate more dynamic pads. Note that this signal will usually be emitted from the context of the streaming ... |
| pad-added | `new_pad: Pad` | none | last |  | a new #GstPad has been added to the element. Note that this signal will usually be emitted from the context of the streaming thread. Also keep in m... |
| pad-removed | `old_pad: Pad` | none | last |  | a #GstPad has been removed from the element |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| change_state | `change_state(transition: StateChange) -> StateChangeReturn` |  |  | Perform @transition on @element. This function must be called with STATE_LOCK held and is mainly used internally. |
| get_state | `get_state(state: out State?, pending: out State?, timeout: ClockTime) -> StateChangeReturn` |  |  | Gets the state of the element. For elements that performed an ASYNC state change, as reported by gst_element_set_state(), this function will block ... |
| no_more_pads | `no_more_pads() -> none` |  |  | Use this function to signal that the element does not expect any more pads to show up in the current pipeline. This function should be called whene... |
| pad_added | `pad_added(pad: Pad) -> none` |  |  |  |
| pad_removed | `pad_removed(pad: Pad) -> none` |  |  |  |
| post_message | `post_message(message: Message) -> gboolean` |  |  | Post a message on the element's #GstBus. This function takes ownership of the message; if you want to access the message after this call, you shoul... |
| provide_clock | `provide_clock() -> Clock` |  |  | Get the clock provided by the given element. > An element is only required to provide a clock in the PAUSED > state. Some elements can provide a cl... |
| query | `query(query: Query) -> gboolean` |  |  | Performs a query on the given element. For elements that don't implement a query handler, this function forwards the query to a random srcpad or to... |
| release_pad | `release_pad(pad: Pad) -> none` |  |  | called when a request pad is to be released |
| request_new_pad | `request_new_pad(templ: PadTemplate, name: utf8?, caps: Caps?) -> Pad` |  |  | Retrieves a request pad from the element according to the provided template. Pad templates can be looked up using gst_element_factory_get_static_pa... |
| send_event | `send_event(event: Event) -> gboolean` |  |  | Sends an event to an element. If the element doesn't implement an event handler, the event will be pushed on a random linked sink pad for downstrea... |
| set_bus | `set_bus(bus: Bus?) -> none` |  |  | Sets the bus of the element. Increases the refcount on the bus. For internal use only, unless you're testing elements. MT safe. |
| set_clock | `set_clock(clock: Clock?) -> gboolean` |  |  | Sets the clock for the element. This function increases the refcount on the clock. Any previously set clock on the object is unreffed. |
| set_context | `set_context(context: Context) -> none` |  |  | Sets the context of the element. Increases the refcount of the context. MT safe. |
| set_state | `set_state(state: State) -> StateChangeReturn` |  |  | Sets the state of the element. This function will try to set the requested state by going through all the intermediary states and calling the class... |
| state_changed | `state_changed(oldstate: State, newstate: State, pending: State) -> none` |  |  | called immediately after a new state was set. |

### Gst.ElementFactory

Parent: `PluginFeature` ?? GType: `GstElementFactory` ?? C type: `GstElementFactory`

#GstElementFactory is used to create instances of elements. A GstElementFactory can be added to a #GstPlugin as it is also a #GstPluginFeature. Use...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| find | `find(name: utf8) -> ElementFactory` | gst_element_factory_find |  | Search for an element factory of the given name. Refs the returned element factory; caller is responsible for unreffing. |
| list_filter | `list_filter(list: GLib.List, caps: Caps, direction: PadDirection, subsetonly: gboolean) -> GLib.List` | gst_element_factory_list_filter |  | Filter out all the elementfactories in @list that can handle @caps in the given direction. If @subsetonly is %TRUE, then only the elements whose pa... |
| list_get_elements | `list_get_elements(type: ElementFactoryListType, minrank: Rank) -> GLib.List` | gst_element_factory_list_get_elements |  | Get a list of factories that match the given @type. Only elements with a rank greater or equal to @minrank will be returned. The list of factories ... |
| make | `make(factoryname: utf8, name: utf8?) -> Element` | gst_element_factory_make |  | Create a new element of the type defined by the given element factory. If name is %NULL, then the element will receive a guaranteed unique name, co... |
| make_full | `make_full(factoryname: utf8, first: utf8?, ...: void?) -> Element` | gst_element_factory_make_full | 1.20 | Create a new element of the type defined by the given element factory. The supplied list of properties, will be passed at object construction. |
| make_valist | `make_valist(factoryname: utf8, first: utf8?, properties: va_list?) -> Element` | gst_element_factory_make_valist | 1.20 | Create a new element of the type defined by the given element factory. The supplied list of properties, will be passed at object construction. |
| make_with_properties | `make_with_properties(factoryname: utf8, n: guint, names: utf8?, values: GObject.Value?) -> Element` | gst_element_factory_make_with_properties | 1.20 | Create a new element of the type defined by the given elementfactory. The supplied list of properties, will be passed at object construction. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_sink_all_caps | `ElementFactory.can_sink_all_caps(caps: Caps) -> gboolean` | gst_element_factory_can_sink_all_caps |  | Checks if the factory can sink all possible capabilities. |
| can_sink_any_caps | `ElementFactory.can_sink_any_caps(caps: Caps) -> gboolean` | gst_element_factory_can_sink_any_caps |  | Checks if the factory can sink any possible capability. |
| can_src_all_caps | `ElementFactory.can_src_all_caps(caps: Caps) -> gboolean` | gst_element_factory_can_src_all_caps |  | Checks if the factory can src all possible capabilities. |
| can_src_any_caps | `ElementFactory.can_src_any_caps(caps: Caps) -> gboolean` | gst_element_factory_can_src_any_caps |  | Checks if the factory can src any possible capability. |
| create | `ElementFactory.create(name: utf8?) -> Element` | gst_element_factory_create |  | Create a new element of the type defined by the given elementfactory. It will be given the name supplied, since all elements require a name as thei... |
| create_full | `ElementFactory.create_full(first: utf8?, ...: void?) -> Element` | gst_element_factory_create_full | 1.20 | Create a new element of the type defined by the given elementfactory. The supplied list of properties, will be passed at object construction. |
| create_valist | `ElementFactory.create_valist(first: utf8?, properties: va_list?) -> Element` | gst_element_factory_create_valist | 1.20 | Create a new element of the type defined by the given elementfactory. The supplied list of properties, will be passed at object construction. |
| create_with_properties | `ElementFactory.create_with_properties(n: guint, names: utf8?, values: GObject.Value?) -> Element` | gst_element_factory_create_with_properties | 1.20 | Create a new element of the type defined by the given elementfactory. The supplied list of properties, will be passed at object construction. |
| get_element_type | `ElementFactory.get_element_type() -> GType` | gst_element_factory_get_element_type |  | Get the #GType for elements managed by this factory. The type can only be retrieved if the element factory is loaded, which can be assured with gst... |
| get_metadata | `ElementFactory.get_metadata(key: utf8) -> utf8` | gst_element_factory_get_metadata |  | Get the metadata on @factory with @key. |
| get_metadata_keys | `ElementFactory.get_metadata_keys() -> utf8` | gst_element_factory_get_metadata_keys |  | Get the available keys for the metadata on @factory. |
| get_num_pad_templates | `ElementFactory.get_num_pad_templates() -> guint` | gst_element_factory_get_num_pad_templates |  | Gets the number of pad_templates in this factory. |
| get_skip_documentation | `ElementFactory.get_skip_documentation() -> gboolean` | gst_element_factory_get_skip_documentation | 1.20 | Queries whether registered element managed by @factory needs to be excluded from documentation system or not. |
| get_static_pad_templates | `ElementFactory.get_static_pad_templates() -> GLib.List` | gst_element_factory_get_static_pad_templates |  | Gets the #GList of #GstStaticPadTemplate for this factory. |
| get_uri_protocols | `ElementFactory.get_uri_protocols() -> utf8` | gst_element_factory_get_uri_protocols |  | Gets a %NULL-terminated array of protocols this element supports or %NULL if no protocols are supported. You may not change the contents of the ret... |
| get_uri_type | `ElementFactory.get_uri_type() -> URIType` | gst_element_factory_get_uri_type |  | Gets the type of URIs the element supports or #GST_URI_UNKNOWN if none. |
| has_interface | `ElementFactory.has_interface(interfacename: utf8) -> gboolean` | gst_element_factory_has_interface |  | Check if @factory implements the interface with name @interfacename. |
| list_is_type | `ElementFactory.list_is_type(type: ElementFactoryListType) -> gboolean` | gst_element_factory_list_is_type |  | Check if @factory is of the given types. |

### Gst.FlagSet

GType: `GstFlagSet`

A fundamental type that describes a 32-bit flag bitfield, with 32-bit mask indicating which of the bits in the field are explicitly set.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| register | `register(flags_type: GType) -> GType` | gst_flagset_register | 1.6 | Create a new sub-class of #GST_TYPE_FLAG_SET which will pretty-print the human-readable flags when serializing, for easier debugging. |

### Gst.Fraction

GType: `GstFraction`

A fundamental type that describes a fraction of an integer numerator over an integer denominator

### Gst.FractionRange

GType: `GstFractionRange`

A fundamental type that describes a #GstFractionRange range

### Gst.GhostPad

Parent: `ProxyPad` ?? GType: `GstGhostPad` ?? C type: `GstGhostPad`

GhostPads are useful when organizing pipelines with #GstBin like elements. The idea here is to create hierarchical element graphs. The bin element ...

#### Fields

| Field | Type |
| --- | --- |
| pad | ProxyPad |
| priv | GhostPadPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `GhostPad.new(name: utf8?, target: Pad) -> Pad` | gst_ghost_pad_new |  | Create a new ghostpad with @target as the target. The direction will be taken from the target pad. @target must be unlinked. Will ref the target. |
| new_from_template | `GhostPad.new_from_template(name: utf8?, target: Pad, templ: PadTemplate) -> Pad` | gst_ghost_pad_new_from_template |  | Create a new ghostpad with @target as the target. The direction will be taken from the target pad. The template used on the ghostpad will be @templ... |
| new_no_target | `GhostPad.new_no_target(name: utf8?, dir: PadDirection) -> Pad` | gst_ghost_pad_new_no_target |  | Create a new ghostpad without a target with the given direction. A target can be set on the ghostpad later with the gst_ghost_pad_set_target() func... |
| new_no_target_from_template | `GhostPad.new_no_target_from_template(name: utf8?, templ: PadTemplate) -> Pad` | gst_ghost_pad_new_no_target_from_template |  | Create a new ghostpad based on @templ, without setting a target. The direction will be taken from the @templ. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| activate_mode_default | `activate_mode_default(pad: Pad, parent: Object?, mode: PadMode, active: gboolean) -> gboolean` | gst_ghost_pad_activate_mode_default |  | Invoke the default activate mode function of a ghost pad. |
| internal_activate_mode_default | `internal_activate_mode_default(pad: Pad, parent: Object?, mode: PadMode, active: gboolean) -> gboolean` | gst_ghost_pad_internal_activate_mode_default |  | Invoke the default activate mode function of a proxy pad that is owned by a ghost pad. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| construct | `GhostPad.construct() -> gboolean` | gst_ghost_pad_construct |  | Finish initialization of a newly allocated ghost pad. This function is most useful in language bindings and when subclassing #GstGhostPad; plugin a... |
| get_target | `GhostPad.get_target() -> Pad` | gst_ghost_pad_get_target |  | Get the target pad of @gpad. Unref target pad after usage. |
| set_target | `GhostPad.set_target(newtarget: Pad?) -> gboolean` | gst_ghost_pad_set_target |  | Set the new target of the ghostpad @gpad. Any existing target is unlinked and links to the new target are established. if @newtarget is %NULL the t... |

### Gst.Int64Range

GType: `GstInt64Range`

A fundamental type that describes a #gint64 range

### Gst.IntRange

GType: `GstIntRange`

A fundamental type that describes a #gint range

### Gst.Object

Parent: `GObject.InitiallyUnowned` ?? Subclasses: `Allocator`, `BufferPool`, `Bus`, `Clock`, `ControlBinding`, `ControlSource`, `Device`, `DeviceMonitor`, `DeviceProvider`, `Element`, `Pad`, `PadTemplate`, `Plugin`, `PluginFeature`, `Registry`, `Stream`, `StreamCollection`, `Task`, `TaskPool`, `Tracer`, `TracerRecord` ?? GType: `GstObject` ?? C type: `GstObject` ?? Abstract

#GstObject provides a root for the object hierarchy tree filed in by the GStreamer library. It is currently a thin wrapper on top of #GInitiallyUno...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| control_bindings | GLib.List |
| control_rate | guint64 |
| flags | guint32 |
| last_sync | guint64 |
| lock | GLib.Mutex |
| name | utf8 |
| object | GObject.InitiallyUnowned |
| parent | Object |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| check_uniqueness | `check_uniqueness(list: GLib.List, name: utf8) -> gboolean` | gst_object_check_uniqueness |  | Checks to see if there is any object named @name in @list. This function does not do any locking of any kind. You might want to protect the provide... |
| default_deep_notify | `default_deep_notify(object: GObject.Object, orig: Object, pspec: GObject.ParamSpec, excluded_props: utf8?) -> none` | gst_object_default_deep_notify |  | A default deep_notify signal callback for an object. The user data should contain a pointer to an array of strings that should be excluded from the... |
| ref_sink | `ref_sink(object: gpointer?) -> gpointer` | gst_object_ref_sink |  | Increase the reference count of @object, and possibly remove the floating reference, if @object has a floating reference. In other words, if the ob... |
| replace | `replace(oldobj: inout Object?, newobj: Object?) -> gboolean` | gst_object_replace |  | Atomically modifies a pointer to point to a new object. The reference count of @oldobj is decreased and the reference count of @newobj is increased... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_control_binding | `Object.add_control_binding(binding: ControlBinding) -> gboolean` | gst_object_add_control_binding |  | Attach the #GstControlBinding to the object. If there already was a #GstControlBinding for this property it will be replaced. The object's referenc... |
| default_error | `Object.default_error(error: GLib.Error, debug: utf8?) -> none` | gst_object_default_error |  | A default error function that uses g_printerr() to display the error message and the optional debug string.. The default handler will simply print ... |
| get_control_binding | `Object.get_control_binding(property_name: utf8) -> ControlBinding` | gst_object_get_control_binding |  | Gets the corresponding #GstControlBinding for the property. This should be unreferenced again after use. |
| get_control_rate | `Object.get_control_rate() -> ClockTime` | gst_object_get_control_rate |  | Obtain the control-rate for this @object. Audio processing #GstElement objects will use this rate to sub-divide their processing loop and call gst_... |
| get_g_value_array | `Object.get_g_value_array(property_name: utf8, timestamp: ClockTime, interval: ClockTime, n_values: guint, values: GObject.Value) -> gboolean` | gst_object_get_g_value_array |  | Gets a number of #GValues for the given controlled property starting at the requested time. The array @values need to hold enough space for @n_valu... |
| get_name | `Object.get_name() -> utf8` | gst_object_get_name |  | Returns a copy of the name of @object. Caller should g_free() the return value after usage. For a nameless object, this returns %NULL, which you ca... |
| get_parent | `Object.get_parent() -> Object` | gst_object_get_parent |  | Returns the parent of @object. This function increases the refcount of the parent object so you should gst_object_unref() it after usage. |
| get_path_string | `Object.get_path_string() -> utf8` | gst_object_get_path_string |  | Generates a string describing the path of @object in the object hierarchy. Only useful (or used) for debugging. Free-function: g_free |
| get_value | `Object.get_value(property_name: utf8, timestamp: ClockTime) -> GObject.Value` | gst_object_get_value |  | Gets the value for the given controlled property at the requested time. |
| get_value_array | `Object.get_value_array(property_name: utf8, timestamp: ClockTime, interval: ClockTime, n_values: guint, values: gpointer) -> gboolean` | gst_object_get_value_array |  | Gets a number of values for the given controlled property starting at the requested time. The array @values need to hold enough space for @n_values... |
| has_active_control_bindings | `Object.has_active_control_bindings() -> gboolean` | gst_object_has_active_control_bindings |  | Check if the @object has active controlled properties. |
| has_ancestor | `Object.has_ancestor(ancestor: Object) -> gboolean` | gst_object_has_ancestor |  | Check if @object has an ancestor @ancestor somewhere up in the hierarchy. One can e.g. check if a #GstElement is inside a #GstPipeline. |
| has_as_ancestor | `Object.has_as_ancestor(ancestor: Object) -> gboolean` | gst_object_has_as_ancestor |  | Check if @object has an ancestor @ancestor somewhere up in the hierarchy. One can e.g. check if a #GstElement is inside a #GstPipeline. |
| has_as_parent | `Object.has_as_parent(parent: Object) -> gboolean` | gst_object_has_as_parent | 1.6 | Check if @parent is the parent of @object. E.g. a #GstElement can check if it owns a given #GstPad. |
| ref | `Object.ref() -> Object` | gst_object_ref |  | Increments the reference count on @object. This function does not take the lock on @object because it relies on atomic refcounting. This object ret... |
| remove_control_binding | `Object.remove_control_binding(binding: ControlBinding) -> gboolean` | gst_object_remove_control_binding |  | Removes the corresponding #GstControlBinding. If it was the last ref of the binding, it will be disposed. |
| set_control_binding_disabled | `Object.set_control_binding_disabled(property_name: utf8, disabled: gboolean) -> none` | gst_object_set_control_binding_disabled |  | This function is used to disable the control bindings on a property for some time, i.e. gst_object_sync_values() will do nothing for the property. |
| set_control_bindings_disabled | `Object.set_control_bindings_disabled(disabled: gboolean) -> none` | gst_object_set_control_bindings_disabled |  | This function is used to disable all controlled properties of the @object for some time, i.e. gst_object_sync_values() will do nothing. |
| set_control_rate | `Object.set_control_rate(control_rate: ClockTime) -> none` | gst_object_set_control_rate |  | Change the control-rate for this @object. Audio processing #GstElement objects will use this rate to sub-divide their processing loop and call gst_... |
| set_name | `Object.set_name(name: utf8?) -> gboolean` | gst_object_set_name |  | Sets the name of @object, or gives @object a guaranteed unique name (if @name is %NULL). This function makes a copy of the provided name, so the ca... |
| set_parent | `Object.set_parent(parent: Object) -> gboolean` | gst_object_set_parent |  | Sets the parent of @object to @parent. The object's reference count will be incremented, and any floating reference will be removed (see gst_object... |
| suggest_next_sync | `Object.suggest_next_sync() -> ClockTime` | gst_object_suggest_next_sync |  | Returns a suggestion for timestamps where buffers should be split to get best controller results. |
| sync_values | `Object.sync_values(timestamp: ClockTime) -> gboolean` | gst_object_sync_values |  | Sets the properties of the object, according to the #GstControlSources that (maybe) handle them and for the given timestamp. If this function fails... |
| unparent | `Object.unparent() -> none` | gst_object_unparent |  | Clear the parent of @object, removing the associated reference. This function decreases the refcount of @object. MT safe. Grabs and releases @objec... |
| unref | `Object.unref() -> none` | gst_object_unref |  | Decrements the reference count on @object. If reference count hits zero, destroy @object. This function does not take the lock on @object as it rel... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| name | utf8 | read, write |  |
| parent | Object | read, write | The parent of the object. Please note, that when changing the 'parent' property, we don't emit #GObject::notify and #GstObject::deep-notify signals... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| deep-notify | `prop_object: Object, prop: GObject.ParamSpec` | none | first detailed |  | The deep notify signal is used to be notified of property changes. It is typically attached to the toplevel bin to receive notifications from all t... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| deep_notify | `deep_notify(orig: Object, pspec: GObject.ParamSpec) -> none` |  |  | default signal handler |

### Gst.Pad

Parent: `Object` ?? Subclasses: `ProxyPad` ?? GType: `GstPad` ?? C type: `GstPad`

A #GstElement is linked to other elements via "pads", which are extremely light-weight generic link points. Pads have a #GstPadDirection, source pa...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| activatedata | gpointer |
| activatefunc | PadActivateFunction |
| activatemodedata | gpointer |
| activatemodefunc | PadActivateModeFunction |
| activatemodenotify | GLib.DestroyNotify |
| activatenotify | GLib.DestroyNotify |
| block_cond | GLib.Cond |
| chaindata | gpointer |
| chainfunc | PadChainFunction |
| chainlistdata | gpointer |
| chainlistfunc | PadChainListFunction |
| chainlistnotify | GLib.DestroyNotify |
| chainnotify | GLib.DestroyNotify |
| direction | PadDirection |
| element_private | gpointer |
| eventdata | gpointer |
| eventfullfunc | PadEventFullFunction |
| eventfunc | PadEventFunction |
| eventnotify | GLib.DestroyNotify |
| getrangedata | gpointer |
| getrangefunc | PadGetRangeFunction |
| getrangenotify | GLib.DestroyNotify |
| iterintlinkdata | gpointer |
| iterintlinkfunc | PadIterIntLinkFunction |
| iterintlinknotify | GLib.DestroyNotify |
| last_flowret | FlowReturn |
| linkdata | gpointer |
| linkfunc | PadLinkFunction |
| linknotify | GLib.DestroyNotify |
| mode | PadMode |
| num_blocked | gint |
| num_probes | gint |
| object | Object |
| offset | gint64 |
| padtemplate | PadTemplate |
| peer | Pad |
| priv | PadPrivate |
| probes | GLib.HookList |
| querydata | gpointer |
| queryfunc | PadQueryFunction |
| querynotify | GLib.DestroyNotify |
| stream_rec_lock | GLib.RecMutex |
| task | Task |
| unlinkdata | gpointer |
| unlinkfunc | PadUnlinkFunction |
| unlinknotify | GLib.DestroyNotify |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Pad.new(name: utf8?, direction: PadDirection) -> Pad` | gst_pad_new |  | Creates a new pad with the given name in the given direction. If name is %NULL, a guaranteed unique name (across all pads) will be assigned. This f... |
| new_from_static_template | `Pad.new_from_static_template(templ: StaticPadTemplate, name: utf8) -> Pad` | gst_pad_new_from_static_template |  | Creates a new pad with the given name from the given static template. If name is %NULL, a guaranteed unique name (across all pads) will be assigned... |
| new_from_template | `Pad.new_from_template(templ: PadTemplate, name: utf8?) -> Pad` | gst_pad_new_from_template |  | Creates a new pad with the given name from the given template. If name is %NULL, a guaranteed unique name (across all pads) will be assigned. This ... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| link_get_name | `link_get_name(ret: PadLinkReturn) -> utf8` | gst_pad_link_get_name | 1.4 | Gets a string representing the given pad-link return. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| activate_mode | `Pad.activate_mode(mode: PadMode, active: gboolean) -> gboolean` | gst_pad_activate_mode |  | Activates or deactivates the given pad in @mode via dispatching to the pad's activatemodefunc. For use from within pad activation functions only. I... |
| add_probe | `Pad.add_probe(mask: PadProbeType, callback: PadProbeCallback, user_data: gpointer?, destroy_data: GLib.DestroyNotify) -> gulong` | gst_pad_add_probe |  | Be notified of different states of pads. The provided callback is called for every state that matches @mask. Probes are called in groups: First GST... |
| can_link | `Pad.can_link(sinkpad: Pad) -> gboolean` | gst_pad_can_link |  | Checks if the source pad and the sink pad are compatible so they can be linked. |
| chain | `Pad.chain(buffer: Buffer) -> FlowReturn` | gst_pad_chain |  | Chain a buffer to @pad. The function returns #GST_FLOW_FLUSHING if the pad was flushing. If the buffer type is not acceptable for @pad (as negotiat... |
| chain_list | `Pad.chain_list(list: BufferList) -> FlowReturn` | gst_pad_chain_list |  | Chain a bufferlist to @pad. The function returns #GST_FLOW_FLUSHING if the pad was flushing. If @pad was not negotiated properly with a CAPS event,... |
| check_reconfigure | `Pad.check_reconfigure() -> gboolean` | gst_pad_check_reconfigure |  | Check and clear the #GST_PAD_FLAG_NEED_RECONFIGURE flag on @pad and return %TRUE if the flag was set. |
| create_stream_id | `Pad.create_stream_id(parent: Element, stream_id: utf8?) -> utf8` | gst_pad_create_stream_id |  | Creates a stream-id for the source #GstPad @pad by combining the upstream information with the optional @stream_id of the stream of @pad. @pad must... |
| create_stream_id_printf | `Pad.create_stream_id_printf(parent: Element, stream_id: utf8?, ...: void) -> utf8` | gst_pad_create_stream_id_printf |  | Creates a stream-id for the source #GstPad @pad by combining the upstream information with the optional @stream_id of the stream of @pad. @pad must... |
| create_stream_id_printf_valist | `Pad.create_stream_id_printf_valist(parent: Element, stream_id: utf8?, var_args: va_list) -> utf8` | gst_pad_create_stream_id_printf_valist |  | Creates a stream-id for the source #GstPad @pad by combining the upstream information with the optional @stream_id of the stream of @pad. @pad must... |
| event_default | `Pad.event_default(parent: Object?, event: Event) -> gboolean` | gst_pad_event_default |  | Invokes the default event handler for the given pad. The EOS event will pause the task associated with @pad before it is forwarded to all internall... |
| forward | `Pad.forward(forward: PadForwardFunction, user_data: gpointer?) -> gboolean` | gst_pad_forward |  | Calls @forward for all internally linked pads of @pad. This function deals with dynamically changing internal pads and will make sure that the @for... |
| get_allowed_caps | `Pad.get_allowed_caps() -> Caps` | gst_pad_get_allowed_caps |  | Gets the capabilities of the allowed media types that can flow through @pad and its peer. The allowed capabilities is calculated as the intersectio... |
| get_current_caps | `Pad.get_current_caps() -> Caps` | gst_pad_get_current_caps |  | Gets the capabilities currently configured on @pad with the last #GST_EVENT_CAPS event. |
| get_direction | `Pad.get_direction() -> PadDirection` | gst_pad_get_direction |  | Gets the direction of the pad. The direction of the pad is decided at construction time so this function does not take the LOCK. |
| get_element_private | `Pad.get_element_private() -> gpointer` | gst_pad_get_element_private |  | Gets the private data of a pad. No locking is performed in this function. |
| get_last_flow_return | `Pad.get_last_flow_return() -> FlowReturn` | gst_pad_get_last_flow_return | 1.4 | Gets the #GstFlowReturn return from the last data passed by this pad. |
| get_offset | `Pad.get_offset() -> gint64` | gst_pad_get_offset |  | Get the offset applied to the running time of @pad. @pad has to be a source pad. |
| get_pad_template | `Pad.get_pad_template() -> PadTemplate` | gst_pad_get_pad_template |  | Gets the template for @pad. |
| get_pad_template_caps | `Pad.get_pad_template_caps() -> Caps` | gst_pad_get_pad_template_caps |  | Gets the capabilities for @pad's template. |
| get_parent_element | `Pad.get_parent_element() -> Element` | gst_pad_get_parent_element |  | Gets the parent of @pad, cast to a #GstElement. If a @pad has no parent or its parent is not an element, return %NULL. |
| get_peer | `Pad.get_peer() -> Pad` | gst_pad_get_peer |  | Gets the peer of @pad. This function refs the peer pad so you need to unref it after use. |
| get_range | `Pad.get_range(offset: guint64, size: guint, buffer: out Buffer) -> FlowReturn` | gst_pad_get_range |  | When @pad is flushing this function returns #GST_FLOW_FLUSHING immediately and @buffer is %NULL. Calls the getrange function of @pad, see #GstPadGe... |
| get_single_internal_link | `Pad.get_single_internal_link() -> Pad` | gst_pad_get_single_internal_link | 1.18 | If there is a single internal link of the given pad, this function will return it. Otherwise, it will return NULL. |
| get_sticky_event | `Pad.get_sticky_event(event_type: EventType, idx: guint) -> Event` | gst_pad_get_sticky_event |  | Returns a new reference of the sticky event of type @event_type from the event. |
| get_stream | `Pad.get_stream() -> Stream` | gst_pad_get_stream | 1.10 | Returns the current #GstStream for the @pad, or %NULL if none has been set yet, i.e. the pad has not received a stream-start event yet. This is a c... |
| get_stream_id | `Pad.get_stream_id() -> utf8` | gst_pad_get_stream_id | 1.2 | Returns the current stream-id for the @pad, or %NULL if none has been set yet, i.e. the pad has not received a stream-start event yet. This is a co... |
| get_task_state | `Pad.get_task_state() -> TaskState` | gst_pad_get_task_state | 1.12 | Get @pad task state. If no task is currently set, #GST_TASK_STOPPED is returned. |
| has_current_caps | `Pad.has_current_caps() -> gboolean` | gst_pad_has_current_caps |  | Check if @pad has caps set on it with a #GST_EVENT_CAPS event. |
| is_active | `Pad.is_active() -> gboolean` | gst_pad_is_active |  | Query if a pad is active |
| is_blocked | `Pad.is_blocked() -> gboolean` | gst_pad_is_blocked |  | Checks if the pad is blocked or not. This function returns the last requested state of the pad. It is not certain that the pad is actually blocking... |
| is_blocking | `Pad.is_blocking() -> gboolean` | gst_pad_is_blocking |  | Checks if the pad is blocking or not. This is a guaranteed state of whether the pad is actually blocking on a #GstBuffer or a #GstEvent. |
| is_linked | `Pad.is_linked() -> gboolean` | gst_pad_is_linked |  | Checks if a @pad is linked to another pad or not. |
| iterate_internal_links | `Pad.iterate_internal_links() -> Iterator` | gst_pad_iterate_internal_links |  | Gets an iterator for the pads to which the given pad is linked to inside of the parent element. Each #GstPad element yielded by the iterator will h... |
| iterate_internal_links_default | `Pad.iterate_internal_links_default(parent: Object?) -> Iterator` | gst_pad_iterate_internal_links_default |  | Iterate the list of pads to which the given pad is linked to inside of the parent element. This is the default handler, and thus returns an iterato... |
| link | `Pad.link(sinkpad: Pad) -> PadLinkReturn` | gst_pad_link |  | Links the source pad and the sink pad. |
| link_full | `Pad.link_full(sinkpad: Pad, flags: PadLinkCheck) -> PadLinkReturn` | gst_pad_link_full |  | Links the source pad and the sink pad. This variant of #gst_pad_link provides a more granular control on the checks being done when linking. While ... |
| link_maybe_ghosting | `Pad.link_maybe_ghosting(sink: Pad) -> gboolean` | gst_pad_link_maybe_ghosting | 1.10 | Links @src to @sink, creating any #GstGhostPad's in between as necessary. This is a convenience function to save having to create and add intermedi... |
| link_maybe_ghosting_full | `Pad.link_maybe_ghosting_full(sink: Pad, flags: PadLinkCheck) -> gboolean` | gst_pad_link_maybe_ghosting_full | 1.10 | Links @src to @sink, creating any #GstGhostPad's in between as necessary. This is a convenience function to save having to create and add intermedi... |
| mark_reconfigure | `Pad.mark_reconfigure() -> none` | gst_pad_mark_reconfigure |  | Mark a pad for needing reconfiguration. The next call to gst_pad_check_reconfigure() will return %TRUE after this call. |
| needs_reconfigure | `Pad.needs_reconfigure() -> gboolean` | gst_pad_needs_reconfigure |  | Check the #GST_PAD_FLAG_NEED_RECONFIGURE flag on @pad and return %TRUE if the flag was set. |
| pause_task | `Pad.pause_task() -> gboolean` | gst_pad_pause_task |  | Pause the task of @pad. This function will also wait until the function executed by the task is finished if this function is not called from the ta... |
| peer_query | `Pad.peer_query(query: Query) -> gboolean` | gst_pad_peer_query |  | Performs gst_pad_query() on the peer of @pad. The caller is responsible for both the allocation and deallocation of the query structure. |
| peer_query_accept_caps | `Pad.peer_query_accept_caps(caps: Caps) -> gboolean` | gst_pad_peer_query_accept_caps |  | Check if the peer of @pad accepts @caps. If @pad has no peer, this function returns %TRUE. |
| peer_query_caps | `Pad.peer_query_caps(filter: Caps?) -> Caps` | gst_pad_peer_query_caps |  | Gets the capabilities of the peer connected to this pad. Similar to gst_pad_query_caps(). When called on srcpads @filter contains the caps that ups... |
| peer_query_convert | `Pad.peer_query_convert(src_format: Format, src_val: gint64, dest_format: Format, dest_val: out gint64) -> gboolean` | gst_pad_peer_query_convert |  | Queries the peer pad of a given sink pad to convert @src_val in @src_format to @dest_format. |
| peer_query_duration | `Pad.peer_query_duration(format: Format, duration: out gint64?) -> gboolean` | gst_pad_peer_query_duration |  | Queries the peer pad of a given sink pad for the total stream duration. |
| peer_query_position | `Pad.peer_query_position(format: Format, cur: out gint64?) -> gboolean` | gst_pad_peer_query_position |  | Queries the peer of a given sink pad for the stream position. |
| proxy_query_accept_caps | `Pad.proxy_query_accept_caps(query: Query) -> gboolean` | gst_pad_proxy_query_accept_caps |  | Checks if all internally linked pads of @pad accepts the caps in @query and returns the intersection of the results. This function is useful as a d... |
| proxy_query_caps | `Pad.proxy_query_caps(query: Query) -> gboolean` | gst_pad_proxy_query_caps |  | Calls gst_pad_query_caps() for all internally linked pads of @pad and returns the intersection of the results. This function is useful as a default... |
| pull_range | `Pad.pull_range(offset: guint64, size: guint, buffer: out Buffer) -> FlowReturn` | gst_pad_pull_range |  | Pulls a @buffer from the peer pad or fills up a provided buffer. This function will first trigger the pad block signal if it was installed. When @p... |
| push | `Pad.push(buffer: Buffer) -> FlowReturn` | gst_pad_push |  | Pushes a buffer to the peer of @pad. This function will call installed block probes before triggering any installed data probes. The function proce... |
| push_event | `Pad.push_event(event: Event) -> gboolean` | gst_pad_push_event |  | Sends the event to the peer of the given pad. This function is mainly used by elements to send events to their peer elements. This function takes o... |
| push_list | `Pad.push_list(list: BufferList) -> FlowReturn` | gst_pad_push_list |  | Pushes a buffer list to the peer of @pad. This function will call installed block probes before triggering any installed data probes. The function ... |
| query | `Pad.query(query: Query) -> gboolean` | gst_pad_query |  | Dispatches a query to a pad. The query should have been allocated by the caller via one of the type-specific allocation functions. The element that... |
| query_accept_caps | `Pad.query_accept_caps(caps: Caps) -> gboolean` | gst_pad_query_accept_caps |  | Check if the given pad accepts the caps. |
| query_caps | `Pad.query_caps(filter: Caps?) -> Caps` | gst_pad_query_caps |  | Gets the capabilities this pad can produce or consume. Note that this method doesn't necessarily return the caps set by sending a gst_event_new_cap... |
| query_convert | `Pad.query_convert(src_format: Format, src_val: gint64, dest_format: Format, dest_val: out gint64) -> gboolean` | gst_pad_query_convert |  | Queries a pad to convert @src_val in @src_format to @dest_format. |
| query_default | `Pad.query_default(parent: Object?, query: Query) -> gboolean` | gst_pad_query_default |  | Invokes the default query handler for the given pad. The query is sent to all pads internally linked to @pad. Note that if there are many possible ... |
| query_duration | `Pad.query_duration(format: Format, duration: out gint64?) -> gboolean` | gst_pad_query_duration |  | Queries a pad for the total stream duration. |
| query_position | `Pad.query_position(format: Format, cur: out gint64?) -> gboolean` | gst_pad_query_position |  | Queries a pad for the stream position. |
| remove_probe | `Pad.remove_probe(id: gulong) -> none` | gst_pad_remove_probe |  | Remove the probe with @id from @pad. MT safe. |
| send_event | `Pad.send_event(event: Event) -> gboolean` | gst_pad_send_event |  | Sends the event to the pad. This function can be used by applications to send events in the pipeline. If @pad is a source pad, @event should be an ... |
| set_activate_function_full | `Pad.set_activate_function_full(activate: PadActivateFunction, user_data: gpointer?, notify: GLib.DestroyNotify) -> none` | gst_pad_set_activate_function_full |  | Sets the given activate function for @pad. The activate function will dispatch to gst_pad_activate_mode() to perform the actual activation. Only ma... |
| set_activatemode_function_full | `Pad.set_activatemode_function_full(activatemode: PadActivateModeFunction, user_data: gpointer?, notify: GLib.DestroyNotify) -> none` | gst_pad_set_activatemode_function_full |  | Sets the given activate_mode function for the pad. An activate_mode function prepares the element for data passing. |
| set_active | `Pad.set_active(active: gboolean) -> gboolean` | gst_pad_set_active |  | Activates or deactivates the given pad. Normally called from within core state change functions. If @active, makes sure the pad is active. If it is... |
| set_chain_function_full | `Pad.set_chain_function_full(chain: PadChainFunction, user_data: gpointer?, notify: GLib.DestroyNotify) -> none` | gst_pad_set_chain_function_full |  | Sets the given chain function for the pad. The chain function is called to process a #GstBuffer input buffer. see #GstPadChainFunction for more det... |
| set_chain_list_function_full | `Pad.set_chain_list_function_full(chainlist: PadChainListFunction, user_data: gpointer?, notify: GLib.DestroyNotify) -> none` | gst_pad_set_chain_list_function_full |  | Sets the given chain list function for the pad. The chainlist function is called to process a #GstBufferList input buffer list. See #GstPadChainLis... |
| set_element_private | `Pad.set_element_private(priv: gpointer?) -> none` | gst_pad_set_element_private |  | Set the given private data gpointer on the pad. This function can only be used by the element that owns the pad. No locking is performed in this fu... |
| set_event_full_function_full | `Pad.set_event_full_function_full(event: PadEventFullFunction, user_data: gpointer?, notify: GLib.DestroyNotify) -> none` | gst_pad_set_event_full_function_full | 1.8 | Sets the given event handler for the pad. |
| set_event_function_full | `Pad.set_event_function_full(event: PadEventFunction, user_data: gpointer?, notify: GLib.DestroyNotify) -> none` | gst_pad_set_event_function_full |  | Sets the given event handler for the pad. |
| set_getrange_function_full | `Pad.set_getrange_function_full(get: PadGetRangeFunction, user_data: gpointer?, notify: GLib.DestroyNotify) -> none` | gst_pad_set_getrange_function_full |  | Sets the given getrange function for the pad. The getrange function is called to produce a new #GstBuffer to start the processing pipeline. see #Gs... |
| set_iterate_internal_links_function_full | `Pad.set_iterate_internal_links_function_full(iterintlink: PadIterIntLinkFunction, user_data: gpointer?, notify: GLib.DestroyNotify) -> none` | gst_pad_set_iterate_internal_links_function_full |  | Sets the given internal link iterator function for the pad. |
| set_link_function_full | `Pad.set_link_function_full(link: PadLinkFunction, user_data: gpointer?, notify: GLib.DestroyNotify) -> none` | gst_pad_set_link_function_full |  | Sets the given link function for the pad. It will be called when the pad is linked with another pad. The return value #GST_PAD_LINK_OK should be us... |
| set_offset | `Pad.set_offset(offset: gint64) -> none` | gst_pad_set_offset |  | Set the offset that will be applied to the running time of @pad. |
| set_query_function_full | `Pad.set_query_function_full(query: PadQueryFunction, user_data: gpointer?, notify: GLib.DestroyNotify) -> none` | gst_pad_set_query_function_full |  | Set the given query function for the pad. |
| set_unlink_function_full | `Pad.set_unlink_function_full(unlink: PadUnlinkFunction, user_data: gpointer?, notify: GLib.DestroyNotify) -> none` | gst_pad_set_unlink_function_full |  | Sets the given unlink function for the pad. It will be called when the pad is unlinked. Note that the pad's lock is already held when the unlink fu... |
| start_task | `Pad.start_task(func: TaskFunction, user_data: gpointer?, notify: GLib.DestroyNotify) -> gboolean` | gst_pad_start_task |  | Starts a task that repeatedly calls @func with @user_data. This function is mostly used in pad activation functions to start the dataflow. The #GST... |
| sticky_events_foreach | `Pad.sticky_events_foreach(foreach_func: PadStickyEventsForeachFunction, user_data: gpointer?) -> none` | gst_pad_sticky_events_foreach |  | Iterates all sticky events on @pad and calls @foreach_func for every event. If @foreach_func returns %FALSE the iteration is immediately stopped. |
| stop_task | `Pad.stop_task() -> gboolean` | gst_pad_stop_task |  | Stop the task of @pad. This function will also make sure that the function executed by the task will effectively stop if not called from the GstTas... |
| store_sticky_event | `Pad.store_sticky_event(event: Event) -> FlowReturn` | gst_pad_store_sticky_event | 1.2 | Store the sticky @event on @pad |
| unlink | `Pad.unlink(sinkpad: Pad) -> gboolean` | gst_pad_unlink |  | Unlinks the source pad from the sink pad. Will emit the #GstPad::unlinked signal on both pads. |
| use_fixed_caps | `Pad.use_fixed_caps() -> none` | gst_pad_use_fixed_caps |  | A helper function you can use that sets the FIXED_CAPS flag This way the default CAPS query will always return the negotiated caps or in case the p... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| caps | Caps | read |  |
| direction | PadDirection | read, write, construct-only |  |
| offset | gint64 | read, write | The offset that will be applied to the running time of the pad. |
| template | PadTemplate | read, write |  |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| linked | `peer: Pad` | none | last |  | Signals that a pad has been linked to the peer pad. |
| unlinked | `peer: Pad` | none | last |  | Signals that a pad has been unlinked from the peer pad. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| linked | `linked(peer: Pad) -> none` |  |  |  |
| unlinked | `unlinked(peer: Pad) -> none` |  |  |  |

### Gst.PadTemplate

Parent: `Object` ?? GType: `GstPadTemplate` ?? C type: `GstPadTemplate`

Padtemplates describe the possible media types a pad or an elementfactory can handle. This allows for both inspection of handled types before loadi...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| caps | Caps |
| direction | PadDirection |
| documentation_caps | Caps |
| gtype | GType |
| name_template | utf8 |
| object | Object |
| presence | PadPresence |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `PadTemplate.new(name_template: utf8, direction: PadDirection, presence: PadPresence, caps: Caps) -> PadTemplate` | gst_pad_template_new |  | Creates a new pad template with a name according to the given template and with the given arguments. |
| new_from_static_pad_template_with_gtype | `PadTemplate.new_from_static_pad_template_with_gtype(pad_template: StaticPadTemplate, pad_type: GType) -> PadTemplate` | gst_pad_template_new_from_static_pad_template_with_gtype | 1.14 | Converts a #GstStaticPadTemplate into a #GstPadTemplate with a type. |
| new_with_gtype | `PadTemplate.new_with_gtype(name_template: utf8, direction: PadDirection, presence: PadPresence, caps: Caps, pad_type: GType) -> PadTemplate` | gst_pad_template_new_with_gtype | 1.14 | Creates a new pad template with a name according to the given template and with the given arguments. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_caps | `PadTemplate.get_caps() -> Caps` | gst_pad_template_get_caps |  | Gets the capabilities of the pad template. |
| get_documentation_caps | `PadTemplate.get_documentation_caps() -> Caps` | gst_pad_template_get_documentation_caps | 1.18 | See gst_pad_template_set_documentation_caps(). |
| pad_created | `PadTemplate.pad_created(pad: Pad) -> none` | gst_pad_template_pad_created |  | Emit the pad-created signal for this template when created by this pad. |
| set_documentation_caps | `PadTemplate.set_documentation_caps(caps: Caps) -> none` | gst_pad_template_set_documentation_caps | 1.18 | Certain elements will dynamically construct the caps of their pad templates. In order not to let environment-specific information into the document... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| caps | Caps | read, write, construct-only | The capabilities of the pad described by the pad template. |
| direction | PadDirection | read, write, construct-only | The direction of the pad described by the pad template. |
| gtype | GType | read, write, construct-only | The type of the pad described by the pad template. |
| name-template | utf8 | read, write, construct-only | The name template of the pad template. |
| presence | PadPresence | read, write, construct-only | When the pad described by the pad template will become available. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| pad-created | `pad: Pad` | none | last |  | This signal is fired when an element creates a pad from this template. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| pad_created | `pad_created(pad: Pad) -> none` |  |  | Emit the pad-created signal for this template when created by this pad. |

### Gst.ParamArray

Parent: `GObject.ParamSpec` ?? GType: `GstParamArray`

A fundamental type that describes a #GParamSpec for arrays of values

### Gst.ParamFraction

Parent: `GObject.ParamSpec` ?? GType: `GstParamFraction`

A fundamental type that describes a #GParamSpec for fractional properties

### Gst.Pipeline

Parent: `Bin` ?? Implements: `ChildProxy` ?? GType: `GstPipeline` ?? C type: `GstPipeline`

A #GstPipeline is a special #GstBin used as the toplevel container for the filter graph. The #GstPipeline will manage the selection and distributio...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| bin | Bin |
| delay | ClockTime |
| fixed_clock | Clock |
| priv | PipelinePrivate |
| stream_time | ClockTime |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Pipeline.new(name: utf8?) -> Element` | gst_pipeline_new |  | Create a new pipeline with the given name. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| auto_clock | `Pipeline.auto_clock() -> none` | gst_pipeline_auto_clock |  | Let @pipeline select a clock automatically. This is the default behaviour. Use this function if you previous forced a fixed clock with gst_pipeline... |
| get_auto_flush_bus | `Pipeline.get_auto_flush_bus() -> gboolean` | gst_pipeline_get_auto_flush_bus |  | Check if @pipeline will automatically flush messages when going to the NULL state. |
| get_bus | `Pipeline.get_bus() -> Bus` | gst_pipeline_get_bus |  | Gets the #GstBus of @pipeline. The bus allows applications to receive #GstMessage packets. |
| get_clock | `Pipeline.get_clock() -> Clock` | gst_pipeline_get_clock |  | Gets the current clock used by @pipeline. Users of object oriented languages should use gst_pipeline_get_pipeline_clock() to avoid confusion with g... |
| get_configured_latency | `Pipeline.get_configured_latency() -> ClockTime` | gst_pipeline_get_configured_latency | 1.24 | Return the configured latency on @pipeline. |
| get_delay | `Pipeline.get_delay() -> ClockTime` | gst_pipeline_get_delay |  | Get the configured delay (see gst_pipeline_set_delay()). |
| get_latency | `Pipeline.get_latency() -> ClockTime` | gst_pipeline_get_latency | 1.6 | Gets the latency that should be configured on the pipeline. See gst_pipeline_set_latency(). |
| get_pipeline_clock | `Pipeline.get_pipeline_clock() -> Clock` | gst_pipeline_get_pipeline_clock | 1.6 | Gets the current clock used by @pipeline. Unlike gst_element_get_clock(), this function will always return a clock, even if the pipeline is not in ... |
| is_live | `Pipeline.is_live() -> gboolean` | gst_pipeline_is_live | 1.24 | Check if @pipeline is live. |
| set_auto_flush_bus | `Pipeline.set_auto_flush_bus(auto_flush: gboolean) -> none` | gst_pipeline_set_auto_flush_bus |  | Usually, when a pipeline goes from READY to NULL state, it automatically flushes all pending messages on the bus, which is done for refcounting pur... |
| set_clock | `Pipeline.set_clock(clock: Clock?) -> gboolean` | gst_pipeline_set_clock |  | Set the clock for @pipeline. The clock will be distributed to all the elements managed by the pipeline. |
| set_delay | `Pipeline.set_delay(delay: ClockTime) -> none` | gst_pipeline_set_delay |  | Set the expected delay needed for all elements to perform the PAUSED to PLAYING state change. @delay will be added to the base time of the elements... |
| set_latency | `Pipeline.set_latency(latency: ClockTime) -> none` | gst_pipeline_set_latency | 1.6 | Sets the latency that should be configured on the pipeline. Setting GST_CLOCK_TIME_NONE will restore the default behaviour of using the minimum lat... |
| use_clock | `Pipeline.use_clock(clock: Clock?) -> none` | gst_pipeline_use_clock |  | Force @pipeline to use the given @clock. The pipeline will always use the given clock even if new clock providers are added to this pipeline. If @c... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| auto-flush-bus | gboolean | read, write | Whether or not to automatically flush all messages on the pipeline's bus when going from READY to NULL state. Please see gst_pipeline_set_auto_flus... |
| delay | guint64 | read, write | The expected delay needed for elements to spin up to the PLAYING state expressed in nanoseconds. see gst_pipeline_set_delay() for more information ... |
| latency | guint64 | read, write | Latency to configure on the pipeline. See gst_pipeline_set_latency(). |

### Gst.Plugin

Parent: `Object` ?? GType: `GstPlugin` ?? C type: `GstPlugin`

GStreamer is extensible, so #GstElement instances can be loaded at runtime. A plugin system can provide one or more of the basic GStreamer #GstPlug...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| list_free | `list_free(list: GLib.List) -> none` | gst_plugin_list_free |  | Unrefs each member of @list, then frees the list. |
| load_by_name | `load_by_name(name: utf8) -> Plugin` | gst_plugin_load_by_name |  | Load the named plugin. Refs the plugin. |
| load_file | `load_file(filename: filename) -> Plugin throws` | gst_plugin_load_file |  | Loads the given plugin and refs it. Caller needs to unref after use. |
| register_static | `register_static(major_version: gint, minor_version: gint, name: utf8, description: utf8, init_func: PluginInitFunc, version: utf8, license: utf8, source: utf8, package: utf8, origin: utf8) -> gboolean` | gst_plugin_register_static |  | Registers a static plugin, ie. a plugin which is private to an application or library and contained within the application or library (as opposed t... |
| register_static_full | `register_static_full(major_version: gint, minor_version: gint, name: utf8, description: utf8, init_full_func: PluginInitFullFunc, version: utf8, license: utf8, source: utf8, package: utf8, origin: utf8, user_data: gpointer?) -> gboolean` | gst_plugin_register_static_full |  | Registers a static plugin, ie. a plugin which is private to an application or library and contained within the application or library (as opposed t... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_dependency | `Plugin.add_dependency(env_vars: utf8?, paths: utf8?, names: utf8?, flags: PluginDependencyFlags) -> none` | gst_plugin_add_dependency |  | Make GStreamer aware of external dependencies which affect the feature set of this plugin (ie. the elements or typefinders associated with it). GSt... |
| add_dependency_simple | `Plugin.add_dependency_simple(env_vars: utf8?, paths: utf8?, names: utf8?, flags: PluginDependencyFlags) -> none` | gst_plugin_add_dependency_simple |  | Make GStreamer aware of external dependencies which affect the feature set of this plugin (ie. the elements or typefinders associated with it). GSt... |
| add_status_error | `Plugin.add_status_error(message: utf8) -> none` | gst_plugin_add_status_error | 1.24 | a #GstPlugin |
| add_status_info | `Plugin.add_status_info(message: utf8) -> none` | gst_plugin_add_status_info | 1.24 | a #GstPlugin |
| add_status_warning | `Plugin.add_status_warning(message: utf8) -> none` | gst_plugin_add_status_warning | 1.24 | a #GstPlugin |
| get_cache_data | `Plugin.get_cache_data() -> Structure` | gst_plugin_get_cache_data |  | Gets the plugin specific data cache. If it is %NULL there is no cached data stored. This is the case when the registry is getting rebuilt. |
| get_description | `Plugin.get_description() -> utf8` | gst_plugin_get_description |  | Get the long descriptive name of the plugin |
| get_filename | `Plugin.get_filename() -> filename` | gst_plugin_get_filename |  | get the filename of the plugin |
| get_license | `Plugin.get_license() -> utf8` | gst_plugin_get_license |  | get the license of the plugin |
| get_name | `Plugin.get_name() -> utf8` | gst_plugin_get_name |  | Get the short name of the plugin |
| get_origin | `Plugin.get_origin() -> utf8` | gst_plugin_get_origin |  | get the URL where the plugin comes from |
| get_package | `Plugin.get_package() -> utf8` | gst_plugin_get_package |  | get the package the plugin belongs to. |
| get_release_date_string | `Plugin.get_release_date_string() -> utf8` | gst_plugin_get_release_date_string |  | Get the release date (and possibly time) in form of a string, if available. For normal GStreamer plugin releases this will usually just be a date i... |
| get_source | `Plugin.get_source() -> utf8` | gst_plugin_get_source |  | get the source module the plugin belongs to. |
| get_status_errors | `Plugin.get_status_errors() -> utf8` | gst_plugin_get_status_errors | 1.24 | an array of plugin status error messages, or NULL |
| get_status_infos | `Plugin.get_status_infos() -> utf8` | gst_plugin_get_status_infos | 1.24 | an array of plugin status info messages, or NULL |
| get_status_warnings | `Plugin.get_status_warnings() -> utf8` | gst_plugin_get_status_warnings | 1.24 | an array of plugin status warning messages, or NULL |
| get_version | `Plugin.get_version() -> utf8` | gst_plugin_get_version |  | get the version of the plugin |
| is_loaded | `Plugin.is_loaded() -> gboolean` | gst_plugin_is_loaded |  | queries if the plugin is loaded into memory |
| load | `Plugin.load() -> Plugin` | gst_plugin_load |  | Loads @plugin. Note that the *return value* is the loaded plugin; @plugin is untouched. The normal use pattern of this function goes like this: \|[ ... |
| set_cache_data | `Plugin.set_cache_data(cache_data: Structure) -> none` | gst_plugin_set_cache_data |  | Adds plugin specific data to cache. Passes the ownership of the structure to the @plugin. The cache is flushed every time the registry is rebuilt. |

### Gst.PluginFeature

Parent: `Object` ?? Subclasses: `DeviceProviderFactory`, `DynamicTypeFactory`, `ElementFactory`, `TracerFactory`, `TypeFindFactory` ?? GType: `GstPluginFeature` ?? C type: `GstPluginFeature` ?? Abstract

This is a base class for anything that can be added to a #GstPlugin.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| list_copy | `list_copy(list: GLib.List) -> GLib.List` | gst_plugin_feature_list_copy |  | Copies the list of features. Caller should call @gst_plugin_feature_list_free when done with the list. |
| list_debug | `list_debug(list: GLib.List) -> none` | gst_plugin_feature_list_debug |  | Debug the plugin feature names in @list. |
| list_free | `list_free(list: GLib.List) -> none` | gst_plugin_feature_list_free |  | Unrefs each member of @list, then frees the list. |
| rank_compare_func | `rank_compare_func(p1: gpointer?, p2: gpointer?) -> gint` | gst_plugin_feature_rank_compare_func |  | Compares the two given #GstPluginFeature instances. This function can be used as a #GCompareFunc when sorting by rank and then by name. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| check_version | `PluginFeature.check_version(min_major: guint, min_minor: guint, min_micro: guint) -> gboolean` | gst_plugin_feature_check_version |  | Checks whether the given plugin feature is at least the required version. Note: Since version 1.24 this function no longer returns %TRUE if the ver... |
| get_plugin | `PluginFeature.get_plugin() -> Plugin` | gst_plugin_feature_get_plugin |  | Get the plugin that provides this feature. |
| get_plugin_name | `PluginFeature.get_plugin_name() -> utf8` | gst_plugin_feature_get_plugin_name | 1.2 | Get the name of the plugin that provides this feature. |
| get_rank | `PluginFeature.get_rank() -> guint` | gst_plugin_feature_get_rank |  | Gets the rank of a plugin feature. |
| load | `PluginFeature.load() -> PluginFeature` | gst_plugin_feature_load |  | Loads the plugin containing @feature if it's not already loaded. @feature is unaffected; use the return value instead. Normally this function is us... |
| set_rank | `PluginFeature.set_rank(rank: guint) -> none` | gst_plugin_feature_set_rank |  | Specifies a rank for a plugin feature, so that autoplugging uses the most appropriate feature. |

### Gst.ProxyPad

Parent: `Pad` ?? Subclasses: `GhostPad` ?? GType: `GstProxyPad` ?? C type: `GstProxyPad`

Invoke the default chain function of the proxy pad.

#### Fields

| Field | Type |
| --- | --- |
| pad | Pad |
| priv | ProxyPadPrivate |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| chain_default | `chain_default(pad: Pad, parent: Object?, buffer: Buffer) -> FlowReturn` | gst_proxy_pad_chain_default |  | Invoke the default chain function of the proxy pad. |
| chain_list_default | `chain_list_default(pad: Pad, parent: Object?, list: BufferList) -> FlowReturn` | gst_proxy_pad_chain_list_default |  | Invoke the default chain list function of the proxy pad. |
| getrange_default | `getrange_default(pad: Pad, parent: Object, offset: guint64, size: guint, buffer: out Buffer) -> FlowReturn` | gst_proxy_pad_getrange_default |  | Invoke the default getrange function of the proxy pad. |
| iterate_internal_links_default | `iterate_internal_links_default(pad: Pad, parent: Object?) -> Iterator` | gst_proxy_pad_iterate_internal_links_default |  | Invoke the default iterate internal links function of the proxy pad. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_internal | `ProxyPad.get_internal() -> ProxyPad` | gst_proxy_pad_get_internal |  | Get the internal pad of @pad. Unref target pad after usage. The internal pad of a #GstGhostPad is the internally used pad of opposite direction, wh... |

### Gst.Registry

Parent: `Object` ?? GType: `GstRegistry` ?? C type: `GstRegistry`

One registry holds the metadata of a set of plugins. <emphasis role="bold">Design:</emphasis> The #GstRegistry object is a list of plugins and some...

#### Fields

| Field | Type |
| --- | --- |
| object | Object |
| priv | RegistryPrivate |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| fork_is_enabled | `fork_is_enabled() -> gboolean` | gst_registry_fork_is_enabled |  | By default GStreamer will perform scanning and rebuilding of the registry file using a helper child process. Applications might want to disable thi... |
| fork_set_enabled | `fork_set_enabled(enabled: gboolean) -> none` | gst_registry_fork_set_enabled |  | Applications might want to disable/enable spawning of a child helper process when rebuilding the registry. See gst_registry_fork_is_enabled() for m... |
| get | `get() -> Registry` | gst_registry_get |  | Retrieves the singleton plugin registry. The caller does not own a reference on the registry, as it is alive as long as GStreamer is initialized. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_feature | `Registry.add_feature(feature: PluginFeature) -> gboolean` | gst_registry_add_feature |  | Add the feature to the registry. The feature-added signal will be emitted. @feature's reference count will be incremented, and any floating referen... |
| add_plugin | `Registry.add_plugin(plugin: Plugin) -> gboolean` | gst_registry_add_plugin |  | Add the plugin to the registry. The plugin-added signal will be emitted. @plugin's reference count will be incremented, and any floating reference ... |
| check_feature_version | `Registry.check_feature_version(feature_name: utf8, min_major: guint, min_minor: guint, min_micro: guint) -> gboolean` | gst_registry_check_feature_version |  | Checks whether a plugin feature by the given name exists in @registry and whether its version is at least the version required. |
| feature_filter | `Registry.feature_filter(filter: PluginFeatureFilter, first: gboolean, user_data: gpointer?) -> GLib.List` | gst_registry_feature_filter |  | Runs a filter against all features of the plugins in the registry and returns a GList with the results. If the first flag is set, only the first ma... |
| find_feature | `Registry.find_feature(name: utf8, type: GType) -> PluginFeature` | gst_registry_find_feature |  | Find the pluginfeature with the given name and type in the registry. |
| find_plugin | `Registry.find_plugin(name: utf8) -> Plugin` | gst_registry_find_plugin |  | Find the plugin with the given name in the registry. The plugin will be reffed; caller is responsible for unreffing. |
| get_feature_list | `Registry.get_feature_list(type: GType) -> GLib.List` | gst_registry_get_feature_list |  | Retrieves a #GList of #GstPluginFeature of @type. |
| get_feature_list_by_plugin | `Registry.get_feature_list_by_plugin(name: utf8) -> GLib.List` | gst_registry_get_feature_list_by_plugin |  | Retrieves a #GList of features of the plugin with name @name. |
| get_feature_list_cookie | `Registry.get_feature_list_cookie() -> guint32` | gst_registry_get_feature_list_cookie |  | Returns the registry's feature list cookie. This changes every time a feature is added or removed from the registry. |
| get_plugin_list | `Registry.get_plugin_list() -> GLib.List` | gst_registry_get_plugin_list |  | Get a copy of all plugins registered in the given registry. The refcount of each element in the list in incremented. |
| lookup | `Registry.lookup(filename: utf8) -> Plugin` | gst_registry_lookup |  | Look up a plugin in the given registry with the given filename. If found, plugin is reffed. |
| lookup_feature | `Registry.lookup_feature(name: utf8) -> PluginFeature` | gst_registry_lookup_feature |  | Find a #GstPluginFeature with @name in @registry. |
| plugin_filter | `Registry.plugin_filter(filter: PluginFilter, first: gboolean, user_data: gpointer?) -> GLib.List` | gst_registry_plugin_filter |  | Runs a filter against all plugins in the registry and returns a #GList with the results. If the first flag is set, only the first match is returned... |
| remove_feature | `Registry.remove_feature(feature: PluginFeature) -> none` | gst_registry_remove_feature |  | Remove the feature from the registry. MT safe. |
| remove_plugin | `Registry.remove_plugin(plugin: Plugin) -> none` | gst_registry_remove_plugin |  | Remove the plugin from the registry. MT safe. |
| scan_path | `Registry.scan_path(path: filename) -> gboolean` | gst_registry_scan_path |  | Scan the given path for plugins to add to the registry. The syntax of the path is specific to the registry. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| feature-added | `feature: PluginFeature` | none | last |  | Signals that a feature has been added to the registry (possibly replacing a previously-added one by the same name) |
| plugin-added | `plugin: Plugin` | none | last |  | Signals that a plugin has been added to the registry (possibly replacing a previously-added one by the same name) |

### Gst.SharedTaskPool

Parent: `TaskPool` ?? GType: `GstSharedTaskPool` ?? C type: `GstSharedTaskPool`

The #GstSharedTaskPool object.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent | TaskPool |
| priv | SharedTaskPoolPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SharedTaskPool.new() -> TaskPool` | gst_shared_task_pool_new | 1.20 | Create a new shared task pool. The shared task pool will queue tasks on a maximum number of threads, 1 by default. Do not use a #GstSharedTaskPool ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_max_threads | `SharedTaskPool.get_max_threads() -> guint` | gst_shared_task_pool_get_max_threads | 1.20 | the maximum number of threads @pool is configured to spawn |
| set_max_threads | `SharedTaskPool.set_max_threads(max_threads: guint) -> none` | gst_shared_task_pool_set_max_threads | 1.20 | Update the maximal number of threads the @pool may spawn. When the maximal number of threads is reduced, existing threads are not immediately shut ... |

### Gst.Stream

Parent: `Object` ?? GType: `GstStream` ?? C type: `GstStream`

A high-level object representing a single stream. It might be backed, or not, by an actual flow of data in a pipeline (#GstPad). A #GstStream does ...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| object | Object |
| priv | StreamPrivate |
| stream_id | utf8 |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Stream.new(stream_id: utf8?, caps: Caps?, type: StreamType, flags: StreamFlags) -> Stream` | gst_stream_new | 1.10 | Create a new #GstStream for the given @stream_id, @caps, @type and @flags |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_caps | `Stream.get_caps() -> Caps` | gst_stream_get_caps | 1.10 | Retrieve the caps for @stream, if any |
| get_stream_flags | `Stream.get_stream_flags() -> StreamFlags` | gst_stream_get_stream_flags | 1.10 | Retrieve the current stream flags for @stream |
| get_stream_id | `Stream.get_stream_id() -> utf8` | gst_stream_get_stream_id | 1.10 | Returns the stream ID of @stream. |
| get_stream_type | `Stream.get_stream_type() -> StreamType` | gst_stream_get_stream_type | 1.10 | Retrieve the stream type for @stream |
| get_tags | `Stream.get_tags() -> TagList` | gst_stream_get_tags | 1.10 | Retrieve the tags for @stream, if any |
| set_caps | `Stream.set_caps(caps: Caps?) -> none` | gst_stream_set_caps | 1.10 | Set the caps for the #GstStream |
| set_stream_flags | `Stream.set_stream_flags(flags: StreamFlags) -> none` | gst_stream_set_stream_flags | 1.10 | Set the @flags for the @stream. |
| set_stream_type | `Stream.set_stream_type(stream_type: StreamType) -> none` | gst_stream_set_stream_type | 1.10 | Set the stream type of @stream |
| set_tags | `Stream.set_tags(tags: TagList?) -> none` | gst_stream_set_tags | 1.10 | Set the tags for the #GstStream |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| caps | Caps | read, write | The #GstCaps of the #GstStream. |
| stream-flags | StreamFlags | read, write |  |
| stream-id | utf8 | read, write, construct-only | The unique identifier of the #GstStream. Can only be set at construction time. |
| stream-type | StreamType | read, write | The #GstStreamType of the #GstStream. Can only be set at construction time. |
| tags | TagList | read, write | The #GstTagList of the #GstStream. |

### Gst.StreamCollection

Parent: `Object` ?? GType: `GstStreamCollection` ?? C type: `GstStreamCollection`

A collection of #GstStream that are available. A #GstStreamCollection will be provided by elements that can make those streams available. Applicati...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| object | Object |
| priv | StreamCollectionPrivate |
| upstream_id | utf8 |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `StreamCollection.new(upstream_id: utf8?) -> StreamCollection` | gst_stream_collection_new | 1.10 | Create a new #GstStreamCollection. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_stream | `StreamCollection.add_stream(stream: Stream) -> gboolean` | gst_stream_collection_add_stream | 1.10 | Add the given @stream to the @collection. |
| get_size | `StreamCollection.get_size() -> guint` | gst_stream_collection_get_size | 1.10 | Get the number of streams this collection contains |
| get_stream | `StreamCollection.get_stream(index: guint) -> Stream` | gst_stream_collection_get_stream | 1.10 | Retrieve the #GstStream with index @index from the collection. The caller should not modify the returned #GstStream |
| get_upstream_id | `StreamCollection.get_upstream_id() -> utf8` | gst_stream_collection_get_upstream_id | 1.10 | Returns the upstream id of the @collection. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| upstream-id | utf8 | read, write | stream-id |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| stream-notify | `prop_stream: Stream, prop: GObject.ParamSpec` | none | first detailed |  | The stream notify signal is used to be notified of property changes to streams within the collection. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| stream_notify | `stream_notify(stream: Stream, pspec: GObject.ParamSpec) -> none` |  |  | default signal handler for the stream-notify signal |

### Gst.SystemClock

Parent: `Clock` ?? GType: `GstSystemClock` ?? C type: `GstSystemClock`

The GStreamer core provides a GstSystemClock based on the system time. Asynchronous callbacks are scheduled from an internal thread. Clock implemen...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| clock | Clock |
| priv | SystemClockPrivate |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| obtain | `obtain() -> Clock` | gst_system_clock_obtain |  | Get a handle to the default system clock. The refcount of the clock will be increased so you need to unref the clock after usage. |
| set_default | `set_default(new_clock: Clock?) -> none` | gst_system_clock_set_default | 1.4 | Sets the default system clock that can be obtained with gst_system_clock_obtain(). This is mostly used for testing and debugging purposes when you ... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| clock-type | ClockType | read, write |  |

### Gst.Task

Parent: `Object` ?? GType: `GstTask` ?? C type: `GstTask`

#GstTask is used by #GstElement and #GstPad to provide the data passing threads in a #GstPipeline. A #GstPad will typically start a #GstTask to pus...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| cond | GLib.Cond |
| func | TaskFunction |
| lock | GLib.RecMutex |
| notify | GLib.DestroyNotify |
| object | Object |
| priv | TaskPrivate |
| running | gboolean |
| state | TaskState |
| thread | GLib.Thread |
| user_data | gpointer |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Task.new(func: TaskFunction, user_data: gpointer?, notify: GLib.DestroyNotify) -> Task` | gst_task_new |  | Create a new Task that will repeatedly call the provided @func with @user_data as a parameter. Typically the task will run in a new thread. The fun... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| cleanup_all | `cleanup_all() -> none` | gst_task_cleanup_all |  | Wait for all tasks to be stopped. This is mainly used internally to ensure proper cleanup of internal data structures in test suites. MT safe. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_pool | `Task.get_pool() -> TaskPool` | gst_task_get_pool |  | Get the #GstTaskPool that this task will use for its streaming threads. MT safe. |
| get_state | `Task.get_state() -> TaskState` | gst_task_get_state |  | Get the current state of the task. |
| join | `Task.join() -> gboolean` | gst_task_join |  | Joins @task. After this call, it is safe to unref the task and clean up the lock set with gst_task_set_lock(). The task will automatically be stopp... |
| pause | `Task.pause() -> gboolean` | gst_task_pause |  | Pauses @task. This method can also be called on a task in the stopped state, in which case a thread will be started and will remain in the paused s... |
| resume | `Task.resume() -> gboolean` | gst_task_resume | 1.18 | Resume @task in case it was paused. If the task was stopped, it will remain in that state and this function will return %FALSE. |
| set_enter_callback | `Task.set_enter_callback(enter_func: TaskThreadFunc, user_data: gpointer?, notify: GLib.DestroyNotify) -> none` | gst_task_set_enter_callback |  | Call @enter_func when the task function of @task is entered. @user_data will be passed to @enter_func and @notify will be called when @user_data is... |
| set_leave_callback | `Task.set_leave_callback(leave_func: TaskThreadFunc, user_data: gpointer?, notify: GLib.DestroyNotify) -> none` | gst_task_set_leave_callback |  | Call @leave_func when the task function of @task is left. @user_data will be passed to @leave_func and @notify will be called when @user_data is no... |
| set_lock | `Task.set_lock(mutex: GLib.RecMutex) -> none` | gst_task_set_lock |  | Set the mutex used by the task. The mutex will be acquired before calling the #GstTaskFunction. This function has to be called before calling gst_t... |
| set_pool | `Task.set_pool(pool: TaskPool) -> none` | gst_task_set_pool |  | Set @pool as the new GstTaskPool for @task. Any new streaming threads that will be created by @task will now use @pool. MT safe. |
| set_state | `Task.set_state(state: TaskState) -> gboolean` | gst_task_set_state |  | Sets the state of @task to @state. The @task must have a lock associated with it using gst_task_set_lock() when going to GST_TASK_STARTED or GST_TA... |
| start | `Task.start() -> gboolean` | gst_task_start |  | Starts @task. The @task must have a lock associated with it using gst_task_set_lock() or this function will return %FALSE. |
| stop | `Task.stop() -> gboolean` | gst_task_stop |  | Stops @task. This method merely schedules the task to stop and will not wait for the task to have completely stopped. Use gst_task_join() to stop a... |

### Gst.TaskPool

Parent: `Object` ?? Subclasses: `SharedTaskPool` ?? GType: `GstTaskPool` ?? C type: `GstTaskPool`

This object provides an abstraction for creating threads. The default implementation uses a regular GThreadPool to start tasks. Subclasses can be m...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| object | Object |
| pool | GLib.ThreadPool |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TaskPool.new() -> TaskPool` | gst_task_pool_new |  | Create a new default task pool. The default task pool will use a regular GThreadPool for threads. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| cleanup | `TaskPool.cleanup() -> none` | gst_task_pool_cleanup |  | Wait for all tasks to be stopped. This is mainly used internally to ensure proper cleanup of internal data structures in test suites. MT safe. |
| dispose_handle | `TaskPool.dispose_handle(id: gpointer?) -> none` | gst_task_pool_dispose_handle | 1.20 | Dispose of the handle returned by gst_task_pool_push(). This does not need to be called with the default implementation as the default #GstTaskPool... |
| join | `TaskPool.join(id: gpointer?) -> none` | gst_task_pool_join |  | Join a task and/or return it to the pool. @id is the id obtained from gst_task_pool_push(). The default implementation does nothing, as the default... |
| prepare | `TaskPool.prepare() -> none throws` | gst_task_pool_prepare |  | Prepare the taskpool for accepting gst_task_pool_push() operations. MT safe. |
| push | `TaskPool.push(func: TaskPoolFunction, user_data: gpointer?) -> gpointer throws` | gst_task_pool_push |  | Start the execution of a new thread from @pool. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| cleanup | `cleanup() -> none` |  |  | Wait for all tasks to be stopped. This is mainly used internally to ensure proper cleanup of internal data structures in test suites. MT safe. |
| dispose_handle | `dispose_handle(id: gpointer?) -> none` |  | 1.20 | Dispose of the handle returned by gst_task_pool_push(). This does not need to be called with the default implementation as the default #GstTaskPool... |
| join | `join(id: gpointer?) -> none` |  |  | Join a task and/or return it to the pool. @id is the id obtained from gst_task_pool_push(). The default implementation does nothing, as the default... |
| prepare | `prepare() -> none throws` |  |  | Prepare the taskpool for accepting gst_task_pool_push() operations. MT safe. |
| push | `push(func: TaskPoolFunction, user_data: gpointer?) -> gpointer throws` |  |  | Start the execution of a new thread from @pool. |

### Gst.Tracer

Parent: `Object` ?? GType: `GstTracer` ?? C type: `GstTracer` ?? Abstract

Tracing modules will subclass #GstTracer and register through gst_tracer_register(). Modules can attach to various hook-types - see gst_tracing_reg...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent | Object |
| priv | TracerPrivate |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| register | `register(plugin: Plugin?, name: utf8, type: GType) -> gboolean` | gst_tracer_register |  | Create a new tracer-factory capable of instantiating objects of the @type and add the factory to @plugin. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| params | utf8 | read, write |  |

### Gst.TracerFactory

Parent: `PluginFeature` ?? GType: `GstTracerFactory` ?? C type: `GstTracerFactory`

Use gst_tracer_factory_get_list() to get a list of tracer factories known to GStreamer.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_list | `get_list() -> GLib.List` | gst_tracer_factory_get_list | 1.8 | Gets the list of all registered tracer factories. You must free the list using gst_plugin_feature_list_free(). The returned factories are sorted by... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_tracer_type | `TracerFactory.get_tracer_type() -> GType` | gst_tracer_factory_get_tracer_type | 1.14 | Get the #GType for elements managed by this factory. The type can only be retrieved if the element factory is loaded, which can be assured with gst... |

### Gst.TracerRecord

Parent: `Object` ?? GType: `GstTracerRecord` ?? C type: `GstTracerRecord`

Tracing modules will create instances of this class to announce the data they will log and create a log formatter.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TracerRecord.new(name: utf8, firstfield: utf8, ...: void) -> TracerRecord` | gst_tracer_record_new | 1.8 | Create a new tracer record. The record instance can be used to efficiently log entries using gst_tracer_record_log(). %NULL terminator required aft... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| log | `TracerRecord.log(...: void) -> none` | gst_tracer_record_log | 1.8 | Serialzes the trace event into the log. Right now this is using the gstreamer debug log with the level TRACE (7) and the category "GST_TRACER". > P... |

### Gst.TypeFindFactory

Parent: `PluginFeature` ?? GType: `GstTypeFindFactory` ?? C type: `GstTypeFindFactory`

These functions allow querying information about registered typefind functions. How to create and register these functions is described in the sect...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_list | `get_list() -> GLib.List` | gst_type_find_factory_get_list |  | Gets the list of all registered typefind factories. You must free the list using gst_plugin_feature_list_free(). The returned factories are sorted ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| call_function | `TypeFindFactory.call_function(find: TypeFind) -> none` | gst_type_find_factory_call_function |  | Calls the #GstTypeFindFunction associated with this factory. |
| get_caps | `TypeFindFactory.get_caps() -> Caps` | gst_type_find_factory_get_caps |  | Gets the #GstCaps associated with a typefind factory. |
| get_extensions | `TypeFindFactory.get_extensions() -> utf8` | gst_type_find_factory_get_extensions |  | Gets the extensions associated with a #GstTypeFindFactory. The returned array should not be changed. If you need to change stuff in it, you should ... |
| has_function | `TypeFindFactory.has_function() -> gboolean` | gst_type_find_factory_has_function |  | Check whether the factory has a typefind function. Typefind factories without typefind functions are a last-effort fallback mechanism to e.g. assum... |

### Gst.ValueArray

GType: `GstValueArray` ?? C type: `GstValueArray`

A fundamental type that describes an ordered list of #GValue

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_and_take_value | `append_and_take_value(value: GObject.Value, append_value: GObject.Value) -> none` | gst_value_array_append_and_take_value | 1.2 | Appends @append_value to the GstValueArray in @value. |
| append_value | `append_value(value: GObject.Value, append_value: GObject.Value) -> none` | gst_value_array_append_value |  | Appends @append_value to the GstValueArray in @value. |
| get_size | `get_size(value: GObject.Value) -> guint` | gst_value_array_get_size |  | Gets the number of values contained in @value. |
| get_value | `get_value(value: GObject.Value, index: guint) -> GObject.Value` | gst_value_array_get_value |  | Gets the value that is a member of the array contained in @value and has the index @index. |
| init | `init(value: GObject.Value, prealloc: guint) -> GObject.Value` | gst_value_array_init | 1.18 | Initializes and pre-allocates a #GValue of type #GST_TYPE_ARRAY. |
| prepend_value | `prepend_value(value: GObject.Value, prepend_value: GObject.Value) -> none` | gst_value_array_prepend_value |  | Prepends @prepend_value to the GstValueArray in @value. |

### Gst.ValueList

GType: `GstValueList`

A fundamental type that describes an unordered list of #GValue

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_and_take_value | `append_and_take_value(value: GObject.Value, append_value: GObject.Value) -> none` | gst_value_list_append_and_take_value | 1.2 | Appends @append_value to the GstValueList in @value. |
| append_value | `append_value(value: GObject.Value, append_value: GObject.Value) -> none` | gst_value_list_append_value |  | Appends @append_value to the GstValueList in @value. |
| concat | `concat(dest: out GObject.Value, value1: GObject.Value, value2: GObject.Value) -> none` | gst_value_list_concat |  | Concatenates copies of @value1 and @value2 into a list. Values that are not of type #GST_TYPE_LIST are treated as if they were lists of length 1. @... |
| get_size | `get_size(value: GObject.Value) -> guint` | gst_value_list_get_size |  | Gets the number of values contained in @value. |
| get_value | `get_value(value: GObject.Value, index: guint) -> GObject.Value` | gst_value_list_get_value |  | Gets the value that is a member of the list contained in @value and has the index @index. |
| init | `init(value: GObject.Value, prealloc: guint) -> GObject.Value` | gst_value_list_init | 1.18 | Initializes and pre-allocates a #GValue of type #GST_TYPE_LIST. |
| merge | `merge(dest: out GObject.Value, value1: GObject.Value, value2: GObject.Value) -> none` | gst_value_list_merge |  | Merges copies of @value1 and @value2. Values that are not of type #GST_TYPE_LIST are treated as if they were lists of length 1. The result will be ... |
| prepend_value | `prepend_value(value: GObject.Value, prepend_value: GObject.Value) -> none` | gst_value_list_prepend_value |  | Prepends @prepend_value to the GstValueList in @value. |

## Interfaces

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| ChildProxy |  | 0 | 2 | 13 | This interface abstracts handling of property sets for elements with children. Imagine elements such as mixers or polyphonic generators. They all h... |
| Preset |  | 0 | 0 | 11 | This interface offers methods to query and manipulate parameter preset sets. A preset is a bunch of property settings, together with meta data and ... |
| TagSetter |  | 0 | 0 | 10 | Element interface that allows setting of media metadata. Elements that support changing a stream's metadata will implement this interface. Examples... |
| TocSetter |  | 0 | 0 | 3 | Element interface that allows setting of the TOC. Elements that support some kind of chapters or editions (or tracks like in the FLAC cue sheet) wi... |
| URIHandler |  | 0 | 0 | 4 | The #GstURIHandler is an interface that is implemented by Source and Sink #GstElement to unify handling of URI. An application can use the followin... |

### Gst.ChildProxy

GType: `GstChildProxy` ?? C type: `GstChildProxy`

This interface abstracts handling of property sets for elements with children. Imagine elements such as mixers or polyphonic generators. They all h...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| child_added | `ChildProxy.child_added(child: GObject.Object, name: utf8) -> none` | gst_child_proxy_child_added |  | Emits the #GstChildProxy::child-added signal. |
| child_removed | `ChildProxy.child_removed(child: GObject.Object, name: utf8) -> none` | gst_child_proxy_child_removed |  | Emits the #GstChildProxy::child-removed signal. |
| get | `ChildProxy.get(first_property_name: utf8, ...: void) -> none` | gst_child_proxy_get |  | Gets properties of the parent object and its children. |
| get_child_by_index | `ChildProxy.get_child_by_index(index: guint) -> GObject.Object` | gst_child_proxy_get_child_by_index |  | Fetches a child by its number. |
| get_child_by_name | `ChildProxy.get_child_by_name(name: utf8) -> GObject.Object` | gst_child_proxy_get_child_by_name |  | Looks up a child element by the given name. This virtual method has a default implementation that uses #GstObject together with gst_object_get_name... |
| get_child_by_name_recurse | `ChildProxy.get_child_by_name_recurse(name: utf8) -> GObject.Object` | gst_child_proxy_get_child_by_name_recurse | 1.22 | Looks up a child element by the given full-path name. Similar to gst_child_proxy_get_child_by_name(), this method searches and returns a child give... |
| get_children_count | `ChildProxy.get_children_count() -> guint` | gst_child_proxy_get_children_count |  | Gets the number of child objects this parent contains. |
| get_property | `ChildProxy.get_property(name: utf8, value: out GObject.Value) -> none` | gst_child_proxy_get_property |  | Gets a single property using the GstChildProxy mechanism. You are responsible for freeing it by calling g_value_unset() |
| get_valist | `ChildProxy.get_valist(first_property_name: utf8, var_args: va_list) -> none` | gst_child_proxy_get_valist |  | Gets properties of the parent object and its children. |
| lookup | `ChildProxy.lookup(name: utf8, target: out GObject.Object?, pspec: out GObject.ParamSpec?) -> gboolean` | gst_child_proxy_lookup |  | Looks up which object and #GParamSpec would be effected by the given @name. |
| set | `ChildProxy.set(first_property_name: utf8, ...: void) -> none` | gst_child_proxy_set |  | Sets properties of the parent object and its children. |
| set_property | `ChildProxy.set_property(name: utf8, value: GObject.Value) -> none` | gst_child_proxy_set_property |  | Sets a single property using the GstChildProxy mechanism. |
| set_valist | `ChildProxy.set_valist(first_property_name: utf8, var_args: va_list) -> none` | gst_child_proxy_set_valist |  | Sets properties of the parent object and its children. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| child-added | `object: GObject.Object, name: utf8` | none | first |  | Will be emitted after the @object was added to the @child_proxy. |
| child-removed | `object: GObject.Object, name: utf8` | none | first |  | Will be emitted after the @object was removed from the @child_proxy. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| child_added | `child_added(child: GObject.Object, name: utf8) -> none` |  |  | Emits the #GstChildProxy::child-added signal. |
| child_removed | `child_removed(child: GObject.Object, name: utf8) -> none` |  |  | Emits the #GstChildProxy::child-removed signal. |
| get_child_by_index | `get_child_by_index(index: guint) -> GObject.Object` |  |  | Fetches a child by its number. |
| get_child_by_name | `get_child_by_name(name: utf8) -> GObject.Object` |  |  | Looks up a child element by the given name. This virtual method has a default implementation that uses #GstObject together with gst_object_get_name... |
| get_children_count | `get_children_count() -> guint` |  |  | Gets the number of child objects this parent contains. |

### Gst.Preset

GType: `GstPreset` ?? C type: `GstPreset`

This interface offers methods to query and manipulate parameter preset sets. A preset is a bunch of property settings, together with meta data and ...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_app_dir | `get_app_dir() -> filename` | gst_preset_get_app_dir |  | Gets the directory for application specific presets if set by the application. |
| set_app_dir | `set_app_dir(app_dir: filename) -> gboolean` | gst_preset_set_app_dir |  | Sets an extra directory as an absolute path that should be considered when looking for presets. Any presets in the application dir will shadow the ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| delete_preset | `Preset.delete_preset(name: utf8) -> gboolean` | gst_preset_delete_preset |  | Delete the given preset. |
| get_meta | `Preset.get_meta(name: utf8, tag: utf8, value: out utf8) -> gboolean` | gst_preset_get_meta |  | Gets the @value for an existing meta data @tag. Meta data @tag names can be something like e.g. "comment". Returned values need to be released when... |
| get_preset_names | `Preset.get_preset_names() -> utf8` | gst_preset_get_preset_names |  | Get a copy of preset names as a %NULL terminated string array. |
| get_property_names | `Preset.get_property_names() -> utf8` | gst_preset_get_property_names |  | Get a the names of the GObject properties that can be used for presets. |
| is_editable | `Preset.is_editable() -> gboolean` | gst_preset_is_editable | 1.6 | Check if one can add new presets, change existing ones and remove presets. |
| load_preset | `Preset.load_preset(name: utf8) -> gboolean` | gst_preset_load_preset |  | Load the given preset. |
| rename_preset | `Preset.rename_preset(old_name: utf8, new_name: utf8) -> gboolean` | gst_preset_rename_preset |  | Renames a preset. If there is already a preset by the @new_name it will be overwritten. |
| save_preset | `Preset.save_preset(name: utf8) -> gboolean` | gst_preset_save_preset |  | Save the current object settings as a preset under the given name. If there is already a preset by this @name it will be overwritten. |
| set_meta | `Preset.set_meta(name: utf8, tag: utf8, value: utf8?) -> gboolean` | gst_preset_set_meta |  | Sets a new @value for an existing meta data item or adds a new item. Meta data @tag names can be something like e.g. "comment". Supplying %NULL for... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| delete_preset | `delete_preset(name: utf8) -> gboolean` |  |  | Delete the given preset. |
| get_meta | `get_meta(name: utf8, tag: utf8, value: out utf8) -> gboolean` |  |  | Gets the @value for an existing meta data @tag. Meta data @tag names can be something like e.g. "comment". Returned values need to be released when... |
| get_preset_names | `get_preset_names() -> utf8` |  |  | Get a copy of preset names as a %NULL terminated string array. |
| get_property_names | `get_property_names() -> utf8` |  |  | Get a the names of the GObject properties that can be used for presets. |
| load_preset | `load_preset(name: utf8) -> gboolean` |  |  | Load the given preset. |
| rename_preset | `rename_preset(old_name: utf8, new_name: utf8) -> gboolean` |  |  | Renames a preset. If there is already a preset by the @new_name it will be overwritten. |
| save_preset | `save_preset(name: utf8) -> gboolean` |  |  | Save the current object settings as a preset under the given name. If there is already a preset by this @name it will be overwritten. |
| set_meta | `set_meta(name: utf8, tag: utf8, value: utf8?) -> gboolean` |  |  | Sets a new @value for an existing meta data item or adds a new item. Meta data @tag names can be something like e.g. "comment". Supplying %NULL for... |

### Gst.TagSetter

GType: `GstTagSetter` ?? C type: `GstTagSetter`

Element interface that allows setting of media metadata. Elements that support changing a stream's metadata will implement this interface. Examples...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_tag_valist | `TagSetter.add_tag_valist(mode: TagMergeMode, tag: utf8, var_args: va_list) -> none` | gst_tag_setter_add_tag_valist |  | Adds the given tag / value pairs on the setter using the given merge mode. The list must be terminated with %NULL. |
| add_tag_valist_values | `TagSetter.add_tag_valist_values(mode: TagMergeMode, tag: utf8, var_args: va_list) -> none` | gst_tag_setter_add_tag_valist_values |  | Adds the given tag / GValue pairs on the setter using the given merge mode. The list must be terminated with %NULL. |
| add_tag_value | `TagSetter.add_tag_value(mode: TagMergeMode, tag: utf8, value: GObject.Value) -> none` | gst_tag_setter_add_tag_value |  | Adds the given tag / GValue pair on the setter using the given merge mode. |
| add_tag_values | `TagSetter.add_tag_values(mode: TagMergeMode, tag: utf8, ...: void) -> none` | gst_tag_setter_add_tag_values |  | Adds the given tag / GValue pairs on the setter using the given merge mode. The list must be terminated with %NULL. |
| add_tags | `TagSetter.add_tags(mode: TagMergeMode, tag: utf8, ...: void) -> none` | gst_tag_setter_add_tags |  | Adds the given tag / value pairs on the setter using the given merge mode. The list must be terminated with %NULL. |
| get_tag_list | `TagSetter.get_tag_list() -> TagList` | gst_tag_setter_get_tag_list |  | Returns the current list of tags the setter uses. The list should not be modified or freed. This function is not thread-safe. |
| get_tag_merge_mode | `TagSetter.get_tag_merge_mode() -> TagMergeMode` | gst_tag_setter_get_tag_merge_mode |  | Queries the mode by which tags inside the setter are overwritten by tags from events |
| merge_tags | `TagSetter.merge_tags(list: TagList, mode: TagMergeMode) -> none` | gst_tag_setter_merge_tags |  | Merges the given list into the setter's list using the given mode. |
| reset_tags | `TagSetter.reset_tags() -> none` | gst_tag_setter_reset_tags |  | Reset the internal taglist. Elements should call this from within the state-change handler. |
| set_tag_merge_mode | `TagSetter.set_tag_merge_mode(mode: TagMergeMode) -> none` | gst_tag_setter_set_tag_merge_mode |  | Sets the given merge mode that is used for adding tags from events to tags specified by this interface. The default is #GST_TAG_MERGE_KEEP, which k... |

### Gst.TocSetter

GType: `GstTocSetter` ?? C type: `GstTocSetter`

Element interface that allows setting of the TOC. Elements that support some kind of chapters or editions (or tracks like in the FLAC cue sheet) wi...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_toc | `TocSetter.get_toc() -> Toc` | gst_toc_setter_get_toc |  | Return current TOC the setter uses. The TOC should not be modified without making it writable first. |
| reset | `TocSetter.reset() -> none` | gst_toc_setter_reset |  | Reset the internal TOC. Elements should call this from within the state-change handler. |
| set_toc | `TocSetter.set_toc(toc: Toc?) -> none` | gst_toc_setter_set_toc |  | Set the given TOC on the setter. Previously set TOC will be unreffed before setting a new one. |

### Gst.URIHandler

GType: `GstURIHandler` ?? C type: `GstURIHandler`

The #GstURIHandler is an interface that is implemented by Source and Sink #GstElement to unify handling of URI. An application can use the followin...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_protocols | `URIHandler.get_protocols() -> utf8` | gst_uri_handler_get_protocols |  | Gets the list of protocols supported by @handler. This list may not be modified. |
| get_uri | `URIHandler.get_uri() -> utf8` | gst_uri_handler_get_uri |  | Gets the currently handled URI. |
| get_uri_type | `URIHandler.get_uri_type() -> URIType` | gst_uri_handler_get_uri_type |  | Gets the type of the given URI handler |
| set_uri | `URIHandler.set_uri(uri: utf8) -> gboolean throws` | gst_uri_handler_set_uri |  | Tries to set the URI of the given handler. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_uri | `get_uri() -> utf8` |  |  | Gets the currently handled URI. |
| set_uri | `set_uri(uri: utf8) -> gboolean throws` |  |  | Tries to set the URI of the given handler. |

## Enums

### Gst.BufferingMode

GType: `GstBufferingMode` ?? C type: `GstBufferingMode`

The different types of buffering methods.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| download | 1 | download | the stream is being downloaded |
| live | 3 | live | the stream is a live stream |
| stream | 0 | stream | a small amount of data is buffered |
| timeshift | 2 | timeshift | the stream is being downloaded in a ringbuffer |

### Gst.BusSyncReply

GType: `GstBusSyncReply` ?? C type: `GstBusSyncReply`

The result values for a GstBusSyncHandler.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| async | 2 | async | pass message to async queue, continue if message is handled |
| drop | 0 | drop | drop the message |
| pass | 1 | pass | pass the message to the async queue |

### Gst.CapsIntersectMode

GType: `GstCapsIntersectMode` ?? C type: `GstCapsIntersectMode`

Modes of caps intersection %GST_CAPS_INTERSECT_ZIG_ZAG tries to preserve overall order of both caps by iterating on the caps' structures as the fol...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| first | 1 | first | Keeps the first caps order. |
| zig_zag | 0 | zig-zag | Zig-zags over both caps. |

### Gst.ClockEntryType

GType: `GstClockEntryType` ?? C type: `GstClockEntryType`

The type of the clock entry

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| periodic | 1 | periodic | a periodic timeout request |
| single | 0 | single | a single shot timeout |

### Gst.ClockReturn

GType: `GstClockReturn` ?? C type: `GstClockReturn`

The return value of a clock operation.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| badtime | 4 | badtime | A bad time was provided to a function. |
| busy | 3 | busy | The ClockID is busy |
| done | 7 | done | The ClockID is done waiting |
| early | 1 | early | The operation was scheduled too late. |
| error | 5 | error | An error occurred |
| ok | 0 | ok | The operation succeeded. |
| unscheduled | 2 | unscheduled | The clockID was unscheduled |
| unsupported | 6 | unsupported | Operation is not supported |

### Gst.ClockType

GType: `GstClockType` ?? C type: `GstClockType`

The different kind of clocks.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| monotonic | 1 | monotonic | monotonic time since some unspecified starting point |
| other | 2 | other | some other time source is used (Since: 1.0.5) |
| realtime | 0 | realtime | time since Epoch |
| tai | 3 | tai | time since Epoch, but using International Atomic Time as reference (Since: 1.18) |

### Gst.CoreError

GType: `GstCoreError` ?? C type: `GstCoreError`

Core errors are errors inside the core GStreamer library.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| caps | 10 | caps | used for caps-related errors. |
| clock | 13 | clock | used for clock related errors. |
| disabled | 14 | disabled | used if functionality has been disabled at compile time. |
| event | 8 | event | used for event-related errors. |
| failed | 1 | failed | a general error which doesn't fit in any other category. Make sure you add a custom message to the error call. |
| missing_plugin | 12 | missing-plugin | used if a plugin is missing. |
| negotiation | 7 | negotiation | used for negotiation-related errors. |
| not_implemented | 3 | not-implemented | use this when you do not want to implement this functionality yet. |
| num_errors | 15 | num-errors | the number of core error types. |
| pad | 5 | pad | used for pad-related errors. |
| seek | 9 | seek | used for seek-related errors. |
| state_change | 4 | state-change | used for state change errors. |
| tag | 11 | tag | used for negotiation-related errors. |
| thread | 6 | thread | used for thread-related errors. |
| too_lazy | 2 | too-lazy | do not use this except as a placeholder for deciding where to go while developing code. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | gst_core_error_quark |  |  |

### Gst.DebugColorMode

GType: `GstDebugColorMode` ?? C type: `GstDebugColorMode`

Do not use colors in logs.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| off | 0 | off | Do not use colors in logs. |
| on | 1 | on | Paint logs in a platform-specific way. |
| unix | 2 | unix | Paint logs with UNIX terminal color codes no matter what platform GStreamer is running on. |

### Gst.DebugLevel

GType: `GstDebugLevel` ?? C type: `GstDebugLevel`

The level defines the importance of a debugging message. The more important a message is, the greater the probability that the debugging system out...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| count | 10 | count | The number of defined debugging levels. |
| debug | 5 | debug | Debugging messages should be used when something common happens that is not the expected default behavior, or something that's useful to know but d... |
| error | 1 | error | Error messages are to be used only when an error occurred that stops the application from keeping working correctly. An examples is gst_element_err... |
| fixme | 3 | fixme | Fixme messages are messages that indicate that something in the executed code path is not fully implemented or handled yet. Note that this does not... |
| info | 4 | info | Informational messages should be used to keep the developer updated about what is happening. Examples where this should be used are when a typefind... |
| log | 6 | log | Log messages are messages that are very common but might be useful to know. As a rule of thumb a pipeline that is running as expected should never ... |
| memdump | 9 | memdump | memory dump messages are used to log (small) chunks of data as memory dumps in the log. They will be displayed as hexdump with ASCII characters. |
| none | 0 | none | No debugging level specified or desired. Used to deactivate debugging output. |
| trace | 7 | trace | Tracing-related messages. Examples for this are referencing/dereferencing of objects. |
| warning | 2 | warning | Warning messages are to inform about abnormal behaviour that could lead to problems or weird behaviour later on. An example of this would be clocki... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_name | `get_name(level: DebugLevel) -> utf8` | gst_debug_level_get_name |  | Get the string representation of a debugging level |

### Gst.EventType

GType: `GstEventType` ?? C type: `GstEventType`

#GstEventType lists the standard event types that can be sent in a pipeline. The custom event types can be used for private messages between elemen...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| buffersize | 23054 | buffersize | Notification of buffering requirements. Currently not used yet. |
| caps | 12814 | caps | #GstCaps event. Notify the pad of a new media type. |
| custom_both | 79367 | custom-both | Custom upstream or downstream event. In-band when travelling downstream. |
| custom_both_oob | 81923 | custom-both-oob | Custom upstream or downstream out-of-band event. |
| custom_downstream | 71686 | custom-downstream | Downstream custom event that travels in the data flow. |
| custom_downstream_oob | 74242 | custom-downstream-oob | Custom out-of-band downstream event. |
| custom_downstream_sticky | 76830 | custom-downstream-sticky | Custom sticky downstream event. |
| custom_upstream | 69121 | custom-upstream | Upstream custom event |
| eos | 28174 | eos | End-Of-Stream. No more data is to be expected to follow without either a STREAM_START event, or a FLUSH_STOP and a SEGMENT event. |
| flush_start | 2563 | flush-start | Start a flush operation. This event clears all data from the pipeline and unblock all streaming threads. |
| flush_stop | 5127 | flush-stop | Stop a flush operation. This event resets the running-time of the pipeline. |
| gap | 40966 | gap | Marks a gap in the datastream. |
| instant_rate_change | 46090 | instant-rate-change | Notify downstream that a playback rate override should be applied as soon as possible. (Since: 1.18) |
| instant_rate_sync_time | 66817 | instant-rate-sync-time | Sent by the pipeline to notify elements that handle the instant-rate-change event about the running-time when the rate multiplier should be applied... |
| latency | 56321 | latency | Notification of new latency adjustment. Sinks will use the latency information to adjust their synchronisation. |
| navigation | 53761 | navigation | Navigation events are usually used for communicating user requests, such as mouse or keyboard movements, to upstream elements. |
| protection | 33310 | protection | An event which indicates that new or updated encryption information has been found in the stream. |
| qos | 48641 | qos | A quality message. Used to indicate to upstream elements that the downstream elements should adjust their processing rate. |
| reconfigure | 61441 | reconfigure | A request for upstream renegotiating caps and reconfiguring. |
| seek | 51201 | seek | A request for a new playback position and rate. |
| segment | 17934 | segment | A new media segment follows in the dataflow. The segment events contains information for clipping buffers and converting buffer timestamps to runni... |
| segment_done | 38406 | segment-done | Marks the end of a segment playback. |
| select_streams | 66561 | select-streams | A request to select one or more streams (Since: 1.10) |
| sink_message | 25630 | sink-message | An event that sinks turn into a message. Used to send messages that should be emitted in sync with rendering. |
| step | 58881 | step | A request for stepping through the media. Sinks will usually execute the step operation. |
| stream_collection | 19230 | stream-collection | A new #GstStreamCollection is available (Since: 1.10) |
| stream_group_done | 26894 | stream-group-done | Indicates that there is no more data for the stream group ID in the message. Sent before EOS in some instances and should be handled mostly the sam... |
| stream_start | 10254 | stream-start | Event to mark the start of a new stream. Sent before any other serialized event and only sent at the start of a new stream, not after flushing seeks. |
| tag | 20510 | tag | A new set of metadata tags has been found in the stream. |
| toc | 30750 | toc | An event which indicates that a new table of contents (TOC) was found or updated. |
| toc_select | 64001 | toc-select | A request for a new playback position based on TOC entry's UID. |
| unknown | 0 | unknown | unknown event. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_flags | `get_flags(type: EventType) -> EventTypeFlags` | gst_event_type_get_flags |  | Gets the #GstEventTypeFlags associated with @type. |
| get_name | `get_name(type: EventType) -> utf8` | gst_event_type_get_name |  | Get a printable name for the given event type. Do not modify or free. |
| to_quark | `to_quark(type: EventType) -> GLib.Quark` | gst_event_type_to_quark |  | Get the unique quark for the given event type. |
| to_sticky_ordering | `to_sticky_ordering(type: EventType) -> guint` | gst_event_type_to_sticky_ordering | 1.22 | Converts the #GstEventType to an unsigned integer that represents the ordering of sticky events when re-sending them. A lower value represents a hi... |

### Gst.FlowReturn

GType: `GstFlowReturn` ?? C type: `GstFlowReturn`

The result of passing data to a pad. Note that the custom return values should not be exposed outside of the element scope.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| custom_error | -100 | custom-error | Elements can use values starting from this (and lower) to define custom error codes. |
| custom_error_1 | -101 | custom-error-1 | Pre-defined custom error code (define your custom error code to this to avoid compiler warnings). |
| custom_error_2 | -102 | custom-error-2 | Pre-defined custom error code. |
| custom_success | 100 | custom-success | Elements can use values starting from this (and higher) to define custom success codes. |
| custom_success_1 | 101 | custom-success-1 | Pre-defined custom success code (define your custom success code to this to avoid compiler warnings). |
| custom_success_2 | 102 | custom-success-2 | Pre-defined custom success code. |
| eos | -3 | eos | Pad is EOS. |
| error | -5 | error | Some (fatal) error occurred. Element generating this error should post an error message using GST_ELEMENT_ERROR() with more details. |
| flushing | -2 | flushing | Pad is flushing. |
| not_linked | -1 | not-linked | Pad is not linked. |
| not_negotiated | -4 | not-negotiated | Pad is not negotiated. |
| not_supported | -6 | not-supported | This operation is not supported. |
| ok | 0 | ok | Data passing was ok. |

### Gst.Format

GType: `GstFormat` ?? C type: `GstFormat`

Standard predefined formats

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| buffers | 4 | buffers | buffers (few, if any, elements implement this as of May 2009) |
| bytes | 2 | bytes | bytes |
| default | 1 | default | the default format of the pad/element. This can be samples for raw audio, frames/fields for raw video (some, but not all, elements support this; us... |
| percent | 5 | percent | percentage of stream (few, if any, elements implement this as of May 2009) |
| time | 3 | time | time in nanoseconds |
| undefined | 0 | undefined | undefined format |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_by_nick | `get_by_nick(nick: utf8) -> Format` | gst_format_get_by_nick |  | Return the format registered with the given nick. |
| get_details | `get_details(format: Format) -> FormatDefinition` | gst_format_get_details |  | Get details about the given format. |
| get_name | `get_name(format: Format) -> utf8` | gst_format_get_name |  | Get a printable name for the given format. Do not modify or free. |
| iterate_definitions | `iterate_definitions() -> Iterator` | gst_format_iterate_definitions |  | Iterate all the registered formats. The format definition is read only. |
| register | `register(nick: utf8, description: utf8) -> Format` | gst_format_register |  | Create a new GstFormat based on the nick or return an already registered format with that nick. |
| to_quark | `to_quark(format: Format) -> GLib.Quark` | gst_format_to_quark |  | Get the unique quark for the given format. |

### Gst.IteratorItem

GType: `GstIteratorItem` ?? C type: `GstIteratorItem`

The result of a #GstIteratorItemFunction.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| end | 2 | end | Stop after this item. |
| pass | 1 | pass | Return item |
| skip | 0 | skip | Skip this item |

### Gst.IteratorResult

GType: `GstIteratorResult` ?? C type: `GstIteratorResult`

The result of gst_iterator_next().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| done | 0 | done | No more items in the iterator |
| error | 3 | error | An error happened |
| ok | 1 | ok | An item was retrieved |
| resync | 2 | resync | Datastructure changed while iterating |

### Gst.LibraryError

GType: `GstLibraryError` ?? C type: `GstLibraryError`

Library errors are for errors from the library being used by elements (initializing, finalizing, settings, ...)

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| encode | 6 | encode | used when the library generated an encoding error. |
| failed | 1 | failed | a general error which doesn't fit in any other category. Make sure you add a custom message to the error call. |
| init | 3 | init | used when the library could not be opened. |
| num_errors | 7 | num-errors | the number of library error types. |
| settings | 5 | settings | used when the library doesn't accept settings. |
| shutdown | 4 | shutdown | used when the library could not be closed. |
| too_lazy | 2 | too-lazy | do not use this except as a placeholder for deciding where to go while developing code. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | gst_library_error_quark |  |  |

### Gst.PadDirection

GType: `GstPadDirection` ?? C type: `GstPadDirection`

The direction of a pad.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| sink | 2 | sink | the pad is a sink pad. |
| src | 1 | src | the pad is a source pad. |
| unknown | 0 | unknown | direction is unknown. |

### Gst.PadLinkReturn

GType: `GstPadLinkReturn` ?? C type: `GstPadLinkReturn`

Result values from gst_pad_link and friends.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| noformat | -4 | noformat | pads do not have common format |
| nosched | -5 | nosched | pads cannot cooperate in scheduling |
| ok | 0 | ok | link succeeded |
| refused | -6 | refused | refused for some reason |
| was_linked | -2 | was-linked | pad was already linked |
| wrong_direction | -3 | wrong-direction | pads have wrong direction |
| wrong_hierarchy | -1 | wrong-hierarchy | pads have no common grandparent |

### Gst.PadMode

GType: `GstPadMode` ?? C type: `GstPadMode`

The status of a GstPad. After activating a pad, which usually happens when the parent element goes from READY to PAUSED, the GstPadMode defines if ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | Pad will not handle dataflow |
| pull | 2 | pull | Pad handles dataflow in upstream pull mode |
| push | 1 | push | Pad handles dataflow in downstream push mode |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_name | `get_name(mode: PadMode) -> utf8` | gst_pad_mode_get_name |  | Return the name of a pad mode, for use in debug messages mostly. |

### Gst.PadPresence

GType: `GstPadPresence` ?? C type: `GstPadPresence`

Indicates when this pad will become available.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| always | 0 | always | the pad is always available |
| request | 2 | request | the pad is only available on request with gst_element_request_pad(). |
| sometimes | 1 | sometimes | the pad will become available depending on the media stream |

### Gst.PadProbeReturn

GType: `GstPadProbeReturn` ?? C type: `GstPadProbeReturn`

Different return values for the #GstPadProbeCallback.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| drop | 0 | drop | drop data in data probes. For push mode this means that the data item is not sent downstream. For pull mode, it means that the data item is not pas... |
| handled | 4 | handled | Data has been handled in the probe and will not be forwarded further. For events and buffers this is the same behaviour as %GST_PAD_PROBE_DROP (exc... |
| ok | 1 | ok | normal probe return value. This leaves the probe in place, and defers decisions about dropping or passing data to other probes, if any. If there ar... |
| pass | 3 | pass | pass the data item in the block probe and block on the next item. Note, that if there are multiple pad probes installed and any probe returns PASS,... |
| remove | 2 | remove | remove this probe, passing the data. For blocking probes this will cause data flow to unblock, unless there are also other blocking probes installed. |

### Gst.ParseError

GType: `GstParseError` ?? C type: `GstParseError`

The different parsing errors that can occur.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| could_not_set_property | 4 | could-not-set-property | There was an error setting a property |
| delayed_link | 7 | delayed-link | A delayed link did not get resolved. |
| empty | 6 | empty | An empty description was specified |
| empty_bin | 5 | empty-bin | An empty bin was specified. |
| link | 3 | link | There was an error linking two pads. |
| no_such_element | 1 | no-such-element | The description contained an unknown element |
| no_such_property | 2 | no-such-property | An element did not have a specified property |
| syntax | 0 | syntax | A syntax error occurred. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | gst_parse_error_quark |  | Get the error quark used by the parsing subsystem. |

### Gst.PluginError

GType: `GstPluginError` ?? C type: `GstPluginError`

The plugin loading errors

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| dependencies | 1 | dependencies | The plugin has unresolved dependencies |
| module | 0 | module | The plugin could not be loaded |
| name_mismatch | 2 | name-mismatch | The plugin has already be loaded from a different file |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | gst_plugin_error_quark |  | Get the error quark. |

### Gst.ProgressType

GType: `GstProgressType` ?? C type: `GstProgressType`

The type of a %GST_MESSAGE_PROGRESS. The progress messages inform the application of the status of asynchronous tasks.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| canceled | 3 | canceled | A task was canceled. |
| complete | 2 | complete | A task completed. |
| continue | 1 | continue | A task completed and a new one continues. |
| error | 4 | error | A task caused an error. An error message is also posted on the bus. |
| start | 0 | start | A new task started. |

### Gst.PromiseResult

GType: `GstPromiseResult` ?? C type: `GstPromiseResult`

The result of a #GstPromise

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| expired | 3 | expired | The promise expired (the carrying object lost all refs) and the promise will never be fulfilled. |
| interrupted | 1 | interrupted | Interrupted by the consumer as it doesn't want the value anymore. |
| pending | 0 | pending | Initial state. Waiting for transition to any other state. |
| replied | 2 | replied | A producer marked a reply |

### Gst.QOSType

GType: `GstQOSType` ?? C type: `GstQOSType`

The different types of QoS events that can be given to the gst_event_new_qos() method.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| overflow | 0 | overflow | The QoS event type that is produced when upstream elements are producing data too quickly and the element can't keep up processing the data. Upstre... |
| throttle | 2 | throttle | The QoS event type that is produced when the application enabled throttling to limit the data rate. |
| underflow | 1 | underflow | The QoS event type that is produced when upstream elements are producing data too slowly and need to speed up their production rate. |

### Gst.QueryType

GType: `GstQueryType` ?? C type: `GstQueryType`

Standard predefined Query types

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| accept_caps | 40963 | accept-caps | the accept caps query |
| allocation | 35846 | allocation | the buffer allocation properties |
| bitrate | 51202 | bitrate | the bitrate query (since 1.16) |
| buffering | 28163 | buffering | query available media for efficient seeking. |
| caps | 43523 | caps | the caps query |
| context | 48643 | context | query the pipeline-local context from downstream or upstream (since 1.2) |
| convert | 20483 | convert | convert values between formats |
| custom | 30723 | custom | a custom application or element defined query. |
| drain | 46086 | drain | wait till all serialized data is consumed downstream |
| duration | 5123 | duration | total duration of the stream |
| formats | 23043 | formats | query supported formats for convert |
| jitter | 10243 | jitter | current jitter of stream |
| latency | 7683 | latency | latency of stream |
| position | 2563 | position | current position in stream |
| rate | 12803 | rate | current rate of the stream |
| scheduling | 38401 | scheduling | the scheduling properties |
| seeking | 15363 | seeking | seeking capabilities |
| segment | 17923 | segment | segment start/stop positions |
| selectable | 53763 | selectable | Query stream selection capability. |
| unknown | 0 | unknown | unknown query type |
| uri | 33283 | uri | query the URI of the source or sink. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_flags | `get_flags(type: QueryType) -> QueryTypeFlags` | gst_query_type_get_flags |  | Gets the #GstQueryTypeFlags associated with @type. |
| get_name | `get_name(type: QueryType) -> utf8` | gst_query_type_get_name |  | Get a printable name for the given query type. Do not modify or free. |
| to_quark | `to_quark(type: QueryType) -> GLib.Quark` | gst_query_type_to_quark |  | Get the unique quark for the given query type. |

### Gst.Rank

GType: `GstRank` ?? C type: `GstRank`

Element priority ranks. Defines the order in which the autoplugger (or similar rank-picking mechanisms, such as e.g. gst_element_make_from_uri()) w...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| marginal | 64 | marginal | unlikely to be chosen |
| none | 0 | none | will be chosen last or not at all |
| primary | 256 | primary | will be chosen first |
| secondary | 128 | secondary | likely to be chosen |

### Gst.ResourceError

GType: `GstResourceError` ?? C type: `GstResourceError`

Resource errors are for any resource used by an element: memory, files, network connections, process space, ... They're typically used by source an...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| busy | 4 | busy | used when resource is busy. |
| close | 8 | close | used when the resource can't be closed. |
| failed | 1 | failed | a general error which doesn't fit in any other category. Make sure you add a custom message to the error call. |
| no_space_left | 14 | no-space-left | used when the resource has no space left. |
| not_authorized | 15 | not-authorized | used when the resource can't be opened due to missing authorization. (Since: 1.2.4) |
| not_found | 3 | not-found | used when the resource could not be found. |
| num_errors | 16 | num-errors | the number of resource error types. |
| open_read | 5 | open-read | used when resource fails to open for reading. |
| open_read_write | 7 | open-read-write | used when resource cannot be opened for both reading and writing, or either (but unspecified which). |
| open_write | 6 | open-write | used when resource fails to open for writing. |
| read | 9 | read | used when the resource can't be read from. |
| seek | 11 | seek | used when a seek on the resource fails. |
| settings | 13 | settings | used when settings can't be manipulated on. |
| sync | 12 | sync | used when a synchronize on the resource fails. |
| too_lazy | 2 | too-lazy | do not use this except as a placeholder for deciding where to go while developing code. |
| write | 10 | write | used when the resource can't be written to. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | gst_resource_error_quark |  |  |

### Gst.SearchMode

GType: `GstSearchMode` ?? C type: `GstSearchMode`

The different search modes.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| after | 2 | after | Search for an exact match or the element just after. |
| before | 1 | before | Search for an exact match or the element just before. |
| exact | 0 | exact | Only search for exact matches. |

### Gst.SeekType

GType: `GstSeekType` ?? C type: `GstSeekType`

The different types of seek events. When constructing a seek event with gst_event_new_seek() or when doing gst_segment_do_seek ().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| end | 2 | end | relative position to duration is requested |
| none | 0 | none | no change in position is required |
| set | 1 | set | absolute position is requested |

### Gst.State

GType: `GstState` ?? C type: `GstState`

The possible states an element can be in. States can be changed using gst_element_set_state() and checked using gst_element_get_state().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| null | 1 | null | the NULL state or initial state of an element. |
| paused | 3 | paused | the element is PAUSED, it is ready to accept and process data. Sink elements however only accept one buffer and then block. |
| playing | 4 | playing | the element is PLAYING, the #GstClock is running and the data is flowing. |
| ready | 2 | ready | the element is ready to go to PAUSED. |
| void_pending | 0 | void-pending | no pending state. |

### Gst.StateChange

GType: `GstStateChange` ?? C type: `GstStateChange`

These are the different state changes an element goes through. %GST_STATE_NULL &rArr; %GST_STATE_PLAYING is called an upwards state change and %GST...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| null_to_null | 9 | null-to-null | state change from NULL to NULL. (Since: 1.14) |
| null_to_ready | 10 | null-to-ready | state change from NULL to READY. * The element must check if the resources it needs are available. Device sinks and -sources typically try to probe... |
| paused_to_paused | 27 | paused-to-paused | state change from PAUSED to PAUSED. This might happen when elements were in PLAYING state and 'lost state', they should make sure to go back to rea... |
| paused_to_playing | 28 | paused-to-playing | state change from PAUSED to PLAYING. * Most elements ignore this state change. * The pipeline selects a #GstClock and distributes this to all the c... |
| paused_to_ready | 26 | paused-to-ready | state change from PAUSED to READY. * Sinks unblock any waits in the preroll. * Elements unblock any waits on devices * Chain or get_range functions... |
| playing_to_paused | 35 | playing-to-paused | state change from PLAYING to PAUSED. * Most elements ignore this state change. * The pipeline calculates the running_time based on the last selecte... |
| playing_to_playing | 36 | playing-to-playing | state change from PLAYING to PLAYING. (Since: 1.14) |
| ready_to_null | 17 | ready-to-null | state change from READY to NULL. * Elements close devices * Elements reset any internal state. |
| ready_to_paused | 19 | ready-to-paused | state change from READY to PAUSED. * The element pads are activated in order to receive data in PAUSED. Streaming threads are started. * Some eleme... |
| ready_to_ready | 18 | ready-to-ready | state change from READY to READY, This might happen when going to PAUSED asynchronously failed, in that case elements should make sure they are in ... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_name | `get_name(transition: StateChange) -> utf8` | gst_state_change_get_name | 1.14 | Gets a string representing the given state transition. |

### Gst.StateChangeReturn

GType: `GstStateChangeReturn` ?? C type: `GstStateChangeReturn`

The possible return values from a state change function such as gst_element_set_state(). Only @GST_STATE_CHANGE_FAILURE is a real failure.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| async | 2 | async | the state change will happen asynchronously |
| failure | 0 | failure | the state change failed |
| no_preroll | 3 | no-preroll | the state change succeeded but the element cannot produce data in %GST_STATE_PAUSED. This typically happens with live sources. |
| success | 1 | success | the state change succeeded |

### Gst.StreamError

GType: `GstStreamError` ?? C type: `GstStreamError`

Stream errors are for anything related to the stream being processed: format errors, media type errors, ... They're typically used by decoders, dem...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| codec_not_found | 6 | codec-not-found | used when there's no codec to handle the stream's type. |
| decode | 7 | decode | used when decoding fails. |
| decrypt | 12 | decrypt | used when the stream is encrypted and can't be decrypted because this is not supported by the element. |
| decrypt_nokey | 13 | decrypt-nokey | used when the stream is encrypted and can't be decrypted because no suitable key is available. |
| demux | 9 | demux | used when demuxing fails. |
| encode | 8 | encode | used when encoding fails. |
| failed | 1 | failed | a general error which doesn't fit in any other category. Make sure you add a custom message to the error call. |
| format | 11 | format | used when the stream is of the wrong format (for example, wrong caps). |
| mux | 10 | mux | used when muxing fails. |
| not_implemented | 3 | not-implemented | use this when you do not want to implement this functionality yet. |
| num_errors | 14 | num-errors | the number of stream error types. |
| too_lazy | 2 | too-lazy | do not use this except as a placeholder for deciding where to go while developing code. |
| type_not_found | 4 | type-not-found | used when the element doesn't know the stream's type. |
| wrong_type | 5 | wrong-type | used when the element doesn't handle this type of stream. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | gst_stream_error_quark |  |  |

### Gst.StreamStatusType

GType: `GstStreamStatusType` ?? C type: `GstStreamStatusType`

The type of a %GST_MESSAGE_STREAM_STATUS. The stream status messages inform the application of new streaming threads and their status.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| create | 0 | create | A new thread need to be created. |
| destroy | 3 | destroy | a thread is destroyed |
| enter | 1 | enter | a thread entered its loop function |
| leave | 2 | leave | a thread left its loop function |
| pause | 9 | pause | a thread is paused |
| start | 8 | start | a thread is started |
| stop | 10 | stop | a thread is stopped |

### Gst.StructureChangeType

GType: `GstStructureChangeType` ?? C type: `GstStructureChangeType`

The type of a %GST_MESSAGE_STRUCTURE_CHANGE.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| link | 0 | link | Pad linking is starting or done. |
| unlink | 1 | unlink | Pad unlinking is starting or done. |

### Gst.TagFlag

GType: `GstTagFlag` ?? C type: `GstTagFlag`

Extra tag flags used when registering tags.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| count | 4 | count | number of tag flags |
| decoded | 3 | decoded | tag is decoded |
| encoded | 2 | encoded | tag is encoded |
| meta | 1 | meta | tag is meta data |
| undefined | 0 | undefined | undefined flag |

### Gst.TagMergeMode

GType: `GstTagMergeMode` ?? C type: `GstTagMergeMode`

The different tag merging modes are basically replace, overwrite and append, but they can be seen from two directions. Given two taglists: (A) the ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| append | 3 | append | append tags |
| count | 7 | count | the number of merge modes |
| keep | 5 | keep | keep existing tags |
| keep_all | 6 | keep-all | keep all existing tags |
| prepend | 4 | prepend | prepend tags |
| replace | 2 | replace | replace tags |
| replace_all | 1 | replace-all | replace all tags (clear list and append) |
| undefined | 0 | undefined | undefined merge mode |

### Gst.TagScope

GType: `GstTagScope` ?? C type: `GstTagScope`

GstTagScope specifies if a taglist applies to the complete medium or only to one single stream.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| global | 1 | global | global tags for the complete medium |
| stream | 0 | stream | tags specific to this single stream |

### Gst.TaskState

GType: `GstTaskState` ?? C type: `GstTaskState`

The different states a task can be in

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| paused | 2 | paused | the task is paused |
| started | 0 | started | the task is started and running |
| stopped | 1 | stopped | the task is stopped |

### Gst.TocEntryType

GType: `GstTocEntryType` ?? C type: `GstTocEntryType`

The different types of TOC entries (see #GstTocEntry). There are two types of TOC entries: alternatives or parts in a sequence.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| angle | -3 | angle | entry is an angle (i.e. an alternative) |
| chapter | 3 | chapter | entry is a chapter (i.e. a part of a sequence) |
| edition | -1 | edition | entry is an edition (i.e. alternative) |
| invalid | 0 | invalid | invalid entry type value |
| title | 1 | title | entry is a title (i.e. a part of a sequence) |
| track | 2 | track | entry is a track (i.e. a part of a sequence) |
| version | -2 | version | entry is a version (i.e. alternative) |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_nick | `get_nick(type: TocEntryType) -> utf8` | gst_toc_entry_type_get_nick |  | Converts @type to a string representation. |

### Gst.TocLoopType

GType: `GstTocLoopType` ?? C type: `GstTocLoopType`

How a #GstTocEntry should be repeated. By default, entries are played a single time.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| forward | 1 | forward | repeat forward |
| none | 0 | none | single forward playback |
| ping_pong | 3 | ping-pong | repeat forward and backward |
| reverse | 2 | reverse | repeat backward |

### Gst.TocScope

GType: `GstTocScope` ?? C type: `GstTocScope`

The scope of a TOC.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| current | 2 | current | TOC for the currently active/selected stream (this is a TOC representing the current stream from start to EOS, and is what a TOC writer / muxer is ... |
| global | 1 | global | global TOC representing all selectable options (this is what applications are usually interested in) |

### Gst.TracerValueScope

GType: `GstTracerValueScope` ?? C type: `GstTracerValueScope`

Tracing record will contain fields that contain a measured value or extra meta-data. One such meta data are values that tell where a measurement wa...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| element | 2 | element | the value is related to an #GstElement |
| pad | 3 | pad | the value is related to a #GstPad |
| process | 0 | process | the value is related to the process |
| thread | 1 | thread | the value is related to a thread |

### Gst.TypeFindProbability

GType: `GstTypeFindProbability` ?? C type: `GstTypeFindProbability`

The probability of the typefind function. Higher values have more certainty in doing a reliable typefind.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| likely | 80 | likely | likely a type was detected. |
| maximum | 100 | maximum | very certain a type was detected. |
| minimum | 1 | minimum | unlikely typefind. |
| nearly_certain | 99 | nearly-certain | nearly certain that a type was detected. |
| none | 0 | none | type undetected. |
| possible | 50 | possible | possible type detected. |

### Gst.URIError

GType: `GstURIError` ?? C type: `GstURIError`

Different URI-related errors that can occur.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bad_reference | 3 | bad-reference | There was a problem with the entity that the URI references |
| bad_state | 2 | bad-state | Could not set or change the URI because the URI handler was in a state where that is not possible or not permitted |
| bad_uri | 1 | bad-uri | There was a problem with the URI |
| unsupported_protocol | 0 | unsupported-protocol | The protocol is not supported |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | gst_uri_error_quark |  |  |

### Gst.URIType

GType: `GstURIType` ?? C type: `GstURIType`

The different types of URI direction.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| sink | 1 | sink | The URI is a consumer. |
| src | 2 | src | The URI is a producer. |
| unknown | 0 | unknown | The URI direction is unknown |

## Flags

### Gst.AllocatorFlags

GType: `GstAllocatorFlags` ?? C type: `GstAllocatorFlags`

Flags for allocators.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| custom_alloc | 16 | custom-alloc | The allocator has a custom alloc function. Only elements designed to work with this allocator should be using it, other elements should ignore it f... |
| last | 1048576 | last | first flag that can be used for custom purposes |
| no_copy | 32 | no-copy | When copying a #GstMemory allocated with this allocator, the copy will instead be allocated using the default allocator. Use this when allocating a... |

### Gst.BinFlags

GType: `GstBinFlags` ?? C type: `GstBinFlags`

GstBinFlags are a set of flags specific to bins. Most are set/used internally. They can be checked using the GST_OBJECT_FLAG_IS_SET() macro, and (u...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| last | 524288 | last | The last enum in the series of flags for bins. Derived classes can use this as first value in a list of flags. |
| no_resync | 16384 | no-resync | Don't resync a state change when elements are added or linked in the bin |
| streams_aware | 32768 | streams-aware | Indicates whether the bin can handle elements that add/remove source pads at any point in time without first posting a no-more-pads signal. |

### Gst.BufferCopyFlags

GType: `GstBufferCopyFlags` ?? C type: `GstBufferCopyFlags`

A set of flags that can be provided to the gst_buffer_copy_into() function to specify which items should be copied.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| deep | 32 | deep | flag indicating that memory should always be copied instead of reffed |
| flags | 1 | flags | flag indicating that buffer flags should be copied |
| memory | 8 | memory | flag indicating that buffer memory should be reffed and appended to already existing memory. Unless the memory is marked as NO_SHARE, no actual cop... |
| merge | 16 | merge | flag indicating that buffer memory should be merged |
| meta | 4 | meta | flag indicating that buffer meta should be copied |
| none | 0 | none | copy nothing |
| timestamps | 2 | timestamps | flag indicating that buffer pts, dts, duration, offset and offset_end should be copied |

### Gst.BufferFlags

GType: `GstBufferFlags` ?? C type: `GstBufferFlags`

A set of buffer flags used to describe properties of a #GstBuffer.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| corrupted | 256 | corrupted | the buffer data is corrupted. |
| decode_only | 32 | decode-only | the buffer contains data that should be dropped because it will be clipped against the segment boundaries or because it does not contain data that ... |
| delta_unit | 8192 | delta-unit | this unit cannot be decoded independently. |
| discont | 64 | discont | the buffer marks a data discontinuity in the stream. This typically occurs after a seek or a dropped buffer from a live or network source. |
| droppable | 4096 | droppable | the buffer can be dropped without breaking the stream, for example to reduce bandwidth. |
| gap | 2048 | gap | the buffer has been created to fill a gap in the stream and contains media neutral data (elements can switch to optimized code path that ignores th... |
| header | 1024 | header | the buffer contains header information that is needed to decode the following data. |
| last | 1048576 | last | additional media specific flags can be added starting from this flag. |
| live | 16 | live | the buffer is live data and should be discarded in the PAUSED state. |
| marker | 512 | marker | the buffer contains a media specific marker. for video this is the end of a frame boundary, for audio this is the start of a talkspurt. for RTP pac... |
| non_droppable | 65536 | non-droppable | This buffer is important and should not be dropped. This can be used to mark important buffers, e.g. to flag RTP packets carrying keyframes or code... |
| resync | 128 | resync | the buffer timestamps might have a discontinuity and this buffer is a good point to resynchronize. |
| sync_after | 32768 | sync-after | Elements which write to disk or permanent storage should ensure the data is synced after writing the contents of this buffer. |
| tag_memory | 16384 | tag-memory | this flag is set when memory of the buffer is added/removed |

### Gst.BufferPoolAcquireFlags

GType: `GstBufferPoolAcquireFlags` ?? C type: `GstBufferPoolAcquireFlags`

Additional flags to control the allocation of a buffer

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| discont | 4 | discont | buffer is discont |
| dontwait | 2 | dontwait | when the bufferpool is empty, acquire_buffer will by default block until a buffer is released into the pool again. Setting this flag makes acquire_... |
| key_unit | 1 | key-unit | buffer is keyframe |
| last | 65536 | last | last flag, subclasses can use private flags starting from this value. |
| none | 0 | none | no flags |

### Gst.BusFlags

GType: `GstBusFlags` ?? C type: `GstBusFlags`

The standard flags that a bus may have.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| flag_last | 32 | flag-last | offset to define more flags |
| flushing | 16 | flushing | The bus is currently dropping all messages |

### Gst.CapsFlags

GType: `GstCapsFlags` ?? C type: `GstCapsFlags`

Extra flags for a caps.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| any | 16 | any | Caps has no specific content, but can contain anything. |

### Gst.ClockFlags

GType: `GstClockFlags` ?? C type: `GstClockFlags`

The capabilities of this clock

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| can_do_periodic_async | 128 | can-do-periodic-async | clock can do async periodic timeout callbacks |
| can_do_periodic_sync | 64 | can-do-periodic-sync | clock can do sync periodic timeout requests |
| can_do_single_async | 32 | can-do-single-async | clock can do a single async timeout request |
| can_do_single_sync | 16 | can-do-single-sync | clock can do a single sync timeout request |
| can_set_master | 512 | can-set-master | clock can be slaved to a master clock |
| can_set_resolution | 256 | can-set-resolution | clock's resolution can be changed |
| last | 4096 | last | subclasses can add additional flags starting from this flag |
| needs_startup_sync | 1024 | needs-startup-sync | clock needs to be synced before it can be used |

### Gst.DebugColorFlags

GType: `GstDebugColorFlags` ?? C type: `GstDebugColorFlags`

These are some terminal style flags you can use when creating your debugging categories to make them stand out in debugging output.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bg_black | 0 | bg-black | Use black as background color. |
| bg_blue | 64 | bg-blue | Use blue as background color. |
| bg_cyan | 96 | bg-cyan | Use cyan as background color. |
| bg_green | 32 | bg-green | Use green as background color. |
| bg_magenta | 80 | bg-magenta | Use magenta as background color. |
| bg_red | 16 | bg-red | Use red as background color. |
| bg_white | 112 | bg-white | Use white as background color. |
| bg_yellow | 48 | bg-yellow | Use yellow as background color. |
| bold | 256 | bold | Make the output bold. |
| fg_black | 0 | fg-black | Use black as foreground color. |
| fg_blue | 4 | fg-blue | Use blue as foreground color. |
| fg_cyan | 6 | fg-cyan | Use cyan as foreground color. |
| fg_green | 2 | fg-green | Use green as foreground color. |
| fg_magenta | 5 | fg-magenta | Use magenta as foreground color. |
| fg_red | 1 | fg-red | Use red as foreground color. |
| fg_white | 7 | fg-white | Use white as foreground color. |
| fg_yellow | 3 | fg-yellow | Use yellow as foreground color. |
| underline | 512 | underline | Underline the output. |

### Gst.DebugGraphDetails

GType: `GstDebugGraphDetails` ?? C type: `GstDebugGraphDetails`

Available details for pipeline graphs produced by GST_DEBUG_BIN_TO_DOT_FILE() and GST_DEBUG_BIN_TO_DOT_FILE_WITH_TS().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all | 15 | all | show all the typical details that one might want |
| caps_details | 2 | caps-details | show caps-details on edges |
| full_params | 16 | full-params | show full element parameter values even if they are very long |
| media_type | 1 | media-type | show caps-name on edges |
| non_default_params | 4 | non-default-params | show modified parameters on elements |
| states | 8 | states | show element states |
| verbose | 4294967295 | verbose | show all details regardless of how large or verbose they make the resulting output |

### Gst.ElementFlags

GType: `GstElementFlags` ?? C type: `GstElementFlags`

The standard flags that an element may have.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| indexable | 512 | indexable | the element can use an index |
| last | 16384 | last | offset to define more flags |
| locked_state | 16 | locked-state | ignore state changes from parent |
| provide_clock | 128 | provide-clock | the element can provide a clock |
| require_clock | 256 | require-clock | the element requires a clock |
| sink | 32 | sink | the element is a sink |
| source | 64 | source | the element is a source. |

### Gst.EventTypeFlags

GType: `GstEventTypeFlags` ?? C type: `GstEventTypeFlags`

#GstEventTypeFlags indicate the aspects of the different #GstEventType values. You can get the type flags of a #GstEventType with the gst_event_typ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| downstream | 2 | downstream | Set if the event can travel downstream. |
| serialized | 4 | serialized | Set if the event should be serialized with data flow. |
| sticky | 8 | sticky | Set if the event is sticky on the pads. |
| sticky_multi | 16 | sticky-multi | Multiple sticky events can be on a pad, each identified by the event name. |
| upstream | 1 | upstream | Set if the event can travel upstream. |

### Gst.GapFlags

GType: `GstGapFlags` ?? C type: `GstGapFlags`

The different flags that can be set on #GST_EVENT_GAP events. See gst_event_set_gap_flags() for details.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| data | 1 | data | The #GST_EVENT_GAP signals missing data, for example because of packet loss. |

### Gst.LockFlags

GType: `GstLockFlags` ?? C type: `GstLockFlags`

Flags used when locking miniobjects

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| exclusive | 4 | exclusive | lock for exclusive access |
| last | 256 | last | first flag that can be used for custom purposes |
| read | 1 | read | lock for read access |
| write | 2 | write | lock for write access |

### Gst.MapFlags

GType: `GstMapFlags` ?? C type: `GstMapFlags`

Flags used when mapping memory

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| flag_last | 65536 | flag-last | first flag that can be used for custom purposes |
| read | 1 | read | map for read access |
| write | 2 | write | map for write access |

### Gst.MemoryFlags

GType: `GstMemoryFlags` ?? C type: `GstMemoryFlags`

Flags for wrapped memory.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| last | 1048576 | last | first flag that can be used for custom purposes |
| no_share | 16 | no-share | memory must not be shared. Copies will have to be made when this memory needs to be shared between buffers. (DEPRECATED: do not use in new code, in... |
| not_mappable | 256 | not-mappable | the memory can't be mapped via gst_memory_map() without any preconditions. (Since: 1.2) |
| physically_contiguous | 128 | physically-contiguous | the memory is physically contiguous. (Since: 1.2) |
| readonly | 2 | readonly | memory is readonly. It is not allowed to map the memory with #GST_MAP_WRITE. |
| zero_padded | 64 | zero-padded | the memory padding is filled with 0 bytes |
| zero_prefixed | 32 | zero-prefixed | the memory prefix is filled with 0 bytes |

### Gst.MessageType

GType: `GstMessageType` ?? C type: `GstMessageType`

The different message types that are available.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| any | 4294967295 | any | mask for all of the above messages. |
| application | 16384 | application | message posted by the application, possibly via an application-specific element. |
| async_done | 2097152 | async-done | Posted by elements when they complete an ASYNC #GstStateChange. The application will only receive this message from the toplevel pipeline. |
| async_start | 1048576 | async-start | Posted by elements when they start an ASYNC #GstStateChange. This message is not forwarded to the application but is used internally. |
| buffering | 32 | buffering | the pipeline is buffering. When the application receives a buffering message in the PLAYING state for a non-live pipeline it must PAUSE the pipelin... |
| clock_lost | 1024 | clock-lost | The current clock as selected by the pipeline became unusable. The pipeline will select a new clock on the next PLAYING state change. The applicati... |
| clock_provide | 512 | clock-provide | an element notifies its capability of providing a clock. This message is used internally and never forwarded to the application. |
| device_added | 2147483649 | device-added | Message indicating a #GstDevice was added to a #GstDeviceProvider (Since: 1.4) |
| device_changed | 2147483655 | device-changed | Message indicating a #GstDevice was changed a #GstDeviceProvider (Since: 1.16) |
| device_removed | 2147483650 | device-removed | Message indicating a #GstDevice was removed from a #GstDeviceProvider (Since: 1.4) |
| duration_changed | 262144 | duration-changed | The duration of a pipeline changed. The application can get the new duration with a duration query. |
| element | 32768 | element | element-specific message, see the specific element's documentation |
| eos | 1 | eos | end-of-stream reached in a pipeline. The application will only receive this message in the PLAYING state and every time it sets a pipeline to PLAYI... |
| error | 2 | error | an error occurred. When the application receives an error message it should stop playback of the pipeline and not assume that more data will be pla... |
| extended | 2147483648 | extended | Message is an extended message type (see below). These extended message IDs can't be used directly with mask-based API like gst_bus_poll() or gst_b... |
| have_context | 1073741824 | have-context | Message indicating that an element created a context (Since: 1.2) |
| info | 8 | info | an info message occurred |
| instant_rate_request | 2147483656 | instant-rate-request | Message sent by elements to request the running time from the pipeline when an instant rate change should be applied (which may be in the past when... |
| latency | 524288 | latency | Posted by elements when their latency changes. The application should recalculate and distribute a new latency. |
| need_context | 536870912 | need-context | Message indicating that an element wants a specific context (Since: 1.2) |
| new_clock | 2048 | new-clock | a new clock was selected in the pipeline. |
| progress | 33554432 | progress | A progress message. |
| property_notify | 2147483651 | property-notify | Message indicating a #GObject property has changed (Since: 1.10) |
| qos | 16777216 | qos | A buffer was dropped or an element changed its processing strategy for Quality of Service reasons. |
| redirect | 2147483654 | redirect | Message indicating to request the application to try to play the given URL(s). Useful if for example a HTTP 302/303 response is received with a non... |
| request_state | 4194304 | request-state | Posted by elements when they want the pipeline to change state. This message is a suggestion to the application which can decide to perform the sta... |
| reset_time | 134217728 | reset-time | Message to request resetting the pipeline's running time from the pipeline. This is an internal message which applications will likely never receive. |
| segment_done | 131072 | segment-done | pipeline completed playback of a segment. This message is forwarded to the application after all elements that posted @GST_MESSAGE_SEGMENT_START po... |
| segment_start | 65536 | segment-start | pipeline started playback of a segment. This message is used internally and never forwarded to the application. |
| state_changed | 64 | state-changed | a state change happened |
| state_dirty | 128 | state-dirty | an element changed state in a streaming thread. This message is deprecated. |
| step_done | 256 | step-done | a stepping operation finished. |
| step_start | 8388608 | step-start | A stepping operation was started. |
| stream_collection | 2147483652 | stream-collection | Message indicating a new #GstStreamCollection is available (Since: 1.10) |
| stream_start | 268435456 | stream-start | Message indicating start of a new stream. Useful e.g. when using playbin in gapless playback mode, to get notified when the next title actually sta... |
| stream_status | 8192 | stream-status | status about a stream, emitted when it starts, stops, errors, etc.. |
| streams_selected | 2147483653 | streams-selected | Message indicating the active selection of #GstStreams has changed (Since: 1.10) |
| structure_change | 4096 | structure-change | the structure of the pipeline changed. This message is used internally and never forwarded to the application. |
| tag | 16 | tag | a tag was found. |
| toc | 67108864 | toc | A new table of contents (TOC) was found or previously found TOC was updated. |
| unknown | 0 | unknown | an undefined message |
| warning | 4 | warning | a warning occurred. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_name | `get_name(type: MessageType) -> utf8` | gst_message_type_get_name |  | Get a printable name for the given message type. Do not modify or free. |
| to_quark | `to_quark(type: MessageType) -> GLib.Quark` | gst_message_type_to_quark |  | Get the unique quark for the given message type. |

### Gst.MetaFlags

GType: `GstMetaFlags` ?? C type: `GstMetaFlags`

Extra metadata flags.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| last | 65536 | last | additional flags can be added starting from this flag. |
| locked | 4 | locked | metadata should not be removed |
| none | 0 | none | no flags |
| pooled | 2 | pooled | metadata is managed by a bufferpool |
| readonly | 1 | readonly | metadata should not be modified |

### Gst.MiniObjectFlags

GType: `GstMiniObjectFlags` ?? C type: `GstMiniObjectFlags`

Flags for the mini object

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| last | 16 | last | first flag that can be used by subclasses. |
| lock_readonly | 2 | lock-readonly | the object is permanently locked in READONLY mode. Only read locks can be performed on the object. |
| lockable | 1 | lockable | the object can be locked and unlocked with gst_mini_object_lock() and gst_mini_object_unlock(). |
| may_be_leaked | 4 | may-be-leaked | the object is expected to stay alive even after gst_deinit() has been called and so should be ignored by leak detection tools. (Since: 1.10) |

### Gst.ObjectFlags

GType: `GstObjectFlags` ?? C type: `GstObjectFlags`

The standard flags that an gstobject may have.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| constructed | 2 | constructed | Flag that's set when the object has been constructed. This can be used by API such as base class setters to differentiate between the case where th... |
| last | 16 | last | subclasses can add additional flags starting from this flag |
| may_be_leaked | 1 | may-be-leaked | the object is expected to stay alive even after gst_deinit() has been called and so should be ignored by leak detection tools. (Since: 1.10) |

### Gst.PadFlags

GType: `GstPadFlags` ?? C type: `GstPadFlags`

Pad state flags

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| accept_intersect | 32768 | accept-intersect | the default accept-caps handler will check it the caps intersect the query-caps result instead of checking for a subset. This is interesting for pa... |
| accept_template | 65536 | accept-template | the default accept-caps handler will use the template pad caps instead of query caps to compare with the accept caps. Use this in combination with ... |
| blocked | 16 | blocked | is dataflow on a pad blocked |
| blocking | 128 | blocking | is pad currently blocking on a buffer or event |
| eos | 64 | eos | is pad in EOS state |
| fixed_caps | 2048 | fixed-caps | the pad is using fixed caps. This means that once the caps are set on the pad, the default caps query function will only return those caps. |
| flushing | 32 | flushing | is pad flushing |
| last | 1048576 | last | offset to define more flags |
| need_parent | 256 | need-parent | ensure that there is a parent object before calling into the pad callbacks. |
| need_reconfigure | 512 | need-reconfigure | the pad should be reconfigured/renegotiated. The flag has to be unset manually after reconfiguration happened. |
| pending_events | 1024 | pending-events | the pad has pending events |
| proxy_allocation | 8192 | proxy-allocation | the default query handler will forward allocation queries to the internally linked pads instead of discarding them. |
| proxy_caps | 4096 | proxy-caps | the default event and query handler will forward all events and queries to the internally linked pads instead of discarding them. |
| proxy_scheduling | 16384 | proxy-scheduling | the default query handler will forward scheduling queries to the internally linked pads instead of discarding them. |

### Gst.PadLinkCheck

GType: `GstPadLinkCheck` ?? C type: `GstPadLinkCheck`

The amount of checking to be done when linking pads. @GST_PAD_LINK_CHECK_CAPS and @GST_PAD_LINK_CHECK_TEMPLATE_CAPS are mutually exclusive. If both...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| caps | 4 | caps | Check if the pads are compatible by comparing the caps returned by gst_pad_query_caps(). |
| default | 5 | default | The default checks done when linking pads (i.e. the ones used by gst_pad_link()). |
| hierarchy | 1 | hierarchy | Check the pads have same parents/grandparents. Could be omitted if it is already known that the two elements that own the pads are in the same bin. |
| no_reconfigure | 8 | no-reconfigure | Disables pushing a reconfigure event when pads are linked. |
| nothing | 0 | nothing | Don't check hierarchy or caps compatibility. |
| template_caps | 2 | template-caps | Check if the pads are compatible by using their template caps. This is much faster than @GST_PAD_LINK_CHECK_CAPS, but would be unsafe e.g. if one p... |

### Gst.PadProbeType

GType: `GstPadProbeType` ?? C type: `GstPadProbeType`

The different probing types that can occur. When either one of @GST_PAD_PROBE_TYPE_IDLE or @GST_PAD_PROBE_TYPE_BLOCK is used, the probe will be a b...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all_both | 1776 | all-both | probe upstream events and queries and downstream buffers, buffer lists, events and queries |
| block | 2 | block | probe and block pads |
| block_downstream | 114 | block-downstream | probe and block downstream data (buffers, buffer lists, and events) |
| block_upstream | 130 | block-upstream | probe and block upstream data (events) |
| blocking | 3 | blocking | probe and block at the next opportunity, at data flow or when idle |
| buffer | 16 | buffer | probe buffers |
| buffer_list | 32 | buffer-list | probe buffer lists |
| data_both | 240 | data-both | probe upstream and downstream data (buffers, buffer lists, and events) |
| data_downstream | 112 | data-downstream | probe downstream data (buffers, buffer lists, and events) |
| data_upstream | 128 | data-upstream | probe upstream data (events) |
| event_both | 192 | event-both | probe upstream and downstream events |
| event_downstream | 64 | event-downstream | probe downstream events |
| event_flush | 256 | event-flush | probe flush events. This probe has to be explicitly enabled and is not included in the @@GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM or @@GST_PAD_PROBE_TYP... |
| event_upstream | 128 | event-upstream | probe upstream events |
| idle | 1 | idle | probe idle pads and block while the callback is called |
| invalid | 0 | invalid | invalid probe type |
| pull | 8192 | pull | probe pull |
| push | 4096 | push | probe push |
| query_both | 1536 | query-both | probe upstream and downstream queries |
| query_downstream | 512 | query-downstream | probe downstream queries |
| query_upstream | 1024 | query-upstream | probe upstream queries |
| scheduling | 12288 | scheduling | probe push and pull |

### Gst.PadTemplateFlags

GType: `GstPadTemplateFlags` ?? C type: `GstPadTemplateFlags`

Flags for the padtemplate

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| last | 256 | last | first flag that can be used by subclasses. |

### Gst.ParseFlags

GType: `GstParseFlags` ?? C type: `GstParseFlags`

Parsing options.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| fatal_errors | 1 | fatal-errors | Always return %NULL when an error occurs (default behaviour is to return partially constructed bins or elements in some cases) |
| no_single_element_bins | 2 | no-single-element-bins | If a bin only has a single element, just return the element. |
| none | 0 | none | Do not use any special parsing options. |
| place_in_bin | 4 | place-in-bin | If more than one toplevel element is described by the pipeline description string, put them in a #GstBin instead of a #GstPipeline. (Since: 1.10) |

### Gst.PipelineFlags

GType: `GstPipelineFlags` ?? C type: `GstPipelineFlags`

Pipeline flags

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| fixed_clock | 524288 | fixed-clock | this pipeline works with a fixed clock |
| last | 8388608 | last | offset to define more flags |

### Gst.PluginAPIFlags

GType: `GstPluginAPIFlags` ?? C type: `GstPluginAPIFlags`

Ignore enum members when generating the plugins cache. This is useful if the members of the enum are generated dynamically, in order not to expose ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| members | 1 | members | Ignore enum members when generating the plugins cache. This is useful if the members of the enum are generated dynamically, in order not to expose ... |

### Gst.PluginDependencyFlags

GType: `GstPluginDependencyFlags` ?? C type: `GstPluginDependencyFlags`

Flags used in connection with gst_plugin_add_dependency().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| file_name_is_prefix | 8 | file-name-is-prefix | interpret filename argument as filter prefix and check all matching files in the directory. Since: 1.8. |
| file_name_is_suffix | 4 | file-name-is-suffix | interpret filename argument as filter suffix and check all matching files in the directory |
| none | 0 | none | no special flags |
| paths_are_default_only | 2 | paths-are-default-only | use paths argument only if none of the environment variables is set |
| paths_are_relative_to_exe | 16 | paths-are-relative-to-exe | interpret non-absolute paths as relative to the main executable directory. Since 1.14. |
| recurse | 1 | recurse | recurse into subdirectories |

### Gst.PluginFlags

GType: `GstPluginFlags` ?? C type: `GstPluginFlags`

The plugin loading state

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| blacklisted | 32 | blacklisted | The plugin won't be scanned (again) |
| cached | 16 | cached | Temporarily loaded plugins |

### Gst.QueryTypeFlags

GType: `GstQueryTypeFlags` ?? C type: `GstQueryTypeFlags`

#GstQueryTypeFlags indicate the aspects of the different #GstQueryType values. You can get the type flags of a #GstQueryType with the gst_query_typ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| downstream | 2 | downstream | Set if the query can travel downstream. |
| serialized | 4 | serialized | Set if the query should be serialized with data flow. |
| upstream | 1 | upstream | Set if the query can travel upstream. |

### Gst.SchedulingFlags

GType: `GstSchedulingFlags` ?? C type: `GstSchedulingFlags`

The different scheduling flags.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bandwidth_limited | 4 | bandwidth-limited | if bandwidth is limited and buffering possible (since 1.2) |
| seekable | 1 | seekable | if seeking is possible |
| sequential | 2 | sequential | if sequential access is recommended |

### Gst.SeekFlags

GType: `GstSeekFlags` ?? C type: `GstSeekFlags`

Flags to be used with gst_element_seek() or gst_event_new_seek(). All flags can be used together. A non flushing seek might take some time to perfo...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| accurate | 2 | accurate | accurate position is requested, this might be considerably slower for some formats. |
| flush | 1 | flush | flush pipeline |
| instant_rate_change | 1024 | instant-rate-change | Signals that a rate change should be applied immediately. Only valid if start/stop position are GST_CLOCK_TIME_NONE, the playback direction does no... |
| key_unit | 4 | key-unit | seek to the nearest keyframe. This might be faster but less accurate. |
| none | 0 | none | no flag |
| segment | 8 | segment | perform a segment seek. |
| skip | 16 | skip | Deprecated backward compatibility flag, replaced by %GST_SEEK_FLAG_TRICKMODE |
| snap_after | 64 | snap-after | go to a location after the requested position, if %GST_SEEK_FLAG_KEY_UNIT this means the keyframe at of after the requested position. |
| snap_before | 32 | snap-before | go to a location before the requested position, if %GST_SEEK_FLAG_KEY_UNIT this means the keyframe at or before the requested position the one at o... |
| snap_nearest | 96 | snap-nearest | go to a position near the requested position, if %GST_SEEK_FLAG_KEY_UNIT this means the keyframe closest to the requested position, if both keyfram... |
| trickmode | 16 | trickmode | when doing fast forward or fast reverse playback, allow elements to skip frames instead of generating all frames. (Since: 1.6) |
| trickmode_forward_predicted | 512 | trickmode-forward-predicted | When doing fast forward or fast reverse playback, request that elements only decode keyframes and forward predicted frames and skip all other conte... |
| trickmode_key_units | 128 | trickmode-key-units | when doing fast forward or fast reverse playback, request that elements only decode keyframes and skip all other content, for formats that have key... |
| trickmode_no_audio | 256 | trickmode-no-audio | when doing fast forward or fast reverse playback, request that audio decoder elements skip decoding and output only gap events or silence. (Since: ... |

### Gst.SegmentFlags

GType: `GstSegmentFlags` ?? C type: `GstSegmentFlags`

Flags for the GstSegment structure. Currently mapped to the corresponding values of the seek flags.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | no flags |
| reset | 1 | reset | reset the pipeline running_time to the segment running_time |
| segment | 8 | segment | send SEGMENT_DONE instead of EOS |
| skip | 16 | skip | Deprecated backward compatibility flag, replaced by @GST_SEGMENT_FLAG_TRICKMODE |
| trickmode | 16 | trickmode | perform skip playback (Since: 1.6) |
| trickmode_forward_predicted | 512 | trickmode-forward-predicted | Decode only keyframes or forward predicted frames, where possible (Since: 1.18) |
| trickmode_key_units | 128 | trickmode-key-units | Decode only keyframes, where possible (Since: 1.6) |
| trickmode_no_audio | 256 | trickmode-no-audio | Do not decode any audio, where possible (Since: 1.6) |

### Gst.SerializeFlags

GType: `GstSerializeFlags` ?? C type: `GstSerializeFlags`

No special flags specified.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| backward_compat | 1 | backward-compat | Serialize using the old format for nested structures. |
| none | 0 | none | No special flags specified. |
| strict | 2 | strict | Serialization fails if a value cannot be serialized instead of using placeholder "NULL" value (e.g. pointers, objects). |

### Gst.StackTraceFlags

GType: `GstStackTraceFlags` ?? C type: `GstStackTraceFlags`

Try to retrieve the minimum information available, which may be none on some platforms (Since: 1.18)

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| full | 1 | full | Try to retrieve as much information as possible, including source information when getting the stack trace |
| none | 0 | none | Try to retrieve the minimum information available, which may be none on some platforms (Since: 1.18) |

### Gst.StreamFlags

GType: `GstStreamFlags` ?? C type: `GstStreamFlags`

This stream has no special attributes

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | This stream has no special attributes |
| select | 2 | select | This stream should be selected by default. This flag may be used by demuxers to signal that a stream should be selected by default in a playback sc... |
| sparse | 1 | sparse | This stream is a sparse stream (e.g. a subtitle stream), data may flow only in irregular intervals with large gaps in between. |
| unselect | 4 | unselect | This stream should not be selected by default. This flag may be used by demuxers to signal that a stream should not be selected by default in a pla... |

### Gst.StreamType

GType: `GstStreamType` ?? C type: `GstStreamType`

#GstStreamType describes a high level classification set for flows of data in #GstStream objects. Note that this is a flag, and therefore users sho...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| audio | 2 | audio | The stream is of audio data |
| container | 8 | container | The stream is a muxed container type |
| text | 16 | text | The stream contains subtitle / subpicture data. |
| unknown | 1 | unknown | The stream is of unknown (unclassified) type. |
| video | 4 | video | The stream carries video data |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_name | `get_name(stype: StreamType) -> utf8` | gst_stream_type_get_name | 1.10 | Get a descriptive string for a given #GstStreamType |

### Gst.TracerValueFlags

GType: `GstTracerValueFlags` ?? C type: `GstTracerValueFlags`

Flag that describe the value. These flags help applications processing the logs to understand the values.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| aggregated | 2 | aggregated | the value is a combined figure, since the start of tracing. Examples are averages or timestamps. |
| none | 0 | none | no flags |
| optional | 1 | optional | the value is optional. When using this flag one need to have an additional boolean arg before this value in the var-args list passed to gst_tracer_... |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| abi |  | 0 | 0 | 0 |  |
| abi |  | 0 | 0 | 0 |  |
| abi |  | 0 | 0 | 0 |  |
| AllocationParams |  | 0 | 0 | 4 | Parameters to control the allocation of memory |
| AllocatorClass |  | 0 | 0 | 0 | The #GstAllocator is used to create new memory. |
| AllocatorPrivate |  | 0 | 0 | 0 |  |
| AtomicQueue |  | 0 | 0 | 7 | The #GstAtomicQueue object implements a queue that can be used from multiple threads without performing any blocking operations. |
| BinClass |  | 0 | 0 | 0 | Subclasses can override #GstBinClass::add_element and #GstBinClass::remove_element to update the list of children in the bin. The #GstBinClass::han... |
| BinPrivate |  | 0 | 0 | 0 |  |
| Buffer |  | 0 | 0 | 60 | Buffers are the basic unit of data transfer in GStreamer. They contain the timing and offset along with other arbitrary metadata that is associated... |
| BufferList |  | 0 | 0 | 10 | Buffer lists are an object containing a list of buffers. Buffer lists are created with gst_buffer_list_new() and filled with data using gst_buffer_... |
| BufferPoolAcquireParams |  | 0 | 0 | 0 | Parameters passed to the gst_buffer_pool_acquire_buffer() function to control the allocation of the buffer. The default implementation ignores the ... |
| BufferPoolClass |  | 0 | 0 | 0 | The #GstBufferPool class. |
| BufferPoolPrivate |  | 0 | 0 | 0 |  |
| BusClass |  | 0 | 0 | 0 | GStreamer bus class. |
| BusPrivate |  | 0 | 0 | 0 |  |
| ByteArrayInterface |  | 0 | 0 | 0 | Interface for an array of bytes. It is expected to be subclassed to implement @resize virtual method using language native array implementation, su... |
| Caps |  | 0 | 0 | 48 | Caps (capabilities) are lightweight refcounted objects describing media types. They are composed of an array of #GstStructure. Caps are exposed on ... |
| CapsFeatures |  | 0 | 0 | 23 | #GstCapsFeatures can optionally be set on a #GstCaps to add requirements for additional features for a specific #GstStructure. Caps structures with... |
| ChildProxyInterface |  | 0 | 0 | 0 | #GstChildProxy interface. |
| ClockClass |  | 0 | 0 | 0 | GStreamer clock class. Override the vmethods to implement the clock functionality. |
| ClockEntry |  | 0 | 0 | 0 | All pending timeouts or periodic notifies are converted into an entry. Note that GstClockEntry should be treated as an opaque structure. It must no... |
| ClockPrivate |  | 0 | 0 | 0 |  |
| Context |  | 0 | 0 | 6 | #GstContext is a container object used to store contexts like a device context, a display server connection and similar concepts that should be sha... |
| ControlBindingClass |  | 0 | 0 | 0 | The class structure of #GstControlBinding. |
| ControlBindingPrivate |  | 0 | 0 | 0 |  |
| ControlSourceClass |  | 0 | 0 | 0 | The class structure of #GstControlSource. |
| CustomMeta |  | 0 | 0 | 2 | Extra custom metadata. The @structure field is the same as returned by gst_custom_meta_get_structure(). Since 1.24 it can be serialized using gst_m... |
| DateTime |  | 0 | 0 | 30 | Struct to store date, time and timezone information altogether. #GstDateTime is refcounted and immutable. Date information is handled using the [pr... |
| DebugCategory |  | 0 | 0 | 7 | This is the struct that describes the categories. Once initialized with #GST_DEBUG_CATEGORY_INIT, its values can't be changed anymore. |
| DebugMessage |  | 0 | 0 | 2 | Gets the string representation of a #GstDebugMessage. This function is used in debug handlers to extract the message. |
| DeviceClass |  | 0 | 0 | 0 | The class structure for a #GstDevice object. |
| DeviceMonitorClass |  | 0 | 0 | 0 | Opaque device monitor class structure. |
| DeviceMonitorPrivate |  | 0 | 0 | 0 |  |
| DevicePrivate |  | 0 | 0 | 0 |  |
| DeviceProviderClass |  | 0 | 0 | 5 | The structure of the base #GstDeviceProviderClass |
| DeviceProviderFactoryClass |  | 0 | 0 | 0 | The opaque #GstDeviceProviderFactoryClass data structure. |
| DeviceProviderPrivate |  | 0 | 0 | 0 |  |
| DynamicTypeFactoryClass |  | 0 | 0 | 0 |  |
| ElementClass |  | 0 | 0 | 10 | GStreamer element class. Override the vmethods to implement the element functionality. |
| ElementFactoryClass |  | 0 | 0 | 0 |  |
| Event |  | 0 | 0 | 66 | The event class provides factory methods to construct events for sending and functions to query (parse) received events. Events are usually created... |
| FormatDefinition |  | 0 | 0 | 0 | A format definition |
| GhostPadClass |  | 0 | 0 | 0 |  |
| GhostPadPrivate |  | 0 | 0 | 0 |  |
| Iterator |  | 0 | 0 | 12 | A GstIterator is used to retrieve multiple objects from another object in a threadsafe way. Various GStreamer objects provide access to their inter... |
| MapInfo |  | 0 | 0 | 0 | A structure containing the result of a map operation such as gst_memory_map(). It contains the data and size. #GstMapInfo cannot be used with g_aut... |
| Memory |  | 0 | 0 | 11 | GstMemory is a lightweight refcounted object that wraps a region of memory. They are typically used to manage the data of a #GstBuffer. A GstMemory... |
| Message |  | 0 | 0 | 99 | Messages are implemented as a subclass of #GstMiniObject with a generic #GstStructure as the content. This allows for writing custom messages witho... |
| Meta |  | 0 | 0 | 12 | The #GstMeta structure should be included as the first member of a #GstBuffer metadata structure. The structure defines the API of the metadata and... |
| MetaInfo |  | 0 | 0 | 3 | The #GstMetaInfo provides information about a specific metadata structure. |
| MetaTransformCopy |  | 0 | 0 | 0 | Extra data passed to a "gst-copy" transform #GstMetaTransformFunction. |
| MiniObject |  | 0 | 0 | 18 | #GstMiniObject is a simple structure that can be used to implement refcounted types. Subclasses will include #GstMiniObject as the first member in ... |
| ObjectClass |  | 0 | 0 | 0 | GStreamer base object class. |
| PadClass |  | 0 | 0 | 0 |  |
| PadPrivate |  | 0 | 0 | 0 |  |
| PadProbeInfo |  | 0 | 0 | 0 | Info passed in the #GstPadProbeCallback. |
| PadTemplateClass |  | 0 | 0 | 0 | a #GstPadTemplate that has been created |
| ParamSpecArray |  | 0 | 0 | 0 | A GParamSpec derived structure for arrays of values. |
| ParamSpecFraction |  | 0 | 0 | 0 | A GParamSpec derived structure that contains the meta data for fractional properties. |
| ParentBufferMeta |  | 0 | 0 | 1 | The #GstParentBufferMeta is a #GstMeta which can be attached to a #GstBuffer to hold a reference to another buffer that is only released when the c... |
| ParseContext |  | 0 | 0 | 4 | Opaque structure. |
| PipelineClass |  | 0 | 0 | 0 |  |
| PipelinePrivate |  | 0 | 0 | 0 |  |
| PluginClass |  | 0 | 0 | 0 |  |
| PluginDesc |  | 0 | 0 | 0 | A plugin should export a variable of this type called plugin_desc. The plugin loader will use the data provided there to initialize the plugin. The... |
| PluginFeatureClass |  | 0 | 0 | 0 |  |
| Poll |  | 0 | 0 | 21 | A #GstPoll keeps track of file descriptors much like fd_set (used with select ()) or a struct pollfd array (used with poll ()). Once created with g... |
| PollFD |  | 0 | 0 | 1 | A file descriptor object. |
| PresetInterface |  | 0 | 0 | 0 | #GstPreset interface. |
| Promise |  | 0 | 0 | 7 | The #GstPromise object implements the container for values that may be available later. i.e. a Future or a Promise in <https://en.wikipedia.org/wik... |
| ProtectionMeta |  | 0 | 0 | 1 | Metadata type that holds information about a sample from a protection-protected track, including the information needed to decrypt it (if it is enc... |
| ProxyPadClass |  | 0 | 0 | 0 |  |
| ProxyPadPrivate |  | 0 | 0 | 0 |  |
| Query |  | 0 | 0 | 87 | Queries can be performed on pads (gst_pad_query()) and elements (gst_element_query()). Please note that some queries might need a running pipeline ... |
| ReferenceTimestampMeta |  | 0 | 0 | 1 | #GstReferenceTimestampMeta can be used to attach alternative timestamps and possibly durations to a #GstBuffer. These are generally not according t... |
| RegistryClass |  | 0 | 0 | 0 |  |
| RegistryPrivate |  | 0 | 0 | 0 |  |
| Sample |  | 0 | 0 | 11 | A #GstSample is a small object containing data, a type, timing and extra arbitrary information. |
| Segment |  | 0 | 0 | 19 | This helper structure holds the relevant values for tracking the region of interest in a media file, called a segment. The structure can be used fo... |
| SharedTaskPoolClass |  | 0 | 0 | 0 | The #GstSharedTaskPoolClass object. |
| SharedTaskPoolPrivate |  | 0 | 0 | 0 |  |
| StaticCaps |  | 0 | 0 | 2 | Data structure to initialize #GstCaps from a string description usually used in conjunction with GST_STATIC_CAPS() and gst_static_caps_get() to ins... |
| StaticPadTemplate |  | 0 | 0 | 2 | Structure describing the #GstStaticPadTemplate. |
| StreamClass |  | 0 | 0 | 0 | GstStream class structure |
| StreamCollectionClass |  | 0 | 0 | 0 | GstStreamCollection class structure |
| StreamCollectionPrivate |  | 0 | 0 | 0 |  |
| StreamPrivate |  | 0 | 0 | 0 |  |
| Structure |  | 0 | 0 | 75 | A #GstStructure is a collection of key/value pairs. The keys are expressed as GQuarks and the values can be of any GType. In addition to the key/va... |
| SystemClockClass |  | 0 | 0 | 0 |  |
| SystemClockPrivate |  | 0 | 0 | 0 |  |
| TagList |  | 0 | 0 | 49 | List of tags and values used to describe media metadata. Strings in structures must be ASCII or UTF-8 encoded. Other encodings are not allowed. Str... |
| TagSetterInterface |  | 0 | 0 | 0 | #GstTagSetterInterface interface. |
| TaskClass |  | 0 | 0 | 0 |  |
| TaskPoolClass |  | 0 | 0 | 0 | The #GstTaskPoolClass object. |
| TaskPrivate |  | 0 | 0 | 0 |  |
| TimedValue |  | 0 | 0 | 0 | Structure for storing a timestamp and a value. |
| Toc |  | 0 | 0 | 9 | #GstToc functions are used to create/free #GstToc and #GstTocEntry structures. Also they are used to convert #GstToc into #GstStructure and vice ve... |
| TocEntry |  | 0 | 0 | 16 | Create new #GstTocEntry structure. |
| TocSetterInterface |  | 0 | 0 | 0 | #GstTocSetterInterface interface. |
| TracerClass |  | 0 | 0 | 0 |  |
| TracerFactoryClass |  | 0 | 0 | 0 |  |
| TracerPrivate |  | 0 | 0 | 0 |  |
| TracerRecordClass |  | 0 | 0 | 0 |  |
| TypeFind |  | 0 | 0 | 6 | The following functions allow you to detect the media type of an unknown stream. |
| TypeFindFactoryClass |  | 0 | 0 | 0 |  |
| Uri |  | 0 | 0 | 50 | A #GstUri object can be used to parse and split a URI string into its constituent parts. Two #GstUri objects can be joined to make a new #GstUri us... |
| URIHandlerInterface |  | 0 | 0 | 0 | Any #GstElement using this interface should implement these methods. |
| ValueTable |  | 0 | 0 | 0 | VTable for the #GValue @type. |

### Gst.abi

C type: `abi`

#### Fields

| Field | Type |
| --- | --- |
| documentation_caps | Caps |
| gtype | GType |

### Gst.abi

C type: `abi`

#### Fields

| Field | Type |
| --- | --- |
| eventfullfunc | PadEventFullFunction |
| last_flowret | FlowReturn |

### Gst.abi

C type: `abi`

#### Fields

| Field | Type |
| --- | --- |
| priv | ControlBindingPrivate |

### Gst.AllocationParams

GType: `GstAllocationParams` ?? C type: `GstAllocationParams`

Parameters to control the allocation of memory

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| align | gsize |
| flags | MemoryFlags |
| padding | gsize |
| prefix | gsize |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `AllocationParams.new() -> AllocationParams` | gst_allocation_params_new | 1.20 | Create a new #GstAllocationParams on the heap. This function is for use in GStreamer language bindings. In your own code, you can just declare a #G... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `AllocationParams.copy() -> AllocationParams` | gst_allocation_params_copy |  | Create a copy of @params. |
| free | `AllocationParams.free() -> none` | gst_allocation_params_free |  | Free @params |
| init | `AllocationParams.init() -> none` | gst_allocation_params_init |  | Initialize @params to its default values |

### Gst.AllocatorClass

C type: `GstAllocatorClass`

The #GstAllocator is used to create new memory.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| alloc | Memory |
| free | none |
| object_class | ObjectClass |

### Gst.AllocatorPrivate

C type: `GstAllocatorPrivate`

### Gst.AtomicQueue

GType: `GstAtomicQueue` ?? C type: `GstAtomicQueue`

The #GstAtomicQueue object implements a queue that can be used from multiple threads without performing any blocking operations.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `AtomicQueue.new(initial_size: guint) -> AtomicQueue` | gst_atomic_queue_new |  | Create a new atomic queue instance. @initial_size will be rounded up to the nearest power of 2 and used as the initial size of the queue. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| length | `AtomicQueue.length() -> guint` | gst_atomic_queue_length |  | Get the amount of items in the queue. |
| peek | `AtomicQueue.peek() -> gpointer` | gst_atomic_queue_peek |  | Peek the head element of the queue without removing it from the queue. |
| pop | `AtomicQueue.pop() -> gpointer` | gst_atomic_queue_pop |  | Get the head element of the queue. |
| push | `AtomicQueue.push(data: gpointer?) -> none` | gst_atomic_queue_push |  | Append @data to the tail of the queue. |
| ref | `AtomicQueue.ref() -> none` | gst_atomic_queue_ref |  | Increase the refcount of @queue. |
| unref | `AtomicQueue.unref() -> none` | gst_atomic_queue_unref |  | Unref @queue and free the memory when the refcount reaches 0. |

### Gst.BinClass

C type: `GstBinClass`

Subclasses can override #GstBinClass::add_element and #GstBinClass::remove_element to update the list of children in the bin. The #GstBinClass::han...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| add_element | gboolean |
| deep_element_added | none |
| deep_element_removed | none |
| do_latency | gboolean |
| element_added | none |
| element_removed | none |
| handle_message | none |
| parent_class | ElementClass |
| pool | GLib.ThreadPool |
| remove_element | gboolean |

### Gst.BinPrivate

C type: `GstBinPrivate`

### Gst.Buffer

GType: `GstBuffer` ?? C type: `GstBuffer`

Buffers are the basic unit of data transfer in GStreamer. They contain the timing and offset along with other arbitrary metadata that is associated...

#### Fields

| Field | Type |
| --- | --- |
| dts | ClockTime |
| duration | ClockTime |
| mini_object | MiniObject |
| offset | guint64 |
| offset_end | guint64 |
| pool | BufferPool |
| pts | ClockTime |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Buffer.new() -> Buffer` | gst_buffer_new |  | Creates a newly allocated buffer without any data. |
| new_allocate | `Buffer.new_allocate(allocator: Allocator?, size: gsize, params: AllocationParams?) -> Buffer` | gst_buffer_new_allocate |  | Tries to create a newly allocated buffer with data of the given size and extra parameters from @allocator. If the requested amount of memory can't ... |
| new_memdup | `Buffer.new_memdup(data: guint8, size: gsize) -> Buffer` | gst_buffer_new_memdup | 1.20 | Creates a new buffer of size @size and fills it with a copy of @data. |
| new_wrapped | `Buffer.new_wrapped(data: guint8, size: gsize) -> Buffer` | gst_buffer_new_wrapped |  | Creates a new buffer that wraps the given @data. The memory will be freed with g_free() and will be marked writable. |
| new_wrapped_bytes | `Buffer.new_wrapped_bytes(bytes: GLib.Bytes) -> Buffer` | gst_buffer_new_wrapped_bytes | 1.16 | Creates a new #GstBuffer that wraps the given @bytes. The data inside @bytes cannot be %NULL and the resulting buffer will be marked as read only. |
| new_wrapped_full | `Buffer.new_wrapped_full(flags: MemoryFlags, data: guint8, maxsize: gsize, offset: gsize, size: gsize, user_data: gpointer?, notify: GLib.DestroyNotify?) -> Buffer` | gst_buffer_new_wrapped_full |  | Allocates a new buffer that wraps the given memory. @data must point to @maxsize of memory, the wrapped buffer will have the region from @offset an... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_max_memory | `get_max_memory() -> guint` | gst_buffer_get_max_memory | 1.2 | Gets the maximum amount of memory blocks that a buffer can hold. This is a compile time constant that can be queried with the function. When more m... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_custom_meta | `Buffer.add_custom_meta(name: utf8) -> CustomMeta` | gst_buffer_add_custom_meta | 1.20 | Creates and adds a #GstCustomMeta for the desired @name. @name must have been successfully registered with gst_meta_register_custom(). |
| add_meta | `Buffer.add_meta(info: MetaInfo, params: gpointer?) -> Meta` | gst_buffer_add_meta |  | Adds metadata for @info to @buffer using the parameters in @params. |
| add_parent_buffer_meta | `Buffer.add_parent_buffer_meta(ref: Buffer) -> ParentBufferMeta` | gst_buffer_add_parent_buffer_meta | 1.6 | Adds a #GstParentBufferMeta to @buffer that holds a reference on @ref until the buffer is freed. |
| add_protection_meta | `Buffer.add_protection_meta(info: Structure) -> ProtectionMeta` | gst_buffer_add_protection_meta | 1.6 | Attaches protection metadata to a #GstBuffer. |
| add_reference_timestamp_meta | `Buffer.add_reference_timestamp_meta(reference: Caps, timestamp: ClockTime, duration: ClockTime) -> ReferenceTimestampMeta` | gst_buffer_add_reference_timestamp_meta | 1.14 | Adds a #GstReferenceTimestampMeta to @buffer that holds a @timestamp and optionally @duration based on a specific timestamp @reference. See the doc... |
| append | `Buffer.append(buf2: Buffer) -> Buffer` | gst_buffer_append |  | Appends all the memory from @buf2 to @buf1. The result buffer will contain a concatenation of the memory of @buf1 and @buf2. |
| append_memory | `Buffer.append_memory(mem: Memory) -> none` | gst_buffer_append_memory |  | Appends the memory block @mem to @buffer. This function takes ownership of @mem and thus doesn't increase its refcount. This function is identical ... |
| append_region | `Buffer.append_region(buf2: Buffer, offset: gssize, size: gssize) -> Buffer` | gst_buffer_append_region |  | Appends @size bytes at @offset from @buf2 to @buf1. The result buffer will contain a concatenation of the memory of @buf1 and the requested region ... |
| copy_deep | `Buffer.copy_deep() -> Buffer` | gst_buffer_copy_deep | 1.6 | Creates a copy of the given buffer. This will make a newly allocated copy of the data the source buffer contains. |
| copy_into | `Buffer.copy_into(src: Buffer, flags: BufferCopyFlags, offset: gsize, size: gsize) -> gboolean` | gst_buffer_copy_into |  | Copies the information from @src into @dest. If @dest already contains memory and @flags contains GST_BUFFER_COPY_MEMORY, the memory from @src will... |
| copy_region | `Buffer.copy_region(flags: BufferCopyFlags, offset: gsize, size: gsize) -> Buffer` | gst_buffer_copy_region |  | Creates a sub-buffer from @parent at @offset and @size. This sub-buffer uses the actual memory space of the parent buffer. This function will copy ... |
| extract | `Buffer.extract(offset: gsize, dest: out guint8, size: out gsize) -> gsize` | gst_buffer_extract |  | Copies @size bytes starting from @offset in @buffer to @dest. |
| extract_dup | `Buffer.extract_dup(offset: gsize, size: gsize, dest: out guint8, dest_size: out gsize) -> none` | gst_buffer_extract_dup | 1.0.10 | Extracts a copy of at most @size bytes the data at @offset into newly-allocated memory. @dest must be freed using g_free() when done. |
| fill | `Buffer.fill(offset: gsize, src: guint8, size: gsize) -> gsize` | gst_buffer_fill |  | Copies @size bytes from @src to @buffer at @offset. |
| find_memory | `Buffer.find_memory(offset: gsize, size: gsize, idx: out guint, length: out guint, skip: out gsize) -> gboolean` | gst_buffer_find_memory |  | Finds the memory blocks that span @size bytes starting from @offset in @buffer. When this function returns %TRUE, @idx will contain the index of th... |
| foreach_meta | `Buffer.foreach_meta(func: BufferForeachMetaFunc, user_data: gpointer?) -> gboolean` | gst_buffer_foreach_meta |  | Calls @func with @user_data for each meta in @buffer. @func can modify the passed meta pointer or its contents. The return value of @func defines i... |
| get_all_memory | `Buffer.get_all_memory() -> Memory` | gst_buffer_get_all_memory |  | Gets all the memory blocks in @buffer. The memory blocks will be merged into one large #GstMemory. |
| get_custom_meta | `Buffer.get_custom_meta(name: utf8) -> CustomMeta` | gst_buffer_get_custom_meta | 1.20 | Finds the first #GstCustomMeta on @buffer for the desired @name. |
| get_flags | `Buffer.get_flags() -> BufferFlags` | gst_buffer_get_flags | 1.10 | Gets the #GstBufferFlags flags set on this buffer. |
| get_memory | `Buffer.get_memory(idx: guint) -> Memory` | gst_buffer_get_memory |  | Gets the memory block at index @idx in @buffer. |
| get_memory_range | `Buffer.get_memory_range(idx: guint, length: gint) -> Memory` | gst_buffer_get_memory_range |  | Gets @length memory blocks in @buffer starting at @idx. The memory blocks will be merged into one large #GstMemory. If @length is -1, all memory st... |
| get_meta | `Buffer.get_meta(api: GType) -> Meta` | gst_buffer_get_meta |  | Gets the metadata for @api on buffer. When there is no such metadata, %NULL is returned. If multiple metadata with the given @api are attached to t... |
| get_n_meta | `Buffer.get_n_meta(api_type: GType) -> guint` | gst_buffer_get_n_meta | 1.14 | number of metas of type @api_type on @buffer. |
| get_reference_timestamp_meta | `Buffer.get_reference_timestamp_meta(reference: Caps?) -> ReferenceTimestampMeta` | gst_buffer_get_reference_timestamp_meta | 1.14 | Finds the first #GstReferenceTimestampMeta on @buffer that conforms to @reference. Conformance is tested by checking if the meta's reference is a s... |
| get_size | `Buffer.get_size() -> gsize` | gst_buffer_get_size |  | Gets the total size of the memory blocks in @buffer. |
| get_sizes | `Buffer.get_sizes(offset: out gsize?, maxsize: out gsize?) -> gsize` | gst_buffer_get_sizes |  | Gets the total size of the memory blocks in @buffer. When not %NULL, @offset will contain the offset of the data in the first memory block in @buff... |
| get_sizes_range | `Buffer.get_sizes_range(idx: guint, length: gint, offset: out gsize?, maxsize: out gsize?) -> gsize` | gst_buffer_get_sizes_range |  | Gets the total size of @length memory blocks stating from @idx in @buffer. When not %NULL, @offset will contain the offset of the data in the memor... |
| has_flags | `Buffer.has_flags(flags: BufferFlags) -> gboolean` | gst_buffer_has_flags | 1.10 | Gives the status of a specific flag on a buffer. |
| insert_memory | `Buffer.insert_memory(idx: gint, mem: Memory) -> none` | gst_buffer_insert_memory |  | Inserts the memory block @mem into @buffer at @idx. This function takes ownership of @mem and thus doesn't increase its refcount. Only gst_buffer_g... |
| is_all_memory_writable | `Buffer.is_all_memory_writable() -> gboolean` | gst_buffer_is_all_memory_writable | 1.4 | Checks if all memory blocks in @buffer are writable. Note that this function does not check if @buffer is writable, use gst_buffer_is_writable() to... |
| is_memory_range_writable | `Buffer.is_memory_range_writable(idx: guint, length: gint) -> gboolean` | gst_buffer_is_memory_range_writable | 1.4 | Checks if @length memory blocks in @buffer starting from @idx are writable. @length can be -1 to check all the memory blocks after @idx. Note that ... |
| iterate_meta | `Buffer.iterate_meta(state: out gpointer?) -> Meta` | gst_buffer_iterate_meta |  | Retrieves the next #GstMeta after @current. If @state points to %NULL, the first metadata is returned. @state will be updated with an opaque state ... |
| iterate_meta_filtered | `Buffer.iterate_meta_filtered(state: out gpointer?, meta_api_type: GType) -> Meta` | gst_buffer_iterate_meta_filtered | 1.12 | Retrieves the next #GstMeta of type @meta_api_type after the current one according to @state. If @state points to %NULL, the first metadata of type... |
| map | `Buffer.map(info: out MapInfo, flags: MapFlags) -> gboolean` | gst_buffer_map |  | Fills @info with the #GstMapInfo of all merged memory blocks in @buffer. @flags describe the desired access of the memory. When @flags is #GST_MAP_... |
| map_range | `Buffer.map_range(idx: guint, length: gint, info: out MapInfo, flags: MapFlags) -> gboolean` | gst_buffer_map_range |  | Fills @info with the #GstMapInfo of @length merged memory blocks starting at @idx in @buffer. When @length is -1, all memory blocks starting from @... |
| memcmp | `Buffer.memcmp(offset: gsize, mem: guint8, size: gsize) -> gint` | gst_buffer_memcmp |  | Compares @size bytes starting from @offset in @buffer with the memory in @mem. |
| memset | `Buffer.memset(offset: gsize, val: guint8, size: gsize) -> gsize` | gst_buffer_memset |  | Fills @buf with @size bytes with @val starting from @offset. |
| n_memory | `Buffer.n_memory() -> guint` | gst_buffer_n_memory |  | Gets the amount of memory blocks that this buffer has. This amount is never larger than what gst_buffer_get_max_memory() returns. |
| peek_memory | `Buffer.peek_memory(idx: guint) -> Memory` | gst_buffer_peek_memory |  | Gets the memory block at @idx in @buffer. The memory block stays valid until the memory block in @buffer is removed, replaced or merged, typically ... |
| prepend_memory | `Buffer.prepend_memory(mem: Memory) -> none` | gst_buffer_prepend_memory |  | Prepends the memory block @mem to @buffer. This function takes ownership of @mem and thus doesn't increase its refcount. This function is identical... |
| remove_all_memory | `Buffer.remove_all_memory() -> none` | gst_buffer_remove_all_memory |  | Removes all the memory blocks in @buffer. |
| remove_memory | `Buffer.remove_memory(idx: guint) -> none` | gst_buffer_remove_memory |  | Removes the memory block in @b at index @i. |
| remove_memory_range | `Buffer.remove_memory_range(idx: guint, length: gint) -> none` | gst_buffer_remove_memory_range |  | Removes @length memory blocks in @buffer starting from @idx. @length can be -1, in which case all memory starting from @idx is removed. |
| remove_meta | `Buffer.remove_meta(meta: Meta) -> gboolean` | gst_buffer_remove_meta |  | Removes the metadata for @meta on @buffer. |
| replace_all_memory | `Buffer.replace_all_memory(mem: Memory) -> none` | gst_buffer_replace_all_memory |  | Replaces all memory in @buffer with @mem. |
| replace_memory | `Buffer.replace_memory(idx: guint, mem: Memory) -> none` | gst_buffer_replace_memory |  | Replaces the memory block at index @idx in @buffer with @mem. |
| replace_memory_range | `Buffer.replace_memory_range(idx: guint, length: gint, mem: Memory) -> none` | gst_buffer_replace_memory_range |  | Replaces @length memory blocks in @buffer starting at @idx with @mem. If @length is -1, all memory starting from @idx will be removed and replaced ... |
| resize | `Buffer.resize(offset: gssize, size: gssize) -> none` | gst_buffer_resize |  | Sets the offset and total size of the memory blocks in @buffer. |
| resize_range | `Buffer.resize_range(idx: guint, length: gint, offset: gssize, size: gssize) -> gboolean` | gst_buffer_resize_range |  | Sets the total size of the @length memory blocks starting at @idx in @buffer |
| set_flags | `Buffer.set_flags(flags: BufferFlags) -> gboolean` | gst_buffer_set_flags | 1.10 | Sets one or more buffer flags on a buffer. |
| set_size | `Buffer.set_size(size: gssize) -> none` | gst_buffer_set_size |  | Sets the total size of the memory blocks in @buffer. |
| unmap | `Buffer.unmap(info: MapInfo) -> none` | gst_buffer_unmap |  | Releases the memory previously mapped with gst_buffer_map(). |
| unset_flags | `Buffer.unset_flags(flags: BufferFlags) -> gboolean` | gst_buffer_unset_flags | 1.10 | Clears one or more buffer flags. |

### Gst.BufferList

GType: `GstBufferList` ?? C type: `GstBufferList`

Buffer lists are an object containing a list of buffers. Buffer lists are created with gst_buffer_list_new() and filled with data using gst_buffer_...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `BufferList.new() -> BufferList` | gst_buffer_list_new |  | Creates a new, empty #GstBufferList. |
| new_sized | `BufferList.new_sized(size: guint) -> BufferList` | gst_buffer_list_new_sized |  | Creates a new, empty #GstBufferList. The list will have @size space preallocated so that memory reallocations can be avoided. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| calculate_size | `BufferList.calculate_size() -> gsize` | gst_buffer_list_calculate_size | 1.14 | Calculates the size of the data contained in @list by adding the size of all buffers. |
| copy_deep | `BufferList.copy_deep() -> BufferList` | gst_buffer_list_copy_deep | 1.6 | Creates a copy of the given buffer list. This will make a newly allocated copy of the buffers that the source buffer list contains. |
| foreach | `BufferList.foreach(func: BufferListFunc, user_data: gpointer?) -> gboolean` | gst_buffer_list_foreach |  | Calls @func with @data for each buffer in @list. @func can modify the passed buffer pointer or its contents. The return value of @func defines if t... |
| get | `BufferList.get(idx: guint) -> Buffer` | gst_buffer_list_get |  | Gets the buffer at @idx. You must make sure that @idx does not exceed the number of buffers available. |
| get_writable | `BufferList.get_writable(idx: guint) -> Buffer` | gst_buffer_list_get_writable | 1.14 | Gets the buffer at @idx, ensuring it is a writable buffer. You must make sure that @idx does not exceed the number of buffers available. |
| insert | `BufferList.insert(idx: gint, buffer: Buffer) -> none` | gst_buffer_list_insert |  | Inserts @buffer at @idx in @list. Other buffers are moved to make room for this new buffer. A -1 value for @idx will append the buffer at the end. |
| length | `BufferList.length() -> guint` | gst_buffer_list_length |  | Returns the number of buffers in @list. |
| remove | `BufferList.remove(idx: guint, length: guint) -> none` | gst_buffer_list_remove |  | Removes @length buffers starting from @idx in @list. The following buffers are moved to close the gap. |

### Gst.BufferPoolAcquireParams

C type: `GstBufferPoolAcquireParams`

Parameters passed to the gst_buffer_pool_acquire_buffer() function to control the allocation of the buffer. The default implementation ignores the ...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| flags | BufferPoolAcquireFlags |
| format | Format |
| start | gint64 |
| stop | gint64 |

### Gst.BufferPoolClass

C type: `GstBufferPoolClass`

The #GstBufferPool class.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| acquire_buffer | FlowReturn |
| alloc_buffer | FlowReturn |
| flush_start | none |
| flush_stop | none |
| free_buffer | none |
| get_options | utf8 |
| object_class | ObjectClass |
| release_buffer | none |
| reset_buffer | none |
| set_config | gboolean |
| start | gboolean |
| stop | gboolean |

### Gst.BufferPoolPrivate

C type: `GstBufferPoolPrivate`

### Gst.BusClass

C type: `GstBusClass`

GStreamer bus class.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| message | none |
| parent_class | ObjectClass |
| sync_message | none |

### Gst.BusPrivate

C type: `GstBusPrivate`

### Gst.ByteArrayInterface

C type: `GstByteArrayInterface`

Interface for an array of bytes. It is expected to be subclassed to implement @resize virtual method using language native array implementation, su...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| data | guint8 |
| len | gsize |
| resize | gboolean |

### Gst.Caps

GType: `GstCaps` ?? C type: `GstCaps`

Caps (capabilities) are lightweight refcounted objects describing media types. They are composed of an array of #GstStructure. Caps are exposed on ...

#### Fields

| Field | Type |
| --- | --- |
| mini_object | MiniObject |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_any | `Caps.new_any() -> Caps` | gst_caps_new_any |  | Creates a new #GstCaps that indicates that it is compatible with any media format. |
| new_empty | `Caps.new_empty() -> Caps` | gst_caps_new_empty |  | Creates a new #GstCaps that is empty. That is, the returned #GstCaps contains no media formats. The #GstCaps is guaranteed to be writable. |
| new_empty_simple | `Caps.new_empty_simple(media_type: utf8) -> Caps` | gst_caps_new_empty_simple |  | Creates a new #GstCaps that contains one #GstStructure with name @media_type. |
| new_full | `Caps.new_full(struct1: Structure, ...: void) -> Caps` | gst_caps_new_full |  | Creates a new #GstCaps and adds all the structures listed as arguments. The list must be %NULL-terminated. The structures are not copied; the retur... |
| new_full_valist | `Caps.new_full_valist(structure: Structure, var_args: va_list) -> Caps` | gst_caps_new_full_valist |  | Creates a new #GstCaps and adds all the structures listed as arguments. The list must be %NULL-terminated. The structures are not copied; the retur... |
| new_simple | `Caps.new_simple(media_type: utf8, fieldname: utf8, ...: void) -> Caps` | gst_caps_new_simple |  | Creates a new #GstCaps that contains one #GstStructure. The structure is defined by the arguments, which have the same format as gst_structure_new(). |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| from_string | `from_string(string: utf8) -> Caps` | gst_caps_from_string |  | Converts @caps from a string representation. The implementation of serialization up to 1.20 would lead to unexpected results when there were nested... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append | `Caps.append(caps2: Caps) -> none` | gst_caps_append |  | Appends the structures contained in @caps2 to @caps1. The structures in @caps2 are not copied -- they are transferred to @caps1, and then @caps2 is... |
| append_structure | `Caps.append_structure(structure: Structure) -> none` | gst_caps_append_structure |  | Appends @structure to @caps. The structure is not copied; @caps becomes the owner of @structure. |
| append_structure_full | `Caps.append_structure_full(structure: Structure, features: CapsFeatures?) -> none` | gst_caps_append_structure_full | 1.2 | Appends @structure with @features to @caps. The structure is not copied; @caps becomes the owner of @structure. |
| can_intersect | `Caps.can_intersect(caps2: Caps) -> gboolean` | gst_caps_can_intersect |  | Tries intersecting @caps1 and @caps2 and reports whether the result would not be empty |
| copy | `Caps.copy() -> Caps` | gst_caps_copy |  | Creates a new #GstCaps as a copy of the old @caps. The new caps will have a refcount of 1, owned by the caller. The structures are copied as well. ... |
| copy_nth | `Caps.copy_nth(nth: guint) -> Caps` | gst_caps_copy_nth | 1.16 | Creates a new #GstCaps and appends a copy of the nth structure contained in @caps. |
| filter_and_map_in_place | `Caps.filter_and_map_in_place(func: CapsFilterMapFunc, user_data: gpointer?) -> none` | gst_caps_filter_and_map_in_place | 1.6 | Calls the provided function once for each structure and caps feature in the #GstCaps. In contrast to gst_caps_foreach(), the function may modify th... |
| fixate | `Caps.fixate() -> Caps` | gst_caps_fixate |  | Modifies the given @caps into a representation with only fixed values. First the caps will be truncated and then the first structure will be fixate... |
| foreach | `Caps.foreach(func: CapsForeachFunc, user_data: gpointer?) -> gboolean` | gst_caps_foreach | 1.6 | Calls the provided function once for each structure and caps feature in the #GstCaps. The function must not modify the fields. Also see gst_caps_ma... |
| get_features | `Caps.get_features(index: guint) -> CapsFeatures` | gst_caps_get_features | 1.2 | Finds the features in @caps at @index, and returns it. WARNING: This function takes a `const GstCaps *`, but returns a non-const `GstCapsFeatures *... |
| get_size | `Caps.get_size() -> guint` | gst_caps_get_size |  | Gets the number of structures contained in @caps. |
| get_structure | `Caps.get_structure(index: guint) -> Structure` | gst_caps_get_structure |  | Finds the structure in @caps at @index, and returns it. WARNING: This function takes a `const GstCaps *`, but returns a non-const `GstStructure *`.... |
| intersect | `Caps.intersect(caps2: Caps) -> Caps` | gst_caps_intersect |  | Creates a new #GstCaps that contains all the formats that are common to both @caps1 and @caps2. Defaults to %GST_CAPS_INTERSECT_ZIG_ZAG mode. |
| intersect_full | `Caps.intersect_full(caps2: Caps, mode: CapsIntersectMode) -> Caps` | gst_caps_intersect_full |  | Creates a new #GstCaps that contains all the formats that are common to both @caps1 and @caps2, the order is defined by the #GstCapsIntersectMode u... |
| is_always_compatible | `Caps.is_always_compatible(caps2: Caps) -> gboolean` | gst_caps_is_always_compatible |  | A given #GstCaps structure is always compatible with another if every media format that is in the first is also contained in the second. That is, @... |
| is_any | `Caps.is_any() -> gboolean` | gst_caps_is_any |  | Determines if @caps represents any media format. |
| is_empty | `Caps.is_empty() -> gboolean` | gst_caps_is_empty |  | Determines if @caps represents no media formats. |
| is_equal | `Caps.is_equal(caps2: Caps) -> gboolean` | gst_caps_is_equal |  | Checks if the given caps represent the same set of caps. |
| is_equal_fixed | `Caps.is_equal_fixed(caps2: Caps) -> gboolean` | gst_caps_is_equal_fixed |  | Tests if two #GstCaps are equal. This function only works on fixed #GstCaps. |
| is_fixed | `Caps.is_fixed() -> gboolean` | gst_caps_is_fixed |  | Fixed #GstCaps describe exactly one format, that is, they have exactly one structure, and each field in the structure describes a fixed type. Examp... |
| is_strictly_equal | `Caps.is_strictly_equal(caps2: Caps) -> gboolean` | gst_caps_is_strictly_equal |  | Checks if the given caps are exactly the same set of caps. |
| is_subset | `Caps.is_subset(superset: Caps) -> gboolean` | gst_caps_is_subset |  | Checks if all caps represented by @subset are also represented by @superset. |
| is_subset_structure | `Caps.is_subset_structure(structure: Structure) -> gboolean` | gst_caps_is_subset_structure |  | Checks if @structure is a subset of @caps. See gst_caps_is_subset() for more information. |
| is_subset_structure_full | `Caps.is_subset_structure_full(structure: Structure, features: CapsFeatures?) -> gboolean` | gst_caps_is_subset_structure_full | 1.2 | Checks if @structure is a subset of @caps. See gst_caps_is_subset() for more information. |
| map_in_place | `Caps.map_in_place(func: CapsMapFunc, user_data: gpointer?) -> gboolean` | gst_caps_map_in_place | 1.6 | Calls the provided function once for each structure and caps feature in the #GstCaps. In contrast to gst_caps_foreach(), the function may modify bu... |
| merge | `Caps.merge(caps2: Caps) -> Caps` | gst_caps_merge |  | Appends the structures contained in @caps2 to @caps1 if they are not yet expressed by @caps1. The structures in @caps2 are not copied -- they are t... |
| merge_structure | `Caps.merge_structure(structure: Structure) -> Caps` | gst_caps_merge_structure |  | Appends @structure to @caps if it is not already expressed by @caps. |
| merge_structure_full | `Caps.merge_structure_full(structure: Structure, features: CapsFeatures?) -> Caps` | gst_caps_merge_structure_full | 1.2 | Appends @structure with @features to @caps if its not already expressed by @caps. |
| normalize | `Caps.normalize() -> Caps` | gst_caps_normalize |  | Returns a #GstCaps that represents the same set of formats as @caps, but contains no lists. Each list is expanded into separate #GstStructure. This... |
| remove_structure | `Caps.remove_structure(idx: guint) -> none` | gst_caps_remove_structure |  | Removes the structure with the given index from the list of structures contained in @caps. |
| serialize | `Caps.serialize(flags: SerializeFlags) -> utf8` | gst_caps_serialize | 1.20 | Converts @caps to a string representation. This string representation can be converted back to a #GstCaps by gst_caps_from_string(). This prints th... |
| set_features | `Caps.set_features(index: guint, features: CapsFeatures?) -> none` | gst_caps_set_features | 1.2 | Sets the @features for the structure at @index. |
| set_features_simple | `Caps.set_features_simple(features: CapsFeatures?) -> none` | gst_caps_set_features_simple | 1.16 | Sets the @features for all the structures of @caps. |
| set_simple | `Caps.set_simple(field: utf8, ...: void) -> none` | gst_caps_set_simple |  | Sets fields in a #GstCaps. The arguments must be passed in the same manner as gst_structure_set(), and be %NULL-terminated. |
| set_simple_valist | `Caps.set_simple_valist(field: utf8, varargs: va_list) -> none` | gst_caps_set_simple_valist |  | Sets fields in a #GstCaps. The arguments must be passed in the same manner as gst_structure_set(), and be %NULL-terminated. |
| set_value | `Caps.set_value(field: utf8, value: GObject.Value) -> none` | gst_caps_set_value |  | Sets the given @field on all structures of @caps to the given @value. This is a convenience function for calling gst_structure_set_value() on all s... |
| simplify | `Caps.simplify() -> Caps` | gst_caps_simplify |  | Converts the given @caps into a representation that represents the same set of formats, but in a simpler form. Component structures that are identi... |
| steal_structure | `Caps.steal_structure(index: guint) -> Structure` | gst_caps_steal_structure |  | Retrieves the structure with the given index from the list of structures contained in @caps. The caller becomes the owner of the returned structure. |
| subtract | `Caps.subtract(subtrahend: Caps) -> Caps` | gst_caps_subtract |  | Subtracts the @subtrahend from the @minuend. > This function does not work reliably if optional properties for caps > are included on one caps and ... |
| to_string | `Caps.to_string() -> utf8` | gst_caps_to_string |  | Converts @caps to a string representation. This string representation can be converted back to a #GstCaps by gst_caps_from_string(). For debugging ... |
| truncate | `Caps.truncate() -> Caps` | gst_caps_truncate |  | Discards all but the first structure from @caps. Useful when fixating. This function takes ownership of @caps and will call gst_caps_make_writable(... |

### Gst.CapsFeatures

GType: `GstCapsFeatures` ?? C type: `GstCapsFeatures`

#GstCapsFeatures can optionally be set on a #GstCaps to add requirements for additional features for a specific #GstStructure. Caps structures with...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `CapsFeatures.new(feature1: utf8, ...: void) -> CapsFeatures` | gst_caps_features_new | 1.2 | Creates a new #GstCapsFeatures with the given features. The last argument must be %NULL. |
| new_any | `CapsFeatures.new_any() -> CapsFeatures` | gst_caps_features_new_any | 1.2 | Creates a new, ANY #GstCapsFeatures. This will be equal to any other #GstCapsFeatures but caps with these are unfixed. |
| new_empty | `CapsFeatures.new_empty() -> CapsFeatures` | gst_caps_features_new_empty | 1.2 | Creates a new, empty #GstCapsFeatures. |
| new_id | `CapsFeatures.new_id(feature1: GLib.Quark, ...: void) -> CapsFeatures` | gst_caps_features_new_id | 1.2 | Creates a new #GstCapsFeatures with the given features. The last argument must be 0. |
| new_id_valist | `CapsFeatures.new_id_valist(feature1: GLib.Quark, varargs: va_list) -> CapsFeatures` | gst_caps_features_new_id_valist | 1.2 | Creates a new #GstCapsFeatures with the given features. |
| new_single | `CapsFeatures.new_single(feature: utf8) -> CapsFeatures` | gst_caps_features_new_single | 1.20 | Creates a new #GstCapsFeatures with a single feature. |
| new_valist | `CapsFeatures.new_valist(feature1: utf8, varargs: va_list) -> CapsFeatures` | gst_caps_features_new_valist | 1.2 | Creates a new #GstCapsFeatures with the given features. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| from_string | `from_string(features: utf8) -> CapsFeatures` | gst_caps_features_from_string | 1.2 | Creates a #GstCapsFeatures from a string representation. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `CapsFeatures.add(feature: utf8) -> none` | gst_caps_features_add | 1.2 | Adds @feature to @features. |
| add_id | `CapsFeatures.add_id(feature: GLib.Quark) -> none` | gst_caps_features_add_id | 1.2 | Adds @feature to @features. |
| contains | `CapsFeatures.contains(feature: utf8) -> gboolean` | gst_caps_features_contains | 1.2 | Checks if @features contains @feature. |
| contains_id | `CapsFeatures.contains_id(feature: GLib.Quark) -> gboolean` | gst_caps_features_contains_id | 1.2 | Checks if @features contains @feature. |
| copy | `CapsFeatures.copy() -> CapsFeatures` | gst_caps_features_copy | 1.2 | Duplicates a #GstCapsFeatures and all its values. |
| free | `CapsFeatures.free() -> none` | gst_caps_features_free | 1.2 | Frees a #GstCapsFeatures and all its values. The caps features must not have a parent when this function is called. |
| get_nth | `CapsFeatures.get_nth(i: guint) -> utf8` | gst_caps_features_get_nth | 1.2 | Returns the @i-th feature of @features. |
| get_nth_id | `CapsFeatures.get_nth_id(i: guint) -> GLib.Quark` | gst_caps_features_get_nth_id | 1.2 | Returns the @i-th feature of @features. |
| get_size | `CapsFeatures.get_size() -> guint` | gst_caps_features_get_size | 1.2 | Returns the number of features in @features. |
| is_any | `CapsFeatures.is_any() -> gboolean` | gst_caps_features_is_any | 1.2 | Checks if @features is %GST_CAPS_FEATURES_ANY. |
| is_equal | `CapsFeatures.is_equal(features2: CapsFeatures) -> gboolean` | gst_caps_features_is_equal | 1.2 | Checks if @features1 and @features2 are equal. |
| remove | `CapsFeatures.remove(feature: utf8) -> none` | gst_caps_features_remove | 1.2 | Removes @feature from @features. |
| remove_id | `CapsFeatures.remove_id(feature: GLib.Quark) -> none` | gst_caps_features_remove_id | 1.2 | Removes @feature from @features. |
| set_parent_refcount | `CapsFeatures.set_parent_refcount(refcount: gint) -> gboolean` | gst_caps_features_set_parent_refcount | 1.2 | Sets the parent_refcount field of #GstCapsFeatures. This field is used to determine whether a caps features is mutable or not. This function should... |
| to_string | `CapsFeatures.to_string() -> utf8` | gst_caps_features_to_string | 1.2 | Converts @features to a human-readable string representation. For debugging purposes its easier to do something like this: ``` C GST_LOG ("features... |

### Gst.ChildProxyInterface

C type: `GstChildProxyInterface`

#GstChildProxy interface.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| child_added | none |
| child_removed | none |
| get_child_by_index | GObject.Object |
| get_child_by_name | GObject.Object |
| get_children_count | guint |
| parent | GObject.TypeInterface |

### Gst.ClockClass

C type: `GstClockClass`

GStreamer clock class. Override the vmethods to implement the clock functionality.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| change_resolution | ClockTime |
| get_internal_time | ClockTime |
| get_resolution | ClockTime |
| parent_class | ObjectClass |
| unschedule | none |
| wait | ClockReturn |
| wait_async | ClockReturn |

### Gst.ClockEntry

C type: `GstClockEntry`

All pending timeouts or periodic notifies are converted into an entry. Note that GstClockEntry should be treated as an opaque structure. It must no...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| clock | Clock |
| destroy_data | GLib.DestroyNotify |
| func | ClockCallback |
| interval | ClockTime |
| refcount | gint |
| status | ClockReturn |
| time | ClockTime |
| type | ClockEntryType |
| unscheduled | gboolean |
| user_data | gpointer |
| woken_up | gboolean |

### Gst.ClockPrivate

C type: `GstClockPrivate`

### Gst.Context

GType: `GstContext` ?? C type: `GstContext`

#GstContext is a container object used to store contexts like a device context, a display server connection and similar concepts that should be sha...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Context.new(context_type: utf8, persistent: gboolean) -> Context` | gst_context_new | 1.2 | Creates a new context. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_context_type | `Context.get_context_type() -> utf8` | gst_context_get_context_type | 1.2 | Gets the type of @context. |
| get_structure | `Context.get_structure() -> Structure` | gst_context_get_structure | 1.2 | Accesses the structure of the context. |
| has_context_type | `Context.has_context_type(context_type: utf8) -> gboolean` | gst_context_has_context_type | 1.2 | Checks if @context has @context_type. |
| is_persistent | `Context.is_persistent() -> gboolean` | gst_context_is_persistent | 1.2 | Checks if @context is persistent. |
| writable_structure | `Context.writable_structure() -> Structure` | gst_context_writable_structure | 1.2 | Gets a writable version of the structure. |

### Gst.ControlBindingClass

C type: `GstControlBindingClass`

The class structure of #GstControlBinding.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| get_g_value_array | gboolean |
| get_value | GObject.Value |
| get_value_array | gboolean |
| parent_class | ObjectClass |
| sync_values | gboolean |

### Gst.ControlBindingPrivate

C type: `GstControlBindingPrivate`

### Gst.ControlSourceClass

C type: `GstControlSourceClass`

The class structure of #GstControlSource.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | ObjectClass |

### Gst.CustomMeta

C type: `GstCustomMeta`

Extra custom metadata. The @structure field is the same as returned by gst_custom_meta_get_structure(). Since 1.24 it can be serialized using gst_m...

#### Fields

| Field | Type |
| --- | --- |
| meta | Meta |
| structure | Structure |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_structure | `CustomMeta.get_structure() -> Structure` | gst_custom_meta_get_structure | 1.20 | Retrieve the #GstStructure backing a custom meta, the structure's mutability is conditioned to the writability of the #GstBuffer @meta is attached to. |
| has_name | `CustomMeta.has_name(name: utf8) -> gboolean` | gst_custom_meta_has_name | 1.20 | Checks whether the name of the custom meta is @name |

### Gst.DateTime

GType: `GstDateTime` ?? C type: `GstDateTime`

Struct to store date, time and timezone information altogether. #GstDateTime is refcounted and immutable. Date information is handled using the [pr...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DateTime.new(tzoffset: gfloat, year: gint, month: gint, day: gint, hour: gint, minute: gint, seconds: gdouble) -> DateTime` | gst_date_time_new |  | Creates a new #GstDateTime using the date and times in the gregorian calendar in the supplied timezone. @year should be from 1 to 9999, @month shou... |
| new_from_g_date_time | `DateTime.new_from_g_date_time(dt: GLib.DateTime?) -> DateTime` | gst_date_time_new_from_g_date_time |  | Creates a new #GstDateTime from a #GDateTime object. |
| new_from_iso8601_string | `DateTime.new_from_iso8601_string(string: utf8) -> DateTime` | gst_date_time_new_from_iso8601_string |  | Tries to parse common variants of ISO-8601 datetime strings into a #GstDateTime. Possible input formats are (for example): `2012-06-30T22:46:43Z`, ... |
| new_from_unix_epoch_local_time | `DateTime.new_from_unix_epoch_local_time(secs: gint64) -> DateTime` | gst_date_time_new_from_unix_epoch_local_time |  | Creates a new #GstDateTime using the time since Jan 1, 1970 specified by @secs. The #GstDateTime is in the local timezone. |
| new_from_unix_epoch_local_time_usecs | `DateTime.new_from_unix_epoch_local_time_usecs(usecs: gint64) -> DateTime` | gst_date_time_new_from_unix_epoch_local_time_usecs | 1.18 | Creates a new #GstDateTime using the time since Jan 1, 1970 specified by @usecs. The #GstDateTime is in the local timezone. |
| new_from_unix_epoch_utc | `DateTime.new_from_unix_epoch_utc(secs: gint64) -> DateTime` | gst_date_time_new_from_unix_epoch_utc |  | Creates a new #GstDateTime using the time since Jan 1, 1970 specified by @secs. The #GstDateTime is in the UTC timezone. |
| new_from_unix_epoch_utc_usecs | `DateTime.new_from_unix_epoch_utc_usecs(usecs: gint64) -> DateTime` | gst_date_time_new_from_unix_epoch_utc_usecs | 1.18 | Creates a new #GstDateTime using the time since Jan 1, 1970 specified by @usecs. The #GstDateTime is in UTC. |
| new_local_time | `DateTime.new_local_time(year: gint, month: gint, day: gint, hour: gint, minute: gint, seconds: gdouble) -> DateTime` | gst_date_time_new_local_time |  | Creates a new #GstDateTime using the date and times in the gregorian calendar in the local timezone. @year should be from 1 to 9999, @month should ... |
| new_now_local_time | `DateTime.new_now_local_time() -> DateTime` | gst_date_time_new_now_local_time |  | Creates a new #GstDateTime representing the current date and time. |
| new_now_utc | `DateTime.new_now_utc() -> DateTime` | gst_date_time_new_now_utc |  | Creates a new #GstDateTime that represents the current instant at Universal coordinated time. |
| new_y | `DateTime.new_y(year: gint) -> DateTime` | gst_date_time_new_y |  | Creates a new #GstDateTime using the date and times in the gregorian calendar in the local timezone. @year should be from 1 to 9999. |
| new_ym | `DateTime.new_ym(year: gint, month: gint) -> DateTime` | gst_date_time_new_ym |  | Creates a new #GstDateTime using the date and times in the gregorian calendar in the local timezone. @year should be from 1 to 9999, @month should ... |
| new_ymd | `DateTime.new_ymd(year: gint, month: gint, day: gint) -> DateTime` | gst_date_time_new_ymd |  | Creates a new #GstDateTime using the date and times in the gregorian calendar in the local timezone. @year should be from 1 to 9999, @month should ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_day | `DateTime.get_day() -> gint` | gst_date_time_get_day |  | Returns the day of the month of this #GstDateTime. |
| get_hour | `DateTime.get_hour() -> gint` | gst_date_time_get_hour |  | Retrieves the hour of the day represented by @datetime in the gregorian calendar. The return is in the range of 0 to 23. |
| get_microsecond | `DateTime.get_microsecond() -> gint` | gst_date_time_get_microsecond |  | Retrieves the fractional part of the seconds in microseconds represented by @datetime in the gregorian calendar. |
| get_minute | `DateTime.get_minute() -> gint` | gst_date_time_get_minute |  | Retrieves the minute of the hour represented by @datetime in the gregorian calendar. |
| get_month | `DateTime.get_month() -> gint` | gst_date_time_get_month |  | Returns the month of this #GstDateTime. January is 1, February is 2, etc.. |
| get_second | `DateTime.get_second() -> gint` | gst_date_time_get_second |  | Retrieves the second of the minute represented by @datetime in the gregorian calendar. |
| get_time_zone_offset | `DateTime.get_time_zone_offset() -> gfloat` | gst_date_time_get_time_zone_offset |  | Retrieves the offset from UTC in hours that the timezone specified by @datetime represents. Timezones ahead (to the east) of UTC have positive valu... |
| get_year | `DateTime.get_year() -> gint` | gst_date_time_get_year |  | Returns the year of this #GstDateTime. Call gst_date_time_has_year() before, to avoid warnings. |
| has_day | `DateTime.has_day() -> gboolean` | gst_date_time_has_day |  | %TRUE if @datetime<!-- -->'s day field is set, otherwise %FALSE |
| has_month | `DateTime.has_month() -> gboolean` | gst_date_time_has_month |  | %TRUE if @datetime<!-- -->'s month field is set, otherwise %FALSE |
| has_second | `DateTime.has_second() -> gboolean` | gst_date_time_has_second |  | %TRUE if @datetime<!-- -->'s second field is set, otherwise %FALSE |
| has_time | `DateTime.has_time() -> gboolean` | gst_date_time_has_time |  | %TRUE if @datetime<!-- -->'s hour and minute fields are set, otherwise %FALSE |
| has_year | `DateTime.has_year() -> gboolean` | gst_date_time_has_year |  | %TRUE if @datetime<!-- -->'s year field is set (which should always be the case), otherwise %FALSE |
| ref | `DateTime.ref() -> DateTime` | gst_date_time_ref |  | Atomically increments the reference count of @datetime by one. |
| to_g_date_time | `DateTime.to_g_date_time() -> GLib.DateTime` | gst_date_time_to_g_date_time |  | Creates a new #GDateTime from a fully defined #GstDateTime object. |
| to_iso8601_string | `DateTime.to_iso8601_string() -> utf8` | gst_date_time_to_iso8601_string |  | Create a minimal string compatible with ISO-8601. Possible output formats are (for example): `2012`, `2012-06`, `2012-06-23`, `2012-06-23T23:30Z`, ... |
| unref | `DateTime.unref() -> none` | gst_date_time_unref |  | Atomically decrements the reference count of @datetime by one. When the reference count reaches zero, the structure is freed. |

### Gst.DebugCategory

C type: `GstDebugCategory`

This is the struct that describes the categories. Once initialized with #GST_DEBUG_CATEGORY_INIT, its values can't be changed anymore.

#### Fields

| Field | Type |
| --- | --- |
| color | guint |
| description | utf8 |
| name | utf8 |
| threshold | gint |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free | `DebugCategory.free() -> none` | gst_debug_category_free |  | Removes and frees the category and all associated resources. |
| get_color | `DebugCategory.get_color() -> guint` | gst_debug_category_get_color |  | Returns the color of a debug category used when printing output in this category. |
| get_description | `DebugCategory.get_description() -> utf8` | gst_debug_category_get_description |  | Returns the description of a debug category. |
| get_name | `DebugCategory.get_name() -> utf8` | gst_debug_category_get_name |  | Returns the name of a debug category. |
| get_threshold | `DebugCategory.get_threshold() -> DebugLevel` | gst_debug_category_get_threshold |  | Returns the threshold of a #GstDebugCategory. |
| reset_threshold | `DebugCategory.reset_threshold() -> none` | gst_debug_category_reset_threshold |  | Resets the threshold of the category to the default level. Debug information will only be output if the threshold is lower or equal to the level of... |
| set_threshold | `DebugCategory.set_threshold(level: DebugLevel) -> none` | gst_debug_category_set_threshold |  | Sets the threshold of the category to the given level. Debug information will only be output if the threshold is lower or equal to the level of the... |

### Gst.DebugMessage

C type: `GstDebugMessage`

Gets the string representation of a #GstDebugMessage. This function is used in debug handlers to extract the message.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `DebugMessage.get() -> utf8` | gst_debug_message_get |  | Gets the string representation of a #GstDebugMessage. This function is used in debug handlers to extract the message. |
| get_id | `DebugMessage.get_id() -> utf8` | gst_debug_message_get_id | 1.22 | Get the id of the object that emitted this message. This function is used in debug handlers. Can be empty. |

### Gst.DeviceClass

C type: `GstDeviceClass`

The class structure for a #GstDevice object.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| create_element | Element |
| parent_class | ObjectClass |
| reconfigure_element | gboolean |

### Gst.DeviceMonitorClass

C type: `GstDeviceMonitorClass`

Opaque device monitor class structure.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | ObjectClass |

### Gst.DeviceMonitorPrivate

C type: `GstDeviceMonitorPrivate`

### Gst.DevicePrivate

C type: `GstDevicePrivate`

### Gst.DeviceProviderClass

C type: `GstDeviceProviderClass`

The structure of the base #GstDeviceProviderClass

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| factory | DeviceProviderFactory |
| metadata | gpointer |
| parent_class | ObjectClass |
| probe | GLib.List |
| start | gboolean |
| stop | none |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_metadata | `DeviceProviderClass.add_metadata(key: utf8, value: utf8) -> none` | gst_device_provider_class_add_metadata | 1.4 | Set @key with @value as metadata in @klass. |
| add_static_metadata | `DeviceProviderClass.add_static_metadata(key: utf8, value: utf8) -> none` | gst_device_provider_class_add_static_metadata | 1.4 | Set @key with @value as metadata in @klass. Same as gst_device_provider_class_add_metadata(), but @value must be a static string or an inlined stri... |
| get_metadata | `DeviceProviderClass.get_metadata(key: utf8) -> utf8` | gst_device_provider_class_get_metadata | 1.4 | Get metadata with @key in @klass. |
| set_metadata | `DeviceProviderClass.set_metadata(longname: utf8, classification: utf8, description: utf8, author: utf8) -> none` | gst_device_provider_class_set_metadata | 1.4 | Sets the detailed information for a #GstDeviceProviderClass. > This function is for use in _class_init functions only. |
| set_static_metadata | `DeviceProviderClass.set_static_metadata(longname: utf8, classification: utf8, description: utf8, author: utf8) -> none` | gst_device_provider_class_set_static_metadata | 1.4 | Sets the detailed information for a #GstDeviceProviderClass. > This function is for use in _class_init functions only. Same as gst_device_provider_... |

### Gst.DeviceProviderFactoryClass

C type: `GstDeviceProviderFactoryClass`

The opaque #GstDeviceProviderFactoryClass data structure.

### Gst.DeviceProviderPrivate

C type: `GstDeviceProviderPrivate`

### Gst.DynamicTypeFactoryClass

C type: `GstDynamicTypeFactoryClass`

### Gst.ElementClass

C type: `GstElementClass`

GStreamer element class. Override the vmethods to implement the element functionality.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| change_state | StateChangeReturn |
| elementfactory | ElementFactory |
| get_state | StateChangeReturn |
| metadata | gpointer |
| no_more_pads | none |
| numpadtemplates | gint |
| pad_added | none |
| pad_removed | none |
| pad_templ_cookie | guint32 |
| padtemplates | GLib.List |
| parent_class | ObjectClass |
| post_message | gboolean |
| provide_clock | Clock |
| query | gboolean |
| release_pad | none |
| request_new_pad | Pad |
| send_event | gboolean |
| set_bus | none |
| set_clock | gboolean |
| set_context | none |
| set_state | StateChangeReturn |
| state_changed | none |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_metadata | `ElementClass.add_metadata(key: utf8, value: utf8) -> none` | gst_element_class_add_metadata |  | Set @key with @value as metadata in @klass. |
| add_pad_template | `ElementClass.add_pad_template(templ: PadTemplate) -> none` | gst_element_class_add_pad_template |  | Adds a padtemplate to an element class. This is mainly used in the _class_init functions of classes. If a pad template with the same name as an alr... |
| add_static_metadata | `ElementClass.add_static_metadata(key: utf8, value: utf8) -> none` | gst_element_class_add_static_metadata |  | Set @key with @value as metadata in @klass. Same as gst_element_class_add_metadata(), but @value must be a static string or an inlined string, as i... |
| add_static_pad_template | `ElementClass.add_static_pad_template(static_templ: StaticPadTemplate) -> none` | gst_element_class_add_static_pad_template | 1.8 | Adds a pad template to an element class based on the static pad template @templ. This is mainly used in the _class_init functions of element implem... |
| add_static_pad_template_with_gtype | `ElementClass.add_static_pad_template_with_gtype(static_templ: StaticPadTemplate, pad_type: GType) -> none` | gst_element_class_add_static_pad_template_with_gtype | 1.14 | Adds a pad template to an element class based on the static pad template @templ. This is mainly used in the _class_init functions of element implem... |
| get_metadata | `ElementClass.get_metadata(key: utf8) -> utf8` | gst_element_class_get_metadata |  | Get metadata with @key in @klass. |
| get_pad_template | `ElementClass.get_pad_template(name: utf8) -> PadTemplate` | gst_element_class_get_pad_template |  | Retrieves a padtemplate from @element_class with the given name. > If you use this function in the GInstanceInitFunc of an object class > that has ... |
| get_pad_template_list | `ElementClass.get_pad_template_list() -> GLib.List` | gst_element_class_get_pad_template_list |  | Retrieves a list of the pad templates associated with @element_class. The list must not be modified by the calling code. > If you use this function... |
| set_metadata | `ElementClass.set_metadata(longname: utf8, classification: utf8, description: utf8, author: utf8) -> none` | gst_element_class_set_metadata |  | Sets the detailed information for a #GstElementClass. > This function is for use in _class_init functions only. |
| set_static_metadata | `ElementClass.set_static_metadata(longname: utf8, classification: utf8, description: utf8, author: utf8) -> none` | gst_element_class_set_static_metadata |  | Sets the detailed information for a #GstElementClass. > This function is for use in _class_init functions only. Same as gst_element_class_set_metad... |

### Gst.ElementFactoryClass

C type: `GstElementFactoryClass`

### Gst.Event

GType: `GstEvent` ?? C type: `GstEvent`

The event class provides factory methods to construct events for sending and functions to query (parse) received events. Events are usually created...

#### Fields

| Field | Type |
| --- | --- |
| mini_object | MiniObject |
| seqnum | guint32 |
| timestamp | guint64 |
| type | EventType |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_buffer_size | `Event.new_buffer_size(format: Format, minsize: gint64, maxsize: gint64, async: gboolean) -> Event` | gst_event_new_buffer_size |  | Create a new buffersize event. The event is sent downstream and notifies elements that they should provide a buffer of the specified dimensions. Wh... |
| new_caps | `Event.new_caps(caps: Caps) -> Event` | gst_event_new_caps |  | Create a new CAPS event for @caps. The caps event can only travel downstream synchronized with the buffer flow and contains the format of the buffe... |
| new_custom | `Event.new_custom(type: EventType, structure: Structure) -> Event` | gst_event_new_custom |  | Create a new custom-typed event. This can be used for anything not handled by other event-specific functions to pass an event to another element. M... |
| new_eos | `Event.new_eos() -> Event` | gst_event_new_eos |  | Create a new EOS event. The eos event can only travel downstream synchronized with the buffer flow. Elements that receive the EOS event on a pad ca... |
| new_flush_start | `Event.new_flush_start() -> Event` | gst_event_new_flush_start |  | Allocate a new flush start event. The flush start event can be sent upstream and downstream and travels out-of-bounds with the dataflow. It marks p... |
| new_flush_stop | `Event.new_flush_stop(reset_time: gboolean) -> Event` | gst_event_new_flush_stop |  | Allocate a new flush stop event. The flush stop event can be sent upstream and downstream and travels serialized with the dataflow. It is typically... |
| new_gap | `Event.new_gap(timestamp: ClockTime, duration: ClockTime) -> Event` | gst_event_new_gap |  | Create a new GAP event. A gap event can be thought of as conceptually equivalent to a buffer to signal that there is no data for a certain amount o... |
| new_instant_rate_change | `Event.new_instant_rate_change(rate_multiplier: gdouble, new_flags: SegmentFlags) -> Event` | gst_event_new_instant_rate_change | 1.18 | Create a new instant-rate-change event. This event is sent by seek handlers (e.g. demuxers) when receiving a seek with the %GST_SEEK_FLAG_INSTANT_R... |
| new_instant_rate_sync_time | `Event.new_instant_rate_sync_time(rate_multiplier: gdouble, running_time: ClockTime, upstream_running_time: ClockTime) -> Event` | gst_event_new_instant_rate_sync_time | 1.18 | Create a new instant-rate-sync-time event. This event is sent by the pipeline to notify elements handling the instant-rate-change event about the r... |
| new_latency | `Event.new_latency(latency: ClockTime) -> Event` | gst_event_new_latency |  | Create a new latency event. The event is sent upstream from the sinks and notifies elements that they should add an additional @latency to the runn... |
| new_navigation | `Event.new_navigation(structure: Structure) -> Event` | gst_event_new_navigation |  | Create a new navigation event from the given description. |
| new_protection | `Event.new_protection(system_id: utf8, data: Buffer, origin: utf8) -> Event` | gst_event_new_protection | 1.6 | Creates a new event containing information specific to a particular protection system (uniquely identified by @system_id), by which that protection... |
| new_qos | `Event.new_qos(type: QOSType, proportion: gdouble, diff: ClockTimeDiff, timestamp: ClockTime) -> Event` | gst_event_new_qos |  | Allocate a new qos event with the given values. The QOS event is generated in an element that wants an upstream element to either reduce or increas... |
| new_reconfigure | `Event.new_reconfigure() -> Event` | gst_event_new_reconfigure |  | Create a new reconfigure event. The purpose of the reconfigure event is to travel upstream and make elements renegotiate their caps or reconfigure ... |
| new_seek | `Event.new_seek(rate: gdouble, format: Format, flags: SeekFlags, start_type: SeekType, start: gint64, stop_type: SeekType, stop: gint64) -> Event` | gst_event_new_seek |  | Allocate a new seek event with the given parameters. The seek event configures playback of the pipeline between @start to @stop at the speed given ... |
| new_segment | `Event.new_segment(segment: Segment) -> Event` | gst_event_new_segment |  | Create a new SEGMENT event for @segment. The segment event can only travel downstream synchronized with the buffer flow and contains timing informa... |
| new_segment_done | `Event.new_segment_done(format: Format, position: gint64) -> Event` | gst_event_new_segment_done |  | Create a new segment-done event. This event is sent by elements that finish playback of a segment as a result of a segment seek. |
| new_select_streams | `Event.new_select_streams(streams: GLib.List) -> Event` | gst_event_new_select_streams | 1.10 | Allocate a new select-streams event. The select-streams event requests the specified @streams to be activated. The list of @streams corresponds to ... |
| new_sink_message | `Event.new_sink_message(name: utf8, msg: Message) -> Event` | gst_event_new_sink_message |  | Create a new sink-message event. The purpose of the sink-message event is to instruct a sink to post the message contained in the event synchronize... |
| new_step | `Event.new_step(format: Format, amount: guint64, rate: gdouble, flush: gboolean, intermediate: gboolean) -> Event` | gst_event_new_step |  | Create a new step event. The purpose of the step event is to instruct a sink to skip @amount (expressed in @format) of media. It can be used to imp... |
| new_stream_collection | `Event.new_stream_collection(collection: StreamCollection) -> Event` | gst_event_new_stream_collection | 1.10 | Create a new STREAM_COLLECTION event. The stream collection event can only travel downstream synchronized with the buffer flow. Source elements, de... |
| new_stream_group_done | `Event.new_stream_group_done(group_id: guint) -> Event` | gst_event_new_stream_group_done | 1.10 | Create a new Stream Group Done event. The stream-group-done event can only travel downstream synchronized with the buffer flow. Elements that recei... |
| new_stream_start | `Event.new_stream_start(stream_id: utf8) -> Event` | gst_event_new_stream_start |  | Create a new STREAM_START event. The stream start event can only travel downstream synchronized with the buffer flow. It is expected to be the firs... |
| new_tag | `Event.new_tag(taglist: TagList) -> Event` | gst_event_new_tag |  | Generates a metadata tag event from the given @taglist. The scope of the taglist specifies if the taglist applies to the complete medium or only to... |
| new_toc | `Event.new_toc(toc: Toc, updated: gboolean) -> Event` | gst_event_new_toc |  | Generate a TOC event from the given @toc. The purpose of the TOC event is to inform elements that some kind of the TOC was found. |
| new_toc_select | `Event.new_toc_select(uid: utf8) -> Event` | gst_event_new_toc_select |  | Generate a TOC select event with the given @uid. The purpose of the TOC select event is to start playback based on the TOC's entry with the given @... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy_segment | `Event.copy_segment(segment: Segment) -> none` | gst_event_copy_segment |  | Parses a segment @event and copies the #GstSegment into the location given by @segment. |
| get_running_time_offset | `Event.get_running_time_offset() -> gint64` | gst_event_get_running_time_offset | 1.4 | Retrieve the accumulated running time offset of the event. Events passing through #GstPads that have a running time offset set via gst_pad_set_offs... |
| get_seqnum | `Event.get_seqnum() -> guint32` | gst_event_get_seqnum |  | Retrieve the sequence number of a event. Events have ever-incrementing sequence numbers, which may also be set explicitly via gst_event_set_seqnum(... |
| get_structure | `Event.get_structure() -> Structure` | gst_event_get_structure |  | Access the structure of the event. |
| has_name | `Event.has_name(name: utf8) -> gboolean` | gst_event_has_name |  | Checks if @event has the given @name. This function is usually used to check the name of a custom event. |
| has_name_id | `Event.has_name_id(name: GLib.Quark) -> gboolean` | gst_event_has_name_id | 1.18 | Checks if @event has the given @name. This function is usually used to check the name of a custom event. |
| parse_buffer_size | `Event.parse_buffer_size(format: out Format?, minsize: out gint64?, maxsize: out gint64?, async: out gboolean?) -> none` | gst_event_parse_buffer_size |  | Get the format, minsize, maxsize and async-flag in the buffersize event. |
| parse_caps | `Event.parse_caps(caps: out Caps?) -> none` | gst_event_parse_caps |  | Get the caps from @event. The caps remains valid as long as @event remains valid. |
| parse_flush_stop | `Event.parse_flush_stop(reset_time: out gboolean?) -> none` | gst_event_parse_flush_stop |  | Parse the FLUSH_STOP event and retrieve the @reset_time member. |
| parse_gap | `Event.parse_gap(timestamp: out ClockTime?, duration: out ClockTime?) -> none` | gst_event_parse_gap |  | Extract timestamp and duration from a new GAP event. |
| parse_gap_flags | `Event.parse_gap_flags(flags: out GapFlags?) -> none` | gst_event_parse_gap_flags | 1.20 | Retrieve the gap flags that may have been set on a gap event with gst_event_set_gap_flags(). |
| parse_group_id | `Event.parse_group_id(group_id: out guint?) -> gboolean` | gst_event_parse_group_id | 1.2 | %TRUE if a group id was set on the event and could be parsed, %FALSE otherwise. |
| parse_instant_rate_change | `Event.parse_instant_rate_change(rate_multiplier: out gdouble?, new_flags: out SegmentFlags?) -> none` | gst_event_parse_instant_rate_change | 1.18 | Extract rate and flags from an instant-rate-change event. |
| parse_instant_rate_sync_time | `Event.parse_instant_rate_sync_time(rate_multiplier: out gdouble?, running_time: out ClockTime?, upstream_running_time: out ClockTime?) -> none` | gst_event_parse_instant_rate_sync_time | 1.18 | Extract the rate multiplier and running times from an instant-rate-sync-time event. |
| parse_latency | `Event.parse_latency(latency: out ClockTime?) -> none` | gst_event_parse_latency |  | Get the latency in the latency event. |
| parse_protection | `Event.parse_protection(system_id: out utf8?, data: out Buffer?, origin: out utf8?) -> none` | gst_event_parse_protection | 1.6 | Parses an event containing protection system specific information and stores the results in @system_id, @data and @origin. The data stored in @syst... |
| parse_qos | `Event.parse_qos(type: out QOSType?, proportion: out gdouble?, diff: out ClockTimeDiff?, timestamp: out ClockTime?) -> none` | gst_event_parse_qos |  | Get the type, proportion, diff and timestamp in the qos event. See gst_event_new_qos() for more information about the different QoS values. @timest... |
| parse_seek | `Event.parse_seek(rate: out gdouble?, format: out Format?, flags: out SeekFlags?, start_type: out SeekType?, start: out gint64?, stop_type: out SeekType?, stop: out gint64?) -> none` | gst_event_parse_seek |  | Parses a seek @event and stores the results in the given result locations. |
| parse_seek_trickmode_interval | `Event.parse_seek_trickmode_interval(interval: out ClockTime?) -> none` | gst_event_parse_seek_trickmode_interval | 1.16 | Retrieve the trickmode interval that may have been set on a seek event with gst_event_set_seek_trickmode_interval(). |
| parse_segment | `Event.parse_segment(segment: out Segment?) -> none` | gst_event_parse_segment |  | Parses a segment @event and stores the result in the given @segment location. @segment remains valid only until the @event is freed. Don't modify t... |
| parse_segment_done | `Event.parse_segment_done(format: out Format?, position: out gint64?) -> none` | gst_event_parse_segment_done |  | Extracts the position and format from the segment done message. |
| parse_select_streams | `Event.parse_select_streams(streams: out GLib.List?) -> none` | gst_event_parse_select_streams | 1.10 | Parse the SELECT_STREAMS event and retrieve the contained streams. |
| parse_sink_message | `Event.parse_sink_message(msg: out Message?) -> none` | gst_event_parse_sink_message |  | Parse the sink-message event. Unref @msg after usage. |
| parse_step | `Event.parse_step(format: out Format?, amount: out guint64?, rate: out gdouble?, flush: out gboolean?, intermediate: out gboolean?) -> none` | gst_event_parse_step |  | Parse the step event. |
| parse_stream | `Event.parse_stream(stream: out Stream?) -> none` | gst_event_parse_stream | 1.10 | Parse a stream-start @event and extract the #GstStream from it. |
| parse_stream_collection | `Event.parse_stream_collection(collection: out StreamCollection?) -> none` | gst_event_parse_stream_collection | 1.10 | Retrieve new #GstStreamCollection from STREAM_COLLECTION event @event. |
| parse_stream_flags | `Event.parse_stream_flags(flags: out StreamFlags?) -> none` | gst_event_parse_stream_flags | 1.2 | a stream-start event |
| parse_stream_group_done | `Event.parse_stream_group_done(group_id: out guint?) -> none` | gst_event_parse_stream_group_done | 1.10 | Parse a stream-group-done @event and store the result in the given @group_id location. |
| parse_stream_start | `Event.parse_stream_start(stream_id: out utf8?) -> none` | gst_event_parse_stream_start |  | Parse a stream-id @event and store the result in the given @stream_id location. The string stored in @stream_id must not be modified and will remai... |
| parse_tag | `Event.parse_tag(taglist: out TagList?) -> none` | gst_event_parse_tag |  | Parses a tag @event and stores the results in the given @taglist location. No reference to the taglist will be returned, it remains valid only unti... |
| parse_toc | `Event.parse_toc(toc: out Toc?, updated: out gboolean?) -> none` | gst_event_parse_toc |  | Parse a TOC @event and store the results in the given @toc and @updated locations. |
| parse_toc_select | `Event.parse_toc_select(uid: out utf8?) -> none` | gst_event_parse_toc_select |  | Parse a TOC select @event and store the results in the given @uid location. |
| set_gap_flags | `Event.set_gap_flags(flags: GapFlags) -> none` | gst_event_set_gap_flags | 1.20 | Sets @flags on @event to give additional information about the reason for the #GST_EVENT_GAP. |
| set_group_id | `Event.set_group_id(group_id: guint) -> none` | gst_event_set_group_id | 1.2 | All streams that have the same group id are supposed to be played together, i.e. all streams inside a container file should have the same group id ... |
| set_running_time_offset | `Event.set_running_time_offset(offset: gint64) -> none` | gst_event_set_running_time_offset | 1.4 | Set the running time offset of a event. See gst_event_get_running_time_offset() for more information. MT safe. |
| set_seek_trickmode_interval | `Event.set_seek_trickmode_interval(interval: ClockTime) -> none` | gst_event_set_seek_trickmode_interval | 1.16 | Sets a trickmode interval on a (writable) seek event. Elements that support TRICKMODE_KEY_UNITS seeks SHOULD use this as the minimal interval betwe... |
| set_seqnum | `Event.set_seqnum(seqnum: guint32) -> none` | gst_event_set_seqnum |  | Set the sequence number of a event. This function might be called by the creator of a event to indicate that the event relates to other events or m... |
| set_stream | `Event.set_stream(stream: Stream) -> none` | gst_event_set_stream | 1.10 | Set the @stream on the stream-start @event |
| set_stream_flags | `Event.set_stream_flags(flags: StreamFlags) -> none` | gst_event_set_stream_flags | 1.2 | a stream-start event |
| writable_structure | `Event.writable_structure() -> Structure` | gst_event_writable_structure |  | Get a writable version of the structure. |

### Gst.FormatDefinition

C type: `GstFormatDefinition`

A format definition

#### Fields

| Field | Type |
| --- | --- |
| description | utf8 |
| nick | utf8 |
| quark | GLib.Quark |
| value | Format |

### Gst.GhostPadClass

C type: `GstGhostPadClass`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | ProxyPadClass |

### Gst.GhostPadPrivate

C type: `GstGhostPadPrivate`

### Gst.Iterator

GType: `GstIterator` ?? C type: `GstIterator`

A GstIterator is used to retrieve multiple objects from another object in a threadsafe way. Various GStreamer objects provide access to their inter...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| cookie | guint32 |
| copy | IteratorCopyFunction |
| free | IteratorFreeFunction |
| item | IteratorItemFunction |
| lock | GLib.Mutex |
| master_cookie | guint32 |
| next | IteratorNextFunction |
| pushed | Iterator |
| resync | IteratorResyncFunction |
| size | guint |
| type | GType |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Iterator.new(size: guint, type: GType, lock: GLib.Mutex, master_cookie: guint32, copy: IteratorCopyFunction, next: IteratorNextFunction, item: IteratorItemFunction, resync: IteratorResyncFunction, free: IteratorFreeFunction) -> Iterator` | gst_iterator_new |  | Create a new iterator. This function is mainly used for objects implementing the next/resync/free function to iterate a data structure. For each it... |
| new_list | `Iterator.new_list(type: GType, lock: GLib.Mutex, master_cookie: guint32, list: GLib.List, owner: GObject.Object, item: IteratorItemFunction) -> Iterator` | gst_iterator_new_list |  | Create a new iterator designed for iterating @list. The list you iterate is usually part of a data structure @owner and is protected with @lock. Th... |
| new_single | `Iterator.new_single(type: GType, object: GObject.Value) -> Iterator` | gst_iterator_new_single |  | This #GstIterator is a convenient iterator for the common case where a #GstIterator needs to be returned but only a single object has to be conside... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Iterator.copy() -> Iterator` | gst_iterator_copy |  | Copy the iterator and its state. |
| filter | `Iterator.filter(func: GLib.CompareFunc, user_data: GObject.Value) -> Iterator` | gst_iterator_filter |  | Create a new iterator from an existing iterator. The new iterator will only return those elements that match the given compare function @func. The ... |
| find_custom | `Iterator.find_custom(func: GLib.CompareFunc, elem: out GObject.Value, user_data: gpointer?) -> gboolean` | gst_iterator_find_custom |  | Find the first element in @it that matches the compare function @func. @func should return 0 when the element is found. The first parameter to @fun... |
| fold | `Iterator.fold(func: IteratorFoldFunction, ret: GObject.Value, user_data: gpointer?) -> IteratorResult` | gst_iterator_fold |  | Folds @func over the elements of @iter. That is to say, @func will be called as @func (object, @ret, @user_data) for each object in @it. The normal... |
| foreach | `Iterator.foreach(func: IteratorForeachFunction, user_data: gpointer?) -> IteratorResult` | gst_iterator_foreach |  | Iterate over all element of @it and call the given function @func for each element. |
| free | `Iterator.free() -> none` | gst_iterator_free |  | Free the iterator. MT safe. |
| next | `Iterator.next(elem: out GObject.Value) -> IteratorResult` | gst_iterator_next |  | Get the next item from the iterator in @elem. Only when this function returns %GST_ITERATOR_OK, @elem will contain a valid value. @elem must have b... |
| push | `Iterator.push(other: Iterator) -> none` | gst_iterator_push |  | Pushes @other iterator onto @it. All calls performed on @it are forwarded to @other. If @other returns %GST_ITERATOR_DONE, it is popped again and c... |
| resync | `Iterator.resync() -> none` | gst_iterator_resync |  | Resync the iterator. this function is mostly called after gst_iterator_next() returned %GST_ITERATOR_RESYNC. When an iterator was pushed on @it, it... |

### Gst.MapInfo

C type: `GstMapInfo`

A structure containing the result of a map operation such as gst_memory_map(). It contains the data and size. #GstMapInfo cannot be used with g_aut...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| data | guint8 |
| flags | MapFlags |
| maxsize | gsize |
| memory | Memory |
| size | gsize |
| user_data | gpointer |

### Gst.Memory

GType: `GstMemory` ?? C type: `GstMemory`

GstMemory is a lightweight refcounted object that wraps a region of memory. They are typically used to manage the data of a #GstBuffer. A GstMemory...

#### Fields

| Field | Type |
| --- | --- |
| align | gsize |
| allocator | Allocator |
| maxsize | gsize |
| mini_object | MiniObject |
| offset | gsize |
| parent | Memory |
| size | gsize |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_wrapped | `Memory.new_wrapped(flags: MemoryFlags, data: guint8, maxsize: gsize, offset: gsize, size: gsize, user_data: gpointer?, notify: GLib.DestroyNotify?) -> Memory` | gst_memory_new_wrapped |  | Allocate a new memory block that wraps the given @data. The prefix/padding must be filled with 0 if @flags contains #GST_MEMORY_FLAG_ZERO_PREFIXED ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Memory.copy(offset: gssize, size: gssize) -> Memory` | gst_memory_copy |  | Return a copy of @size bytes from @mem starting from @offset. This copy is guaranteed to be writable. @size can be set to -1 to return a copy from ... |
| get_sizes | `Memory.get_sizes(offset: out gsize?, maxsize: out gsize?) -> gsize` | gst_memory_get_sizes |  | Get the current @size, @offset and @maxsize of @mem. |
| init | `Memory.init(flags: MemoryFlags, allocator: Allocator, parent: Memory, maxsize: gsize, align: gsize, offset: gsize, size: gsize) -> none` | gst_memory_init |  | Initializes a newly allocated @mem with the given parameters. This function will call gst_mini_object_init() with the default memory parameters. |
| is_span | `Memory.is_span(mem2: Memory, offset: out gsize) -> gboolean` | gst_memory_is_span |  | Check if @mem1 and mem2 share the memory with a common parent memory object and that the memory is contiguous. If this is the case, the memory of @... |
| is_type | `Memory.is_type(mem_type: utf8) -> gboolean` | gst_memory_is_type | 1.2 | Check if @mem if allocated with an allocator for @mem_type. |
| make_mapped | `Memory.make_mapped(info: out MapInfo, flags: MapFlags) -> Memory` | gst_memory_make_mapped |  | Create a #GstMemory object that is mapped with @flags. If @mem is mappable with @flags, this function returns the mapped @mem directly. Otherwise a... |
| map | `Memory.map(info: out MapInfo, flags: MapFlags) -> gboolean` | gst_memory_map |  | Fill @info with the pointer and sizes of the memory in @mem that can be accessed according to @flags. This function can return %FALSE for various r... |
| resize | `Memory.resize(offset: gssize, size: gsize) -> none` | gst_memory_resize |  | Resize the memory region. @mem should be writable and offset + size should be less than the maxsize of @mem. #GST_MEMORY_FLAG_ZERO_PREFIXED and #GS... |
| share | `Memory.share(offset: gssize, size: gssize) -> Memory` | gst_memory_share |  | Return a shared copy of @size bytes from @mem starting from @offset. No memory copy is performed and the memory region is simply shared. The result... |
| unmap | `Memory.unmap(info: MapInfo) -> none` | gst_memory_unmap |  | Release the memory obtained with gst_memory_map() |

### Gst.Message

GType: `GstMessage` ?? C type: `GstMessage`

Messages are implemented as a subclass of #GstMiniObject with a generic #GstStructure as the content. This allows for writing custom messages witho...

#### Fields

| Field | Type |
| --- | --- |
| cond | GLib.Cond |
| lock | GLib.Mutex |
| mini_object | MiniObject |
| seqnum | guint32 |
| src | Object |
| timestamp | guint64 |
| type | MessageType |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_application | `Message.new_application(src: Object?, structure: Structure) -> Message` | gst_message_new_application |  | Create a new application-typed message. GStreamer will never create these messages; they are a gift from us to you. Enjoy. |
| new_async_done | `Message.new_async_done(src: Object?, running_time: ClockTime) -> Message` | gst_message_new_async_done |  | The message is posted when elements completed an ASYNC state change. @running_time contains the time of the desired running_time when this elements... |
| new_async_start | `Message.new_async_start(src: Object?) -> Message` | gst_message_new_async_start |  | This message is posted by elements when they start an ASYNC state change. |
| new_buffering | `Message.new_buffering(src: Object?, percent: gint) -> Message` | gst_message_new_buffering |  | Create a new buffering message. This message can be posted by an element that needs to buffer data before it can continue processing. @percent shou... |
| new_clock_lost | `Message.new_clock_lost(src: Object?, clock: Clock) -> Message` | gst_message_new_clock_lost |  | Create a clock lost message. This message is posted whenever the clock is not valid anymore. If this message is posted by the pipeline, the pipelin... |
| new_clock_provide | `Message.new_clock_provide(src: Object?, clock: Clock, ready: gboolean) -> Message` | gst_message_new_clock_provide |  | Create a clock provide message. This message is posted whenever an element is ready to provide a clock or lost its ability to provide a clock (mayb... |
| new_custom | `Message.new_custom(type: MessageType, src: Object?, structure: Structure?) -> Message` | gst_message_new_custom |  | Create a new custom-typed message. This can be used for anything not handled by other message-specific functions to pass a message to the app. The ... |
| new_device_added | `Message.new_device_added(src: Object?, device: Device) -> Message` | gst_message_new_device_added | 1.4 | Creates a new device-added message. The device-added message is produced by #GstDeviceProvider or a #GstDeviceMonitor. They announce the appearance... |
| new_device_changed | `Message.new_device_changed(src: Object?, device: Device, changed_device: Device) -> Message` | gst_message_new_device_changed | 1.16 | Creates a new device-changed message. The device-changed message is produced by #GstDeviceProvider or a #GstDeviceMonitor. They announce that a dev... |
| new_device_removed | `Message.new_device_removed(src: Object?, device: Device) -> Message` | gst_message_new_device_removed | 1.4 | Creates a new device-removed message. The device-removed message is produced by #GstDeviceProvider or a #GstDeviceMonitor. They announce the disapp... |
| new_duration_changed | `Message.new_duration_changed(src: Object?) -> Message` | gst_message_new_duration_changed |  | Create a new duration changed message. This message is posted by elements that know the duration of a stream when the duration changes. This messag... |
| new_element | `Message.new_element(src: Object?, structure: Structure) -> Message` | gst_message_new_element |  | Create a new element-specific message. This is meant as a generic way of allowing one-way communication from an element to an application, for exam... |
| new_eos | `Message.new_eos(src: Object?) -> Message` | gst_message_new_eos |  | Create a new eos message. This message is generated and posted in the sink elements of a GstBin. The bin will only forward the EOS message to the a... |
| new_error | `Message.new_error(src: Object?, error: GLib.Error, debug: utf8) -> Message` | gst_message_new_error |  | Create a new error message. The message will copy @error and @debug. This message is posted by element when a fatal event occurred. The pipeline wi... |
| new_error_with_details | `Message.new_error_with_details(src: Object?, error: GLib.Error, debug: utf8, details: Structure?) -> Message` | gst_message_new_error_with_details | 1.10 | Create a new error message. The message will copy @error and @debug. This message is posted by element when a fatal event occurred. The pipeline wi... |
| new_have_context | `Message.new_have_context(src: Object?, context: Context) -> Message` | gst_message_new_have_context | 1.2 | This message is posted when an element has a new local #GstContext. |
| new_info | `Message.new_info(src: Object?, error: GLib.Error, debug: utf8) -> Message` | gst_message_new_info |  | Create a new info message. The message will make copies of @error and @debug. |
| new_info_with_details | `Message.new_info_with_details(src: Object?, error: GLib.Error, debug: utf8, details: Structure?) -> Message` | gst_message_new_info_with_details | 1.10 | Create a new info message. The message will make copies of @error and @debug. |
| new_instant_rate_request | `Message.new_instant_rate_request(src: Object?, rate_multiplier: gdouble) -> Message` | gst_message_new_instant_rate_request | 1.18 | Creates a new instant-rate-request message. Elements handling the instant-rate-change event must post this message. The message is handled at the p... |
| new_latency | `Message.new_latency(src: Object?) -> Message` | gst_message_new_latency |  | This message can be posted by elements when their latency requirements have changed. |
| new_need_context | `Message.new_need_context(src: Object?, context_type: utf8) -> Message` | gst_message_new_need_context | 1.2 | This message is posted when an element needs a specific #GstContext. |
| new_new_clock | `Message.new_new_clock(src: Object?, clock: Clock) -> Message` | gst_message_new_new_clock |  | Create a new clock message. This message is posted whenever the pipeline selects a new clock for the pipeline. |
| new_progress | `Message.new_progress(src: Object?, type: ProgressType, code: utf8, text: utf8) -> Message` | gst_message_new_progress |  | Progress messages are posted by elements when they use an asynchronous task to perform actions triggered by a state change. @code contains a well d... |
| new_property_notify | `Message.new_property_notify(src: Object, property_name: utf8, val: GObject.Value?) -> Message` | gst_message_new_property_notify | 1.10 | a newly allocated #GstMessage |
| new_qos | `Message.new_qos(src: Object?, live: gboolean, running_time: guint64, stream_time: guint64, timestamp: guint64, duration: guint64) -> Message` | gst_message_new_qos |  | A QOS message is posted on the bus whenever an element decides to drop a buffer because of QoS reasons or whenever it changes its processing strate... |
| new_redirect | `Message.new_redirect(src: Object?, location: utf8, tag_list: TagList?, entry_struct: Structure?) -> Message` | gst_message_new_redirect | 1.10 | Creates a new redirect message and adds a new entry to it. Redirect messages are posted when an element detects that the actual data has to be retr... |
| new_request_state | `Message.new_request_state(src: Object?, state: State) -> Message` | gst_message_new_request_state |  | This message can be posted by elements when they want to have their state changed. A typical use case would be an audio server that wants to pause ... |
| new_reset_time | `Message.new_reset_time(src: Object?, running_time: ClockTime) -> Message` | gst_message_new_reset_time |  | This message is posted when the pipeline running-time should be reset to @running_time, like after a flushing seek. |
| new_segment_done | `Message.new_segment_done(src: Object?, format: Format, position: gint64) -> Message` | gst_message_new_segment_done |  | Create a new segment done message. This message is posted by elements that finish playback of a segment as a result of a segment seek. This message... |
| new_segment_start | `Message.new_segment_start(src: Object?, format: Format, position: gint64) -> Message` | gst_message_new_segment_start |  | Create a new segment message. This message is posted by elements that start playback of a segment as a result of a segment seek. This message is no... |
| new_state_changed | `Message.new_state_changed(src: Object?, oldstate: State, newstate: State, pending: State) -> Message` | gst_message_new_state_changed |  | Create a state change message. This message is posted whenever an element changed its state. |
| new_state_dirty | `Message.new_state_dirty(src: Object?) -> Message` | gst_message_new_state_dirty |  | Create a state dirty message. This message is posted whenever an element changed its state asynchronously and is used internally to update the stat... |
| new_step_done | `Message.new_step_done(src: Object?, format: Format, amount: guint64, rate: gdouble, flush: gboolean, intermediate: gboolean, duration: guint64, eos: gboolean) -> Message` | gst_message_new_step_done |  | This message is posted by elements when they complete a part, when @intermediate set to %TRUE, or a complete step operation. @duration will contain... |
| new_step_start | `Message.new_step_start(src: Object?, active: gboolean, format: Format, amount: guint64, rate: gdouble, flush: gboolean, intermediate: gboolean) -> Message` | gst_message_new_step_start |  | This message is posted by elements when they accept or activate a new step event for @amount in @format. @active is set to %FALSE when the element ... |
| new_stream_collection | `Message.new_stream_collection(src: Object?, collection: StreamCollection) -> Message` | gst_message_new_stream_collection | 1.10 | Creates a new stream-collection message. The message is used to announce new #GstStreamCollection |
| new_stream_start | `Message.new_stream_start(src: Object?) -> Message` | gst_message_new_stream_start |  | Create a new stream_start message. This message is generated and posted in the sink elements of a GstBin. The bin will only forward the STREAM_STAR... |
| new_stream_status | `Message.new_stream_status(src: Object?, type: StreamStatusType, owner: Element) -> Message` | gst_message_new_stream_status |  | Create a new stream status message. This message is posted when a streaming thread is created/destroyed or when the state changed. |
| new_streams_selected | `Message.new_streams_selected(src: Object?, collection: StreamCollection) -> Message` | gst_message_new_streams_selected | 1.10 | Creates a new steams-selected message. The message is used to announce that an array of streams has been selected. This is generally in response to... |
| new_structure_change | `Message.new_structure_change(src: Object?, type: StructureChangeType, owner: Element, busy: gboolean) -> Message` | gst_message_new_structure_change |  | Create a new structure change message. This message is posted when the structure of a pipeline is in the process of being changed, for example when... |
| new_tag | `Message.new_tag(src: Object?, tag_list: TagList) -> Message` | gst_message_new_tag |  | Create a new tag message. The message will take ownership of the tag list. The message is posted by elements that discovered a new taglist. |
| new_toc | `Message.new_toc(src: Object?, toc: Toc, updated: gboolean) -> Message` | gst_message_new_toc |  | Create a new TOC message. The message is posted by elements that discovered or updated a TOC. |
| new_warning | `Message.new_warning(src: Object?, error: GLib.Error, debug: utf8) -> Message` | gst_message_new_warning |  | Create a new warning message. The message will make copies of @error and @debug. |
| new_warning_with_details | `Message.new_warning_with_details(src: Object?, error: GLib.Error, debug: utf8, details: Structure?) -> Message` | gst_message_new_warning_with_details | 1.10 | Create a new warning message. The message will make copies of @error and @debug. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| replace | `replace(old_message: inout Message?, new_message: Message?) -> gboolean` | gst_message_replace |  | Modifies a pointer to a #GstMessage to point to a different #GstMessage. The modification is done atomically (so this is useful for ensuring thread... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_redirect_entry | `Message.add_redirect_entry(location: utf8, tag_list: TagList?, entry_struct: Structure?) -> none` | gst_message_add_redirect_entry | 1.10 | Creates and appends a new entry. The specified location string is copied. However, ownership over the tag list and structure are transferred to the... |
| copy | `Message.copy() -> Message` | gst_message_copy |  | Creates a copy of the message. Returns a copy of the message. |
| get_num_redirect_entries | `Message.get_num_redirect_entries() -> gsize` | gst_message_get_num_redirect_entries | 1.10 | the number of entries stored in the message |
| get_seqnum | `Message.get_seqnum() -> guint32` | gst_message_get_seqnum |  | Retrieve the sequence number of a message. Messages have ever-incrementing sequence numbers, which may also be set explicitly via gst_message_set_s... |
| get_stream_status_object | `Message.get_stream_status_object() -> GObject.Value` | gst_message_get_stream_status_object |  | Extracts the object managing the streaming thread from @message. |
| get_structure | `Message.get_structure() -> Structure` | gst_message_get_structure |  | Access the structure of the message. |
| has_name | `Message.has_name(name: utf8) -> gboolean` | gst_message_has_name |  | Checks if @message has the given @name. This function is usually used to check the name of a custom message. |
| parse_async_done | `Message.parse_async_done(running_time: out ClockTime?) -> none` | gst_message_parse_async_done |  | Extract the running_time from the async_done message. MT safe. |
| parse_buffering | `Message.parse_buffering(percent: out gint?) -> none` | gst_message_parse_buffering |  | Extracts the buffering percent from the GstMessage. see also gst_message_new_buffering(). MT safe. |
| parse_buffering_stats | `Message.parse_buffering_stats(mode: out BufferingMode?, avg_in: out gint?, avg_out: out gint?, buffering_left: out gint64?) -> none` | gst_message_parse_buffering_stats |  | Extracts the buffering stats values from @message. |
| parse_clock_lost | `Message.parse_clock_lost(clock: out Clock?) -> none` | gst_message_parse_clock_lost |  | Extracts the lost clock from the GstMessage. The clock object returned remains valid until the message is freed. MT safe. |
| parse_clock_provide | `Message.parse_clock_provide(clock: out Clock?, ready: out gboolean?) -> none` | gst_message_parse_clock_provide |  | Extracts the clock and ready flag from the GstMessage. The clock object returned remains valid until the message is freed. MT safe. |
| parse_context_type | `Message.parse_context_type(context_type: out utf8?) -> gboolean` | gst_message_parse_context_type | 1.2 | Parse a context type from an existing GST_MESSAGE_NEED_CONTEXT message. |
| parse_device_added | `Message.parse_device_added(device: out Device?) -> none` | gst_message_parse_device_added | 1.4 | Parses a device-added message. The device-added message is produced by #GstDeviceProvider or a #GstDeviceMonitor. It announces the appearance of mo... |
| parse_device_changed | `Message.parse_device_changed(device: out Device?, changed_device: out Device?) -> none` | gst_message_parse_device_changed | 1.16 | Parses a device-changed message. The device-changed message is produced by #GstDeviceProvider or a #GstDeviceMonitor. It announces the disappearanc... |
| parse_device_removed | `Message.parse_device_removed(device: out Device?) -> none` | gst_message_parse_device_removed | 1.4 | Parses a device-removed message. The device-removed message is produced by #GstDeviceProvider or a #GstDeviceMonitor. It announces the disappearanc... |
| parse_error | `Message.parse_error(gerror: out GLib.Error?, debug: out utf8?) -> none` | gst_message_parse_error |  | Extracts the GError and debug string from the GstMessage. The values returned in the output arguments are copies; the caller must free them when do... |
| parse_error_details | `Message.parse_error_details(structure: out Structure?) -> none` | gst_message_parse_error_details | 1.10 | Returns the optional details structure, may be NULL if none. The returned structure must not be freed. |
| parse_group_id | `Message.parse_group_id(group_id: out guint?) -> gboolean` | gst_message_parse_group_id | 1.2 | Extract the group from the STREAM_START message. |
| parse_have_context | `Message.parse_have_context(context: out Context?) -> none` | gst_message_parse_have_context | 1.2 | Extract the context from the HAVE_CONTEXT message. MT safe. |
| parse_info | `Message.parse_info(gerror: out GLib.Error?, debug: out utf8?) -> none` | gst_message_parse_info |  | Extracts the GError and debug string from the GstMessage. The values returned in the output arguments are copies; the caller must free them when do... |
| parse_info_details | `Message.parse_info_details(structure: out Structure?) -> none` | gst_message_parse_info_details | 1.10 | Returns the optional details structure, may be NULL if none The returned structure must not be freed. |
| parse_instant_rate_request | `Message.parse_instant_rate_request(rate_multiplier: out gdouble?) -> none` | gst_message_parse_instant_rate_request | 1.18 | Parses the rate_multiplier from the instant-rate-request message. |
| parse_new_clock | `Message.parse_new_clock(clock: out Clock?) -> none` | gst_message_parse_new_clock |  | Extracts the new clock from the GstMessage. The clock object returned remains valid until the message is freed. MT safe. |
| parse_progress | `Message.parse_progress(type: out ProgressType?, code: out utf8?, text: out utf8?) -> none` | gst_message_parse_progress |  | Parses the progress @type, @code and @text. |
| parse_property_notify | `Message.parse_property_notify(object: out Object?, property_name: out utf8?, property_value: out GObject.Value?) -> none` | gst_message_parse_property_notify | 1.10 | Parses a property-notify message. These will be posted on the bus only when set up with gst_element_add_property_notify_watch() or gst_element_add_... |
| parse_qos | `Message.parse_qos(live: out gboolean?, running_time: out guint64?, stream_time: out guint64?, timestamp: out guint64?, duration: out guint64?) -> none` | gst_message_parse_qos |  | Extract the timestamps and live status from the QoS message. The returned values give the running_time, stream_time, timestamp and duration of the ... |
| parse_qos_stats | `Message.parse_qos_stats(format: out Format?, processed: out guint64?, dropped: out guint64?) -> none` | gst_message_parse_qos_stats |  | Extract the QoS stats representing the history of the current continuous pipeline playback period. When @format is @GST_FORMAT_UNDEFINED both @drop... |
| parse_qos_values | `Message.parse_qos_values(jitter: out gint64?, proportion: out gdouble?, quality: out gint?) -> none` | gst_message_parse_qos_values |  | Extract the QoS values that have been calculated/analysed from the QoS data MT safe. |
| parse_redirect_entry | `Message.parse_redirect_entry(entry_index: gsize, location: out utf8?, tag_list: out TagList?, entry_struct: out Structure?) -> none` | gst_message_parse_redirect_entry | 1.10 | Parses the location and/or structure from the entry with the given index. The index must be between 0 and gst_message_get_num_redirect_entries() - ... |
| parse_request_state | `Message.parse_request_state(state: out State?) -> none` | gst_message_parse_request_state |  | Extract the requested state from the request_state message. MT safe. |
| parse_reset_time | `Message.parse_reset_time(running_time: out ClockTime?) -> none` | gst_message_parse_reset_time |  | Extract the running-time from the RESET_TIME message. MT safe. |
| parse_segment_done | `Message.parse_segment_done(format: out Format?, position: out gint64?) -> none` | gst_message_parse_segment_done |  | Extracts the position and format from the segment done message. MT safe. |
| parse_segment_start | `Message.parse_segment_start(format: out Format?, position: out gint64?) -> none` | gst_message_parse_segment_start |  | Extracts the position and format from the segment start message. MT safe. |
| parse_state_changed | `Message.parse_state_changed(oldstate: out State?, newstate: out State?, pending: out State?) -> none` | gst_message_parse_state_changed |  | Extracts the old and new states from the GstMessage. Typical usage of this function might be: \|[<!-- language="C" --> ... switch (GST_MESSAGE_TYPE ... |
| parse_step_done | `Message.parse_step_done(format: out Format?, amount: out guint64?, rate: out gdouble?, flush: out gboolean?, intermediate: out gboolean?, duration: out guint64?, eos: out gboolean?) -> none` | gst_message_parse_step_done |  | Extract the values the step_done message. MT safe. |
| parse_step_start | `Message.parse_step_start(active: out gboolean?, format: out Format?, amount: out guint64?, rate: out gdouble?, flush: out gboolean?, intermediate: out gboolean?) -> none` | gst_message_parse_step_start |  | Extract the values from step_start message. MT safe. |
| parse_stream_collection | `Message.parse_stream_collection(collection: out StreamCollection?) -> none` | gst_message_parse_stream_collection | 1.10 | Parses a stream-collection message. |
| parse_stream_status | `Message.parse_stream_status(type: out StreamStatusType, owner: out Element) -> none` | gst_message_parse_stream_status |  | Extracts the stream status type and owner the GstMessage. The returned owner remains valid for as long as the reference to @message is valid and sh... |
| parse_streams_selected | `Message.parse_streams_selected(collection: out StreamCollection?) -> none` | gst_message_parse_streams_selected | 1.10 | Parses a streams-selected message. |
| parse_structure_change | `Message.parse_structure_change(type: out StructureChangeType, owner: out Element?, busy: out gboolean?) -> none` | gst_message_parse_structure_change |  | Extracts the change type and completion status from the GstMessage. MT safe. |
| parse_tag | `Message.parse_tag(tag_list: out TagList) -> none` | gst_message_parse_tag |  | Extracts the tag list from the GstMessage. The tag list returned in the output argument is a copy; the caller must free it when done. Typical usage... |
| parse_toc | `Message.parse_toc(toc: out Toc, updated: out gboolean) -> none` | gst_message_parse_toc |  | Extract the TOC from the #GstMessage. The TOC returned in the output argument is a copy; the caller must free it with gst_toc_unref() when done. MT... |
| parse_warning | `Message.parse_warning(gerror: out GLib.Error?, debug: out utf8?) -> none` | gst_message_parse_warning |  | Extracts the GError and debug string from the GstMessage. The values returned in the output arguments are copies; the caller must free them when do... |
| parse_warning_details | `Message.parse_warning_details(structure: out Structure?) -> none` | gst_message_parse_warning_details | 1.10 | Returns the optional details structure, may be NULL if none The returned structure must not be freed. |
| set_buffering_stats | `Message.set_buffering_stats(mode: BufferingMode, avg_in: gint, avg_out: gint, buffering_left: gint64) -> none` | gst_message_set_buffering_stats |  | Configures the buffering stats values in @message. |
| set_group_id | `Message.set_group_id(group_id: guint) -> none` | gst_message_set_group_id | 1.2 | Sets the group id on the stream-start message. All streams that have the same group id are supposed to be played together, i.e. all streams inside ... |
| set_qos_stats | `Message.set_qos_stats(format: Format, processed: guint64, dropped: guint64) -> none` | gst_message_set_qos_stats |  | Set the QoS stats representing the history of the current continuous pipeline playback period. When @format is @GST_FORMAT_UNDEFINED both @dropped ... |
| set_qos_values | `Message.set_qos_values(jitter: gint64, proportion: gdouble, quality: gint) -> none` | gst_message_set_qos_values |  | Set the QoS values that have been calculated/analysed from the QoS data MT safe. |
| set_seqnum | `Message.set_seqnum(seqnum: guint32) -> none` | gst_message_set_seqnum |  | Set the sequence number of a message. This function might be called by the creator of a message to indicate that the message relates to other messa... |
| set_stream_status_object | `Message.set_stream_status_object(object: GObject.Value) -> none` | gst_message_set_stream_status_object |  | Configures the object handling the streaming thread. This is usually a GstTask object but other objects might be added in the future. |
| streams_selected_add | `Message.streams_selected_add(stream: Stream) -> none` | gst_message_streams_selected_add | 1.10 | Adds the @stream to the @message. |
| streams_selected_get_size | `Message.streams_selected_get_size() -> guint` | gst_message_streams_selected_get_size | 1.10 | Returns the number of streams contained in the @message. |
| streams_selected_get_stream | `Message.streams_selected_get_stream(idx: guint) -> Stream` | gst_message_streams_selected_get_stream | 1.10 | Retrieves the #GstStream with index @index from the @message. |
| writable_structure | `Message.writable_structure() -> Structure` | gst_message_writable_structure | 1.14 | Get a writable version of the structure. |

### Gst.Meta

C type: `GstMeta`

The #GstMeta structure should be included as the first member of a #GstBuffer metadata structure. The structure defines the API of the metadata and...

#### Fields

| Field | Type |
| --- | --- |
| flags | MetaFlags |
| info | MetaInfo |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| api_type_get_tags | `api_type_get_tags(api: GType) -> utf8` | gst_meta_api_type_get_tags | 1.2 | an array of tags as strings. |
| api_type_has_tag | `api_type_has_tag(api: GType, tag: GLib.Quark) -> gboolean` | gst_meta_api_type_has_tag |  | Check if @api was registered with @tag. |
| api_type_register | `api_type_register(api: utf8, tags: utf8) -> GType` | gst_meta_api_type_register |  | Register and return a GType for the @api and associate it with @tags. |
| deserialize | `deserialize(buffer: Buffer, data: guint8, size: gsize, consumed: out guint32) -> Meta` | gst_meta_deserialize | 1.24 | Recreate a #GstMeta from serialized data returned by gst_meta_serialize() and add it to @buffer. Note that the meta must have been previously regis... |
| get_info | `get_info(impl: utf8) -> MetaInfo` | gst_meta_get_info |  | Lookup a previously registered meta info structure by its implementation name @impl. |
| register | `register(api: GType, impl: utf8, size: gsize, init_func: MetaInitFunction, free_func: MetaFreeFunction, transform_func: MetaTransformFunction) -> MetaInfo` | gst_meta_register |  | Register a new #GstMeta implementation. The same @info can be retrieved later with gst_meta_get_info() by using @impl as the key. |
| register_custom | `register_custom(name: utf8, tags: utf8, transform_func: CustomMetaTransformFunction?, user_data: gpointer?, destroy_data: GLib.DestroyNotify) -> MetaInfo` | gst_meta_register_custom | 1.20 | Register a new custom #GstMeta implementation, backed by an opaque structure holding a #GstStructure. The registered info can be retrieved later wi... |
| register_custom_simple | `register_custom_simple(name: utf8) -> MetaInfo` | gst_meta_register_custom_simple | 1.24 | Simplified version of gst_meta_register_custom(), with no tags and no transform function. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| compare_seqnum | `Meta.compare_seqnum(meta2: Meta) -> gint` | gst_meta_compare_seqnum | 1.16 | Meta sequence number compare function. Can be used as #GCompareFunc or a #GCompareDataFunc. |
| get_seqnum | `Meta.get_seqnum() -> guint64` | gst_meta_get_seqnum | 1.16 | Gets seqnum for this meta. |
| serialize | `Meta.serialize(data: ByteArrayInterface) -> gboolean` | gst_meta_serialize | 1.24 | Serialize @meta into a format that can be stored or transmitted and later deserialized by gst_meta_deserialize(). This is only supported for meta t... |
| serialize_simple | `Meta.serialize_simple(data: guint8) -> gboolean` | gst_meta_serialize_simple | 1.24 | Same as gst_meta_serialize() but with a #GByteArray instead of #GstByteArrayInterface. |

### Gst.MetaInfo

C type: `GstMetaInfo`

The #GstMetaInfo provides information about a specific metadata structure.

#### Fields

| Field | Type |
| --- | --- |
| api | GType |
| clear_func | MetaClearFunction |
| deserialize_func | MetaDeserializeFunction |
| free_func | MetaFreeFunction |
| init_func | MetaInitFunction |
| serialize_func | MetaSerializeFunction |
| size | gsize |
| transform_func | MetaTransformFunction |
| type | GType |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(api: GType, impl: utf8, size: gsize) -> MetaInfo` | gst_meta_info_new | 1.24 | Creates a new structure that needs to be filled before being registered. This structure should filled and then registered with gst_meta_info_regist... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| is_custom | `MetaInfo.is_custom() -> gboolean` | gst_meta_info_is_custom | 1.20 | whether @info was registered as a #GstCustomMeta with gst_meta_register_custom() |
| register | `MetaInfo.register() -> MetaInfo` | gst_meta_info_register | 1.24 | Registers a new meta. Use the structure returned by gst_meta_info_new(), it consumes it and the structure shouldnt be used after. The one returned ... |

### Gst.MetaTransformCopy

C type: `GstMetaTransformCopy`

Extra data passed to a "gst-copy" transform #GstMetaTransformFunction.

#### Fields

| Field | Type |
| --- | --- |
| offset | gsize |
| region | gboolean |
| size | gsize |

### Gst.MiniObject

GType: `GstMiniObject` ?? C type: `GstMiniObject`

#GstMiniObject is a simple structure that can be used to implement refcounted types. Subclasses will include #GstMiniObject as the first member in ...

#### Fields

| Field | Type |
| --- | --- |
| copy | MiniObjectCopyFunction |
| dispose | MiniObjectDisposeFunction |
| flags | guint |
| free | MiniObjectFreeFunction |
| lockstate | gint |
| priv_pointer | gpointer |
| priv_uint | guint |
| refcount | gint |
| type | GType |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| replace | `replace(olddata: inout MiniObject?, newdata: MiniObject?) -> gboolean` | gst_mini_object_replace |  | Atomically modifies a pointer to point to a new mini-object. The reference count of @olddata is decreased and the reference count of @newdata is in... |
| steal | `steal(olddata: inout MiniObject) -> MiniObject` | gst_mini_object_steal |  | Replace the current #GstMiniObject pointer to by @olddata with %NULL and return the old value. |
| take | `take(olddata: inout MiniObject, newdata: MiniObject) -> gboolean` | gst_mini_object_take |  | Modifies a pointer to point to a new mini-object. The modification is done atomically. This version is similar to gst_mini_object_replace() except ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_parent | `MiniObject.add_parent(parent: MiniObject) -> none` | gst_mini_object_add_parent | 1.16 | This adds @parent as a parent for @object. Having one ore more parents affects the writability of @object: if a @parent is not writable, @object is... |
| copy | `MiniObject.copy() -> MiniObject` | gst_mini_object_copy |  | Creates a copy of the mini-object. MT safe |
| get_qdata | `MiniObject.get_qdata(quark: GLib.Quark) -> gpointer` | gst_mini_object_get_qdata |  | This function gets back user data pointers stored via gst_mini_object_set_qdata(). |
| init | `MiniObject.init(flags: guint, type: GType, copy_func: MiniObjectCopyFunction?, dispose_func: MiniObjectDisposeFunction?, free_func: MiniObjectFreeFunction?) -> none` | gst_mini_object_init |  | Initializes a mini-object with the desired type and copy/dispose/free functions. |
| is_writable | `MiniObject.is_writable() -> gboolean` | gst_mini_object_is_writable |  | If @mini_object has the LOCKABLE flag set, check if the current EXCLUSIVE lock on @object is the only one, this means that changes to the object wi... |
| lock | `MiniObject.lock(flags: LockFlags) -> gboolean` | gst_mini_object_lock |  | Lock the mini-object with the specified access mode in @flags. |
| make_writable | `MiniObject.make_writable() -> MiniObject` | gst_mini_object_make_writable |  | Checks if a mini-object is writable. If not, a writable copy is made and returned. This gives away the reference to the original mini object, and r... |
| ref | `MiniObject.ref() -> MiniObject` | gst_mini_object_ref |  | Increase the reference count of the mini-object. Note that the refcount affects the writability of @mini-object, see gst_mini_object_is_writable().... |
| remove_parent | `MiniObject.remove_parent(parent: MiniObject) -> none` | gst_mini_object_remove_parent | 1.16 | This removes @parent as a parent for @object. See gst_mini_object_add_parent(). |
| set_qdata | `MiniObject.set_qdata(quark: GLib.Quark, data: gpointer?, destroy: GLib.DestroyNotify) -> none` | gst_mini_object_set_qdata |  | This sets an opaque, named pointer on a miniobject. The name is specified through a #GQuark (retrieved e.g. via g_quark_from_static_string()), and ... |
| steal_qdata | `MiniObject.steal_qdata(quark: GLib.Quark) -> gpointer` | gst_mini_object_steal_qdata |  | This function gets back user data pointers stored via gst_mini_object_set_qdata() and removes the data from @object without invoking its `destroy()... |
| unlock | `MiniObject.unlock(flags: LockFlags) -> none` | gst_mini_object_unlock |  | Unlock the mini-object with the specified access mode in @flags. |
| unref | `MiniObject.unref() -> none` | gst_mini_object_unref |  | Decreases the reference count of the mini-object, possibly freeing the mini-object. |
| weak_ref | `MiniObject.weak_ref(notify: MiniObjectNotify, data: gpointer?) -> none` | gst_mini_object_weak_ref |  | Adds a weak reference callback to a mini object. Weak references are used for notification when a mini object is finalized. They are called "weak r... |
| weak_unref | `MiniObject.weak_unref(notify: MiniObjectNotify, data: gpointer?) -> none` | gst_mini_object_weak_unref |  | Removes a weak reference callback from a mini object. |

### Gst.ObjectClass

C type: `GstObjectClass`

GStreamer base object class.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| deep_notify | none |
| parent_class | GObject.InitiallyUnownedClass |
| path_string_separator | utf8 |

### Gst.PadClass

C type: `GstPadClass`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| linked | none |
| parent_class | ObjectClass |
| unlinked | none |

### Gst.PadPrivate

C type: `GstPadPrivate`

### Gst.PadProbeInfo

C type: `GstPadProbeInfo`

Info passed in the #GstPadProbeCallback.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| data | gpointer |
| flow_ret | FlowReturn |
| id | gulong |
| offset | guint64 |
| size | guint |
| type | PadProbeType |

### Gst.PadTemplateClass

C type: `GstPadTemplateClass`

a #GstPadTemplate that has been created

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| pad_created | none |
| parent_class | ObjectClass |

### Gst.ParamSpecArray

C type: `GstParamSpecArray`

A GParamSpec derived structure for arrays of values.

#### Fields

| Field | Type |
| --- | --- |
| element_spec | GObject.ParamSpec |
| parent_instance | GObject.ParamSpec |

### Gst.ParamSpecFraction

C type: `GstParamSpecFraction`

A GParamSpec derived structure that contains the meta data for fractional properties.

#### Fields

| Field | Type |
| --- | --- |
| def_den | gint |
| def_num | gint |
| max_den | gint |
| max_num | gint |
| min_den | gint |
| min_num | gint |
| parent_instance | GObject.ParamSpec |

### Gst.ParentBufferMeta

C type: `GstParentBufferMeta`

The #GstParentBufferMeta is a #GstMeta which can be attached to a #GstBuffer to hold a reference to another buffer that is only released when the c...

#### Fields

| Field | Type |
| --- | --- |
| buffer | Buffer |
| parent | Meta |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_info | `get_info() -> MetaInfo` | gst_parent_buffer_meta_get_info | 1.6 | Gets the global #GstMetaInfo describing the #GstParentBufferMeta meta. |

### Gst.ParseContext

GType: `GstParseContext` ?? C type: `GstParseContext`

Opaque structure.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ParseContext.new() -> ParseContext` | gst_parse_context_new |  | Allocates a parse context for use with gst_parse_launch_full() or gst_parse_launchv_full(). Free-function: gst_parse_context_free |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `ParseContext.copy() -> ParseContext` | gst_parse_context_copy | 1.12.1 | Copies the @context. |
| free | `ParseContext.free() -> none` | gst_parse_context_free |  | Frees a parse context previously allocated with gst_parse_context_new(). |
| get_missing_elements | `ParseContext.get_missing_elements() -> utf8` | gst_parse_context_get_missing_elements |  | Retrieve missing elements from a previous run of gst_parse_launch_full() or gst_parse_launchv_full(). Will only return results if an error code of ... |

### Gst.PipelineClass

C type: `GstPipelineClass`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | BinClass |

### Gst.PipelinePrivate

C type: `GstPipelinePrivate`

### Gst.PluginClass

C type: `GstPluginClass`

### Gst.PluginDesc

C type: `GstPluginDesc`

A plugin should export a variable of this type called plugin_desc. The plugin loader will use the data provided there to initialize the plugin. The...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| description | utf8 |
| license | utf8 |
| major_version | gint |
| minor_version | gint |
| name | utf8 |
| origin | utf8 |
| package | utf8 |
| plugin_init | PluginInitFunc |
| release_datetime | utf8 |
| source | utf8 |
| version | utf8 |

### Gst.PluginFeatureClass

C type: `GstPluginFeatureClass`

### Gst.Poll

C type: `GstPoll`

A #GstPoll keeps track of file descriptors much like fd_set (used with select ()) or a struct pollfd array (used with poll ()). Once created with g...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(controllable: gboolean) -> Poll` | gst_poll_new |  | Create a new file descriptor set. If @controllable, it is possible to restart or flush a call to gst_poll_wait() with gst_poll_restart() and gst_po... |
| new_timer | `new_timer() -> Poll` | gst_poll_new_timer |  | Create a new poll object that can be used for scheduling cancellable timeouts. A timeout is performed with gst_poll_wait(). Multiple timeouts can b... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_fd | `Poll.add_fd(fd: PollFD) -> gboolean` | gst_poll_add_fd |  | Add a file descriptor to the file descriptor set. |
| fd_can_read | `Poll.fd_can_read(fd: PollFD) -> gboolean` | gst_poll_fd_can_read |  | Check if @fd in @set has data to be read. |
| fd_can_write | `Poll.fd_can_write(fd: PollFD) -> gboolean` | gst_poll_fd_can_write |  | Check if @fd in @set can be used for writing. |
| fd_ctl_pri | `Poll.fd_ctl_pri(fd: PollFD, active: gboolean) -> gboolean` | gst_poll_fd_ctl_pri | 1.16 | Control whether the descriptor @fd in @set will be monitored for exceptional conditions (POLLPRI). Not implemented on Windows (will just return %FA... |
| fd_ctl_read | `Poll.fd_ctl_read(fd: PollFD, active: gboolean) -> gboolean` | gst_poll_fd_ctl_read |  | Control whether the descriptor @fd in @set will be monitored for readability. |
| fd_ctl_write | `Poll.fd_ctl_write(fd: PollFD, active: gboolean) -> gboolean` | gst_poll_fd_ctl_write |  | Control whether the descriptor @fd in @set will be monitored for writability. |
| fd_has_closed | `Poll.fd_has_closed(fd: PollFD) -> gboolean` | gst_poll_fd_has_closed |  | Check if @fd in @set has closed the connection. |
| fd_has_error | `Poll.fd_has_error(fd: PollFD) -> gboolean` | gst_poll_fd_has_error |  | Check if @fd in @set has an error. |
| fd_has_pri | `Poll.fd_has_pri(fd: PollFD) -> gboolean` | gst_poll_fd_has_pri | 1.16 | Check if @fd in @set has an exceptional condition (POLLPRI). Not implemented on Windows (will just return %FALSE there). |
| fd_ignored | `Poll.fd_ignored(fd: PollFD) -> none` | gst_poll_fd_ignored |  | Mark @fd as ignored so that the next call to gst_poll_wait() will yield the same result for @fd as last time. This function must be called if no op... |
| free | `Poll.free() -> none` | gst_poll_free |  | Free a file descriptor set. |
| get_read_gpollfd | `Poll.get_read_gpollfd(fd: GLib.PollFD) -> none` | gst_poll_get_read_gpollfd |  | Get a GPollFD for the reading part of the control socket. This is useful when integrating with a GSource and GMainLoop. |
| read_control | `Poll.read_control() -> gboolean` | gst_poll_read_control |  | Read a byte from the control socket of the controllable @set. This function only works for timer #GstPoll objects created with gst_poll_new_timer(). |
| remove_fd | `Poll.remove_fd(fd: PollFD) -> gboolean` | gst_poll_remove_fd |  | Remove a file descriptor from the file descriptor set. |
| restart | `Poll.restart() -> none` | gst_poll_restart |  | Restart any gst_poll_wait() that is in progress. This function is typically used after adding or removing descriptors to @set. If @set is not contr... |
| set_controllable | `Poll.set_controllable(controllable: gboolean) -> gboolean` | gst_poll_set_controllable |  | When @controllable is %TRUE, this function ensures that future calls to gst_poll_wait() will be affected by gst_poll_restart() and gst_poll_set_flu... |
| set_flushing | `Poll.set_flushing(flushing: gboolean) -> none` | gst_poll_set_flushing |  | When @flushing is %TRUE, this function ensures that current and future calls to gst_poll_wait() will return -1, with errno set to EBUSY. Unsetting ... |
| wait | `Poll.wait(timeout: ClockTime) -> gint` | gst_poll_wait |  | Wait for activity on the file descriptors in @set. This function waits up to the specified @timeout. A timeout of #GST_CLOCK_TIME_NONE waits foreve... |
| write_control | `Poll.write_control() -> gboolean` | gst_poll_write_control |  | Write a byte to the control socket of the controllable @set. This function is mostly useful for timer #GstPoll objects created with gst_poll_new_ti... |

### Gst.PollFD

C type: `GstPollFD`

A file descriptor object.

#### Fields

| Field | Type |
| --- | --- |
| fd | gint |
| idx | gint |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| init | `PollFD.init() -> none` | gst_poll_fd_init |  | Initializes @fd. Alternatively you can initialize it with #GST_POLL_FD_INIT. |

### Gst.PresetInterface

C type: `GstPresetInterface`

#GstPreset interface.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| delete_preset | gboolean |
| get_meta | gboolean |
| get_preset_names | utf8 |
| get_property_names | utf8 |
| load_preset | gboolean |
| parent | GObject.TypeInterface |
| rename_preset | gboolean |
| save_preset | gboolean |
| set_meta | gboolean |

### Gst.Promise

GType: `GstPromise` ?? C type: `GstPromise`

The #GstPromise object implements the container for values that may be available later. i.e. a Future or a Promise in <https://en.wikipedia.org/wik...

#### Fields

| Field | Type |
| --- | --- |
| parent | MiniObject |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Promise.new() -> Promise` | gst_promise_new | 1.14 | a new #GstPromise |
| new_with_change_func | `Promise.new_with_change_func(func: PromiseChangeFunc, user_data: gpointer?, notify: GLib.DestroyNotify) -> Promise` | gst_promise_new_with_change_func | 1.14 | @func will be called exactly once when transitioning out of %GST_PROMISE_RESULT_PENDING into any of the other #GstPromiseResult states. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| expire | `Promise.expire() -> none` | gst_promise_expire | 1.14 | Expire a @promise. This will wake up any waiters with %GST_PROMISE_RESULT_EXPIRED. Called by a message loop when the parent message is handled and/... |
| get_reply | `Promise.get_reply() -> Structure` | gst_promise_get_reply | 1.14 | Retrieve the reply set on @promise. @promise must be in %GST_PROMISE_RESULT_REPLIED and the returned structure is owned by @promise |
| interrupt | `Promise.interrupt() -> none` | gst_promise_interrupt | 1.14 | Interrupt waiting for a @promise. This will wake up any waiters with %GST_PROMISE_RESULT_INTERRUPTED. Called when the consumer does not want the va... |
| reply | `Promise.reply(s: Structure?) -> none` | gst_promise_reply | 1.14 | Set a reply on @promise. This will wake up any waiters with %GST_PROMISE_RESULT_REPLIED. Called by the producer of the value to indicate success (o... |
| wait | `Promise.wait() -> PromiseResult` | gst_promise_wait | 1.14 | Wait for @promise to move out of the %GST_PROMISE_RESULT_PENDING state. If @promise is not in %GST_PROMISE_RESULT_PENDING then it will return immed... |

### Gst.ProtectionMeta

C type: `GstProtectionMeta`

Metadata type that holds information about a sample from a protection-protected track, including the information needed to decrypt it (if it is enc...

#### Fields

| Field | Type |
| --- | --- |
| info | Structure |
| meta | Meta |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_info | `get_info() -> MetaInfo` | gst_protection_meta_get_info |  |  |

### Gst.ProxyPadClass

C type: `GstProxyPadClass`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | PadClass |

### Gst.ProxyPadPrivate

C type: `GstProxyPadPrivate`

### Gst.Query

GType: `GstQuery` ?? C type: `GstQuery`

Queries can be performed on pads (gst_pad_query()) and elements (gst_element_query()). Please note that some queries might need a running pipeline ...

#### Fields

| Field | Type |
| --- | --- |
| mini_object | MiniObject |
| type | QueryType |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_accept_caps | `Query.new_accept_caps(caps: Caps) -> Query` | gst_query_new_accept_caps |  | Constructs a new query object for querying if @caps are accepted. Free-function: gst_query_unref() |
| new_allocation | `Query.new_allocation(caps: Caps?, need_pool: gboolean) -> Query` | gst_query_new_allocation |  | Constructs a new query object for querying the allocation properties. Free-function: gst_query_unref() |
| new_bitrate | `Query.new_bitrate() -> Query` | gst_query_new_bitrate | 1.16 | Constructs a new query object for querying the bitrate. Free-function: gst_query_unref() |
| new_buffering | `Query.new_buffering(format: Format) -> Query` | gst_query_new_buffering |  | Constructs a new query object for querying the buffering status of a stream. Free-function: gst_query_unref() |
| new_caps | `Query.new_caps(filter: Caps) -> Query` | gst_query_new_caps |  | Constructs a new query object for querying the caps. The CAPS query should return the allowable caps for a pad in the context of the element's stat... |
| new_context | `Query.new_context(context_type: utf8) -> Query` | gst_query_new_context | 1.2 | Constructs a new query object for querying the pipeline-local context. Free-function: gst_query_unref() |
| new_convert | `Query.new_convert(src_format: Format, value: gint64, dest_format: Format) -> Query` | gst_query_new_convert |  | Constructs a new convert query object. Use gst_query_unref() when done with it. A convert query is used to ask for a conversion between one format ... |
| new_custom | `Query.new_custom(type: QueryType, structure: Structure?) -> Query` | gst_query_new_custom |  | Constructs a new custom query object. Use gst_query_unref() when done with it. Free-function: gst_query_unref() |
| new_drain | `Query.new_drain() -> Query` | gst_query_new_drain |  | Constructs a new query object for querying the drain state. Free-function: gst_query_unref() |
| new_duration | `Query.new_duration(format: Format) -> Query` | gst_query_new_duration |  | Constructs a new stream duration query object to query in the given format. Use gst_query_unref() when done with it. A duration query will give the... |
| new_formats | `Query.new_formats() -> Query` | gst_query_new_formats |  | Constructs a new query object for querying formats of the stream. Free-function: gst_query_unref() |
| new_latency | `Query.new_latency() -> Query` | gst_query_new_latency |  | Constructs a new latency query object. Use gst_query_unref() when done with it. A latency query is usually performed by sinks to compensate for add... |
| new_position | `Query.new_position(format: Format) -> Query` | gst_query_new_position |  | Constructs a new query stream position query object. Use gst_query_unref() when done with it. A position query is used to query the current positio... |
| new_scheduling | `Query.new_scheduling() -> Query` | gst_query_new_scheduling |  | Constructs a new query object for querying the scheduling properties. Free-function: gst_query_unref() |
| new_seeking | `Query.new_seeking(format: Format) -> Query` | gst_query_new_seeking |  | Constructs a new query object for querying seeking properties of the stream. Free-function: gst_query_unref() |
| new_segment | `Query.new_segment(format: Format) -> Query` | gst_query_new_segment |  | Constructs a new segment query object. Use gst_query_unref() when done with it. A segment query is used to discover information about the currently... |
| new_selectable | `Query.new_selectable() -> Query` | gst_query_new_selectable | 1.22 | Constructs a new query object for querying the stream selection capability. Free-function: gst_query_unref() |
| new_uri | `Query.new_uri() -> Query` | gst_query_new_uri |  | Constructs a new query URI query object. Use gst_query_unref() when done with it. An URI query is used to query the current URI that is used by the... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_allocation_meta | `Query.add_allocation_meta(api: GType, params: Structure?) -> none` | gst_query_add_allocation_meta |  | Add @api with @params as one of the supported metadata API to @query. |
| add_allocation_param | `Query.add_allocation_param(allocator: Allocator?, params: AllocationParams?) -> none` | gst_query_add_allocation_param |  | Add @allocator and its @params as a supported memory allocator. |
| add_allocation_pool | `Query.add_allocation_pool(pool: BufferPool?, size: guint, min_buffers: guint, max_buffers: guint) -> none` | gst_query_add_allocation_pool |  | Set the pool parameters in @query. |
| add_buffering_range | `Query.add_buffering_range(start: gint64, stop: gint64) -> gboolean` | gst_query_add_buffering_range |  | Set the buffering-ranges array field in @query. The current last start position of the array should be inferior to @start. |
| add_scheduling_mode | `Query.add_scheduling_mode(mode: PadMode) -> none` | gst_query_add_scheduling_mode |  | Add @mode as one of the supported scheduling modes to @query. |
| find_allocation_meta | `Query.find_allocation_meta(api: GType, index: out guint?) -> gboolean` | gst_query_find_allocation_meta |  | Check if @query has metadata @api set. When this function returns %TRUE, @index will contain the index where the requested API and the parameters c... |
| get_n_allocation_metas | `Query.get_n_allocation_metas() -> guint` | gst_query_get_n_allocation_metas |  | Retrieve the number of values currently stored in the meta API array of the query's structure. |
| get_n_allocation_params | `Query.get_n_allocation_params() -> guint` | gst_query_get_n_allocation_params |  | Retrieve the number of values currently stored in the allocator params array of the query's structure. If no memory allocator is specified, the dow... |
| get_n_allocation_pools | `Query.get_n_allocation_pools() -> guint` | gst_query_get_n_allocation_pools |  | Retrieve the number of values currently stored in the pool array of the query's structure. |
| get_n_buffering_ranges | `Query.get_n_buffering_ranges() -> guint` | gst_query_get_n_buffering_ranges |  | Retrieve the number of values currently stored in the buffered-ranges array of the query's structure. |
| get_n_scheduling_modes | `Query.get_n_scheduling_modes() -> guint` | gst_query_get_n_scheduling_modes |  | Retrieve the number of values currently stored in the scheduling mode array of the query's structure. |
| get_structure | `Query.get_structure() -> Structure` | gst_query_get_structure |  | Get the structure of a query. |
| has_scheduling_mode | `Query.has_scheduling_mode(mode: PadMode) -> gboolean` | gst_query_has_scheduling_mode |  | Check if @query has scheduling mode set. > When checking if upstream supports pull mode, it is usually not > enough to just check for GST_PAD_MODE_... |
| has_scheduling_mode_with_flags | `Query.has_scheduling_mode_with_flags(mode: PadMode, flags: SchedulingFlags) -> gboolean` | gst_query_has_scheduling_mode_with_flags |  | Check if @query has scheduling mode set and @flags is set in query scheduling flags. |
| parse_accept_caps | `Query.parse_accept_caps(caps: out Caps) -> none` | gst_query_parse_accept_caps |  | Get the caps from @query. The caps remains valid as long as @query remains valid. |
| parse_accept_caps_result | `Query.parse_accept_caps_result(result: out gboolean?) -> none` | gst_query_parse_accept_caps_result |  | Parse the result from @query and store in @result. |
| parse_allocation | `Query.parse_allocation(caps: out Caps?, need_pool: out gboolean?) -> none` | gst_query_parse_allocation |  | Parse an allocation query, writing the requested caps in @caps and whether a pool is needed in @need_pool, if the respective parameters are non-%NU... |
| parse_bitrate | `Query.parse_bitrate(nominal_bitrate: out guint?) -> none` | gst_query_parse_bitrate | 1.16 | Get the results of a bitrate query. See also gst_query_set_bitrate(). |
| parse_buffering_percent | `Query.parse_buffering_percent(busy: out gboolean?, percent: out gint?) -> none` | gst_query_parse_buffering_percent |  | Get the percentage of buffered data. This is a value between 0 and 100. The @busy indicator is %TRUE when the buffering is in progress. |
| parse_buffering_range | `Query.parse_buffering_range(format: out Format?, start: out gint64?, stop: out gint64?, estimated_total: out gint64?) -> none` | gst_query_parse_buffering_range |  | Parse an available query, writing the format into @format, and other results into the passed parameters, if the respective parameters are non-%NULL |
| parse_buffering_stats | `Query.parse_buffering_stats(mode: out BufferingMode?, avg_in: out gint?, avg_out: out gint?, buffering_left: out gint64?) -> none` | gst_query_parse_buffering_stats |  | Extracts the buffering stats values from @query. |
| parse_caps | `Query.parse_caps(filter: out Caps) -> none` | gst_query_parse_caps |  | Get the filter from the caps @query. The caps remains valid as long as @query remains valid. |
| parse_caps_result | `Query.parse_caps_result(caps: out Caps?) -> none` | gst_query_parse_caps_result |  | Get the caps result from @query. The caps remains valid as long as @query remains valid. |
| parse_context | `Query.parse_context(context: out Context?) -> none` | gst_query_parse_context | 1.2 | Get the context from the context @query. The context remains valid as long as @query remains valid. |
| parse_context_type | `Query.parse_context_type(context_type: out utf8?) -> gboolean` | gst_query_parse_context_type | 1.2 | Parse a context type from an existing GST_QUERY_CONTEXT query. |
| parse_convert | `Query.parse_convert(src_format: out Format?, src_value: out gint64?, dest_format: out Format?, dest_value: out gint64?) -> none` | gst_query_parse_convert |  | Parse a convert query answer. Any of @src_format, @src_value, @dest_format, and @dest_value may be %NULL, in which case that value is omitted. |
| parse_duration | `Query.parse_duration(format: out Format?, duration: out gint64?) -> none` | gst_query_parse_duration |  | Parse a duration query answer. Write the format of the duration into @format, and the value into @duration, if the respective variables are non-%NULL. |
| parse_latency | `Query.parse_latency(live: out gboolean?, min_latency: out ClockTime?, max_latency: out ClockTime?) -> none` | gst_query_parse_latency |  | Parse a latency query answer. |
| parse_n_formats | `Query.parse_n_formats(n_formats: out guint?) -> none` | gst_query_parse_n_formats |  | Parse the number of formats in the formats @query. |
| parse_nth_allocation_meta | `Query.parse_nth_allocation_meta(index: guint, params: out Structure?) -> GType` | gst_query_parse_nth_allocation_meta |  | Parse an available query and get the metadata API at @index of the metadata API array. |
| parse_nth_allocation_param | `Query.parse_nth_allocation_param(index: guint, allocator: out Allocator?, params: out AllocationParams?) -> none` | gst_query_parse_nth_allocation_param |  | Parse an available query and get the allocator and its params at @index of the allocator array. |
| parse_nth_allocation_pool | `Query.parse_nth_allocation_pool(index: guint, pool: out BufferPool?, size: out guint?, min_buffers: out guint?, max_buffers: out guint?) -> none` | gst_query_parse_nth_allocation_pool |  | Get the pool parameters in @query. Unref @pool with gst_object_unref() when it's not needed any more. |
| parse_nth_buffering_range | `Query.parse_nth_buffering_range(index: guint, start: out gint64?, stop: out gint64?) -> gboolean` | gst_query_parse_nth_buffering_range |  | Parse an available query and get the start and stop values stored at the @index of the buffered ranges array. |
| parse_nth_format | `Query.parse_nth_format(nth: guint, format: out Format?) -> none` | gst_query_parse_nth_format |  | Parse the format query and retrieve the @nth format from it into @format. If the list contains less elements than @nth, @format will be set to GST_... |
| parse_nth_scheduling_mode | `Query.parse_nth_scheduling_mode(index: guint) -> PadMode` | gst_query_parse_nth_scheduling_mode |  | Parse an available query and get the scheduling mode at @index of the scheduling modes array. |
| parse_position | `Query.parse_position(format: out Format?, cur: out gint64?) -> none` | gst_query_parse_position |  | Parse a position query, writing the format into @format, and the position into @cur, if the respective parameters are non-%NULL. |
| parse_scheduling | `Query.parse_scheduling(flags: out SchedulingFlags?, minsize: out gint?, maxsize: out gint?, align: out gint?) -> none` | gst_query_parse_scheduling |  | Set the scheduling properties. |
| parse_seeking | `Query.parse_seeking(format: out Format?, seekable: out gboolean?, segment_start: out gint64?, segment_end: out gint64?) -> none` | gst_query_parse_seeking |  | Parse a seeking query, writing the format into @format, and other results into the passed parameters, if the respective parameters are non-%NULL |
| parse_segment | `Query.parse_segment(rate: out gdouble?, format: out Format?, start_value: out gint64?, stop_value: out gint64?) -> none` | gst_query_parse_segment |  | Parse a segment query answer. Any of @rate, @format, @start_value, and @stop_value may be %NULL, which will cause this value to be omitted. See gst... |
| parse_selectable | `Query.parse_selectable(selectable: out gboolean?) -> none` | gst_query_parse_selectable | 1.22 | Get the results of a selectable query. See also gst_query_set_selectable(). |
| parse_uri | `Query.parse_uri(uri: out utf8?) -> none` | gst_query_parse_uri |  | Parse an URI query, writing the URI into @uri as a newly allocated string, if the respective parameters are non-%NULL. Free the string with g_free(... |
| parse_uri_redirection | `Query.parse_uri_redirection(uri: out utf8?) -> none` | gst_query_parse_uri_redirection | 1.2 | Parse an URI query, writing the URI into @uri as a newly allocated string, if the respective parameters are non-%NULL. Free the string with g_free(... |
| parse_uri_redirection_permanent | `Query.parse_uri_redirection_permanent(permanent: out gboolean?) -> none` | gst_query_parse_uri_redirection_permanent | 1.4 | Parse an URI query, and set @permanent to %TRUE if there is a redirection and it should be considered permanent. If a redirection is permanent, app... |
| remove_nth_allocation_meta | `Query.remove_nth_allocation_meta(index: guint) -> none` | gst_query_remove_nth_allocation_meta |  | Remove the metadata API at @index of the metadata API array. |
| remove_nth_allocation_param | `Query.remove_nth_allocation_param(index: guint) -> none` | gst_query_remove_nth_allocation_param | 1.2 | Remove the allocation param at @index of the allocation param array. |
| remove_nth_allocation_pool | `Query.remove_nth_allocation_pool(index: guint) -> none` | gst_query_remove_nth_allocation_pool | 1.2 | Remove the allocation pool at @index of the allocation pool array. |
| set_accept_caps_result | `Query.set_accept_caps_result(result: gboolean) -> none` | gst_query_set_accept_caps_result |  | Set @result as the result for the @query. |
| set_bitrate | `Query.set_bitrate(nominal_bitrate: guint) -> none` | gst_query_set_bitrate | 1.16 | Set the results of a bitrate query. The nominal bitrate is the average bitrate expected over the length of the stream as advertised in file headers... |
| set_buffering_percent | `Query.set_buffering_percent(busy: gboolean, percent: gint) -> none` | gst_query_set_buffering_percent |  | Set the percentage of buffered data. This is a value between 0 and 100. The @busy indicator is %TRUE when the buffering is in progress. |
| set_buffering_range | `Query.set_buffering_range(format: Format, start: gint64, stop: gint64, estimated_total: gint64) -> none` | gst_query_set_buffering_range |  | Set the available query result fields in @query. |
| set_buffering_stats | `Query.set_buffering_stats(mode: BufferingMode, avg_in: gint, avg_out: gint, buffering_left: gint64) -> none` | gst_query_set_buffering_stats |  | Configures the buffering stats values in @query. |
| set_caps_result | `Query.set_caps_result(caps: Caps?) -> none` | gst_query_set_caps_result |  | Set the @caps result in @query. |
| set_context | `Query.set_context(context: Context?) -> none` | gst_query_set_context | 1.2 | Answer a context query by setting the requested context. |
| set_convert | `Query.set_convert(src_format: Format, src_value: gint64, dest_format: Format, dest_value: gint64) -> none` | gst_query_set_convert |  | Answer a convert query by setting the requested values. |
| set_duration | `Query.set_duration(format: Format, duration: gint64) -> none` | gst_query_set_duration |  | Answer a duration query by setting the requested value in the given format. |
| set_formats | `Query.set_formats(n_formats: gint, ...: void) -> none` | gst_query_set_formats |  | Set the formats query result fields in @query. The number of formats passed must be equal to @n_formats. |
| set_formatsv | `Query.set_formatsv(n_formats: gint, formats: Format) -> none` | gst_query_set_formatsv |  | Set the formats query result fields in @query. The number of formats passed in the @formats array must be equal to @n_formats. |
| set_latency | `Query.set_latency(live: gboolean, min_latency: ClockTime, max_latency: ClockTime) -> none` | gst_query_set_latency |  | Answer a latency query by setting the requested values in the given format. |
| set_nth_allocation_param | `Query.set_nth_allocation_param(index: guint, allocator: Allocator?, params: AllocationParams?) -> none` | gst_query_set_nth_allocation_param |  | Parse an available query and get the allocator and its params at @index of the allocator array. |
| set_nth_allocation_pool | `Query.set_nth_allocation_pool(index: guint, pool: BufferPool?, size: guint, min_buffers: guint, max_buffers: guint) -> none` | gst_query_set_nth_allocation_pool |  | Set the pool parameters in @query. |
| set_position | `Query.set_position(format: Format, cur: gint64) -> none` | gst_query_set_position |  | Answer a position query by setting the requested value in the given format. |
| set_scheduling | `Query.set_scheduling(flags: SchedulingFlags, minsize: gint, maxsize: gint, align: gint) -> none` | gst_query_set_scheduling |  | Set the scheduling properties. |
| set_seeking | `Query.set_seeking(format: Format, seekable: gboolean, segment_start: gint64, segment_end: gint64) -> none` | gst_query_set_seeking |  | Set the seeking query result fields in @query. |
| set_segment | `Query.set_segment(rate: gdouble, format: Format, start_value: gint64, stop_value: gint64) -> none` | gst_query_set_segment |  | Answer a segment query by setting the requested values. The normal playback segment of a pipeline is 0 to duration at the default rate of 1.0. If a... |
| set_selectable | `Query.set_selectable(selectable: gboolean) -> none` | gst_query_set_selectable | 1.22 | Set the results of a selectable query. If the element answering the query can handle stream selection, @selectable should be set to %TRUE. |
| set_uri | `Query.set_uri(uri: utf8?) -> none` | gst_query_set_uri |  | Answer a URI query by setting the requested URI. |
| set_uri_redirection | `Query.set_uri_redirection(uri: utf8?) -> none` | gst_query_set_uri_redirection | 1.2 | Answer a URI query by setting the requested URI redirection. |
| set_uri_redirection_permanent | `Query.set_uri_redirection_permanent(permanent: gboolean) -> none` | gst_query_set_uri_redirection_permanent | 1.4 | Answer a URI query by setting the requested URI redirection to permanent or not. |
| writable_structure | `Query.writable_structure() -> Structure` | gst_query_writable_structure |  | Get the structure of a query. This method should be called with a writable @query so that the returned structure is guaranteed to be writable. |

### Gst.ReferenceTimestampMeta

C type: `GstReferenceTimestampMeta`

#GstReferenceTimestampMeta can be used to attach alternative timestamps and possibly durations to a #GstBuffer. These are generally not according t...

#### Fields

| Field | Type |
| --- | --- |
| duration | ClockTime |
| parent | Meta |
| reference | Caps |
| timestamp | ClockTime |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_info | `get_info() -> MetaInfo` | gst_reference_timestamp_meta_get_info | 1.14 | Gets the global #GstMetaInfo describing the #GstReferenceTimestampMeta meta. |

### Gst.RegistryClass

C type: `GstRegistryClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | ObjectClass |

### Gst.RegistryPrivate

C type: `GstRegistryPrivate`

### Gst.Sample

GType: `GstSample` ?? C type: `GstSample`

A #GstSample is a small object containing data, a type, timing and extra arbitrary information.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Sample.new(buffer: Buffer?, caps: Caps?, segment: Segment?, info: Structure?) -> Sample` | gst_sample_new |  | Create a new #GstSample with the provided details. Free-function: gst_sample_unref |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_buffer | `Sample.get_buffer() -> Buffer` | gst_sample_get_buffer |  | Get the buffer associated with @sample |
| get_buffer_list | `Sample.get_buffer_list() -> BufferList` | gst_sample_get_buffer_list | 1.6 | Get the buffer list associated with @sample |
| get_caps | `Sample.get_caps() -> Caps` | gst_sample_get_caps |  | Get the caps associated with @sample |
| get_info | `Sample.get_info() -> Structure` | gst_sample_get_info |  | Get extra information associated with @sample. |
| get_segment | `Sample.get_segment() -> Segment` | gst_sample_get_segment |  | Get the segment associated with @sample |
| set_buffer | `Sample.set_buffer(buffer: Buffer) -> none` | gst_sample_set_buffer | 1.16 | Set the buffer associated with @sample. @sample must be writable. |
| set_buffer_list | `Sample.set_buffer_list(buffer_list: BufferList) -> none` | gst_sample_set_buffer_list | 1.6 | Set the buffer list associated with @sample. @sample must be writable. |
| set_caps | `Sample.set_caps(caps: Caps) -> none` | gst_sample_set_caps | 1.16 | Set the caps associated with @sample. @sample must be writable. |
| set_info | `Sample.set_info(info: Structure) -> gboolean` | gst_sample_set_info | 1.16 | Set the info structure associated with @sample. @sample must be writable, and @info must not have a parent set already. |
| set_segment | `Sample.set_segment(segment: Segment) -> none` | gst_sample_set_segment | 1.16 | Set the segment associated with @sample. @sample must be writable. |

### Gst.Segment

GType: `GstSegment` ?? C type: `GstSegment`

This helper structure holds the relevant values for tracking the region of interest in a media file, called a segment. The structure can be used fo...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| applied_rate | gdouble |
| base | guint64 |
| duration | guint64 |
| flags | SegmentFlags |
| format | Format |
| offset | guint64 |
| position | guint64 |
| rate | gdouble |
| start | guint64 |
| stop | guint64 |
| time | guint64 |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Segment.new() -> Segment` | gst_segment_new |  | Allocate a new #GstSegment structure and initialize it using gst_segment_init(). Free-function: gst_segment_free |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clip | `Segment.clip(format: Format, start: guint64, stop: guint64, clip_start: out guint64?, clip_stop: out guint64?) -> gboolean` | gst_segment_clip |  | Clip the given @start and @stop values to the segment boundaries given in @segment. @start and @stop are compared and clipped to @segment start and... |
| copy | `Segment.copy() -> Segment` | gst_segment_copy |  | Create a copy of given @segment. Free-function: gst_segment_free |
| copy_into | `Segment.copy_into(dest: Segment) -> none` | gst_segment_copy_into |  | Copy the contents of @src into @dest. |
| do_seek | `Segment.do_seek(rate: gdouble, format: Format, flags: SeekFlags, start_type: SeekType, start: guint64, stop_type: SeekType, stop: guint64, update: out gboolean?) -> gboolean` | gst_segment_do_seek |  | Update the segment structure with the field values of a seek event (see gst_event_new_seek()). After calling this method, the segment field positio... |
| free | `Segment.free() -> none` | gst_segment_free |  | Free the allocated segment @segment. |
| init | `Segment.init(format: Format) -> none` | gst_segment_init |  | The start/position fields are set to 0 and the stop/duration fields are set to -1 (unknown). The default rate of 1.0 and no flags are set. Initiali... |
| is_equal | `Segment.is_equal(s1: Segment) -> gboolean` | gst_segment_is_equal | 1.6 | Checks for two segments being equal. Equality here is defined as perfect equality, including floating point values. |
| offset_running_time | `Segment.offset_running_time(format: Format, offset: gint64) -> gboolean` | gst_segment_offset_running_time | 1.2.3 | Adjust the values in @segment so that @offset is applied to all future running-time calculations. |
| position_from_running_time | `Segment.position_from_running_time(format: Format, running_time: guint64) -> guint64` | gst_segment_position_from_running_time | 1.8 | Convert @running_time into a position in the segment so that gst_segment_to_running_time() with that position returns @running_time. |
| position_from_running_time_full | `Segment.position_from_running_time_full(format: Format, running_time: guint64, position: out guint64) -> gint` | gst_segment_position_from_running_time_full | 1.8 | Translate @running_time to the segment position using the currently configured segment. Compared to gst_segment_position_from_running_time() this f... |
| position_from_stream_time | `Segment.position_from_stream_time(format: Format, stream_time: guint64) -> guint64` | gst_segment_position_from_stream_time | 1.8 | Convert @stream_time into a position in the segment so that gst_segment_to_stream_time() with that position returns @stream_time. |
| position_from_stream_time_full | `Segment.position_from_stream_time_full(format: Format, stream_time: guint64, position: out guint64) -> gint` | gst_segment_position_from_stream_time_full | 1.8 | Translate @stream_time to the segment position using the currently configured segment. Compared to gst_segment_position_from_stream_time() this fun... |
| set_running_time | `Segment.set_running_time(format: Format, running_time: guint64) -> gboolean` | gst_segment_set_running_time |  | Adjust the start/stop and base values of @segment such that the next valid buffer will be one with @running_time. |
| to_position | `Segment.to_position(format: Format, running_time: guint64) -> guint64` | gst_segment_to_position |  | Convert @running_time into a position in the segment so that gst_segment_to_running_time() with that position returns @running_time. |
| to_running_time | `Segment.to_running_time(format: Format, position: guint64) -> guint64` | gst_segment_to_running_time |  | Translate @position to the total running time using the currently configured segment. Position is a value between @segment start and stop time. Thi... |
| to_running_time_full | `Segment.to_running_time_full(format: Format, position: guint64, running_time: out guint64?) -> gint` | gst_segment_to_running_time_full | 1.6 | Translate @position to the total running time using the currently configured segment. Compared to gst_segment_to_running_time() this function can r... |
| to_stream_time | `Segment.to_stream_time(format: Format, position: guint64) -> guint64` | gst_segment_to_stream_time | 1.8 | Translate @position to stream time using the currently configured segment. The @position value must be between @segment start and stop value. This ... |
| to_stream_time_full | `Segment.to_stream_time_full(format: Format, position: guint64, stream_time: out guint64) -> gint` | gst_segment_to_stream_time_full | 1.8 | Translate @position to the total stream time using the currently configured segment. Compared to gst_segment_to_stream_time() this function can ret... |

### Gst.SharedTaskPoolClass

C type: `GstSharedTaskPoolClass`

The #GstSharedTaskPoolClass object.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | TaskPoolClass |

### Gst.SharedTaskPoolPrivate

C type: `GstSharedTaskPoolPrivate`

### Gst.StaticCaps

C type: `GstStaticCaps`

Data structure to initialize #GstCaps from a string description usually used in conjunction with GST_STATIC_CAPS() and gst_static_caps_get() to ins...

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| caps | Caps |
| string | utf8 |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| cleanup | `StaticCaps.cleanup() -> none` | gst_static_caps_cleanup |  | Cleans up the cached caps contained in @static_caps. |
| get | `StaticCaps.get() -> Caps` | gst_static_caps_get |  | Converts a #GstStaticCaps to a #GstCaps. |

### Gst.StaticPadTemplate

C type: `GstStaticPadTemplate`

Structure describing the #GstStaticPadTemplate.

#### Fields

| Field | Type |
| --- | --- |
| direction | PadDirection |
| name_template | utf8 |
| presence | PadPresence |
| static_caps | StaticCaps |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `StaticPadTemplate.get() -> PadTemplate` | gst_static_pad_template_get |  | Converts a #GstStaticPadTemplate into a #GstPadTemplate. |
| get_caps | `StaticPadTemplate.get_caps() -> Caps` | gst_static_pad_template_get_caps |  | Gets the capabilities of the static pad template. |

### Gst.StreamClass

C type: `GstStreamClass`

GstStream class structure

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | ObjectClass |

### Gst.StreamCollectionClass

C type: `GstStreamCollectionClass`

GstStreamCollection class structure

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | ObjectClass |
| stream_notify | none |

### Gst.StreamCollectionPrivate

C type: `GstStreamCollectionPrivate`

### Gst.StreamPrivate

C type: `GstStreamPrivate`

### Gst.Structure

GType: `GstStructure` ?? C type: `GstStructure`

A #GstStructure is a collection of key/value pairs. The keys are expressed as GQuarks and the values can be of any GType. In addition to the key/va...

#### Fields

| Field | Type |
| --- | --- |
| name | GLib.Quark |
| type | GType |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| from_string | `Structure.from_string(string: utf8, end: out utf8?) -> Structure` | gst_structure_from_string |  | Creates a #GstStructure from a string representation. If end is not %NULL, a pointer to the place inside the given string where parsing ended will ... |
| new | `Structure.new(name: utf8, firstfield: utf8, ...: void) -> Structure` | gst_structure_new |  | Creates a new #GstStructure with the given name. Parses the list of variable arguments and sets fields to the values listed. Variable arguments sho... |
| new_empty | `Structure.new_empty(name: utf8) -> Structure` | gst_structure_new_empty |  | Creates a new, empty #GstStructure with the given @name. See gst_structure_set_name() for constraints on the @name parameter. Free-function: gst_st... |
| new_from_string | `Structure.new_from_string(string: utf8) -> Structure` | gst_structure_new_from_string | 1.2 | Creates a #GstStructure from a string representation. If end is not %NULL, a pointer to the place inside the given string where parsing ended will ... |
| new_id | `Structure.new_id(name_quark: GLib.Quark, field_quark: GLib.Quark, ...: void) -> Structure` | gst_structure_new_id |  | Creates a new #GstStructure with the given name as a GQuark, followed by fieldname quark, GType, argument(s) "triplets" in the same format as gst_s... |
| new_id_empty | `Structure.new_id_empty(quark: GLib.Quark) -> Structure` | gst_structure_new_id_empty |  | Creates a new, empty #GstStructure with the given name as a GQuark. Free-function: gst_structure_free |
| new_valist | `Structure.new_valist(name: utf8, firstfield: utf8, varargs: va_list) -> Structure` | gst_structure_new_valist |  | Creates a new #GstStructure with the given @name. Structure fields are set according to the varargs in a manner similar to gst_structure_new(). See... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| take | `take(oldstr_ptr: inout Structure?, newstr: Structure?) -> gboolean` | gst_structure_take | 1.18 | Atomically modifies a pointer to point to a new structure. The #GstStructure @oldstr_ptr is pointing to is freed and @newstr is taken ownership ove... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_intersect | `Structure.can_intersect(struct2: Structure) -> gboolean` | gst_structure_can_intersect |  | Tries intersecting @struct1 and @struct2 and reports whether the result would not be empty. |
| copy | `Structure.copy() -> Structure` | gst_structure_copy |  | Duplicates a #GstStructure and all its fields and values. Free-function: gst_structure_free |
| filter_and_map_in_place | `Structure.filter_and_map_in_place(func: StructureFilterMapFunc, user_data: gpointer?) -> none` | gst_structure_filter_and_map_in_place | 1.6 | Calls the provided function once for each field in the #GstStructure. In contrast to gst_structure_foreach(), the function may modify the fields. I... |
| fixate | `Structure.fixate() -> none` | gst_structure_fixate |  | Fixate all values in @structure using gst_value_fixate(). @structure will be modified in-place and should be writable. |
| fixate_field | `Structure.fixate_field(field_name: utf8) -> gboolean` | gst_structure_fixate_field |  | Fixates a #GstStructure by changing the given field with its fixated value. |
| fixate_field_boolean | `Structure.fixate_field_boolean(field_name: utf8, target: gboolean) -> gboolean` | gst_structure_fixate_field_boolean |  | Fixates a #GstStructure by changing the given @field_name field to the given @target boolean if that field is not fixed yet. |
| fixate_field_nearest_double | `Structure.fixate_field_nearest_double(field_name: utf8, target: gdouble) -> gboolean` | gst_structure_fixate_field_nearest_double |  | Fixates a #GstStructure by changing the given field to the nearest double to @target that is a subset of the existing field. |
| fixate_field_nearest_fraction | `Structure.fixate_field_nearest_fraction(field_name: utf8, target_numerator: gint, target_denominator: gint) -> gboolean` | gst_structure_fixate_field_nearest_fraction |  | Fixates a #GstStructure by changing the given field to the nearest fraction to @target_numerator/@target_denominator that is a subset of the existi... |
| fixate_field_nearest_int | `Structure.fixate_field_nearest_int(field_name: utf8, target: gint) -> gboolean` | gst_structure_fixate_field_nearest_int |  | Fixates a #GstStructure by changing the given field to the nearest integer to @target that is a subset of the existing field. |
| fixate_field_string | `Structure.fixate_field_string(field_name: utf8, target: utf8) -> gboolean` | gst_structure_fixate_field_string |  | Fixates a #GstStructure by changing the given @field_name field to the given @target string if that field is not fixed yet. |
| foreach | `Structure.foreach(func: StructureForeachFunc, user_data: gpointer?) -> gboolean` | gst_structure_foreach |  | Calls the provided function once for each field in the #GstStructure. The function must not modify the fields. Also see gst_structure_map_in_place(... |
| free | `Structure.free() -> none` | gst_structure_free |  | Frees a #GstStructure and all its fields and values. The structure must not have a parent when this function is called. |
| get | `Structure.get(first_fieldname: utf8, ...: void) -> gboolean` | gst_structure_get |  | Parses the variable arguments and reads fields from @structure accordingly. Variable arguments should be in the form field name, field type (as a G... |
| get_array | `Structure.get_array(fieldname: utf8, array: out GObject.ValueArray) -> gboolean` | gst_structure_get_array | 1.12 | This is useful in language bindings where unknown #GValue types are not supported. This function will convert the %GST_TYPE_ARRAY into a newly allo... |
| get_boolean | `Structure.get_boolean(fieldname: utf8, value: out gboolean) -> gboolean` | gst_structure_get_boolean |  | Sets the boolean pointed to by @value corresponding to the value of the given field. Caller is responsible for making sure the field exists and has... |
| get_clock_time | `Structure.get_clock_time(fieldname: utf8, value: out ClockTime) -> gboolean` | gst_structure_get_clock_time |  | Sets the clock time pointed to by @value corresponding to the clock time of the given field. Caller is responsible for making sure the field exists... |
| get_date | `Structure.get_date(fieldname: utf8, value: out GLib.Date) -> gboolean` | gst_structure_get_date |  | Sets the date pointed to by @value corresponding to the date of the given field. Caller is responsible for making sure the field exists and has the... |
| get_date_time | `Structure.get_date_time(fieldname: utf8, value: out DateTime) -> gboolean` | gst_structure_get_date_time |  | Sets the datetime pointed to by @value corresponding to the datetime of the given field. Caller is responsible for making sure the field exists and... |
| get_double | `Structure.get_double(fieldname: utf8, value: out gdouble) -> gboolean` | gst_structure_get_double |  | Sets the double pointed to by @value corresponding to the value of the given field. Caller is responsible for making sure the field exists and has ... |
| get_enum | `Structure.get_enum(fieldname: utf8, enumtype: GType, value: out gint) -> gboolean` | gst_structure_get_enum |  | Sets the int pointed to by @value corresponding to the value of the given field. Caller is responsible for making sure the field exists, has the co... |
| get_field_type | `Structure.get_field_type(fieldname: utf8) -> GType` | gst_structure_get_field_type |  | Finds the field with the given name, and returns the type of the value it contains. If the field is not found, G_TYPE_INVALID is returned. |
| get_flags | `Structure.get_flags(fieldname: utf8, flags_type: GType, value: out guint) -> gboolean` | gst_structure_get_flags | 1.22 | Sets the unsigned int pointed to by @value corresponding to the value of the given field. Caller is responsible for making sure the field exists, h... |
| get_flagset | `Structure.get_flagset(fieldname: utf8, value_flags: out guint?, value_mask: out guint?) -> gboolean` | gst_structure_get_flagset | 1.6 | Read the GstFlagSet flags and mask out of the structure into the provided pointers. |
| get_fraction | `Structure.get_fraction(fieldname: utf8, value_numerator: out gint, value_denominator: out gint) -> gboolean` | gst_structure_get_fraction |  | Sets the integers pointed to by @value_numerator and @value_denominator corresponding to the value of the given field. Caller is responsible for ma... |
| get_int | `Structure.get_int(fieldname: utf8, value: out gint) -> gboolean` | gst_structure_get_int |  | Sets the int pointed to by @value corresponding to the value of the given field. Caller is responsible for making sure the field exists and has the... |
| get_int64 | `Structure.get_int64(fieldname: utf8, value: out gint64) -> gboolean` | gst_structure_get_int64 | 1.4 | Sets the #gint64 pointed to by @value corresponding to the value of the given field. Caller is responsible for making sure the field exists and has... |
| get_list | `Structure.get_list(fieldname: utf8, array: out GObject.ValueArray) -> gboolean` | gst_structure_get_list | 1.12 | This is useful in language bindings where unknown #GValue types are not supported. This function will convert the %GST_TYPE_LIST into a newly alloc... |
| get_name | `Structure.get_name() -> utf8` | gst_structure_get_name |  | Get the name of @structure as a string. |
| get_name_id | `Structure.get_name_id() -> GLib.Quark` | gst_structure_get_name_id |  | Get the name of @structure as a GQuark. |
| get_string | `Structure.get_string(fieldname: utf8) -> utf8` | gst_structure_get_string |  | Finds the field corresponding to @fieldname, and returns the string contained in the field's value. Caller is responsible for making sure the field... |
| get_uint | `Structure.get_uint(fieldname: utf8, value: out guint) -> gboolean` | gst_structure_get_uint |  | Sets the uint pointed to by @value corresponding to the value of the given field. Caller is responsible for making sure the field exists and has th... |
| get_uint64 | `Structure.get_uint64(fieldname: utf8, value: out guint64) -> gboolean` | gst_structure_get_uint64 | 1.4 | Sets the #guint64 pointed to by @value corresponding to the value of the given field. Caller is responsible for making sure the field exists and ha... |
| get_valist | `Structure.get_valist(first_fieldname: utf8, args: va_list) -> gboolean` | gst_structure_get_valist |  | Parses the variable arguments and reads fields from @structure accordingly. valist-variant of gst_structure_get(). Look at the documentation of gst... |
| get_value | `Structure.get_value(fieldname: utf8) -> GObject.Value` | gst_structure_get_value |  | Get the value of the field with name @fieldname. |
| has_field | `Structure.has_field(fieldname: utf8) -> gboolean` | gst_structure_has_field |  | Check if @structure contains a field named @fieldname. |
| has_field_typed | `Structure.has_field_typed(fieldname: utf8, type: GType) -> gboolean` | gst_structure_has_field_typed |  | Check if @structure contains a field named @fieldname and with GType @type. |
| has_name | `Structure.has_name(name: utf8) -> gboolean` | gst_structure_has_name |  | Checks if the structure has the given name |
| id_get | `Structure.id_get(first_field_id: GLib.Quark, ...: void) -> gboolean` | gst_structure_id_get |  | Parses the variable arguments and reads fields from @structure accordingly. Variable arguments should be in the form field id quark, field type (as... |
| id_get_valist | `Structure.id_get_valist(first_field_id: GLib.Quark, args: va_list) -> gboolean` | gst_structure_id_get_valist |  | Parses the variable arguments and reads fields from @structure accordingly. valist-variant of gst_structure_id_get(). Look at the documentation of ... |
| id_get_value | `Structure.id_get_value(field: GLib.Quark) -> GObject.Value` | gst_structure_id_get_value |  | Get the value of the field with GQuark @field. |
| id_has_field | `Structure.id_has_field(field: GLib.Quark) -> gboolean` | gst_structure_id_has_field |  | Check if @structure contains a field named @field. |
| id_has_field_typed | `Structure.id_has_field_typed(field: GLib.Quark, type: GType) -> gboolean` | gst_structure_id_has_field_typed |  | Check if @structure contains a field named @field and with GType @type. |
| id_set | `Structure.id_set(fieldname: GLib.Quark, ...: void) -> none` | gst_structure_id_set |  | Identical to gst_structure_set, except that field names are passed using the GQuark for the field name. This allows more efficient setting of the s... |
| id_set_valist | `Structure.id_set_valist(fieldname: GLib.Quark, varargs: va_list) -> none` | gst_structure_id_set_valist |  | va_list form of gst_structure_id_set(). |
| id_set_value | `Structure.id_set_value(field: GLib.Quark, value: GObject.Value) -> none` | gst_structure_id_set_value |  | Sets the field with the given GQuark @field to @value. If the field does not exist, it is created. If the field exists, the previous value is repla... |
| id_take_value | `Structure.id_take_value(field: GLib.Quark, value: GObject.Value) -> none` | gst_structure_id_take_value |  | Sets the field with the given GQuark @field to @value. If the field does not exist, it is created. If the field exists, the previous value is repla... |
| intersect | `Structure.intersect(struct2: Structure) -> Structure` | gst_structure_intersect |  | Intersects @struct1 and @struct2 and returns the intersection. |
| is_equal | `Structure.is_equal(structure2: Structure) -> gboolean` | gst_structure_is_equal |  | Tests if the two #GstStructure are equal. |
| is_subset | `Structure.is_subset(superset: Structure) -> gboolean` | gst_structure_is_subset |  | Checks if @subset is a subset of @superset, i.e. has the same structure name and for all fields that are existing in @superset, @subset has a value... |
| map_in_place | `Structure.map_in_place(func: StructureMapFunc, user_data: gpointer?) -> gboolean` | gst_structure_map_in_place |  | Calls the provided function once for each field in the #GstStructure. In contrast to gst_structure_foreach(), the function may modify but not delet... |
| n_fields | `Structure.n_fields() -> gint` | gst_structure_n_fields |  | Get the number of fields in the structure. |
| nth_field_name | `Structure.nth_field_name(index: guint) -> utf8` | gst_structure_nth_field_name |  | Get the name of the given field number, counting from 0 onwards. |
| remove_all_fields | `Structure.remove_all_fields() -> none` | gst_structure_remove_all_fields |  | Removes all fields in a GstStructure. |
| remove_field | `Structure.remove_field(fieldname: utf8) -> none` | gst_structure_remove_field |  | Removes the field with the given name. If the field with the given name does not exist, the structure is unchanged. |
| remove_fields | `Structure.remove_fields(fieldname: utf8, ...: void) -> none` | gst_structure_remove_fields |  | Removes the fields with the given names. If a field does not exist, the argument is ignored. |
| remove_fields_valist | `Structure.remove_fields_valist(fieldname: utf8, varargs: va_list) -> none` | gst_structure_remove_fields_valist |  | va_list form of gst_structure_remove_fields(). |
| serialize | `Structure.serialize(flags: SerializeFlags) -> utf8` | gst_structure_serialize | 1.20 | Converts @structure to a human-readable string representation. This version of the caps serialization function introduces support for nested struct... |
| serialize_full | `Structure.serialize_full(flags: SerializeFlags) -> utf8` | gst_structure_serialize_full | 1.24 | Alias for gst_structure_serialize() but with nullable annotation because it can return %NULL when %GST_SERIALIZE_FLAG_STRICT flag is set. |
| set | `Structure.set(fieldname: utf8, ...: void) -> none` | gst_structure_set |  | Parses the variable arguments and sets fields accordingly. Fields that weren't already part of the structure are added as needed. Variable argument... |
| set_array | `Structure.set_array(fieldname: utf8, array: GObject.ValueArray) -> none` | gst_structure_set_array | 1.12 | This is useful in language bindings where unknown GValue types are not supported. This function will convert a @array to %GST_TYPE_ARRAY and set th... |
| set_list | `Structure.set_list(fieldname: utf8, array: GObject.ValueArray) -> none` | gst_structure_set_list | 1.12 | This is useful in language bindings where unknown GValue types are not supported. This function will convert a @array to %GST_TYPE_LIST and set the... |
| set_name | `Structure.set_name(name: utf8) -> none` | gst_structure_set_name |  | Sets the name of the structure to the given @name. The string provided is copied before being used. It must not be empty, start with a letter and c... |
| set_parent_refcount | `Structure.set_parent_refcount(refcount: gint) -> gboolean` | gst_structure_set_parent_refcount |  | Sets the parent_refcount field of #GstStructure. This field is used to determine whether a structure is mutable or not. This function should only b... |
| set_valist | `Structure.set_valist(fieldname: utf8, varargs: va_list) -> none` | gst_structure_set_valist |  | va_list form of gst_structure_set(). |
| set_value | `Structure.set_value(fieldname: utf8, value: GObject.Value) -> none` | gst_structure_set_value |  | Sets the field with the given name @field to @value. If the field does not exist, it is created. If the field exists, the previous value is replace... |
| take_value | `Structure.take_value(fieldname: utf8, value: GObject.Value) -> none` | gst_structure_take_value |  | Sets the field with the given name @field to @value. If the field does not exist, it is created. If the field exists, the previous value is replace... |
| to_string | `Structure.to_string() -> utf8` | gst_structure_to_string |  | Converts @structure to a human-readable string representation. For debugging purposes its easier to do something like this: \|[<!-- language="C" -->... |

### Gst.SystemClockClass

C type: `GstSystemClockClass`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | ClockClass |

### Gst.SystemClockPrivate

C type: `GstSystemClockPrivate`

### Gst.TagList

GType: `GstTagList` ?? C type: `GstTagList`

List of tags and values used to describe media metadata. Strings in structures must be ASCII or UTF-8 encoded. Other encodings are not allowed. Str...

#### Fields

| Field | Type |
| --- | --- |
| mini_object | MiniObject |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TagList.new(tag: utf8, ...: void) -> TagList` | gst_tag_list_new |  | Creates a new taglist and appends the values for the given tags. It expects tag-value pairs like gst_tag_list_add(), and a %NULL terminator after t... |
| new_empty | `TagList.new_empty() -> TagList` | gst_tag_list_new_empty |  | Creates a new empty GstTagList. Free-function: gst_tag_list_unref |
| new_from_string | `TagList.new_from_string(str: utf8) -> TagList` | gst_tag_list_new_from_string |  | Deserializes a tag list. |
| new_valist | `TagList.new_valist(var_args: va_list) -> TagList` | gst_tag_list_new_valist |  | Just like gst_tag_list_new(), only that it takes a va_list argument. Useful mostly for language bindings. Free-function: gst_tag_list_unref |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy_value | `copy_value(dest: out GObject.Value, list: TagList, tag: utf8) -> gboolean` | gst_tag_list_copy_value |  | Copies the contents for the given tag into the value, merging multiple values into one if multiple values are associated with the tag. You must g_v... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `TagList.add(mode: TagMergeMode, tag: utf8, ...: void) -> none` | gst_tag_list_add |  | Sets the values for the given tags using the specified mode. |
| add_valist | `TagList.add_valist(mode: TagMergeMode, tag: utf8, var_args: va_list) -> none` | gst_tag_list_add_valist |  | Sets the values for the given tags using the specified mode. |
| add_valist_values | `TagList.add_valist_values(mode: TagMergeMode, tag: utf8, var_args: va_list) -> none` | gst_tag_list_add_valist_values |  | Sets the GValues for the given tags using the specified mode. |
| add_value | `TagList.add_value(mode: TagMergeMode, tag: utf8, value: GObject.Value) -> none` | gst_tag_list_add_value |  | Sets the GValue for a given tag using the specified mode. |
| add_values | `TagList.add_values(mode: TagMergeMode, tag: utf8, ...: void) -> none` | gst_tag_list_add_values |  | Sets the GValues for the given tags using the specified mode. |
| copy | `TagList.copy() -> TagList` | gst_tag_list_copy |  | Creates a new #GstTagList as a copy of the old @taglist. The new taglist will have a refcount of 1, owned by the caller, and will be writable as a ... |
| foreach | `TagList.foreach(func: TagForeachFunc, user_data: gpointer?) -> none` | gst_tag_list_foreach |  | Calls the given function for each tag inside the tag list. Note that if there is no tag, the function won't be called at all. |
| get_boolean | `TagList.get_boolean(tag: utf8, value: out gboolean) -> gboolean` | gst_tag_list_get_boolean |  | Copies the contents for the given tag into the value, merging multiple values into one if multiple values are associated with the tag. |
| get_boolean_index | `TagList.get_boolean_index(tag: utf8, index: guint, value: out gboolean) -> gboolean` | gst_tag_list_get_boolean_index |  | Gets the value that is at the given index for the given tag in the given list. |
| get_date | `TagList.get_date(tag: utf8, value: out GLib.Date) -> gboolean` | gst_tag_list_get_date |  | Copies the first date for the given tag in the taglist into the variable pointed to by @value. Free the date with g_date_free() when it is no longe... |
| get_date_index | `TagList.get_date_index(tag: utf8, index: guint, value: out GLib.Date) -> gboolean` | gst_tag_list_get_date_index |  | Gets the date that is at the given index for the given tag in the given list and copies it into the variable pointed to by @value. Free the date wi... |
| get_date_time | `TagList.get_date_time(tag: utf8, value: out DateTime) -> gboolean` | gst_tag_list_get_date_time |  | Copies the first datetime for the given tag in the taglist into the variable pointed to by @value. Unref the date with gst_date_time_unref() when i... |
| get_date_time_index | `TagList.get_date_time_index(tag: utf8, index: guint, value: out DateTime) -> gboolean` | gst_tag_list_get_date_time_index |  | Gets the datetime that is at the given index for the given tag in the given list and copies it into the variable pointed to by @value. Unref the da... |
| get_double | `TagList.get_double(tag: utf8, value: out gdouble) -> gboolean` | gst_tag_list_get_double |  | Copies the contents for the given tag into the value, merging multiple values into one if multiple values are associated with the tag. |
| get_double_index | `TagList.get_double_index(tag: utf8, index: guint, value: out gdouble) -> gboolean` | gst_tag_list_get_double_index |  | Gets the value that is at the given index for the given tag in the given list. |
| get_float | `TagList.get_float(tag: utf8, value: out gfloat) -> gboolean` | gst_tag_list_get_float |  | Copies the contents for the given tag into the value, merging multiple values into one if multiple values are associated with the tag. |
| get_float_index | `TagList.get_float_index(tag: utf8, index: guint, value: out gfloat) -> gboolean` | gst_tag_list_get_float_index |  | Gets the value that is at the given index for the given tag in the given list. |
| get_int | `TagList.get_int(tag: utf8, value: out gint) -> gboolean` | gst_tag_list_get_int |  | Copies the contents for the given tag into the value, merging multiple values into one if multiple values are associated with the tag. |
| get_int64 | `TagList.get_int64(tag: utf8, value: out gint64) -> gboolean` | gst_tag_list_get_int64 |  | Copies the contents for the given tag into the value, merging multiple values into one if multiple values are associated with the tag. |
| get_int64_index | `TagList.get_int64_index(tag: utf8, index: guint, value: out gint64) -> gboolean` | gst_tag_list_get_int64_index |  | Gets the value that is at the given index for the given tag in the given list. |
| get_int_index | `TagList.get_int_index(tag: utf8, index: guint, value: out gint) -> gboolean` | gst_tag_list_get_int_index |  | Gets the value that is at the given index for the given tag in the given list. |
| get_pointer | `TagList.get_pointer(tag: utf8, value: out gpointer?) -> gboolean` | gst_tag_list_get_pointer |  | Copies the contents for the given tag into the value, merging multiple values into one if multiple values are associated with the tag. |
| get_pointer_index | `TagList.get_pointer_index(tag: utf8, index: guint, value: out gpointer?) -> gboolean` | gst_tag_list_get_pointer_index |  | Gets the value that is at the given index for the given tag in the given list. |
| get_sample | `TagList.get_sample(tag: utf8, sample: out Sample) -> gboolean` | gst_tag_list_get_sample |  | Copies the first sample for the given tag in the taglist into the variable pointed to by @sample. Free the sample with gst_sample_unref() when it i... |
| get_sample_index | `TagList.get_sample_index(tag: utf8, index: guint, sample: out Sample) -> gboolean` | gst_tag_list_get_sample_index |  | Gets the sample that is at the given index for the given tag in the given list and copies it into the variable pointed to by @sample. Free the samp... |
| get_scope | `TagList.get_scope() -> TagScope` | gst_tag_list_get_scope |  | Gets the scope of @list. |
| get_string | `TagList.get_string(tag: utf8, value: out utf8) -> gboolean` | gst_tag_list_get_string |  | Copies the contents for the given tag into the value, possibly merging multiple values into one if multiple values are associated with the tag. Use... |
| get_string_index | `TagList.get_string_index(tag: utf8, index: guint, value: out utf8) -> gboolean` | gst_tag_list_get_string_index |  | Gets the value that is at the given index for the given tag in the given list. The resulting string in @value will be in UTF-8 encoding and should ... |
| get_tag_size | `TagList.get_tag_size(tag: utf8) -> guint` | gst_tag_list_get_tag_size |  | Checks how many value are stored in this tag list for the given tag. |
| get_uint | `TagList.get_uint(tag: utf8, value: out guint) -> gboolean` | gst_tag_list_get_uint |  | Copies the contents for the given tag into the value, merging multiple values into one if multiple values are associated with the tag. |
| get_uint64 | `TagList.get_uint64(tag: utf8, value: out guint64) -> gboolean` | gst_tag_list_get_uint64 |  | Copies the contents for the given tag into the value, merging multiple values into one if multiple values are associated with the tag. |
| get_uint64_index | `TagList.get_uint64_index(tag: utf8, index: guint, value: out guint64) -> gboolean` | gst_tag_list_get_uint64_index |  | Gets the value that is at the given index for the given tag in the given list. |
| get_uint_index | `TagList.get_uint_index(tag: utf8, index: guint, value: out guint) -> gboolean` | gst_tag_list_get_uint_index |  | Gets the value that is at the given index for the given tag in the given list. |
| get_value_index | `TagList.get_value_index(tag: utf8, index: guint) -> GObject.Value` | gst_tag_list_get_value_index |  | Gets the value that is at the given index for the given tag in the given list. |
| insert | `TagList.insert(from: TagList, mode: TagMergeMode) -> none` | gst_tag_list_insert |  | Inserts the tags of the @from list into the first list using the given mode. |
| is_empty | `TagList.is_empty() -> gboolean` | gst_tag_list_is_empty |  | Checks if the given taglist is empty. |
| is_equal | `TagList.is_equal(list2: TagList) -> gboolean` | gst_tag_list_is_equal |  | Checks if the two given taglists are equal. |
| merge | `TagList.merge(list2: TagList?, mode: TagMergeMode) -> TagList` | gst_tag_list_merge |  | Merges the two given lists into a new list. If one of the lists is %NULL, a copy of the other is returned. If both lists are %NULL, %NULL is return... |
| n_tags | `TagList.n_tags() -> gint` | gst_tag_list_n_tags |  | Get the number of tags in @list. |
| nth_tag_name | `TagList.nth_tag_name(index: guint) -> utf8` | gst_tag_list_nth_tag_name |  | Get the name of the tag in @list at @index. |
| peek_string_index | `TagList.peek_string_index(tag: utf8, index: guint, value: out utf8) -> gboolean` | gst_tag_list_peek_string_index |  | Peeks at the value that is at the given index for the given tag in the given list. The resulting string in @value will be in UTF-8 encoding and doe... |
| remove_tag | `TagList.remove_tag(tag: utf8) -> none` | gst_tag_list_remove_tag |  | Removes the given tag from the taglist. |
| set_scope | `TagList.set_scope(scope: TagScope) -> none` | gst_tag_list_set_scope |  | Sets the scope of @list to @scope. By default the scope of a taglist is stream scope. |
| to_string | `TagList.to_string() -> utf8` | gst_tag_list_to_string |  | Serializes a tag list to a string. |

### Gst.TagSetterInterface

C type: `GstTagSetterInterface`

#GstTagSetterInterface interface.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |

### Gst.TaskClass

C type: `GstTaskClass`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | ObjectClass |
| pool | TaskPool |

### Gst.TaskPoolClass

C type: `GstTaskPoolClass`

The #GstTaskPoolClass object.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| cleanup | none |
| dispose_handle | none |
| join | none |
| parent_class | ObjectClass |
| prepare | none |
| push | gpointer |

### Gst.TaskPrivate

C type: `GstTaskPrivate`

### Gst.TimedValue

C type: `GstTimedValue`

Structure for storing a timestamp and a value.

#### Fields

| Field | Type |
| --- | --- |
| timestamp | ClockTime |
| value | gdouble |

### Gst.Toc

GType: `GstToc` ?? C type: `GstToc`

#GstToc functions are used to create/free #GstToc and #GstTocEntry structures. Also they are used to convert #GstToc into #GstStructure and vice ve...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Toc.new(scope: TocScope) -> Toc` | gst_toc_new |  | Create a new #GstToc structure. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_entry | `Toc.append_entry(entry: TocEntry) -> none` | gst_toc_append_entry |  | Appends the #GstTocEntry @entry to @toc. |
| dump | `Toc.dump() -> none` | gst_toc_dump |  |  |
| find_entry | `Toc.find_entry(uid: utf8) -> TocEntry` | gst_toc_find_entry |  | Find #GstTocEntry with given @uid in the @toc. |
| get_entries | `Toc.get_entries() -> GLib.List` | gst_toc_get_entries |  | Gets the list of #GstTocEntry of @toc. |
| get_scope | `Toc.get_scope() -> TocScope` | gst_toc_get_scope |  | scope of @toc |
| get_tags | `Toc.get_tags() -> TagList` | gst_toc_get_tags |  | Gets the tags for @toc. |
| merge_tags | `Toc.merge_tags(tags: TagList?, mode: TagMergeMode) -> none` | gst_toc_merge_tags |  | Merge @tags into the existing tags of @toc using @mode. |
| set_tags | `Toc.set_tags(tags: TagList?) -> none` | gst_toc_set_tags |  | Set a #GstTagList with tags for the complete @toc. |

### Gst.TocEntry

GType: `GstTocEntry` ?? C type: `GstTocEntry`

Create new #GstTocEntry structure.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TocEntry.new(type: TocEntryType, uid: utf8) -> TocEntry` | gst_toc_entry_new |  | Create new #GstTocEntry structure. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_sub_entry | `TocEntry.append_sub_entry(subentry: TocEntry) -> none` | gst_toc_entry_append_sub_entry |  | Appends the #GstTocEntry @subentry to @entry. |
| get_entry_type | `TocEntry.get_entry_type() -> TocEntryType` | gst_toc_entry_get_entry_type |  | @entry's entry type |
| get_loop | `TocEntry.get_loop(loop_type: out TocLoopType?, repeat_count: out gint?) -> gboolean` | gst_toc_entry_get_loop | 1.4 | Get @loop_type and @repeat_count values from the @entry and write them into appropriate storages. Loops are e.g. used by sampled instruments. GStre... |
| get_parent | `TocEntry.get_parent() -> TocEntry` | gst_toc_entry_get_parent |  | Gets the parent #GstTocEntry of @entry. |
| get_start_stop_times | `TocEntry.get_start_stop_times(start: out gint64?, stop: out gint64?) -> gboolean` | gst_toc_entry_get_start_stop_times |  | Get @start and @stop values from the @entry and write them into appropriate storages. |
| get_sub_entries | `TocEntry.get_sub_entries() -> GLib.List` | gst_toc_entry_get_sub_entries |  | Gets the sub-entries of @entry. |
| get_tags | `TocEntry.get_tags() -> TagList` | gst_toc_entry_get_tags |  | Gets the tags for @entry. |
| get_toc | `TocEntry.get_toc() -> Toc` | gst_toc_entry_get_toc |  | Gets the parent #GstToc of @entry. |
| get_uid | `TocEntry.get_uid() -> utf8` | gst_toc_entry_get_uid |  | Gets the UID of @entry. |
| is_alternative | `TocEntry.is_alternative() -> gboolean` | gst_toc_entry_is_alternative |  | %TRUE if @entry's type is an alternative type, otherwise %FALSE |
| is_sequence | `TocEntry.is_sequence() -> gboolean` | gst_toc_entry_is_sequence |  | %TRUE if @entry's type is a sequence type, otherwise %FALSE |
| merge_tags | `TocEntry.merge_tags(tags: TagList?, mode: TagMergeMode) -> none` | gst_toc_entry_merge_tags |  | Merge @tags into the existing tags of @entry using @mode. |
| set_loop | `TocEntry.set_loop(loop_type: TocLoopType, repeat_count: gint) -> none` | gst_toc_entry_set_loop | 1.4 | Set @loop_type and @repeat_count values for the @entry. |
| set_start_stop_times | `TocEntry.set_start_stop_times(start: gint64, stop: gint64) -> none` | gst_toc_entry_set_start_stop_times |  | Set @start and @stop values for the @entry. |
| set_tags | `TocEntry.set_tags(tags: TagList?) -> none` | gst_toc_entry_set_tags |  | Set a #GstTagList with tags for the complete @entry. |

### Gst.TocSetterInterface

C type: `GstTocSetterInterface`

#GstTocSetterInterface interface.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |

### Gst.TracerClass

C type: `GstTracerClass`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| parent_class | ObjectClass |

### Gst.TracerFactoryClass

C type: `GstTracerFactoryClass`

### Gst.TracerPrivate

C type: `GstTracerPrivate`

### Gst.TracerRecordClass

C type: `GstTracerRecordClass`

### Gst.TypeFind

C type: `GstTypeFind`

The following functions allow you to detect the media type of an unknown stream.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| data | gpointer |
| get_length | guint64 |
| peek | guint8 |
| suggest | none |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| register | `register(plugin: Plugin?, name: utf8, rank: guint, func: TypeFindFunction, extensions: utf8?, possible_caps: Caps?, data: gpointer?, data_notify: GLib.DestroyNotify) -> gboolean` | gst_type_find_register |  | Registers a new typefind function to be used for typefinding. After registering this function will be available for typefinding. This function is t... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_length | `TypeFind.get_length() -> guint64` | gst_type_find_get_length |  | Get the length of the data stream. |
| peek | `TypeFind.peek(offset: gint64, size: guint) -> guint8` | gst_type_find_peek |  | Returns the @size bytes of the stream to identify beginning at offset. If offset is a positive number, the offset is relative to the beginning of t... |
| suggest | `TypeFind.suggest(probability: guint, caps: Caps) -> none` | gst_type_find_suggest |  | If a #GstTypeFindFunction calls this function it suggests the caps with the given probability. A #GstTypeFindFunction may supply different suggesti... |
| suggest_empty_simple | `TypeFind.suggest_empty_simple(probability: guint, media_type: utf8) -> none` | gst_type_find_suggest_empty_simple | 1.20 | If a #GstTypeFindFunction calls this function it suggests caps of the given @media_type with the given @probability. This function is similar to gs... |
| suggest_simple | `TypeFind.suggest_simple(probability: guint, media_type: utf8, fieldname: utf8?, ...: void) -> none` | gst_type_find_suggest_simple |  | If a #GstTypeFindFunction calls this function it suggests the caps with the given probability. A #GstTypeFindFunction may supply different suggesti... |

### Gst.TypeFindFactoryClass

C type: `GstTypeFindFactoryClass`

### Gst.Uri

GType: `GstUri` ?? C type: `GstUri`

A #GstUri object can be used to parse and split a URI string into its constituent parts. Two #GstUri objects can be joined to make a new #GstUri us...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Uri.new(scheme: utf8?, userinfo: utf8?, host: utf8?, port: guint, path: utf8?, query: utf8?, fragment: utf8?) -> Uri` | gst_uri_new | 1.6 | Creates a new #GstUri object with the given URI parts. The path and query strings will be broken down into their elements. All strings should not b... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| construct | `construct(protocol: utf8, location: utf8) -> utf8` | gst_uri_construct |  | Constructs a URI for a given valid protocol and location. Free-function: g_free |
| from_string | `from_string(uri: utf8) -> Uri` | gst_uri_from_string | 1.6 | Parses a URI string into a new #GstUri object. Will return NULL if the URI cannot be parsed. |
| from_string_escaped | `from_string_escaped(uri: utf8) -> Uri` | gst_uri_from_string_escaped | 1.18 | Parses a URI string into a new #GstUri object. Will return NULL if the URI cannot be parsed. This is identical to gst_uri_from_string() except that... |
| get_location | `get_location(uri: utf8) -> utf8` | gst_uri_get_location |  | Extracts the location out of a given valid URI, ie. the protocol and "://" are stripped from the URI, which means that the location returned includ... |
| get_protocol | `get_protocol(uri: utf8) -> utf8` | gst_uri_get_protocol |  | Extracts the protocol out of a given valid URI. The returned string must be freed using g_free(). |
| has_protocol | `has_protocol(uri: utf8, protocol: utf8) -> gboolean` | gst_uri_has_protocol |  | Checks if the protocol of a given valid URI matches @protocol. |
| is_valid | `is_valid(uri: utf8) -> gboolean` | gst_uri_is_valid |  | Tests if the given string is a valid URI identifier. URIs start with a valid scheme followed by ":" and maybe a string identifying the location. |
| join_strings | `join_strings(base_uri: utf8, ref_uri: utf8) -> utf8` | gst_uri_join_strings | 1.6 | This is a convenience function to join two URI strings and return the result. The returned string should be g_free()'d after use. |
| protocol_is_supported | `protocol_is_supported(type: URIType, protocol: utf8) -> gboolean` | gst_uri_protocol_is_supported |  | Checks if an element exists that supports the given URI protocol. Note that a positive return value does not imply that a subsequent call to gst_el... |
| protocol_is_valid | `protocol_is_valid(protocol: utf8) -> gboolean` | gst_uri_protocol_is_valid |  | Tests if the given string is a valid protocol identifier. Protocols must consist of alphanumeric characters, '+', '-' and '.' and must start with a... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_path | `Uri.append_path(relative_path: utf8?) -> gboolean` | gst_uri_append_path | 1.6 | Append a path onto the end of the path in the URI. The path is not normalized, call #gst_uri_normalize() to normalize the path. |
| append_path_segment | `Uri.append_path_segment(path_segment: utf8?) -> gboolean` | gst_uri_append_path_segment | 1.6 | Append a single path segment onto the end of the URI path. |
| equal | `Uri.equal(second: Uri) -> gboolean` | gst_uri_equal | 1.6 | Compares two #GstUri objects to see if they represent the same normalized URI. |
| from_string_with_base | `Uri.from_string_with_base(uri: utf8) -> Uri` | gst_uri_from_string_with_base | 1.6 | Like gst_uri_from_string() but also joins with a base URI. |
| get_fragment | `Uri.get_fragment() -> utf8` | gst_uri_get_fragment | 1.6 | Get the fragment name from the URI or %NULL if it doesn't exist. If @uri is %NULL then returns %NULL. |
| get_host | `Uri.get_host() -> utf8` | gst_uri_get_host | 1.6 | Get the host name from the URI or %NULL if it doesn't exist. If @uri is %NULL then returns %NULL. |
| get_media_fragment_table | `Uri.get_media_fragment_table() -> GLib.HashTable` | gst_uri_get_media_fragment_table | 1.12 | Get the media fragment table from the URI, as defined by "Media Fragments URI 1.0". Hash table returned by this API is a list of "key-value" pairs,... |
| get_path | `Uri.get_path() -> utf8` | gst_uri_get_path | 1.6 | Extract the path string from the URI object. |
| get_path_segments | `Uri.get_path_segments() -> GLib.List` | gst_uri_get_path_segments | 1.6 | Get a list of path segments from the URI. |
| get_path_string | `Uri.get_path_string() -> utf8` | gst_uri_get_path_string | 1.6 | Extract the path string from the URI object as a percent encoded URI path. |
| get_port | `Uri.get_port() -> guint` | gst_uri_get_port | 1.6 | Get the port number from the URI or %GST_URI_NO_PORT if it doesn't exist. If @uri is %NULL then returns %GST_URI_NO_PORT. |
| get_query_keys | `Uri.get_query_keys() -> GLib.List` | gst_uri_get_query_keys | 1.6 | Get a list of the query keys from the URI. |
| get_query_string | `Uri.get_query_string() -> utf8` | gst_uri_get_query_string | 1.6 | Get a percent encoded URI query string from the @uri. |
| get_query_string_ordered | `Uri.get_query_string_ordered(keys: GLib.List?) -> utf8` | gst_uri_get_query_string_ordered | 1.24 | Get a percent encoded URI query string from the @uri, with query parameters in the order provided by the @keys list. Only parameter keys in the lis... |
| get_query_table | `Uri.get_query_table() -> GLib.HashTable` | gst_uri_get_query_table | 1.6 | Get the query table from the URI. Keys and values in the table are freed with g_free when they are deleted. A value may be %NULL to indicate that t... |
| get_query_value | `Uri.get_query_value(query_key: utf8) -> utf8` | gst_uri_get_query_value | 1.6 | Get the value associated with the @query_key key. Will return %NULL if the key has no value or if the key does not exist in the URI query table. Be... |
| get_scheme | `Uri.get_scheme() -> utf8` | gst_uri_get_scheme |  | Get the scheme name from the URI or %NULL if it doesn't exist. If @uri is %NULL then returns %NULL. |
| get_userinfo | `Uri.get_userinfo() -> utf8` | gst_uri_get_userinfo | 1.6 | Get the userinfo (usually in the form "username:password") from the URI or %NULL if it doesn't exist. If @uri is %NULL then returns %NULL. |
| is_normalized | `Uri.is_normalized() -> gboolean` | gst_uri_is_normalized | 1.6 | Tests the @uri to see if it is normalized. A %NULL @uri is considered to be normalized. |
| is_writable | `Uri.is_writable() -> gboolean` | gst_uri_is_writable | 1.6 | Check if it is safe to write to this #GstUri. Check if the refcount of @uri is exactly 1, meaning that no other reference exists to the #GstUri and... |
| join | `Uri.join(ref_uri: Uri?) -> Uri` | gst_uri_join | 1.6 | Join a reference URI onto a base URI using the method from RFC 3986. If either URI is %NULL then the other URI will be returned with the ref count ... |
| make_writable | `Uri.make_writable() -> Uri` | gst_uri_make_writable | 1.6 | Make the #GstUri writable. Checks if @uri is writable, and if so the original object is returned. If not, then a writable copy is made and returned... |
| new_with_base | `Uri.new_with_base(scheme: utf8?, userinfo: utf8?, host: utf8?, port: guint, path: utf8?, query: utf8?, fragment: utf8?) -> Uri` | gst_uri_new_with_base | 1.6 | Like gst_uri_new(), but joins the new URI onto a base URI. |
| normalize | `Uri.normalize() -> gboolean` | gst_uri_normalize | 1.6 | Normalization will remove extra path segments ("." and "..") from the URI. It will also convert the scheme and host name to lower case and any perc... |
| query_has_key | `Uri.query_has_key(query_key: utf8) -> gboolean` | gst_uri_query_has_key | 1.6 | Check if there is a query table entry for the @query_key key. |
| remove_query_key | `Uri.remove_query_key(query_key: utf8) -> gboolean` | gst_uri_remove_query_key | 1.6 | Remove an entry from the query table by key. |
| set_fragment | `Uri.set_fragment(fragment: utf8?) -> gboolean` | gst_uri_set_fragment | 1.6 | Sets the fragment string in the URI. Use a value of %NULL in @fragment to unset the fragment string. |
| set_host | `Uri.set_host(host: utf8) -> gboolean` | gst_uri_set_host | 1.6 | Set or unset the host for the URI. |
| set_path | `Uri.set_path(path: utf8?) -> gboolean` | gst_uri_set_path | 1.6 | Sets or unsets the path in the URI. |
| set_path_segments | `Uri.set_path_segments(path_segments: GLib.List?) -> gboolean` | gst_uri_set_path_segments | 1.6 | Replace the path segments list in the URI. |
| set_path_string | `Uri.set_path_string(path: utf8) -> gboolean` | gst_uri_set_path_string | 1.6 | Sets or unsets the path in the URI. |
| set_port | `Uri.set_port(port: guint) -> gboolean` | gst_uri_set_port | 1.6 | Set or unset the port number for the URI. |
| set_query_string | `Uri.set_query_string(query: utf8?) -> gboolean` | gst_uri_set_query_string | 1.6 | Sets or unsets the query table in the URI. |
| set_query_table | `Uri.set_query_table(query_table: GLib.HashTable?) -> gboolean` | gst_uri_set_query_table | 1.6 | Set the query table to use in the URI. The old table is unreferenced and a reference to the new one is used instead. A value if %NULL for @query_ta... |
| set_query_value | `Uri.set_query_value(query_key: utf8, query_value: utf8?) -> gboolean` | gst_uri_set_query_value | 1.6 | This inserts or replaces a key in the query table. A @query_value of %NULL indicates that the key has no associated value, but will still be presen... |
| set_scheme | `Uri.set_scheme(scheme: utf8) -> gboolean` | gst_uri_set_scheme | 1.6 | Set or unset the scheme for the URI. |
| set_userinfo | `Uri.set_userinfo(userinfo: utf8) -> gboolean` | gst_uri_set_userinfo | 1.6 | Set or unset the user information for the URI. |
| to_string | `Uri.to_string() -> utf8` | gst_uri_to_string | 1.6 | Convert the URI to a string. Returns the URI as held in this object as a #gchar* nul-terminated string. The caller should g_free() the string once ... |
| to_string_with_keys | `Uri.to_string_with_keys(keys: GLib.List?) -> utf8` | gst_uri_to_string_with_keys | 1.24 | Convert the URI to a string, with the query arguments in a specific order. Only the keys in the @keys list will be added to the resulting string. R... |

### Gst.URIHandlerInterface

C type: `GstURIHandlerInterface`

Any #GstElement using this interface should implement these methods.

#### Fields

| Field | Type |
| --- | --- |
| get_protocols | utf8 |
| get_type | URIType |
| get_uri | utf8 |
| parent | GObject.TypeInterface |
| set_uri | gboolean |

### Gst.ValueTable

C type: `GstValueTable`

VTable for the #GValue @type.

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| compare | ValueCompareFunc |
| deserialize | ValueDeserializeFunc |
| deserialize_with_pspec | ValueDeserializeWithPSpecFunc |
| serialize | ValueSerializeFunc |
| type | GType |

## Unions

### Gst.ABI

C type: `ABI`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| eventfullfunc | PadEventFullFunction |
| last_flowret | FlowReturn |

### Gst.ABI

C type: `ABI`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| flow_ret | FlowReturn |

### Gst.ABI

C type: `ABI`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| documentation_caps | Caps |
| gtype | GType |

### Gst.ABI

C type: `ABI`

#### Fields

| Field | Type |
| --- | --- |
| _gst_reserved | gpointer |
| priv | ControlBindingPrivate |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| buffer_get_max_memory | `buffer_get_max_memory() -> guint` | gst_buffer_get_max_memory | 1.2 | Gets the maximum amount of memory blocks that a buffer can hold. This is a compile time constant that can be queried with the function. When more m... |
| calculate_linear_regression | `calculate_linear_regression(xy: ClockTime, temp: ClockTime, n: guint, m_num: out ClockTime, m_denom: out ClockTime, b: out ClockTime, xbase: out ClockTime, r_squared: out gdouble) -> gboolean` | gst_calculate_linear_regression | 1.12 | Calculates the linear regression of the values @xy and places the result in @m_num, @m_denom, @b and @xbase, representing the function y(x) = m_num... |
| caps_features_from_string | `caps_features_from_string(features: utf8) -> CapsFeatures` | gst_caps_features_from_string | 1.2 | Creates a #GstCapsFeatures from a string representation. |
| caps_from_string | `caps_from_string(string: utf8) -> Caps` | gst_caps_from_string |  | Converts @caps from a string representation. The implementation of serialization up to 1.20 would lead to unexpected results when there were nested... |
| clear_mini_object | `clear_mini_object(object_ptr: MiniObject) -> none` | gst_clear_mini_object | 1.16 | Clears a reference to a #GstMiniObject. @object_ptr must not be %NULL. If the reference is %NULL then this function does nothing. Otherwise, the re... |
| clear_object | `clear_object(object_ptr: Object) -> none` | gst_clear_object | 1.16 | Clears a reference to a #GstObject. @object_ptr must not be %NULL. If the reference is %NULL then this function does nothing. Otherwise, the refere... |
| clear_structure | `clear_structure(structure_ptr: Structure) -> none` | gst_clear_structure | 1.16 | Clears a reference to a #GstStructure. @structure_ptr must not be %NULL. If the reference is %NULL then this function does nothing. Otherwise, the ... |
| core_error_quark | `core_error_quark() -> GLib.Quark` | gst_core_error_quark |  |  |
| debug_add_log_function | `debug_add_log_function(func: LogFunction, user_data: gpointer?, notify: GLib.DestroyNotify) -> none` | gst_debug_add_log_function |  | Adds the logging function to the list of logging functions. Be sure to use #G_GNUC_NO_INSTRUMENT on that function, it is needed. |
| debug_add_ring_buffer_logger | `debug_add_ring_buffer_logger(max_size_per_thread: guint, thread_timeout: guint) -> none` | gst_debug_add_ring_buffer_logger | 1.14 | Adds a memory ringbuffer based debug logger that stores up to @max_size_per_thread bytes of logs per thread and times out threads after @thread_tim... |
| debug_bin_to_dot_data | `debug_bin_to_dot_data(bin: Bin, details: DebugGraphDetails) -> utf8` | gst_debug_bin_to_dot_data |  | To aid debugging applications one can use this method to obtain the whole network of gstreamer elements that form the pipeline into a dot file. Thi... |
| debug_bin_to_dot_file | `debug_bin_to_dot_file(bin: Bin, details: DebugGraphDetails, file_name: filename) -> none` | gst_debug_bin_to_dot_file |  | To aid debugging applications one can use this method to write out the whole network of gstreamer elements that form the pipeline into a dot file. ... |
| debug_bin_to_dot_file_with_ts | `debug_bin_to_dot_file_with_ts(bin: Bin, details: DebugGraphDetails, file_name: filename) -> none` | gst_debug_bin_to_dot_file_with_ts |  | This works like gst_debug_bin_to_dot_file(), but adds the current timestamp to the filename, so that it can be used to take multiple snapshots. |
| debug_construct_term_color | `debug_construct_term_color(colorinfo: guint) -> utf8` | gst_debug_construct_term_color |  | Constructs a string that can be used for getting the desired color in color terminals. You need to free the string after use. |
| debug_construct_win_color | `debug_construct_win_color(colorinfo: guint) -> gint` | gst_debug_construct_win_color |  | Constructs an integer that can be used for getting the desired color in windows' terminals (cmd.exe). As there is no mean to underline, we simply i... |
| debug_get_all_categories | `debug_get_all_categories() -> GLib.SList` | gst_debug_get_all_categories |  | Returns a snapshot of a all categories that are currently in use . This list may change anytime. The caller has to free the list after use. |
| debug_get_color_mode | `debug_get_color_mode() -> DebugColorMode` | gst_debug_get_color_mode | 1.2 | Changes the coloring mode for debug output. |
| debug_get_default_threshold | `debug_get_default_threshold() -> DebugLevel` | gst_debug_get_default_threshold |  | Returns the default threshold that is used for new categories. |
| debug_get_stack_trace | `debug_get_stack_trace(flags: StackTraceFlags) -> utf8` | gst_debug_get_stack_trace | 1.12 | a stack trace, if libunwind or glibc backtrace are present, else %NULL. |
| debug_is_active | `debug_is_active() -> gboolean` | gst_debug_is_active |  | Checks if debugging output is activated. |
| debug_is_colored | `debug_is_colored() -> gboolean` | gst_debug_is_colored |  | Checks if the debugging output should be colored. |
| debug_level_get_name | `debug_level_get_name(level: DebugLevel) -> utf8` | gst_debug_level_get_name |  | Get the string representation of a debugging level |
| debug_log | `debug_log(category: DebugCategory, level: DebugLevel, file: utf8, function: utf8, line: gint, object: GObject.Object?, format: utf8, ...: void) -> none` | gst_debug_log |  | Logs the given message using the currently registered debugging handlers. |
| debug_log_default | `debug_log_default(category: DebugCategory, level: DebugLevel, file: utf8, function: utf8, line: gint, object: GObject.Object?, message: DebugMessage, user_data: gpointer?) -> none` | gst_debug_log_default |  | The default logging handler used by GStreamer. Logging functions get called whenever a macro like GST_DEBUG or similar is used. By default this fun... |
| debug_log_get_line | `debug_log_get_line(category: DebugCategory, level: DebugLevel, file: utf8, function: utf8, line: gint, object: GObject.Object?, message: DebugMessage) -> utf8` | gst_debug_log_get_line | 1.18 | Returns the string representation for the specified debug log message formatted in the same way as gst_debug_log_default() (the default handler), w... |
| debug_log_id | `debug_log_id(category: DebugCategory, level: DebugLevel, file: utf8, function: utf8, line: gint, id: utf8?, format: utf8, ...: void) -> none` | gst_debug_log_id | 1.22 | Logs the given message using the currently registered debugging handlers. |
| debug_log_id_literal | `debug_log_id_literal(category: DebugCategory, level: DebugLevel, file: utf8, function: utf8, line: gint, id: utf8?, message_string: utf8) -> none` | gst_debug_log_id_literal | 1.22 | Logs the given message using the currently registered debugging handlers. |
| debug_log_id_valist | `debug_log_id_valist(category: DebugCategory, level: DebugLevel, file: utf8, function: utf8, line: gint, id: utf8?, format: utf8, args: va_list) -> none` | gst_debug_log_id_valist | 1.22 | Logs the given message using the currently registered debugging handlers. |
| debug_log_literal | `debug_log_literal(category: DebugCategory, level: DebugLevel, file: utf8, function: utf8, line: gint, object: GObject.Object?, message_string: utf8) -> none` | gst_debug_log_literal | 1.20 | Logs the given message using the currently registered debugging handlers. |
| debug_log_valist | `debug_log_valist(category: DebugCategory, level: DebugLevel, file: utf8, function: utf8, line: gint, object: GObject.Object?, format: utf8, args: va_list) -> none` | gst_debug_log_valist |  | Logs the given message using the currently registered debugging handlers. |
| debug_print_stack_trace | `debug_print_stack_trace() -> none` | gst_debug_print_stack_trace |  | If libunwind, glibc backtrace or DbgHelp are present a stack trace is printed. |
| debug_remove_log_function | `debug_remove_log_function(func: LogFunction?) -> guint` | gst_debug_remove_log_function |  | Removes all registered instances of the given logging functions. |
| debug_remove_log_function_by_data | `debug_remove_log_function_by_data(data: gpointer?) -> guint` | gst_debug_remove_log_function_by_data |  | Removes all registered instances of log functions with the given user data. |
| debug_remove_ring_buffer_logger | `debug_remove_ring_buffer_logger() -> none` | gst_debug_remove_ring_buffer_logger | 1.14 | Removes any previously added ring buffer logger with gst_debug_add_ring_buffer_logger(). |
| debug_ring_buffer_logger_get_logs | `debug_ring_buffer_logger_get_logs() -> utf8` | gst_debug_ring_buffer_logger_get_logs | 1.14 | Fetches the current logs per thread from the ring buffer logger. See gst_debug_add_ring_buffer_logger() for details. |
| debug_set_active | `debug_set_active(active: gboolean) -> none` | gst_debug_set_active |  | If activated, debugging messages are sent to the debugging handlers. It makes sense to deactivate it for speed issues. > This function is not threa... |
| debug_set_color_mode | `debug_set_color_mode(mode: DebugColorMode) -> none` | gst_debug_set_color_mode | 1.2 | Changes the coloring mode for debug output. This function may be called before gst_init(). |
| debug_set_color_mode_from_string | `debug_set_color_mode_from_string(mode: utf8) -> none` | gst_debug_set_color_mode_from_string | 1.2 | Changes the coloring mode for debug output. This function may be called before gst_init(). |
| debug_set_colored | `debug_set_colored(colored: gboolean) -> none` | gst_debug_set_colored |  | Sets or unsets the use of coloured debugging output. Same as gst_debug_set_color_mode () with the argument being being GST_DEBUG_COLOR_MODE_ON or G... |
| debug_set_default_threshold | `debug_set_default_threshold(level: DebugLevel) -> none` | gst_debug_set_default_threshold |  | Sets the default threshold to the given level and updates all categories to use this threshold. This function may be called before gst_init(). |
| debug_set_threshold_for_name | `debug_set_threshold_for_name(name: utf8, level: DebugLevel) -> none` | gst_debug_set_threshold_for_name |  | Sets all categories which match the given glob style pattern to the given level. |
| debug_set_threshold_from_string | `debug_set_threshold_from_string(list: utf8, reset: gboolean) -> none` | gst_debug_set_threshold_from_string | 1.2 | Sets the debug logging wanted in the same form as with the GST_DEBUG environment variable. You can use wildcards such as `*`, but note that the ord... |
| debug_unset_threshold_for_name | `debug_unset_threshold_for_name(name: utf8) -> none` | gst_debug_unset_threshold_for_name |  | Resets all categories with the given name back to the default level. |
| deinit | `deinit() -> none` | gst_deinit |  | Clean up any resources created by GStreamer in gst_init(). It is normally not needed to call this function in a normal application as the resources... |
| dynamic_type_register | `dynamic_type_register(plugin: Plugin, type: GType) -> gboolean` | gst_dynamic_type_register | 1.12 | Registers a new #GstDynamicTypeFactory in the registry |
| error_get_message | `error_get_message(domain: GLib.Quark, code: gint) -> utf8` | gst_error_get_message |  | Get a string describing the error message in the current locale. |
| event_type_get_flags | `event_type_get_flags(type: EventType) -> EventTypeFlags` | gst_event_type_get_flags |  | Gets the #GstEventTypeFlags associated with @type. |
| event_type_get_name | `event_type_get_name(type: EventType) -> utf8` | gst_event_type_get_name |  | Get a printable name for the given event type. Do not modify or free. |
| event_type_to_quark | `event_type_to_quark(type: EventType) -> GLib.Quark` | gst_event_type_to_quark |  | Get the unique quark for the given event type. |
| event_type_to_sticky_ordering | `event_type_to_sticky_ordering(type: EventType) -> guint` | gst_event_type_to_sticky_ordering | 1.22 | Converts the #GstEventType to an unsigned integer that represents the ordering of sticky events when re-sending them. A lower value represents a hi... |
| filename_to_uri | `filename_to_uri(filename: filename) -> utf8 throws` | gst_filename_to_uri |  | Similar to g_filename_to_uri(), but attempts to handle relative file paths as well. Before converting @filename into an URI, it will be prefixed by... |
| flow_get_name | `flow_get_name(ret: FlowReturn) -> utf8` | gst_flow_get_name |  | Gets a string representing the given flow return. |
| flow_to_quark | `flow_to_quark(ret: FlowReturn) -> GLib.Quark` | gst_flow_to_quark |  | Get the unique quark for the given GstFlowReturn. |
| format_get_by_nick | `format_get_by_nick(nick: utf8) -> Format` | gst_format_get_by_nick |  | Return the format registered with the given nick. |
| format_get_details | `format_get_details(format: Format) -> FormatDefinition` | gst_format_get_details |  | Get details about the given format. |
| format_get_name | `format_get_name(format: Format) -> utf8` | gst_format_get_name |  | Get a printable name for the given format. Do not modify or free. |
| format_iterate_definitions | `format_iterate_definitions() -> Iterator` | gst_format_iterate_definitions |  | Iterate all the registered formats. The format definition is read only. |
| format_register | `format_register(nick: utf8, description: utf8) -> Format` | gst_format_register |  | Create a new GstFormat based on the nick or return an already registered format with that nick. |
| format_to_quark | `format_to_quark(format: Format) -> GLib.Quark` | gst_format_to_quark |  | Get the unique quark for the given format. |
| formats_contains | `formats_contains(formats: Format, format: Format) -> gboolean` | gst_formats_contains |  | See if the given format is inside the format array. |
| get_main_executable_path | `get_main_executable_path() -> utf8` | gst_get_main_executable_path | 1.14 | This helper is mostly helpful for plugins that need to inspect the folder of the main executable to determine their set of features. When a plugin ... |
| info_strdup_printf | `info_strdup_printf(format: utf8, ...: void) -> utf8` | gst_info_strdup_printf | 1.8 | Allocates, fills and returns a 0-terminated string from the printf style @format string and corresponding arguments. See gst_info_vasprintf() for w... |
| info_strdup_vprintf | `info_strdup_vprintf(format: utf8, args: va_list) -> utf8` | gst_info_strdup_vprintf | 1.8 | Allocates, fills and returns a null terminated string from the printf style @format string and @args. See gst_info_vasprintf() for when this functi... |
| info_vasprintf | `info_vasprintf(result: out utf8, format: utf8, args: va_list) -> gint` | gst_info_vasprintf | 1.8 | Allocates and fills a string large enough (including the terminating null byte) to hold the specified printf style @format and @args. This function... |
| init | `init(argc: inout gint?, argv: inout utf8?) -> none` | gst_init |  | Initializes the GStreamer library, setting up internal path lists, registering built-in elements, and loading standard plugins. Unless the plugin r... |
| init_check | `init_check(argc: inout gint?, argv: inout utf8?) -> gboolean throws` | gst_init_check |  | Initializes the GStreamer library, setting up internal path lists, registering built-in elements, and loading standard plugins. This function will ... |
| init_get_option_group | `init_get_option_group() -> GLib.OptionGroup` | gst_init_get_option_group |  | Returns a #GOptionGroup with GStreamer's argument specifications. The group is set up to use standard GOption callbacks, so when using this group i... |
| is_caps_features | `is_caps_features(obj: gpointer?) -> gboolean` | gst_is_caps_features |  | Checks if @obj is a #GstCapsFeatures |
| is_initialized | `is_initialized() -> gboolean` | gst_is_initialized |  | Use this function to check if GStreamer has been initialized with gst_init() or gst_init_check(). |
| library_error_quark | `library_error_quark() -> GLib.Quark` | gst_library_error_quark |  |  |
| make_element_message_details | `make_element_message_details(name: utf8, ...: void) -> Structure` | gst_make_element_message_details | 1.10 | Create a #GstStructure to be used with #gst_element_message_full_with_details. %NULL terminator required. |
| message_type_get_name | `message_type_get_name(type: MessageType) -> utf8` | gst_message_type_get_name |  | Get a printable name for the given message type. Do not modify or free. |
| message_type_to_quark | `message_type_to_quark(type: MessageType) -> GLib.Quark` | gst_message_type_to_quark |  | Get the unique quark for the given message type. |
| meta_api_type_get_tags | `meta_api_type_get_tags(api: GType) -> utf8` | gst_meta_api_type_get_tags | 1.2 | an array of tags as strings. |
| meta_api_type_has_tag | `meta_api_type_has_tag(api: GType, tag: GLib.Quark) -> gboolean` | gst_meta_api_type_has_tag |  | Check if @api was registered with @tag. |
| meta_api_type_register | `meta_api_type_register(api: utf8, tags: utf8) -> GType` | gst_meta_api_type_register |  | Register and return a GType for the @api and associate it with @tags. |
| meta_deserialize | `meta_deserialize(buffer: Buffer, data: guint8, size: gsize, consumed: out guint32) -> Meta` | gst_meta_deserialize | 1.24 | Recreate a #GstMeta from serialized data returned by gst_meta_serialize() and add it to @buffer. Note that the meta must have been previously regis... |
| meta_get_info | `meta_get_info(impl: utf8) -> MetaInfo` | gst_meta_get_info |  | Lookup a previously registered meta info structure by its implementation name @impl. |
| meta_info_new | `meta_info_new(api: GType, impl: utf8, size: gsize) -> MetaInfo` | gst_meta_info_new | 1.24 | Creates a new structure that needs to be filled before being registered. This structure should filled and then registered with gst_meta_info_regist... |
| meta_register | `meta_register(api: GType, impl: utf8, size: gsize, init_func: MetaInitFunction, free_func: MetaFreeFunction, transform_func: MetaTransformFunction) -> MetaInfo` | gst_meta_register |  | Register a new #GstMeta implementation. The same @info can be retrieved later with gst_meta_get_info() by using @impl as the key. |
| meta_register_custom | `meta_register_custom(name: utf8, tags: utf8, transform_func: CustomMetaTransformFunction?, user_data: gpointer?, destroy_data: GLib.DestroyNotify) -> MetaInfo` | gst_meta_register_custom | 1.20 | Register a new custom #GstMeta implementation, backed by an opaque structure holding a #GstStructure. The registered info can be retrieved later wi... |
| meta_register_custom_simple | `meta_register_custom_simple(name: utf8) -> MetaInfo` | gst_meta_register_custom_simple | 1.24 | Simplified version of gst_meta_register_custom(), with no tags and no transform function. |
| mini_object_replace | `mini_object_replace(olddata: inout MiniObject?, newdata: MiniObject?) -> gboolean` | gst_mini_object_replace |  | Atomically modifies a pointer to point to a new mini-object. The reference count of @olddata is decreased and the reference count of @newdata is in... |
| mini_object_steal | `mini_object_steal(olddata: inout MiniObject) -> MiniObject` | gst_mini_object_steal |  | Replace the current #GstMiniObject pointer to by @olddata with %NULL and return the old value. |
| mini_object_take | `mini_object_take(olddata: inout MiniObject, newdata: MiniObject) -> gboolean` | gst_mini_object_take |  | Modifies a pointer to point to a new mini-object. The modification is done atomically. This version is similar to gst_mini_object_replace() except ... |
| pad_mode_get_name | `pad_mode_get_name(mode: PadMode) -> utf8` | gst_pad_mode_get_name |  | Return the name of a pad mode, for use in debug messages mostly. |
| param_spec_array | `param_spec_array(name: utf8, nick: utf8, blurb: utf8, element_spec: GObject.ParamSpec, flags: GObject.ParamFlags) -> GObject.ParamSpec` | gst_param_spec_array | 1.14 | This function creates a GstArray GParamSpec for use by objects/elements that want to expose properties of GstArray type. This function is typically... |
| param_spec_fraction | `param_spec_fraction(name: utf8, nick: utf8, blurb: utf8, min_num: gint, min_denom: gint, max_num: gint, max_denom: gint, default_num: gint, default_denom: gint, flags: GObject.ParamFlags) -> GObject.ParamSpec` | gst_param_spec_fraction |  | This function creates a fraction GParamSpec for use by objects/elements that want to expose properties of fraction type. This function is typically... |
| parent_buffer_meta_api_get_type | `parent_buffer_meta_api_get_type() -> GType` | gst_parent_buffer_meta_api_get_type |  |  |
| parent_buffer_meta_get_info | `parent_buffer_meta_get_info() -> MetaInfo` | gst_parent_buffer_meta_get_info | 1.6 | Gets the global #GstMetaInfo describing the #GstParentBufferMeta meta. |
| parse_bin_from_description | `parse_bin_from_description(bin_description: utf8, ghost_unlinked_pads: gboolean) -> Bin throws` | gst_parse_bin_from_description |  | This is a convenience wrapper around gst_parse_launch() to create a #GstBin from a gst-launch-style pipeline description. See gst_parse_launch() an... |
| parse_bin_from_description_full | `parse_bin_from_description_full(bin_description: utf8, ghost_unlinked_pads: gboolean, context: ParseContext?, flags: ParseFlags) -> Element throws` | gst_parse_bin_from_description_full |  | This is a convenience wrapper around gst_parse_launch() to create a #GstBin from a gst-launch-style pipeline description. See gst_parse_launch() an... |
| parse_error_quark | `parse_error_quark() -> GLib.Quark` | gst_parse_error_quark |  | Get the error quark used by the parsing subsystem. |
| parse_launch | `parse_launch(pipeline_description: utf8) -> Element throws` | gst_parse_launch |  | Create a new pipeline based on command line syntax. Please note that you might get a return value that is not %NULL even though the @error is set. ... |
| parse_launch_full | `parse_launch_full(pipeline_description: utf8, context: ParseContext?, flags: ParseFlags) -> Element throws` | gst_parse_launch_full |  | Create a new pipeline based on command line syntax. Please note that you might get a return value that is not %NULL even though the @error is set. ... |
| parse_launchv | `parse_launchv(argv: utf8) -> Element throws` | gst_parse_launchv |  | Create a new element based on command line syntax. @error will contain an error message if an erroneous pipeline is specified. An error does not me... |
| parse_launchv_full | `parse_launchv_full(argv: utf8, context: ParseContext?, flags: ParseFlags) -> Element throws` | gst_parse_launchv_full |  | Create a new element based on command line syntax. @error will contain an error message if an erroneous pipeline is specified. An error does not me... |
| plugin_error_quark | `plugin_error_quark() -> GLib.Quark` | gst_plugin_error_quark |  | Get the error quark. |
| poll_new | `poll_new(controllable: gboolean) -> Poll` | gst_poll_new |  | Create a new file descriptor set. If @controllable, it is possible to restart or flush a call to gst_poll_wait() with gst_poll_restart() and gst_po... |
| poll_new_timer | `poll_new_timer() -> Poll` | gst_poll_new_timer |  | Create a new poll object that can be used for scheduling cancellable timeouts. A timeout is performed with gst_poll_wait(). Multiple timeouts can b... |
| preset_get_app_dir | `preset_get_app_dir() -> filename` | gst_preset_get_app_dir |  | Gets the directory for application specific presets if set by the application. |
| preset_set_app_dir | `preset_set_app_dir(app_dir: filename) -> gboolean` | gst_preset_set_app_dir |  | Sets an extra directory as an absolute path that should be considered when looking for presets. Any presets in the application dir will shadow the ... |
| print | `print(format: utf8, ...: void) -> none` | gst_print | 1.12 | Outputs a formatted message via the GLib print handler. The default print handler simply outputs the message to stdout. This function will not appe... |
| printerr | `printerr(format: utf8, ...: void) -> none` | gst_printerr | 1.12 | Outputs a formatted message via the GLib error message handler. The default handler simply outputs the message to stderr. This function will not ap... |
| printerrln | `printerrln(format: utf8, ...: void) -> none` | gst_printerrln | 1.12 | Outputs a formatted message via the GLib error message handler. The default handler simply outputs the message to stderr. This function will append... |
| println | `println(format: utf8, ...: void) -> none` | gst_println | 1.12 | Outputs a formatted message via the GLib print handler. The default print handler simply outputs the message to stdout. This function will append a... |
| protection_filter_systems_by_available_decryptors | `protection_filter_systems_by_available_decryptors(system_identifiers: utf8) -> utf8` | gst_protection_filter_systems_by_available_decryptors | 1.14 | Iterates the supplied list of UUIDs and checks the GstRegistry for all the decryptors supporting one of the supplied UUIDs. |
| protection_meta_api_get_type | `protection_meta_api_get_type() -> GType` | gst_protection_meta_api_get_type |  |  |
| protection_meta_get_info | `protection_meta_get_info() -> MetaInfo` | gst_protection_meta_get_info |  |  |
| protection_select_system | `protection_select_system(system_identifiers: utf8) -> utf8` | gst_protection_select_system | 1.6 | Iterates the supplied list of UUIDs and checks the GstRegistry for an element that supports one of the supplied UUIDs. If more than one element mat... |
| query_type_get_flags | `query_type_get_flags(type: QueryType) -> QueryTypeFlags` | gst_query_type_get_flags |  | Gets the #GstQueryTypeFlags associated with @type. |
| query_type_get_name | `query_type_get_name(type: QueryType) -> utf8` | gst_query_type_get_name |  | Get a printable name for the given query type. Do not modify or free. |
| query_type_to_quark | `query_type_to_quark(type: QueryType) -> GLib.Quark` | gst_query_type_to_quark |  | Get the unique quark for the given query type. |
| reference_timestamp_meta_api_get_type | `reference_timestamp_meta_api_get_type() -> GType` | gst_reference_timestamp_meta_api_get_type |  |  |
| reference_timestamp_meta_get_info | `reference_timestamp_meta_get_info() -> MetaInfo` | gst_reference_timestamp_meta_get_info | 1.14 | Gets the global #GstMetaInfo describing the #GstReferenceTimestampMeta meta. |
| resource_error_quark | `resource_error_quark() -> GLib.Quark` | gst_resource_error_quark |  |  |
| segtrap_is_enabled | `segtrap_is_enabled() -> gboolean` | gst_segtrap_is_enabled |  | Some functions in the GStreamer core might install a custom SIGSEGV handler to better catch and report errors to the application. Currently this fe... |
| segtrap_set_enabled | `segtrap_set_enabled(enabled: gboolean) -> none` | gst_segtrap_set_enabled |  | Applications might want to disable/enable the SIGSEGV handling of the GStreamer core. See gst_segtrap_is_enabled() for more information. |
| state_change_get_name | `state_change_get_name(transition: StateChange) -> utf8` | gst_state_change_get_name | 1.14 | Gets a string representing the given state transition. |
| static_caps_get_type | `static_caps_get_type() -> GType` | gst_static_caps_get_type |  |  |
| static_pad_template_get_type | `static_pad_template_get_type() -> GType` | gst_static_pad_template_get_type |  |  |
| stream_error_quark | `stream_error_quark() -> GLib.Quark` | gst_stream_error_quark |  |  |
| stream_type_get_name | `stream_type_get_name(stype: StreamType) -> utf8` | gst_stream_type_get_name | 1.10 | Get a descriptive string for a given #GstStreamType |
| structure_take | `structure_take(oldstr_ptr: inout Structure?, newstr: Structure?) -> gboolean` | gst_structure_take | 1.18 | Atomically modifies a pointer to point to a new structure. The #GstStructure @oldstr_ptr is pointing to is freed and @newstr is taken ownership ove... |
| tag_exists | `tag_exists(tag: utf8) -> gboolean` | gst_tag_exists |  | Checks if the given type is already registered. |
| tag_get_description | `tag_get_description(tag: utf8) -> utf8` | gst_tag_get_description |  | Returns the human-readable description of this tag, You must not change or free this string. |
| tag_get_flag | `tag_get_flag(tag: utf8) -> TagFlag` | gst_tag_get_flag |  | Gets the flag of @tag. |
| tag_get_nick | `tag_get_nick(tag: utf8) -> utf8` | gst_tag_get_nick |  | Returns the human-readable name of this tag, You must not change or free this string. |
| tag_get_type | `tag_get_type(tag: utf8) -> GType` | gst_tag_get_type |  | Gets the #GType used for this tag. |
| tag_is_fixed | `tag_is_fixed(tag: utf8) -> gboolean` | gst_tag_is_fixed |  | Checks if the given tag is fixed. A fixed tag can only contain one value. Unfixed tags can contain lists of values. |
| tag_list_copy_value | `tag_list_copy_value(dest: out GObject.Value, list: TagList, tag: utf8) -> gboolean` | gst_tag_list_copy_value |  | Copies the contents for the given tag into the value, merging multiple values into one if multiple values are associated with the tag. You must g_v... |
| tag_merge_strings_with_comma | `tag_merge_strings_with_comma(dest: out GObject.Value, src: GObject.Value) -> none` | gst_tag_merge_strings_with_comma |  | This is a convenience function for the func argument of gst_tag_register(). It concatenates all given strings using a comma. The tag must be regist... |
| tag_merge_use_first | `tag_merge_use_first(dest: out GObject.Value, src: GObject.Value) -> none` | gst_tag_merge_use_first |  | This is a convenience function for the func argument of gst_tag_register(). It creates a copy of the first value from the list. |
| tag_register | `tag_register(name: utf8, flag: TagFlag, type: GType, nick: utf8, blurb: utf8, func: TagMergeFunc?) -> none` | gst_tag_register |  | Registers a new tag type for the use with GStreamer's type system. If a type with that name is already registered, that one is used. The old regist... |
| tag_register_static | `tag_register_static(name: utf8, flag: TagFlag, type: GType, nick: utf8, blurb: utf8, func: TagMergeFunc?) -> none` | gst_tag_register_static |  | Registers a new tag type for the use with GStreamer's type system. Same as gst_tag_register(), but @name, @nick, and @blurb must be static strings ... |
| toc_entry_type_get_nick | `toc_entry_type_get_nick(type: TocEntryType) -> utf8` | gst_toc_entry_type_get_nick |  | Converts @type to a string representation. |
| tracing_get_active_tracers | `tracing_get_active_tracers() -> GLib.List` | gst_tracing_get_active_tracers | 1.18 | Get a list of all active tracer objects owned by the tracing framework for the entirety of the run-time of the process or till gst_deinit() is called. |
| tracing_register_hook | `tracing_register_hook(tracer: Tracer, detail: utf8, func: GObject.Callback) -> none` | gst_tracing_register_hook | 1.8 | Register @func to be called when the trace hook @detail is getting invoked. Use %NULL for @detail to register to all hooks. |
| type_find_get_type | `type_find_get_type() -> GType` | gst_type_find_get_type |  |  |
| type_find_register | `type_find_register(plugin: Plugin?, name: utf8, rank: guint, func: TypeFindFunction, extensions: utf8?, possible_caps: Caps?, data: gpointer?, data_notify: GLib.DestroyNotify) -> gboolean` | gst_type_find_register |  | Registers a new typefind function to be used for typefinding. After registering this function will be available for typefinding. This function is t... |
| type_is_plugin_api | `type_is_plugin_api(type: GType, flags: out PluginAPIFlags?) -> gboolean` | gst_type_is_plugin_api | 1.18 | Checks if @type is plugin API. See gst_type_mark_as_plugin_api() for details. |
| type_mark_as_plugin_api | `type_mark_as_plugin_api(type: GType, flags: PluginAPIFlags) -> none` | gst_type_mark_as_plugin_api | 1.18 | Marks @type as plugin API. This should be called in `class_init` of elements that expose new types (i.e. enums, flags or internal GObjects) via pro... |
| update_registry | `update_registry() -> gboolean` | gst_update_registry |  | Forces GStreamer to re-scan its plugin paths and update the default plugin registry. Applications will almost never need to call this function, it ... |
| uri_construct | `uri_construct(protocol: utf8, location: utf8) -> utf8` | gst_uri_construct |  | Constructs a URI for a given valid protocol and location. Free-function: g_free |
| uri_error_quark | `uri_error_quark() -> GLib.Quark` | gst_uri_error_quark |  |  |
| uri_from_string | `uri_from_string(uri: utf8) -> Uri` | gst_uri_from_string | 1.6 | Parses a URI string into a new #GstUri object. Will return NULL if the URI cannot be parsed. |
| uri_from_string_escaped | `uri_from_string_escaped(uri: utf8) -> Uri` | gst_uri_from_string_escaped | 1.18 | Parses a URI string into a new #GstUri object. Will return NULL if the URI cannot be parsed. This is identical to gst_uri_from_string() except that... |
| uri_get_location | `uri_get_location(uri: utf8) -> utf8` | gst_uri_get_location |  | Extracts the location out of a given valid URI, ie. the protocol and "://" are stripped from the URI, which means that the location returned includ... |
| uri_get_protocol | `uri_get_protocol(uri: utf8) -> utf8` | gst_uri_get_protocol |  | Extracts the protocol out of a given valid URI. The returned string must be freed using g_free(). |
| uri_has_protocol | `uri_has_protocol(uri: utf8, protocol: utf8) -> gboolean` | gst_uri_has_protocol |  | Checks if the protocol of a given valid URI matches @protocol. |
| uri_is_valid | `uri_is_valid(uri: utf8) -> gboolean` | gst_uri_is_valid |  | Tests if the given string is a valid URI identifier. URIs start with a valid scheme followed by ":" and maybe a string identifying the location. |
| uri_join_strings | `uri_join_strings(base_uri: utf8, ref_uri: utf8) -> utf8` | gst_uri_join_strings | 1.6 | This is a convenience function to join two URI strings and return the result. The returned string should be g_free()'d after use. |
| uri_protocol_is_supported | `uri_protocol_is_supported(type: URIType, protocol: utf8) -> gboolean` | gst_uri_protocol_is_supported |  | Checks if an element exists that supports the given URI protocol. Note that a positive return value does not imply that a subsequent call to gst_el... |
| uri_protocol_is_valid | `uri_protocol_is_valid(protocol: utf8) -> gboolean` | gst_uri_protocol_is_valid |  | Tests if the given string is a valid protocol identifier. Protocols must consist of alphanumeric characters, '+', '-' and '.' and must start with a... |
| util_array_binary_search | `util_array_binary_search(array: gpointer?, num_elements: guint, element_size: gsize, search_func: GLib.CompareDataFunc, mode: SearchMode, search_data: gpointer?, user_data: gpointer?) -> gpointer` | gst_util_array_binary_search |  | Searches inside @array for @search_data by using the comparison function @search_func. @array must be sorted ascending. As @search_data is always p... |
| util_ceil_log2 | `util_ceil_log2(v: guint32) -> guint` | gst_util_ceil_log2 | 1.24 | Return a max num of log2. |
| util_double_to_fraction | `util_double_to_fraction(src: gdouble, dest_n: out gint, dest_d: out gint) -> none` | gst_util_double_to_fraction |  | Transforms a #gdouble to a fraction and simplifies the result. |
| util_dump_buffer | `util_dump_buffer(buf: Buffer) -> none` | gst_util_dump_buffer | 1.14 | Dumps the buffer memory into a hex representation. Useful for debugging. |
| util_dump_mem | `util_dump_mem(mem: guint8, size: guint) -> none` | gst_util_dump_mem |  | Dumps the memory block into a hex representation. Useful for debugging. |
| util_filename_compare | `util_filename_compare(a: filename, b: filename) -> gint` | gst_util_filename_compare | 1.24 | Compares the given filenames using natural ordering. |
| util_fraction_add | `util_fraction_add(a_n: gint, a_d: gint, b_n: gint, b_d: gint, res_n: out gint, res_d: out gint) -> gboolean` | gst_util_fraction_add |  | Adds the fractions @a_n/@a_d and @b_n/@b_d and stores the result in @res_n and @res_d. |
| util_fraction_compare | `util_fraction_compare(a_n: gint, a_d: gint, b_n: gint, b_d: gint) -> gint` | gst_util_fraction_compare |  | Compares the fractions @a_n/@a_d and @b_n/@b_d and returns -1 if a < b, 0 if a = b and 1 if a > b. |
| util_fraction_multiply | `util_fraction_multiply(a_n: gint, a_d: gint, b_n: gint, b_d: gint, res_n: out gint, res_d: out gint) -> gboolean` | gst_util_fraction_multiply |  | Multiplies the fractions @a_n/@a_d and @b_n/@b_d and stores the result in @res_n and @res_d. |
| util_fraction_to_double | `util_fraction_to_double(src_n: gint, src_d: gint, dest: out gdouble) -> none` | gst_util_fraction_to_double |  | Transforms a fraction to a #gdouble. |
| util_gdouble_to_guint64 | `util_gdouble_to_guint64(value: gdouble) -> guint64` | gst_util_gdouble_to_guint64 |  | @value casted to #guint64 |
| util_get_object_array | `util_get_object_array(object: GObject.Object, name: utf8, array: out GObject.ValueArray) -> gboolean` | gst_util_get_object_array | 1.12 | Get a property of type %GST_TYPE_ARRAY and transform it into a #GValueArray. This allow language bindings to get GST_TYPE_ARRAY properties which ar... |
| util_get_timestamp | `util_get_timestamp() -> ClockTime` | gst_util_get_timestamp |  | Get a timestamp as GstClockTime to be used for interval measurements. The timestamp should not be interpreted in any other way. |
| util_greatest_common_divisor | `util_greatest_common_divisor(a: gint, b: gint) -> gint` | gst_util_greatest_common_divisor |  | Calculates the greatest common divisor of @a and @b. |
| util_greatest_common_divisor_int64 | `util_greatest_common_divisor_int64(a: gint64, b: gint64) -> gint64` | gst_util_greatest_common_divisor_int64 |  | Calculates the greatest common divisor of @a and @b. |
| util_group_id_next | `util_group_id_next() -> guint` | gst_util_group_id_next |  | Return a constantly incrementing group id. This function is used to generate a new group-id for the stream-start event. This function never returns... |
| util_guint64_to_gdouble | `util_guint64_to_gdouble(value: guint64) -> gdouble` | gst_util_guint64_to_gdouble |  | @value casted to #gdouble |
| util_seqnum_compare | `util_seqnum_compare(s1: guint32, s2: guint32) -> gint32` | gst_util_seqnum_compare |  | Compare two sequence numbers, handling wraparound. The current implementation just returns (gint32)(@s1 - @s2). |
| util_seqnum_next | `util_seqnum_next() -> guint32` | gst_util_seqnum_next |  | Return a constantly incrementing sequence number. This function is used internally to GStreamer to be able to determine which events and messages a... |
| util_set_object_arg | `util_set_object_arg(object: GObject.Object, name: utf8, value: utf8) -> none` | gst_util_set_object_arg |  | Converts the string value to the type of the objects argument and sets the argument with it. Note that this function silently returns if @object ha... |
| util_set_object_array | `util_set_object_array(object: GObject.Object, name: utf8, array: GObject.ValueArray) -> gboolean` | gst_util_set_object_array | 1.12 | Transfer a #GValueArray to %GST_TYPE_ARRAY and set this value on the specified property name. This allow language bindings to set GST_TYPE_ARRAY pr... |
| util_set_value_from_string | `util_set_value_from_string(value: out GObject.Value, value_str: utf8) -> none` | gst_util_set_value_from_string |  | Converts the string to the type of the value and sets the value with it. Note that this function is dangerous as it does not return any indication ... |
| util_simplify_fraction | `util_simplify_fraction(numerator: gint, denominator: gint, n_terms: guint, threshold: guint) -> none` | gst_util_simplify_fraction | 1.24 | Calculates the simpler representation of @numerator and @denominator and update both values with the resulting simplified fraction. Simplify a frac... |
| util_uint64_scale | `util_uint64_scale(val: guint64, num: guint64, denom: guint64) -> guint64` | gst_util_uint64_scale |  | Scale @val by the rational number @num / @denom, avoiding overflows and underflows and without loss of precision. This function can potentially be ... |
| util_uint64_scale_ceil | `util_uint64_scale_ceil(val: guint64, num: guint64, denom: guint64) -> guint64` | gst_util_uint64_scale_ceil |  | Scale @val by the rational number @num / @denom, avoiding overflows and underflows and without loss of precision. This function can potentially be ... |
| util_uint64_scale_int | `util_uint64_scale_int(val: guint64, num: gint, denom: gint) -> guint64` | gst_util_uint64_scale_int |  | Scale @val by the rational number @num / @denom, avoiding overflows and underflows and without loss of precision. @num must be non-negative and @de... |
| util_uint64_scale_int_ceil | `util_uint64_scale_int_ceil(val: guint64, num: gint, denom: gint) -> guint64` | gst_util_uint64_scale_int_ceil |  | Scale @val by the rational number @num / @denom, avoiding overflows and underflows and without loss of precision. @num must be non-negative and @de... |
| util_uint64_scale_int_round | `util_uint64_scale_int_round(val: guint64, num: gint, denom: gint) -> guint64` | gst_util_uint64_scale_int_round |  | Scale @val by the rational number @num / @denom, avoiding overflows and underflows and without loss of precision. @num must be non-negative and @de... |
| util_uint64_scale_round | `util_uint64_scale_round(val: guint64, num: guint64, denom: guint64) -> guint64` | gst_util_uint64_scale_round |  | Scale @val by the rational number @num / @denom, avoiding overflows and underflows and without loss of precision. This function can potentially be ... |
| value_can_compare | `value_can_compare(value1: GObject.Value, value2: GObject.Value) -> gboolean` | gst_value_can_compare |  | Determines if @value1 and @value2 can be compared. |
| value_can_intersect | `value_can_intersect(value1: GObject.Value, value2: GObject.Value) -> gboolean` | gst_value_can_intersect |  | Determines if intersecting two values will produce a valid result. Two values will produce a valid intersection if they have the same type. |
| value_can_subtract | `value_can_subtract(minuend: GObject.Value, subtrahend: GObject.Value) -> gboolean` | gst_value_can_subtract |  | Checks if it's possible to subtract @subtrahend from @minuend. |
| value_can_union | `value_can_union(value1: GObject.Value, value2: GObject.Value) -> gboolean` | gst_value_can_union |  | Determines if @value1 and @value2 can be non-trivially unioned. Any two values can be trivially unioned by adding both of them to a GstValueList. H... |
| value_compare | `value_compare(value1: GObject.Value, value2: GObject.Value) -> gint` | gst_value_compare |  | Compares @value1 and @value2. If @value1 and @value2 cannot be compared, the function returns GST_VALUE_UNORDERED. Otherwise, if @value1 is greater... |
| value_deserialize | `value_deserialize(dest: out GObject.Value, src: utf8) -> gboolean` | gst_value_deserialize |  | Tries to deserialize a string into the type specified by the given GValue. If the operation succeeds, %TRUE is returned, %FALSE otherwise. |
| value_deserialize_with_pspec | `value_deserialize_with_pspec(dest: out GObject.Value, src: utf8, pspec: GObject.ParamSpec?) -> gboolean` | gst_value_deserialize_with_pspec | 1.20 | Tries to deserialize a string into the type specified by the given GValue. @pspec may be used to guide the deserializing of nested members. If the ... |
| value_fixate | `value_fixate(dest: GObject.Value, src: GObject.Value) -> gboolean` | gst_value_fixate |  | Fixate @src into a new value @dest. For ranges, the first element is taken. For lists and arrays, the first item is fixated and returned. If @src i... |
| value_fraction_multiply | `value_fraction_multiply(product: GObject.Value, factor1: GObject.Value, factor2: GObject.Value) -> gboolean` | gst_value_fraction_multiply |  | Multiplies the two #GValue items containing a #GST_TYPE_FRACTION and sets @product to the product of the two fractions. |
| value_fraction_subtract | `value_fraction_subtract(dest: GObject.Value, minuend: GObject.Value, subtrahend: GObject.Value) -> gboolean` | gst_value_fraction_subtract |  | Subtracts the @subtrahend from the @minuend and sets @dest to the result. |
| value_get_bitmask | `value_get_bitmask(value: GObject.Value) -> guint64` | gst_value_get_bitmask |  | Gets the bitmask specified by @value. |
| value_get_caps | `value_get_caps(value: GObject.Value) -> Caps` | gst_value_get_caps |  | Gets the contents of @value. The reference count of the returned #GstCaps will not be modified, therefore the caller must take one before getting r... |
| value_get_caps_features | `value_get_caps_features(value: GObject.Value) -> CapsFeatures` | gst_value_get_caps_features |  | Gets the contents of @value. |
| value_get_double_range_max | `value_get_double_range_max(value: GObject.Value) -> gdouble` | gst_value_get_double_range_max |  | Gets the maximum of the range specified by @value. |
| value_get_double_range_min | `value_get_double_range_min(value: GObject.Value) -> gdouble` | gst_value_get_double_range_min |  | Gets the minimum of the range specified by @value. |
| value_get_flagset_flags | `value_get_flagset_flags(value: GObject.Value) -> guint` | gst_value_get_flagset_flags | 1.6 | Retrieve the flags field of a GstFlagSet @value. |
| value_get_flagset_mask | `value_get_flagset_mask(value: GObject.Value) -> guint` | gst_value_get_flagset_mask | 1.6 | Retrieve the mask field of a GstFlagSet @value. |
| value_get_fraction_denominator | `value_get_fraction_denominator(value: GObject.Value) -> gint` | gst_value_get_fraction_denominator |  | Gets the denominator of the fraction specified by @value. |
| value_get_fraction_numerator | `value_get_fraction_numerator(value: GObject.Value) -> gint` | gst_value_get_fraction_numerator |  | Gets the numerator of the fraction specified by @value. |
| value_get_fraction_range_max | `value_get_fraction_range_max(value: GObject.Value) -> GObject.Value` | gst_value_get_fraction_range_max |  | Gets the maximum of the range specified by @value. |
| value_get_fraction_range_min | `value_get_fraction_range_min(value: GObject.Value) -> GObject.Value` | gst_value_get_fraction_range_min |  | Gets the minimum of the range specified by @value. |
| value_get_int64_range_max | `value_get_int64_range_max(value: GObject.Value) -> gint64` | gst_value_get_int64_range_max |  | Gets the maximum of the range specified by @value. |
| value_get_int64_range_min | `value_get_int64_range_min(value: GObject.Value) -> gint64` | gst_value_get_int64_range_min |  | Gets the minimum of the range specified by @value. |
| value_get_int64_range_step | `value_get_int64_range_step(value: GObject.Value) -> gint64` | gst_value_get_int64_range_step |  | Gets the step of the range specified by @value. |
| value_get_int_range_max | `value_get_int_range_max(value: GObject.Value) -> gint` | gst_value_get_int_range_max |  | Gets the maximum of the range specified by @value. |
| value_get_int_range_min | `value_get_int_range_min(value: GObject.Value) -> gint` | gst_value_get_int_range_min |  | Gets the minimum of the range specified by @value. |
| value_get_int_range_step | `value_get_int_range_step(value: GObject.Value) -> gint` | gst_value_get_int_range_step |  | Gets the step of the range specified by @value. |
| value_get_structure | `value_get_structure(value: GObject.Value) -> Structure` | gst_value_get_structure |  | Gets the contents of @value. |
| value_init_and_copy | `value_init_and_copy(dest: out GObject.Value, src: GObject.Value) -> none` | gst_value_init_and_copy |  | Initialises the target value to be of the same type as source and then copies the contents from source to target. |
| value_intersect | `value_intersect(dest: out GObject.Value?, value1: GObject.Value, value2: GObject.Value) -> gboolean` | gst_value_intersect |  | Calculates the intersection of two values. If the values have a non-empty intersection, the value representing the intersection is placed in @dest,... |
| value_is_fixed | `value_is_fixed(value: GObject.Value) -> gboolean` | gst_value_is_fixed |  | Tests if the given GValue, if available in a GstStructure (or any other container) contains a "fixed" (which means: one value) or an "unfixed" (whi... |
| value_is_subset | `value_is_subset(value1: GObject.Value, value2: GObject.Value) -> gboolean` | gst_value_is_subset |  | Check that @value1 is a subset of @value2. |
| value_register | `value_register(table: ValueTable) -> none` | gst_value_register |  | Registers functions to perform calculations on #GValue items of a given type. Each type can only be added once. |
| value_serialize | `value_serialize(value: GObject.Value) -> utf8` | gst_value_serialize |  | tries to transform the given @value into a string representation that allows getting back this string later on using gst_value_deserialize(). Free-... |
| value_set_bitmask | `value_set_bitmask(value: GObject.Value, bitmask: guint64) -> none` | gst_value_set_bitmask |  | Sets @value to the bitmask specified by @bitmask. |
| value_set_caps | `value_set_caps(value: GObject.Value, caps: Caps) -> none` | gst_value_set_caps |  | Sets the contents of @value to @caps. A reference to the provided @caps will be taken by the @value. |
| value_set_caps_features | `value_set_caps_features(value: GObject.Value, features: CapsFeatures) -> none` | gst_value_set_caps_features |  | Sets the contents of @value to @features. |
| value_set_double_range | `value_set_double_range(value: GObject.Value, start: gdouble, end: gdouble) -> none` | gst_value_set_double_range |  | Sets @value to the range specified by @start and @end. |
| value_set_flagset | `value_set_flagset(value: GObject.Value, flags: guint, mask: guint) -> none` | gst_value_set_flagset | 1.6 | Sets @value to the flags and mask values provided in @flags and @mask. The @flags value indicates the values of flags, the @mask represents which b... |
| value_set_fraction | `value_set_fraction(value: GObject.Value, numerator: gint, denominator: gint) -> none` | gst_value_set_fraction |  | Sets @value to the fraction specified by @numerator over @denominator. The fraction gets reduced to the smallest numerator and denominator, and if ... |
| value_set_fraction_range | `value_set_fraction_range(value: GObject.Value, start: GObject.Value, end: GObject.Value) -> none` | gst_value_set_fraction_range |  | Sets @value to the range specified by @start and @end. |
| value_set_fraction_range_full | `value_set_fraction_range_full(value: GObject.Value, numerator_start: gint, denominator_start: gint, numerator_end: gint, denominator_end: gint) -> none` | gst_value_set_fraction_range_full |  | Sets @value to the range specified by @numerator_start/@denominator_start and @numerator_end/@denominator_end. |
| value_set_int64_range | `value_set_int64_range(value: GObject.Value, start: gint64, end: gint64) -> none` | gst_value_set_int64_range |  | Sets @value to the range specified by @start and @end. |
| value_set_int64_range_step | `value_set_int64_range_step(value: GObject.Value, start: gint64, end: gint64, step: gint64) -> none` | gst_value_set_int64_range_step |  | Sets @value to the range specified by @start, @end and @step. |
| value_set_int_range | `value_set_int_range(value: GObject.Value, start: gint, end: gint) -> none` | gst_value_set_int_range |  | Sets @value to the range specified by @start and @end. |
| value_set_int_range_step | `value_set_int_range_step(value: GObject.Value, start: gint, end: gint, step: gint) -> none` | gst_value_set_int_range_step |  | Sets @value to the range specified by @start, @end and @step. |
| value_set_structure | `value_set_structure(value: GObject.Value, structure: Structure) -> none` | gst_value_set_structure |  | Sets the contents of @value to @structure. |
| value_subtract | `value_subtract(dest: out GObject.Value?, minuend: GObject.Value, subtrahend: GObject.Value) -> gboolean` | gst_value_subtract |  | Subtracts @subtrahend from @minuend and stores the result in @dest. Note that this means subtraction as in sets, not as in mathematics. |
| value_union | `value_union(dest: out GObject.Value, value1: GObject.Value, value2: GObject.Value) -> gboolean` | gst_value_union |  | Creates a GValue corresponding to the union of @value1 and @value2. |
| version | `version(major: out guint, minor: out guint, micro: out guint, nano: out guint) -> none` | gst_version |  | Gets the version number of the GStreamer library. |
| version_string | `version_string() -> utf8` | gst_version_string |  | This function returns a string that is useful for describing this version of GStreamer to the outside world: user agent strings, logging, ... |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| BufferForeachMetaFunc | `BufferForeachMetaFunc(buffer: Buffer, meta: out Meta?, user_data: gpointer?) -> gboolean` |  |  | A function that will be called from gst_buffer_foreach_meta(). The @meta field will point to a the reference of the meta. @buffer should not be mod... |
| BufferListFunc | `BufferListFunc(buffer: out Buffer?, idx: guint, user_data: gpointer?) -> gboolean` |  |  | A function that will be called from gst_buffer_list_foreach(). The @buffer field will point to a the reference of the buffer at @idx. When this fun... |
| BusFunc | `BusFunc(bus: Bus, message: Message, user_data: gpointer?) -> gboolean` |  |  | Specifies the type of function passed to gst_bus_add_watch() or gst_bus_add_watch_full(), which is called from the mainloop when a message is avail... |
| BusSyncHandler | `BusSyncHandler(bus: Bus, message: Message, user_data: gpointer?) -> BusSyncReply` |  |  | Handler will be invoked synchronously, when a new message has been injected into the bus. This function is mostly used internally. Only one sync ha... |
| CapsFilterMapFunc | `CapsFilterMapFunc(features: CapsFeatures, structure: Structure, user_data: gpointer?) -> gboolean` |  |  | A function that will be called in gst_caps_filter_and_map_in_place(). The function may modify @features and @structure, and both will be removed fr... |
| CapsForeachFunc | `CapsForeachFunc(features: CapsFeatures, structure: Structure, user_data: gpointer?) -> gboolean` |  | 1.6 | A function that will be called in gst_caps_foreach(). The function may not modify @features or @structure. |
| CapsMapFunc | `CapsMapFunc(features: CapsFeatures, structure: Structure, user_data: gpointer?) -> gboolean` |  |  | A function that will be called in gst_caps_map_in_place(). The function may modify @features and @structure. |
| ClockCallback | `ClockCallback(clock: Clock, time: ClockTime, id: ClockID, user_data: gpointer?) -> gboolean` |  |  | The function prototype of the callback. |
| ControlBindingConvert | `ControlBindingConvert(binding: ControlBinding, src_value: gdouble, dest_value: GObject.Value) -> none` |  |  | FIXME(2.0): remove, this is unused |
| ControlSourceGetValue | `ControlSourceGetValue(self: ControlSource, timestamp: ClockTime, value: gdouble) -> gboolean` |  |  | Function for returning a value for a given timestamp. |
| ControlSourceGetValueArray | `ControlSourceGetValueArray(self: ControlSource, timestamp: ClockTime, interval: ClockTime, n_values: guint, values: gdouble) -> gboolean` |  |  | Function for returning an array of values starting at a given timestamp. |
| CustomMetaTransformFunction | `CustomMetaTransformFunction(transbuf: Buffer, meta: CustomMeta, buffer: Buffer, type: GLib.Quark, data: gpointer?, user_data: gpointer?) -> gboolean` |  | 1.20 | Function called for each @meta in @buffer as a result of performing a transformation that yields @transbuf. Additional @type specific transform dat... |
| DebugFuncPtr | `DebugFuncPtr() -> none` |  |  | we define this to avoid a compiler warning regarding a cast from a function pointer to a void pointer (see https://bugzilla.gnome.org/show_bug.cgi?... |
| ElementCallAsyncFunc | `ElementCallAsyncFunc(element: Element, user_data: gpointer?) -> none` |  |  | Callback prototype used in #gst_element_call_async |
| ElementForeachPadFunc | `ElementForeachPadFunc(element: Element, pad: Pad, user_data: gpointer?) -> gboolean` |  | 1.14 | Function called for each pad when using gst_element_foreach_sink_pad(), gst_element_foreach_src_pad(), or gst_element_foreach_pad(). |
| IteratorCopyFunction | `IteratorCopyFunction(it: Iterator, copy: Iterator) -> none` |  |  | This function will be called when creating a copy of @it and should create a copy of all custom iterator fields or increase their reference counts. |
| IteratorFoldFunction | `IteratorFoldFunction(item: GObject.Value, ret: GObject.Value, user_data: gpointer?) -> gboolean` |  |  | A function to be passed to gst_iterator_fold(). |
| IteratorForeachFunction | `IteratorForeachFunction(item: GObject.Value, user_data: gpointer?) -> none` |  |  | A function that is called by gst_iterator_foreach() for every element. |
| IteratorFreeFunction | `IteratorFreeFunction(it: Iterator) -> none` |  |  | This function will be called when the iterator is freed. Implementors of a #GstIterator should implement this function and pass it to the construct... |
| IteratorItemFunction | `IteratorItemFunction(it: Iterator, item: GObject.Value) -> IteratorItem` |  |  | The function that will be called after the next item of the iterator has been retrieved. This function can be used to skip items or stop the iterat... |
| IteratorNextFunction | `IteratorNextFunction(it: Iterator, result: GObject.Value) -> IteratorResult` |  |  | The function that will be called when the next element of the iterator should be retrieved. Implementors of a #GstIterator should implement this fu... |
| IteratorResyncFunction | `IteratorResyncFunction(it: Iterator) -> none` |  |  | This function will be called whenever a concurrent update happened to the iterated datastructure. The implementor of the iterator should restart th... |
| LogFunction | `LogFunction(category: DebugCategory, level: DebugLevel, file: utf8, function: utf8, line: gint, object: GObject.Object, message: DebugMessage, user_data: gpointer?) -> none` |  |  | Function prototype for a logging function that can be registered with gst_debug_add_log_function(). Use G_GNUC_NO_INSTRUMENT on that function. |
| MemoryCopyFunction | `MemoryCopyFunction(mem: Memory, offset: gssize, size: gssize) -> Memory` |  |  | Copy @size bytes from @mem starting at @offset and return them wrapped in a new GstMemory object. If @size is set to -1, all bytes starting at @off... |
| MemoryIsSpanFunction | `MemoryIsSpanFunction(mem1: Memory, mem2: Memory, offset: gsize) -> gboolean` |  |  | Check if @mem1 and @mem2 occupy contiguous memory and return the offset of @mem1 in the parent buffer in @offset. |
| MemoryMapFullFunction | `MemoryMapFullFunction(mem: Memory, info: MapInfo, maxsize: gsize) -> gpointer` |  |  | Get the memory of @mem that can be accessed according to the mode specified in @info's flags. The function should return a pointer that contains at... |
| MemoryMapFunction | `MemoryMapFunction(mem: Memory, maxsize: gsize, flags: MapFlags) -> gpointer` |  |  | Get the memory of @mem that can be accessed according to the mode specified in @flags. The function should return a pointer that contains at least ... |
| MemoryShareFunction | `MemoryShareFunction(mem: Memory, offset: gssize, size: gssize) -> Memory` |  |  | Share @size bytes from @mem starting at @offset and return them wrapped in a new GstMemory object. If @size is set to -1, all bytes starting at @of... |
| MemoryUnmapFullFunction | `MemoryUnmapFullFunction(mem: Memory, info: MapInfo) -> none` |  |  | Release the pointer previously retrieved with gst_memory_map() with @info. |
| MemoryUnmapFunction | `MemoryUnmapFunction(mem: Memory) -> none` |  |  | Release the pointer previously retrieved with gst_memory_map(). |
| MetaClearFunction | `MetaClearFunction(buffer: Buffer, meta: Meta) -> none` |  | 1.24 | Clears the content of the meta. This will be called by the GstBufferPool when a pooled buffer is returned. |
| MetaDeserializeFunction | `MetaDeserializeFunction(info: MetaInfo, buffer: Buffer, data: guint8, size: gsize, version: guint8) -> Meta` |  | 1.24 | Recreate a #GstMeta from serialized data returned by #GstMetaSerializeFunction and add it to @buffer. |
| MetaFreeFunction | `MetaFreeFunction(meta: Meta, buffer: Buffer) -> none` |  |  | Function called when @meta is freed in @buffer. |
| MetaInitFunction | `MetaInitFunction(meta: Meta, params: gpointer?, buffer: Buffer) -> gboolean` |  |  | Function called when @meta is initialized in @buffer. |
| MetaSerializeFunction | `MetaSerializeFunction(meta: Meta, data: ByteArrayInterface, version: out guint8) -> gboolean` |  | 1.24 | Serialize @meta into a format that can be stored or transmitted and later deserialized by #GstMetaDeserializeFunction. By default version is set to... |
| MetaTransformFunction | `MetaTransformFunction(transbuf: Buffer, meta: Meta, buffer: Buffer, type: GLib.Quark, data: gpointer?) -> gboolean` |  |  | Function called for each @meta in @buffer as a result of performing a transformation on @transbuf. Additional @type specific transform data is pass... |
| MiniObjectCopyFunction | `MiniObjectCopyFunction(obj: MiniObject) -> MiniObject` |  |  | Function prototype for methods to create copies of instances. |
| MiniObjectDisposeFunction | `MiniObjectDisposeFunction(obj: MiniObject) -> gboolean` |  |  | Function prototype for when a miniobject has lost its last refcount. Implementation of the mini object are allowed to revive the passed object by d... |
| MiniObjectFreeFunction | `MiniObjectFreeFunction(obj: MiniObject) -> none` |  |  | Virtual function prototype for methods to free resources used by mini-objects. |
| MiniObjectNotify | `MiniObjectNotify(user_data: gpointer?, obj: MiniObject) -> none` |  |  | A #GstMiniObjectNotify function can be added to a mini object as a callback that gets triggered when gst_mini_object_unref() drops the last ref and... |
| PadActivateFunction | `PadActivateFunction(pad: Pad, parent: Object) -> gboolean` |  |  | This function is called when the pad is activated during the element READY to PAUSED state change. By default this function will call the activate ... |
| PadActivateModeFunction | `PadActivateModeFunction(pad: Pad, parent: Object, mode: PadMode, active: gboolean) -> gboolean` |  |  | The prototype of the push and pull activate functions. |
| PadChainFunction | `PadChainFunction(pad: Pad, parent: Object?, buffer: Buffer) -> FlowReturn` |  |  | A function that will be called on sinkpads when chaining buffers. The function typically processes the data contained in the buffer and either cons... |
| PadChainListFunction | `PadChainListFunction(pad: Pad, parent: Object?, list: BufferList) -> FlowReturn` |  |  | A function that will be called on sinkpads when chaining buffer lists. The function typically processes the data contained in the buffer list and e... |
| PadEventFullFunction | `PadEventFullFunction(pad: Pad, parent: Object?, event: Event) -> FlowReturn` |  | 1.8 | Function signature to handle an event for the pad. This variant is for specific elements that will take into account the last downstream flow retur... |
| PadEventFunction | `PadEventFunction(pad: Pad, parent: Object?, event: Event) -> gboolean` |  |  | Function signature to handle an event for the pad. |
| PadForwardFunction | `PadForwardFunction(pad: Pad, user_data: gpointer?) -> gboolean` |  |  | A forward function is called for all internally linked pads, see gst_pad_forward(). |
| PadGetRangeFunction | `PadGetRangeFunction(pad: Pad, parent: Object?, offset: guint64, length: guint, buffer: Buffer) -> FlowReturn` |  |  | This function will be called on source pads when a peer element request a buffer at the specified @offset and @length. If this function returns #GS... |
| PadIterIntLinkFunction | `PadIterIntLinkFunction(pad: Pad, parent: Object?) -> Iterator` |  |  | The signature of the internal pad link iterator function. |
| PadLinkFunction | `PadLinkFunction(pad: Pad, parent: Object?, peer: Pad) -> PadLinkReturn` |  |  | Function signature to handle a new link on the pad. |
| PadProbeCallback | `PadProbeCallback(pad: Pad, info: PadProbeInfo, user_data: gpointer?) -> PadProbeReturn` |  |  | Callback used by gst_pad_add_probe(). Gets called to notify about the current blocking type. The callback is allowed to modify the data pointer in ... |
| PadQueryFunction | `PadQueryFunction(pad: Pad, parent: Object?, query: Query) -> gboolean` |  |  | The signature of the query function. |
| PadStickyEventsForeachFunction | `PadStickyEventsForeachFunction(pad: Pad, event: Event?, user_data: gpointer?) -> gboolean` |  |  | Callback used by gst_pad_sticky_events_foreach(). When this function returns %TRUE, the next event will be returned. When %FALSE is returned, gst_p... |
| PadUnlinkFunction | `PadUnlinkFunction(pad: Pad, parent: Object?) -> none` |  |  | Function signature to handle a unlinking the pad prom its peer. The pad's lock is already held when the unlink function is called, so most pad func... |
| PluginFeatureFilter | `PluginFeatureFilter(feature: PluginFeature, user_data: gpointer?) -> gboolean` |  |  | A function that can be used with e.g. gst_registry_feature_filter() to get a list of pluginfeature that match certain criteria. |
| PluginFilter | `PluginFilter(plugin: Plugin, user_data: gpointer?) -> gboolean` |  |  | A function that can be used with e.g. gst_registry_plugin_filter() to get a list of plugins that match certain criteria. |
| PluginInitFullFunc | `PluginInitFullFunc(plugin: Plugin, user_data: gpointer?) -> gboolean` |  |  | A plugin should provide a pointer to a function of either #GstPluginInitFunc or this type in the plugin_desc struct. The function will be called by... |
| PluginInitFunc | `PluginInitFunc(plugin: Plugin) -> gboolean` |  |  | A plugin should provide a pointer to a function of this type in the plugin_desc struct. This function will be called by the loader at startup. One ... |
| PromiseChangeFunc | `PromiseChangeFunc(promise: Promise, user_data: gpointer?) -> none` |  | 1.14 | a #GstPromise |
| StructureFilterMapFunc | `StructureFilterMapFunc(field_id: GLib.Quark, value: GObject.Value, user_data: gpointer?) -> gboolean` |  |  | A function that will be called in gst_structure_filter_and_map_in_place(). The function may modify @value, and the value will be removed from the s... |
| StructureForeachFunc | `StructureForeachFunc(field_id: GLib.Quark, value: GObject.Value, user_data: gpointer?) -> gboolean` |  |  | A function that will be called in gst_structure_foreach(). The function may not modify @value. |
| StructureMapFunc | `StructureMapFunc(field_id: GLib.Quark, value: GObject.Value, user_data: gpointer?) -> gboolean` |  |  | A function that will be called in gst_structure_map_in_place(). The function may modify @value. |
| TagForeachFunc | `TagForeachFunc(list: TagList, tag: utf8, user_data: gpointer?) -> none` |  |  | A function that will be called in gst_tag_list_foreach(). The function may not modify the tag list. |
| TagMergeFunc | `TagMergeFunc(dest: GObject.Value, src: GObject.Value) -> none` |  |  | A function for merging multiple values of a tag used when registering tags. |
| TaskFunction | `TaskFunction(user_data: gpointer?) -> none` |  |  | A function that will repeatedly be called in the thread created by a #GstTask. |
| TaskPoolFunction | `TaskPoolFunction(user_data: gpointer?) -> none` |  |  | Task function, see gst_task_pool_push(). |
| TaskThreadFunc | `TaskThreadFunc(task: Task, thread: GLib.Thread, user_data: gpointer?) -> none` |  |  | Custom GstTask thread callback functions that can be installed. |
| TypeFindFunction | `TypeFindFunction(find: TypeFind, user_data: gpointer?) -> none` |  |  | A function that will be called by typefinding. |
| ValueCompareFunc | `ValueCompareFunc(value1: GObject.Value, value2: GObject.Value) -> gint` |  |  | Used together with gst_value_compare() to compare #GValue items. |
| ValueDeserializeFunc | `ValueDeserializeFunc(dest: GObject.Value, s: utf8) -> gboolean` |  |  | Used by gst_value_deserialize() to parse a non-binary form into the #GValue. |
| ValueDeserializeWithPSpecFunc | `ValueDeserializeWithPSpecFunc(dest: GObject.Value, s: utf8, pspec: GObject.ParamSpec) -> gboolean` |  | 1.20 | Used by gst_value_deserialize_with_pspec() to parse a non-binary form into the #GValue. |
| ValueSerializeFunc | `ValueSerializeFunc(value1: GObject.Value) -> utf8` |  |  | Used by gst_value_serialize() to obtain a non-binary form of the #GValue. Free-function: g_free |

## Constants

| Name | Type |
| --- | --- |
| ALLOCATOR_SYSMEM | utf8 |
| BUFFER_COPY_ALL | BufferCopyFlags |
| BUFFER_COPY_METADATA | BufferCopyFlags |
| BUFFER_OFFSET_NONE | guint64 |
| CAN_INLINE | gint |
| CAPS_FEATURE_MEMORY_SYSTEM_MEMORY | utf8 |
| CLOCK_TIME_NONE | ClockTime |
| DEBUG_BG_MASK | gint |
| DEBUG_FG_MASK | gint |
| DEBUG_FORMAT_MASK | gint |
| ELEMENT_FACTORY_KLASS_DECODER | utf8 |
| ELEMENT_FACTORY_KLASS_DECRYPTOR | utf8 |
| ELEMENT_FACTORY_KLASS_DEMUXER | utf8 |
| ELEMENT_FACTORY_KLASS_DEPAYLOADER | utf8 |
| ELEMENT_FACTORY_KLASS_ENCODER | utf8 |
| ELEMENT_FACTORY_KLASS_ENCRYPTOR | utf8 |
| ELEMENT_FACTORY_KLASS_FORMATTER | utf8 |
| ELEMENT_FACTORY_KLASS_HARDWARE | utf8 |
| ELEMENT_FACTORY_KLASS_MEDIA_AUDIO | utf8 |
| ELEMENT_FACTORY_KLASS_MEDIA_IMAGE | utf8 |
| ELEMENT_FACTORY_KLASS_MEDIA_METADATA | utf8 |
| ELEMENT_FACTORY_KLASS_MEDIA_SUBTITLE | utf8 |
| ELEMENT_FACTORY_KLASS_MEDIA_VIDEO | utf8 |
| ELEMENT_FACTORY_KLASS_MUXER | utf8 |
| ELEMENT_FACTORY_KLASS_PARSER | utf8 |
| ELEMENT_FACTORY_KLASS_PAYLOADER | utf8 |
| ELEMENT_FACTORY_KLASS_SINK | utf8 |
| ELEMENT_FACTORY_KLASS_SRC | utf8 |
| ELEMENT_FACTORY_TYPE_ANY | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_AUDIO_ENCODER | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_AUDIOVIDEO_SINKS | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_DECODABLE | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_DECODER | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_DECRYPTOR | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_DEMUXER | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_DEPAYLOADER | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_ENCODER | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_ENCRYPTOR | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_FORMATTER | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_HARDWARE | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_MAX_ELEMENTS | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_MEDIA_ANY | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_MEDIA_AUDIO | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_MEDIA_IMAGE | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_MEDIA_METADATA | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_MEDIA_SUBTITLE | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_MEDIA_VIDEO | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_MUXER | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_PARSER | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_PAYLOADER | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_SINK | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_SRC | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_TIMESTAMPER | ElementFactoryListType |
| ELEMENT_FACTORY_TYPE_VIDEO_ENCODER | ElementFactoryListType |
| ELEMENT_METADATA_AUTHOR | utf8 |
| ELEMENT_METADATA_DESCRIPTION | utf8 |
| ELEMENT_METADATA_DOC_URI | utf8 |
| ELEMENT_METADATA_ICON_NAME | utf8 |
| ELEMENT_METADATA_KLASS | utf8 |
| ELEMENT_METADATA_LONGNAME | utf8 |
| ERROR_SYSTEM | utf8 |
| EVENT_NUM_SHIFT | gint |
| EVENT_TYPE_BOTH | EventTypeFlags |
| FLAG_SET_MASK_EXACT | guint |
| FORMAT_PERCENT_MAX | gint64 |
| FORMAT_PERCENT_SCALE | gint64 |
| FOURCC_FORMAT | utf8 |
| GROUP_ID_INVALID | gint |
| LICENSE_UNKNOWN | utf8 |
| LOCK_FLAG_READWRITE | LockFlags |
| MAP_READWRITE | MapFlags |
| META_TAG_MEMORY_REFERENCE_STR | utf8 |
| META_TAG_MEMORY_STR | utf8 |
| MSECOND | ClockTimeDiff |
| NSECOND | ClockTimeDiff |
| PARAM_CONDITIONALLY_AVAILABLE | gint |
| PARAM_CONTROLLABLE | gint |
| PARAM_DOC_SHOW_DEFAULT | gint |
| PARAM_MUTABLE_PAUSED | gint |
| PARAM_MUTABLE_PLAYING | gint |
| PARAM_MUTABLE_READY | gint |
| PARAM_USER_SHIFT | gint |
| PROTECTION_SYSTEM_ID_CAPS_FIELD | utf8 |
| PROTECTION_UNSPECIFIED_SYSTEM_ID | utf8 |
| PTR_FORMAT | utf8 |
| QUERY_NUM_SHIFT | gint |
| QUERY_TYPE_BOTH | QueryTypeFlags |
| SECOND | ClockTimeDiff |
| SEGMENT_FORMAT | utf8 |
| SEGMENT_INSTANT_FLAGS | gint |
| SEQNUM_INVALID | gint |
| STIME_FORMAT | utf8 |
| STIMEP_FORMAT | utf8 |
| TAG_ALBUM | utf8 |
| TAG_ALBUM_ARTIST | utf8 |
| TAG_ALBUM_ARTIST_SORTNAME | utf8 |
| TAG_ALBUM_GAIN | utf8 |
| TAG_ALBUM_PEAK | utf8 |
| TAG_ALBUM_SORTNAME | utf8 |
| TAG_ALBUM_VOLUME_COUNT | utf8 |
| TAG_ALBUM_VOLUME_NUMBER | utf8 |
| TAG_APPLICATION_DATA | utf8 |
| TAG_APPLICATION_NAME | utf8 |
| TAG_ARTIST | utf8 |
| TAG_ARTIST_SORTNAME | utf8 |
| TAG_ATTACHMENT | utf8 |
| TAG_AUDIO_CODEC | utf8 |
| TAG_BEATS_PER_MINUTE | utf8 |
| TAG_BITRATE | utf8 |
| TAG_CODEC | utf8 |
| TAG_COMMENT | utf8 |
| TAG_COMPOSER | utf8 |
| TAG_COMPOSER_SORTNAME | utf8 |
| TAG_CONDUCTOR | utf8 |
| TAG_CONTACT | utf8 |
| TAG_CONTAINER_FORMAT | utf8 |
| TAG_CONTAINER_SPECIFIC_TRACK_ID | utf8 |
| TAG_COPYRIGHT | utf8 |
| TAG_COPYRIGHT_URI | utf8 |
| TAG_DATE | utf8 |
| TAG_DATE_TIME | utf8 |
| TAG_DESCRIPTION | utf8 |
| TAG_DEVICE_MANUFACTURER | utf8 |
| TAG_DEVICE_MODEL | utf8 |
| TAG_DURATION | utf8 |
| TAG_ENCODED_BY | utf8 |
| TAG_ENCODER | utf8 |
| TAG_ENCODER_VERSION | utf8 |
| TAG_EXTENDED_COMMENT | utf8 |
| TAG_GENRE | utf8 |
| TAG_GEO_LOCATION_CAPTURE_DIRECTION | utf8 |
| TAG_GEO_LOCATION_CITY | utf8 |
| TAG_GEO_LOCATION_COUNTRY | utf8 |
| TAG_GEO_LOCATION_ELEVATION | utf8 |
| TAG_GEO_LOCATION_HORIZONTAL_ERROR | utf8 |
| TAG_GEO_LOCATION_LATITUDE | utf8 |
| TAG_GEO_LOCATION_LONGITUDE | utf8 |
| TAG_GEO_LOCATION_MOVEMENT_DIRECTION | utf8 |
| TAG_GEO_LOCATION_MOVEMENT_SPEED | utf8 |
| TAG_GEO_LOCATION_NAME | utf8 |
| TAG_GEO_LOCATION_SUBLOCATION | utf8 |
| TAG_GROUPING | utf8 |
| TAG_HOMEPAGE | utf8 |
| TAG_IMAGE | utf8 |
| TAG_IMAGE_ORIENTATION | utf8 |
| TAG_INTERPRETED_BY | utf8 |
| TAG_ISRC | utf8 |
| TAG_KEYWORDS | utf8 |
| TAG_LANGUAGE_CODE | utf8 |
| TAG_LANGUAGE_NAME | utf8 |
| TAG_LICENSE | utf8 |
| TAG_LICENSE_URI | utf8 |
| TAG_LOCATION | utf8 |
| TAG_LYRICS | utf8 |
| TAG_MAXIMUM_BITRATE | utf8 |
| TAG_MIDI_BASE_NOTE | utf8 |
| TAG_MINIMUM_BITRATE | utf8 |
| TAG_NOMINAL_BITRATE | utf8 |
| TAG_ORGANIZATION | utf8 |
| TAG_PERFORMER | utf8 |
| TAG_PREVIEW_IMAGE | utf8 |
| TAG_PRIVATE_DATA | utf8 |
| TAG_PUBLISHER | utf8 |
| TAG_REFERENCE_LEVEL | utf8 |
| TAG_SERIAL | utf8 |
| TAG_SHOW_EPISODE_NUMBER | utf8 |
| TAG_SHOW_NAME | utf8 |
| TAG_SHOW_SEASON_NUMBER | utf8 |
| TAG_SHOW_SORTNAME | utf8 |
| TAG_SUBTITLE_CODEC | utf8 |
| TAG_TITLE | utf8 |
| TAG_TITLE_SORTNAME | utf8 |
| TAG_TRACK_COUNT | utf8 |
| TAG_TRACK_GAIN | utf8 |
| TAG_TRACK_NUMBER | utf8 |
| TAG_TRACK_PEAK | utf8 |
| TAG_USER_RATING | utf8 |
| TAG_VERSION | utf8 |
| TAG_VIDEO_CODEC | utf8 |
| TIME_FORMAT | utf8 |
| TIMEP_FORMAT | utf8 |
| TOC_REPEAT_COUNT_INFINITE | gint |
| URI_NO_PORT | gint |
| USECOND | ClockTimeDiff |
| VALUE_EQUAL | gint |
| VALUE_GREATER_THAN | gint |
| VALUE_LESS_THAN | gint |
| VALUE_UNORDERED | gint |
| VERSION_MAJOR | gint |
| VERSION_MICRO | gint |
| VERSION_MINOR | gint |
| VERSION_NANO | gint |

## Aliases

| Name | Type |
| --- | --- |
| BufferMapInfo | MapInfo |
| ClockID | gpointer |
| ClockTime | guint64 |
| ClockTimeDiff | gint64 |
| ElementFactoryListType | guint64 |
| MemoryMapInfo | MapInfo |

