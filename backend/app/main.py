#!/usr/bin/env python

#!-============================================================================
#!- main.py
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

import mimetypes
import os
from mimetypes import guess_type
from typing import Dict

from fastapi import Depends, FastAPI, HTTPException, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from jinja2 import Environment, FileSystemLoader, select_autoescape
from starlette.responses import FileResponse

from .routers import environment_data, geocode_data, weather_data

# ==============================================================================
# CUSTOM STATIC FILES FOR BEATING MIME TYPES INTO SUBMISSION...
# ==============================================================================


class CustomStaticFiles(StaticFiles):
    async def get_response(self, path, scope):
        response = await super().get_response(path, scope)
        if path.endswith(".js"):
            # Ensure the path is secure
            full_path = os.path.join(self.directory, path.lstrip("/"))
            if os.path.isfile(full_path):
                return FileResponse(full_path, media_type="application/javascript")
        return response


# ==============================================================================
# APP
# ==============================================================================


mimetypes.add_type("application/javascript", ".js")
mimetypes.add_type("text/css", ".css")
mimetypes.add_type("image/svg+xml", ".svg")

app = FastAPI()

# Configure CORS for the application
app.add_middleware(CORSMiddleware, allow_origins=["*"], allow_headers=["*"], allow_methods=["*"])

# Prime static and template directories
# app.mount("/static", StaticFiles(directory="frontend/static"), name="static")
app.mount("/static", CustomStaticFiles(directory="frontend/static", html=True), name="static")
# app.mount("/dist", CustomStaticFiles(directory="frontend/static/dist", html=True), name="dist")
app.mount("/node", CustomStaticFiles(directory="node_modules"), name="node")
templates = Jinja2Templates(directory="frontend/templates")


# ==============================================================================
# ROUTES
# ==============================================================================


app.include_router(geocode_data.router)
app.include_router(weather_data.router)
app.include_router(environment_data.router)


# ==============================================================================
# ROOT
# ==============================================================================


@app.get("/")
async def read_root(request: Request):
    template = "/pages/dashboard.html"
    context = {"request": request}
    return templates.TemplateResponse(template, context, media_type="text/html")


# ==============================================================================
# SHOWCASE
# ==============================================================================


@app.get("/showcase")
async def read_showcase(request: Request):
    template = "/pages/showcase.html"
    context = {"request": request}
    return templates.TemplateResponse(template, context, media_type="text/html")


# ==============================================================================
# LAYOUT
# ==============================================================================


@app.get("/layout")
async def read_showcase(request: Request):
    template = "/pages/layout.html"
    context = {"request": request}
    return templates.TemplateResponse(template, context, media_type="text/html")


# ==============================================================================
# COMPONENTS
# ==============================================================================


# Set up component environment
component_env = Environment(
    loader=FileSystemLoader("frontend/templates/components"),
    autoescape=select_autoescape(["html", "xml", "js"]),
)


# Helper function to capture all query parameters
def get_query_params(request: Request) -> Dict[str, str]:
    return dict(request.query_params)


@app.get("/components/{component_name}", response_class=HTMLResponse)
async def get_component(
    component_name: str, query_params: Dict[str, str] = Depends(get_query_params)
):
    try:
        template = component_env.get_template(f"{component_name}.html")
    except IOError:
        raise HTTPException(status_code=404, detail="Component not found")

    return HTMLResponse(content=template.render(**query_params))


#!- EOF =======================================================================
