#!/bin/bash
CKPT_PATH=${1:-"../openai_log/EGC_AFHQ_Cats/model080000.pt"}  # path to model checkpoint

cd EGC
OPENAI_LOGDIR=../openai_log/EGC_AFHQ_Cats python3 -m torch.distributed.run \
  --nproc_per_node=1 \
  --master_port=29500 scripts/image_sample_cond_ldm_egc.py \
  --model_path $CKPT_PATH \
  --autoencoder_path ../autoencoder_kl.pth \
  --class_cond True --classifier_scale 1.0 --image_size 32 --in_channels 4 \
  --num_channels 256 --num_res_blocks 2 --num_head_channels 64 --channel_mult "1,2,4" \
  --diffusion_steps 1000 --noise_schedule linear --learn_sigma False \
  --batch_size 4 --num_samples 32 --use_ddim True --timestep_respacing ddim50 \
  --use_spatial_transformer True \
  --attention_resolutions "32,16,8" --context_dim 512 --transformer_depth 1
cd ..
echo "Generated samples saved to $OUT_DIR/"
