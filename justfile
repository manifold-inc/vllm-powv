default:
  just --list

install:
  CUDACXX=/usr/local/cuda-12/bin/nvcc pip install -e .

vllm:
  CUDA_VISIBLE_DEVICES=3 vllm serve NousResearch/Meta-Llama-3.1-8B-Instruct --dtype auto
