#!/usr/bin/env python

# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# Imports
import httpx

from fastapi import HTTPException

# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# Define a mapping of data types to URLs
DATA_TYPE_URL_MAP = {
    "environ": "https://geocoding.geo.census.gov/geocoder/locations/onelineaddress",
    "geocode": "https://geocoding.geo.census.gov/geocoder/locations/onelineaddress",
    "weather": "https://api.weather.gov/points/",
    # Add more data types and their corresponding URLs as needed
}

# Header for passing along with requests
headers = {"User-Agent": "Caelus/0.1.0 (https://github.com/Derjyn/Caelus;)"}

# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =


async def fetch_geocode_data(data_type: str, query_params: dict = None) -> dict:
    if data_type not in DATA_TYPE_URL_MAP:
        raise HTTPException(status_code=400, detail="Invalid data type requested")

    url = DATA_TYPE_URL_MAP[data_type]

    async with httpx.AsyncClient() as client:
        print(f"Requesting URL: {url}")

        try:
            query_params = query_params or {}
            query_params.setdefault("benchmark", "Public_AR_Current")
            query_params.setdefault("format", "json")

            response = await client.get(url, params=query_params, headers=headers)
            response.raise_for_status()
            data = response.json()
            return data

        except httpx.HTTPStatusError as e:
            # Catches responses from the server that indicate an HTTP error
            print(f"POOP! Status error: {e}")
            raise HTTPException(
                status_code=e.response.status_code, detail=f"HTTP error: {e.response.status_code}"
            )
        except httpx.RequestError as e:
            # Catches issues at the request level, such as network errors
            print(f"DANG! Request error: {e}")
            raise HTTPException(status_code=500, detail="Error making request to external service")
        except Exception as e:
            # A generic catch-all for unexpected errors
            print(f"ARG! Unexpected error: {e}")
            raise HTTPException(status_code=500, detail="Unexpected error occurred")


# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =


async def fetch_environment_data(data_type: str, query_params: dict = None) -> dict:
    if data_type not in DATA_TYPE_URL_MAP:
        raise HTTPException(status_code=400, detail="Invalid data type requested")

    url = DATA_TYPE_URL_MAP[data_type]

    async with httpx.AsyncClient() as client:
        print(f"Requesting URL: {url}")

        try:
            query_params = query_params or {}
            query_params.setdefault("benchmark", "Public_AR_Current")
            query_params.setdefault("format", "json")

            response = await client.get(url, params=query_params, headers=headers)
            response.raise_for_status()
            data = response.json()
            return data

        except httpx.HTTPStatusError as e:
            # Catches responses from the server that indicate an HTTP error
            print(f"POOP! Status error: {e}")
            raise HTTPException(
                status_code=e.response.status_code, detail=f"HTTP error: {e.response.status_code}"
            )
        except httpx.RequestError as e:
            # Catches issues at the request level, such as network errors
            print(f"DANG! Request error: {e}")
            raise HTTPException(status_code=500, detail="Error making request to external service")
        except Exception as e:
            # A generic catch-all for unexpected errors
            print(f"ARG! Unexpected error: {e}")
            raise HTTPException(status_code=500, detail="Unexpected error occurred")


# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =


async def fetch_weather_data(data_type: str, query_params: dict = None) -> dict:
    if data_type not in DATA_TYPE_URL_MAP:
        raise HTTPException(status_code=400, detail="Invalid data type requested")

    url = DATA_TYPE_URL_MAP[data_type]

    async with httpx.AsyncClient() as client:
        if query_params:
            latitude = query_params.get("latitude")
            longitude = query_params.get("longitude")
            url = f"{url}{latitude},{longitude}"

        print(f"Requesting URL: {url}")

        try:
            response = await client.get(url, headers=headers)
            response.raise_for_status()
            data = response.json()
            return data

        except httpx.HTTPStatusError as e:
            print(f"HTTP Status error: {e}")
            raise HTTPException(
                status_code=e.response.status_code, detail=f"HTTP error: {e.response.status_code}"
            )
        except httpx.RequestError as e:
            print(f"Request error: {e}")
            raise HTTPException(status_code=500, detail="Error making request to external service")
        except Exception as e:
            print(f"Unexpected error: {e}")
            raise HTTPException(status_code=500, detail="Unexpected error occurred")


# == EOF = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
