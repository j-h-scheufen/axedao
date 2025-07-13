# Quilombo

## Technologies Used

- [Next.js 14](https://nextjs.org/docs/getting-started)
- [NextUI v2](https://nextui.org/)
- [Tailwind CSS](https://tailwindcss.com/)
- [TypeScript](https://www.typescriptlang.org/)

## Data Fetching and State Management

This app uses a very opinionated approach to data fetching and state management:

- records that are the result of react-query fetches are sent from the server to hydrate the QueryClient
- The records are available for SSR in the page to have initial content to render AS WELL AS via react hooks without the need for additional API calls
- This is achieved by pre-populating the queries (as mentioned above) and using Jotai atoms that use the queries to fetch their state.
- This way, any client component that requires the record accesses atoms which result in a query for which the result is already available client-side
- Updates to a record via react-query update the query cache accordingly, so that the atoms always automatically represent the latest cached server state until the queries go stale.

## API Overview

| Method | Path (api/)                         | Request Body                        | Response        | Details      |
| ------ | ----------------------------------- | ----------------------------------- | --------------- | ------------ |
| GET    | groups/                             |                                     | Groups[]        | Group Search |
| POST   | groups/                             | CreateNewGroupForm                  | Group           |              |
| GET    | groups/[groupId]                    |                                     | Group           |              |
| PATCH  | groups/[groupId]                    | UpdateGroupForm                     | Group           |              |
| DELETE | groups/[groupId]                    |                                     | null, 204       |              |
| GET    | groups/[groupId]/members            |                                     | User[]          |              |
| DELETE | groups/[groupId]/members/[userId]   |                                     | User[]          |              |
| GET    | groups/[groupId]/admins             |                                     | string[]        |              |
| PUT    | groups/[groupId]/admins/[userId]    |                                     | string[]        |              |
| DELETE | groups/[groupId]/admins/[userId]    |                                     | string[]        |              |
| GET    | users/                              |                                     | User[]          | User Search  |
| GET    | users/[userId]                      |                                     | User            |              |
| GET    | profile                             |                                     | User            |              |
| PATCH  | profile                             | ProfileForm                         | User            |              |
| PUT    | profile/group/[groupId]             |                                     | User            |              |
| DELETE | profile/group/[groupId]             |                                     | User            |              |
| POST   | images/                             | FormData {file: File, name: string} | { url: string } |              |
| GET    | location/countries                  |                                     | Country[]       |              |
| GET    | location/cities                     | URL params: countryCode, searchTerm | City[]          |              |
| PUT    | admin/groups/[groupId]/verification |                                     | Group           |              |
| DELETE | admin/groups/[groupId]/verification |                                     | Group           |              |

## Local Development

# DB

```shell
docker pull postgres
docker run --name drizzle-postgres -e POSTGRES_PASSWORD=mypassword -d -p 5432:5432 postgres
```

Set the ENV variable `DATABASE_URL` to `postgres://postgres:mypassword@localhost:5432/postgres`


IMPORTANT: For the postgres / postgis geolocation features, the "postgis" exension must be added to the DB which is done on a particular schema.
To keep things clean, we've added it to the "gis" schema. However, for DB migrations to work, this schema needs to be added to the `search_path`.
The quickest way to do that is to append it as a parameter to the DATABASE_URL like so: `?options=-csearch_path%3D%24user,public,extensions,gis`