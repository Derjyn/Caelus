#!/usr/bin/env python

# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# Imports
# import asyncio

from fastapi import FastAPI, Request, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

from .services.external_data_manager import fetch_external_data_test

# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# FastAPI application
app = FastAPI()

# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# Configure CORS for the application
app.add_middleware(
    CORSMiddleware,
    # Placeholder, should be set to frontend's URL in production
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# Prime static and template directories
app.mount("/static", StaticFiles(directory="frontend/static"), name="static")
templates = Jinja2Templates(directory="frontend/templates")

# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =


@app.get("/")
async def read_root(request: Request):
    return templates.TemplateResponse("dashboard.html", {"request": request})


# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =


@app.get("/data/{data_type}")
async def get_data(data_type: str):
    try:
        data = await fetch_external_data_test(data_type)
        return data
    except HTTPException as e:
        # This will re-raise the HTTPException caught from fetch_external_data_test
        raise e
    except Exception as exc:
        # Catch-all for any unexpected errors
        raise HTTPException(status_code=500, detail=str(exc))


# == EOF = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
