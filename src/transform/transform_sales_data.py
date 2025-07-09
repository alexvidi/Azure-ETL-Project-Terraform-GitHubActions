import pandas as pd
import os

# Paths
raw_path = "data/raw/sales_data.csv"
processed_path = "data/processed/sales_clean.csv"

# Load raw data
df = pd.read_csv(raw_path)

# Drop unnecessary columns
columns_to_drop = ["Row ID"] if "Row ID" in df.columns else []
df.drop(columns=columns_to_drop, inplace=True)

# Drop duplicates
df.drop_duplicates(inplace=True)

# Convert order date and ship date to datetime format
for date_col in ["Order Date", "Ship Date"]:
    if date_col in df.columns:
        df[date_col] = pd.to_datetime(df[date_col], errors="coerce")

# Rename columns to snake_case
df.columns = (
    df.columns.str.strip()
    .str.lower()
    .str.replace(" ", "_")
    .str.replace("-", "_")
)

# Save cleaned dataset
os.makedirs("data/processed", exist_ok=True)
df.to_csv(processed_path, index=False)

print(f"Cleaned data saved to: {processed_path}")
