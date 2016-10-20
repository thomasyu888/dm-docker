# theano-gpu
This Docker image provides the deep learning framework [Theano](http://deeplearning.net/software/theano/).

## Test the Docker image locally
To see if your GPU is being used, you can run the following command. Here the command [nvidia-docker](https://github.com/NVIDIA/nvidia-docker) must be used instead of `docker run` to give the Docker container access to the GPUs.

```
# nvidia-docker run -it --rm -e THEANO_FLAGS=mode=FAST_RUN,device=gpu,floatX=float32 tschaffter/theano-gpu /usr/bin/python ./check1.py
Using gpu device 0: Tesla K80 (CNMeM is enabled with initial size: 10.0% of memory, cuDNN 5103)
[GpuElemwise{exp,no_inplace}(<CudaNdarrayType(float32, vector)>), HostFromGpu(GpuElemwise{exp,no_inplace}.0)]
Looping 1000 times took 0.313817 seconds
Result is [ 1.23178029  1.61879349  1.52278066 ...,  2.20771813  2.29967761
  1.62323296]
Used the gpu
```

The script `check1.py` can run using the CPU instead of the GPU (note the `device=cpu`):

```
# nvidia-docker run -it --rm -e THEANO_FLAGS=mode=FAST_RUN,device=cpu,floatX=float32 tschaffter/theano-gpu /usr/bin/python ./check1.py
[Elemwise{exp,no_inplace}(<TensorType(float32, vector)>)]
Looping 1000 times took 2.954500 seconds
Result is [ 1.23178029  1.61879337  1.52278066 ...,  2.20771813  2.29967761
  1.62323284]
Used the cpu
```

By default, the Docker image is configured to run using the GPU insteadn of the CPU (see `/root/.theanorc`).

## Build your own Docker image

```
# docker build -t <name> .
```
where `<name>` is the name that you want to give to the image.

## Contacts
Thomas Schaffter (thomas.schaffter@gmail.com)