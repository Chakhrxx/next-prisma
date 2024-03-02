# Project Setup

This project consists of three services:

1. Next.js App (nextjs) - the main application built using Next.js framework. It connects to the PostgreSQL database to fetch and save data.
2. PostgreSQL Database (postgres) - the database service used by the Next.js app. It stores the data required for the application.
3. PGAdmin (pgadmin) - a web-based administration tool for PostgreSQL databases. It is used to manage the PostgreSQL database in this project.

# Get Started

To set up the project, follow these steps:

1. Clone this repository to your local machine.

```bash
git clone https://github.com/Chakhrxx/next-prisma.git
```

2. Navigate to the project directory in your terminal.

```bash
cd next-prisma
```

3. Run docker-compose up to start the services.

```bash
docker-compose up -d
```

4. Access the Next.js app at http://localhost:3000.
5. Access PGAdmin at http://localhost:5050.

   The default login credentials are

   ```env
   PGADMIN_DEFAULT_EMAIL: admin@admin.com
   PGADMIN_DEFAULT_PASSWORD: root
   ```

   ![Login PGAdmin](https://raw.githubusercontent.com/Chakhrxx/next-prisma/main/app/images/loginPGAdmin.png)
   Add New Sever
   ![addNewServer PGAdmin](https://raw.githubusercontent.com/Chakhrxx/next-prisma/main/app/images/addNewServer.png)
   The General credentials is

   ```env
   Name: test
   ```

   ![generalInfo PGAdmin](https://raw.githubusercontent.com/Chakhrxx/next-prisma/main/app/images/generalInfo.png)
   The Connection credentials are

   ```env
   Host name: postgres
   Username : myuser
   Password : mypassword
   ```

   ![connectionInfo PGAdmin](https://raw.githubusercontent.com/Chakhrxx/next-prisma/main/app/images/connectionInfo.png)

# Environment Variables

The following environment variables are used in this project:
| Service | Variable | Description |
| ------ | ------ | ------ |
| Next.js App | `PGHOST` | The hostname of the PostgreSQL database |
| Next.js App | `PGPORT` | The port number of the PostgreSQL database |
| Next.js App | `PGUSER` | The username for the PostgreSQL database |
| Next.js App | `PGPASSWORD` | The password for the PostgreSQL database |
| Next.js App | `PGDATABASE` | The name of the PostgreSQL database |
| PostgreSQL | `POSTGRES_USER` | The username for the PostgreSQL database |
| PostgreSQL | `POSTGRES_PASSWORD` | The password for the PostgreSQL database |
| PostgreSQL | `POSTGRES_DB` | The name of the PostgreSQL database |
| PGAdmin | `PGADMIN_DEFAULT_EMAIL` | The default email for PGAdmin login |
| PGAdmin | `PGADMIN_DEFAULT_PASSWORD` | The default password for PGAdmin login |

Note: The environment variables for the PostgreSQL and PGAdmin services are set in the `docker-compose.yml` file. The environment variables for the Next.js app are set in the Dockerfile.

# Dependencies

This project requires Docker and Docker Compose to run. Make sure you have them installed on your machine before running the project.

```

```
