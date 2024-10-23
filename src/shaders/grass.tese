#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(quads, equal_spacing, ccw) in;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare tessellation evaluation shader inputs and outputs
layout(location = 0) in vec4 v0_in[];
layout(location = 1) in vec4 v1_in[];
layout(location = 2) in vec4 v2_in[];
layout(location = 3) in vec4 up_in[];

layout(location = 0) out vec4 v0_out;
layout(location = 1) out vec4 v1_out;
layout(location = 2) out vec4 v2_out;
layout(location = 3) out vec4 up_out;
layout(location = 4) out float u_out; 
layout(location = 5) out float v_out; 


void main() {
    float u = gl_TessCoord.x;
    float v = gl_TessCoord.y;

    u_out = u; 
    v_out = v; 

	// TODO: Use u and v to parameterize along the grass blade and output positions for each vertex of the grass blade
    gl_Position = camera.proj * camera.view * (gl_in[0].gl_Position + vec4(0.3 * (1.0 - v) * (.5 - u), v, 0.0, 0.0));
}
