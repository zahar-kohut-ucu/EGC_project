from pathlib import Path
from PIL import Image

in_dir   = Path("cat_samples/cherry")                 
pattern  = "*.png"                      
out_dir  = Path("figures"); out_dir.mkdir(exist_ok=True)
rows, cols = 2, 5                    
cell      = 256                       

all_paths = sorted(in_dir.glob(pattern))[:20]        
for block in range(2):                               
    canvas = Image.new("RGB", (cols*cell, rows*cell))
    for k, path in enumerate(all_paths[block*10:(block+1)*10]):
        r, c = divmod(k, cols)                       
        canvas.paste(Image.open(path), (c*cell, r*cell))
    canvas.save(out_dir / f"figure_{block+1}.png")
    print(f"Saved {out_dir/ f'figure_{block+1}.png'}")
