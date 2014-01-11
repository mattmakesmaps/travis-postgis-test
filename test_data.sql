--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: test_data; Type: SCHEMA; Schema: -; Owner: matt
--

CREATE SCHEMA test_data;


ALTER SCHEMA test_data OWNER TO matt;

SET search_path = test_data, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: test_lines; Type: TABLE; Schema: test_data; Owner: matt; Tablespace: 
--

CREATE TABLE test_lines (
    gid integer NOT NULL,
    id numeric(10,0),
    name character varying(10),
    geom public.geometry(MultiLineString,4326)
);


ALTER TABLE test_data.test_lines OWNER TO matt;

--
-- Name: test_lines_gid_seq; Type: SEQUENCE; Schema: test_data; Owner: matt
--

CREATE SEQUENCE test_lines_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE test_data.test_lines_gid_seq OWNER TO matt;

--
-- Name: test_lines_gid_seq; Type: SEQUENCE OWNED BY; Schema: test_data; Owner: matt
--

ALTER SEQUENCE test_lines_gid_seq OWNED BY test_lines.gid;


--
-- Name: test_points; Type: TABLE; Schema: test_data; Owner: matt; Tablespace: 
--

CREATE TABLE test_points (
    gid integer NOT NULL,
    id numeric(10,0),
    name character varying(10),
    geom public.geometry(Point,4326)
);


ALTER TABLE test_data.test_points OWNER TO matt;

--
-- Name: test_points_gid_seq; Type: SEQUENCE; Schema: test_data; Owner: matt
--

CREATE SEQUENCE test_points_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE test_data.test_points_gid_seq OWNER TO matt;

--
-- Name: test_points_gid_seq; Type: SEQUENCE OWNED BY; Schema: test_data; Owner: matt
--

ALTER SEQUENCE test_points_gid_seq OWNED BY test_points.gid;


--
-- Name: test_polygons; Type: TABLE; Schema: test_data; Owner: matt; Tablespace: 
--

CREATE TABLE test_polygons (
    gid integer NOT NULL,
    id numeric(10,0),
    name character varying(10),
    geom public.geometry(MultiPolygon,4326)
);


ALTER TABLE test_data.test_polygons OWNER TO matt;

--
-- Name: test_polygons_gid_seq; Type: SEQUENCE; Schema: test_data; Owner: matt
--

CREATE SEQUENCE test_polygons_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE test_data.test_polygons_gid_seq OWNER TO matt;

--
-- Name: test_polygons_gid_seq; Type: SEQUENCE OWNED BY; Schema: test_data; Owner: matt
--

ALTER SEQUENCE test_polygons_gid_seq OWNED BY test_polygons.gid;


--
-- Name: gid; Type: DEFAULT; Schema: test_data; Owner: matt
--

ALTER TABLE ONLY test_lines ALTER COLUMN gid SET DEFAULT nextval('test_lines_gid_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: test_data; Owner: matt
--

ALTER TABLE ONLY test_points ALTER COLUMN gid SET DEFAULT nextval('test_points_gid_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: test_data; Owner: matt
--

ALTER TABLE ONLY test_polygons ALTER COLUMN gid SET DEFAULT nextval('test_polygons_gid_seq'::regclass);


--
-- Data for Name: test_lines; Type: TABLE DATA; Schema: test_data; Owner: matt
--

COPY test_lines (gid, id, name, geom) FROM stdin;
1	3	Neptune	0105000020E61000000100000001020000000400000098C2ADCC7F1D554040219BB878B54B406005545D8AC8544000D42B0BAB6A43C0402FA6BA0188604020DFC44DD51642C068AC8B4838675F40F063314876BE4340
2	2	Venus	0105000020E610000001000000010200000002000000A8432722957849C0A043B6BAA53F34C0B06370CF66F24E40A043B6BAA53F34C0
3	1	Mars	0105000020E6100000010000000102000000020000000C543800B3915FC0C08B052FB8D20F40FC53E4BE220756C0A0426680F7B94740
\.


--
-- Name: test_lines_gid_seq; Type: SEQUENCE SET; Schema: test_data; Owner: matt
--

SELECT pg_catalog.setval('test_lines_gid_seq', 3, true);


--
-- Data for Name: test_points; Type: TABLE DATA; Schema: test_data; Owner: matt
--

COPY test_points (gid, id, name, geom) FROM stdin;
1	3	Red	0101000020E6100000F8B241BE55764BC0E87BB330078F2AC0
2	2	Green	0101000020E6100000F28AE4BE22075640CCA65F59873A4740
3	1	Blue	0101000020E61000004FC3429B66ED59C0A89B3E9656BD4440
\.


--
-- Name: test_points_gid_seq; Type: SEQUENCE SET; Schema: test_data; Owner: matt
--

SELECT pg_catalog.setval('test_points_gid_seq', 3, true);


--
-- Data for Name: test_polygons; Type: TABLE DATA; Schema: test_data; Owner: matt
--

COPY test_polygons (gid, id, name, geom) FROM stdin;
1	3	Pie	0106000020E6100000010000000103000000010000000500000076A4CF5EC47260C0989C8ED0044331C01306A5EBEDAF57C0C8701AEEDCE22BC061757B472BC557C02B3835E5478D4AC076A4CF5EC47260C0C716E29CC2B74AC076A4CF5EC47260C0989C8ED0044331C0
2	2	Cookie	0106000020E6100000010000000103000000010000000500000078DDD21FEEB43C403C7A63CDCA16414068F45533A6F44C40ACF416ACB5C0414054421D87E11C4F4000A237B40C2B0D4070FF56F4BC2D40408022649C66C9FF3F78DDD21FEEB43C403C7A63CDCA164140
3	1	Mint	0106000020E6100000010000000103000000010000000500000043E7DBCF93FA62C09C3775465DD75040F6A1BB136BD15FC08685F859151751402106B5ECFA515FC0B09BC6165D8E4840F577057456E562C08437CD3DCD0D494043E7DBCF93FA62C09C3775465DD75040
\.


--
-- Name: test_polygons_gid_seq; Type: SEQUENCE SET; Schema: test_data; Owner: matt
--

SELECT pg_catalog.setval('test_polygons_gid_seq', 3, true);


--
-- Name: test_lines_pkey; Type: CONSTRAINT; Schema: test_data; Owner: matt; Tablespace: 
--

ALTER TABLE ONLY test_lines
    ADD CONSTRAINT test_lines_pkey PRIMARY KEY (gid);


--
-- Name: test_points_pkey; Type: CONSTRAINT; Schema: test_data; Owner: matt; Tablespace: 
--

ALTER TABLE ONLY test_points
    ADD CONSTRAINT test_points_pkey PRIMARY KEY (gid);


--
-- Name: test_polygons_pkey; Type: CONSTRAINT; Schema: test_data; Owner: matt; Tablespace: 
--

ALTER TABLE ONLY test_polygons
    ADD CONSTRAINT test_polygons_pkey PRIMARY KEY (gid);


--
-- PostgreSQL database dump complete
--

