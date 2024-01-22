#!/usr/bin/env python

# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# Imports
from fastapi import APIRouter, HTTPException, Query
from fastapi.responses import JSONResponse

from ..services.external_data_manager import fetch_environment_data

# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

router = APIRouter()

# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =


@router.get("/environ", response_class=JSONResponse)
async def get_environment(address: str = Query(...)):
    print(f"Environment endpoint hit with address: {address}")

    try:
        environment_data = await fetch_environment_data("environ", {"address": address})
        return JSONResponse(content=environment_data)
    except HTTPException as e:
        print(f"Error with get_environment: {e}")
        raise e


# == EOF = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
