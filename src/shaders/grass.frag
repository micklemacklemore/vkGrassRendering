#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare fragment shader inputs
layout(location = 0) in vec4 v0_in;
layout(location = 1) in vec4 v1_in;
layout(location = 2) in vec4 v2_in;
layout(location = 3) in vec4 up_in;
layout(location = 4) in float u; 
layout(location = 5) in float v; 

layout(location = 0) out vec4 outColor;

void main() {
    // TODO: Compute fragment color
    // Define the dark green and light green colors
    vec3 darkGreen = vec3(0.0, 0.5, 0.0);  // Dark green
    vec3 lightGreen = vec3(0.5, 1.0, 0.5); // Light green

    // Interpolate the grass color between darkGreen and lightGreen
    vec3 grassColor = mix(darkGreen, lightGreen, v);

    outColor = vec4(grassColor, 1.);
}
