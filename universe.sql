--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    name character varying(40) NOT NULL,
    description text,
    comet_id integer NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_description text,
    has_known_life_forms boolean,
    distance_from_earth_by_million_light_years numeric(8,2)
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
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_earth_by_million_km numeric(8,2),
    moon_description text,
    has_known_life_forms boolean
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
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_earth_by_million_km numeric(8,2),
    planet_description text,
    number_of_moons integer,
    has_rings boolean,
    has_known_life_forms boolean
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
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_earth_by_million_light_years numeric(8,2),
    star_description text,
    number_of_planets integer,
    has_known_life_forms boolean
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES ('Halleys Comet', 'Visible from earth every 75-79 years', 1);
INSERT INTO public.comet VALUES ('Hale-Bopp', 'Discovered July 23rd, 1995', 2);
INSERT INTO public.comet VALUES ('Shoemaker Levy-9', 'Broke apart in 1992 and collided with Jupiter in 1994', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'A spiral galaxy about 2.5 million light years from earth', false, 2.50);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Spiral galaxy that is home to the earths sun', true, 0.00);
INSERT INTO public.galaxy VALUES (3, 'LGS 3', 'Satellite galaxy of either Triangulum or Andromeda', false, 3.52);
INSERT INTO public.galaxy VALUES (4, 'Messier 33', 'Also known as Triangulum, in a grouo with Milkyway, and  Andromeda', false, 3.00);
INSERT INTO public.galaxy VALUES (5, 'Aquarius Dwarf', 'Irregular dwarf locatied in constellation Aquarius', false, 3.20);
INSERT INTO public.galaxy VALUES (6, 'Tucana Dwarf', 'A dwarf spheroidal galaxy of type dE5', false, 0.16);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 4, 'The Moon', 0.02, 'Some say its made of cheese', false);
INSERT INTO public.moon VALUES (2, 12, 'Star X Moon 1', 455.10, 'Fake moon 1', false);
INSERT INTO public.moon VALUES (3, 12, 'Star X Moon 2', 455.20, 'Fake moon 2', false);
INSERT INTO public.moon VALUES (4, 12, 'Star X Moon 3', 455.30, 'Fake moon 3', false);
INSERT INTO public.moon VALUES (5, 12, 'Star X Moon 4', 455.40, 'Fake moon 4', false);
INSERT INTO public.moon VALUES (6, 12, 'Star X Moon 5', 455.50, 'Fake moon 5', false);
INSERT INTO public.moon VALUES (7, 12, 'Star X Moon 6', 455.60, 'Fake moon 6', false);
INSERT INTO public.moon VALUES (8, 12, 'Star X Moon 7', 455.70, 'Fake moon 7', false);
INSERT INTO public.moon VALUES (9, 12, 'Star X Moon 8', 455.80, 'Fake moon 8', false);
INSERT INTO public.moon VALUES (10, 12, 'Star X Moon 9', 455.90, 'Fake moon 9', false);
INSERT INTO public.moon VALUES (11, 12, 'Star X Moon 10', 456.00, 'Fake moon 10', false);
INSERT INTO public.moon VALUES (12, 12, 'Star X Moon 11', 456.10, 'Fake moon 11', false);
INSERT INTO public.moon VALUES (13, 12, 'Star X Moon 12', 456.20, 'Fake moon 12', false);
INSERT INTO public.moon VALUES (14, 12, 'Star X Moon 13', 456.30, 'Fake moon 13', false);
INSERT INTO public.moon VALUES (15, 12, 'Star X Moon 14', 456.40, 'Fake moon 14', false);
INSERT INTO public.moon VALUES (16, 12, 'Star X Moon 15', 456.50, 'Fake moon 15', false);
INSERT INTO public.moon VALUES (17, 12, 'Star X Moon 16', 456.60, 'Fake moon 16', false);
INSERT INTO public.moon VALUES (18, 12, 'Star X Moon 17', 456.70, 'Fake moon 17', false);
INSERT INTO public.moon VALUES (19, 12, 'Star X Moon 18', 456.80, 'Fake moon 18', false);
INSERT INTO public.moon VALUES (20, 12, 'Star X Moon 19', 456.90, 'Fake moon 19', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 4, 'Mercury', 77.00, 'Closet planet to the Sun', 0, false, false);
INSERT INTO public.planet VALUES (3, 4, 'Venus', 196.30, 'Second planet from Sun', 0, false, false);
INSERT INTO public.planet VALUES (4, 4, 'Earth', 0.00, 'Third planet from Sun', 1, false, true);
INSERT INTO public.planet VALUES (5, 4, 'Mars', 225.00, 'Fourth planet from Sun', 2, false, false);
INSERT INTO public.planet VALUES (6, 4, 'Jupiter', 714.00, 'Fifth planet from Sun', 95, false, false);
INSERT INTO public.planet VALUES (7, 4, 'Saturn', 1200.00, 'Sixth planet from Sun', 146, true, false);
INSERT INTO public.planet VALUES (8, 4, 'Uranus', 2600.00, 'Seventh planet from Sun', 27, true, false);
INSERT INTO public.planet VALUES (9, 4, 'Neptune', 4559.00, 'Eighth planet from Sun', 14, false, false);
INSERT INTO public.planet VALUES (10, 1, 'Beep Boop', 455967.87, 'Fake data', 0, false, false);
INSERT INTO public.planet VALUES (11, 1, 'Boop Beep', 455970.00, 'Fake data', 0, false, false);
INSERT INTO public.planet VALUES (12, 7, 'Star X', 455.00, 'Fake data', 0, false, false);
INSERT INTO public.planet VALUES (13, 7, 'Star Y', 459.00, 'Fake data', 0, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Alpheratz', 0.01, 'Bright star, 97 light years from earths sun', 0, false);
INSERT INTO public.star VALUES (3, 1, 'Mirach', 0.02, 'Star commonly used to locate Andromeda Galaxy', 0, false);
INSERT INTO public.star VALUES (4, 2, 'The Sun', 0.00, 'Earths star', 8, true);
INSERT INTO public.star VALUES (5, 4, 'Beta Trianguli', 0.01, 'Brightest star in triangulum constellation', 0, false);
INSERT INTO public.star VALUES (6, 4, 'Gamma Trianguli', 0.01, 'Star in triangulum constellation', 0, false);
INSERT INTO public.star VALUES (7, 6, 'Alpha Tucanae', 0.02, 'Brightest star in Tucana galaxy', 0, false);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: comet comet_comet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_comet_id_key UNIQUE (comet_id);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

