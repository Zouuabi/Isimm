
# ISIMM

## Description

This project is a backend application that provides users with the ability to register and login users  ,select students and teachers by ID, retrieve the user's current studying classes, get the classes taught by a teacher, get each class's students, retrieve the classes' schedule, and .

## Getting Started

### Dependencies
- dart_frog
- MySQL

### Usage
1-Select a teacher by ID
```curl -X GET http://localhost:8000/api/v1/teacher/[id]```

2-Retrieve the classes taught by a teacher
```curl -X GET http://localhost:8000/api/v1/teacher/[id]/classes```

3-Retrieve class's students 
```curl -X GET http://localhost:8000/api/v1/teacher/[id]/classes/[classeId]```

3-1-Select a student by ID
```curl -X GET http://localhost:8000/api/v1/student/[id]```

4-Retrieve the user’s current studying courses
```curl -X GET http://localhost:8000/api/v1/student/[id]/courses```


### Installing

1. Clone the repo
   ```sh
   git clone https://github.com/your_username_/Project-Name.git

