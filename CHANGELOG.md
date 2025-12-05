# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.16] - 2025-05-12
### Added
- Manage exemption for FR markets

## [1.0.15] - 2025-01-12
### Added
- Add new payment method : Pledg
### Fixed
- Fix iframe rendering on mobile phones
- Fix order total not being updated when customer adds/removes gift wrapping
- Change tokenizer preproduction URL to production

## [1.0.14] - 2025-14-11
### Fixed
- Fix being able to delete default logo when upgrading from earlier version

## [1.0.13] - 2025-13-11
### Added
- Add reverting to default logo in payment methods settings page

## [1.0.12] - 2025-30-10
### Changed
- Update configuration guidelines
- Fix transaction operations having wrong status
- Fix wrong price being recorded in database when non-default currency is used on checkout
- Fix secret fields not being masked when wrong webhook key is entered
- Fix expected transaction ID format

## [1.0.11] - 2025-10-10
### Added
- Add masking API credential values
- Fix showing Mealvoucher on hosted checkout
- Fix DB transaction caching
- Fix uninstall error

## [1.0.10] - 2025-28-08
### Added
- Add configuration to send webhook url in payloads

## [1.0.9] - 2025-22-08
### Changed
- Fix wrong shipping calculation upon clicking back and changing shipping carrier

## [1.0.8] - 2025-13-08
### Changed
- Add null checking in liability/exemption chain

## [1.0.7] - 2025-11-08
### Changed
- Add missing translations

## [1.0.6] - 2025-24-07
### Changed
- Remove extension validation for template filename
- Implement omit order item details button and logic
- Fix order total webhook issue

## [1.0.5] - 2025-01-07
### Changed
- Implement new payment method : Mealvouchers
- Implement new payment method : Chèque-Vacances Connect (CVCO)

## [1.0.4] - 2025-14-04
### Changed
- Update plugin translations

## [1.0.3] - 2025-31-03
### Added
- Add 3DS exemption types to the plugin

## [1.0.2] - 2025-21-03
### Changed
- Fix issue with submit button not being deactivated when card fields are not added on checkout

## [1.0.1] - 2025-25-02
### Changed
- Update payment gateway API base URL

## [1.0.0] - 2024-11-12
### Added

- First major version of the Cawl plugin
