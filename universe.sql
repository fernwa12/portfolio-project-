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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(25),
    date_discovered date NOT NULL,
    explored boolean NOT NULL,
    noteable_details text
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
    name character varying(25),
    date_discovered date NOT NULL,
    explored boolean NOT NULL,
    planet_id integer
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
    name character varying(25),
    date_discovered date NOT NULL,
    explored boolean NOT NULL,
    notable_details text,
    star_id integer,
    habiting_species integer
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
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    galaxy_id integer,
    planet_id integer,
    name character varying(25) NOT NULL,
    intell_level integer NOT NULL,
    color character varying(25) NOT NULL,
    species_id integer NOT NULL
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_species_id_seq OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_species_id_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(25),
    date_discovered date NOT NULL,
    size_in_km numeric NOT NULL,
    galaxy_id integer
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
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_species_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'nuebuka', '1987-05-06', true, 'full of life');
INSERT INTO public.galaxy VALUES (2, 'omega', '1965-06-03', false, 'hard to access');
INSERT INTO public.galaxy VALUES (3, 'zeta', '1989-05-16', true, 'mineral rich');
INSERT INTO public.galaxy VALUES (4, 'Delta', '1995-07-23', false, 'Not acheiveable limited tech');
INSERT INTO public.galaxy VALUES (5, 'alpha', '2004-05-28', false, 'hostile civilization');
INSERT INTO public.galaxy VALUES (6, 'nigel', '2015-08-13', false, 'conflict between planets');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'patrick', '1980-02-03', true, 1);
INSERT INTO public.moon VALUES (2, 'squidward', '1981-08-12', false, 12);
INSERT INTO public.moon VALUES (3, 'sandy', '1992-12-25', true, 8);
INSERT INTO public.moon VALUES (4, 'plankton', '1988-10-03', true, 6);
INSERT INTO public.moon VALUES (5, 'krabs', '1985-05-29', false, 4);
INSERT INTO public.moon VALUES (6, 'ferb', '1990-09-14', true, 5);
INSERT INTO public.moon VALUES (7, 'dexter', '2001-02-15', false, 2);
INSERT INTO public.moon VALUES (8, 'willie', '1995-12-09', true, 7);
INSERT INTO public.moon VALUES (9, 'dusty', '2002-01-26', false, 6);
INSERT INTO public.moon VALUES (10, 'philly', '1994-02-06', false, 8);
INSERT INTO public.moon VALUES (11, 'maverick', '1999-12-23', true, 11);
INSERT INTO public.moon VALUES (12, 'kirby', '1982-05-22', false, 10);
INSERT INTO public.moon VALUES (13, 'randy', '1992-02-05', true, 4);
INSERT INTO public.moon VALUES (14, 'mairo', '1987-12-13', true, 2);
INSERT INTO public.moon VALUES (15, 'frank', '1996-03-29', true, 1);
INSERT INTO public.moon VALUES (16, 'wario', '1985-09-21', false, 9);
INSERT INTO public.moon VALUES (17, 'doc', '2003-12-25', false, 7);
INSERT INTO public.moon VALUES (18, 'billie', '2001-10-19', true, 7);
INSERT INTO public.moon VALUES (19, 'musty', '2012-01-26', false, 6);
INSERT INTO public.moon VALUES (20, 'curly', '1998-06-26', false, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'krypton', '1988-09-25', true, 'planet does not contain any sign of life', 1, 4);
INSERT INTO public.planet VALUES (10, 'maxius', '1998-07-02', true, 'eploration is yet to be completed', 5, 4);
INSERT INTO public.planet VALUES (11, 'x-35 theta', '1980-04-15', true, 'planet is compeleted controled by automotans', 6, 4);
INSERT INTO public.planet VALUES (4, 'muffin', '1992-02-16', false, 'planet is made from unknown soft material', 2, 0);
INSERT INTO public.planet VALUES (5, 'snow', '1981-01-25', false, 'planet is completely metal', 3, 0);
INSERT INTO public.planet VALUES (7, 'wonton', '1984-11-05', false, 'planet is barren', 4, 0);
INSERT INTO public.planet VALUES (12, 'maurdok', '1987-12-02', false, 'gas planet nothing worthy of noting', 6, 0);
INSERT INTO public.planet VALUES (2, 'drool', '1990-12-26', false, 'on the schedule to be explored', 1, 2);
INSERT INTO public.planet VALUES (3, 'gru', '1983-11-25', true, 'planet is in early stages of life', 2, 12);
INSERT INTO public.planet VALUES (6, 'gigawat', '1991-03-16', false, 'planet is simialar to mars except with lifeforms', 3, 1);
INSERT INTO public.planet VALUES (8, 'alpha prime', '1991-08-26', true, 'planet is a copy earth', 4, 90);
INSERT INTO public.planet VALUES (9, 'darrow', '1982-06-25', true, 'planet is engaged in war over two species', 5, 6);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 2, 'navi', 2, 'blue', 1);
INSERT INTO public.species VALUES (3, 4, 'aztecs', 6, 'orange', 2);
INSERT INTO public.species VALUES (1, 6, 'predators', 10, 'green', 3);
INSERT INTO public.species VALUES (3, 8, 'inhumans', 7, 'vareied', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'zues', '1988-05-16', 120.6, 1);
INSERT INTO public.star VALUES (2, 'hermenes', '1989-06-12', 130.8, 1);
INSERT INTO public.star VALUES (3, 'kent', '1990-12-03', 154.3, 3);
INSERT INTO public.star VALUES (4, 'bruce', '1990-10-15', 136.2, 3);
INSERT INTO public.star VALUES (5, 'athena', '2006-10-12', 196.8, 3);
INSERT INTO public.star VALUES (6, 'dava', '2004-12-13', 115.3, 1);


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
-- Name: species_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_species_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_label; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_label UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_label; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_label UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_label; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_label UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: species species_label; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_label UNIQUE (name);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


--
-- Name: star star_label; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_label UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_orbiting_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_orbiting_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_orbiting_sun; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_orbiting_sun FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: species species_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: species species_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star sun_in_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT sun_in_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

