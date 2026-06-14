# Gsk 4.0

SQGI import: `import("Gsk", "4.0")`

Packages: `gtk4`
Includes: `Gdk-4.0`, `Graphene-1.0`
Libraries: `libgtk-4.so.1`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 38 |
| Interfaces | 0 |
| Records | 17 |
| Unions | 1 |
| Enums | 13 |
| Flags | 1 |
| Functions | 8 |
| Callbacks | 2 |
| Constants | 0 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| BlendNode | RenderNode | 0 | 0 | 4 | A render node applying a blending function between its two child nodes. |
| BlurNode | RenderNode | 0 | 0 | 3 | A render node applying a blur effect to its single child. |
| BorderNode | RenderNode | 0 | 0 | 4 | A render node for a border. |
| BroadwayRenderer | Renderer | 0 | 0 | 1 | Creates a new Broadway renderer. The Broadway renderer is the default renderer for the broadway backend. It will only work with broadway surfaces, ... |
| CairoNode | RenderNode | 0 | 0 | 3 | A render node for a Cairo surface. |
| CairoRenderer | Renderer | 0 | 0 | 1 | A GSK renderer that is using cairo. Since it is using cairo, this renderer cannot support 3D transformations. |
| ClipNode | RenderNode | 0 | 0 | 3 | A render node applying a rectangular clip to its single child node. |
| ColorMatrixNode | RenderNode | 0 | 0 | 4 | A render node controlling the color matrix of its single child node. |
| ColorNode | RenderNode | 0 | 0 | 2 | A render node for a solid color. |
| ConicGradientNode | RenderNode | 0 | 0 | 6 | A render node for a conic gradient. |
| ContainerNode | RenderNode | 0 | 0 | 3 | A render node that can contain other render nodes. |
| CrossFadeNode | RenderNode | 0 | 0 | 4 | A render node cross fading between two child nodes. |
| DebugNode | RenderNode | 0 | 0 | 3 | A render node that emits a debugging message when drawing its child node. |
| FillNode | RenderNode | 0 | 0 | 4 | A render node filling the area given by [struct@Gsk.Path] and [enum@Gsk.FillRule] with the child node. |
| GLRenderer | Renderer | 0 | 0 | 1 | Creates a new `GskRenderer` using the new OpenGL renderer. |
| GLShader | GObject.Object | 0 | 0 | 21 | A `GskGLShader` is a snippet of GLSL that is meant to run in the fragment shader of the rendering pipeline. A fragment shader gets the coordinates ... |
| GLShaderNode | RenderNode | 0 | 0 | 5 | A render node using a GL shader when drawing its children nodes. |
| InsetShadowNode | RenderNode | 0 | 0 | 7 | A render node for an inset shadow. |
| LinearGradientNode | RenderNode | 0 | 0 | 5 | A render node for a linear gradient. |
| MaskNode | RenderNode | 0 | 0 | 4 | A render node masking one child node with another. |
| NglRenderer | Renderer | 0 | 0 | 1 |  |
| OpacityNode | RenderNode | 0 | 0 | 3 | A render node controlling the opacity of its single child node. |
| OutsetShadowNode | RenderNode | 0 | 0 | 7 | A render node for an outset shadow. |
| RadialGradientNode | RenderNode | 0 | 0 | 8 | A render node for a radial gradient. |
| Renderer | GObject.Object | 5 | 0 | 8 | `GskRenderer` is a class that renders a scene graph defined via a tree of [class@Gsk.RenderNode] instances. Typically you will use a `GskRenderer` ... |
| RenderNode |  | 30 | 0 | 8 | `GskRenderNode` is the basic block in a scene graph to be rendered using [class@Gsk.Renderer]. Each node has a parent, except the top-level node; e... |
| RepeatingLinearGradientNode | RenderNode | 0 | 0 | 1 | A render node for a repeating linear gradient. |
| RepeatingRadialGradientNode | RenderNode | 0 | 0 | 1 | A render node for a repeating radial gradient. |
| RepeatNode | RenderNode | 0 | 0 | 3 | A render node repeating its single child node. |
| RoundedClipNode | RenderNode | 0 | 0 | 3 | A render node applying a rounded rectangle clip to its single child. |
| ShadowNode | RenderNode | 0 | 0 | 4 | A render node drawing one or more shadows behind its single child node. |
| StrokeNode | RenderNode | 0 | 0 | 4 | A render node that will fill the area determined by stroking the the given [struct@Gsk.Path] using the [struct@Gsk.Stroke] attributes. |
| SubsurfaceNode | RenderNode | 0 | 0 | 3 | A render node that potentially diverts a part of the scene graph to a subsurface. |
| TextNode | RenderNode | 0 | 0 | 7 | A render node drawing a set of glyphs. |
| TextureNode | RenderNode | 0 | 0 | 2 | A render node for a `GdkTexture`. |
| TextureScaleNode | RenderNode | 0 | 0 | 3 | A render node for a `GdkTexture`. |
| TransformNode | RenderNode | 0 | 0 | 3 | A render node applying a `GskTransform` to its single child node. |
| VulkanRenderer | Renderer | 0 | 0 | 1 | A GSK renderer that is using Vulkan. This renderer will fail to realize if Vulkan is not supported. |

### Gsk.BlendNode

Parent: `RenderNode` ?? GType: `GskBlendNode` ?? C type: `GskBlendNode`

A render node applying a blending function between its two child nodes.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `BlendNode.new(bottom: RenderNode, top: RenderNode, blend_mode: BlendMode) -> BlendNode` | gsk_blend_node_new |  | Creates a `GskRenderNode` that will use @blend_mode to blend the @top node onto the @bottom node. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_blend_mode | `BlendNode.get_blend_mode() -> BlendMode` | gsk_blend_node_get_blend_mode |  | Retrieves the blend mode used by @node. |
| get_bottom_child | `BlendNode.get_bottom_child() -> RenderNode` | gsk_blend_node_get_bottom_child |  | Retrieves the bottom `GskRenderNode` child of the @node. |
| get_top_child | `BlendNode.get_top_child() -> RenderNode` | gsk_blend_node_get_top_child |  | Retrieves the top `GskRenderNode` child of the @node. |

### Gsk.BlurNode

Parent: `RenderNode` ?? GType: `GskBlurNode` ?? C type: `GskBlurNode`

A render node applying a blur effect to its single child.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `BlurNode.new(child: RenderNode, radius: gfloat) -> BlurNode` | gsk_blur_node_new |  | Creates a render node that blurs the child. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_child | `BlurNode.get_child() -> RenderNode` | gsk_blur_node_get_child |  | Retrieves the child `GskRenderNode` of the blur @node. |
| get_radius | `BlurNode.get_radius() -> gfloat` | gsk_blur_node_get_radius |  | Retrieves the blur radius of the @node. |

### Gsk.BorderNode

Parent: `RenderNode` ?? GType: `GskBorderNode` ?? C type: `GskBorderNode`

A render node for a border.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `BorderNode.new(outline: RoundedRect, border_width: gfloat, border_color: Gdk.RGBA) -> BorderNode` | gsk_border_node_new |  | Creates a `GskRenderNode` that will stroke a border rectangle inside the given @outline. The 4 sides of the border can have different widths and co... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_colors | `BorderNode.get_colors() -> Gdk.RGBA` | gsk_border_node_get_colors |  | Retrieves the colors of the border. |
| get_outline | `BorderNode.get_outline() -> RoundedRect` | gsk_border_node_get_outline |  | Retrieves the outline of the border. |
| get_widths | `BorderNode.get_widths() -> gfloat` | gsk_border_node_get_widths |  | Retrieves the stroke widths of the border. |

### Gsk.BroadwayRenderer

Parent: `Renderer` ?? GType: `GskBroadwayRenderer` ?? C type: `GskBroadwayRenderer`

Creates a new Broadway renderer. The Broadway renderer is the default renderer for the broadway backend. It will only work with broadway surfaces, ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `BroadwayRenderer.new() -> Renderer` | gsk_broadway_renderer_new |  | Creates a new Broadway renderer. The Broadway renderer is the default renderer for the broadway backend. It will only work with broadway surfaces, ... |

### Gsk.CairoNode

Parent: `RenderNode` ?? GType: `GskCairoNode` ?? C type: `GskCairoNode`

A render node for a Cairo surface.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `CairoNode.new(bounds: Graphene.Rect) -> CairoNode` | gsk_cairo_node_new |  | Creates a `GskRenderNode` that will render a cairo surface into the area given by @bounds. You can draw to the cairo surface using [method@Gsk.Cair... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_draw_context | `CairoNode.get_draw_context() -> cairo.Context` | gsk_cairo_node_get_draw_context |  | Creates a Cairo context for drawing using the surface associated to the render node. If no surface exists yet, a surface will be created optimized ... |
| get_surface | `CairoNode.get_surface() -> cairo.Surface` | gsk_cairo_node_get_surface |  | Retrieves the Cairo surface used by the render node. |

### Gsk.CairoRenderer

Parent: `Renderer` ?? GType: `GskCairoRenderer` ?? C type: `GskCairoRenderer`

A GSK renderer that is using cairo. Since it is using cairo, this renderer cannot support 3D transformations.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `CairoRenderer.new() -> Renderer` | gsk_cairo_renderer_new |  | Creates a new Cairo renderer. The Cairo renderer is the fallback renderer drawing in ways similar to how GTK 3 drew its content. Its primary use is... |

### Gsk.ClipNode

Parent: `RenderNode` ?? GType: `GskClipNode` ?? C type: `GskClipNode`

A render node applying a rectangular clip to its single child node.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ClipNode.new(child: RenderNode, clip: Graphene.Rect) -> ClipNode` | gsk_clip_node_new |  | Creates a `GskRenderNode` that will clip the @child to the area given by @clip. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_child | `ClipNode.get_child() -> RenderNode` | gsk_clip_node_get_child |  | Gets the child node that is getting clipped by the given @node. |
| get_clip | `ClipNode.get_clip() -> Graphene.Rect` | gsk_clip_node_get_clip |  | Retrieves the clip rectangle for @node. |

### Gsk.ColorMatrixNode

Parent: `RenderNode` ?? GType: `GskColorMatrixNode` ?? C type: `GskColorMatrixNode`

A render node controlling the color matrix of its single child node.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ColorMatrixNode.new(child: RenderNode, color_matrix: Graphene.Matrix, color_offset: Graphene.Vec4) -> ColorMatrixNode` | gsk_color_matrix_node_new |  | Creates a `GskRenderNode` that will drawn the @child with @color_matrix. In particular, the node will transform colors by applying pixel = transpos... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_child | `ColorMatrixNode.get_child() -> RenderNode` | gsk_color_matrix_node_get_child |  | Gets the child node that is getting its colors modified by the given @node. |
| get_color_matrix | `ColorMatrixNode.get_color_matrix() -> Graphene.Matrix` | gsk_color_matrix_node_get_color_matrix |  | Retrieves the color matrix used by the @node. |
| get_color_offset | `ColorMatrixNode.get_color_offset() -> Graphene.Vec4` | gsk_color_matrix_node_get_color_offset |  | Retrieves the color offset used by the @node. |

### Gsk.ColorNode

Parent: `RenderNode` ?? GType: `GskColorNode` ?? C type: `GskColorNode`

A render node for a solid color.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ColorNode.new(rgba: Gdk.RGBA, bounds: Graphene.Rect) -> ColorNode` | gsk_color_node_new |  | Creates a `GskRenderNode` that will render the color specified by @rgba into the area given by @bounds. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_color | `ColorNode.get_color() -> Gdk.RGBA` | gsk_color_node_get_color |  | Retrieves the color of the given @node. |

### Gsk.ConicGradientNode

Parent: `RenderNode` ?? GType: `GskConicGradientNode` ?? C type: `GskConicGradientNode`

A render node for a conic gradient.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ConicGradientNode.new(bounds: Graphene.Rect, center: Graphene.Point, rotation: gfloat, color_stops: ColorStop, n_color_stops: gsize) -> ConicGradientNode` | gsk_conic_gradient_node_new |  | Creates a `GskRenderNode` that draws a conic gradient. The conic gradient starts around @center in the direction of @rotation. A rotation of 0 mean... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_angle | `ConicGradientNode.get_angle() -> gfloat` | gsk_conic_gradient_node_get_angle | 4.2 | Retrieves the angle for the gradient in radians, normalized in [0, 2 * PI]. The angle is starting at the top and going clockwise, as expressed in t... |
| get_center | `ConicGradientNode.get_center() -> Graphene.Point` | gsk_conic_gradient_node_get_center |  | Retrieves the center pointer for the gradient. |
| get_color_stops | `ConicGradientNode.get_color_stops(n_stops: out gsize?) -> ColorStop` | gsk_conic_gradient_node_get_color_stops |  | Retrieves the color stops in the gradient. |
| get_n_color_stops | `ConicGradientNode.get_n_color_stops() -> gsize` | gsk_conic_gradient_node_get_n_color_stops |  | Retrieves the number of color stops in the gradient. |
| get_rotation | `ConicGradientNode.get_rotation() -> gfloat` | gsk_conic_gradient_node_get_rotation |  | Retrieves the rotation for the gradient in degrees. |

### Gsk.ContainerNode

Parent: `RenderNode` ?? GType: `GskContainerNode` ?? C type: `GskContainerNode`

A render node that can contain other render nodes.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ContainerNode.new(children: RenderNode, n_children: guint) -> ContainerNode` | gsk_container_node_new |  | Creates a new `GskRenderNode` instance for holding the given @children. The new node will acquire a reference to each of the children. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_child | `ContainerNode.get_child(idx: guint) -> RenderNode` | gsk_container_node_get_child |  | Gets one of the children of @container. |
| get_n_children | `ContainerNode.get_n_children() -> guint` | gsk_container_node_get_n_children |  | Retrieves the number of direct children of @node. |

### Gsk.CrossFadeNode

Parent: `RenderNode` ?? GType: `GskCrossFadeNode` ?? C type: `GskCrossFadeNode`

A render node cross fading between two child nodes.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `CrossFadeNode.new(start: RenderNode, end: RenderNode, progress: gfloat) -> CrossFadeNode` | gsk_cross_fade_node_new |  | Creates a `GskRenderNode` that will do a cross-fade between @start and @end. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_end_child | `CrossFadeNode.get_end_child() -> RenderNode` | gsk_cross_fade_node_get_end_child |  | Retrieves the child `GskRenderNode` at the end of the cross-fade. |
| get_progress | `CrossFadeNode.get_progress() -> gfloat` | gsk_cross_fade_node_get_progress |  | Retrieves the progress value of the cross fade. |
| get_start_child | `CrossFadeNode.get_start_child() -> RenderNode` | gsk_cross_fade_node_get_start_child |  | Retrieves the child `GskRenderNode` at the beginning of the cross-fade. |

### Gsk.DebugNode

Parent: `RenderNode` ?? GType: `GskDebugNode` ?? C type: `GskDebugNode`

A render node that emits a debugging message when drawing its child node.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DebugNode.new(child: RenderNode, message: utf8) -> DebugNode` | gsk_debug_node_new |  | Creates a `GskRenderNode` that will add debug information about the given @child. Adding this node has no visual effect. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_child | `DebugNode.get_child() -> RenderNode` | gsk_debug_node_get_child |  | Gets the child node that is getting drawn by the given @node. |
| get_message | `DebugNode.get_message() -> utf8` | gsk_debug_node_get_message |  | Gets the debug message that was set on this node |

### Gsk.FillNode

Parent: `RenderNode` ?? GType: `GskFillNode` ?? C type: `GskFillNode`

A render node filling the area given by [struct@Gsk.Path] and [enum@Gsk.FillRule] with the child node.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `FillNode.new(child: RenderNode, path: Path, fill_rule: FillRule) -> FillNode` | gsk_fill_node_new | 4.14 | Creates a `GskRenderNode` that will fill the @child in the area given by @path and @fill_rule. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_child | `FillNode.get_child() -> RenderNode` | gsk_fill_node_get_child | 4.14 | Gets the child node that is getting drawn by the given @node. |
| get_fill_rule | `FillNode.get_fill_rule() -> FillRule` | gsk_fill_node_get_fill_rule | 4.14 | Retrieves the fill rule used to determine how the path is filled. |
| get_path | `FillNode.get_path() -> Path` | gsk_fill_node_get_path | 4.14 | Retrieves the path used to describe the area filled with the contents of the @node. |

### Gsk.GLRenderer

Parent: `Renderer` ?? GType: `GskGLRenderer` ?? C type: `GskGLRenderer`

Creates a new `GskRenderer` using the new OpenGL renderer.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `GLRenderer.new() -> Renderer` | gsk_gl_renderer_new | 4.2 | Creates a new `GskRenderer` using the new OpenGL renderer. |

### Gsk.GLShader

Parent: `GObject.Object` ?? GType: `GskGLShader` ?? C type: `GskGLShader`

A `GskGLShader` is a snippet of GLSL that is meant to run in the fragment shader of the rendering pipeline. A fragment shader gets the coordinates ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_from_bytes | `GLShader.new_from_bytes(sourcecode: GLib.Bytes) -> GLShader` | gsk_gl_shader_new_from_bytes |  | Creates a `GskGLShader` that will render pixels using the specified code. |
| new_from_resource | `GLShader.new_from_resource(resource_path: utf8) -> GLShader` | gsk_gl_shader_new_from_resource |  | Creates a `GskGLShader` that will render pixels using the specified code. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| compile | `GLShader.compile(renderer: Renderer) -> gboolean throws` | gsk_gl_shader_compile |  | Tries to compile the @shader for the given @renderer. If there is a problem, this function returns %FALSE and reports an error. You should use this... |
| find_uniform_by_name | `GLShader.find_uniform_by_name(name: utf8) -> gint` | gsk_gl_shader_find_uniform_by_name |  | Looks for a uniform by the name @name, and returns the index of the uniform, or -1 if it was not found. |
| format_args | `GLShader.format_args(...: void) -> GLib.Bytes` | gsk_gl_shader_format_args |  | Formats the uniform data as needed for feeding the named uniforms values into the shader. The argument list is a list of pairs of names, and values... |
| format_args_va | `GLShader.format_args_va(uniforms: va_list) -> GLib.Bytes` | gsk_gl_shader_format_args_va |  | Formats the uniform data as needed for feeding the named uniforms values into the shader. The argument list is a list of pairs of names, and values... |
| get_arg_bool | `GLShader.get_arg_bool(args: GLib.Bytes, idx: gint) -> gboolean` | gsk_gl_shader_get_arg_bool |  | Gets the value of the uniform @idx in the @args block. The uniform must be of bool type. |
| get_arg_float | `GLShader.get_arg_float(args: GLib.Bytes, idx: gint) -> gfloat` | gsk_gl_shader_get_arg_float |  | Gets the value of the uniform @idx in the @args block. The uniform must be of float type. |
| get_arg_int | `GLShader.get_arg_int(args: GLib.Bytes, idx: gint) -> gint32` | gsk_gl_shader_get_arg_int |  | Gets the value of the uniform @idx in the @args block. The uniform must be of int type. |
| get_arg_uint | `GLShader.get_arg_uint(args: GLib.Bytes, idx: gint) -> guint32` | gsk_gl_shader_get_arg_uint |  | Gets the value of the uniform @idx in the @args block. The uniform must be of uint type. |
| get_arg_vec2 | `GLShader.get_arg_vec2(args: GLib.Bytes, idx: gint, out_value: Graphene.Vec2) -> none` | gsk_gl_shader_get_arg_vec2 |  | Gets the value of the uniform @idx in the @args block. The uniform must be of vec2 type. |
| get_arg_vec3 | `GLShader.get_arg_vec3(args: GLib.Bytes, idx: gint, out_value: Graphene.Vec3) -> none` | gsk_gl_shader_get_arg_vec3 |  | Gets the value of the uniform @idx in the @args block. The uniform must be of vec3 type. |
| get_arg_vec4 | `GLShader.get_arg_vec4(args: GLib.Bytes, idx: gint, out_value: Graphene.Vec4) -> none` | gsk_gl_shader_get_arg_vec4 |  | Gets the value of the uniform @idx in the @args block. The uniform must be of vec4 type. |
| get_args_size | `GLShader.get_args_size() -> gsize` | gsk_gl_shader_get_args_size |  | Get the size of the data block used to specify arguments for this shader. |
| get_n_textures | `GLShader.get_n_textures() -> gint` | gsk_gl_shader_get_n_textures |  | Returns the number of textures that the shader requires. This can be used to check that the a passed shader works in your usecase. It is determined... |
| get_n_uniforms | `GLShader.get_n_uniforms() -> gint` | gsk_gl_shader_get_n_uniforms |  | Get the number of declared uniforms for this shader. |
| get_resource | `GLShader.get_resource() -> utf8` | gsk_gl_shader_get_resource |  | Gets the resource path for the GLSL sourcecode being used to render this shader. |
| get_source | `GLShader.get_source() -> GLib.Bytes` | gsk_gl_shader_get_source |  | Gets the GLSL sourcecode being used to render this shader. |
| get_uniform_name | `GLShader.get_uniform_name(idx: gint) -> utf8` | gsk_gl_shader_get_uniform_name |  | Get the name of the declared uniform for this shader at index @idx. |
| get_uniform_offset | `GLShader.get_uniform_offset(idx: gint) -> gint` | gsk_gl_shader_get_uniform_offset |  | Get the offset into the data block where data for this uniforms is stored. |
| get_uniform_type | `GLShader.get_uniform_type(idx: gint) -> GLUniformType` | gsk_gl_shader_get_uniform_type |  | Get the type of the declared uniform for this shader at index @idx. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| resource | utf8 | read, write, construct-only | Resource containing the source code for the shader. If the shader source is not coming from a resource, this will be %NULL. |
| source | GLib.Bytes | read, write, construct-only |  |

### Gsk.GLShaderNode

Parent: `RenderNode` ?? GType: `GskGLShaderNode` ?? C type: `GskGLShaderNode`

A render node using a GL shader when drawing its children nodes.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `GLShaderNode.new(shader: GLShader, bounds: Graphene.Rect, args: GLib.Bytes, children: RenderNode?, n_children: guint) -> GLShaderNode` | gsk_gl_shader_node_new |  | Creates a `GskRenderNode` that will render the given @shader into the area given by @bounds. The @args is a block of data to use for uniform input,... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_args | `GLShaderNode.get_args() -> GLib.Bytes` | gsk_gl_shader_node_get_args |  | Gets args for the node. |
| get_child | `GLShaderNode.get_child(idx: guint) -> RenderNode` | gsk_gl_shader_node_get_child |  | Gets one of the children. |
| get_n_children | `GLShaderNode.get_n_children() -> guint` | gsk_gl_shader_node_get_n_children |  | Returns the number of children |
| get_shader | `GLShaderNode.get_shader() -> GLShader` | gsk_gl_shader_node_get_shader |  | Gets shader code for the node. |

### Gsk.InsetShadowNode

Parent: `RenderNode` ?? GType: `GskInsetShadowNode` ?? C type: `GskInsetShadowNode`

A render node for an inset shadow.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `InsetShadowNode.new(outline: RoundedRect, color: Gdk.RGBA, dx: gfloat, dy: gfloat, spread: gfloat, blur_radius: gfloat) -> InsetShadowNode` | gsk_inset_shadow_node_new |  | Creates a `GskRenderNode` that will render an inset shadow into the box given by @outline. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_blur_radius | `InsetShadowNode.get_blur_radius() -> gfloat` | gsk_inset_shadow_node_get_blur_radius |  | Retrieves the blur radius to apply to the shadow. |
| get_color | `InsetShadowNode.get_color() -> Gdk.RGBA` | gsk_inset_shadow_node_get_color |  | Retrieves the color of the inset shadow. |
| get_dx | `InsetShadowNode.get_dx() -> gfloat` | gsk_inset_shadow_node_get_dx |  | Retrieves the horizontal offset of the inset shadow. |
| get_dy | `InsetShadowNode.get_dy() -> gfloat` | gsk_inset_shadow_node_get_dy |  | Retrieves the vertical offset of the inset shadow. |
| get_outline | `InsetShadowNode.get_outline() -> RoundedRect` | gsk_inset_shadow_node_get_outline |  | Retrieves the outline rectangle of the inset shadow. |
| get_spread | `InsetShadowNode.get_spread() -> gfloat` | gsk_inset_shadow_node_get_spread |  | Retrieves how much the shadow spreads inwards. |

### Gsk.LinearGradientNode

Parent: `RenderNode` ?? GType: `GskLinearGradientNode` ?? C type: `GskLinearGradientNode`

A render node for a linear gradient.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `LinearGradientNode.new(bounds: Graphene.Rect, start: Graphene.Point, end: Graphene.Point, color_stops: ColorStop, n_color_stops: gsize) -> LinearGradientNode` | gsk_linear_gradient_node_new |  | Creates a `GskRenderNode` that will create a linear gradient from the given points and color stops, and render that into the area given by @bounds. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_color_stops | `LinearGradientNode.get_color_stops(n_stops: out gsize?) -> ColorStop` | gsk_linear_gradient_node_get_color_stops |  | Retrieves the color stops in the gradient. |
| get_end | `LinearGradientNode.get_end() -> Graphene.Point` | gsk_linear_gradient_node_get_end |  | Retrieves the final point of the linear gradient. |
| get_n_color_stops | `LinearGradientNode.get_n_color_stops() -> gsize` | gsk_linear_gradient_node_get_n_color_stops |  | Retrieves the number of color stops in the gradient. |
| get_start | `LinearGradientNode.get_start() -> Graphene.Point` | gsk_linear_gradient_node_get_start |  | Retrieves the initial point of the linear gradient. |

### Gsk.MaskNode

Parent: `RenderNode` ?? GType: `GskMaskNode` ?? C type: `GskMaskNode`

A render node masking one child node with another.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MaskNode.new(source: RenderNode, mask: RenderNode, mask_mode: MaskMode) -> MaskNode` | gsk_mask_node_new | 4.10 | Creates a `GskRenderNode` that will mask a given node by another. The @mask_mode determines how the 'mask values' are derived from the colors of th... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_mask | `MaskNode.get_mask() -> RenderNode` | gsk_mask_node_get_mask | 4.10 | Retrieves the mask `GskRenderNode` child of the @node. |
| get_mask_mode | `MaskNode.get_mask_mode() -> MaskMode` | gsk_mask_node_get_mask_mode | 4.10 | Retrieves the mask mode used by @node. |
| get_source | `MaskNode.get_source() -> RenderNode` | gsk_mask_node_get_source | 4.10 | Retrieves the source `GskRenderNode` child of the @node. |

### Gsk.NglRenderer

Parent: `Renderer` ?? GType: `GskNglRenderer`

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `NglRenderer.new() -> Renderer` | gsk_ngl_renderer_new |  |  |

### Gsk.OpacityNode

Parent: `RenderNode` ?? GType: `GskOpacityNode` ?? C type: `GskOpacityNode`

A render node controlling the opacity of its single child node.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `OpacityNode.new(child: RenderNode, opacity: gfloat) -> OpacityNode` | gsk_opacity_node_new |  | Creates a `GskRenderNode` that will drawn the @child with reduced @opacity. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_child | `OpacityNode.get_child() -> RenderNode` | gsk_opacity_node_get_child |  | Gets the child node that is getting opacityed by the given @node. |
| get_opacity | `OpacityNode.get_opacity() -> gfloat` | gsk_opacity_node_get_opacity |  | Gets the transparency factor for an opacity node. |

### Gsk.OutsetShadowNode

Parent: `RenderNode` ?? GType: `GskOutsetShadowNode` ?? C type: `GskOutsetShadowNode`

A render node for an outset shadow.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `OutsetShadowNode.new(outline: RoundedRect, color: Gdk.RGBA, dx: gfloat, dy: gfloat, spread: gfloat, blur_radius: gfloat) -> OutsetShadowNode` | gsk_outset_shadow_node_new |  | Creates a `GskRenderNode` that will render an outset shadow around the box given by @outline. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_blur_radius | `OutsetShadowNode.get_blur_radius() -> gfloat` | gsk_outset_shadow_node_get_blur_radius |  | Retrieves the blur radius of the shadow. |
| get_color | `OutsetShadowNode.get_color() -> Gdk.RGBA` | gsk_outset_shadow_node_get_color |  | Retrieves the color of the outset shadow. |
| get_dx | `OutsetShadowNode.get_dx() -> gfloat` | gsk_outset_shadow_node_get_dx |  | Retrieves the horizontal offset of the outset shadow. |
| get_dy | `OutsetShadowNode.get_dy() -> gfloat` | gsk_outset_shadow_node_get_dy |  | Retrieves the vertical offset of the outset shadow. |
| get_outline | `OutsetShadowNode.get_outline() -> RoundedRect` | gsk_outset_shadow_node_get_outline |  | Retrieves the outline rectangle of the outset shadow. |
| get_spread | `OutsetShadowNode.get_spread() -> gfloat` | gsk_outset_shadow_node_get_spread |  | Retrieves how much the shadow spreads outwards. |

### Gsk.RadialGradientNode

Parent: `RenderNode` ?? GType: `GskRadialGradientNode` ?? C type: `GskRadialGradientNode`

A render node for a radial gradient.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `RadialGradientNode.new(bounds: Graphene.Rect, center: Graphene.Point, hradius: gfloat, vradius: gfloat, start: gfloat, end: gfloat, color_stops: ColorStop, n_color_stops: gsize) -> RadialGradientNode` | gsk_radial_gradient_node_new |  | Creates a `GskRenderNode` that draws a radial gradient. The radial gradient starts around @center. The size of the gradient is dictated by @hradius... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_center | `RadialGradientNode.get_center() -> Graphene.Point` | gsk_radial_gradient_node_get_center |  | Retrieves the center pointer for the gradient. |
| get_color_stops | `RadialGradientNode.get_color_stops(n_stops: out gsize?) -> ColorStop` | gsk_radial_gradient_node_get_color_stops |  | Retrieves the color stops in the gradient. |
| get_end | `RadialGradientNode.get_end() -> gfloat` | gsk_radial_gradient_node_get_end |  | Retrieves the end value for the gradient. |
| get_hradius | `RadialGradientNode.get_hradius() -> gfloat` | gsk_radial_gradient_node_get_hradius |  | Retrieves the horizontal radius for the gradient. |
| get_n_color_stops | `RadialGradientNode.get_n_color_stops() -> gsize` | gsk_radial_gradient_node_get_n_color_stops |  | Retrieves the number of color stops in the gradient. |
| get_start | `RadialGradientNode.get_start() -> gfloat` | gsk_radial_gradient_node_get_start |  | Retrieves the start value for the gradient. |
| get_vradius | `RadialGradientNode.get_vradius() -> gfloat` | gsk_radial_gradient_node_get_vradius |  | Retrieves the vertical radius for the gradient. |

### Gsk.Renderer

Parent: `GObject.Object` ?? Subclasses: `BroadwayRenderer`, `CairoRenderer`, `GLRenderer`, `NglRenderer`, `VulkanRenderer` ?? GType: `GskRenderer` ?? C type: `GskRenderer` ?? Abstract

`GskRenderer` is a class that renders a scene graph defined via a tree of [class@Gsk.RenderNode] instances. Typically you will use a `GskRenderer` ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_for_surface | `Renderer.new_for_surface(surface: Gdk.Surface) -> Renderer` | gsk_renderer_new_for_surface |  | Creates an appropriate `GskRenderer` instance for the given @surface. If the `GSK_RENDERER` environment variable is set, GSK will try that renderer... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_surface | `Renderer.get_surface() -> Gdk.Surface` | gsk_renderer_get_surface |  | Retrieves the `GdkSurface` set using gsk_enderer_realize(). If the renderer has not been realized yet, %NULL will be returned. |
| is_realized | `Renderer.is_realized() -> gboolean` | gsk_renderer_is_realized |  | Checks whether the @renderer is realized or not. |
| realize | `Renderer.realize(surface: Gdk.Surface?) -> gboolean throws` | gsk_renderer_realize |  | Creates the resources needed by the @renderer to render the scene graph. Since GTK 4.6, the surface may be `NULL`, which allows using renderers wit... |
| realize_for_display | `Renderer.realize_for_display(display: Gdk.Display) -> gboolean throws` | gsk_renderer_realize_for_display | 4.14 | Creates the resources needed by the @renderer to render the scene graph. Note that it is mandatory to call [method@Gsk.Renderer.unrealize] before d... |
| render | `Renderer.render(root: RenderNode, region: cairo.Region?) -> none` | gsk_renderer_render |  | Renders the scene graph, described by a tree of `GskRenderNode` instances to the renderer's surface, ensuring that the given @region gets redrawn. ... |
| render_texture | `Renderer.render_texture(root: RenderNode, viewport: Graphene.Rect?) -> Gdk.Texture` | gsk_renderer_render_texture |  | Renders the scene graph, described by a tree of `GskRenderNode` instances, to a `GdkTexture`. The @renderer will acquire a reference on the `GskRen... |
| unrealize | `Renderer.unrealize() -> none` | gsk_renderer_unrealize |  | Releases all the resources created by gsk_renderer_realize(). |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| realized | gboolean | read | Whether the renderer has been associated with a surface or draw context. |
| surface | Gdk.Surface | read | The surface associated with renderer. |

### Gsk.RenderNode

Subclasses: `BlendNode`, `BlurNode`, `BorderNode`, `CairoNode`, `ClipNode`, `ColorMatrixNode`, `ColorNode`, `ConicGradientNode`, `ContainerNode`, `CrossFadeNode`, `DebugNode`, `FillNode`, `GLShaderNode`, `InsetShadowNode`, `LinearGradientNode`, `MaskNode`, `OpacityNode`, `OutsetShadowNode`, `RadialGradientNode`, `RepeatingLinearGradientNode`, `RepeatingRadialGradientNode`, `RepeatNode`, `RoundedClipNode`, `ShadowNode`, `StrokeNode`, `SubsurfaceNode`, `TextNode`, `TextureNode`, `TextureScaleNode`, `TransformNode` ?? GType: `GskRenderNode` ?? C type: `GskRenderNode` ?? Abstract

`GskRenderNode` is the basic block in a scene graph to be rendered using [class@Gsk.Renderer]. Each node has a parent, except the top-level node; e...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| deserialize | `deserialize(bytes: GLib.Bytes, error_func: ParseErrorFunc?, user_data: gpointer?) -> RenderNode` | gsk_render_node_deserialize |  | Loads data previously created via [method@Gsk.RenderNode.serialize]. For a discussion of the supported format, see that function. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| draw | `RenderNode.draw(cr: cairo.Context) -> none` | gsk_render_node_draw |  | Draw the contents of @node to the given cairo context. Typically, you'll use this function to implement fallback rendering of `GskRenderNode`s on a... |
| get_bounds | `RenderNode.get_bounds(bounds: out Graphene.Rect) -> none` | gsk_render_node_get_bounds |  | Retrieves the boundaries of the @node. The node will not draw outside of its boundaries. |
| get_node_type | `RenderNode.get_node_type() -> RenderNodeType` | gsk_render_node_get_node_type |  | Returns the type of the @node. |
| ref | `RenderNode.ref() -> RenderNode` | gsk_render_node_ref |  | Acquires a reference on the given `GskRenderNode`. |
| serialize | `RenderNode.serialize() -> GLib.Bytes` | gsk_render_node_serialize |  | Serializes the @node for later deserialization via gsk_render_node_deserialize(). No guarantees are made about the format used other than that the ... |
| unref | `RenderNode.unref() -> none` | gsk_render_node_unref |  | Releases a reference on the given `GskRenderNode`. If the reference was the last, the resources associated to the @node are freed. |
| write_to_file | `RenderNode.write_to_file(filename: filename) -> gboolean throws` | gsk_render_node_write_to_file |  | This function is equivalent to calling [method@Gsk.RenderNode.serialize] followed by [func@GLib.file_set_contents]. See those two functions for det... |

### Gsk.RepeatingLinearGradientNode

Parent: `RenderNode` ?? GType: `GskRepeatingLinearGradientNode` ?? C type: `GskRepeatingLinearGradientNode`

A render node for a repeating linear gradient.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `RepeatingLinearGradientNode.new(bounds: Graphene.Rect, start: Graphene.Point, end: Graphene.Point, color_stops: ColorStop, n_color_stops: gsize) -> RepeatingLinearGradientNode` | gsk_repeating_linear_gradient_node_new |  | Creates a `GskRenderNode` that will create a repeating linear gradient from the given points and color stops, and render that into the area given b... |

### Gsk.RepeatingRadialGradientNode

Parent: `RenderNode` ?? GType: `GskRepeatingRadialGradientNode` ?? C type: `GskRepeatingRadialGradientNode`

A render node for a repeating radial gradient.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `RepeatingRadialGradientNode.new(bounds: Graphene.Rect, center: Graphene.Point, hradius: gfloat, vradius: gfloat, start: gfloat, end: gfloat, color_stops: ColorStop, n_color_stops: gsize) -> RepeatingRadialGradientNode` | gsk_repeating_radial_gradient_node_new |  | Creates a `GskRenderNode` that draws a repeating radial gradient. The radial gradient starts around @center. The size of the gradient is dictated b... |

### Gsk.RepeatNode

Parent: `RenderNode` ?? GType: `GskRepeatNode` ?? C type: `GskRepeatNode`

A render node repeating its single child node.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `RepeatNode.new(bounds: Graphene.Rect, child: RenderNode, child_bounds: Graphene.Rect?) -> RepeatNode` | gsk_repeat_node_new |  | Creates a `GskRenderNode` that will repeat the drawing of @child across the given @bounds. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_child | `RepeatNode.get_child() -> RenderNode` | gsk_repeat_node_get_child |  | Retrieves the child of @node. |
| get_child_bounds | `RepeatNode.get_child_bounds() -> Graphene.Rect` | gsk_repeat_node_get_child_bounds |  | Retrieves the bounding rectangle of the child of @node. |

### Gsk.RoundedClipNode

Parent: `RenderNode` ?? GType: `GskRoundedClipNode` ?? C type: `GskRoundedClipNode`

A render node applying a rounded rectangle clip to its single child.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `RoundedClipNode.new(child: RenderNode, clip: RoundedRect) -> RoundedClipNode` | gsk_rounded_clip_node_new |  | Creates a `GskRenderNode` that will clip the @child to the area given by @clip. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_child | `RoundedClipNode.get_child() -> RenderNode` | gsk_rounded_clip_node_get_child |  | Gets the child node that is getting clipped by the given @node. |
| get_clip | `RoundedClipNode.get_clip() -> RoundedRect` | gsk_rounded_clip_node_get_clip |  | Retrieves the rounded rectangle used to clip the contents of the @node. |

### Gsk.ShadowNode

Parent: `RenderNode` ?? GType: `GskShadowNode` ?? C type: `GskShadowNode`

A render node drawing one or more shadows behind its single child node.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ShadowNode.new(child: RenderNode, shadows: Shadow, n_shadows: gsize) -> ShadowNode` | gsk_shadow_node_new |  | Creates a `GskRenderNode` that will draw a @child with the given @shadows below it. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_child | `ShadowNode.get_child() -> RenderNode` | gsk_shadow_node_get_child |  | Retrieves the child `GskRenderNode` of the shadow @node. |
| get_n_shadows | `ShadowNode.get_n_shadows() -> gsize` | gsk_shadow_node_get_n_shadows |  | Retrieves the number of shadows in the @node. |
| get_shadow | `ShadowNode.get_shadow(i: gsize) -> Shadow` | gsk_shadow_node_get_shadow |  | Retrieves the shadow data at the given index @i. |

### Gsk.StrokeNode

Parent: `RenderNode` ?? GType: `GskStrokeNode` ?? C type: `GskStrokeNode`

A render node that will fill the area determined by stroking the the given [struct@Gsk.Path] using the [struct@Gsk.Stroke] attributes.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `StrokeNode.new(child: RenderNode, path: Path, stroke: Stroke) -> StrokeNode` | gsk_stroke_node_new | 4.14 | Creates a #GskRenderNode that will fill the outline generated by stroking the given @path using the attributes defined in @stroke. The area is fill... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_child | `StrokeNode.get_child() -> RenderNode` | gsk_stroke_node_get_child | 4.14 | Gets the child node that is getting drawn by the given @node. |
| get_path | `StrokeNode.get_path() -> Path` | gsk_stroke_node_get_path | 4.14 | Retrieves the path that will be stroked with the contents of the @node. |
| get_stroke | `StrokeNode.get_stroke() -> Stroke` | gsk_stroke_node_get_stroke | 4.14 | Retrieves the stroke attributes used in this @node. |

### Gsk.SubsurfaceNode

Parent: `RenderNode` ?? GType: `GskSubsurfaceNode` ?? C type: `GskSubsurfaceNode`

A render node that potentially diverts a part of the scene graph to a subsurface.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SubsurfaceNode.new(child: RenderNode, subsurface: gpointer?) -> SubsurfaceNode` | gsk_subsurface_node_new | 4.14 | Creates a `GskRenderNode` that will possibly divert the child node to a subsurface. Note: Since subsurfaces are currently private, these nodes cann... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_subsurface | `get_subsurface(node: DebugNode) -> gpointer` | gsk_subsurface_node_get_subsurface | 4.14 | Gets the subsurface that was set on this node |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_child | `SubsurfaceNode.get_child() -> RenderNode` | gsk_subsurface_node_get_child | 4.14 | Gets the child node that is getting drawn by the given @node. |

### Gsk.TextNode

Parent: `RenderNode` ?? GType: `GskTextNode` ?? C type: `GskTextNode`

A render node drawing a set of glyphs.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TextNode.new(font: Pango.Font, glyphs: Pango.GlyphString, color: Gdk.RGBA, offset: Graphene.Point) -> TextNode` | gsk_text_node_new |  | Creates a render node that renders the given glyphs. Note that @color may not be used if the font contains color glyphs. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_color | `TextNode.get_color() -> Gdk.RGBA` | gsk_text_node_get_color |  | Retrieves the color used by the text @node. |
| get_font | `TextNode.get_font() -> Pango.Font` | gsk_text_node_get_font |  | Returns the font used by the text @node. |
| get_glyphs | `TextNode.get_glyphs(n_glyphs: out guint?) -> Pango.GlyphInfo` | gsk_text_node_get_glyphs |  | Retrieves the glyph information in the @node. |
| get_num_glyphs | `TextNode.get_num_glyphs() -> guint` | gsk_text_node_get_num_glyphs |  | Retrieves the number of glyphs in the text node. |
| get_offset | `TextNode.get_offset() -> Graphene.Point` | gsk_text_node_get_offset |  | Retrieves the offset applied to the text. |
| has_color_glyphs | `TextNode.has_color_glyphs() -> gboolean` | gsk_text_node_has_color_glyphs | 4.2 | Checks whether the text @node has color glyphs. |

### Gsk.TextureNode

Parent: `RenderNode` ?? GType: `GskTextureNode` ?? C type: `GskTextureNode`

A render node for a `GdkTexture`.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TextureNode.new(texture: Gdk.Texture, bounds: Graphene.Rect) -> TextureNode` | gsk_texture_node_new |  | Creates a `GskRenderNode` that will render the given @texture into the area given by @bounds. Note that GSK applies linear filtering when textures ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_texture | `TextureNode.get_texture() -> Gdk.Texture` | gsk_texture_node_get_texture |  | Retrieves the `GdkTexture` used when creating this `GskRenderNode`. |

### Gsk.TextureScaleNode

Parent: `RenderNode` ?? GType: `GskTextureScaleNode` ?? C type: `GskTextureScaleNode`

A render node for a `GdkTexture`.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TextureScaleNode.new(texture: Gdk.Texture, bounds: Graphene.Rect, filter: ScalingFilter) -> TextureScaleNode` | gsk_texture_scale_node_new | 4.10 | Creates a node that scales the texture to the size given by the bounds using the filter and then places it at the bounds' position. Note that furth... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_filter | `TextureScaleNode.get_filter() -> ScalingFilter` | gsk_texture_scale_node_get_filter | 4.10 | Retrieves the `GskScalingFilter` used when creating this `GskRenderNode`. |
| get_texture | `TextureScaleNode.get_texture() -> Gdk.Texture` | gsk_texture_scale_node_get_texture | 4.10 | Retrieves the `GdkTexture` used when creating this `GskRenderNode`. |

### Gsk.TransformNode

Parent: `RenderNode` ?? GType: `GskTransformNode` ?? C type: `GskTransformNode`

A render node applying a `GskTransform` to its single child node.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TransformNode.new(child: RenderNode, transform: Transform) -> TransformNode` | gsk_transform_node_new |  | Creates a `GskRenderNode` that will transform the given @child with the given @transform. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_child | `TransformNode.get_child() -> RenderNode` | gsk_transform_node_get_child |  | Gets the child node that is getting transformed by the given @node. |
| get_transform | `TransformNode.get_transform() -> Transform` | gsk_transform_node_get_transform |  | Retrieves the `GskTransform` used by the @node. |

### Gsk.VulkanRenderer

Parent: `Renderer` ?? GType: `GskVulkanRenderer` ?? C type: `GskVulkanRenderer`

A GSK renderer that is using Vulkan. This renderer will fail to realize if Vulkan is not supported.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `VulkanRenderer.new() -> Renderer` | gsk_vulkan_renderer_new |  |  |

## Enums

### Gsk.BlendMode

GType: `GskBlendMode` ?? C type: `GskBlendMode`

The blend modes available for render nodes. The implementation of each blend mode is deferred to the rendering pipeline. See <https://www.w3.org/TR...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| color | 12 | color | Creates a color with the hue and saturation of the source color and the luminosity of the destination color |
| color_burn | 7 | color-burn | Darkens the destination color to reflect the source color |
| color_dodge | 6 | color-dodge | Brightens the destination color to reflect the source color |
| darken | 4 | darken | Selects the darker of the destination and source colors |
| default | 0 | default | The default blend mode, which specifies no blending |
| difference | 10 | difference | Subtracts the darker of the two constituent colors from the lighter color |
| exclusion | 11 | exclusion | Produces an effect similar to that of the difference mode but lower in contrast |
| hard_light | 8 | hard-light | Multiplies or screens the colors, depending on the source color value |
| hue | 13 | hue | Creates a color with the hue of the source color and the saturation and luminosity of the destination color |
| lighten | 5 | lighten | Selects the lighter of the destination and source colors |
| luminosity | 15 | luminosity | Creates a color with the luminosity of the source color and the hue and saturation of the destination color |
| multiply | 1 | multiply | The source color is multiplied by the destination and replaces the destination |
| overlay | 3 | overlay | Multiplies or screens the colors, depending on the destination color value. This is the inverse of hard-list |
| saturation | 14 | saturation | Creates a color with the saturation of the source color and the hue and luminosity of the destination color |
| screen | 2 | screen | Multiplies the complements of the destination and source color values, then complements the result. |
| soft_light | 9 | soft-light | Darkens or lightens the colors, depending on the source color value |

### Gsk.Corner

GType: `GskCorner` ?? C type: `GskCorner`

The corner indices used by `GskRoundedRect`.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bottom_left | 3 | bottom-left | The bottom left corner |
| bottom_right | 2 | bottom-right | The bottom right corner |
| top_left | 0 | top-left | The top left corner |
| top_right | 1 | top-right | The top right corner |

### Gsk.FillRule

GType: `GskFillRule` ?? C type: `GskFillRule`

`GskFillRule` is used to select how paths are filled. Whether or not a point is included in the fill is determined by taking a ray from that point ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| even_odd | 1 | even-odd | Counts the total number of intersections, without regard to the orientation of the contour. If the total number of intersections is odd, the point ... |
| winding | 0 | winding | If the path crosses the ray from left-to-right, counts +1. If the path crosses the ray from right to left, counts -1. (Left and right are determine... |

### Gsk.GLUniformType

GType: `GskGLUniformType` ?? C type: `GskGLUniformType`

This defines the types of the uniforms that `GskGLShaders` declare. It defines both what the type is called in the GLSL shader code, and what the c...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bool | 4 | bool | A GLSL bool / gboolean uniform |
| float | 1 | float | A float uniform |
| int | 2 | int | A GLSL int / gint32 uniform |
| none | 0 | none | No type, used for uninitialized or unspecified values. |
| uint | 3 | uint | A GLSL uint / guint32 uniform |
| vec2 | 5 | vec2 | A GLSL vec2 / graphene_vec2_t uniform |
| vec3 | 6 | vec3 | A GLSL vec3 / graphene_vec3_t uniform |
| vec4 | 7 | vec4 | A GLSL vec4 / graphene_vec4_t uniform |

### Gsk.LineCap

GType: `GskLineCap` ?? C type: `GskLineCap`

Specifies how to render the start and end points of contours or dashes when stroking. The default line cap style is `GSK_LINE_CAP_BUTT`. New entrie...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| butt | 0 | butt | Start and stop the line exactly at the start and end point |
| round | 1 | round | Use a round ending, the center of the circle is the start or end point |
| square | 2 | square | use squared ending, the center of the square is the start or end point |

### Gsk.LineJoin

GType: `GskLineJoin` ?? C type: `GskLineJoin`

Specifies how to render the junction of two lines when stroking. The default line join style is `GSK_LINE_JOIN_MITER`. New entries may be added in ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bevel | 2 | bevel | use a cut-off join, the join is cut off at half the line width from the joint point |
| miter | 0 | miter | Use a sharp angled corner |
| round | 1 | round | Use a round join, the center of the circle is the join point |

### Gsk.MaskMode

GType: `GskMaskMode` ?? C type: `GskMaskMode`

The mask modes available for mask nodes.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| alpha | 0 | alpha | Use the alpha channel of the mask |
| inverted_alpha | 1 | inverted-alpha | Use the inverted alpha channel of the mask |
| inverted_luminance | 3 | inverted-luminance | Use the inverted luminance of the mask, multiplied by mask alpha |
| luminance | 2 | luminance | Use the luminance of the mask, multiplied by mask alpha |

### Gsk.PathDirection

GType: `GskPathDirection` ?? C type: `GskPathDirection`

The values of the `GskPathDirection` enum are used to pick one of the four tangents at a given point on the path. Note that the directions for @GSK...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| from_end | 3 | from-end | The tangent against path direction of the outgoing side of the path |
| from_start | 0 | from-start | The tangent in path direction of the incoming side of the path |
| to_end | 2 | to-end | The tangent in path direction of the outgoing side of the path |
| to_start | 1 | to-start | The tangent against path direction of the incoming side of the path |

### Gsk.PathOperation

GType: `GskPathOperation` ?? C type: `GskPathOperation`

Path operations are used to describe the segments of a `GskPath`. More values may be added in the future.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| close | 1 | close | A close operation ending the current contour with a line back to the starting point. Two points describe the start and end of the line. |
| conic | 5 | conic | A rational quadratic B??zier curve with 3 points describing the start point, control point and end point of the curve. A weight for the curve will ... |
| cubic | 4 | cubic | A curve-to operation describing a cubic B??zier curve with 4 points describing the start point, the two control points and the end point of the curve. |
| line | 2 | line | A line-to operation, with 2 points describing the start and end point of a straight line. |
| move | 0 | move | A move-to operation, with 1 point describing the target point. |
| quad | 3 | quad | A curve-to operation describing a quadratic B??zier curve with 3 points describing the start point, the control point and the end point of the curve. |

### Gsk.RenderNodeType

GType: `GskRenderNodeType` ?? C type: `GskRenderNodeType`

The type of a node determines what the node is rendering.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| blend_node | 20 | blend-node | A node that blends two children together |
| blur_node | 23 | blur-node | A node that applies a blur |
| border_node | 9 | border-node | A node stroking a border around an area |
| cairo_node | 2 | cairo-node | A node drawing a `cairo_surface_t` |
| clip_node | 17 | clip-node | A node that clips its child to a rectangular area |
| color_matrix_node | 15 | color-matrix-node | A node that applies a color matrix to every pixel |
| color_node | 3 | color-node | A node drawing a single color rectangle |
| conic_gradient_node | 8 | conic-gradient-node | A node drawing a conic gradient |
| container_node | 1 | container-node | A node containing a stack of children |
| cross_fade_node | 21 | cross-fade-node | A node that cross-fades between two children |
| debug_node | 24 | debug-node | Debug information that does not affect the rendering |
| fill_node | 28 | fill-node | A node that fills a path. |
| gl_shader_node | 25 | gl-shader-node | A node that uses OpenGL fragment shaders to render |
| inset_shadow_node | 11 | inset-shadow-node | A node drawing an inset shadow |
| linear_gradient_node | 4 | linear-gradient-node | A node drawing a linear gradient |
| mask_node | 27 | mask-node | A node that masks one child with another. |
| not_a_render_node | 0 | not-a-render-node | Error type. No node will ever have this type. |
| opacity_node | 14 | opacity-node | A node that changes the opacity of its child |
| outset_shadow_node | 12 | outset-shadow-node | A node drawing an outset shadow |
| radial_gradient_node | 6 | radial-gradient-node | A node drawing a radial gradient |
| repeat_node | 16 | repeat-node | A node that repeats the child's contents |
| repeating_linear_gradient_node | 5 | repeating-linear-gradient-node | A node drawing a repeating linear gradient |
| repeating_radial_gradient_node | 7 | repeating-radial-gradient-node | A node drawing a repeating radial gradient |
| rounded_clip_node | 18 | rounded-clip-node | A node that clips its child to a rounded rectangle |
| shadow_node | 19 | shadow-node | A node that draws a shadow below its child |
| stroke_node | 29 | stroke-node | A node that strokes a path. |
| subsurface_node | 30 | subsurface-node | A node that possibly redirects part of the scene graph to a subsurface. |
| text_node | 22 | text-node | A node containing a glyph string |
| texture_node | 10 | texture-node | A node drawing a `GdkTexture` |
| texture_scale_node | 26 | texture-scale-node | A node drawing a `GdkTexture` scaled and filtered. |
| transform_node | 13 | transform-node | A node that renders its child after applying a matrix transform |

### Gsk.ScalingFilter

GType: `GskScalingFilter` ?? C type: `GskScalingFilter`

The filters used when scaling texture data. The actual implementation of each filter is deferred to the rendering pipeline.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| linear | 0 | linear | linear interpolation filter |
| nearest | 1 | nearest | nearest neighbor interpolation filter |
| trilinear | 2 | trilinear | linear interpolation along each axis, plus mipmap generation, with linear interpolation along the mipmap levels |

### Gsk.SerializationError

GType: `GskSerializationError` ?? C type: `GskSerializationError`

Errors that can happen during (de)serialization.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| invalid_data | 2 | invalid-data | The given data may not exist in a proper serialization |
| unsupported_format | 0 | unsupported-format | The format can not be identified |
| unsupported_version | 1 | unsupported-version | The version of the data is not understood |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | gsk_serialization_error_quark |  |  |

### Gsk.TransformCategory

GType: `GskTransformCategory` ?? C type: `GskTransformCategory`

The categories of matrices relevant for GSK and GTK. Note that any category includes matrices of all later categories. So if you want to for exampl...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| 2d | 3 | 2d | The matrix is a 2D matrix. This is equivalent to graphene_matrix_is_2d() returning %TRUE. In particular, this means that Cairo can deal with the ma... |
| 2d_affine | 4 | 2d-affine | The matrix is a combination of 2D scale and 2D translation operations. In particular, this means that any rectangle can be transformed exactly usin... |
| 2d_translate | 5 | 2d-translate | The matrix is a 2D translation. |
| 3d | 2 | 3d | The matrix is a 3D matrix. This means that the w column (the last column) has the values (0, 0, 0, 1). |
| any | 1 | any | Analyzing the matrix concluded that it does not fit in any other category. |
| identity | 6 | identity | The matrix is the identity matrix. |
| unknown | 0 | unknown | The category of the matrix has not been determined. |

## Flags

### Gsk.PathForeachFlags

GType: `GskPathForeachFlags` ?? C type: `GskPathForeachFlags`

Flags that can be passed to gsk_path_foreach() to influence what kinds of operations the path is decomposed into. By default, [method@Gsk.Path.fore...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| conic | 4 | conic | Allow emission of `GSK_PATH_CONIC` operations. |
| cubic | 2 | cubic | Allow emission of `GSK_PATH_CUBIC` operations. |
| only_lines | 0 | only-lines | The default behavior, only allow lines. |
| quad | 1 | quad | Allow emission of `GSK_PATH_QUAD` operations |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| BroadwayRendererClass |  | 0 | 0 | 0 |  |
| CairoRendererClass |  | 0 | 0 | 0 |  |
| ColorStop |  | 0 | 0 | 0 | A color stop in a gradient node. |
| GLRendererClass |  | 0 | 0 | 0 |  |
| GLShaderClass |  | 0 | 0 | 0 |  |
| ParseLocation |  | 0 | 0 | 0 | A location in a parse buffer. |
| Path |  | 0 | 0 | 15 | A `GskPath` describes lines and curves that are more complex than simple rectangles. Paths can used for rendering (filling or stroking) and for ani... |
| PathBuilder |  | 0 | 0 | 31 | `GskPathBuilder` is an auxiliary object for constructing `GskPath` objects. A path is constructed like this: \|[<!-- language="C" --> GskPath * cons... |
| PathMeasure |  | 0 | 0 | 8 | `GskPathMeasure` is an object that allows measurements on `GskPath`s such as determining the length of the path. Many measuring operations require ... |
| PathPoint |  | 0 | 0 | 0 | `GskPathPoint` is an opaque type representing a point on a path. It can be queried for properties of the path at that point, such as its tangent or... |
| RendererClass |  | 0 | 0 | 0 |  |
| RoundedRect |  | 0 | 0 | 10 | A rectangular region with rounded corners. Application code should normalize rectangles using [method@Gsk.RoundedRect.normalize]; this function wil... |
| ShaderArgsBuilder |  | 0 | 0 | 12 | An object to build the uniforms data for a `GskGLShader`. |
| Shadow |  | 0 | 0 | 0 | The shadow parameters in a shadow node. |
| Stroke |  | 0 | 0 | 17 | A `GskStroke` struct collects the parameters that influence the operation of stroking a path. |
| Transform |  | 0 | 0 | 26 | `GskTransform` is an object to describe transform matrices. Unlike `graphene_matrix_t`, `GskTransform` retains the steps in how a transform was con... |
| VulkanRendererClass |  | 0 | 0 | 0 |  |

### Gsk.BroadwayRendererClass

C type: `GskBroadwayRendererClass`

### Gsk.CairoRendererClass

C type: `GskCairoRendererClass`

### Gsk.ColorStop

C type: `GskColorStop`

A color stop in a gradient node.

#### Fields

| Field | Type |
| --- | --- |
| color | Gdk.RGBA |
| offset | gfloat |

### Gsk.GLRendererClass

C type: `GskGLRendererClass`

### Gsk.GLShaderClass

C type: `GskGLShaderClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Gsk.ParseLocation

C type: `GskParseLocation`

A location in a parse buffer.

#### Fields

| Field | Type |
| --- | --- |
| bytes | gsize |
| chars | gsize |
| line_bytes | gsize |
| line_chars | gsize |
| lines | gsize |

### Gsk.Path

GType: `GskPath` ?? C type: `GskPath`

A `GskPath` describes lines and curves that are more complex than simple rectangles. Paths can used for rendering (filling or stroking) and for ani...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| parse | `parse(string: utf8) -> Path` | gsk_path_parse | 4.14 | This is a convenience function that constructs a `GskPath` from a serialized form. The string is expected to be in (a superset of) SVG path syntax,... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| foreach | `Path.foreach(flags: PathForeachFlags, func: PathForeachFunc, user_data: gpointer?) -> gboolean` | gsk_path_foreach | 4.14 | Calls @func for every operation of the path. Note that this may only approximate @self, because paths can contain optimizations for various special... |
| get_bounds | `Path.get_bounds(bounds: out Graphene.Rect) -> gboolean` | gsk_path_get_bounds | 4.14 | Computes the bounds of the given path. The returned bounds may be larger than necessary, because this function aims to be fast, not accurate. The b... |
| get_closest_point | `Path.get_closest_point(point: Graphene.Point, threshold: gfloat, result: out PathPoint, distance: out gfloat?) -> gboolean` | gsk_path_get_closest_point | 4.14 | Computes the closest point on the path to the given point and sets the @result to it. If there is no point closer than the given threshold, `FALSE`... |
| get_end_point | `Path.get_end_point(result: out PathPoint) -> gboolean` | gsk_path_get_end_point | 4.14 | Gets the end point of the path. An empty path has no points, so `FALSE` is returned in this case. |
| get_start_point | `Path.get_start_point(result: out PathPoint) -> gboolean` | gsk_path_get_start_point | 4.14 | Gets the start point of the path. An empty path has no points, so `FALSE` is returned in this case. |
| get_stroke_bounds | `Path.get_stroke_bounds(stroke: Stroke, bounds: out Graphene.Rect) -> gboolean` | gsk_path_get_stroke_bounds | 4.14 | Computes the bounds for stroking the given path with the parameters in @stroke. The returned bounds may be larger than necessary, because this func... |
| in_fill | `Path.in_fill(point: Graphene.Point, fill_rule: FillRule) -> gboolean` | gsk_path_in_fill | 4.14 | Returns whether the given point is inside the area that would be affected if the path was filled according to @fill_rule. Note that this function a... |
| is_closed | `Path.is_closed() -> gboolean` | gsk_path_is_closed | 4.14 | Returns if the path represents a single closed contour. |
| is_empty | `Path.is_empty() -> gboolean` | gsk_path_is_empty | 4.14 | Checks if the path is empty, i.e. contains no lines or curves. |
| print | `Path.print(string: GLib.String) -> none` | gsk_path_print | 4.14 | Converts @self into a human-readable string representation suitable for printing. The string is compatible with (a superset of) SVG path syntax, se... |
| ref | `Path.ref() -> Path` | gsk_path_ref | 4.14 | Increases the reference count of a `GskPath` by one. |
| to_cairo | `Path.to_cairo(cr: cairo.Context) -> none` | gsk_path_to_cairo | 4.14 | Appends the given @path to the given cairo context for drawing with Cairo. This may cause some suboptimal conversions to be performed as Cairo does... |
| to_string | `Path.to_string() -> utf8` | gsk_path_to_string | 4.14 | Converts the path into a string that is suitable for printing. You can use this function in a debugger to get a quick overview of the path. This is... |
| unref | `Path.unref() -> none` | gsk_path_unref | 4.14 | Decreases the reference count of a `GskPath` by one. If the resulting reference count is zero, frees the path. |

### Gsk.PathBuilder

GType: `GskPathBuilder` ?? C type: `GskPathBuilder`

`GskPathBuilder` is an auxiliary object for constructing `GskPath` objects. A path is constructed like this: |[<!-- language="C" --> GskPath * cons...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `PathBuilder.new() -> PathBuilder` | gsk_path_builder_new | 4.14 | Create a new `GskPathBuilder` object. The resulting builder would create an empty `GskPath`. Use addition functions to add types to it. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_cairo_path | `PathBuilder.add_cairo_path(path: cairo.Path) -> none` | gsk_path_builder_add_cairo_path | 4.14 | Adds a Cairo path to the builder. You can use cairo_copy_path() to access the path from a Cairo context. |
| add_circle | `PathBuilder.add_circle(center: Graphene.Point, radius: gfloat) -> none` | gsk_path_builder_add_circle | 4.14 | Adds a circle with the @center and @radius. The path is going around the circle in clockwise direction. If @radius is zero, the contour will be a c... |
| add_layout | `PathBuilder.add_layout(layout: Pango.Layout) -> none` | gsk_path_builder_add_layout | 4.14 | Adds the outlines for the glyphs in @layout to the builder. |
| add_path | `PathBuilder.add_path(path: Path) -> none` | gsk_path_builder_add_path | 4.14 | Appends all of @path to the builder. |
| add_rect | `PathBuilder.add_rect(rect: Graphene.Rect) -> none` | gsk_path_builder_add_rect | 4.14 | Adds @rect as a new contour to the path built by the builder. The path is going around the rectangle in clockwise direction. If the the width or he... |
| add_reverse_path | `PathBuilder.add_reverse_path(path: Path) -> none` | gsk_path_builder_add_reverse_path | 4.14 | Appends all of @path to the builder, in reverse order. |
| add_rounded_rect | `PathBuilder.add_rounded_rect(rect: RoundedRect) -> none` | gsk_path_builder_add_rounded_rect | 4.14 | Adds @rect as a new contour to the path built in @self. The path is going around the rectangle in clockwise direction. |
| add_segment | `PathBuilder.add_segment(path: Path, start: PathPoint, end: PathPoint) -> none` | gsk_path_builder_add_segment | 4.14 | Adds to @self the segment of @path from @start to @end. If @start is equal to or after @end, the path will first add the segment from @start to the... |
| arc_to | `PathBuilder.arc_to(x1: gfloat, y1: gfloat, x2: gfloat, y2: gfloat) -> none` | gsk_path_builder_arc_to | 4.14 | Adds an elliptical arc from the current point to @x2, @y2 with @x1, @y1 determining the tangent directions. After this, @x2, @y2 will be the new cu... |
| close | `PathBuilder.close() -> none` | gsk_path_builder_close | 4.14 | Ends the current contour with a line back to the start point. Note that this is different from calling [method@Gsk.PathBuilder.line_to] with the st... |
| conic_to | `PathBuilder.conic_to(x1: gfloat, y1: gfloat, x2: gfloat, y2: gfloat, weight: gfloat) -> none` | gsk_path_builder_conic_to | 4.14 | Adds a conic curve from the current point to @x2, @y2 with the given @weight and @x1, @y1 as the control point. The weight determines how strongly ... |
| cubic_to | `PathBuilder.cubic_to(x1: gfloat, y1: gfloat, x2: gfloat, y2: gfloat, x3: gfloat, y3: gfloat) -> none` | gsk_path_builder_cubic_to | 4.14 | Adds a cubic B??zier curve from the current point to @x3, @y3 with @x1, @y1 and @x2, @y2 as the control points. After this, @x3, @y3 will be the ne... |
| free_to_path | `PathBuilder.free_to_path() -> Path` | gsk_path_builder_free_to_path | 4.14 | Creates a new `GskPath` from the current state of the given builder, and unrefs the @builder instance. |
| get_current_point | `PathBuilder.get_current_point() -> Graphene.Point` | gsk_path_builder_get_current_point | 4.14 | Gets the current point. The current point is used for relative drawing commands and updated after every operation. When the builder is created, the... |
| html_arc_to | `PathBuilder.html_arc_to(x1: gfloat, y1: gfloat, x2: gfloat, y2: gfloat, radius: gfloat) -> none` | gsk_path_builder_html_arc_to | 4.14 | Implements arc-to according to the HTML Canvas spec. A convenience function that implements the HTML arc_to functionality. After this, the current ... |
| line_to | `PathBuilder.line_to(x: gfloat, y: gfloat) -> none` | gsk_path_builder_line_to | 4.14 | Draws a line from the current point to @x, @y and makes it the new current point. <picture> <source srcset="line-dark.png" media="(prefers-color-sc... |
| move_to | `PathBuilder.move_to(x: gfloat, y: gfloat) -> none` | gsk_path_builder_move_to | 4.14 | Starts a new contour by placing the pen at @x, @y. If this function is called twice in succession, the first call will result in a contour made up ... |
| quad_to | `PathBuilder.quad_to(x1: gfloat, y1: gfloat, x2: gfloat, y2: gfloat) -> none` | gsk_path_builder_quad_to | 4.14 | Adds a quadratic B??zier curve from the current point to @x2, @y2 with @x1, @y1 as the control point. After this, @x2, @y2 will be the new current ... |
| ref | `PathBuilder.ref() -> PathBuilder` | gsk_path_builder_ref | 4.14 | Acquires a reference on the given builder. This function is intended primarily for language bindings. `GskPathBuilder` objects should not be kept a... |
| rel_arc_to | `PathBuilder.rel_arc_to(x1: gfloat, y1: gfloat, x2: gfloat, y2: gfloat) -> none` | gsk_path_builder_rel_arc_to | 4.14 | Adds an elliptical arc from the current point to @x2, @y2 with @x1, @y1 determining the tangent directions. All coordinates are given relative to t... |
| rel_conic_to | `PathBuilder.rel_conic_to(x1: gfloat, y1: gfloat, x2: gfloat, y2: gfloat, weight: gfloat) -> none` | gsk_path_builder_rel_conic_to | 4.14 | Adds a conic curve from the current point to @x2, @y2 with the given @weight and @x1, @y1 as the control point. All coordinates are given relative ... |
| rel_cubic_to | `PathBuilder.rel_cubic_to(x1: gfloat, y1: gfloat, x2: gfloat, y2: gfloat, x3: gfloat, y3: gfloat) -> none` | gsk_path_builder_rel_cubic_to | 4.14 | Adds a cubic B??zier curve from the current point to @x3, @y3 with @x1, @y1 and @x2, @y2 as the control points. All coordinates are given relative ... |
| rel_html_arc_to | `PathBuilder.rel_html_arc_to(x1: gfloat, y1: gfloat, x2: gfloat, y2: gfloat, radius: gfloat) -> none` | gsk_path_builder_rel_html_arc_to | 4.14 | Implements arc-to according to the HTML Canvas spec. All coordinates are given relative to the current point. This is the relative version of [meth... |
| rel_line_to | `PathBuilder.rel_line_to(x: gfloat, y: gfloat) -> none` | gsk_path_builder_rel_line_to | 4.14 | Draws a line from the current point to a point offset from it by @x, @y and makes it the new current point. This is the relative version of [method... |
| rel_move_to | `PathBuilder.rel_move_to(x: gfloat, y: gfloat) -> none` | gsk_path_builder_rel_move_to | 4.14 | Starts a new contour by placing the pen at @x, @y relative to the current point. This is the relative version of [method@Gsk.PathBuilder.move_to]. |
| rel_quad_to | `PathBuilder.rel_quad_to(x1: gfloat, y1: gfloat, x2: gfloat, y2: gfloat) -> none` | gsk_path_builder_rel_quad_to | 4.14 | Adds a quadratic B??zier curve from the current point to @x2, @y2 with @x1, @y1 the control point. All coordinates are given relative to the curren... |
| rel_svg_arc_to | `PathBuilder.rel_svg_arc_to(rx: gfloat, ry: gfloat, x_axis_rotation: gfloat, large_arc: gboolean, positive_sweep: gboolean, x: gfloat, y: gfloat) -> none` | gsk_path_builder_rel_svg_arc_to | 4.14 | Implements arc-to according to the SVG spec. All coordinates are given relative to the current point. This is the relative version of [method@Gsk.P... |
| svg_arc_to | `PathBuilder.svg_arc_to(rx: gfloat, ry: gfloat, x_axis_rotation: gfloat, large_arc: gboolean, positive_sweep: gboolean, x: gfloat, y: gfloat) -> none` | gsk_path_builder_svg_arc_to | 4.14 | Implements arc-to according to the SVG spec. A convenience function that implements the SVG arc_to functionality. After this, @x, @y will be the ne... |
| to_path | `PathBuilder.to_path() -> Path` | gsk_path_builder_to_path | 4.14 | Creates a new `GskPath` from the given builder. The given `GskPathBuilder` is reset once this function returns; you cannot call this function multi... |
| unref | `PathBuilder.unref() -> none` | gsk_path_builder_unref | 4.14 | Releases a reference on the given builder. |

### Gsk.PathMeasure

GType: `GskPathMeasure` ?? C type: `GskPathMeasure`

`GskPathMeasure` is an object that allows measurements on `GskPath`s such as determining the length of the path. Many measuring operations require ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `PathMeasure.new(path: Path) -> PathMeasure` | gsk_path_measure_new | 4.14 | Creates a measure object for the given @path with the default tolerance. |
| new_with_tolerance | `PathMeasure.new_with_tolerance(path: Path, tolerance: gfloat) -> PathMeasure` | gsk_path_measure_new_with_tolerance | 4.14 | Creates a measure object for the given @path and @tolerance. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_length | `PathMeasure.get_length() -> gfloat` | gsk_path_measure_get_length | 4.14 | Gets the length of the path being measured. The length is cached, so this function does not do any work. |
| get_path | `PathMeasure.get_path() -> Path` | gsk_path_measure_get_path | 4.14 | Returns the path that the measure was created for. |
| get_point | `PathMeasure.get_point(distance: gfloat, result: out PathPoint) -> gboolean` | gsk_path_measure_get_point | 4.14 | Sets @result to the point at the given distance into the path. An empty path has no points, so `FALSE` is returned in that case. |
| get_tolerance | `PathMeasure.get_tolerance() -> gfloat` | gsk_path_measure_get_tolerance | 4.14 | Returns the tolerance that the measure was created with. |
| ref | `PathMeasure.ref() -> PathMeasure` | gsk_path_measure_ref | 4.14 | Increases the reference count of a `GskPathMeasure` by one. |
| unref | `PathMeasure.unref() -> none` | gsk_path_measure_unref | 4.14 | Decreases the reference count of a `GskPathMeasure` by one. If the resulting reference count is zero, frees the object. |

### Gsk.PathPoint

GType: `GskPathPoint` ?? C type: `GskPathPoint`

`GskPathPoint` is an opaque type representing a point on a path. It can be queried for properties of the path at that point, such as its tangent or...

#### Fields

| Field | Type |
| --- | --- |
| contour | gsize |
| idx | gsize |
| t | gfloat |

### Gsk.RendererClass

C type: `GskRendererClass`

### Gsk.RoundedRect

C type: `GskRoundedRect`

A rectangular region with rounded corners. Application code should normalize rectangles using [method@Gsk.RoundedRect.normalize]; this function wil...

#### Fields

| Field | Type |
| --- | --- |
| bounds | Graphene.Rect |
| corner | Graphene.Size |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| contains_point | `RoundedRect.contains_point(point: Graphene.Point) -> gboolean` | gsk_rounded_rect_contains_point |  | Checks if the given @point is inside the rounded rectangle. |
| contains_rect | `RoundedRect.contains_rect(rect: Graphene.Rect) -> gboolean` | gsk_rounded_rect_contains_rect |  | Checks if the given @rect is contained inside the rounded rectangle. |
| init | `RoundedRect.init(bounds: Graphene.Rect, top_left: Graphene.Size, top_right: Graphene.Size, bottom_right: Graphene.Size, bottom_left: Graphene.Size) -> RoundedRect` | gsk_rounded_rect_init |  | Initializes the given `GskRoundedRect` with the given values. This function will implicitly normalize the `GskRoundedRect` before returning. |
| init_copy | `RoundedRect.init_copy(src: RoundedRect) -> RoundedRect` | gsk_rounded_rect_init_copy |  | Initializes @self using the given @src rectangle. This function will not normalize the `GskRoundedRect`, so make sure the source is normalized. |
| init_from_rect | `RoundedRect.init_from_rect(bounds: Graphene.Rect, radius: gfloat) -> RoundedRect` | gsk_rounded_rect_init_from_rect |  | Initializes @self to the given @bounds and sets the radius of all four corners to @radius. |
| intersects_rect | `RoundedRect.intersects_rect(rect: Graphene.Rect) -> gboolean` | gsk_rounded_rect_intersects_rect |  | Checks if part of the given @rect is contained inside the rounded rectangle. |
| is_rectilinear | `RoundedRect.is_rectilinear() -> gboolean` | gsk_rounded_rect_is_rectilinear |  | Checks if all corners of @self are right angles and the rectangle covers all of its bounds. This information can be used to decide if [ctor@Gsk.Cli... |
| normalize | `RoundedRect.normalize() -> RoundedRect` | gsk_rounded_rect_normalize |  | Normalizes the passed rectangle. This function will ensure that the bounds of the rectangle are normalized and ensure that the corner values are po... |
| offset | `RoundedRect.offset(dx: gfloat, dy: gfloat) -> RoundedRect` | gsk_rounded_rect_offset |  | Offsets the bound's origin by @dx and @dy. The size and corners of the rectangle are unchanged. |
| shrink | `RoundedRect.shrink(top: gfloat, right: gfloat, bottom: gfloat, left: gfloat) -> RoundedRect` | gsk_rounded_rect_shrink |  | Shrinks (or grows) the given rectangle by moving the 4 sides according to the offsets given. The corner radii will be changed in a way that tries t... |

### Gsk.ShaderArgsBuilder

GType: `GskShaderArgsBuilder` ?? C type: `GskShaderArgsBuilder`

An object to build the uniforms data for a `GskGLShader`.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ShaderArgsBuilder.new(shader: GLShader, initial_values: GLib.Bytes?) -> ShaderArgsBuilder` | gsk_shader_args_builder_new |  | Allocates a builder that can be used to construct a new uniform data chunk. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free_to_args | `ShaderArgsBuilder.free_to_args() -> GLib.Bytes` | gsk_shader_args_builder_free_to_args |  | Creates a new `GBytes` args from the current state of the given @builder, and frees the @builder instance. Any uniforms of the shader that have not... |
| ref | `ShaderArgsBuilder.ref() -> ShaderArgsBuilder` | gsk_shader_args_builder_ref |  | Increases the reference count of a `GskShaderArgsBuilder` by one. |
| set_bool | `ShaderArgsBuilder.set_bool(idx: gint, value: gboolean) -> none` | gsk_shader_args_builder_set_bool |  | Sets the value of the uniform @idx. The uniform must be of bool type. |
| set_float | `ShaderArgsBuilder.set_float(idx: gint, value: gfloat) -> none` | gsk_shader_args_builder_set_float |  | Sets the value of the uniform @idx. The uniform must be of float type. |
| set_int | `ShaderArgsBuilder.set_int(idx: gint, value: gint32) -> none` | gsk_shader_args_builder_set_int |  | Sets the value of the uniform @idx. The uniform must be of int type. |
| set_uint | `ShaderArgsBuilder.set_uint(idx: gint, value: guint32) -> none` | gsk_shader_args_builder_set_uint |  | Sets the value of the uniform @idx. The uniform must be of uint type. |
| set_vec2 | `ShaderArgsBuilder.set_vec2(idx: gint, value: Graphene.Vec2) -> none` | gsk_shader_args_builder_set_vec2 |  | Sets the value of the uniform @idx. The uniform must be of vec2 type. |
| set_vec3 | `ShaderArgsBuilder.set_vec3(idx: gint, value: Graphene.Vec3) -> none` | gsk_shader_args_builder_set_vec3 |  | Sets the value of the uniform @idx. The uniform must be of vec3 type. |
| set_vec4 | `ShaderArgsBuilder.set_vec4(idx: gint, value: Graphene.Vec4) -> none` | gsk_shader_args_builder_set_vec4 |  | Sets the value of the uniform @idx. The uniform must be of vec4 type. |
| to_args | `ShaderArgsBuilder.to_args() -> GLib.Bytes` | gsk_shader_args_builder_to_args |  | Creates a new `GBytes` args from the current state of the given @builder. Any uniforms of the shader that have not been explicitly set on the @buil... |
| unref | `ShaderArgsBuilder.unref() -> none` | gsk_shader_args_builder_unref |  | Decreases the reference count of a `GskShaderArgBuilder` by one. If the resulting reference count is zero, frees the builder. |

### Gsk.Shadow

C type: `GskShadow`

The shadow parameters in a shadow node.

#### Fields

| Field | Type |
| --- | --- |
| color | Gdk.RGBA |
| dx | gfloat |
| dy | gfloat |
| radius | gfloat |

### Gsk.Stroke

GType: `GskStroke` ?? C type: `GskStroke`

A `GskStroke` struct collects the parameters that influence the operation of stroking a path.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Stroke.new(line_width: gfloat) -> Stroke` | gsk_stroke_new | 4.14 | Creates a new `GskStroke` with the given @line_width. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| equal | `equal(stroke1: gpointer?, stroke2: gpointer?) -> gboolean` | gsk_stroke_equal | 4.14 | Checks if 2 strokes are identical. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Stroke.copy() -> Stroke` | gsk_stroke_copy | 4.14 | Creates a copy of the given @other stroke. |
| free | `Stroke.free() -> none` | gsk_stroke_free | 4.14 | Frees a `GskStroke`. |
| get_dash | `Stroke.get_dash(n_dash: out gsize) -> gfloat` | gsk_stroke_get_dash | 4.14 | Gets the dash array in use or `NULL` if dashing is disabled. |
| get_dash_offset | `Stroke.get_dash_offset() -> gfloat` | gsk_stroke_get_dash_offset | 4.14 | Returns the dash_offset of a `GskStroke`. |
| get_line_cap | `Stroke.get_line_cap() -> LineCap` | gsk_stroke_get_line_cap | 4.14 | Gets the line cap used. See [enum@Gsk.LineCap] for details. |
| get_line_join | `Stroke.get_line_join() -> LineJoin` | gsk_stroke_get_line_join | 4.14 | Gets the line join used. See [enum@Gsk.LineJoin] for details. |
| get_line_width | `Stroke.get_line_width() -> gfloat` | gsk_stroke_get_line_width | 4.14 | Gets the line width used. |
| get_miter_limit | `Stroke.get_miter_limit() -> gfloat` | gsk_stroke_get_miter_limit | 4.14 | Returns the miter limit of a `GskStroke`. |
| set_dash | `Stroke.set_dash(dash: gfloat?, n_dash: gsize) -> none` | gsk_stroke_set_dash | 4.14 | Sets the dash pattern to use by this stroke. A dash pattern is specified by an array of alternating non-negative values. Each value provides the le... |
| set_dash_offset | `Stroke.set_dash_offset(offset: gfloat) -> none` | gsk_stroke_set_dash_offset | 4.14 | Sets the offset into the dash pattern where dashing should begin. This is an offset into the length of the path, not an index into the array values... |
| set_line_cap | `Stroke.set_line_cap(line_cap: LineCap) -> none` | gsk_stroke_set_line_cap | 4.14 | Sets the line cap to be used when stroking. See [enum@Gsk.LineCap] for details. |
| set_line_join | `Stroke.set_line_join(line_join: LineJoin) -> none` | gsk_stroke_set_line_join | 4.14 | Sets the line join to be used when stroking. See [enum@Gsk.LineJoin] for details. |
| set_line_width | `Stroke.set_line_width(line_width: gfloat) -> none` | gsk_stroke_set_line_width | 4.14 | Sets the line width to be used when stroking. The line width must be > 0. |
| set_miter_limit | `Stroke.set_miter_limit(limit: gfloat) -> none` | gsk_stroke_set_miter_limit | 4.14 | Sets the limit for the distance from the corner where sharp turns of joins get cut off. The miter limit is in units of line width and must be non-n... |
| to_cairo | `Stroke.to_cairo(cr: cairo.Context) -> none` | gsk_stroke_to_cairo | 4.14 | A helper function that sets the stroke parameters of @cr from the values found in @self. |

### Gsk.Transform

GType: `GskTransform` ?? C type: `GskTransform`

`GskTransform` is an object to describe transform matrices. Unlike `graphene_matrix_t`, `GskTransform` retains the steps in how a transform was con...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Transform.new() -> Transform` | gsk_transform_new |  |  |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| parse | `parse(string: utf8, out_transform: out Transform) -> gboolean` | gsk_transform_parse |  | Parses the given @string into a transform and puts it in @out_transform. Strings printed via [method@Gsk.Transform.to_string] can be read in again ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| equal | `Transform.equal(second: Transform?) -> gboolean` | gsk_transform_equal |  | Checks two transforms for equality. |
| get_category | `Transform.get_category() -> TransformCategory` | gsk_transform_get_category |  | Returns the category this transform belongs to. |
| invert | `Transform.invert() -> Transform` | gsk_transform_invert |  | Inverts the given transform. If @self is not invertible, %NULL is returned. Note that inverting %NULL also returns %NULL, which is the correct inve... |
| matrix | `Transform.matrix(matrix: Graphene.Matrix) -> Transform` | gsk_transform_matrix |  | Multiplies @next with the given @matrix. |
| perspective | `Transform.perspective(depth: gfloat) -> Transform` | gsk_transform_perspective |  | Applies a perspective projection transform. This transform scales points in X and Y based on their Z value, scaling points with positive Z values a... |
| print | `Transform.print(string: GLib.String) -> none` | gsk_transform_print |  | Converts @self into a human-readable string representation suitable for printing. The result of this function can later be parsed with [func@Gsk.Tr... |
| ref | `Transform.ref() -> Transform` | gsk_transform_ref |  | Acquires a reference on the given `GskTransform`. |
| rotate | `Transform.rotate(angle: gfloat) -> Transform` | gsk_transform_rotate |  | Rotates @next @angle degrees in 2D - or in 3D-speak, around the Z axis. The rotation happens around the origin point of (0, 0). |
| rotate_3d | `Transform.rotate_3d(angle: gfloat, axis: Graphene.Vec3) -> Transform` | gsk_transform_rotate_3d |  | Rotates @next @angle degrees around @axis. For a rotation in 2D space, use [method@Gsk.Transform.rotate] |
| scale | `Transform.scale(factor_x: gfloat, factor_y: gfloat) -> Transform` | gsk_transform_scale |  | Scales @next in 2-dimensional space by the given factors. Use [method@Gsk.Transform.scale_3d] to scale in all 3 dimensions. |
| scale_3d | `Transform.scale_3d(factor_x: gfloat, factor_y: gfloat, factor_z: gfloat) -> Transform` | gsk_transform_scale_3d |  | Scales @next by the given factors. |
| skew | `Transform.skew(skew_x: gfloat, skew_y: gfloat) -> Transform` | gsk_transform_skew | 4.6 | Applies a skew transform. |
| to_2d | `Transform.to_2d(out_xx: out gfloat, out_yx: out gfloat, out_xy: out gfloat, out_yy: out gfloat, out_dx: out gfloat, out_dy: out gfloat) -> none` | gsk_transform_to_2d |  | Converts a `GskTransform` to a 2D transformation matrix. @self must be a 2D transformation. If you are not sure, use gsk_transform_get_category() >... |
| to_2d_components | `Transform.to_2d_components(out_skew_x: out gfloat, out_skew_y: out gfloat, out_scale_x: out gfloat, out_scale_y: out gfloat, out_angle: out gfloat, out_dx: out gfloat, out_dy: out gfloat) -> none` | gsk_transform_to_2d_components | 4.6 | Converts a `GskTransform` to 2D transformation factors. To recreate an equivalent transform from the factors returned by this function, use gsk_tra... |
| to_affine | `Transform.to_affine(out_scale_x: out gfloat, out_scale_y: out gfloat, out_dx: out gfloat, out_dy: out gfloat) -> none` | gsk_transform_to_affine |  | Converts a `GskTransform` to 2D affine transformation factors. To recreate an equivalent transform from the factors returned by this function, use ... |
| to_matrix | `Transform.to_matrix(out_matrix: out Graphene.Matrix) -> none` | gsk_transform_to_matrix |  | Computes the actual value of @self and stores it in @out_matrix. The previous value of @out_matrix will be ignored. |
| to_string | `Transform.to_string() -> utf8` | gsk_transform_to_string |  | Converts a matrix into a string that is suitable for printing. The resulting string can be parsed with [func@Gsk.Transform.parse]. This is a wrappe... |
| to_translate | `Transform.to_translate(out_dx: out gfloat, out_dy: out gfloat) -> none` | gsk_transform_to_translate |  | Converts a `GskTransform` to a translation operation. @self must be a 2D transformation. If you are not sure, use gsk_transform_get_category() >= %... |
| transform | `Transform.transform(other: Transform?) -> Transform` | gsk_transform_transform |  | Applies all the operations from @other to @next. |
| transform_bounds | `Transform.transform_bounds(rect: Graphene.Rect, out_rect: out Graphene.Rect) -> none` | gsk_transform_transform_bounds |  | Transforms a `graphene_rect_t` using the given transform @self. The result is the bounding box containing the coplanar quad. |
| transform_point | `Transform.transform_point(point: Graphene.Point, out_point: out Graphene.Point) -> none` | gsk_transform_transform_point |  | Transforms a `graphene_point_t` using the given transform @self. |
| translate | `Transform.translate(point: Graphene.Point) -> Transform` | gsk_transform_translate |  | Translates @next in 2-dimensional space by @point. |
| translate_3d | `Transform.translate_3d(point: Graphene.Point3D) -> Transform` | gsk_transform_translate_3d |  | Translates @next by @point. |
| unref | `Transform.unref() -> none` | gsk_transform_unref |  | Releases a reference on the given `GskTransform`. If the reference was the last, the resources associated to the @self are freed. |

### Gsk.VulkanRendererClass

C type: `GskVulkanRendererClass`

## Unions

### Gsk.unknown

#### Fields

| Field | Type |
| --- | --- |
| alignment | Graphene.Vec4 |
| contour | gsize |
| idx | gsize |
| padding | gpointer |
| t | gfloat |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| path_parse | `path_parse(string: utf8) -> Path` | gsk_path_parse | 4.14 | This is a convenience function that constructs a `GskPath` from a serialized form. The string is expected to be in (a superset of) SVG path syntax,... |
| serialization_error_quark | `serialization_error_quark() -> GLib.Quark` | gsk_serialization_error_quark |  |  |
| stroke_equal | `stroke_equal(stroke1: gpointer?, stroke2: gpointer?) -> gboolean` | gsk_stroke_equal | 4.14 | Checks if 2 strokes are identical. |
| transform_parse | `transform_parse(string: utf8, out_transform: out Transform) -> gboolean` | gsk_transform_parse |  | Parses the given @string into a transform and puts it in @out_transform. Strings printed via [method@Gsk.Transform.to_string] can be read in again ... |
| value_dup_render_node | `value_dup_render_node(value: GObject.Value) -> RenderNode` | gsk_value_dup_render_node | 4.6 | Retrieves the `GskRenderNode` stored inside the given `value`, and acquires a reference to it. |
| value_get_render_node | `value_get_render_node(value: GObject.Value) -> RenderNode` | gsk_value_get_render_node | 4.6 | Retrieves the `GskRenderNode` stored inside the given `value`. |
| value_set_render_node | `value_set_render_node(value: GObject.Value, node: RenderNode) -> none` | gsk_value_set_render_node | 4.6 | Stores the given `GskRenderNode` inside `value`. The [struct@GObject.Value] will acquire a reference to the `node`. |
| value_take_render_node | `value_take_render_node(value: GObject.Value, node: RenderNode?) -> none` | gsk_value_take_render_node | 4.6 | Stores the given `GskRenderNode` inside `value`. This function transfers the ownership of the `node` to the `GValue`. |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ParseErrorFunc | `ParseErrorFunc(start: ParseLocation, end: ParseLocation, error: GLib.Error, user_data: gpointer?) -> none` |  |  | Type of callback that is called when an error occurs during node deserialization. |
| PathForeachFunc | `PathForeachFunc(op: PathOperation, pts: Graphene.Point, n_pts: gsize, weight: gfloat, user_data: gpointer?) -> gboolean` |  |  | Prototype of the callback to iterate through the operations of a path. For each operation, the callback is given the @op itself, the points that th... |

