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
    name character varying(30) NOT NULL,
    pgc_number character varying(15) NOT NULL,
    size_in_parsecs integer,
    description text
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
    name character varying(30) NOT NULL,
    pgc_number character varying(15) NOT NULL,
    size_in_kilometers integer,
    description text,
    has_station boolean
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
-- Name: moon_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_station (
    moon_station_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    public boolean,
    station_number character varying(15),
    creation_date date
);


ALTER TABLE public.moon_station OWNER TO freecodecamp;

--
-- Name: moon_station_moon_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_station_moon_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_station_moon_station_id_seq OWNER TO freecodecamp;

--
-- Name: moon_station_moon_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_station_moon_station_id_seq OWNED BY public.moon_station.moon_station_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    pgc_number character varying(15) NOT NULL,
    size_in_kilometers integer,
    description text
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
    name character varying(30) NOT NULL,
    pgc_number character varying(30) NOT NULL,
    size_in_millions_of_kilometers numeric(10,2),
    description text
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
-- Name: moon_station moon_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_station ALTER COLUMN moon_station_id SET DEFAULT nextval('public.moon_station_moon_station_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'PGC 2557', 220000, 'A large spiral galaxy located near the Milky Way.');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'PGC 4321', 105000, 'Our home galaxy, a barred spiral structure.');
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', 'PGC 14673', 50000, 'Known for its bright core and large dust ring.');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'PGC 5194', 60000, 'Famous for its interacting spiral structure.');
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'PGC 14373', 60000, 'A member of the Local Group, near Andromeda.');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'PGC 17223', 14000, 'A satellite galaxy of the Milky Way.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Alpha Luna', 'PGC 1722301', 3474, 'A terrestrial moon orbiting Proxima b.', true);
INSERT INTO public.moon VALUES (2, 1, 'Beta Luna', 'PGC 1722302', 1200, 'A rocky moon with a thin atmosphere.', false);
INSERT INTO public.moon VALUES (3, 2, 'Centauri I', 'PGC 1722401', 4000, 'A massive icy moon with deep craters.', false);
INSERT INTO public.moon VALUES (4, 2, 'Centauri II', 'PGC 1722402', 2500, 'Known for its bright reflective surface.', true);
INSERT INTO public.moon VALUES (5, 3, 'Kepler Minor', 'PGC 4321001', 1800, 'A small barren moon with many ridges.', false);
INSERT INTO public.moon VALUES (6, 3, 'Kepler Major', 'PGC 4321002', 3500, 'A volcanic moon with active geysers.', true);
INSERT INTO public.moon VALUES (7, 4, 'Lyra Alpha', 'PGC 4321101', 2300, 'A rocky moon orbiting Kepler-442b.', false);
INSERT INTO public.moon VALUES (8, 4, 'Lyra Beta', 'PGC 4321102', 4000, 'A habitable moon with vast oceans.', true);
INSERT INTO public.moon VALUES (9, 5, 'Vega Rock', 'PGC 1467301', 3000, 'A solid moon with dense metal deposits.', false);
INSERT INTO public.moon VALUES (10, 5, 'Vega Ice', 'PGC 1467302', 2400, 'An icy moon with potential water reserves.', true);
INSERT INTO public.moon VALUES (11, 6, 'Polaris A', 'PGC 14673101', 1500, 'A small rocky body with a thin atmosphere.', false);
INSERT INTO public.moon VALUES (12, 6, 'Polaris B', 'PGC 14673102', 3800, 'Known for its colorful surface patterns.', true);
INSERT INTO public.moon VALUES (13, 7, 'Rigel Minor', 'PGC 5194001', 1600, 'A barren moon orbiting Rigel I.', false);
INSERT INTO public.moon VALUES (14, 7, 'Rigel Titan', 'PGC 5194002', 5100, 'A massive moon with a dense atmosphere.', true);
INSERT INTO public.moon VALUES (15, 8, 'Sirius A-Luna', 'PGC 5194101', 1700, 'A small rocky moon orbiting Sirius A-b.', false);
INSERT INTO public.moon VALUES (16, 8, 'Sirius B-Luna', 'PGC 5194102', 4300, 'Known for its magnetic anomalies.', true);
INSERT INTO public.moon VALUES (17, 9, 'Magellanic I', 'PGC 2557001', 2200, 'A rocky moon with jagged mountains.', false);
INSERT INTO public.moon VALUES (18, 9, 'Magellanic II', 'PGC 2557002', 3900, 'A habitable moon with dense forests.', true);
INSERT INTO public.moon VALUES (19, 10, 'Andromeda I', 'PGC 2557101', 2800, 'A moon orbiting Sirius B-b, rich in minerals.', false);
INSERT INTO public.moon VALUES (20, 10, 'Andromeda II', 'PGC 2557102', 5200, 'The largest moon in the Andromeda system.', true);


--
-- Data for Name: moon_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_station VALUES (1, 1, 'Alpha Base', true, '101', '2023-01-15');
INSERT INTO public.moon_station VALUES (2, 4, 'Centauri Station', false, '102', '2024-06-20');
INSERT INTO public.moon_station VALUES (3, 8, 'Lyra Outpost', true, '103', '2025-03-11');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Proxima b', 'PGC 17223', 12742, 'A terrestrial planet orbiting Proxima Centauri.');
INSERT INTO public.planet VALUES (2, 1, 'Alpha Centauri B-b', 'PGC 17224', 50000, 'A gas giant orbiting Alpha Centauri B.');
INSERT INTO public.planet VALUES (3, 2, 'Kepler-22b', 'PGC 43210', 15000, 'A super-Earth in the habitable zone of its star.');
INSERT INTO public.planet VALUES (4, 2, 'Kepler-442b', 'PGC 43211', 8000, 'A potentially habitable rocky planet.');
INSERT INTO public.planet VALUES (5, 3, 'Vega Prime', 'PGC 146730', 7500, 'A planet near Vega, thought to be icy.');
INSERT INTO public.planet VALUES (6, 3, 'Vega Minor', 'PGC 146731', 6500, 'A rocky body orbiting close to Vega.');
INSERT INTO public.planet VALUES (7, 4, 'Polaris A-1', 'PGC 51940', 45000, 'A gas giant in the Polaris system.');
INSERT INTO public.planet VALUES (8, 4, 'Polaris B-2', 'PGC 51941', 9000, 'A distant terrestrial planet orbiting Polaris.');
INSERT INTO public.planet VALUES (9, 5, 'Rigel I', 'PGC 143730', 25000, 'The largest planet in the Rigel system.');
INSERT INTO public.planet VALUES (10, 5, 'Rigel II', 'PGC 143731', 10000, 'An icy moon-sized planet in the Rigel system.');
INSERT INTO public.planet VALUES (11, 6, 'Sirius A-b', 'PGC 25570', 13000, 'A rocky planet orbiting Sirius A.');
INSERT INTO public.planet VALUES (12, 6, 'Sirius B-b', 'PGC 25571', 11000, 'A gaseous planet in the Sirius system.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sirius', 'PGC 2557', 2.38, 'The brightest star in the night sky.');
INSERT INTO public.star VALUES (2, 2, 'Betelgeuse', 'PGC 4321', 1230.00, 'A red supergiant star in the Milky Way.');
INSERT INTO public.star VALUES (3, 3, 'Vega', 'PGC 14673', 2.36, 'A bright star in the Lyra constellation.');
INSERT INTO public.star VALUES (4, 4, 'Polaris', 'PGC 5194', 50.00, 'The North Star, part of the Ursa Minor.');
INSERT INTO public.star VALUES (5, 5, 'Rigel', 'PGC 14373', 70.00, 'A blue supergiant in the Orion constellation.');
INSERT INTO public.star VALUES (6, 6, 'Proxima Centauri', 'PGC 17223', 0.21, 'The closest star to the Solar System.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: moon_station_moon_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_station_moon_station_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_pgc_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pgc_number_key UNIQUE (pgc_number);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon_station moon_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_station
    ADD CONSTRAINT moon_station_pkey PRIMARY KEY (moon_station_id);


--
-- Name: moon_station moon_station_station_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_station
    ADD CONSTRAINT moon_station_station_number_key UNIQUE (station_number);


--
-- Name: moon pgc_number; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT pgc_number UNIQUE (pgc_number);


--
-- Name: planet planet_pgc_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pgc_number_key UNIQUE (pgc_number);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pgc_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pgc_number_key UNIQUE (pgc_number);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon_station moon_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_station
    ADD CONSTRAINT moon_id FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

