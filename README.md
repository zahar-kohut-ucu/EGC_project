# 🧪 EnergyFlow — Energy-Based Generative Modeling with Diffusion

This repository contains a modified and extended version of the [EGC (Energy-Guided Diffusion)](https://github.com/GuoQiushan/EGC) framework. It is adapted for **unconditional image generation** on a subset of the AFHQ dataset (cat faces) using **latent-space diffusion**.

The model was trained in the latent space of a pretrained VQ-VAE, and produces 256×256 images decoded from a 32×32 latent grid.

---

## 🚨 Warning

> ⚠️ **The original EGC repository will _not_ work out of the box.**
>
> This version contains **local updates and modifications** required for training and sampling without classification. It also includes important bug fixes not present in the original repository.

> 🔧 **Some parameters and file paths are hardcoded** in scripts (e.g., dataset paths, checkpoint directories).
>
> Make sure to adjust these for your own machine.

---

