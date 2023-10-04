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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL,
    size_in_light_years integer NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean
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
    description text NOT NULL,
    diameter_in_km integer NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean,
    has_water boolean
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
    description text NOT NULL,
    diameter_in_km integer NOT NULL,
    age_in_millions_of_years integer,
    has_population boolean,
    has_water boolean
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
-- Name: population; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.population (
    population_id integer NOT NULL,
    planet_id integer NOT NULL,
    population bigint NOT NULL,
    name character varying(40),
    average_specie_height_in_cm numeric(4,1)
);


ALTER TABLE public.population OWNER TO freecodecamp;

--
-- Name: population_population_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.population_population_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.population_population_id_seq OWNER TO freecodecamp;

--
-- Name: population_population_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.population_population_id_seq OWNED BY public.population.population_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL,
    diameter_in_km integer NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean
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
-- Name: population population_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.population ALTER COLUMN population_id SET DEFAULT nextval('public.population_population_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, description, size_in_light_years, age_in_millions_of_years, has_life) FROM stdin;
3	Sombrero	Has a silly name	500000	10000	\N
1	Milky way	A galaxy where people live	100000	13610	t
2	Andromeda	A well visable galaxy from "Milky way"	200000	10010	\N
4	Cigar galaxy	A starburst galaxy	40800	13300	\N
5	Triangulum galaxy	Spiral galaxy, not triangular	61048440	11500	\N
6	Whirlpool galaxy	Also known as Messier 51a or NGC 5194	76900	400	\N
7	Cygnus A	Has Kepplers inside	1	3	\N
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, planet_id, name, description, diameter_in_km, age_in_millions_of_years, is_spherical, has_water) FROM stdin;
1	4	Moon	Earth's only moon	3475	4503	t	t
2	5	Phobos	Innermost satellite of Mars	11	4503	f	f
3	5	Deimos	Outermost satellite of Mars	15	4503	f	f
9	7	Mimas	Saturn's Innermost satellite	207	4503	f	f
4	6	Io	Innermost satellite of Jupiter	1821	4503	t	t
5	6	Europa	Jupiter's second satellite	1940	4503	t	t
6	6	Ganymede	Jupiter's third satellite	5268	4503	t	t
7	6	Callisto	Jupiter'sfourth satellite	4820	4503	t	f
10	7	Enceladus	Saturn's second satellite	504	4503	t	t
11	7	Tethys	Saturn's third satellite	1062	4503	t	t
12	7	Dione	Saturn's fourth satellite	1122	4503	t	t
13	7	Rhea	Saturn's fifth satellite	1527	4503	t	t
14	7	Titan	Saturn's sixth satellite	5149	4503	t	t
15	7	Hyperion	Saturn's seventh satellite	270	4503	f	t
16	7	Lapetus	Saturn's eighth satellite	1469	4503	t	t
17	7	Phoebe	Saturn's ninth satellite	213	4503	f	t
18	8	Puck	Innermost satellite of Uranus	162	4503	f	t
19	8	Miranda	Second satellite of Uranus	471	4503	t	t
20	8	Ariel	Third satellite of Uranus	1157	4503	t	t
21	8	Umbriel	Fourth satellite of Uranus	1169	4503	t	t
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, star_id, name, description, diameter_in_km, age_in_millions_of_years, has_population, has_water) FROM stdin;
3	3	Venus	Second from "Sun"	12104	4503	f	f
2	3	Mercury	Nearest to the "Sun"	4879	4503	f	f
4	3	Earth	Third from "Sun"	12742	4543	t	t
5	3	Mars	Fourth from "Sun"	6779	4603	f	t
6	3	Jupiter	A gas giant	139820	4603	f	f
7	3	Saturn	Has a ring	120536	4603	f	f
8	3	Uranus	Has a funny name	50724	4503	f	f
9	3	Nuptune	Farthest planet from the "Sun" since 2006	49244	4503	f	f
10	3	Pluto	Cancelled	2376	4603	f	t
11	9	Keppler-22A	Nearest to Keppler 22	1	4000	f	\N
12	9	Keppler-22B	Second from Keppler 22	1	3581	f	\N
13	9	Keppler-22C	I made this one up	1	4202	\N	\N
\.


--
-- Data for Name: population; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.population (population_id, planet_id, population, name, average_specie_height_in_cm) FROM stdin;
1	2	0	Nobody	0.0
2	3	0	No one	0.0
3	4	8100000000	Humans	175.1
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, galaxy_id, name, description, diameter_in_km, age_in_millions_of_years, is_spherical) FROM stdin;
3	1	Sun	A star I see every day	1	4603	t
4	1	Alpha Centauri A	The biggest star in 3 star system	1	6000	t
5	1	Alpha Centauri B	The middle star in 3 star system	1	6000	t
6	1	Proxima	Smallest in "Alpha Centauri" system	0	5000	t
7	2	Alpha Andromedae	The brightest star in Andromeda galaxy	2	\N	t
8	1	Altair	Brightest in the constellation of Aquila	2	100	t
9	7	Keppler	Nobody knows anything about it	30581	4000	t
\.


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: population_population_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.population_population_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


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
-- Name: population population_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.population
    ADD CONSTRAINT population_name_key UNIQUE (name);


--
-- Name: population population_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.population
    ADD CONSTRAINT population_pkey PRIMARY KEY (population_id);


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
-- Name: population population_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.population
    ADD CONSTRAINT population_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

