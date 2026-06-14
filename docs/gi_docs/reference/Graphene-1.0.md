# Graphene 1.0

SQGI import: `import("Graphene", "1.0")`

Packages: `graphene-gobject-1.0`
Includes: `GObject-2.0`
Libraries: `libgraphene-1.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 0 |
| Interfaces | 0 |
| Records | 19 |
| Unions | 0 |
| Enums | 2 |
| Flags | 0 |
| Functions | 26 |
| Callbacks | 0 |
| Constants | 5 |
| Aliases | 0 |

## Enums

### Graphene.EulerOrder

C type: `graphene_euler_order_t`

Specify the order of the rotations on each axis. The %GRAPHENE_EULER_ORDER_DEFAULT value is special, and is used as an alias for one of the other o...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| default | -1 |  | Rotate in the default order; the default order is one of the following enumeration values |
| rxyx | 19 |  | Defines a relative rotation along the X, Y, and X axes (Since: 1.10) |
| rxyz | 28 |  | Defines a relative rotation along the X, Y, and Z axes (Since: 1.10) |
| rxzx | 21 |  | Defines a relative rotation along the X, Z, and X axes (Since: 1.10) |
| rxzy | 22 |  | Defines a relative rotation along the X, Z, and Y axes (Since: 1.10) |
| ryxy | 25 |  | Defines a relative rotation along the Y, X, and Y axes (Since: 1.10) |
| ryxz | 26 |  | Defines a relative rotation along the Y, X, and Z axes (Since: 1.10) |
| ryzx | 20 |  | Defines a relative rotation along the Y, Z, and X axes (Since: 1.10) |
| ryzy | 23 |  | Defines a relative rotation along the Y, Z, and Y axes (Since: 1.10) |
| rzxy | 24 |  | Defines a relative rotation along the Z, X, and Y axes (Since: 1.10) |
| rzxz | 27 |  | Defines a relative rotation along the Z, X, and Z axes (Since: 1.10) |
| rzyx | 18 |  | Defines a relative rotation along the Z, Y, and X axes (Since: 1.10) |
| rzyz | 29 |  | Defines a relative rotation along the Z, Y, and Z axes (Since: 1.10) |
| sxyx | 7 |  | Defines a static rotation along the X, Y, and X axes (Since: 1.10) |
| sxyz | 6 |  | Defines a static rotation along the X, Y, and Z axes (Since: 1.10) |
| sxzx | 9 |  | Defines a static rotation along the X, Z, and X axes (Since: 1.10) |
| sxzy | 8 |  | Defines a static rotation along the X, Z, and Y axes (Since: 1.10) |
| syxy | 13 |  | Defines a static rotation along the Y, X, and Y axes (Since: 1.10) |
| syxz | 12 |  | Defines a static rotation along the Y, X, and Z axes (Since: 1.10) |
| syzx | 10 |  | Defines a static rotation along the Y, Z, and X axes (Since: 1.10) |
| syzy | 11 |  | Defines a static rotation along the Y, Z, and Y axes (Since: 1.10) |
| szxy | 14 |  | Defines a static rotation along the Z, X, and Y axes (Since: 1.10) |
| szxz | 15 |  | Defines a static rotation along the Z, X, and Z axes (Since: 1.10) |
| szyx | 16 |  | Defines a static rotation along the Z, Y, and X axes (Since: 1.10) |
| szyz | 17 |  | Defines a static rotation along the Z, Y, and Z axes (Since: 1.10) |
| xyz | 0 |  | Rotate in the X, Y, and Z order. Deprecated in Graphene 1.10, it's an alias for %GRAPHENE_EULER_ORDER_SXYZ |
| xzy | 3 |  | Rotate in the X, Z, and Y order. Deprecated in Graphene 1.10, it's an alias for %GRAPHENE_EULER_ORDER_SXZY |
| yxz | 4 |  | Rotate in the Y, X, and Z order. Deprecated in Graphene 1.10, it's an alias for %GRAPHENE_EULER_ORDER_SYXZ |
| yzx | 1 |  | Rotate in the Y, Z, and X order. Deprecated in Graphene 1.10, it's an alias for %GRAPHENE_EULER_ORDER_SYZX |
| zxy | 2 |  | Rotate in the Z, X, and Y order. Deprecated in Graphene 1.10, it's an alias for %GRAPHENE_EULER_ORDER_SZXY |
| zyx | 5 |  | Rotate in the Z, Y, and X order. Deprecated in Graphene 1.10, it's an alias for %GRAPHENE_EULER_ORDER_SZYX |

### Graphene.RayIntersectionKind

C type: `graphene_ray_intersection_kind_t`

The type of intersection.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| enter | 1 |  | The ray is entering the intersected object |
| leave | 2 |  | The ray is leaving the intersected object |
| none | 0 |  | No intersection |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Box |  | 0 | 0 | 30 | A 3D box, described as the volume between a minimum and a maximum vertices. |
| Euler |  | 0 | 0 | 21 | Describe a rotation using Euler angles. The contents of the #graphene_euler_t structure are private and should never be accessed directly. |
| Frustum |  | 0 | 0 | 10 | A 3D volume delimited by 2D clip planes. The contents of the `graphene_frustum_t` are private, and should not be modified directly. |
| Matrix |  | 0 | 0 | 67 | A structure capable of holding a 4x4 matrix. The contents of the #graphene_matrix_t structure are private and should never be accessed directly. |
| Plane |  | 0 | 0 | 14 | A 2D plane that extends infinitely in a 3D volume. The contents of the `graphene_plane_t` are private, and should not be modified directly. |
| Point |  | 0 | 0 | 11 | A point with two coordinates. |
| Point3D |  | 0 | 0 | 17 | A point with three components: X, Y, and Z. |
| Quad |  | 0 | 0 | 8 | A 4 vertex quadrilateral, as represented by four #graphene_point_t. The contents of a #graphene_quad_t are private and should never be accessed dir... |
| Quaternion |  | 0 | 0 | 24 | A quaternion. The contents of the #graphene_quaternion_t structure are private and should never be accessed directly. |
| Ray |  | 0 | 0 | 18 | A ray emitted from an origin in a given direction. The contents of the `graphene_ray_t` structure are private, and should not be modified directly. |
| Rect |  | 0 | 0 | 33 | The location and size of a rectangle region. The width and height of a #graphene_rect_t can be negative; for instance, a #graphene_rect_t with an o... |
| Simd4F |  | 0 | 0 | 0 |  |
| Simd4X4F |  | 0 | 0 | 0 |  |
| Size |  | 0 | 0 | 8 | A size. |
| Sphere |  | 0 | 0 | 13 | A sphere, represented by its center and radius. |
| Triangle |  | 0 | 0 | 16 | A triangle. |
| Vec2 |  | 0 | 0 | 26 | A structure capable of holding a vector with two dimensions, x and y. The contents of the #graphene_vec2_t structure are private and should never b... |
| Vec3 |  | 0 | 0 | 34 | A structure capable of holding a vector with three dimensions: x, y, and z. The contents of the #graphene_vec3_t structure are private and should n... |
| Vec4 |  | 0 | 0 | 34 | A structure capable of holding a vector with four dimensions: x, y, z, and w. The contents of the #graphene_vec4_t structure are private and should... |

### Graphene.Box

GType: `GrapheneBox` ?? C type: `graphene_box_t`

A 3D box, described as the volume between a minimum and a maximum vertices.

#### Fields

| Field | Type |
| --- | --- |
| max | Vec3 |
| min | Vec3 |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `Box.alloc() -> Box` | graphene_box_alloc | 1.2 | Allocates a new #graphene_box_t. The contents of the returned structure are undefined. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| empty | `empty() -> Box` | graphene_box_empty | 1.2 | A degenerate #graphene_box_t that can only be expanded. The returned value is owned by Graphene and should not be modified or freed. |
| infinite | `infinite() -> Box` | graphene_box_infinite | 1.2 | A degenerate #graphene_box_t that cannot be expanded. The returned value is owned by Graphene and should not be modified or freed. |
| minus_one | `minus_one() -> Box` | graphene_box_minus_one | 1.2 | A #graphene_box_t with the minimum vertex set at (-1, -1, -1) and the maximum vertex set at (0, 0, 0). The returned value is owned by Graphene and ... |
| one | `one() -> Box` | graphene_box_one | 1.2 | A #graphene_box_t with the minimum vertex set at (0, 0, 0) and the maximum vertex set at (1, 1, 1). The returned value is owned by Graphene and sho... |
| one_minus_one | `one_minus_one() -> Box` | graphene_box_one_minus_one | 1.2 | A #graphene_box_t with the minimum vertex set at (-1, -1, -1) and the maximum vertex set at (1, 1, 1). The returned value is owned by Graphene and ... |
| zero | `zero() -> Box` | graphene_box_zero | 1.2 | A #graphene_box_t with both the minimum and maximum vertices set at (0, 0, 0). The returned value is owned by Graphene and should not be modified o... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| contains_box | `Box.contains_box(b: Box) -> gboolean` | graphene_box_contains_box | 1.2 | Checks whether the #graphene_box_t @a contains the given #graphene_box_t @b. |
| contains_point | `Box.contains_point(point: Point3D) -> gboolean` | graphene_box_contains_point | 1.2 | Checks whether @box contains the given @point. |
| equal | `Box.equal(b: Box) -> gboolean` | graphene_box_equal | 1.2 | Checks whether the two given boxes are equal. |
| expand | `Box.expand(point: Point3D, res: out Box) -> none` | graphene_box_expand | 1.2 | Expands the dimensions of @box to include the coordinates at @point. |
| expand_scalar | `Box.expand_scalar(scalar: gfloat, res: out Box) -> none` | graphene_box_expand_scalar | 1.2 | Expands the dimensions of @box by the given @scalar value. If @scalar is positive, the #graphene_box_t will grow; if @scalar is negative, the #grap... |
| expand_vec3 | `Box.expand_vec3(vec: Vec3, res: out Box) -> none` | graphene_box_expand_vec3 | 1.2 | Expands the dimensions of @box to include the coordinates of the given vector. |
| free | `Box.free() -> none` | graphene_box_free | 1.2 | Frees the resources allocated by graphene_box_alloc(). |
| get_bounding_sphere | `Box.get_bounding_sphere(sphere: out Sphere) -> none` | graphene_box_get_bounding_sphere | 1.2 | Computes the bounding #graphene_sphere_t capable of containing the given #graphene_box_t. |
| get_center | `Box.get_center(center: out Point3D) -> none` | graphene_box_get_center | 1.2 | Retrieves the coordinates of the center of a #graphene_box_t. |
| get_depth | `Box.get_depth() -> gfloat` | graphene_box_get_depth | 1.2 | Retrieves the size of the @box on the Z axis. |
| get_height | `Box.get_height() -> gfloat` | graphene_box_get_height | 1.2 | Retrieves the size of the @box on the Y axis. |
| get_max | `Box.get_max(max: out Point3D) -> none` | graphene_box_get_max | 1.2 | Retrieves the coordinates of the maximum point of the given #graphene_box_t. |
| get_min | `Box.get_min(min: out Point3D) -> none` | graphene_box_get_min | 1.2 | Retrieves the coordinates of the minimum point of the given #graphene_box_t. |
| get_size | `Box.get_size(size: out Vec3) -> none` | graphene_box_get_size | 1.2 | Retrieves the size of the box on all three axes, and stores it into the given @size vector. |
| get_vertices | `Box.get_vertices(vertices: out Vec3) -> none` | graphene_box_get_vertices | 1.2 | Computes the vertices of the given #graphene_box_t. |
| get_width | `Box.get_width() -> gfloat` | graphene_box_get_width | 1.2 | Retrieves the size of the @box on the X axis. |
| init | `Box.init(min: Point3D?, max: Point3D?) -> Box` | graphene_box_init | 1.2 | Initializes the given #graphene_box_t with two vertices. |
| init_from_box | `Box.init_from_box(src: Box) -> Box` | graphene_box_init_from_box | 1.2 | Initializes the given #graphene_box_t with the vertices of another #graphene_box_t. |
| init_from_points | `Box.init_from_points(n_points: guint, points: Point3D) -> Box` | graphene_box_init_from_points | 1.2 | Initializes the given #graphene_box_t with the given array of vertices. If @n_points is 0, the returned box is initialized with graphene_box_empty(). |
| init_from_vec3 | `Box.init_from_vec3(min: Vec3?, max: Vec3?) -> Box` | graphene_box_init_from_vec3 | 1.2 | Initializes the given #graphene_box_t with two vertices stored inside #graphene_vec3_t. |
| init_from_vectors | `Box.init_from_vectors(n_vectors: guint, vectors: Vec3) -> Box` | graphene_box_init_from_vectors | 1.2 | Initializes the given #graphene_box_t with the given array of vertices. If @n_vectors is 0, the returned box is initialized with graphene_box_empty(). |
| intersection | `Box.intersection(b: Box, res: out Box?) -> gboolean` | graphene_box_intersection | 1.2 | Intersects the two given #graphene_box_t. If the two boxes do not intersect, @res will contain a degenerate box initialized with graphene_box_empty(). |
| union | `Box.union(b: Box, res: out Box) -> none` | graphene_box_union | 1.2 | Unions the two given #graphene_box_t. |

### Graphene.Euler

GType: `GrapheneEuler` ?? C type: `graphene_euler_t`

Describe a rotation using Euler angles. The contents of the #graphene_euler_t structure are private and should never be accessed directly.

#### Fields

| Field | Type |
| --- | --- |
| angles | Vec3 |
| order | EulerOrder |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `Euler.alloc() -> Euler` | graphene_euler_alloc | 1.2 | Allocates a new #graphene_euler_t. The contents of the returned structure are undefined. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| equal | `Euler.equal(b: Euler) -> gboolean` | graphene_euler_equal | 1.2 | Checks if two #graphene_euler_t are equal. |
| free | `Euler.free() -> none` | graphene_euler_free | 1.2 | Frees the resources allocated by graphene_euler_alloc(). |
| get_alpha | `Euler.get_alpha() -> gfloat` | graphene_euler_get_alpha | 1.10 | Retrieves the first component of the Euler angle vector, depending on the order of rotation. See also: graphene_euler_get_x() |
| get_beta | `Euler.get_beta() -> gfloat` | graphene_euler_get_beta | 1.10 | Retrieves the second component of the Euler angle vector, depending on the order of rotation. See also: graphene_euler_get_y() |
| get_gamma | `Euler.get_gamma() -> gfloat` | graphene_euler_get_gamma | 1.10 | Retrieves the third component of the Euler angle vector, depending on the order of rotation. See also: graphene_euler_get_z() |
| get_order | `Euler.get_order() -> EulerOrder` | graphene_euler_get_order | 1.2 | Retrieves the order used to apply the rotations described in the #graphene_euler_t structure, when converting to and from other structures, like #g... |
| get_x | `Euler.get_x() -> gfloat` | graphene_euler_get_x | 1.2 | Retrieves the rotation angle on the X axis, in degrees. |
| get_y | `Euler.get_y() -> gfloat` | graphene_euler_get_y | 1.2 | Retrieves the rotation angle on the Y axis, in degrees. |
| get_z | `Euler.get_z() -> gfloat` | graphene_euler_get_z | 1.2 | Retrieves the rotation angle on the Z axis, in degrees. |
| init | `Euler.init(x: gfloat, y: gfloat, z: gfloat) -> Euler` | graphene_euler_init | 1.2 | Initializes a #graphene_euler_t using the given angles. The order of the rotations is %GRAPHENE_EULER_ORDER_DEFAULT. |
| init_from_euler | `Euler.init_from_euler(src: Euler?) -> Euler` | graphene_euler_init_from_euler | 1.2 | Initializes a #graphene_euler_t using the angles and order of another #graphene_euler_t. If the #graphene_euler_t @src is %NULL, this function is e... |
| init_from_matrix | `Euler.init_from_matrix(m: Matrix?, order: EulerOrder) -> Euler` | graphene_euler_init_from_matrix | 1.2 | Initializes a #graphene_euler_t using the given rotation matrix. If the #graphene_matrix_t @m is %NULL, the #graphene_euler_t will be initialized w... |
| init_from_quaternion | `Euler.init_from_quaternion(q: Quaternion?, order: EulerOrder) -> Euler` | graphene_euler_init_from_quaternion | 1.2 | Initializes a #graphene_euler_t using the given normalized quaternion. If the #graphene_quaternion_t @q is %NULL, the #graphene_euler_t will be ini... |
| init_from_radians | `Euler.init_from_radians(x: gfloat, y: gfloat, z: gfloat, order: EulerOrder) -> Euler` | graphene_euler_init_from_radians | 1.10 | Initializes a #graphene_euler_t using the given angles and order of rotation. |
| init_from_vec3 | `Euler.init_from_vec3(v: Vec3?, order: EulerOrder) -> Euler` | graphene_euler_init_from_vec3 | 1.2 | Initializes a #graphene_euler_t using the angles contained in a #graphene_vec3_t. If the #graphene_vec3_t @v is %NULL, the #graphene_euler_t will b... |
| init_with_order | `Euler.init_with_order(x: gfloat, y: gfloat, z: gfloat, order: EulerOrder) -> Euler` | graphene_euler_init_with_order | 1.2 | Initializes a #graphene_euler_t with the given angles and @order. |
| reorder | `Euler.reorder(order: EulerOrder, res: out Euler) -> none` | graphene_euler_reorder | 1.2 | Reorders a #graphene_euler_t using @order. This function is equivalent to creating a #graphene_quaternion_t from the given #graphene_euler_t, and t... |
| to_matrix | `Euler.to_matrix(res: out Matrix) -> none` | graphene_euler_to_matrix | 1.2 | Converts a #graphene_euler_t into a transformation matrix expressing the extrinsic composition of rotations described by the Euler angles. The rota... |
| to_quaternion | `Euler.to_quaternion(res: out Quaternion) -> none` | graphene_euler_to_quaternion | 1.10 | Converts a #graphene_euler_t into a #graphene_quaternion_t. |
| to_vec3 | `Euler.to_vec3(res: out Vec3) -> none` | graphene_euler_to_vec3 | 1.2 | Retrieves the angles of a #graphene_euler_t and initializes a #graphene_vec3_t with them. |

### Graphene.Frustum

GType: `GrapheneFrustum` ?? C type: `graphene_frustum_t`

A 3D volume delimited by 2D clip planes. The contents of the `graphene_frustum_t` are private, and should not be modified directly.

#### Fields

| Field | Type |
| --- | --- |
| planes | Plane |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `Frustum.alloc() -> Frustum` | graphene_frustum_alloc | 1.2 | Allocates a new #graphene_frustum_t structure. The contents of the returned structure are undefined. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| contains_point | `Frustum.contains_point(point: Point3D) -> gboolean` | graphene_frustum_contains_point | 1.2 | Checks whether a point is inside the volume defined by the given #graphene_frustum_t. |
| equal | `Frustum.equal(b: Frustum) -> gboolean` | graphene_frustum_equal | 1.6 | Checks whether the two given #graphene_frustum_t are equal. |
| free | `Frustum.free() -> none` | graphene_frustum_free | 1.2 | Frees the resources allocated by graphene_frustum_alloc(). |
| get_planes | `Frustum.get_planes(planes: out Plane) -> none` | graphene_frustum_get_planes | 1.2 | Retrieves the planes that define the given #graphene_frustum_t. |
| init | `Frustum.init(p0: Plane, p1: Plane, p2: Plane, p3: Plane, p4: Plane, p5: Plane) -> Frustum` | graphene_frustum_init | 1.2 | Initializes the given #graphene_frustum_t using the provided clipping planes. |
| init_from_frustum | `Frustum.init_from_frustum(src: Frustum) -> Frustum` | graphene_frustum_init_from_frustum | 1.2 | Initializes the given #graphene_frustum_t using the clipping planes of another #graphene_frustum_t. |
| init_from_matrix | `Frustum.init_from_matrix(matrix: Matrix) -> Frustum` | graphene_frustum_init_from_matrix | 1.2 | Initializes a #graphene_frustum_t using the given @matrix. |
| intersects_box | `Frustum.intersects_box(box: Box) -> gboolean` | graphene_frustum_intersects_box | 1.2 | Checks whether the given @box intersects a plane of a #graphene_frustum_t. |
| intersects_sphere | `Frustum.intersects_sphere(sphere: Sphere) -> gboolean` | graphene_frustum_intersects_sphere | 1.2 | Checks whether the given @sphere intersects a plane of a #graphene_frustum_t. |

### Graphene.Matrix

GType: `GrapheneMatrix` ?? C type: `graphene_matrix_t`

A structure capable of holding a 4x4 matrix. The contents of the #graphene_matrix_t structure are private and should never be accessed directly.

#### Fields

| Field | Type |
| --- | --- |
| value | Simd4X4F |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `Matrix.alloc() -> Matrix` | graphene_matrix_alloc | 1.0 | Allocates a new #graphene_matrix_t. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| decompose | `Matrix.decompose(translate: out Vec3, scale: out Vec3, rotate: out Quaternion, shear: out Vec3, perspective: out Vec4) -> gboolean` | graphene_matrix_decompose |  | Decomposes a transformation matrix into its component transformations. The algorithm for decomposing a matrix is taken from the CSS3 Transforms spe... |
| determinant | `Matrix.determinant() -> gfloat` | graphene_matrix_determinant | 1.0 | Computes the determinant of the given matrix. |
| equal | `Matrix.equal(b: Matrix) -> gboolean` | graphene_matrix_equal | 1.10 | Checks whether the two given #graphene_matrix_t matrices are equal. |
| equal_fast | `Matrix.equal_fast(b: Matrix) -> gboolean` | graphene_matrix_equal_fast | 1.10 | Checks whether the two given #graphene_matrix_t matrices are byte-by-byte equal. While this function is faster than graphene_matrix_equal(), it can... |
| free | `Matrix.free() -> none` | graphene_matrix_free | 1.0 | Frees the resources allocated by graphene_matrix_alloc(). |
| get_row | `Matrix.get_row(index_: guint, res: out Vec4) -> none` | graphene_matrix_get_row | 1.0 | Retrieves the given row vector at @index_ inside a matrix. |
| get_value | `Matrix.get_value(row: guint, col: guint) -> gfloat` | graphene_matrix_get_value | 1.0 | Retrieves the value at the given @row and @col index. |
| get_x_scale | `Matrix.get_x_scale() -> gfloat` | graphene_matrix_get_x_scale | 1.0 | Retrieves the scaling factor on the X axis in @m. |
| get_x_translation | `Matrix.get_x_translation() -> gfloat` | graphene_matrix_get_x_translation | 1.10 | Retrieves the translation component on the X axis from @m. |
| get_y_scale | `Matrix.get_y_scale() -> gfloat` | graphene_matrix_get_y_scale | 1.0 | Retrieves the scaling factor on the Y axis in @m. |
| get_y_translation | `Matrix.get_y_translation() -> gfloat` | graphene_matrix_get_y_translation | 1.10 | Retrieves the translation component on the Y axis from @m. |
| get_z_scale | `Matrix.get_z_scale() -> gfloat` | graphene_matrix_get_z_scale | 1.0 | Retrieves the scaling factor on the Z axis in @m. |
| get_z_translation | `Matrix.get_z_translation() -> gfloat` | graphene_matrix_get_z_translation | 1.10 | Retrieves the translation component on the Z axis from @m. |
| init_from_2d | `Matrix.init_from_2d(xx: gdouble, yx: gdouble, xy: gdouble, yy: gdouble, x_0: gdouble, y_0: gdouble) -> Matrix` | graphene_matrix_init_from_2d | 1.0 | Initializes a #graphene_matrix_t from the values of an affine transformation matrix. The arguments map to the following matrix layout: \|[<!-- langu... |
| init_from_float | `Matrix.init_from_float(v: gfloat) -> Matrix` | graphene_matrix_init_from_float | 1.0 | Initializes a #graphene_matrix_t with the given array of floating point values. |
| init_from_matrix | `Matrix.init_from_matrix(src: Matrix) -> Matrix` | graphene_matrix_init_from_matrix | 1.0 | Initializes a #graphene_matrix_t using the values of the given matrix. |
| init_from_vec4 | `Matrix.init_from_vec4(v0: Vec4, v1: Vec4, v2: Vec4, v3: Vec4) -> Matrix` | graphene_matrix_init_from_vec4 | 1.0 | Initializes a #graphene_matrix_t with the given four row vectors. |
| init_frustum | `Matrix.init_frustum(left: gfloat, right: gfloat, bottom: gfloat, top: gfloat, z_near: gfloat, z_far: gfloat) -> Matrix` | graphene_matrix_init_frustum | 1.2 | Initializes a #graphene_matrix_t compatible with #graphene_frustum_t. See also: graphene_frustum_init_from_matrix() |
| init_identity | `Matrix.init_identity() -> Matrix` | graphene_matrix_init_identity | 1.0 | Initializes a #graphene_matrix_t with the identity matrix. |
| init_look_at | `Matrix.init_look_at(eye: Vec3, center: Vec3, up: Vec3) -> Matrix` | graphene_matrix_init_look_at | 1.0 | Initializes a #graphene_matrix_t so that it positions the "camera" at the given @eye coordinates towards an object at the @center coordinates. The ... |
| init_ortho | `Matrix.init_ortho(left: gfloat, right: gfloat, top: gfloat, bottom: gfloat, z_near: gfloat, z_far: gfloat) -> Matrix` | graphene_matrix_init_ortho | 1.0 | Initializes a #graphene_matrix_t with an orthographic projection. |
| init_perspective | `Matrix.init_perspective(fovy: gfloat, aspect: gfloat, z_near: gfloat, z_far: gfloat) -> Matrix` | graphene_matrix_init_perspective | 1.0 | Initializes a #graphene_matrix_t with a perspective projection. |
| init_rotate | `Matrix.init_rotate(angle: gfloat, axis: Vec3) -> Matrix` | graphene_matrix_init_rotate | 1.0 | Initializes @m to represent a rotation of @angle degrees on the axis represented by the @axis vector. |
| init_scale | `Matrix.init_scale(x: gfloat, y: gfloat, z: gfloat) -> Matrix` | graphene_matrix_init_scale | 1.0 | Initializes a #graphene_matrix_t with the given scaling factors. |
| init_skew | `Matrix.init_skew(x_skew: gfloat, y_skew: gfloat) -> Matrix` | graphene_matrix_init_skew | 1.0 | Initializes a #graphene_matrix_t with a skew transformation with the given factors. |
| init_translate | `Matrix.init_translate(p: Point3D) -> Matrix` | graphene_matrix_init_translate | 1.0 | Initializes a #graphene_matrix_t with a translation to the given coordinates. |
| interpolate | `Matrix.interpolate(b: Matrix, factor: gdouble, res: out Matrix) -> none` | graphene_matrix_interpolate | 1.0 | Linearly interpolates the two given #graphene_matrix_t by interpolating the decomposed transformations separately. If either matrix cannot be reduc... |
| inverse | `Matrix.inverse(res: out Matrix) -> gboolean` | graphene_matrix_inverse | 1.0 | Inverts the given matrix. |
| is_2d | `Matrix.is_2d() -> gboolean` | graphene_matrix_is_2d | 1.0 | Checks whether the given #graphene_matrix_t is compatible with an a 2D affine transformation matrix. |
| is_backface_visible | `Matrix.is_backface_visible() -> gboolean` | graphene_matrix_is_backface_visible | 1.0 | Checks whether a #graphene_matrix_t has a visible back face. |
| is_identity | `Matrix.is_identity() -> gboolean` | graphene_matrix_is_identity | 1.0 | Checks whether the given #graphene_matrix_t is the identity matrix. |
| is_singular | `Matrix.is_singular() -> gboolean` | graphene_matrix_is_singular | 1.0 | Checks whether a matrix is singular. |
| multiply | `Matrix.multiply(b: Matrix, res: out Matrix) -> none` | graphene_matrix_multiply | 1.0 | Multiplies two #graphene_matrix_t. Matrix multiplication is not commutative in general; the order of the factors matters. The product of this multi... |
| near | `Matrix.near(b: Matrix, epsilon: gfloat) -> gboolean` | graphene_matrix_near | 1.10 | Compares the two given #graphene_matrix_t matrices and checks whether their values are within the given @epsilon of each other. |
| normalize | `Matrix.normalize(res: out Matrix) -> none` | graphene_matrix_normalize | 1.0 | Normalizes the given #graphene_matrix_t. |
| perspective | `Matrix.perspective(depth: gfloat, res: out Matrix) -> none` | graphene_matrix_perspective | 1.0 | Applies a perspective of @depth to the matrix. |
| print | `Matrix.print() -> none` | graphene_matrix_print | 1.0 | Prints the contents of a matrix to the standard error stream. This function is only useful for debugging; there are no guarantees made on the forma... |
| project_point | `Matrix.project_point(p: Point, res: out Point) -> none` | graphene_matrix_project_point | 1.0 | Projects a #graphene_point_t using the matrix @m. |
| project_rect | `Matrix.project_rect(r: Rect, res: out Quad) -> none` | graphene_matrix_project_rect | 1.2 | Projects all corners of a #graphene_rect_t using the given matrix. See also: graphene_matrix_project_point() |
| project_rect_bounds | `Matrix.project_rect_bounds(r: Rect, res: out Rect) -> none` | graphene_matrix_project_rect_bounds | 1.0 | Projects a #graphene_rect_t using the given matrix. The resulting rectangle is the axis aligned bounding rectangle capable of fully containing the ... |
| rotate | `Matrix.rotate(angle: gfloat, axis: Vec3) -> none` | graphene_matrix_rotate | 1.0 | Adds a rotation transformation to @m, using the given @angle and @axis vector. This is the equivalent of calling graphene_matrix_init_rotate() and ... |
| rotate_euler | `Matrix.rotate_euler(e: Euler) -> none` | graphene_matrix_rotate_euler | 1.2 | Adds a rotation transformation to @m, using the given #graphene_euler_t. |
| rotate_quaternion | `Matrix.rotate_quaternion(q: Quaternion) -> none` | graphene_matrix_rotate_quaternion | 1.2 | Adds a rotation transformation to @m, using the given #graphene_quaternion_t. This is the equivalent of calling graphene_quaternion_to_matrix() and... |
| rotate_x | `Matrix.rotate_x(angle: gfloat) -> none` | graphene_matrix_rotate_x | 1.0 | Adds a rotation transformation around the X axis to @m, using the given @angle. See also: graphene_matrix_rotate() |
| rotate_y | `Matrix.rotate_y(angle: gfloat) -> none` | graphene_matrix_rotate_y | 1.0 | Adds a rotation transformation around the Y axis to @m, using the given @angle. See also: graphene_matrix_rotate() |
| rotate_z | `Matrix.rotate_z(angle: gfloat) -> none` | graphene_matrix_rotate_z | 1.0 | Adds a rotation transformation around the Z axis to @m, using the given @angle. See also: graphene_matrix_rotate() |
| scale | `Matrix.scale(factor_x: gfloat, factor_y: gfloat, factor_z: gfloat) -> none` | graphene_matrix_scale | 1.0 | Adds a scaling transformation to @m, using the three given factors. This is the equivalent of calling graphene_matrix_init_scale() and then multipl... |
| skew_xy | `Matrix.skew_xy(factor: gfloat) -> none` | graphene_matrix_skew_xy | 1.0 | Adds a skew of @factor on the X and Y axis to the given matrix. |
| skew_xz | `Matrix.skew_xz(factor: gfloat) -> none` | graphene_matrix_skew_xz | 1.0 | Adds a skew of @factor on the X and Z axis to the given matrix. |
| skew_yz | `Matrix.skew_yz(factor: gfloat) -> none` | graphene_matrix_skew_yz | 1.0 | Adds a skew of @factor on the Y and Z axis to the given matrix. |
| to_2d | `Matrix.to_2d(xx: out gdouble, yx: out gdouble, xy: out gdouble, yy: out gdouble, x_0: out gdouble, y_0: out gdouble) -> gboolean` | graphene_matrix_to_2d | 1.0 | Converts a #graphene_matrix_t to an affine transformation matrix, if the given matrix is compatible. The returned values have the following layout:... |
| to_float | `Matrix.to_float(v: out gfloat) -> none` | graphene_matrix_to_float | 1.0 | Converts a #graphene_matrix_t to an array of floating point values. |
| transform_bounds | `Matrix.transform_bounds(r: Rect, res: out Rect) -> none` | graphene_matrix_transform_bounds | 1.0 | Transforms each corner of a #graphene_rect_t using the given matrix @m. The result is the axis aligned bounding rectangle containing the coplanar q... |
| transform_box | `Matrix.transform_box(b: Box, res: out Box) -> none` | graphene_matrix_transform_box | 1.2 | Transforms the vertices of a #graphene_box_t using the given matrix @m. The result is the axis aligned bounding box containing the transformed vert... |
| transform_point | `Matrix.transform_point(p: Point, res: out Point) -> none` | graphene_matrix_transform_point | 1.0 | Transforms the given #graphene_point_t using the matrix @m. Unlike graphene_matrix_transform_vec3(), this function will take into account the fourt... |
| transform_point3d | `Matrix.transform_point3d(p: Point3D, res: out Point3D) -> none` | graphene_matrix_transform_point3d | 1.2 | Transforms the given #graphene_point3d_t using the matrix @m. Unlike graphene_matrix_transform_vec3(), this function will take into account the fou... |
| transform_ray | `Matrix.transform_ray(r: Ray, res: out Ray) -> none` | graphene_matrix_transform_ray | 1.4 | Transform a #graphene_ray_t using the given matrix @m. |
| transform_rect | `Matrix.transform_rect(r: Rect, res: out Quad) -> none` | graphene_matrix_transform_rect | 1.0 | Transforms each corner of a #graphene_rect_t using the given matrix @m. The result is a coplanar quadrilateral. See also: graphene_matrix_transform... |
| transform_sphere | `Matrix.transform_sphere(s: Sphere, res: out Sphere) -> none` | graphene_matrix_transform_sphere | 1.2 | Transforms a #graphene_sphere_t using the given matrix @m. The result is the bounding sphere containing the transformed sphere. |
| transform_vec3 | `Matrix.transform_vec3(v: Vec3, res: out Vec3) -> none` | graphene_matrix_transform_vec3 | 1.0 | Transforms the given #graphene_vec3_t using the matrix @m. This function will multiply the X, Y, and Z row vectors of the matrix @m with the corres... |
| transform_vec4 | `Matrix.transform_vec4(v: Vec4, res: out Vec4) -> none` | graphene_matrix_transform_vec4 | 1.0 | Transforms the given #graphene_vec4_t using the matrix @m. See also: graphene_simd4x4f_vec4_mul() |
| translate | `Matrix.translate(pos: Point3D) -> none` | graphene_matrix_translate | 1.0 | Adds a translation transformation to @m using the coordinates of the given #graphene_point3d_t. This is the equivalent of calling graphene_matrix_i... |
| transpose | `Matrix.transpose(res: out Matrix) -> none` | graphene_matrix_transpose | 1.0 | Transposes the given matrix. |
| unproject_point3d | `Matrix.unproject_point3d(modelview: Matrix, point: Point3D, res: out Point3D) -> none` | graphene_matrix_unproject_point3d | 1.2 | Unprojects the given @point using the @projection matrix and a @modelview matrix. |
| untransform_bounds | `Matrix.untransform_bounds(r: Rect, bounds: Rect, res: out Rect) -> none` | graphene_matrix_untransform_bounds | 1.0 | Undoes the transformation on the corners of a #graphene_rect_t using the given matrix, within the given axis aligned rectangular @bounds. |
| untransform_point | `Matrix.untransform_point(p: Point, bounds: Rect, res: out Point) -> gboolean` | graphene_matrix_untransform_point | 1.0 | Undoes the transformation of a #graphene_point_t using the given matrix, within the given axis aligned rectangular @bounds. |

### Graphene.Plane

GType: `GraphenePlane` ?? C type: `graphene_plane_t`

A 2D plane that extends infinitely in a 3D volume. The contents of the `graphene_plane_t` are private, and should not be modified directly.

#### Fields

| Field | Type |
| --- | --- |
| constant | gfloat |
| normal | Vec3 |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `Plane.alloc() -> Plane` | graphene_plane_alloc | 1.2 | Allocates a new #graphene_plane_t structure. The contents of the returned structure are undefined. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| distance | `Plane.distance(point: Point3D) -> gfloat` | graphene_plane_distance | 1.2 | Computes the distance of @point from a #graphene_plane_t. |
| equal | `Plane.equal(b: Plane) -> gboolean` | graphene_plane_equal | 1.2 | Checks whether the two given #graphene_plane_t are equal. |
| free | `Plane.free() -> none` | graphene_plane_free | 1.2 | Frees the resources allocated by graphene_plane_alloc(). |
| get_constant | `Plane.get_constant() -> gfloat` | graphene_plane_get_constant | 1.2 | Retrieves the distance along the normal vector of the given #graphene_plane_t from the origin. |
| get_normal | `Plane.get_normal(normal: out Vec3) -> none` | graphene_plane_get_normal | 1.2 | Retrieves the normal vector pointing towards the origin of the given #graphene_plane_t. |
| init | `Plane.init(normal: Vec3?, constant: gfloat) -> Plane` | graphene_plane_init | 1.2 | Initializes the given #graphene_plane_t using the given @normal vector and @constant values. |
| init_from_plane | `Plane.init_from_plane(src: Plane) -> Plane` | graphene_plane_init_from_plane | 1.2 | Initializes the given #graphene_plane_t using the normal vector and constant of another #graphene_plane_t. |
| init_from_point | `Plane.init_from_point(normal: Vec3, point: Point3D) -> Plane` | graphene_plane_init_from_point | 1.2 | Initializes the given #graphene_plane_t using the given normal vector and an arbitrary co-planar point. |
| init_from_points | `Plane.init_from_points(a: Point3D, b: Point3D, c: Point3D) -> Plane` | graphene_plane_init_from_points | 1.2 | Initializes the given #graphene_plane_t using the 3 provided co-planar points. The winding order is counter-clockwise, and determines which directi... |
| init_from_vec4 | `Plane.init_from_vec4(src: Vec4) -> Plane` | graphene_plane_init_from_vec4 | 1.2 | Initializes the given #graphene_plane_t using the components of the given #graphene_vec4_t vector. |
| negate | `Plane.negate(res: out Plane) -> none` | graphene_plane_negate | 1.2 | Negates the normal vector and constant of a #graphene_plane_t, effectively mirroring the plane across the origin. |
| normalize | `Plane.normalize(res: out Plane) -> none` | graphene_plane_normalize | 1.2 | Normalizes the vector of the given #graphene_plane_t, and adjusts the constant accordingly. |
| transform | `Plane.transform(matrix: Matrix, normal_matrix: Matrix?, res: out Plane) -> none` | graphene_plane_transform | 1.10 | Transforms a #graphene_plane_t @p using the given @matrix and @normal_matrix. If @normal_matrix is %NULL, a transformation matrix for the plane nor... |

### Graphene.Point

GType: `GraphenePoint` ?? C type: `graphene_point_t`

A point with two coordinates.

#### Fields

| Field | Type |
| --- | --- |
| x | gfloat |
| y | gfloat |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `Point.alloc() -> Point` | graphene_point_alloc | 1.0 | Allocates a new #graphene_point_t structure. The coordinates of the returned point are (0, 0). It's possible to chain this function with graphene_p... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| zero | `zero() -> Point` | graphene_point_zero | 1.0 | Returns a point fixed at (0, 0). |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| distance | `Point.distance(b: Point, d_x: out gfloat?, d_y: out gfloat?) -> gfloat` | graphene_point_distance | 1.0 | Computes the distance between @a and @b. |
| equal | `Point.equal(b: Point) -> gboolean` | graphene_point_equal | 1.0 | Checks if the two points @a and @b point to the same coordinates. This function accounts for floating point fluctuations; if you want to control th... |
| free | `Point.free() -> none` | graphene_point_free | 1.0 | Frees the resources allocated by graphene_point_alloc(). |
| init | `Point.init(x: gfloat, y: gfloat) -> Point` | graphene_point_init | 1.0 | Initializes @p to the given @x and @y coordinates. It's safe to call this function multiple times. |
| init_from_point | `Point.init_from_point(src: Point) -> Point` | graphene_point_init_from_point | 1.0 | Initializes @p with the same coordinates of @src. |
| init_from_vec2 | `Point.init_from_vec2(src: Vec2) -> Point` | graphene_point_init_from_vec2 | 1.4 | Initializes @p with the coordinates inside the given #graphene_vec2_t. |
| interpolate | `Point.interpolate(b: Point, factor: gdouble, res: out Point) -> none` | graphene_point_interpolate | 1.0 | Linearly interpolates the coordinates of @a and @b using the given @factor. |
| near | `Point.near(b: Point, epsilon: gfloat) -> gboolean` | graphene_point_near | 1.0 | Checks whether the two points @a and @b are within the threshold of @epsilon. |
| to_vec2 | `Point.to_vec2(v: out Vec2) -> none` | graphene_point_to_vec2 | 1.4 | Stores the coordinates of the given #graphene_point_t into a #graphene_vec2_t. |

### Graphene.Point3D

GType: `GraphenePoint3D` ?? C type: `graphene_point3d_t`

A point with three components: X, Y, and Z.

#### Fields

| Field | Type |
| --- | --- |
| x | gfloat |
| y | gfloat |
| z | gfloat |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `Point3D.alloc() -> Point3D` | graphene_point3d_alloc | 1.0 | Allocates a #graphene_point3d_t structure. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| zero | `zero() -> Point3D` | graphene_point3d_zero | 1.0 | Retrieves a constant point with all three coordinates set to 0. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| cross | `Point3D.cross(b: Point3D, res: out Point3D) -> none` | graphene_point3d_cross | 1.0 | Computes the cross product of the two given #graphene_point3d_t. |
| distance | `Point3D.distance(b: Point3D, delta: out Vec3?) -> gfloat` | graphene_point3d_distance | 1.4 | Computes the distance between the two given #graphene_point3d_t. |
| dot | `Point3D.dot(b: Point3D) -> gfloat` | graphene_point3d_dot | 1.0 | Computes the dot product of the two given #graphene_point3d_t. |
| equal | `Point3D.equal(b: Point3D) -> gboolean` | graphene_point3d_equal | 1.0 | Checks whether two given points are equal. |
| free | `Point3D.free() -> none` | graphene_point3d_free | 1.0 | Frees the resources allocated via graphene_point3d_alloc(). |
| init | `Point3D.init(x: gfloat, y: gfloat, z: gfloat) -> Point3D` | graphene_point3d_init | 1.0 | Initializes a #graphene_point3d_t with the given coordinates. |
| init_from_point | `Point3D.init_from_point(src: Point3D) -> Point3D` | graphene_point3d_init_from_point | 1.0 | Initializes a #graphene_point3d_t using the coordinates of another #graphene_point3d_t. |
| init_from_vec3 | `Point3D.init_from_vec3(v: Vec3) -> Point3D` | graphene_point3d_init_from_vec3 | 1.0 | Initializes a #graphene_point3d_t using the components of a #graphene_vec3_t. |
| interpolate | `Point3D.interpolate(b: Point3D, factor: gdouble, res: out Point3D) -> none` | graphene_point3d_interpolate | 1.0 | Linearly interpolates each component of @a and @b using the provided @factor, and places the result in @res. |
| length | `Point3D.length() -> gfloat` | graphene_point3d_length | 1.0 | Computes the length of the vector represented by the coordinates of the given #graphene_point3d_t. |
| near | `Point3D.near(b: Point3D, epsilon: gfloat) -> gboolean` | graphene_point3d_near | 1.0 | Checks whether the two points are near each other, within an @epsilon factor. |
| normalize | `Point3D.normalize(res: out Point3D) -> none` | graphene_point3d_normalize | 1.0 | Computes the normalization of the vector represented by the coordinates of the given #graphene_point3d_t. |
| normalize_viewport | `Point3D.normalize_viewport(viewport: Rect, z_near: gfloat, z_far: gfloat, res: out Point3D) -> none` | graphene_point3d_normalize_viewport | 1.4 | Normalizes the coordinates of a #graphene_point3d_t using the given viewport and clipping planes. The coordinates of the resulting #graphene_point3... |
| scale | `Point3D.scale(factor: gfloat, res: out Point3D) -> none` | graphene_point3d_scale | 1.0 | Scales the coordinates of the given #graphene_point3d_t by the given @factor. |
| to_vec3 | `Point3D.to_vec3(v: out Vec3) -> none` | graphene_point3d_to_vec3 | 1.0 | Stores the coordinates of a #graphene_point3d_t into a #graphene_vec3_t. |

### Graphene.Quad

GType: `GrapheneQuad` ?? C type: `graphene_quad_t`

A 4 vertex quadrilateral, as represented by four #graphene_point_t. The contents of a #graphene_quad_t are private and should never be accessed dir...

#### Fields

| Field | Type |
| --- | --- |
| points | Point |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `Quad.alloc() -> Quad` | graphene_quad_alloc | 1.0 | Allocates a new #graphene_quad_t instance. The contents of the returned instance are undefined. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| bounds | `Quad.bounds(r: out Rect) -> none` | graphene_quad_bounds | 1.0 | Computes the bounding rectangle of @q and places it into @r. |
| contains | `Quad.contains(p: Point) -> gboolean` | graphene_quad_contains | 1.0 | Checks if the given #graphene_quad_t contains the given #graphene_point_t. |
| free | `Quad.free() -> none` | graphene_quad_free | 1.0 | Frees the resources allocated by graphene_quad_alloc() |
| get_point | `Quad.get_point(index_: guint) -> Point` | graphene_quad_get_point | 1.0 | Retrieves the point of a #graphene_quad_t at the given index. |
| init | `Quad.init(p1: Point, p2: Point, p3: Point, p4: Point) -> Quad` | graphene_quad_init | 1.0 | Initializes a #graphene_quad_t with the given points. |
| init_from_points | `Quad.init_from_points(points: Point) -> Quad` | graphene_quad_init_from_points | 1.2 | Initializes a #graphene_quad_t using an array of points. |
| init_from_rect | `Quad.init_from_rect(r: Rect) -> Quad` | graphene_quad_init_from_rect | 1.0 | Initializes a #graphene_quad_t using the four corners of the given #graphene_rect_t. |

### Graphene.Quaternion

GType: `GrapheneQuaternion` ?? C type: `graphene_quaternion_t`

A quaternion. The contents of the #graphene_quaternion_t structure are private and should never be accessed directly.

#### Fields

| Field | Type |
| --- | --- |
| w | gfloat |
| x | gfloat |
| y | gfloat |
| z | gfloat |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `Quaternion.alloc() -> Quaternion` | graphene_quaternion_alloc | 1.0 | Allocates a new #graphene_quaternion_t. The contents of the returned value are undefined. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `Quaternion.add(b: Quaternion, res: out Quaternion) -> none` | graphene_quaternion_add | 1.10 | Adds two #graphene_quaternion_t @a and @b. |
| dot | `Quaternion.dot(b: Quaternion) -> gfloat` | graphene_quaternion_dot | 1.0 | Computes the dot product of two #graphene_quaternion_t. |
| equal | `Quaternion.equal(b: Quaternion) -> gboolean` | graphene_quaternion_equal | 1.0 | Checks whether the given quaternions are equal. |
| free | `Quaternion.free() -> none` | graphene_quaternion_free | 1.0 | Releases the resources allocated by graphene_quaternion_alloc(). |
| init | `Quaternion.init(x: gfloat, y: gfloat, z: gfloat, w: gfloat) -> Quaternion` | graphene_quaternion_init | 1.0 | Initializes a #graphene_quaternion_t using the given four values. |
| init_from_angle_vec3 | `Quaternion.init_from_angle_vec3(angle: gfloat, axis: Vec3) -> Quaternion` | graphene_quaternion_init_from_angle_vec3 | 1.0 | Initializes a #graphene_quaternion_t using an @angle on a specific @axis. |
| init_from_angles | `Quaternion.init_from_angles(deg_x: gfloat, deg_y: gfloat, deg_z: gfloat) -> Quaternion` | graphene_quaternion_init_from_angles | 1.0 | Initializes a #graphene_quaternion_t using the values of the Euler angles on each axis. See also: graphene_quaternion_init_from_euler() |
| init_from_euler | `Quaternion.init_from_euler(e: Euler) -> Quaternion` | graphene_quaternion_init_from_euler | 1.2 | Initializes a #graphene_quaternion_t using the given #graphene_euler_t. |
| init_from_matrix | `Quaternion.init_from_matrix(m: Matrix) -> Quaternion` | graphene_quaternion_init_from_matrix | 1.0 | Initializes a #graphene_quaternion_t using the rotation components of a transformation matrix. |
| init_from_quaternion | `Quaternion.init_from_quaternion(src: Quaternion) -> Quaternion` | graphene_quaternion_init_from_quaternion | 1.0 | Initializes a #graphene_quaternion_t with the values from @src. |
| init_from_radians | `Quaternion.init_from_radians(rad_x: gfloat, rad_y: gfloat, rad_z: gfloat) -> Quaternion` | graphene_quaternion_init_from_radians | 1.0 | Initializes a #graphene_quaternion_t using the values of the Euler angles on each axis. See also: graphene_quaternion_init_from_euler() |
| init_from_vec4 | `Quaternion.init_from_vec4(src: Vec4) -> Quaternion` | graphene_quaternion_init_from_vec4 | 1.0 | Initializes a #graphene_quaternion_t with the values from @src. |
| init_identity | `Quaternion.init_identity() -> Quaternion` | graphene_quaternion_init_identity | 1.0 | Initializes a #graphene_quaternion_t using the identity transformation. |
| invert | `Quaternion.invert(res: out Quaternion) -> none` | graphene_quaternion_invert | 1.0 | Inverts a #graphene_quaternion_t, and returns the conjugate quaternion of @q. |
| multiply | `Quaternion.multiply(b: Quaternion, res: out Quaternion) -> none` | graphene_quaternion_multiply | 1.10 | Multiplies two #graphene_quaternion_t @a and @b. |
| normalize | `Quaternion.normalize(res: out Quaternion) -> none` | graphene_quaternion_normalize | 1.0 | Normalizes a #graphene_quaternion_t. |
| scale | `Quaternion.scale(factor: gfloat, res: out Quaternion) -> none` | graphene_quaternion_scale | 1.10 | Scales all the elements of a #graphene_quaternion_t @q using the given scalar factor. |
| slerp | `Quaternion.slerp(b: Quaternion, factor: gfloat, res: out Quaternion) -> none` | graphene_quaternion_slerp | 1.0 | Interpolates between the two given quaternions using a spherical linear interpolation, or SLERP, using the given interpolation @factor. |
| to_angle_vec3 | `Quaternion.to_angle_vec3(angle: out gfloat, axis: out Vec3) -> none` | graphene_quaternion_to_angle_vec3 | 1.0 | Converts a quaternion into an @angle, @axis pair. |
| to_angles | `Quaternion.to_angles(deg_x: out gfloat?, deg_y: out gfloat?, deg_z: out gfloat?) -> none` | graphene_quaternion_to_angles | 1.2 | Converts a #graphene_quaternion_t to its corresponding rotations on the Euler angles on each axis. |
| to_matrix | `Quaternion.to_matrix(m: out Matrix) -> none` | graphene_quaternion_to_matrix | 1.0 | Converts a quaternion into a transformation matrix expressing the rotation defined by the #graphene_quaternion_t. |
| to_radians | `Quaternion.to_radians(rad_x: out gfloat?, rad_y: out gfloat?, rad_z: out gfloat?) -> none` | graphene_quaternion_to_radians | 1.2 | Converts a #graphene_quaternion_t to its corresponding rotations on the Euler angles on each axis. |
| to_vec4 | `Quaternion.to_vec4(res: out Vec4) -> none` | graphene_quaternion_to_vec4 | 1.0 | Copies the components of a #graphene_quaternion_t into a #graphene_vec4_t. |

### Graphene.Ray

GType: `GrapheneRay` ?? C type: `graphene_ray_t`

A ray emitted from an origin in a given direction. The contents of the `graphene_ray_t` structure are private, and should not be modified directly.

#### Fields

| Field | Type |
| --- | --- |
| direction | Vec3 |
| origin | Vec3 |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `Ray.alloc() -> Ray` | graphene_ray_alloc | 1.4 | Allocates a new #graphene_ray_t structure. The contents of the returned structure are undefined. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| equal | `Ray.equal(b: Ray) -> gboolean` | graphene_ray_equal | 1.4 | Checks whether the two given #graphene_ray_t are equal. |
| free | `Ray.free() -> none` | graphene_ray_free | 1.4 | Frees the resources allocated by graphene_ray_alloc(). |
| get_closest_point_to_point | `Ray.get_closest_point_to_point(p: Point3D, res: out Point3D) -> none` | graphene_ray_get_closest_point_to_point | 1.4 | Computes the point on the given #graphene_ray_t that is closest to the given point @p. |
| get_direction | `Ray.get_direction(direction: out Vec3) -> none` | graphene_ray_get_direction | 1.4 | Retrieves the direction of the given #graphene_ray_t. |
| get_distance_to_plane | `Ray.get_distance_to_plane(p: Plane) -> gfloat` | graphene_ray_get_distance_to_plane | 1.4 | Computes the distance of the origin of the given #graphene_ray_t from the given plane. If the ray does not intersect the plane, this function retur... |
| get_distance_to_point | `Ray.get_distance_to_point(p: Point3D) -> gfloat` | graphene_ray_get_distance_to_point | 1.4 | Computes the distance of the closest approach between the given #graphene_ray_t @r and the point @p. The closest approach to a ray from a point is ... |
| get_origin | `Ray.get_origin(origin: out Point3D) -> none` | graphene_ray_get_origin | 1.4 | Retrieves the origin of the given #graphene_ray_t. |
| get_position_at | `Ray.get_position_at(t: gfloat, position: out Point3D) -> none` | graphene_ray_get_position_at | 1.4 | Retrieves the coordinates of a point at the distance @t along the given #graphene_ray_t. |
| init | `Ray.init(origin: Point3D?, direction: Vec3?) -> Ray` | graphene_ray_init | 1.4 | Initializes the given #graphene_ray_t using the given @origin and @direction values. |
| init_from_ray | `Ray.init_from_ray(src: Ray) -> Ray` | graphene_ray_init_from_ray | 1.4 | Initializes the given #graphene_ray_t using the origin and direction values of another #graphene_ray_t. |
| init_from_vec3 | `Ray.init_from_vec3(origin: Vec3?, direction: Vec3?) -> Ray` | graphene_ray_init_from_vec3 | 1.4 | Initializes the given #graphene_ray_t using the given vectors. |
| intersect_box | `Ray.intersect_box(b: Box, t_out: out gfloat) -> RayIntersectionKind` | graphene_ray_intersect_box | 1.10 | Intersects the given #graphene_ray_t @r with the given #graphene_box_t @b. |
| intersect_sphere | `Ray.intersect_sphere(s: Sphere, t_out: out gfloat) -> RayIntersectionKind` | graphene_ray_intersect_sphere | 1.10 | Intersects the given #graphene_ray_t @r with the given #graphene_sphere_t @s. |
| intersect_triangle | `Ray.intersect_triangle(t: Triangle, t_out: out gfloat) -> RayIntersectionKind` | graphene_ray_intersect_triangle | 1.10 | Intersects the given #graphene_ray_t @r with the given #graphene_triangle_t @t. |
| intersects_box | `Ray.intersects_box(b: Box) -> gboolean` | graphene_ray_intersects_box | 1.10 | Checks whether the given #graphene_ray_t @r intersects the given #graphene_box_t @b. See also: graphene_ray_intersect_box() |
| intersects_sphere | `Ray.intersects_sphere(s: Sphere) -> gboolean` | graphene_ray_intersects_sphere | 1.10 | Checks if the given #graphene_ray_t @r intersects the given #graphene_sphere_t @s. See also: graphene_ray_intersect_sphere() |
| intersects_triangle | `Ray.intersects_triangle(t: Triangle) -> gboolean` | graphene_ray_intersects_triangle | 1.10 | Checks whether the given #graphene_ray_t @r intersects the given #graphene_triangle_t @b. See also: graphene_ray_intersect_triangle() |

### Graphene.Rect

GType: `GrapheneRect` ?? C type: `graphene_rect_t`

The location and size of a rectangle region. The width and height of a #graphene_rect_t can be negative; for instance, a #graphene_rect_t with an o...

#### Fields

| Field | Type |
| --- | --- |
| origin | Point |
| size | Size |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `alloc() -> Rect` | graphene_rect_alloc | 1.0 | Allocates a new #graphene_rect_t. The contents of the returned rectangle are undefined. |
| zero | `zero() -> Rect` | graphene_rect_zero | 1.4 | Returns a degenerate rectangle with origin fixed at (0, 0) and a size of 0, 0. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| contains_point | `Rect.contains_point(p: Point) -> gboolean` | graphene_rect_contains_point | 1.0 | Checks whether a #graphene_rect_t contains the given coordinates. |
| contains_rect | `Rect.contains_rect(b: Rect) -> gboolean` | graphene_rect_contains_rect | 1.0 | Checks whether a #graphene_rect_t fully contains the given rectangle. |
| equal | `Rect.equal(b: Rect) -> gboolean` | graphene_rect_equal | 1.0 | Checks whether the two given rectangle are equal. |
| expand | `Rect.expand(p: Point, res: out Rect) -> none` | graphene_rect_expand | 1.4 | Expands a #graphene_rect_t to contain the given #graphene_point_t. |
| free | `Rect.free() -> none` | graphene_rect_free | 1.0 | Frees the resources allocated by graphene_rect_alloc(). |
| get_area | `Rect.get_area() -> gfloat` | graphene_rect_get_area | 1.10 | Compute the area of given normalized rectangle. |
| get_bottom_left | `Rect.get_bottom_left(p: out Point) -> none` | graphene_rect_get_bottom_left | 1.0 | Retrieves the coordinates of the bottom-left corner of the given rectangle. |
| get_bottom_right | `Rect.get_bottom_right(p: out Point) -> none` | graphene_rect_get_bottom_right | 1.0 | Retrieves the coordinates of the bottom-right corner of the given rectangle. |
| get_center | `Rect.get_center(p: out Point) -> none` | graphene_rect_get_center | 1.0 | Retrieves the coordinates of the center of the given rectangle. |
| get_height | `Rect.get_height() -> gfloat` | graphene_rect_get_height | 1.0 | Retrieves the normalized height of the given rectangle. |
| get_top_left | `Rect.get_top_left(p: out Point) -> none` | graphene_rect_get_top_left | 1.0 | Retrieves the coordinates of the top-left corner of the given rectangle. |
| get_top_right | `Rect.get_top_right(p: out Point) -> none` | graphene_rect_get_top_right | 1.0 | Retrieves the coordinates of the top-right corner of the given rectangle. |
| get_vertices | `Rect.get_vertices(vertices: out Vec2) -> none` | graphene_rect_get_vertices | 1.4 | Computes the four vertices of a #graphene_rect_t. |
| get_width | `Rect.get_width() -> gfloat` | graphene_rect_get_width | 1.0 | Retrieves the normalized width of the given rectangle. |
| get_x | `Rect.get_x() -> gfloat` | graphene_rect_get_x | 1.0 | Retrieves the normalized X coordinate of the origin of the given rectangle. |
| get_y | `Rect.get_y() -> gfloat` | graphene_rect_get_y | 1.0 | Retrieves the normalized Y coordinate of the origin of the given rectangle. |
| init | `Rect.init(x: gfloat, y: gfloat, width: gfloat, height: gfloat) -> Rect` | graphene_rect_init | 1.0 | Initializes the given #graphene_rect_t with the given values. This function will implicitly normalize the #graphene_rect_t before returning. |
| init_from_rect | `Rect.init_from_rect(src: Rect) -> Rect` | graphene_rect_init_from_rect | 1.0 | Initializes @r using the given @src rectangle. This function will implicitly normalize the #graphene_rect_t before returning. |
| inset | `Rect.inset(d_x: gfloat, d_y: gfloat) -> Rect` | graphene_rect_inset | 1.0 | Changes the given rectangle to be smaller, or larger depending on the given inset parameters. To create an inset rectangle, use positive @d_x or @d... |
| inset_r | `Rect.inset_r(d_x: gfloat, d_y: gfloat, res: out Rect) -> none` | graphene_rect_inset_r | 1.4 | Changes the given rectangle to be smaller, or larger depending on the given inset parameters. To create an inset rectangle, use positive @d_x or @d... |
| interpolate | `Rect.interpolate(b: Rect, factor: gdouble, res: out Rect) -> none` | graphene_rect_interpolate | 1.0 | Linearly interpolates the origin and size of the two given rectangles. |
| intersection | `Rect.intersection(b: Rect, res: out Rect?) -> gboolean` | graphene_rect_intersection | 1.0 | Computes the intersection of the two given rectangles. ! The intersection in the image above is the blue outline. If the two rectangles do not inte... |
| normalize | `Rect.normalize() -> Rect` | graphene_rect_normalize | 1.0 | Normalizes the passed rectangle. This function ensures that the size of the rectangle is made of positive values, and that the origin is the top-le... |
| normalize_r | `Rect.normalize_r(res: out Rect) -> none` | graphene_rect_normalize_r | 1.4 | Normalizes the passed rectangle. This function ensures that the size of the rectangle is made of positive values, and that the origin is in the top... |
| offset | `Rect.offset(d_x: gfloat, d_y: gfloat) -> Rect` | graphene_rect_offset | 1.0 | Offsets the origin by @d_x and @d_y. The size of the rectangle is unchanged. |
| offset_r | `Rect.offset_r(d_x: gfloat, d_y: gfloat, res: out Rect) -> none` | graphene_rect_offset_r | 1.4 | Offsets the origin of the given rectangle by @d_x and @d_y. The size of the rectangle is left unchanged. |
| round | `Rect.round(res: out Rect) -> none` | graphene_rect_round | 1.4 | Rounds the origin and size of the given rectangle to their nearest integer values; the rounding is guaranteed to be large enough to have an area bi... |
| round_extents | `Rect.round_extents(res: out Rect) -> none` | graphene_rect_round_extents | 1.10 | Rounds the origin of the given rectangle to its nearest integer value and and recompute the size so that the rectangle is large enough to contain a... |
| round_to_pixel | `Rect.round_to_pixel() -> Rect` | graphene_rect_round_to_pixel | 1.0 | Rounds the origin and the size of the given rectangle to their nearest integer values; the rounding is guaranteed to be large enough to contain the... |
| scale | `Rect.scale(s_h: gfloat, s_v: gfloat, res: out Rect) -> none` | graphene_rect_scale | 1.10 | Scales the size and origin of a rectangle horizontaly by @s_h, and vertically by @s_v. The result @res is normalized. |
| union | `Rect.union(b: Rect, res: out Rect) -> none` | graphene_rect_union | 1.0 | Computes the union of the two given rectangles. ! The union in the image above is the blue outline. |

### Graphene.Simd4F

C type: `graphene_simd4f_t`

#### Fields

| Field | Type |
| --- | --- |
| w | gfloat |
| x | gfloat |
| y | gfloat |
| z | gfloat |

### Graphene.Simd4X4F

C type: `graphene_simd4x4f_t`

#### Fields

| Field | Type |
| --- | --- |
| w | Simd4F |
| x | Simd4F |
| y | Simd4F |
| z | Simd4F |

### Graphene.Size

GType: `GrapheneSize` ?? C type: `graphene_size_t`

A size.

#### Fields

| Field | Type |
| --- | --- |
| height | gfloat |
| width | gfloat |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `Size.alloc() -> Size` | graphene_size_alloc | 1.0 | Allocates a new #graphene_size_t. The contents of the returned value are undefined. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| zero | `zero() -> Size` | graphene_size_zero | 1.0 | A constant pointer to a zero #graphene_size_t, useful for equality checks and interpolations. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| equal | `Size.equal(b: Size) -> gboolean` | graphene_size_equal | 1.0 | Checks whether the two give #graphene_size_t are equal. |
| free | `Size.free() -> none` | graphene_size_free | 1.0 | Frees the resources allocated by graphene_size_alloc(). |
| init | `Size.init(width: gfloat, height: gfloat) -> Size` | graphene_size_init | 1.0 | Initializes a #graphene_size_t using the given @width and @height. |
| init_from_size | `Size.init_from_size(src: Size) -> Size` | graphene_size_init_from_size | 1.0 | Initializes a #graphene_size_t using the width and height of the given @src. |
| interpolate | `Size.interpolate(b: Size, factor: gdouble, res: out Size) -> none` | graphene_size_interpolate | 1.0 | Linearly interpolates the two given #graphene_size_t using the given interpolation @factor. |
| scale | `Size.scale(factor: gfloat, res: out Size) -> none` | graphene_size_scale | 1.0 | Scales the components of a #graphene_size_t using the given @factor. |

### Graphene.Sphere

GType: `GrapheneSphere` ?? C type: `graphene_sphere_t`

A sphere, represented by its center and radius.

#### Fields

| Field | Type |
| --- | --- |
| center | Vec3 |
| radius | gfloat |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `Sphere.alloc() -> Sphere` | graphene_sphere_alloc | 1.2 | Allocates a new #graphene_sphere_t. The contents of the newly allocated structure are undefined. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| contains_point | `Sphere.contains_point(point: Point3D) -> gboolean` | graphene_sphere_contains_point | 1.2 | Checks whether the given @point is contained in the volume of a #graphene_sphere_t. |
| distance | `Sphere.distance(point: Point3D) -> gfloat` | graphene_sphere_distance | 1.2 | Computes the distance of the given @point from the surface of a #graphene_sphere_t. |
| equal | `Sphere.equal(b: Sphere) -> gboolean` | graphene_sphere_equal | 1.2 | Checks whether two #graphene_sphere_t are equal. |
| free | `Sphere.free() -> none` | graphene_sphere_free | 1.2 | Frees the resources allocated by graphene_sphere_alloc(). |
| get_bounding_box | `Sphere.get_bounding_box(box: out Box) -> none` | graphene_sphere_get_bounding_box | 1.2 | Computes the bounding box capable of containing the given #graphene_sphere_t. |
| get_center | `Sphere.get_center(center: out Point3D) -> none` | graphene_sphere_get_center | 1.2 | Retrieves the coordinates of the center of a #graphene_sphere_t. |
| get_radius | `Sphere.get_radius() -> gfloat` | graphene_sphere_get_radius | 1.2 | Retrieves the radius of a #graphene_sphere_t. |
| init | `Sphere.init(center: Point3D?, radius: gfloat) -> Sphere` | graphene_sphere_init | 1.2 | Initializes the given #graphene_sphere_t with the given @center and @radius. |
| init_from_points | `Sphere.init_from_points(n_points: guint, points: Point3D, center: Point3D?) -> Sphere` | graphene_sphere_init_from_points | 1.2 | Initializes the given #graphene_sphere_t using the given array of 3D coordinates so that the sphere includes them. The center of the sphere can eit... |
| init_from_vectors | `Sphere.init_from_vectors(n_vectors: guint, vectors: Vec3, center: Point3D?) -> Sphere` | graphene_sphere_init_from_vectors | 1.2 | Initializes the given #graphene_sphere_t using the given array of 3D coordinates so that the sphere includes them. The center of the sphere can eit... |
| is_empty | `Sphere.is_empty() -> gboolean` | graphene_sphere_is_empty | 1.2 | Checks whether the sphere has a zero radius. |
| translate | `Sphere.translate(point: Point3D, res: out Sphere) -> none` | graphene_sphere_translate | 1.2 | Translates the center of the given #graphene_sphere_t using the @point coordinates as the delta of the translation. |

### Graphene.Triangle

GType: `GrapheneTriangle` ?? C type: `graphene_triangle_t`

A triangle.

#### Fields

| Field | Type |
| --- | --- |
| a | Vec3 |
| b | Vec3 |
| c | Vec3 |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `Triangle.alloc() -> Triangle` | graphene_triangle_alloc | 1.2 | Allocates a new #graphene_triangle_t. The contents of the returned structure are undefined. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| contains_point | `Triangle.contains_point(p: Point3D) -> gboolean` | graphene_triangle_contains_point | 1.2 | Checks whether the given triangle @t contains the point @p. |
| equal | `Triangle.equal(b: Triangle) -> gboolean` | graphene_triangle_equal | 1.2 | Checks whether the two given #graphene_triangle_t are equal. |
| free | `Triangle.free() -> none` | graphene_triangle_free | 1.2 | Frees the resources allocated by graphene_triangle_alloc(). |
| get_area | `Triangle.get_area() -> gfloat` | graphene_triangle_get_area | 1.2 | Computes the area of the given #graphene_triangle_t. |
| get_barycoords | `Triangle.get_barycoords(p: Point3D?, res: out Vec2) -> gboolean` | graphene_triangle_get_barycoords | 1.2 | Computes the barycentric coordinates of the given point @p. The point @p must lie on the same plane as the triangle @t; if the point is not coplana... |
| get_bounding_box | `Triangle.get_bounding_box(res: out Box) -> none` | graphene_triangle_get_bounding_box | 1.2 | Computes the bounding box of the given #graphene_triangle_t. |
| get_midpoint | `Triangle.get_midpoint(res: out Point3D) -> none` | graphene_triangle_get_midpoint | 1.2 | Computes the coordinates of the midpoint of the given #graphene_triangle_t. The midpoint G is the centroid of the triangle, i.e. the intersection o... |
| get_normal | `Triangle.get_normal(res: out Vec3) -> none` | graphene_triangle_get_normal | 1.2 | Computes the normal vector of the given #graphene_triangle_t. |
| get_plane | `Triangle.get_plane(res: out Plane) -> none` | graphene_triangle_get_plane | 1.2 | Computes the plane based on the vertices of the given #graphene_triangle_t. |
| get_points | `Triangle.get_points(a: out Point3D?, b: out Point3D?, c: out Point3D?) -> none` | graphene_triangle_get_points | 1.2 | Retrieves the three vertices of the given #graphene_triangle_t and returns their coordinates as #graphene_point3d_t. |
| get_uv | `Triangle.get_uv(p: Point3D?, uv_a: Vec2, uv_b: Vec2, uv_c: Vec2, res: out Vec2) -> gboolean` | graphene_triangle_get_uv | 1.10 | Computes the UV coordinates of the given point @p. The point @p must lie on the same plane as the triangle @t; if the point is not coplanar, the re... |
| get_vertices | `Triangle.get_vertices(a: out Vec3?, b: out Vec3?, c: out Vec3?) -> none` | graphene_triangle_get_vertices | 1.2 | Retrieves the three vertices of the given #graphene_triangle_t. |
| init_from_float | `Triangle.init_from_float(a: gfloat, b: gfloat, c: gfloat) -> Triangle` | graphene_triangle_init_from_float | 1.10 | Initializes a #graphene_triangle_t using the three given arrays of floating point values, each representing the coordinates of a point in 3D space. |
| init_from_point3d | `Triangle.init_from_point3d(a: Point3D?, b: Point3D?, c: Point3D?) -> Triangle` | graphene_triangle_init_from_point3d | 1.2 | Initializes a #graphene_triangle_t using the three given 3D points. |
| init_from_vec3 | `Triangle.init_from_vec3(a: Vec3?, b: Vec3?, c: Vec3?) -> Triangle` | graphene_triangle_init_from_vec3 | 1.2 | Initializes a #graphene_triangle_t using the three given vectors. |

### Graphene.Vec2

GType: `GrapheneVec2` ?? C type: `graphene_vec2_t`

A structure capable of holding a vector with two dimensions, x and y. The contents of the #graphene_vec2_t structure are private and should never b...

#### Fields

| Field | Type |
| --- | --- |
| value | Simd4F |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `Vec2.alloc() -> Vec2` | graphene_vec2_alloc | 1.0 | Allocates a new #graphene_vec2_t structure. The contents of the returned structure are undefined. Use graphene_vec2_init() to initialize the vector. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| one | `one() -> Vec2` | graphene_vec2_one | 1.0 | Retrieves a constant vector with (1, 1) components. |
| x_axis | `x_axis() -> Vec2` | graphene_vec2_x_axis | 1.0 | Retrieves a constant vector with (1, 0) components. |
| y_axis | `y_axis() -> Vec2` | graphene_vec2_y_axis | 1.0 | Retrieves a constant vector with (0, 1) components. |
| zero | `zero() -> Vec2` | graphene_vec2_zero | 1.0 | Retrieves a constant vector with (0, 0) components. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `Vec2.add(b: Vec2, res: out Vec2) -> none` | graphene_vec2_add | 1.0 | Adds each component of the two passed vectors and places each result into the components of @res. |
| divide | `Vec2.divide(b: Vec2, res: out Vec2) -> none` | graphene_vec2_divide | 1.0 | Divides each component of the first operand @a by the corresponding component of the second operand @b, and places the results into the vector @res. |
| dot | `Vec2.dot(b: Vec2) -> gfloat` | graphene_vec2_dot | 1.0 | Computes the dot product of the two given vectors. |
| equal | `Vec2.equal(v2: Vec2) -> gboolean` | graphene_vec2_equal | 1.2 | Checks whether the two given #graphene_vec2_t are equal. |
| free | `Vec2.free() -> none` | graphene_vec2_free | 1.0 | Frees the resources allocated by @v |
| get_x | `Vec2.get_x() -> gfloat` | graphene_vec2_get_x | 1.0 | Retrieves the X component of the #graphene_vec2_t. |
| get_y | `Vec2.get_y() -> gfloat` | graphene_vec2_get_y | 1.0 | Retrieves the Y component of the #graphene_vec2_t. |
| init | `Vec2.init(x: gfloat, y: gfloat) -> Vec2` | graphene_vec2_init | 1.0 | Initializes a #graphene_vec2_t using the given values. This function can be called multiple times. |
| init_from_float | `Vec2.init_from_float(src: gfloat) -> Vec2` | graphene_vec2_init_from_float | 1.0 | Initializes @v with the contents of the given array. |
| init_from_vec2 | `Vec2.init_from_vec2(src: Vec2) -> Vec2` | graphene_vec2_init_from_vec2 | 1.0 | Copies the contents of @src into @v. |
| interpolate | `Vec2.interpolate(v2: Vec2, factor: gdouble, res: out Vec2) -> none` | graphene_vec2_interpolate | 1.10 | Linearly interpolates @v1 and @v2 using the given @factor. |
| length | `Vec2.length() -> gfloat` | graphene_vec2_length | 1.0 | Computes the length of the given vector. |
| max | `Vec2.max(b: Vec2, res: out Vec2) -> none` | graphene_vec2_max | 1.0 | Compares the two given vectors and places the maximum values of each component into @res. |
| min | `Vec2.min(b: Vec2, res: out Vec2) -> none` | graphene_vec2_min | 1.0 | Compares the two given vectors and places the minimum values of each component into @res. |
| multiply | `Vec2.multiply(b: Vec2, res: out Vec2) -> none` | graphene_vec2_multiply | 1.0 | Multiplies each component of the two passed vectors and places each result into the components of @res. |
| near | `Vec2.near(v2: Vec2, epsilon: gfloat) -> gboolean` | graphene_vec2_near | 1.2 | Compares the two given #graphene_vec2_t vectors and checks whether their values are within the given @epsilon. |
| negate | `Vec2.negate(res: out Vec2) -> none` | graphene_vec2_negate | 1.2 | Negates the given #graphene_vec2_t. |
| normalize | `Vec2.normalize(res: out Vec2) -> none` | graphene_vec2_normalize | 1.0 | Computes the normalized vector for the given vector @v. |
| scale | `Vec2.scale(factor: gfloat, res: out Vec2) -> none` | graphene_vec2_scale | 1.2 | Multiplies all components of the given vector with the given scalar @factor. |
| subtract | `Vec2.subtract(b: Vec2, res: out Vec2) -> none` | graphene_vec2_subtract | 1.0 | Subtracts from each component of the first operand @a the corresponding component of the second operand @b and places each result into the componen... |
| to_float | `Vec2.to_float(dest: out gfloat) -> none` | graphene_vec2_to_float | 1.0 | Stores the components of @v into an array. |

### Graphene.Vec3

GType: `GrapheneVec3` ?? C type: `graphene_vec3_t`

A structure capable of holding a vector with three dimensions: x, y, and z. The contents of the #graphene_vec3_t structure are private and should n...

#### Fields

| Field | Type |
| --- | --- |
| value | Simd4F |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `Vec3.alloc() -> Vec3` | graphene_vec3_alloc | 1.0 | Allocates a new #graphene_vec3_t structure. The contents of the returned structure are undefined. Use graphene_vec3_init() to initialize the vector. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| one | `one() -> Vec3` | graphene_vec3_one | 1.0 | Provides a constant pointer to a vector with three components, all sets to 1. |
| x_axis | `x_axis() -> Vec3` | graphene_vec3_x_axis | 1.0 | Provides a constant pointer to a vector with three components with values set to (1, 0, 0). |
| y_axis | `y_axis() -> Vec3` | graphene_vec3_y_axis | 1.0 | Provides a constant pointer to a vector with three components with values set to (0, 1, 0). |
| z_axis | `z_axis() -> Vec3` | graphene_vec3_z_axis | 1.0 | Provides a constant pointer to a vector with three components with values set to (0, 0, 1). |
| zero | `zero() -> Vec3` | graphene_vec3_zero | 1.0 | Provides a constant pointer to a vector with three components, all sets to 0. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `Vec3.add(b: Vec3, res: out Vec3) -> none` | graphene_vec3_add | 1.0 | Adds each component of the two given vectors. |
| cross | `Vec3.cross(b: Vec3, res: out Vec3) -> none` | graphene_vec3_cross | 1.0 | Computes the cross product of the two given vectors. |
| divide | `Vec3.divide(b: Vec3, res: out Vec3) -> none` | graphene_vec3_divide | 1.0 | Divides each component of the first operand @a by the corresponding component of the second operand @b, and places the results into the vector @res. |
| dot | `Vec3.dot(b: Vec3) -> gfloat` | graphene_vec3_dot | 1.0 | Computes the dot product of the two given vectors. |
| equal | `Vec3.equal(v2: Vec3) -> gboolean` | graphene_vec3_equal | 1.2 | Checks whether the two given #graphene_vec3_t are equal. |
| free | `Vec3.free() -> none` | graphene_vec3_free | 1.0 | Frees the resources allocated by @v |
| get_x | `Vec3.get_x() -> gfloat` | graphene_vec3_get_x | 1.0 | Retrieves the first component of the given vector @v. |
| get_xy | `Vec3.get_xy(res: out Vec2) -> none` | graphene_vec3_get_xy | 1.0 | Creates a #graphene_vec2_t that contains the first and second components of the given #graphene_vec3_t. |
| get_xy0 | `Vec3.get_xy0(res: out Vec3) -> none` | graphene_vec3_get_xy0 | 1.0 | Creates a #graphene_vec3_t that contains the first two components of the given #graphene_vec3_t, and the third component set to 0. |
| get_xyz0 | `Vec3.get_xyz0(res: out Vec4) -> none` | graphene_vec3_get_xyz0 | 1.0 | Converts a #graphene_vec3_t in a #graphene_vec4_t using 0.0 as the value for the fourth component of the resulting vector. |
| get_xyz1 | `Vec3.get_xyz1(res: out Vec4) -> none` | graphene_vec3_get_xyz1 | 1.0 | Converts a #graphene_vec3_t in a #graphene_vec4_t using 1.0 as the value for the fourth component of the resulting vector. |
| get_xyzw | `Vec3.get_xyzw(w: gfloat, res: out Vec4) -> none` | graphene_vec3_get_xyzw | 1.0 | Converts a #graphene_vec3_t in a #graphene_vec4_t using @w as the value of the fourth component of the resulting vector. |
| get_y | `Vec3.get_y() -> gfloat` | graphene_vec3_get_y | 1.0 | Retrieves the second component of the given vector @v. |
| get_z | `Vec3.get_z() -> gfloat` | graphene_vec3_get_z | 1.0 | Retrieves the third component of the given vector @v. |
| init | `Vec3.init(x: gfloat, y: gfloat, z: gfloat) -> Vec3` | graphene_vec3_init | 1.0 | Initializes a #graphene_vec3_t using the given values. This function can be called multiple times. |
| init_from_float | `Vec3.init_from_float(src: gfloat) -> Vec3` | graphene_vec3_init_from_float | 1.0 | Initializes a #graphene_vec3_t with the values from an array. |
| init_from_vec3 | `Vec3.init_from_vec3(src: Vec3) -> Vec3` | graphene_vec3_init_from_vec3 | 1.0 | Initializes a #graphene_vec3_t with the values of another #graphene_vec3_t. |
| interpolate | `Vec3.interpolate(v2: Vec3, factor: gdouble, res: out Vec3) -> none` | graphene_vec3_interpolate | 1.10 | Linearly interpolates @v1 and @v2 using the given @factor. |
| length | `Vec3.length() -> gfloat` | graphene_vec3_length | 1.0 | Retrieves the length of the given vector @v. |
| max | `Vec3.max(b: Vec3, res: out Vec3) -> none` | graphene_vec3_max | 1.0 | Compares each component of the two given vectors and creates a vector that contains the maximum values. |
| min | `Vec3.min(b: Vec3, res: out Vec3) -> none` | graphene_vec3_min | 1.0 | Compares each component of the two given vectors and creates a vector that contains the minimum values. |
| multiply | `Vec3.multiply(b: Vec3, res: out Vec3) -> none` | graphene_vec3_multiply | 1.0 | Multiplies each component of the two given vectors. |
| near | `Vec3.near(v2: Vec3, epsilon: gfloat) -> gboolean` | graphene_vec3_near | 1.2 | Compares the two given #graphene_vec3_t vectors and checks whether their values are within the given @epsilon. |
| negate | `Vec3.negate(res: out Vec3) -> none` | graphene_vec3_negate | 1.2 | Negates the given #graphene_vec3_t. |
| normalize | `Vec3.normalize(res: out Vec3) -> none` | graphene_vec3_normalize | 1.0 | Normalizes the given #graphene_vec3_t. |
| scale | `Vec3.scale(factor: gfloat, res: out Vec3) -> none` | graphene_vec3_scale | 1.2 | Multiplies all components of the given vector with the given scalar @factor. |
| subtract | `Vec3.subtract(b: Vec3, res: out Vec3) -> none` | graphene_vec3_subtract | 1.0 | Subtracts from each component of the first operand @a the corresponding component of the second operand @b and places each result into the componen... |
| to_float | `Vec3.to_float(dest: out gfloat) -> none` | graphene_vec3_to_float | 1.0 | Copies the components of a #graphene_vec3_t into the given array. |

### Graphene.Vec4

GType: `GrapheneVec4` ?? C type: `graphene_vec4_t`

A structure capable of holding a vector with four dimensions: x, y, z, and w. The contents of the #graphene_vec4_t structure are private and should...

#### Fields

| Field | Type |
| --- | --- |
| value | Simd4F |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| alloc | `Vec4.alloc() -> Vec4` | graphene_vec4_alloc | 1.0 | Allocates a new #graphene_vec4_t structure. The contents of the returned structure are undefined. Use graphene_vec4_init() to initialize the vector. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| one | `one() -> Vec4` | graphene_vec4_one | 1.0 | Retrieves a pointer to a #graphene_vec4_t with all its components set to 1. |
| w_axis | `w_axis() -> Vec4` | graphene_vec4_w_axis | 1.0 | Retrieves a pointer to a #graphene_vec4_t with its components set to (0, 0, 0, 1). |
| x_axis | `x_axis() -> Vec4` | graphene_vec4_x_axis | 1.0 | Retrieves a pointer to a #graphene_vec4_t with its components set to (1, 0, 0, 0). |
| y_axis | `y_axis() -> Vec4` | graphene_vec4_y_axis | 1.0 | Retrieves a pointer to a #graphene_vec4_t with its components set to (0, 1, 0, 0). |
| z_axis | `z_axis() -> Vec4` | graphene_vec4_z_axis | 1.0 | Retrieves a pointer to a #graphene_vec4_t with its components set to (0, 0, 1, 0). |
| zero | `zero() -> Vec4` | graphene_vec4_zero | 1.0 | Retrieves a pointer to a #graphene_vec4_t with all its components set to 0. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `Vec4.add(b: Vec4, res: out Vec4) -> none` | graphene_vec4_add | 1.0 | Adds each component of the two given vectors. |
| divide | `Vec4.divide(b: Vec4, res: out Vec4) -> none` | graphene_vec4_divide | 1.0 | Divides each component of the first operand @a by the corresponding component of the second operand @b, and places the results into the vector @res. |
| dot | `Vec4.dot(b: Vec4) -> gfloat` | graphene_vec4_dot | 1.0 | Computes the dot product of the two given vectors. |
| equal | `Vec4.equal(v2: Vec4) -> gboolean` | graphene_vec4_equal | 1.2 | Checks whether the two given #graphene_vec4_t are equal. |
| free | `Vec4.free() -> none` | graphene_vec4_free | 1.0 | Frees the resources allocated by @v |
| get_w | `Vec4.get_w() -> gfloat` | graphene_vec4_get_w | 1.0 | Retrieves the value of the fourth component of the given #graphene_vec4_t. |
| get_x | `Vec4.get_x() -> gfloat` | graphene_vec4_get_x | 1.0 | Retrieves the value of the first component of the given #graphene_vec4_t. |
| get_xy | `Vec4.get_xy(res: out Vec2) -> none` | graphene_vec4_get_xy | 1.0 | Creates a #graphene_vec2_t that contains the first two components of the given #graphene_vec4_t. |
| get_xyz | `Vec4.get_xyz(res: out Vec3) -> none` | graphene_vec4_get_xyz | 1.0 | Creates a #graphene_vec3_t that contains the first three components of the given #graphene_vec4_t. |
| get_y | `Vec4.get_y() -> gfloat` | graphene_vec4_get_y | 1.0 | Retrieves the value of the second component of the given #graphene_vec4_t. |
| get_z | `Vec4.get_z() -> gfloat` | graphene_vec4_get_z | 1.0 | Retrieves the value of the third component of the given #graphene_vec4_t. |
| init | `Vec4.init(x: gfloat, y: gfloat, z: gfloat, w: gfloat) -> Vec4` | graphene_vec4_init | 1.0 | Initializes a #graphene_vec4_t using the given values. This function can be called multiple times. |
| init_from_float | `Vec4.init_from_float(src: gfloat) -> Vec4` | graphene_vec4_init_from_float | 1.0 | Initializes a #graphene_vec4_t with the values inside the given array. |
| init_from_vec2 | `Vec4.init_from_vec2(src: Vec2, z: gfloat, w: gfloat) -> Vec4` | graphene_vec4_init_from_vec2 | 1.0 | Initializes a #graphene_vec4_t using the components of a #graphene_vec2_t and the values of @z and @w. |
| init_from_vec3 | `Vec4.init_from_vec3(src: Vec3, w: gfloat) -> Vec4` | graphene_vec4_init_from_vec3 | 1.0 | Initializes a #graphene_vec4_t using the components of a #graphene_vec3_t and the value of @w. |
| init_from_vec4 | `Vec4.init_from_vec4(src: Vec4) -> Vec4` | graphene_vec4_init_from_vec4 | 1.0 | Initializes a #graphene_vec4_t using the components of another #graphene_vec4_t. |
| interpolate | `Vec4.interpolate(v2: Vec4, factor: gdouble, res: out Vec4) -> none` | graphene_vec4_interpolate | 1.10 | Linearly interpolates @v1 and @v2 using the given @factor. |
| length | `Vec4.length() -> gfloat` | graphene_vec4_length | 1.0 | Computes the length of the given #graphene_vec4_t. |
| max | `Vec4.max(b: Vec4, res: out Vec4) -> none` | graphene_vec4_max | 1.0 | Compares each component of the two given vectors and creates a vector that contains the maximum values. |
| min | `Vec4.min(b: Vec4, res: out Vec4) -> none` | graphene_vec4_min | 1.0 | Compares each component of the two given vectors and creates a vector that contains the minimum values. |
| multiply | `Vec4.multiply(b: Vec4, res: out Vec4) -> none` | graphene_vec4_multiply | 1.0 | Multiplies each component of the two given vectors. |
| near | `Vec4.near(v2: Vec4, epsilon: gfloat) -> gboolean` | graphene_vec4_near | 1.2 | Compares the two given #graphene_vec4_t vectors and checks whether their values are within the given @epsilon. |
| negate | `Vec4.negate(res: out Vec4) -> none` | graphene_vec4_negate | 1.2 | Negates the given #graphene_vec4_t. |
| normalize | `Vec4.normalize(res: out Vec4) -> none` | graphene_vec4_normalize | 1.0 | Normalizes the given #graphene_vec4_t. |
| scale | `Vec4.scale(factor: gfloat, res: out Vec4) -> none` | graphene_vec4_scale | 1.2 | Multiplies all components of the given vector with the given scalar @factor. |
| subtract | `Vec4.subtract(b: Vec4, res: out Vec4) -> none` | graphene_vec4_subtract | 1.0 | Subtracts from each component of the first operand @a the corresponding component of the second operand @b and places each result into the componen... |
| to_float | `Vec4.to_float(dest: out gfloat) -> none` | graphene_vec4_to_float | 1.0 | Stores the components of the given #graphene_vec4_t into an array of floating point values. |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| box_empty | `box_empty() -> Box` | graphene_box_empty | 1.2 | A degenerate #graphene_box_t that can only be expanded. The returned value is owned by Graphene and should not be modified or freed. |
| box_infinite | `box_infinite() -> Box` | graphene_box_infinite | 1.2 | A degenerate #graphene_box_t that cannot be expanded. The returned value is owned by Graphene and should not be modified or freed. |
| box_minus_one | `box_minus_one() -> Box` | graphene_box_minus_one | 1.2 | A #graphene_box_t with the minimum vertex set at (-1, -1, -1) and the maximum vertex set at (0, 0, 0). The returned value is owned by Graphene and ... |
| box_one | `box_one() -> Box` | graphene_box_one | 1.2 | A #graphene_box_t with the minimum vertex set at (0, 0, 0) and the maximum vertex set at (1, 1, 1). The returned value is owned by Graphene and sho... |
| box_one_minus_one | `box_one_minus_one() -> Box` | graphene_box_one_minus_one | 1.2 | A #graphene_box_t with the minimum vertex set at (-1, -1, -1) and the maximum vertex set at (1, 1, 1). The returned value is owned by Graphene and ... |
| box_zero | `box_zero() -> Box` | graphene_box_zero | 1.2 | A #graphene_box_t with both the minimum and maximum vertices set at (0, 0, 0). The returned value is owned by Graphene and should not be modified o... |
| point3d_zero | `point3d_zero() -> Point3D` | graphene_point3d_zero | 1.0 | Retrieves a constant point with all three coordinates set to 0. |
| point_zero | `point_zero() -> Point` | graphene_point_zero | 1.0 | Returns a point fixed at (0, 0). |
| rect_alloc | `rect_alloc() -> Rect` | graphene_rect_alloc | 1.0 | Allocates a new #graphene_rect_t. The contents of the returned rectangle are undefined. |
| rect_zero | `rect_zero() -> Rect` | graphene_rect_zero | 1.4 | Returns a degenerate rectangle with origin fixed at (0, 0) and a size of 0, 0. |
| size_zero | `size_zero() -> Size` | graphene_size_zero | 1.0 | A constant pointer to a zero #graphene_size_t, useful for equality checks and interpolations. |
| vec2_one | `vec2_one() -> Vec2` | graphene_vec2_one | 1.0 | Retrieves a constant vector with (1, 1) components. |
| vec2_x_axis | `vec2_x_axis() -> Vec2` | graphene_vec2_x_axis | 1.0 | Retrieves a constant vector with (1, 0) components. |
| vec2_y_axis | `vec2_y_axis() -> Vec2` | graphene_vec2_y_axis | 1.0 | Retrieves a constant vector with (0, 1) components. |
| vec2_zero | `vec2_zero() -> Vec2` | graphene_vec2_zero | 1.0 | Retrieves a constant vector with (0, 0) components. |
| vec3_one | `vec3_one() -> Vec3` | graphene_vec3_one | 1.0 | Provides a constant pointer to a vector with three components, all sets to 1. |
| vec3_x_axis | `vec3_x_axis() -> Vec3` | graphene_vec3_x_axis | 1.0 | Provides a constant pointer to a vector with three components with values set to (1, 0, 0). |
| vec3_y_axis | `vec3_y_axis() -> Vec3` | graphene_vec3_y_axis | 1.0 | Provides a constant pointer to a vector with three components with values set to (0, 1, 0). |
| vec3_z_axis | `vec3_z_axis() -> Vec3` | graphene_vec3_z_axis | 1.0 | Provides a constant pointer to a vector with three components with values set to (0, 0, 1). |
| vec3_zero | `vec3_zero() -> Vec3` | graphene_vec3_zero | 1.0 | Provides a constant pointer to a vector with three components, all sets to 0. |
| vec4_one | `vec4_one() -> Vec4` | graphene_vec4_one | 1.0 | Retrieves a pointer to a #graphene_vec4_t with all its components set to 1. |
| vec4_w_axis | `vec4_w_axis() -> Vec4` | graphene_vec4_w_axis | 1.0 | Retrieves a pointer to a #graphene_vec4_t with its components set to (0, 0, 0, 1). |
| vec4_x_axis | `vec4_x_axis() -> Vec4` | graphene_vec4_x_axis | 1.0 | Retrieves a pointer to a #graphene_vec4_t with its components set to (1, 0, 0, 0). |
| vec4_y_axis | `vec4_y_axis() -> Vec4` | graphene_vec4_y_axis | 1.0 | Retrieves a pointer to a #graphene_vec4_t with its components set to (0, 1, 0, 0). |
| vec4_z_axis | `vec4_z_axis() -> Vec4` | graphene_vec4_z_axis | 1.0 | Retrieves a pointer to a #graphene_vec4_t with its components set to (0, 0, 1, 0). |
| vec4_zero | `vec4_zero() -> Vec4` | graphene_vec4_zero | 1.0 | Retrieves a pointer to a #graphene_vec4_t with all its components set to 0. |

## Constants

| Name | Type |
| --- | --- |
| PI | gdouble |
| PI_2 | gdouble |
| VEC2_LEN | gint |
| VEC3_LEN | gint |
| VEC4_LEN | gint |

