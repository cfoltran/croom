## croom-api


Run db:
```
docker-compose up -d
```

Run migrations:
```
npm run migrate:reset
```

Run api:
```
npm run dev
```

Generate prisma client and nexus types:
```
npm run generate
```

Access to graphql playground:
```
http://localhost:3000/altair
```

Exemple of mutation:
```graphql
mutation signupUser{
  signupUser(data: {
    birthdate: "1995-12-03T10:15:30Z"
    email: "test@test.com"
    firstname: "test"
    password: "test"
    lastname: "test"
    username: "test"
  })
  {
    user_id
  }
}
```