# Yuza API Endpoints

All requests should have a the following headers:
 - Content-Type: application/json

### POST /users

#### URL

/users

#### Request

```json
{
  "username": "greg",
  "email": "pr1sm.g@gmail.com",
  "password": "supersecure"
}
```

#### Response

```json
201 Created
{
  "user": {
    "id": 1,
    "username": "greg",
    "email": "greg@example.com"
  }
}
```

### GET /users

#### URL

/users

#### Response

```json
200 OK
{
  "users": [
    {
      "id": 1,
      "username": "greg",
      "email": "greg@example.com"
    },
    {
      "id": 2,
      "username": "sam",
      "email": "sam@example.com"
    }
  ]
}
```

### GET /users/:id

#### URL

/users/2

#### Response

```json
200 OK
{
  "id": 1,
  "username": "greg",
  "email": "greg@example.com"
}
```

### PATCH /users/:id

#### URL

/users/2

#### Request

```json
{
  "username": "Greg"
}
```

#### Response

```json
200 OK
{
  "id": 1,
  "username": "greg",
  "email": "greg@example.com"
}
```

### DELETE /users/:id

Deleting users requires authentication.
When deleting any user pass the following header:

`secretkey: 'supersecret'`


#### URL

/users/2

#### Response

```json
204 No Content
```
