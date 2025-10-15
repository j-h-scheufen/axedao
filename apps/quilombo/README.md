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
The "gis" schema also needs to be added to the DB user's role with which wer're connecting:

```shell
ALTER ROLE postgres SET search_path TO "\$user", public, extensions, gis
```

IMPORTANT: there are a number of migration files that were manually generated, e.g. to add functions and triggers (things Drizzle does not generate). As a reminder for the procedure:

1. create a new numbered migration file with the DB changes
2.1. run `npx drizzle-kit push` (to manually add the missing migration) or 
2.2. add a new entry to the _journal.json and run `npx drizzle-kit migrate`

## Safety Hooks for Claude Code

This project uses a bash safety hook to prevent accidental execution of dangerous commands by Claude Code. The hook blocks:

- **Database operations**: `drizzle-kit migrate`, `drizzle-kit push`, `prisma migrate`, `prisma db push`, and direct SQL execution
- **Package publishing**: `npm publish`, `yarn publish`, `pnpm publish`
- **Force operations**: `git push --force`, `git push -f`
- **Production deployments**: `vercel --prod`, `netlify deploy --prod`, `firebase deploy`
- **Destructive operations**: `kubectl delete`, `docker-compose down`, `rm -rf` on critical paths

The hook is context-aware and allows safe operations like:
- Writing documentation that mentions these commands (e.g., `echo "Run drizzle-kit migrate"`)
- Creating code examples or configuration files
- Using heredocs or string literals

The hook **only blocks** when these commands are actually being executed. This protects against accidental database migrations, production deployments, or package publishing without manual review.

Hook location: `~/.claude/hooks/bash-safety-check.sh`  
Configuration: `~/.claude/settings.json`

For more details, see `~/.claude/hooks/README.md`