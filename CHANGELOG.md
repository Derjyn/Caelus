# Changelog

All notable changes to Caelus will be documented in this file.

## [0.1.1-alpha] - 2024-01-22

### Added

- Made successful communication with external data sources:
  - US Census Burea
  - National Weather Service
- Got data displayed on the frontend (_albeit, in JSON_).

### Changed

- General code cleanup and housekeeping.
- Refactor of routing and data fetching functions.
- Utility scripts got some buffs:
  - Caught some more files/directories to scrub for reset/pre-commit.
  - Got Tailwind CSS builder watching for changes when server is up (_for dev only_).

## [0.1.0-alpha] - 2024-01-21

### Added

- Initial setup and configuration for FastAPI backend.
- Integration of Tailwind CSS and htmx for the frontend design.
- Asynchronous data fetching mechanism implemented in FastAPI.
- Basic frontend layout and design for weather dashboard.
- Scripts for easy setup and server start.
- Basic `README.md` and `LICENSE.txt` files for project documentation and licensing.
- Static file serving setup for frontend assets.
- Simulated "test" endpoint for local development and testing.
- Initial `CHANGELOG.md` to document project changes.