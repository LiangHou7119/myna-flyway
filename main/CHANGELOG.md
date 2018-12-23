# Changelog

All notable changes to this project will be documented in this file.

## [1.1.1-SNAPSHOT] [Unreleased]

### Added

- Add CHANGELOG.md (this file).

### Changed

- `minvalue` of `security.seq_security_id` is now `100,000`

- myna-rules: all column names of myna rules have been updated to camel case.
- myna-rules: unify the name conventions for rule attribute display names
- myna-rules: remove 'without time zone' setting for all timestamp columns
- myna-rules: use NULL instead of '' for all null values in the rule data
- myna-rules: Story IQMWRT-1182 has been implemented.



### Fixed

- Drop user myna_readonly properly.

### Removed

- Nothing notable

## [1.1.0] - 2018-07-26

### Added

- Initial set of features
