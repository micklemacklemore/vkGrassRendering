Vulkan Grass Rendering
==================================

https://github.com/user-attachments/assets/a1ca7be8-5007-4135-999c-f40fa03c1052

> University of Pennsylvania, CIS 5650: GPU Programming and Architecture, Project 3 - CUDA Path Tracer
> * Michael Mason
>   + [Personal Website](https://www.michaelmason.xyz/)
> * Tested on: Windows 11, Ryzen 9 5900HS @ 3.00GHz 16GB, RTX 3080 (Laptop) 8192MB 

This is a small Vulkan project that implements a grass simulation. 

The implementation is based on [Responsive Real-Time Grass Rendering for General 3D Scenes](https://www.cg.tuwien.ac.at/research/publications/2017/JAHRMANN-2017-RRTG/JAHRMANN-2017-RRTG-draft.pdf) by Jahrmann & Wimmer.

## Physics Sim / Forces

### Gravity + Recovery

![Recording 2024-10-31 at 22 18 32](https://github.com/user-attachments/assets/96a571f0-5c65-4d2d-bc6f-f72b95c32ce9)

### Wind

![Recording 2024-10-31 at 22 20 15](https://github.com/user-attachments/assets/1cb92ce7-4e38-4c13-bf8f-5f9b2eff712d)

## Culling Methods

### Orientation

![Recording 2024-10-31 at 22 24 01](https://github.com/user-attachments/assets/2515cba0-8f11-4f7b-bb7b-0d3ad1076ec5)

### Frustum

![Recording 2024-10-31 at 22 26 36](https://github.com/user-attachments/assets/9fbfd865-eecf-4029-ad20-36e0261bd344)

### Distance

![Recording 2024-10-31 at 22 28 39](https://github.com/user-attachments/assets/7fd976c0-e2a6-47be-a788-72a9ee0b03fe)

## Performance Analysis

*Lower is Better*

![No Culling, Orientation, Frustum and Distance](https://github.com/user-attachments/assets/5de8f739-49cc-4c7d-829b-6b7c59614f9d)

The graph above represents the effect of different culling methods for rendering grass in Vulkan. We measured miliseconds per frame against number of grass blades. 

Culling by Orientation: this represents the culling occurs when grass blades (which are infinitely flat) are perpendicular to the camera. In the shader, we cull those grass blades within a certain threshold of 90 degrees

Culling by Frustum: This represents culling that occurs when grass blades are outside of the camera frustum. In the shader we cull those blades. 

Culling by distance: This represents culling grass blades that are of a certain distance. After 10 units, every 10th blade is culled. After 40 units, every 2nd blade is culled and after 50 units, all blades are culled. 

Without any culling, rendering times increase sharply with blade count, reaching 178.32 milliseconds at 4,194,304 blades. Orientation Culling, which removes blades perpendicular to the camera, provides moderate improvement, reducing the time to 123.23 milliseconds at the highest count. Frustum Culling, which discards blades outside the camera's view, achieves a similar but slightly less effective reduction to 156.2 milliseconds. Distance Culling, however, proves to be the most impactful, reducing the frame time to 75.89 milliseconds by progressively removing distant blades, especially effective in large fields where far-off details contribute minimally to visual quality.

While distance culling appears to be the winner here, be mindful that the tests done are dependant on the camera's position and orientation to the grass. It's likely more tests are needed to accurately measure performance of culling. 
