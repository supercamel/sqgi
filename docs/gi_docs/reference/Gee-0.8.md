# Gee 0.8

SQGI import: `import("Gee", "0.8")`

Packages: `gee-0.8`
Includes: `GObject-2.0`, `GLib-2.0`, `Gio-2.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 30 |
| Interfaces | 24 |
| Records | 86 |
| Unions | 0 |
| Enums | 5 |
| Flags | 0 |
| Functions | 10 |
| Callbacks | 13 |
| Constants | 0 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| AbstractBidirList | Gee.AbstractList | 3 | 0 | 12 |  |
| AbstractBidirSortedMap | Gee.AbstractSortedMap | 1 | 0 | 12 |  |
| AbstractBidirSortedSet | Gee.AbstractSortedSet | 1 | 0 | 12 |  |
| AbstractCollection | GObject.Object | 4 | 0 | 19 |  |
| AbstractList | Gee.AbstractCollection | 2 | 0 | 18 |  |
| AbstractMap | GObject.Object | 2 | 0 | 25 |  |
| AbstractMultiMap | GObject.Object | 2 | 0 | 13 |  |
| AbstractMultiSet | Gee.AbstractCollection | 2 | 0 | 10 |  |
| AbstractQueue | Gee.AbstractCollection | 2 | 0 | 15 |  |
| AbstractSet | Gee.AbstractCollection | 2 | 0 | 11 |  |
| AbstractSortedMap | Gee.AbstractMap | 1 | 0 | 15 |  |
| AbstractSortedSet | Gee.AbstractSet | 2 | 0 | 21 |  |
| ArrayList | Gee.AbstractBidirList | 0 | 0 | 4 |  |
| ArrayQueue | Gee.AbstractQueue | 0 | 0 | 3 |  |
| ConcurrentList | Gee.AbstractList | 0 | 0 | 3 |  |
| ConcurrentSet | Gee.AbstractSortedSet | 0 | 0 | 1 |  |
| HashMap | Gee.AbstractMap | 0 | 0 | 4 |  |
| HashMultiMap | Gee.AbstractMultiMap | 0 | 0 | 5 |  |
| HashMultiSet | Gee.AbstractMultiSet | 0 | 0 | 4 |  |
| HashSet | Gee.AbstractSet | 0 | 0 | 3 |  |
| Lazy |  | 0 | 0 | 6 |  |
| LinkedList | Gee.AbstractBidirList | 0 | 0 | 4 |  |
| MapEntry | GObject.Object | 0 | 0 | 4 |  |
| PriorityQueue | Gee.AbstractQueue | 0 | 0 | 4 |  |
| Promise |  | 0 | 0 | 4 |  |
| TreeMap | Gee.AbstractBidirSortedMap | 0 | 0 | 3 |  |
| TreeMultiMap | Gee.AbstractMultiMap | 0 | 0 | 3 |  |
| TreeMultiSet | Gee.AbstractMultiSet | 0 | 0 | 2 |  |
| TreeSet | Gee.AbstractBidirSortedSet | 0 | 0 | 2 |  |
| UnrolledLinkedList | Gee.AbstractBidirList | 0 | 0 | 2 |  |

### Gee.AbstractBidirList

Parent: `Gee.AbstractList` ?? Subclasses: `ArrayList`, `LinkedList`, `UnrolledLinkedList` ?? Implements: `Gee.BidirList` ?? GType: `GeeAbstractBidirList` ?? C type: `GeeAbstractBidirList` ?? Abstract

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractList |
| priv | AbstractBidirListPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| bidir_list_iterator | `AbstractBidirList.bidir_list_iterator() -> Gee.BidirListIterator` | gee_abstract_bidir_list_bidir_list_iterator |  |  |
| get_read_only_view | `AbstractBidirList.get_read_only_view() -> Gee.BidirList` | gee_abstract_bidir_list_get_read_only_view |  |  |
| reserved0 | `AbstractBidirList.reserved0() -> none` | gee_abstract_bidir_list_reserved0 |  |  |
| reserved1 | `AbstractBidirList.reserved1() -> none` | gee_abstract_bidir_list_reserved1 |  |  |
| reserved2 | `AbstractBidirList.reserved2() -> none` | gee_abstract_bidir_list_reserved2 |  |  |
| reserved3 | `AbstractBidirList.reserved3() -> none` | gee_abstract_bidir_list_reserved3 |  |  |
| reserved4 | `AbstractBidirList.reserved4() -> none` | gee_abstract_bidir_list_reserved4 |  |  |
| reserved5 | `AbstractBidirList.reserved5() -> none` | gee_abstract_bidir_list_reserved5 |  |  |
| reserved6 | `AbstractBidirList.reserved6() -> none` | gee_abstract_bidir_list_reserved6 |  |  |
| reserved7 | `AbstractBidirList.reserved7() -> none` | gee_abstract_bidir_list_reserved7 |  |  |
| reserved8 | `AbstractBidirList.reserved8() -> none` | gee_abstract_bidir_list_reserved8 |  |  |
| reserved9 | `AbstractBidirList.reserved9() -> none` | gee_abstract_bidir_list_reserved9 |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |
| read-only-view | Gee.BidirList | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| bidir_list_iterator | `bidir_list_iterator() -> Gee.BidirListIterator` |  |  |  |
| get_read_only_view | `get_read_only_view() -> Gee.BidirList` |  |  |  |
| reserved0 | `reserved0() -> none` |  |  |  |
| reserved1 | `reserved1() -> none` |  |  |  |
| reserved2 | `reserved2() -> none` |  |  |  |
| reserved3 | `reserved3() -> none` |  |  |  |
| reserved4 | `reserved4() -> none` |  |  |  |
| reserved5 | `reserved5() -> none` |  |  |  |
| reserved6 | `reserved6() -> none` |  |  |  |
| reserved7 | `reserved7() -> none` |  |  |  |
| reserved8 | `reserved8() -> none` |  |  |  |
| reserved9 | `reserved9() -> none` |  |  |  |

### Gee.AbstractBidirSortedMap

Parent: `Gee.AbstractSortedMap` ?? Subclasses: `TreeMap` ?? Implements: `Gee.BidirSortedMap` ?? GType: `GeeAbstractBidirSortedMap` ?? C type: `GeeAbstractBidirSortedMap` ?? Abstract

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractSortedMap |
| priv | AbstractBidirSortedMapPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| bidir_map_iterator | `AbstractBidirSortedMap.bidir_map_iterator() -> Gee.BidirMapIterator` | gee_abstract_bidir_sorted_map_bidir_map_iterator |  |  |
| get_read_only_view | `AbstractBidirSortedMap.get_read_only_view() -> Gee.BidirSortedMap` | gee_abstract_bidir_sorted_map_get_read_only_view |  |  |
| reserved0 | `AbstractBidirSortedMap.reserved0() -> none` | gee_abstract_bidir_sorted_map_reserved0 |  |  |
| reserved1 | `AbstractBidirSortedMap.reserved1() -> none` | gee_abstract_bidir_sorted_map_reserved1 |  |  |
| reserved2 | `AbstractBidirSortedMap.reserved2() -> none` | gee_abstract_bidir_sorted_map_reserved2 |  |  |
| reserved3 | `AbstractBidirSortedMap.reserved3() -> none` | gee_abstract_bidir_sorted_map_reserved3 |  |  |
| reserved4 | `AbstractBidirSortedMap.reserved4() -> none` | gee_abstract_bidir_sorted_map_reserved4 |  |  |
| reserved5 | `AbstractBidirSortedMap.reserved5() -> none` | gee_abstract_bidir_sorted_map_reserved5 |  |  |
| reserved6 | `AbstractBidirSortedMap.reserved6() -> none` | gee_abstract_bidir_sorted_map_reserved6 |  |  |
| reserved7 | `AbstractBidirSortedMap.reserved7() -> none` | gee_abstract_bidir_sorted_map_reserved7 |  |  |
| reserved8 | `AbstractBidirSortedMap.reserved8() -> none` | gee_abstract_bidir_sorted_map_reserved8 |  |  |
| reserved9 | `AbstractBidirSortedMap.reserved9() -> none` | gee_abstract_bidir_sorted_map_reserved9 |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| k-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| k-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| k-type | GType | read, write, construct-only |  |
| read-only-view | Gee.BidirSortedMap | read |  |
| v-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| v-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| v-type | GType | read, write, construct-only |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| bidir_map_iterator | `bidir_map_iterator() -> Gee.BidirMapIterator` |  |  |  |
| get_read_only_view | `get_read_only_view() -> Gee.BidirSortedMap` |  |  |  |
| reserved0 | `reserved0() -> none` |  |  |  |
| reserved1 | `reserved1() -> none` |  |  |  |
| reserved2 | `reserved2() -> none` |  |  |  |
| reserved3 | `reserved3() -> none` |  |  |  |
| reserved4 | `reserved4() -> none` |  |  |  |
| reserved5 | `reserved5() -> none` |  |  |  |
| reserved6 | `reserved6() -> none` |  |  |  |
| reserved7 | `reserved7() -> none` |  |  |  |
| reserved8 | `reserved8() -> none` |  |  |  |
| reserved9 | `reserved9() -> none` |  |  |  |

### Gee.AbstractBidirSortedSet

Parent: `Gee.AbstractSortedSet` ?? Subclasses: `TreeSet` ?? Implements: `Gee.BidirSortedSet` ?? GType: `GeeAbstractBidirSortedSet` ?? C type: `GeeAbstractBidirSortedSet` ?? Abstract

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractSortedSet |
| priv | AbstractBidirSortedSetPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| bidir_iterator | `AbstractBidirSortedSet.bidir_iterator() -> Gee.BidirIterator` | gee_abstract_bidir_sorted_set_bidir_iterator |  |  |
| get_read_only_view | `AbstractBidirSortedSet.get_read_only_view() -> Gee.BidirSortedSet` | gee_abstract_bidir_sorted_set_get_read_only_view |  |  |
| reserved0 | `AbstractBidirSortedSet.reserved0() -> none` | gee_abstract_bidir_sorted_set_reserved0 |  |  |
| reserved1 | `AbstractBidirSortedSet.reserved1() -> none` | gee_abstract_bidir_sorted_set_reserved1 |  |  |
| reserved2 | `AbstractBidirSortedSet.reserved2() -> none` | gee_abstract_bidir_sorted_set_reserved2 |  |  |
| reserved3 | `AbstractBidirSortedSet.reserved3() -> none` | gee_abstract_bidir_sorted_set_reserved3 |  |  |
| reserved4 | `AbstractBidirSortedSet.reserved4() -> none` | gee_abstract_bidir_sorted_set_reserved4 |  |  |
| reserved5 | `AbstractBidirSortedSet.reserved5() -> none` | gee_abstract_bidir_sorted_set_reserved5 |  |  |
| reserved6 | `AbstractBidirSortedSet.reserved6() -> none` | gee_abstract_bidir_sorted_set_reserved6 |  |  |
| reserved7 | `AbstractBidirSortedSet.reserved7() -> none` | gee_abstract_bidir_sorted_set_reserved7 |  |  |
| reserved8 | `AbstractBidirSortedSet.reserved8() -> none` | gee_abstract_bidir_sorted_set_reserved8 |  |  |
| reserved9 | `AbstractBidirSortedSet.reserved9() -> none` | gee_abstract_bidir_sorted_set_reserved9 |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |
| read-only-view | Gee.BidirSortedSet | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| bidir_iterator | `bidir_iterator() -> Gee.BidirIterator` |  |  |  |
| get_read_only_view | `get_read_only_view() -> Gee.BidirSortedSet` |  |  |  |
| reserved0 | `reserved0() -> none` |  |  |  |
| reserved1 | `reserved1() -> none` |  |  |  |
| reserved2 | `reserved2() -> none` |  |  |  |
| reserved3 | `reserved3() -> none` |  |  |  |
| reserved4 | `reserved4() -> none` |  |  |  |
| reserved5 | `reserved5() -> none` |  |  |  |
| reserved6 | `reserved6() -> none` |  |  |  |
| reserved7 | `reserved7() -> none` |  |  |  |
| reserved8 | `reserved8() -> none` |  |  |  |
| reserved9 | `reserved9() -> none` |  |  |  |

### Gee.AbstractCollection

Parent: `GObject.Object` ?? Subclasses: `AbstractList`, `AbstractMultiSet`, `AbstractQueue`, `AbstractSet` ?? Implements: `Gee.Traversable`, `Gee.Iterable`, `Gee.Collection` ?? GType: `GeeAbstractCollection` ?? C type: `GeeAbstractCollection` ?? Abstract

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | AbstractCollectionPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `AbstractCollection.add(item: gpointer?) -> gboolean` | gee_abstract_collection_add |  |  |
| clear | `AbstractCollection.clear() -> none` | gee_abstract_collection_clear |  |  |
| contains | `AbstractCollection.contains(item: gpointer?) -> gboolean` | gee_abstract_collection_contains |  |  |
| foreach | `AbstractCollection.foreach(f: Gee.ForallFunc, f_target: gpointer?) -> gboolean` | gee_abstract_collection_foreach |  |  |
| get_read_only | `AbstractCollection.get_read_only() -> gboolean` | gee_abstract_collection_get_read_only |  |  |
| get_read_only_view | `AbstractCollection.get_read_only_view() -> Gee.Collection` | gee_abstract_collection_get_read_only_view |  |  |
| get_size | `AbstractCollection.get_size() -> gint` | gee_abstract_collection_get_size |  |  |
| iterator | `AbstractCollection.iterator() -> Gee.Iterator` | gee_abstract_collection_iterator |  |  |
| remove | `AbstractCollection.remove(item: gpointer?) -> gboolean` | gee_abstract_collection_remove |  |  |
| reserved0 | `AbstractCollection.reserved0() -> none` | gee_abstract_collection_reserved0 |  |  |
| reserved1 | `AbstractCollection.reserved1() -> none` | gee_abstract_collection_reserved1 |  |  |
| reserved2 | `AbstractCollection.reserved2() -> none` | gee_abstract_collection_reserved2 |  |  |
| reserved3 | `AbstractCollection.reserved3() -> none` | gee_abstract_collection_reserved3 |  |  |
| reserved4 | `AbstractCollection.reserved4() -> none` | gee_abstract_collection_reserved4 |  |  |
| reserved5 | `AbstractCollection.reserved5() -> none` | gee_abstract_collection_reserved5 |  |  |
| reserved6 | `AbstractCollection.reserved6() -> none` | gee_abstract_collection_reserved6 |  |  |
| reserved7 | `AbstractCollection.reserved7() -> none` | gee_abstract_collection_reserved7 |  |  |
| reserved8 | `AbstractCollection.reserved8() -> none` | gee_abstract_collection_reserved8 |  |  |
| reserved9 | `AbstractCollection.reserved9() -> none` | gee_abstract_collection_reserved9 |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |
| read-only | gboolean | read |  |
| read-only-view | Gee.Collection | read |  |
| size | gint | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `add(item: gpointer?) -> gboolean` |  |  |  |
| clear | `clear() -> none` |  |  |  |
| contains | `contains(item: gpointer?) -> gboolean` |  |  |  |
| foreach | `foreach(f: Gee.ForallFunc, f_target: gpointer?) -> gboolean` |  |  |  |
| get_read_only | `get_read_only() -> gboolean` |  |  |  |
| get_read_only_view | `get_read_only_view() -> Gee.Collection` |  |  |  |
| get_size | `get_size() -> gint` |  |  |  |
| iterator | `iterator() -> Gee.Iterator` |  |  |  |
| remove | `remove(item: gpointer?) -> gboolean` |  |  |  |
| reserved0 | `reserved0() -> none` |  |  |  |
| reserved1 | `reserved1() -> none` |  |  |  |
| reserved2 | `reserved2() -> none` |  |  |  |
| reserved3 | `reserved3() -> none` |  |  |  |
| reserved4 | `reserved4() -> none` |  |  |  |
| reserved5 | `reserved5() -> none` |  |  |  |
| reserved6 | `reserved6() -> none` |  |  |  |
| reserved7 | `reserved7() -> none` |  |  |  |
| reserved8 | `reserved8() -> none` |  |  |  |
| reserved9 | `reserved9() -> none` |  |  |  |

### Gee.AbstractList

Parent: `Gee.AbstractCollection` ?? Subclasses: `AbstractBidirList`, `ConcurrentList` ?? Implements: `Gee.List` ?? GType: `GeeAbstractList` ?? C type: `GeeAbstractList` ?? Abstract

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractCollection |
| priv | AbstractListPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `AbstractList.get(index: gint) -> gpointer` | gee_abstract_list_get |  |  |
| get_read_only_view | `AbstractList.get_read_only_view() -> Gee.List` | gee_abstract_list_get_read_only_view |  |  |
| index_of | `AbstractList.index_of(item: gpointer?) -> gint` | gee_abstract_list_index_of |  |  |
| insert | `AbstractList.insert(index: gint, item: gpointer?) -> none` | gee_abstract_list_insert |  |  |
| list_iterator | `AbstractList.list_iterator() -> Gee.ListIterator` | gee_abstract_list_list_iterator |  |  |
| remove_at | `AbstractList.remove_at(index: gint) -> gpointer` | gee_abstract_list_remove_at |  |  |
| reserved0 | `AbstractList.reserved0() -> none` | gee_abstract_list_reserved0 |  |  |
| reserved1 | `AbstractList.reserved1() -> none` | gee_abstract_list_reserved1 |  |  |
| reserved2 | `AbstractList.reserved2() -> none` | gee_abstract_list_reserved2 |  |  |
| reserved3 | `AbstractList.reserved3() -> none` | gee_abstract_list_reserved3 |  |  |
| reserved4 | `AbstractList.reserved4() -> none` | gee_abstract_list_reserved4 |  |  |
| reserved5 | `AbstractList.reserved5() -> none` | gee_abstract_list_reserved5 |  |  |
| reserved6 | `AbstractList.reserved6() -> none` | gee_abstract_list_reserved6 |  |  |
| reserved7 | `AbstractList.reserved7() -> none` | gee_abstract_list_reserved7 |  |  |
| reserved8 | `AbstractList.reserved8() -> none` | gee_abstract_list_reserved8 |  |  |
| reserved9 | `AbstractList.reserved9() -> none` | gee_abstract_list_reserved9 |  |  |
| set | `AbstractList.set(index: gint, item: gpointer?) -> none` | gee_abstract_list_set |  |  |
| slice | `AbstractList.slice(start: gint, stop: gint) -> Gee.List` | gee_abstract_list_slice |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |
| read-only-view | Gee.List | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `get(index: gint) -> gpointer` |  |  |  |
| get_read_only_view | `get_read_only_view() -> Gee.List` |  |  |  |
| index_of | `index_of(item: gpointer?) -> gint` |  |  |  |
| insert | `insert(index: gint, item: gpointer?) -> none` |  |  |  |
| list_iterator | `list_iterator() -> Gee.ListIterator` |  |  |  |
| remove_at | `remove_at(index: gint) -> gpointer` |  |  |  |
| reserved0 | `reserved0() -> none` |  |  |  |
| reserved1 | `reserved1() -> none` |  |  |  |
| reserved2 | `reserved2() -> none` |  |  |  |
| reserved3 | `reserved3() -> none` |  |  |  |
| reserved4 | `reserved4() -> none` |  |  |  |
| reserved5 | `reserved5() -> none` |  |  |  |
| reserved6 | `reserved6() -> none` |  |  |  |
| reserved7 | `reserved7() -> none` |  |  |  |
| reserved8 | `reserved8() -> none` |  |  |  |
| reserved9 | `reserved9() -> none` |  |  |  |
| set | `set(index: gint, item: gpointer?) -> none` |  |  |  |
| slice | `slice(start: gint, stop: gint) -> Gee.List` |  |  |  |

### Gee.AbstractMap

Parent: `GObject.Object` ?? Subclasses: `AbstractSortedMap`, `HashMap` ?? Implements: `Gee.Traversable`, `Gee.Iterable`, `Gee.Map` ?? GType: `GeeAbstractMap` ?? C type: `GeeAbstractMap` ?? Abstract

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | AbstractMapPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `AbstractMap.clear() -> none` | gee_abstract_map_clear |  |  |
| foreach | `AbstractMap.foreach(f: Gee.ForallFunc, f_target: gpointer?) -> gboolean` | gee_abstract_map_foreach |  |  |
| get | `AbstractMap.get(key: gpointer?) -> gpointer` | gee_abstract_map_get |  |  |
| get_entries | `AbstractMap.get_entries() -> Gee.Set` | gee_abstract_map_get_entries |  |  |
| get_keys | `AbstractMap.get_keys() -> Gee.Set` | gee_abstract_map_get_keys |  |  |
| get_read_only | `AbstractMap.get_read_only() -> gboolean` | gee_abstract_map_get_read_only |  |  |
| get_read_only_view | `AbstractMap.get_read_only_view() -> Gee.Map` | gee_abstract_map_get_read_only_view |  |  |
| get_size | `AbstractMap.get_size() -> gint` | gee_abstract_map_get_size |  |  |
| get_values | `AbstractMap.get_values() -> Gee.Collection` | gee_abstract_map_get_values |  |  |
| has | `AbstractMap.has(key: gpointer?, value: gpointer?) -> gboolean` | gee_abstract_map_has |  |  |
| has_key | `AbstractMap.has_key(key: gpointer?) -> gboolean` | gee_abstract_map_has_key |  |  |
| map_iterator | `AbstractMap.map_iterator() -> Gee.MapIterator` | gee_abstract_map_map_iterator |  |  |
| reserved0 | `AbstractMap.reserved0() -> none` | gee_abstract_map_reserved0 |  |  |
| reserved1 | `AbstractMap.reserved1() -> none` | gee_abstract_map_reserved1 |  |  |
| reserved2 | `AbstractMap.reserved2() -> none` | gee_abstract_map_reserved2 |  |  |
| reserved3 | `AbstractMap.reserved3() -> none` | gee_abstract_map_reserved3 |  |  |
| reserved4 | `AbstractMap.reserved4() -> none` | gee_abstract_map_reserved4 |  |  |
| reserved5 | `AbstractMap.reserved5() -> none` | gee_abstract_map_reserved5 |  |  |
| reserved6 | `AbstractMap.reserved6() -> none` | gee_abstract_map_reserved6 |  |  |
| reserved7 | `AbstractMap.reserved7() -> none` | gee_abstract_map_reserved7 |  |  |
| reserved8 | `AbstractMap.reserved8() -> none` | gee_abstract_map_reserved8 |  |  |
| reserved9 | `AbstractMap.reserved9() -> none` | gee_abstract_map_reserved9 |  |  |
| set | `AbstractMap.set(key: gpointer?, value: gpointer?) -> none` | gee_abstract_map_set |  |  |
| stream | `AbstractMap.stream(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, f: Gee.StreamFunc, f_target: gpointer?, f_target_destroy_notify: GLib.DestroyNotify) -> Gee.Iterator` | gee_abstract_map_stream |  |  |
| unset | `AbstractMap.unset(key: gpointer?, value: out gpointer?) -> gboolean` | gee_abstract_map_unset |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| entries | Gee.Set | read |  |
| k-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| k-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| k-type | GType | read, write, construct-only |  |
| keys | Gee.Set | read |  |
| read-only | gboolean | read |  |
| read-only-view | Gee.Map | read |  |
| size | gint | read |  |
| v-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| v-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| v-type | GType | read, write, construct-only |  |
| values | Gee.Collection | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `clear() -> none` |  |  |  |
| foreach | `foreach(f: Gee.ForallFunc, f_target: gpointer?) -> gboolean` |  |  |  |
| get | `get(key: gpointer?) -> gpointer` |  |  |  |
| get_entries | `get_entries() -> Gee.Set` |  |  |  |
| get_keys | `get_keys() -> Gee.Set` |  |  |  |
| get_read_only | `get_read_only() -> gboolean` |  |  |  |
| get_read_only_view | `get_read_only_view() -> Gee.Map` |  |  |  |
| get_size | `get_size() -> gint` |  |  |  |
| get_values | `get_values() -> Gee.Collection` |  |  |  |
| has | `has(key: gpointer?, value: gpointer?) -> gboolean` |  |  |  |
| has_key | `has_key(key: gpointer?) -> gboolean` |  |  |  |
| map_iterator | `map_iterator() -> Gee.MapIterator` |  |  |  |
| reserved0 | `reserved0() -> none` |  |  |  |
| reserved1 | `reserved1() -> none` |  |  |  |
| reserved2 | `reserved2() -> none` |  |  |  |
| reserved3 | `reserved3() -> none` |  |  |  |
| reserved4 | `reserved4() -> none` |  |  |  |
| reserved5 | `reserved5() -> none` |  |  |  |
| reserved6 | `reserved6() -> none` |  |  |  |
| reserved7 | `reserved7() -> none` |  |  |  |
| reserved8 | `reserved8() -> none` |  |  |  |
| reserved9 | `reserved9() -> none` |  |  |  |
| set | `set(key: gpointer?, value: gpointer?) -> none` |  |  |  |
| stream | `stream(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, f: Gee.StreamFunc, f_target: gpointer?, f_target_destroy_notify: GLib.DestroyNotify) -> Gee.Iterator` |  |  |  |
| unset | `unset(key: gpointer?, value: out gpointer?) -> gboolean` |  |  |  |

### Gee.AbstractMultiMap

Parent: `GObject.Object` ?? Subclasses: `HashMultiMap`, `TreeMultiMap` ?? Implements: `Gee.MultiMap` ?? GType: `GeeAbstractMultiMap` ?? C type: `GeeAbstractMultiMap` ?? Abstract

#### Fields

| Field | Type |
| --- | --- |
| _storage_map | Gee.Map |
| parent_instance | GObject.Object |
| priv | AbstractMultiMapPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| create_multi_key_set | `AbstractMultiMap.create_multi_key_set() -> Gee.MultiSet` | gee_abstract_multi_map_create_multi_key_set |  |  |
| create_value_storage | `AbstractMultiMap.create_value_storage() -> Gee.Collection` | gee_abstract_multi_map_create_value_storage |  |  |
| get_read_only_view | `AbstractMultiMap.get_read_only_view() -> Gee.MultiMap` | gee_abstract_multi_map_get_read_only_view |  |  |
| get_value_equal_func | `AbstractMultiMap.get_value_equal_func(result_target: out gpointer?, result_target_destroy_notify: out GLib.DestroyNotify) -> Gee.EqualDataFunc` | gee_abstract_multi_map_get_value_equal_func |  |  |
| reserved0 | `AbstractMultiMap.reserved0() -> none` | gee_abstract_multi_map_reserved0 |  |  |
| reserved1 | `AbstractMultiMap.reserved1() -> none` | gee_abstract_multi_map_reserved1 |  |  |
| reserved2 | `AbstractMultiMap.reserved2() -> none` | gee_abstract_multi_map_reserved2 |  |  |
| reserved3 | `AbstractMultiMap.reserved3() -> none` | gee_abstract_multi_map_reserved3 |  |  |
| reserved4 | `AbstractMultiMap.reserved4() -> none` | gee_abstract_multi_map_reserved4 |  |  |
| reserved5 | `AbstractMultiMap.reserved5() -> none` | gee_abstract_multi_map_reserved5 |  |  |
| reserved6 | `AbstractMultiMap.reserved6() -> none` | gee_abstract_multi_map_reserved6 |  |  |
| reserved7 | `AbstractMultiMap.reserved7() -> none` | gee_abstract_multi_map_reserved7 |  |  |
| reserved8 | `AbstractMultiMap.reserved8() -> none` | gee_abstract_multi_map_reserved8 |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| k-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| k-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| k-type | GType | read, write, construct-only |  |
| v-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| v-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| v-type | GType | read, write, construct-only |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| create_multi_key_set | `create_multi_key_set() -> Gee.MultiSet` |  |  |  |
| create_value_storage | `create_value_storage() -> Gee.Collection` |  |  |  |
| get_read_only_view | `get_read_only_view() -> Gee.MultiMap` |  |  |  |
| get_value_equal_func | `get_value_equal_func(result_target: out gpointer?, result_target_destroy_notify: out GLib.DestroyNotify) -> Gee.EqualDataFunc` |  |  |  |
| reserved0 | `reserved0() -> none` |  |  |  |
| reserved1 | `reserved1() -> none` |  |  |  |
| reserved2 | `reserved2() -> none` |  |  |  |
| reserved3 | `reserved3() -> none` |  |  |  |
| reserved4 | `reserved4() -> none` |  |  |  |
| reserved5 | `reserved5() -> none` |  |  |  |
| reserved6 | `reserved6() -> none` |  |  |  |
| reserved7 | `reserved7() -> none` |  |  |  |
| reserved8 | `reserved8() -> none` |  |  |  |

### Gee.AbstractMultiSet

Parent: `Gee.AbstractCollection` ?? Subclasses: `HashMultiSet`, `TreeMultiSet` ?? Implements: `Gee.MultiSet` ?? GType: `GeeAbstractMultiSet` ?? C type: `GeeAbstractMultiSet` ?? Abstract

#### Fields

| Field | Type |
| --- | --- |
| _storage_map | Gee.Map |
| parent_instance | Gee.AbstractCollection |
| priv | AbstractMultiSetPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_read_only_view | `AbstractMultiSet.get_read_only_view() -> Gee.MultiSet` | gee_abstract_multi_set_get_read_only_view |  |  |
| reserved0 | `AbstractMultiSet.reserved0() -> none` | gee_abstract_multi_set_reserved0 |  |  |
| reserved1 | `AbstractMultiSet.reserved1() -> none` | gee_abstract_multi_set_reserved1 |  |  |
| reserved2 | `AbstractMultiSet.reserved2() -> none` | gee_abstract_multi_set_reserved2 |  |  |
| reserved3 | `AbstractMultiSet.reserved3() -> none` | gee_abstract_multi_set_reserved3 |  |  |
| reserved4 | `AbstractMultiSet.reserved4() -> none` | gee_abstract_multi_set_reserved4 |  |  |
| reserved5 | `AbstractMultiSet.reserved5() -> none` | gee_abstract_multi_set_reserved5 |  |  |
| reserved6 | `AbstractMultiSet.reserved6() -> none` | gee_abstract_multi_set_reserved6 |  |  |
| reserved7 | `AbstractMultiSet.reserved7() -> none` | gee_abstract_multi_set_reserved7 |  |  |
| reserved8 | `AbstractMultiSet.reserved8() -> none` | gee_abstract_multi_set_reserved8 |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_read_only_view | `get_read_only_view() -> Gee.MultiSet` |  |  |  |
| reserved0 | `reserved0() -> none` |  |  |  |
| reserved1 | `reserved1() -> none` |  |  |  |
| reserved2 | `reserved2() -> none` |  |  |  |
| reserved3 | `reserved3() -> none` |  |  |  |
| reserved4 | `reserved4() -> none` |  |  |  |
| reserved5 | `reserved5() -> none` |  |  |  |
| reserved6 | `reserved6() -> none` |  |  |  |
| reserved7 | `reserved7() -> none` |  |  |  |
| reserved8 | `reserved8() -> none` |  |  |  |

### Gee.AbstractQueue

Parent: `Gee.AbstractCollection` ?? Subclasses: `ArrayQueue`, `PriorityQueue` ?? Implements: `Gee.Queue` ?? GType: `GeeAbstractQueue` ?? C type: `GeeAbstractQueue` ?? Abstract

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractCollection |
| priv | AbstractQueuePrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_capacity | `AbstractQueue.get_capacity() -> gint` | gee_abstract_queue_get_capacity |  |  |
| get_is_full | `AbstractQueue.get_is_full() -> gboolean` | gee_abstract_queue_get_is_full |  |  |
| get_remaining_capacity | `AbstractQueue.get_remaining_capacity() -> gint` | gee_abstract_queue_get_remaining_capacity |  |  |
| peek | `AbstractQueue.peek() -> gpointer` | gee_abstract_queue_peek |  |  |
| poll | `AbstractQueue.poll() -> gpointer` | gee_abstract_queue_poll |  |  |
| reserved0 | `AbstractQueue.reserved0() -> none` | gee_abstract_queue_reserved0 |  |  |
| reserved1 | `AbstractQueue.reserved1() -> none` | gee_abstract_queue_reserved1 |  |  |
| reserved2 | `AbstractQueue.reserved2() -> none` | gee_abstract_queue_reserved2 |  |  |
| reserved3 | `AbstractQueue.reserved3() -> none` | gee_abstract_queue_reserved3 |  |  |
| reserved4 | `AbstractQueue.reserved4() -> none` | gee_abstract_queue_reserved4 |  |  |
| reserved5 | `AbstractQueue.reserved5() -> none` | gee_abstract_queue_reserved5 |  |  |
| reserved6 | `AbstractQueue.reserved6() -> none` | gee_abstract_queue_reserved6 |  |  |
| reserved7 | `AbstractQueue.reserved7() -> none` | gee_abstract_queue_reserved7 |  |  |
| reserved8 | `AbstractQueue.reserved8() -> none` | gee_abstract_queue_reserved8 |  |  |
| reserved9 | `AbstractQueue.reserved9() -> none` | gee_abstract_queue_reserved9 |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| capacity | gint | read |  |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |
| is-full | gboolean | read |  |
| remaining-capacity | gint | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_capacity | `get_capacity() -> gint` |  |  |  |
| get_is_full | `get_is_full() -> gboolean` |  |  |  |
| get_remaining_capacity | `get_remaining_capacity() -> gint` |  |  |  |
| peek | `peek() -> gpointer` |  |  |  |
| poll | `poll() -> gpointer` |  |  |  |
| reserved0 | `reserved0() -> none` |  |  |  |
| reserved1 | `reserved1() -> none` |  |  |  |
| reserved2 | `reserved2() -> none` |  |  |  |
| reserved3 | `reserved3() -> none` |  |  |  |
| reserved4 | `reserved4() -> none` |  |  |  |
| reserved5 | `reserved5() -> none` |  |  |  |
| reserved6 | `reserved6() -> none` |  |  |  |
| reserved7 | `reserved7() -> none` |  |  |  |
| reserved8 | `reserved8() -> none` |  |  |  |
| reserved9 | `reserved9() -> none` |  |  |  |

### Gee.AbstractSet

Parent: `Gee.AbstractCollection` ?? Subclasses: `AbstractSortedSet`, `HashSet` ?? Implements: `Gee.Set` ?? GType: `GeeAbstractSet` ?? C type: `GeeAbstractSet` ?? Abstract

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractCollection |
| priv | AbstractSetPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_read_only_view | `AbstractSet.get_read_only_view() -> Gee.Set` | gee_abstract_set_get_read_only_view |  |  |
| reserved0 | `AbstractSet.reserved0() -> none` | gee_abstract_set_reserved0 |  |  |
| reserved1 | `AbstractSet.reserved1() -> none` | gee_abstract_set_reserved1 |  |  |
| reserved2 | `AbstractSet.reserved2() -> none` | gee_abstract_set_reserved2 |  |  |
| reserved3 | `AbstractSet.reserved3() -> none` | gee_abstract_set_reserved3 |  |  |
| reserved4 | `AbstractSet.reserved4() -> none` | gee_abstract_set_reserved4 |  |  |
| reserved5 | `AbstractSet.reserved5() -> none` | gee_abstract_set_reserved5 |  |  |
| reserved6 | `AbstractSet.reserved6() -> none` | gee_abstract_set_reserved6 |  |  |
| reserved7 | `AbstractSet.reserved7() -> none` | gee_abstract_set_reserved7 |  |  |
| reserved8 | `AbstractSet.reserved8() -> none` | gee_abstract_set_reserved8 |  |  |
| reserved9 | `AbstractSet.reserved9() -> none` | gee_abstract_set_reserved9 |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |
| read-only-view | Gee.Set | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_read_only_view | `get_read_only_view() -> Gee.Set` |  |  |  |
| reserved0 | `reserved0() -> none` |  |  |  |
| reserved1 | `reserved1() -> none` |  |  |  |
| reserved2 | `reserved2() -> none` |  |  |  |
| reserved3 | `reserved3() -> none` |  |  |  |
| reserved4 | `reserved4() -> none` |  |  |  |
| reserved5 | `reserved5() -> none` |  |  |  |
| reserved6 | `reserved6() -> none` |  |  |  |
| reserved7 | `reserved7() -> none` |  |  |  |
| reserved8 | `reserved8() -> none` |  |  |  |
| reserved9 | `reserved9() -> none` |  |  |  |

### Gee.AbstractSortedMap

Parent: `Gee.AbstractMap` ?? Subclasses: `AbstractBidirSortedMap` ?? Implements: `Gee.SortedMap` ?? GType: `GeeAbstractSortedMap` ?? C type: `GeeAbstractSortedMap` ?? Abstract

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractMap |
| priv | AbstractSortedMapPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_ascending_entries | `AbstractSortedMap.get_ascending_entries() -> Gee.SortedSet` | gee_abstract_sorted_map_get_ascending_entries |  |  |
| get_ascending_keys | `AbstractSortedMap.get_ascending_keys() -> Gee.SortedSet` | gee_abstract_sorted_map_get_ascending_keys |  |  |
| head_map | `AbstractSortedMap.head_map(before: gpointer?) -> Gee.SortedMap` | gee_abstract_sorted_map_head_map |  |  |
| reserved0 | `AbstractSortedMap.reserved0() -> none` | gee_abstract_sorted_map_reserved0 |  |  |
| reserved1 | `AbstractSortedMap.reserved1() -> none` | gee_abstract_sorted_map_reserved1 |  |  |
| reserved2 | `AbstractSortedMap.reserved2() -> none` | gee_abstract_sorted_map_reserved2 |  |  |
| reserved3 | `AbstractSortedMap.reserved3() -> none` | gee_abstract_sorted_map_reserved3 |  |  |
| reserved4 | `AbstractSortedMap.reserved4() -> none` | gee_abstract_sorted_map_reserved4 |  |  |
| reserved5 | `AbstractSortedMap.reserved5() -> none` | gee_abstract_sorted_map_reserved5 |  |  |
| reserved6 | `AbstractSortedMap.reserved6() -> none` | gee_abstract_sorted_map_reserved6 |  |  |
| reserved7 | `AbstractSortedMap.reserved7() -> none` | gee_abstract_sorted_map_reserved7 |  |  |
| reserved8 | `AbstractSortedMap.reserved8() -> none` | gee_abstract_sorted_map_reserved8 |  |  |
| reserved9 | `AbstractSortedMap.reserved9() -> none` | gee_abstract_sorted_map_reserved9 |  |  |
| sub_map | `AbstractSortedMap.sub_map(before: gpointer?, after: gpointer?) -> Gee.SortedMap` | gee_abstract_sorted_map_sub_map |  |  |
| tail_map | `AbstractSortedMap.tail_map(after: gpointer?) -> Gee.SortedMap` | gee_abstract_sorted_map_tail_map |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| ascending-entries | Gee.SortedSet | read |  |
| ascending-keys | Gee.SortedSet | read |  |
| k-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| k-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| k-type | GType | read, write, construct-only |  |
| v-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| v-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| v-type | GType | read, write, construct-only |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_ascending_entries | `get_ascending_entries() -> Gee.SortedSet` |  |  |  |
| get_ascending_keys | `get_ascending_keys() -> Gee.SortedSet` |  |  |  |
| head_map | `head_map(before: gpointer?) -> Gee.SortedMap` |  |  |  |
| reserved0 | `reserved0() -> none` |  |  |  |
| reserved1 | `reserved1() -> none` |  |  |  |
| reserved2 | `reserved2() -> none` |  |  |  |
| reserved3 | `reserved3() -> none` |  |  |  |
| reserved4 | `reserved4() -> none` |  |  |  |
| reserved5 | `reserved5() -> none` |  |  |  |
| reserved6 | `reserved6() -> none` |  |  |  |
| reserved7 | `reserved7() -> none` |  |  |  |
| reserved8 | `reserved8() -> none` |  |  |  |
| reserved9 | `reserved9() -> none` |  |  |  |
| sub_map | `sub_map(before: gpointer?, after: gpointer?) -> Gee.SortedMap` |  |  |  |
| tail_map | `tail_map(after: gpointer?) -> Gee.SortedMap` |  |  |  |

### Gee.AbstractSortedSet

Parent: `Gee.AbstractSet` ?? Subclasses: `AbstractBidirSortedSet`, `ConcurrentSet` ?? Implements: `Gee.SortedSet` ?? GType: `GeeAbstractSortedSet` ?? C type: `GeeAbstractSortedSet` ?? Abstract

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractSet |
| priv | AbstractSortedSetPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ceil | `AbstractSortedSet.ceil(element: gpointer?) -> gpointer` | gee_abstract_sorted_set_ceil |  |  |
| first | `AbstractSortedSet.first() -> gpointer` | gee_abstract_sorted_set_first |  |  |
| floor | `AbstractSortedSet.floor(element: gpointer?) -> gpointer` | gee_abstract_sorted_set_floor |  |  |
| get_read_only_view | `AbstractSortedSet.get_read_only_view() -> Gee.SortedSet` | gee_abstract_sorted_set_get_read_only_view |  |  |
| head_set | `AbstractSortedSet.head_set(before: gpointer?) -> Gee.SortedSet` | gee_abstract_sorted_set_head_set |  |  |
| higher | `AbstractSortedSet.higher(element: gpointer?) -> gpointer` | gee_abstract_sorted_set_higher |  |  |
| iterator_at | `AbstractSortedSet.iterator_at(element: gpointer?) -> Gee.Iterator` | gee_abstract_sorted_set_iterator_at |  |  |
| last | `AbstractSortedSet.last() -> gpointer` | gee_abstract_sorted_set_last |  |  |
| lower | `AbstractSortedSet.lower(element: gpointer?) -> gpointer` | gee_abstract_sorted_set_lower |  |  |
| reserved0 | `AbstractSortedSet.reserved0() -> none` | gee_abstract_sorted_set_reserved0 |  |  |
| reserved1 | `AbstractSortedSet.reserved1() -> none` | gee_abstract_sorted_set_reserved1 |  |  |
| reserved2 | `AbstractSortedSet.reserved2() -> none` | gee_abstract_sorted_set_reserved2 |  |  |
| reserved3 | `AbstractSortedSet.reserved3() -> none` | gee_abstract_sorted_set_reserved3 |  |  |
| reserved4 | `AbstractSortedSet.reserved4() -> none` | gee_abstract_sorted_set_reserved4 |  |  |
| reserved5 | `AbstractSortedSet.reserved5() -> none` | gee_abstract_sorted_set_reserved5 |  |  |
| reserved6 | `AbstractSortedSet.reserved6() -> none` | gee_abstract_sorted_set_reserved6 |  |  |
| reserved7 | `AbstractSortedSet.reserved7() -> none` | gee_abstract_sorted_set_reserved7 |  |  |
| reserved8 | `AbstractSortedSet.reserved8() -> none` | gee_abstract_sorted_set_reserved8 |  |  |
| reserved9 | `AbstractSortedSet.reserved9() -> none` | gee_abstract_sorted_set_reserved9 |  |  |
| sub_set | `AbstractSortedSet.sub_set(from: gpointer?, to: gpointer?) -> Gee.SortedSet` | gee_abstract_sorted_set_sub_set |  |  |
| tail_set | `AbstractSortedSet.tail_set(after: gpointer?) -> Gee.SortedSet` | gee_abstract_sorted_set_tail_set |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |
| read-only-view | Gee.SortedSet | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ceil | `ceil(element: gpointer?) -> gpointer` |  |  |  |
| first | `first() -> gpointer` |  |  |  |
| floor | `floor(element: gpointer?) -> gpointer` |  |  |  |
| get_read_only_view | `get_read_only_view() -> Gee.SortedSet` |  |  |  |
| head_set | `head_set(before: gpointer?) -> Gee.SortedSet` |  |  |  |
| higher | `higher(element: gpointer?) -> gpointer` |  |  |  |
| iterator_at | `iterator_at(element: gpointer?) -> Gee.Iterator` |  |  |  |
| last | `last() -> gpointer` |  |  |  |
| lower | `lower(element: gpointer?) -> gpointer` |  |  |  |
| reserved0 | `reserved0() -> none` |  |  |  |
| reserved1 | `reserved1() -> none` |  |  |  |
| reserved2 | `reserved2() -> none` |  |  |  |
| reserved3 | `reserved3() -> none` |  |  |  |
| reserved4 | `reserved4() -> none` |  |  |  |
| reserved5 | `reserved5() -> none` |  |  |  |
| reserved6 | `reserved6() -> none` |  |  |  |
| reserved7 | `reserved7() -> none` |  |  |  |
| reserved8 | `reserved8() -> none` |  |  |  |
| reserved9 | `reserved9() -> none` |  |  |  |
| sub_set | `sub_set(from: gpointer?, to: gpointer?) -> Gee.SortedSet` |  |  |  |
| tail_set | `tail_set(after: gpointer?) -> Gee.SortedSet` |  |  |  |

### Gee.ArrayList

Parent: `Gee.AbstractBidirList` ?? GType: `GeeArrayList` ?? C type: `GeeArrayList`

#### Fields

| Field | Type |
| --- | --- |
| _items | gpointer |
| _items_length1 | gint |
| _size | gint |
| parent_instance | Gee.AbstractBidirList |
| priv | ArrayListPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ArrayList.new(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, equal_func: Gee.EqualDataFunc?, equal_func_target: gpointer?, equal_func_target_destroy_notify: GLib.DestroyNotify) -> Gee.ArrayList` | gee_array_list_new |  |  |
| wrap | `ArrayList.wrap(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, items: gpointer, items_length1: gint, equal_func: Gee.EqualDataFunc?, equal_func_target: gpointer?, equal_func_target_destroy_notify: GLib.DestroyNotify) -> Gee.ArrayList` | gee_array_list_new_wrap |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_all | `ArrayList.add_all(collection: Gee.Collection) -> gboolean` | gee_array_list_add_all |  |  |
| get_equal_func | `ArrayList.get_equal_func(result_target: out gpointer?) -> Gee.EqualDataFunc` | gee_array_list_get_equal_func |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |

### Gee.ArrayQueue

Parent: `Gee.AbstractQueue` ?? Implements: `Gee.Deque` ?? GType: `GeeArrayQueue` ?? C type: `GeeArrayQueue`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractQueue |
| priv | ArrayQueuePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ArrayQueue.new(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, equal_func: Gee.EqualDataFunc?, equal_func_target: gpointer?, equal_func_target_destroy_notify: GLib.DestroyNotify) -> Gee.ArrayQueue` | gee_array_queue_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_equal_func | `ArrayQueue.get_equal_func(result_target: out gpointer?) -> Gee.EqualDataFunc` | gee_array_queue_get_equal_func |  |  |
| get_is_empty | `ArrayQueue.get_is_empty() -> gboolean` | gee_array_queue_get_is_empty |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |
| is-empty | gboolean | read |  |

### Gee.ConcurrentList

Parent: `Gee.AbstractList` ?? GType: `GeeConcurrentList` ?? C type: `GeeConcurrentList`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractList |
| priv | ConcurrentListPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ConcurrentList.new(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, equal_func: Gee.EqualDataFunc?, equal_func_target: gpointer?, equal_func_target_destroy_notify: GLib.DestroyNotify) -> Gee.ConcurrentList` | gee_concurrent_list_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_equal_func | `ConcurrentList.get_equal_func(result_target: out gpointer?) -> Gee.EqualDataFunc` | gee_concurrent_list_get_equal_func |  |  |
| get_is_empty | `ConcurrentList.get_is_empty() -> gboolean` | gee_concurrent_list_get_is_empty |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |
| is-empty | gboolean | read |  |

### Gee.ConcurrentSet

Parent: `Gee.AbstractSortedSet` ?? GType: `GeeConcurrentSet` ?? C type: `GeeConcurrentSet`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractSortedSet |
| priv | ConcurrentSetPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ConcurrentSet.new(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, compare_func: GLib.CompareDataFunc?, compare_func_target: gpointer?, compare_func_target_destroy_notify: GLib.DestroyNotify) -> Gee.ConcurrentSet` | gee_concurrent_set_new |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |

### Gee.HashMap

Parent: `Gee.AbstractMap` ?? GType: `GeeHashMap` ?? C type: `GeeHashMap`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractMap |
| priv | HashMapPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `HashMap.new(k_type: GType, k_dup_func: GObject.BoxedCopyFunc, k_destroy_func: GLib.DestroyNotify, v_type: GType, v_dup_func: GObject.BoxedCopyFunc, v_destroy_func: GLib.DestroyNotify, key_hash_func: Gee.HashDataFunc?, key_hash_func_target: gpointer?, key_hash_func_target_destroy_notify: GLib.DestroyNotify, key_equal_func: Gee.EqualDataFunc?, key_equal_func_target: gpointer?, key_equal_func_target_destroy_notify: GLib.DestroyNotify, value_equal_func: Gee.EqualDataFunc?, value_equal_func_target: gpointer?, value_equal_func_target_destroy_notify: GLib.DestroyNotify) -> Gee.HashMap` | gee_hash_map_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_key_equal_func | `HashMap.get_key_equal_func(result_target: out gpointer?) -> Gee.EqualDataFunc` | gee_hash_map_get_key_equal_func |  |  |
| get_key_hash_func | `HashMap.get_key_hash_func(result_target: out gpointer?) -> Gee.HashDataFunc` | gee_hash_map_get_key_hash_func |  |  |
| get_value_equal_func | `HashMap.get_value_equal_func(result_target: out gpointer?) -> Gee.EqualDataFunc` | gee_hash_map_get_value_equal_func |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| k-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| k-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| k-type | GType | read, write, construct-only |  |
| v-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| v-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| v-type | GType | read, write, construct-only |  |

### Gee.HashMultiMap

Parent: `Gee.AbstractMultiMap` ?? GType: `GeeHashMultiMap` ?? C type: `GeeHashMultiMap`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractMultiMap |
| priv | HashMultiMapPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `HashMultiMap.new(k_type: GType, k_dup_func: GObject.BoxedCopyFunc, k_destroy_func: GLib.DestroyNotify, v_type: GType, v_dup_func: GObject.BoxedCopyFunc, v_destroy_func: GLib.DestroyNotify, key_hash_func: Gee.HashDataFunc?, key_hash_func_target: gpointer?, key_hash_func_target_destroy_notify: GLib.DestroyNotify, key_equal_func: Gee.EqualDataFunc?, key_equal_func_target: gpointer?, key_equal_func_target_destroy_notify: GLib.DestroyNotify, value_hash_func: Gee.HashDataFunc?, value_hash_func_target: gpointer?, value_hash_func_target_destroy_notify: GLib.DestroyNotify, value_equal_func: Gee.EqualDataFunc?, value_equal_func_target: gpointer?, value_equal_func_target_destroy_notify: GLib.DestroyNotify) -> Gee.HashMultiMap` | gee_hash_multi_map_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_key_equal_func | `HashMultiMap.get_key_equal_func(result_target: out gpointer?) -> Gee.EqualDataFunc` | gee_hash_multi_map_get_key_equal_func |  |  |
| get_key_hash_func | `HashMultiMap.get_key_hash_func(result_target: out gpointer?) -> Gee.HashDataFunc` | gee_hash_multi_map_get_key_hash_func |  |  |
| get_value_equal_func | `HashMultiMap.get_value_equal_func(result_target: out gpointer?) -> Gee.EqualDataFunc` | gee_hash_multi_map_get_value_equal_func |  |  |
| get_value_hash_func | `HashMultiMap.get_value_hash_func(result_target: out gpointer?) -> Gee.HashDataFunc` | gee_hash_multi_map_get_value_hash_func |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| k-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| k-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| k-type | GType | read, write, construct-only |  |
| v-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| v-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| v-type | GType | read, write, construct-only |  |

### Gee.HashMultiSet

Parent: `Gee.AbstractMultiSet` ?? GType: `GeeHashMultiSet` ?? C type: `GeeHashMultiSet`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractMultiSet |
| priv | HashMultiSetPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| broken | `HashMultiSet.broken(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, hash_func: Gee.HashDataFunc?, hash_func_target: gpointer?, equal_func: Gee.EqualDataFunc?, equal_func_target: gpointer?) -> Gee.HashMultiSet` | gee_hash_multi_set_new |  |  |
| new | `HashMultiSet.new(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, hash_func: Gee.HashDataFunc?, hash_func_target: gpointer?, hash_func_target_destroy_notify: GLib.DestroyNotify, equal_func: Gee.EqualDataFunc?, equal_func_target: gpointer?, equal_func_target_destroy_notify: GLib.DestroyNotify) -> Gee.HashMultiSet` | gee_hash_multi_set_new_fixed |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_equal_func | `HashMultiSet.get_equal_func(result_target: out gpointer?) -> Gee.EqualDataFunc` | gee_hash_multi_set_get_equal_func |  |  |
| get_hash_func | `HashMultiSet.get_hash_func(result_target: out gpointer?) -> Gee.HashDataFunc` | gee_hash_multi_set_get_hash_func |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |

### Gee.HashSet

Parent: `Gee.AbstractSet` ?? GType: `GeeHashSet` ?? C type: `GeeHashSet`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractSet |
| priv | HashSetPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `HashSet.new(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, hash_func: Gee.HashDataFunc?, hash_func_target: gpointer?, hash_func_target_destroy_notify: GLib.DestroyNotify, equal_func: Gee.EqualDataFunc?, equal_func_target: gpointer?, equal_func_target_destroy_notify: GLib.DestroyNotify) -> Gee.HashSet` | gee_hash_set_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_equal_func | `HashSet.get_equal_func(result_target: out gpointer?) -> Gee.EqualDataFunc` | gee_hash_set_get_equal_func |  |  |
| get_hash_func | `HashSet.get_hash_func(result_target: out gpointer?) -> Gee.HashDataFunc` | gee_hash_set_get_hash_func |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |

### Gee.Lazy

GType: `GeeLazy` ?? C type: `GeeLazy`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.TypeInstance |
| priv | LazyPrivate |
| ref_count | gint |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| from_value | `Lazy.from_value(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, item: gpointer?) -> Gee.Lazy` | gee_lazy_new_from_value |  |  |
| new | `Lazy.new(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, func: Gee.LazyFunc, func_target: gpointer?, func_target_destroy_notify: GLib.DestroyNotify) -> Gee.Lazy` | gee_lazy_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| eval | `Lazy.eval() -> none` | gee_lazy_eval |  |  |
| get | `Lazy.get() -> gpointer` | gee_lazy_get |  |  |
| get_future | `Lazy.get_future() -> Gee.Future` | gee_lazy_get_future |  |  |
| get_value | `Lazy.get_value() -> gpointer` | gee_lazy_get_value |  |  |

### Gee.LinkedList

Parent: `Gee.AbstractBidirList` ?? Implements: `Gee.Queue`, `Gee.Deque` ?? GType: `GeeLinkedList` ?? C type: `GeeLinkedList`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractBidirList |
| priv | LinkedListPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `LinkedList.new(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, equal_func: Gee.EqualDataFunc?, equal_func_target: gpointer?, equal_func_target_destroy_notify: GLib.DestroyNotify) -> Gee.LinkedList` | gee_linked_list_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| first | `LinkedList.first() -> gpointer` | gee_linked_list_first |  |  |
| get_equal_func | `LinkedList.get_equal_func(result_target: out gpointer?) -> Gee.EqualDataFunc` | gee_linked_list_get_equal_func |  |  |
| last | `LinkedList.last() -> gpointer` | gee_linked_list_last |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |

### Gee.MapEntry

Parent: `GObject.Object` ?? GType: `GeeMapEntry` ?? C type: `GeeMapEntry` ?? Abstract

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | MapEntryPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_key | `MapEntry.get_key() -> gpointer` | gee_map_entry_get_key |  |  |
| get_read_only | `MapEntry.get_read_only() -> gboolean` | gee_map_entry_get_read_only |  |  |
| get_value | `MapEntry.get_value() -> gpointer` | gee_map_entry_get_value |  |  |
| set_value | `MapEntry.set_value(value: gpointer?) -> none` | gee_map_entry_set_value |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| k-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| k-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| k-type | GType | read, write, construct-only |  |
| key | gpointer | read |  |
| read-only | gboolean | read |  |
| v-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| v-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| v-type | GType | read, write, construct-only |  |
| value | gpointer | read, write |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_key | `get_key() -> gpointer` |  |  |  |
| get_read_only | `get_read_only() -> gboolean` |  |  |  |
| get_value | `get_value() -> gpointer` |  |  |  |
| set_value | `set_value(value: gpointer?) -> none` |  |  |  |

### Gee.PriorityQueue

Parent: `Gee.AbstractQueue` ?? GType: `GeePriorityQueue` ?? C type: `GeePriorityQueue`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractQueue |
| priv | PriorityQueuePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `PriorityQueue.new(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, compare_func: GLib.CompareDataFunc?, compare_func_target: gpointer?, compare_func_target_destroy_notify: GLib.DestroyNotify) -> Gee.PriorityQueue` | gee_priority_queue_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| drain | `PriorityQueue.drain(recipient: Gee.Collection, amount: gint) -> gint` | gee_priority_queue_drain |  |  |
| get_compare_func | `PriorityQueue.get_compare_func(result_target: out gpointer?) -> GLib.CompareDataFunc` | gee_priority_queue_get_compare_func |  |  |
| offer | `PriorityQueue.offer(element: gpointer?) -> gboolean` | gee_priority_queue_offer |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |

### Gee.Promise

GType: `GeePromise` ?? C type: `GeePromise`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.TypeInstance |
| priv | PromisePrivate |
| ref_count | gint |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Promise.new(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify) -> Gee.Promise` | gee_promise_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_future | `Promise.get_future() -> Gee.Future` | gee_promise_get_future |  |  |
| set_exception | `Promise.set_exception(exception: GLib.Error) -> none` | gee_promise_set_exception |  |  |
| set_value | `Promise.set_value(value: gpointer?) -> none` | gee_promise_set_value |  |  |

### Gee.TreeMap

Parent: `Gee.AbstractBidirSortedMap` ?? GType: `GeeTreeMap` ?? C type: `GeeTreeMap`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractBidirSortedMap |
| priv | TreeMapPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TreeMap.new(k_type: GType, k_dup_func: GObject.BoxedCopyFunc, k_destroy_func: GLib.DestroyNotify, v_type: GType, v_dup_func: GObject.BoxedCopyFunc, v_destroy_func: GLib.DestroyNotify, key_compare_func: GLib.CompareDataFunc?, key_compare_func_target: gpointer?, key_compare_func_target_destroy_notify: GLib.DestroyNotify, value_equal_func: Gee.EqualDataFunc?, value_equal_func_target: gpointer?, value_equal_func_target_destroy_notify: GLib.DestroyNotify) -> Gee.TreeMap` | gee_tree_map_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_key_compare_func | `TreeMap.get_key_compare_func(result_target: out gpointer?) -> GLib.CompareDataFunc` | gee_tree_map_get_key_compare_func |  |  |
| get_value_equal_func | `TreeMap.get_value_equal_func(result_target: out gpointer?) -> Gee.EqualDataFunc` | gee_tree_map_get_value_equal_func |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| k-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| k-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| k-type | GType | read, write, construct-only |  |
| v-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| v-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| v-type | GType | read, write, construct-only |  |

### Gee.TreeMultiMap

Parent: `Gee.AbstractMultiMap` ?? GType: `GeeTreeMultiMap` ?? C type: `GeeTreeMultiMap`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractMultiMap |
| priv | TreeMultiMapPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TreeMultiMap.new(k_type: GType, k_dup_func: GObject.BoxedCopyFunc, k_destroy_func: GLib.DestroyNotify, v_type: GType, v_dup_func: GObject.BoxedCopyFunc, v_destroy_func: GLib.DestroyNotify, key_compare_func: GLib.CompareDataFunc?, key_compare_func_target: gpointer?, key_compare_func_target_destroy_notify: GLib.DestroyNotify, value_compare_func: GLib.CompareDataFunc?, value_compare_func_target: gpointer?, value_compare_func_target_destroy_notify: GLib.DestroyNotify) -> Gee.TreeMultiMap` | gee_tree_multi_map_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_key_compare_func | `TreeMultiMap.get_key_compare_func(result_target: out gpointer?) -> GLib.CompareDataFunc` | gee_tree_multi_map_get_key_compare_func |  |  |
| get_value_compare_func | `TreeMultiMap.get_value_compare_func(result_target: out gpointer?) -> GLib.CompareDataFunc` | gee_tree_multi_map_get_value_compare_func |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| k-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| k-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| k-type | GType | read, write, construct-only |  |
| v-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| v-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| v-type | GType | read, write, construct-only |  |

### Gee.TreeMultiSet

Parent: `Gee.AbstractMultiSet` ?? GType: `GeeTreeMultiSet` ?? C type: `GeeTreeMultiSet`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractMultiSet |
| priv | TreeMultiSetPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TreeMultiSet.new(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, compare_func: GLib.CompareDataFunc?, compare_func_target: gpointer?, compare_func_target_destroy_notify: GLib.DestroyNotify) -> Gee.TreeMultiSet` | gee_tree_multi_set_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_compare_func | `TreeMultiSet.get_compare_func(result_target: out gpointer?) -> GLib.CompareDataFunc` | gee_tree_multi_set_get_compare_func |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |

### Gee.TreeSet

Parent: `Gee.AbstractBidirSortedSet` ?? GType: `GeeTreeSet` ?? C type: `GeeTreeSet`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractBidirSortedSet |
| priv | TreeSetPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TreeSet.new(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, compare_func: GLib.CompareDataFunc?, compare_func_target: gpointer?, compare_func_target_destroy_notify: GLib.DestroyNotify) -> Gee.TreeSet` | gee_tree_set_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_compare_func | `TreeSet.get_compare_func(result_target: out gpointer?) -> GLib.CompareDataFunc` | gee_tree_set_get_compare_func |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |

### Gee.UnrolledLinkedList

Parent: `Gee.AbstractBidirList` ?? Implements: `Gee.Queue`, `Gee.Deque` ?? GType: `GeeUnrolledLinkedList` ?? C type: `GeeUnrolledLinkedList`

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gee.AbstractBidirList |
| priv | UnrolledLinkedListPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `UnrolledLinkedList.new(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, equal_func: Gee.EqualDataFunc?, equal_func_target: gpointer?, equal_func_target_destroy_notify: GLib.DestroyNotify) -> Gee.UnrolledLinkedList` | gee_unrolled_linked_list_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_equal_func | `UnrolledLinkedList.get_equal_func(result_target: out gpointer?) -> Gee.EqualDataFunc` | gee_unrolled_linked_list_get_equal_func |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-destroy-func | GLib.DestroyNotify | read, write, construct-only |  |
| g-dup-func | GObject.BoxedCopyFunc | read, write, construct-only |  |
| g-type | GType | read, write, construct-only |  |

## Interfaces

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| BidirIterator |  | 0 | 0 | 4 |  |
| BidirList |  | 0 | 0 | 2 |  |
| BidirListIterator |  | 0 | 0 | 1 |  |
| BidirMapIterator |  | 0 | 0 | 4 |  |
| BidirSortedMap |  | 0 | 0 | 3 |  |
| BidirSortedSet |  | 0 | 0 | 3 |  |
| Collection |  | 0 | 0 | 20 |  |
| Comparable |  | 0 | 0 | 1 |  |
| Deque |  | 0 | 0 | 8 |  |
| Future |  | 0 | 0 | 12 |  |
| Hashable |  | 0 | 0 | 2 |  |
| Iterable |  | 0 | 0 | 1 |  |
| Iterator |  | 0 | 0 | 8 |  |
| List |  | 0 | 0 | 13 |  |
| ListIterator |  | 0 | 0 | 3 |  |
| Map |  | 0 | 0 | 24 |  |
| MapIterator |  | 0 | 0 | 11 |  |
| MultiMap |  | 0 | 0 | 15 |  |
| MultiSet |  | 0 | 0 | 3 |  |
| Queue |  | 0 | 0 | 7 |  |
| Set |  | 0 | 0 | 2 |  |
| SortedMap |  | 0 | 0 | 7 |  |
| SortedSet |  | 0 | 0 | 12 |  |
| Traversable |  | 0 | 0 | 16 |  |

### Gee.BidirIterator

GType: `GeeBidirIterator` ?? C type: `GeeBidirIterator`

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| first | `BidirIterator.first() -> gboolean` | gee_bidir_iterator_first |  |  |
| has_previous | `BidirIterator.has_previous() -> gboolean` | gee_bidir_iterator_has_previous |  |  |
| last | `BidirIterator.last() -> gboolean` | gee_bidir_iterator_last |  |  |
| previous | `BidirIterator.previous() -> gboolean` | gee_bidir_iterator_previous |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| first | `first() -> gboolean` |  |  |  |
| has_previous | `has_previous() -> gboolean` |  |  |  |
| last | `last() -> gboolean` |  |  |  |
| previous | `previous() -> gboolean` |  |  |  |

### Gee.BidirList

GType: `GeeBidirList` ?? C type: `GeeBidirList`

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| bidir_list_iterator | `BidirList.bidir_list_iterator() -> Gee.BidirListIterator` | gee_bidir_list_bidir_list_iterator |  |  |
| get_read_only_view | `BidirList.get_read_only_view() -> Gee.BidirList` | gee_bidir_list_get_read_only_view |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| read-only-view | Gee.BidirList | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| bidir_list_iterator | `bidir_list_iterator() -> Gee.BidirListIterator` |  |  |  |
| get_read_only_view | `get_read_only_view() -> Gee.BidirList` |  |  |  |

### Gee.BidirListIterator

GType: `GeeBidirListIterator` ?? C type: `GeeBidirListIterator`

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| insert | `BidirListIterator.insert(item: gpointer?) -> none` | gee_bidir_list_iterator_insert |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| insert | `insert(item: gpointer?) -> none` |  |  |  |

### Gee.BidirMapIterator

GType: `GeeBidirMapIterator` ?? C type: `GeeBidirMapIterator`

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| first | `BidirMapIterator.first() -> gboolean` | gee_bidir_map_iterator_first |  |  |
| has_previous | `BidirMapIterator.has_previous() -> gboolean` | gee_bidir_map_iterator_has_previous |  |  |
| last | `BidirMapIterator.last() -> gboolean` | gee_bidir_map_iterator_last |  |  |
| previous | `BidirMapIterator.previous() -> gboolean` | gee_bidir_map_iterator_previous |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| first | `first() -> gboolean` |  |  |  |
| has_previous | `has_previous() -> gboolean` |  |  |  |
| last | `last() -> gboolean` |  |  |  |
| previous | `previous() -> gboolean` |  |  |  |

### Gee.BidirSortedMap

GType: `GeeBidirSortedMap` ?? C type: `GeeBidirSortedMap`

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| empty | `empty(k_type: GType, k_dup_func: GObject.BoxedCopyFunc, k_destroy_func: GLib.DestroyNotify, v_type: GType, v_dup_func: GObject.BoxedCopyFunc, v_destroy_func: GLib.DestroyNotify) -> Gee.BidirSortedMap` | gee_bidir_sorted_map_empty |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| bidir_map_iterator | `BidirSortedMap.bidir_map_iterator() -> Gee.BidirMapIterator` | gee_bidir_sorted_map_bidir_map_iterator |  |  |
| get_read_only_view | `BidirSortedMap.get_read_only_view() -> Gee.BidirSortedMap` | gee_bidir_sorted_map_get_read_only_view |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| read-only-view | Gee.BidirSortedMap | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| bidir_map_iterator | `bidir_map_iterator() -> Gee.BidirMapIterator` |  |  |  |
| get_read_only_view | `get_read_only_view() -> Gee.BidirSortedMap` |  |  |  |

### Gee.BidirSortedSet

GType: `GeeBidirSortedSet` ?? C type: `GeeBidirSortedSet`

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| empty | `empty(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify) -> Gee.BidirSortedSet` | gee_bidir_sorted_set_empty |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| bidir_iterator | `BidirSortedSet.bidir_iterator() -> Gee.BidirIterator` | gee_bidir_sorted_set_bidir_iterator |  |  |
| get_read_only_view | `BidirSortedSet.get_read_only_view() -> Gee.BidirSortedSet` | gee_bidir_sorted_set_get_read_only_view |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| read-only-view | Gee.BidirSortedSet | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| bidir_iterator | `bidir_iterator() -> Gee.BidirIterator` |  |  |  |
| get_read_only_view | `get_read_only_view() -> Gee.BidirSortedSet` |  |  |  |

### Gee.Collection

GType: `GeeCollection` ?? C type: `GeeCollection`

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| empty | `empty(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify) -> Gee.Collection` | gee_collection_empty |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `Collection.add(item: gpointer?) -> gboolean` | gee_collection_add |  |  |
| add_all | `Collection.add_all(collection: Gee.Collection) -> gboolean` | gee_collection_add_all |  |  |
| add_all_array | `Collection.add_all_array(array: gpointer, array_length1: gint) -> gboolean` | gee_collection_add_all_array |  |  |
| add_all_iterator | `Collection.add_all_iterator(iter: Gee.Iterator) -> gboolean` | gee_collection_add_all_iterator |  |  |
| clear | `Collection.clear() -> none` | gee_collection_clear |  |  |
| contains | `Collection.contains(item: gpointer?) -> gboolean` | gee_collection_contains |  |  |
| contains_all | `Collection.contains_all(collection: Gee.Collection) -> gboolean` | gee_collection_contains_all |  |  |
| contains_all_array | `Collection.contains_all_array(array: gpointer, array_length1: gint) -> gboolean` | gee_collection_contains_all_array |  |  |
| contains_all_iterator | `Collection.contains_all_iterator(iter: Gee.Iterator) -> gboolean` | gee_collection_contains_all_iterator |  |  |
| get_is_empty | `Collection.get_is_empty() -> gboolean` | gee_collection_get_is_empty |  |  |
| get_read_only | `Collection.get_read_only() -> gboolean` | gee_collection_get_read_only |  |  |
| get_read_only_view | `Collection.get_read_only_view() -> Gee.Collection` | gee_collection_get_read_only_view |  |  |
| get_size | `Collection.get_size() -> gint` | gee_collection_get_size |  |  |
| remove | `Collection.remove(item: gpointer?) -> gboolean` | gee_collection_remove |  |  |
| remove_all | `Collection.remove_all(collection: Gee.Collection) -> gboolean` | gee_collection_remove_all |  |  |
| remove_all_array | `Collection.remove_all_array(array: gpointer, array_length1: gint) -> gboolean` | gee_collection_remove_all_array |  |  |
| remove_all_iterator | `Collection.remove_all_iterator(iter: Gee.Iterator) -> gboolean` | gee_collection_remove_all_iterator |  |  |
| retain_all | `Collection.retain_all(collection: Gee.Collection) -> gboolean` | gee_collection_retain_all |  |  |
| to_array | `Collection.to_array(result_length1: out gint) -> gpointer` | gee_collection_to_array |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| read-only | gboolean | read |  |
| read-only-view | Gee.Collection | read |  |
| size | gint | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `add(item: gpointer?) -> gboolean` |  |  |  |
| add_all | `add_all(collection: Gee.Collection) -> gboolean` |  |  |  |
| add_all_array | `add_all_array(array: gpointer, array_length1: gint) -> gboolean` |  |  |  |
| add_all_iterator | `add_all_iterator(iter: Gee.Iterator) -> gboolean` |  |  |  |
| clear | `clear() -> none` |  |  |  |
| contains | `contains(item: gpointer?) -> gboolean` |  |  |  |
| contains_all | `contains_all(collection: Gee.Collection) -> gboolean` |  |  |  |
| contains_all_array | `contains_all_array(array: gpointer, array_length1: gint) -> gboolean` |  |  |  |
| contains_all_iterator | `contains_all_iterator(iter: Gee.Iterator) -> gboolean` |  |  |  |
| get_is_empty | `get_is_empty() -> gboolean` |  |  |  |
| get_read_only | `get_read_only() -> gboolean` |  |  |  |
| get_read_only_view | `get_read_only_view() -> Gee.Collection` |  |  |  |
| get_size | `get_size() -> gint` |  |  |  |
| remove | `remove(item: gpointer?) -> gboolean` |  |  |  |
| remove_all | `remove_all(collection: Gee.Collection) -> gboolean` |  |  |  |
| remove_all_array | `remove_all_array(array: gpointer, array_length1: gint) -> gboolean` |  |  |  |
| remove_all_iterator | `remove_all_iterator(iter: Gee.Iterator) -> gboolean` |  |  |  |
| retain_all | `retain_all(collection: Gee.Collection) -> gboolean` |  |  |  |
| to_array | `to_array(result_length1: out gint) -> gpointer` |  |  |  |

### Gee.Comparable

GType: `GeeComparable` ?? C type: `GeeComparable`

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| compare_to | `Comparable.compare_to(object: gpointer?) -> gint` | gee_comparable_compare_to |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| compare_to | `compare_to(object: gpointer?) -> gint` |  |  |  |

### Gee.Deque

GType: `GeeDeque` ?? C type: `GeeDeque`

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| drain_head | `Deque.drain_head(recipient: Gee.Collection, amount: gint) -> gint` | gee_deque_drain_head |  |  |
| drain_tail | `Deque.drain_tail(recipient: Gee.Collection, amount: gint) -> gint` | gee_deque_drain_tail |  |  |
| offer_head | `Deque.offer_head(element: gpointer?) -> gboolean` | gee_deque_offer_head |  |  |
| offer_tail | `Deque.offer_tail(element: gpointer?) -> gboolean` | gee_deque_offer_tail |  |  |
| peek_head | `Deque.peek_head() -> gpointer` | gee_deque_peek_head |  |  |
| peek_tail | `Deque.peek_tail() -> gpointer` | gee_deque_peek_tail |  |  |
| poll_head | `Deque.poll_head() -> gpointer` | gee_deque_poll_head |  |  |
| poll_tail | `Deque.poll_tail() -> gpointer` | gee_deque_poll_tail |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| drain_head | `drain_head(recipient: Gee.Collection, amount: gint) -> gint` |  |  |  |
| drain_tail | `drain_tail(recipient: Gee.Collection, amount: gint) -> gint` |  |  |  |
| offer_head | `offer_head(element: gpointer?) -> gboolean` |  |  |  |
| offer_tail | `offer_tail(element: gpointer?) -> gboolean` |  |  |  |
| peek_head | `peek_head() -> gpointer` |  |  |  |
| peek_tail | `peek_tail() -> gpointer` |  |  |  |
| poll_head | `poll_head() -> gpointer` |  |  |  |
| poll_tail | `poll_tail() -> gpointer` |  |  |  |

### Gee.Future

GType: `GeeFuture` ?? C type: `GeeFuture`

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| flat_map | `Future.flat_map(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, func: Gee.FutureFlatMapFunc, func_target: gpointer?, func_target_destroy_notify: GLib.DestroyNotify) -> Gee.Future` | gee_future_flat_map |  |  |
| get_exception | `Future.get_exception() -> GLib.Error` | gee_future_get_exception |  |  |
| get_ready | `Future.get_ready() -> gboolean` | gee_future_get_ready |  |  |
| get_value | `Future.get_value() -> gpointer` | gee_future_get_value |  |  |
| light_map | `Future.light_map(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, func: Gee.FutureLightMapFunc, func_target: gpointer?, func_target_destroy_notify: GLib.DestroyNotify) -> Gee.Future` | gee_future_light_map_fixed |  |  |
| light_map_broken | `Future.light_map_broken(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, func: Gee.FutureLightMapFunc, func_target: gpointer?) -> Gee.Future` | gee_future_light_map |  |  |
| map | `Future.map(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, func: Gee.FutureMapFunc, func_target: gpointer?, func_target_destroy_notify: GLib.DestroyNotify) -> Gee.Future` | gee_future_map |  |  |
| wait | `Future.wait() -> gpointer throws` | gee_future_wait |  |  |
| wait_async | `Future.wait_async(_callback_: Gio.AsyncReadyCallback?, _callback__target: gpointer?) -> none` | gee_future_wait_async |  |  |
| wait_finish | `Future.wait_finish(_res_: Gio.AsyncResult) -> gpointer throws` | gee_future_wait_finish |  |  |
| wait_until | `Future.wait_until(end_time: gint64, value: out gpointer?) -> gboolean throws` | gee_future_wait_until |  |  |
| zip | `Future.zip(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, b_type: GType, b_dup_func: GObject.BoxedCopyFunc, b_destroy_func: GLib.DestroyNotify, zip_func: Gee.FutureZipFunc, zip_func_target: gpointer?, second: Gee.Future) -> Gee.Future` | gee_future_zip |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| exception | GLib.Error | read |  |
| ready | gboolean | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| flat_map | `flat_map(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, func: Gee.FutureFlatMapFunc, func_target: gpointer?, func_target_destroy_notify: GLib.DestroyNotify) -> Gee.Future` |  |  |  |
| get_exception | `get_exception() -> GLib.Error` |  |  |  |
| get_ready | `get_ready() -> gboolean` |  |  |  |
| get_value | `get_value() -> gpointer` |  |  |  |
| light_map | `light_map(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, func: Gee.FutureLightMapFunc, func_target: gpointer?, func_target_destroy_notify: GLib.DestroyNotify) -> Gee.Future` |  |  |  |
| light_map_broken | `light_map_broken(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, func: Gee.FutureLightMapFunc, func_target: gpointer?) -> Gee.Future` |  |  |  |
| map | `map(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, func: Gee.FutureMapFunc, func_target: gpointer?, func_target_destroy_notify: GLib.DestroyNotify) -> Gee.Future` |  |  |  |
| wait | `wait() -> gpointer throws` |  |  |  |
| wait_async | `wait_async(_callback_: Gio.AsyncReadyCallback?, _callback__target: gpointer?) -> none` |  |  |  |
| wait_finish | `wait_finish(_res_: Gio.AsyncResult) -> gpointer throws` |  |  |  |
| wait_until | `wait_until(end_time: gint64, value: out gpointer?) -> gboolean throws` |  |  |  |
| zip | `zip(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, b_type: GType, b_dup_func: GObject.BoxedCopyFunc, b_destroy_func: GLib.DestroyNotify, zip_func: Gee.FutureZipFunc, zip_func_target: gpointer?, second: Gee.Future) -> Gee.Future` |  |  |  |

### Gee.Hashable

GType: `GeeHashable` ?? C type: `GeeHashable`

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| equal_to | `Hashable.equal_to(object: gpointer?) -> gboolean` | gee_hashable_equal_to |  |  |
| hash | `Hashable.hash() -> guint` | gee_hashable_hash |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| equal_to | `equal_to(object: gpointer?) -> gboolean` |  |  |  |
| hash | `hash() -> guint` |  |  |  |

### Gee.Iterable

GType: `GeeIterable` ?? C type: `GeeIterable`

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| iterator | `Iterable.iterator() -> Gee.Iterator` | gee_iterable_iterator |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| iterator | `iterator() -> Gee.Iterator` |  |  |  |

### Gee.Iterator

GType: `GeeIterator` ?? C type: `GeeIterator`

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| concat | `concat(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, iters: Gee.Iterator) -> Gee.Iterator` | gee_iterator_concat |  |  |
| unfold | `unfold(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, f: Gee.UnfoldFunc, f_target: gpointer?, f_target_destroy_notify: GLib.DestroyNotify, current: Gee.Lazy?) -> Gee.Iterator` | gee_iterator_unfold |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `Iterator.get() -> gpointer` | gee_iterator_get |  |  |
| get_read_only | `Iterator.get_read_only() -> gboolean` | gee_iterator_get_read_only |  |  |
| get_valid | `Iterator.get_valid() -> gboolean` | gee_iterator_get_valid |  |  |
| has_next | `Iterator.has_next() -> gboolean` | gee_iterator_has_next |  |  |
| next | `Iterator.next() -> gboolean` | gee_iterator_next |  |  |
| remove | `Iterator.remove() -> none` | gee_iterator_remove |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| read-only | gboolean | read |  |
| valid | gboolean | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `get() -> gpointer` |  |  |  |
| get_read_only | `get_read_only() -> gboolean` |  |  |  |
| get_valid | `get_valid() -> gboolean` |  |  |  |
| has_next | `has_next() -> gboolean` |  |  |  |
| next | `next() -> gboolean` |  |  |  |
| remove | `remove() -> none` |  |  |  |

### Gee.List

GType: `GeeList` ?? C type: `GeeList`

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| empty | `empty(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify) -> Gee.List` | gee_list_empty |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| first | `List.first() -> gpointer` | gee_list_first |  |  |
| get | `List.get(index: gint) -> gpointer` | gee_list_get |  |  |
| get_read_only_view | `List.get_read_only_view() -> Gee.List` | gee_list_get_read_only_view |  |  |
| index_of | `List.index_of(item: gpointer?) -> gint` | gee_list_index_of |  |  |
| insert | `List.insert(index: gint, item: gpointer?) -> none` | gee_list_insert |  |  |
| insert_all | `List.insert_all(index: gint, collection: Gee.Collection) -> none` | gee_list_insert_all |  |  |
| last | `List.last() -> gpointer` | gee_list_last |  |  |
| list_iterator | `List.list_iterator() -> Gee.ListIterator` | gee_list_list_iterator |  |  |
| remove_at | `List.remove_at(index: gint) -> gpointer` | gee_list_remove_at |  |  |
| set | `List.set(index: gint, item: gpointer?) -> none` | gee_list_set |  |  |
| slice | `List.slice(start: gint, stop: gint) -> Gee.List` | gee_list_slice |  |  |
| sort | `List.sort(compare_func: GLib.CompareDataFunc?, compare_func_target: gpointer?, compare_func_target_destroy_notify: GLib.DestroyNotify) -> none` | gee_list_sort |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| read-only-view | Gee.List | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| first | `first() -> gpointer` |  |  |  |
| get | `get(index: gint) -> gpointer` |  |  |  |
| get_read_only_view | `get_read_only_view() -> Gee.List` |  |  |  |
| index_of | `index_of(item: gpointer?) -> gint` |  |  |  |
| insert | `insert(index: gint, item: gpointer?) -> none` |  |  |  |
| insert_all | `insert_all(index: gint, collection: Gee.Collection) -> none` |  |  |  |
| last | `last() -> gpointer` |  |  |  |
| list_iterator | `list_iterator() -> Gee.ListIterator` |  |  |  |
| remove_at | `remove_at(index: gint) -> gpointer` |  |  |  |
| set | `set(index: gint, item: gpointer?) -> none` |  |  |  |
| slice | `slice(start: gint, stop: gint) -> Gee.List` |  |  |  |
| sort | `sort(compare_func: GLib.CompareDataFunc?, compare_func_target: gpointer?, compare_func_target_destroy_notify: GLib.DestroyNotify) -> none` |  |  |  |

### Gee.ListIterator

GType: `GeeListIterator` ?? C type: `GeeListIterator`

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `ListIterator.add(item: gpointer?) -> none` | gee_list_iterator_add |  |  |
| index | `ListIterator.index() -> gint` | gee_list_iterator_index |  |  |
| set | `ListIterator.set(item: gpointer?) -> none` | gee_list_iterator_set |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `add(item: gpointer?) -> none` |  |  |  |
| index | `index() -> gint` |  |  |  |
| set | `set(item: gpointer?) -> none` |  |  |  |

### Gee.Map

GType: `GeeMap` ?? C type: `GeeMap`

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| empty | `empty(k_type: GType, k_dup_func: GObject.BoxedCopyFunc, k_destroy_func: GLib.DestroyNotify, v_type: GType, v_dup_func: GObject.BoxedCopyFunc, v_destroy_func: GLib.DestroyNotify) -> Gee.Map` | gee_map_empty |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `Map.clear() -> none` | gee_map_clear |  |  |
| contains | `Map.contains(key: gpointer?) -> gboolean` | gee_map_contains |  |  |
| contains_all | `Map.contains_all(map: Gee.Map) -> gboolean` | gee_map_contains_all |  |  |
| get | `Map.get(key: gpointer?) -> gpointer` | gee_map_get |  |  |
| get_entries | `Map.get_entries() -> Gee.Set` | gee_map_get_entries |  |  |
| get_is_empty | `Map.get_is_empty() -> gboolean` | gee_map_get_is_empty |  |  |
| get_key_type | `Map.get_key_type() -> GType` | gee_map_get_key_type |  |  |
| get_keys | `Map.get_keys() -> Gee.Set` | gee_map_get_keys |  |  |
| get_read_only | `Map.get_read_only() -> gboolean` | gee_map_get_read_only |  |  |
| get_read_only_view | `Map.get_read_only_view() -> Gee.Map` | gee_map_get_read_only_view |  |  |
| get_size | `Map.get_size() -> gint` | gee_map_get_size |  |  |
| get_value_type | `Map.get_value_type() -> GType` | gee_map_get_value_type |  |  |
| get_values | `Map.get_values() -> Gee.Collection` | gee_map_get_values |  |  |
| has | `Map.has(key: gpointer?, value: gpointer?) -> gboolean` | gee_map_has |  |  |
| has_all | `Map.has_all(map: Gee.Map) -> gboolean` | gee_map_has_all |  |  |
| has_key | `Map.has_key(key: gpointer?) -> gboolean` | gee_map_has_key |  |  |
| map_iterator | `Map.map_iterator() -> Gee.MapIterator` | gee_map_map_iterator |  |  |
| remove | `Map.remove(key: gpointer?, value: out gpointer?) -> gboolean` | gee_map_remove |  |  |
| remove_all | `Map.remove_all(map: Gee.Map) -> gboolean` | gee_map_remove_all |  |  |
| set | `Map.set(key: gpointer?, value: gpointer?) -> none` | gee_map_set |  |  |
| set_all | `Map.set_all(map: Gee.Map) -> none` | gee_map_set_all |  |  |
| unset | `Map.unset(key: gpointer?, value: out gpointer?) -> gboolean` | gee_map_unset |  |  |
| unset_all | `Map.unset_all(map: Gee.Map) -> gboolean` | gee_map_unset_all |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| entries | Gee.Set | read |  |
| keys | Gee.Set | read |  |
| read-only | gboolean | read |  |
| read-only-view | Gee.Map | read |  |
| size | gint | read |  |
| values | Gee.Collection | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `clear() -> none` |  |  |  |
| get | `get(key: gpointer?) -> gpointer` |  |  |  |
| get_entries | `get_entries() -> Gee.Set` |  |  |  |
| get_is_empty | `get_is_empty() -> gboolean` |  |  |  |
| get_keys | `get_keys() -> Gee.Set` |  |  |  |
| get_read_only | `get_read_only() -> gboolean` |  |  |  |
| get_read_only_view | `get_read_only_view() -> Gee.Map` |  |  |  |
| get_size | `get_size() -> gint` |  |  |  |
| get_values | `get_values() -> Gee.Collection` |  |  |  |
| has | `has(key: gpointer?, value: gpointer?) -> gboolean` |  |  |  |
| has_all | `has_all(map: Gee.Map) -> gboolean` |  |  |  |
| has_key | `has_key(key: gpointer?) -> gboolean` |  |  |  |
| map_iterator | `map_iterator() -> Gee.MapIterator` |  |  |  |
| set | `set(key: gpointer?, value: gpointer?) -> none` |  |  |  |
| set_all | `set_all(map: Gee.Map) -> none` |  |  |  |
| unset | `unset(key: gpointer?, value: out gpointer?) -> gboolean` |  |  |  |
| unset_all | `unset_all(map: Gee.Map) -> gboolean` |  |  |  |

### Gee.MapIterator

GType: `GeeMapIterator` ?? C type: `GeeMapIterator`

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| fold | `MapIterator.fold(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, f: Gee.FoldMapFunc, f_target: gpointer?, seed: gpointer?) -> gpointer` | gee_map_iterator_fold |  |  |
| foreach | `MapIterator.foreach(f: Gee.ForallMapFunc, f_target: gpointer?) -> gboolean` | gee_map_iterator_foreach |  |  |
| get_key | `MapIterator.get_key() -> gpointer` | gee_map_iterator_get_key |  |  |
| get_mutable | `MapIterator.get_mutable() -> gboolean` | gee_map_iterator_get_mutable |  |  |
| get_read_only | `MapIterator.get_read_only() -> gboolean` | gee_map_iterator_get_read_only |  |  |
| get_valid | `MapIterator.get_valid() -> gboolean` | gee_map_iterator_get_valid |  |  |
| get_value | `MapIterator.get_value() -> gpointer` | gee_map_iterator_get_value |  |  |
| has_next | `MapIterator.has_next() -> gboolean` | gee_map_iterator_has_next |  |  |
| next | `MapIterator.next() -> gboolean` | gee_map_iterator_next |  |  |
| set_value | `MapIterator.set_value(value: gpointer?) -> none` | gee_map_iterator_set_value |  |  |
| unset | `MapIterator.unset() -> none` | gee_map_iterator_unset |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| mutable | gboolean | read |  |
| read-only | gboolean | read |  |
| valid | gboolean | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| fold | `fold(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, f: Gee.FoldMapFunc, f_target: gpointer?, seed: gpointer?) -> gpointer` |  |  |  |
| foreach | `foreach(f: Gee.ForallMapFunc, f_target: gpointer?) -> gboolean` |  |  |  |
| get_key | `get_key() -> gpointer` |  |  |  |
| get_mutable | `get_mutable() -> gboolean` |  |  |  |
| get_read_only | `get_read_only() -> gboolean` |  |  |  |
| get_valid | `get_valid() -> gboolean` |  |  |  |
| get_value | `get_value() -> gpointer` |  |  |  |
| has_next | `has_next() -> gboolean` |  |  |  |
| next | `next() -> gboolean` |  |  |  |
| set_value | `set_value(value: gpointer?) -> none` |  |  |  |
| unset | `unset() -> none` |  |  |  |

### Gee.MultiMap

GType: `GeeMultiMap` ?? C type: `GeeMultiMap`

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `MultiMap.clear() -> none` | gee_multi_map_clear |  |  |
| contains | `MultiMap.contains(key: gpointer?) -> gboolean` | gee_multi_map_contains |  |  |
| get | `MultiMap.get(key: gpointer?) -> Gee.Collection` | gee_multi_map_get |  |  |
| get_all_keys | `MultiMap.get_all_keys() -> Gee.MultiSet` | gee_multi_map_get_all_keys |  |  |
| get_key_type | `MultiMap.get_key_type() -> GType` | gee_multi_map_get_key_type |  |  |
| get_keys | `MultiMap.get_keys() -> Gee.Set` | gee_multi_map_get_keys |  |  |
| get_read_only | `MultiMap.get_read_only() -> gboolean` | gee_multi_map_get_read_only |  |  |
| get_read_only_view | `MultiMap.get_read_only_view() -> Gee.MultiMap` | gee_multi_map_get_read_only_view |  |  |
| get_size | `MultiMap.get_size() -> gint` | gee_multi_map_get_size |  |  |
| get_value_type | `MultiMap.get_value_type() -> GType` | gee_multi_map_get_value_type |  |  |
| get_values | `MultiMap.get_values() -> Gee.Collection` | gee_multi_map_get_values |  |  |
| map_iterator | `MultiMap.map_iterator() -> Gee.MapIterator` | gee_multi_map_map_iterator |  |  |
| remove | `MultiMap.remove(key: gpointer?, value: gpointer?) -> gboolean` | gee_multi_map_remove |  |  |
| remove_all | `MultiMap.remove_all(key: gpointer?) -> gboolean` | gee_multi_map_remove_all |  |  |
| set | `MultiMap.set(key: gpointer?, value: gpointer?) -> none` | gee_multi_map_set |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| read-only | gboolean | read |  |
| size | gint | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `clear() -> none` |  |  |  |
| contains | `contains(key: gpointer?) -> gboolean` |  |  |  |
| get | `get(key: gpointer?) -> Gee.Collection` |  |  |  |
| get_all_keys | `get_all_keys() -> Gee.MultiSet` |  |  |  |
| get_keys | `get_keys() -> Gee.Set` |  |  |  |
| get_read_only | `get_read_only() -> gboolean` |  |  |  |
| get_read_only_view | `get_read_only_view() -> Gee.MultiMap` |  |  |  |
| get_size | `get_size() -> gint` |  |  |  |
| get_values | `get_values() -> Gee.Collection` |  |  |  |
| map_iterator | `map_iterator() -> Gee.MapIterator` |  |  |  |
| remove | `remove(key: gpointer?, value: gpointer?) -> gboolean` |  |  |  |
| remove_all | `remove_all(key: gpointer?) -> gboolean` |  |  |  |
| set | `set(key: gpointer?, value: gpointer?) -> none` |  |  |  |

### Gee.MultiSet

GType: `GeeMultiSet` ?? C type: `GeeMultiSet`

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| empty | `empty(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify) -> Gee.Set` | gee_multi_set_empty |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| count | `MultiSet.count(item: gpointer?) -> gint` | gee_multi_set_count |  |  |
| get_read_only_view | `MultiSet.get_read_only_view() -> Gee.MultiSet` | gee_multi_set_get_read_only_view |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| count | `count(item: gpointer?) -> gint` |  |  |  |
| get_read_only_view | `get_read_only_view() -> Gee.MultiSet` |  |  |  |

### Gee.Queue

GType: `GeeQueue` ?? C type: `GeeQueue`

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| drain | `Queue.drain(recipient: Gee.Collection, amount: gint) -> gint` | gee_queue_drain |  |  |
| get_capacity | `Queue.get_capacity() -> gint` | gee_queue_get_capacity |  |  |
| get_is_full | `Queue.get_is_full() -> gboolean` | gee_queue_get_is_full |  |  |
| get_remaining_capacity | `Queue.get_remaining_capacity() -> gint` | gee_queue_get_remaining_capacity |  |  |
| offer | `Queue.offer(element: gpointer?) -> gboolean` | gee_queue_offer |  |  |
| peek | `Queue.peek() -> gpointer` | gee_queue_peek |  |  |
| poll | `Queue.poll() -> gpointer` | gee_queue_poll |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| capacity | gint | read |  |
| is-full | gboolean | read |  |
| remaining-capacity | gint | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| drain | `drain(recipient: Gee.Collection, amount: gint) -> gint` |  |  |  |
| get_capacity | `get_capacity() -> gint` |  |  |  |
| get_is_full | `get_is_full() -> gboolean` |  |  |  |
| get_remaining_capacity | `get_remaining_capacity() -> gint` |  |  |  |
| offer | `offer(element: gpointer?) -> gboolean` |  |  |  |
| peek | `peek() -> gpointer` |  |  |  |
| poll | `poll() -> gpointer` |  |  |  |

### Gee.Set

GType: `GeeSet` ?? C type: `GeeSet`

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| empty | `empty(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify) -> Gee.Set` | gee_set_empty |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_read_only_view | `Set.get_read_only_view() -> Gee.Set` | gee_set_get_read_only_view |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| read-only-view | Gee.Set | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_read_only_view | `get_read_only_view() -> Gee.Set` |  |  |  |

### Gee.SortedMap

GType: `GeeSortedMap` ?? C type: `GeeSortedMap`

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| empty | `empty(k_type: GType, k_dup_func: GObject.BoxedCopyFunc, k_destroy_func: GLib.DestroyNotify, v_type: GType, v_dup_func: GObject.BoxedCopyFunc, v_destroy_func: GLib.DestroyNotify) -> Gee.Map` | gee_sorted_map_empty |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_ascending_entries | `SortedMap.get_ascending_entries() -> Gee.SortedSet` | gee_sorted_map_get_ascending_entries |  |  |
| get_ascending_keys | `SortedMap.get_ascending_keys() -> Gee.SortedSet` | gee_sorted_map_get_ascending_keys |  |  |
| get_read_only_view | `SortedMap.get_read_only_view() -> Gee.SortedMap` | gee_sorted_map_get_read_only_view |  |  |
| head_map | `SortedMap.head_map(before: gpointer?) -> Gee.SortedMap` | gee_sorted_map_head_map |  |  |
| sub_map | `SortedMap.sub_map(before: gpointer?, after: gpointer?) -> Gee.SortedMap` | gee_sorted_map_sub_map |  |  |
| tail_map | `SortedMap.tail_map(after: gpointer?) -> Gee.SortedMap` | gee_sorted_map_tail_map |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| ascending-entries | Gee.SortedSet | read |  |
| ascending-keys | Gee.SortedSet | read |  |
| read-only-view | Gee.SortedMap | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_ascending_entries | `get_ascending_entries() -> Gee.SortedSet` |  |  |  |
| get_ascending_keys | `get_ascending_keys() -> Gee.SortedSet` |  |  |  |
| get_read_only_view | `get_read_only_view() -> Gee.SortedMap` |  |  |  |
| head_map | `head_map(before: gpointer?) -> Gee.SortedMap` |  |  |  |
| sub_map | `sub_map(before: gpointer?, after: gpointer?) -> Gee.SortedMap` |  |  |  |
| tail_map | `tail_map(after: gpointer?) -> Gee.SortedMap` |  |  |  |

### Gee.SortedSet

GType: `GeeSortedSet` ?? C type: `GeeSortedSet`

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| empty | `empty(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify) -> Gee.SortedSet` | gee_sorted_set_empty |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ceil | `SortedSet.ceil(element: gpointer?) -> gpointer` | gee_sorted_set_ceil |  |  |
| first | `SortedSet.first() -> gpointer` | gee_sorted_set_first |  |  |
| floor | `SortedSet.floor(element: gpointer?) -> gpointer` | gee_sorted_set_floor |  |  |
| get_read_only_view | `SortedSet.get_read_only_view() -> Gee.SortedSet` | gee_sorted_set_get_read_only_view |  |  |
| head_set | `SortedSet.head_set(before: gpointer?) -> Gee.SortedSet` | gee_sorted_set_head_set |  |  |
| higher | `SortedSet.higher(element: gpointer?) -> gpointer` | gee_sorted_set_higher |  |  |
| iterator_at | `SortedSet.iterator_at(element: gpointer?) -> Gee.Iterator` | gee_sorted_set_iterator_at |  |  |
| last | `SortedSet.last() -> gpointer` | gee_sorted_set_last |  |  |
| lower | `SortedSet.lower(element: gpointer?) -> gpointer` | gee_sorted_set_lower |  |  |
| sub_set | `SortedSet.sub_set(from: gpointer?, to: gpointer?) -> Gee.SortedSet` | gee_sorted_set_sub_set |  |  |
| tail_set | `SortedSet.tail_set(after: gpointer?) -> Gee.SortedSet` | gee_sorted_set_tail_set |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| read-only-view | Gee.SortedSet | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ceil | `ceil(element: gpointer?) -> gpointer` |  |  |  |
| first | `first() -> gpointer` |  |  |  |
| floor | `floor(element: gpointer?) -> gpointer` |  |  |  |
| get_read_only_view | `get_read_only_view() -> Gee.SortedSet` |  |  |  |
| head_set | `head_set(before: gpointer?) -> Gee.SortedSet` |  |  |  |
| higher | `higher(element: gpointer?) -> gpointer` |  |  |  |
| iterator_at | `iterator_at(element: gpointer?) -> Gee.Iterator` |  |  |  |
| last | `last() -> gpointer` |  |  |  |
| lower | `lower(element: gpointer?) -> gpointer` |  |  |  |
| sub_set | `sub_set(from: gpointer?, to: gpointer?) -> Gee.SortedSet` |  |  |  |
| tail_set | `tail_set(after: gpointer?) -> Gee.SortedSet` |  |  |  |

### Gee.Traversable

GType: `GeeTraversable` ?? C type: `GeeTraversable`

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| all_match | `Traversable.all_match(pred: Gee.Predicate, pred_target: gpointer?, pred_target_destroy_notify: GLib.DestroyNotify) -> gboolean` | gee_traversable_all_match |  |  |
| any_match | `Traversable.any_match(pred: Gee.Predicate, pred_target: gpointer?, pred_target_destroy_notify: GLib.DestroyNotify) -> gboolean` | gee_traversable_any_match |  |  |
| chop | `Traversable.chop(offset: gint, length: gint) -> Gee.Iterator` | gee_traversable_chop |  |  |
| filter | `Traversable.filter(pred: Gee.Predicate, pred_target: gpointer?, pred_target_destroy_notify: GLib.DestroyNotify) -> Gee.Iterator` | gee_traversable_filter |  |  |
| first_match | `Traversable.first_match(pred: Gee.Predicate, pred_target: gpointer?, pred_target_destroy_notify: GLib.DestroyNotify) -> gpointer` | gee_traversable_first_match |  |  |
| flat_map | `Traversable.flat_map(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, f: Gee.FlatMapFunc, f_target: gpointer?, f_target_destroy_notify: GLib.DestroyNotify) -> Gee.Iterator` | gee_traversable_flat_map |  |  |
| fold | `Traversable.fold(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, f: Gee.FoldFunc, f_target: gpointer?, seed: gpointer?) -> gpointer` | gee_traversable_fold |  |  |
| foreach | `Traversable.foreach(f: Gee.ForallFunc, f_target: gpointer?) -> gboolean` | gee_traversable_foreach |  |  |
| get_element_type | `Traversable.get_element_type() -> GType` | gee_traversable_get_element_type |  |  |
| map | `Traversable.map(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, f: Gee.MapFunc, f_target: gpointer?) -> Gee.Iterator` | gee_traversable_map |  |  |
| max | `Traversable.max(compare: GLib.CompareDataFunc, compare_target: gpointer?, compare_target_destroy_notify: GLib.DestroyNotify) -> gpointer` | gee_traversable_max |  |  |
| min | `Traversable.min(compare: GLib.CompareDataFunc, compare_target: gpointer?, compare_target_destroy_notify: GLib.DestroyNotify) -> gpointer` | gee_traversable_min |  |  |
| order_by | `Traversable.order_by(compare: GLib.CompareDataFunc?, compare_target: gpointer?, compare_target_destroy_notify: GLib.DestroyNotify) -> Gee.Iterator` | gee_traversable_order_by |  |  |
| scan | `Traversable.scan(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, f: Gee.FoldFunc, f_target: gpointer?, seed: gpointer?) -> Gee.Iterator` | gee_traversable_scan |  |  |
| stream | `Traversable.stream(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, f: Gee.StreamFunc, f_target: gpointer?, f_target_destroy_notify: GLib.DestroyNotify) -> Gee.Iterator` | gee_traversable_stream |  |  |
| tee | `Traversable.tee(forks: guint, result_length1: out gint) -> Gee.Iterator` | gee_traversable_tee |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| all_match | `all_match(pred: Gee.Predicate, pred_target: gpointer?, pred_target_destroy_notify: GLib.DestroyNotify) -> gboolean` |  |  |  |
| any_match | `any_match(pred: Gee.Predicate, pred_target: gpointer?, pred_target_destroy_notify: GLib.DestroyNotify) -> gboolean` |  |  |  |
| chop | `chop(offset: gint, length: gint) -> Gee.Iterator` |  |  |  |
| filter | `filter(pred: Gee.Predicate, pred_target: gpointer?, pred_target_destroy_notify: GLib.DestroyNotify) -> Gee.Iterator` |  |  |  |
| first_match | `first_match(pred: Gee.Predicate, pred_target: gpointer?, pred_target_destroy_notify: GLib.DestroyNotify) -> gpointer` |  |  |  |
| flat_map | `flat_map(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, f: Gee.FlatMapFunc, f_target: gpointer?, f_target_destroy_notify: GLib.DestroyNotify) -> Gee.Iterator` |  |  |  |
| fold | `fold(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, f: Gee.FoldFunc, f_target: gpointer?, seed: gpointer?) -> gpointer` |  |  |  |
| foreach | `foreach(f: Gee.ForallFunc, f_target: gpointer?) -> gboolean` |  |  |  |
| get_element_type | `get_element_type() -> GType` |  |  |  |
| map | `map(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, f: Gee.MapFunc, f_target: gpointer?) -> Gee.Iterator` |  |  |  |
| max | `max(compare: GLib.CompareDataFunc, compare_target: gpointer?, compare_target_destroy_notify: GLib.DestroyNotify) -> gpointer` |  |  |  |
| min | `min(compare: GLib.CompareDataFunc, compare_target: gpointer?, compare_target_destroy_notify: GLib.DestroyNotify) -> gpointer` |  |  |  |
| order_by | `order_by(compare: GLib.CompareDataFunc?, compare_target: gpointer?, compare_target_destroy_notify: GLib.DestroyNotify) -> Gee.Iterator` |  |  |  |
| scan | `scan(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, f: Gee.FoldFunc, f_target: gpointer?, seed: gpointer?) -> Gee.Iterator` |  |  |  |
| stream | `stream(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, f: Gee.StreamFunc, f_target: gpointer?, f_target_destroy_notify: GLib.DestroyNotify) -> Gee.Iterator` |  |  |  |
| tee | `tee(forks: guint, result_length1: out gint) -> Gee.Iterator` |  |  |  |

## Enums

### Gee.ConcurrentSetRangeType

GType: `GeeConcurrentSetRangeType` ?? C type: `GeeConcurrentSetRangeType`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bounded | 2 |  |  |
| empty | 3 |  |  |
| head | 0 |  |  |
| tail | 1 |  |  |

### Gee.FutureError

GType: `GeeFutureError` ?? C type: `GeeFutureError`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| abandon_promise | 0 |  |  |
| exception | 1 |  |  |

### Gee.HazardPointerPolicy

GType: `GeeHazardPointerPolicy` ?? C type: `GeeHazardPointerPolicy`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| default | 0 |  |  |
| free | 3 |  |  |
| release | 5 |  |  |
| thread_exit | 1 |  |  |
| try_free | 2 |  |  |
| try_release | 4 |  |  |

### Gee.HazardPointerReleasePolicy

GType: `GeeHazardPointerReleasePolicy` ?? C type: `GeeHazardPointerReleasePolicy`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| helper_thread | 0 |  |  |
| main_loop | 1 |  |  |

### Gee.TraversableStream

GType: `GeeTraversableStream` ?? C type: `GeeTraversableStream`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| continue | 1 |  |  |
| end | 2 |  |  |
| wait | 3 |  |  |
| yield | 0 |  |  |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| AbstractBidirListClass |  | 0 | 0 | 0 |  |
| AbstractBidirListPrivate |  | 0 | 0 | 0 |  |
| AbstractBidirSortedMapClass |  | 0 | 0 | 0 |  |
| AbstractBidirSortedMapPrivate |  | 0 | 0 | 0 |  |
| AbstractBidirSortedSetClass |  | 0 | 0 | 0 |  |
| AbstractBidirSortedSetPrivate |  | 0 | 0 | 0 |  |
| AbstractCollectionClass |  | 0 | 0 | 0 |  |
| AbstractCollectionPrivate |  | 0 | 0 | 0 |  |
| AbstractListClass |  | 0 | 0 | 0 |  |
| AbstractListPrivate |  | 0 | 0 | 0 |  |
| AbstractMapClass |  | 0 | 0 | 0 |  |
| AbstractMapPrivate |  | 0 | 0 | 0 |  |
| AbstractMultiMapClass |  | 0 | 0 | 0 |  |
| AbstractMultiMapPrivate |  | 0 | 0 | 0 |  |
| AbstractMultiSetClass |  | 0 | 0 | 0 |  |
| AbstractMultiSetPrivate |  | 0 | 0 | 0 |  |
| AbstractQueueClass |  | 0 | 0 | 0 |  |
| AbstractQueuePrivate |  | 0 | 0 | 0 |  |
| AbstractSetClass |  | 0 | 0 | 0 |  |
| AbstractSetPrivate |  | 0 | 0 | 0 |  |
| AbstractSortedMapClass |  | 0 | 0 | 0 |  |
| AbstractSortedMapPrivate |  | 0 | 0 | 0 |  |
| AbstractSortedSetClass |  | 0 | 0 | 0 |  |
| AbstractSortedSetPrivate |  | 0 | 0 | 0 |  |
| ArrayListClass |  | 0 | 0 | 0 |  |
| ArrayListPrivate |  | 0 | 0 | 0 |  |
| ArrayQueueClass |  | 0 | 0 | 0 |  |
| ArrayQueuePrivate |  | 0 | 0 | 0 |  |
| BidirIteratorIface |  | 0 | 0 | 0 |  |
| BidirListIface |  | 0 | 0 | 0 |  |
| BidirListIteratorIface |  | 0 | 0 | 0 |  |
| BidirMapIteratorIface |  | 0 | 0 | 0 |  |
| BidirSortedMapIface |  | 0 | 0 | 0 |  |
| BidirSortedSetIface |  | 0 | 0 | 0 |  |
| CollectionIface |  | 0 | 0 | 0 |  |
| ComparableIface |  | 0 | 0 | 0 |  |
| ConcurrentListClass |  | 0 | 0 | 0 |  |
| ConcurrentListPrivate |  | 0 | 0 | 0 |  |
| ConcurrentSetClass |  | 0 | 0 | 0 |  |
| ConcurrentSetPrivate |  | 0 | 0 | 0 |  |
| DequeIface |  | 0 | 0 | 0 |  |
| FutureIface |  | 0 | 0 | 0 |  |
| HashableIface |  | 0 | 0 | 0 |  |
| HashMapClass |  | 0 | 0 | 0 |  |
| HashMapPrivate |  | 0 | 0 | 0 |  |
| HashMultiMapClass |  | 0 | 0 | 0 |  |
| HashMultiMapPrivate |  | 0 | 0 | 0 |  |
| HashMultiSetClass |  | 0 | 0 | 0 |  |
| HashMultiSetPrivate |  | 0 | 0 | 0 |  |
| HashSetClass |  | 0 | 0 | 0 |  |
| HashSetPrivate |  | 0 | 0 | 0 |  |
| HazardPointer |  | 0 | 0 | 12 |  |
| HazardPointerContext |  | 0 | 0 | 5 |  |
| IterableIface |  | 0 | 0 | 0 |  |
| IteratorIface |  | 0 | 0 | 0 |  |
| LazyClass |  | 0 | 0 | 0 |  |
| LazyPrivate |  | 0 | 0 | 0 |  |
| LinkedListClass |  | 0 | 0 | 0 |  |
| LinkedListPrivate |  | 0 | 0 | 0 |  |
| ListIface |  | 0 | 0 | 0 |  |
| ListIteratorIface |  | 0 | 0 | 0 |  |
| MapEntryClass |  | 0 | 0 | 0 |  |
| MapEntryPrivate |  | 0 | 0 | 0 |  |
| MapIface |  | 0 | 0 | 0 |  |
| MapIteratorIface |  | 0 | 0 | 0 |  |
| MultiMapIface |  | 0 | 0 | 0 |  |
| MultiSetIface |  | 0 | 0 | 0 |  |
| PriorityQueueClass |  | 0 | 0 | 0 |  |
| PriorityQueuePrivate |  | 0 | 0 | 0 |  |
| PromiseClass |  | 0 | 0 | 0 |  |
| PromisePrivate |  | 0 | 0 | 0 |  |
| QueueIface |  | 0 | 0 | 0 |  |
| SetIface |  | 0 | 0 | 0 |  |
| SortedMapIface |  | 0 | 0 | 0 |  |
| SortedSetIface |  | 0 | 0 | 0 |  |
| TraversableIface |  | 0 | 0 | 0 |  |
| TreeMapClass |  | 0 | 0 | 0 |  |
| TreeMapPrivate |  | 0 | 0 | 0 |  |
| TreeMultiMapClass |  | 0 | 0 | 0 |  |
| TreeMultiMapPrivate |  | 0 | 0 | 0 |  |
| TreeMultiSetClass |  | 0 | 0 | 0 |  |
| TreeMultiSetPrivate |  | 0 | 0 | 0 |  |
| TreeSetClass |  | 0 | 0 | 0 |  |
| TreeSetPrivate |  | 0 | 0 | 0 |  |
| UnrolledLinkedListClass |  | 0 | 0 | 0 |  |
| UnrolledLinkedListPrivate |  | 0 | 0 | 0 |  |

### Gee.AbstractBidirListClass

C type: `GeeAbstractBidirListClass`

#### Fields

| Field | Type |
| --- | --- |
| bidir_list_iterator | Gee.BidirListIterator |
| parent_class | Gee.AbstractListClass |
| reserved0 | none |
| reserved1 | none |
| reserved2 | none |
| reserved3 | none |
| reserved4 | none |
| reserved5 | none |
| reserved6 | none |
| reserved7 | none |
| reserved8 | none |
| reserved9 | none |

### Gee.AbstractBidirListPrivate

C type: `GeeAbstractBidirListPrivate`

### Gee.AbstractBidirSortedMapClass

C type: `GeeAbstractBidirSortedMapClass`

#### Fields

| Field | Type |
| --- | --- |
| bidir_map_iterator | Gee.BidirMapIterator |
| parent_class | Gee.AbstractSortedMapClass |
| reserved0 | none |
| reserved1 | none |
| reserved2 | none |
| reserved3 | none |
| reserved4 | none |
| reserved5 | none |
| reserved6 | none |
| reserved7 | none |
| reserved8 | none |
| reserved9 | none |

### Gee.AbstractBidirSortedMapPrivate

C type: `GeeAbstractBidirSortedMapPrivate`

### Gee.AbstractBidirSortedSetClass

C type: `GeeAbstractBidirSortedSetClass`

#### Fields

| Field | Type |
| --- | --- |
| bidir_iterator | Gee.BidirIterator |
| parent_class | Gee.AbstractSortedSetClass |
| reserved0 | none |
| reserved1 | none |
| reserved2 | none |
| reserved3 | none |
| reserved4 | none |
| reserved5 | none |
| reserved6 | none |
| reserved7 | none |
| reserved8 | none |
| reserved9 | none |

### Gee.AbstractBidirSortedSetPrivate

C type: `GeeAbstractBidirSortedSetPrivate`

### Gee.AbstractCollectionClass

C type: `GeeAbstractCollectionClass`

#### Fields

| Field | Type |
| --- | --- |
| add | gboolean |
| clear | none |
| contains | gboolean |
| foreach | gboolean |
| iterator | Gee.Iterator |
| parent_class | GObject.ObjectClass |
| remove | gboolean |
| reserved0 | none |
| reserved1 | none |
| reserved2 | none |
| reserved3 | none |
| reserved4 | none |
| reserved5 | none |
| reserved6 | none |
| reserved7 | none |
| reserved8 | none |
| reserved9 | none |

### Gee.AbstractCollectionPrivate

C type: `GeeAbstractCollectionPrivate`

### Gee.AbstractListClass

C type: `GeeAbstractListClass`

#### Fields

| Field | Type |
| --- | --- |
| get | gpointer |
| index_of | gint |
| insert | none |
| list_iterator | Gee.ListIterator |
| parent_class | Gee.AbstractCollectionClass |
| remove_at | gpointer |
| reserved0 | none |
| reserved1 | none |
| reserved2 | none |
| reserved3 | none |
| reserved4 | none |
| reserved5 | none |
| reserved6 | none |
| reserved7 | none |
| reserved8 | none |
| reserved9 | none |
| set | none |
| slice | Gee.List |

### Gee.AbstractListPrivate

C type: `GeeAbstractListPrivate`

### Gee.AbstractMapClass

C type: `GeeAbstractMapClass`

#### Fields

| Field | Type |
| --- | --- |
| clear | none |
| foreach | gboolean |
| get | gpointer |
| has | gboolean |
| has_key | gboolean |
| map_iterator | Gee.MapIterator |
| parent_class | GObject.ObjectClass |
| reserved0 | none |
| reserved1 | none |
| reserved2 | none |
| reserved3 | none |
| reserved4 | none |
| reserved5 | none |
| reserved6 | none |
| reserved7 | none |
| reserved8 | none |
| reserved9 | none |
| set | none |
| stream | Gee.Iterator |
| unset | gboolean |

### Gee.AbstractMapPrivate

C type: `GeeAbstractMapPrivate`

### Gee.AbstractMultiMapClass

C type: `GeeAbstractMultiMapClass`

#### Fields

| Field | Type |
| --- | --- |
| create_multi_key_set | Gee.MultiSet |
| create_value_storage | Gee.Collection |
| get_value_equal_func | Gee.EqualDataFunc |
| parent_class | GObject.ObjectClass |
| reserved0 | none |
| reserved1 | none |
| reserved2 | none |
| reserved3 | none |
| reserved4 | none |
| reserved5 | none |
| reserved6 | none |
| reserved7 | none |
| reserved8 | none |

### Gee.AbstractMultiMapPrivate

C type: `GeeAbstractMultiMapPrivate`

### Gee.AbstractMultiSetClass

C type: `GeeAbstractMultiSetClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gee.AbstractCollectionClass |
| reserved0 | none |
| reserved1 | none |
| reserved2 | none |
| reserved3 | none |
| reserved4 | none |
| reserved5 | none |
| reserved6 | none |
| reserved7 | none |
| reserved8 | none |

### Gee.AbstractMultiSetPrivate

C type: `GeeAbstractMultiSetPrivate`

### Gee.AbstractQueueClass

C type: `GeeAbstractQueueClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gee.AbstractCollectionClass |
| peek | gpointer |
| poll | gpointer |
| reserved0 | none |
| reserved1 | none |
| reserved2 | none |
| reserved3 | none |
| reserved4 | none |
| reserved5 | none |
| reserved6 | none |
| reserved7 | none |
| reserved8 | none |
| reserved9 | none |

### Gee.AbstractQueuePrivate

C type: `GeeAbstractQueuePrivate`

### Gee.AbstractSetClass

C type: `GeeAbstractSetClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gee.AbstractCollectionClass |
| reserved0 | none |
| reserved1 | none |
| reserved2 | none |
| reserved3 | none |
| reserved4 | none |
| reserved5 | none |
| reserved6 | none |
| reserved7 | none |
| reserved8 | none |
| reserved9 | none |

### Gee.AbstractSetPrivate

C type: `GeeAbstractSetPrivate`

### Gee.AbstractSortedMapClass

C type: `GeeAbstractSortedMapClass`

#### Fields

| Field | Type |
| --- | --- |
| head_map | Gee.SortedMap |
| parent_class | Gee.AbstractMapClass |
| reserved0 | none |
| reserved1 | none |
| reserved2 | none |
| reserved3 | none |
| reserved4 | none |
| reserved5 | none |
| reserved6 | none |
| reserved7 | none |
| reserved8 | none |
| reserved9 | none |
| sub_map | Gee.SortedMap |
| tail_map | Gee.SortedMap |

### Gee.AbstractSortedMapPrivate

C type: `GeeAbstractSortedMapPrivate`

### Gee.AbstractSortedSetClass

C type: `GeeAbstractSortedSetClass`

#### Fields

| Field | Type |
| --- | --- |
| ceil | gpointer |
| first | gpointer |
| floor | gpointer |
| head_set | Gee.SortedSet |
| higher | gpointer |
| iterator_at | Gee.Iterator |
| last | gpointer |
| lower | gpointer |
| parent_class | Gee.AbstractSetClass |
| reserved0 | none |
| reserved1 | none |
| reserved2 | none |
| reserved3 | none |
| reserved4 | none |
| reserved5 | none |
| reserved6 | none |
| reserved7 | none |
| reserved8 | none |
| reserved9 | none |
| sub_set | Gee.SortedSet |
| tail_set | Gee.SortedSet |

### Gee.AbstractSortedSetPrivate

C type: `GeeAbstractSortedSetPrivate`

### Gee.ArrayListClass

C type: `GeeArrayListClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gee.AbstractBidirListClass |

### Gee.ArrayListPrivate

C type: `GeeArrayListPrivate`

### Gee.ArrayQueueClass

C type: `GeeArrayQueueClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gee.AbstractQueueClass |

### Gee.ArrayQueuePrivate

C type: `GeeArrayQueuePrivate`

### Gee.BidirIteratorIface

C type: `GeeBidirIteratorIface`

#### Fields

| Field | Type |
| --- | --- |
| first | gboolean |
| has_previous | gboolean |
| last | gboolean |
| parent_iface | GObject.TypeInterface |
| previous | gboolean |

### Gee.BidirListIface

C type: `GeeBidirListIface`

#### Fields

| Field | Type |
| --- | --- |
| bidir_list_iterator | Gee.BidirListIterator |
| get_read_only_view | Gee.BidirList |
| parent_iface | GObject.TypeInterface |

### Gee.BidirListIteratorIface

C type: `GeeBidirListIteratorIface`

#### Fields

| Field | Type |
| --- | --- |
| insert | none |
| parent_iface | GObject.TypeInterface |

### Gee.BidirMapIteratorIface

C type: `GeeBidirMapIteratorIface`

#### Fields

| Field | Type |
| --- | --- |
| first | gboolean |
| has_previous | gboolean |
| last | gboolean |
| parent_iface | GObject.TypeInterface |
| previous | gboolean |

### Gee.BidirSortedMapIface

C type: `GeeBidirSortedMapIface`

#### Fields

| Field | Type |
| --- | --- |
| bidir_map_iterator | Gee.BidirMapIterator |
| get_read_only_view | Gee.BidirSortedMap |
| parent_iface | GObject.TypeInterface |

### Gee.BidirSortedSetIface

C type: `GeeBidirSortedSetIface`

#### Fields

| Field | Type |
| --- | --- |
| bidir_iterator | Gee.BidirIterator |
| get_read_only_view | Gee.BidirSortedSet |
| parent_iface | GObject.TypeInterface |

### Gee.CollectionIface

C type: `GeeCollectionIface`

#### Fields

| Field | Type |
| --- | --- |
| add | gboolean |
| add_all | gboolean |
| add_all_array | gboolean |
| add_all_iterator | gboolean |
| clear | none |
| contains | gboolean |
| contains_all | gboolean |
| contains_all_array | gboolean |
| contains_all_iterator | gboolean |
| get_is_empty | gboolean |
| get_read_only | gboolean |
| get_read_only_view | Gee.Collection |
| get_size | gint |
| parent_iface | GObject.TypeInterface |
| remove | gboolean |
| remove_all | gboolean |
| remove_all_array | gboolean |
| remove_all_iterator | gboolean |
| retain_all | gboolean |
| to_array | gpointer |

### Gee.ComparableIface

C type: `GeeComparableIface`

#### Fields

| Field | Type |
| --- | --- |
| compare_to | gint |
| parent_iface | GObject.TypeInterface |

### Gee.ConcurrentListClass

C type: `GeeConcurrentListClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gee.AbstractListClass |

### Gee.ConcurrentListPrivate

C type: `GeeConcurrentListPrivate`

### Gee.ConcurrentSetClass

C type: `GeeConcurrentSetClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gee.AbstractSortedSetClass |

### Gee.ConcurrentSetPrivate

C type: `GeeConcurrentSetPrivate`

### Gee.DequeIface

C type: `GeeDequeIface`

#### Fields

| Field | Type |
| --- | --- |
| drain_head | gint |
| drain_tail | gint |
| offer_head | gboolean |
| offer_tail | gboolean |
| parent_iface | GObject.TypeInterface |
| peek_head | gpointer |
| peek_tail | gpointer |
| poll_head | gpointer |
| poll_tail | gpointer |

### Gee.FutureIface

C type: `GeeFutureIface`

#### Fields

| Field | Type |
| --- | --- |
| flat_map | Gee.Future |
| get_exception | GLib.Error |
| get_ready | gboolean |
| get_value | gpointer |
| light_map | Gee.Future |
| light_map_broken | Gee.Future |
| map | Gee.Future |
| parent_iface | GObject.TypeInterface |
| wait | gpointer |
| wait_async | none |
| wait_finish | gpointer |
| wait_until | gboolean |
| zip | Gee.Future |

### Gee.HashableIface

C type: `GeeHashableIface`

#### Fields

| Field | Type |
| --- | --- |
| equal_to | gboolean |
| hash | guint |
| parent_iface | GObject.TypeInterface |

### Gee.HashMapClass

C type: `GeeHashMapClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gee.AbstractMapClass |

### Gee.HashMapPrivate

C type: `GeeHashMapPrivate`

### Gee.HashMultiMapClass

C type: `GeeHashMultiMapClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gee.AbstractMultiMapClass |

### Gee.HashMultiMapPrivate

C type: `GeeHashMultiMapPrivate`

### Gee.HashMultiSetClass

C type: `GeeHashMultiSetClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gee.AbstractMultiSetClass |

### Gee.HashMultiSetPrivate

C type: `GeeHashMultiSetPrivate`

### Gee.HashSetClass

C type: `GeeHashSetClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gee.AbstractSetClass |

### Gee.HashSetPrivate

C type: `GeeHashSetPrivate`

### Gee.HazardPointer

C type: `GeeHazardPointer`

#### Fields

| Field | Type |
| --- | --- |
| _node | Gee.HazardPointerNode |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `HazardPointer.new(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, ptr: gpointer?) -> Gee.HazardPointer` | gee_hazard_pointer_new |  |  |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| compare_and_exchange_pointer | `compare_and_exchange_pointer(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, aptr: gpointer?, old_ptr: gpointer?, _new_ptr: gpointer?, mask: gulong, old_mask: gulong, new_mask: gulong) -> gboolean` | gee_hazard_pointer_compare_and_exchange_pointer |  |  |
| exchange_hazard_pointer | `exchange_hazard_pointer(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, aptr: gpointer?, new_ptr: gpointer?, mask: gulong, new_mask: gulong, old_mask: out gulong) -> Gee.HazardPointer` | gee_hazard_pointer_exchange_hazard_pointer |  |  |
| exchange_pointer | `exchange_pointer(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, aptr: gpointer?, new_ptr: gpointer?, mask: gulong, new_mask: gulong, old_mask: out gulong) -> gpointer` | gee_hazard_pointer_exchange_pointer |  |  |
| get_hazard_pointer | `get_hazard_pointer(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, aptr: gpointer?, mask: gulong, mask_out: out gulong) -> Gee.HazardPointer` | gee_hazard_pointer_get_hazard_pointer |  |  |
| get_pointer | `get_pointer(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, aptr: gpointer?, mask: gulong, mask_out: out gulong) -> gpointer` | gee_hazard_pointer_get_pointer |  |  |
| set_default_policy | `set_default_policy(policy: Gee.HazardPointerPolicy) -> none` | gee_hazard_pointer_set_default_policy |  |  |
| set_pointer | `set_pointer(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, aptr: gpointer?, new_ptr: gpointer?, mask: gulong, new_mask: gulong) -> none` | gee_hazard_pointer_set_pointer |  |  |
| set_release_policy | `set_release_policy(policy: Gee.HazardPointerReleasePolicy) -> gboolean` | gee_hazard_pointer_set_release_policy |  |  |
| set_thread_exit_policy | `set_thread_exit_policy(policy: Gee.HazardPointerPolicy) -> none` | gee_hazard_pointer_set_thread_exit_policy |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `HazardPointer.get(other_thread: gboolean) -> gpointer` | gee_hazard_pointer_get |  |  |
| release | `HazardPointer.release(notify: GLib.DestroyNotify) -> none` | gee_hazard_pointer_release |  |  |

### Gee.HazardPointerContext

C type: `GeeHazardPointerContext`

#### Fields

| Field | Type |
| --- | --- |
| _parent | gpointer |
| _policy | Gee.HazardPointerPolicy |
| _to_free | Gee.ArrayList |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `HazardPointerContext.new(policy: Gee.HazardPointerPolicy?) -> Gee.HazardPointerContext` | gee_hazard_pointer_context_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free_all | `HazardPointerContext.free_all() -> none` | gee_hazard_pointer_context_free_all |  |  |
| release | `HazardPointerContext.release() -> none` | gee_hazard_pointer_context_release |  |  |
| try_free | `HazardPointerContext.try_free() -> none` | gee_hazard_pointer_context_try_free |  |  |
| try_release | `HazardPointerContext.try_release() -> none` | gee_hazard_pointer_context_try_release |  |  |

### Gee.IterableIface

C type: `GeeIterableIface`

#### Fields

| Field | Type |
| --- | --- |
| iterator | Gee.Iterator |
| parent_iface | GObject.TypeInterface |

### Gee.IteratorIface

C type: `GeeIteratorIface`

#### Fields

| Field | Type |
| --- | --- |
| get | gpointer |
| get_read_only | gboolean |
| get_valid | gboolean |
| has_next | gboolean |
| next | gboolean |
| parent_iface | GObject.TypeInterface |
| remove | none |

### Gee.LazyClass

C type: `GeeLazyClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.TypeClass |

### Gee.LazyPrivate

C type: `GeeLazyPrivate`

### Gee.LinkedListClass

C type: `GeeLinkedListClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gee.AbstractBidirListClass |

### Gee.LinkedListPrivate

C type: `GeeLinkedListPrivate`

### Gee.ListIface

C type: `GeeListIface`

#### Fields

| Field | Type |
| --- | --- |
| first | gpointer |
| get | gpointer |
| get_read_only_view | Gee.List |
| index_of | gint |
| insert | none |
| insert_all | none |
| last | gpointer |
| list_iterator | Gee.ListIterator |
| parent_iface | GObject.TypeInterface |
| remove_at | gpointer |
| set | none |
| slice | Gee.List |
| sort | none |

### Gee.ListIteratorIface

C type: `GeeListIteratorIface`

#### Fields

| Field | Type |
| --- | --- |
| add | none |
| index | gint |
| parent_iface | GObject.TypeInterface |
| set | none |

### Gee.MapEntryClass

C type: `GeeMapEntryClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Gee.MapEntryPrivate

C type: `GeeMapEntryPrivate`

### Gee.MapIface

C type: `GeeMapIface`

#### Fields

| Field | Type |
| --- | --- |
| clear | none |
| get | gpointer |
| get_entries | Gee.Set |
| get_is_empty | gboolean |
| get_keys | Gee.Set |
| get_read_only | gboolean |
| get_read_only_view | Gee.Map |
| get_size | gint |
| get_values | Gee.Collection |
| has | gboolean |
| has_all | gboolean |
| has_key | gboolean |
| map_iterator | Gee.MapIterator |
| parent_iface | GObject.TypeInterface |
| set | none |
| set_all | none |
| unset | gboolean |
| unset_all | gboolean |

### Gee.MapIteratorIface

C type: `GeeMapIteratorIface`

#### Fields

| Field | Type |
| --- | --- |
| fold | gpointer |
| foreach | gboolean |
| get_key | gpointer |
| get_mutable | gboolean |
| get_read_only | gboolean |
| get_valid | gboolean |
| get_value | gpointer |
| has_next | gboolean |
| next | gboolean |
| parent_iface | GObject.TypeInterface |
| set_value | none |
| unset | none |

### Gee.MultiMapIface

C type: `GeeMultiMapIface`

#### Fields

| Field | Type |
| --- | --- |
| clear | none |
| contains | gboolean |
| get | Gee.Collection |
| get_all_keys | Gee.MultiSet |
| get_keys | Gee.Set |
| get_read_only | gboolean |
| get_read_only_view | Gee.MultiMap |
| get_size | gint |
| get_values | Gee.Collection |
| map_iterator | Gee.MapIterator |
| parent_iface | GObject.TypeInterface |
| remove | gboolean |
| remove_all | gboolean |
| set | none |

### Gee.MultiSetIface

C type: `GeeMultiSetIface`

#### Fields

| Field | Type |
| --- | --- |
| count | gint |
| get_read_only_view | Gee.MultiSet |
| parent_iface | GObject.TypeInterface |

### Gee.PriorityQueueClass

C type: `GeePriorityQueueClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gee.AbstractQueueClass |

### Gee.PriorityQueuePrivate

C type: `GeePriorityQueuePrivate`

### Gee.PromiseClass

C type: `GeePromiseClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.TypeClass |

### Gee.PromisePrivate

C type: `GeePromisePrivate`

### Gee.QueueIface

C type: `GeeQueueIface`

#### Fields

| Field | Type |
| --- | --- |
| drain | gint |
| get_capacity | gint |
| get_is_full | gboolean |
| get_remaining_capacity | gint |
| offer | gboolean |
| parent_iface | GObject.TypeInterface |
| peek | gpointer |
| poll | gpointer |

### Gee.SetIface

C type: `GeeSetIface`

#### Fields

| Field | Type |
| --- | --- |
| get_read_only_view | Gee.Set |
| parent_iface | GObject.TypeInterface |

### Gee.SortedMapIface

C type: `GeeSortedMapIface`

#### Fields

| Field | Type |
| --- | --- |
| get_ascending_entries | Gee.SortedSet |
| get_ascending_keys | Gee.SortedSet |
| get_read_only_view | Gee.SortedMap |
| head_map | Gee.SortedMap |
| parent_iface | GObject.TypeInterface |
| sub_map | Gee.SortedMap |
| tail_map | Gee.SortedMap |

### Gee.SortedSetIface

C type: `GeeSortedSetIface`

#### Fields

| Field | Type |
| --- | --- |
| ceil | gpointer |
| first | gpointer |
| floor | gpointer |
| get_read_only_view | Gee.SortedSet |
| head_set | Gee.SortedSet |
| higher | gpointer |
| iterator_at | Gee.Iterator |
| last | gpointer |
| lower | gpointer |
| parent_iface | GObject.TypeInterface |
| sub_set | Gee.SortedSet |
| tail_set | Gee.SortedSet |

### Gee.TraversableIface

C type: `GeeTraversableIface`

#### Fields

| Field | Type |
| --- | --- |
| all_match | gboolean |
| any_match | gboolean |
| chop | Gee.Iterator |
| filter | Gee.Iterator |
| first_match | gpointer |
| flat_map | Gee.Iterator |
| fold | gpointer |
| foreach | gboolean |
| get_element_type | GType |
| map | Gee.Iterator |
| max | gpointer |
| min | gpointer |
| order_by | Gee.Iterator |
| parent_iface | GObject.TypeInterface |
| scan | Gee.Iterator |
| stream | Gee.Iterator |
| tee | Gee.Iterator |

### Gee.TreeMapClass

C type: `GeeTreeMapClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gee.AbstractBidirSortedMapClass |

### Gee.TreeMapPrivate

C type: `GeeTreeMapPrivate`

### Gee.TreeMultiMapClass

C type: `GeeTreeMultiMapClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gee.AbstractMultiMapClass |

### Gee.TreeMultiMapPrivate

C type: `GeeTreeMultiMapPrivate`

### Gee.TreeMultiSetClass

C type: `GeeTreeMultiSetClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gee.AbstractMultiSetClass |

### Gee.TreeMultiSetPrivate

C type: `GeeTreeMultiSetPrivate`

### Gee.TreeSetClass

C type: `GeeTreeSetClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gee.AbstractBidirSortedSetClass |

### Gee.TreeSetPrivate

C type: `GeeTreeSetPrivate`

### Gee.UnrolledLinkedListClass

C type: `GeeUnrolledLinkedListClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gee.AbstractBidirListClass |

### Gee.UnrolledLinkedListPrivate

C type: `GeeUnrolledLinkedListPrivate`

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| async_task | `async_task(_callback_: Gio.AsyncReadyCallback?, _callback__target: gpointer?) -> none` | gee_async_task |  |  |
| async_task_finish | `async_task_finish(_res_: Gio.AsyncResult) -> none throws` | gee_async_task_finish |  |  |
| functions_get_compare_func_for | `functions_get_compare_func_for(t: GType, result_target: out gpointer?, result_target_destroy_notify: out GLib.DestroyNotify) -> GLib.CompareDataFunc` | gee_functions_get_compare_func_for |  |  |
| functions_get_equal_func_for | `functions_get_equal_func_for(t: GType, result_target: out gpointer?, result_target_destroy_notify: out GLib.DestroyNotify) -> Gee.EqualDataFunc` | gee_functions_get_equal_func_for |  |  |
| functions_get_hash_func_for | `functions_get_hash_func_for(t: GType, result_target: out gpointer?, result_target_destroy_notify: out GLib.DestroyNotify) -> Gee.HashDataFunc` | gee_functions_get_hash_func_for |  |  |
| hazard_pointer_policy_is_blocking | `hazard_pointer_policy_is_blocking() -> gboolean` | gee_hazard_pointer_policy_is_blocking |  |  |
| hazard_pointer_policy_is_concrete | `hazard_pointer_policy_is_concrete() -> gboolean` | gee_hazard_pointer_policy_is_concrete |  |  |
| hazard_pointer_policy_is_safe | `hazard_pointer_policy_is_safe() -> gboolean` | gee_hazard_pointer_policy_is_safe |  |  |
| hazard_pointer_policy_to_concrete | `hazard_pointer_policy_to_concrete() -> Gee.HazardPointerPolicy` | gee_hazard_pointer_policy_to_concrete |  |  |
| task | `task(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, task: Gee.Task, task_target: gpointer?) -> Gee.Future throws` | gee_task |  |  |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| EqualDataFunc | `EqualDataFunc(t_type: GType, t_dup_func: GObject.BoxedCopyFunc, t_destroy_func: GLib.DestroyNotify, a: gpointer?, b: gpointer?, user_data: gpointer) -> gboolean` |  |  |  |
| FlatMapFunc | `FlatMapFunc(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, g: gpointer?, user_data: gpointer) -> Gee.Iterator` |  |  |  |
| FoldFunc | `FoldFunc(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, g: gpointer?, a: gpointer?, user_data: gpointer) -> gpointer` |  |  |  |
| FoldMapFunc | `FoldMapFunc(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, k_type: GType, k_dup_func: GObject.BoxedCopyFunc, k_destroy_func: GLib.DestroyNotify, v_type: GType, v_dup_func: GObject.BoxedCopyFunc, v_destroy_func: GLib.DestroyNotify, k: gpointer?, v: gpointer?, a: gpointer?, user_data: gpointer) -> gpointer` |  |  |  |
| ForallFunc | `ForallFunc(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, g: gpointer?, user_data: gpointer) -> gboolean` |  |  |  |
| ForallMapFunc | `ForallMapFunc(k_type: GType, k_dup_func: GObject.BoxedCopyFunc, k_destroy_func: GLib.DestroyNotify, v_type: GType, v_dup_func: GObject.BoxedCopyFunc, v_destroy_func: GLib.DestroyNotify, k: gpointer?, v: gpointer?, user_data: gpointer) -> gboolean` |  |  |  |
| HashDataFunc | `HashDataFunc(t_type: GType, t_dup_func: GObject.BoxedCopyFunc, t_destroy_func: GLib.DestroyNotify, v: gpointer?, user_data: gpointer) -> guint` |  |  |  |
| LazyFunc | `LazyFunc(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, user_data: gpointer) -> gpointer` |  |  |  |
| MapFunc | `MapFunc(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, g: gpointer?, user_data: gpointer) -> gpointer` |  |  |  |
| Predicate | `Predicate(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, g: gpointer?, user_data: gpointer) -> gboolean` |  |  |  |
| StreamFunc | `StreamFunc(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, state: Gee.TraversableStream, g: Gee.Lazy?, lazy: out Gee.Lazy?, user_data: gpointer) -> Gee.TraversableStream` |  |  |  |
| Task | `Task(g_type: GType, g_dup_func: GObject.BoxedCopyFunc, g_destroy_func: GLib.DestroyNotify, user_data: gpointer) -> gpointer` |  |  |  |
| UnfoldFunc | `UnfoldFunc(a_type: GType, a_dup_func: GObject.BoxedCopyFunc, a_destroy_func: GLib.DestroyNotify, user_data: gpointer) -> Gee.Lazy` |  |  |  |

