# Introduction

This directory contains Flyway migration scripts.

# Dump Schema

You can dump database schema from an existing database using:

```
# pg_dump -d myna \
    -U myna \
    -s -n inserv \
    -T inserv.schema_version \
    --no-owner
```

If you update scripts based on `pg_dump` output, please fix statements to enforce standard compliance. it's highly recommended to export DDL scripts using other tools.