#!/usr/bin/env python

# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# Imports
from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

from .routers import geocode_data, weather_data, environment_data

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


app.include_router(geocode_data.router)
app.include_router(weather_data.router)
app.include_router(environment_data.router)
# Include other routes as necessary


# == = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =


@app.get("/")
async def read_root(request: Request):
    return templates.TemplateResponse("dashboard.html", {"request": request})


# == EOF = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
