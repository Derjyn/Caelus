# Changelog

All notable changes to Caelus will be documented in this file.

## [0.1.2-alpha] - 2024-01-26

### Added

- _DevOps_
  - flake8 primed.
  - Black primed.
- _Frontend_
  - Lucide icons integrated.
  - Broke ground on layout exploration (_Tailwind CSS and general tinkering_).
- _Docs_
  - Added [Code of Conduct](CODE_OF_CONDUCT.md)

- _Research_
  - Explored many more external data sources.
  - Data display and charting solutions.
  - Mapping data and display solutions.

### Changed

- _DevOps_
  - Tweaked utility scripts further (_flake8 and Black integrated, general cleanup_).
  - Tweaked [`pyproject.toml`](../pyproject.toml)
  - Tweaked [`package.json`](../package.json)
- _Docs_
  - Relocated documents to the [`docs`](./) directory.
  - Integrated changelog category concept: _Backend, Frontend, DevOps, Docs, Research_

## [0.1.1-alpha] - 2024-01-22

### Added

- Made successful communication with external data sources:
  - US Census Bureau
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
- Basic [`README.md`](README.md) and [`LICENSE.txt`](LICENSE.txt) files for project documentation and licensing.
- Static file serving setup for frontend assets.
- Simulated "test" endpoint for local development and testing.
- Initial [`CHANGELOG.md`](CHANGELOG.md) to document project changes.