# Using echo server
docker run -p 3000:80 ealen/echo-server

docker pull ealen/echo-server

docker run -d -p 3000:80 ealen/echo-server

export ECHO_HOST=localhost:3000
curl $ECHO_HOST/?echo_body=amazing

## Reference
https://hub.docker.com/r/ealen/echo-server


## Envs

PORT	service.port	--port	80
LOGS__IGNORE__PING	application.logs.ignore.ping	--logs:ignore:ping	false
ENABLE__HOST	application.enable.host	--enable:host	true
ENABLE__HTTP	application.enable.http	--enable:http	true
ENABLE__REQUEST	application.enable.request	--enable:request	true
ENABLE__HEADER	application.enable.header	--enable:header	true
ENABLE__ENVIRONMENT	application.enable.environment	--enable:environment	true
ENABLE__FILE	application.enable.file	--enable:file	true


## Using

curl localhost:3000/param?query=demo | jq 


## Customizing
Custom responses
Query	Header	Content	Conditions
?echo_code=	X-ECHO-CODE	HTTP code 200, 404	200 <= CODE <= 599
404-401 or 200-500-301	
?echo_body=	X-ECHO-BODY	Body message	
?echo_env_body=	X-ECHO-ENV-BODY	The key of environment variable	Enable environment true
?echo_header=	X-ECHO-HEADER	Response Header Lang: en-US	Enable header true
?echo_time=	X-ECHO-TIME	Wait time in ms	0 <= TIME <= 30.000
?echo_file=	X-ECHO-FILE	Path of Directory or File	Enable file true



# Multiarch
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t wprzechrzta/echo-server:v2 --push .
docker run wprzechrzta/echo-server:v2@sha256:56b838f48bc7819a1219d004585118bb9c389d02fd0362d74a517de5ec45091d