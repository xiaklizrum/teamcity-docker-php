# Teamcity docker with php build agent
Teamcity docker configuration with agent for php build
### Run:
```
docker-compose up -d --build
```
### Troubleshooting:
```
docker-compose up -d --build
Building teamcity-agent
ERROR: Error processing tar file(exit status 1): unexpected EOF
```
In many situation this problem with teamcity file permission (./data, ./log). To fix your need remove this.