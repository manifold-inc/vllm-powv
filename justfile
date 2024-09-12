default:
  just --list

install:
  CUDACXX=/usr/local/cuda-12/bin/nvcc pip install -e .

vllm idx='0':
  CUDA_VISIBLE_DEVICES={{idx}} vllm serve NousResearch/Meta-Llama-3.1-8B-Instruct --dtype auto --port 900{{idx}}
