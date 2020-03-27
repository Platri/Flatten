<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo_text.svg" width="320" alt="Nest Logo" /></a>
</p>

[travis-image]: https://api.travis-ci.org/nestjs/nest.svg?branch=master
[travis-url]: https://travis-ci.org/nestjs/nest
[linux-image]: https://img.shields.io/travis/nestjs/nest/master.svg?label=linux
[linux-url]: https://travis-ci.org/nestjs/nest
  
  <p align="center">A progressive <a href="http://nodejs.org" target="blank">Node.js</a> framework for building efficient and scalable server-side applications, heavily inspired by <a href="https://angular.io" target="blank">Angular</a>.</p>
    <p align="center">
<a href="https://www.npmjs.com/~nestjscore"><img src="https://img.shields.io/npm/v/@nestjs/core.svg" alt="NPM Version" /></a>
<a href="https://www.npmjs.com/~nestjscore"><img src="https://img.shields.io/npm/l/@nestjs/core.svg" alt="Package License" /></a>
<a href="https://www.npmjs.com/~nestjscore"><img src="https://img.shields.io/npm/dm/@nestjs/core.svg" alt="NPM Downloads" /></a>
<a href="https://travis-ci.org/nestjs/nest"><img src="https://api.travis-ci.org/nestjs/nest.svg?branch=master" alt="Travis" /></a>
<a href="https://travis-ci.org/nestjs/nest"><img src="https://img.shields.io/travis/nestjs/nest/master.svg?label=linux" alt="Linux" /></a>
<a href="https://coveralls.io/github/nestjs/nest?branch=master"><img src="https://coveralls.io/repos/github/nestjs/nest/badge.svg?branch=master#5" alt="Coverage" /></a>
<a href="https://gitter.im/nestjs/nestjs?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=body_badge"><img src="https://badges.gitter.im/nestjs/nestjs.svg" alt="Gitter" /></a>
<a href="https://opencollective.com/nest#backer"><img src="https://opencollective.com/nest/backers/badge.svg" alt="Backers on Open Collective" /></a>
<a href="https://opencollective.com/nest#sponsor"><img src="https://opencollective.com/nest/sponsors/badge.svg" alt="Sponsors on Open Collective" /></a>
  <a href="https://paypal.me/kamilmysliwiec"><img src="https://img.shields.io/badge/Donate-PayPal-dc3d53.svg"/></a>
  <a href="https://twitter.com/nestframework"><img src="https://img.shields.io/twitter/follow/nestframework.svg?style=social&label=Follow"></a>
</p>
  <!--[![Backers on Open Collective](https://opencollective.com/nest/backers/badge.svg)](https://opencollective.com/nest#backer)
  [![Sponsors on Open Collective](https://opencollective.com/nest/sponsors/badge.svg)](https://opencollective.com/nest#sponsor)-->

## Description

[Nest](https://github.com/nestjs/nest) framework TypeScript starter repository.

## Installation

```bash
$ npm install
```

## Start local mysql
Starts local mysql and adminer container. You can connect http://localhost:8080 to adminer. Then you can login with username: user, password: password to flatten-db.

```bash
$ docker-compose -f docker/mysql-local.yml up -d
```

## MySQL db migration script
Ormconfig is stored in .env file.

```bash
# create migration
$ yarn typeorm:migration:generate -- ${migration script name}

# run migration
$ yarn typeorm:migration:run
```

## Running the app

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```

## Routes TODO

### Create a new virtual hanshake

This route will create a new handshake.

```http request
POST /handshake/new/
```

**Parameter**

**Header:**

| Attribute        | Type   | Required | Value                             | Description               |
|------------------|--------|----------|-----------------------------------|---------------------------|
| `Content-Type`   | string | yes      | application/x-www-form-urlencoded | Content-Type for raw data |
| `x-access-token` | string | yes      |                                   | JWT Access Token          |

**Body** 

| Attribute         | Type   | Required | Length | Description                                    |
|-------------------|--------|----------|--------|------------------------------------------------|
| `user_id`         | string | yes      |        | The id of the user                             |
| `qr_code_id`      | string | yes      |        | The id of the scanned code                     |
| `date`            | string | yes      |        | The id of the user which uploads the video     |
| `latitude`        | string | no       |        | The latitude of the handshake location         |
| `longitude`       | string | no       |        | The longitude of the handshake location        |
| `name`            | string | yes?     |        | The name of the handshaked 'thing'             |

**Response:**

```JSON
{ 
    "status": "success",
    "message": "Handshake has been uploaded successfully with id: ",
    "data": [
        {
            "created_at": "2020-03-17T12:07:41.000Z",
            "id": "test1",
        }
    ],
    "code": 201,
}
```

### Get all user handshakes

This route will get all user handshakes.

```http request
GET /handshake/all/:id
```

**Parameter**

| Attribute        | Type   | Required | Length | Description               |
|------------------|--------|----------|--------|---------------------------|
| `:id`            | int    | yes      |        | User id                   |

**Header:**

| Attribute        | Type   | Required | Value                             | Description               |
|------------------|--------|----------|-----------------------------------|---------------------------|
| `Content-Type`   | string | yes      | application/x-www-form-urlencoded | Content-Type for raw data |
| `x-access-token` | string | yes      |                                   | JWT Access Token          |

**Body** 

| Attribute         | Type   | Required | Length | Description                                       |
|-------------------|--------|----------|--------|---------------------------------------------------|
| `startDate`       | string | yes      |        | The start date of the handshake date range in UTC |
| `endDate`         | string | yes      |        | The end date of the handshake date range in UTC   |

**Response:**

```JSON
{ 
    "status": "success",
    "message": "",
    "data": [
        {
            "id": "user_id in uuid4",
            "date": "2020-03-17T12:07:41.000Z in UTC",
            "handshake_id": "handshake id in uuid4",
            "name": "Jonas",
        },
         {
            "id": "user_id in uuid4",
            "date": "2020-03-23T12:07:41.000Z in UTC",
            "handshake_id": "handshake id in uuid4",
            "name": "Jim",
        },
    ],
    "code": 200,
}
```

***

## Support

Nest is an MIT-licensed open source project. It can grow thanks to the sponsors and support by the amazing backers. If you'd like to join them, please [read more here](https://docs.nestjs.com/support).

## Stay in touch

- Author - [Kamil Myśliwiec](https://kamilmysliwiec.com)
- Website - [https://nestjs.com](https://nestjs.com/)
- Twitter - [@nestframework](https://twitter.com/nestframework)

## License

  Nest is [MIT licensed](LICENSE).
