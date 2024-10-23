#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(vertices = 1) out;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

layout(location = 0) in vec4 v0_in[];
layout(location = 1) in vec4 v1_in[];
layout(location = 2) in vec4 v2_in[];
layout(location = 3) in vec4 up_in[];

layout(location = 0) out vec4 v0_out[];
layout(location = 1) out vec4 v1_out[];
layout(location = 2) out vec4 v2_out[];
layout(location = 3) out vec4 up_out[];

// TODO: Declare tessellation control shader inputs and outputs
in gl_PerVertex
{
  vec4 gl_Position;
} gl_in[gl_MaxPatchVertices];


void main() {
	// Don't move the origin location of the patch
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;

	// TODO: Write any shader outputs
    vec4 v0_out = v0_in[0];
    vec4 v1_out = v1_in[0];
    vec4 v2_out = v2_in[0];
    vec4 up_out = up_in[0];

	// TODO: Set level of tesselation
    // gl_TessLevelInner[0] = ???
    // gl_TessLevelInner[1] = ???
    // gl_TessLevelOuter[0] = ???
    // gl_TessLevelOuter[1] = ???
    // gl_TessLevelOuter[2] = ???
    // gl_TessLevelOuter[3] = ???
    gl_TessLevelInner[0] = 2.0;
	gl_TessLevelInner[1] = 2.0;
	gl_TessLevelOuter[0] = 2.0;
	gl_TessLevelOuter[1] = 2.0;
	gl_TessLevelOuter[2] = 2.0;
	gl_TessLevelOuter[3] = 2.0;
}
