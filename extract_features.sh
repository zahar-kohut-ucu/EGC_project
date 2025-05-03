#!/bin/bash
mkdir -p data/cat_features
cd EGC
python3 scripts/extract_feat.py \
    ../data/cifar_10 ../autoencoder_kl.pth ../data/cifar_features
cd ..