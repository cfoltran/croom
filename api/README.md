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
    age: "14"
    email: "test@test.com"
    password: "test"
    username: "test"
  })
  {
    user_id
  }
}
```