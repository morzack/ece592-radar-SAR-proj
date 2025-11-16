# NCSU ECE 592 SAR Project

tl;dr: an attempt to implement a SAR imaging algorithm.

Beyond the basic application of just resolving an image, this will hopefully go further and interface with a GPS/drone system (probably running Ardupilot) to correlate measurements in physical space.

## env setup

`uv venv --p 3.10.13`
`uv pip install -r requirements.txt`
`uv pip install torch torchvision --index-url https://download.pytorch.org/whl/rocm6.4`

verify gpu availability

`python`
`import torch`
`torch.cuda.is_available()`

