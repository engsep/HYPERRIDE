[![HYPERRIDE Logo](https://hyperride.eu/wp-content/uploads/2021/03/HYPERRIDE_4C_transp.png)](https://hyperride.eu)

# Open ICT Platform
Developed and maintained by:

[![ENG Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Engineering_logo.png/200px-Engineering_logo.png)](https://www.eng.it).

### Powered by FIWARE application.

[![FIWARE Banner](https://fiware.github.io/tutorials.PEP-Proxy/img/fiware.png)](https://www.fiware.org/developers)

[![FIWARE Security](https://nexus.lab.fiware.org/repository/raw/public/badges/chapters/security.svg)](https://github.com/FIWARE/catalogue/blob/master/security/README.md)
[![License: MIT](https://img.shields.io/github/license/fiware/tutorials.PEP-Proxy.svg)](https://opensource.org/licenses/MIT)
[![Support badge](https://img.shields.io/badge/tag-fiware-orange.svg?logo=stackoverflow)](https://stackoverflow.com/questions/tagged/fiware)
<br/> [![Documentation](https://img.shields.io/readthedocs/fiware-tutorials.svg)](https://fiware-tutorials.rtfd.io)

This repository contains the FIWARE stack developed, used and maintained by ENG for the HYPERRIDE EU co-funded Projects. 
It uses the FIWARE [Wilma](https://fiware-pep-proxy.rtfd.io/) PEP Proxy combined with **Keyrock** to secure
access to endpoints exposed by FIWARE generic enablers. Users (or other actors) must log-in and use a token to gain
access to services. The application code created
[here](https://github.com/FIWARE/tutorials.Securing-Access) is expanded to authenticate users throughout a
distributed system.

[cUrl](https://ec.haxx.se/) commands are used throughout to access the **Orion Context Broker**, **Keyrock** and **Wilma** REST APIs -

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/6b143a6b3ad8bcba69cf)
[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/engsep/HYPERRIDE/tree/D5.6)

# System Tested
- CPU: 16+ core
- RAM: 32+ GB
- HD: 20+ GB
- Ubuntu 18+

## Windows and Mac support

Windows and Mac have not been tested, but it should be supported, thanks to the adoption of the [Docker](https://www.docker.com) technology.
Windows users may also download [cygwin](http://www.cygwin.com/) to provide a command-line functionality similar to a Linux distribution on Windows.
Similarily, also Mac users can take advantage of emulation tools. This is the support methods suggested and derived directly from FIWARE. 

# Prerequisites

## Docker

To keep things simple all the HYPERRIDE ICT Platform components run using [Docker](https://www.docker.com). **Docker** is a container
technology which allows to different components isolated into their respective environments.

-   To install Docker on Windows follow the instructions [here](https://docs.docker.com/docker-for-windows/)
-   To install Docker on Mac follow the instructions [here](https://docs.docker.com/docker-for-mac/)
-   To install Docker on Linux follow the instructions [here](https://docs.docker.com/install/)

**Docker Compose** is a tool for defining and running multi-container Docker applications. A
[YAML file](https://raw.githubusercontent.com/Fiware/tutorials.Identity-Management/master/docker-compose.yml) is used
configure the required services for the application. This means all container services can be brought up in a single
command. Docker Compose is installed by default as part of Docker for Windows and Docker for Mac, however Linux users
will need to follow the instructions found [here](https://docs.docker.com/compose/install/)

You can check your current **Docker** and **Docker Compose** versions using the following commands:

```console
docker-compose -v
docker version
```

Please ensure that you are using Docker version 20.10 or higher and Docker Compose 1.29 or higher and upgrade if necessary.

# Setup

We have worked hard to make it simple to start the installation of the HYPERRIDE ICT Platform.
All its services can be initialised from the command-line by running the bash script provided within the repository. Please
clone the repository and create the necessary images by running the commands as shown below:

```console
git clone https://gitpod.io/#https://github.com/engsep/HYPERRIDE/tree/D5.6.git
cd HYPERRIDE
./start.sh (or start.bat on Windows)
```

> **Note** The initial creation of Docker images can take up to three minutes

To check the status of the HYPERRIDE ICT Platform containers, run the following command:

```console
./list.sh (or list.bat on Windows)
```

To stop the HYPERRIDE ICT Platform simply run the following command:

```console
./stop.sh (or stop.bat on Windows)
```

> :information_source: **Note:** If you want to clean up and start over again you can do so with the following command:
>
> ```console
> ./remove.sh (or remove.bat on Windows)
> ```

# First run

## Checking the service health

You can check if the Orion Context Broker is running by making an HTTP request to the exposed port:

#### :one: Request:

```console
curl -X GET \
  'http://localhost:1026/version'
```

#### Response:

The response will look similar to the following:

```json
{
    "orion": {
        "version": "3.0.0",
        "uptime": "0 d, 0 h, 17 m, 19 s",
        "git_hash": "d6f8f4c6c766a9093527027f0a4b3f906e7f04c4",
        "compile_time": "Mon Apr 12 14:48:44 UTC 2021",
        "compiled_by": "root",
        "compiled_in": "f307ca0746f5",
        "release_date": "Mon Apr 12 14:48:44 UTC 2021",
        "machine": "x86_64",
        "doc": "https://fiware-orion.rtfd.io/en/3.0.0/",
        "libversions": {
            "boost": "1_66",
            "libcurl": "libcurl/7.61.1 OpenSSL/1.1.1g zlib/1.2.11 nghttp2/1.33.0",
            "libmicrohttpd": "0.9.70",
            "openssl": "1.1",
            "rapidjson": "1.1.0",
            "mongoc": "1.17.4",
            "bson": "1.17.4"
        }
    }
}
```
## Throubleshooting
>
### Error response: `Failed to connect to localhost port 1026: Connection refused`
>
> If you get a `Connection refused` response, the Orion Content Broker cannot be found where expected for this
> tutorial - you will need to substitute the URL and port in each cUrl command with the corrected IP address. All the
> cUrl commands tutorial assume that orion is available on `localhost:1026`.
>
> Try the following remedies:
>
> -   To check that the docker containers are running try the following:
>
> ```console
> docker ps
> ```
>
> You should see two containers running. If orion is not running, you can restart the containers as necessary. This
> command will also display open port information.
>
> -   If you have installed [`docker-machine`](https://docs.docker.com/machine/) and
>     [Virtual Box](https://www.virtualbox.org/), the orion docker container may be running from another IP address -
>     you will need to retrieve the virtual host IP as shown:
>
> ```console
> curl -X GET \
>  'http://$(docker-machine ip default):1026/version'
> ```
>
> Alternatively run all your cUrl commands from within the container network:
>
> ```console
> docker run --network fiware_default --rm appropriate/curl -s \
>  -X GET 'http://orion:1026/version'
> ```
### Other known issues 
> In some cases, the `db-mysql` containers fails to go up at first run. It is enough to run the `start` script to fix the issue.
>

# Introduction

The HYPERRIDE ICT Platform makes use of one FIWARE component - the
[Orion Context Broker](https://fiware-orion.readthedocs.io/en/latest/). Both v2 and LD versions are supported.
They are however two different systems, i.e., they cannot be exchanged: once selected, all the activities must be done with the selected version.
The suggested version is v2 for most users and use cases. Anyway, a complete discussion about v2 and LD goes beyond the scope of the HYPERRIDE ICT Platform.

Since the two components interact by means of HTTP requests, they have been containerized and run from exposed ports.

## Security settings

A great importance have been done to the security of the FIWARE ICT Platform.
For this reason, the **Orion Context Broker** ports are not directly accessible, as it happens in the default FIWARE installation. 
Instead, they have been protected and closed to public traffic. This repository, released in the framework of the HYPERRIDE Project, derives 
and extend [this one](https://github.com/FIWARE/tutorials.Securing-Access) released by the FIWARE Foundation, which demonstrated that it is possible to Permit
or Deny access to resources based on an authenticated user identifying themselves within an application. 
It can be achieved by placing a Policy Enforcement Point (PEP) in front of other services within a FIWARE-based Smart Solution.

A **PEP Proxy** lies in front of a secured resource and is an endpoint found at "well-known" public location. It serves
as a gatekeeper for resource access. Users or other actors must supply sufficient information to the **PEP Proxy** to
allow their request to succeed and pass through the **PEP proxy**. The **PEP proxy** then passes the request on to the
real location of the secured resource itself - the actual location of the secured resource is unknown to the outside
user - it could be held in a private network behind the **PEP proxy** or found on a different machine altogether.

FIWARE [Wilma](https://fiware-pep-proxy.rtfd.io/) is a simple implementation of a **PEP proxy** designed to work with
the FIWARE [Keyrock](https://fiware-idm.readthedocs.io/en/latest/) Generic Enabler. Whenever a user tries to gain access
to the resource behind the **PEP proxy**, the PEP will describe the user's attributes to the Policy Decision Point
(PDP), request a security decision, and enforce the decision. (Permit or Deny). There is minimal disruption of access
for authorized users - the response received is the same as if they had accessed the secured service directly.
Unauthorized users are simply returned a **401 - Unauthorized** response.

## Standard Concepts of Identity Management

The following common objects are found with the **Keyrock** Identity Management database:

-   **User** - Any signed up user able to identify themselves with an eMail and password. Users can be assigned rights
    individually or as a group
-   **Application** - Any securable FIWARE application consisting of a series of microservices
-   **Organization** - A group of users who can be assigned a series of rights. Altering the rights of the organization
    effects the access of all users of that organization
-   **OrganizationRole** - Users can either be members or admins of an organization - Admins are able to add and remove
    users from their organization, members merely gain the roles and permissions of an organization. This allows each
    organization to be responsible for their members and removes the need for a super-admin to administer all rights
-   **Role** - A role is a descriptive bucket for a set of permissions. A role can be assigned to either a single user
    or an organization. A signed-in user gains all the permissions from all of their own roles plus all of the roles
    associated to their organization
-   **Permission** - An ability to do something on a resource within the system

Additionally two further non-human application objects can be secured within a FIWARE application:

-   **IoTAgent** - a proxy between IoT Sensors and the Context Broker
-   **PEPProxy** - a middleware for use between generic enablers challenging the rights of a user.

# ICT Platform Architecture

The ICT Platform protects access to the existing Orion v2 and LD by adding PEP Proxy
instances around the services created in FIWARE tutorials and uses data pre-populated into the **MySQL** database used
by **Keyrock**. It will make use of four FIWARE components - the
[Orion Context Broker](https://fiware-orion.readthedocs.io/en/latest/), the
[IoT Agent for UltraLight 2.0](https://fiware-iotagent-ul.readthedocs.io/en/latest/), the
[Keyrock](https://fiware-idm.readthedocs.io/en/latest/) Generic enabler and adds one or two instances
[Wilma](https://fiware-pep-proxy.rtfd.io/) PEP Proxy dependent upon which interfaces are to be secured. Usage of the
Orion Context Broker is sufficient for an application to qualify as _“Powered by FIWARE”_.

Both the Orion Context Broker and the IoT Agent rely on open source [MongoDB](https://www.mongodb.com/) technology to
keep persistence of the information they hold. We will also be using the dummy IoT devices created in the
[FIWARE tutorial](https://github.com/FIWARE/tutorials.IoT-Sensors/). **Keyrock** uses its own
[MySQL](https://www.mysql.com/) database.

Therefore the overall architecture will consist of the following elements:

-   The FIWARE [Orion Context Broker](https://fiware-orion.readthedocs.io/en/latest/) which will receive requests using
    [NGSI-v2](https://fiware.github.io/specifications/OpenAPI/ngsiv2)
-   The FIWARE [IoT Agent for UltraLight 2.0](https://fiware-iotagent-ul.readthedocs.io/en/latest/) which will receive
    southbound requests using [NGSI-v2](https://fiware.github.io/specifications/OpenAPI/ngsiv2) and convert them to
    [UltraLight 2.0](https://fiware-iotagent-ul.readthedocs.io/en/latest/usermanual/index.html#user-programmers-manual)
    commands for the devices. **The current version is developed in Node-RED as Custom NGSI Agent.**
-   FIWARE [Keyrock](https://fiware-idm.readthedocs.io/en/latest/) offer a complement Identity Management System
    including:
    -   An OAuth2 authentication system for Applications and Users
    -   A site graphical frontend for Identity Management Administration
    -   An equivalent REST API for Identity Management via HTTP requests
-   FIWARE [Wilma](https://fiware-pep-proxy.rtfd.io/) is a PEP Proxy securing access to the **Orion** and/or **IoT
    Agent** microservices
-   The underlying [MongoDB](https://www.mongodb.com/) database :
    -   Used by the **Orion Context Broker** to hold context data information such as data entities, subscriptions and
        registrations
    -   Used by the **IoT Agent** to hold device information such as device URLs and Keys
-   A [MySQL](https://www.mysql.com/) database :
    -   Used to persist user identities, applications, roles and permissions

Since all interactions between the elements are initiated by HTTP requests, the entities can be containerized and run
from exposed ports.

The specific architecture of each section of the tutorial is discussed below.

## Default users

The data creating users and organizations for the default HYPERRIDE installation are taken from the already mentioned
[FIWARE tutorial](https://github.com/FIWARE/tutorials.Roles-Permissions) which has been downloaded and automatically
persisted to the MySQL database on start-up so the assigned UUIDs do not change and the data does not need to be entered
again.

> **In production environment, new users and organization must be created, e.g., at the premisis of each demo site.**

The **Keyrock** MySQL database deals with all aspects of application security including storing users, password etc.;
defining access rights and dealing with OAuth2 authorization protocols. The complete database relationship diagram can
be found [here](https://fiware.github.io/tutorials.Securing-Access/img/keyrock-db.png)

To create users and organizations and applications, you can log in at
`http://localhost:3005/idm`. Please contact [ENG contact person](mailto:alessandro.rossi@eng.it) for the admin credentials.

<details>

## Logging In to Keyrock using the REST API

Enter a username and password to enter the application. The URL `https://localhost:3443/v1/auth/tokens` should also work in a secure system.

### Create Token with Password

The following example logs in using the Admin Super-User:

#### :one: Request:

```console
curl -iX POST \
  'http://localhost:3005/v1/auth/tokens' \
  -H 'Content-Type: application/json' \
  -d '{
  "name": "****",
  "password": "****"
}'
```

#### Response:

The response header returns an `X-Subject-token` which identifies who has logged on the application. This token is
required in all subsequent requests to gain access

```
HTTP/1.1 201 Created
X-Subject-Token: d848eb12-889f-433b-9811-6a4fbf0b86ca
Content-Type: application/json; charset=utf-8
Content-Length: 138
ETag: W/"8a-TVwlWNKBsa7cskJw55uE/wZl6L8"
Date: Wed, 22 May 2010 20:30:45 GMT
Connection: keep-alive
```

```json
{
    "token": {
        "methods": ["password"],
        "expires_at": "2022-05-22T22:30:00.000Z"
    },
    "idm_authorization_config": {
        "level": "basic",
        "authzforce": false
    }
}
```

### Get Token Info

Once a user has logged in, the presence of a (time-limited) token is sufficient to find out more information about the
user.

You can use the long-lasting `X-Auth-token=aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa` to pretend to be Alice throughout this
tutorial. Both `{{X-Auth-token}}` and `{{X-Subject-token}}` can be set to the same value in the case that Alice is
making an enquiry about herself.

#### :two: Request:

```console
curl -X GET \
  'http://localhost:3005/v1/auth/tokens' \
  -H 'Content-Type: application/json' \
  -H 'X-Auth-token: {{X-Auth-token}}' \
  -H 'X-Subject-token: {{X-Subject-token}}'
```

#### Response:

The response will return the details of the associated user

```json
{
    "access_token": "********-****-****-****-************",
    "expires": "2036-07-30T12:04:45.000Z",
    "valid": true,
    "User": {
        "id": "********-****-****-****-************",
        "username": "****",
        "email": "****",
        "date_password": "2010-05-22T20:45:00.000Z",
        "enabled": true,
        "admin": true
    }
}
```
</details>

# Managing PEP Proxies and IoT Agents

At the very begininning of the installation of the HYPERRIDE ICT Platform, to start using it, [default user accounts](https://github.com/FIWARE/tutorials.Identity-Management) have been created.
Non-human actors such as a PEP Proxy can be set up in the same manner. The account for each PEP Proxy, IoT Agent or IoT
Sensor will merely consist of a Username and password linked to an application within Keyrock. PEP Proxy and IoT Agents
accounts can be created by using either the Keyrock GUI or by using the REST API.

## Managing PEP Proxies and IoT Agents - Start Up

To start the system run the following command:

```console
docker-compose up
```

This will start up **Keyrock** with a series of users. There are already two existing applications and an existing PEP
Proxy Account associated with the application. Anyway, in the followings, instructions to make new ones are provided.


>**Note** Creation of new PEP Proxy and IOT Agents is not necessary, since it is part of the HYPERRIDE ICT Platform, but it is documented for the sake of completeness.

<details>

## PEP Proxy CRUD Actions

#### GUI

Once signed-in, users are able to create and update PEP Proxies associated to their applications for themselves.

#### REST API

Alternatively, the standard CRUD actions are assigned to the appropriate HTTP verbs (POST, GET, PATCH and DELETE) under
the `/v1/applications/{{application-id}}/pep_proxies` endpoint.

### Create a PEP Proxy

To create a new PEP Proxy account within an application, send a POST request to the
`/v1/applications/{{application-id}}/pep_proxies` endpoint along with the `X-Auth-token` header from a previously logged
in administrative user.

#### :three: Request:

```console
curl -iX POST \
  'http://localhost:3005/v1/applications/{{application-id}}/pep_proxies' \
  -H 'Content-Type: application/json' \
  -H 'X-Auth-token: {{X-Auth-token}}'
```

#### Response:

Provided there is no previously existing PEP Proxy account associated with the application, a new account will be
created with a unique `id` and `password` and the values will be returned in the response.

```json
{
    "pep_proxy": {
        "id": "pep_proxy_ac80aaf8-0ac3-4bd8-8042-5e8f587679b7",
        "password": "pep_proxy_23d805e7-1b93-434a-8e69-0798dcdd6726"
    }
}
```

### Read PEP Proxy details

Making a GET request to the `/v1/applications/{{application-id}}/pep_proxies` endpoint will return the details of the
associated PEP Proxy Account. The `X-Auth-token` must be supplied in the headers.

#### :four: Request:

```console
curl -X GET \
  'http://localhost:3005/v1/applications/{{application-id}}/pep_proxies/' \
  -H 'X-Auth-token: {{X-Auth-token}}'
```

#### Response:

```json
{
    "pep_proxy": {
        "id": "pep_proxy_f84bcba2-3300-4f13-a4bb-7bdbd358b201",
        "oauth_client_id": "tutorial-dckr-site-0000-xpresswebapp"
    }
}
```

### Reset Password of a PEP Proxy

To renew the password of a PEP Proxy Account, make a PATCH request to the
`/v1/applications/{{application-id}}/pep_proxies` endpoint will return the details of the associated PEP Proxy Account.
The `X-Auth-token` must be supplied in the headers.

#### :five: Request:

```console
curl -X PATCH \
  'http://localhost:3005/v1/applications/{{application-id}}/pep_proxies' \
  -H 'Content-Type: application/json' \
  -H 'X-Auth-token: {{X-Auth-token}}'
```

#### Response:

The response returns a new password for the PEP Proxy Account

```json
{
    "new_password": "pep_proxy_2bc8996e-29bf-4195-ac39-d1116e429602"
}
```

### Delete a PEP Proxy

An existing PEP Proxy Account can be deleted by making a DELETE request to the
`/v1/applications/{{application-id}}/pep_proxies` endpoint. The `X-Auth-token` must be supplied in the headers.

#### :six: Request:

```console
curl -X DELETE \
  'http://localhost:3005/v1/applications/{{application-id}}/pep_proxies' \
  -H 'Content-Type: application/json' \
  -H 'X-Auth-token: {{X-Auth-token}}'
```

## IoT Agent CRUD Actions

#### GUI

In a similar manner to PEP Proxy creation, signed-in, users are able to create and update IoT Sensor Accounts associated
to their applications.

![](https://fiware.github.io/tutorials.PEP-Proxy/img/create-iot-sensor.png)

#### REST API

Alternatively, the standard CRUD actions are assigned to the appropriate HTTP verbs (POST, GET, PATCH and DELETE) under
the `/v1/applications/{{application-id}}/iot_agents` endpoint.

### Create an IoT Agent

To create a new IoT Agent account within an application, send a POST request to the
`/v1/applications/{{application-id}}/iot_agents` endpoint along with the `X-Auth-token` header from a previously logged
in administrative user.

#### :seven: Request:

```console
curl -X POST \
  'http://localhost:3005/v1/applications/{{application-id}}/iot_agents' \
  -H 'Content-Type: application/json' \
  -H 'X-Auth-token: {{X-Auth-token}}'
```

#### Response:

A new account will be created with a unique `id` and `password` and the values will be returned in the response.

```json
{
    "iot": {
        "id": "iot_sensor_f1d0ca9e-b519-4a8d-b6ae-1246e443dd7e",
        "password": "iot_sensor_8775b438-6e66-4a6e-87c2-45c6525351ee"
    }
}
```

### Read IoT Agent details

Making a GET request the `/v1/applications/{{application-id}}/iot_agents/{{iot-agent-id}}` endpoint will return the
details of the associated IoT Agent Account. The `X-Auth-token` must be supplied in the headers.

#### :eight: Request:

```console
curl -X GET \
  'http://localhost:3005/v1/applications/{{application-id}}/iot_agents/{{iot-agent-id}}' \
  -H 'X-Auth-token: {{X-Auth-token}}'
```

#### Response:

```json
{
    "iot": {
        "id": "iot_sensor_00000000-0000-0000-0000-000000000000",
        "oauth_client_id": "tutorial-dckr-site-0000-xpresswebapp"
    }
}
```

### List IoT Agents

A list of all IoT Agents associated with an application can be obtained by making a GET request the
`/v1/applications/{{application-id}}/iot_agents` endpoint. The `X-Auth-token` must be supplied in the headers.

#### :nine: Request:

```console
curl -X GET \
  'http://localhost:3005/v1/applications/{{application-id}}/iot_agents' \
  -H 'X-Auth-token: {{X-Auth-token}}'
```

#### Response:

```json
{
    "iots": [
        {
            "id": "iot_sensor_00000000-0000-0000-0000-000000000000"
        },
        {
            "id": "iot_sensor_c0fa0a77-ea9e-4a82-8118-b4d3c6b230b1"
        }
    ]
}
```

### Reset Password of an IoT Agent

#### :one::zero: Request:

To renew the password of an individual IoT Agent Account, make a PATCH request to the
`/v1/applications/{{application-id}}//iot_agents/{{iot-agent-id}}` endpoint. The `X-Auth-token` must be supplied in the
headers.

```console
curl -iX PATCH \
  'http://localhost:3005/v1/applications/{{application-id}}/iot_agents/{{iot-agent-id}}' \
  -H 'Content-Type: application/json' \
  -H 'X-Auth-token: {{X-Auth-token}}'
```

#### Response:

The response returns a new password for the IoT Agent account.

```json
{
    "new_password": "iot_sensor_114cb79c-bf69-444a-82a1-e6e85187dacd"
}
```

### Delete an IoT Agent

An existing IoT Agent Account can be deleted by making a DELETE request to the
`/v1/applications/{{application-id}}/iot_agents/{{iot-agent-id}}` endpoint. The `X-Auth-token` must be supplied in the
headers.

#### Request:

```console
curl -X DELETE \
  'http://localhost:3005/v1/applications/{{application-id}}/iot_agents/{{iot-agent-id}}' \
  -H 'X-Auth-token: {{X-Auth-token}}'
```
</details>

# Securing the Orion Context Broker

In the following picture, the general architecture of the secuirity-related part of the HYPERRIDE ICT Platform is depicted.

![PEP Proxy Orion](public/hyperride-pep-proxy-orion.png)

## Securing Orion - PEP Proxy Configuration

The `orion-proxy` container is an instance of FIWARE **Wilma** listening on port `1027`, it is configured to forward
traffic to `orion` on port `1026`, which is the default port that the Orion Context Broker is listening to for NGSI
Requests.

```yaml
orion-proxy:
    image: fiware/pep-proxy
    container_name: fiware-orion-proxy
    hostname: orion-proxy
    networks:
        default:
            ipv4_address: 172.18.1.10
    depends_on:
        - keyrock
    ports:
        - "1027:1027"
    expose:
        - "1027"
    environment:
        - PEP_PROXY_APP_HOST=orion
        - PEP_PROXY_APP_PORT=1026
        - PEP_PROXY_PORT=1027
        - PEP_PROXY_IDM_HOST=keyrock
        - PEP_PROXY_HTTPS_ENABLED=false
        - PEP_PROXY_AUTH_ENABLED=false
        - PEP_PROXY_IDM_SSL_ENABLED=false
        - PEP_PROXY_IDM_PORT=3005
        - PEP_PROXY_APP_ID=tutorial-dckr-site-0000-xpresswebapp
        - PEP_PROXY_USERNAME=pep_proxy_00000000-0000-0000-0000-000000000000
        - PEP_PASSWORD=****
        - PEP_PROXY_PDP=idm
        - PEP_PROXY_MAGIC_KEY=****
```

The `PEP_PROXY_APP_ID` and `PEP_PROXY_USERNAME` would usually be obtained by adding new entries to the application in
**Keyrock**, however, in this tutorial, they have been predefined by populating the **MySQL** database with data on
start-up.

The `orion-proxy` container is listening on a single port:

-   The PEP Proxy Port - `1027` is exposed purely for tutorial access - so that cUrl or Postman can requests directly to
    the **Wilma** instance without being part of the same network.

| Key                       | Value                                            | Description                                            |
| ------------------------- | ------------------------------------------------ | ------------------------------------------------------ |
| PEP_PROXY_APP_HOST        | `orion`                                          | The hostname of the service behind the PEP Proxy       |
| PEP_PROXY_APP_PORT        | `1026`                                           | The port of the service behind the PEP Proxy           |
| PEP_PROXY_PORT            | `1027`                                           | The port that the PEP Proxy is listening on            |
| PEP_PROXY_IDM_HOST        | `keyrock`                                        | The hostname for the Identity Manager                  |
| PEP_PROXY_HTTPS_ENABLED   | `false`                                          | Whether the PEP Proxy itself is running under HTTPS    |
| PEP_PROXY_AUTH_ENABLED    | `false`                                          | Whether the PEP Proxy is checking for Authorization    |
| PEP_PROXY_IDM_SSL_ENABLED | `false`                                          | Whether the Identity Manager is running under HTTPS    |
| PEP_PROXY_IDM_PORT        | `3005`                                           | The Port for the Identity Manager instance             |
| PEP_PROXY_APP_ID          | `tutorial-dckr-site-0000-xpresswebapp`           |                                                        |
| PEP_PROXY_USERNAME        | `pep_proxy_00000000-0000-0000-0000-000000000000` | The Username for the PEP Proxy                         |
| PEP_PASSWORD              | `****`                                           | The Password for the PEP Proxy                         |
| PEP_PROXY_PDP             | `idm`                                            | The Type of service offering the Policy Decision Point |
| PEP_PROXY_MAGIC_KEY       | `****`                                           |                                                        |

For this example, the PEP Proxy is checking for Level 1 - _Authentication Access_ not Level 2 - _Basic Authorization_ or
Level 3 - _Advanced Authorization_.

## Securing Orion - Start up

To start the system with a PEP Proxy protecting access to **Orion**, run the following command:

```console
docker-compose up
```

## User Logs In to the Application using the REST API

### PEP Proxy - No Access to Orion without an Access Token

Secured Access can be ensured by requiring all requests to the secured service are made indirectly via a PEP Proxy (in
this case the PEP Proxy is found in front of the Context Broker). Requests must include an `X-Auth-Token`, failure to
present a valid token results in a denial of access.

#### Request:

If a request to the PEP Proxy is made without any access token as shown:

```console
curl -X GET \
  http://localhost:1027/v2/entities/urn:ngsi-ld:TemperatureSensor:001?options=keyValues
```

#### Response:

The response is a **401 Unauthorized** error code, with the following explanation:

```
Auth-token not found in request header
```

### Keyrock - User Obtains an Access Token

#### Request:

To log in to the application using the user-credentials flow send a POST request to **Keyrock** using the `oauth2/token`
endpoint with the `grant_type=password`. For example:

```console
curl -iX POST \
  'http://localhost:3005/oauth2/token' \
  -H 'Accept: application/json' \
  -H 'Authorization: Basic dHV0b3JpYWwtZGNrci1zaXRlLTAwMDAteHByZXNzd2ViYXBwOnR1dG9yaWFsLWRja3Itc2l0ZS0wMDAwLWNsaWVudHNlY3JldA==' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  --data "username=USERNAME&password=PASSWORD&grant_type=password"
```

#### Response:

The response returns an access code to identify the user:

```json
{
    "access_token": "a7e22dfe2bd7d883c8621b9eb50797a7f126eeab",
    "token_type": "Bearer",
    "expires_in": 3599,
    "refresh_token": "05e386edd9f95ed0e599c5004db8573e86dff874"
}
```

This can also be done by entering the Tutorial Application on http:/localhost and logging in using any of the OAuth2
grants on the page. A successful log-in will return an access token.

### PEP Proxy - Accessing Orion with an Access Token

If a request to the PEP Proxy is made including a valid access token in the `X-Auth-Token` header as shown, the request
is permitted and the service behind the PEP Proxy (in this case the Orion Context Broker) will return the data as
expected.

#### Request:

```console
curl -X GET \
  http://localhost:1027/v2/entities/urn:ngsi-ld:TemperatureSensor:001?options=keyValues \
  -H 'X-Auth-Token: {{X-Access-token}}'
```

### PEP Proxy - Accessing Orion with an Authorization: Bearer

The standard `Authorization: Bearer` header can also be used to identity the user, the request from an authorized user
is permitted and the service behind the PEP Proxy (in this case the Orion Context Broker) will return the data as
expected.

#### Request:

```console
curl -X GET \
  http://localhost:1027/v2/entities/urn:ngsi-ld:TemperatureSensor:001?options=keyValues \
  -H 'Authorization: Bearer {{X-Access-token}}'
```

#### Response:

```json
{
    "id": "urn:ngsi-ld:TemperatureSensor:001",
    "type": "TemperatureSensor",
    "category": "sensor",
    "temperature": {
        "value": 24,
        "uom": "CEL"
    }
}
```

## Securing Orion - Sample Code

The HYPERRIDE ICT Platform can be accessed also in a programmatic way. When a User logs in to the application using the User Credentials Grant, an `access_token` is obtained which identifies
the User. The `access_token` is stored in session:

```javascript
function userCredentialGrant(req, res) {
    debug("userCredentialGrant");

    const email = req.body.email;
    const password = req.body.password;

    oa.getOAuthPasswordCredentials(email, password).then((results) => {
        req.session.access_token = results.access_token;
        return;
    });
}
```

For each subsequent request, the `access_token` is supplied in the `X-Auth-Token` Header

```javascript
function setAuthHeaders(req) {
    const headers = {};
    if (req.session.access_token) {
        headers["X-Auth-Token"] = req.session.access_token;
    }
    return headers;
}
```

In the following example, two requests are made. The same `X-Auth-Token` Header must be added to each request -
therefore the User can be identified and access granted.

```javascript
async function uodateItem(req, res) {
    const inventory = await retrieveEntity(
        req.params.inventoryId,
        {
            options: "keyValues",
            type: "TemperatureSensor"
        },
        setAuthHeaders(req)
    );
    const count = inventory.shelfCount - 1;

    await updateExistingEntityAttributes(
        req.params.inventoryId,
        { shelfCount: { type: "Integer", value: count } },
        {
            type: "TemperatureSensor"
        },
        setAuthHeaders(req)
    );
    res.redirect(`/app/store/${inventory.refStore}/till`);
}
```

# ICT Platform Usage Tutorial

## Creating Context Data

At its heart, FIWARE is a system for managing context information, so lets add some context data into the system by
creating two new entities. Any entity must have a `id` and `type` attributes, additional
attributes are optional and will depend on the system being described. Each additional attribute should also have a
defined `type` and a `value` attribute.

#### :two: Request:

```console
curl -iX POST \
  'http://localhost:1026/v2/entities' \
  -H 'X-Auth-token: {{X-Auth-token}}' \
  -H 'Content-Type: application/json' \
  -d '
{
    "id": "urn:ngsi-ld:Store:001",
    "type": "Store",
    "address": {
        "type": "PostalAddress",
        "value": {
            "streetAddress": "Bornholmer Straße 65",
            "addressRegion": "Berlin",
            "addressLocality": "Prenzlauer Berg",
            "postalCode": "10439"
        },
        "metadata": {
            "verified": {
                "value": true,
                "type": "Boolean"
            }
        }
    },
    "location": {
        "type": "geo:json",
        "value": {
             "type": "Point",
             "coordinates": [13.3986, 52.5547]
        }
    },
    "name": {
        "type": "Text",
        "value": "Bösebrücke Einkauf"
    }
}'
```

#### :three: Request:

Each subsequent entity must have a unique `id` for the given `type`

```console
curl -iX POST \
  'http://localhost:1026/v2/entities' \
  -H 'X-Auth-token: {{X-Auth-token}}' \
  -H 'Content-Type: application/json' \
  -d '
{
    "type": "Store",
    "id": "urn:ngsi-ld:Store:002",
    "address": {
        "type": "PostalAddress",
        "value": {
            "streetAddress": "Friedrichstraße 44",
            "addressRegion": "Berlin",
            "addressLocality": "Kreuzberg",
            "postalCode": "10969"
        },
        "metadata": {
            "verified": {
                "value": true,
                "type": "Boolean"
            }
        }
    },
    "location": {
        "type": "geo:json",
        "value": {
             "type": "Point",
             "coordinates": [13.3903, 52.5075]
        }
    },
    "name": {
        "type": "Text",
        "value": "Checkpoint Markt"
    }
}'
```

### Data Model Guidelines

Although the each data entity within your context will vary according to your use case, the common structure within each
data entity should be standardized order to promote reuse. The full Smart Data model guidelines can be found
[here](https://smartdatamodels.org/). This tutorial demonstrates the usage of the following recommendations:

#### All terms are defined in American English

Although the `value` fields of the context data may be in any language, all attributes and types are written using the
English language.

#### Entity type names must start with a Capital letter

In this case we only have one entity type - **Store**

#### Entity IDs should be a URN following NGSI-LD guidelines

NGSI-LD has recently been published as a full ETSI
[specification](https://www.etsi.org/deliver/etsi_gs/CIM/001_099/009/01.04.02_60/gs_cim009v010402p.pdf), the proposal is
that each `id` is a URN follows a standard format: `urn:ngsi-ld:<entity-type>:<entity-id>`. This will mean that every
`id` in the system will be unique

#### Data type names should reuse schema.org data types where possible

[Schema.org](http://schema.org/) is an initiative to create common structured data schemas. In order to promote reuse we
have deliberately used the [`Text`](http://schema.org/PostalAddress) and
[`PostalAddress`](http://schema.org/PostalAddress) type names within our **Store** entity. Other existing standards such
as [Open311](http://www.open311.org/) (for civic issue tracking) or [Datex II](https://datex2.eu/) (for transport
systems) can also be used, but the point is to check for the existence of the same attribute on existing data models and
reuse it.

#### Use camel case syntax for attribute names

The `streetAddress`, `addressRegion`, `addressLocality` and `postalCode` are all examples of attributes using camel
casing

#### Location information should be defined using `address` and `location` attributes

-   We have used an `address` attribute for civic locations as per [schema.org](http://schema.org/)
-   We have used a `location` attribute for geographical coordinates.

#### Use GeoJSON for codifying geospatial properties

[GeoJSON](http://geojson.org) is an open standard format designed for representing simple geographical features. The
`location` attribute has been encoded as a geoJSON `Point` location.

### Attribute Metadata

Metadata is _"data about data"_, it is additionl data used to describe properties of the attribute value itself like
accuracy, provider, or a timestamp. Several built-in metadata attribute already exist and these names are reserved

-   `dateCreated` (type: DateTime): attribute creation date as an ISO 8601 string.
-   `dateModified` (type: DateTime): attribute modification date as an ISO 8601 string.
-   `previousValue` (type: any): only in notifications. The value of this
-   `actionType` (type: Text): only in notifications.

One element of metadata can be found within the `address` attribute. a `verified` flag indicates whether the address has
been confirmed.

## Querying Context Data

A consuming application can now request context data by making HTTP requests to the Orion Context Broker. The existing
NGSI interface enables us to make complex queries and filter results.

At the moment, for the store finder demo all the context data is being added directly via HTTP requests, however in a
more complex smart solution, the Orion Context Broker will also retrieve context directly from attached sensors
associated to each entity.

Here are a few examples, in each case the `options=keyValues` query parameter has been used shorten the responses by
stripping out the type elements from each attribute

### Obtain entity data by ID

This example returns the data of `urn:ngsi-ld:Store:001`

#### :four: Request:

```console
curl -G -X GET \
   'http://localhost:1026/v2/entities/urn:ngsi-ld:Store:001' \
   -H 'X-Auth-token: {{X-Auth-token}}' \
   -d 'options=keyValues'
```

#### Response:

Because of the use of the `options=keyValues`, the response consists of JSON only without the attribute `type` and
`metadata` elements.

```json
{
    "id": "urn:ngsi-ld:Store:001",
    "type": "Store",
    "address": {
        "streetAddress": "Bornholmer Straße 65",
        "addressRegion": "Berlin",
        "addressLocality": "Prenzlauer Berg",
        "postalCode": "10439"
    },
    "location": {
        "type": "Point",
        "coordinates": [13.3986, 52.5547]
    },
    "name": "Bösebrücke Einkauf"
}
```

### Obtain entity data by type

This example returns the data of all `Store` entities within the context data The `type` parameter limits the response
to store entities only.

#### :five: Request:

```console
curl -G -X GET \
    'http://localhost:1026/v2/entities' \
    -H 'X-Auth-token: {{X-Auth-token}}' \
    -d 'type=Store' \
    -d 'options=keyValues'
```

#### Response:

Because of the use of the `options=keyValues`, the response consists of JSON only without the attribute `type` and
`metadata` elements.

```json
[
    {
        "id": "urn:ngsi-ld:Store:001",
        "type": "Store",
        "address": {
            "streetAddress": "Bornholmer Straße 65",
            "addressRegion": "Berlin",
            "addressLocality": "Prenzlauer Berg",
            "postalCode": "10439"
        },
        "location": {
            "type": "Point",
            "coordinates": [13.3986, 52.5547]
        },
        "name": "Bose Brucke Einkauf"
    },
    {
        "id": "urn:ngsi-ld:Store:002",
        "type": "Store",
        "address": {
            "streetAddress": "Friedrichstraße 44",
            "addressRegion": "Berlin",
            "addressLocality": "Kreuzberg",
            "postalCode": "10969"
        },
        "location": {
            "type": "Point",
            "coordinates": [13.3903, 52.5075]
        },
        "name": "Checkpoint Markt"
    }
]
```

### Filter context data by comparing the values of an attribute

This example returns all stores with the `name` attribute _Checkpoint Markt_. Filtering can be done using the `q`
parameter - if a string has spaces in it, it can be URL encoded and held within single quote characters `'` = `%27`

#### :six: Request:

```console
curl -G -X GET \
    'http://localhost:1026/v2/entities' \
    -H 'X-Auth-token: {{X-Auth-token}}' \
    -d 'type=Store' \
    -d 'q=name==%27Checkpoint%20Markt%27' \
    -d 'options=keyValues'
```

#### Response:

Because of the use of the `options=keyValues`, the response consists of JSON only without the attribute `type` and
`metadata` elements.

```json
[
    {
        "id": "urn:ngsi-ld:Store:002",
        "type": "Store",
        "address": {
            "streetAddress": "Friedrichstraße 44",
            "addressRegion": "Berlin",
            "addressLocality": "Kreuzberg",
            "postalCode": "10969"
        },
        "location": {
            "type": "Point",
            "coordinates": [13.3903, 52.5075]
        },
        "name": "Checkpoint Markt"
    }
]
```

### Filter context data by comparing the values of a sub-attribute

This example returns all stores found in the Kreuzberg District.

Filtering can be done using the `q` parameter - sub-attributes are annotated using the dot syntax e.g.
`address.addressLocality`

#### :seven: Request:

```console
curl -G -X GET \
    'http://localhost:1026/v2/entities' \
    -H 'X-Auth-token: {{X-Auth-token}}' \
    -d 'type=Store' \
    -d 'q=address.addressLocality==Kreuzberg' \
    -d 'options=keyValues'
```

#### Response:

Because of the use of the `options=keyValues`, the response consists of JSON only without the attribute `type` and
`metadata` elements.

```json
[
    {
        "id": "urn:ngsi-ld:Store:002",
        "type": "Store",
        "address": {
            "streetAddress": "Friedrichstraße 44",
            "addressRegion": "Berlin",
            "addressLocality": "Kreuzberg",
            "postalCode": "10969"
        },
        "location": {
            "type": "Point",
            "coordinates": [13.3903, 52.5075]
        },
        "name": "Checkpoint Markt"
    }
]
```

### Filter context data by querying metadata

This example returns the data of all `Store` entities with a verified address.

Metadata queries can be made using the `mq` parameter.

#### :eight: Request:

```console
curl -G -X GET \
    'http://localhost:1026/v2/entities' \
    -H 'X-Auth-token: {{X-Auth-token}}' \
    -d 'type=Store' \
    -d 'mq=address.verified==true' \
    -d 'options=keyValues'
```

#### Response:

Because of the use of the `options=keyValues`, the response consists of JSON only without the attribute `type` and
`metadata` elements.

```json
[
    {
        "id": "urn:ngsi-ld:Store:001",
        "type": "Store",
        "address": {
            "streetAddress": "Bornholmer Straße 65",
            "addressRegion": "Berlin",
            "addressLocality": "Prenzlauer Berg",
            "postalCode": "10439"
        },
        "location": {
            "type": "Point",
            "coordinates": [13.3986, 52.5547]
        },
        "name": "Bösebrücke Einkauf"
    },
    {
        "id": "urn:ngsi-ld:Store:002",
        "type": "Store",
        "address": {
            "streetAddress": "Friedrichstraße 44",
            "addressRegion": "Berlin",
            "addressLocality": "Kreuzberg",
            "postalCode": "10969"
        },
        "location": {
            "type": "Point",
            "coordinates": [13.3903, 52.5075]
        },
        "name": "Checkpoint Markt"
    }
]
```

### Filter context data by comparing the values of a geo:json attribute

This example return all Stores within 1.5km the **Brandenburg Gate** in **Berlin** (_52.5162N 13.3777W_)

#### :nine: Request:

```console
curl -G -X GET \
  'http://localhost:1026/v2/entities' \
  -H 'X-Auth-token: {{X-Auth-token}}' \
  -d 'type=Store' \
  -d 'georel=near;maxDistance:1500' \
  -d 'geometry=point' \
  -d 'coords=52.5162,13.3777' \
  -d 'options=keyValues'
```

#### Response:

Because of the use of the `options=keyValues`, the response consists of JSON only without the attribute `type` and
`metadata` elements.

```json
[
    {
        "id": "urn:ngsi-ld:Store:002",
        "type": "Store",
        "address": {
            "streetAddress": "Friedrichstraße 44",
            "addressRegion": "Berlin",
            "addressLocality": "Kreuzberg",
            "postalCode": "10969"
        },
        "location": {
            "type": "Point",
            "coordinates": [13.3903, 52.5075]
        },
        "name": "Checkpoint Markt"
    }
]
```

# NGSI Entities User Manual

In this tutorial for the management of NGSI Entities through the HYPERRIDE ICT Platform, we assume the usage of the **Orion Context Broker v2**, 
as default, as already mentioned in the introduction. Similarily, the same operations can be done with version LD.
In case of adoption at pilot site, the current documentation may be adapted accordingly, following the emerging project needs.

**Create**, **Read**, **Update** and **Delete** are the four basic functions of persistent storage. These operations are
usually referred to using the acronym **CRUD**. Within a database each of these operations map directly to a series of
commands, however their relationship with a RESTful API is slightly more complex.

The [Orion Context Broker](https://fiware-orion.readthedocs.io/en/latest/) uses
[NGSI-v2](https://fiware.github.io/specifications/OpenAPI/ngsiv2) to manipulate the context data. As a RESTful API,
requests to manipulate the data held within the context follow the standard conventions found when mapping HTTP verbs to
CRUD operations.

## Entity CRUD Operations

For operations where the `<entity-id>` is not yet known within the context, or is unspecified, the `/v2/entities`
endpoint is used.

Once an `<entity-id>` is known within the context, individual data entities can be manipulated using the
`/v2/entities/<entity-id>` endpoint.

It is recommended that entity identifiers should be URNs following the
[NGSI-LD specification](https://www.etsi.org/deliver/etsi_gs/CIM/001_099/009/01.06.01_60/gs_CIM009v010601p.pdf),
therefore each `id` is a URN which follows a standard format: `urn:ngsi-ld:<entity-type>:<entity-id>`. This helps making
every `id` in the context data unique.

| HTTP Verb  |                                               `/v2/entities`                                               |                                              `/v2/entities/<entity-id>`                                              |
| ---------- | :--------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------: |
| **POST**   |                                CREATE a new entity and add to the context.                                 |                                 CREATE or UPDATE an attribute of a specified entity.                                 |
| **GET**    | READ entity data from the context. This will return data from multiple entities. The data can be filtered. | READ entity data from a specified entity. This will return data from a single entity only. The data can be filtered. |
| **PUT**    |                                                    :x:                                                     |                                                         :x:                                                          |
| **PATCH**  |                                                    :x:                                                     |                                                         :x:                                                          |
| **DELETE** |                                                    :x:                                                     |                                          DELETE an entity from the context                                           |

A complete list of entity endpoints can be found in the
[NGSI v2 Swagger Specification](https://fiware.github.io/specifications/OpenAPI/ngsiv2#/Entities)

## Attribute CRUD Operations

To perform CRUD operations on attributes, the `<entity-id>` must be known. Each attribute is effectively a key-value
pair.

There are three endpoints:

-   `/v2/entities/<entity-id>/attrs` is only used for a patch operation to update one or more exisiting attributes.
-   `/v2/entities/<entity-id>/attrs/<attribute>` is used to manipulate an attribute as a whole.
-   `/v2/entities/<entity-id>/attrs/<attribute>/value` is used to read or update the `value` of an attribute, leaving
    the `type` untouched.

| HTTP Verb   |                           `.../attrs`                           |                `.../attrs/<attribute>`                |                              `.../attrs/<attribute>/value`                               |
| ----------- | :-------------------------------------------------------------: | :---------------------------------------------------: | :--------------------------------------------------------------------------------------: |
| **POST**    |                               :x:                               |                          :x:                          |                                           :x:                                            |
| **GET**     |                               :x:                               |                          :x:                          | READ the value of an attribute from a specified entity. This will return a single field. |
| **PUT**     |                               :x:                               |                          :x:                          |              UPDATE the value of single attribute from a specified entity.               |
| **PATCH**   | UPDATE one or more existing attributes from an existing entity. |                          :x:                          |                                           :x:                                            |
| **DELETE**. |                               :x:                               | DELETE an existing attribute from an existing entity. |                                           :x:                                            |

A complete list of attribute endpoints can be found in the
[NGSI v2 Swagger Specification](https://fiware.github.io/specifications/OpenAPI/ngsiv2#/Attributes)

## Batch CRUD Operations

Additionally the Orion Context Broker has a convenience batch operation endpoint `/v2/op/update` to manipulate multiple
entities in a single operation.

Batch operations are always triggered by a POST request where the payload is an object with two properties:

-   `actionType` specifies the kind of action to invoke (e.g. `delete`)
-   `entities` is an array of objects holding the list of entities to update, along with the relevant entity data used
    to perform the operation.

## Create Operations

Create Operations map to HTTP POST.

-   The `/v2/entities` endpoint is used for creating new entities
-   The `/v2/entities/<entity>` endpoint is used for adding new attributes

Any newly created entity must have `id` and `type` attributes, other attributes are optional and will depend on the
system being modelled. If additional attributes are present though, each should specify both a `type` and a `value`.

The response will be **204 - No Content** if the operation is successful or **422 - Unprocessable Entity** if the
operation fails.

### Create a New Data Entity

This example adds a new **Product** entity ("Lemonade" at 99 cents) to the context.

#### :one: Request:

```console
curl -iX POST \
  --url 'http://localhost:1026/v2/entities' \
  --header 'X-Auth-token: {{X-Auth-token}}' \
  --header 'Content-Type: application/json' \
  --data ' {
      "id":"urn:ngsi-ld:Product:010", "type":"Product",
      "name":{"type":"Text", "value":"Lemonade"},
      "size":{"type":"Text", "value": "S"},
      "price":{"type":"Integer", "value": 99}
}'
```

New entities can be added by making a POST request to the `/v2/entities` endpoint.

The request will fail if any of the attributes already exist in the context.

#### :two: Request:

You can check to see if the new **Product** can be found in the context by making a GET request

```console
curl -X GET \
  --url 'http://localhost:1026/v2/entities/urn:ngsi-ld:Product:010?type=Product' \
  --header 'X-Auth-token: {{X-Auth-token}}' \
  --header 'X-Auth-token: {{X-Auth-token}}'
```

### Create a New Attribute

This example adds a new `specialOffer` attribute to the existing **Product** entity with `id=urn:ngsi-ld:Product:001`.

#### :three: Request:

```console
curl -iX POST \
  --url 'http://localhost:1026/v2/entities/urn:ngsi-ld:Product:001/attrs' \
  --header 'X-Auth-token: {{X-Auth-token}}' \
  --header 'Content-Type: application/json' \
  --data '{
      "specialOffer":{"value": true}
}'
```

New attributes can be added by making a POST request to the `/v2/entities/<entity>/attrs` endpoint.

The payload should consist of a JSON object holding the attribute names and values as shown.

If no `type` is specified a default type (`Boolean`, `Text` , `Number` or `StructuredValue`) will be assigned.

Subsequent requests using the same `id` will update the value of the attribute in the context.

#### :four: Request:

You can check to see if the new **Product** attribute can be found in the context by making a GET request

```console
curl -X GET \
  --url 'http://localhost:1026/v2/entities/urn:ngsi-ld:Product:001?type=Product' \
  --header 'X-Auth-token: {{X-Auth-token}}'
```

As you can see there is now a boolean `specialOffer` flag attached to the "Apples" **Product** entity.

### Batch Create New Data Entities or Attributes

This example uses the convenience batch processing endpoint to add two new **Product** entities and one new attribute
(`offerPrice`) to the context.

#### :five: Request:

```console
curl -iX POST \
  --url 'http://localhost:1026/v2/op/update' \
  --header 'X-Auth-token: {{X-Auth-token}}' \
  --header 'Content-Type: application/json' \
  --data '{
  "actionType":"append_strict",
  "entities":[
    {
      "id":"urn:ngsi-ld:Product:011", "type":"Product",
      "name":{"type":"Text", "value":"Brandy"},
      "size":{"type":"Text", "value": "M"},
      "price":{"type":"Integer", "value": 1199}
    },
    {
      "id":"urn:ngsi-ld:Product:012", "type":"Product",
      "name":{"type":"Text", "value":"Port"},
      "size":{"type":"Text", "value": "M"},
      "price":{"type":"Integer", "value": 1099}
    },
    {
      "id":"urn:ngsi-ld:Product:001", "type":"Product",
      "offerPrice":{"type":"Integer", "value": 89}
    }
  ]
}'
```

The request will fail if any of the attributes already exist in the context.

Batch processing uses the `/v2/op/update` endpoint with a payload with two attributes

-   `actionType=append_strict` means that the request only succeeds if all entities / attributes are new.
-   The `entities` attribute holds an array of entities we wish to create.

Subsequent requests using the same data with the `actionType=append_strict` batch operation will result in an error
response.

### Batch Create/Overwrite New Data Entities

This example uses the convenience batch processing endpoint to add or amend two **Product** entities and one attribute
(`offerPrice`) to the context.

-   if an entity already exists, the request will update that entity's attributes.
-   if an entity does not exist, a new entity will be created.

#### :six: Request:

```console
curl -iX POST \
  --url 'http://localhost:1026/v2/op/update' \
  --header 'X-Auth-token: {{X-Auth-token}}' \
  --header 'Content-Type: application/json' \
  --data '{
  "actionType":"append",
  "entities":[
    {
      "id":"urn:ngsi-ld:Product:011", "type":"Product",
      "name":{"type":"Text", "value":"Brandy"},
      "size":{"type":"Text", "value": "M"},
      "price":{"type":"Integer", "value": 1199}
    },
    {
      "id":"urn:ngsi-ld:Product:012", "type":"Product",
      "name":{"type":"Text", "value":"Port"},
      "size":{"type":"Text", "value": "M"},
      "price":{"type":"Integer", "value": 1099}
    }
  ]
}'
```

Batch processing uses the `/v2/op/update` endpoint with a payload with two attributes:

-   `actionType=append` means we will overwrite existing entities if they exist
-   The entities attribute holds an array of entities we wish to create/overwrite.

A subsequent request containing the same data (i.e. same entities and `actionType=append`) won't change the context
state.

## Read Operations

-   The `/v2/entities` endpoint is used for listing entities
-   The `/v2/entities/<entity>` endpoint is used for retrieving the details of a single entity

### Filtering

-   The options parameter (combined with the attrs parameter) can be used to filter the returned fields
-   The q parameter can be used to filter the returned entities

### Read a Data Entity (verbose)

This example reads the full context from an existing **Product** entity with a known `id`.

#### :seven: Request:

```console
curl -X GET \
  --url 'http://localhost:1026/v2/entities/urn:ngsi-ld:Product:010?type=Product' \
  --header 'X-Auth-token: {{X-Auth-token}}'
```

#### Response:

Product `urn:ngsi-ld:Product:010` is "Lemonade" at 99 cents. The response is shown below:

```json
{
    "id": "urn:ngsi-ld:Product:010",
    "type": "Product",
    "name": { "type": "Text", "value": "Lemonade", "metadata": {} },
    "price": { "type": "Integer", "value": 99, "metadata": {} },
    "size": { "type": "Text", "value": "S", "metadata": {} }
}
```

Context data can be retrieved by making a GET request to the `/v2/entities/<entity>` endpoint.

### Read an Attribute from a Data Entity

This example reads the value of a single attribute (`name`) from an existing **Product** entity with a known `id`.

#### :eight: Request:

```console
curl -X GET \
  --url 'http://localhost:1026/v2/entities/urn:ngsi-ld:Product:001/attrs/name/value' \
  --header 'X-Auth-token: {{X-Auth-token}}'
```

#### Response:

Product `urn:ngsi-ld:Product:001` is "Apples" at 99 cents. The response is shown below:

```json
"Apples"
```

Context data can be retrieved by making a GET request to the `/v2/entities/<entity>/attrs/<attribute>/value` endpoint.

### Read a Data Entity (key-value pairs)

This example reads the key-value pairs of two attributes (`name` and `price`) from the context of existing **Product**
entities with a known `id`.

#### :nine: Request:

```console
curl -X GET \
  --url 'http://localhost:1026/v2/entities/urn:ngsi-ld:Product:001?type=Product&options=keyValues&attrs=name,price' \
  --header 'X-Auth-token: {{X-Auth-token}}'
```

#### Response:

Product `urn:ngsi-ld:Product:001` is "Apples" at 99 cents. The response is shown below:

```json
{
    "id": "urn:ngsi-ld:Product:001",
    "type": "Product",
    "name": "Apples",
    "price": 99
}
```

Combine the `options=keyValues` parameter with the `attrs` parameter to retrieve key-value pairs.

### Read Multiple attributes values from a Data Entity

This example reads the value of two attributes (`name` and `price`) from the context of existing **Product** entities
with a known ID.

#### :one::zero: Request:

```console
curl -X GET \
  --url 'http://localhost:1026/v2/entities/urn:ngsi-ld:Product:001?type=Product&options=values&attrs=name,price' \
  --header 'X-Auth-token: {{X-Auth-token}}'
```

#### Response:

Product `urn:ngsi-ld:Product:001` is "Apples" at 99 cents. The response is shown below:

```json
["Apples", 99]
```

Combine the `options=values` parameter and the `attrs` parameter to return a list of values in an array.

### List all Data Entities (verbose)

This example lists the full context of all **Product** entities.

#### :one::one: Request:

```console
curl -X GET \
  --url 'http://localhost:1026/v2/entities?type=Product' \
  --header 'X-Auth-token: {{X-Auth-token}}'
```

### Response:

On start-up the context held nine products, three more have been added by create operations so the full context will now
contain twelve products.

```json
[
    {
        "id": "urn:ngsi-ld:Product:001",
        "type": "Product",
        "name": { "type": "Text", "value": "Apples", "metadata": {} },
        "offerPrice": { "type": "Integer", "value": 89, "metadata": {} },
        "price": { "type": "Integer", "value": 99, "metadata": {} },
        "size": { "type": "Text", "value": "S", "metadata": {} },
        "specialOffer": { "type": "Boolean", "value": true, "metadata": {} }
    },
    {
        "id": "urn:ngsi-ld:Product:002",
        "type": "Product",
        "name": { "type": "Text", "value": "Bananas", "metadata": {} },
        "price": { "type": "Integer", "value": 1099, "metadata": {} },
        "size": { "type": "Text", "value": "M", "metadata": {} }
    },
    {
        "id": "urn:ngsi-ld:Product:003",
        "type": "Product",
        "name": { "type": "Text", "value": "Coconuts", "metadata": {} },
        "price": { "type": "Integer", "value": 1499, "metadata": {} },
        "size": { "type": "Text", "value": "M", "metadata": {} }
    },
    {
        "id": "urn:ngsi-ld:Product:004",
        "type": "Product",
        "name": { "type": "Text", "value": "Melons", "metadata": {} },
        "price": { "type": "Integer", "value": 5000, "metadata": {} },
        "size": { "type": "Text", "value": "XL", "metadata": {} }
    },
    {
        "id": "urn:ngsi-ld:Product:005",
        "type": "Product",
        "name": { "type": "Text", "value": "Kiwi Fruits", "metadata": {} },
        "price": { "type": "Integer", "value": 99, "metadata": {} },
        "size": { "type": "Text", "value": "S", "metadata": {} }
    },
    {
        "id": "urn:ngsi-ld:Product:006",
        "type": "Product",
        "name": { "type": "Text", "value": "Strawberries", "metadata": {} },
        "price": { "type": "Integer", "value": 99, "metadata": {} },
        "size": { "type": "Text", "value": "S", "metadata": {} }
    },
    {
        "id": "urn:ngsi-ld:Product:007",
        "type": "Product",
        "name": { "type": "Text", "value": "Raspberries", "metadata": {} },
        "price": { "type": "Integer", "value": 99, "metadata": {} },
        "size": { "type": "Text", "value": "S", "metadata": {} }
    },
    {
        "id": "urn:ngsi-ld:Product:008",
        "type": "Product",
        "name": { "type": "Text", "value": "Pineapples", "metadata": {} },
        "price": { "type": "Integer", "value": 99, "metadata": {} },
        "size": { "type": "Text", "value": "S", "metadata": {} }
    },
    {
        "id": "urn:ngsi-ld:Product:009",
        "type": "Product",
        "name": { "type": "Text", "value": "Oranges", "metadata": {} },
        "price": { "type": "Integer", "value": 99, "metadata": {} },
        "size": { "type": "Text", "value": "S", "metadata": {} }
    },
    {
        "id": "urn:ngsi-ld:Product:010",
        "type": "Product",
        "name": { "type": "Text", "value": "Lemonade", "metadata": {} },
        "price": { "type": "Integer", "value": 99, "metadata": {} },
        "size": { "type": "Text", "value": "S", "metadata": {} }
    },
    {
        "id": "urn:ngsi-ld:Product:011",
        "type": "Product",
        "name": { "type": "Text", "value": "Brandy", "metadata": {} },
        "price": { "type": "Integer", "value": 1199, "metadata": {} },
        "size": { "type": "Text", "value": "M", "metadata": {} }
    },
    {
        "id": "urn:ngsi-ld:Product:012",
        "type": "Product",
        "name": { "type": "Text", "value": "Port", "metadata": {} },
        "price": { "type": "Integer", "value": 1099, "metadata": {} },
        "size": { "type": "Text", "value": "M", "metadata": {} }
    }
]
```

### List all Data Entities (key-value pairs)

This example lists the `name` and `price` attributes of all **Product** entities.

#### :one::two: Request:

```console
curl -X GET \
  --url 'http://localhost:1026/v2/entities/?type=Product&options=keyValues&attrs=name,price' \
  --header 'X-Auth-token: {{X-Auth-token}}'
```

#### Response:

On start-up the context held nine products, three more have been added by create operations so the full context will now
contain twelve products.

```json
[
    {
        "id": "urn:ngsi-ld:Product:001",
        "type": "Product",
        "name": "Apples",
        "price": 99
    },
    {
        "id": "urn:ngsi-ld:Product:002",
        "type": "Product",
        "name": "Bananas",
        "price": 1099
    },
    {
        "id": "urn:ngsi-ld:Product:003",
        "type": "Product",
        "name": "Coconuts",
        "price": 1499
    },
    {
        "id": "urn:ngsi-ld:Product:004",
        "type": "Product",
        "name": "Melons",
        "price": 5000
    },
    {
        "id": "urn:ngsi-ld:Product:005",
        "type": "Product",
        "name": "Kiwi Fruits",
        "price": 99
    },
    {
        "id": "urn:ngsi-ld:Product:006",
        "type": "Product",
        "name": "Strawberries",
        "price": 99
    },
    {
        "id": "urn:ngsi-ld:Product:007",
        "type": "Product",
        "name": "Raspberries",
        "price": 99
    },
    {
        "id": "urn:ngsi-ld:Product:008",
        "type": "Product",
        "name": "Pineapples",
        "price": 99
    },
    {
        "id": "urn:ngsi-ld:Product:009",
        "type": "Product",
        "name": "Oranges",
        "price": 99
    },
    {
        "id": "urn:ngsi-ld:Product:010",
        "type": "Product",
        "name": "Lemonade",
        "price": 99
    },
    {
        "id": "urn:ngsi-ld:Product:011",
        "type": "Product",
        "name": "Brandy",
        "price": 1199
    },
    {
        "id": "urn:ngsi-ld:Product:012",
        "type": "Product",
        "name": "Port",
        "price": 1099
    }
]
```

Full context data for a specified entity type can be retrieved by making a GET request to the `/v2/entities` endpoint
and supplying the `type` parameter, combine this with the `options=keyValues` parameter and the `attrs` parameter to
retrieve key-values.

### List Data Entity by type

This example lists the `id` and `type` of all **Product** entities.

#### :one::three: Request:

```console
curl -X GET \
  --url 'http://localhost:1026/v2/entities/?type=Product&options=count&attrs=__NONE' \
  --header 'X-Auth-token: {{X-Auth-token}}'
```

#### Response:

On start-up the context held nine products, three more have been added by create operations so the full context will now
contain twelve products.

```json
[
    {
        "id": "urn:ngsi-ld:Product:001",
        "type": "Product"
    },
    {
        "id": "urn:ngsi-ld:Product:002",
        "type": "Product"
    },
    {
        "id": "urn:ngsi-ld:Product:003",
        "type": "Product"
    },
    {
        "id": "urn:ngsi-ld:Product:004",
        "type": "Product"
    },
    {
        "id": "urn:ngsi-ld:Product:005",
        "type": "Product"
    },
    {
        "id": "urn:ngsi-ld:Product:006",
        "type": "Product"
    },
    {
        "id": "urn:ngsi-ld:Product:007",
        "type": "Product"
    },
    {
        "id": "urn:ngsi-ld:Product:008",
        "type": "Product"
    },
    {
        "id": "urn:ngsi-ld:Product:009",
        "type": "Product"
    },
    {
        "id": "urn:ngsi-ld:Product:010",
        "type": "Product"
    },
    {
        "id": "urn:ngsi-ld:Product:011",
        "type": "Product"
    },
    {
        "id": "urn:ngsi-ld:Product:012",
        "type": "Product"
    }
]
```

Context data for a specified entity type can be retrieved by making a GET request to the `/v2/entities` endpoint and
supplying the `type` parameter. Combine this with `options=count` and `attrs=__NONE` to return the `id` attributes of
the given `type`.

> **Note:** The NGSIv2 specification specifies that `attrs=` has to be a "comma-separated list of attribute names whose
> data are to be included in the response". `id` and `type` are not allowed to be used as attribute names. If you
> specify a name that does not exist in attributes, such as `__NONE` to the `attrs=` parameter, No attribute will match
> and you will always retrieve only the `id` and `type` of the entity.

## Update Operations

Overwrite operations are mapped to HTTP PUT. HTTP PATCH can be used to update several attributes at once.

-   The `/v2/entities/<entity>/attrs/<attribute>/value` endpoint is used to update an attribute
-   The `/v2/entities/<entity>/attrs` endpoint is used to update multiple attributes

### Overwrite the value of an Attribute value

This example updates the value of the price attribute of the Entity with `id=urn:ngsi-ld:Product:001`

#### :one::four: Request:

```console
curl -iX PUT \
  --url 'http://localhost:1026/v2/entities/urn:ngsi-ld:Product:001/attrs/price/value' \
  --header 'X-Auth-token: {{X-Auth-token}}' \
  --header 'Content-Type: text/plain' \
  --data 89
```

Existing attribute values can be altered by making a PUT request to the `/v2/entities/<entity>/attrs/<attribute>/value`
endpoint.

### Overwrite Multiple Attributes of a Data Entity

This example simultaneously updates the values of both the price and name attributes of the Entity with
`id=urn:ngsi-ld:Product:001`.

#### :one::five: Request:

```console
curl -iX PATCH \
  --url 'http://localhost:1026/v2/entities/urn:ngsi-ld:Product:001/attrs' \
  --header 'X-Auth-token: {{X-Auth-token}}' \
  --header 'Content-Type: application/json' \
  --data ' {
      "price":{"type":"Integer", "value": 89},
      "name": {"type":"Text", "value": "Ale"}
}'
```

### Batch Overwrite Attributes of Multiple Data Entities

This example uses the convenience batch processing endpoint to update existing products.

#### :one::six: Request:

```console
curl -iX POST \
  --url 'http://localhost:1026/v2/op/update' \
  --header 'X-Auth-token: {{X-Auth-token}}' \
  --header 'Content-Type: application/json' \
  --data '{
  "actionType":"update",
  "entities":[
    {
      "id":"urn:ngsi-ld:Product:001", "type":"Product",
      "price":{"type":"Integer", "value": 1199}
    },
    {
      "id":"urn:ngsi-ld:Product:002", "type":"Product",
      "price":{"type":"Integer", "value": 1199},
      "size": {"type":"Text", "value": "L"}
    }
  ]
}'
```

Batch processing uses the `/v2/op/update` endpoint with a payload with two attributes - `actionType=append` means we
will overwrite existing entities if they exist whereas the `entities` attribute holds an array of entities we wish to
update.

### Batch Create/Overwrite Attributes of Multiple Data Entities

This example uses the convenience batch processing endpoint to update existing products.

#### :one::seven: Request:

```console
curl -iX POST \
  --url 'http://localhost:1026/v2/op/update' \
  --header 'X-Auth-token: {{X-Auth-token}}' \
  --header 'Content-Type: application/json' \
  --data '{
  "actionType":"append",
  "entities":[
    {
      "id":"urn:ngsi-ld:Product:001", "type":"Product",
      "price":{"type":"Integer", "value": 1199}
    },
    {
      "id":"urn:ngsi-ld:Product:002", "type":"Product",
      "price":{"type":"Integer", "value": 1199},
      "specialOffer": {"type":"Boolean", "value":  true}
    }
  ]
}'
```

Batch processing uses the `/v2/op/update` endpoint with a payload with two attributes - `actionType=append` means we
will overwrite existing entities if they exist whereas the `entities` attribute holds an array of entities we wish to
update.

### Batch Replace Entity Data

This example uses the convenience batch processing endpoint to replace entity data of existing products.

#### :one::eight: Request:

```console
curl -iX POST \
  --url 'http://localhost:1026/v2/op/update' \
  --header 'X-Auth-token: {{X-Auth-token}}' \
  --header 'Content-Type: application/json' \
  --data '{
  "actionType":"replace",
  "entities":[
    {
      "id":"urn:ngsi-ld:Product:010", "type":"Product",
      "price":{"type":"Integer", "value": 1199}
    }
  ]
}'
```

Batch processing uses the `/v2/op/update` endpoint with a payload with two attributes - `actionType=replace` means we
will overwrite existing entities if they exist whereas the `entities` attribute holds an array of entities whose data we
wish to replace.

## Delete Operations

Delete Operations map to HTTP DELETE.

-   The `/v2/entities/<entity>` endpoint can be used to delete an entity
-   The `/v2/entities/<entity>/attrs/<attribute>` endpoint can be used to delete an attribute

The response will be **204 - No Content** if the operation is successful or **404 - Not Found** if the operation fails.

### Data Relationships

If there are entities within the context which relate to one another, you must be careful when deleting an entity. You
will need to check that no references are left dangling once the entity has been deleted.

Organizing a cascade of deletions is beyond the scope of this tutorial, but it would be possible using a batch delete
request.

### Delete an Entity

This example deletes the entity with `id=urn:ngsi-ld:Product:001` from the context.

#### :one::nine: Request:

```console
curl -iX DELETE \
  --url 'http://localhost:1026/v2/entities/urn:ngsi-ld:Product:010' \
  --header 'X-Auth-token: {{X-Auth-token}}'
```

Entities can be deleted by making a DELETE request to the `/v2/entities/<entity>` endpoint.

Subsequent requests using the same `id` will result in an error response since the entity no longer exists in the
context.

### Delete an Attribute from an Entity

This example removes the `specialOffer` attribute from the entity with `id=urn:ngsi-ld:Product:001`.

#### :two::zero: Request:

```console
curl -iX DELETE \
  --url 'http://localhost:1026/v2/entities/urn:ngsi-ld:Product:001/attrs/specialOffer' \
  --header 'X-Auth-token: {{X-Auth-token}}'
```

Attributes can be deleted by making a DELETE request to the `/v2/entities/<entity>/attrs/<attribute>` endpoint.

If the attribute does not exist in the context, the result will be an error response.

### Batch Delete Multiple Entities

This example uses the convenience batch processing endpoint to delete some **Product** entities.

#### :two::one: Request:

```console
curl -iX POST \
  --url 'http://localhost:1026/v2/op/update' \
  --header 'X-Auth-token: {{X-Auth-token}}' \
  --header 'Content-Type: application/json' \
  --data '{
  "actionType":"delete",
  "entities":[
    {
      "id":"urn:ngsi-ld:Product:001", "type":"Product"
    },
    {
      "id":"urn:ngsi-ld:Product:002", "type":"Product"
    }
  ]
}'
```

Batch processing uses the `/v2/op/update` endpoint with a payload with two attributes - `actionType=delete` means we
will delete something from the context and the `entities` attribute holds the `id` of the entities we wish to delete.

If an entity does not exist in the context, the result will be an error response.

### Batch Delete Multiple Attributes from an Entity

This example uses the convenience batch processing endpoint to delete some attributes from a **Product** entity.

#### :two::two: Request:

```console
curl -iX POST \
  --url 'http://localhost:1026/v2/op/update' \
  --header 'X-Auth-token: {{X-Auth-token}}' \
  --header 'Content-Type: application/json' \
  --data '{
  "actionType":"delete",
  "entities":[
    {
      "id":"urn:ngsi-ld:Product:003", "type":"Product",
      "price":{},
      "name": {}
    }
  ]
}'
```

Batch processing uses the `/v2/op/update` endpoint with a payload with two attributes - `actionType=delete` means we
will delete something from the context and the `entities` attribute holds an array of attributes we wish to delete.

If any attribute does not exist in the context, the result will be an error response.

### Find existing data relationships

This example returns the key of all entities directly associated with the `urn:ngsi-ld:Product:001`.

#### :two::three: Request:

```console
curl -X GET \
  --url 'http://localhost:1026/v2/entities/?q=refProduct==urn:ngsi-ld:Product:001&options=count&attrs=type' \
  --header 'X-Auth-token: {{X-Auth-token}}'
```

#### Response:

```json
[
    {
        "id": "urn:ngsi-ld:InventoryItem:001",
        "type": "InventoryItem"
    }
]
```

-   If this request returns an empty array, the entity has no associates - it can be safely deleted
-   If the response lists a series of **InventoryItem** entities they should be deleted before the associated
    **Product** entity is removed from the context.

Note that we deleted **Product** `urn:ngsi-ld:Product:001` earlier, so what we see above is actually a dangling
reference, i.e. the returned **InventoryItem** references a **Product** that no longer exists.

It is worth noting that the ICT Platforms supports also subscriptions and is provided with a Node-RED IoT Agent.
Their usage is considered an advanced usage, which will be integrated in case of needs to the current documentation, e.g., as part of D5.8.

---

## License

The ICT Platform license derives from its underlying technologies.
In particular, FIWARE, for all the examples and starting point repositories.

[MIT](LICENSE) © 2018-2020 FIWARE Foundation e.V.

The rest of the code has been developed by [Engineering](www.eng.it), in the framework of the [HYPERRIDE](https://hyperride.eu) 
EU co-funded project, grant n. 957788.
