# matlab-runtime-gpu
## Overview
This Docker image has Matlab Runtime v9.1 (2016b) installed and has access to available NVIDIA GPUs.

The Matlab Runtime is a standalone set of shared libraries that enables the execution of compiled Matlab applications or components on computers that do not have Matlab installed. To test the installation of Matlab runtime, we compiled an Hello World example using Matlab R2106b Compiler as described [here](https://support.opensciencegrid.org/support/solutions/articles/5000660751-basics-of-compiled-matlab-applications-hello-world-example). To run the standalone application `hello_world` included in this Docker image: 

```
# docker run -it tschaffter/matlab-runtime-gpu ./hello_world

=============
Hello, World!
=============
```

The example Hello World doesn't require access to the GPU and so `docker run` can be used to run it. This Docker image includes a second application that prints the output of the Matlab command [gpuDevice](https://www.mathworks.com/help/distcomp/gpudevice.html) on each GPU detected. Here the command [nvidia-docker](https://github.com/NVIDIA/nvidia-docker) must be used instead of `docker run` to give the Docker container access to the GPUs.

```
# nvidia-docker run -it --rm tschaffter/matlab-runtime-gpu ./gpu_devices

ans = 

  CUDADevice with properties:

                      Name: 'Tesla K80'
                     Index: 1
         ComputeCapability: '3.7'
            SupportsDouble: 1
             DriverVersion: 7.5000
            ToolkitVersion: 7.5000
        MaxThreadsPerBlock: 1024
          MaxShmemPerBlock: 49152
        MaxThreadBlockSize: [1024 1024 64]
               MaxGridSize: [2.1475e+09 65535 65535]
                 SIMDWidth: 32
               TotalMemory: 1.2079e+10
           AvailableMemory: 1.1884e+10
       MultiprocessorCount: 13
              ClockRateKHz: 823500
               ComputeMode: 'Default'
      GPUOverlapsTransfers: 1
    KernelExecutionTimeout: 0
          CanMapHostMemory: 1
           DeviceSupported: 1
            DeviceSelected: 1


ans = 

  CUDADevice with properties:

                      Name: 'Tesla K80'
                     Index: 2
         ComputeCapability: '3.7'
            SupportsDouble: 1
             DriverVersion: 7.5000
            ToolkitVersion: 7.5000
        MaxThreadsPerBlock: 1024
          MaxShmemPerBlock: 49152
        MaxThreadBlockSize: [1024 1024 64]
               MaxGridSize: [2.1475e+09 65535 65535]
                 SIMDWidth: 32
               TotalMemory: 1.2079e+10
           AvailableMemory: 1.1884e+10
       MultiprocessorCount: 13
              ClockRateKHz: 823500
               ComputeMode: 'Default'
      GPUOverlapsTransfers: 1
    KernelExecutionTimeout: 0
          CanMapHostMemory: 1
           DeviceSupported: 1
            DeviceSelected: 1

...
```

## Build your own Docker image
Create a Dockerfile with the following content.

```
FROM tschaffter/matlab-runtime-gpu

# Insert below the instructions to install your inference method.
```

Then build your Docker image.

```
# docker build -t <name> .
```
where `<name>` is the name that you want to give to the image.

## License
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Contacts
Thomas Schaffter (thomas.schaffter@gmail.com)

Please direct your questions to the Discussion forum of the DM Challenge.
