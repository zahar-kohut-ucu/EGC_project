import os
from PIL import Image

data_dir = "data/cat"

for fname in os.listdir(data_dir):
    fpath = os.path.join(data_dir, fname)
    try:
        img = Image.open(fpath).convert("RGB")
    except Exception as e:
        print(f"Skipping {fpath}: {e}")
        continue
    img = img.resize((256, 256), Image.LANCZOS)
    img.save(os.path.join("data/cat_resized", fname)) 
