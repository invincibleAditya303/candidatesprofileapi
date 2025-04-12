Created an `index.js` file and connected `users_databse` with a table `user_info`

**user_info Table**

| Column     | Type    |
| --------   | ------- |
| id         | SERIAL  |
| name       | TEXT    |
| phone      | TEXT    |
| email      | TEXT    |
| gender     | TEXT    |
| experience | INTEGER |
| skills     | TEXT    |

### API 1

#### Path: `/register/`

#### Method: `POST`

**Request**

    ```
    {
        "id": 2,
        "name": "Aditya",
        "phone": "9905761423",
        "email": "aditya123@example.com",
        "gender": "Male",
        "experience": 1,
        "skills": "Python"
      }
    ```

- **Scenario 1**

  - **Description**:

    If the username already exists

  - **Response**
    - **Status code**
      ```
      400
      ```
    - **Body**
      ```
      User already exists
      ```

- **Scenario 2**

  - **Description**:

    Successful registration of the registrant

  - **Response**

    - **Status code**

      ```
      200
      ```

    - **Body**
      ```
      User created successfully
      ```

### API 2

#### Method: `GET`

 **Sample API**
    ```
    /?page=&gender=&skills=&experience=
    ```
  - **Description**:

    Returns a list of all candidates of the page, gender,skills and experience. If not specified 
    returns list of all candidates of the page, default page being 1

  - **Response**

    ```
    [
      {
        "id": 2,
        "name": "Aditya",
        "phone": "9905761423",
        "email": "aditya123@example.com",
        "gender": "Male",
        "experience": 1,
        "skills": "Python"
      },
      ...
    ]
    ```

    Use `npm install` to install the packages

    packages used: {
        pg- postgresql database
        express- to perform CRUD operations and define Routes
        dotenv- for configuration
        nodemon- to start the server and updates automtically the ssaved changes
    }