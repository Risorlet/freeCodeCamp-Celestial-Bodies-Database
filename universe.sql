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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric,
    has_life boolean NOT NULL,
    distance_from_earth integer
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean,
    distance_from_earth numeric
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    is_spherical boolean,
    distance_from_earth integer,
    number_of_moons integer
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_type character varying(20) NOT NULL,
    name character varying(30) NOT NULL,
    planet_types_id integer NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    has_life boolean NOT NULL,
    galaxy_id integer NOT NULL,
    is_spherical boolean,
    number_of_planets integer
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
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our galaxy', 1300.6, true, 100);
INSERT INTO public.galaxy VALUES (2, 'Silky Way', 'some galaxy', 1200.6, true, 200);
INSERT INTO public.galaxy VALUES (3, 'Horny Way', 'shameless', 56.4, true, 445);
INSERT INTO public.galaxy VALUES (4, 'Rusty Way', 'Rust and Dust', 74485.25, false, 7885);
INSERT INTO public.galaxy VALUES (5, 'Dark Center', 'full of darkness', 25.4, false, 745896);
INSERT INTO public.galaxy VALUES (6, 'Abyss', 'Abomination', 586, true, 254);
INSERT INTO public.galaxy VALUES (7, 'Booby way', 'Boobs everywhere', 457.25, true, 7845);
INSERT INTO public.galaxy VALUES (8, 'Cooby way', 'Coobs everywhere', 457.25, true, 7845);
INSERT INTO public.galaxy VALUES (9, 'pooby way', 'Poobs everywhere', 457.25, true, 7845);
INSERT INTO public.galaxy VALUES (10, 'Dooby way', 'doobs everywhere', 457.25, true, 7845);
INSERT INTO public.galaxy VALUES (11, 'oooby way', 'ooobs everywhere', 457.25, true, 7845);
INSERT INTO public.galaxy VALUES (12, 'mooby way', 'moobs everywhere', 457.25, true, 7845);
INSERT INTO public.galaxy VALUES (13, 'nooby way', 'noobs everywhere', 457.25, true, 7845);
INSERT INTO public.galaxy VALUES (14, 'vooby way', 'voobs everywhere', 457.25, true, 7845);
INSERT INTO public.galaxy VALUES (15, 'tooby way', 'toobs everywhere', 457.25, true, 7845);
INSERT INTO public.galaxy VALUES (16, 'qooby way', 'qoobs everywhere', 457.25, true, 7845);
INSERT INTO public.galaxy VALUES (17, 'wooby way', 'woobs everywhere', 457.25, true, 7845);
INSERT INTO public.galaxy VALUES (18, 'rooby way', 'roobs everywhere', 457.25, true, 7845);
INSERT INTO public.galaxy VALUES (19, 'fooby way', 'foobs everywhere', 457.25, true, 7845);
INSERT INTO public.galaxy VALUES (20, 'gooby way', 'goobs everywhere', 457.25, true, 7845);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 7458);
INSERT INTO public.moon VALUES (2, 'Noon', 3, true, 7458);
INSERT INTO public.moon VALUES (3, 'Poon', 4, true, 7458);
INSERT INTO public.moon VALUES (4, 'Loon', 5, true, 7458);
INSERT INTO public.moon VALUES (5, 'Ioon', 6, true, 7458);
INSERT INTO public.moon VALUES (6, 'Koon', 7, true, 7458);
INSERT INTO public.moon VALUES (7, 'Racoon', 9, true, 7458);
INSERT INTO public.moon VALUES (8, 'Aacoon', 10, true, 7458);
INSERT INTO public.moon VALUES (9, 'Bacoon', 11, true, 7458);
INSERT INTO public.moon VALUES (10, 'Cacoon', 12, true, 7458);
INSERT INTO public.moon VALUES (11, 'Dacoon', 13, true, 7458);
INSERT INTO public.moon VALUES (12, 'Facoon', 14, true, 7458);
INSERT INTO public.moon VALUES (13, 'Gacoon', 15, true, 7458);
INSERT INTO public.moon VALUES (14, 'Hacoon', 16, true, 7458);
INSERT INTO public.moon VALUES (15, 'Jacoon', 17, true, 7458);
INSERT INTO public.moon VALUES (16, 'Kacoon', 18, true, 7458);
INSERT INTO public.moon VALUES (17, 'Lacoon', 19, true, 7458);
INSERT INTO public.moon VALUES (18, 'Zacoon', 21, true, 7458);
INSERT INTO public.moon VALUES (19, 'Xacoon', 22, true, 7458);
INSERT INTO public.moon VALUES (20, 'Macoon', 23, true, 7458);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 0, 1);
INSERT INTO public.planet VALUES (3, 'Barth', 9, true, 0, 1);
INSERT INTO public.planet VALUES (4, 'Parth', 10, true, 0, 1);
INSERT INTO public.planet VALUES (5, 'Tarth', 11, true, 0, 1);
INSERT INTO public.planet VALUES (6, 'Narth', 12, true, 0, 1);
INSERT INTO public.planet VALUES (7, 'Popo', 13, true, 0, 1);
INSERT INTO public.planet VALUES (9, 'Dopo', 14, true, 0, 1);
INSERT INTO public.planet VALUES (10, 'Mopo', 15, true, 0, 1);
INSERT INTO public.planet VALUES (11, 'Nopo', 16, true, 0, 1);
INSERT INTO public.planet VALUES (12, 'Lopo', 17, true, 0, 1);
INSERT INTO public.planet VALUES (13, 'Kopo', 18, true, 0, 1);
INSERT INTO public.planet VALUES (14, 'Xopo', 19, true, 0, 1);
INSERT INTO public.planet VALUES (15, 'Bopo', 20, true, 0, 1);
INSERT INTO public.planet VALUES (16, 'Fopo', 21, true, 0, 1);
INSERT INTO public.planet VALUES (17, 'Oopo', 22, true, 0, 1);
INSERT INTO public.planet VALUES (18, 'Reopo', 23, true, 0, 1);
INSERT INTO public.planet VALUES (19, 'Leopo', 24, true, 0, 1);
INSERT INTO public.planet VALUES (21, 'Teopo', 25, true, 0, 1);
INSERT INTO public.planet VALUES (22, 'Peopo', 26, true, 0, 1);
INSERT INTO public.planet VALUES (23, 'Heopo', 27, true, 0, 1);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES ('Super', 'Earth', 1);
INSERT INTO public.planet_types VALUES ('Super', 'Barth', 2);
INSERT INTO public.planet_types VALUES ('Super', 'Varth', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', false, 1, true, 10);
INSERT INTO public.star VALUES (9, 'Dun', false, 2, true, 10);
INSERT INTO public.star VALUES (10, 'Reg', false, 3, false, 45);
INSERT INTO public.star VALUES (11, 'Peanut', true, 6, true, 47);
INSERT INTO public.star VALUES (12, 'Almond', false, 4, false, 4);
INSERT INTO public.star VALUES (13, 'Cashew', true, 5, true, 1);
INSERT INTO public.star VALUES (14, 'Aboo', true, 7, true, 44);
INSERT INTO public.star VALUES (15, 'Bboo', true, 8, true, 44);
INSERT INTO public.star VALUES (16, 'Cboo', true, 9, true, 44);
INSERT INTO public.star VALUES (17, 'Dboo', true, 10, true, 44);
INSERT INTO public.star VALUES (18, 'Eboo', true, 11, true, 44);
INSERT INTO public.star VALUES (19, 'Fboo', true, 12, true, 44);
INSERT INTO public.star VALUES (20, 'Gboo', true, 13, true, 44);
INSERT INTO public.star VALUES (21, 'Hboo', true, 14, true, 44);
INSERT INTO public.star VALUES (22, 'Iboo', true, 15, true, 44);
INSERT INTO public.star VALUES (23, 'Jboo', true, 16, true, 44);
INSERT INTO public.star VALUES (24, 'Kboo', true, 17, true, 44);
INSERT INTO public.star VALUES (25, 'Lboo', true, 18, true, 44);
INSERT INTO public.star VALUES (26, 'Mboo', true, 19, true, 44);
INSERT INTO public.star VALUES (27, 'Nboo', true, 20, true, 44);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 23, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 27, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxyuq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxyuq UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_key UNIQUE (planet_id);


--
-- Name: moon moonuq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moonuq UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_key UNIQUE (star_id);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: planet planetuq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planetuq UNIQUE (name);


--
-- Name: planet_types ptuq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT ptuq UNIQUE (name);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star staruq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT staruq UNIQUE (name);


--
-- Name: moon moonfk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moonfk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planetfk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planetfk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star starfk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT starfk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
