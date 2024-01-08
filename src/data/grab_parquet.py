from minio import Minio
import urllib.request
import pandas as pd
import sys
import os
from datetime import datetime, timedelta
import pyarrow.parquet as pq
import requests

def main():
    grab_data()
    

def grab_data() -> None:
    """Grab the data from New York Yellow Taxi

    This method download x files of the New York Yellow Taxi. 
    
    Files need to be saved into "../../data/raw" folder
    This methods takes no arguments and returns nothing.
    """

for year in range(2023, 2024):
    for month in range(1, 9):
        month_str = str(month).zfill(2)
        url = f'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_{year}-{month_str}.parquet'
        destination_dir = f"../../data/raw/"
        destination_file = f"yellow_tripdata_{year}-{month_str}.parquet"
        destination_path = os.path.join(destination_dir, destination_file)

        response = requests.get(url)

        try:
            os.makedirs(destination_dir, exist_ok=True)
            with open(destination_path, 'wb') as file:
                file.write(response.content)
                print(f"Le téléchargement a réussi. Fichier enregistré dans {destination_path}")
        except PermissionError as e:
            print(f"Erreur de permission : {e}")
        except Exception as e:
            print(f"Une erreur inattendue s'est produite : {e}")

    # Download the dataset for the last month (August 2023)
    year = 2023
    month = 8
    month_str = str(month).zfill(2)
    url = f'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_{year}-{month_str}.parquet'
    destination_dir = f"../../data/raw/"
    destination_file = f"yellow_tripdata_{year}-{month_str}.parquet"
    destination_path = os.path.join(destination_dir, destination_file)

    response = requests.get(url)

    try:
        os.makedirs(destination_dir, exist_ok=True)
        with open(destination_path, 'wb') as file:
            file.write(response.content)
            print(f"Le téléchargement a réussi. Fichier enregistré dans {destination_path}")
    except PermissionError as e:
        print(f"Erreur de permission : {e}")
    except Exception as e:
        print(f"Une erreur inattendue s'est produite : {e}")
    
    

def write_data_minio():
    """
    This method put all Parquet files into Minio
    Ne pas faire cette méthode pour le moment
    """
    client = Minio(
        "localhost:9000",
        secure=False,
        access_key="minio",
        secret_key="minio123"
    )
    bucket: str = "NOM_DU_BUCKET_ICI"
    found = client.bucket_exists(bucket)
    if not found:
        client.make_bucket(bucket)
    else:
        print("Bucket " + bucket + " existe déjà")

if __name__ == '__main__':
    sys.exit(main())
