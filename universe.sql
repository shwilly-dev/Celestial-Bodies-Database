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
-- Name: definitions; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.definitions (
    definitions_id integer NOT NULL,
    name character varying(32) NOT NULL,
    definition text NOT NULL
);


ALTER TABLE public.definitions OWNER TO freecodecamp;

--
-- Name: definitions_definitions_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.definitions_definitions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.definitions_definitions_id_seq OWNER TO freecodecamp;

--
-- Name: definitions_definitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.definitions_definitions_id_seq OWNED BY public.definitions.definitions_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(64) NOT NULL,
    distance_in_mly numeric(5,3),
    associated_constellation character varying(64),
    shape character varying(32) NOT NULL
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
    name character varying(64) NOT NULL,
    planet_id integer NOT NULL,
    radius_in_km numeric(7,3),
    orbital_axis_in_km integer
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
    name character varying(64) NOT NULL,
    star_id integer NOT NULL,
    number_of_moons integer,
    is_gas boolean NOT NULL,
    has_rings boolean NOT NULL
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
    name character varying(64) NOT NULL,
    galaxy_id integer NOT NULL,
    constellation character varying(64),
    distance_in_ly numeric(12,8)
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
-- Name: definitions definitions_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.definitions ALTER COLUMN definitions_id SET DEFAULT nextval('public.definitions_definitions_id_seq'::regclass);


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
-- Data for Name: definitions; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.definitions VALUES (1, 'Galaxy', 'A system of millions or billions of stars, together with gas and dust, held together by gravitational attraction.');
INSERT INTO public.definitions VALUES (2, 'Star', 'A self-luminous gaseous spheroidal celestial body of great mass which produces energy by means of nuclear fusion reactions.');
INSERT INTO public.definitions VALUES (3, 'Planet', 'Any of the large bodies that typically revolve around another star in the space.');
INSERT INTO public.definitions VALUES (4, 'Moon', 'A natural satellite of a planet.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.000, 'Sagittarius', 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 0.163, 'Dorado/Mensa', 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 0.197, 'Tucana', 'Irregular');
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 2.540, 'Andromeda', 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 2.730, 'Triangulum', 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Bode''s Galaxy', 12.000, 'Ursa Major', 'Spiral');
INSERT INTO public.galaxy VALUES (7, 'Sculptor Galaxy', 12.100, 'Sculptor', 'Spiral');
INSERT INTO public.galaxy VALUES (8, 'Centaurus A', 13.700, 'Centaurus', 'Elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1738.000, 384399);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.267, 9380);
INSERT INTO public.moon VALUES (3, 'Himalia', 5, 69.800, 11461000);
INSERT INTO public.moon VALUES (4, 'Elara', 5, 43.000, 11741000);
INSERT INTO public.moon VALUES (5, 'Pasiphae', 5, 30.000, 23624000);
INSERT INTO public.moon VALUES (6, 'Sinope', 5, 19.000, 23939000);
INSERT INTO public.moon VALUES (7, 'Lysithea', 5, 18.000, 11717000);
INSERT INTO public.moon VALUES (8, 'Carme', 5, 23.000, 23404000);
INSERT INTO public.moon VALUES (9, 'Ananke', 5, 14.000, 21267000);
INSERT INTO public.moon VALUES (10, 'Leda', 5, 10.000, 11165000);
INSERT INTO public.moon VALUES (11, 'Hyperion', 6, 135.000, 1500880);
INSERT INTO public.moon VALUES (12, 'Ymir', 6, 9.000, 23140400);
INSERT INTO public.moon VALUES (13, 'Paaliaq', 6, 11.000, 15200000);
INSERT INTO public.moon VALUES (14, 'Tarvos', 6, 7.500, 17983000);
INSERT INTO public.moon VALUES (15, 'Ijiraq', 6, 6.000, 11124000);
INSERT INTO public.moon VALUES (16, 'Suttungr', 6, 3.500, 19459000);
INSERT INTO public.moon VALUES (17, 'Kiviuk', 6, 8.000, 11110000);
INSERT INTO public.moon VALUES (18, 'Prospero', 7, 25.000, 16256000);
INSERT INTO public.moon VALUES (19, 'Sao', 8, 22.000, 22422000);
INSERT INTO public.moon VALUES (20, 'Neso', 8, 30.000, 48387000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, false, false);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 0, false, false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 0, false, false);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 2, false, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 95, true, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 146, true, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 27, false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 14, false, true);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 5, false, false);
INSERT INTO public.planet VALUES (10, 'Eris', 1, 1, false, false);
INSERT INTO public.planet VALUES (11, 'Makemake', 1, 1, false, false);
INSERT INTO public.planet VALUES (12, 'Haumea', 1, 2, false, false);
INSERT INTO public.planet VALUES (13, 'Ceres', 1, 0, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'None', 0.00001581);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'Canis Major', 8.60000000);
INSERT INTO public.star VALUES (3, 'Canopus', 1, 'Carina', 310.00000000);
INSERT INTO public.star VALUES (4, 'Arcturus', 1, 'Bootes', 36.70000000);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'Lyra', 25.00000000);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 'Orion', 860.00000000);


--
-- Name: definitions_definitions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.definitions_definitions_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: definitions definitions_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.definitions
    ADD CONSTRAINT definitions_name_key UNIQUE (name);


--
-- Name: definitions definitions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.definitions
    ADD CONSTRAINT definitions_pkey PRIMARY KEY (definitions_id);


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

