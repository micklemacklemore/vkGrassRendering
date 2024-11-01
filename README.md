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


```
## README

* A brief description of the project and the specific features you implemented.
* GIFs of your project in its different stages with the different features being added incrementally.
* A performance analysis (described below).

### Performance Analysis

The performance analysis is where you will investigate how...
* Your renderer handles varying numbers of grass blades
* The improvement you get by culling using each of the three culling tests
```
