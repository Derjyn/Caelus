# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# Imports
import asyncio

# import httpx
from fastapi import HTTPException

# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# Define a mapping of data types to URLs
DATA_TYPE_URL_MAP = {
    "weather": "/weather",
    "environment": "/environment",
    "test": "/test"
    # Add more data types and their corresponding URLs as needed
}

# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =


async def fetch_external_data_test(data_type: str) -> dict:
    if data_type not in DATA_TYPE_URL_MAP:
        raise HTTPException(status_code=400, detail="Invalid data type")

    # For the "test" data type, simulate fetching data
    if data_type == "test":
        # Simulate a network delay
        await asyncio.sleep(1)
        # Return simulated data
        return {
            "data": "Simulated test data",
            "description": "This is a simulated response for testing purposes.",
        }

    # Placeholder for actual fetching logic for other data types
    # This part would use httpx.AsyncClient or similar for real requests
    # For demonstration, returning a placeholder response
    return {"data": "Placeholder response for non-test data types"}


# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

"""
async def fetch_external_data(data_type: str) -> dict:
    # Validate the requested data type
    if data_type not in DATA_TYPE_URL_MAP:
        raise HTTPException(status_code=400, detail=f"Invalid data type: {data_type}")

    # Get the URL for the requested data type
    url = DATA_TYPE_URL_MAP[data_type]

    async with httpx.AsyncClient() as client:
        try:
            response = await client.get(url)
            response.raise_for_status()  # Raises exception for 4XX/5XX responses
            data = response.json()
            # Optionally, transform this data before returning based on the data type
            return data  # You can adjust the return statement to transform data as needed
        except httpx.RequestError as e:
            print(f"An error occurred while requesting {e.request.url!r}.")
            raise HTTPException(status_code=400, detail="Error fetching external data")
        except httpx.HTTPStatusError as e:
            print(f"Error response {e.response.status_code} while requesting {e.request.url!r}.")
            raise HTTPException(status_code=e.response.status_code, detail="Error with external service")
"""
# == EOF = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
