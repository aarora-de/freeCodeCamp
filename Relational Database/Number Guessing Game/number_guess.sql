--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    number integer NOT NULL,
    num_guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 136, 3);
INSERT INTO public.games VALUES (2, 1, 497, 5);
INSERT INTO public.games VALUES (3, 4, 360, 361);
INSERT INTO public.games VALUES (4, 4, 151, 152);
INSERT INTO public.games VALUES (5, 5, 989, 990);
INSERT INTO public.games VALUES (6, 5, 44, 45);
INSERT INTO public.games VALUES (7, 4, 291, 294);
INSERT INTO public.games VALUES (8, 4, 870, 872);
INSERT INTO public.games VALUES (9, 4, 703, 704);
INSERT INTO public.games VALUES (10, 1, 925, 5);
INSERT INTO public.games VALUES (11, 6, 255, 256);
INSERT INTO public.games VALUES (12, 6, 359, 360);
INSERT INTO public.games VALUES (13, 7, 89, 90);
INSERT INTO public.games VALUES (14, 7, 310, 311);
INSERT INTO public.games VALUES (15, 6, 759, 762);
INSERT INTO public.games VALUES (16, 6, 351, 353);
INSERT INTO public.games VALUES (17, 6, 352, 353);
INSERT INTO public.games VALUES (18, 8, 908, 909);
INSERT INTO public.games VALUES (19, 8, 342, 343);
INSERT INTO public.games VALUES (20, 9, 670, 671);
INSERT INTO public.games VALUES (21, 9, 531, 532);
INSERT INTO public.games VALUES (22, 8, 682, 685);
INSERT INTO public.games VALUES (23, 8, 385, 386);
INSERT INTO public.games VALUES (24, 8, 422, 423);
INSERT INTO public.games VALUES (25, 10, 476, 12);
INSERT INTO public.games VALUES (26, 10, 0, 9);
INSERT INTO public.games VALUES (27, 10, 664, 12);
INSERT INTO public.games VALUES (28, 10, 180, 8);
INSERT INTO public.games VALUES (29, 11, 584, 6);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Test');
INSERT INTO public.users VALUES (2, 'user_1713202541106');
INSERT INTO public.users VALUES (3, 'user_1713202541105');
INSERT INTO public.users VALUES (4, 'user_1713202931035');
INSERT INTO public.users VALUES (5, 'user_1713202931034');
INSERT INTO public.users VALUES (6, 'user_1713203663688');
INSERT INTO public.users VALUES (7, 'user_1713203663687');
INSERT INTO public.users VALUES (8, 'user_1713203755126');
INSERT INTO public.users VALUES (9, 'user_1713203755125');
INSERT INTO public.users VALUES (10, 'shikha17');
INSERT INTO public.users VALUES (11, 'akshit17');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 29, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 11, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

