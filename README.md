
# ISIMM

## Introduction

ISIMM is a backend application that provides a RESTful API for a university mobile app. The API allows users to perform various tasks related to their academic life, such as:

- Register and login with their credentials
- Select students and teachers by ID
- Retrieve the user's current studying classes
- Get the classes taught by a teacher
- Get each class's students
- Retrieve the classes' schedule
- And more

The API is built using dart_frog, a fast, minimalistic backend framework for Dart, and MySQL, a popular relational database management system. The API follows the JSON format for data exchange, and supports CRUD (create, read, update, delete) operations on the database.

The target audience and users of this project are university students, teachers, and administrators who want to access and manage their academic information and activities through a mobile app.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Testing](#testing)
- [Deployment](#deployment)
- [License](#license)
- [Contribution](#contribution)
- [Reference](#reference)
- [Contact](#contact)

## Prerequisites

To run this project, you need to have the following software and hardware installed on your machine:

- Dart SDK: The software development kit for the Dart programming language. You can download it from [here](^1^).
- dart_frog: The backend framework for Dart that provides routing, middleware, and error handling features. You can install it using the following command:

```
dart pub global activate dart_frog
```

- MySQL: The relational database management system that stores and manages the data for the API. You can download it from [here](^2^).
- MySQL Workbench: The graphical user interface tool that allows you to create and manipulate the database schema and data. You can download it from [here](^3^).
- Postman: The API development platform that allows you to test and debug the API endpoints and responses. You can download it from [here](^4^).

To configure the project, you need to do the following steps:

- Clone the repo using the following command:

```
git clone https://github.com/your_username_/Project-Name.git
```

- Create a .env file in the root directory of the project, and add the following variables:

```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=isimm
PORT=8000
```

- Create a database named isimm in MySQL Workbench, and run the SQL script in the /db directory to create the tables and insert some sample data.
- Start the dart_frog server using the following command:

```
dart run bin/main.dart
```

## Usage

To use the API, you need to send HTTP requests to the following endpoints, using Postman or any other tool of your choice. The API supports GET, POST, PUT, and DELETE methods, and returns JSON responses. Here are some examples of the endpoints and their usage:

- Register a user

```
POST http://localhost:8000/api/v1/register
```

Request body:

```
{
  "username": "alice",
  "password": "123456",
  "role": "student"
}
```

Response:

```
{
  "message": "User registered successfully",
  "user": {
    "id": 1,
    "username": "alice",
    "role": "student"
  }
}
```

- Login a user

```
POST http://localhost:8000/api/v1/login
```

Request body:

```
{
  "username": "alice",
  "password": "123456"
}
```

Response:

```
{
  "message": "User logged in successfully",
  "user": {
    "id": 1,
    "username": "alice",
    "role": "student"
  },
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhbGljZSIsInJvbGUiOiJzdHVkZW50IiwiaWF0IjoxNjM4NjY3MjQ1LCJleHAiOjE2Mzg2NzA4NDV9.0w8xq7yf9Zy2Y1L4yZ2X0r7q7ZnZy3Q0Zm0s0f0f0f0"
}
```

- Select a teacher by ID

```
GET http://localhost:8000/api/v1/teacher/2
```

Response:

```
{
  "message": "Teacher found",
  "teacher": {
    "id": 2,
    "name": "Bob",
    "email": "bob@isimm.com",
    "phone": "1234567890"
  }
}
```

- Retrieve the classes taught by a teacher

```
GET http://localhost:8000/api/v1/teacher/2/classes
```

Response:

```
{
  "message": "Classes found",
  "classes": [
    {
      "id": 1,
      "name": "Math",
      "code": "MATH101",
      "credits": 3
    },
    {
      "id": 2,
      "name": "Physics",
      "code": "PHYS102",
      "credits": 4
    }
  ]
}
```

- Retrieve class's students

```
GET http://localhost:8000/api/v1/teacher/2/classes/1
```

Response:

```
{
  "message": "Students found",
  "students": [
    {
      "id": 1,
      "name": "Alice",
      "email": "alice@isimm.com",
      "phone": "0987654321"
    },
    {
      "id": 3,
      "name": "Charlie",
      "email": "charlie@isimm.com",
      "phone": "4567891230"
    }
  ]
}
```

- Select a student by ID

```
GET http://localhost:8000/api/v1/student/1
```

Response:

```
{
  "message": "Student found",
  "student": {
    "id": 1,
    "name": "Alice",
    "email": "alice@isimm.com",
    "phone": "0987654321"
  }
}
```

- Retrieve the user’s current studying courses

```
GET http://localhost:8000/api/v1/student/1/courses
```

Response:

```
{
  "message": "Courses found",
  "courses": [
    {
      "id": 1,
      "name": "Math",
      "code": "MATH101",
      "credits": 3,
      "teacher": {
        "id": 2,
        "name": "Bob",
        "email": "bob@isimm.com",
        "phone": "1234567890"
      }
    },
    {
      "id": 3,
      "name": "Computer Science",
      "code": "CS103",
      "credits": 4,
      "teacher": {
        "id": 4,
        "name": "David",
        "email": "david@isimm.com",
        "phone": "7891234560"
      }
    }
  ]
}
```

## Testing

To test the project, you can use the following tools and methods:

- dart test: The built-in testing framework for Dart that allows you to write and run unit, integration, and end-to-end tests. You can install it using the following command:

```
dart pub global activate test
```

You can write your test cases in the /test directory, using the test and expect functions. You can run your tests using the following

Source: Conversation with Bing, 1/16/2024
(1) Poison dart frog - Wikipedia. https://en.wikipedia.org/wiki/Poison_dart_frog.
(2) GitHub - VeryGoodOpenSource/dart_frog: A fast, minimalistic backend .... https://github.com/VeryGoodOpenSource/dart_frog.
(3) Poison Dart Frogs | National Geographic. https://www.nationalgeographic.com/animals/amphibians/facts/poison-dart-frogs-1.
(4) MySQL. https://www.mysql.com/.
(5) MySQL :: Download MySQL Community Server. https://dev.mysql.com/downloads/mysql/.
(6) MySQL :: Download MySQL Installer. https://dev.mysql.com/downloads/installer/.
(7) undefined. https://dartfrog.vgv.dev.
