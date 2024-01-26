#!/usr/bin/env python

#!-============================================================================
#!- geocode_data.py
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

from ..services.external_data_manager import fetch_geocode_data

# ==============================================================================

router = APIRouter()

# ==============================================================================


@router.get("/geocode", response_class=HTMLResponse)
async def get_geocode(address: str = Query(...)):
    print(f"Geocode endpoint hit with address: {address}")

    try:
        geocode_data = await fetch_geocode_data("geocode", {"address": address})
        geocode_data_str = json.dumps(geocode_data, indent=4)

        # print(f"Geocode data: {geocode_data_str}") #todo Log this!

        geocode_html = f"""
            <pre>{geocode_data_str}</pre>
        """
        return geocode_html
    except HTTPException as e:
        print(f"Error with get_geocode: {e}")
        raise e


#!- EOF =======================================================================
