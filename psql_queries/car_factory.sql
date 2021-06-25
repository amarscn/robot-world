--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)

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
-- Name: assembly_stage; Type: TABLE; Schema: public; Owner: amardeep
--

CREATE TABLE public.assembly_stage (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.assembly_stage OWNER TO amardeep;

--
-- Name: assembly_stage_id_seq; Type: SEQUENCE; Schema: public; Owner: amardeep
--

CREATE SEQUENCE public.assembly_stage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assembly_stage_id_seq OWNER TO amardeep;

--
-- Name: assembly_stage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amardeep
--

ALTER SEQUENCE public.assembly_stage_id_seq OWNED BY public.assembly_stage.id;


--
-- Name: car; Type: TABLE; Schema: public; Owner: amardeep
--

CREATE TABLE public.car (
    id integer NOT NULL,
    model_id integer NOT NULL,
    year integer NOT NULL,
    cost_price double precision NOT NULL,
    part_id integer NOT NULL,
    assembly_stage_id integer NOT NULL,
    sale_price double precision NOT NULL,
    is_complete boolean DEFAULT false,
    moved_to_factory boolean DEFAULT false
);


ALTER TABLE public.car OWNER TO amardeep;

--
-- Name: car_defect; Type: TABLE; Schema: public; Owner: amardeep
--

CREATE TABLE public.car_defect (
    id integer NOT NULL,
    part_id integer NOT NULL,
    car_id integer,
    is_logged boolean DEFAULT false,
    model_id integer
);


ALTER TABLE public.car_defect OWNER TO amardeep;

--
-- Name: car_defect_id_seq; Type: SEQUENCE; Schema: public; Owner: amardeep
--

CREATE SEQUENCE public.car_defect_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.car_defect_id_seq OWNER TO amardeep;

--
-- Name: car_defect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amardeep
--

ALTER SEQUENCE public.car_defect_id_seq OWNED BY public.car_defect.id;


--
-- Name: car_id_seq; Type: SEQUENCE; Schema: public; Owner: amardeep
--

CREATE SEQUENCE public.car_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.car_id_seq OWNER TO amardeep;

--
-- Name: car_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amardeep
--

ALTER SEQUENCE public.car_id_seq OWNED BY public.car.id;


--
-- Name: car_order; Type: TABLE; Schema: public; Owner: amardeep
--

CREATE TABLE public.car_order (
    id integer NOT NULL,
    model_id integer NOT NULL
);


ALTER TABLE public.car_order OWNER TO amardeep;

--
-- Name: car_order_id_seq; Type: SEQUENCE; Schema: public; Owner: amardeep
--

CREATE SEQUENCE public.car_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.car_order_id_seq OWNER TO amardeep;

--
-- Name: car_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amardeep
--

ALTER SEQUENCE public.car_order_id_seq OWNED BY public.car_order.id;


--
-- Name: car_parts; Type: TABLE; Schema: public; Owner: amardeep
--

CREATE TABLE public.car_parts (
    id integer NOT NULL,
    car_id integer NOT NULL,
    part_id integer NOT NULL
);


ALTER TABLE public.car_parts OWNER TO amardeep;

--
-- Name: car_parts_id_seq; Type: SEQUENCE; Schema: public; Owner: amardeep
--

CREATE SEQUENCE public.car_parts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.car_parts_id_seq OWNER TO amardeep;

--
-- Name: car_parts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amardeep
--

ALTER SEQUENCE public.car_parts_id_seq OWNED BY public.car_parts.id;


--
-- Name: factory_stock; Type: TABLE; Schema: public; Owner: amardeep
--

CREATE TABLE public.factory_stock (
    id integer NOT NULL,
    total_stock bigint NOT NULL,
    model_id integer
);


ALTER TABLE public.factory_stock OWNER TO amardeep;

--
-- Name: factory_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: amardeep
--

CREATE SEQUENCE public.factory_stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.factory_stock_id_seq OWNER TO amardeep;

--
-- Name: factory_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amardeep
--

ALTER SEQUENCE public.factory_stock_id_seq OWNED BY public.factory_stock.id;


--
-- Name: model; Type: TABLE; Schema: public; Owner: amardeep
--

CREATE TABLE public.model (
    id integer NOT NULL,
    model_name character varying(255) NOT NULL
);


ALTER TABLE public.model OWNER TO amardeep;

--
-- Name: model_id_seq; Type: SEQUENCE; Schema: public; Owner: amardeep
--

CREATE SEQUENCE public.model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.model_id_seq OWNER TO amardeep;

--
-- Name: model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amardeep
--

ALTER SEQUENCE public.model_id_seq OWNED BY public.model.id;


--
-- Name: parts; Type: TABLE; Schema: public; Owner: amardeep
--

CREATE TABLE public.parts (
    id integer NOT NULL,
    part_name character varying(255) NOT NULL
);


ALTER TABLE public.parts OWNER TO amardeep;

--
-- Name: store_stock; Type: TABLE; Schema: public; Owner: amardeep
--

CREATE TABLE public.store_stock (
    id integer NOT NULL,
    total_stock bigint NOT NULL,
    model_id integer
);


ALTER TABLE public.store_stock OWNER TO amardeep;

--
-- Name: store_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: amardeep
--

CREATE SEQUENCE public.store_stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_stock_id_seq OWNER TO amardeep;

--
-- Name: store_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amardeep
--

ALTER SEQUENCE public.store_stock_id_seq OWNED BY public.store_stock.id;


--
-- Name: assembly_stage id; Type: DEFAULT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.assembly_stage ALTER COLUMN id SET DEFAULT nextval('public.assembly_stage_id_seq'::regclass);


--
-- Name: car id; Type: DEFAULT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.car ALTER COLUMN id SET DEFAULT nextval('public.car_id_seq'::regclass);


--
-- Name: car_defect id; Type: DEFAULT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.car_defect ALTER COLUMN id SET DEFAULT nextval('public.car_defect_id_seq'::regclass);


--
-- Name: car_order id; Type: DEFAULT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.car_order ALTER COLUMN id SET DEFAULT nextval('public.car_order_id_seq'::regclass);


--
-- Name: car_parts id; Type: DEFAULT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.car_parts ALTER COLUMN id SET DEFAULT nextval('public.car_parts_id_seq'::regclass);


--
-- Name: factory_stock id; Type: DEFAULT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.factory_stock ALTER COLUMN id SET DEFAULT nextval('public.factory_stock_id_seq'::regclass);


--
-- Name: model id; Type: DEFAULT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.model ALTER COLUMN id SET DEFAULT nextval('public.model_id_seq'::regclass);


--
-- Name: store_stock id; Type: DEFAULT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.store_stock ALTER COLUMN id SET DEFAULT nextval('public.store_stock_id_seq'::regclass);


--
-- Data for Name: assembly_stage; Type: TABLE DATA; Schema: public; Owner: amardeep
--

COPY public.assembly_stage (id, name) FROM stdin;
1	Basic Structure
2	Electronic Devices
3	Painting and Final Details
\.


--
-- Data for Name: car; Type: TABLE DATA; Schema: public; Owner: amardeep
--

COPY public.car (id, model_id, year, cost_price, part_id, assembly_stage_id, sale_price, is_complete, moved_to_factory) FROM stdin;
241	2	1970	32894	2	3	37339	t	t
228	7	1984	14033	2	3	17860	t	t
257	7	2010	3446	2	3	7507	t	t
229	8	1992	29222	2	3	32809	t	t
244	6	2019	28808	2	3	32232	t	t
242	8	2014	8828	2	3	12803	t	t
230	9	2019	27157	2	3	30266	t	t
231	1	1994	4649	2	3	7232	t	t
243	9	2007	20714	2	3	25065	t	t
232	10	1983	33107	2	3	35659	t	t
258	8	1975	31212	2	3	35571	t	t
233	8	1998	3991	2	3	8199	t	t
245	8	1980	28849	2	3	33189	t	t
234	4	2012	5685	2	3	9556	t	t
235	10	1991	23145	2	3	27489	t	t
259	7	1994	27142	2	3	29772	t	t
246	4	1970	11440	2	3	14823	t	t
236	5	1995	30747	2	3	35176	t	t
237	3	2016	29999	2	3	33518	t	t
247	2	2018	15188	2	3	18491	t	t
260	7	1987	33761	2	3	36921	t	t
238	4	1996	22652	2	3	25874	t	t
239	4	1988	26362	2	3	29710	t	t
240	3	1995	4973	2	3	7811	t	t
261	7	1990	23772	2	3	28213	t	t
248	10	1988	26205	2	3	28757	t	t
262	7	1986	26887	2	3	31058	t	t
249	2	1994	21354	2	3	24058	t	t
250	4	2002	6116	2	3	8690	t	t
251	4	1978	7574	2	3	10258	t	t
263	5	1982	18007	2	3	21136	t	t
252	9	2004	24809	2	3	27404	t	t
253	7	2008	30283	2	3	34419	t	t
264	4	1997	3387	2	3	6308	t	t
267	4	1973	30014	2	1	32814	f	f
266	1	1989	16785	2	2	19379	f	f
254	8	1973	17039	2	3	21207	t	t
256	10	2014	33249	2	3	37419	t	t
255	6	1985	5925	2	3	9963	t	t
265	3	2002	12983	2	3	15808	t	t
\.


--
-- Data for Name: car_defect; Type: TABLE DATA; Schema: public; Owner: amardeep
--

COPY public.car_defect (id, part_id, car_id, is_logged, model_id) FROM stdin;
53	7	228	f	7
54	10	229	f	8
57	1	230	f	9
59	9	231	f	1
60	5	235	f	10
61	8	237	f	3
63	5	238	f	4
64	4	232	f	10
65	6	234	f	4
68	5	239	f	4
69	2	245	f	8
80	8	243	f	9
81	3	250	f	4
82	7	256	f	10
\.


--
-- Data for Name: car_order; Type: TABLE DATA; Schema: public; Owner: amardeep
--

COPY public.car_order (id, model_id) FROM stdin;
2	7
3	7
4	7
5	9
6	7
7	10
8	7
9	9
\.


--
-- Data for Name: car_parts; Type: TABLE DATA; Schema: public; Owner: amardeep
--

COPY public.car_parts (id, car_id, part_id) FROM stdin;
1961	228	1
1962	228	2
1963	228	3
1964	228	5
1965	228	4
1966	228	6
1967	228	7
1968	228	8
1969	229	1
1970	228	9
1971	229	2
1972	228	10
1973	229	3
1974	229	4
1975	229	5
1976	229	6
1977	230	1
1978	229	7
1979	230	2
1980	229	8
1981	230	3
1982	230	4
1983	231	1
1984	230	5
1985	231	2
1986	229	9
1987	230	6
1988	231	3
1989	230	7
1990	229	10
1991	231	4
1992	230	8
1993	232	1
1994	231	5
1995	230	9
1996	232	2
1997	231	6
1998	230	10
1999	232	3
2000	231	7
2001	232	4
2002	231	8
2003	231	9
2004	232	5
2005	233	1
2006	231	10
2007	233	2
2008	232	6
2009	233	3
2010	232	7
2011	233	4
2012	232	8
2013	234	1
2014	232	9
2015	233	5
2016	234	2
2017	233	6
2018	232	10
2019	234	3
2020	233	7
2021	234	4
2022	233	8
2023	234	5
2024	235	1
2025	233	9
2026	234	6
2027	235	2
2028	233	10
2029	234	7
2030	235	3
2031	234	8
2032	235	4
2033	235	5
2034	236	1
2035	234	9
2036	235	6
2037	235	7
2038	234	10
2039	236	2
2040	236	3
2041	235	8
2042	236	4
2043	235	9
2044	235	10
2045	237	1
2046	236	5
2047	237	2
2048	236	6
2049	237	3
2050	236	7
2051	237	4
2052	236	8
2053	238	1
2054	237	5
2055	238	2
2056	237	6
2057	236	9
2058	238	3
2059	236	10
2060	237	7
2061	238	4
2062	237	8
2063	237	9
2064	237	10
2065	239	1
2066	238	5
2067	239	2
2068	238	6
2069	239	3
2070	238	7
2071	239	4
2072	238	8
2073	240	1
2074	239	5
2075	240	2
2076	239	6
2077	240	3
2078	238	9
2079	239	7
2080	238	10
2081	240	4
2082	239	8
2083	239	9
2084	239	10
2085	241	1
2086	240	5
2087	241	2
2088	240	6
2089	241	3
2090	240	9
2091	240	7
2092	240	10
2093	241	4
2094	240	8
2095	242	1
2096	241	5
2097	242	2
2098	241	6
2099	242	3
2100	241	7
2101	242	4
2102	241	8
2103	243	1
2104	242	5
2105	243	2
2106	241	9
2107	242	6
2108	243	3
2109	241	10
2110	242	7
2111	243	4
2112	242	8
2113	244	1
2114	244	5
2115	244	2
2116	244	6
2117	244	3
2118	244	9
2119	244	7
2120	244	4
2121	244	10
2122	244	8
2123	243	5
2124	242	9
2125	243	6
2126	242	10
2127	243	7
2128	243	8
2129	245	1
2130	243	9
2132	245	2
2131	243	10
2133	245	3
2134	245	4
2135	246	1
2136	246	2
2137	245	5
2138	246	3
2139	246	4
2140	245	6
2141	245	7
2142	245	8
2143	247	1
2144	246	5
2145	245	9
2146	247	2
2149	247	3
2151	247	4
2147	246	6
2150	246	7
2152	246	8
2148	245	10
2153	248	1
2154	246	9
2155	247	5
2156	248	2
2157	247	6
2158	246	10
2159	248	3
2160	247	7
2161	248	4
2162	247	8
2163	249	1
2164	248	5
2165	247	9
2166	249	2
2167	248	6
2168	247	10
2169	249	3
2170	248	7
2171	249	4
2172	248	8
2173	250	1
2174	248	9
2175	249	5
2176	250	2
2177	249	6
2178	248	10
2179	250	3
2180	249	7
2181	250	4
2182	249	8
2183	251	1
2184	249	9
2185	250	5
2186	251	2
2187	251	3
2188	250	6
2189	249	10
2190	251	4
2191	250	7
2192	250	8
2193	252	1
2194	250	9
2195	252	2
2196	252	3
2197	250	10
2198	251	5
2199	252	4
2200	251	6
2201	251	7
2202	251	8
2203	253	1
2204	252	5
2205	253	2
2206	251	9
2207	252	6
2208	253	3
2209	252	7
2210	251	10
2211	253	4
2212	252	8
2213	253	5
2214	254	1
2215	253	6
2216	252	9
2217	254	2
2218	253	7
2219	254	3
2220	252	10
2221	254	4
2222	253	8
2223	255	1
2224	253	9
2225	254	5
2226	255	2
2227	254	6
2228	253	10
2229	255	3
2230	254	7
2231	255	4
2232	254	8
2233	256	1
2234	254	9
2235	255	5
2236	255	6
2237	254	10
2238	256	2
2239	255	7
2240	255	8
2241	256	3
2242	256	4
2243	256	5
2244	257	1
2245	256	6
2246	255	9
2248	257	2
2247	256	7
2249	257	3
2250	255	10
2251	256	8
2252	257	4
2253	256	9
2254	256	10
2255	257	5
2256	258	1
2257	257	6
2258	258	2
2259	257	7
2260	258	3
2261	257	8
2262	258	4
2263	259	1
2264	258	5
2265	257	9
2266	258	6
2267	259	2
2268	257	10
2269	258	7
2270	259	3
2271	258	8
2272	259	4
2273	260	1
2274	258	9
2275	259	5
2276	260	2
2277	258	10
2278	259	6
2279	260	3
2280	259	7
2281	260	4
2282	259	8
2283	261	1
2284	260	5
2285	259	9
2286	261	2
2287	260	6
2288	259	10
2289	261	3
2290	260	7
2291	261	4
2292	260	8
2293	262	1
2294	260	9
2295	261	5
2296	262	2
2297	261	6
2298	260	10
2299	262	3
2300	261	7
2301	262	4
2302	261	8
2303	263	1
2304	261	9
2305	262	5
2306	263	2
2307	261	10
2308	262	6
2309	263	3
2310	262	7
2311	263	4
2312	262	8
2313	264	1
2314	262	9
2315	263	5
2316	264	2
2317	263	6
2318	262	10
2319	264	3
2320	263	7
2321	264	4
2322	263	8
2323	265	1
2324	263	9
2325	264	5
2326	265	2
2327	264	6
2328	263	10
2329	265	3
2330	264	7
2331	265	4
2332	264	8
2333	266	1
2334	265	5
2335	264	9
2336	266	2
2338	264	10
2344	265	9
2348	265	10
2339	266	3
2340	266	4
2343	267	1
2346	267	2
2349	267	3
2351	267	4
2337	265	6
2341	265	7
2342	265	8
2345	266	5
2347	266	6
2350	266	7
2352	266	8
\.


--
-- Data for Name: factory_stock; Type: TABLE DATA; Schema: public; Owner: amardeep
--

COPY public.factory_stock (id, total_stock, model_id) FROM stdin;
99	2	2
103	2	6
98	2	10
101	0	9
102	3	8
97	6	7
104	2	5
100	4	4
105	2	3
\.


--
-- Data for Name: model; Type: TABLE DATA; Schema: public; Owner: amardeep
--

COPY public.model (id, model_name) FROM stdin;
1	RX300
2	LX350
3	CRV300
4	RX450
5	Lexus Sport
6	LRV Sedan
7	LXV SUV
8	CRV 4 Wheel
9	TRV Sedan
10	TXV Sport
\.


--
-- Data for Name: parts; Type: TABLE DATA; Schema: public; Owner: amardeep
--

COPY public.parts (id, part_name) FROM stdin;
1	Chasis
2	Front Left Wheel
3	Front Right Wheel
4	Back left Wheel
5	Back Right Wheel
6	Driver Seat
7	Passenger Seat
8	Engine
9	Computer
10	Laser
\.


--
-- Data for Name: store_stock; Type: TABLE DATA; Schema: public; Owner: amardeep
--

COPY public.store_stock (id, total_stock, model_id) FROM stdin;
2	1	10
3	2	7
1	2	9
\.


--
-- Name: assembly_stage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amardeep
--

SELECT pg_catalog.setval('public.assembly_stage_id_seq', 1, false);


--
-- Name: car_defect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amardeep
--

SELECT pg_catalog.setval('public.car_defect_id_seq', 82, true);


--
-- Name: car_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amardeep
--

SELECT pg_catalog.setval('public.car_id_seq', 267, true);


--
-- Name: car_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amardeep
--

SELECT pg_catalog.setval('public.car_order_id_seq', 9, true);


--
-- Name: car_parts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amardeep
--

SELECT pg_catalog.setval('public.car_parts_id_seq', 2352, true);


--
-- Name: factory_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amardeep
--

SELECT pg_catalog.setval('public.factory_stock_id_seq', 105, true);


--
-- Name: model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amardeep
--

SELECT pg_catalog.setval('public.model_id_seq', 1, false);


--
-- Name: store_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amardeep
--

SELECT pg_catalog.setval('public.store_stock_id_seq', 3, true);


--
-- Name: assembly_stage assembly_stage_pkey; Type: CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.assembly_stage
    ADD CONSTRAINT assembly_stage_pkey PRIMARY KEY (id);


--
-- Name: car_defect car_defect_pkey; Type: CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.car_defect
    ADD CONSTRAINT car_defect_pkey PRIMARY KEY (id);


--
-- Name: car_defect car_id_unq; Type: CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.car_defect
    ADD CONSTRAINT car_id_unq UNIQUE (car_id);


--
-- Name: car_order car_order_pkey; Type: CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.car_order
    ADD CONSTRAINT car_order_pkey PRIMARY KEY (id);


--
-- Name: car_parts car_parts_pkey; Type: CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.car_parts
    ADD CONSTRAINT car_parts_pkey PRIMARY KEY (id);


--
-- Name: car car_pkey; Type: CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_pkey PRIMARY KEY (id);


--
-- Name: factory_stock factory_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.factory_stock
    ADD CONSTRAINT factory_stock_pkey PRIMARY KEY (id);


--
-- Name: model model_pkey; Type: CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_pkey PRIMARY KEY (id);


--
-- Name: parts parts_pkey; Type: CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (id);


--
-- Name: store_stock store_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.store_stock
    ADD CONSTRAINT store_stock_pkey PRIMARY KEY (id);


--
-- Name: car car_assembly_stage_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_assembly_stage_id_foreign FOREIGN KEY (assembly_stage_id) REFERENCES public.assembly_stage(id);


--
-- Name: car_defect car_defect_car_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.car_defect
    ADD CONSTRAINT car_defect_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.car(id);


--
-- Name: car_defect car_defect_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.car_defect
    ADD CONSTRAINT car_defect_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.model(id);


--
-- Name: car_defect car_defect_part_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.car_defect
    ADD CONSTRAINT car_defect_part_id_foreign FOREIGN KEY (part_id) REFERENCES public.parts(id);


--
-- Name: car car_model_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_model_id_foreign FOREIGN KEY (model_id) REFERENCES public.model(id);


--
-- Name: car_parts car_parts_car_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.car_parts
    ADD CONSTRAINT car_parts_car_id_foreign FOREIGN KEY (car_id) REFERENCES public.car(id);


--
-- Name: car_parts car_parts_part_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.car_parts
    ADD CONSTRAINT car_parts_part_id_foreign FOREIGN KEY (part_id) REFERENCES public.parts(id);


--
-- Name: factory_stock fk_factory_model; Type: FK CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.factory_stock
    ADD CONSTRAINT fk_factory_model FOREIGN KEY (model_id) REFERENCES public.model(id);


--
-- Name: store_stock fk_factory_model; Type: FK CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.store_stock
    ADD CONSTRAINT fk_factory_model FOREIGN KEY (model_id) REFERENCES public.model(id);


--
-- Name: car_order order_model_id; Type: FK CONSTRAINT; Schema: public; Owner: amardeep
--

ALTER TABLE ONLY public.car_order
    ADD CONSTRAINT order_model_id FOREIGN KEY (model_id) REFERENCES public.model(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

