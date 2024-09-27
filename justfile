default:
  just --list

install:
  CUDACXX=/usr/local/cuda-12/bin/nvcc pip install -e .

vllm idx='0':
  CUDA_VISIBLE_DEVICES={{idx}} vllm serve NousResearch/Meta-Llama-3.1-8B-Instruct --dtype auto --port 900{{idx}}

docker_build:
  DOCKER_BUILDKIT=1 docker build . --target vllm-openai --tag manifoldlabs/vllm-openai:powv --build-arg CUDA_VERSION=12.1.0 --build-arg VLLM_MAX_SIZE_MB=300
  docker push manifoldlabs/vllm-openai:powv
