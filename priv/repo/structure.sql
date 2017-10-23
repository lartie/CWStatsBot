--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: quests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE quests (
    id integer NOT NULL,
    completed_at timestamp without time zone NOT NULL,
    message text,
    type character varying(255),
    from_id integer,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    exp integer,
    gold integer,
    loot jsonb[]
);


--
-- Name: quests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE quests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE quests_id_seq OWNED BY quests.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp without time zone
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    class character varying(255),
    lvl integer
);


--
-- Name: quests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY quests ALTER COLUMN id SET DEFAULT nextval('quests_id_seq'::regclass);


--
-- Name: quests quests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY quests
    ADD CONSTRAINT quests_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: unique_quest_message_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_quest_message_index ON quests USING btree (completed_at, from_id);


--
-- Name: quests quests_from_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY quests
    ADD CONSTRAINT quests_from_id_fkey FOREIGN KEY (from_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

INSERT INTO "schema_migrations" (version) VALUES (20170616091224), (20170616093425), (20170616150238), (20170616195324), (20170616224957), (20170617092635);

