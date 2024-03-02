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
   HostName: postgres
   Username : myuser
   Password : mypassword
   ```

   ![connectionInfo PGAdmin](https://raw.githubusercontent.com/Chakhrxx/next-prisma/main/app/images/connectionInfo.png)

6. Query Script in PGAdmin
   ![queryTool PGAdmin](https://raw.githubusercontent.com/Chakhrxx/next-prisma/main/app/images/queryTool.png)
   ![queryScript PGAdmin](https://raw.githubusercontent.com/Chakhrxx/next-prisma/main/app/images/queryScript.png)
   Insert script in query

   ```sql

   -- Table: public.Category

   -- DROP TABLE IF EXISTS public."Category";

   CREATE TABLE IF NOT EXISTS public."Category"
   (
   id text COLLATE pg_catalog."default" NOT NULL,
   name text COLLATE pg_catalog."default" NOT NULL,
   CONSTRAINT "Category_pkey" PRIMARY KEY (id)
   )

   TABLESPACE pg_default;

   ALTER TABLE IF EXISTS public."Category"
   OWNER to myuser;
   -- Index: Category_id_key

   -- DROP INDEX IF EXISTS public."Category_id_key";

   CREATE UNIQUE INDEX IF NOT EXISTS "Category_id_key"
   ON public."Category" USING btree
   (id COLLATE pg_catalog."default" ASC NULLS LAST)
   TABLESPACE pg_default;
   -- Index: Category_name_key

   -- DROP INDEX IF EXISTS public."Category_name_key";

   CREATE UNIQUE INDEX IF NOT EXISTS "Category_name_key"
   ON public."Category" USING btree
   (name COLLATE pg_catalog."default" ASC NULLS LAST)
   TABLESPACE pg_default;
         -- Table: public.Post

   -- DROP TABLE IF EXISTS public."Post";

   CREATE TABLE IF NOT EXISTS public."Post"
   (
   id text COLLATE pg_catalog."default" NOT NULL,
   title text COLLATE pg_catalog."default" NOT NULL,
   content text COLLATE pg_catalog."default",
   "categoryId" text COLLATE pg_catalog."default" NOT NULL,
   "createdAt" timestamp(3) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
   CONSTRAINT "Post_pkey" PRIMARY KEY (id),
   CONSTRAINT "Post_categoryId_fkey" FOREIGN KEY ("categoryId")
         REFERENCES public."Category" (id) MATCH SIMPLE
         ON UPDATE CASCADE
         ON DELETE RESTRICT
   )

   TABLESPACE pg_default;

   ALTER TABLE IF EXISTS public."Post"
   OWNER to myuser;
   -- Index: Post_id_key

   -- DROP INDEX IF EXISTS public."Post_id_key";

   CREATE UNIQUE INDEX IF NOT EXISTS "Post_id_key"
   ON public."Post" USING btree
   (id COLLATE pg_catalog."default" ASC NULLS LAST)
   TABLESPACE pg_default;

   -- Table: public._prisma_migrations

   -- DROP TABLE IF EXISTS public._prisma_migrations;

   CREATE TABLE IF NOT EXISTS public._prisma_migrations
   (
   id character varying(36) COLLATE pg_catalog."default" NOT NULL,
   checksum character varying(64) COLLATE pg_catalog."default" NOT NULL,
   finished_at timestamp with time zone,
   migration_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
   logs text COLLATE pg_catalog."default",
   rolled_back_at timestamp with time zone,
   started_at timestamp with time zone NOT NULL DEFAULT now(),
   applied_steps_count integer NOT NULL DEFAULT 0,
   CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id)
   )

   TABLESPACE pg_default;

   ALTER TABLE IF EXISTS public._prisma_migrations
   OWNER to myuser;
   INSERT INTO public."Category"(
         id, name)
         VALUES ('f1718831-f845-49dc-a17c-32851d3c53ca', 'Languages'),('818ed8a8-7e24-4e38-8532-ff16bb30a372', 'Tools');

   INSERT INTO public."Post"(
         id, title, content, "categoryId")
         VALUES ('12221ee3-284b-41c5-b724-87f3e044f93f', 'javascript', 'JavaScript is a scripting language that enables you to create dynamically updating content', 'f1718831-f845-49dc-a17c-32851d3c53ca'),
               ('be5f56f0-e344-47ee-af42-d37b46cb3823','Prisma','Build data-driven applications — with a great DX. Prisma provides the best experience for your team to work and interact with databases','818ed8a8-7e24-4e38-8532-ff16bb30a372');

   ```

![runScript PGAdmin](https://raw.githubusercontent.com/Chakhrxx/next-prisma/main/app/images/runScript.png)

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

# Project Screenshot

![Screenshot PGAdmin](https://raw.githubusercontent.com/Chakhrxx/next-prisma/main/app/images/screenshot.png)
