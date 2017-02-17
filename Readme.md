 # QuickLook

This package provides automatic visualization to aid data explorations. Currently intended for the emitter's output schema.

This work is based on [AirBnB's Superset](https://github.com/airbnb/superset)

# Why
- A hassle-free template dashboard that easily ported to pilot projects
- Intended to aid data scientists and front end engineers to have quick look for of the data
- Each visualization can be exported a widget (iframe) for external use
- Mainly written in Python which is extendable and in line with KenSci's environment 
- Robust SQL queries

# Requirements
- Docker
- SQL Server (e.g. MySQL) where the data is located

# Run
```
docker run -dp 8080:8080 kensci/quicklook 
```
# Development
[ x ] Dockerfile  
[ x ] Schema   
[    ] Sample data  
[    ] Formulating questions that need to be answered  
[    ] Design the dashboard  

Any suggestions of what questions need to be answered / what the dashboard need to have are welcome --let us know on Slack.

