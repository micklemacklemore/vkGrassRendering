#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(quads, equal_spacing, ccw) in;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

layout(location = 0) in vec4 v0_in[];
layout(location = 1) in vec4 v1_in[];
layout(location = 2) in vec4 v2_in[];
layout(location = 3) in vec4 up_in[];

layout(location = 0) out float v_out; 

mat4 rot(vec3 axis, float angle)
{
    axis = normalize(axis);
    float s = sin(angle);
    float c = cos(angle);
    float oc = 1.0 - c;
    
    return mat4(oc * axis.x * axis.x + c,           oc * axis.x * axis.y - axis.z * s,  oc * axis.z * axis.x + axis.y * s,  0.0,
                oc * axis.x * axis.y + axis.z * s,  oc * axis.y * axis.y + c,           oc * axis.y * axis.z - axis.x * s,  0.0,
                oc * axis.z * axis.x - axis.y * s,  oc * axis.y * axis.z + axis.x * s,  oc * axis.z * axis.z + c,           0.0,
                0.0,                                0.0,                                0.0,                                1.0);
}

void main() {
    float u = gl_TessCoord.x;
    float v = gl_TessCoord.y;

    v_out = v; 

    vec3 v0 = gl_in[0].gl_Position.xyz;
    vec3 v1 = v1_in[0].xyz;
    vec3 v2 = v2_in[0].xyz;
    float width = v2_in[0].w; 
    float height = v1_in[0].w; 

    mat4 rotation = rot(up_in[0].xyz, v0_in[0].w);
    vec3 t1 = (rotation * vec4(1, 0, 0, 0)).xyz;
    vec3 a = v0 + v * (v1 - v0); 
    vec3 b = v1 + v * (v2 - v1); 
    vec3 c = a + v * (b - a); 
    vec3 c0 = c - width * t1;
    vec3 c1 = c + width * t1;

    // vec3 t0 = normalize(b - a); 
    // vec3 n = normalize(cross(t0, t1)); 

    float t = u - u * v * v; 
    vec3 pos = (1. - t) * c0 + t * c1; 

    gl_Position = camera.proj * camera.view * vec4(pos, 1); 
}
