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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: disc; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.disc (
    disc_id integer NOT NULL,
    name character varying NOT NULL,
    country character varying,
    year integer
);


ALTER TABLE public.disc OWNER TO freecodecamp;

--
-- Name: disc_disc_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.disc_disc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disc_disc_id_seq OWNER TO freecodecamp;

--
-- Name: disc_disc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.disc_disc_id_seq OWNED BY public.disc.disc_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    constellation text,
    type character varying,
    year_discovered integer,
    distance_from_earth_in_ly numeric,
    size_in_ly numeric,
    disc_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    radius_size_kms numeric,
    year_discovered integer,
    is_spherical boolean,
    has_water boolean,
    disc_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer,
    radius_size_kms numeric,
    year_discovered integer,
    has_life boolean,
    has_rings boolean,
    num_rings integer,
    has_moons boolean,
    num_moons integer,
    disc_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    spectral_type character varying,
    year_discovered integer,
    has_planets boolean,
    num_planets integer,
    disc_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: disc disc_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.disc ALTER COLUMN disc_id SET DEFAULT nextval('public.disc_disc_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: disc; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.disc VALUES (1, 'disc1', 'country1', 1900);
INSERT INTO public.disc VALUES (2, 'disc2', 'country2', 1900);
INSERT INTO public.disc VALUES (3, 'disc3', 'country3', 1900);
INSERT INTO public.disc VALUES (4, 'disc4', 'country4', 1900);
INSERT INTO public.disc VALUES (5, 'disc5', 'country5', 1900);
INSERT INTO public.disc VALUES (6, 'disc6', 'country6', 1900);
INSERT INTO public.disc VALUES (7, 'disc7', 'country7', 1900);
INSERT INTO public.disc VALUES (8, 'disc8', 'country8', 1900);
INSERT INTO public.disc VALUES (9, 'disc9', 'country9', 1900);
INSERT INTO public.disc VALUES (10, 'disc10', 'country10', 1900);
INSERT INTO public.disc VALUES (11, 'disc11', 'country11', 1900);
INSERT INTO public.disc VALUES (12, 'disc12', 'country12', 1900);
INSERT INTO public.disc VALUES (13, 'disc13', 'country13', 1900);
INSERT INTO public.disc VALUES (14, 'disc14', 'country14', 1900);
INSERT INTO public.disc VALUES (15, 'disc15', 'country15', 1900);
INSERT INTO public.disc VALUES (16, 'disc16', 'country16', 1900);
INSERT INTO public.disc VALUES (17, 'disc17', 'country17', 1900);
INSERT INTO public.disc VALUES (18, 'disc18', 'country18', 1900);
INSERT INTO public.disc VALUES (19, 'disc19', 'country19', 1900);
INSERT INTO public.disc VALUES (20, 'disc20', 'country20', 1900);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy1', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.galaxy VALUES (2, 'galaxy2', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.galaxy VALUES (3, 'galaxy3', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.galaxy VALUES (4, 'galaxy4', NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.galaxy VALUES (5, 'galaxy5', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.galaxy VALUES (6, 'galaxy6', NULL, NULL, NULL, NULL, NULL, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'moon2', 2, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (3, 'moon3', 3, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (4, 'moon4', 4, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (5, 'moon5', 5, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (6, 'moon6', 6, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (7, 'moon7', 7, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (8, 'moon8', 8, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (9, 'moon9', 9, NULL, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (10, 'moon10', 10, NULL, NULL, NULL, NULL, 10);
INSERT INTO public.moon VALUES (11, 'moon11', 1, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (12, 'moon12', 2, NULL, NULL, NULL, NULL, 12);
INSERT INTO public.moon VALUES (13, 'moon13', 3, NULL, NULL, NULL, NULL, 13);
INSERT INTO public.moon VALUES (14, 'moon14', 4, NULL, NULL, NULL, NULL, 14);
INSERT INTO public.moon VALUES (15, 'moon15', 5, NULL, NULL, NULL, NULL, 15);
INSERT INTO public.moon VALUES (16, 'moon16', 6, NULL, NULL, NULL, NULL, 16);
INSERT INTO public.moon VALUES (17, 'moon17', 7, NULL, NULL, NULL, NULL, 17);
INSERT INTO public.moon VALUES (18, 'moon18', 8, NULL, NULL, NULL, NULL, 18);
INSERT INTO public.moon VALUES (19, 'moon19', 9, NULL, NULL, NULL, NULL, 19);
INSERT INTO public.moon VALUES (20, 'moon20', 2, NULL, NULL, NULL, NULL, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'planet2', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (3, 'planet3', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (4, 'planet4', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (5, 'planet5', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (6, 'planet6', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (7, 'planet7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.planet VALUES (8, 'planet8', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.planet VALUES (9, 'planet9', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9);
INSERT INTO public.planet VALUES (10, 'planet10', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10);
INSERT INTO public.planet VALUES (11, 'planet11', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.planet VALUES (12, 'planet12', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star1', 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'star2', 2, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (3, 'star3', 3, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES (4, 'star4', 4, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.star VALUES (5, 'star5', 5, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.star VALUES (6, 'star6', 6, NULL, NULL, NULL, NULL, 6);


--
-- Name: disc_disc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.disc_disc_id_seq', 20, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: disc disc_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.disc
    ADD CONSTRAINT disc_name_key UNIQUE (name);


--
-- Name: disc disc_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.disc
    ADD CONSTRAINT disc_pkey PRIMARY KEY (disc_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_disc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_disc_id_fkey FOREIGN KEY (disc_id) REFERENCES public.disc(disc_id);


--
-- Name: moon moon_disc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_disc_id_fkey FOREIGN KEY (disc_id) REFERENCES public.disc(disc_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_disc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_disc_id_fkey FOREIGN KEY (disc_id) REFERENCES public.disc(disc_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_disc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_disc_id_fkey FOREIGN KEY (disc_id) REFERENCES public.disc(disc_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

