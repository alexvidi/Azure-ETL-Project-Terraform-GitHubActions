from kaggle.api.kaggle_api_extended import KaggleApi

# Initialize Kaggle API
api = KaggleApi()
api.authenticate()

# Define dataset and destination
dataset = "rohitsahoo/sales-forecasting"
destination = "data/raw/"

# Download dataset
print(f"Downloading dataset '{dataset}' into '{destination}'...")
api.dataset_download_files(dataset, path=destination, unzip=True)
print("Download complete.")
