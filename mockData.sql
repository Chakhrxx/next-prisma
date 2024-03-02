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