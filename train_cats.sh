#!/bin/bash
cd EGC

OPENAI_LOGDIR=../openai_log/EGC_AFHQ_Cats python3 -m torch.distributed.run \
  --nproc_per_node=1 \
  --master_port=29500 scripts/image_train_ldm_clsonline_egc.py --img_num 5557 --lr_anneal_steps 80000 --save_interval 10000\
  --data_dir ../data/cat_features \
  --class_cond True --ce_weight 0 --image_size 32 --in_channels 4 --diffusion_steps 1000 --noise_schedule linear --learn_sigma False \
  --num_res_blocks 2 --num_head_channels 64 --channel_mult "1,2,4" \
  --num_channels 256 --batch_size 4 --microbatch 4 --lr 1e-4 --weight_decay 0.0 --dropout 0.0 \
  --autoencoder_path ../autoencoder_kl.pth --use_spatial_transformer True \
  --attention_resolutions "32,16,8" --context_dim 512 --transformer_depth 1

cd ..