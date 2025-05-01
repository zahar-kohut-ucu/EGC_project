pip install -q kaggle
mkdir -p data
kaggle datasets download -d dimensi0n/afhq-512 -p data --unzip
echo "AFHQ Cats dataset is ready in data/cat)."
