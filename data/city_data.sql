--
-- PostgreSQL database dump
--

-- Dumped from database version 13.15
-- Dumped by pg_dump version 14.13 (Homebrew)

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

--
-- Name: cube; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS cube WITH SCHEMA public;


--
-- Name: EXTENSION cube; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION cube IS 'data type for multidimensional cubes';


--
-- Name: earthdistance; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS earthdistance WITH SCHEMA public;


--
-- Name: EXTENSION earthdistance; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION earthdistance IS 'calculate great-circle distances on the surface of the Earth';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: appreciation_values; Type: TABLE; Schema: public; Owner: young
--

CREATE TABLE public.appreciation_values (
    id bigint NOT NULL,
    latest_quarter numeric,
    last_12months numeric,
    last_2years numeric,
    last_5years numeric,
    last_10years numeric,
    since_2000 numeric,
    city_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.appreciation_values OWNER TO young;

--
-- Name: appreciation_values_id_seq; Type: SEQUENCE; Schema: public; Owner: young
--

CREATE SEQUENCE public.appreciation_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appreciation_values_id_seq OWNER TO young;

--
-- Name: appreciation_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: young
--

ALTER SEQUENCE public.appreciation_values_id_seq OWNED BY public.appreciation_values.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: young
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO young;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: young
--

CREATE TABLE public.cities (
    id bigint NOT NULL,
    city_name character varying,
    state character varying,
    longitude numeric,
    latitude numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.cities OWNER TO young;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: young
--

CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO young;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: young
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: crime_rates; Type: TABLE; Schema: public; Owner: young
--

CREATE TABLE public.crime_rates (
    id bigint NOT NULL,
    city_id integer,
    crime_index numeric,
    violent_crime_rate numeric,
    property_crime_rate numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.crime_rates OWNER TO young;

--
-- Name: crime_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: young
--

CREATE SEQUENCE public.crime_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crime_rates_id_seq OWNER TO young;

--
-- Name: crime_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: young
--

ALTER SEQUENCE public.crime_rates_id_seq OWNED BY public.crime_rates.id;


--
-- Name: family_types; Type: TABLE; Schema: public; Owner: young
--

CREATE TABLE public.family_types (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.family_types OWNER TO young;

--
-- Name: family_types_id_seq; Type: SEQUENCE; Schema: public; Owner: young
--

CREATE SEQUENCE public.family_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.family_types_id_seq OWNER TO young;

--
-- Name: family_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: young
--

ALTER SEQUENCE public.family_types_id_seq OWNED BY public.family_types.id;


--
-- Name: favorite_cities; Type: TABLE; Schema: public; Owner: young
--

CREATE TABLE public.favorite_cities (
    id bigint NOT NULL,
    user_id integer,
    city_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.favorite_cities OWNER TO young;

--
-- Name: favorite_cities_id_seq; Type: SEQUENCE; Schema: public; Owner: young
--

CREATE SEQUENCE public.favorite_cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorite_cities_id_seq OWNER TO young;

--
-- Name: favorite_cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: young
--

ALTER SEQUENCE public.favorite_cities_id_seq OWNED BY public.favorite_cities.id;


--
-- Name: groceries; Type: TABLE; Schema: public; Owner: young
--

CREATE TABLE public.groceries (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.groceries OWNER TO young;

--
-- Name: groceries_id_seq; Type: SEQUENCE; Schema: public; Owner: young
--

CREATE SEQUENCE public.groceries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groceries_id_seq OWNER TO young;

--
-- Name: groceries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: young
--

ALTER SEQUENCE public.groceries_id_seq OWNED BY public.groceries.id;


--
-- Name: grocery_cities; Type: TABLE; Schema: public; Owner: young
--

CREATE TABLE public.grocery_cities (
    id bigint NOT NULL,
    city_id integer,
    grocery_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.grocery_cities OWNER TO young;

--
-- Name: grocery_cities_id_seq; Type: SEQUENCE; Schema: public; Owner: young
--

CREATE SEQUENCE public.grocery_cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grocery_cities_id_seq OWNER TO young;

--
-- Name: grocery_cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: young
--

ALTER SEQUENCE public.grocery_cities_id_seq OWNED BY public.grocery_cities.id;


--
-- Name: gym_cities; Type: TABLE; Schema: public; Owner: young
--

CREATE TABLE public.gym_cities (
    id bigint NOT NULL,
    gym_id integer,
    city_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.gym_cities OWNER TO young;

--
-- Name: gym_cities_id_seq; Type: SEQUENCE; Schema: public; Owner: young
--

CREATE SEQUENCE public.gym_cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gym_cities_id_seq OWNER TO young;

--
-- Name: gym_cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: young
--

ALTER SEQUENCE public.gym_cities_id_seq OWNED BY public.gym_cities.id;


--
-- Name: gyms; Type: TABLE; Schema: public; Owner: young
--

CREATE TABLE public.gyms (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.gyms OWNER TO young;

--
-- Name: gyms_id_seq; Type: SEQUENCE; Schema: public; Owner: young
--

CREATE SEQUENCE public.gyms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gyms_id_seq OWNER TO young;

--
-- Name: gyms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: young
--

ALTER SEQUENCE public.gyms_id_seq OWNED BY public.gyms.id;


--
-- Name: language_cities; Type: TABLE; Schema: public; Owner: young
--

CREATE TABLE public.language_cities (
    id bigint NOT NULL,
    language_id integer,
    city_id integer,
    percentage double precision,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.language_cities OWNER TO young;

--
-- Name: language_cities_id_seq; Type: SEQUENCE; Schema: public; Owner: young
--

CREATE SEQUENCE public.language_cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.language_cities_id_seq OWNER TO young;

--
-- Name: language_cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: young
--

ALTER SEQUENCE public.language_cities_id_seq OWNED BY public.language_cities.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: young
--

CREATE TABLE public.languages (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.languages OWNER TO young;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: young
--

CREATE SEQUENCE public.languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO young;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: young
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: metras; Type: TABLE; Schema: public; Owner: young
--

CREATE TABLE public.metras (
    id bigint NOT NULL,
    station character varying,
    lines character varying,
    city_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.metras OWNER TO young;

--
-- Name: metras_id_seq; Type: SEQUENCE; Schema: public; Owner: young
--

CREATE SEQUENCE public.metras_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metras_id_seq OWNER TO young;

--
-- Name: metras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: young
--

ALTER SEQUENCE public.metras_id_seq OWNED BY public.metras.id;


--
-- Name: prices; Type: TABLE; Schema: public; Owner: young
--

CREATE TABLE public.prices (
    id bigint NOT NULL,
    median_home_value integer,
    rental_value integer,
    city_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.prices OWNER TO young;

--
-- Name: prices_id_seq; Type: SEQUENCE; Schema: public; Owner: young
--

CREATE SEQUENCE public.prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prices_id_seq OWNER TO young;

--
-- Name: prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: young
--

ALTER SEQUENCE public.prices_id_seq OWNED BY public.prices.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: young
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    user_id integer,
    city_id integer,
    pros text,
    cons text,
    ratings integer,
    zipcode integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    recommend_family_type text[] DEFAULT '{}'::text[]
);


ALTER TABLE public.reviews OWNER TO young;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: young
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO young;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: young
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: young
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO young;

--
-- Name: school_grades; Type: TABLE; Schema: public; Owner: young
--

CREATE TABLE public.school_grades (
    id bigint NOT NULL,
    city_id integer,
    score_compared_to_us integer,
    score_compared_to_il integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.school_grades OWNER TO young;

--
-- Name: school_grades_id_seq; Type: SEQUENCE; Schema: public; Owner: young
--

CREATE SEQUENCE public.school_grades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.school_grades_id_seq OWNER TO young;

--
-- Name: school_grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: young
--

ALTER SEQUENCE public.school_grades_id_seq OWNED BY public.school_grades.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: young
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    username character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_family_type text[] DEFAULT '{}'::text[]
);


ALTER TABLE public.users OWNER TO young;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: young
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO young;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: young
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: appreciation_values id; Type: DEFAULT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.appreciation_values ALTER COLUMN id SET DEFAULT nextval('public.appreciation_values_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: crime_rates id; Type: DEFAULT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.crime_rates ALTER COLUMN id SET DEFAULT nextval('public.crime_rates_id_seq'::regclass);


--
-- Name: family_types id; Type: DEFAULT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.family_types ALTER COLUMN id SET DEFAULT nextval('public.family_types_id_seq'::regclass);


--
-- Name: favorite_cities id; Type: DEFAULT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.favorite_cities ALTER COLUMN id SET DEFAULT nextval('public.favorite_cities_id_seq'::regclass);


--
-- Name: groceries id; Type: DEFAULT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.groceries ALTER COLUMN id SET DEFAULT nextval('public.groceries_id_seq'::regclass);


--
-- Name: grocery_cities id; Type: DEFAULT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.grocery_cities ALTER COLUMN id SET DEFAULT nextval('public.grocery_cities_id_seq'::regclass);


--
-- Name: gym_cities id; Type: DEFAULT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.gym_cities ALTER COLUMN id SET DEFAULT nextval('public.gym_cities_id_seq'::regclass);


--
-- Name: gyms id; Type: DEFAULT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.gyms ALTER COLUMN id SET DEFAULT nextval('public.gyms_id_seq'::regclass);


--
-- Name: language_cities id; Type: DEFAULT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.language_cities ALTER COLUMN id SET DEFAULT nextval('public.language_cities_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: metras id; Type: DEFAULT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.metras ALTER COLUMN id SET DEFAULT nextval('public.metras_id_seq'::regclass);


--
-- Name: prices id; Type: DEFAULT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.prices ALTER COLUMN id SET DEFAULT nextval('public.prices_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: school_grades id; Type: DEFAULT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.school_grades ALTER COLUMN id SET DEFAULT nextval('public.school_grades_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: appreciation_values; Type: TABLE DATA; Schema: public; Owner: young
--

COPY public.appreciation_values (id, latest_quarter, last_12months, last_2years, last_5years, last_10years, since_2000, city_id, created_at, updated_at) FROM stdin;
1	4.09	8.17	8.6	6.68	5.55	2.35	5	2024-07-23 14:35:01.625	2024-07-23 14:35:01.625
2	8.99	12.81	11.69	8.2	6.62	2.32	14	2024-07-23 14:35:01.628	2024-07-23 14:35:01.628
3	0	7.78	7.06	7.91	6.14	2.34	22	2024-07-23 14:35:01.63	2024-07-23 14:35:01.63
4	1.67	6.23	7.51	6.41	3.82	2.13	25	2024-07-23 14:35:01.632	2024-07-23 14:35:01.632
5	5.85	10.51	11.02	8.74	5.91	1.99	38	2024-07-23 14:35:01.633	2024-07-23 14:35:01.633
6	7.59	10.23	8.84	5.8	4.32	2.54	47	2024-07-23 14:35:01.635	2024-07-23 14:35:01.635
7	6.1	11.92	11.24	8.65	7.34	2.81	66	2024-07-23 14:35:01.636	2024-07-23 14:35:01.636
8	9.85	10.14	8.62	5.55	3.81	1.97	76	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
9	6.56	10.3	10	7.03	5.58	2.27	81	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
10	22.2	7.42	8.14	4.76	2.58	1.9	82	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
11	10.15	12.98	10.95	7.36	5.27	2.44	84	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
12	5.33	11.8	10.87	8.99	7.55	1.95	89	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
13	17.88	10.76	9.82	7.98	4.8	2.84	90	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
14	9.23	10.46	10.24	8.16	4.55	2.25	101	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
15	-8.07	-1.64	2.95	6.07	7.15	2.48	105	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
16	1.44	11.24	8.63	8.16	6.03	1.69	106	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
17	16.91	22.95	13.15	9.25	6.94	2.56	109	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
18	9.09	2.44	2.54	4.27	3.73	2.64	112	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
19	3.85	8.06	6.62	6.56	7.59	3.08	116	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
20	8.14	7.06	7.92	6.39	4.27	2.56	117	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
21	7.93	10.97	9.31	6.49	5.09	2.39	129	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
22	4	7.86	10.31	7.96	3.85	2.35	130	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
23	-5.33	3.61	10.23	9.48	7.08	2.15	131	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
24	7.4	11.97	11.23	8.55	6.78	2.94	136	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
25	25.19	13.25	11.21	8.5	5.44	2.62	144	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
26	30.12	18.6	14.29	9.61	6	2.95	148	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
27	1.15	9.34	7.87	6.73	5.27	2.21	149	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
28	20.23	18.91	13.58	7.04	4.35	2.63	150	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
29	2.28	9.13	8.57	7.09	5.9	2.44	152	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
30	9.59	9.47	8.12	6.19	3.8	2.22	153	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
31	-3.91	1.5	3.72	6.29	6.82	2.55	157	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
32	6.12	9.94	7.53	5.42	4.99	2.71	160	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
33	9.31	11.46	10.43	6.06	4.42	2.26	174	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
34	6.32	11.54	7.46	7.25	6.1	2.73	180	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
35	6.06	6.2	7.22	4.66	3.19	2.13	186	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
36	26.86	7.41	8.84	7.42	3.86	2.35	196	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
37	-3.22	10.65	8.43	9.27	7.21	2.05	199	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
38	3.4	13.46	15.09	12.03	7.43	2.27	200	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
39	10.27	11.44	11.59	7.48	4.48	1.92	210	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
40	28.99	13.44	10.86	6.62	3.38	2.13	213	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
41	9.4	6.09	8.06	5.45	2.24	1.74	218	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
42	2.91	2.08	9.68	5.77	3.24	2.03	221	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
43	14.9	7.96	9.03	5.07	2.93	2.42	223	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
44	7.25	11.43	9.69	6.97	5.76	2.53	224	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
45	7.53	13.25	12	8.86	8.22	2.84	225	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
46	14.52	10.37	8.85	6.33	3.78	2.56	228	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
47	4.97	8.61	9.06	6.93	5.5	1.93	230	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
48	29.06	24.65	20.27	10.87	5.72	3.1	240	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
49	-1.25	8.84	9.83	6.7	4.35	2.67	244	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
50	6.61	11.1	11.38	8.04	5.99	2.48	247	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
51	20.55	12.55	11.01	7.35	3.61	2.13	250	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
52	2.08	7.21	9.02	6.09	3.77	2.55	251	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
53	19.22	11.1	10.16	8.56	5.84	3.58	258	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
54	1.47	6.1	6.33	6.21	5.76	3.13	261	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
55	4.88	15.81	13.81	12.6	8.46	2.91	262	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
56	1.03	7.06	8.13	7.78	6.6	2.64	263	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
57	32.11	16.74	11.01	7	2.92	2.13	264	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
58	-8.39	-2.39	2.25	5.72	8.79	2.68	267	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
59	19.41	11.91	11.61	6.84	3.7	1.73	279	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
60	8.75	14.5	8.47	7.05	5.24	2.83	280	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
61	13.75	13.05	11.39	7.96	4.86	2.69	290	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
62	11.85	8.34	9.1	7.36	4.82	2.55	294	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
63	3.61	11.26	11.76	10.3	6.54	2.34	307	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
64	10.73	18.31	12.57	8.85	7.45	2.84	315	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
65	1.83	8.08	8.34	6.79	4.69	2.16	317	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
66	2.02	10.62	10.06	9.36	5.92	1.87	318	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
67	7.97	12.55	11.35	8.19	6.4	2.3	322	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
68	-55.68	-10.25	-5.08	3.57	1.25	0.6	341	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
69	9.13	11.86	8.4	5.68	4.06	2.37	342	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
70	34.97	16.51	12.34	8.52	3.86	1.94	351	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
71	9.29	9.29	7.39	5.06	3.19	2.14	355	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
72	9.16	17.28	12.8	9.21	5.86	1.99	356	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
73	3.74	7.83	6.95	5.85	5.46	2.31	360	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
74	22.51	14.56	12.4	8.33	4.66	2.39	369	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
75	-8.88	3.99	4.11	8.46	5.24	2.02	370	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
76	5.17	7.26	7.56	5.46	4.43	3.05	379	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
77	11.81	5.08	4.64	5.01	2.77	2.31	382	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
78	12.75	17.42	7.96	8.55	4.74	2.08	387	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
79	7.48	10.27	7.99	8.04	4.4	2.22	393	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
80	-4.19	5.1	7.8	5.77	3.67	2.23	403	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
81	29.03	14.04	11.27	6.98	3.57	2.25	404	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
82	14.71	11.37	9.63	6.82	4.66	3.1	414	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
83	20.17	11.87	9.82	7.85	5	2.85	415	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
84	6.4	9.03	10.02	6.91	4.82	1.85	418	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
85	31.54	25.75	9.86	6.91	3.9	2.79	420	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
86	5.06	10.35	10.42	8.13	7.37	2.44	423	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
87	6.6	10.34	8.39	5.92	4.76	2.34	426	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
88	6.75	7.24	6.52	5.22	4.29	3.13	434	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
89	2.43	6.13	6.79	6.26	5.81	2.4	436	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
90	15.94	22.41	13.73	9.33	6.43	2.75	440	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
91	5.32	7.27	6.95	4.74	4.09	2.62	451	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
92	0.13	5.26	7.5	7.06	5.43	2.55	453	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
93	18.3	10.96	10.02	8.3	5.31	3.27	457	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
94	19.49	18.87	15.33	9.93	5.78	2.74	462	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
95	3.92	8.72	10.24	9.09	5.26	1.79	482	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
96	-9.36	-3.96	0.93	3.85	4.27	2.92	487	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
97	6.36	12.17	11.59	9.4	6.86	2.52	493	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
98	9.14	10.79	9.55	7.23	4.8	2.45	496	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
99	3.57	8.78	6.67	7.12	7.19	2.5	500	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
100	13.38	6.77	9.25	7.37	3.14	1.19	504	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
101	7.23	-0.62	6.23	5.51	3.07	1.95	509	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
102	15.76	8.69	7.86	6.19	3.55	1.72	510	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
103	1.23	8.5	8.14	5.93	3.32	2.32	518	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
104	7.05	8.99	9.91	6.72	4.72	2.34	519	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
105	10.94	14.19	13.08	8.38	6.61	2.36	528	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
106	18.9	15.11	10.28	7.14	4.82	3.09	536	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
107	9.14	10.64	7.98	5.62	4.15	2.82	537	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
108	12.62	10.58	10.18	6.68	3.79	1.93	539	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
109	5.33	9.97	8.89	7.23	6.78	2.61	540	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
110	9.18	9.59	6.9	4.85	3.7	2.48	541	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
111	-8.37	0.29	10.04	10.3	6.71	2.25	542	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
112	12.9	11.7	9.19	7.39	4.46	2.57	543	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
113	2.71	7.28	9.24	6.98	3.94	2.09	563	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
114	9.62	13.98	12.27	8.29	6.3	2.36	569	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
115	7.82	11.48	8.58	6.73	5.56	1.92	583	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
116	8.09	12.97	11.31	7.86	7.27	2.87	594	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
117	29.1	21.92	15.27	8.73	4.72	3.1	598	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
118	1.26	9.74	11.69	8.15	5.95	1.6	604	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
119	-5.17	10.47	19.13	15.23	6.52	2.53	606	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
120	6.23	9.88	7.7	5.45	5.2	2.33	607	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
121	8.11	8.78	8.19	5.67	3.66	1.75	609	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
122	1.92	11.36	11.87	10.28	6.88	2.36	610	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
123	14.27	13.03	7.03	6.53	3.78	2.69	620	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
124	1.16	6.46	8.7	6.98	5.61	2.58	624	2024-07-23 14:35:01.637	2024-07-23 14:35:01.637
125	15.28	13.49	11.21	7.31	4.47	2.67	626	2024-07-23 14:35:01.639	2024-07-23 14:35:01.639
126	7.86	7.78	8.39	5.95	3.64	2.21	627	2024-07-23 14:35:01.64	2024-07-23 14:35:01.64
127	8.08	6.64	5.88	4.36	3.06	2.58	637	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
128	8.13	12.02	10.17	6.75	5.49	2.6	640	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
129	7.73	9.85	9.5	7.03	5.16	2.51	646	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
130	1.41	8.52	9.55	8.96	6.14	2.35	648	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
131	10.39	13.95	12.15	8.29	6.56	2.15	660	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
132	8.88	14.11	11.39	8.28	6.92	2.23	681	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
133	9.28	11.31	8.09	6.17	4.8	2.56	682	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
134	27.02	19.66	10.99	6.74	3.77	2.22	685	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
135	23.55	23.62	14.13	8.38	4.37	2.32	691	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
136	4.08	11.36	10.37	8.54	6.86	2.76	696	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
137	-0.16	6.11	7.75	7.17	6.32	2.47	703	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
138	24.75	14.09	10.89	8.74	4.99	2.05	708	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
139	-8.93	9.73	11.16	7.32	4.07	1.84	722	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
140	6.83	7.3	7.63	5.5	4.48	3.03	739	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
141	3.1	4.8	5.23	4.37	3.85	2.56	740	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
142	4.71	4	6.02	4.83	3.47	2.18	750	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
143	6.82	5.39	7.62	5.46	2.92	1.62	755	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
144	4.51	8.79	10.2	8.42	6.54	2.1	763	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
145	7.27	9.14	8.33	5.99	4.18	2.16	765	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
146	-1.27	7.57	9.14	10.11	6.83	2.18	772	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
147	16.9	9.18	8	7.7	4.16	2.03	774	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
148	-0.72	-6.78	3.81	6.24	4.31	0.97	779	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
149	7.8	12.35	10.01	7.24	3.76	2.35	780	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
150	19.91	18.35	12.6	8.55	4.84	2.72	782	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
151	6.64	7.62	9.2	6.69	4.78	2.5	787	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
152	7.38	8	7.29	5.09	3.71	2.58	795	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
153	10.96	3.7	5.86	5.23	3.24	1.8	799	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
154	9.42	9.16	7.98	5.1	3.28	1.88	800	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
155	5.23	6.53	4.76	5.36	4.24	1.79	801	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
156	2.3	6.91	9.27	7.78	5.64	1.79	802	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
157	9.9	12.37	9.95	6.97	4.83	2.91	805	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
158	21.79	14.43	11.56	8.54	4.9	3	806	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
159	2.34	5.78	8.27	6.69	5.51	2.54	813	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
160	5.82	9.77	7.93	5.84	5.03	2.68	818	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
161	18.82	11.05	10.12	8.46	5.54	3.32	829	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
162	2.03	12.33	9.58	8.73	6.38	2.28	831	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
163	6.78	16.37	13.84	12.31	7.39	2	838	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
164	-2.96	1.8	7.69	6.78	7.85	2.44	839	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
165	5.11	14.89	10.85	9.46	6.49	2.41	841	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
166	18.06	10.44	6.77	4.83	1.86	1.7	843	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
167	2.94	9.22	10.45	7.3	4.96	3.09	848	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
168	9.08	12.24	9.7	7.47	5.73	2.61	853	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
169	21.99	14.47	7.46	6.98	3.55	2.02	854	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
170	23.61	11.64	10.98	8.34	5.69	2.74	857	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
171	2.27	7.12	9.36	7.06	6.22	1.7	861	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
172	17.09	13.31	9.59	7.57	3.95	2.51	864	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
173	-10.73	3.88	11.24	9.83	6.51	2.21	867	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
174	10.01	6.94	8.28	7.04	4.71	2.98	876	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
175	-2.58	4.46	9.74	9.83	6.85	2.54	880	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
176	14.45	7.18	10.02	7.33	3.49	1.92	881	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
177	4.2	11.6	8.72	10.13	7.97	3.2	883	2024-07-23 14:35:01.641	2024-07-23 14:35:01.641
178	7.53	12.79	11.42	8.88	6.67	2.17	889	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
179	-2.74	3.77	4.9	6.8	7.01	2.31	897	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
180	41.25	34.77	20.93	11.03	6.13	2.47	900	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
181	17.89	4.16	9.47	6.6	3.79	2.41	905	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
182	19.09	11.83	7.66	5.35	1.9	1.41	907	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
183	-1.24	6.03	8.96	8.42	6.35	2.35	911	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
184	-5.72	5.72	5.81	4.77	2.99	2.15	912	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
185	8.38	12.44	13.15	8.63	6.57	2.72	928	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
186	7.59	10.16	9.45	6.79	4.55	2.34	933	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
187	-2.13	7.74	7.05	5.86	3.49	2.22	934	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
188	28.95	17.3	11.83	9.07	5.62	2.77	935	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
189	1.05	7.36	10.05	7.92	5.18	1.85	936	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
190	11.02	4.06	4.11	4.37	2.27	1.89	937	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
191	5.61	10.63	11.15	8.37	7.28	2.68	939	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
192	5.19	10.71	7.96	6.16	4.65	2.25	944	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
193	9.8	2.19	10.07	5.7	3.67	1.89	945	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
194	25.14	10.77	11.34	6.52	3.85	2.44	947	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
195	6.53	9.2	7.85	5.63	4.97	2.26	948	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
196	21.37	14.07	4.91	5.94	2.9	2.42	954	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
197	8.45	12.12	9.04	5.83	4.76	2.38	960	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
198	21.29	13.86	11.3	8.06	4.51	2.68	963	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
199	8.11	13.02	10.41	7.38	5.66	2.06	971	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
200	11.64	10.89	5.36	5.07	2.45	1.78	973	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
201	10.54	11.7	10.87	7.13	4.83	2.92	976	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
202	9.2	11.92	10.02	7.17	5.19	2.68	998	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
203	7.7	10.74	7.66	5.64	5.08	2.3	1008	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
204	6.85	9.83	11.68	8.21	4.22	2.46	1014	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
205	6.88	9.95	7.81	5.61	5.42	2.46	1015	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
206	8.6	12.69	11.09	8.1	6.28	2.55	1018	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
207	-1.68	7.32	13.68	9.94	6.76	2.62	1020	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
208	9.68	9.65	7.55	4.95	3.45	2.28	1026	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
209	12.8	12.22	7.72	4.87	3.53	2.49	1027	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
210	3.89	9.84	8.43	8.25	8.41	2.67	1028	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
211	8.82	8.19	8.33	7.05	5.47	3.07	1031	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
212	4.31	10.19	8.92	8.28	5.66	2.44	1032	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
213	0.46	5.67	6.98	6.44	5.19	2.43	1034	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
214	4.19	6.54	6.04	4.27	3.26	2.67	1035	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
215	4.01	-2.61	5.32	6.21	3.39	2.41	1057	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
216	2.31	7.3	8.84	6.5	4.27	2.18	1070	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
217	5.86	8.93	8.62	6.8	4.53	2.29	1071	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
218	6.45	10.18	10.45	7.68	5.9	2.38	1073	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
219	19.95	11.83	9.97	7.32	4.89	2.28	1074	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
220	6.24	10.3	9.21	6.18	4.19	2.15	1079	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
221	5.54	8.69	8.43	6.4	4.41	2.15	1084	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
222	3.13	8.38	7.59	7.01	5.27	2.59	1085	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
223	4.43	6	9.59	6.63	3.94	2	1086	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
224	30.73	24.76	10.12	6.54	3.47	2.32	1087	2024-07-23 14:35:01.642	2024-07-23 14:35:01.642
225	8.99	2.2	6.04	6.61	3.09	1.98	1091	2024-07-23 14:35:01.643	2024-07-23 14:35:01.643
226	-4.67	18.93	15.5	15.01	8.69	2.26	1093	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
227	8.1	8.96	7.42	5.55	4.16	2.17	1094	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
228	26.56	11.26	9.82	6.48	3.04	1.94	1105	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
229	32.2	16.37	13.17	7.8	3.65	1.95	1108	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
230	30.88	15.44	16.37	8.64	4.6	2.52	1109	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
231	12.19	17.3	12.12	8.44	5.09	2.33	1110	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
232	16.84	8.63	8.79	7.2	4.23	2.1	1113	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
233	13.47	16.11	13.22	8.67	6.48	2.65	1127	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
234	8.37	13.63	11.01	8.88	7.27	2.41	1129	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
235	7.14	0	7.44	5.26	2.62	1.84	1138	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
236	9.76	9.08	10.1	8.25	5.8	2.95	1139	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
237	10.22	14.54	10.18	9.01	6.85	2.31	1141	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
238	16.51	8.54	8.86	7.13	3.78	1.65	1154	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
239	3.62	10.98	7.55	5.29	4.1	1.74	1157	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
240	17.53	9.69	10.47	7.07	4.58	3	1160	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
241	-11.83	2.77	3.88	6.22	4.14	1.39	1166	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
242	-4.73	3.8	6.88	8.92	6.16	1.87	1177	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
243	10.77	10.64	6.21	4.84	3.7	2.48	1190	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
244	9.47	16.03	10.63	7.77	7.1	2.49	1191	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
245	-1.07	14.82	15.84	12.05	6.67	1.78	1192	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
246	4.84	5.67	4.52	4.7	4.16	2.14	1193	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
247	10.64	3.79	4.32	3.6	2.31	2.09	1199	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
248	23.92	15.79	11.88	8.74	5.36	2.24	1200	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
249	2.18	6.96	9.81	6.14	4.01	2.73	1201	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
250	17.12	9.99	8.78	7.66	4.38	2.08	1203	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
251	-2.04	11.3	8.63	6.54	3.66	2.32	1204	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
252	-1.63	13.13	10.07	9.29	5.98	1.91	1208	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
253	6.6	12.5	10.22	8.06	5.78	2.48	1210	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
254	5.97	11.66	9.12	5.86	4.22	1.97	1212	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
255	3.85	9.3	9.78	8.16	7.85	2.94	1214	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
256	8.47	14.36	10.82	9.02	6.25	2.4	1217	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
257	7.52	10.94	9.11	6.67	5.15	2.55	1219	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
258	8.15	14.45	12.65	9.33	7.62	2.04	1225	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
259	5.24	13.38	12.26	9.37	7.91	2.44	1226	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
260	5.83	14.74	12.74	9.06	7.41	2.01	1228	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
261	27.01	19.89	15.55	9.68	5.45	2.91	1251	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
262	7.5	13.47	10.91	8.54	6.56	2.47	1255	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
263	-8.09	16.91	13.76	11.26	5.23	1.47	1257	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
264	15.92	9.86	8.89	6.56	2.81	1.89	1259	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
265	17.48	28.19	9.92	7.09	4.81	2.66	1260	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
266	4.42	9.13	8.71	6.12	4.98	2.52	1264	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
267	-0.16	4.3	5.91	6.48	6.22	2.32	1266	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
268	15.98	12.35	11.19	9.15	6.41	3.7	1270	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
269	16.35	12.98	11.6	8.74	5.46	2.8	1289	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
270	5.81	8.96	9.45	7.81	6.04	2.61	1294	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
271	-6.66	3.63	4.7	4.94	3.49	2	1300	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
272	10.57	13.6	9.84	6.68	5.52	2.44	1303	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
273	3.5	11.51	8.78	7.62	6.09	2.48	1314	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
274	8.76	12.49	11.32	8.24	6.52	2.56	1316	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
275	-8.65	-0.97	6.97	8.37	5.56	1.86	1317	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
276	1.52	4.52	8.04	7.33	5.4	1.86	1329	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
277	14.92	7.05	11.01	8.82	4.59	2.26	1330	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
278	-3.78	7.09	8.57	5.84	3.36	2.02	1332	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
279	-6.62	6.95	10.49	11.06	6.08	1.85	1351	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
280	14.62	7.19	7.82	6.35	3.42	1.94	1352	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
281	23.74	15.23	10.42	8.34	5.83	2.37	1356	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
282	4.75	10.01	10.24	7.49	6.89	2.43	1365	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
283	13.02	6.11	6.1	5.39	3.54	1.87	1366	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
284	16.72	20.03	15.57	9.37	6.88	2.53	1369	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
285	-1.22	5.06	7.85	6.91	7.34	3.1	1372	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
286	11.04	8.93	10.56	8.3	4.95	2.43	1378	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
287	4.13	9.37	10.39	8.23	5.91	2.36	1380	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
288	18.5	11.14	12.14	6.79	3.89	2.53	1389	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
289	3.75	7.82	8.78	7.04	4.92	2.41	1406	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
290	17.94	14.73	12.2	7.85	5.25	3.08	1424	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
291	-6.9	8.38	8.48	7.32	4.57	2.02	1432	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
292	-4	5.16	9.36	6.52	3.99	2.51	1433	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
293	19.61	12.65	5.55	6.44	2.69	1.98	1440	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
294	8.84	11.48	10.06	5.85	4.44	2.3	1449	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
295	5.46	9.24	7.17	6.17	5.69	2.9	1455	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
296	12.41	16.64	13.25	8.23	6.06	3.14	1473	2024-07-23 14:35:01.644	2024-07-23 14:35:01.644
297	31.06	16.28	12.08	7.09	4.01	2.74	1477	2024-07-23 14:35:01.644	2024-07-23 14:35:01.645
298	-12.38	9.61	8.95	6.13	2.71	1.34	1478	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
299	11.56	8.1	8.61	6.67	4.8	2.65	1480	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
300	4.86	9.47	10.25	7.36	5.66	1.94	1484	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
301	5.78	15.92	14.07	9.87	8.54	2.27	1485	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
302	6.49	10.43	9.58	7.05	5.42	2.2	1496	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
303	8.7	12.28	12.31	8.42	6.27	2.33	1498	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
304	10.61	4.44	4.74	5.45	2.72	2.57	1499	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
305	0.53	4.62	5.14	5.6	5.46	1.99	1506	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
306	8.67	8.35	6.78	5.05	3.53	2.71	1507	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
307	6.04	8.14	7.14	5.52	4.43	2.82	1511	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
308	10.06	12.25	8.93	5.87	4.15	2.7	1513	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
309	5.91	10.64	9.41	6.51	5.66	2.28	1515	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
310	5.71	7.91	10.4	6.59	4.6	2.38	1527	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
311	3.58	6.8	6.77	4.84	3.13	1.88	1528	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
312	9.13	8.23	7.34	4.92	3.32	2.47	1529	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
313	5.49	11.65	11.77	8.57	6.2	2.94	1530	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
314	6.33	9.05	8.53	6.17	4.93	2.43	1535	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
315	15.29	13.48	7.78	4.61	3.22	2.21	1537	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
316	9.39	15.62	16.16	10.7	6.88	2.18	1539	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
317	1.88	8.45	6.99	8.21	7.18	2.1	1542	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
318	3.44	7.21	7.51	5.88	5.03	2.16	1543	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
319	5.34	8.12	6.4	6.3	3.6	2.22	1544	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
320	8.47	12.17	10	6.78	5.12	2.8	1548	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
321	9.89	16.41	13.12	8.96	6.88	2.11	1550	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
322	1.23	7.87	6.17	6.87	6.04	2.33	1553	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
323	10	13.11	11.73	7.79	6.25	2.4	1560	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
324	2.51	11.5	11.55	10.54	7.93	1.9	1562	2024-07-23 14:35:01.645	2024-07-23 14:35:01.645
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: young
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-07-23 17:43:08.528486	2024-07-23 17:43:08.528489
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: young
--

COPY public.cities (id, city_name, state, longitude, latitude, created_at, updated_at) FROM stdin;
2	Adair	IL	-90.49687	40.419018	2024-07-23 13:03:09.774	2024-08-11 06:41:31.163733
3	Adams	IL	-91.19921	39.865208	2024-07-23 13:03:09.774	2024-08-11 06:41:31.46562
5	Addison	IL	-87.987976	41.931713	2024-07-23 13:03:09.774	2024-08-11 06:41:31.933082
6	Adeline	IL	-89.49028	42.142982	2024-07-23 13:03:09.774	2024-08-11 06:41:32.12679
7	Albany	IL	-90.222786	41.788372	2024-07-23 13:03:09.774	2024-08-11 06:41:32.389482
8	Albers	IL	-89.61345	38.543312	2024-07-23 13:03:09.774	2024-08-11 06:41:32.646927
9	Albion	IL	-88.05626	38.376987	2024-07-23 13:03:09.774	2024-08-11 06:41:32.841031
10	Alden	IL	-88.517876	42.45894	2024-07-23 13:03:09.778	2024-08-11 06:41:33.054769
11	Aledo	IL	-90.74924	41.199955	2024-07-23 13:03:09.779	2024-08-11 06:41:33.270114
12	Alexander	IL	-90.03942	39.72519	2024-07-23 13:03:09.779	2024-08-11 06:41:33.468972
14	Algonquin	IL	-88.292046	42.167244	2024-07-23 13:03:09.779	2024-08-11 06:41:33.86599
15	Alhambra	IL	-89.729805	38.888336	2024-07-23 13:03:09.779	2024-08-11 06:41:34.07185
16	Allendale	IL	-87.708786	38.527515	2024-07-23 13:03:09.779	2024-08-11 06:41:34.294261
17	Allenville	IL	-88.52904	39.556313	2024-07-23 13:03:09.779	2024-08-11 06:41:34.475053
18	Allerton	IL	-87.93794	39.908794	2024-07-23 13:03:09.779	2024-08-11 06:41:34.675794
19	Alma	IL	-88.91001	38.72095	2024-07-23 13:03:09.779	2024-08-11 06:41:34.910336
20	Alpha	IL	-90.380035	41.19158	2024-07-23 13:03:09.779	2024-08-11 06:41:35.130135
21	Alsey	IL	-90.435074	39.559868	2024-07-23 13:03:09.781	2024-08-11 06:41:35.304048
22	Alsip	IL	-87.73888	41.66905	2024-07-23 13:03:09.782	2024-08-11 06:41:35.498958
23	Altamont	IL	-88.74838	39.060658	2024-07-23 13:03:09.782	2024-08-11 06:41:35.68696
25	Alton	IL	-90.18658	38.89025	2024-07-23 13:03:09.782	2024-08-11 06:41:36.064536
26	Altona	IL	-90.163994	41.114483	2024-07-23 13:03:09.782	2024-08-11 06:41:36.267531
27	Alvan (Alvin)	IL	-87.601295	40.30772	2024-07-23 13:03:09.782	2024-08-11 06:41:36.445452
28	Alvin	IL	-87.601295	40.30772	2024-07-23 13:03:09.782	2024-08-11 06:41:36.645792
29	Amboy	IL	-89.329315	41.713997	2024-07-23 13:03:09.782	2024-08-11 06:41:36.832316
30	Anchor	IL	-87.937471	41.949468	2024-07-23 13:03:09.782	2024-08-11 06:41:37.064414
31	Ancona	IL	-88.87228	41.040974	2024-07-23 13:03:09.782	2024-08-11 06:41:37.246637
32	Andalusia	IL	-90.719154	41.439148	2024-07-23 13:03:09.782	2024-08-11 06:41:37.473121
33	Andover	IL	-90.292175	41.293907	2024-07-23 13:03:09.782	2024-08-11 06:41:37.682467
34	Andres	IL	-87.882645	41.372513	2024-07-23 13:03:09.782	2024-08-11 06:41:37.854396
36	Annapolis	IL	-87.81685	39.144737	2024-07-23 13:03:09.782	2024-08-11 06:41:38.270098
37	Annawan	IL	-89.90777	41.397404	2024-07-23 13:03:09.782	2024-08-11 06:41:38.428805
38	Antioch	IL	-88.096436	42.479122	2024-07-23 13:03:09.782	2024-08-11 06:41:38.628098
39	Apple Canyon Lake	IL	-90.15636	42.42407	2024-07-23 13:03:09.782	2024-08-11 06:41:38.804473
40	Apple River	IL	-90.09619	42.505096	2024-07-23 13:03:09.782	2024-08-11 06:41:38.959207
41	Arbury Hills	IL	-87.84762	41.535778	2024-07-23 13:03:09.782	2024-08-11 06:41:39.112971
42	Arcola	IL	-88.30666	39.68431	2024-07-23 13:03:09.782	2024-08-11 06:41:39.299548
43	Arenzville	IL	-90.372246	39.87681	2024-07-23 13:03:09.782	2024-08-11 06:41:39.486233
44	Argenta	IL	-88.822464	39.98187	2024-07-23 13:03:09.782	2024-08-11 06:41:39.698869
45	Argyle	IL	-88.94027	42.360268	2024-07-23 13:03:09.782	2024-08-11 06:41:39.894563
47	Arlington Heights	IL	-87.98292	42.08431	2024-07-23 13:03:09.782	2024-08-11 06:41:40.283203
48	Armington	IL	-89.31184	40.339466	2024-07-23 13:03:09.782	2024-08-11 06:41:40.489824
49	Armstrong	IL	-87.87747	40.30651	2024-07-23 13:03:09.782	2024-08-11 06:41:40.697191
50	Aroma Park	IL	-87.805855	41.07859	2024-07-23 13:03:09.782	2024-08-11 06:41:40.872177
51	Arrowsmith	IL	-88.6316	40.45043	2024-07-23 13:03:09.782	2024-08-11 06:41:41.050889
52	Arthur	IL	-88.472466	39.716854	2024-07-23 13:03:09.782	2024-08-11 06:41:41.250665
53	Ashkum	IL	-87.95564	40.878895	2024-07-23 13:03:09.782	2024-08-11 06:41:41.45126
54	Ashland	IL	-90.0072	39.88781	2024-07-23 13:03:09.782	2024-08-11 06:41:41.673048
55	Ashley	IL	-89.18862	38.327644	2024-07-23 13:03:09.782	2024-08-11 06:41:41.88461
56	Ashmore	IL	-88.02171	39.533817	2024-07-23 13:03:09.782	2024-08-11 06:41:42.069494
57	Ashton	IL	-89.22088	41.867058	2024-07-23 13:03:09.782	2024-08-11 06:41:42.27443
59	Astoria	IL	-90.35856	40.226933	2024-07-23 13:03:09.782	2024-08-11 06:41:42.652539
60	Athens	IL	-89.72394	39.96059	2024-07-23 13:03:09.782	2024-08-11 06:41:42.855706
61	Atkinson	IL	-90.01528	41.42098	2024-07-23 13:03:09.782	2024-08-11 06:41:43.040439
62	Atlanta	IL	-89.23258	40.25976	2024-07-23 13:03:09.782	2024-08-11 06:41:43.264987
63	Atwood	IL	-87.628191	41.883205	2024-07-23 13:03:09.782	2024-08-11 06:41:43.513146
64	Auburn	IL	-89.74547	39.591095	2024-07-23 13:03:09.782	2024-08-11 06:41:43.723831
65	Augusta	IL	-90.94991	40.23022	2024-07-23 13:03:09.782	2024-08-11 06:41:43.913706
66	Aurora	IL	-88.31292	41.757072	2024-07-23 13:03:09.782	2024-08-11 06:41:44.119863
67	Ava	IL	-89.49687	37.888397	2024-07-23 13:03:09.782	2024-08-11 06:41:44.313963
69	Avon	IL	-90.43502	40.66201	2024-07-23 13:03:09.782	2024-08-11 06:41:44.667078
70	Baileyville	IL	-89.59613	42.19947	2024-07-23 13:03:09.782	2024-08-11 06:41:44.83155
71	Baldwin	IL	-89.842735	38.18305	2024-07-23 13:03:09.782	2024-08-11 06:41:45.021076
72	Banner	IL	-89.90861	40.516975	2024-07-23 13:03:09.782	2024-08-11 06:41:45.216126
73	Bannockburn	IL	-87.86662	42.193527	2024-07-23 13:03:09.782	2024-08-11 06:41:45.386202
74	Bardolph	IL	-90.560941	40.492098	2024-07-23 13:03:09.782	2024-08-11 06:41:45.560738
75	Barnhill	IL	-88.36425	38.284363	2024-07-23 13:03:09.782	2024-08-11 06:41:45.724881
76	Barrington	IL	-88.136086	42.15421	2024-07-23 13:03:09.782	2024-08-11 06:41:45.950286
77	Barrington Hills	IL	-88.15558	42.144756	2024-07-23 13:03:09.782	2024-08-11 06:41:46.103844
78	Barry	IL	-91.03924	39.69449	2024-07-23 13:03:09.782	2024-08-11 06:41:46.313994
80	Bartelso	IL	-89.46683	38.536484	2024-07-23 13:03:09.782	2024-08-11 06:41:46.72035
81	Bartlett	IL	-88.18558	41.992226	2024-07-23 13:03:09.782	2024-08-11 06:41:46.91522
82	Bartonville	IL	-89.652695	40.65018	2024-07-23 13:03:09.782	2024-08-11 06:41:47.12304
83	Basco	IL	-87.752624	41.431625	2024-07-23 13:03:09.782	2024-08-11 06:41:47.379305
84	Batavia	IL	-88.308174	41.849995	2024-07-23 13:03:09.782	2024-08-11 06:41:47.578712
85	Batchtown	IL	-90.65439	39.03279	2024-07-23 13:03:09.782	2024-08-11 06:41:47.759008
86	Bath	IL	-90.14339	40.19114	2024-07-23 13:03:09.782	2024-08-11 06:41:48.037933
87	Bay View Gardens	IL	-89.52213	40.809032	2024-07-23 13:03:09.782	2024-08-11 06:41:48.201581
88	Baylis	IL	-90.907585	39.72862	2024-07-23 13:03:09.782	2024-08-11 06:41:48.392219
89	Beach Park	IL	-87.858055	42.421055	2024-07-23 13:03:09.782	2024-08-11 06:41:48.592718
90	Beardstown	IL	-90.433204	40.015885	2024-07-23 13:03:09.782	2024-08-11 06:41:48.776821
91	Beason	IL	-89.19321	40.143463	2024-07-23 13:03:09.782	2024-08-11 06:41:48.947644
93	Beckemeyer	IL	-89.4359	38.609108	2024-07-23 13:03:09.782	2024-08-11 06:41:49.306302
94	Bedford Park	IL	-87.81631	41.773685	2024-07-23 13:03:09.782	2024-08-11 06:41:49.517159
95	Beecher	IL	-87.62134	41.340733	2024-07-23 13:03:09.782	2024-08-11 06:41:49.704837
96	Beecher City	IL	-88.781136	39.18711	2024-07-23 13:03:09.782	2024-08-11 06:41:49.865235
97	Belgium	IL	-87.63763	40.06253	2024-07-23 13:03:09.782	2024-08-11 06:41:50.052137
98	Belknap	IL	-88.93952	37.32321	2024-07-23 13:03:09.782	2024-08-11 06:41:50.227238
99	Belle Prairie City	IL	-88.555504	38.222404	2024-07-23 13:03:09.782	2024-08-11 06:41:50.398431
100	Belle Rive	IL	-88.74054	38.229958	2024-07-23 13:03:09.782	2024-08-11 06:41:50.568231
102	Bellevue	IL	-89.682816	40.68873	2024-07-23 13:03:09.782	2024-08-11 06:41:50.953775
103	Bellflower	IL	-88.52689	40.341896	2024-07-23 13:03:09.782	2024-08-11 06:41:51.156158
104	Bellmont	IL	-87.91165	38.384434	2024-07-23 13:03:09.782	2024-08-11 06:41:51.369481
105	Bellwood	IL	-87.88327	41.882534	2024-07-23 13:03:09.782	2024-08-11 06:41:51.561513
106	Belvidere	IL	-88.8411	42.257217	2024-07-23 13:03:09.782	2024-08-11 06:41:51.774024
107	Bement	IL	-88.572205	39.92215	2024-07-23 13:03:09.782	2024-08-11 06:41:51.944548
108	Benld	IL	-89.803566	39.09307	2024-07-23 13:03:09.782	2024-08-11 06:41:52.141277
109	Bensenville	IL	-87.94109	41.95664	2024-07-23 13:03:09.782	2024-08-11 06:41:52.299748
110	Benson	IL	-89.12072	40.849987	2024-07-23 13:03:09.782	2024-08-11 06:41:52.513965
111	Bentley	IL	-91.1118	40.34427	2024-07-23 13:03:09.782	2024-08-11 06:41:52.70205
113	Berkeley	IL	-87.90686	41.889397	2024-07-23 13:03:09.782	2024-08-11 06:41:53.152486
114	Berlin	IL	-89.593541	40.695367	2024-07-23 13:03:09.782	2024-08-11 06:41:53.357133
115	Berwick	IL	-90.53808	40.798996	2024-07-23 13:03:09.782	2024-08-11 06:41:53.64596
116	Berwyn	IL	-87.793335	41.850567	2024-07-23 13:03:09.782	2024-08-11 06:41:53.854043
117	Bethalto	IL	-90.040634	38.91001	2024-07-23 13:03:09.782	2024-08-11 06:41:54.044723
118	Bethany	IL	-88.739426	39.645473	2024-07-23 13:03:09.782	2024-08-11 06:41:54.261457
119	Beverly	IL	-87.669136	41.72119	2024-07-23 13:03:09.782	2024-08-11 06:41:54.460436
120	Big Rock	IL	-88.047996	41.823865	2024-07-23 13:03:09.782	2024-08-11 06:41:54.627522
121	Biggsville	IL	-90.86434	40.854862	2024-07-23 13:03:09.782	2024-08-11 06:41:54.801342
122	Bingham	IL	-89.213776	39.114468	2024-07-23 13:03:09.782	2024-08-11 06:41:54.983553
123	Bishop Hill	IL	-90.1188	41.201065	2024-07-23 13:03:09.782	2024-08-11 06:41:55.150437
124	Bismarck	IL	-87.60801	40.264023	2024-07-23 13:03:09.782	2024-08-11 06:41:55.341879
125	Blackstone	IL	-88.69079	41.08493	2024-07-23 13:03:09.782	2024-08-11 06:41:55.536545
127	Blandinsville	IL	-90.86624	40.556038	2024-07-23 13:03:09.782	2024-08-11 06:41:55.907381
128	Bloomfield	IL	-88.874954	37.452484	2024-07-23 13:03:09.782	2024-08-11 06:41:56.107924
129	Bloomingdale	IL	-88.081154	41.957626	2024-07-23 13:03:09.782	2024-08-11 06:41:56.316875
130	Bloomington	IL	-88.99279	40.48239	2024-07-23 13:03:09.782	2024-08-11 06:41:56.52423
131	Blue Island	IL	-87.68008	41.655437	2024-07-23 13:03:09.782	2024-08-11 06:41:56.688247
132	Blue Mound	IL	-89.12127	39.699196	2024-07-23 13:03:09.782	2024-08-11 06:41:56.874264
133	Bluff Springs	IL	-90.345955	39.987827	2024-07-23 13:03:09.782	2024-08-11 06:41:57.029249
134	Bluffs	IL	-90.5352	39.750282	2024-07-23 13:03:09.782	2024-08-11 06:41:57.200505
135	Bluford	IL	-88.725784	38.33091	2024-07-23 13:03:09.782	2024-08-11 06:41:57.370004
137	Bondville	IL	-88.369576	40.11316	2024-07-23 13:03:09.784	2024-08-11 06:41:57.713413
138	Bone Gap	IL	-87.995964	38.447235	2024-07-23 13:03:09.784	2024-08-11 06:41:57.871108
139	Bonfield	IL	-88.05611	41.146782	2024-07-23 13:03:09.784	2024-08-11 06:41:58.055421
140	Bonnie	IL	-88.90325	38.204414	2024-07-23 13:03:09.784	2024-08-11 06:41:58.254833
141	Bonnie Brae	IL	-88.02963	41.60054	2024-07-23 13:03:09.784	2024-08-11 06:41:58.44389
142	Boody	IL	-89.04873	39.76656	2024-07-23 13:03:09.784	2024-08-11 06:41:58.633889
143	Boulder Hill	IL	-88.33676	41.712757	2024-07-23 13:03:09.784	2024-08-11 06:41:58.805233
144	Bourbonnais	IL	-87.88442	41.16407	2024-07-23 13:03:09.784	2024-08-11 06:41:58.982617
145	Bowen	IL	-91.06465	40.23159	2024-07-23 13:03:09.784	2024-08-11 06:41:59.205311
146	Braceville	IL	-88.264175	41.22486	2024-07-23 13:03:09.784	2024-08-11 06:41:59.381881
148	Bradley	IL	-87.86492	41.142387	2024-07-23 13:03:09.784	2024-08-11 06:41:59.793165
149	Braidwood	IL	-88.21204	41.26442	2024-07-23 13:03:09.784	2024-08-11 06:41:59.984803
150	Breese	IL	-89.5275	38.60874	2024-07-23 13:03:09.784	2024-08-11 06:42:00.18025
151	Bridgeport	IL	-87.64618	41.8344	2024-07-23 13:03:09.784	2024-08-11 06:42:00.359153
152	Bridgeview	IL	-87.80464	41.74981	2024-07-23 13:03:09.784	2024-08-11 06:42:00.564101
153	Brighton	IL	-90.14156	39.039154	2024-07-23 13:03:09.784	2024-08-11 06:42:01.058584
154	Brimfield	IL	-89.88456	40.838837	2024-07-23 13:03:09.784	2024-08-11 06:42:01.220445
155	Bristol	IL	-87.677758	41.921223	2024-07-23 13:03:09.784	2024-08-11 06:42:01.416897
156	Broadlands	IL	-87.99617	39.908318	2024-07-23 13:03:09.784	2024-08-11 06:42:01.632745
157	Broadview	IL	-87.85426	41.86402	2024-07-23 13:03:09.784	2024-08-11 06:42:01.834909
158	Broadwell	IL	-89.44291	40.068516	2024-07-23 13:03:09.784	2024-08-11 06:42:02.01459
159	Brocton	IL	-87.934814	39.715366	2024-07-23 13:03:09.784	2024-08-11 06:42:02.23767
160	Brookfield	IL	-87.84399	41.822277	2024-07-23 13:03:09.784	2024-08-11 06:42:02.445273
161	Brooklyn	IL	-90.1677	38.65736	2024-07-23 13:03:09.784	2024-08-11 06:42:02.6455
162	Brookport	IL	-88.62752	37.1237	2024-07-23 13:03:09.784	2024-08-11 06:42:02.818651
163	Broughton	IL	-88.463936	37.93471	2024-07-23 13:03:09.784	2024-08-11 06:42:03.013916
164	Browning	IL	-90.37191	40.128757	2024-07-23 13:03:09.784	2024-08-11 06:42:03.209399
165	Browns	IL	-87.98321	38.375984	2024-07-23 13:03:09.784	2024-08-11 06:42:03.401469
167	Brussels	IL	-90.58813	38.949547	2024-07-23 13:03:09.784	2024-08-11 06:42:03.736893
168	Bryant	IL	-90.09548	40.46614	2024-07-23 13:03:09.784	2024-08-11 06:42:03.935158
169	Buckingham	IL	-87.617945	41.884708	2024-07-23 13:03:09.784	2024-08-11 06:42:04.133102
170	Buckley	IL	-88.037	40.599613	2024-07-23 13:03:09.784	2024-08-11 06:42:04.353624
171	Buckner	IL	-89.01744	37.982906	2024-07-23 13:03:09.784	2024-08-11 06:42:04.564525
172	Buda	IL	-89.67926	41.326744	2024-07-23 13:03:09.784	2024-08-11 06:42:04.774661
173	Buffalo	IL	-89.40827	39.852455	2024-07-23 13:03:09.784	2024-08-11 06:42:04.979759
174	Buffalo Grove	IL	-87.95915	42.154057	2024-07-23 13:03:09.784	2024-08-11 06:42:05.147172
175	Buffalo Prairie	IL	-90.8547	41.338562	2024-07-23 13:03:09.784	2024-08-11 06:42:05.32182
176	Bull Valley	IL	-88.35256	42.299686	2024-07-23 13:03:09.784	2024-08-11 06:42:05.510487
178	Buncombe	IL	-88.9768	37.471626	2024-07-23 13:03:09.784	2024-08-11 06:42:05.87239
179	Bunker Hill	IL	-89.9515	39.0429	2024-07-23 13:03:09.784	2024-08-11 06:42:06.072278
180	Burbank	IL	-87.76876	41.741352	2024-07-23 13:03:09.784	2024-08-11 06:42:06.269967
181	Bureau	IL	-89.366835	41.28905	2024-07-23 13:03:09.784	2024-08-11 06:42:06.47747
182	Bureau Junction	IL	-89.36829	41.29045	2024-07-23 13:03:09.784	2024-08-11 06:42:06.648544
183	Burlington	IL	-87.713049	41.924629	2024-07-23 13:03:09.784	2024-08-11 06:42:06.851852
184	Burnham	IL	-87.55679	41.639023	2024-07-23 13:03:09.784	2024-08-11 06:42:07.039676
185	Burnt Prairie	IL	-88.256546	38.25086	2024-07-23 13:03:09.784	2024-08-11 06:42:07.200091
186	Burr Ridge	IL	-87.91196	41.75159	2024-07-23 13:03:09.784	2024-08-11 06:42:07.38909
187	Burton	IL	-87.676475	41.910063	2024-07-23 13:03:09.784	2024-08-11 06:42:07.615215
188	Burtons Bridge	IL	-88.22973	42.27944	2024-07-23 13:03:09.784	2024-08-11 06:42:07.785133
189	Bush	IL	-89.13128	37.843422	2024-07-23 13:03:09.784	2024-08-11 06:42:07.97495
191	Butler	IL	-89.53566	39.19669	2024-07-23 13:03:09.784	2024-08-11 06:42:08.350742
192	Byron	IL	-89.25603	42.126656	2024-07-23 13:03:09.784	2024-08-11 06:42:08.561044
193	Cabery	IL	-88.20874	40.995613	2024-07-23 13:03:09.784	2024-08-11 06:42:08.748879
194	Cable	IL	-90.5073	41.283962	2024-07-23 13:03:09.784	2024-08-11 06:42:08.932283
195	Cahokia Heights	IL	-90.19017	38.56978	2024-07-23 13:03:09.784	2024-08-11 06:42:09.116965
196	Cairo	IL	-89.1711	37.001987	2024-07-23 13:03:09.784	2024-08-11 06:42:09.326478
197	Caledonia	IL	-88.89281	42.369766	2024-07-23 13:03:09.784	2024-08-11 06:42:09.553535
198	Calhoun	IL	-88.04219	38.651134	2024-07-23 13:03:09.784	2024-08-11 06:42:09.745207
200	Calumet Park	IL	-87.65726	41.663	2024-07-23 13:03:09.784	2024-08-11 06:42:10.114397
201	Camargo	IL	-88.163795	39.799854	2024-07-23 13:03:09.784	2024-08-11 06:42:10.320531
202	Cambria	IL	-89.11927	37.784374	2024-07-23 13:03:09.784	2024-08-11 06:42:10.526103
203	Cambridge	IL	-90.192764	41.303867	2024-07-23 13:03:09.784	2024-08-11 06:42:10.737096
204	Camden	IL	-90.46067	38.97185	2024-07-23 13:03:09.784	2024-08-11 06:42:10.951251
205	Cameron	IL	-87.717889	41.904032	2024-07-23 13:03:09.784	2024-08-11 06:42:11.162085
206	Camp Grove	IL	-89.63319	41.078186	2024-07-23 13:03:09.784	2024-08-11 06:42:11.369521
207	Camp Point	IL	-91.06452	40.039925	2024-07-23 13:03:09.784	2024-08-11 06:42:11.560434
209	Campbell's Island	IL	-90.430374	41.54056	2024-07-23 13:03:09.784	2024-08-11 06:42:11.920851
210	Campton Hills	IL	-88.39866	41.93626	2024-07-23 13:03:09.784	2024-08-11 06:42:12.08477
211	Campus	IL	-88.30577	41.025593	2024-07-23 13:03:09.784	2024-08-11 06:42:12.27173
212	Candlewick Lake	IL	-88.877404	42.353028	2024-07-23 13:03:09.784	2024-08-11 06:42:12.435825
213	Canton	IL	-90.03359	40.557114	2024-07-23 13:03:09.784	2024-08-11 06:42:12.652191
214	Cantrall	IL	-89.67418	39.938972	2024-07-23 13:03:09.784	2024-08-11 06:42:12.817737
215	Capron	IL	-88.74051	42.3994	2024-07-23 13:03:09.784	2024-08-11 06:42:13.009539
216	Carbon Cliff	IL	-90.39038	41.493973	2024-07-23 13:03:09.784	2024-08-11 06:42:13.162504
218	Carbondale	IL	-89.21698	37.727222	2024-07-23 13:03:09.784	2024-08-11 06:42:13.509017
219	Carlinville	IL	-89.88158	39.279385	2024-07-23 13:03:09.784	2024-08-11 06:42:13.682817
220	Carlock	IL	-89.1319	40.582317	2024-07-23 13:03:09.784	2024-08-11 06:42:13.856522
221	Carlyle	IL	-89.37024	38.610184	2024-07-23 13:03:09.784	2024-08-11 06:42:14.060978
222	Carman	IL	-91.05983	40.740692	2024-07-23 13:03:09.784	2024-08-11 06:42:14.26638
223	Carmi	IL	-88.16116	38.08938	2024-07-23 13:03:09.784	2024-08-11 06:42:14.48019
224	Carol Stream	IL	-88.13468	41.912464	2024-07-23 13:03:09.786	2024-08-11 06:42:14.670306
225	Carpentersville	IL	-88.25793	42.121017	2024-07-23 13:03:09.786	2024-08-11 06:42:14.835697
226	Carrier Mills	IL	-88.634445	37.683735	2024-07-23 13:03:09.786	2024-08-11 06:42:15.024314
227	Carrollton	IL	-90.40762	39.30217	2024-07-23 13:03:09.786	2024-08-11 06:42:15.208988
229	Carthage	IL	-91.1363	40.413696	2024-07-23 13:03:09.786	2024-08-11 06:42:15.585218
230	Cary	IL	-88.24073	42.20902	2024-07-23 13:03:09.787	2024-08-11 06:42:15.804944
231	Casey	IL	-87.992836	39.299297	2024-07-23 13:03:09.787	2024-08-11 06:42:16.033569
232	Caseyville	IL	-90.02563	38.636578	2024-07-23 13:03:09.787	2024-08-11 06:42:16.216001
233	Castleton	IL	-89.70629	41.117992	2024-07-23 13:03:09.787	2024-08-11 06:42:16.418788
234	Catlin	IL	-87.703094	40.06511	2024-07-23 13:03:09.787	2024-08-11 06:42:16.608215
235	Cave In Rock	IL	-88.16063	37.467677	2024-07-23 13:03:09.787	2024-08-11 06:42:16.76581
236	Cave-In-Rock	IL	-88.16063	37.467677	2024-07-23 13:03:09.787	2024-08-11 06:42:16.928681
237	Cedar Point	IL	-89.125885	41.262253	2024-07-23 13:03:09.787	2024-08-11 06:42:17.106175
238	Cedarville	IL	-89.637276	42.37749	2024-07-23 13:03:09.787	2024-08-11 06:42:17.290033
240	Centralia	IL	-89.13321	38.52615	2024-07-23 13:03:09.787	2024-08-11 06:42:17.658582
241	Cerro Gordo	IL	-88.73048	39.890594	2024-07-23 13:03:09.787	2024-08-11 06:42:17.828347
242	Chadwick	IL	-89.89019	42.014614	2024-07-23 13:03:09.787	2024-08-11 06:42:18.044685
243	Chambersburg	IL	-90.6569	39.816494	2024-07-23 13:03:09.787	2024-08-11 06:42:18.204934
244	Champaign	IL	-88.243515	40.116302	2024-07-23 13:03:09.787	2024-08-11 06:42:18.39678
245	Chana	IL	-89.220146	41.98023	2024-07-23 13:03:09.787	2024-08-11 06:42:18.582475
246	Chandlerville	IL	-90.15156	40.048096	2024-07-23 13:03:09.787	2024-08-11 06:42:18.771265
247	Channahon	IL	-88.22849	41.429665	2024-07-23 13:03:09.787	2024-08-11 06:42:18.951991
248	Channel Lake	IL	-88.1379	42.478104	2024-07-23 13:03:09.787	2024-08-11 06:42:19.116385
249	Chapin	IL	-90.40108	39.765713	2024-07-23 13:03:09.787	2024-08-11 06:42:19.316868
250	Charleston	IL	-88.17581	39.496033	2024-07-23 13:03:09.787	2024-08-11 06:42:19.523223
251	Chatham	IL	-87.60509	41.74579	2024-07-23 13:03:09.788	2024-08-11 06:42:19.783092
252	Chatsworth	IL	-88.29033	40.75291	2024-07-23 13:03:09.789	2024-08-11 06:42:19.979738
253	Chebanse	IL	-87.90929	41.000477	2024-07-23 13:03:09.789	2024-08-11 06:42:20.138987
254	Chemung	IL	-88.667114	42.415524	2024-07-23 13:03:09.789	2024-08-11 06:42:20.301192
255	Chenoa	IL	-88.71856	40.74262	2024-07-23 13:03:09.789	2024-08-11 06:42:20.477872
257	Cherry Valley	IL	-88.953354	42.235596	2024-07-23 13:03:09.789	2024-08-11 06:42:20.873173
258	Chester	IL	-89.82089	37.914085	2024-07-23 13:03:09.789	2024-08-11 06:42:21.089866
259	Chesterfield	IL	-90.063705	39.2538	2024-07-23 13:03:09.789	2024-08-11 06:42:21.269145
260	Chestnut	IL	-89.10932	42.27492	2024-07-23 13:03:09.789	2024-08-11 06:42:21.459513
261	Chicago	IL	-87.63236	41.881954	2024-07-23 13:03:09.789	2024-08-11 06:42:21.66038
262	Chicago Heights	IL	-87.63547	41.5062	2024-07-23 13:03:09.789	2024-08-11 06:42:21.81729
263	Chicago Ridge	IL	-87.779106	41.697685	2024-07-23 13:03:09.789	2024-08-11 06:42:22.034428
264	Chillicothe	IL	-89.48765	40.918915	2024-07-23 13:03:09.789	2024-08-11 06:42:22.217056
265	Chrisman	IL	-87.67908	39.804447	2024-07-23 13:03:09.789	2024-08-11 06:42:22.419413
266	Christopher	IL	-89.05352	37.972607	2024-07-23 13:03:09.789	2024-08-11 06:42:22.60352
268	Cisco	IL	-88.72607	40.01154	2024-07-23 13:03:09.789	2024-08-11 06:42:22.999858
269	Cisne	IL	-88.434784	38.5156	2024-07-23 13:03:09.789	2024-08-11 06:42:23.179171
270	Cissna Park	IL	-87.89265	40.563908	2024-07-23 13:03:09.789	2024-08-11 06:42:23.373534
271	Clare	IL	-88.829506	42.016	2024-07-23 13:03:09.789	2024-08-11 06:42:23.582133
272	Claremont	IL	-87.97156	38.719536	2024-07-23 13:03:09.789	2024-08-11 06:42:23.768483
273	Clarendon Hills	IL	-87.955986	41.796497	2024-07-23 13:03:09.789	2024-08-11 06:42:23.935764
274	Clay City	IL	-88.35409	38.68767	2024-07-23 13:03:09.789	2024-08-11 06:42:24.127123
275	Clayton	IL	-87.640164	41.886214	2024-07-23 13:03:09.789	2024-08-11 06:42:24.361005
276	Claytonville	IL	-87.822426	40.56687	2024-07-23 13:03:09.789	2024-08-11 06:42:24.544884
277	Cleveland	IL	-90.31483	41.50632	2024-07-23 13:03:09.789	2024-08-11 06:42:24.750494
278	Clifton	IL	-87.935005	40.93305	2024-07-23 13:03:09.789	2024-08-11 06:42:24.955656
279	Clinton	IL	-88.96114	40.152714	2024-07-23 13:03:09.789	2024-08-11 06:42:25.169104
281	Coal Valley	IL	-90.465805	41.4526	2024-07-23 13:03:09.789	2024-08-11 06:42:25.592173
282	Coalton	IL	-87.592224	40.431393	2024-07-23 13:03:09.789	2024-08-11 06:42:25.792507
283	Coatsburg	IL	-91.1622	40.03211	2024-07-23 13:03:09.789	2024-08-11 06:42:25.97066
284	Cobden	IL	-89.25354	37.53261	2024-07-23 13:03:09.789	2024-08-11 06:42:26.154958
285	Coello	IL	-89.067493	37.994261	2024-07-23 13:03:09.789	2024-08-11 06:42:26.326514
286	Coffeen	IL	-89.39272	39.090942	2024-07-23 13:03:09.789	2024-08-11 06:42:26.63698
287	Colchester	IL	-90.793304	40.426285	2024-07-23 13:03:09.789	2024-08-11 06:42:26.816981
288	Coleta	IL	-89.80201	41.902153	2024-07-23 13:03:09.789	2024-08-11 06:42:27.011403
289	Colfax	IL	-88.61617	40.56699	2024-07-23 13:03:09.789	2024-08-11 06:42:27.262383
290	Collinsville	IL	-89.984757	38.670472	2024-07-23 13:03:09.789	2024-08-11 06:42:27.443104
291	Collison	IL	-87.80526	40.22477	2024-07-23 13:03:09.789	2024-08-11 06:42:27.632119
292	Colona	IL	-90.357994	41.478706	2024-07-23 13:03:09.789	2024-08-11 06:42:27.829149
294	Columbia	IL	-90.19978	38.442905	2024-07-23 13:03:09.789	2024-08-11 06:42:28.265375
295	Columbus	IL	-91.147255	39.988525	2024-07-23 13:03:09.789	2024-08-11 06:42:28.469574
296	Como	IL	-89.76694	41.76639	2024-07-23 13:03:09.789	2024-08-11 06:42:28.664032
298	Concord	IL	-88.945915	39.862106	2024-07-23 13:03:09.789	2024-08-11 06:42:29.084453
299	Congerville	IL	-89.19844	40.617287	2024-07-23 13:03:09.789	2024-08-11 06:42:29.257937
300	Cooksville	IL	-88.71686	40.542793	2024-07-23 13:03:09.789	2024-08-11 06:42:29.422872
301	Cordova	IL	-90.31607	41.677837	2024-07-23 13:03:09.789	2024-08-11 06:42:29.633458
302	Cornell	IL	-88.729294	40.98965	2024-07-23 13:03:09.789	2024-08-11 06:42:29.819112
303	Cornland	IL	-89.40104	39.937374	2024-07-23 13:03:09.789	2024-08-11 06:42:30.015478
304	Cortland	IL	-88.68876	41.92075	2024-07-23 13:03:09.789	2024-08-11 06:42:30.225468
306	Coulterville	IL	-89.603806	38.186317	2024-07-23 13:03:09.789	2024-08-11 06:42:30.580091
307	Country Club Hills	IL	-87.72072	41.567352	2024-07-23 13:03:09.789	2024-08-11 06:42:30.770332
308	Countryside	IL	-87.877106	41.782997	2024-07-23 13:03:09.789	2024-08-11 06:42:30.962248
309	Cowden	IL	-88.861694	39.250343	2024-07-23 13:03:09.789	2024-08-11 06:42:31.184592
310	Coyne Center	IL	-90.56165	41.406563	2024-07-23 13:03:09.789	2024-08-11 06:42:31.352054
311	Crab Orchard	IL	-88.80383	37.729527	2024-07-23 13:03:09.789	2024-08-11 06:42:31.52734
312	Crainville	IL	-89.067825	37.75182	2024-07-23 13:03:09.789	2024-08-11 06:42:31.823903
313	Creal Springs	IL	-88.836845	37.61949	2024-07-23 13:03:09.789	2024-08-11 06:42:32.014541
315	Crest Hill	IL	-88.09821	41.55414	2024-07-23 13:03:09.789	2024-08-11 06:42:32.363135
316	Creston	IL	-88.96162	41.935143	2024-07-23 13:03:09.789	2024-08-11 06:42:32.56191
317	Crestwood	IL	-87.75225	41.661453	2024-07-23 13:03:09.789	2024-08-11 06:42:32.75237
318	Crete	IL	-87.6313	41.44462	2024-07-23 13:03:09.789	2024-08-11 06:42:32.94058
319	Creve Coeur	IL	-89.591194	40.648235	2024-07-23 13:03:09.789	2024-08-11 06:42:33.13016
320	Cropsey	IL	-88.47854	40.608833	2024-07-23 13:03:09.789	2024-08-11 06:42:33.310633
321	Crossville	IL	-88.066246	38.16163	2024-07-23 13:03:09.789	2024-08-11 06:42:33.50093
322	Crystal Lake	IL	-88.31828	42.24205	2024-07-23 13:03:09.789	2024-08-11 06:42:33.694745
323	Crystal Lawns	IL	-88.158936	41.57048	2024-07-23 13:03:09.789	2024-08-11 06:42:33.866576
324	Cuba	IL	-90.195755	40.492943	2024-07-23 13:03:09.789	2024-08-11 06:42:34.067509
325	Cullom	IL	-88.2688	40.877987	2024-07-23 13:03:09.789	2024-08-11 06:42:34.2829
327	Custer Park	IL	-88.130356	41.24537	2024-07-23 13:03:09.789	2024-08-11 06:42:34.667322
328	Cutler	IL	-89.56557	38.02866	2024-07-23 13:03:09.789	2024-08-11 06:42:34.846055
329	Cypress	IL	-89.01551	37.365227	2024-07-23 13:03:09.789	2024-08-11 06:42:35.053034
330	Dahinda	IL	-90.109146	40.924995	2024-07-23 13:03:09.789	2024-08-11 06:42:35.272896
331	Dahlgren	IL	-88.68466	38.198833	2024-07-23 13:03:09.789	2024-08-11 06:42:35.452219
332	Dakota	IL	-89.52508	42.388844	2024-07-23 13:03:09.789	2024-08-11 06:42:35.640869
333	Dale	IL	-88.49149	37.994804	2024-07-23 13:03:09.789	2024-08-11 06:42:35.847397
334	Dallas City	IL	-91.167564	40.636276	2024-07-23 13:03:09.789	2024-08-11 06:42:36.010971
336	Dalzell	IL	-89.16796	41.35567	2024-07-23 13:03:09.789	2024-08-11 06:42:36.359118
337	Damiansville	IL	-89.623566	38.51014	2024-07-23 13:03:09.789	2024-08-11 06:42:36.537626
338	Dana	IL	-88.95049	40.956745	2024-07-23 13:03:09.789	2024-08-11 06:42:36.771007
339	Danforth	IL	-87.97727	40.82225	2024-07-23 13:03:09.789	2024-08-11 06:42:36.979492
340	Danvers	IL	-89.17733	40.52853	2024-07-23 13:03:09.789	2024-08-11 06:42:37.151122
341	Danville	IL	-87.629974	40.124454	2024-07-23 13:03:09.789	2024-08-11 06:42:37.34602
342	Darien	IL	-87.9739	41.751747	2024-07-23 13:03:09.789	2024-08-11 06:42:37.536222
343	Davis	IL	-89.41961	42.424664	2024-07-23 13:03:09.789	2024-08-11 06:42:37.727965
344	Davis Junction	IL	-89.09435	42.101448	2024-07-23 13:03:09.789	2024-08-11 06:42:37.894302
345	Dawson	IL	-87.647411	41.891132	2024-07-23 13:03:09.789	2024-08-11 06:42:38.09358
347	De Land	IL	-88.645226	40.121346	2024-07-23 13:03:09.789	2024-08-11 06:42:38.500298
348	De Pue	IL	-89.306274	41.32422	2024-07-23 13:03:09.789	2024-08-11 06:42:38.641046
349	De Soto	IL	-89.230515	37.817467	2024-07-23 13:03:09.789	2024-08-11 06:42:38.81423
350	De Witt	IL	-88.785752	40.183421	2024-07-23 13:03:09.789	2024-08-11 06:42:38.994683
351	Decatur	IL	-88.955894	39.841415	2024-07-23 13:03:09.789	2024-08-11 06:42:39.2216
352	Deer Creek	IL	-89.3325	40.627563	2024-07-23 13:03:09.789	2024-08-11 06:42:39.403289
353	Deer Grove	IL	-89.68938	41.60772	2024-07-23 13:03:09.789	2024-08-11 06:42:39.587697
354	Deer Park	IL	-88.08125	42.161167	2024-07-23 13:03:09.789	2024-08-11 06:42:39.805802
355	Deerfield	IL	-87.84576	42.16731	2024-07-23 13:03:09.789	2024-08-11 06:42:39.994765
356	DeKalb	IL	-88.752716	41.930332	2024-07-23 13:03:09.789	2024-08-11 06:42:40.214498
357	Delavan	IL	-89.54722	40.372463	2024-07-23 13:03:09.789	2024-08-11 06:42:40.397802
358	Dennison	IL	-87.59795	39.46073	2024-07-23 13:03:09.789	2024-08-11 06:42:40.589024
359	Depue	IL	-89.306274	41.32422	2024-07-23 13:03:09.789	2024-08-11 06:42:40.799218
361	Detroit	IL	-90.67576	39.6202	2024-07-23 13:03:09.789	2024-08-11 06:42:41.20268
362	Dewey	IL	-88.283615	40.31891	2024-07-23 13:03:09.789	2024-08-11 06:42:41.39377
363	Dewitt	IL	-88.78604	40.180393	2024-07-23 13:03:09.789	2024-08-11 06:42:41.586145
364	Diamond	IL	-88.25138	41.2885	2024-07-23 13:03:09.789	2024-08-11 06:42:41.781022
365	Dieterich	IL	-88.38	39.06032	2024-07-23 13:03:09.789	2024-08-11 06:42:41.953724
366	Divernon	IL	-89.658516	39.564545	2024-07-23 13:03:09.789	2024-08-11 06:42:42.132349
367	Dix	IL	-88.93774	38.441776	2024-07-23 13:03:09.789	2024-08-11 06:42:42.315241
368	Dixmoor	IL	-87.6609	41.62989	2024-07-23 13:03:09.789	2024-08-11 06:42:42.486374
369	Dixon	IL	-89.48268	41.843597	2024-07-23 13:03:09.789	2024-08-11 06:42:42.67362
370	Dolton	IL	-87.607544	41.637108	2024-07-23 13:03:09.789	2024-08-11 06:42:42.872646
371	Dongola	IL	-89.16539	37.361355	2024-07-23 13:03:09.789	2024-08-11 06:42:43.05843
372	Donnellson	IL	-89.473335	39.029808	2024-07-23 13:03:09.789	2024-08-11 06:42:43.238565
374	Dorchester	IL	-87.579935	41.614714	2024-07-23 13:03:09.789	2024-08-11 06:42:43.636393
375	Dorsey	IL	-90.00135	38.97364	2024-07-23 13:03:09.789	2024-08-11 06:42:43.854381
376	Dover	IL	-89.39358	41.435738	2024-07-23 13:03:09.789	2024-08-11 06:42:44.060748
377	Dow	IL	-90.34237	39.012802	2024-07-23 13:03:09.789	2024-08-11 06:42:44.231875
378	Dowell	IL	-89.237656	37.940052	2024-07-23 13:03:09.789	2024-08-11 06:42:44.414581
379	Downers Grove	IL	-88.01022	41.792923	2024-07-23 13:03:09.789	2024-08-11 06:42:44.59413
380	Downs	IL	-88.87244	40.39636	2024-07-23 13:03:09.789	2024-08-11 06:42:44.781084
381	Du Bois	IL	-89.21313	38.223885	2024-07-23 13:03:09.789	2024-08-11 06:42:44.961392
382	Du Quoin	IL	-89.237434	38.010082	2024-07-23 13:03:09.789	2024-08-11 06:42:45.128102
383	Dundas	IL	-88.08497	38.83397	2024-07-23 13:03:09.789	2024-08-11 06:42:45.321681
385	Dunfermline	IL	-90.032074	40.491287	2024-07-23 13:03:09.789	2024-08-11 06:42:45.735896
386	Dunlap	IL	-89.67443	40.860703	2024-07-23 13:03:09.789	2024-08-11 06:42:45.94761
387	Dupo	IL	-90.210754	38.519337	2024-07-23 13:03:09.789	2024-08-11 06:42:46.143843
388	Durand	IL	-89.332	42.43709	2024-07-23 13:03:09.789	2024-08-11 06:42:46.350401
389	Dwight	IL	-88.42713	41.091885	2024-07-23 13:03:09.789	2024-08-11 06:42:46.579719
390	Eagarville	IL	-89.78422	39.111847	2024-07-23 13:03:09.789	2024-08-11 06:42:46.760622
391	Eagle Lake	IL	-87.55199	41.366978	2024-07-23 13:03:09.789	2024-08-11 06:42:46.963535
392	Earlville	IL	-88.9218	41.590374	2024-07-23 13:03:09.789	2024-08-11 06:42:47.148398
393	East Alton	IL	-90.1106	38.883694	2024-07-23 13:03:09.789	2024-08-11 06:42:47.313132
395	East Cape Girardeau	IL	-89.4964	37.295788	2024-07-23 13:03:09.789	2024-08-11 06:42:47.650067
397	East Dubuque	IL	-90.642624	42.491695	2024-07-23 13:03:09.789	2024-08-11 06:42:47.96939
398	East Dundee	IL	-88.27463	42.10193	2024-07-23 13:03:09.79	2024-08-11 06:42:48.152478
399	East Galesburg	IL	-90.30988	40.947697	2024-07-23 13:03:09.79	2024-08-11 06:42:48.328053
400	East Gillespie	IL	-89.812256	39.14082	2024-07-23 13:03:09.79	2024-08-11 06:42:48.498157
402	East Lynn	IL	-87.80032	40.464474	2024-07-23 13:03:09.79	2024-08-11 06:42:48.900698
403	East Moline	IL	-90.44082	41.515224	2024-07-23 13:03:09.79	2024-08-11 06:42:49.056579
404	East Peoria	IL	-89.58032	40.66601	2024-07-23 13:03:09.79	2024-08-11 06:42:49.246713
405	East Saint Louis	IL	-90.15758	38.625042	2024-07-23 13:03:09.79	2024-08-11 06:42:49.447319
406	East St. Louis	IL	-90.15758	38.625042	2024-07-23 13:03:09.79	2024-08-11 06:42:49.652709
407	Easton	IL	-89.84257	40.232544	2024-07-23 13:03:09.79	2024-08-11 06:42:49.851938
408	Eddyville	IL	-88.58813	37.49929	2024-07-23 13:03:09.79	2024-08-11 06:42:50.031078
409	Edelstein	IL	-89.63555	40.94031	2024-07-23 13:03:09.79	2024-08-11 06:42:50.204212
410	Edgewood	IL	-88.6634	38.922085	2024-07-23 13:03:09.79	2024-08-11 06:42:50.399264
411	Edgington	IL	-90.76368	41.387047	2024-07-23 13:03:09.79	2024-08-11 06:42:50.570124
412	Edinburg	IL	-89.39034	39.657074	2024-07-23 13:03:09.79	2024-08-11 06:42:50.768705
413	Edwards	IL	-89.74279	40.74537	2024-07-23 13:03:09.79	2024-08-11 06:42:50.964938
415	Effingham	IL	-88.54333	39.119987	2024-07-23 13:03:09.79	2024-08-11 06:42:51.359224
416	El Dara	IL	-90.99185	39.62263	2024-07-23 13:03:09.79	2024-08-11 06:42:51.518441
417	El Paso	IL	-89.0179	40.73827	2024-07-23 13:03:09.79	2024-08-11 06:42:51.691319
418	Elburn	IL	-88.47243	41.892216	2024-07-23 13:03:09.79	2024-08-11 06:42:51.87502
419	Eldena	IL	-89.41084	41.771454	2024-07-23 13:03:09.79	2024-08-11 06:42:52.043804
420	Eldorado	IL	-88.43844	37.81373	2024-07-23 13:03:09.79	2024-08-11 06:42:52.229612
421	Eldred	IL	-90.55425	39.286224	2024-07-23 13:03:09.79	2024-08-11 06:42:52.379892
422	Eleroy	IL	-89.76253	42.332558	2024-07-23 13:03:09.79	2024-08-11 06:42:52.579206
423	Elgin	IL	-88.28107	42.037243	2024-07-23 13:03:09.79	2024-08-11 06:42:52.767238
424	Elizabeth	IL	-90.221306	42.317825	2024-07-23 13:03:09.79	2024-08-11 06:42:52.968135
425	Elizabethtown	IL	-88.30638	37.44589	2024-07-23 13:03:09.79	2024-08-11 06:42:53.148204
426	Elk Grove Village	IL	-87.94035	42.00838	2024-07-23 13:03:09.79	2024-08-11 06:42:53.306365
427	Elkhart	IL	-89.48103	40.019527	2024-07-23 13:03:09.79	2024-08-11 06:42:53.481394
428	Elkville	IL	-89.23566	37.908806	2024-07-23 13:03:09.79	2024-08-11 06:42:53.665275
430	Elliott	IL	-88.272	40.4642	2024-07-23 13:03:09.79	2024-08-11 06:42:54.043519
431	Ellis Grove	IL	-89.90796	38.011063	2024-07-23 13:03:09.79	2024-08-11 06:42:54.22648
432	Ellisville	IL	-90.304436	40.62682	2024-07-23 13:03:09.79	2024-08-11 06:42:54.435031
433	Ellsworth	IL	-88.7167	40.44974	2024-07-23 13:03:09.79	2024-08-11 06:42:54.637491
434	Elmhurst	IL	-87.939964	41.901066	2024-07-23 13:03:09.79	2024-08-11 06:42:54.83973
435	Elmwood	IL	-89.96614	40.777992	2024-07-23 13:03:09.79	2024-08-11 06:42:55.061561
436	Elmwood Park	IL	-87.816734	41.925674	2024-07-23 13:03:09.79	2024-08-11 06:42:55.271877
437	Elsah	IL	-90.360794	38.954655	2024-07-23 13:03:09.79	2024-08-11 06:42:55.465788
438	Elvaston	IL	-91.24797	40.39495	2024-07-23 13:03:09.79	2024-08-11 06:42:55.653736
439	Elwin	IL	-88.97953	39.778164	2024-07-23 13:03:09.79	2024-08-11 06:42:55.851132
440	Elwood	IL	-88.111664	41.404034	2024-07-23 13:03:09.791	2024-08-11 06:42:56.058117
441	Emden	IL	-89.48496	40.29877	2024-07-23 13:03:09.791	2024-08-11 06:42:56.2545
443	Energy	IL	-89.02636	37.775784	2024-07-23 13:03:09.791	2024-08-11 06:42:56.697573
444	Enfield	IL	-88.33782	38.099586	2024-07-23 13:03:09.791	2024-08-11 06:42:56.892301
445	Eola	IL	-88.24239	41.775898	2024-07-23 13:03:09.791	2024-08-11 06:42:57.119676
446	Equality	IL	-88.34212	37.733402	2024-07-23 13:03:09.791	2024-08-11 06:42:57.293144
447	Erie	IL	-90.07975	41.655964	2024-07-23 13:03:09.791	2024-08-11 06:42:57.494213
448	Esmond	IL	-88.9356	42.033527	2024-07-23 13:03:09.791	2024-08-11 06:42:57.69104
449	Essex	IL	-88.18567	41.17728	2024-07-23 13:03:09.791	2024-08-11 06:42:57.917025
450	Eureka	IL	-89.27288	40.72138	2024-07-23 13:03:09.791	2024-08-11 06:42:58.11743
451	Evanston	IL	-87.68184	42.04679	2024-07-23 13:03:09.791	2024-08-11 06:42:58.303671
452	Evansville	IL	-89.936806	38.091686	2024-07-23 13:03:09.791	2024-08-11 06:42:58.500271
454	Ewing	IL	-88.85288	38.088753	2024-07-23 13:03:09.791	2024-08-11 06:42:58.890616
455	Exeter	IL	-90.496826	39.720566	2024-07-23 13:03:09.791	2024-08-11 06:42:59.092241
456	Fairbury	IL	-88.51329	40.7469	2024-07-23 13:03:09.791	2024-08-11 06:42:59.313222
457	Fairfield	IL	-88.359889	38.378782	2024-07-23 13:03:09.791	2024-08-11 06:42:59.526318
458	Fairmont	IL	-88.059166	41.556274	2024-07-23 13:03:09.791	2024-08-11 06:42:59.738807
459	Fairmont City	IL	-90.09325	38.649723	2024-07-23 13:03:09.791	2024-08-11 06:42:59.918997
460	Fairmount	IL	-87.83052	40.04551	2024-07-23 13:03:09.791	2024-08-11 06:43:00.107568
461	Fairview	IL	-90.16399	40.633366	2024-07-23 13:03:09.791	2024-08-11 06:43:00.287976
462	Fairview Heights	IL	-89.98482	38.571075	2024-07-23 13:03:09.791	2024-08-11 06:43:00.476126
463	Farina	IL	-88.77355	38.83223	2024-07-23 13:03:09.791	2024-08-11 06:43:00.677588
464	Farmer City	IL	-88.6426	40.241787	2024-07-23 13:03:09.791	2024-08-11 06:43:00.832086
466	Farmington	IL	-90.00581	40.698215	2024-07-23 13:03:09.791	2024-08-11 06:43:01.143171
467	Fayetteville	IL	-89.799095	38.37741	2024-07-23 13:03:09.791	2024-08-11 06:43:01.340295
468	Fenton	IL	-90.02845	41.728657	2024-07-23 13:03:09.791	2024-08-11 06:43:01.563752
469	Ferris	IL	-91.169266	40.46869	2024-07-23 13:03:09.791	2024-08-11 06:43:01.78156
470	Fiatt	IL	-90.18006	40.56037	2024-07-23 13:03:09.791	2024-08-11 06:43:01.987729
471	Fidelity	IL	-90.164314	39.153214	2024-07-23 13:03:09.791	2024-08-11 06:43:02.173006
472	Fieldon	IL	-90.49938	39.108658	2024-07-23 13:03:09.791	2024-08-11 06:43:02.33181
473	Fillmore	IL	-89.27866	39.115425	2024-07-23 13:03:09.791	2024-08-11 06:43:02.540427
474	Findlay	IL	-88.75363	39.521675	2024-07-23 13:03:09.791	2024-08-11 06:43:02.705092
475	Fisher	IL	-88.348145	40.310787	2024-07-23 13:03:09.791	2024-08-11 06:43:02.90263
476	Fithian	IL	-87.87331	40.11513	2024-07-23 13:03:09.792	2024-08-11 06:43:03.067609
477	Flanagan	IL	-88.862656	40.87787	2024-07-23 13:03:09.792	2024-08-11 06:43:03.2717
478	Flat Rock	IL	-87.67193	38.901527	2024-07-23 13:03:09.792	2024-08-11 06:43:03.462757
479	Flora	IL	-88.48598	38.66881	2024-07-23 13:03:09.792	2024-08-11 06:43:03.665239
481	Florence	IL	-89.65925	42.21433	2024-07-23 13:03:09.792	2024-08-11 06:43:04.054852
482	Flossmoor	IL	-87.678955	41.54318	2024-07-23 13:03:09.792	2024-08-11 06:43:04.224577
483	Foosland	IL	-88.43116	40.361637	2024-07-23 13:03:09.792	2024-08-11 06:43:04.389362
484	Ford Heights	IL	-87.59208	41.50626	2024-07-23 13:03:09.792	2024-08-11 06:43:04.553766
485	Forest City	IL	-89.82826	40.370182	2024-07-23 13:03:09.792	2024-08-11 06:43:04.704985
486	Forest Lake	IL	-88.05553	42.208076	2024-07-23 13:03:09.792	2024-08-11 06:43:04.903702
487	Forest Park	IL	-87.81114	41.87952	2024-07-23 13:03:09.792	2024-08-11 06:43:05.102936
488	Forest View	IL	-87.7983	41.808567	2024-07-23 13:03:09.792	2024-08-11 06:43:05.309645
489	Forrest	IL	-88.408195	40.74899	2024-07-23 13:03:09.792	2024-08-11 06:43:05.540578
490	Forreston	IL	-89.57843	42.126343	2024-07-23 13:03:09.792	2024-08-11 06:43:05.693148
491	Forsyth	IL	-88.955694	39.934978	2024-07-23 13:03:09.792	2024-08-11 06:43:05.882126
493	Fox Lake	IL	-88.1798	42.39717	2024-07-23 13:03:09.792	2024-08-11 06:43:06.281568
495	Fox River Grove	IL	-88.22009	42.198433	2024-07-23 13:03:09.792	2024-08-11 06:43:06.616903
496	Frankfort	IL	-87.849174	41.49775	2024-07-23 13:03:09.792	2024-08-11 06:43:06.836403
498	Franklin	IL	-87.634918	41.879937	2024-07-23 13:03:09.792	2024-08-11 06:43:07.200956
499	Franklin Grove	IL	-89.29951	41.84039	2024-07-23 13:03:09.792	2024-08-11 06:43:07.400544
500	Franklin Park	IL	-87.86767	41.929768	2024-07-23 13:03:09.792	2024-08-11 06:43:07.607445
501	Frederick	IL	-90.429596	40.06996	2024-07-23 13:03:09.792	2024-08-11 06:43:07.808985
502	Freeburg	IL	-89.91114	38.426464	2024-07-23 13:03:09.792	2024-08-11 06:43:07.988649
503	Freeman Spur	IL	-89.00221	37.857845	2024-07-23 13:03:09.792	2024-08-11 06:43:08.176447
504	Freeport	IL	-89.62195	42.297665	2024-07-23 13:03:09.792	2024-08-11 06:43:08.393913
505	Fulton	IL	-90.16569	41.867176	2024-07-23 13:03:09.792	2024-08-11 06:43:08.621723
506	Fults	IL	-90.21598	38.16621	2024-07-23 13:03:09.792	2024-08-11 06:43:08.78692
507	Gages Lake	IL	-87.98412	42.35108	2024-07-23 13:03:09.792	2024-08-11 06:43:08.946634
508	Galatia	IL	-88.612	37.840725	2024-07-23 13:03:09.792	2024-08-11 06:43:09.126747
509	Galena	IL	-90.42843	42.41619	2024-07-23 13:03:09.792	2024-08-11 06:43:09.305353
511	Galt	IL	-89.76208	41.789356	2024-07-23 13:03:09.792	2024-08-11 06:43:09.668659
512	Galva	IL	-90.046364	41.166462	2024-07-23 13:03:09.792	2024-08-11 06:43:09.853096
513	Garden Prairie	IL	-88.72278	42.253098	2024-07-23 13:03:09.792	2024-08-11 06:43:10.020232
514	Gardner	IL	-88.3063	41.187477	2024-07-23 13:03:09.792	2024-08-11 06:43:10.229158
515	Garrett	IL	-88.42464	39.79638	2024-07-23 13:03:09.792	2024-08-11 06:43:10.411586
516	Gays	IL	-88.49405	39.458046	2024-07-23 13:03:09.792	2024-08-11 06:43:10.583394
517	Geff	IL	-88.403984	38.443512	2024-07-23 13:03:09.792	2024-08-11 06:43:10.748847
518	Geneseo	IL	-90.1558	41.453175	2024-07-23 13:03:09.792	2024-08-11 06:43:10.940057
519	Geneva	IL	-88.30788	41.88792	2024-07-23 13:03:09.792	2024-08-11 06:43:11.144315
520	Genoa	IL	-88.69234	42.097164	2024-07-23 13:03:09.792	2024-08-11 06:43:11.349297
522	Gerlaw	IL	-90.60118	40.98662	2024-07-23 13:03:09.794	2024-08-11 06:43:11.761173
523	German Valley	IL	-89.473915	42.215256	2024-07-23 13:03:09.794	2024-08-11 06:43:11.914185
524	Germantown	IL	-89.53857	38.55369	2024-07-23 13:03:09.794	2024-08-11 06:43:12.075964
525	Germantown Hills	IL	-89.47225	40.76492	2024-07-23 13:03:09.794	2024-08-11 06:43:12.234672
526	Gibson City	IL	-88.374504	40.46499	2024-07-23 13:03:09.794	2024-08-11 06:43:12.391398
527	Gifford	IL	-88.02136	40.304527	2024-07-23 13:03:09.794	2024-08-11 06:43:12.588652
528	Gilberts	IL	-88.37546	42.10576	2024-07-23 13:03:09.794	2024-08-11 06:43:12.7999
529	Gillespie	IL	-89.81696	39.127365	2024-07-23 13:03:09.794	2024-08-11 06:43:12.979575
530	Gilman	IL	-87.99284	40.766434	2024-07-23 13:03:09.794	2024-08-11 06:43:13.17724
531	Gilson	IL	-90.201805	40.86133	2024-07-23 13:03:09.794	2024-08-11 06:43:13.366745
533	Gladstone	IL	-90.960526	40.863316	2024-07-23 13:03:09.794	2024-08-11 06:43:13.759943
534	Glasford	IL	-89.81038	40.57288	2024-07-23 13:03:09.794	2024-08-11 06:43:13.919627
535	Glasgow	IL	-90.480255	39.54953	2024-07-23 13:03:09.794	2024-08-11 06:43:14.118183
536	Glen Carbon	IL	-89.98328	38.748394	2024-07-23 13:03:09.794	2024-08-11 06:43:14.278122
537	Glen Ellyn	IL	-88.06673	41.87751	2024-07-23 13:03:09.794	2024-08-11 06:43:14.457034
538	Glenarm	IL	-89.647575	39.62485	2024-07-23 13:03:09.794	2024-08-11 06:43:14.622079
539	Glencoe	IL	-87.7581	42.13486	2024-07-23 13:03:09.794	2024-08-11 06:43:14.845121
540	Glendale Heights	IL	-88.07167	41.910503	2024-07-23 13:03:09.794	2024-08-11 06:43:15.006007
541	Glenview	IL	-87.80551	42.07284	2024-07-23 13:03:09.794	2024-08-11 06:43:15.21054
542	Glenwood	IL	-87.60229	41.542625	2024-07-23 13:03:09.794	2024-08-11 06:43:15.404861
543	Godfrey	IL	-90.19083	38.94921	2024-07-23 13:03:09.794	2024-08-11 06:43:15.615556
544	Godley	IL	-88.24526	41.23748	2024-07-23 13:03:09.794	2024-08-11 06:43:15.790303
545	Golconda	IL	-88.48614	37.36735	2024-07-23 13:03:09.794	2024-08-11 06:43:15.948843
546	Golden	IL	-91.01605	40.10931	2024-07-23 13:03:09.794	2024-08-11 06:43:16.169453
548	Golden Gate	IL	-88.066853	41.698921	2024-07-23 13:03:09.794	2024-08-11 06:43:16.568776
549	Golf	IL	-87.720497	41.99772	2024-07-23 13:03:09.794	2024-08-11 06:43:16.797531
550	Good Hope	IL	-90.677574	40.55786	2024-07-23 13:03:09.794	2024-08-11 06:43:16.987675
551	Goodfield	IL	-89.27973	40.62947	2024-07-23 13:03:09.794	2024-08-11 06:43:17.207941
552	Goodwine	IL	-87.78456	40.56768	2024-07-23 13:03:09.794	2024-08-11 06:43:17.382556
553	Goofy Ridge	IL	-89.93814	40.394432	2024-07-23 13:03:09.794	2024-08-11 06:43:17.547288
554	Goreville	IL	-88.97224	37.555645	2024-07-23 13:03:09.794	2024-08-11 06:43:17.725152
555	Gorham	IL	-89.486176	37.718037	2024-07-23 13:03:09.794	2024-08-11 06:43:17.912473
556	Grafton	IL	-90.43273	38.969814	2024-07-23 13:03:09.794	2024-08-11 06:43:18.101434
557	Grand Chain	IL	-89.02129	37.2521	2024-07-23 13:03:09.794	2024-08-11 06:43:18.292774
558	Grand Detour	IL	-89.41393	41.899265	2024-07-23 13:03:09.794	2024-08-11 06:43:18.454646
560	Grand Tower	IL	-89.50426	37.62945	2024-07-23 13:03:09.794	2024-08-11 06:43:18.816226
561	Grandview	IL	-89.62502	39.815456	2024-07-23 13:03:09.794	2024-08-11 06:43:19.002075
562	Grandwood Park	IL	-87.985794	42.39411	2024-07-23 13:03:09.794	2024-08-11 06:43:19.175322
563	Granite City	IL	-90.15058	38.70151	2024-07-23 13:03:09.794	2024-08-11 06:43:19.327016
564	Grant Park	IL	-87.64471	41.24105	2024-07-23 13:03:09.794	2024-08-11 06:43:19.550083
565	Grantfork	IL	-89.665596	38.82998	2024-07-23 13:03:09.794	2024-08-11 06:43:19.700352
566	Grantsburg	IL	-88.74702	37.391	2024-07-23 13:03:09.794	2024-08-11 06:43:19.858699
567	Granville	IL	-89.2281	41.26113	2024-07-23 13:03:09.794	2024-08-11 06:43:20.067626
568	Graymont	IL	-88.77708	40.87677	2024-07-23 13:03:09.794	2024-08-11 06:43:20.239174
569	Grayslake	IL	-88.04028	42.34433	2024-07-23 13:03:09.794	2024-08-11 06:43:20.405957
570	Grayville	IL	-87.99626	38.257675	2024-07-23 13:03:09.794	2024-08-11 06:43:20.608041
571	Great Lakes	IL	-87.85035	42.309444	2024-07-23 13:03:09.794	2024-08-11 06:43:20.784915
572	Green Oaks	IL	-87.9184	42.318775	2024-07-23 13:03:09.795	2024-08-11 06:43:20.972628
574	Greenfield	IL	-90.210754	39.343513	2024-07-23 13:03:09.795	2024-08-11 06:43:21.343394
575	Greenup	IL	-88.164566	39.247242	2024-07-23 13:03:09.795	2024-08-11 06:43:21.506407
576	Greenview	IL	-89.73937	40.083317	2024-07-23 13:03:09.795	2024-08-11 06:43:21.699509
577	Greenville	IL	-89.413445	38.892025	2024-07-23 13:03:09.795	2024-08-11 06:43:21.897965
578	Greenwood	IL	-87.59049	41.61537	2024-07-23 13:03:09.795	2024-08-11 06:43:22.14519
579	Gridley	IL	-88.881226	40.743393	2024-07-23 13:03:09.795	2024-08-11 06:43:22.340059
580	Griggsville	IL	-90.72401	39.70845	2024-07-23 13:03:09.795	2024-08-11 06:43:22.505365
581	Groveland	IL	-89.53327	40.59254	2024-07-23 13:03:09.795	2024-08-11 06:43:22.697743
582	Gulfport	IL	-91.08649	40.81366	2024-07-23 13:03:09.795	2024-08-11 06:43:22.868473
583	Gurnee	IL	-87.90169	42.37067	2024-07-23 13:03:09.795	2024-08-11 06:43:23.081526
584	Hainesville	IL	-88.067665	42.344982	2024-07-23 13:03:09.795	2024-08-11 06:43:23.252183
585	Hamburg	IL	-90.7176	39.230137	2024-07-23 13:03:09.795	2024-08-11 06:43:23.437623
586	Hamel	IL	-89.84454	38.889046	2024-07-23 13:03:09.795	2024-08-11 06:43:23.633373
587	Hamilton	IL	-91.345406	40.393097	2024-07-23 13:03:09.795	2024-08-11 06:43:23.830742
589	Hampshire	IL	-88.53016	42.098625	2024-07-23 13:03:09.795	2024-08-11 06:43:24.234247
590	Hampton	IL	-90.40837	41.558044	2024-07-23 13:03:09.795	2024-08-11 06:43:24.422215
591	Hanaford	IL	-88.840256	37.957825	2024-07-23 13:03:09.795	2024-08-11 06:43:24.59858
593	Hanover	IL	-90.285286	42.256924	2024-07-23 13:03:09.795	2024-08-11 06:43:24.964539
595	Hardin	IL	-90.61794	39.156773	2024-07-23 13:03:09.795	2024-08-11 06:43:25.376107
596	Harding	IL	-88.84966	41.515022	2024-07-23 13:03:09.795	2024-08-11 06:43:25.592286
597	Harmon	IL	-89.55457	41.722363	2024-07-23 13:03:09.795	2024-08-11 06:43:25.792362
598	Harrisburg	IL	-88.540306	37.73837	2024-07-23 13:03:09.795	2024-08-11 06:43:25.992695
599	Harrison	IL	-89.337364	37.79666	2024-07-23 13:03:09.795	2024-08-11 06:43:26.209735
600	Harristown	IL	-89.08515	39.853287	2024-07-23 13:03:09.795	2024-08-11 06:43:26.38622
601	Hartford	IL	-90.09562	38.837894	2024-07-23 13:03:09.795	2024-08-11 06:43:26.589398
602	Hartland	IL	-88.50859	42.363544	2024-07-23 13:03:09.795	2024-08-11 06:43:26.793982
603	Hartsburg	IL	-89.44017	40.250767	2024-07-23 13:03:09.795	2024-08-11 06:43:26.961077
604	Harvard	IL	-88.61601	42.419792	2024-07-23 13:03:09.795	2024-08-11 06:43:27.1442
605	Harvel	IL	-89.53128	39.355663	2024-07-23 13:03:09.795	2024-08-11 06:43:27.332923
606	Harvey	IL	-87.6462	41.60994	2024-07-23 13:03:09.795	2024-08-11 06:43:27.548281
608	Havana	IL	-90.06226	40.300095	2024-07-23 13:03:09.797	2024-08-11 06:43:27.880324
609	Hawthorn Woods	IL	-88.049904	42.216366	2024-07-23 13:03:09.801	2024-08-11 06:43:28.04105
610	Hazel Crest	IL	-87.694305	41.57168	2024-07-23 13:03:09.801	2024-08-11 06:43:28.198799
611	Hebron	IL	-88.43275	42.471996	2024-07-23 13:03:09.801	2024-08-11 06:43:28.398358
612	Hecker	IL	-89.994385	38.30516	2024-07-23 13:03:09.801	2024-08-11 06:43:28.587573
613	Henderson	IL	-90.355064	41.02491	2024-07-23 13:03:09.801	2024-08-11 06:43:28.783138
614	Hennepin	IL	-89.34261	41.25393	2024-07-23 13:03:09.801	2024-08-11 06:43:28.966403
615	Henning	IL	-87.70109	40.30573	2024-07-23 13:03:09.801	2024-08-11 06:43:29.181808
616	Henry	IL	-89.35689	41.111374	2024-07-23 13:03:09.801	2024-08-11 06:43:29.361203
617	Heritage Lake	IL	-89.329025	40.548058	2024-07-23 13:03:09.801	2024-08-11 06:43:29.632207
619	Herrick	IL	-88.98477	39.2187	2024-07-23 13:03:09.801	2024-08-11 06:43:29.984848
620	Herrin	IL	-89.02754	37.804413	2024-07-23 13:03:09.801	2024-08-11 06:43:30.217417
621	Herscher	IL	-88.09757	41.047882	2024-07-23 13:03:09.801	2024-08-11 06:43:30.37959
622	Hettick	IL	-90.036804	39.35779	2024-07-23 13:03:09.801	2024-08-11 06:43:30.544027
623	Heyworth	IL	-88.97637	40.314198	2024-07-23 13:03:09.801	2024-08-11 06:43:30.718345
624	Hickory Hills	IL	-87.82543	41.725697	2024-07-23 13:03:09.801	2024-08-11 06:43:30.898945
625	Hidalgo	IL	-88.14992	39.155922	2024-07-23 13:03:09.801	2024-08-11 06:43:31.068591
626	Highland	IL	-89.67901	38.73939	2024-07-23 13:03:09.801	2024-08-11 06:43:31.28248
627	Highland Park	IL	-87.798645	42.18589	2024-07-23 13:03:09.801	2024-08-11 06:43:31.485947
628	Highwood	IL	-87.80951	42.203396	2024-07-23 13:03:09.801	2024-08-11 06:43:31.67514
629	Hillcrest	IL	-89.0645	41.95107	2024-07-23 13:03:09.801	2024-08-11 06:43:31.857791
630	Hillsboro	IL	-89.49441	39.15892	2024-07-23 13:03:09.801	2024-08-11 06:43:32.050142
631	Hillsdale	IL	-90.173454	41.613644	2024-07-23 13:03:09.801	2024-08-11 06:43:32.241781
632	Hillside	IL	-87.9027	41.877605	2024-07-23 13:03:09.801	2024-08-11 06:43:32.434548
634	Hinckley	IL	-88.64105	41.769028	2024-07-23 13:03:09.801	2024-08-11 06:43:32.882594
635	Hindsboro	IL	-88.13409	39.683792	2024-07-23 13:03:09.801	2024-08-11 06:43:33.054502
636	Hines	IL	-87.83904	41.85356	2024-07-23 13:03:09.801	2024-08-11 06:43:33.253284
637	Hinsdale	IL	-87.92929	41.802513	2024-07-23 13:03:09.801	2024-08-11 06:43:33.452382
638	Hodgkins	IL	-87.85804	41.76884	2024-07-23 13:03:09.801	2024-08-11 06:43:33.618904
639	Hoffman	IL	-89.2638	38.54111	2024-07-23 13:03:09.801	2024-08-11 06:43:33.807841
640	Hoffman Estates	IL	-88.07968	42.04281	2024-07-23 13:03:09.801	2024-08-11 06:43:33.981805
641	Holcomb	IL	-89.09559	42.06456	2024-07-23 13:03:09.801	2024-08-11 06:43:34.200114
642	Holiday Hills	IL	-88.95498	39.878925	2024-07-23 13:03:09.801	2024-08-11 06:43:34.375239
643	Holiday Shores	IL	-89.94623	38.920227	2024-07-23 13:03:09.801	2024-08-11 06:43:34.552827
644	Hollowayville	IL	-89.297035	41.364944	2024-07-23 13:03:09.801	2024-08-11 06:43:34.747198
645	Homer	IL	-87.95804	40.036186	2024-07-23 13:03:09.801	2024-08-11 06:43:34.948726
647	Hometown	IL	-87.725945	41.734722	2024-07-23 13:03:09.801	2024-08-11 06:43:35.302958
648	Homewood	IL	-87.66542	41.561436	2024-07-23 13:03:09.801	2024-08-11 06:43:35.494536
649	Hoopeston	IL	-87.668434	40.467373	2024-07-23 13:03:09.801	2024-08-11 06:43:35.679613
650	Hooppole	IL	-89.91238	41.521866	2024-07-23 13:03:09.801	2024-08-11 06:43:35.883217
651	Hopedale	IL	-89.41313	40.420113	2024-07-23 13:03:09.801	2024-08-11 06:43:36.068386
652	Hopewell	IL	-89.45699	40.98465	2024-07-23 13:03:09.801	2024-08-11 06:43:36.261505
653	Hopkins Park	IL	-88.737246	41.9459965	2024-07-23 13:03:09.801	2024-08-11 06:43:36.464477
654	Hoyleton	IL	-89.274475	38.44202	2024-07-23 13:03:09.801	2024-08-11 06:43:36.618453
655	Hudson	IL	-88.99248	40.60911	2024-07-23 13:03:09.801	2024-08-11 06:43:36.818772
656	Huey	IL	-89.291016	38.6044	2024-07-23 13:03:09.801	2024-08-11 06:43:37.016539
657	Hull	IL	-91.206024	39.70666	2024-07-23 13:03:09.801	2024-08-11 06:43:37.22106
658	Humboldt	IL	-88.31925	39.605667	2024-07-23 13:03:09.801	2024-08-11 06:43:37.406559
659	Hume	IL	-87.86951	39.796886	2024-07-23 13:03:09.801	2024-08-11 06:43:37.59477
661	Huntsville	IL	-90.86343	40.19107	2024-07-23 13:03:09.801	2024-08-11 06:43:37.984537
662	Hurst	IL	-89.14409	37.83158	2024-07-23 13:03:09.801	2024-08-11 06:43:38.205972
663	Hutsonville	IL	-87.6578	39.109547	2024-07-23 13:03:09.801	2024-08-11 06:43:38.363942
664	Illinois City	IL	-90.899796	41.397263	2024-07-23 13:03:09.801	2024-08-11 06:43:38.528704
665	Illiopolis	IL	-89.24211	39.853374	2024-07-23 13:03:09.801	2024-08-11 06:43:38.687626
666	Ina	IL	-88.903984	38.151215	2024-07-23 13:03:09.801	2024-08-11 06:43:38.882694
667	Indian Creek	IL	-88.30337	41.785694	2024-07-23 13:03:09.801	2024-08-11 06:43:39.071515
668	Indian Head Park	IL	-87.90075	41.77234	2024-07-23 13:03:09.801	2024-08-11 06:43:39.258203
669	Indianola	IL	-87.73995	39.927345	2024-07-23 13:03:09.801	2024-08-11 06:43:39.457713
670	Industry	IL	-90.60725	40.32759	2024-07-23 13:03:09.801	2024-08-11 06:43:39.651
672	Ingleside	IL	-88.13984	42.381233	2024-07-23 13:03:09.803	2024-08-11 06:43:40.030553
673	Ingraham	IL	-88.3327	38.836056	2024-07-23 13:03:09.803	2024-08-11 06:43:40.203178
674	Inverness	IL	-88.09586	42.117836	2024-07-23 13:03:09.803	2024-08-11 06:43:40.398514
675	Iola	IL	-88.630615	38.834385	2024-07-23 13:03:09.803	2024-08-11 06:43:40.652422
676	Ipava	IL	-90.3246	40.351463	2024-07-23 13:03:09.803	2024-08-11 06:43:40.824931
677	Iroquois	IL	-87.73451	40.776276	2024-07-23 13:03:09.803	2024-08-11 06:43:41.033556
678	Irving	IL	-89.40537	39.205227	2024-07-23 13:03:09.803	2024-08-11 06:43:41.234153
679	Irvington	IL	-89.1616	38.439064	2024-07-23 13:03:09.803	2024-08-11 06:43:41.427232
680	Irwin	IL	-87.98508	41.05253	2024-07-23 13:03:09.803	2024-08-11 06:43:41.646384
681	Island Lake	IL	-88.19614	42.271885	2024-07-23 13:03:09.803	2024-08-11 06:43:41.867676
682	Itasca	IL	-88.01337	41.971184	2024-07-23 13:03:09.803	2024-08-11 06:43:42.068485
684	Ivesdale	IL	-88.45628	39.945183	2024-07-23 13:03:09.803	2024-08-11 06:43:42.435747
685	Jacksonville	IL	-90.2298	39.73374	2024-07-23 13:03:09.803	2024-08-11 06:43:42.633933
686	Jacob	IL	-89.537	37.745	2024-07-23 13:03:09.803	2024-08-11 06:43:42.824369
687	Janesville	IL	-88.24379	39.373894	2024-07-23 13:03:09.803	2024-08-11 06:43:43.01854
688	Jeffersonville	IL	-88.40394	38.446	2024-07-23 13:03:09.803	2024-08-11 06:43:43.191035
689	Jeisyville	IL	-89.40577	39.576866	2024-07-23 13:03:09.803	2024-08-11 06:43:43.368117
690	Jerome	IL	-89.67743	39.764187	2024-07-23 13:03:09.803	2024-08-11 06:43:43.603572
692	Jewett	IL	-88.24546	39.207893	2024-07-23 13:03:09.803	2024-08-11 06:43:43.981181
694	Johnsonville	IL	-88.53615	38.52212	2024-07-23 13:03:09.803	2024-08-11 06:43:44.326244
695	Johnston City	IL	-88.926605	37.81668	2024-07-23 13:03:09.803	2024-08-11 06:43:44.486763
696	Joliet	IL	-88.08302	41.525913	2024-07-23 13:03:09.803	2024-08-11 06:43:44.656001
697	Jonesboro	IL	-89.26888	37.451427	2024-07-23 13:03:09.803	2024-08-11 06:43:44.825729
698	Joppa	IL	-88.84441	37.20647	2024-07-23 13:03:09.803	2024-08-11 06:43:45.00401
699	Joslin	IL	-90.21915	41.557068	2024-07-23 13:03:09.803	2024-08-11 06:43:45.200778
700	Joy	IL	-90.87872	41.197628	2024-07-23 13:03:09.803	2024-08-11 06:43:45.387284
701	Junction	IL	-87.63868	41.878703	2024-07-23 13:03:09.803	2024-08-11 06:43:45.580162
703	Justice	IL	-87.840164	41.748367	2024-07-23 13:03:09.804	2024-08-11 06:43:45.929299
704	Kampsville	IL	-90.61081	39.29915	2024-07-23 13:03:09.804	2024-08-11 06:43:46.10432
705	Kane	IL	-90.35337	39.188877	2024-07-23 13:03:09.804	2024-08-11 06:43:46.323163
706	Kaneville	IL	-88.52188	41.83508	2024-07-23 13:03:09.804	2024-08-11 06:43:46.51016
707	Kangley	IL	-88.874214	41.14638	2024-07-23 13:03:09.804	2024-08-11 06:43:46.712734
708	Kankakee	IL	-87.861115	41.120033	2024-07-23 13:03:09.804	2024-08-11 06:43:46.921695
709	Kansas	IL	-87.93964	39.554005	2024-07-23 13:03:09.804	2024-08-11 06:43:47.125007
710	Kappa	IL	-89.00664	40.672222	2024-07-23 13:03:09.804	2024-08-11 06:43:47.292964
711	Karnak	IL	-88.972855	37.293667	2024-07-23 13:03:09.804	2024-08-11 06:43:47.469012
712	Kasbeer	IL	-89.463449	41.505349	2024-07-23 13:03:09.804	2024-08-11 06:43:47.633509
713	Kaskaskia	IL	-89.91654	37.92045	2024-07-23 13:03:09.804	2024-08-11 06:43:47.816257
714	Keenes	IL	-88.64286	38.33817	2024-07-23 13:03:09.804	2024-08-11 06:43:48.016905
716	Keithsburg	IL	-90.9429	41.100643	2024-07-23 13:03:09.804	2024-08-11 06:43:48.421053
717	Kell	IL	-88.90672	38.491337	2024-07-23 13:03:09.804	2024-08-11 06:43:48.627588
718	Kempton	IL	-88.23784	40.935753	2024-07-23 13:03:09.804	2024-08-11 06:43:48.814897
719	Kenilworth	IL	-87.71701	42.08571	2024-07-23 13:03:09.804	2024-08-11 06:43:49.018425
720	Kenney	IL	-89.08569	40.09784	2024-07-23 13:03:09.804	2024-08-11 06:43:49.234804
721	Kent	IL	-89.90216	42.30727	2024-07-23 13:03:09.804	2024-08-11 06:43:49.425994
722	Kewanee	IL	-89.92491	41.244534	2024-07-23 13:03:09.804	2024-08-11 06:43:49.607195
723	Keyesport	IL	-89.273895	38.741997	2024-07-23 13:03:09.804	2024-08-11 06:43:49.790698
724	Kilbourne	IL	-90.00979	40.152294	2024-07-23 13:03:09.804	2024-08-11 06:43:49.961607
725	Kildeer	IL	-88.04725	42.170902	2024-07-23 13:03:09.804	2024-08-11 06:43:50.185486
726	Kincaid	IL	-89.41338	39.585888	2024-07-23 13:03:09.804	2024-08-11 06:43:50.369872
727	Kinderhook	IL	-91.15332	39.7021	2024-07-23 13:03:09.804	2024-08-11 06:43:50.540259
729	Kingston	IL	-88.75915	42.099937	2024-07-23 13:03:09.804	2024-08-11 06:43:50.952152
730	Kingston Mines	IL	-87.649079	41.92869899999999	2024-07-23 13:03:09.804	2024-08-11 06:43:51.161306
731	Kinmundy	IL	-88.850235	38.773453	2024-07-23 13:03:09.804	2024-08-11 06:43:51.341217
732	Kinsman	IL	-88.57028	41.189342	2024-07-23 13:03:09.804	2024-08-11 06:43:51.532595
733	Kirkland	IL	-88.85128	42.092678	2024-07-23 13:03:09.804	2024-08-11 06:43:51.729305
734	Kirkwood	IL	-90.74929	40.86692	2024-07-23 13:03:09.804	2024-08-11 06:43:51.911807
735	Knollwood	IL	-87.885635	42.286137	2024-07-23 13:03:09.804	2024-08-11 06:43:52.149913
736	Knoxville	IL	-90.2835	40.90801	2024-07-23 13:03:09.804	2024-08-11 06:43:52.325581
737	La Clede	IL	-88.71521	38.87945	2024-07-23 13:03:09.804	2024-08-11 06:43:52.499767
738	La Fayette	IL	-89.97272	41.10805	2024-07-23 13:03:09.804	2024-08-11 06:43:52.680279
739	La Grange	IL	-87.87545	41.804943	2024-07-23 13:03:09.804	2024-08-11 06:43:52.874932
740	La Grange Park	IL	-87.868126	41.834423	2024-07-23 13:03:09.804	2024-08-11 06:43:53.051837
741	La Harpe	IL	-90.96952	40.5835	2024-07-23 13:03:09.804	2024-08-11 06:43:53.216004
742	La Moille	IL	-89.28015	41.531765	2024-07-23 13:03:09.804	2024-08-11 06:43:53.375225
744	La Prairie	IL	-91.00213	40.14774	2024-07-23 13:03:09.804	2024-08-11 06:43:53.680219
745	La Rose	IL	-89.23556	40.981052	2024-07-23 13:03:09.804	2024-08-11 06:43:53.858291
746	La Salle	IL	-89.09697	41.329113	2024-07-23 13:03:09.804	2024-08-11 06:43:54.024238
747	Lacon	IL	-89.409805	41.024647	2024-07-23 13:03:09.804	2024-08-11 06:43:54.210138
748	Ladd	IL	-89.21914	41.381626	2024-07-23 13:03:09.804	2024-08-11 06:43:54.409816
749	Lake Barrington	IL	-88.11526	42.219716	2024-07-23 13:03:09.804	2024-08-11 06:43:54.572227
750	Lake Bluff	IL	-87.84578	42.278923	2024-07-23 13:03:09.804	2024-08-11 06:43:54.78412
751	Lake Camelot	IL	-89.75045	40.63396	2024-07-23 13:03:09.804	2024-08-11 06:43:54.961344
752	Lake Carroll	IL	-89.87001	42.174046	2024-07-23 13:03:09.804	2024-08-11 06:43:55.146635
753	Lake Catherine	IL	-88.13302	42.479008	2024-07-23 13:03:09.804	2024-08-11 06:43:55.312118
755	Lake Forest	IL	-87.83888	42.251495	2024-07-23 13:03:09.804	2024-08-11 06:43:55.66434
756	Lake Fork	IL	-89.35005	39.97069	2024-07-23 13:03:09.804	2024-08-11 06:43:55.8365
757	Lake Hills	IL	-85.510405	34.887747	2024-07-23 13:03:09.804	2024-08-11 06:43:56.01688
758	Lake Holiday	IL	-88.64262	41.617268	2024-07-23 13:03:09.804	2024-08-11 06:43:56.188781
759	Lake In The Hills	IL	-88.33533	42.181744	2024-07-23 13:03:09.804	2024-08-11 06:43:56.364123
760	Lake Ka-Ho	IL	-89.74739	39.10009	2024-07-23 13:03:09.804	2024-08-11 06:43:56.545106
761	Lake Petersburg	IL	-89.864546	39.983557	2024-07-23 13:03:09.804	2024-08-11 06:43:56.710166
762	Lake Summerset	IL	-89.389915	42.454334	2024-07-23 13:03:09.804	2024-08-11 06:43:56.892281
763	Lake Villa	IL	-88.08007	42.417583	2024-07-23 13:03:09.804	2024-08-11 06:43:57.073373
764	Lake Woods	IL	-88.088043	41.95521	2024-07-23 13:03:09.804	2024-08-11 06:43:57.257758
765	Lake Zurich	IL	-88.093124	42.19691	2024-07-23 13:03:09.804	2024-08-11 06:43:57.430794
766	Lakemoor	IL	-88.19929	42.328785	2024-07-23 13:03:09.804	2024-08-11 06:43:57.591088
768	Lakewood Shores	IL	-88.14483	41.280785	2024-07-23 13:03:09.804	2024-08-11 06:43:57.919249
769	Lanark	IL	-89.83293	42.102066	2024-07-23 13:03:09.804	2024-08-11 06:43:58.105601
770	Lane	IL	-88.85556	40.122585	2024-07-23 13:03:09.804	2024-08-11 06:43:58.322019
771	Langleyville	IL	-89.3553	39.56195	2024-07-23 13:03:09.804	2024-08-11 06:43:58.487429
772	Lansing	IL	-87.5352	41.564724	2024-07-23 13:03:09.804	2024-08-11 06:43:58.669222
773	LaPlace	IL	-88.71603	39.79992	2024-07-23 13:03:09.804	2024-08-11 06:43:58.853329
774	LaSalle	IL	-87.69756	39.59945	2024-07-23 13:03:09.804	2024-08-11 06:43:59.057942
775	Latham	IL	-89.16269	39.966408	2024-07-23 13:03:09.804	2024-08-11 06:43:59.260904
776	Laura	IL	-89.927216	40.921757	2024-07-23 13:03:09.804	2024-08-11 06:43:59.453745
777	Lawndale	IL	-89.28437	40.21569	2024-07-23 13:03:09.804	2024-08-11 06:43:59.641188
778	Lawrence	IL	-88.6414	42.441277	2024-07-23 13:03:09.804	2024-08-11 06:43:59.84672
779	Lawrenceville	IL	-87.68207	38.72943	2024-07-23 13:03:09.804	2024-08-11 06:44:00.012484
781	Leaf River	IL	-89.40406	42.126434	2024-07-23 13:03:09.804	2024-08-11 06:44:00.367483
782	Lebanon	IL	-89.80757	38.60388	2024-07-23 13:03:09.804	2024-08-11 06:44:00.60466
783	Lee	IL	-88.942856	41.796173	2024-07-23 13:03:09.804	2024-08-11 06:44:00.804642
784	Lee Center	IL	-89.279594	41.748	2024-07-23 13:03:09.804	2024-08-11 06:44:00.960738
785	Leland	IL	-88.799194	41.614388	2024-07-23 13:03:09.804	2024-08-11 06:44:01.148122
786	Leland Grove	IL	-89.68227	39.776947	2024-07-23 13:03:09.804	2024-08-11 06:44:01.308284
787	Lemont	IL	-88.00018	41.674076	2024-07-23 13:03:09.806	2024-08-11 06:44:01.532
788	Lena	IL	-89.82314	42.378395	2024-07-23 13:03:09.806	2024-08-11 06:44:01.750685
791	Lerna	IL	-88.28832	39.417904	2024-07-23 13:03:09.806	2024-08-11 06:44:02.303658
792	Lewistown	IL	-90.15519	40.39659	2024-07-23 13:03:09.806	2024-08-11 06:44:02.485839
793	Lexington	IL	-88.7833	40.64154	2024-07-23 13:03:09.806	2024-08-11 06:44:02.693746
794	Liberty	IL	-91.10755	39.87958	2024-07-23 13:03:09.806	2024-08-11 06:44:02.885976
795	Libertyville	IL	-87.954544	42.288803	2024-07-23 13:03:09.806	2024-08-11 06:44:03.09819
797	Lima	IL	-91.37758	40.177387	2024-07-23 13:03:09.806	2024-08-11 06:44:03.493905
798	Limestone	IL	-87.97176	41.13273	2024-07-23 13:03:09.806	2024-08-11 06:44:03.695392
799	Lincoln	IL	-89.36251	40.146755	2024-07-23 13:03:09.806	2024-08-11 06:44:03.909793
800	Lincolnshire	IL	-87.90853	42.190716	2024-07-23 13:03:09.806	2024-08-11 06:44:04.110287
801	Lincolnwood	IL	-87.736015	42.004505	2024-07-23 13:03:09.806	2024-08-11 06:44:04.296649
802	Lindenhurst	IL	-88.02614	42.41017	2024-07-23 13:03:09.806	2024-08-11 06:44:04.50721
803	Lindenwood	IL	-89.03038	42.053017	2024-07-23 13:03:09.806	2024-08-11 06:44:04.732251
804	Lisbon	IL	-88.48232	41.48133	2024-07-23 13:03:09.806	2024-08-11 06:44:04.945222
805	Lisle	IL	-88.0747	41.799637	2024-07-23 13:03:09.806	2024-08-11 06:44:05.152314
807	Literberry	IL	-90.20142	39.8514	2024-07-23 13:03:09.806	2024-08-11 06:44:05.536136
808	Little York	IL	-90.746254	41.011993	2024-07-23 13:03:09.806	2024-08-11 06:44:05.706281
809	Littleton	IL	-90.61991	40.232357	2024-07-23 13:03:09.806	2024-08-11 06:44:05.894485
810	Liverpool	IL	-90.000855	40.392455	2024-07-23 13:03:09.806	2024-08-11 06:44:06.081139
811	Livingston	IL	-89.76426	38.96774	2024-07-23 13:03:09.806	2024-08-11 06:44:06.303715
812	Loami	IL	-89.8468	39.674988	2024-07-23 13:03:09.806	2024-08-11 06:44:06.482453
813	Lockport	IL	-88.057465	41.58937	2024-07-23 13:03:09.806	2024-08-11 06:44:06.699668
814	Lockport Heights	IL	-88.02697	41.62024	2024-07-23 13:03:09.806	2024-08-11 06:44:06.872356
815	Loda	IL	-88.07221	40.516624	2024-07-23 13:03:09.806	2024-08-11 06:44:07.075834
816	Logan	IL	-88.84156	37.955368	2024-07-23 13:03:09.806	2024-08-11 06:44:07.303811
817	Lomax	IL	-91.073135	40.678844	2024-07-23 13:03:09.806	2024-08-11 06:44:07.53417
819	London Mills	IL	-90.26582	40.712128	2024-07-23 13:03:09.806	2024-08-11 06:44:07.939135
820	Long Creek	IL	-88.84745	39.81204	2024-07-23 13:03:09.806	2024-08-11 06:44:08.139072
821	Long Grove	IL	-87.99728	42.178318	2024-07-23 13:03:09.806	2024-08-11 06:44:08.36465
822	Long Lake	IL	-88.127235	42.37025	2024-07-23 13:03:09.806	2024-08-11 06:44:08.554756
823	Long Point	IL	-88.89293	41.00632	2024-07-23 13:03:09.806	2024-08-11 06:44:08.720473
824	Longview	IL	-90.58072	41.500484	2024-07-23 13:03:09.806	2024-08-11 06:44:08.920147
825	Loraine	IL	-91.22186	40.15412	2024-07-23 13:03:09.806	2024-08-11 06:44:09.132276
826	Lorenzo	IL	-88.21695	41.347206	2024-07-23 13:03:09.806	2024-08-11 06:44:09.341933
827	Lost Nation	IL	-89.3664	41.911285	2024-07-23 13:03:09.806	2024-08-11 06:44:09.504373
828	Lostant	IL	-89.06019	41.14261	2024-07-23 13:03:09.806	2024-08-11 06:44:09.679797
829	Louisville	IL	-88.50231	38.772427	2024-07-23 13:03:09.806	2024-08-11 06:44:09.908022
830	Lovejoy	IL	-90.16729	38.656605	2024-07-23 13:03:09.806	2024-08-11 06:44:10.114264
831	Loves Park	IL	-89.05791	42.313164	2024-07-23 13:03:09.806	2024-08-11 06:44:10.336767
832	Lovington	IL	-88.63424	39.715553	2024-07-23 13:03:09.806	2024-08-11 06:44:10.548709
833	Lowpoint	IL	-89.313156	40.872627	2024-07-23 13:03:09.806	2024-08-11 06:44:10.737984
834	Ludlow	IL	-88.12699	40.386715	2024-07-23 13:03:09.806	2024-08-11 06:44:10.931807
836	Lynn Center	IL	-90.357864	41.295807	2024-07-23 13:03:09.806	2024-08-11 06:44:11.345392
837	Lynnville	IL	-90.345116	39.687405	2024-07-23 13:03:09.807	2024-08-11 06:44:11.533163
838	Lynwood	IL	-87.53899	41.526447	2024-07-23 13:03:09.807	2024-08-11 06:44:11.76482
839	Lyons	IL	-87.81925	41.81216	2024-07-23 13:03:09.807	2024-08-11 06:44:11.994917
840	Macedonia	IL	-88.70573	38.052006	2024-07-23 13:03:09.807	2024-08-11 06:44:12.204931
841	Machesney Park	IL	-89.039375	42.34715	2024-07-23 13:03:09.807	2024-08-11 06:44:12.392709
842	Mackinaw	IL	-89.359215	40.536945	2024-07-23 13:03:09.807	2024-08-11 06:44:12.608039
843	Macomb	IL	-90.670235	40.459324	2024-07-23 13:03:09.807	2024-08-11 06:44:12.808212
844	Macon	IL	-88.99792	39.710335	2024-07-23 13:03:09.807	2024-08-11 06:44:13.050457
846	Maeystown	IL	-90.233025	38.225708	2024-07-23 13:03:09.807	2024-08-11 06:44:13.434763
847	Magnolia	IL	-89.19445	41.113373	2024-07-23 13:03:09.807	2024-08-11 06:44:13.64103
848	Mahomet	IL	-88.40128	40.194435	2024-07-23 13:03:09.807	2024-08-11 06:44:13.856331
849	Makanda	IL	-89.20928	37.617306	2024-07-23 13:03:09.807	2024-08-11 06:44:14.029205
850	Malden	IL	-89.370804	41.423405	2024-07-23 13:03:09.807	2024-08-11 06:44:14.234943
851	Malta	IL	-88.86359	41.929848	2024-07-23 13:03:09.807	2024-08-11 06:44:14.44242
852	Manchester	IL	-90.3313	39.542145	2024-07-23 13:03:09.807	2024-08-11 06:44:14.643899
853	Manhattan	IL	-87.98644	41.423153	2024-07-23 13:03:09.807	2024-08-11 06:44:14.8363
854	Manito	IL	-89.78195	40.42569	2024-07-23 13:03:09.807	2024-08-11 06:44:15.040675
855	Manlius	IL	-89.67016	41.456192	2024-07-23 13:03:09.807	2024-08-11 06:44:15.217798
856	Mansfield	IL	-88.50625	40.21147	2024-07-23 13:03:09.807	2024-08-11 06:44:15.453861
857	Manteno	IL	-87.83531	41.24893	2024-07-23 13:03:09.807	2024-08-11 06:44:15.623067
858	Maple Park	IL	-88.60138	41.90784	2024-07-23 13:03:09.807	2024-08-11 06:44:15.832273
860	Maquon	IL	-90.16496	40.799	2024-07-23 13:03:09.807	2024-08-11 06:44:16.202048
861	Marengo	IL	-88.6085	42.248333	2024-07-23 13:03:09.807	2024-08-11 06:44:16.405287
862	Marietta	IL	-90.39269	40.5012	2024-07-23 13:03:09.807	2024-08-11 06:44:16.603426
863	Marine	IL	-89.7777	38.788216	2024-07-23 13:03:09.807	2024-08-11 06:44:16.841422
864	Marion	IL	-88.92672	37.730804	2024-07-23 13:03:09.807	2024-08-11 06:44:17.33406
865	Marissa	IL	-89.7541	38.245262	2024-07-23 13:03:09.807	2024-08-11 06:44:17.52394
866	Mark	IL	-89.25029	41.264595	2024-07-23 13:03:09.807	2024-08-11 06:44:17.736191
867	Markham	IL	-87.694534	41.593506	2024-07-23 13:03:09.807	2024-08-11 06:44:17.96024
868	Marley	IL	-87.92566	41.5489	2024-07-23 13:03:09.807	2024-08-11 06:44:18.165155
869	Maroa	IL	-88.95622	40.036423	2024-07-23 13:03:09.807	2024-08-11 06:44:18.376701
871	Marseilles	IL	-88.70809	41.33045	2024-07-23 13:03:09.807	2024-08-11 06:44:18.772399
872	Marshall	IL	-87.69583	39.390556	2024-07-23 13:03:09.807	2024-08-11 06:44:18.985622
873	Martinsville	IL	-87.88256	39.33315	2024-07-23 13:03:09.807	2024-08-11 06:44:19.196766
874	Martinton	IL	-87.72895	40.916958	2024-07-23 13:03:09.807	2024-08-11 06:44:19.406435
875	Maryville	IL	-89.95654	38.723717	2024-07-23 13:03:09.807	2024-08-11 06:44:19.626687
876	Mascoutah	IL	-89.79746	38.490276	2024-07-23 13:03:09.807	2024-08-11 06:44:19.912495
877	Mason	IL	-88.62492	38.95344	2024-07-23 13:03:09.807	2024-08-11 06:44:20.183468
878	Mason City	IL	-89.69783	40.20236	2024-07-23 13:03:09.807	2024-08-11 06:44:20.366454
879	Matherville	IL	-90.608284	41.259716	2024-07-23 13:03:09.807	2024-08-11 06:44:20.594496
880	Matteson	IL	-87.73234	41.50623	2024-07-23 13:03:09.807	2024-08-11 06:44:20.81091
881	Mattoon	IL	-88.37651	39.48156	2024-07-23 13:03:09.807	2024-08-11 06:44:21.003356
882	Maunie	IL	-88.04709	38.038166	2024-07-23 13:03:09.807	2024-08-11 06:44:21.195012
884	Mazon	IL	-88.424095	41.241077	2024-07-23 13:03:09.807	2024-08-11 06:44:21.668233
885	McClure	IL	-89.43116	37.318035	2024-07-23 13:03:09.807	2024-08-11 06:44:21.900149
886	McConnell	IL	-89.729774	42.434807	2024-07-23 13:03:09.81	2024-08-11 06:44:22.120574
887	McCook	IL	-87.83004	41.8	2024-07-23 13:03:09.811	2024-08-11 06:44:22.346423
888	McCullom Lake	IL	-88.291175	42.364938	2024-07-23 13:03:09.811	2024-08-11 06:44:22.538995
890	McLean	IL	-89.171074	40.31441	2024-07-23 13:03:09.811	2024-08-11 06:44:23.026474
891	McLeansboro	IL	-88.53657	38.094074	2024-07-23 13:03:09.811	2024-08-11 06:44:23.185763
892	McNabb	IL	-89.20924	41.17679	2024-07-23 13:03:09.811	2024-08-11 06:44:23.366031
893	Mechanicsburg	IL	-89.39697	39.8097	2024-07-23 13:03:09.811	2024-08-11 06:44:23.563312
894	Media	IL	-90.833176	40.774998	2024-07-23 13:03:09.811	2024-08-11 06:44:23.769505
896	Medora	IL	-90.14289	39.174377	2024-07-23 13:03:09.811	2024-08-11 06:44:24.186149
897	Melrose Park	IL	-87.856606	41.893402	2024-07-23 13:03:09.811	2024-08-11 06:44:24.384745
898	Melvin	IL	-88.24951	40.568653	2024-07-23 13:03:09.811	2024-08-11 06:44:24.597437
899	Mendon	IL	-91.283844	40.088097	2024-07-23 13:03:09.811	2024-08-11 06:44:24.828686
900	Mendota	IL	-89.11844	41.54805	2024-07-23 13:03:09.811	2024-08-11 06:44:25.037282
901	Menominee	IL	-90.53274	42.48759	2024-07-23 13:03:09.811	2024-08-11 06:44:25.217957
902	Meredosia	IL	-90.5613	39.830708	2024-07-23 13:03:09.811	2024-08-11 06:44:25.381462
903	Merrionette Park	IL	-87.700516	41.683323	2024-07-23 13:03:09.811	2024-08-11 06:44:25.5526
904	Merritt	IL	-90.41508	39.714878	2024-07-23 13:03:09.811	2024-08-11 06:44:25.768919
905	Metamora	IL	-89.36055	40.790512	2024-07-23 13:03:09.811	2024-08-11 06:44:25.964006
907	Metropolis	IL	-88.73189	37.151085	2024-07-23 13:03:09.811	2024-08-11 06:44:26.352728
908	Mettawa	IL	-87.9259	42.233356	2024-07-23 13:03:09.811	2024-08-11 06:44:26.533996
909	Meyer	IL	-89.042854	38.048107	2024-07-23 13:03:09.811	2024-08-11 06:44:26.759986
910	Middletown	IL	-89.59103	40.10036	2024-07-23 13:03:09.811	2024-08-11 06:44:26.985518
911	Midlothian	IL	-87.71764	41.62554	2024-07-23 13:03:09.811	2024-08-11 06:44:27.187554
912	Milan	IL	-90.571815	41.4533	2024-07-23 13:03:09.811	2024-08-11 06:44:27.417997
913	Milford	IL	-87.69766	40.628315	2024-07-23 13:03:09.811	2024-08-11 06:44:27.669137
914	Mill Creek	IL	-89.73164	39.77986	2024-07-23 13:03:09.811	2024-08-11 06:44:27.884584
915	Mill Shoals	IL	-88.34647	38.248474	2024-07-23 13:03:09.811	2024-08-11 06:44:28.060903
916	Millbrook	IL	-88.55286	41.598137	2024-07-23 13:03:09.811	2024-08-11 06:44:28.287963
917	Millcreek	IL	-89.25287	37.34265	2024-07-23 13:03:09.811	2024-08-11 06:44:28.497726
918	Milledgeville	IL	-89.774605	41.962833	2024-07-23 13:03:09.811	2024-08-11 06:44:28.703731
920	Millersburg	IL	-90.81861	41.241386	2024-07-23 13:03:09.811	2024-08-11 06:44:29.124099
921	Millington	IL	-88.598526	41.562824	2024-07-23 13:03:09.811	2024-08-11 06:44:29.316027
922	Millstadt	IL	-90.09166	38.46143	2024-07-23 13:03:09.811	2024-08-11 06:44:29.504049
923	Milmine	IL	-88.65046	39.907448	2024-07-23 13:03:09.811	2024-08-11 06:44:29.709939
924	Milton	IL	-90.14813	38.900105	2024-07-23 13:03:09.811	2024-08-11 06:44:29.909284
925	Mineral	IL	-89.838615	41.38205	2024-07-23 13:03:09.811	2024-08-11 06:44:30.099064
926	Minier	IL	-89.31475	40.43362	2024-07-23 13:03:09.811	2024-08-11 06:44:30.276117
927	Minonk	IL	-89.03379	40.90179	2024-07-23 13:03:09.811	2024-08-11 06:44:30.452269
928	Minooka	IL	-88.2714	41.455017	2024-07-23 13:03:09.811	2024-08-11 06:44:30.622291
929	Mitchell	IL	-90.0854	38.76161	2024-07-23 13:03:09.811	2024-08-11 06:44:30.82241
930	Mode	IL	-88.73387	39.266373	2024-07-23 13:03:09.811	2024-08-11 06:44:31.019806
931	Modesto	IL	-89.98204	39.478214	2024-07-23 13:03:09.811	2024-08-11 06:44:31.216047
932	Modoc	IL	-90.038765	38.05368	2024-07-23 13:03:09.811	2024-08-11 06:44:31.430544
933	Mokena	IL	-87.886406	41.531574	2024-07-23 13:03:09.811	2024-08-11 06:44:31.612288
935	Momence	IL	-87.66275	41.164146	2024-07-23 13:03:09.811	2024-08-11 06:44:32.005419
936	Monee	IL	-87.74222	41.419937	2024-07-23 13:03:09.811	2024-08-11 06:44:32.197048
937	Monmouth	IL	-90.64826	40.911465	2024-07-23 13:03:09.811	2024-08-11 06:44:32.384815
938	Monroe Center	IL	-89.000534	42.098137	2024-07-23 13:03:09.811	2024-08-11 06:44:32.557207
939	Montgomery	IL	-88.340195	41.72991	2024-07-23 13:03:09.811	2024-08-11 06:44:32.734537
940	Monticello	IL	-88.573654	40.025555	2024-07-23 13:03:09.811	2024-08-11 06:44:32.925976
941	Montrose	IL	-88.38139	39.16422	2024-07-23 13:03:09.811	2024-08-11 06:44:33.125864
942	Mooseheart	IL	-88.33462	41.82403	2024-07-23 13:03:09.811	2024-08-11 06:44:33.313487
943	Moro	IL	-90.02168	38.924637	2024-07-23 13:03:09.811	2024-08-11 06:44:33.519169
944	Morris	IL	-88.42373	41.35733	2024-07-23 13:03:09.811	2024-08-11 06:44:33.72053
946	Morrisonville	IL	-89.45545	39.418594	2024-07-23 13:03:09.811	2024-08-11 06:44:34.069003
947	Morton	IL	-89.46181	40.610313	2024-07-23 13:03:09.811	2024-08-11 06:44:34.262625
948	Morton Grove	IL	-87.778786	42.04092	2024-07-23 13:03:09.811	2024-08-11 06:44:34.4328
949	Mossville	IL	-89.56746	40.81521	2024-07-23 13:03:09.811	2024-08-11 06:44:34.617549
950	Mound City	IL	-89.162186	37.0889	2024-07-23 13:03:09.811	2024-08-11 06:44:34.780282
951	Mound Station	IL	-90.87244	40.00665	2024-07-23 13:03:09.811	2024-08-11 06:44:34.930188
952	Mounds	IL	-89.200874	37.114353	2024-07-23 13:03:09.811	2024-08-11 06:44:35.10064
954	Mount Carmel	IL	-88.07252	41.531628	2024-07-23 13:03:09.811	2024-08-11 06:44:35.504599
955	Mount Carroll	IL	-89.97774	42.101353	2024-07-23 13:03:09.811	2024-08-11 06:44:35.683225
956	Mount Clare	IL	-89.8259	39.099445	2024-07-23 13:03:09.811	2024-08-11 06:44:35.864937
957	Mount Erie	IL	-88.231255	38.51515	2024-07-23 13:03:09.811	2024-08-11 06:44:36.037132
958	Mount Morris	IL	-89.43342	42.049553	2024-07-23 13:03:09.811	2024-08-11 06:44:36.202326
959	Mount Olive	IL	-89.72709	39.07215	2024-07-23 13:03:09.811	2024-08-11 06:44:36.398964
960	Mount Prospect	IL	-87.93676	42.06365	2024-07-23 13:03:09.811	2024-08-11 06:44:36.572721
961	Mount Pulaski	IL	-89.28385	40.0096	2024-07-23 13:03:09.811	2024-08-11 06:44:36.746163
963	Mount Vernon	IL	-88.90371	38.31769	2024-07-23 13:03:09.811	2024-08-11 06:44:37.100118
964	Mount Zion	IL	-88.874756	39.771873	2024-07-23 13:03:09.811	2024-08-11 06:44:37.279904
965	Moweaqua	IL	-89.01978	39.62498	2024-07-23 13:03:09.811	2024-08-11 06:44:37.453173
966	Mt Zion	IL	-88.874756	39.771873	2024-07-23 13:03:09.811	2024-08-11 06:44:37.631926
967	Muddy	IL	-88.51711	37.76522	2024-07-23 13:03:09.811	2024-08-11 06:44:37.80393
968	Mulberry Grove	IL	-89.26902	38.924946	2024-07-23 13:03:09.811	2024-08-11 06:44:37.98454
969	Mulkeytown	IL	-89.11183	37.968376	2024-07-23 13:03:09.811	2024-08-11 06:44:38.165848
970	Muncie	IL	-87.84482	40.11542	2024-07-23 13:03:09.811	2024-08-11 06:44:38.344329
971	Mundelein	IL	-88.004	42.26961	2024-07-23 13:03:09.811	2024-08-11 06:44:38.506073
972	Murdock	IL	-88.079895	39.80026	2024-07-23 13:03:09.811	2024-08-11 06:44:38.695458
973	Murphysboro	IL	-89.33448	37.76432	2024-07-23 13:03:09.811	2024-08-11 06:44:38.868593
975	Nachusa	IL	-89.39027	41.832718	2024-07-23 13:03:09.811	2024-08-11 06:44:39.202042
976	Naperville	IL	-88.14801	41.771503	2024-07-23 13:03:09.811	2024-08-11 06:44:39.377527
977	Naplate	IL	-88.87817	41.33375	2024-07-23 13:03:09.811	2024-08-11 06:44:39.555696
978	Naples	IL	-90.60741	39.756264	2024-07-23 13:03:09.811	2024-08-11 06:44:39.770814
979	Nashville	IL	-89.38297	38.3437	2024-07-23 13:03:09.811	2024-08-11 06:44:39.965338
980	Nason	IL	-88.96738	38.17634	2024-07-23 13:03:09.811	2024-08-11 06:44:40.160471
981	Nauvoo	IL	-91.38178	40.549797	2024-07-23 13:03:09.811	2024-08-11 06:44:40.317947
982	Nebo	IL	-90.79068	39.443188	2024-07-23 13:03:09.811	2024-08-11 06:44:40.543396
983	Nekoma	IL	-90.18888	41.1729	2024-07-23 13:03:09.811	2024-08-11 06:44:40.713567
984	Nelson	IL	-89.60195	41.79647	2024-07-23 13:03:09.811	2024-08-11 06:44:40.918673
986	Neponset	IL	-89.7894	41.29653	2024-07-23 13:03:09.811	2024-08-11 06:44:41.260381
987	New Athens	IL	-89.87896	38.32567	2024-07-23 13:03:09.811	2024-08-11 06:44:41.405711
989	New Bedford	IL	-89.72006	41.512505	2024-07-23 13:03:09.811	2024-08-11 06:44:41.777495
990	New Berlin	IL	-89.91224	39.72483	2024-07-23 13:03:09.811	2024-08-11 06:44:41.925759
991	New Boston	IL	-90.99773	41.169643	2024-07-23 13:03:09.811	2024-08-11 06:44:42.099277
992	New Burnside	IL	-88.771	37.579018	2024-07-23 13:03:09.811	2024-08-11 06:44:42.259957
993	New Canton	IL	-91.09601	39.636482	2024-07-23 13:03:09.811	2024-08-11 06:44:42.418889
995	New Grand Chain	IL	-89.02129	37.2521	2024-07-23 13:03:09.812	2024-08-11 06:44:42.761151
996	New Haven	IL	-88.126076	37.907127	2024-07-23 13:03:09.812	2024-08-11 06:44:42.967631
997	New Holland	IL	-89.580376	40.183956	2024-07-23 13:03:09.812	2024-08-11 06:44:43.154099
998	New Lenox	IL	-87.966385	41.51219	2024-07-23 13:03:09.812	2024-08-11 06:44:43.30313
999	New Memphis	IL	-89.67783	38.479424	2024-07-23 13:03:09.812	2024-08-11 06:44:43.477045
1000	New Milford	IL	-89.06607	42.187187	2024-07-23 13:03:09.812	2024-08-11 06:44:43.660707
1001	New Minden	IL	-89.37038	38.44171	2024-07-23 13:03:09.812	2024-08-11 06:44:43.86979
1002	New Salem	IL	-90.84789	39.707634	2024-07-23 13:03:09.812	2024-08-11 06:44:44.065613
1003	New Windsor	IL	-90.44204	41.202404	2024-07-23 13:03:09.812	2024-08-11 06:44:44.200178
1004	Newark	IL	-88.583466	41.53701	2024-07-23 13:03:09.812	2024-08-11 06:44:44.398716
1005	Newman	IL	-87.98423	39.796875	2024-07-23 13:03:09.812	2024-08-11 06:44:44.583395
1006	Newton	IL	-88.161224	38.99093	2024-07-23 13:03:09.812	2024-08-11 06:44:44.813746
1008	Niles	IL	-87.812562	42.029729	2024-07-23 13:03:09.812	2024-08-11 06:44:45.231861
1009	Nilwood	IL	-89.80848	39.39826	2024-07-23 13:03:09.812	2024-08-11 06:44:45.417179
1010	Niota	IL	-91.28777	40.617527	2024-07-23 13:03:09.812	2024-08-11 06:44:45.619974
1011	Noble	IL	-88.22348	38.697414	2024-07-23 13:03:09.812	2024-08-11 06:44:45.851855
1012	Nokomis	IL	-89.28535	39.30119	2024-07-23 13:03:09.812	2024-08-11 06:44:46.130735
1013	Nora	IL	-89.94518	42.455807	2024-07-23 13:03:09.812	2024-08-11 06:44:46.310199
1014	Normal	IL	-88.98436	40.510406	2024-07-23 13:03:09.812	2024-08-11 06:44:46.490455
1015	Norridge	IL	-87.826775	41.96319	2024-07-23 13:03:09.812	2024-08-11 06:44:46.677763
1016	Norris	IL	-90.032104	40.625748	2024-07-23 13:03:09.812	2024-08-11 06:44:46.92402
1018	North Aurora	IL	-88.32698	41.80601	2024-07-23 13:03:09.812	2024-08-11 06:44:47.260823
1019	North Barrington	IL	-88.14071	42.20796	2024-07-23 13:03:09.812	2024-08-11 06:44:47.444147
1020	North Chicago	IL	-87.83944	42.327335	2024-07-23 13:03:09.812	2024-08-11 06:44:47.654394
1021	North City	IL	-89.06282	37.994244	2024-07-23 13:03:09.814	2024-08-11 06:44:47.822919
1022	North Henderson	IL	-90.47339	41.08944	2024-07-23 13:03:09.814	2024-08-11 06:44:48.005136
1023	North Pekin	IL	-89.6223	40.615093	2024-07-23 13:03:09.814	2024-08-11 06:44:48.192839
1024	North Riverside	IL	-87.82307	41.8471	2024-07-23 13:03:09.814	2024-08-11 06:44:48.37899
1025	North Utica	IL	-89.01444	41.346336	2024-07-23 13:03:09.815	2024-08-11 06:44:48.563573
1026	Northbrook	IL	-87.8288	42.12731	2024-07-23 13:03:09.815	2024-08-11 06:44:48.78416
1027	Northfield	IL	-87.78057	42.09976	2024-07-23 13:03:09.815	2024-08-11 06:44:48.985276
1028	Northlake	IL	-87.89636	41.916817	2024-07-23 13:03:09.815	2024-08-11 06:44:49.222205
1029	Norwood	IL	-89.69883	40.705738	2024-07-23 13:03:09.815	2024-08-11 06:44:49.436841
1030	O'Fallon	IL	-89.911	38.592278	2024-07-23 13:03:09.815	2024-08-11 06:44:49.844309
1031	Oak Brook	IL	-87.928696	41.83287	2024-07-23 13:03:09.815	2024-08-11 06:44:50.368358
1032	Oak Forest	IL	-87.74383	41.603127	2024-07-23 13:03:09.815	2024-08-11 06:44:50.718054
1034	Oak Lawn	IL	-87.758125	41.71159	2024-07-23 13:03:09.815	2024-08-11 06:44:51.586778
1035	Oak Park	IL	-87.78796	41.888424	2024-07-23 13:03:09.815	2024-08-11 06:44:52.118234
1036	Oak Run	IL	-90.14512	40.9633	2024-07-23 13:03:09.815	2024-08-11 06:44:52.565286
1037	Oakbrook Terrace	IL	-87.96401	41.849854	2024-07-23 13:03:09.815	2024-08-11 06:44:52.804977
1038	Oakdale	IL	-89.50356	38.261658	2024-07-23 13:03:09.815	2024-08-11 06:44:53.020936
1039	Oakford	IL	-89.96691	40.102455	2024-07-23 13:03:09.815	2024-08-11 06:44:53.216444
1040	Oakland	IL	-87.606755	41.818622	2024-07-23 13:03:09.815	2024-08-11 06:44:53.458066
1041	Oakwood	IL	-87.77822	40.114624	2024-07-23 13:03:09.815	2024-08-11 06:44:53.669513
1042	Oakwood Hills	IL	-88.24252	42.246315	2024-07-23 13:03:09.815	2024-08-11 06:44:53.842817
1043	Oblong	IL	-87.90892	39.001835	2024-07-23 13:03:09.815	2024-08-11 06:44:54.027883
1044	Oconee	IL	-89.10852	39.28592	2024-07-23 13:03:09.815	2024-08-11 06:44:54.220145
1045	Odell	IL	-88.52515	41.003517	2024-07-23 13:03:09.815	2024-08-11 06:44:54.449171
1046	Odin	IL	-89.0527	38.61522	2024-07-23 13:03:09.815	2024-08-11 06:44:54.651825
1048	Oglesby	IL	-89.06071	41.295097	2024-07-23 13:03:09.815	2024-08-11 06:44:55.032945
1049	Ohio	IL	-89.461555	41.557552	2024-07-23 13:03:09.815	2024-08-11 06:44:55.261295
1050	Ohlman	IL	-89.217735	39.345703	2024-07-23 13:03:09.815	2024-08-11 06:44:55.44489
1051	Okawville	IL	-89.55059	38.43432	2024-07-23 13:03:09.815	2024-08-11 06:44:55.639454
1052	Old Mill Creek	IL	-87.972626	42.420784	2024-07-23 13:03:09.815	2024-08-11 06:44:55.81718
1053	Old Ripley	IL	-89.57023	38.896027	2024-07-23 13:03:09.815	2024-08-11 06:44:56.019936
1054	Old Shawneetown	IL	-88.13607	37.700237	2024-07-23 13:03:09.815	2024-08-11 06:44:56.17697
1055	Olive Branch	IL	-90.132011	38.710959	2024-07-23 13:03:09.815	2024-08-11 06:44:56.368745
1056	Olmsted	IL	-89.08897	37.180584	2024-07-23 13:03:09.815	2024-08-11 06:44:56.562
1058	Olympia Fields	IL	-87.67647	41.51343	2024-07-23 13:03:09.815	2024-08-11 06:44:56.944047
1059	Omaha	IL	-88.30266	37.89019	2024-07-23 13:03:09.815	2024-08-11 06:44:57.129571
1060	Onarga	IL	-88.00628	40.714863	2024-07-23 13:03:09.815	2024-08-11 06:44:57.284075
1061	Oneida	IL	-90.22202	41.0723	2024-07-23 13:03:09.815	2024-08-11 06:44:57.541368
1062	Opdyke	IL	-88.79061	38.25973	2024-07-23 13:03:09.815	2024-08-11 06:44:57.718283
1063	Ophiem	IL	-90.38744	41.25248	2024-07-23 13:03:09.815	2024-08-11 06:44:57.918273
1065	Orangeville	IL	-89.64657	42.468636	2024-07-23 13:03:09.815	2024-08-11 06:44:58.433917
1066	Oreana	IL	-88.86795	39.937428	2024-07-23 13:03:09.815	2024-08-11 06:44:58.663221
1067	Oregon	IL	-89.33251	42.01463	2024-07-23 13:03:09.815	2024-08-11 06:44:58.88435
1068	Orient	IL	-89.950775	38.794635	2024-07-23 13:03:09.815	2024-08-11 06:44:59.250223
1069	Orion	IL	-90.3815	41.353764	2024-07-23 13:03:09.815	2024-08-11 06:44:59.470927
1070	Orland Hills	IL	-87.843864	41.58689	2024-07-23 13:03:09.815	2024-08-11 06:44:59.686625
1072	Osco	IL	-90.28015	41.347153	2024-07-23 13:03:09.815	2024-08-11 06:45:00.072672
1073	Oswego	IL	-88.35157	41.682957	2024-07-23 13:03:09.815	2024-08-11 06:45:00.285031
1074	Ottawa	IL	-88.84264	41.346844	2024-07-23 13:03:09.815	2024-08-11 06:45:00.516379
1075	Otterville	IL	-90.39842	39.050022	2024-07-23 13:03:09.815	2024-08-11 06:45:00.729988
1076	Owaneco	IL	-89.19271	39.481216	2024-07-23 13:03:09.817	2024-08-11 06:45:00.914221
1077	Oxville	IL	-90.56133	39.704666	2024-07-23 13:03:09.817	2024-08-11 06:45:01.106323
1078	Ozark	IL	-88.76328	37.54232	2024-07-23 13:03:09.817	2024-08-11 06:45:01.316653
1079	Palatine	IL	-88.033966	42.11027	2024-07-23 13:03:09.817	2024-08-11 06:45:01.558692
1080	Palestine	IL	-87.6128	39.002834	2024-07-23 13:03:09.817	2024-08-11 06:45:01.766432
1081	Palmer	IL	-89.402985	39.45708	2024-07-23 13:03:09.817	2024-08-11 06:45:01.991466
1082	Palmyra	IL	-89.99568	39.434402	2024-07-23 13:03:09.817	2024-08-11 06:45:02.241916
1083	Paloma	IL	-91.20154	40.02198	2024-07-23 13:03:09.817	2024-08-11 06:45:02.426517
1085	Palos Hills	IL	-87.81725	41.704033	2024-07-23 13:03:09.817	2024-08-11 06:45:02.739752
1086	Palos Park	IL	-87.8401	41.667133	2024-07-23 13:03:09.817	2024-08-11 06:45:02.912701
1088	Panama	IL	-89.52479	39.029488	2024-07-23 13:03:09.817	2024-08-11 06:45:03.284046
1089	Panola	IL	-89.0211	40.7838	2024-07-23 13:03:09.817	2024-08-11 06:45:03.460841
1090	Papineau	IL	-87.71753	40.970165	2024-07-23 13:03:09.817	2024-08-11 06:45:03.613555
1091	Paris	IL	-87.69498	39.61223	2024-07-23 13:03:09.817	2024-08-11 06:45:03.809063
1092	Park City	IL	-87.88508	42.349804	2024-07-23 13:03:09.817	2024-08-11 06:45:04.02534
1093	Park Forest	IL	-87.679825	41.483147	2024-07-23 13:03:09.817	2024-08-11 06:45:04.229982
1094	Park Ridge	IL	-87.82956	42.011276	2024-07-23 13:03:09.817	2024-08-11 06:45:04.40934
1095	Parkersburg	IL	-88.0565	38.589764	2024-07-23 13:03:09.817	2024-08-11 06:45:04.56708
1096	Patoka	IL	-89.09815	38.75419	2024-07-23 13:03:09.817	2024-08-11 06:45:04.746825
1097	Patterson	IL	-90.48383	39.480507	2024-07-23 13:03:09.817	2024-08-11 06:45:04.937995
1099	Pawnee	IL	-89.581345	39.592407	2024-07-23 13:03:09.817	2024-08-11 06:45:05.288907
1100	Paxton	IL	-88.097374	40.46087	2024-07-23 13:03:09.817	2024-08-11 06:45:05.52364
1101	Payson	IL	-91.24657	39.81745	2024-07-23 13:03:09.817	2024-08-11 06:45:05.716575
1102	Pearl	IL	-90.6278	39.459843	2024-07-23 13:03:09.817	2024-08-11 06:45:05.965094
1103	Pearl City	IL	-89.82622	42.265434	2024-07-23 13:03:09.817	2024-08-11 06:45:06.102648
1104	Pecatonica	IL	-89.35939	42.312828	2024-07-23 13:03:09.817	2024-08-11 06:45:06.255541
1105	Pekin	IL	-89.6479	40.570557	2024-07-23 13:03:09.817	2024-08-11 06:45:06.437313
1106	Pembroke Township	IL	-87.55488	41.060905	2024-07-23 13:03:09.817	2024-08-11 06:45:06.572061
1107	Penfield	IL	-87.948975	40.303562	2024-07-23 13:03:09.817	2024-08-11 06:45:06.744481
1108	Peoria	IL	-89.59058	40.692806	2024-07-23 13:03:09.817	2024-08-11 06:45:06.913679
1110	Peotone	IL	-87.790825	41.33438	2024-07-23 13:03:09.817	2024-08-11 06:45:07.257611
1111	Percy	IL	-89.6177	38.01663	2024-07-23 13:03:09.817	2024-08-11 06:45:07.48269
1112	Perry	IL	-90.745636	39.78185	2024-07-23 13:03:09.817	2024-08-11 06:45:07.6949
1113	Peru	IL	-89.12915	41.327618	2024-07-23 13:03:09.817	2024-08-11 06:45:07.894862
1114	Pesotum	IL	-88.273476	39.91451	2024-07-23 13:03:09.817	2024-08-11 06:45:08.062627
1115	Petersburg	IL	-89.84837	40.01116	2024-07-23 13:03:09.817	2024-08-11 06:45:08.254801
1116	Phillipstown	IL	-88.02209	38.14226	2024-07-23 13:03:09.817	2024-08-11 06:45:08.424781
1117	Philo	IL	-88.15793	40.00701	2024-07-23 13:03:09.817	2024-08-11 06:45:08.630801
1119	Piasa	IL	-90.12513	39.11619	2024-07-23 13:03:09.817	2024-08-11 06:45:09.009848
1120	Pierron	IL	-89.59812	38.779724	2024-07-23 13:03:09.817	2024-08-11 06:45:09.204992
1121	Pinckneyville	IL	-89.38195	38.08013	2024-07-23 13:03:09.817	2024-08-11 06:45:09.395934
1122	Pingree Grove	IL	-88.41358	42.068584	2024-07-23 13:03:09.817	2024-08-11 06:45:09.555091
1123	Piper City	IL	-88.19037	40.758858	2024-07-23 13:03:09.817	2024-08-11 06:45:09.739325
1124	Pistakee Highlands	IL	-88.20653	42.408485	2024-07-23 13:03:09.817	2024-08-11 06:45:09.875213
1125	Pittsburg	IL	-88.850685	37.777122	2024-07-23 13:03:09.817	2024-08-11 06:45:10.041016
1126	Pittsfield	IL	-90.806114	39.606796	2024-07-23 13:03:09.817	2024-08-11 06:45:10.210995
1127	Plainfield	IL	-88.20512	41.608467	2024-07-23 13:03:09.817	2024-08-11 06:45:10.38779
1128	Plainville	IL	-91.18245	39.785915	2024-07-23 13:03:09.817	2024-08-11 06:45:10.641926
1129	Plano	IL	-88.537254	41.66268	2024-07-23 13:03:09.817	2024-08-11 06:45:10.823352
1130	Plattville	IL	-88.38368	41.531246	2024-07-23 13:03:09.817	2024-08-11 06:45:10.97526
1132	Pleasant Plains	IL	-89.92068	39.872726	2024-07-23 13:03:09.818	2024-08-11 06:45:11.333581
1133	Plum Valley	IL	-87.55677	41.459496	2024-07-23 13:03:09.818	2024-08-11 06:45:11.486992
1134	Plymouth	IL	-90.918655	40.291782	2024-07-23 13:03:09.818	2024-08-11 06:45:11.696453
1135	Pocahontas	IL	-89.54081	38.829044	2024-07-23 13:03:09.818	2024-08-11 06:45:11.884698
1136	Polo	IL	-89.57883	41.986164	2024-07-23 13:03:09.818	2024-08-11 06:45:12.133513
1137	Pomona	IL	-89.336876	37.62821	2024-07-23 13:03:09.818	2024-08-11 06:45:12.350658
1138	Pontiac	IL	-88.62867	40.881172	2024-07-23 13:03:09.818	2024-08-11 06:45:12.565804
1139	Pontoon Beach	IL	-90.08047	38.731583	2024-07-23 13:03:09.818	2024-08-11 06:45:12.759532
1140	Pontoosuc	IL	-91.20531	40.629208	2024-07-23 13:03:09.818	2024-08-11 06:45:12.943212
1141	Poplar Grove	IL	-88.82214	42.368263	2024-07-23 13:03:09.818	2024-08-11 06:45:13.116103
1142	Port Barrington	IL	-88.20182	42.242756	2024-07-23 13:03:09.819	2024-08-11 06:45:13.296977
1143	Port Byron	IL	-90.335075	41.60757	2024-07-23 13:03:09.819	2024-08-11 06:45:13.487991
1144	Posen	IL	-87.68009	41.626328	2024-07-23 13:03:09.819	2024-08-11 06:45:13.698439
1146	Prairie City	IL	-90.462265	40.621	2024-07-23 13:03:09.819	2024-08-11 06:45:14.060466
1147	Prairie Du Rocher	IL	-90.09721	38.08505	2024-07-23 13:03:09.819	2024-08-11 06:45:14.208661
1148	Prairie Grove	IL	-88.26104	42.284943	2024-07-23 13:03:09.819	2024-08-11 06:45:14.380093
1149	Prairie Rocher	IL	-89.94295	38.17122	2024-07-23 13:03:09.819	2024-08-11 06:45:14.579078
1150	Prairietown	IL	-89.92144	38.966415	2024-07-23 13:03:09.819	2024-08-11 06:45:14.747014
1151	Preemption	IL	-90.58474000000001	41.312099	2024-07-23 13:03:09.819	2024-08-11 06:45:14.899109
1152	Prestbury	IL	-88.426315	41.782604	2024-07-23 13:03:09.819	2024-08-11 06:45:15.043566
1153	Preston Heights	IL	-88.08065	41.492302	2024-07-23 13:03:09.819	2024-08-11 06:45:15.198329
1154	Princeton	IL	-89.46502	41.371765	2024-07-23 13:03:09.819	2024-08-11 06:45:15.380811
1156	Prophetstown	IL	-89.93604	41.671062	2024-07-23 13:03:09.819	2024-08-11 06:45:15.726987
1157	Prospect Heights	IL	-87.93677	42.095287	2024-07-23 13:03:09.819	2024-08-11 06:45:15.900753
1158	Pulaski	IL	-89.205956	37.2124	2024-07-23 13:03:09.819	2024-08-11 06:45:16.093601
1159	Putnam	IL	-89.39412	41.181767	2024-07-23 13:03:09.819	2024-08-11 06:45:16.320234
1160	Quincy	IL	-91.40677	39.931915	2024-07-23 13:03:09.819	2024-08-11 06:45:16.502671
1161	Radom	IL	-89.19545	38.28099	2024-07-23 13:03:09.819	2024-08-11 06:45:16.68984
1162	Raleigh	IL	-88.53317	37.827282	2024-07-23 13:03:09.819	2024-08-11 06:45:16.882515
1163	Ramsey	IL	-89.10827	39.141212	2024-07-23 13:03:09.819	2024-08-11 06:45:17.077185
1164	Rankin	IL	-87.89669	40.46425	2024-07-23 13:03:09.819	2024-08-11 06:45:17.302506
1165	Ransom	IL	-88.64845	41.15675	2024-07-23 13:03:09.819	2024-08-11 06:45:17.503404
1167	Rapids City	IL	-90.35039	41.579597	2024-07-23 13:03:09.819	2024-08-11 06:45:17.818467
1168	Raritan	IL	-90.82695	40.695976	2024-07-23 13:03:09.819	2024-08-11 06:45:17.985342
1169	Raymond	IL	-89.57185	39.319714	2024-07-23 13:03:09.819	2024-08-11 06:45:18.202046
1170	Red Bud	IL	-89.99408	38.211735	2024-07-23 13:03:09.819	2024-08-11 06:45:18.383625
1171	Reddick	IL	-88.25035	41.098553	2024-07-23 13:03:09.819	2024-08-11 06:45:18.565242
1172	Redmon	IL	-87.86148	39.64385	2024-07-23 13:03:09.819	2024-08-11 06:45:18.754873
1173	Renault	IL	-90.13412	38.152786	2024-07-23 13:03:09.819	2024-08-11 06:45:18.934413
1174	Rest Haven	IL	-88.136086	41.262047	2024-07-23 13:03:09.819	2024-08-11 06:45:19.105821
1175	Reynolds	IL	-90.66859	41.329994	2024-07-23 13:03:09.819	2024-08-11 06:45:19.295264
1176	Richmond	IL	-88.3061	42.47593	2024-07-23 13:03:09.819	2024-08-11 06:45:19.4853
1177	Richton Park	IL	-87.70631	41.484406	2024-07-23 13:03:09.819	2024-08-11 06:45:19.665942
1178	Richview	IL	-89.1813	38.37716	2024-07-23 13:03:09.819	2024-08-11 06:45:19.836014
1179	Ridge Farm	IL	-87.65198	39.895668	2024-07-23 13:03:09.819	2024-08-11 06:45:20.01356
1180	Ridgefield	IL	-88.361176	42.26893	2024-07-23 13:03:09.819	2024-08-11 06:45:20.179966
1182	Ridgway	IL	-88.2612	37.799194	2024-07-23 13:03:09.819	2024-08-11 06:45:20.532227
1183	Ridott	IL	-89.47543	42.29657	2024-07-23 13:03:09.819	2024-08-11 06:45:20.673931
1184	Riggston	IL	-90.421585	39.695015	2024-07-23 13:03:09.819	2024-08-11 06:45:20.813736
1186	Ringwood	IL	-88.30051	42.392952	2024-07-23 13:03:09.819	2024-08-11 06:45:21.145429
1187	Rio	IL	-90.3972	41.107925	2024-07-23 13:03:09.819	2024-08-11 06:45:21.324006
1188	Ripley	IL	-90.63801	40.02218	2024-07-23 13:03:09.819	2024-08-11 06:45:21.535864
1189	Ritchie	IL	-88.10557	41.254936	2024-07-23 13:03:09.819	2024-08-11 06:45:21.731432
1191	River Grove	IL	-87.83577	41.92864	2024-07-23 13:03:09.819	2024-08-11 06:45:22.106304
1192	Riverdale	IL	-87.628105	41.633427	2024-07-23 13:03:09.82	2024-08-11 06:45:22.315901
1193	Riverside	IL	-87.819824	41.82844	2024-07-23 13:03:09.821	2024-08-11 06:45:22.524121
1194	Riverton	IL	-89.53953	39.849575	2024-07-23 13:03:09.821	2024-08-11 06:45:22.747356
1195	Riverwoods	IL	-87.897	42.167515	2024-07-23 13:03:09.821	2024-08-11 06:45:22.926849
1196	Roanoke	IL	-87.63208	41.881573	2024-07-23 13:03:09.821	2024-08-11 06:45:23.119163
1197	Robbins	IL	-87.707504	41.644028	2024-07-23 13:03:09.821	2024-08-11 06:45:23.30781
1198	Roberts	IL	-88.18255	40.613117	2024-07-23 13:03:09.821	2024-08-11 06:45:23.50858
1199	Robinson	IL	-87.73936	39.005836	2024-07-23 13:03:09.821	2024-08-11 06:45:23.697996
1200	Rochelle	IL	-89.067566	41.922726	2024-07-23 13:03:09.821	2024-08-11 06:45:23.89921
1201	Rochester	IL	-89.53633	39.749393	2024-07-23 13:03:09.821	2024-08-11 06:45:24.092727
1202	Rock City	IL	-89.46865	42.411205	2024-07-23 13:03:09.821	2024-08-11 06:45:24.251541
1203	Rock Falls	IL	-89.691734	41.78217	2024-07-23 13:03:09.821	2024-08-11 06:45:24.401877
1204	Rock Island	IL	-90.57323	41.51105	2024-07-23 13:03:09.821	2024-08-11 06:45:24.630853
1206	Rockbridge	IL	-90.19951	39.270374	2024-07-23 13:03:09.821	2024-08-11 06:45:24.986158
1207	Rockdale	IL	-88.11211	41.50522	2024-07-23 13:03:09.821	2024-08-11 06:45:25.239108
1208	Rockford	IL	-89.09582	42.271782	2024-07-23 13:03:09.821	2024-08-11 06:45:25.413225
1209	Rockport	IL	-91.00881	39.538994	2024-07-23 13:03:09.821	2024-08-11 06:45:25.588622
1210	Rockton	IL	-89.07248	42.45252	2024-07-23 13:03:09.821	2024-08-11 06:45:25.782977
1211	Rockwood	IL	-89.7005	37.84041	2024-07-23 13:03:09.821	2024-08-11 06:45:25.985545
1212	Rolling Meadows	IL	-88.014046	42.083782	2024-07-23 13:03:09.821	2024-08-11 06:45:26.161644
1213	Rome	IL	-89.50291	40.882534	2024-07-23 13:03:09.821	2024-08-11 06:45:26.396438
1214	Romeoville	IL	-88.08028	41.654682	2024-07-23 13:03:09.821	2024-08-11 06:45:26.585998
1215	Roodhouse	IL	-90.37374	39.48327	2024-07-23 13:03:09.821	2024-08-11 06:45:26.735787
1216	Rosamond	IL	-89.159874	39.380146	2024-07-23 13:03:09.821	2024-08-11 06:45:26.930857
1217	Roscoe	IL	-89.00948	42.413055	2024-07-23 13:03:09.821	2024-08-11 06:45:27.118991
1218	Rose Hill	IL	-88.147964	39.10462	2024-07-23 13:03:09.821	2024-08-11 06:45:27.292477
1219	Roselle	IL	-88.077415	41.98402	2024-07-23 13:03:09.821	2024-08-11 06:45:27.484142
1220	Rosemont	IL	-87.87584	41.99442	2024-07-23 13:03:09.821	2024-08-11 06:45:27.665505
1221	Roseville	IL	-90.66409	40.732365	2024-07-23 13:03:09.821	2024-08-11 06:45:27.840447
1222	Rosewood Heights	IL	-90.069305	38.89164	2024-07-23 13:03:09.821	2024-08-11 06:45:27.995321
1223	Rosiclare	IL	-88.344864	37.419556	2024-07-23 13:03:09.821	2024-08-11 06:45:28.153604
1224	Rossville	IL	-87.66897	40.379246	2024-07-23 13:03:09.821	2024-08-11 06:45:28.345071
1225	Round Lake	IL	-88.09335	42.35395	2024-07-23 13:03:09.821	2024-08-11 06:45:28.550225
1227	Round Lake Heights	IL	-88.105606	42.379395	2024-07-23 13:03:09.821	2024-08-11 06:45:28.91971
1228	Round Lake Park	IL	-88.07667	42.35715	2024-07-23 13:03:09.821	2024-08-11 06:45:29.110122
1229	Roxana	IL	-90.0789	38.848618	2024-07-23 13:03:09.821	2024-08-11 06:45:29.308818
1230	Royal	IL	-87.97353	40.192688	2024-07-23 13:03:09.821	2024-08-11 06:45:29.522799
1231	Royal Lakes	IL	-89.961	39.11042	2024-07-23 13:03:09.821	2024-08-11 06:45:29.704848
1232	Royalton	IL	-89.11428	37.879612	2024-07-23 13:03:09.821	2024-08-11 06:45:29.877807
1233	Ruma	IL	-89.997986	38.134987	2024-07-23 13:03:09.822	2024-08-11 06:45:30.082752
1234	Rushville	IL	-90.56361	40.12063	2024-07-23 13:03:09.823	2024-08-11 06:45:30.262357
1235	Russell	IL	-87.91263	42.490463	2024-07-23 13:03:09.823	2024-08-11 06:45:30.46242
1236	Russellville	IL	-87.53204	38.819023	2024-07-23 13:03:09.823	2024-08-11 06:45:30.655546
1237	Rutland	IL	-89.04175	40.98443	2024-07-23 13:03:09.823	2024-08-11 06:45:30.849898
1238	Sadorus	IL	-88.34626	39.966583	2024-07-23 13:03:09.823	2024-08-11 06:45:31.022488
1239	Sailor Springs	IL	-88.36206	38.76423	2024-07-23 13:03:09.823	2024-08-11 06:45:31.183459
1241	Saint Augustine	IL	-90.411125	40.718147	2024-07-23 13:03:09.823	2024-08-11 06:45:31.56898
1242	Saint Charles	IL	-88.31554	41.913376	2024-07-23 13:03:09.823	2024-08-11 06:45:31.753026
1243	Saint David	IL	-90.052315	40.491528	2024-07-23 13:03:09.823	2024-08-11 06:45:31.922874
1244	Saint Elmo	IL	-88.84862	39.02732	2024-07-23 13:03:09.823	2024-08-11 06:45:32.098565
1245	Saint Francisville	IL	-87.64822	38.59146	2024-07-23 13:03:09.823	2024-08-11 06:45:32.274668
1246	Saint Jacob	IL	-89.76838	38.717346	2024-07-23 13:03:09.823	2024-08-11 06:45:32.467784
1247	Saint Joseph	IL	-88.04168	40.111423	2024-07-23 13:03:09.823	2024-08-11 06:45:32.698605
1248	Saint Libory	IL	-89.71068	38.360474	2024-07-23 13:03:09.823	2024-08-11 06:45:32.879124
1249	Saint Peter	IL	-88.854095	38.868008	2024-07-23 13:03:09.823	2024-08-11 06:45:33.057572
1250	Sainte Marie	IL	-88.02346	38.932404	2024-07-23 13:03:09.823	2024-08-11 06:45:33.222105
1251	Salem	IL	-88.94566	38.62708	2024-07-23 13:03:09.823	2024-08-11 06:45:33.441275
1252	Sammons Point	IL	-87.85033	41.047867	2024-07-23 13:03:09.823	2024-08-11 06:45:33.589887
1254	Sandoval	IL	-89.11953	38.615765	2024-07-23 13:03:09.823	2024-08-11 06:45:33.931762
1255	Sandwich	IL	-88.62173	41.644135	2024-07-23 13:03:09.823	2024-08-11 06:45:34.135797
1256	Sauget	IL	-90.166824	38.587143	2024-07-23 13:03:09.823	2024-08-11 06:45:34.318027
1257	Sauk Village	IL	-87.57601	41.487312	2024-07-23 13:03:09.823	2024-08-11 06:45:34.489728
1258	Saunemin	IL	-88.405014	40.893333	2024-07-23 13:03:09.823	2024-08-11 06:45:34.675416
1259	Savanna	IL	-90.156705	42.094328	2024-07-23 13:03:09.823	2024-08-11 06:45:34.88596
1260	Savoy	IL	-88.25139	40.05449	2024-07-23 13:03:09.823	2024-08-11 06:45:35.074784
1261	Sawyerville	IL	-89.80846	39.078484	2024-07-23 13:03:09.823	2024-08-11 06:45:35.343055
1262	Saybrook	IL	-88.52779	40.426933	2024-07-23 13:03:09.823	2024-08-11 06:45:35.519774
1263	Scales Mound	IL	-90.25217	42.47653	2024-07-23 13:03:09.825	2024-08-11 06:45:35.689066
1265	Scheller	IL	-89.09523	38.18828	2024-07-23 13:03:09.825	2024-08-11 06:45:36.048566
1266	Schiller Park	IL	-87.86276	41.954388	2024-07-23 13:03:09.825	2024-08-11 06:45:36.229902
1267	Schram City	IL	-89.46461	39.16388	2024-07-23 13:03:09.825	2024-08-11 06:45:36.384518
1268	Sciota	IL	-90.751625	40.5607	2024-07-23 13:03:09.825	2024-08-11 06:45:36.553838
1269	Scott AFB	IL	-89.86906	38.539066	2024-07-23 13:03:09.825	2024-08-11 06:45:36.717963
1270	Scott Air Force Base	IL	-89.86906	38.539066	2024-07-23 13:03:09.825	2024-08-11 06:45:36.867607
1271	Scottville	IL	-90.10458	39.480114	2024-07-23 13:03:09.825	2024-08-11 06:45:37.04254
1272	Seaton	IL	-90.80193	41.10237	2024-07-23 13:03:09.825	2024-08-11 06:45:37.238176
1273	Seatonville	IL	-89.27452	41.3643	2024-07-23 13:03:09.825	2024-08-11 06:45:37.405084
1274	Secor	IL	-89.13674	40.741573	2024-07-23 13:03:09.825	2024-08-11 06:45:37.656299
1276	Serena	IL	-88.73281	41.485054	2024-07-23 13:03:09.825	2024-08-11 06:45:38.019932
1277	Sesser	IL	-89.05272	38.091766	2024-07-23 13:03:09.825	2024-08-11 06:45:38.185905
1278	Seward	IL	-89.356636	42.23853	2024-07-23 13:03:09.825	2024-08-11 06:45:38.40464
1279	Seymour	IL	-88.42652	40.106865	2024-07-23 13:03:09.825	2024-08-11 06:45:38.593802
1280	Shabbona	IL	-88.872246	41.76799	2024-07-23 13:03:09.825	2024-08-11 06:45:38.804997
1281	Shannon	IL	-89.73959	42.15467	2024-07-23 13:03:09.825	2024-08-11 06:45:39.0127
1283	Sheffield	IL	-89.73736	41.358772	2024-07-23 13:03:09.825	2024-08-11 06:45:39.353069
1284	Shelbyville	IL	-88.79371	39.40668	2024-07-23 13:03:09.825	2024-08-11 06:45:39.506053
1285	Sheldon	IL	-87.5639	40.769115	2024-07-23 13:03:09.825	2024-08-11 06:45:39.683358
1286	Sheridan	IL	-88.68016	41.52997	2024-07-23 13:03:09.825	2024-08-11 06:45:39.868417
1287	Sherman	IL	-89.60225	39.89612	2024-07-23 13:03:09.825	2024-08-11 06:45:40.076344
1288	Sherrard	IL	-90.50734	41.31903	2024-07-23 13:03:09.825	2024-08-11 06:45:40.254402
1289	Shiloh	IL	-89.89922	38.55896	2024-07-23 13:03:09.825	2024-08-11 06:45:40.452909
1290	Shipman	IL	-90.044426	39.116802	2024-07-23 13:03:09.825	2024-08-11 06:45:40.648779
1291	Shirland	IL	-89.19789	42.443115	2024-07-23 13:03:09.825	2024-08-11 06:45:40.820564
1292	Shirley	IL	-89.06389	40.40733	2024-07-23 13:03:09.825	2024-08-11 06:45:41.016088
1293	Shobonier	IL	-89.08877	38.869194	2024-07-23 13:03:09.825	2024-08-11 06:45:41.163988
1294	Shorewood	IL	-88.2009	41.5194	2024-07-23 13:03:09.825	2024-08-11 06:45:41.349701
1295	Shumway	IL	-88.65494	39.184776	2024-07-23 13:03:09.825	2024-08-11 06:45:41.500764
1297	Sidell	IL	-87.82277	39.909748	2024-07-23 13:03:09.825	2024-08-11 06:45:41.847291
1298	Sidney	IL	-88.07332	40.023777	2024-07-23 13:03:09.825	2024-08-11 06:45:42.034396
1299	Sigel	IL	-88.494316	39.226833	2024-07-23 13:03:09.825	2024-08-11 06:45:42.199468
1300	Silvis	IL	-90.415596	41.512234	2024-07-23 13:03:09.825	2024-08-11 06:45:42.393934
1301	Simpson	IL	-88.755295	37.467045	2024-07-23 13:03:09.825	2024-08-11 06:45:42.570339
1302	Sims	IL	-88.97614	39.88934	2024-07-23 13:03:09.825	2024-08-11 06:45:42.77507
1303	Skokie	IL	-87.75465	42.026337	2024-07-23 13:03:09.825	2024-08-11 06:45:42.957533
1305	Smithboro	IL	-89.34074	38.895947	2024-07-23 13:03:09.825	2024-08-11 06:45:43.296699
1306	Smithfield	IL	-90.29157	40.473324	2024-07-23 13:03:09.825	2024-08-11 06:45:43.488299
1307	Smithshire	IL	-90.77885	40.791855	2024-07-23 13:03:09.825	2024-08-11 06:45:43.660283
1308	Smithton	IL	-89.99223	38.403217	2024-07-23 13:03:09.825	2024-08-11 06:45:43.837633
1309	Smithville	IL	-89.80001	40.660652	2024-07-23 13:03:09.825	2024-08-11 06:45:44.005264
1310	Solon Mills	IL	-88.27298	42.442436	2024-07-23 13:03:09.825	2024-08-11 06:45:44.202681
1311	Somonauk	IL	-88.68262	41.633713	2024-07-23 13:03:09.825	2024-08-11 06:45:44.349367
1312	Sorento	IL	-89.57571	38.997982	2024-07-23 13:03:09.825	2024-08-11 06:45:44.511255
1313	South Barrington	IL	-88.12171	42.091236	2024-07-23 13:03:09.825	2024-08-11 06:45:44.679905
1314	South Beloit	IL	-89.039536	42.487312	2024-07-23 13:03:09.825	2024-08-11 06:45:44.824795
1315	South Chicago Heights	IL	-87.64418	41.480305	2024-07-23 13:03:09.825	2024-08-11 06:45:45.003572
1317	South Holland	IL	-87.607346	41.60081	2024-07-23 13:03:09.825	2024-08-11 06:45:45.32703
1318	South Jacksonville	IL	-90.22924	39.7087	2024-07-23 13:03:09.825	2024-08-11 06:45:45.495137
1319	South Pekin	IL	-89.65471	40.494556	2024-07-23 13:03:09.825	2024-08-11 06:45:45.651856
1320	South Roxana	IL	-90.06307	38.831783	2024-07-23 13:03:09.825	2024-08-11 06:45:45.804213
1321	South Wilmington	IL	-88.27409	41.171997	2024-07-23 13:03:09.825	2024-08-11 06:45:45.938097
1322	Southern View	IL	-89.64648	39.755672	2024-07-23 13:03:09.825	2024-08-11 06:45:46.07801
1323	Sparland	IL	-89.43865	41.027695	2024-07-23 13:03:09.825	2024-08-11 06:45:46.229935
1324	Sparta	IL	-89.70172	38.123013	2024-07-23 13:03:09.825	2024-08-11 06:45:46.427525
1325	Spaulding	IL	-89.539734	39.865086	2024-07-23 13:03:09.825	2024-08-11 06:45:46.60192
1326	Speer	IL	-89.652405	40.98674	2024-07-23 13:03:09.825	2024-08-11 06:45:46.782205
1328	Spring Bay	IL	-89.52161	40.82192	2024-07-23 13:03:09.825	2024-08-11 06:45:47.110179
1329	Spring Grove	IL	-88.23778	42.43719	2024-07-23 13:03:09.825	2024-08-11 06:45:47.295438
1330	Spring Valley	IL	-89.199844	41.324673	2024-07-23 13:03:09.825	2024-08-11 06:45:47.464508
1331	Springerton	IL	-88.35553	38.177444	2024-07-23 13:03:09.825	2024-08-11 06:45:47.61677
1332	Springfield	IL	-89.64937	39.79946	2024-07-23 13:03:09.825	2024-08-11 06:45:47.87177
1333	St. Anne	IL	-87.71394	41.025055	2024-07-23 13:03:09.825	2024-08-11 06:45:48.043644
1334	St. Augustine	IL	-90.411125	40.718147	2024-07-23 13:03:09.825	2024-08-11 06:45:48.206298
1335	St. Charles	IL	-88.31554	41.913376	2024-07-23 13:03:09.825	2024-08-11 06:45:48.397016
1336	St. David	IL	-90.052315	40.491528	2024-07-23 13:03:09.825	2024-08-11 06:45:48.591385
1337	St. Elmo	IL	-88.84862	39.02732	2024-07-23 13:03:09.825	2024-08-11 06:45:48.74337
1339	St. Jacob	IL	-89.76838	38.717346	2024-07-23 13:03:09.825	2024-08-11 06:45:49.042796
1340	St. Johns	IL	-89.240906	38.031075	2024-07-23 13:03:09.825	2024-08-11 06:45:49.227649
1341	St. Joseph	IL	-88.04168	40.111423	2024-07-23 13:03:09.825	2024-08-11 06:45:49.385691
1342	St. Libory	IL	-89.71068	38.360474	2024-07-23 13:03:09.825	2024-08-11 06:45:49.550522
1343	St. Peter	IL	-88.854095	38.868008	2024-07-23 13:03:09.825	2024-08-11 06:45:49.718475
1344	St. Rose	IL	-89.55352	38.682877	2024-07-23 13:03:09.825	2024-08-11 06:45:49.922988
1345	Standard	IL	-89.09028	42.26937	2024-07-23 13:03:09.825	2024-08-11 06:45:50.107906
1346	Standard City	IL	-89.78748	39.352257	2024-07-23 13:03:09.825	2024-08-11 06:45:50.291559
1347	Stanford	IL	-89.217865	40.43465	2024-07-23 13:03:09.825	2024-08-11 06:45:50.500662
1348	Staunton	IL	-89.789055	39.012108	2024-07-23 13:03:09.825	2024-08-11 06:45:50.696502
1349	Ste. Marie	IL	-88.02346	38.932404	2024-07-23 13:03:09.825	2024-08-11 06:45:50.841331
1350	Steeleville	IL	-89.66167	38.007034	2024-07-23 13:03:09.825	2024-08-11 06:45:50.98735
1351	Steger	IL	-87.63597	41.46979	2024-07-23 13:03:09.825	2024-08-11 06:45:51.199408
1352	Sterling	IL	-89.69503	41.78923	2024-07-23 13:03:09.825	2024-08-11 06:45:51.401872
1353	Steward	IL	-89.01996	41.84761	2024-07-23 13:03:09.825	2024-08-11 06:45:51.603904
1354	Stewardson	IL	-88.62785	39.26374	2024-07-23 13:03:09.825	2024-08-11 06:45:51.78561
1356	Stillman Valley	IL	-89.178986	42.10704	2024-07-23 13:03:09.825	2024-08-11 06:45:52.154991
1357	Stockland	IL	-87.593015	40.615445	2024-07-23 13:03:09.825	2024-08-11 06:45:52.338789
1358	Stockton	IL	-90.0068	42.349873	2024-07-23 13:03:09.825	2024-08-11 06:45:52.532241
1359	Stone Park	IL	-87.88378	41.906067	2024-07-23 13:03:09.825	2024-08-11 06:45:52.733649
1360	Stonefort	IL	-88.707146	37.61498	2024-07-23 13:03:09.825	2024-08-11 06:45:52.920741
1361	Stonington	IL	-89.18927	39.640587	2024-07-23 13:03:09.825	2024-08-11 06:45:53.10066
1362	Stoy	IL	-87.83406	38.99762	2024-07-23 13:03:09.825	2024-08-11 06:45:53.28857
1363	Strasburg	IL	-88.61988	39.352158	2024-07-23 13:03:09.826	2024-08-11 06:45:53.471755
1364	Strawn	IL	-88.396454	40.651165	2024-07-23 13:03:09.828	2024-08-11 06:45:53.669006
1365	Streamwood	IL	-88.17868	42.025826	2024-07-23 13:03:09.829	2024-08-11 06:45:53.845435
1366	Streator	IL	-88.83417	41.120937	2024-07-23 13:03:09.83	2024-08-11 06:45:54.026244
1367	Stronghurst	IL	-90.908356	40.74531	2024-07-23 13:03:09.832	2024-08-11 06:45:54.171498
1368	Sublette	IL	-89.22826	41.643505	2024-07-23 13:03:09.834	2024-08-11 06:45:54.342753
1369	Sugar Grove	IL	-88.4424	41.761658	2024-07-23 13:03:09.836	2024-08-11 06:45:54.536361
1371	Summerfield	IL	-89.75205	38.59566	2024-07-23 13:03:09.836	2024-08-11 06:45:54.954912
1372	Summit	IL	-87.81035	41.788017	2024-07-23 13:03:09.836	2024-08-11 06:45:55.181124
1373	Summit Argo	IL	-87.81035	41.788017	2024-07-23 13:03:09.836	2024-08-11 06:45:55.37104
1374	Sumner	IL	-87.861336	38.71559	2024-07-23 13:03:09.836	2024-08-11 06:45:55.61492
1375	Sun River Terrace	IL	-87.73705	41.12155	2024-07-23 13:03:09.836	2024-08-11 06:45:55.764898
1376	Sunnyland	IL	-88.14274	41.57541	2024-07-23 13:03:09.836	2024-08-11 06:45:55.934199
1377	Sutter	IL	-91.34327	40.279206	2024-07-23 13:03:09.836	2024-08-11 06:45:56.119853
1378	Swansea	IL	-89.98917	38.53426	2024-07-23 13:03:09.836	2024-08-11 06:45:56.311388
1381	Symerton	IL	-88.053856	41.328472	2024-07-23 13:03:09.836	2024-08-11 06:45:56.852298
1382	Table Grove	IL	-90.42535	40.36415	2024-07-23 13:03:09.836	2024-08-11 06:45:56.993235
1383	Tallula	IL	-89.935715	39.944164	2024-07-23 13:03:09.836	2024-08-11 06:45:57.159974
1384	Tamaroa	IL	-89.23021	38.137875	2024-07-23 13:03:09.836	2024-08-11 06:45:57.310456
1385	Tamms	IL	-89.26776	37.23412	2024-07-23 13:03:09.836	2024-08-11 06:45:57.48999
1386	Tampico	IL	-89.78599	41.63131	2024-07-23 13:03:09.836	2024-08-11 06:45:57.672043
1387	Taylor Ridge	IL	-90.66752	41.386482	2024-07-23 13:03:09.836	2024-08-11 06:45:57.826332
1388	Taylor Springs	IL	-89.493576	39.13022	2024-07-23 13:03:09.836	2024-08-11 06:45:57.980307
1389	Taylorville	IL	-89.294945	39.549328	2024-07-23 13:03:09.836	2024-08-11 06:45:58.154556
1390	Tennessee	IL	-90.839516	40.41194	2024-07-23 13:03:09.836	2024-08-11 06:45:58.354373
1392	Texico	IL	-88.89701	38.43949	2024-07-23 13:03:09.836	2024-08-11 06:45:58.774493
1393	Thawville	IL	-88.116165	40.674572	2024-07-23 13:03:09.836	2024-08-11 06:45:58.962921
1394	Thayer	IL	-89.76001	39.537575	2024-07-23 13:03:09.836	2024-08-11 06:45:59.199299
1395	The Galena Territory	IL	-90.321866	42.389013	2024-07-23 13:03:09.836	2024-08-11 06:45:59.369433
1396	Thebes	IL	-89.46067	37.221077	2024-07-23 13:03:09.836	2024-08-11 06:45:59.540593
1397	Third Lake	IL	-88.010864	42.37408	2024-07-23 13:03:09.836	2024-08-11 06:45:59.717752
1398	Thomasboro	IL	-88.1864	40.243614	2024-07-23 13:03:09.836	2024-08-11 06:45:59.891923
1399	Thompsonville	IL	-88.7656	37.918568	2024-07-23 13:03:09.836	2024-08-11 06:46:00.082871
1400	Thomson	IL	-90.0994	41.958847	2024-07-23 13:03:09.836	2024-08-11 06:46:00.249553
1401	Thornton	IL	-87.6135	41.568398	2024-07-23 13:03:09.836	2024-08-11 06:46:00.472108
1402	Tilden	IL	-89.682686	38.211452	2024-07-23 13:03:09.836	2024-08-11 06:46:00.666225
1404	Timberlane	IL	-88.86121	42.334743	2024-07-23 13:03:09.836	2024-08-11 06:46:01.041022
1405	Timewell	IL	-90.87373	40.00928	2024-07-23 13:03:09.836	2024-08-11 06:46:01.201065
1406	Tinley Park	IL	-87.78435	41.575047	2024-07-23 13:03:09.836	2024-08-11 06:46:01.390626
1407	Tiskilwa	IL	-89.507195	41.292282	2024-07-23 13:03:09.836	2024-08-11 06:46:01.551229
1408	Toledo	IL	-88.245476	39.27278	2024-07-23 13:03:09.836	2024-08-11 06:46:01.725887
1409	Tolono	IL	-88.2607	39.985497	2024-07-23 13:03:09.836	2024-08-11 06:46:01.893076
1410	Toluca	IL	-89.13407	41.001877	2024-07-23 13:03:09.836	2024-08-11 06:46:02.047357
1411	Tonica	IL	-89.06565	41.215572	2024-07-23 13:03:09.836	2024-08-11 06:46:02.225048
1413	Toulon	IL	-89.86452	41.093956	2024-07-23 13:03:09.836	2024-08-11 06:46:02.628404
1414	Tovey	IL	-89.45042	39.589912	2024-07-23 13:03:09.836	2024-08-11 06:46:02.864168
1415	Towanda	IL	-88.89944	40.56513	2024-07-23 13:03:09.836	2024-08-11 06:46:03.039402
1416	Tower Hill	IL	-88.960335	39.38786	2024-07-23 13:03:09.836	2024-08-11 06:46:03.248919
1417	Tower Lakes	IL	-88.15175	42.23434	2024-07-23 13:03:09.836	2024-08-11 06:46:03.427568
1418	Tremont	IL	-89.4911	40.52611	2024-07-23 13:03:09.836	2024-08-11 06:46:03.649663
1419	Trenton	IL	-89.68227	38.605526	2024-07-23 13:03:09.836	2024-08-11 06:46:03.841429
1420	Trilla	IL	-88.34984	39.375195	2024-07-23 13:03:09.836	2024-08-11 06:46:04.019239
1421	Triumph	IL	-89.02183	41.4986	2024-07-23 13:03:09.836	2024-08-11 06:46:04.189075
1423	Trout Valley	IL	-88.253586	42.198055	2024-07-23 13:03:09.836	2024-08-11 06:46:04.562692
1424	Troy	IL	-89.88321	38.729107	2024-07-23 13:03:09.836	2024-08-11 06:46:04.773427
1425	Troy Grove	IL	-89.083206	41.467724	2024-07-23 13:03:09.836	2024-08-11 06:46:04.929268
1426	Tuscola	IL	-88.28769	39.799828	2024-07-23 13:03:09.836	2024-08-11 06:46:05.106941
1427	Twin Grove	IL	-89.07941	40.492332	2024-07-23 13:03:09.836	2024-08-11 06:46:05.267826
1428	Ullin	IL	-89.18353	37.275414	2024-07-23 13:03:09.836	2024-08-11 06:46:05.442168
1429	Union	IL	-88.54301	42.233112	2024-07-23 13:03:09.836	2024-08-11 06:46:05.636654
1430	Union Hill	IL	-90.00347	38.592953	2024-07-23 13:03:09.836	2024-08-11 06:46:05.83495
1431	Unity	IL	-89.273155	37.149673	2024-07-23 13:03:09.836	2024-08-11 06:46:06.038518
1433	Urbana	IL	-88.20741	40.112446	2024-07-23 13:03:09.836	2024-08-11 06:46:06.400601
1434	Ursa	IL	-91.366778	40.074512	2024-07-23 13:03:09.836	2024-08-11 06:46:06.565812
1435	Utica	IL	-89.01044	41.339844	2024-07-23 13:03:09.836	2024-08-11 06:46:06.798739
1436	Valier	IL	-89.041824	38.0165	2024-07-23 13:03:09.836	2024-08-11 06:46:06.975458
1437	Valley City	IL	-90.65233	39.706497	2024-07-23 13:03:09.836	2024-08-11 06:46:07.134172
1438	Valmeyer	IL	-90.28249	38.310894	2024-07-23 13:03:09.836	2024-08-11 06:46:07.313344
1439	Van Orin	IL	-89.35399	41.551968	2024-07-23 13:03:09.836	2024-08-11 06:46:07.46438
1440	Vandalia	IL	-89.094696	38.96069	2024-07-23 13:03:09.836	2024-08-11 06:46:07.642021
1441	Varna	IL	-89.22695	41.037155	2024-07-23 13:03:09.836	2024-08-11 06:46:07.815065
1442	Venedy	IL	-89.64641	38.39655	2024-07-23 13:03:09.836	2024-08-11 06:46:07.96907
1444	Venice	IL	-90.1701	38.67219	2024-07-23 13:03:09.836	2024-08-11 06:46:08.289877
1445	Vergennes	IL	-89.342	37.90173	2024-07-23 13:03:09.836	2024-08-11 06:46:08.450185
1446	Vermilion	IL	-87.628528	41.890037	2024-07-23 13:03:09.836	2024-08-11 06:46:08.625422
1447	Vermont	IL	-90.4284	40.294556	2024-07-23 13:03:09.836	2024-08-11 06:46:08.799649
1448	Vernon	IL	-89.08638	38.8026	2024-07-23 13:03:09.836	2024-08-11 06:46:08.988817
1449	Vernon Hills	IL	-87.981064	42.221043	2024-07-23 13:03:09.836	2024-08-11 06:46:09.165495
1450	Verona	IL	-88.501785	41.216232	2024-07-23 13:03:09.836	2024-08-11 06:46:09.371815
1451	Versailles	IL	-87.961208	42.155027	2024-07-23 13:03:09.836	2024-08-11 06:46:09.569267
1452	Victoria	IL	-90.09705	41.03377	2024-07-23 13:03:09.836	2024-08-11 06:46:09.775874
1453	Vienna	IL	-88.8955	37.415314	2024-07-23 13:03:09.836	2024-08-11 06:46:10.023002
1454	Villa Grove	IL	-88.16036	39.862003	2024-07-23 13:03:09.836	2024-08-11 06:46:10.190317
1456	Villa Ridge	IL	-89.194756	37.15878	2024-07-23 13:03:09.836	2024-08-11 06:46:10.544498
1457	Viola	IL	-90.58687	41.203014	2024-07-23 13:03:09.836	2024-08-11 06:46:10.739224
1458	Virden	IL	-89.768005	39.500534	2024-07-23 13:03:09.836	2024-08-11 06:46:10.915848
1459	Virgil	IL	-88.537285	41.95586	2024-07-23 13:03:09.836	2024-08-11 06:46:11.100881
1460	Virginia	IL	-90.20979	39.950638	2024-07-23 13:03:09.836	2024-08-11 06:46:11.371607
1461	Volo	IL	-88.16825	42.326042	2024-07-23 13:03:09.836	2024-08-11 06:46:11.586783
1462	Wadsworth	IL	-87.927345	42.42883	2024-07-23 13:03:09.836	2024-08-11 06:46:11.781628
1463	Waggoner	IL	-89.652145	39.377598	2024-07-23 13:03:09.838	2024-08-11 06:46:11.974547
1464	Walnut	IL	-89.59325	41.557438	2024-07-23 13:03:09.84	2024-08-11 06:46:12.146111
1466	Walsh	IL	-89.85066	38.089237	2024-07-23 13:03:09.841	2024-08-11 06:46:12.584449
1467	Walshville	IL	-89.6189	39.071045	2024-07-23 13:03:09.841	2024-08-11 06:46:12.737284
1468	Waltonville	IL	-89.039246	38.20878	2024-07-23 13:03:09.841	2024-08-11 06:46:12.879269
1469	Wamac	IL	-89.14079	38.508842	2024-07-23 13:03:09.841	2024-08-11 06:46:13.040105
1470	Wapella	IL	-88.95899	40.220886	2024-07-23 13:03:09.841	2024-08-11 06:46:13.199395
1471	Warren	IL	-89.988106	42.495983	2024-07-23 13:03:09.841	2024-08-11 06:46:13.425736
1472	Warrensburg	IL	-89.06208	39.930508	2024-07-23 13:03:09.841	2024-08-11 06:46:13.585
1473	Warrenville	IL	-88.17302	41.817837	2024-07-23 13:03:09.841	2024-08-11 06:46:13.739554
1474	Warsaw	IL	-91.434431	40.359167	2024-07-23 13:03:09.841	2024-08-11 06:46:13.918302
1476	Washburn	IL	-89.291145	40.91834	2024-07-23 13:03:09.841	2024-08-11 06:46:14.298939
1477	Washington	IL	-89.4067	40.703175	2024-07-23 13:03:09.841	2024-08-11 06:46:14.469139
1478	Washington Park	IL	-87.62085	41.79473	2024-07-23 13:03:09.841	2024-08-11 06:46:14.663867
1	Abingdon	IL	-90.39849	40.801487	2024-07-23 13:03:09.771	2024-08-11 06:41:30.91177
4	Addieville	IL	-89.4865	38.39108	2024-07-23 13:03:09.774	2024-08-11 06:41:31.647886
13	Alexis	IL	-90.55567	41.062664	2024-07-23 13:03:09.779	2024-08-11 06:41:33.664481
24	Alto Pass	IL	-89.317924	37.57045	2024-07-23 13:03:09.782	2024-08-11 06:41:35.849729
35	Anna	IL	-89.247	37.46043	2024-07-23 13:03:09.782	2024-08-11 06:41:38.079177
46	Arlington	IL	-89.245445	41.474445	2024-07-23 13:03:09.782	2024-08-11 06:41:40.088625
58	Assumption	IL	-89.04945	39.520344	2024-07-23 13:03:09.782	2024-08-11 06:41:42.448279
68	Aviston	IL	-89.605705	38.607487	2024-07-23 13:03:09.782	2024-08-11 06:41:44.473764
79	Barstow	IL	-90.35547	41.51793	2024-07-23 13:03:09.782	2024-08-11 06:41:46.502074
92	Beaverville	IL	-87.6547	40.9541	2024-07-23 13:03:09.782	2024-08-11 06:41:49.141423
101	Belleville	IL	-89.98024	38.512638	2024-07-23 13:03:09.782	2024-08-11 06:41:50.753378
112	Benton	IL	-88.92051	37.99715	2024-07-23 13:03:09.782	2024-08-11 06:41:52.943295
126	Blairsville	IL	-88.46424	38.16861	2024-07-23 13:03:09.782	2024-08-11 06:41:55.732281
1480	Waterloo	IL	-90.149025	38.33636	2024-07-23 13:03:09.841	2024-08-11 06:46:15.06072
1481	Waterman	IL	-88.77326	41.76938	2024-07-23 13:03:09.841	2024-08-11 06:46:15.243761
1482	Watseka	IL	-87.73451	40.776276	2024-07-23 13:03:09.841	2024-08-11 06:46:15.431482
1483	Watson	IL	-88.57772	39.025288	2024-07-23 13:03:09.841	2024-08-11 06:46:15.639054
1484	Wauconda	IL	-88.139496	42.258827	2024-07-23 13:03:09.841	2024-08-11 06:46:15.821785
1485	Waukegan	IL	-87.84471	42.363518	2024-07-23 13:03:09.841	2024-08-11 06:46:16.005889
1486	Waverly	IL	-89.9534	39.592693	2024-07-23 13:03:09.841	2024-08-11 06:46:16.210647
1487	Wayne	IL	-88.27004	41.950996	2024-07-23 13:03:09.841	2024-08-11 06:46:16.403174
1488	Wayne City	IL	-88.58817	38.34658	2024-07-23 13:03:09.841	2024-08-11 06:46:16.59595
1489	Waynesville	IL	-89.12446	40.23995	2024-07-23 13:03:09.841	2024-08-11 06:46:16.763791
1490	Wedron	IL	-88.77451	41.436127	2024-07-23 13:03:09.841	2024-08-11 06:46:16.945948
1492	Wellington	IL	-87.67986	40.538918	2024-07-23 13:03:09.841	2024-08-11 06:46:17.349851
1493	Wenona	IL	-89.04998	41.052673	2024-07-23 13:03:09.841	2024-08-11 06:46:17.493594
1494	Wenonah	IL	-89.28886	39.32693	2024-07-23 13:03:09.841	2024-08-11 06:46:17.66265
1495	West Brooklyn	IL	-89.14772	41.693665	2024-07-23 13:03:09.841	2024-08-11 06:46:17.803367
1496	West Chicago	IL	-88.2049	41.884636	2024-07-23 13:03:09.841	2024-08-11 06:46:17.965726
1497	West City	IL	-88.935936	37.99408	2024-07-23 13:03:09.841	2024-08-11 06:46:18.147247
1498	West Dundee	IL	-88.278595	42.09811	2024-07-23 13:03:09.841	2024-08-11 06:46:18.297689
1499	West Frankfort	IL	-88.927925	37.89796	2024-07-23 13:03:09.841	2024-08-11 06:46:18.437518
1501	West Peoria	IL	-89.6277	40.692314	2024-07-23 13:03:09.841	2024-08-11 06:46:18.793898
1502	West Point	IL	-89.622086	37.8992	2024-07-23 13:03:09.841	2024-08-11 06:46:18.986279
1503	West Salem	IL	-88.0062	38.520638	2024-07-23 13:03:09.842	2024-08-11 06:46:19.163172
1504	West Union	IL	-87.66873	39.21594	2024-07-23 13:03:09.844	2024-08-11 06:46:19.3767
1505	West York	IL	-87.672325	39.171684	2024-07-23 13:03:09.844	2024-08-11 06:46:19.539669
1506	Westchester	IL	-87.88159	41.849445	2024-07-23 13:03:09.844	2024-08-11 06:46:19.695809
1507	Western Springs	IL	-87.90051	41.809464	2024-07-23 13:03:09.844	2024-08-11 06:46:19.834237
1508	Westervelt	IL	-88.85928	39.479084	2024-07-23 13:03:09.844	2024-08-11 06:46:20.014517
1509	Westfield	IL	-87.99645	39.456066	2024-07-23 13:03:09.844	2024-08-11 06:46:20.225473
1510	Westlake Village	IL	-89.28661	42.305634	2024-07-23 13:03:09.844	2024-08-11 06:46:20.359889
1511	Westmont	IL	-87.975334	41.79584	2024-07-23 13:03:09.844	2024-08-11 06:46:20.538815
1512	Westville	IL	-87.63865	40.042576	2024-07-23 13:03:09.844	2024-08-11 06:46:20.708919
1513	Wheaton	IL	-88.10823	41.865463	2024-07-23 13:03:09.844	2024-08-11 06:46:20.883349
1514	Wheeler	IL	-88.31793	39.044094	2024-07-23 13:03:09.844	2024-08-11 06:46:21.097062
1515	Wheeling	IL	-87.931046	42.13927	2024-07-23 13:03:09.844	2024-08-11 06:46:21.284513
1516	White City	IL	-89.76313	39.064667	2024-07-23 13:03:09.844	2024-08-11 06:46:21.463999
1517	White Hall	IL	-90.40365	39.43684	2024-07-23 13:03:09.844	2024-08-11 06:46:21.652215
1518	White Heath	IL	-88.51261	40.08724	2024-07-23 13:03:09.844	2024-08-11 06:46:21.808264
1519	Whiteash	IL	-88.923515	37.789425	2024-07-23 13:03:09.844	2024-08-11 06:46:21.979135
1521	Williamsfield	IL	-90.01842	40.92334	2024-07-23 13:03:09.844	2024-08-11 06:46:22.289477
1522	Williamson	IL	-89.76449	38.985752	2024-07-23 13:03:09.844	2024-08-11 06:46:22.475169
1523	Williamsville	IL	-89.54986	39.95537	2024-07-23 13:03:09.844	2024-08-11 06:46:22.625269
1524	Willisville	IL	-89.58973	37.983894	2024-07-23 13:03:09.844	2024-08-11 06:46:22.792336
1525	Willow Hill	IL	-88.022125	38.99585	2024-07-23 13:03:09.844	2024-08-11 06:46:22.964772
1526	Willow Lake	IL	-89.63114	42.33422	2024-07-23 13:03:09.844	2024-08-11 06:46:23.145576
1527	Willow Springs	IL	-87.85901	41.739582	2024-07-23 13:03:09.844	2024-08-11 06:46:23.317244
1528	Willowbrook	IL	-87.93561	41.76991	2024-07-23 13:03:09.844	2024-08-11 06:46:23.487131
1529	Wilmette	IL	-87.718636	42.075974	2024-07-23 13:03:09.844	2024-08-11 06:46:23.67557
1531	Wilsonville	IL	-89.85518	39.07174	2024-07-23 13:03:09.844	2024-08-11 06:46:24.041677
1532	Wilton Center	IL	-87.95951	41.35233	2024-07-23 13:03:09.844	2024-08-11 06:46:24.190657
1533	Winchester	IL	-90.45633	39.629787	2024-07-23 13:03:09.844	2024-08-11 06:46:24.384316
1534	Windsor	IL	-87.62304	41.894983	2024-07-23 13:03:09.844	2024-08-11 06:46:24.610624
1535	Winfield	IL	-88.15834	41.869877	2024-07-23 13:03:09.844	2024-08-11 06:46:24.808941
1536	Winnebago	IL	-89.24137	42.266254	2024-07-23 13:03:09.844	2024-08-11 06:46:24.994118
1537	Winnetka	IL	-87.73368	42.105824	2024-07-23 13:03:09.844	2024-08-11 06:46:25.170466
1538	Winslow	IL	-89.791756	42.492653	2024-07-23 13:03:09.844	2024-08-11 06:46:25.37243
1539	Winthrop Harbor	IL	-87.82292	42.48238	2024-07-23 13:03:09.844	2024-08-11 06:46:25.535812
1540	Witt	IL	-89.351746	39.25473	2024-07-23 13:03:09.844	2024-08-11 06:46:25.737109
1541	Wolf Lake	IL	-89.43744	37.50432	2024-07-23 13:03:09.844	2024-08-11 06:46:25.923815
1542	Wonder Lake	IL	-88.34528	42.38555	2024-07-23 13:03:09.844	2024-08-11 06:46:26.063103
1544	Wood River	IL	-90.098145	38.86038	2024-07-23 13:03:09.844	2024-08-11 06:46:26.387596
1545	Woodhull	IL	-90.31565	41.17914	2024-07-23 13:03:09.844	2024-08-11 06:46:26.548435
1546	Woodland	IL	-87.73281	40.71448	2024-07-23 13:03:09.844	2024-08-11 06:46:26.733488
1547	Woodlawn	IL	-87.60592	41.78041	2024-07-23 13:03:09.844	2024-08-11 06:46:26.932891
1548	Woodridge	IL	-88.04532	41.757023	2024-07-23 13:03:09.844	2024-08-11 06:46:27.135927
1549	Woodson	IL	-90.220665	39.628906	2024-07-23 13:03:09.844	2024-08-11 06:46:27.323888
1550	Woodstock	IL	-88.447426	42.315247	2024-07-23 13:03:09.844	2024-08-11 06:46:27.525927
1551	Woosung	IL	-89.54073	41.903572	2024-07-23 13:03:09.844	2024-08-11 06:46:27.684862
1552	Worden	IL	-89.83936	38.931572	2024-07-23 13:03:09.844	2024-08-11 06:46:27.886161
1553	Worth	IL	-87.79302	41.69008	2024-07-23 13:03:09.844	2024-08-11 06:46:28.115107
1554	Wrights	IL	-90.29261	39.376038	2024-07-23 13:03:09.844	2024-08-11 06:46:28.352576
1555	Wyanet	IL	-89.58369	41.3653	2024-07-23 13:03:09.844	2024-08-11 06:46:28.541912
1556	Wyoming	IL	-89.7731	41.061813	2024-07-23 13:03:09.844	2024-08-11 06:46:28.736234
1557	Xenia	IL	-88.6373	38.635143	2024-07-23 13:03:09.844	2024-08-11 06:46:28.91291
1559	Yates City	IL	-90.01457	40.778656	2024-07-23 13:03:09.844	2024-08-11 06:46:29.298444
1560	Yorkville	IL	-88.44687	41.641823	2024-07-23 13:03:09.844	2024-08-11 06:46:29.495756
1561	Zeigler	IL	-89.05232	37.899734	2024-07-23 13:03:09.844	2024-08-11 06:46:29.75765
1562	Zion	IL	-87.82554	42.446087	2024-07-23 13:03:09.844	2024-08-11 06:46:29.963347
136	Bolingbrook	IL	-88.07245	41.700207	2024-07-23 13:03:09.784	2024-08-11 06:41:57.546509
147	Bradford	IL	-89.657814	41.17744	2024-07-23 13:03:09.784	2024-08-11 06:41:59.593071
166	Brownstown	IL	-88.95454	38.996403	2024-07-23 13:03:09.784	2024-08-11 06:42:03.565725
177	Bulpitt	IL	-89.423377	39.591184	2024-07-23 13:03:09.784	2024-08-11 06:42:05.684581
190	Bushnell	IL	-90.50838	40.55257	2024-07-23 13:03:09.784	2024-08-11 06:42:08.158888
199	Calumet City	IL	-87.52991	41.61552	2024-07-23 13:03:09.784	2024-08-11 06:42:09.917415
208	Campbell Hill	IL	-89.54942	37.928696	2024-07-23 13:03:09.784	2024-08-11 06:42:11.753617
217	Carbon Hill	IL	-88.29856	41.29709	2024-07-23 13:03:09.784	2024-08-11 06:42:13.330828
228	Carterville	IL	-89.07718	37.76014	2024-07-23 13:03:09.786	2024-08-11 06:42:15.399384
239	Central City	IL	-89.127045	38.54915	2024-07-23 13:03:09.787	2024-08-11 06:42:17.461011
256	Cherry	IL	-89.21301	41.426056	2024-07-23 13:03:09.789	2024-08-11 06:42:20.671589
267	Cicero	IL	-87.75392	41.845207	2024-07-23 13:03:09.789	2024-08-11 06:42:22.82417
280	Coal City	IL	-88.2852	41.280354	2024-07-23 13:03:09.789	2024-08-11 06:42:25.383466
293	Colp	IL	-89.07981	37.805344	2024-07-23 13:03:09.789	2024-08-11 06:42:28.060469
297	Compton	IL	-89.09136	41.695408	2024-07-23 13:03:09.789	2024-08-11 06:42:28.865059
305	Cottage Hills	IL	-90.07041	38.903206	2024-07-23 13:03:09.789	2024-08-11 06:42:30.414634
314	Crescent City	IL	-87.85815	40.77	2024-07-23 13:03:09.789	2024-08-11 06:42:32.184116
326	Curran	IL	-89.77171	39.74151	2024-07-23 13:03:09.789	2024-08-11 06:42:34.485124
335	Dalton City	IL	-88.80509	39.711334	2024-07-23 13:03:09.789	2024-08-11 06:42:36.172755
346	Dayton	IL	-88.79397	41.38545	2024-07-23 13:03:09.789	2024-08-11 06:42:38.331709
360	Des Plaines	IL	-87.887634	42.041637	2024-07-23 13:03:09.789	2024-08-11 06:42:40.998588
373	Donovan	IL	-87.615776	40.882904	2024-07-23 13:03:09.789	2024-08-11 06:42:43.440351
384	Dundee	IL	-88.3116	42.12905	2024-07-23 13:03:09.789	2024-08-11 06:42:45.552193
394	East Brooklyn	IL	-88.26349	41.17223	2024-07-23 13:03:09.789	2024-08-11 06:42:47.469859
396	East Carondelet	IL	-90.23208	38.541225	2024-07-23 13:03:09.789	2024-08-11 06:42:47.794656
401	East Hazel Crest	IL	-87.64125	41.5773	2024-07-23 13:03:09.79	2024-08-11 06:42:48.716836
414	Edwardsville	IL	-89.95701	38.812508	2024-07-23 13:03:09.79	2024-08-11 06:42:51.161314
429	Ellery	IL	-88.14888	38.354736	2024-07-23 13:03:09.79	2024-08-11 06:42:53.839143
442	Emington	IL	-88.358574	40.97049	2024-07-23 13:03:09.791	2024-08-11 06:42:56.476208
453	Evergreen Park	IL	-87.70185	41.7208	2024-07-23 13:03:09.791	2024-08-11 06:42:58.697563
465	Farmersville	IL	-89.65158	39.44333	2024-07-23 13:03:09.791	2024-08-11 06:43:00.978168
480	Floraville	IL	-90.05649	38.376465	2024-07-23 13:03:09.792	2024-08-11 06:43:03.834278
492	Fowler	IL	-91.259796	40.009712	2024-07-23 13:03:09.792	2024-08-11 06:43:06.097817
494	Fox Lake Hills	IL	-88.13178	42.408203	2024-07-23 13:03:09.792	2024-08-11 06:43:06.454427
497	Frankfort Square	IL	-87.80422	41.51922	2024-07-23 13:03:09.792	2024-08-11 06:43:06.987101
510	Galesburg	IL	-90.36632	40.947464	2024-07-23 13:03:09.792	2024-08-11 06:43:09.478427
521	Georgetown	IL	-87.63557	39.974583	2024-07-23 13:03:09.794	2024-08-11 06:43:11.536767
532	Girard	IL	-89.78058	39.445427	2024-07-23 13:03:09.794	2024-08-11 06:43:13.550006
547	Golden Eagle	IL	-90.57941	38.893875	2024-07-23 13:03:09.794	2024-08-11 06:43:16.385127
559	Grand Ridge	IL	-88.83171	41.237324	2024-07-23 13:03:09.794	2024-08-11 06:43:18.646315
573	Green Valley	IL	-89.64316	40.407257	2024-07-23 13:03:09.795	2024-08-11 06:43:21.145094
588	Hammond	IL	-88.59203	39.79846	2024-07-23 13:03:09.795	2024-08-11 06:43:24.038572
592	Hanna City	IL	-89.79531	40.69207	2024-07-23 13:03:09.795	2024-08-11 06:43:24.756708
594	Hanover Park	IL	-88.144775	41.996815	2024-07-23 13:03:09.795	2024-08-11 06:43:25.170108
607	Harwood Heights	IL	-87.80965	41.967224	2024-07-23 13:03:09.795	2024-08-11 06:43:27.69541
618	Herod	IL	-88.43639	37.58031	2024-07-23 13:03:09.801	2024-08-11 06:43:29.801247
633	Hillview	IL	-89.05621	42.237965	2024-07-23 13:03:09.801	2024-08-11 06:43:32.682949
646	Homer Glen	IL	-87.93896	41.599728	2024-07-23 13:03:09.801	2024-08-11 06:43:35.121724
660	Huntley	IL	-88.428	42.16897	2024-07-23 13:03:09.801	2024-08-11 06:43:37.789451
671	Ingalls Park	IL	-88.04305	41.522522	2024-07-23 13:03:09.803	2024-08-11 06:43:39.830197
683	Iuka	IL	-88.79022	38.61658	2024-07-23 13:03:09.803	2024-08-11 06:43:42.269712
691	Jerseyville	IL	-90.32749	39.119434	2024-07-23 13:03:09.803	2024-08-11 06:43:43.773676
693	Johnsburg	IL	-88.23908	42.37821	2024-07-23 13:03:09.803	2024-08-11 06:43:44.155193
702	Junction City	IL	-89.592454	40.758288	2024-07-23 13:03:09.803	2024-08-11 06:43:45.747159
715	Keensburg	IL	-87.86901	38.3516	2024-07-23 13:03:09.804	2024-08-11 06:43:48.249975
728	Kings	IL	-89.105804	42.004173	2024-07-23 13:03:09.804	2024-08-11 06:43:50.754278
743	La Place	IL	-88.71603	39.79992	2024-07-23 13:03:09.804	2024-08-11 06:43:53.52665
754	Lake City	IL	-88.71984	39.755642	2024-07-23 13:03:09.804	2024-08-11 06:43:55.473559
767	Lakewood	IL	-88.89867	39.325577	2024-07-23 13:03:09.804	2024-08-11 06:43:57.76476
780	Le Roy	IL	-88.75933	40.347164	2024-07-23 13:03:09.804	2024-08-11 06:44:00.219104
789	Lenzburg	IL	-89.81713	38.289776	2024-07-23 13:03:09.806	2024-08-11 06:44:01.920227
790	Leonore	IL	-88.9806	41.188816	2024-07-23 13:03:09.806	2024-08-11 06:44:02.09555
796	Lily Lake	IL	-88.47783	41.948734	2024-07-23 13:03:09.806	2024-08-11 06:44:03.295722
806	Litchfield	IL	-89.65544	39.176357	2024-07-23 13:03:09.806	2024-08-11 06:44:05.342668
818	Lombard	IL	-88.01974	41.886932	2024-07-23 13:03:09.806	2024-08-11 06:44:07.758982
835	Lyndon	IL	-89.92491	41.71806	2024-07-23 13:03:09.806	2024-08-11 06:44:11.159579
845	Madison	IL	-90.15214	38.680927	2024-07-23 13:03:09.807	2024-08-11 06:44:13.253414
859	Mapleton	IL	-89.73128	40.5654	2024-07-23 13:03:09.807	2024-08-11 06:44:16.023379
870	Marquette Heights	IL	-89.6063	40.6194	2024-07-23 13:03:09.807	2024-08-11 06:44:18.552732
883	Maywood	IL	-87.83916	41.88622	2024-07-23 13:03:09.807	2024-08-11 06:44:21.430061
889	McHenry	IL	-88.28094	42.317713	2024-07-23 13:03:09.811	2024-08-11 06:44:22.75154
895	Medinah	IL	-88.05151	41.977062	2024-07-23 13:03:09.811	2024-08-11 06:44:23.993022
906	Metcalf	IL	-87.806786	39.801567	2024-07-23 13:03:09.811	2024-08-11 06:44:26.172189
919	Miller City	IL	-89.357	37.108574	2024-07-23 13:03:09.811	2024-08-11 06:44:28.918078
934	Moline	IL	-90.51691	41.50711	2024-07-23 13:03:09.811	2024-08-11 06:44:31.820377
945	Morrison	IL	-89.96516	41.80936	2024-07-23 13:03:09.811	2024-08-11 06:44:33.909643
953	Mount Auburn	IL	-89.26117	39.763714	2024-07-23 13:03:09.811	2024-08-11 06:44:35.313575
962	Mount Sterling	IL	-90.76711	39.98634	2024-07-23 13:03:09.811	2024-08-11 06:44:36.911072
974	Murrayville	IL	-90.25179	39.57927	2024-07-23 13:03:09.811	2024-08-11 06:44:39.037171
985	Neoga	IL	-88.45253	39.319332	2024-07-23 13:03:09.811	2024-08-11 06:44:41.092002
988	New Baden	IL	-89.70063	38.53505	2024-07-23 13:03:09.811	2024-08-11 06:44:41.546928
994	New Douglas	IL	-89.66733	38.97034	2024-07-23 13:03:09.812	2024-08-11 06:44:42.582165
1007	Niantic	IL	-89.16647	39.85335	2024-07-23 13:03:09.812	2024-08-11 06:44:45.013599
1017	Norris City	IL	-88.32863	37.980896	2024-07-23 13:03:09.812	2024-08-11 06:44:47.099107
1033	Oak Grove	IL	-90.568954	41.413822	2024-07-23 13:03:09.815	2024-08-11 06:44:51.234951
1047	Ogden	IL	-87.668125	41.879519	2024-07-23 13:03:09.815	2024-08-11 06:44:54.850269
1057	Olney	IL	-88.0849	38.731106	2024-07-23 13:03:09.815	2024-08-11 06:44:56.781524
1064	Oquawka	IL	-90.95102	40.93306	2024-07-23 13:03:09.815	2024-08-11 06:44:58.168596
1071	Orland Park	IL	-87.86044	41.630363	2024-07-23 13:03:09.815	2024-08-11 06:44:59.879952
1084	Palos Heights	IL	-87.79664	41.668015	2024-07-23 13:03:09.817	2024-08-11 06:45:02.583647
1087	Pana	IL	-89.08038	39.388924	2024-07-23 13:03:09.817	2024-08-11 06:45:03.110538
1098	Paw Paw	IL	-88.983505	41.688602	2024-07-23 13:03:09.817	2024-08-11 06:45:05.104857
1109	Peoria Heights	IL	-89.574036	40.743584	2024-07-23 13:03:09.817	2024-08-11 06:45:07.07366
1118	Phoenix	IL	-87.63265	41.6145	2024-07-23 13:03:09.817	2024-08-11 06:45:08.827431
1131	Pleasant Hill	IL	-90.872185	39.44341	2024-07-23 13:03:09.818	2024-08-11 06:45:11.154623
1145	Potomac	IL	-87.80049	40.305336	2024-07-23 13:03:09.819	2024-08-11 06:45:13.888451
1155	Princeville	IL	-89.75731	40.929375	2024-07-23 13:03:09.819	2024-08-11 06:45:15.5531
1166	Rantoul	IL	-88.15738	40.310608	2024-07-23 13:03:09.819	2024-08-11 06:45:17.675142
1181	Ridgewood	IL	-88.03996	41.536697	2024-07-23 13:03:09.819	2024-08-11 06:45:20.357182
1185	Rinard	IL	-88.46553	38.57078	2024-07-23 13:03:09.819	2024-08-11 06:45:20.958801
1190	River Forest	IL	-87.81511	41.89771	2024-07-23 13:03:09.819	2024-08-11 06:45:21.933383
1205	Rock Island Arsenal	IL	-90.54748	41.52166	2024-07-23 13:03:09.821	2024-08-11 06:45:24.787151
1226	Round Lake Beach	IL	-88.08979	42.37172	2024-07-23 13:03:09.821	2024-08-11 06:45:28.754582
1240	Saint Anne	IL	-87.71394	41.025055	2024-07-23 13:03:09.823	2024-08-11 06:45:31.389395
1253	San Jose	IL	-89.039174	42.265645	2024-07-23 13:03:09.823	2024-08-11 06:45:33.75582
1264	Schaumburg	IL	-88.08326	42.034496	2024-07-23 13:03:09.825	2024-08-11 06:45:35.882093
1275	Seneca	IL	-88.61004	41.316196	2024-07-23 13:03:09.825	2024-08-11 06:45:37.837062
1282	Shawneetown	IL	-88.18602	37.717785	2024-07-23 13:03:09.825	2024-08-11 06:45:39.177364
1296	Sibley	IL	-88.38257	40.589638	2024-07-23 13:03:09.825	2024-08-11 06:45:41.666477
1304	Sleepy Hollow	IL	-88.31024	42.089973	2024-07-23 13:03:09.825	2024-08-11 06:45:43.126988
1316	South Elgin	IL	-88.292366	41.994293	2024-07-23 13:03:09.825	2024-08-11 06:45:45.161527
1327	Spillertown	IL	-88.91977	37.766575	2024-07-23 13:03:09.825	2024-08-11 06:45:46.95066
1338	St. Francisville	IL	-87.64822	38.59146	2024-07-23 13:03:09.825	2024-08-11 06:45:48.898874
1355	Stickney	IL	-87.785138	41.821448	2024-07-23 13:03:09.825	2024-08-11 06:45:51.996623
1370	Sullivan	IL	-88.60748	39.59936	2024-07-23 13:03:09.836	2024-08-11 06:45:54.747356
1379	Swedona	IL	-90.44474	41.279217	2024-07-23 13:03:09.836	2024-08-11 06:45:56.500205
1380	Sycamore	IL	-88.68596	41.988686	2024-07-23 13:03:09.836	2024-08-11 06:45:56.680883
1391	Teutopolis	IL	-88.47369	39.132362	2024-07-23 13:03:09.836	2024-08-11 06:45:58.567728
1403	Tilton	IL	-87.647545	40.095543	2024-07-23 13:03:09.836	2024-08-11 06:46:00.847842
1412	Topeka	IL	-89.93166	40.330517	2024-07-23 13:03:09.836	2024-08-11 06:46:02.442497
1422	Trivoli	IL	-89.890594	40.697617	2024-07-23 13:03:09.836	2024-08-11 06:46:04.381195
1432	University Park	IL	-87.68364	41.44024	2024-07-23 13:03:09.836	2024-08-11 06:46:06.229139
1443	Venetian Village	IL	-88.039591	42.407471	2024-07-23 13:03:09.836	2024-08-11 06:46:08.113617
1455	Villa Park	IL	-87.97775	41.88977	2024-07-23 13:03:09.836	2024-08-11 06:46:10.380878
1465	Walnut Hill	IL	-89.043846	38.477547	2024-07-23 13:03:09.841	2024-08-11 06:46:12.352423
1475	Wasco	IL	-88.40466	41.93801	2024-07-23 13:03:09.841	2024-08-11 06:46:14.081456
1479	Wataga	IL	-90.281	41.024876	2024-07-23 13:03:09.841	2024-08-11 06:46:14.862369
1491	Weldon	IL	-88.75109	40.121098	2024-07-23 13:03:09.841	2024-08-11 06:46:17.129228
1500	West Liberty	IL	-88.08436	38.853455	2024-07-23 13:03:09.841	2024-08-11 06:46:18.609894
1520	Whittington	IL	-88.90331	38.08711	2024-07-23 13:03:09.844	2024-08-11 06:46:22.143255
1530	Wilmington	IL	-88.14686	41.307835	2024-07-23 13:03:09.844	2024-08-11 06:46:23.886513
1543	Wood Dale	IL	-87.97575	41.96301	2024-07-23 13:03:09.844	2024-08-11 06:46:26.217557
1558	Yale	IL	-88.02491	39.11982	2024-07-23 13:03:09.844	2024-08-11 06:46:29.115133
\.


--
-- Data for Name: crime_rates; Type: TABLE DATA; Schema: public; Owner: young
--

COPY public.crime_rates (id, city_id, crime_index, violent_crime_rate, property_crime_rate, created_at, updated_at) FROM stdin;
1	5	76	1.51	3.25	2024-07-23 14:41:54.988	2024-07-23 14:41:54.988
2	14	47	0.5	9.78	2024-07-23 14:41:54.99	2024-07-23 14:41:54.99
3	22	10	3.32	28.16	2024-07-23 14:41:54.993	2024-07-23 14:41:54.993
4	25	5	9.08	31.21	2024-07-23 14:41:54.995	2024-07-23 14:41:54.995
5	38	91	0.47	1.15	2024-07-23 14:41:54.997	2024-07-23 14:41:54.997
6	47	42	0.72	10.98	2024-07-23 14:41:54.999	2024-07-23 14:41:54.999
7	66	74	2.37	2.69	2024-07-23 14:41:55	2024-07-23 14:41:55
8	76	68	0.85	5.22	2024-07-23 14:41:55	2024-07-23 14:41:55
9	81	93	0.17	1	2024-07-23 14:41:55	2024-07-23 14:41:55
10	82	14	4.81	21.83	2024-07-23 14:41:55	2024-07-23 14:41:55
11	84	42	1	10.57	2024-07-23 14:41:55	2024-07-23 14:41:55
12	89	52	1.56	7.59	2024-07-23 14:41:55	2024-07-23 14:41:55
13	90	61	2.08	5.19	2024-07-23 14:41:55	2024-07-23 14:41:55
14	101	21	4.48	16.1	2024-07-23 14:41:55	2024-07-23 14:41:55
15	105	21	3.54	17.37	2024-07-23 14:41:55	2024-07-23 14:41:55
16	106	44	1.79	9.18	2024-07-23 14:41:55	2024-07-23 14:41:55
17	109	46	0.76	9.73	2024-07-23 14:41:55	2024-07-23 14:41:55
18	112	93	0.15	0.76	2024-07-23 14:41:55	2024-07-23 14:41:55
19	116	52	1.31	7.87	2024-07-23 14:41:55	2024-07-23 14:41:55
20	117	68	1.74	4.34	2024-07-23 14:41:55	2024-07-23 14:41:55
21	129	90	0.49	1.61	2024-07-23 14:41:55	2024-07-23 14:41:55
22	130	34	2.31	12.01	2024-07-23 14:41:55	2024-07-23 14:41:55
23	131	7	5.8	29.15	2024-07-23 14:41:55	2024-07-23 14:41:55
24	136	49	2.19	7.6	2024-07-23 14:41:55	2024-07-23 14:41:55
25	144	84	2.22	1	2024-07-23 14:41:55	2024-07-23 14:41:55
26	148	11	1.84	27.84	2024-07-23 14:41:55	2024-07-23 14:41:55
27	149	59	1.3	6.34	2024-07-23 14:41:55	2024-07-23 14:41:55
28	150	85	0	3.02	2024-07-23 14:41:55	2024-07-23 14:41:55
29	152	76	1.7	3.04	2024-07-23 14:41:55	2024-07-23 14:41:55
30	153	82	0.46	3.22	2024-07-23 14:41:55	2024-07-23 14:41:55
31	157	46	2.8	7.65	2024-07-23 14:41:55	2024-07-23 14:41:55
32	160	47	0.53	9.8	2024-07-23 14:41:55	2024-07-23 14:41:55
33	174	65	0.38	6.23	2024-07-23 14:41:55	2024-07-23 14:41:55
34	180	30	1.72	14.14	2024-07-23 14:41:55	2024-07-23 14:41:55
35	186	84	0.54	2.72	2024-07-23 14:41:55	2024-07-23 14:41:55
36	196	22	1.24	18.62	2024-07-23 14:41:55	2024-07-23 14:41:55
37	199	18	3.77	19.19	2024-07-23 14:41:55	2024-07-23 14:41:55
38	200	2	9.77	43.52	2024-07-23 14:41:55	2024-07-23 14:41:55
39	210	94	0	0.09	2024-07-23 14:41:55	2024-07-23 14:41:55
40	213	45	2.14	8.73	2024-07-23 14:41:55	2024-07-23 14:41:55
41	218	4	7.83	36.98	2024-07-23 14:41:55	2024-07-23 14:41:55
42	221	29	1.86	14.29	2024-07-23 14:41:55	2024-07-23 14:41:55
43	223	23	1.47	17.85	2024-07-23 14:41:55	2024-07-23 14:41:55
44	224	89	0.9	1.33	2024-07-23 14:41:55	2024-07-23 14:41:55
45	225	92	0.64	0.94	2024-07-23 14:41:55	2024-07-23 14:41:55
46	228	50	1.72	7.91	2024-07-23 14:41:55	2024-07-23 14:41:55
47	230	94	0.34	0.39	2024-07-23 14:41:55	2024-07-23 14:41:55
48	240	26	8.88	9.14	2024-07-23 14:41:55	2024-07-23 14:41:55
49	244	16	6.5	17.44	2024-07-23 14:41:55	2024-07-23 14:41:55
50	247	66	1.15	5.24	2024-07-23 14:41:55	2024-07-23 14:41:55
51	250	60	1.46	6.02	2024-07-23 14:41:55	2024-07-23 14:41:55
52	251	58	0.48	7.4	2024-07-23 14:41:55	2024-07-23 14:41:55
53	258	91	0.88	0.74	2024-07-23 14:41:55	2024-07-23 14:41:55
54	261	6	5.38	31.76	2024-07-23 14:41:55	2024-07-23 14:41:55
55	262	3	18.97	26.9	2024-07-23 14:41:55	2024-07-23 14:41:55
56	263	17	2.15	21.33	2024-07-23 14:41:55	2024-07-23 14:41:55
57	264	21	3.66	17.32	2024-07-23 14:41:55	2024-07-23 14:41:55
58	267	28	2.86	14.06	2024-07-23 14:41:55	2024-07-23 14:41:55
59	279	38	1.45	11.62	2024-07-23 14:41:55	2024-07-23 14:41:55
60	280	74	0.35	4.7	2024-07-23 14:41:55	2024-07-23 14:41:55
61	290	19	2.34	19.52	2024-07-23 14:41:55	2024-07-23 14:41:55
62	294	69	1	4.92	2024-07-23 14:41:55	2024-07-23 14:41:55
63	307	41	2.29	9.89	2024-07-23 14:41:55	2024-07-23 14:41:55
64	315	37	2.63	10.72	2024-07-23 14:41:55	2024-07-23 14:41:55
65	317	22	1.24	19.08	2024-07-23 14:41:55	2024-07-23 14:41:55
66	318	48	1.68	8.51	2024-07-23 14:41:55	2024-07-23 14:41:55
67	322	90	0.74	1.33	2024-07-23 14:41:55	2024-07-23 14:41:55
68	341	1	17.56	48.22	2024-07-23 14:41:55	2024-07-23 14:41:55
69	342	91	0.28	1.48	2024-07-23 14:41:55	2024-07-23 14:41:55
70	351	9	7.15	25.08	2024-07-23 14:41:55	2024-07-23 14:41:55
71	355	49	0.37	9.5	2024-07-23 14:41:55	2024-07-23 14:41:55
72	356	8	5.89	27.8	2024-07-23 14:41:55	2024-07-23 14:41:55
73	360	36	1.18	12.39	2024-07-23 14:41:55	2024-07-23 14:41:55
74	369	62	1.19	5.93	2024-07-23 14:41:55	2024-07-23 14:41:55
75	370	32	2.72	12.22	2024-07-23 14:41:55	2024-07-23 14:41:55
76	379	87	0.79	2.01	2024-07-23 14:41:55	2024-07-23 14:41:55
77	382	65	1.57	5.07	2024-07-23 14:41:55	2024-07-23 14:41:55
78	387	21	2.58	18.06	2024-07-23 14:41:55	2024-07-23 14:41:55
79	393	48	4.4	5.63	2024-07-23 14:41:55	2024-07-23 14:41:55
80	403	51	3.21	6.13	2024-07-23 14:41:55	2024-07-23 14:41:55
81	404	10	3.12	27.65	2024-07-23 14:41:55	2024-07-23 14:41:55
82	414	58	0.6	7.35	2024-07-23 14:41:55	2024-07-23 14:41:55
83	415	10	3.11	27.27	2024-07-23 14:41:55	2024-07-23 14:41:55
84	418	80	0.47	3.59	2024-07-23 14:41:55	2024-07-23 14:41:55
85	420	89	2.2	0	2024-07-23 14:41:55	2024-07-23 14:41:55
86	423	50	1.9	7.62	2024-07-23 14:41:55	2024-07-23 14:41:55
87	426	24	1.3	17.4	2024-07-23 14:41:55	2024-07-23 14:41:55
88	434	86	0.57	2.36	2024-07-23 14:41:55	2024-07-23 14:41:55
89	436	36	1.4	12.33	2024-07-23 14:41:55	2024-07-23 14:41:55
90	440	50	2.28	7.28	2024-07-23 14:41:55	2024-07-23 14:41:55
91	451	13	1.79	25.05	2024-07-23 14:41:55	2024-07-23 14:41:55
92	453	3	1.51	47.11	2024-07-23 14:41:55	2024-07-23 14:41:55
93	457	43	3.56	7.74	2024-07-23 14:41:55	2024-07-23 14:41:55
94	462	6	3.61	33.26	2024-07-23 14:41:55	2024-07-23 14:41:55
95	482	37	1.18	12.21	2024-07-23 14:41:55	2024-07-23 14:41:55
96	487	5	4.71	35.72	2024-07-23 14:41:55	2024-07-23 14:41:55
97	493	23	2.77	16.5	2024-07-23 14:41:55	2024-07-23 14:41:55
98	496	60	0.44	7.06	2024-07-23 14:41:55	2024-07-23 14:41:55
99	500	32	1.77	13.51	2024-07-23 14:41:55	2024-07-23 14:41:55
100	504	29	3.16	13.07	2024-07-23 14:41:55	2024-07-23 14:41:55
101	509	87	1.84	0.92	2024-07-23 14:41:55	2024-07-23 14:41:55
102	510	36	3.38	10.15	2024-07-23 14:41:55	2024-07-23 14:41:55
103	518	34	2.3	11.97	2024-07-23 14:41:55	2024-07-23 14:41:55
104	519	62	0.9	6.27	2024-07-23 14:41:55	2024-07-23 14:41:55
105	528	84	0.12	3.13	2024-07-23 14:41:55	2024-07-23 14:41:55
106	536	39	0.72	11.99	2024-07-23 14:41:55	2024-07-23 14:41:55
107	537	89	0.49	1.73	2024-07-23 14:41:55	2024-07-23 14:41:55
108	539	53	0.35	8.48	2024-07-23 14:41:55	2024-07-23 14:41:55
109	540	87	1.17	1.54	2024-07-23 14:41:55	2024-07-23 14:41:55
110	541	33	1.18	13.39	2024-07-23 14:41:55	2024-07-23 14:41:55
111	542	17	3.47	20.35	2024-07-23 14:41:55	2024-07-23 14:41:55
112	543	47	0.79	9.44	2024-07-23 14:41:55	2024-07-23 14:41:55
113	563	9	6.56	25.7	2024-07-23 14:41:55	2024-07-23 14:41:55
114	569	42	1.86	9.87	2024-07-23 14:41:55	2024-07-23 14:41:55
115	583	14	1.12	25.38	2024-07-23 14:41:55	2024-07-23 14:41:55
116	594	88	0.91	1.7	2024-07-23 14:41:55	2024-07-23 14:41:55
117	598	90	0.75	1.25	2024-07-23 14:41:55	2024-07-23 14:41:55
118	604	49	1.07	8.74	2024-07-23 14:41:55	2024-07-23 14:41:55
119	606	29	3.06	13.27	2024-07-23 14:41:55	2024-07-23 14:41:55
120	607	82	0.57	3.1	2024-07-23 14:41:55	2024-07-23 14:41:55
121	609	94	0.11	0.32	2024-07-23 14:41:55	2024-07-23 14:41:55
122	610	5	7.29	34.43	2024-07-23 14:41:55	2024-07-23 14:41:55
123	620	51	2.62	6.64	2024-07-23 14:41:55	2024-07-23 14:41:55
124	624	78	1.57	2.78	2024-07-23 14:41:55	2024-07-23 14:41:55
125	626	57	0.9	7.09	2024-07-23 14:41:55.002	2024-07-23 14:41:55.002
126	627	40	0.66	11.7	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
127	637	90	0.12	1.86	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
128	640	45	0.99	9.79	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
129	646	79	0.45	3.8	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
130	648	5	1.87	37.31	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
131	660	64	0.6	6.22	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
132	681	92	0.38	1.01	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
133	682	90	0.32	1.71	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
134	685	16	2.43	22.11	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
135	691	33	1.45	13.42	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
136	696	31	5.13	10.28	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
137	703	76	0.33	4.43	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
138	708	34	6.69	7.67	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
139	722	7	3.11	33.28	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
140	739	56	0.32	7.84	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
141	740	56	0.46	7.76	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
142	750	92	0.36	0.9	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
143	755	63	0.16	6.7	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
144	763	91	0.35	1.27	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
145	765	37	0.56	12.74	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
146	772	10	3.79	27.21	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
147	774	89	0.64	1.59	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
148	779	56	1.43	6.89	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
149	780	57	0.86	7.16	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
150	782	37	0.87	12.35	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
151	787	71	0.51	5.02	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
152	795	89	0.29	2.01	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
153	799	60	1.07	6.5	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
154	800	60	0.38	7.2	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
155	801	78	0.46	3.85	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
156	802	81	0.77	3.07	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
157	805	69	0.3	5.63	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
158	806	3	4.47	44.74	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
159	813	65	0.54	6.01	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
160	818	87	0.66	1.98	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
161	829	67	0.89	5.34	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
162	831	26	3.38	14.64	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
163	838	58	2	5.89	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
164	839	82	1.34	2.21	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
165	841	38	2.42	10.59	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
166	843	84	1.41	1.82	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
167	848	63	1.69	5.26	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
168	853	82	0.48	3.19	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
169	854	69	0.66	5.28	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
170	857	31	2.4	13.09	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
171	861	66	0.4	5.95	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
172	864	24	5.02	14.11	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
173	867	16	4.63	19.93	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
174	876	63	1.16	5.79	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
175	880	29	5.64	10.63	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
176	881	74	2.64	2.34	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
177	883	25	7.15	11.47	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
178	889	58	0.64	7.18	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
179	897	22	2.89	17.24	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
180	900	77	0.87	3.61	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
181	905	82	0.26	3.37	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
182	907	8	3.4	30.28	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
183	911	20	2.03	19.25	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
184	912	12	2.61	26.28	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
185	928	74	1.02	3.98	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
186	933	55	0.56	7.89	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
187	934	8	5	28.31	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
188	935	86	0.33	2.63	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
189	936	14	1.77	24.98	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
190	937	29	2.2	14.22	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
191	939	41	1.97	10.05	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
192	944	30	1.95	14.07	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
193	945	57	3.25	4.75	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
194	947	41	1.62	10.5	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
195	948	34	1.03	13.34	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
196	954	65	3.07	3.51	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
197	960	47	0.69	9.74	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
198	963	26	7.42	10.29	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
199	971	51	0.6	8.86	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
200	973	8	4.69	28.3	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
201	976	54	0.53	8.16	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
202	998	50	0.72	8.95	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
203	1008	15	1.04	24.43	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
204	1014	28	2.4	14.19	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
205	1015	16	0.54	23.83	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
206	1018	83	1.2	2.23	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
207	1020	81	2.16	1.64	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
208	1026	88	0.23	2.37	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
209	1027	40	0.18	12.01	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
210	1028	80	1.69	2.34	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
211	1031	55	1.37	6.98	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
212	1032	72	1.36	3.97	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
213	1034	28	1.19	15.49	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
214	1035	8	3.25	30.2	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
215	1057	23	2.12	17.2	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
216	1070	80	0.15	3.76	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
217	1071	92	0.23	1.23	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
218	1073	68	0.89	5.19	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
219	1074	53	1.77	7.23	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
220	1079	52	1.08	8.14	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
221	1084	50	0.69	8.94	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
222	1085	70	0.67	4.98	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
223	1086	77	0	4.59	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
224	1087	32	1.37	13.74	2024-07-23 14:41:55.003	2024-07-23 14:41:55.003
225	1091	32	3.59	11.63	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
226	1093	28	3.1	13.94	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
227	1094	88	0.37	2.19	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
228	1105	14	3.39	22.9	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
229	1108	4	11.84	31.25	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
230	1109	8	6.91	26.62	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
231	1110	70	0.24	5.51	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
232	1113	33	0.82	13.82	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
233	1127	60	0.8	6.75	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
234	1129	61	1.2	6.09	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
235	1138	43	2.8	8.48	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
236	1139	37	2.06	11.15	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
237	1141	71	0.59	4.9	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
238	1154	36	0.65	12.95	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
239	1157	41	1.42	10.46	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
240	1160	56	3.39	4.78	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
241	1166	12	6.02	21.94	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
242	1177	59	2.17	5.55	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
243	1190	30	0.53	15.36	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
244	1191	38	0.87	12.22	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
245	1192	19	6.33	15.49	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
246	1193	84	1.45	1.9	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
247	1199	27	3.95	13.25	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
248	1200	76	1.71	3	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
249	1201	71	1.82	3.63	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
250	1203	9	5.1	27.49	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
251	1204	9	5.63	25.9	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
252	1208	5	14.42	26.64	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
253	1210	41	0.9	11.04	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
254	1212	29	1.57	14.9	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
255	1214	46	1.52	9.02	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
256	1217	68	0.55	5.43	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
257	1219	90	0.49	1.56	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
258	1225	86	0.43	2.43	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
259	1226	58	1.08	6.81	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
260	1228	86	0.91	2.08	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
261	1251	17	5.06	18	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
262	1255	93	0.14	0.7	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
263	1257	2	36.54	21.82	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
264	1259	12	6.24	22.4	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
265	1260	66	0.79	5.62	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
266	1264	19	0.91	21.46	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
267	1266	67	1.42	4.79	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
268	1270	84	0.54	2.71	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
269	1289	40	1.59	10.83	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
270	1294	61	0.66	6.51	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
271	1300	5	3.55	37	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
272	1303	14	2.06	23.8	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
273	1314	35	2.4	11.63	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
274	1316	68	1	5.08	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
275	1317	16	4.01	20.64	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
276	1329	94	0	0.55	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
277	1330	43	1.1	10.25	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
278	1332	3	7.92	42.54	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
279	1351	21	3.64	17.14	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
280	1352	24	3.5	15.52	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
281	1356	81	0	3.77	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
282	1365	49	1.81	8.13	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
283	1366	58	1.06	6.85	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
284	1369	83	0.76	2.72	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
285	1372	52	3.63	5.4	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
286	1378	28	1.56	15.02	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
287	1380	37	1.5	11.79	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
288	1389	80	1.36	2.72	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
289	1406	37	0.76	12.47	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
290	1424	68	1.08	5.03	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
291	1432	24	3.42	15.38	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
292	1433	6	4.37	34.68	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
293	1440	44	0	11.08	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
294	1449	36	1.05	12.67	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
295	1455	30	1.15	14.78	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
296	1473	89	0.61	1.62	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
297	1477	49	0.63	9.25	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
298	1478	8	9.52	24.19	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
299	1480	67	0.99	5.3	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
300	1484	89	0.29	2.08	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
301	1485	70	2.43	3.26	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
302	1496	86	1.15	1.79	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
303	1498	52	1.01	8.09	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
304	1499	12	0.28	28.57	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
305	1506	81	0.37	3.51	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
306	1507	80	0	3.98	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
307	1511	81	1	2.79	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
308	1513	90	0.64	1.49	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
309	1515	43	1.66	9.89	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
310	1527	78	0	4.35	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
311	1528	76	1.77	2.98	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
312	1529	37	0.37	12.76	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
313	1530	48	1.61	8.43	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
314	1535	84	0.6	2.69	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
315	1537	54	0.65	7.92	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
316	1539	77	1.36	3.17	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
317	1542	91	0.22	1.57	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
318	1543	87	0.88	1.9	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
319	1544	13	3.57	23.77	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
320	1548	86	0.71	2.2	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
321	1550	59	0.58	7.01	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
322	1553	31	2.36	13.13	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
323	1560	72	0.92	4.41	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
324	1562	16	5.06	19.58	2024-07-23 14:41:55.005	2024-07-23 14:41:55.005
\.


--
-- Data for Name: family_types; Type: TABLE DATA; Schema: public; Owner: young
--

COPY public.family_types (id, name, created_at, updated_at) FROM stdin;
1	Single	2024-08-04 22:48:31.419	2024-08-04 22:48:31.419
2	Married	2024-08-04 22:48:31.421	2024-08-04 22:48:31.421
3	Pet Owners	2024-08-04 22:48:31.424	2024-08-04 22:48:31.424
4	Families with Kids	2024-08-04 22:48:31.424	2024-08-04 22:48:31.424
5	Remote Workers	2024-08-04 22:48:31.424	2024-08-04 22:48:31.424
6	Commuters	2024-08-04 22:48:31.424	2024-08-04 22:48:31.424
7	Retirees	2024-08-04 22:48:31.424	2024-08-04 22:48:31.424
\.


--
-- Data for Name: favorite_cities; Type: TABLE DATA; Schema: public; Owner: young
--

COPY public.favorite_cities (id, user_id, city_id, created_at, updated_at) FROM stdin;
62	6	5	2024-08-04 01:50:14.272637	2024-08-04 01:50:14.272637
64	6	1191	2024-08-04 02:25:40.895785	2024-08-04 02:25:40.895785
71	11	173	2024-08-05 16:40:44.731792	2024-08-05 16:40:44.731792
252	7	1093	2024-08-20 00:38:13.280578	2024-08-20 00:38:13.280578
253	7	1177	2024-08-20 00:38:16.323029	2024-08-20 00:38:16.323029
254	7	1192	2024-08-20 00:38:18.055054	2024-08-20 00:38:18.055054
255	7	261	2024-08-20 00:49:37.215618	2024-08-20 00:49:37.215618
257	7	1026	2024-08-20 02:46:50.12802	2024-08-20 02:46:50.12802
\.


--
-- Data for Name: groceries; Type: TABLE DATA; Schema: public; Owner: young
--

COPY public.groceries (id, name, created_at, updated_at) FROM stdin;
1	ALDI	2024-08-02 13:24:08.566	2024-08-02 13:24:08.566
2	Costco	2024-08-02 13:24:08.569	2024-08-02 13:24:08.569
3	Jewel-Osco	2024-08-02 13:24:08.57	2024-08-02 13:24:08.57
4	Mariano's	2024-08-02 13:24:08.57	2024-08-02 13:24:08.57
5	Target	2024-08-02 13:24:08.57	2024-08-02 13:24:08.57
6	Trader Joe's	2024-08-02 13:24:08.57	2024-08-02 13:24:08.57
7	Walmart	2024-08-02 13:24:08.57	2024-08-02 13:24:08.57
8	Whole Foods Market	2024-08-02 13:24:08.57	2024-08-02 13:24:08.57
\.


--
-- Data for Name: grocery_cities; Type: TABLE DATA; Schema: public; Owner: young
--

COPY public.grocery_cities (id, city_id, grocery_id, created_at, updated_at) FROM stdin;
1	5	3	2024-08-02 13:31:02.262	2024-08-02 13:31:02.263
2	14	3	2024-08-02 13:31:02.273	2024-08-02 13:31:02.273
3	22	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
4	38	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
5	47	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
6	66	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
7	76	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
8	81	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
9	84	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
10	109	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
11	130	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
12	136	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
13	144	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
14	174	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
15	180	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
16	224	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
17	230	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
18	261	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
19	273	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
20	308	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
21	322	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
22	342	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
23	355	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
24	356	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
25	360	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
26	379	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
27	403	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
28	418	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
29	423	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
30	426	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
31	434	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
32	451	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
33	493	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
34	495	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
35	496	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
36	500	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
37	537	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
38	540	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
39	541	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
40	569	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
41	583	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
42	624	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
43	627	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
44	640	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
45	646	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
46	648	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
47	660	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
48	696	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
49	708	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
50	740	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
51	755	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
52	765	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
53	787	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
54	795	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
55	805	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
56	813	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
57	818	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
58	889	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
59	897	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
60	903	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
61	928	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
62	934	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
63	944	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
64	960	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
65	971	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
66	976	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
67	998	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
68	1008	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
69	1014	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
70	1032	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
71	1034	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
72	1035	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
73	1071	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
74	1073	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
75	1079	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
76	1084	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
77	1086	3	2024-08-02 13:31:02.275	2024-08-02 13:31:02.275
78	1094	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
79	1127	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
80	1190	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
81	1212	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
82	1214	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
83	1225	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
84	1264	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
85	1294	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
86	1300	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
87	1303	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
88	1315	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
89	1316	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
90	1317	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
91	1329	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
92	1242	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
93	1355	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
94	1365	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
95	1369	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
96	1380	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
97	1406	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
98	1455	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
99	1484	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
100	1485	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
101	1496	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
102	1498	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
103	1506	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
104	1511	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
105	1513	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
106	1529	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
107	1543	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
108	1548	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
109	1550	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
110	1560	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
111	1562	3	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
112	47	4	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
113	66	4	2024-08-02 13:31:02.276	2024-08-02 13:31:02.276
114	174	4	2024-08-02 13:31:02.281	2024-08-02 13:31:02.281
115	73	4	2024-08-02 13:31:02.281	2024-08-02 13:31:02.281
116	129	4	2024-08-02 13:31:02.282	2024-08-02 13:31:02.282
117	261	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
118	261	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
119	322	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
120	360	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
121	434	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
122	453	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
123	496	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
124	583	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
125	541	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
126	607	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
127	640	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
128	765	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
129	818	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
130	1026	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
131	976	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
132	1026	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
133	1027	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
134	1034	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
135	1071	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
136	1079	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
137	1094	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
138	1303	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
139	1294	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
140	1449	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
141	1507	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
142	1513	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
143	1506	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
144	1511	4	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
145	261	8	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
146	1190	8	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
147	1094	8	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
148	434	8	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
149	637	8	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
150	1528	8	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
151	1026	8	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
152	451	8	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
153	1264	8	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
154	1513	8	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
155	453	8	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
156	355	8	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
157	725	8	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
158	976	8	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
159	1449	8	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
160	1071	8	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
161	14	6	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
162	47	6	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
163	84	6	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
164	261	6	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
165	379	6	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
166	451	6	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
167	537	6	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
168	541	6	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
169	739	6	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
170	765	6	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
171	795	6	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
172	976	6	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
173	1026	6	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
174	1035	6	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
175	1071	6	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
176	1094	6	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
177	1264	6	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
178	5	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
179	14	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
180	22	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
181	25	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
182	38	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
183	47	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
184	66	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
185	81	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
186	82	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
187	84	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
188	94	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
189	101	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
190	105	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
191	106	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
192	129	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
193	130	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
194	131	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
195	136	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
196	144	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
197	152	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
198	157	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
199	174	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
200	195	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
201	199	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
202	200	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
203	213	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
204	218	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
205	224	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
206	225	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
207	230	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
208	240	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
209	244	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
210	250	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
211	261	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
212	262	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
213	263	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
214	267	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
215	290	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
216	317	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
217	322	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
218	341	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
219	342	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
220	356	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
221	351	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
222	360	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
223	368	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
224	369	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
225	379	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
226	404	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
227	415	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
228	423	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
229	426	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
230	451	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
231	453	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
232	462	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
233	496	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
234	504	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
235	510	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
236	519	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
237	536	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
238	537	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
239	540	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
240	541	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
241	542	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
242	563	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
243	583	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
244	598	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
245	607	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
246	638	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
247	640	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
248	646	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
249	660	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
250	685	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
251	696	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
252	708	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
253	722	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
254	740	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
255	765	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
256	772	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
257	787	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
258	799	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
259	805	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
260	806	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
261	813	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
262	818	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
263	831	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
264	839	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
265	841	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
266	843	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
267	864	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
268	880	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
269	881	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
270	889	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
271	897	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
272	934	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
273	939	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
274	944	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
275	947	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
276	948	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
277	960	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
278	963	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
279	971	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
280	1018	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
281	976	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
282	998	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
283	1008	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
284	1014	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
285	1024	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
286	1028	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
287	1030	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
288	1032	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
289	1070	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
290	1071	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
291	1073	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
292	1074	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
293	1079	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
294	1105	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
295	1108	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
296	1113	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
297	1127	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
298	1129	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
299	1138	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
300	1157	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
301	1160	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
302	1200	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
303	1204	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
304	1208	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
305	1214	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
306	1217	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
307	1226	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
308	1260	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
309	1264	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
310	1266	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
311	1294	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
312	1300	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
313	1303	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
314	1317	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
315	1324	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
316	1332	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
317	1335	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
318	1352	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
319	1365	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
320	1366	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
321	1369	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
322	1378	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
323	1389	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
324	1406	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
325	1433	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
326	1440	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
327	1449	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
328	1455	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
329	1461	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
330	1477	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
331	1485	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
332	1496	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
333	1511	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
334	1513	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
335	1544	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
336	1550	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
337	1560	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
338	1562	1	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
339	5	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
340	11	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
341	14	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
342	35	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
343	38	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
344	66	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
345	84	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
346	90	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
347	94	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
348	101	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
349	106	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
350	112	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
351	129	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
352	130	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
353	136	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
354	148	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
355	152	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
356	195	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
357	213	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
358	218	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
359	219	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
360	221	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
361	223	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
362	225	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
363	240	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
364	244	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
365	250	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
366	258	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
367	261	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
368	267	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
369	290	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
370	307	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
371	317	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
372	322	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
373	341	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
374	342	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
375	351	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
376	356	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
377	360	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
378	369	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
379	382	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
380	404	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
381	415	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
382	423	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
383	426	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
384	453	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
385	457	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
386	479	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
387	487	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
388	504	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
389	509	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
390	510	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
391	518	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
392	536	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
393	537	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
394	543	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
395	563	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
396	583	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
397	598	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
398	604	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
399	620	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
400	626	7	2024-08-02 13:31:02.283	2024-08-02 13:31:02.283
401	638	7	2024-08-02 13:31:02.285	2024-08-02 13:31:02.285
402	648	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
403	660	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
404	685	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
405	691	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
406	693	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
407	696	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
408	708	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
409	722	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
410	765	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
411	772	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
412	779	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
413	799	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
414	801	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
415	806	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
416	813	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
417	843	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
418	864	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
419	872	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
420	881	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
421	934	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
422	939	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
423	944	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
424	947	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
425	960	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
426	963	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
427	973	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
428	976	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
429	998	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
430	1008	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
431	1014	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
432	1028	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
433	1030	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
434	1057	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
435	1058	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
436	1070	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
437	1073	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
438	1074	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
439	1079	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
440	1091	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
441	1105	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
442	1108	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
443	1113	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
444	1126	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
445	1127	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
446	1129	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
447	1138	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
448	1154	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
449	1160	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
450	1166	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
451	1177	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
452	1199	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
453	1200	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
454	1203	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
455	1208	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
456	1212	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
457	1214	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
458	1217	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
459	1226	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
460	1242	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
461	1251	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
462	1260	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
463	1284	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
464	1294	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
465	1300	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
466	1303	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
467	1324	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
468	1332	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
469	1352	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
470	1365	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
471	1366	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
472	1389	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
473	1433	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
474	1440	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
475	1449	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
476	1455	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
477	1477	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
478	1480	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
479	1482	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
480	1485	7	2024-08-02 13:31:02.287	2024-08-02 13:31:02.287
481	1515	7	2024-08-02 13:31:02.288	2024-08-02 13:31:02.288
482	1544	7	2024-08-02 13:31:02.289	2024-08-02 13:31:02.289
483	1550	7	2024-08-02 13:31:02.292	2024-08-02 13:31:02.292
484	1562	7	2024-08-02 13:31:02.294	2024-08-02 13:31:02.294
485	14	5	2024-08-02 13:31:02.296	2024-08-02 13:31:02.296
486	25	5	2024-08-02 13:31:02.298	2024-08-02 13:31:02.298
487	47	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
488	84	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
489	101	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
490	136	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
491	144	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
492	157	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
493	244	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
494	261	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
495	267	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
496	317	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
497	322	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
498	351	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
499	356	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
500	404	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
501	414	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
502	423	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
503	451	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
504	462	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
505	510	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
506	540	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
507	541	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
508	583	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
509	627	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
510	632	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
511	638	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
512	640	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
513	648	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
514	696	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
515	750	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
516	765	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
517	787	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
518	818	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
519	841	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
520	864	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
521	897	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
522	934	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
523	971	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
524	976	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
525	998	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
526	1008	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
527	1014	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
528	1015	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
529	1018	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
530	1034	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
531	1035	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
532	1071	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
533	1073	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
534	1079	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
535	1108	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
536	1113	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
537	1127	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
538	1160	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
539	1208	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
540	1220	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
541	1264	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
542	1289	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
543	1294	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
544	1303	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
545	1316	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
546	1332	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
547	1242	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
548	1365	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
549	1406	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
550	1449	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
551	1455	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
552	1473	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
553	1485	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
554	1513	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
555	1515	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
556	1528	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
557	1543	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
558	1548	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
559	1560	5	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
560	94	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
561	129	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
562	136	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
563	244	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
564	404	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
565	541	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
566	759	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
567	765	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
568	831	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
569	897	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
570	908	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
571	960	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
572	976	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
573	976	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
574	1008	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
575	1024	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
576	1031	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
577	1071	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
578	1127	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
579	1264	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
580	1242	2	2024-08-02 13:31:02.299	2024-08-02 13:31:02.299
\.


--
-- Data for Name: gym_cities; Type: TABLE DATA; Schema: public; Owner: young
--

COPY public.gym_cities (id, gym_id, city_id, created_at, updated_at) FROM stdin;
1	2	1511	2024-08-02 13:43:05.146	2024-08-02 13:43:05.146
2	2	594	2024-08-02 13:43:05.149	2024-08-02 13:43:05.149
3	2	971	2024-08-02 13:43:05.149	2024-08-02 13:43:05.149
4	2	627	2024-08-02 13:43:05.149	2024-08-02 13:43:05.149
5	2	261	2024-08-02 13:43:05.149	2024-08-02 13:43:05.149
6	2	1034	2024-08-02 13:43:05.149	2024-08-02 13:43:05.149
7	2	976	2024-08-02 13:43:05.149	2024-08-02 13:43:05.149
8	2	1316	2024-08-02 13:43:05.149	2024-08-02 13:43:05.149
9	2	765	2024-08-02 13:43:05.149	2024-08-02 13:43:05.149
10	2	1498	2024-08-02 13:43:05.149	2024-08-02 13:43:05.149
11	2	1485	2024-08-02 13:43:05.149	2024-08-02 13:43:05.149
12	2	1406	2024-08-02 13:43:05.149	2024-08-02 13:43:05.149
13	2	1226	2024-08-02 13:43:05.149	2024-08-02 13:43:05.149
14	2	998	2024-08-02 13:43:05.149	2024-08-02 13:43:05.149
15	2	739	2024-08-02 13:43:05.149	2024-08-02 13:43:05.149
16	2	157	2024-08-02 13:43:05.149	2024-08-02 13:43:05.149
17	2	434	2024-08-02 13:43:05.149	2024-08-02 13:43:05.149
18	2	948	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
19	2	1008	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
20	2	1031	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
21	2	818	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
22	2	540	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
23	2	960	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
24	2	47	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
25	2	224	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
26	2	1026	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
27	2	1127	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
28	1	38	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
29	1	66	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
30	1	73	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
31	1	81	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
32	1	106	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
33	1	109	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
34	1	136	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
35	1	174	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
36	1	244	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
37	1	261	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
38	1	261	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
39	1	318	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
40	1	342	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
41	1	356	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
42	1	360	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
43	1	369	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
44	1	379	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
45	1	388	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
46	1	418	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
47	1	423	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
48	1	496	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
49	1	504	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
50	1	525	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
51	1	540	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
52	1	542	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
53	1	604	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
54	1	610	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
55	1	627	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
56	1	640	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
57	1	646	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
58	1	685	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
59	1	750	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
60	1	759	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
61	1	766	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
62	1	787	2024-08-02 13:43:05.151	2024-08-02 13:43:05.151
63	1	795	2024-08-02 13:43:05.152	2024-08-02 13:43:05.152
64	1	799	2024-08-02 13:43:05.156	2024-08-02 13:43:05.156
65	1	813	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
66	1	818	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
67	1	831	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
68	1	841	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
69	1	861	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
70	1	900	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
71	1	928	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
72	1	960	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
73	1	976	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
74	1	998	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
75	1	1008	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
76	1	1014	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
77	1	1018	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
78	1	1032	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
79	1	1071	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
80	1	1073	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
81	1	1074	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
82	1	1079	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
83	1	1091	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
84	1	1108	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
85	1	1113	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
86	1	1127	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
87	1	1141	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
88	1	1154	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
89	1	1160	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
90	1	1195	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
91	1	1200	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
92	1	1208	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
93	1	1212	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
94	1	1214	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
95	1	1217	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
96	1	1219	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
97	1	1255	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
98	1	1264	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
99	1	1289	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
100	1	1303	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
101	1	1317	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
102	1	1332	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
103	1	1335	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
104	1	1365	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
105	1	1369	2024-08-02 13:43:05.157	2024-08-02 13:43:05.157
106	1	1403	2024-08-02 13:43:05.158	2024-08-02 13:43:05.158
107	1	1406	2024-08-02 13:43:05.158	2024-08-02 13:43:05.158
108	1	66	2024-08-02 13:43:05.158	2024-08-02 13:43:05.158
109	1	1506	2024-08-02 13:43:05.158	2024-08-02 13:43:05.158
110	1	1513	2024-08-02 13:43:05.158	2024-08-02 13:43:05.158
111	1	1536	2024-08-02 13:43:05.158	2024-08-02 13:43:05.158
112	1	1550	2024-08-02 13:43:05.158	2024-08-02 13:43:05.158
113	1	1560	2024-08-02 13:43:05.158	2024-08-02 13:43:05.158
114	5	897	2024-08-02 13:43:05.158	2024-08-02 13:43:05.158
115	5	261	2024-08-02 13:43:05.158	2024-08-02 13:43:05.158
116	5	1015	2024-08-02 13:43:05.158	2024-08-02 13:43:05.158
117	5	839	2024-08-02 13:43:05.158	2024-08-02 13:43:05.158
118	5	1303	2024-08-02 13:43:05.158	2024-08-02 13:43:05.158
119	5	1008	2024-08-02 13:43:05.158	2024-08-02 13:43:05.158
120	5	5	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
121	5	263	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
122	5	379	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
123	5	1264	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
124	5	224	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
125	5	47	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
126	5	317	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
127	5	795	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
128	5	976	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
129	5	1335	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
130	5	1313	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
131	5	136	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
132	5	880	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
133	5	84	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
134	4	436	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
135	4	897	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
136	4	487	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
137	4	261	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
138	4	261	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
139	4	261	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
140	4	267	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
141	4	261	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
142	4	261	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
143	4	1455	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
144	4	261	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
145	4	360	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
146	4	5	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
147	4	801	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
148	4	948	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
149	4	261	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
150	4	261	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
151	4	451	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
152	4	261	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
153	4	426	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
154	4	261	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
155	4	360	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
156	4	180	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
157	4	152	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
158	4	624	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
159	4	224	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
160	4	960	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
161	4	541	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
162	4	1034	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
163	4	379	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
164	4	261	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
165	4	1513	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
166	4	453	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
167	4	129	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
168	4	261	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
169	4	1264	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
170	4	1548	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
171	4	47	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
172	4	976	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
173	4	355	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
174	4	317	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
175	4	1079	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
176	4	1264	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
177	4	261	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
178	4	1496	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
179	4	200	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
180	4	787	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
181	4	136	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
182	4	1406	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
183	4	261	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
184	4	66	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
185	4	765	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
186	4	1449	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
187	4	813	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
188	4	307	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
189	4	1335	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
190	4	1127	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
191	4	66	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
192	4	772	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
193	4	1498	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
194	4	423	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
195	4	971	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
196	4	998	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
197	4	939	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
198	4	696	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
199	4	696	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
200	4	322	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
201	4	1485	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
202	4	1560	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
203	3	1031	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
204	3	261	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
205	3	1303	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
206	3	1264	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
207	3	186	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
208	3	1026	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
209	3	129	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
210	3	1266	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
211	3	1449	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
212	3	1473	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
213	3	765	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
214	3	1214	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
215	3	1071	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
216	3	14	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
217	3	451	2024-08-02 13:43:05.159	2024-08-02 13:43:05.159
\.


--
-- Data for Name: gyms; Type: TABLE DATA; Schema: public; Owner: young
--

COPY public.gyms (id, name, created_at, updated_at) FROM stdin;
1	Anytime Fitness	2024-08-02 13:35:32.209	2024-08-02 13:35:32.209
2	LA Fitness	2024-08-02 13:35:32.211	2024-08-02 13:35:32.211
3	Lifetime Fitness	2024-08-02 13:35:32.211	2024-08-02 13:35:32.211
4	Planet Fitness	2024-08-02 13:35:32.211	2024-08-02 13:35:32.211
5	XSport Fitness	2024-08-02 13:35:32.211	2024-08-02 13:35:32.211
\.


--
-- Data for Name: language_cities; Type: TABLE DATA; Schema: public; Owner: young
--

COPY public.language_cities (id, language_id, city_id, percentage, created_at, updated_at) FROM stdin;
1	27	5	34	2024-08-03 11:57:49.657	2024-08-03 11:57:49.657
2	13	5	4.6	2024-08-03 11:57:49.659	2024-08-03 11:57:49.659
3	21	5	4.1	2024-08-03 11:57:49.66	2024-08-03 11:57:49.66
4	10	5	2.5	2024-08-03 11:57:49.662	2024-08-03 11:57:49.662
5	27	14	7.3	2024-08-03 11:57:49.664	2024-08-03 11:57:49.664
6	21	14	3.7	2024-08-03 11:57:49.665	2024-08-03 11:57:49.665
7	13	14	2.3	2024-08-03 11:57:49.666	2024-08-03 11:57:49.666
8	30	14	1.1	2024-08-03 11:57:49.668	2024-08-03 11:57:49.668
9	27	22	14.3	2024-08-03 11:57:49.669	2024-08-03 11:57:49.669
10	2	22	1.9	2024-08-03 11:57:49.67	2024-08-03 11:57:49.67
11	18	22	1.1	2024-08-03 11:57:49.671	2024-08-03 11:57:49.671
12	21	22	1.1	2024-08-03 11:57:49.673	2024-08-03 11:57:49.673
13	27	25	0.3	2024-08-03 11:57:49.675	2024-08-03 11:57:49.675
14	7	25	0.3	2024-08-03 11:57:49.677	2024-08-03 11:57:49.677
15	13	25	0.3	2024-08-03 11:57:49.678	2024-08-03 11:57:49.678
16	5	25	0.2	2024-08-03 11:57:49.68	2024-08-03 11:57:49.68
17	27	38	2.7	2024-08-03 11:57:49.681	2024-08-03 11:57:49.681
18	28	38	1.9	2024-08-03 11:57:49.682	2024-08-03 11:57:49.682
19	26	38	1.1	2024-08-03 11:57:49.684	2024-08-03 11:57:49.684
20	8	38	1	2024-08-03 11:57:49.685	2024-08-03 11:57:49.685
21	27	47	5.5	2024-08-03 11:57:49.686	2024-08-03 11:57:49.686
22	21	47	4.6	2024-08-03 11:57:49.687	2024-08-03 11:57:49.687
23	13	47	3.4	2024-08-03 11:57:49.689	2024-08-03 11:57:49.689
24	26	47	2.7	2024-08-03 11:57:49.69	2024-08-03 11:57:49.69
25	27	66	34.2	2024-08-03 11:57:49.692	2024-08-03 11:57:49.692
26	13	66	2.4	2024-08-03 11:57:49.694	2024-08-03 11:57:49.694
27	17	66	1.3	2024-08-03 11:57:49.695	2024-08-03 11:57:49.695
28	28	66	0.9	2024-08-03 11:57:49.696	2024-08-03 11:57:49.696
29	4	76	2	2024-08-03 11:57:49.698	2024-08-03 11:57:49.698
30	27	76	1.7	2024-08-03 11:57:49.699	2024-08-03 11:57:49.699
31	12	76	1.4	2024-08-03 11:57:49.701	2024-08-03 11:57:49.701
32	7	76	1.1	2024-08-03 11:57:49.702	2024-08-03 11:57:49.702
33	27	81	9.3	2024-08-03 11:57:49.703	2024-08-03 11:57:49.703
34	13	81	7.3	2024-08-03 11:57:49.704	2024-08-03 11:57:49.704
35	21	81	3.6	2024-08-03 11:57:49.706	2024-08-03 11:57:49.706
36	28	81	2.2	2024-08-03 11:57:49.707	2024-08-03 11:57:49.707
37	10	82	2.1	2024-08-03 11:57:49.709	2024-08-03 11:57:49.709
38	21	82	1.4	2024-08-03 11:57:49.711	2024-08-03 11:57:49.711
39	31	82	0.9	2024-08-03 11:57:49.712	2024-08-03 11:57:49.712
40	8	82	0.5	2024-08-03 11:57:49.713	2024-08-03 11:57:49.713
41	27	84	0.3	2024-08-03 11:57:49.715	2024-08-03 11:57:49.715
42	2	84	0.3	2024-08-03 11:57:49.765	2024-08-03 11:57:49.765
43	13	84	0.2	2024-08-03 11:57:49.769	2024-08-03 11:57:49.769
44	26	84	0.2	2024-08-03 11:57:49.77	2024-08-03 11:57:49.77
45	27	89	40.7	2024-08-03 11:57:49.771	2024-08-03 11:57:49.771
46	28	89	2	2024-08-03 11:57:49.773	2024-08-03 11:57:49.773
47	17	89	0.8	2024-08-03 11:57:49.775	2024-08-03 11:57:49.775
48	21	89	0.5	2024-08-03 11:57:49.777	2024-08-03 11:57:49.777
49	27	90	32.6	2024-08-03 11:57:49.778	2024-08-03 11:57:49.778
50	5	90	3.3	2024-08-03 11:57:49.78	2024-08-03 11:57:49.78
51	10	90	1.2	2024-08-03 11:57:49.782	2024-08-03 11:57:49.782
52	28	90	0.9	2024-08-03 11:57:49.783	2024-08-03 11:57:49.784
53	27	101	0.7	2024-08-03 11:57:49.786	2024-08-03 11:57:49.786
54	2	101	0.6	2024-08-03 11:57:49.793	2024-08-03 11:57:49.793
55	5	101	0.6	2024-08-03 11:57:49.795	2024-08-03 11:57:49.795
56	7	101	0.2	2024-08-03 11:57:49.797	2024-08-03 11:57:49.797
57	27	105	19.4	2024-08-03 11:57:49.799	2024-08-03 11:57:49.799
58	21	105	0.4	2024-08-03 11:57:49.801	2024-08-03 11:57:49.801
59	30	105	0.3	2024-08-03 11:57:49.802	2024-08-03 11:57:49.802
60	28	105	0.2	2024-08-03 11:57:49.806	2024-08-03 11:57:49.806
61	27	106	29.5	2024-08-03 11:57:49.807	2024-08-03 11:57:49.807
62	18	106	0.8	2024-08-03 11:57:49.809	2024-08-03 11:57:49.809
63	22	106	0.6	2024-08-03 11:57:49.81	2024-08-03 11:57:49.81
64	21	106	0.4	2024-08-03 11:57:49.812	2024-08-03 11:57:49.812
65	27	109	35.2	2024-08-03 11:57:49.813	2024-08-03 11:57:49.813
66	21	109	6.4	2024-08-03 11:57:49.815	2024-08-03 11:57:49.815
67	13	109	1.9	2024-08-03 11:57:49.816	2024-08-03 11:57:49.816
68	26	109	1.8	2024-08-03 11:57:49.817	2024-08-03 11:57:49.817
69	10	112	2.3	2024-08-03 11:57:49.819	2024-08-03 11:57:49.819
70	21	112	1	2024-08-03 11:57:49.821	2024-08-03 11:57:49.821
73	27	116	49.1	2024-08-03 11:57:49.827	2024-08-03 11:57:49.827
74	28	116	1.9	2024-08-03 11:57:49.829	2024-08-03 11:57:49.829
75	10	116	0.7	2024-08-03 11:57:49.83	2024-08-03 11:57:49.83
76	26	116	0.6	2024-08-03 11:57:49.831	2024-08-03 11:57:49.831
77	18	117	0.9	2024-08-03 11:57:49.833	2024-08-03 11:57:49.833
78	21	117	0.8	2024-08-03 11:57:49.844	2024-08-03 11:57:49.844
79	13	117	0.4	2024-08-03 11:57:49.847	2024-08-03 11:57:49.847
80	10	117	0.3	2024-08-03 11:57:49.848	2024-08-03 11:57:49.848
81	27	129	5.1	2024-08-03 11:57:49.849	2024-08-03 11:57:49.849
82	13	129	5	2024-08-03 11:57:49.851	2024-08-03 11:57:49.851
83	21	129	3.8	2024-08-03 11:57:49.853	2024-08-03 11:57:49.853
84	10	129	1.9	2024-08-03 11:57:49.854	2024-08-03 11:57:49.854
85	27	130	2.9	2024-08-03 11:57:49.856	2024-08-03 11:57:49.856
86	17	130	2.8	2024-08-03 11:57:49.857	2024-08-03 11:57:49.857
87	13	130	0.5	2024-08-03 11:57:49.863	2024-08-03 11:57:49.863
88	4	130	0.4	2024-08-03 11:57:49.867	2024-08-03 11:57:49.867
89	27	131	36.7	2024-08-03 11:57:49.868	2024-08-03 11:57:49.868
90	21	131	0.5	2024-08-03 11:57:49.869	2024-08-03 11:57:49.869
91	16	131	0.3	2024-08-03 11:57:49.871	2024-08-03 11:57:49.871
92	10	131	0.2	2024-08-03 11:57:49.872	2024-08-03 11:57:49.872
93	27	136	20.6	2024-08-03 11:57:49.874	2024-08-03 11:57:49.874
94	13	136	3.8	2024-08-03 11:57:49.875	2024-08-03 11:57:49.875
95	28	136	2.1	2024-08-03 11:57:49.876	2024-08-03 11:57:49.876
96	1	136	1.2	2024-08-03 11:57:49.877	2024-08-03 11:57:49.877
97	27	144	0.8	2024-08-03 11:57:49.879	2024-08-03 11:57:49.879
98	13	144	0.8	2024-08-03 11:57:49.88	2024-08-03 11:57:49.88
99	28	144	0.7	2024-08-03 11:57:49.882	2024-08-03 11:57:49.882
100	5	144	0.3	2024-08-03 11:57:49.883	2024-08-03 11:57:49.883
101	21	148	8.1	2024-08-03 11:57:49.886	2024-08-03 11:57:49.886
102	27	148	0.6	2024-08-03 11:57:49.889	2024-08-03 11:57:49.889
103	19	148	0.5	2024-08-03 11:57:49.892	2024-08-03 11:57:49.892
104	1	148	0.5	2024-08-03 11:57:49.894	2024-08-03 11:57:49.894
105	10	149	2.1	2024-08-03 11:57:49.895	2024-08-03 11:57:49.895
106	27	149	0.8	2024-08-03 11:57:49.896	2024-08-03 11:57:49.896
107	18	149	0.5	2024-08-03 11:57:49.898	2024-08-03 11:57:49.898
108	21	149	0.4	2024-08-03 11:57:49.904	2024-08-03 11:57:49.904
109	27	150	0.6	2024-08-03 11:57:49.908	2024-08-03 11:57:49.908
110	7	150	0.5	2024-08-03 11:57:49.91	2024-08-03 11:57:49.91
111	29	150	0.2	2024-08-03 11:57:49.912	2024-08-03 11:57:49.912
112	28	150	0.1	2024-08-03 11:57:49.913	2024-08-03 11:57:49.913
113	27	152	23.1	2024-08-03 11:57:49.915	2024-08-03 11:57:49.915
114	21	152	13.1	2024-08-03 11:57:49.916	2024-08-03 11:57:49.916
115	2	152	8.5	2024-08-03 11:57:49.917	2024-08-03 11:57:49.917
116	13	152	1.9	2024-08-03 11:57:49.919	2024-08-03 11:57:49.919
117	10	153	0.6	2024-08-03 11:57:49.92	2024-08-03 11:57:49.92
121	27	157	16.1	2024-08-03 11:57:49.928	2024-08-03 11:57:49.928
122	1	157	1.1	2024-08-03 11:57:49.93	2024-08-03 11:57:49.93
123	28	157	1	2024-08-03 11:57:49.931	2024-08-03 11:57:49.931
124	18	157	0.7	2024-08-03 11:57:49.933	2024-08-03 11:57:49.933
125	27	160	12.8	2024-08-03 11:57:49.935	2024-08-03 11:57:49.935
126	26	160	2.5	2024-08-03 11:57:49.936	2024-08-03 11:57:49.936
127	21	160	1.5	2024-08-03 11:57:49.938	2024-08-03 11:57:49.938
128	10	160	1.3	2024-08-03 11:57:49.94	2024-08-03 11:57:49.94
129	26	174	8.9	2024-08-03 11:57:49.941	2024-08-03 11:57:49.941
130	27	174	6.1	2024-08-03 11:57:49.943	2024-08-03 11:57:49.943
131	13	174	5.7	2024-08-03 11:57:49.943	2024-08-03 11:57:49.943
132	12	174	3.6	2024-08-03 11:57:49.943	2024-08-03 11:57:49.943
133	27	180	37.3	2024-08-03 11:57:49.943	2024-08-03 11:57:49.943
134	21	180	12.4	2024-08-03 11:57:49.948	2024-08-03 11:57:49.948
135	2	180	5.3	2024-08-03 11:57:49.953	2024-08-03 11:57:49.953
136	18	180	1.4	2024-08-03 11:57:49.953	2024-08-03 11:57:49.953
137	13	186	7.7	2024-08-03 11:57:49.953	2024-08-03 11:57:49.953
138	2	186	5.7	2024-08-03 11:57:49.953	2024-08-03 11:57:49.953
139	27	186	4.8	2024-08-03 11:57:49.953	2024-08-03 11:57:49.953
140	21	186	2.3	2024-08-03 11:57:49.953	2024-08-03 11:57:49.953
145	27	199	15.2	2024-08-03 11:57:49.955	2024-08-03 11:57:49.955
146	1	199	1.5	2024-08-03 11:57:49.955	2024-08-03 11:57:49.955
147	8	199	0.3	2024-08-03 11:57:49.955	2024-08-03 11:57:49.955
148	16	199	0.2	2024-08-03 11:57:49.956	2024-08-03 11:57:49.956
149	27	200	1	2024-08-03 11:57:49.956	2024-08-03 11:57:49.956
150	21	200	0.7	2024-08-03 11:57:49.956	2024-08-03 11:57:49.956
151	1	200	0.1	2024-08-03 11:57:49.956	2024-08-03 11:57:49.956
153	27	210	0.8	2024-08-03 11:57:49.956	2024-08-03 11:57:49.956
154	12	210	0.4	2024-08-03 11:57:49.956	2024-08-03 11:57:49.956
155	21	210	0.2	2024-08-03 11:57:49.956	2024-08-03 11:57:49.956
156	16	210	0.2	2024-08-03 11:57:49.956	2024-08-03 11:57:49.956
157	27	213	0.3	2024-08-03 11:57:49.956	2024-08-03 11:57:49.956
158	25	213	0.2	2024-08-03 11:57:49.957	2024-08-03 11:57:49.957
159	5	213	0.1	2024-08-03 11:57:49.959	2024-08-03 11:57:49.959
160	8	213	0.1	2024-08-03 11:57:49.962	2024-08-03 11:57:49.962
161	27	218	3.7	2024-08-03 11:57:49.964	2024-08-03 11:57:49.964
162	2	218	2.1	2024-08-03 11:57:49.965	2024-08-03 11:57:49.965
163	4	218	1.1	2024-08-03 11:57:49.967	2024-08-03 11:57:49.967
164	1	218	0.8	2024-08-03 11:57:49.967	2024-08-03 11:57:49.967
165	7	221	1.7	2024-08-03 11:57:49.967	2024-08-03 11:57:49.967
166	10	221	1.4	2024-08-03 11:57:49.967	2024-08-03 11:57:49.967
167	27	221	0.4	2024-08-03 11:57:49.967	2024-08-03 11:57:49.967
168	19	221	0.1	2024-08-03 11:57:49.968	2024-08-03 11:57:49.968
169	21	223	0.7	2024-08-03 11:57:49.968	2024-08-03 11:57:49.968
170	27	223	0.2	2024-08-03 11:57:49.968	2024-08-03 11:57:49.968
171	7	223	0.1	2024-08-03 11:57:49.968	2024-08-03 11:57:49.968
172	13	223	0.1	2024-08-03 11:57:49.968	2024-08-03 11:57:49.968
173	27	224	12.6	2024-08-03 11:57:49.968	2024-08-03 11:57:49.968
174	13	224	8	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
175	31	224	2.2	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
176	21	224	2.1	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
177	27	225	47.7	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
178	28	225	1.8	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
179	13	225	1.6	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
180	30	225	1	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
181	21	228	1.6	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
182	27	228	1	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
183	31	228	0.5	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
184	17	228	0.2	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
185	27	230	1.8	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
186	21	230	0.9	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
187	13	230	0.4	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
188	26	230	0.4	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
189	27	240	1.9	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
190	21	240	0.4	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
191	7	240	0.4	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
192	28	240	0.3	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
193	4	244	5.8	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
194	27	244	4.7	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
195	13	244	2.7	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
196	5	244	2.3	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
197	27	247	0.7	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
198	21	247	0.5	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
199	8	247	0.2	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
200	26	247	0.2	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
201	27	250	0.6	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
202	13	250	0.5	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
203	18	250	0.4	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
204	4	250	0.4	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
205	13	251	0.5	2024-08-03 11:57:49.969	2024-08-03 11:57:49.969
206	4	251	0.5	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
207	27	251	0.4	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
208	7	251	0.2	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
209	27	258	1.1	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
210	10	258	0.5	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
211	26	258	0.2	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
213	27	261	23.5	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
214	4	261	1.9	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
215	21	261	1.9	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
216	13	261	1.2	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
217	27	262	30.1	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
218	10	262	0.5	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
219	1	262	0.2	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
220	5	262	0.2	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
221	2	263	15.7	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
222	27	263	11.4	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
223	21	263	10.5	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
224	28	263	3.2	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
225	10	264	2.3	2024-08-03 11:57:49.97	2024-08-03 11:57:49.97
226	21	264	0.8	2024-08-03 11:57:49.971	2024-08-03 11:57:49.971
227	8	264	0.5	2024-08-03 11:57:49.972	2024-08-03 11:57:49.972
228	27	264	0.2	2024-08-03 11:57:49.973	2024-08-03 11:57:49.973
229	27	267	80	2024-08-03 11:57:49.975	2024-08-03 11:57:49.975
230	21	267	0.3	2024-08-03 11:57:49.976	2024-08-03 11:57:49.976
231	4	267	0.2	2024-08-03 11:57:49.979	2024-08-03 11:57:49.979
232	10	267	0.2	2024-08-03 11:57:49.981	2024-08-03 11:57:49.981
233	21	279	3	2024-08-03 11:57:49.981	2024-08-03 11:57:49.981
234	10	279	2.5	2024-08-03 11:57:49.982	2024-08-03 11:57:49.982
237	21	280	2.9	2024-08-03 11:57:49.982	2024-08-03 11:57:49.982
241	27	290	2.7	2024-08-03 11:57:49.982	2024-08-03 11:57:49.982
242	21	290	0.3	2024-08-03 11:57:49.982	2024-08-03 11:57:49.982
243	5	290	0.2	2024-08-03 11:57:49.982	2024-08-03 11:57:49.982
244	1	290	0.2	2024-08-03 11:57:49.982	2024-08-03 11:57:49.982
245	27	294	0.7	2024-08-03 11:57:49.982	2024-08-03 11:57:49.982
246	7	294	0.4	2024-08-03 11:57:49.982	2024-08-03 11:57:49.982
247	22	294	0.4	2024-08-03 11:57:49.982	2024-08-03 11:57:49.982
248	8	294	0.4	2024-08-03 11:57:49.982	2024-08-03 11:57:49.982
249	27	307	0.8	2024-08-03 11:57:49.982	2024-08-03 11:57:49.982
250	1	307	0.4	2024-08-03 11:57:49.982	2024-08-03 11:57:49.982
251	5	307	0.4	2024-08-03 11:57:49.982	2024-08-03 11:57:49.982
252	24	307	0.4	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
253	27	315	13.3	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
254	21	315	1	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
255	1	315	0.7	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
256	2	315	0.6	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
257	27	317	7.9	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
258	2	317	2.3	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
259	21	317	1.8	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
260	28	317	1.7	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
261	27	318	0.7	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
262	17	318	0.4	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
263	5	318	0.4	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
264	7	318	0.3	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
265	27	322	7.9	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
266	21	322	0.9	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
267	18	322	0.7	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
268	28	322	0.6	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
269	27	341	0.2	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
270	31	341	0.2	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
271	13	341	0.2	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
272	17	341	0.1	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
273	13	342	4.3	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
274	27	342	4.2	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
275	18	342	2.5	2024-08-03 11:57:49.983	2024-08-03 11:57:49.983
276	28	342	2.3	2024-08-03 11:57:49.984	2024-08-03 11:57:49.984
277	27	351	0.3	2024-08-03 11:57:49.984	2024-08-03 11:57:49.984
278	28	351	0.3	2024-08-03 11:57:49.984	2024-08-03 11:57:49.984
279	13	351	0.2	2024-08-03 11:57:49.984	2024-08-03 11:57:49.984
280	26	351	0.2	2024-08-03 11:57:49.984	2024-08-03 11:57:49.984
281	27	355	1.7	2024-08-03 11:57:49.984	2024-08-03 11:57:49.984
282	26	355	0.8	2024-08-03 11:57:49.984	2024-08-03 11:57:49.984
283	12	355	0.7	2024-08-03 11:57:49.984	2024-08-03 11:57:49.984
284	4	355	0.6	2024-08-03 11:57:49.984	2024-08-03 11:57:49.984
285	27	356	10.7	2024-08-03 11:57:49.984	2024-08-03 11:57:49.984
286	4	356	1.7	2024-08-03 11:57:49.984	2024-08-03 11:57:49.984
287	2	356	1.6	2024-08-03 11:57:49.984	2024-08-03 11:57:49.984
288	13	356	1.1	2024-08-03 11:57:49.985	2024-08-03 11:57:49.985
289	27	360	15.1	2024-08-03 11:57:49.985	2024-08-03 11:57:49.985
290	21	360	8.4	2024-08-03 11:57:49.986	2024-08-03 11:57:49.986
291	13	360	6.3	2024-08-03 11:57:49.986	2024-08-03 11:57:49.986
292	26	360	3.9	2024-08-03 11:57:49.986	2024-08-03 11:57:49.986
293	27	369	2.3	2024-08-03 11:57:49.986	2024-08-03 11:57:49.986
294	21	369	0.9	2024-08-03 11:57:49.986	2024-08-03 11:57:49.986
295	18	369	0.4	2024-08-03 11:57:49.986	2024-08-03 11:57:49.986
296	7	369	0.4	2024-08-03 11:57:49.986	2024-08-03 11:57:49.986
297	5	370	1.2	2024-08-03 11:57:49.986	2024-08-03 11:57:49.986
298	21	370	1	2024-08-03 11:57:49.986	2024-08-03 11:57:49.986
299	10	370	0.7	2024-08-03 11:57:49.986	2024-08-03 11:57:49.986
300	27	370	0.5	2024-08-03 11:57:49.986	2024-08-03 11:57:49.986
301	27	379	3.2	2024-08-03 11:57:49.986	2024-08-03 11:57:49.986
302	13	379	2.6	2024-08-03 11:57:49.987	2024-08-03 11:57:49.987
303	21	379	1.8	2024-08-03 11:57:49.991	2024-08-03 11:57:49.991
304	4	379	1.4	2024-08-03 11:57:49.997	2024-08-03 11:57:49.997
305	21	382	2.3	2024-08-03 11:57:50.001	2024-08-03 11:57:50.001
306	27	382	0.8	2024-08-03 11:57:50.001	2024-08-03 11:57:50.001
307	7	382	0.5	2024-08-03 11:57:50.001	2024-08-03 11:57:50.001
308	18	382	0.4	2024-08-03 11:57:50.001	2024-08-03 11:57:50.001
309	10	387	1.5	2024-08-03 11:57:50.001	2024-08-03 11:57:50.001
313	10	393	0.5	2024-08-03 11:57:50.001	2024-08-03 11:57:50.001
314	21	393	0.2	2024-08-03 11:57:50.001	2024-08-03 11:57:50.001
317	27	403	11.9	2024-08-03 11:57:50.001	2024-08-03 11:57:50.001
318	5	403	2.7	2024-08-03 11:57:50.001	2024-08-03 11:57:50.001
319	17	403	2.5	2024-08-03 11:57:50.001	2024-08-03 11:57:50.001
320	1	403	1.4	2024-08-03 11:57:50.001	2024-08-03 11:57:50.001
321	27	404	0.8	2024-08-03 11:57:50.001	2024-08-03 11:57:50.001
322	31	404	0.3	2024-08-03 11:57:50.001	2024-08-03 11:57:50.001
323	28	404	0.3	2024-08-03 11:57:50.002	2024-08-03 11:57:50.002
324	12	404	0.3	2024-08-03 11:57:50.002	2024-08-03 11:57:50.002
325	27	414	0.6	2024-08-03 11:57:50.003	2024-08-03 11:57:50.003
326	17	414	0.6	2024-08-03 11:57:50.006	2024-08-03 11:57:50.006
327	4	414	0.5	2024-08-03 11:57:50.008	2024-08-03 11:57:50.008
328	13	414	0.5	2024-08-03 11:57:50.009	2024-08-03 11:57:50.009
329	27	415	1.3	2024-08-03 11:57:50.009	2024-08-03 11:57:50.009
330	21	415	0.4	2024-08-03 11:57:50.009	2024-08-03 11:57:50.009
331	8	415	0.2	2024-08-03 11:57:50.009	2024-08-03 11:57:50.009
332	23	415	0.2	2024-08-03 11:57:50.009	2024-08-03 11:57:50.009
333	27	418	0.1	2024-08-03 11:57:50.009	2024-08-03 11:57:50.009
334	26	418	0.1	2024-08-03 11:57:50.01	2024-08-03 11:57:50.01
337	21	420	2.7	2024-08-03 11:57:50.012	2024-08-03 11:57:50.012
338	10	420	0.8	2024-08-03 11:57:50.012	2024-08-03 11:57:50.012
339	8	420	0.6	2024-08-03 11:57:50.012	2024-08-03 11:57:50.012
340	27	420	0.3	2024-08-03 11:57:50.013	2024-08-03 11:57:50.013
341	27	423	39.3	2024-08-03 11:57:50.014	2024-08-03 11:57:50.014
342	13	423	1.9	2024-08-03 11:57:50.014	2024-08-03 11:57:50.014
343	28	423	1.1	2024-08-03 11:57:50.014	2024-08-03 11:57:50.014
344	14	423	0.5	2024-08-03 11:57:50.014	2024-08-03 11:57:50.014
345	27	426	9	2024-08-03 11:57:50.014	2024-08-03 11:57:50.014
346	21	426	7	2024-08-03 11:57:50.014	2024-08-03 11:57:50.014
347	13	426	4	2024-08-03 11:57:50.014	2024-08-03 11:57:50.014
348	26	426	3.9	2024-08-03 11:57:50.014	2024-08-03 11:57:50.014
349	27	434	5.3	2024-08-03 11:57:50.014	2024-08-03 11:57:50.014
350	13	434	1.8	2024-08-03 11:57:50.014	2024-08-03 11:57:50.014
351	21	434	1.4	2024-08-03 11:57:50.014	2024-08-03 11:57:50.014
352	17	434	1.3	2024-08-03 11:57:50.014	2024-08-03 11:57:50.014
353	27	436	21.5	2024-08-03 11:57:50.014	2024-08-03 11:57:50.014
354	21	436	11.1	2024-08-03 11:57:50.015	2024-08-03 11:57:50.015
355	26	436	2.5	2024-08-03 11:57:50.015	2024-08-03 11:57:50.015
356	28	436	2.4	2024-08-03 11:57:50.015	2024-08-03 11:57:50.015
357	27	440	1.3	2024-08-03 11:57:50.015	2024-08-03 11:57:50.015
358	5	440	0.3	2024-08-03 11:57:50.015	2024-08-03 11:57:50.015
361	27	451	7.5	2024-08-03 11:57:50.015	2024-08-03 11:57:50.015
362	4	451	2.8	2024-08-03 11:57:50.015	2024-08-03 11:57:50.015
363	5	451	1.1	2024-08-03 11:57:50.015	2024-08-03 11:57:50.015
364	12	451	1	2024-08-03 11:57:50.015	2024-08-03 11:57:50.015
365	27	453	10.2	2024-08-03 11:57:50.015	2024-08-03 11:57:50.015
366	28	453	1	2024-08-03 11:57:50.015	2024-08-03 11:57:50.015
367	1	453	0.7	2024-08-03 11:57:50.015	2024-08-03 11:57:50.015
368	13	453	0.6	2024-08-03 11:57:50.015	2024-08-03 11:57:50.015
369	27	457	0.7	2024-08-03 11:57:50.015	2024-08-03 11:57:50.015
370	21	457	0.2	2024-08-03 11:57:50.015	2024-08-03 11:57:50.015
373	21	462	1.5	2024-08-03 11:57:50.016	2024-08-03 11:57:50.016
374	27	462	0.9	2024-08-03 11:57:50.016	2024-08-03 11:57:50.016
375	13	462	0.5	2024-08-03 11:57:50.016	2024-08-03 11:57:50.016
376	7	462	0.4	2024-08-03 11:57:50.016	2024-08-03 11:57:50.016
377	1	482	1.2	2024-08-03 11:57:50.016	2024-08-03 11:57:50.016
378	27	482	0.8	2024-08-03 11:57:50.016	2024-08-03 11:57:50.016
379	17	482	0.7	2024-08-03 11:57:50.016	2024-08-03 11:57:50.016
380	5	482	0.7	2024-08-03 11:57:50.017	2024-08-03 11:57:50.017
381	27	487	6.8	2024-08-03 11:57:50.018	2024-08-03 11:57:50.018
382	13	487	1.3	2024-08-03 11:57:50.018	2024-08-03 11:57:50.018
383	21	487	0.9	2024-08-03 11:57:50.018	2024-08-03 11:57:50.018
384	18	487	0.7	2024-08-03 11:57:50.018	2024-08-03 11:57:50.018
385	27	493	8.1	2024-08-03 11:57:50.018	2024-08-03 11:57:50.018
386	21	493	1.7	2024-08-03 11:57:50.018	2024-08-03 11:57:50.018
387	19	493	0.7	2024-08-03 11:57:50.019	2024-08-03 11:57:50.019
388	7	493	0.5	2024-08-03 11:57:50.019	2024-08-03 11:57:50.019
389	27	496	0.6	2024-08-03 11:57:50.019	2024-08-03 11:57:50.019
390	7	496	0.6	2024-08-03 11:57:50.019	2024-08-03 11:57:50.019
391	2	496	0.5	2024-08-03 11:57:50.019	2024-08-03 11:57:50.019
392	28	496	0.4	2024-08-03 11:57:50.019	2024-08-03 11:57:50.019
393	27	500	46.2	2024-08-03 11:57:50.019	2024-08-03 11:57:50.019
394	21	500	11.9	2024-08-03 11:57:50.019	2024-08-03 11:57:50.019
395	26	500	2.2	2024-08-03 11:57:50.019	2024-08-03 11:57:50.019
396	28	500	1.5	2024-08-03 11:57:50.019	2024-08-03 11:57:50.019
397	27	504	0.4	2024-08-03 11:57:50.019	2024-08-03 11:57:50.019
398	4	504	0.4	2024-08-03 11:57:50.019	2024-08-03 11:57:50.019
399	28	504	0.2	2024-08-03 11:57:50.019	2024-08-03 11:57:50.019
400	13	504	0.1	2024-08-03 11:57:50.019	2024-08-03 11:57:50.019
401	21	509	1	2024-08-03 11:57:50.021	2024-08-03 11:57:50.021
402	10	509	0.4	2024-08-03 11:57:50.021	2024-08-03 11:57:50.021
403	31	509	0.4	2024-08-03 11:57:50.022	2024-08-03 11:57:50.022
405	27	510	1.1	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
406	5	510	0.9	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
407	1	510	0.4	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
408	7	510	0.3	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
409	10	518	2.9	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
410	27	518	1.7	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
411	21	518	0.5	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
412	16	518	0.4	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
413	27	519	0.9	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
414	28	519	0.7	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
415	21	519	0.4	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
416	7	519	0.3	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
417	27	528	21.3	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
418	13	528	3.8	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
419	21	528	2.4	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
420	22	528	0.5	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
421	27	536	0.5	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
422	7	536	0.5	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
423	4	536	0.4	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
424	22	536	0.4	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
425	27	537	3.8	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
426	13	537	1.9	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
427	17	537	1.3	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
428	30	537	0.7	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
429	10	539	0.9	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
430	23	539	0.6	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
431	7	539	0.5	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
432	20	539	0.5	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
433	27	540	28	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
434	13	540	9.1	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
435	28	540	4.7	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
436	2	540	3.4	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
437	27	541	5.8	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
438	12	541	4.1	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
439	13	541	3.5	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
440	26	541	3.3	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
441	21	542	2.7	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
442	27	542	0.8	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
443	1	542	0.4	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
444	16	542	0.4	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
445	27	543	0.4	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
446	7	543	0.2	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
447	17	543	0.1	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
448	5	543	0.1	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
449	10	563	3.3	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
450	27	563	0.4	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
451	28	563	0.4	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
452	3	563	0.3	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
453	27	569	6.8	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
454	5	569	1.6	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
455	13	569	1.2	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
456	4	569	1	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
457	27	583	9.3	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
458	13	583	4.1	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
459	28	583	2.5	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
460	17	583	1.7	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
461	27	594	33.5	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
462	13	594	8.1	2024-08-03 11:57:50.024	2024-08-03 11:57:50.024
463	28	594	2.8	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
464	21	594	2.5	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
465	13	598	0.4	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
466	4	598	0.3	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
467	27	598	0.2	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
468	1	598	0.2	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
469	27	604	38.6	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
470	21	604	0.7	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
471	5	604	0.3	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
472	4	604	0.1	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
473	27	606	27.3	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
474	13	606	1.1	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
475	21	606	0.8	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
476	5	606	0.7	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
477	21	607	25.7	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
478	27	607	12.7	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
479	28	607	6.5	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
480	26	607	4.9	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
481	27	609	4.7	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
482	13	609	4.4	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
483	4	609	3.3	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
484	26	609	2.5	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
485	27	610	1.9	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
486	1	610	0.6	2024-08-03 11:57:50.026	2024-08-03 11:57:50.026
487	10	610	0.5	2024-08-03 11:57:50.027	2024-08-03 11:57:50.027
488	2	610	0.3	2024-08-03 11:57:50.028	2024-08-03 11:57:50.028
489	27	620	2.5	2024-08-03 11:57:50.028	2024-08-03 11:57:50.028
490	21	620	0.2	2024-08-03 11:57:50.028	2024-08-03 11:57:50.028
491	4	620	0.1	2024-08-03 11:57:50.028	2024-08-03 11:57:50.028
492	2	620	0.1	2024-08-03 11:57:50.028	2024-08-03 11:57:50.028
493	21	624	21.9	2024-08-03 11:57:50.028	2024-08-03 11:57:50.028
494	2	624	15.9	2024-08-03 11:57:50.028	2024-08-03 11:57:50.028
495	27	624	11.4	2024-08-03 11:57:50.028	2024-08-03 11:57:50.028
496	18	624	4.6	2024-08-03 11:57:50.028	2024-08-03 11:57:50.028
497	21	626	1.2	2024-08-03 11:57:50.028	2024-08-03 11:57:50.028
498	31	626	1.2	2024-08-03 11:57:50.028	2024-08-03 11:57:50.028
499	4	626	1	2024-08-03 11:57:50.028	2024-08-03 11:57:50.028
500	27	626	0.7	2024-08-03 11:57:50.029	2024-08-03 11:57:50.029
501	27	627	7.9	2024-08-03 11:57:50.033	2024-08-03 11:57:50.033
502	26	627	1.5	2024-08-03 11:57:50.033	2024-08-03 11:57:50.033
503	21	627	0.7	2024-08-03 11:57:50.033	2024-08-03 11:57:50.033
504	10	627	0.7	2024-08-03 11:57:50.034	2024-08-03 11:57:50.034
505	4	637	6.2	2024-08-03 11:57:50.036	2024-08-03 11:57:50.036
506	27	637	4.1	2024-08-03 11:57:50.037	2024-08-03 11:57:50.037
507	13	637	2	2024-08-03 11:57:50.04	2024-08-03 11:57:50.04
508	2	637	0.8	2024-08-03 11:57:50.041	2024-08-03 11:57:50.041
509	27	640	14.5	2024-08-03 11:57:50.041	2024-08-03 11:57:50.041
510	13	640	9.2	2024-08-03 11:57:50.041	2024-08-03 11:57:50.041
511	28	640	3.6	2024-08-03 11:57:50.041	2024-08-03 11:57:50.041
512	17	640	3.5	2024-08-03 11:57:50.041	2024-08-03 11:57:50.041
513	21	646	7.3	2024-08-03 11:57:50.041	2024-08-03 11:57:50.041
514	2	646	4.3	2024-08-03 11:57:50.041	2024-08-03 11:57:50.041
515	27	646	3.3	2024-08-03 11:57:50.041	2024-08-03 11:57:50.041
516	18	646	2.6	2024-08-03 11:57:50.041	2024-08-03 11:57:50.041
517	27	648	1.2	2024-08-03 11:57:50.041	2024-08-03 11:57:50.041
518	1	648	0.5	2024-08-03 11:57:50.041	2024-08-03 11:57:50.041
519	5	648	0.4	2024-08-03 11:57:50.041	2024-08-03 11:57:50.041
520	4	648	0.4	2024-08-03 11:57:50.042	2024-08-03 11:57:50.042
521	27	660	2.3	2024-08-03 11:57:50.043	2024-08-03 11:57:50.043
522	21	660	2.3	2024-08-03 11:57:50.044	2024-08-03 11:57:50.044
523	13	660	1.3	2024-08-03 11:57:50.045	2024-08-03 11:57:50.045
524	28	660	0.5	2024-08-03 11:57:50.048	2024-08-03 11:57:50.048
525	27	681	16.6	2024-08-03 11:57:50.049	2024-08-03 11:57:50.049
526	10	681	11.4	2024-08-03 11:57:50.049	2024-08-03 11:57:50.049
527	21	681	2.8	2024-08-03 11:57:50.049	2024-08-03 11:57:50.049
528	26	681	1.1	2024-08-03 11:57:50.049	2024-08-03 11:57:50.049
529	27	682	7.3	2024-08-03 11:57:50.05	2024-08-03 11:57:50.05
530	10	682	4.5	2024-08-03 11:57:50.05	2024-08-03 11:57:50.05
531	13	682	3	2024-08-03 11:57:50.05	2024-08-03 11:57:50.05
532	21	682	2.9	2024-08-03 11:57:50.05	2024-08-03 11:57:50.05
533	27	685	0.3	2024-08-03 11:57:50.05	2024-08-03 11:57:50.05
534	26	685	0.3	2024-08-03 11:57:50.05	2024-08-03 11:57:50.05
535	2	685	0.3	2024-08-03 11:57:50.05	2024-08-03 11:57:50.05
536	5	685	0.2	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
537	10	691	0.9	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
538	27	691	0.3	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
539	7	691	0.3	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
540	28	691	0.3	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
541	27	696	25	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
542	21	696	0.8	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
543	18	696	0.4	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
544	28	696	0.4	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
545	21	703	22.7	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
546	27	703	12.3	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
547	2	703	9.2	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
548	28	703	2.2	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
549	27	708	19.2	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
550	5	708	0.5	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
551	7	708	0.1	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
552	16	708	0.1	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
553	27	722	3.6	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
554	21	722	1.7	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
555	10	722	0.2	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
556	18	722	0.1	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
557	27	739	2	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
558	26	739	1.4	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
559	21	739	1.2	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
560	25	739	0.6	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
561	27	740	7.4	2024-08-03 11:57:50.052	2024-08-03 11:57:50.052
562	26	740	2.6	2024-08-03 11:57:50.053	2024-08-03 11:57:50.053
563	18	740	1.9	2024-08-03 11:57:50.053	2024-08-03 11:57:50.053
564	25	740	1	2024-08-03 11:57:50.053	2024-08-03 11:57:50.053
565	4	750	5.7	2024-08-03 11:57:50.053	2024-08-03 11:57:50.053
566	27	750	5.2	2024-08-03 11:57:50.053	2024-08-03 11:57:50.053
567	13	750	1.8	2024-08-03 11:57:50.053	2024-08-03 11:57:50.053
568	7	750	1.7	2024-08-03 11:57:50.053	2024-08-03 11:57:50.053
569	27	755	3.7	2024-08-03 11:57:50.053	2024-08-03 11:57:50.053
570	13	755	1.9	2024-08-03 11:57:50.053	2024-08-03 11:57:50.053
571	4	755	1.9	2024-08-03 11:57:50.054	2024-08-03 11:57:50.054
572	12	755	1	2024-08-03 11:57:50.054	2024-08-03 11:57:50.054
573	27	763	5.9	2024-08-03 11:57:50.054	2024-08-03 11:57:50.054
574	21	763	2	2024-08-03 11:57:50.054	2024-08-03 11:57:50.054
575	17	763	1	2024-08-03 11:57:50.054	2024-08-03 11:57:50.054
576	31	763	1	2024-08-03 11:57:50.054	2024-08-03 11:57:50.054
577	21	765	4.8	2024-08-03 11:57:50.054	2024-08-03 11:57:50.054
578	13	765	3	2024-08-03 11:57:50.054	2024-08-03 11:57:50.054
579	27	765	1.8	2024-08-03 11:57:50.054	2024-08-03 11:57:50.054
580	26	765	1.6	2024-08-03 11:57:50.054	2024-08-03 11:57:50.054
581	27	772	13.8	2024-08-03 11:57:50.054	2024-08-03 11:57:50.054
582	31	772	1.4	2024-08-03 11:57:50.054	2024-08-03 11:57:50.054
583	26	772	0.6	2024-08-03 11:57:50.054	2024-08-03 11:57:50.054
584	25	772	0.6	2024-08-03 11:57:50.055	2024-08-03 11:57:50.055
585	27	774	8.4	2024-08-03 11:57:50.057	2024-08-03 11:57:50.057
586	10	774	0.3	2024-08-03 11:57:50.059	2024-08-03 11:57:50.059
587	28	774	0.3	2024-08-03 11:57:50.06	2024-08-03 11:57:50.06
588	7	774	0.2	2024-08-03 11:57:50.06	2024-08-03 11:57:50.06
589	27	779	1.4	2024-08-03 11:57:50.06	2024-08-03 11:57:50.06
590	10	779	1.4	2024-08-03 11:57:50.062	2024-08-03 11:57:50.062
591	4	779	1.2	2024-08-03 11:57:50.064	2024-08-03 11:57:50.064
592	21	779	0.2	2024-08-03 11:57:50.068	2024-08-03 11:57:50.068
593	10	780	0.7	2024-08-03 11:57:50.07	2024-08-03 11:57:50.07
594	27	780	0.3	2024-08-03 11:57:50.071	2024-08-03 11:57:50.071
595	7	780	0.2	2024-08-03 11:57:50.072	2024-08-03 11:57:50.072
597	7	782	1.1	2024-08-03 11:57:50.072	2024-08-03 11:57:50.072
598	27	782	0.6	2024-08-03 11:57:50.072	2024-08-03 11:57:50.072
599	2	782	0.4	2024-08-03 11:57:50.072	2024-08-03 11:57:50.072
600	28	782	0.2	2024-08-03 11:57:50.072	2024-08-03 11:57:50.072
601	21	787	12.4	2024-08-03 11:57:50.072	2024-08-03 11:57:50.072
602	18	787	5.3	2024-08-03 11:57:50.074	2024-08-03 11:57:50.074
603	27	787	1.7	2024-08-03 11:57:50.075	2024-08-03 11:57:50.075
604	25	787	1.6	2024-08-03 11:57:50.075	2024-08-03 11:57:50.075
605	27	795	2.3	2024-08-03 11:57:50.075	2024-08-03 11:57:50.075
606	4	795	1.7	2024-08-03 11:57:50.075	2024-08-03 11:57:50.075
607	13	795	1.1	2024-08-03 11:57:50.075	2024-08-03 11:57:50.075
608	26	795	0.7	2024-08-03 11:57:50.075	2024-08-03 11:57:50.075
609	27	799	0.6	2024-08-03 11:57:50.075	2024-08-03 11:57:50.075
610	13	799	0.3	2024-08-03 11:57:50.075	2024-08-03 11:57:50.075
611	7	799	0.3	2024-08-03 11:57:50.075	2024-08-03 11:57:50.075
612	4	799	0.2	2024-08-03 11:57:50.075	2024-08-03 11:57:50.075
613	4	800	7.3	2024-08-03 11:57:50.075	2024-08-03 11:57:50.075
614	12	800	4.4	2024-08-03 11:57:50.075	2024-08-03 11:57:50.075
615	26	800	1.7	2024-08-03 11:57:50.075	2024-08-03 11:57:50.075
616	27	800	1.5	2024-08-03 11:57:50.075	2024-08-03 11:57:50.075
617	13	801	11.1	2024-08-03 11:57:50.075	2024-08-03 11:57:50.075
618	27	801	7.5	2024-08-03 11:57:50.075	2024-08-03 11:57:50.075
619	30	801	6.7	2024-08-03 11:57:50.075	2024-08-03 11:57:50.075
620	25	801	5.3	2024-08-03 11:57:50.075	2024-08-03 11:57:50.075
621	27	802	5.9	2024-08-03 11:57:50.077	2024-08-03 11:57:50.077
622	13	802	1.2	2024-08-03 11:57:50.083	2024-08-03 11:57:50.083
623	21	802	1.1	2024-08-03 11:57:50.084	2024-08-03 11:57:50.084
624	7	802	0.8	2024-08-03 11:57:50.085	2024-08-03 11:57:50.085
625	27	805	4.2	2024-08-03 11:57:50.085	2024-08-03 11:57:50.085
626	13	805	3	2024-08-03 11:57:50.085	2024-08-03 11:57:50.085
627	4	805	2.8	2024-08-03 11:57:50.085	2024-08-03 11:57:50.085
628	17	805	1.3	2024-08-03 11:57:50.085	2024-08-03 11:57:50.085
633	21	813	4	2024-08-03 11:57:50.085	2024-08-03 11:57:50.085
634	27	813	3.4	2024-08-03 11:57:50.085	2024-08-03 11:57:50.085
635	2	813	1.2	2024-08-03 11:57:50.087	2024-08-03 11:57:50.087
636	17	813	0.8	2024-08-03 11:57:50.087	2024-08-03 11:57:50.087
637	27	818	6.9	2024-08-03 11:57:50.087	2024-08-03 11:57:50.087
638	13	818	5.7	2024-08-03 11:57:50.087	2024-08-03 11:57:50.087
639	30	818	1.3	2024-08-03 11:57:50.087	2024-08-03 11:57:50.087
640	21	818	1.3	2024-08-03 11:57:50.087	2024-08-03 11:57:50.087
641	10	829	1.7	2024-08-03 11:57:50.087	2024-08-03 11:57:50.087
642	27	829	1.5	2024-08-03 11:57:50.087	2024-08-03 11:57:50.087
643	21	829	0.2	2024-08-03 11:57:50.087	2024-08-03 11:57:50.087
645	27	831	1	2024-08-03 11:57:50.087	2024-08-03 11:57:50.087
646	28	831	0.7	2024-08-03 11:57:50.087	2024-08-03 11:57:50.087
647	4	831	0.7	2024-08-03 11:57:50.087	2024-08-03 11:57:50.087
648	21	831	0.6	2024-08-03 11:57:50.087	2024-08-03 11:57:50.087
649	27	838	4.7	2024-08-03 11:57:50.087	2024-08-03 11:57:50.087
650	1	838	2.5	2024-08-03 11:57:50.087	2024-08-03 11:57:50.087
651	21	838	1.5	2024-08-03 11:57:50.087	2024-08-03 11:57:50.087
652	5	838	1.3	2024-08-03 11:57:50.088	2024-08-03 11:57:50.088
653	27	839	40.3	2024-08-03 11:57:50.088	2024-08-03 11:57:50.088
654	26	839	6.4	2024-08-03 11:57:50.088	2024-08-03 11:57:50.088
655	21	839	2.6	2024-08-03 11:57:50.088	2024-08-03 11:57:50.088
656	25	839	1.7	2024-08-03 11:57:50.088	2024-08-03 11:57:50.088
657	27	841	1.7	2024-08-03 11:57:50.088	2024-08-03 11:57:50.088
658	25	841	0.5	2024-08-03 11:57:50.088	2024-08-03 11:57:50.088
659	21	841	0.4	2024-08-03 11:57:50.088	2024-08-03 11:57:50.088
660	26	841	0.3	2024-08-03 11:57:50.088	2024-08-03 11:57:50.088
661	27	843	0.7	2024-08-03 11:57:50.09	2024-08-03 11:57:50.09
662	17	843	0.4	2024-08-03 11:57:50.09	2024-08-03 11:57:50.09
663	4	843	0.4	2024-08-03 11:57:50.09	2024-08-03 11:57:50.09
664	7	843	0.3	2024-08-03 11:57:50.09	2024-08-03 11:57:50.09
665	10	848	2	2024-08-03 11:57:50.09	2024-08-03 11:57:50.09
666	27	848	1.8	2024-08-03 11:57:50.09	2024-08-03 11:57:50.09
667	21	848	0.9	2024-08-03 11:57:50.09	2024-08-03 11:57:50.09
668	5	848	0.6	2024-08-03 11:57:50.091	2024-08-03 11:57:50.091
669	27	853	0.6	2024-08-03 11:57:50.092	2024-08-03 11:57:50.092
670	10	853	0.2	2024-08-03 11:57:50.092	2024-08-03 11:57:50.092
671	26	853	0.2	2024-08-03 11:57:50.092	2024-08-03 11:57:50.092
672	23	853	0.2	2024-08-03 11:57:50.092	2024-08-03 11:57:50.092
673	10	854	1	2024-08-03 11:57:50.092	2024-08-03 11:57:50.092
674	27	854	0.9	2024-08-03 11:57:50.092	2024-08-03 11:57:50.092
675	21	854	0.5	2024-08-03 11:57:50.092	2024-08-03 11:57:50.092
676	7	854	0.3	2024-08-03 11:57:50.093	2024-08-03 11:57:50.093
677	27	857	0.3	2024-08-03 11:57:50.094	2024-08-03 11:57:50.094
678	26	857	0.2	2024-08-03 11:57:50.094	2024-08-03 11:57:50.094
679	7	857	0.1	2024-08-03 11:57:50.094	2024-08-03 11:57:50.094
681	27	861	11	2024-08-03 11:57:50.094	2024-08-03 11:57:50.094
682	21	861	0.8	2024-08-03 11:57:50.094	2024-08-03 11:57:50.094
683	22	861	0.4	2024-08-03 11:57:50.095	2024-08-03 11:57:50.095
684	7	861	0.1	2024-08-03 11:57:50.097	2024-08-03 11:57:50.097
685	21	864	0.8	2024-08-03 11:57:50.097	2024-08-03 11:57:50.097
686	4	864	0.5	2024-08-03 11:57:50.097	2024-08-03 11:57:50.097
687	28	864	0.5	2024-08-03 11:57:50.097	2024-08-03 11:57:50.097
688	27	864	0.2	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
689	27	867	1.5	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
690	21	867	0.6	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
691	13	867	0.2	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
692	12	867	0.2	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
693	27	876	2.4	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
694	21	876	0.6	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
695	7	876	0.5	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
696	28	876	0.4	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
697	27	880	1.5	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
698	21	880	1.4	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
699	1	880	0.6	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
700	28	880	0.4	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
701	21	881	0.8	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
702	27	881	0.4	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
703	7	881	0.3	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
704	20	881	0.1	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
705	27	883	28.3	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
706	5	883	0.3	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
707	18	883	0.2	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
708	16	883	0.1	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
709	27	889	11.2	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
710	7	889	0.8	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
711	21	889	0.4	2024-08-03 11:57:50.098	2024-08-03 11:57:50.098
712	26	889	0.3	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
713	27	897	69	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
714	10	897	1.9	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
715	21	897	0.8	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
716	18	897	0.3	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
717	27	900	17	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
718	21	900	3.9	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
719	4	900	0.7	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
720	7	900	0.2	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
721	21	905	0.8	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
722	12	905	0.7	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
723	7	905	0.5	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
724	15	905	0.4	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
725	27	907	2.1	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
726	10	907	1.4	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
727	21	907	0.6	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
728	12	907	0.5	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
729	27	911	19.4	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
730	2	911	1.4	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
731	28	911	0.8	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
732	21	911	0.6	2024-08-03 11:57:50.099	2024-08-03 11:57:50.099
733	27	912	2.6	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
734	21	912	0.6	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
735	25	912	0.2	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
736	32	912	0.1	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
737	10	928	6.5	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
738	27	928	1.3	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
739	8	928	0.9	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
740	5	928	0.7	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
741	27	933	0.8	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
742	18	933	0.8	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
743	26	933	0.6	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
744	21	933	0.5	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
745	27	934	11	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
746	5	934	1.6	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
747	17	934	1	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
748	13	934	0.7	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
749	27	935	7.4	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
750	21	935	4.4	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
751	10	935	1	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
752	12	935	0.5	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
753	27	936	16	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
754	21	936	1	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
755	7	936	1	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
756	28	936	0.7	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
757	27	937	12.7	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
758	5	937	3.1	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
759	17	937	1	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
760	2	937	1	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
761	27	939	22	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
762	13	939	1.3	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
763	17	939	1.2	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
764	5	939	0.7	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
765	27	944	0.6	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
766	21	944	0.4	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
767	13	944	0.4	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
768	2	944	0.2	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
769	10	945	1.8	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
770	27	945	0.4	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
771	21	945	0.3	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
772	4	945	0.2	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
773	27	947	0.7	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
774	4	947	0.4	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
775	17	947	0.4	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
776	7	947	0.1	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
777	13	948	8.9	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
778	28	948	4.9	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
779	27	948	4.1	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
780	18	948	3.7	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
781	27	954	1	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
782	12	954	0.8	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
783	21	954	0.6	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
784	7	954	0.5	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
785	27	960	12.6	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
786	21	960	9.4	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
787	13	960	6.3	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
788	17	960	2.5	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
789	21	963	1.4	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
790	27	963	1.2	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
791	13	963	0.6	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
792	28	963	0.4	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
793	27	971	27.1	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
794	13	971	4.4	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
795	26	971	2.6	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
796	21	971	1.1	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
797	27	973	5.1	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
798	10	973	2.4	2024-08-03 11:57:50.101	2024-08-03 11:57:50.101
799	21	973	0.4	2024-08-03 11:57:50.102	2024-08-03 11:57:50.102
800	17	973	0.1	2024-08-03 11:57:50.102	2024-08-03 11:57:50.102
801	13	976	6.7	2024-08-03 11:57:50.102	2024-08-03 11:57:50.102
802	27	976	4.1	2024-08-03 11:57:50.102	2024-08-03 11:57:50.102
803	4	976	3.6	2024-08-03 11:57:50.103	2024-08-03 11:57:50.103
804	17	976	3.1	2024-08-03 11:57:50.103	2024-08-03 11:57:50.103
805	27	998	0.6	2024-08-03 11:57:50.103	2024-08-03 11:57:50.103
806	26	998	0.5	2024-08-03 11:57:50.103	2024-08-03 11:57:50.103
807	21	998	0.5	2024-08-03 11:57:50.103	2024-08-03 11:57:50.103
808	8	998	0.4	2024-08-03 11:57:50.103	2024-08-03 11:57:50.103
809	21	1008	11.1	2024-08-03 11:57:50.103	2024-08-03 11:57:50.103
810	27	1008	9.3	2024-08-03 11:57:50.103	2024-08-03 11:57:50.103
811	28	1008	7.2	2024-08-03 11:57:50.103	2024-08-03 11:57:50.103
812	13	1008	5.2	2024-08-03 11:57:50.103	2024-08-03 11:57:50.103
813	27	1014	1.3	2024-08-03 11:57:50.103	2024-08-03 11:57:50.103
814	5	1014	1	2024-08-03 11:57:50.103	2024-08-03 11:57:50.103
815	13	1014	0.9	2024-08-03 11:57:50.103	2024-08-03 11:57:50.103
816	17	1014	0.5	2024-08-03 11:57:50.103	2024-08-03 11:57:50.103
817	21	1015	22.4	2024-08-03 11:57:50.103	2024-08-03 11:57:50.103
818	10	1015	8.4	2024-08-03 11:57:50.103	2024-08-03 11:57:50.103
819	27	1015	7.8	2024-08-03 11:57:50.103	2024-08-03 11:57:50.103
820	28	1015	4.1	2024-08-03 11:57:50.103	2024-08-03 11:57:50.103
821	27	1018	10.9	2024-08-03 11:57:50.104	2024-08-03 11:57:50.104
822	2	1018	3.7	2024-08-03 11:57:50.104	2024-08-03 11:57:50.104
823	13	1018	1.4	2024-08-03 11:57:50.104	2024-08-03 11:57:50.104
824	18	1018	0.8	2024-08-03 11:57:50.104	2024-08-03 11:57:50.104
825	27	1020	27.8	2024-08-03 11:57:50.104	2024-08-03 11:57:50.104
826	4	1020	1.3	2024-08-03 11:57:50.104	2024-08-03 11:57:50.104
827	28	1020	1	2024-08-03 11:57:50.104	2024-08-03 11:57:50.104
828	13	1020	1	2024-08-03 11:57:50.104	2024-08-03 11:57:50.104
829	26	1026	4.3	2024-08-03 11:57:50.105	2024-08-03 11:57:50.105
830	12	1026	3.5	2024-08-03 11:57:50.105	2024-08-03 11:57:50.105
831	4	1026	2.3	2024-08-03 11:57:50.105	2024-08-03 11:57:50.105
832	13	1026	1.9	2024-08-03 11:57:50.105	2024-08-03 11:57:50.105
833	4	1027	5	2024-08-03 11:57:50.105	2024-08-03 11:57:50.105
834	27	1027	3.6	2024-08-03 11:57:50.105	2024-08-03 11:57:50.105
835	21	1027	2.4	2024-08-03 11:57:50.105	2024-08-03 11:57:50.105
836	8	1027	1.8	2024-08-03 11:57:50.105	2024-08-03 11:57:50.105
837	27	1028	49.6	2024-08-03 11:57:50.105	2024-08-03 11:57:50.105
838	21	1028	2.9	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
839	31	1028	1.2	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
840	28	1028	0.9	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
841	13	1031	8.2	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
842	2	1031	7.2	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
843	30	1031	4.8	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
844	4	1031	4.6	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
845	27	1032	8.4	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
846	2	1032	2.6	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
847	21	1032	1.7	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
848	13	1032	1.3	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
849	27	1034	13.8	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
850	2	1034	5.5	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
851	21	1034	4.3	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
852	18	1034	1.3	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
853	27	1035	6.2	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
854	7	1035	1	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
855	28	1035	0.9	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
856	13	1035	0.9	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
857	27	1057	0.2	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
858	23	1057	0.2	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
859	16	1057	0.2	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
860	11	1057	0.2	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
861	2	1070	16.7	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
862	27	1070	6.4	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
863	21	1070	2.6	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
864	13	1070	2	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
865	2	1071	6.4	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
866	27	1071	5	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
867	21	1071	3.9	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
868	13	1071	2.6	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
869	27	1073	14	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
870	21	1073	1	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
871	28	1073	0.8	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
872	13	1073	0.6	2024-08-03 11:57:50.106	2024-08-03 11:57:50.106
873	27	1074	1.3	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
874	7	1074	0.9	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
875	28	1074	0.5	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
876	17	1074	0.2	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
877	27	1079	16.4	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
878	13	1079	4.4	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
879	21	1079	3.1	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
880	26	1079	2.3	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
881	27	1084	5.4	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
882	21	1084	4	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
883	2	1084	2.6	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
884	8	1084	1.8	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
885	21	1085	21	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
886	2	1085	7.5	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
887	18	1085	4.8	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
888	27	1085	4.4	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
889	2	1086	3.4	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
890	21	1086	3.3	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
891	27	1086	2.1	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
892	18	1086	1.9	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
893	10	1087	0.6	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
894	8	1087	0.5	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
895	21	1087	0.3	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
896	15	1087	0.3	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
897	27	1091	1.8	2024-08-03 11:57:50.108	2024-08-03 11:57:50.108
898	10	1091	0.6	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
899	21	1091	0.2	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
900	28	1091	0.2	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
901	27	1093	0.8	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
902	1	1093	0.8	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
903	5	1093	0.3	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
904	13	1093	0.2	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
905	21	1094	6.6	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
906	27	1094	4	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
907	26	1094	2.4	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
908	8	1094	1.7	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
909	27	1105	0.3	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
910	28	1105	0.2	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
911	16	1105	0.2	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
912	7	1105	0.1	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
913	27	1108	1.9	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
914	13	1108	1.1	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
915	4	1108	1	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
916	17	1108	0.9	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
917	10	1109	1.8	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
918	4	1109	1.7	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
919	21	1109	1.6	2024-08-03 11:57:50.109	2024-08-03 11:57:50.109
920	27	1109	0.9	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
921	27	1110	0.9	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
922	4	1110	0.9	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
923	10	1110	0.4	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
924	21	1110	0.4	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
925	21	1113	13.8	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
926	10	1113	3.4	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
927	27	1113	0.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
928	11	1113	0.1	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
929	27	1127	5.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
930	13	1127	1.4	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
931	21	1127	1.1	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
932	4	1127	1	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
933	27	1129	24	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
934	1	1129	0.6	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
935	18	1129	0.6	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
936	4	1129	0.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
937	27	1138	0.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
938	1	1138	0.1	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
939	26	1138	0.1	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
940	7	1138	0.1	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
941	27	1139	12.9	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
942	4	1139	2.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
943	19	1139	1.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
944	18	1139	0.6	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
945	10	1141	5.5	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
946	27	1141	1.6	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
947	21	1141	0.6	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
949	10	1154	1.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
950	27	1154	1	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
951	8	1154	0.6	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
952	2	1154	0.5	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
953	27	1157	28.9	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
954	21	1157	12	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
955	13	1157	3.6	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
956	17	1157	2.7	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
957	27	1160	0.4	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
958	5	1160	0.3	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
959	28	1160	0.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
960	12	1160	0.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
961	27	1166	11.5	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
962	13	1166	1.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
963	1	1166	0.4	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
964	21	1166	0.3	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
965	27	1177	0.9	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
966	13	1177	0.9	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
967	21	1177	0.9	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
968	5	1177	0.6	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
969	27	1190	1.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
970	13	1190	1.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
971	26	1190	1.1	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
972	4	1190	1	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
973	27	1191	22.5	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
974	21	1191	22.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
975	26	1191	4.3	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
976	2	1191	2.7	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
977	27	1192	0.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
978	1	1192	0.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
979	13	1192	0.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
980	7	1192	0.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
981	27	1193	20.9	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
982	26	1193	2.8	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
983	25	1193	1.9	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
984	18	1193	1.3	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
985	27	1199	0.3	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
986	21	1199	0.3	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
987	2	1199	0.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
988	7	1199	0.2	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
989	27	1200	13.3	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
990	21	1200	1.3	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
991	8	1200	0.3	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
993	10	1201	4.3	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
994	21	1201	0.7	2024-08-03 11:57:50.11	2024-08-03 11:57:50.11
995	5	1201	0.5	2024-08-03 11:57:50.111	2024-08-03 11:57:50.111
996	9	1201	0.3	2024-08-03 11:57:50.111	2024-08-03 11:57:50.111
997	27	1203	5.4	2024-08-03 11:57:50.111	2024-08-03 11:57:50.111
998	10	1203	2.5	2024-08-03 11:57:50.112	2024-08-03 11:57:50.112
999	21	1203	0.3	2024-08-03 11:57:50.115	2024-08-03 11:57:50.115
1000	8	1203	0.1	2024-08-03 11:57:50.116	2024-08-03 11:57:50.116
1001	27	1204	7.8	2024-08-03 11:57:50.126	2024-08-03 11:57:50.126
1002	1	1204	2.2	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1003	5	1204	0.7	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1004	17	1204	0.5	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1005	27	1208	14.3	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1006	2	1208	1	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1007	1	1208	0.6	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1008	17	1208	0.6	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1009	4	1210	1.3	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1010	22	1210	1	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1011	7	1210	0.8	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1012	18	1210	0.7	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1013	27	1212	21.1	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1014	21	1212	4.2	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1015	13	1212	1.9	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1016	28	1212	1.8	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1017	27	1214	26.2	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1018	21	1214	3	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1019	28	1214	2.8	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1020	2	1214	1.9	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1021	27	1217	2.1	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1022	13	1217	1.2	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1023	21	1217	0.7	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1024	30	1217	0.6	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1025	21	1219	8.1	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1026	27	1219	4.6	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1027	13	1219	3.2	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1028	26	1219	1.4	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1029	27	1225	23.2	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1030	21	1225	3.2	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1031	13	1225	2.5	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1032	28	1225	2.3	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1033	27	1226	45.2	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1034	13	1226	2	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1035	26	1226	1.3	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1036	28	1226	0.7	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1037	27	1228	37.7	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1038	10	1228	3.6	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1039	23	1228	0.5	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1040	7	1228	0.3	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1041	21	1251	0.4	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1042	27	1251	0.1	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1043	5	1251	0.1	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1044	16	1251	0.1	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1045	27	1255	0.6	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1046	28	1255	0.4	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1047	7	1255	0.2	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1048	10	1255	0.1	2024-08-03 11:57:50.128	2024-08-03 11:57:50.128
1049	27	1257	1.4	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1050	21	1257	1	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1051	1	1257	0.8	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1052	13	1257	0.4	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1053	21	1259	2.6	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1054	27	1259	0.8	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1057	12	1260	4.3	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1058	27	1260	3.1	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1059	2	1260	2.6	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1060	13	1260	2	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1061	13	1264	10.9	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1062	27	1264	7.8	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1063	17	1264	4.5	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1064	21	1264	4.2	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1065	27	1266	25.4	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1066	21	1266	21.3	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1067	26	1266	8.4	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1068	10	1266	4.4	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1069	10	1270	10.3	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1070	27	1270	2.8	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1071	7	1270	1.5	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1072	11	1270	0.6	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1073	27	1289	1	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1074	30	1289	0.7	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1075	12	1289	0.6	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1076	28	1289	0.5	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1077	27	1294	1.3	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1078	31	1294	0.8	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1079	13	1294	0.6	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1080	18	1294	0.5	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1081	21	1300	2.9	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1082	27	1300	2.2	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1083	10	1300	1.8	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1084	5	1300	0.9	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1085	27	1303	7.9	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1086	13	1303	7.6	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1087	28	1303	4.6	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1088	26	1303	4	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1089	27	1314	6	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1090	10	1314	1.2	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1091	21	1314	1.1	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1092	4	1314	0.5	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1093	27	1316	13.8	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1094	13	1316	1.1	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1095	30	1316	1.1	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1096	7	1316	0.8	2024-08-03 11:57:50.129	2024-08-03 11:57:50.129
1097	27	1317	1.9	2024-08-03 11:57:50.131	2024-08-03 11:57:50.131
1098	1	1317	0.4	2024-08-03 11:57:50.132	2024-08-03 11:57:50.132
1099	28	1317	0.2	2024-08-03 11:57:50.135	2024-08-03 11:57:50.135
1100	6	1317	0.2	2024-08-03 11:57:50.135	2024-08-03 11:57:50.135
1101	27	1329	0.7	2024-08-03 11:57:50.137	2024-08-03 11:57:50.137
1102	21	1329	0.3	2024-08-03 11:57:50.138	2024-08-03 11:57:50.138
1103	31	1329	0.3	2024-08-03 11:57:50.14	2024-08-03 11:57:50.14
1105	27	1330	12.8	2024-08-03 11:57:50.143	2024-08-03 11:57:50.143
1106	7	1330	0.2	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1107	18	1330	0.1	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1109	27	1332	0.8	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1110	13	1332	0.5	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1111	5	1332	0.5	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1112	17	1332	0.4	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1113	27	1351	10.9	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1114	21	1351	2	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1115	1	1351	0.3	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1116	10	1351	0.2	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1117	27	1352	10	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1118	28	1352	1	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1119	17	1352	0.4	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1120	13	1352	0.4	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1121	10	1356	2.8	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1122	21	1356	1.3	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1125	27	1365	29.1	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1126	13	1365	6.8	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1127	21	1365	4.9	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1128	28	1365	3	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1129	10	1366	9.3	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1130	27	1366	4.7	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1131	21	1366	0.3	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1132	7	1366	0.3	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1133	27	1369	1	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1134	26	1369	0.5	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1135	7	1369	0.4	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1136	10	1369	0.4	2024-08-03 11:57:50.145	2024-08-03 11:57:50.145
1137	27	1372	62.7	2024-08-03 11:57:50.147	2024-08-03 11:57:50.147
1138	21	1372	3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1139	30	1372	2.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1140	13	1372	1.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1141	4	1378	0.8	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1142	12	1378	0.5	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1143	27	1378	0.4	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1144	2	1378	0.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1145	27	1380	0.8	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1146	7	1380	0.7	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1147	21	1380	0.5	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1148	4	1380	0.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1149	10	1389	2.9	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1150	21	1389	0.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1151	27	1389	0.4	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1152	8	1389	0.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1153	2	1406	4.9	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1154	27	1406	4.7	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1155	21	1406	1.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1156	13	1406	1.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1157	27	1424	0.4	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1158	12	1424	0.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1159	17	1424	0.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1160	8	1424	0.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1161	27	1432	1.5	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1162	1	1432	0.9	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1163	21	1432	0.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1164	18	1432	0.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1165	4	1433	6.8	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1166	27	1433	5.9	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1167	13	1433	2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1168	17	1433	1.4	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1169	27	1440	1.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1170	21	1440	0.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1171	18	1440	0.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1172	16	1440	0.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1173	27	1449	9.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1174	26	1449	5.8	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1175	4	1449	4.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1176	13	1449	3.5	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1177	27	1455	18	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1178	13	1455	2.4	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1179	21	1455	1.1	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1180	18	1455	1	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1181	27	1473	16.7	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1182	13	1473	1.1	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1183	17	1473	0.9	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1184	7	1473	0.7	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1185	27	1477	0.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1186	17	1477	0.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1187	28	1477	0.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1188	18	1477	0.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1189	27	1478	1.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1190	21	1478	0.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1193	10	1480	1.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1194	21	1480	1.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1195	7	1480	0.9	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1196	27	1480	0.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1197	27	1484	15.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1198	13	1484	4	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1199	4	1484	2.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1200	21	1484	1.8	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1201	27	1485	44.7	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1202	28	1485	2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1203	13	1485	1.1	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1204	5	1485	0.8	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1205	27	1496	41.7	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1206	13	1496	3.5	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1207	28	1496	1.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1208	4	1496	0.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1209	27	1498	2.9	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1210	13	1498	1.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1211	26	1498	0.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1212	7	1498	0.4	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1213	10	1499	1.8	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1214	21	1499	0.8	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1215	27	1499	0.4	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1216	5	1499	0.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1217	27	1506	13	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1218	28	1506	1.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1219	21	1506	1.5	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1220	26	1506	1.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1221	27	1507	1.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1222	8	1507	0.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1223	18	1507	0.4	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1224	26	1507	0.4	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1225	27	1511	9.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1226	13	1511	4	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1227	2	1511	3.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1228	4	1511	2.8	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1229	27	1513	4.5	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1230	2	1513	1.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1231	17	1513	1.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1232	13	1513	1.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1233	27	1515	29.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1234	13	1515	7	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1235	26	1515	6.9	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1236	21	1515	3.7	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1237	27	1527	14	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1238	21	1527	5.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1239	13	1527	1.4	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1240	17	1527	0.9	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1241	13	1528	6.5	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1242	26	1528	3.8	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1243	17	1528	3.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1244	25	1528	3.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1245	4	1529	4.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1246	27	1529	3.5	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1247	26	1529	2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1248	13	1529	1.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1249	27	1530	0.8	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1250	28	1530	0.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1251	17	1530	0.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1252	23	1530	0.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1253	27	1535	1.9	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1254	18	1535	1.1	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1255	26	1535	0.9	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1256	13	1535	0.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1257	5	1537	1.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1258	27	1537	0.8	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1259	7	1537	0.8	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1260	4	1537	0.5	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1261	27	1539	2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1262	8	1539	1	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1263	21	1539	0.4	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1264	19	1539	0.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1265	27	1542	4.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1266	10	1542	2.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1267	26	1542	1.5	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1268	28	1542	1.1	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1269	27	1543	19.8	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1270	21	1543	12	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1271	13	1543	2.1	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1272	10	1543	1.9	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1273	21	1544	1.1	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1274	27	1544	0.7	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1275	18	1544	0.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1276	7	1544	0.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1277	27	1548	11.9	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1278	13	1548	5.4	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1279	28	1548	2.4	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1280	21	1548	1.7	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1281	27	1550	17.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1282	28	1550	1.2	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1283	21	1550	0.6	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1284	17	1550	0.5	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1285	2	1553	12.1	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1286	27	1553	11.3	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1287	21	1553	7	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1288	8	1553	1.5	2024-08-03 11:57:50.149	2024-08-03 11:57:50.149
1289	27	1560	7.4	2024-08-03 11:57:50.15	2024-08-03 11:57:50.15
1290	10	1560	2.1	2024-08-03 11:57:50.15	2024-08-03 11:57:50.15
1291	8	1560	1.1	2024-08-03 11:57:50.15	2024-08-03 11:57:50.15
1292	18	1560	0.8	2024-08-03 11:57:50.15	2024-08-03 11:57:50.15
1293	27	1562	28.5	2024-08-03 11:57:50.15	2024-08-03 11:57:50.15
1294	28	1562	1.2	2024-08-03 11:57:50.15	2024-08-03 11:57:50.15
1295	13	1562	0.6	2024-08-03 11:57:50.15	2024-08-03 11:57:50.15
1296	31	1562	0.5	2024-08-03 11:57:50.15	2024-08-03 11:57:50.15
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: young
--

COPY public.languages (id, name, created_at, updated_at) FROM stdin;
1	African languages	2024-08-02 13:47:23.151	2024-08-02 13:47:23.151
2	Arabic	2024-08-02 13:47:23.153	2024-08-02 13:47:23.153
3	Armenian	2024-08-02 13:47:23.154	2024-08-02 13:47:23.154
4	Chinese	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
5	French	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
6	French Creole	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
7	German/Yiddish	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
8	Greek	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
9	Hungarian	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
10	Italian	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
11	Japanese	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
12	Korean	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
13	Langs. of India	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
14	Laotian	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
15	Mon-Khmer (Cambodian)	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
16	Native American languages	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
17	Other Asian languages	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
18	Other Indo-European	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
19	Pacific Island languages	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
20	Persian	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
21	Polish	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
22	Portuguese	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
23	Russian	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
24	Scandinavian languages	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
25	Serbo-Croatian	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
26	Slavic languages	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
27	Spanish	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
28	Tagalog	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
29	Thai	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
30	Urdu	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
31	Vietnamese	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
32	West Germanic languages	2024-08-02 13:47:23.155	2024-08-02 13:47:23.155
\.


--
-- Data for Name: metras; Type: TABLE DATA; Schema: public; Owner: young
--

COPY public.metras (id, station, lines, city_id, created_at, updated_at) FROM stdin;
1	119th Street 	RI	131	2024-08-02 13:17:53.88	2024-08-02 13:17:53.88
2	123rd Street	RI	131	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
3	147th Street (Sibley Boulevard)	ME	606	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
4	211th Street (Lincoln Highway) 	ME	1093	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
5	Antioch	NCS	38	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
6	Arlington Heights 	UP-NW	47	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
7	Arlington Park 	UP-NW	47	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
8	Ashland/Calumet Park	ME	200	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
9	Aurora 	BNSF	66	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
10	Barrington 	UP-NW	76	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
11	Bartlett 	MD-W	81	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
12	Bellwood 	UP-W	105	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
13	Belmont 	BNSF	379	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
14	Belmont Avenue 	NCS	500	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
15	Bensenville 	MD-W	109	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
16	Berkeley 	UP-W	113	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
17	Berwyn 	BNSF	116	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
18	Big Timber Road	MD-W	423	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
19	Blue Island	ME	131	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
20	Blue Island–Vermont Street 	RI	131	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
21	Braeside 	UP-N	627	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
22	Brookfield 	BNSF	160	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
23	Buffalo Grove 	NCS	174	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
24	Burr Oak	ME	200	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
25	Calumet 	ME	401	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
26	Cary 	UP-NW	230	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
27	Chicago Ridge 	SWS	263	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
28	Cicero 	BNSF	267	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
29	Clarendon Hills 	BNSF	273	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
30	College Avenue 	UP-W	1513	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
31	Congress Park	BNSF	160	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
32	Crystal Lake 	UP-NW	322	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
33	Cumberland 	UP-NW	360	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
34	Dee Road 	UP-NW	1094	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
35	Deerfield 	MD-N	355	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
36	Des Plaines 	UP-NW	360	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
37	Downers Grove Main Street 	BNSF	379	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
38	Elburn	UP-W	418	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
39	Elgin 	MD-W	423	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
40	Elmhurst 	UP-W	434	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
41	Elmwood Park 	MD-W	436	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
42	Evanston Central Street 	UP-N	451	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
43	Evanston Davis Street 	UP-N	451	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
44	Evanston Main Street 	UP-N	451	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
45	Fairview Avenue 	BNSF	379	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
46	Flossmoor 	ME	482	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
47	Fort Sheridan 	UP-N	628	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
48	Fox Lake	MD-N	493	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
49	Fox River Grove 	UP-NW	495	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
50	Franklin Park 	MD-W	500	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
51	Geneva 	UP-W	519	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
52	Glen Ellyn 	UP-W	537	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
53	Glencoe 	UP-N	539	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
54	Glenview 	MD-N	541	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
55	Golf 	MD-N	549	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
56	Grayslake 	MD-N	569	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
57	Great Lakes 	UP-N	1020	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
58	Hanover Park 	MD-W	594	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
59	Harlem Avenue 	BNSF	116	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
60	Harvard	UP-NW	604	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
61	Harvey 	ME	606	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
62	Hazel Crest 	ME	610	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
63	Hickory Creek 	RI	933	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
64	Highland Park 	UP-N	627	2024-08-02 13:17:53.883	2024-08-02 13:17:53.883
65	Highlands 	BNSF	637	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
66	Highwood 	UP-N	628	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
67	Hinsdale 	BNSF	637	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
68	Hollywood 	BNSF	160	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
69	Homewood 	ME	648	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
70	Hubbard Woods	UP-N	1537	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
71	Indian Hill	UP-N	1537	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
72	Ingleside 	MD-N	672	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
73	Itasca 	MD-W	682	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
74	Ivanhoe 	ME	1192	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
75	Joliet	RI HC	696	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
76	Kenilworth 	UP-N	719	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
77	La Grange Road 	BNSF	739	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
78	La Vergne 	BNSF	116	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
79	Lake Bluff 	UP-N	750	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
80	Lake Cook Road 	MD-N	355	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
81	Lake Forest 	MD-N	755	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
82	Lake Forest 	UP-N	755	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
83	Lake Villa 	NCS	763	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
84	Laraway Road 	SWS	998	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
85	Lemont 	HC	787	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
86	Libertyville 	MD-N	795	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
87	Lisle 	BNSF	805	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
88	Lockport 	HC	813	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
89	Lombard 	UP-W	818	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
90	Long Lake 	MD-N	822	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
91	Manhattan	SWS	853	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
92	Mannheim	MD-W	500	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
93	Matteson	ME	880	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
94	Maywood 	UP-W	883	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
95	McHenry	UP-NW	889	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
96	Medinah 	MD-W	895	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
97	Melrose Park 	UP-W	897	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
98	Midlothian 	RI	911	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
99	Mokena 	RI	933	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
100	Morton Grove 	MD-N	948	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
101	Mount Prospect 	UP-NW	960	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
102	Mundelein 	NCS	971	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
103	Naperville 	BNSF	976	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
104	National Street 	MD-W	423	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
105	New Lenox 	RI	998	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
106	North Chicago 	UP-N	1020	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
107	North Glenview 	MD-N	541	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
108	Northbrook 	MD-N	1026	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
109	Oak Forest 	RI	1032	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
110	Oak Lawn 	SWS	1034	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
111	Oak Park 	UP-W	1035	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
112	Olympia Fields	ME	1058	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
113	Orland Park 143rd Street 	SWS	1071	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
114	Orland Park 153rd Street 	SWS	1071	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
115	Orland Park 179th Street 	SWS	1071	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
116	Palatine 	UP-NW	1079	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
117	Palos Heights 	SWS	1084	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
118	Palos Park 	SWS	1086	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
119	Park Ridge 	UP-NW	1094	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
120	Pingree Road 	UP-NW	322	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
121	Prairie Crossing 	MD-N	795	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
122	Prairie Crossing 	NCS	795	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
123	Prairie Street	RI	131	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
124	Prospect Heights 	NCS	1157	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
125	Ravinia 	UP-N	627	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
126	Ravinia Park  (Seasonal)	UP-N	627	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
127	Richton Park 	ME	1177	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
128	River Forest	UP-W	1190	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
129	River Grove 	MD-W NCS	1191	2024-08-02 13:17:53.885	2024-08-02 13:17:53.885
130	Riverdale	ME	1192	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
131	Riverside 	BNSF	1193	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
132	Robbins 	RI	1197	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
133	Romeoville 	HC	1214	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
134	Roselle 	MD-W	1219	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
135	Rosemont 	NCS	1220	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
136	Round Lake 	MD-N	1225	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
137	Round Lake Beach 	NCS	1226	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
138	Route 59 	BNSF	66	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
139	Schaumburg 	MD-W	1264	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
140	Schiller Park 	NCS	1266	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
141	Stone Avenue 	BNSF	739	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
142	Summit 	HC	1372	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
143	Tinley Park 	RI	1406	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
144	Tinley Park – 80th Avenue 	RI	1406	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
145	University Park	ME	1432	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
146	Vernon Hills 	NCS	1449	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
147	Villa Park 	UP-W	1455	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
148	Washington Street 	NCS	569	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
149	Waukegan 	UP-N	1485	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
150	West Chicago 	UP-W	1496	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
151	West Hinsdale 	BNSF	637	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
152	Western Springs 	BNSF	1507	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
153	Westmont 	BNSF	1511	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
154	Wheaton 	UP-W	1513	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
155	Wheeling 	NCS	1515	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
156	Willow Springs 	HC	1527	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
157	Wilmette 	UP-N	1529	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
158	Winfield 	UP-W	1535	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
159	Winnetka 	UP-N	1537	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
160	Winthrop Harbor 	UP-N	1539	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
161	Wood Dale 	MD-W	1543	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
162	Woodstock 	UP-NW	1550	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
163	Worth 	SWS	1553	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
164	Zion 	UP-N	1562	2024-08-02 13:17:53.886	2024-08-02 13:17:53.886
\.


--
-- Data for Name: prices; Type: TABLE DATA; Schema: public; Owner: young
--

COPY public.prices (id, median_home_value, rental_value, city_id, created_at, updated_at) FROM stdin;
1	378069	2078	5	2024-08-03 12:00:28.062	2024-08-03 12:00:28.062
2	387080	3134	14	2024-08-03 12:00:28.064	2024-08-03 12:00:28.064
3	256438	1795	22	2024-08-03 12:00:28.066	2024-08-03 12:00:28.066
4	122345	1441	25	2024-08-03 12:00:28.067	2024-08-03 12:00:28.067
5	356621	1791	38	2024-08-03 12:00:28.068	2024-08-03 12:00:28.068
6	499804	2648	47	2024-08-03 12:00:28.072	2024-08-03 12:00:28.072
7	297295	2337	66	2024-08-03 12:00:28.073	2024-08-03 12:00:28.073
8	699497	3588	76	2024-08-03 12:00:28.075	2024-08-03 12:00:28.075
9	411515	3547	81	2024-08-03 12:00:28.078	2024-08-03 12:00:28.078
10	166860	1244	82	2024-08-03 12:00:28.079	2024-08-03 12:00:28.079
11	430513	1982	84	2024-08-03 12:00:28.081	2024-08-03 12:00:28.081
12	282482	2050	89	2024-08-03 12:00:28.084	2024-08-03 12:00:28.084
13	106926	997	90	2024-08-03 12:00:28.085	2024-08-03 12:00:28.085
14	152951	1358	101	2024-08-03 12:00:28.085	2024-08-03 12:00:28.085
15	254818	1915	105	2024-08-03 12:00:28.085	2024-08-03 12:00:28.085
16	184489	1518	106	2024-08-03 12:00:28.085	2024-08-03 12:00:28.085
17	360279	2349	109	2024-08-03 12:00:28.085	2024-08-03 12:00:28.085
18	93902	1102	112	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
19	350598	1893	116	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
20	190830	1305	117	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
21	444827	2355	129	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
22	254037	1674	130	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
23	205654	1699	131	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
24	364167	3144	136	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
25	355613	1687	144	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
26	207151	1722	148	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
27	247858	1885	149	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
28	242888	1234	150	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
29	279731	1766	152	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
30	172710	1322	153	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
31	307308	1829	157	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
32	370769	2000	160	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
33	533557	3098	174	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
34	331076	2048	180	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
35	630265	3059	186	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
36	45861	1353	196	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
37	166079	1937	199	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
38	211825	1872	200	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
39	573572	3906	210	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
40	142977	1193	213	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
41	176551	1330	218	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
42	192720	1532	221	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
43	142614	1124	223	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
44	399157	2961	224	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
45	306742	2586	225	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
46	184250	1407	228	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
47	354478	2670	230	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
48	115190	1066	240	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
49	231989	1513	244	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
50	329451	2976	247	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
51	198176	1147	250	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
52	276270	1748	251	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
53	151940	1009	258	2024-08-03 12:00:28.086	2024-08-03 12:00:28.086
54	366294	2081	261	2024-08-03 12:00:28.087	2024-08-03 12:00:28.087
55	217283	2089	262	2024-08-03 12:00:28.087	2024-08-03 12:00:28.087
56	282558	1930	263	2024-08-03 12:00:28.087	2024-08-03 12:00:28.087
57	169144	1324	264	2024-08-03 12:00:28.087	2024-08-03 12:00:28.087
58	268755	1859	267	2024-08-03 12:00:28.087	2024-08-03 12:00:28.087
59	133606	1165	279	2024-08-03 12:00:28.087	2024-08-03 12:00:28.087
60	301156	1762	280	2024-08-03 12:00:28.087	2024-08-03 12:00:28.087
61	200159	1486	290	2024-08-03 12:00:28.087	2024-08-03 12:00:28.087
62	431658	1554	294	2024-08-03 12:00:28.087	2024-08-03 12:00:28.087
63	252819	2923	307	2024-08-03 12:00:28.087	2024-08-03 12:00:28.087
64	344180	2252	315	2024-08-03 12:00:28.087	2024-08-03 12:00:28.087
65	277597	1817	317	2024-08-03 12:00:28.087	2024-08-03 12:00:28.087
66	246700	2264	318	2024-08-03 12:00:28.087	2024-08-03 12:00:28.087
67	372857	2508	322	2024-08-03 12:00:28.087	2024-08-03 12:00:28.087
68	86942	1331	341	2024-08-03 12:00:28.087	2024-08-03 12:00:28.087
69	501782	2762	342	2024-08-03 12:00:28.087	2024-08-03 12:00:28.087
70	131778	1220	351	2024-08-03 12:00:28.087	2024-08-03 12:00:28.087
71	788036	3136	355	2024-08-03 12:00:28.089	2024-08-03 12:00:28.089
72	291082	1764	356	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
73	375155	2078	360	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
74	198717	1201	369	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
75	156576	2407	370	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
76	549573	2863	379	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
77	109108	940	382	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
78	112763	1393	387	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
79	124225	1198	393	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
80	183475	1131	403	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
81	207996	1241	404	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
82	326026	1791	414	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
83	218922	1161	415	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
84	435685	2201	418	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
85	93245	543	420	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
86	311323	2101	423	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
87	393478	2717	426	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
88	730925	3380	434	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
89	355736	2121	436	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
90	346705	1993	440	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
91	535188	2623	451	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
92	317375	2491	453	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
93	115790	1045	457	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
94	247616	1696	462	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
95	322376	2682	482	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
96	323621	2068	487	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
97	304213	1799	493	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
98	523085	3045	496	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
99	317209	1766	500	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
100	125775	1022	504	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
101	268366	1397	509	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
102	98606	949	510	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
103	218477	1186	518	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
104	518447	2621	519	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
105	420189	3186	528	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
106	364826	1628	536	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
107	741227	2094	537	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
108	1436196	2746	539	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
109	334031	2754	540	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
110	725773	3182	541	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
111	188540	2835	542	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
112	233275	1751	543	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
113	112028	1269	563	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
114	395352	2498	569	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
115	412882	2601	583	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
116	341517	2830	594	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
117	130583	956	598	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
118	230865	1905	604	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
119	153243	1860	606	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
120	405776	1928	607	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
121	641338	3769	609	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
122	224993	2290	610	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
123	129798	1409	620	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
124	358173	1810	624	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
125	209063	1023	626	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
126	756829	3177	627	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
127	1026356	3069	637	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
128	422233	2840	640	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
129	472537	2450	646	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
130	292257	2261	648	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
131	431006	3061	660	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
132	333758	2834	681	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
133	512714	3451	682	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
134	141147	1031	685	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
135	214710	1071	691	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
136	291218	2443	696	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
137	262023	1875	703	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
138	159025	1488	708	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
139	93570	1015	722	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
140	821912	2825	739	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
141	441609	2402	740	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
142	677858	3069	750	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
143	1177393	3548	755	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
144	348650	3407	763	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
145	589584	3694	765	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
146	223691	2178	772	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
147	139128	1301	774	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
148	126015	1062	779	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
149	211000	1238	780	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
150	233228	1944	782	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
151	570468	1877	787	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
152	618452	3047	795	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
153	130518	1040	799	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
154	856345	4741	800	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
155	491609	5539	801	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
156	309588	3134	802	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
157	515386	2350	805	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
158	139435	987	806	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
159	351658	2563	813	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
160	396520	2669	818	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
161	152149	958	829	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
162	200613	1557	831	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
163	291833	1945	838	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
164	273396	2297	839	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
165	187551	1613	841	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
166	143792	995	843	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
167	376286	1739	848	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
168	477636	1571	853	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
169	135778	1140	854	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
170	325526	1669	857	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
171	340253	1621	861	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
172	174522	1391	864	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
173	138954	2545	867	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
174	301188	1861	876	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
175	375717	3169	880	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
176	121153	1063	881	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
177	246557	1864	883	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
178	370121	2432	889	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
179	303748	1991	897	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
180	241681	1062	900	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
181	283307	1400	905	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
182	123250	1052	907	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
183	244672	2020	911	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
184	151282	1223	912	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
185	351121	2138	928	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
186	450135	2770	933	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
187	183333	1250	934	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
188	255348	1307	935	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
189	293921	2173	936	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
190	97950	1056	937	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
191	378162	4217	939	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
192	308606	1869	944	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
193	147063	1161	945	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
194	319966	1307	947	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
195	445847	3393	948	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
196	118840	1430	954	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
197	460985	2402	960	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
198	153772	1230	963	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
199	365480	2707	971	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
200	109756	1346	973	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
201	648866	3353	976	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
202	451621	2355	998	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
203	458206	2099	1008	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
204	273240	1531	1014	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
205	428502	1947	1015	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
206	424302	2247	1018	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
207	213748	2280	1020	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
208	774045	3633	1026	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
209	1154073	3838	1027	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
210	295948	1800	1028	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
211	977091	2774	1031	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
212	291211	2144	1032	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
213	327464	2114	1034	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
214	540638	2163	1035	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
215	138896	1065	1057	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
216	287323	4078	1070	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
217	441708	2663	1071	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
218	369700	2895	1073	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
219	189983	1344	1074	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
220	427620	2417	1079	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
221	402503	2350	1084	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
222	329777	2674	1085	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
223	476004	2832	1086	2024-08-03 12:00:28.09	2024-08-03 12:00:28.09
224	128020	940	1087	2024-08-03 12:00:28.091	2024-08-03 12:00:28.091
225	126311	1062	1091	2024-08-03 12:00:28.091	2024-08-03 12:00:28.091
226	127549	1965	1093	2024-08-03 12:00:28.091	2024-08-03 12:00:28.091
227	642731	2845	1094	2024-08-03 12:00:28.091	2024-08-03 12:00:28.091
228	164018	1076	1105	2024-08-03 12:00:28.091	2024-08-03 12:00:28.091
229	195280	1289	1108	2024-08-03 12:00:28.091	2024-08-03 12:00:28.091
230	194748	1190	1109	2024-08-03 12:00:28.091	2024-08-03 12:00:28.091
231	362087	1641	1110	2024-08-03 12:00:28.091	2024-08-03 12:00:28.091
232	208455	1270	1113	2024-08-03 12:00:28.091	2024-08-03 12:00:28.091
233	507056	3255	1127	2024-08-03 12:00:28.091	2024-08-03 12:00:28.091
234	326692	2440	1129	2024-08-03 12:00:28.091	2024-08-03 12:00:28.091
235	133749	1195	1138	2024-08-03 12:00:28.091	2024-08-03 12:00:28.091
236	194752	1514	1139	2024-08-03 12:00:28.091	2024-08-03 12:00:28.091
237	383934	2440	1141	2024-08-03 12:00:28.091	2024-08-03 12:00:28.091
238	162960	1149	1154	2024-08-03 12:00:28.091	2024-08-03 12:00:28.091
239	310612	2211	1157	2024-08-03 12:00:28.091	2024-08-03 12:00:28.091
240	195216	1137	1160	2024-08-03 12:00:28.091	2024-08-03 12:00:28.091
241	124304	1152	1166	2024-08-03 12:00:28.091	2024-08-03 12:00:28.091
242	189011	2071	1177	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
243	893995	1991	1190	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
244	286237	2121	1191	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
245	153316	2073	1192	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
246	630451	2179	1193	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
247	113310	1129	1199	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
248	224241	1208	1200	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
249	334943	2011	1201	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
250	100226	1044	1203	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
251	136914	1155	1204	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
252	145615	1443	1208	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
253	286148	1695	1210	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
254	339031	2749	1212	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
255	321282	3040	1214	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
256	294389	2078	1217	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
257	429919	2397	1219	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
258	334417	2325	1225	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
259	244249	2611	1226	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
260	220037	2163	1228	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
261	157572	1129	1251	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
262	310059	2212	1255	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
263	133402	2628	1257	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
264	77612	1102	1259	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
265	327445	1472	1260	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
266	378545	2840	1264	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
267	307389	1978	1266	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
268	305252	1884	1289	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
269	375070	3163	1294	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
270	131123	1306	1300	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
271	463612	2671	1303	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
272	224387	1363	1314	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
273	386518	2362	1316	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
274	221927	3355	1317	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
275	427223	2222	1329	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
276	178792	1418	1330	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
277	161180	1403	1332	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
278	178779	1531	1351	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
279	116643	1009	1352	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
280	259456	1437	1356	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
281	321599	2882	1365	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
282	131085	1038	1366	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
283	535888	1017	1369	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
284	309031	1787	1372	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
285	289861	1730	1378	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
286	339340	1895	1380	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
287	129300	884	1389	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
288	342430	2528	1406	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
289	305196	1332	1424	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
290	188155	2071	1432	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
291	216299	1261	1433	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
292	105950	1053	1440	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
293	587165	3021	1449	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
294	385028	2080	1455	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
295	378471	2707	1473	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
296	333577	1503	1477	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
297	63452	1349	1478	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
298	309545	1240	1480	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
299	387276	2251	1484	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
300	227710	1887	1485	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
301	353665	2168	1496	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
302	410039	2834	1498	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
303	83779	1129	1499	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
304	329013	2670	1506	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
305	838169	3114	1507	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
306	478465	2367	1511	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
307	551208	2819	1513	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
308	338297	2558	1515	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
309	604628	2868	1527	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
310	447990	2709	1528	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
311	1012121	3393	1529	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
312	269390	1399	1530	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
313	463748	2247	1535	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
314	1511784	2656	1537	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
315	264850	1825	1539	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
316	352036	2189	1542	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
317	377914	2692	1543	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
318	129203	1397	1544	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
319	404454	2337	1548	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
320	293555	1927	1550	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
321	270420	1850	1553	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
322	441830	2973	1560	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
323	225726	2089	1562	2024-08-03 12:00:28.092	2024-08-03 12:00:28.092
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: young
--

COPY public.reviews (id, user_id, city_id, pros, cons, ratings, zipcode, created_at, updated_at, recommend_family_type) FROM stdin;
10	7	495	test	test	3	111	2024-08-05 04:04:32.288326	2024-08-05 04:04:32.288326	{}
11	9	5	test	test	3	1111	2024-08-05 04:31:18.527787	2024-08-05 04:31:18.527787	{}
12	9	5	test	test	3	11	2024-08-05 04:33:08.209635	2024-08-05 04:33:08.209635	{}
13	9	5	2	2	3	2	2024-08-05 04:33:44.173426	2024-08-05 04:33:44.173426	{}
14	9	5	test	test	3	11	2024-08-05 04:41:41.922734	2024-08-05 04:41:41.922734	{}
15	9	5	test	test	4	111	2024-08-05 04:44:20.343196	2024-08-05 04:44:20.343196	{}
17	7	261	test	test	4	1111	2024-08-08 17:50:45.784845	2024-08-08 17:50:45.784845	{}
20	7	1191	test	test	3	11111	2024-08-08 22:15:11.418509	2024-08-08 22:15:11.418509	{single,pet,retired}
24	7	637	test	test	4	1111	2024-08-12 14:55:58.10627	2024-08-12 14:55:58.10627	{single,pet,retired}
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: young
--

COPY public.schema_migrations (version) FROM stdin;
20240723145148
20240723164641
20240723165121
20240723165312
20240723165738
20240723165912
20240723193130
20240723194010
20240724220512
20240801204313
20240801212444
20240802170508
20240802171340
20240802171811
20240802171851
20240802172600
20240802172705
20240802174012
20240802174037
20240803171112
20240803171643
20240805022828
20240805033725
20240805033756
20240805033814
20240805042510
20240805202814
20240808175210
20240809032943
20240811071044
20240811151309
20240815174300
20240815175718
20240818012927
\.


--
-- Data for Name: school_grades; Type: TABLE DATA; Schema: public; Owner: young
--

COPY public.school_grades (id, city_id, score_compared_to_us, score_compared_to_il, created_at, updated_at) FROM stdin;
1	5	4	2	2024-07-23 14:34:44.275	2024-07-23 14:34:44.275
2	14	7	6	2024-07-23 14:34:44.278	2024-07-23 14:34:44.278
3	22	5	4	2024-07-23 14:34:44.281	2024-07-23 14:34:44.281
4	25	4	3	2024-07-23 14:34:44.283	2024-07-23 14:34:44.283
5	38	8	7	2024-07-23 14:34:44.284	2024-07-23 14:34:44.284
6	47	10	9	2024-07-23 14:34:44.285	2024-07-23 14:34:44.285
7	66	2	1	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
8	76	10	10	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
9	82	5	4	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
10	84	9	9	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
11	89	2	1	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
12	90	2	1	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
13	101	5	4	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
14	105	2	1	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
15	106	4	2	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
16	109	5	4	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
17	112	6	5	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
18	116	5	4	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
19	117	6	5	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
20	129	10	10	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
21	130	3	2	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
22	131	3	2	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
23	144	7	6	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
24	149	7	7	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
25	150	9	8	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
26	153	7	6	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
27	160	9	8	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
28	174	10	10	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
29	180	4	3	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
30	186	3	2	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
31	196	1	1	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
32	199	2	1	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
33	200	2	1	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
34	213	5	4	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
35	218	3	2	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
36	221	7	6	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
37	223	9	8	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
38	224	9	9	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
39	228	9	9	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
40	230	8	7	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
41	240	3	2	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
42	244	6	5	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
43	247	10	9	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
44	250	4	3	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
45	251	8	7	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
46	258	5	4	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
47	261	4	3	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
48	262	2	1	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
49	263	3	2	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
50	264	9	8	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
51	267	3	2	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
52	279	5	4	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
53	280	9	9	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
54	290	5	4	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
55	294	9	9	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
56	307	2	1	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
57	317	9	9	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
58	318	3	2	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
59	322	9	8	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
60	341	2	1	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
61	342	10	9	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
62	351	2	1	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
63	355	10	10	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
64	356	3	2	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
65	360	9	8	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
66	369	4	3	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
67	379	10	9	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
68	382	5	4	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
69	387	5	4	2024-07-23 14:34:44.286	2024-07-23 14:34:44.286
70	393	4	3	2024-07-23 14:34:44.287	2024-07-23 14:34:44.287
71	404	5	4	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
72	414	8	8	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
73	415	6	6	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
74	420	5	4	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
75	423	5	3	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
76	426	6	5	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
77	434	10	10	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
78	451	9	8	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
79	453	5	4	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
80	457	7	7	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
81	462	4	3	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
82	487	5	4	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
83	493	4	3	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
84	496	10	10	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
85	500	5	4	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
86	504	3	2	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
87	509	9	9	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
88	510	4	2	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
89	518	7	7	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
90	519	10	9	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
91	537	10	9	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
92	539	10	10	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
93	540	4	3	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
94	541	10	10	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
95	542	2	1	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
96	563	2	1	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
97	569	8	7	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
98	583	3	2	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
99	594	4	3	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
100	598	5	4	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
101	604	2	1	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
102	606	2	1	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
103	610	2	1	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
104	620	7	7	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
105	626	8	7	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
106	627	10	9	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
107	637	10	10	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
108	646	9	9	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
109	648	6	5	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
110	682	9	9	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
111	685	5	4	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
112	691	7	6	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
113	696	3	1	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
114	703	6	5	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
115	708	3	1	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
116	722	5	4	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
117	739	10	10	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
118	740	10	10	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
119	750	10	10	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
120	755	10	10	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
121	765	10	10	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
122	772	3	2	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
123	774	2	1	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
124	779	4	3	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
125	780	7	6	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
126	782	7	7	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
127	787	10	10	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
128	795	10	10	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
129	799	9	8	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
130	800	10	10	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
131	801	9	8	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
132	805	10	9	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
133	806	7	6	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
134	813	9	8	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
135	818	8	7	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
136	829	4	2	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
137	839	3	2	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
138	841	4	3	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
139	843	5	4	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
140	848	10	9	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
141	853	9	9	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
142	854	5	4	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
143	857	7	7	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
144	861	8	7	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
145	864	7	7	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
146	867	2	1	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
147	876	10	10	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
148	880	3	2	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
149	881	4	3	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
150	889	6	5	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
151	897	3	1	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
152	900	4	3	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
153	905	10	10	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
154	907	9	8	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
155	911	4	3	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
156	928	6	5	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
157	933	10	9	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
158	934	4	3	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
159	935	3	2	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
160	937	3	2	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
161	944	5	4	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
162	945	8	7	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
163	947	10	10	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
164	948	10	9	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
165	954	4	3	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
166	960	9	9	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
167	963	2	1	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
168	971	4	2	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
169	973	3	2	2024-07-23 14:34:44.289	2024-07-23 14:34:44.289
170	976	10	10	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
171	998	10	10	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
172	1008	10	10	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
173	1014	7	7	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
174	1015	9	8	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
175	1020	3	1	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
176	1026	10	10	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
177	1027	10	10	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
178	1028	4	2	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
179	1032	7	6	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
180	1034	4	3	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
181	1035	9	9	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
182	1057	7	6	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
183	1071	9	8	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
184	1073	8	7	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
185	1074	6	5	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
186	1079	7	7	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
187	1085	10	10	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
188	1086	10	10	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
189	1087	7	6	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
190	1091	9	8	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
191	1093	2	1	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
192	1094	9	8	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
193	1105	4	3	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
194	1108	5	5	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
195	1109	3	1	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
196	1110	6	5	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
197	1113	7	7	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
198	1127	8	7	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
199	1129	4	3	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
200	1138	3	2	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
201	1139	2	1	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
202	1154	5	4	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
203	1160	5	4	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
204	1166	2	1	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
205	1177	4	3	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
206	1190	10	10	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
207	1191	8	7	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
208	1192	2	1	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
209	1193	10	10	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
210	1199	6	5	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
211	1200	3	2	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
212	1201	7	6	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
213	1203	7	6	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
214	1204	3	2	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
215	1208	3	2	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
216	1210	10	10	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
217	1214	7	6	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
218	1217	10	9	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
219	1219	8	7	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
220	1225	6	5	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
221	1226	6	5	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
222	1228	9	9	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
223	1251	9	8	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
224	1255	7	6	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
225	1257	2	1	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
226	1264	10	9	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
227	1266	5	5	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
228	1289	9	8	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
229	1303	9	9	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
230	1314	5	4	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
231	1317	4	3	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
232	1332	5	4	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
233	1351	3	2	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
234	1352	5	4	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
235	1356	7	6	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
236	1366	3	2	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
237	1372	3	2	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
238	1378	10	9	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
239	1380	8	7	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
240	1389	6	6	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
241	1406	5	4	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
242	1424	9	9	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
243	1433	3	2	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
244	1440	5	4	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
245	1449	10	10	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
246	1455	8	7	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
247	1477	10	10	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
248	1480	10	9	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
249	1484	7	7	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
250	1485	2	1	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
251	1496	3	2	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
252	1499	4	2	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
253	1506	6	5	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
254	1507	10	10	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
255	1511	9	9	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
256	1513	10	10	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
257	1515	5	4	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
258	1529	10	10	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
259	1530	9	8	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
260	1535	9	8	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
261	1537	10	10	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
262	1539	5	4	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
263	1543	4	3	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
264	1544	3	2	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
265	1548	9	9	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
266	1550	8	7	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
267	1553	6	5	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
268	1560	8	7	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
269	1562	3	2	2024-07-23 14:34:44.291	2024-07-23 14:34:44.291
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: young
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, username, created_at, updated_at, user_family_type) FROM stdin;
\.


--
-- Name: appreciation_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: young
--

SELECT pg_catalog.setval('public.appreciation_values_id_seq', 1, false);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: young
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, false);


--
-- Name: crime_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: young
--

SELECT pg_catalog.setval('public.crime_rates_id_seq', 1, false);


--
-- Name: family_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: young
--

SELECT pg_catalog.setval('public.family_types_id_seq', 1, true);


--
-- Name: favorite_cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: young
--

SELECT pg_catalog.setval('public.favorite_cities_id_seq', 257, true);


--
-- Name: groceries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: young
--

SELECT pg_catalog.setval('public.groceries_id_seq', 1, false);


--
-- Name: grocery_cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: young
--

SELECT pg_catalog.setval('public.grocery_cities_id_seq', 1, false);


--
-- Name: gym_cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: young
--

SELECT pg_catalog.setval('public.gym_cities_id_seq', 1, false);


--
-- Name: gyms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: young
--

SELECT pg_catalog.setval('public.gyms_id_seq', 1, false);


--
-- Name: language_cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: young
--

SELECT pg_catalog.setval('public.language_cities_id_seq', 1, false);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: young
--

SELECT pg_catalog.setval('public.languages_id_seq', 1, false);


--
-- Name: metras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: young
--

SELECT pg_catalog.setval('public.metras_id_seq', 1, true);


--
-- Name: prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: young
--

SELECT pg_catalog.setval('public.prices_id_seq', 1, false);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: young
--

SELECT pg_catalog.setval('public.reviews_id_seq', 24, true);


--
-- Name: school_grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: young
--

SELECT pg_catalog.setval('public.school_grades_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: young
--

SELECT pg_catalog.setval('public.users_id_seq', 16, true);


--
-- Name: appreciation_values appreciation_values_pkey; Type: CONSTRAINT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.appreciation_values
    ADD CONSTRAINT appreciation_values_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: crime_rates crime_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.crime_rates
    ADD CONSTRAINT crime_rates_pkey PRIMARY KEY (id);


--
-- Name: family_types family_types_pkey; Type: CONSTRAINT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.family_types
    ADD CONSTRAINT family_types_pkey PRIMARY KEY (id);


--
-- Name: favorite_cities favorite_cities_pkey; Type: CONSTRAINT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.favorite_cities
    ADD CONSTRAINT favorite_cities_pkey PRIMARY KEY (id);


--
-- Name: groceries groceries_pkey; Type: CONSTRAINT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.groceries
    ADD CONSTRAINT groceries_pkey PRIMARY KEY (id);


--
-- Name: grocery_cities grocery_cities_pkey; Type: CONSTRAINT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.grocery_cities
    ADD CONSTRAINT grocery_cities_pkey PRIMARY KEY (id);


--
-- Name: gym_cities gym_cities_pkey; Type: CONSTRAINT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.gym_cities
    ADD CONSTRAINT gym_cities_pkey PRIMARY KEY (id);


--
-- Name: gyms gyms_pkey; Type: CONSTRAINT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.gyms
    ADD CONSTRAINT gyms_pkey PRIMARY KEY (id);


--
-- Name: language_cities language_cities_pkey; Type: CONSTRAINT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.language_cities
    ADD CONSTRAINT language_cities_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: metras metras_pkey; Type: CONSTRAINT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.metras
    ADD CONSTRAINT metras_pkey PRIMARY KEY (id);


--
-- Name: prices prices_pkey; Type: CONSTRAINT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: school_grades school_grades_pkey; Type: CONSTRAINT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.school_grades
    ADD CONSTRAINT school_grades_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: young
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_cities_on_latitude; Type: INDEX; Schema: public; Owner: young
--

CREATE INDEX index_cities_on_latitude ON public.cities USING btree (latitude);


--
-- Name: index_cities_on_longitude; Type: INDEX; Schema: public; Owner: young
--

CREATE INDEX index_cities_on_longitude ON public.cities USING btree (longitude);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: young
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: young
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- PostgreSQL database dump complete
--

