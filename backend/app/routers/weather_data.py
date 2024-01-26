#!/usr/bin/env python

#!-============================================================================
#!- weather_data.py
#!-    _____          ______ _     _    _  _____
#!-   / ____|   /\   |  ____| |   | |  | |/ ____|
#!-  | |       /  \  | |__  | |   | |  | | (___
#!-  | |      / /\ \ |  __| | |   | |  | |\___ \
#!-  | |____ / ____ \| |____| |___| |__| |____) |
#!-   \_____/_/    \_\______|______\____/|_____/
#!-
#!-============================================================================

# ==============================================================================
# IMPORTS
# ==============================================================================

import json

from fastapi import APIRouter, HTTPException, Query
from fastapi.responses import HTMLResponse

from ..services.external_data_manager import fetch_weather_data

# ==============================================================================

router = APIRouter()

# ==============================================================================


@router.get("/weather", response_class=HTMLResponse)
async def get_weather(latitude: float = Query(...), longitude: float = Query(...)):
    print(f"Weather endpoint hit with coordinates: latitude: {latitude}, longitude: {longitude}")

    try:
        weather_data = await fetch_weather_data(
            "weather", {"latitude": latitude, "longitude": longitude}
        )
        weather_data_str = json.dumps(weather_data, indent=4)

        # print(f"Weather data: {weather_data_str}") #todo Log this!

        weather_html = f"""
            <pre>{weather_data_str}</pre>
        """
        return weather_html
    except HTTPException as e:
        print(f"Error with get_weather: {e}")
        raise e


#!- EOF =======================================================================
