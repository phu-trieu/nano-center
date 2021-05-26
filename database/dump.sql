--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15 (Ubuntu 10.15-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.15 (Ubuntu 10.15-0ubuntu0.18.04.1)

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

ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS products_pkey;
ALTER TABLE IF EXISTS ONLY public.orders DROP CONSTRAINT IF EXISTS orders_pkey;
ALTER TABLE IF EXISTS ONLY public.carts DROP CONSTRAINT IF EXISTS carts_pkey;
ALTER TABLE IF EXISTS ONLY public."cartItems" DROP CONSTRAINT IF EXISTS "cartItems_pkey";
ALTER TABLE IF EXISTS public.products ALTER COLUMN "productId" DROP DEFAULT;
ALTER TABLE IF EXISTS public.orders ALTER COLUMN "orderId" DROP DEFAULT;
ALTER TABLE IF EXISTS public.carts ALTER COLUMN "cartId" DROP DEFAULT;
ALTER TABLE IF EXISTS public."cartItems" ALTER COLUMN "cartItemId" DROP DEFAULT;
DROP SEQUENCE IF EXISTS public."products_productId_seq";
DROP TABLE IF EXISTS public.products;
DROP SEQUENCE IF EXISTS public."orders_orderId_seq";
DROP TABLE IF EXISTS public.orders;
DROP SEQUENCE IF EXISTS public."carts_cardId_seq";
DROP TABLE IF EXISTS public.carts;
DROP SEQUENCE IF EXISTS public."cartItems_cartItemId_seq";
DROP TABLE IF EXISTS public."cartItems";
DROP EXTENSION IF EXISTS plpgsql;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cartItems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."cartItems" (
    "cartItemId" integer NOT NULL,
    "cartId" integer NOT NULL,
    "productId" integer NOT NULL,
    price integer NOT NULL
);


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."cartItems_cartItemId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."cartItems_cartItemId_seq" OWNED BY public."cartItems"."cartItemId";


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    "cartId" integer NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: carts_cardId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."carts_cardId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carts_cardId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."carts_cardId_seq" OWNED BY public.carts."cartId";


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    "orderId" integer NOT NULL,
    "cartId" integer NOT NULL,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    company text,
    address text NOT NULL,
    "aptSuite" text,
    city text NOT NULL,
    state text NOT NULL,
    "zipCode" text NOT NULL,
    phone text NOT NULL,
    "cardNumber" text NOT NULL,
    "nameOnCard" text NOT NULL,
    "expDate" text NOT NULL,
    "securityCode" text NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: orders_orderId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."orders_orderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_orderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."orders_orderId_seq" OWNED BY public.orders."orderId";


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    "productId" integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    image text[] NOT NULL,
    "productType" text NOT NULL,
    "shortDescription" text NOT NULL,
    "longDescription" text NOT NULL
);


--
-- Name: products_productId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."products_productId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."products_productId_seq" OWNED BY public.products."productId";


--
-- Name: cartItems cartItemId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems" ALTER COLUMN "cartItemId" SET DEFAULT nextval('public."cartItems_cartItemId_seq"'::regclass);


--
-- Name: carts cartId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts ALTER COLUMN "cartId" SET DEFAULT nextval('public."carts_cardId_seq"'::regclass);


--
-- Name: orders orderId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN "orderId" SET DEFAULT nextval('public."orders_orderId_seq"'::regclass);


--
-- Name: products productId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN "productId" SET DEFAULT nextval('public."products_productId_seq"'::regclass);


--
-- Data for Name: cartItems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."cartItems" ("cartItemId", "cartId", "productId", price) FROM stdin;
166	27	5	9900
167	27	5	9900
168	27	5	9900
169	27	5	9900
170	27	5	9900
171	27	5	9900
172	27	5	9900
173	27	5	9900
174	27	5	9900
175	27	5	9900
176	27	5	9900
177	27	5	9900
178	27	5	9900
179	27	5	9900
180	27	5	9900
181	27	5	9900
182	27	5	9900
183	27	5	9900
184	27	5	9900
185	27	5	9900
186	27	5	9900
187	27	5	9900
188	27	5	9900
189	28	1	2999
190	28	1	2999
191	28	1	2999
192	28	1	2999
193	28	1	2999
194	28	1	2999
195	28	1	2999
196	28	1	2999
197	28	1	2999
198	28	1	2999
199	28	1	2999
200	28	1	2999
201	28	1	2999
202	28	1	2999
203	28	1	2999
204	28	1	2999
205	28	1	2999
206	28	1	2999
207	28	1	2999
208	28	1	2999
209	28	1	2999
210	28	1	2999
211	28	1	2999
212	28	1	2999
105	26	1	2999
109	26	1	2999
227	29	1	2999
228	29	1	2999
250	29	1	2999
251	29	1	2999
252	29	1	2999
253	29	1	2999
254	29	1	2999
255	29	1	2999
256	29	1	2999
257	29	1	2999
258	29	1	2999
259	29	1	2999
260	29	1	2999
261	29	1	2999
262	29	1	2999
263	29	1	2999
264	29	1	2999
265	29	1	2999
266	29	1	2999
267	29	1	2999
268	30	1	2999
269	31	1	2999
270	32	1	2999
271	33	1	2999
272	34	2	2595
273	35	1	2999
274	35	1	2999
275	35	1	2999
276	35	1	2999
277	35	1	2999
278	35	1	2999
279	35	1	2999
280	35	1	2999
281	35	1	2999
287	36	1	2999
288	36	1	2999
289	36	1	2999
290	36	1	2999
291	37	1	2999
292	37	1	2999
293	37	1	2999
294	38	1	2999
295	38	1	2999
296	38	1	2999
297	39	1	2999
298	39	1	2999
299	40	1	2999
300	40	1	2999
301	41	1	2999
302	42	1	2999
303	42	1	2999
304	42	1	2999
305	43	4	999
306	44	4	999
307	45	4	999
310	46	6	830
311	47	1	2999
312	48	10	56999
313	49	10	56999
314	50	10	56999
315	50	10	56999
316	51	10	56999
317	52	10	56999
318	53	1	79999
319	54	30	17999
320	55	1	79999
321	56	2	27999
322	56	2	27999
323	57	1	79999
324	58	1	79999
325	59	1	79999
326	60	1	79999
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts ("cartId", "createdAt") FROM stdin;
26	2021-05-05 12:06:07.320651-07
27	2021-05-06 10:34:44.861031-07
28	2021-05-06 23:18:15.986646-07
29	2021-05-07 10:50:49.506883-07
30	2021-05-11 00:40:13.478333-07
31	2021-05-11 00:43:36.683957-07
32	2021-05-11 00:47:29.133588-07
33	2021-05-11 00:50:13.326113-07
34	2021-05-11 18:43:23.982918-07
35	2021-05-11 19:17:52.992902-07
36	2021-05-11 19:28:26.523962-07
37	2021-05-11 19:40:43.201066-07
38	2021-05-11 19:41:57.346018-07
39	2021-05-11 19:43:08.544825-07
40	2021-05-13 13:26:49.569805-07
41	2021-05-13 14:22:24.306308-07
42	2021-05-13 14:25:39.638392-07
43	2021-05-14 11:24:13.168644-07
44	2021-05-14 12:36:53.434468-07
45	2021-05-14 17:11:21.726113-07
46	2021-05-14 19:07:58.391276-07
47	2021-05-17 11:34:26.542993-07
48	2021-05-17 17:46:01.65888-07
49	2021-05-20 10:48:36.898985-07
50	2021-05-20 13:29:19.835201-07
51	2021-05-20 14:26:14.881248-07
52	2021-05-21 14:54:20.598029-07
53	2021-05-24 13:16:50.709445-07
54	2021-05-24 14:03:20.08317-07
55	2021-05-24 14:05:23.497584-07
56	2021-05-24 17:51:55.075605-07
57	2021-05-25 10:56:58.792521-07
58	2021-05-25 11:03:50.634431-07
59	2021-05-25 11:07:05.708606-07
60	2021-05-25 11:18:10.647543-07
61	2021-05-25 11:56:12.254654-07
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders ("orderId", "cartId", "firstName", "lastName", company, address, "aptSuite", city, state, "zipCode", phone, "cardNumber", "nameOnCard", "expDate", "securityCode", "createdAt") FROM stdin;
10	34	Phu	Trieu	\N	10321 ARUNDEL AVE	\N	WESTMINSTER	California (CA)	92683	7148044440	1234123412341234	phu	11/24	123	2021-05-11 18:44:00.831713-07
11	35	Phu	Trieu	\N	10321 ARUNDEL AVE	\N	WESTMINSTER	California (CA)	92683	7148044440	1234123412341234	phu	01/22	123	2021-05-11 19:18:33.28193-07
12	36	Phu	Trieu	\N	10321 ARUNDEL AVE	\N	WESTMINSTER	California (CA)	92683	7148044440	1234123412341234	phu	01/22	123	2021-05-11 19:40:27.549963-07
13	37	Phu	Trieu	\N	10321 ARUNDEL AVE	\N	WESTMINSTER	California (CA)	92683	7148044440	1234	phu	01/22	123	2021-05-11 19:41:00.982821-07
14	38	Phu	Trieu	\N	10321 ARUNDEL AVE	\N	WESTMINSTER	California (CA)	92683	7148044440	1234	phu	01/22	123	2021-05-11 19:42:15.747075-07
15	40	Phu	Trieu	\N	10321 ARUNDEL AVE	\N	WESTMINSTER	California (CA)	92683	7148044440	1234123412341234	Phu	01/22	123	2021-05-13 14:11:06.307026-07
16	41	Phu	Trieu	\N	10321 ARUNDEL AVE	\N	WESTMINSTER	California (CA)	92683	7148044440	123412341234134	Phu Trieu	01/22	123	2021-05-13 14:22:49.051601-07
17	43	Phu	Trieu	\N	10321 ARUNDEL AVE	\N	WESTMINSTER	California (CA)	92683	7148044440	1234	Phu Trieu	01/22	123	2021-05-14 12:33:38.670156-07
18	44	Phu	Trieu	\N	10321 ARUNDEL AVE	\N	WESTMINSTER	California (CA)	92683	7148044440	123	123	123	123	2021-05-14 12:37:10.143907-07
19	45	Phu	Trieu	\N	10321 ARUNDEL AVE	\N	WESTMINSTER	California (CA)	92683	7148044440	123	123	123	123	2021-05-14 19:07:53.735895-07
20	47	Phu	Trieu	\N	10321 ARUNDEL AVE	\N	WESTMINSTER	California (CA)	92683	7148044440	1234123412341234	Phu Trieu	01/22	123	2021-05-17 11:38:16.321197-07
21	53	Phu	Trieu	\N	10321 ARUNDEL AVE	\N	WESTMINSTER	California (CA)	92683	7148044440	123123123	Phu Trieu	01/22	123	2021-05-24 13:17:45.791594-07
22	54	Sylvie	Pham	\N	10601 Schooner Ave	\N	Garden Grove	California	92843	7145894662	123123123	Sylvie Pham	01/22	123	2021-05-24 14:04:33.35496-07
23	55	Phu	Trieu	\N	10321 ARUNDEL AVE	\N	WESTMINSTER	California (CA)	92683	7148044440	123123123	Phu Trieu	01/22	123	2021-05-24 14:05:51.957775-07
24	57	Bob	Ross	\N	123 Bob St	\N	Los Angeles	California	12345	1234567890	1234123412341234	Bob Ross	01/22	123	2021-05-25 11:02:41.895378-07
25	59	Bob 	Ross	\N	123 Bob St	\N	Los Angeles	CA	12345	1234567890	1234123412341234	Bob Ross	01/22	123	2021-05-25 11:08:45.430827-07
26	60	Phu	Trieu	\N	10321 ARUNDEL AVE	\N	WESTMINSTER	California (CA)	92683	7148044440	123	123	123	123	2021-05-25 11:25:34.085397-07
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products ("productId", name, price, image, "productType", "shortDescription", "longDescription") FROM stdin;
1	AMD Ryzen 9 5950X Vermeer 3.4GHz 16-Core AM4 Boxed Processor	79999	{images/products/AMD_Ryzen_9_5950X_1.jpg,images/products/AMD_Ryzen_9_5950X_2.jpg,images/products/AMD_Ryzen_9_5950X_3.jpg,images/products/AMD_Ryzen_9_5950X_4.jpg}	CPU	Get the high-speed gaming performance of the world's best desktop processor. Encode faster. Render faster. Iterate faster. Create more, faster with AMD Ryzen processor.	When you have the world’s most advanced processor for designers and content creators, the possibilities are endless. Whether you are designing the next skyscraper, or animating a complex character, you need a powerful processor that can handle your workflow's full spectrum of computing demands. Hands down, the AMD Ryzen 5000 Series desktop processors set the bar for performance seeking artists and engineers alike.\n\n** Specifications\n# of CPU Cores\n16\n# of Threads\n32\nBase Clock\n3.4GHz\nMax Boost Clock\nUp to 4.9GHz\nTotal L2 Cache\n8MB\nTotal L3 Cache\n64MB\nUnlocked\nYes\nCMOS\nTSMC 7nm FinFET\nPackage\nAM4\nPCI Express® Version\nPCIe 4.0\nThermal Solution (PIB)\nNot included\nDefault TDP / TDP\n105W\nMax Temps\n90°C\n*OS Support\nWindows 10 - 64-Bit Edition\nRHEL x86 64-Bit\nUbuntu x86 64-Bit\n*Operating System (OS) support will vary by manufacturer. **
2	AMD Ryzen 5 5600X Vermeer 3.7GHz 6-Core AM4 Boxed Processor with Wraith Stealth Cooler	27999	{images/products/AMD_Ryzen_5_5600X_1.jpg,images/products/AMD_Ryzen_5_5600X_2.jpg,images/products/AMD_Ryzen_5_5600X_3.jpg,images/products/AMD_Ryzen_5_5600X_4.jpg}	CPU	N/A	Get the high-speed gaming performance of the world's best desktop processor. Encode faster. Render faster. Iterate faster. Create more, faster with AMD Ryzen processor.\n\n** Specifications\n# of CPU Cores\n6\n# of Threads\n12\nBase Clock\n3.7GHz\nMax Boost Clock\nUp to 4.6GHz\nTotal L2 Cache\n3MB\nTotal L3 Cache\n32MB\nUnlocked\nYes\nCMOS\nTSMC 7nm FinFET\nPackage\nAM4\nPCI Express® Version\nPCIe 4.0\nThermal Solution (PIB)\nWraith Stealth\nDefault TDP / TDP\n65W\nMax Temps\n95°C\n*OS Support\nWindows 10 - 64-Bit Edition\nRHEL x86 64-Bit\nUbuntu x86 64-Bit\n*Operating System (OS) support will vary by manufacturer. **
3	AMD Ryzen 5 3600 Matisse 3.6GHz 6-Core AM4 Boxed Processor with Wraith Stealth Cooler	21999	{images/products/AMD_Ryzen_5_3600_1.jpg,images/products/AMD_Ryzen_5_3600_2.jpg,images/products/AMD_Ryzen_5_3600_3.jpg,images/products/AMD_Ryzen_5_3600_4.jpg}	CPU	N/A	3rd Gen AMD Ryzen processors are built using the world's most advanced 7nm manufacturing technology. Paired with Wraith coolers, AMD Ryzen processors deliver game-winning performance while keeping your system astonishingly cool and quiet. Ryzen processors neural-net intelligence can adapt to your workload. That's the advantage you gain when you own the world's most advanced processor for gaming.\n\n** Specifications\n# of CPU Cores\n6\n# of Threads\n12\nBase Clock\n3.6GHz\nMax Boost Clock\nUp to 4.2GHz\nTotal L1 Cache\n384KB\nTotal L2 Cache\n3MB\nTotal L3 Cache\n32MB\nUnlocked\nYes\nCMOS\nTSMC 7nm FinFET\nPackage\nAM4\nPCI Express® Version\nPCIe 4.0 x16\nThermal Solution (PIB)\nWraith Stealth\nThermal Solution (MPK)\nWraith Stealth\nDefault TDP / TDP\n65W\nMax Temps\n95°C\n*OS Support\nWindows 10 - 64-Bit Edition\nRHEL x86 64-Bit\nUbuntu x86 64-Bit\n*Operating System (OS) support will vary by manufacturer. ** 
4	AMD Ryzen 9 3950X Matisse 3.5GHz 16-Core AM4 Boxed Processor	67999	{images/products/AMD_Ryzen_9_3950X_1.jpg,images/products/AMD_Ryzen_9_3950X_2.jpg,images/products/AMD_Ryzen_9_3950X_3.jpg}	CPU	N/A	Experience elite performance in games, content creation, and intense multi-tasking. A beautifully balanced design for serious PC enthusiasts.\n\n** Specifications\n# of CPU Cores\n16\n# of Threads\n32\nBase Clock\n3.5GHz\nMax Boost Clock\nUp to 4.7GHz\nTotal L1 Cache\n1MB\nTotal L2 Cache\n8MB\nTotal L3 Cache\n64MB\nUnlocked\nYes\nCMOS\nTSMC 7nm FinFET\nPackage\nAM4\nPCI Express® Version\nPCIe 4.0 x16\nThermal Solution (PIB)\nCooler Not Included, Liquid Cooling Recommended\nDefault TDP / TDP\n105W\n*OS Support\nWindows 10 - 64-Bit Edition\nRHEL x86 64-Bit\nUbuntu x86 64-Bit\n*Operating System (OS) support will vary by manufacturer. **
5	AMD Ryzen Threadripper PRO 3975WX Castle Peak 3.5GHz 32 Core sWRX8 Boxed Processor\n	259999	{images/products/AMD_Ryzen_Threadripper_PRO_3975WX_1.jpg,images/products/AMD_Ryzen_Threadripper_PRO_3975WX_2.jpg,images/products/AMD_Ryzen_Threadripper_PRO_3975WX_3.jpg,images/products/AMD_Ryzen_Threadripper_PRO_3975WX_4.jpg}	CPU	N/A	Take your workstation's performance to the next level with the AMD Ryzen Threadripper PRO 3975WX 3.5 GHz 32-Core sWRX8 Processor. Built using the 7nm Zen Core architecture with the sWRX8 socket, this processor is designed to deliver exceptional performance for professionals such as artists, architects, engineers, and data scientists. Featuring 32 cores and 64 threads with a 3.5 GHz base clock frequency, a 4.2 GHz boost frequency, and 128MB of L3 cache, this processor significantly reduces rendering times for 8K videos, high-resolution photos, and 3D models. The Ryzen Threadripper PRO supports up to 128 PCI Express 4.0 lanes for high-speed throughput to compatible devices.\n\n** Specifications\n# of CPU Cores\n32\n# of Threads\n64\nBase Clock\n3.5GHz\nMax Boost Clock\nUp to 4.2GHz\nTotal L1 Cache\n2MB\nTotal L2 Cache\n16MB\nTotal L3 Cache\n128MB\nUnlocked\nNo\nCMOS\nTSMC 7nm FinFET\nPackage\nsWRX8\nSocket Count\n1P\nPCI Express® Version\nPCIe 4.0\nDefault TDP / TDP\n280W\nMax Temps\n90°C\n*OS Support\nWindows 10 - 64-Bit Edition\n*Operating System (OS) support will vary by manufacturer. **
6	Intel Core i7-10700K Comet Lake 8-Core 3.8 GHz LGA 1200 125W Desktop Processor w/ Intel UHD Graphics 630	32900	{images/products/Intel_Core_i7-10700K_1.jpg,images/products/Intel_Core_i7-10700K_2.jpg,images/products/Intel_Core_i7-10700K_3.jpg,images/products/Intel_Core_i7-10700K_4.jpg}	CPU	N/A	Intel’s tenth generation octa-core hyperthreaded i7-10700K is one of the fastest high-end desktop CPUs ever made. A simple overclock yields all 16 threads running at a staggering 5.1 GHz. Gaming and desktop performance is second only to the flagship i9-10900K. Although a new (Z490) LGA1200 motherboard is required, it will remain compatible with Rocket Lake CPUs which are due later this year. The 10700K’s $400 USD price tag puts it in a similar price band to AMD’s 12-core hyperthreaded Ryzen 9 3900X, however, the 10700K’s faster cores combined with its lower memory latency, yield a 12% effective speed advantage over the 3900X. Intra-generationally comparing the 10700K and 10600K shows that the 10600K offers almost identical gaming performance for 34% less money.\n\n** CPU Specifications\n# of Cores 8\n# of Threads 16\nProcessor Base Frequency 3.80 GHz\nMax Turbo Frequency 5.10 GHz\nCache 16 MB Intel® Smart Cache\nBus Speed 8 GT/s\nIntel® Turbo Boost Max Technology 3.0 Frequency ‡ 5.10 GHz\nIntel® Turbo Boost Technology 2.0 Frequency‡ 5.00 GHz\nTDP 125 W\nConfigurable TDP-down Frequency 3.50 GHz\nConfigurable TDP-down 95 W **
13	MSI Gaming GeForce RTX 3070 8GB GDDR6 PCI Express 4.0 Video Card RTX 3070 GAMING X TRIO and OLOy 16GB (2 x 8GB) 288-Pin DDR4 SDRAM DDR4 3600	91998	{images/products/MSI_Gaming_GeForce_RTX_3070_1.jpg,images/products/MSI_Gaming_GeForce_RTX_3070_2.jpg,images/products/MSI_Gaming_GeForce_RTX_3070_3.jpg,images/products/MSI_Gaming_GeForce_RTX_3070_4.jpg}	GPU	N/A	The GeForce RTX 3070 is powered by Ampere—NVIDIA's 2nd gen RTX architecture. Built with enhanced RT Cores and Tensor Cores, new streaming multiprocessors, and high-speed G6 memory, it gives you the power you need to rip through the most demanding games.
7	Intel Core i5-10600K Comet Lake 6-Core 4.1 GHz LGA 1200 125W BX8070110600K Desktop Processor Intel UHD Graphics 630	22299	{images/products/Intel_Core_i5-10600K_1.jpg,images/products/Intel_Core_i5-10600K_2.jpg,images/products/Intel_Core_i5-10600K_3.jpg,images/products/Intel_Core_i5-10600K_4.jpg}	CPU	N/A	Intel’s tenth gen, six-core i5-10600K is one of the fastest consumer CPUs currently available. Out of the box, its maximum all core frequency is 4.5 GHz, but a simple overclock allows all 12 threads to hit 5.0 GHz. Although a new Z490 (LGA1200) motherboard is required, Intel have indicated that LGA1200 will remain compatible with Rocket Lake CPUs which are due later this year. The eight-core Ryzen 3700X currently competes in the 10600K’s price bracket. CPU based encoding is akin to using hair clippers on a lawn but If dedicated hardware such as NVENC or QuickSync is not an option, the 3700X can outperform the 10600K in encoding workloads such as UserBenchmark 64-core, Cinebench, Blender-CPU and Handbrake-CPU. Meanwhile, the 10600K is better for almost everything else. Currently, the real problem with the 10600K, and much of the Comet Lake line up, is availability. Whilst there was a paper launch in Q2 2020, at the time of writing, the 10600K is still largely unavailable for purchase. In order to achieve better value for money, without compromising on gaming performance, it is necessary to consider the older generation 9600K which is 26% cheaper and offers similar gaming performance.\n\n** CPU Specifications\n# of Cores\n6\n\n# of Threads\n12\n\nProcessor Base Frequency\n4.10 GHz\n\nMax Turbo Frequency\n4.80 GHz\n\nCache\n12 MB Intel® Smart Cache\n\nBus Speed\n8 GT/s\n\nIntel® Turbo Boost Technology 2.0 Frequency‡\n4.80 GHz\n\nTDP\n125 W\n\nConfigurable TDP-down Frequency\n3.80 GHz\n\nConfigurable TDP-down\n95 W **
8	Intel Core i9-11900K Rocket Lake 8-Core 3.5 GHz LGA 1200 125W BX8070811900K Desktop Processor Intel UHD Graphics 750	58999	{images/products/Intel_Core_i9-11900K_1.jpg,images/products/Intel_Core_i9-11900K_2.jpg,images/products/Intel_Core_i9-11900K_3.jpg}	CPU	N/A	The i9-11900K is the fastest CPU in Intel’s 11th Gen Rocket Lake-S lineup which brings higher IPC (early samples indicate +19%) and 50% stronger integrated graphics. There are also 500 series chipset improvements including: 20 PCIe4 CPU lanes (up from 16) and USB 3.2 Gen 2x2 (20 Gbps up from 10 Gbps). Rocket Lake’s IPC uplift translates to around a 10% faster Effective Speed than both Intel's 10th Gen and AMD’s 5000 series. Despite Intel’s performance lead, AMD continues to outsell Intel. Given the scale of Intel's operation, it’s inexplicable that their marketing remains so neglected. Little effort is made to counter widespread disinformation such as: “it uses too much electricity” or the classic: “it needs more cores”. Intel’s marketing samples are routinely distributed to reviewers that appear better incentivized to bury Intel's products rather than review them. Not enabling XMP or only testing with BIOS power limits enabled is akin to leaving the handbrake on during a race. Mind-numbing “scientific” and rendering benchmarks are presented as gospel. Different games, mostly unplayed by real users, are cherry picked for each “review”. When it's convenient, canned game benchmarks are chosen such as Ulletical’s CSGO which runs at nearly double the in-game fps. Credible benchmark data, which necessarily includes replicable video footage from popular games, is the exception rather than the rule. At every release, AMD’s marketers coordinate narratives to ensure another feast of blue blubber. Nonetheless, towards the end of 2021, Intel’s Golden Cove is due to offer an additional 20-30% performance increase. At that time, with a net 30-40% performance lead, Intel will probably regain significant market share despite AMD's class-leading marketing. In the meantime, most PC gamers need look no further than the 11400F. ** CPU Specifications\n# of Cores\n8\n\n# of Threads\n16\n\nProcessor Base Frequency\n3.50 GHz\n\nMax Turbo Frequency\n5.30 GHz\n\nIntel® Thermal Velocity Boost Frequency\n5.30 GHz\n\nCache\n16 MB Intel® Smart Cache\n\nBus Speed\n8 GT/s\n\nIntel® Turbo Boost Max Technology 3.0 Frequency ‡\n5.20 GHz\n\nIntel® Turbo Boost Technology 2.0 Frequency‡\n5.10 GHz\n\nTDP\n125 W\n\nConfigurable TDP-down Frequency\n3.00 GHz\n\nConfigurable TDP-down\n95 W **
9	Intel Core i9-9900K Coffee Lake 8-Core, 16-Thread, 3.6 GHz (5.0 GHz Turbo) LGA 1151 (300 Series) 95W BX80684I99900K Desktop Processor Intel UHD Graphics 630	43799	{images/products/Intel_Core_i9-9900K_1.jpg,images/products/Intel_Core_i9-9900K_2.jpg,images/products/Intel_Core_i9-9900K_3.jpg}	CPU	N/A	The Intel i9-9900K is an 8 core, 16 thread, unlocked 9th generation Coffee Lake processor. It has a base / boost clocks of 3.6 / 4.7 GHz and a single-core boost of 5.0 GHz (the highest frequency achieved yet from this class of Intel CPU). It features 16 MB of cache, a 95W TDP and Intel UHD 630 graphics. The 9900K is compatible with the new Z390 chipset, and subject to a BIOS update, is also compatible with the older Z370 chipset. Aimed at users who do not wish to compromise, the i9-9900K offers the best gaming and desktop experience available at any price. Heavy workstation users should consider the Ryzen 9 3900X which is similarly priced. Comparing the overclocked 3900X shows that it is just 10% worse for gaming and desktop (sub octa-core) but around 40% better for 64-core computations. Gamers should consider the 9700K which offers identical overclocked gaming performance at a $100 USD discount.\n\n** CPU Specifications\n# of Cores\n8\n\n# of Threads\n16\n\nProcessor Base Frequency\n3.60 GHz\n\nMax Turbo Frequency\n5.00 GHz\n\nCache\n16 MB Intel® Smart Cache\n\nBus Speed\n8 GT/s\n\nIntel® Turbo Boost Technology 2.0 Frequency‡\n5.00 GHz\n\nTDP\n95 W **
10	Intel Core i9-10900K 10-Core 3.7 GHz LGA 1200 125W BX8070110900K Desktop Processor Intel UHD Graphics 630	56999	{images/products/Intel_Core_i9-10900K_1.jpg,images/products/Intel_Core_i9-10900K_2.jpg,images/products/Intel_Core_i9-10900K_3.jpg,images/products/Intel_Core_i9-10900K_4.jpg}	CPU	N/A	Intel’s Comet Lake flagship, the i9-10900K, is the fastest gaming and desktop CPU currently available. This ten-core hyperthreaded processor can easily be overclocked so that all twenty threads run at an eye-watering 5.2 GHz. Whilst its stellar performance is second to none, it comes with a premium price tag of $488 USD. The 10900K also requires a new (Z490) LGA1200 motherboard, which Intel has indicated will remain compatible with Rocket Lake CPUs which are due later this year. Whilst AMD’s competing $420 USD Ryzen 3900X and $675 USD Ryzen 3950X do have a greater number of cores, their lower clock speeds and higher memory latency handicap them in non-rendering use cases. Overall, the 10900K has a 16% effective speed advantage over both the 3900X and 3950X. Users that do a lot of rendering should investigate dedicated hardware encoders such as NVENC and Quick Sync as these are far more efficient than CPU based rendering. Comparing the 10900K and 10700K shows that, when paired with a 2060S, the 10700K offers comparable gaming performance for 20% less money.\n\n** CPU Specifications\n# of Cores\n10\n\n# of Threads\n20\n\nProcessor Base Frequency\n3.70 GHz\n\nMax Turbo Frequency\n5.30 GHz\n\nIntel® Thermal Velocity Boost Frequency\n5.30 GHz\n\nCache\n20 MB Intel® Smart Cache\n\nBus Speed\n8 GT/s\n\nIntel® Turbo Boost Max Technology 3.0 Frequency ‡\n5.20 GHz\n\nIntel® Turbo Boost Technology 2.0 Frequency‡\n5.10 GHz\n\nTDP\n125 W\n\nConfigurable TDP-down Frequency\n3.30 GHz\n\nConfigurable TDP-down\n95 W **
11	EVGA GeForce RTX 3060 XC BLACK GAMING, 12G-P5-3655-KR, 12GB GDDR6, Dual-Fan	34999	{images/products/EVGA_GeForce_RTX_3060_1.jpg,images/products/EVGA_GeForce_RTX_3060_2.jpg,images/products/EVGA_GeForce_RTX_3060_3.jpg,images/products/EVGA_GeForce_RTX_3060_4.jpg}	GPU	N/A	The EVGA GeForce RTX 3060 12GB provides players with the ability to vanquish 1080p and 1440p gaming, while providing a quality NVIDIA RTX experience and a myriad of productivity benefits. The card is powered by NVIDIA Ampere architecture, which doubles down on ray tracing and AI performance with enhanced RT cores, Tensor Cores, and new streaming multiprocessors. With 12GB of GDDR6 memory, high-end performance does not have to be sacrificed to find a card for gaming and everyday use. Combined with the next generation of design, cooling, and overclocking utilizing EVGA Precision X1, the EVGA GeForce RTX 3060 12GB Series redefines what it means to be built for gaming and productivity.
12	ASUS ROG STRIX GeForce RTX 3060 Ti DirectX 12 ROG-STRIX-RTX3060TI-O8G-GAMING 8GB 256-Bit GDDR6 PCI Express 4.0 HDCP Ready Video Card	66999	{images/products/STRIX_GeForce_RTX_3060_Ti_1.jpg,images/products/STRIX_GeForce_RTX_3060_Ti_2.jpg,images/products/STRIX_GeForce_RTX_3060_Ti_3.jpg,images/products/STRIX_GeForce_RTX_3060_Ti_4.jpg,images/products/STRIX_GeForce_RTX_3060_Ti_5.jpg}	GPU	N/A	From top to bottom, the ROG Strix GeForce RTX™ 3060 Ti has been radically improved to accommodate the impressive new NVIDIA Ampere architecture and to deliver the next wave of gaming performance innovation to the market. A fresh design and more metal surrounds a grouping of Axial-tech fans. Last gen’s uniform fan layout has been usurped by a new rotation scheme and specialized roles for central and auxiliary fans. Below the blades, a larger, more impressive heatsink is ready for the most demanding thermal loads. The PCB has some new tricks up its sleeves, and even the backplate has received some performance-boosting changes. You've been waiting for the latest and greatest in graphics card design - and this is it.
14	GIGABYTE GeForce RTX 3080 VISION OC 10GB Video Card, GV-N3080VISION OC-10GD	109999	{images/products/GIGABYTE_GeForce_RTX_3080_1.jpg,images/products/GIGABYTE_GeForce_RTX_3080_2.jpg,images/products/GIGABYTE_GeForce_RTX_3080_3.jpg,images/products/GIGABYTE_GeForce_RTX_3080_4.jpg}	GPU	N/A	Powerful GeForce RTX 30 VISION series accelerates your work with incredible boosts in performance. Whether you are doing VIDEO EDITING, 3D ANIMATION, PHOTOGRAPHY, GRAPHIC DESIGN, ARCHITECTURAL VISUALIZATION or BROADCASTING, it can save you a lot of time.
15	MSI Suprim GeForce RTX 3090 24GB GDDR6X Video Card RTX 3090 SUPRIM X 24G	232999	{images/products/MSI_Suprim_GeForce_RTX_3090_1.jpg,images/products/MSI_Suprim_GeForce_RTX_3090_2.jpg,images/products/MSI_Suprim_GeForce_RTX_3090_3.jpg}	GPU	N/A	The GeForce RTX™ 3090 is a big ferocious GPU (BFGPU) with TITAN class performance. It's powered by Ampere—NVIDIA's 2nd gen RTX architecture—doubling down on ray tracing and AI performance with enhanced RT Cores, Tensor Cores, and new streaming multiprocessors. Plus, it features a staggering 24 GB of G6X memory, all to deliver the ultimate gaming experience.
16	GIGABYTE Radeon RX 5500 XT OC 4G (rev. 2.0) Graphics Card, PCIe 4.0, 4GB 128-Bit GDDR6, GV-R55XTOC-4GD Video Card	55488	{images/products/GIGABYTE_Radeon_RX_5500_1.jpg,images/products/GIGABYTE_Radeon_RX_5500_2.jpg,images/products/GIGABYTE_Radeon_RX_5500_3.jpg,images/products/GIGABYTE_Radeon_RX_5500_4.jpg}	GPU	N/A	Improve your gaming performance with this Radeon RX 5500 series graphics card. Specially engineered RDNA architecture accelerates game fidelity by reducing input lag, tears and stutters during play. The multi-level cache hierarchy reduces latency and increases each game's responsiveness. The fan in this Radeon RX 5500 series graphics card features two fan-blade structures to create steady yet accelerated airflow for temperate gaming.\n
17	Sapphire NITRO+ AMD RADEON RX 6900 XT SE GAMING OC Graphics Card With 16GB GDDR6 HDMI / TRIPLE DP	245999	{images/products/RADEON_RX_6900_XT_1.jpg,images/products/RADEON_RX_6900_XT_2.jpg,images/products/RADEON_RX_6900_XT_3.jpg,images/products/RADEON_RX_6900_XT_4.jpg}	GPU	N/A	The NITRO+ AMD Radeon™ RX 6900 XT delivers powerhouse 4K gaming performance with vivid visuals for an elevated experience. The all-new innovative Wave Fin Design working in tandem with our V-Shape Fin Design for GPU Cooling reduces wind friction and centralizes airflow for optimal heat dissipation and a virtually silent system. Cutting edge Memory & VRM Cooling with Heat-Pipes and next gen K6.5 Memory Pad ensures you can push your performance to new limits while keeping the NITRO+ AMD Radeon™ RX 6900 XT components icy cool. The brand new Hybrid Fan Design combines the tranquility and strong air pressure features that exhibit ultimate levels of downward air pressure through the fan while keeping fan noise low. Incredible ARGB Lighting across the graphics card using our SAPPHIRE TriXX software fused with beautiful aesthetic styling will ensure the NITRO+ AMD Radeon™ RX 6900 XT is a stunning addition to every enthusiast gamer’s PC. NITRO Charge your PC with the NITRO+ AMD Radeon™ RX 6900 XT and elevate your gaming experience to the next level!
18	MSI Radeon RX 580 DirectX 12 RX 580 ARMOR 8G OC 8GB 256-Bit GDDR5 PCI Express x16 HDCP Ready CrossFireX Support Video Card	75999	{images/products/MSI_Radeon_RX_580_1.jpg,images/products/MSI_Radeon_RX_580_2.jpg,images/products/MSI_Radeon_RX_580_3.jpg,images/products/MSI_Radeon_RX_580_4.jpg,images/products/MSI_Radeon_RX_580_5.jpg}	GPU	N/A	Based on AMD Polaris architecture and manufactured with 14nm process, the AMD Radeon RX 580 graphics card is specced with 2304 Stream processors, 4GB/8GB GDDR5 memory and 256-bit memory bus. A performance-class graphics card, the Radeon RX 580 empowers gamers who play anything from the latest MOBAs to the most popular AAA titles in Full HD and beyond, and also delivers the power to drive you into the next level of immersion of the world of VR gaming and entertainment.\n\nThis ARMOR 8G OC edition card is turbocharged to 1366MHz Boost Clock in OC mode (1340MHz for reference card) so you can get more graphics power for your favorite titles. Its Armor 2x cooling solution is efficient and acoustics optimized, with the fan stopping at low/idle load level. And Military Class 4 components ensure unbeatable quality, reliability and durability you can count on in countless gaming hours.
19	ASUS TUF Gaming Radeon RX 6700 XT OC Edition Graphics Card (AMD RDNA 2, PCIe 4.0, 12GB GDDR6, HDMI 2.1, DisplayPort 1.4a, Dual Ball Fan Bearings, All-aluminum Shroud, Reinforced Frame, GPU Tweak II)	134998	{images/products/Radeon_RX_6700_XT_1.jpg,images/products/Radeon_RX_6700_XT_2.jpg,images/products/Radeon_RX_6700_XT_3.jpg,images/products/Radeon_RX_6700_XT_4.jpg,images/products/Radeon_RX_6700_XT_5.jpg}	GPU	N/A	The TUF GAMING Radeon™ RX 6700 XT is a tenacious beast with a tough metal exterior, super-efficient cooling, and components that offer enhanced endurance. An all-metal shroud houses three powerful axial-tech fans with dual ball fan bearings and extra blades. Under the exoskeleton, a thick heatsink keeps thermals under tight control and TUF components, selected for maximum durability and performance, keep the card ahead of the pack. You asked for a mean machine... this one is ready for action.
20	MSI GeForce RTX 2070 SUPER DirectX 12 RTX 2070 SUPER GAMING X TRIO 8GB 256-Bit GDDR6 PCI Express 3.0 x16 HDCP Ready SLI Support Video Card	159850	{images/products/MSI_GeForce_RTX_2070_SUPER_1.jpg,images/products/MSI_GeForce_RTX_2070_SUPER_2.jpg,images/products/MSI_GeForce_RTX_2070_SUPER_3.jpg,images/products/MSI_GeForce_RTX_2070_SUPER_4.jpg}	GPU	N/A	GeForce RTX is powered by NVIDIA Turing, the world's most advanced GPU architecture for gamers and creators. Get truly next-gen performance and features with dedicated AI and ray-tracing cores for the ultimate experience. The new GeForce RTX SUPER™ Series has even more cores and higher clocks, bringing you performance that's up to 25% faster than the original RTX 20 Series and 6X faster than the previous-generation 10 Series GPUs. It's time to gear up and get super powers.
21	ASUS X570 TUF Gaming Plus (WIFI) AMD AM4 ATX Motherboard	19999	{images/products/ASUS_X570_TUF_1.jpg,images/products/ASUS_X570_TUF_2.jpg,images/products/ASUS_X570_TUF_3.jpg,images/products/ASUS_X570_TUF_4.jpg,images/products/ASUS_X570_TUF_5.jpg}	Motherboards	N/A	AMD AM4 X570 ATX gaming motherboard with PCIe 4.0, dual M.2, Wi-Fi, 14 Dr. MOS power stages, HDMI, DP, SATA 6Gb/s, USB 3.2 Gen 2 and Aura Sync RGB lighting. AMD Ryzen 5000 Series Processors are compatible with AMD X570 and B550 based motherboards, which may require a BIOS update for optimal performance. Please check with your local Nano Center service department about ensuring the board is 5000 Series Ready when making your purchase\n
22	ASUS B550-F ROG Strix Gaming (WiFi) AMD AM4 ATX Motherboard	20999	{images/products/ASUS_B550-F_ROG_Strix_1.jpg,images/products/ASUS_B550-F_ROG_Strix_2.jpg,images/products/ASUS_B550-F_ROG_Strix_3.jpg,images/products/ASUS_B550-F_ROG_Strix_4.jpg,images/products/ASUS_B550-F_ROG_Strix_5.jpg}	Motherboards	N/A	ROG Strix B550 Gaming series motherboards offer a feature-set usually found in the higher-end ROG Strix X570 Gaming series, including the latest PCIe 4.0. With robust power delivery and effective cooling, ROG Strix B550 Gaming is well-equipped to handle 3rd Gen AMD Ryzen CPUs. Boasting futuristic aesthetics and intuitive ROG software, ROG Strix B550-F Gaming (Wi-Fi) gives you a head start on your dream build. AMD Ryzen 5000 Series Processors are compatible with AMD X570 and B550 based motherboards, which may require a BIOS update for optimal performance. Please check with your local Nano Center service department about ensuring the board is 5000 Series Ready when making your purchase
23	ASRock X570 Taichi AMD AM4 ATX Motherboard	29999	{images/products/ASRock_X570_Taichi_AMD_1.jpg,images/products/ASRock_X570_Taichi_AMD_2.jpg,images/products/ASRock_X570_Taichi_AMD_3.jpg,images/products/ASRock_X570_Taichi_AMD_4.jpg,images/products/ASRock_X570_Taichi_AMD_5.jpg}	Motherboards	N/A	Revolutionary X570 Motherboards: Your PC transformed! AMD Ryzen Desktop 3000 Ready. Welcome to the new Wi-Fi standard! ASRock's motherboards will be the 1st product coming with next generation Intel Wi-Fi 6 802.11ax Adapter. The speed will be working up to 2.4Gbps and it will also natively operate with both 2.4Ghz and 5Ghz simultaneously. The next generation of PCI Express 4.0 is capable of performing twice the speed compared to previous 3rd generation. AMD Ryzen 5000 Series Processors are compatible with AMD X570 and B550 based motherboards, which may require a BIOS update for optimal performance. Please check with your local Nano Center service department about ensuring the board is 5000 Series Ready when making your purchase
24	Gigabyte Aorus Elite WiFi X570 AMD AM4 ATX Motherboard	21999	{images/products/Gigabyte_Aorus_Elite_1.jpg,images/products/Gigabyte_Aorus_Elite_2.jpg,images/products/Gigabyte_Aorus_Elite_3.jpg,images/products/Gigabyte_Aorus_Elite_4.jpg}	Motherboards	N/A	In the dark, starless night, the falcon strikes fear into the heart of its prey. Even with minimal visibility, the falcon pinpoints its prey and patiently anticipates the perfect moment to swoop in for the kill. The falcon with its laser sharp gaze dominates the darkness of night in the same manner that AORUS Core Lighting illuminates the vast AORUS ecosystem.
25	MSI X570 MPG Gaming Edge WiFi AMD AM4 ATX Motherboard	26999	{images/products/MSI_X570_MPG_1.jpg,images/products/MSI_X570_MPG_2.jpg,images/products/MSI_X570_MPG_3.jpg,images/products/MSI_X570_MPG_4.jpg}	Motherboards	N/A	Supports 2nd and 3rd Gen AMD Ryzen / Ryzen with Radeon Vega Graphics Desktop Processors for AM4 socket Supports DDR4 Memory Lightning Fast Game experience: PCIe 4.0: Lightning Gen4 x4 M.2 with M.2 Shield Frozr: StoreMI: AMD Turbo USB 3.2 GEN2 Frozr Heatsink Design: Designed with the patented fan and double ball bearings to provide the best performance for enthusiast gamers and prosumers. Set Core Power Free: Extended Heatsink Design: Core Boost: Digital PWM IC: 8 4 pin CPU power connector: Game Boost: DDR4 Boost MYSTIC LIGHT: 16.8 million colors / 29 effects controlled in one click. MYSTIC LIGHT EXTENSION supports both RGB and RAINBOW LED strip. AUDIO BOOST 4 with NAHIMIC 3: Reward your ears with studio grade sound quality for the most immersive gaming experience Dragon Center: A brand new software which integrates all MSI tools like GAME MODE: VOICE BOOST: LIVE UPDATE: AMBIENT LINK with user friendly user interface.
26	ASUS Z490-A Prime Intel LGA 1200 ATX Motherboard	24999	{images/products/ASUS_Z490-A_1.jpg,images/products/ASUS_Z490-A_2.jpg,images/products/ASUS_Z490-A_3.jpg,images/products/ASUS_Z490-A_4.jpg,images/products/ASUS_Z490-A_5.jpg}	Motherboards	N/A	ASUS Prime series is expertly engineered to unleash the full potential of 10th Gen Intel Core processors. Boasting a robust power design, comprehensive cooling solutions and intelligent tuning options, Prime Z490 series motherboards provide daily users and DIY PC builders a range of performance tuning options via intuitive software and firmware features.
27	ASUS Z390-P Prime Intel LGA 1151 ATX Motherboard	13499	{images/products/ASUS_Z390-P_1.jpg,images/products/ASUS_Z390-P_2.jpg,images/products/ASUS_Z390-P_3.jpg,images/products/ASUS_Z390-P_4.jpg,images/products/ASUS_Z390-P_5.jpg}	Motherboards	N/A	Dressed in professional attire, the Prime Z390 series caters to daily users and content creators with well-rounded specs and features. Combining the benefits of the latest processors with essential ASUS design and engineering, Prime Z390 provides a wealth of options for performance tuning via intuitive software and firmware features.
28	MSI Z490 MPG Gaming Edge (WiFi) Intel LGA 1200 ATX Motherboard	22999	{images/products/MSI_Z490_MPG_1.jpg,images/products/MSI_Z490_MPG_2.jpg,images/products/MSI_Z490_MPG_3.jpg,images/products/MSI_Z490_MPG_4.jpg}	Motherboards	N/A	The MPG series brings out the best in gamers by allowing full expression in color with advanced RGB lighting control and synchronization. Experiment on another level of personalization with a front LED strip that provides convenient in-game and real time notifications. With the MPG series, transform your equipment into the center of attention and top leaderboards in style.
29	Gigabyte Z590 VISION G Intel LGA 1200 ATX Motherboard	27999	{images/products/Gigabyte_Z590_VISION_1.jpg,images/products/Gigabyte_Z590_VISION_2.jpg,images/products/Gigabyte_Z590_VISION_3.jpg,images/products/Gigabyte_Z590_VISION_4.jpg,images/products/Gigabyte_Z590_VISION_5.jpg}	Motherboards	N/A	VISION Series motherboards are built for creator pc. It featured with reliable performance, impressive connectivity, expandable on graphics, and ultra-fast storage for creators to deal with heavy design workloads such as video editing and 3D rendering. It's the perfect fit for DIY creators to build their own ideal machine.
30	ASRock Z590M PRO4 Intel LGA 1200 microATX Motherboard	17999	{images/products/ASRock_Z590M_PRO4_1.jpg,images/products/ASRock_Z590M_PRO4_2.jpg,images/products/ASRock_Z590M_PRO4_3.jpg,images/products/ASRock_Z590M_PRO4_4.jpg}	Motherboards	N/A	Dr.MOS is the integrated power stage solution which is optimized for synchronous buck-set down voltage applications! Compared to traditional discrete MOSFETs, it intelligently delivers higher current for each phase, thus providing improved thermal result and superior performance.
31	EVGA SuperNOVA 850 GA 850 Watt 80 Plus Gold ATX Fully Modular Power Supply	15499	{images/products/EVGA_SuperNOVA_850_1.jpg,images/products/EVGA_SuperNOVA_850_2.jpg,images/products/EVGA_SuperNOVA_850_3.jpg,images/products/EVGA_SuperNOVA_850_4.jpg}	Power	N/A	Introducing the EVGA SuperNOVA GA Series of power supplies - the newest addition to the outstanding line of EVGA Power Supplies. Featuring 80 Plus Gold certification, 100% Japanese capacitors, a durable double-ball bearing fan, and a fully modular design, this power supply is built for long-term usage and durability. Building upon EVGA's line of 80 Plus Gold rated power supplies, the EVGA GA Series combines all these features at a great price.
32	EVGA SuperNOVA 750 GT 750 Watt 80 Plus Gold ATX Fully Modular Power Supply	14999	{images/products/EVGA_SuperNOVA_750_1.jpg,images/products/EVGA_SuperNOVA_750_2.jpg,images/products/EVGA_SuperNOVA_750_3.jpg,images/products/EVGA_SuperNOVA_750_4.jpg}	Power	N/A	Introducing the EVGA SuperNOVA GT Series of power supplies - the newest addition to the outstanding line of EVGA Power Supplies. Featuring 80 Plus Gold certification, 100% Japanese capacitors, a fluid dynamic bearing fan, and a fully modular design, this power supply is built for long-term usage and durability. Building upon EVGA's line of 80 Plus Gold rated power supplies, the EVGA GT Series combines all these features at a great price.
33	Corsair RM850 850 Watt 80 Plus Gold ATX Fully Modular Power Supply	15999	{images/products/Corsair_RM850_850_1.jpg,images/products/Corsair_RM850_850_2.jpg,images/products/Corsair_RM850_850_3.jpg,images/products/Corsair_RM850_850_4.jpg,images/products/Corsair_RM850_850_5.jpg}	Power	N/A	CORSAIR RM Series power supplies are built with the highest quality components to deliver 80 PLUS Gold efficient power to your PC. RM PSUs utilize industrial-grade, 105C-rated capacitors for superb performance and reliability, backed by a ten-year warranty. Wake your computer faster and consume less power with support for the new Microsoft Modern Standby sleep mode. Zero RPM mode ensures virtually silent operation at low and medium loads. Fully modular cables make PC builds and upgrades easy, as you need only connect the cables your system requires. SLI Ready for multiple GPUs, an RMx PSU is quiet, efficient and dependable enough to power your high-performance PC for years to come.
34	PowerSpec 650W Power Supply Semi-Modular 80 Plus Bronze Certified ATX Active PFC SLI Crossfire Ready Gaming PC Computer Switching PSU	6499	{images/products/PowerSpec_650W_Power_Supply_1.jpg,images/products/PowerSpec_650W_Power_Supply_2.jpg,images/products/PowerSpec_650W_Power_Supply_3.jpg}	Power	N/A	PowerSpec power supplies provide the ideal balance of price and performance. The PS 650BSM provides 650W of continuous power. Rated 80+ Bronze for greater than 82% efficiency. Semi-Modular cables for flexibility that are fully sleeved. Includes a 135mm fan for quiet operation. Full 5 year warranty included.\n\nSTABILITY: This power supply features 650W of output power, adopts active PFC design with a single +12V output rail providing strong and stable power to computers. It complies with Intel ATX 12V standards. The sufficient and stable current fully supports SLI & CrossFire Systems.\nUL & 80+ BRONZE CERTIFIED: The PowerSpec semi-modular power supply has an 80 Plus Bronze and UL certification. 80+ Bronze boasts an 85% minimum efficiency at 50% load. This power supply is also certified by nationally recognized Underwriters Laboratories for various safety and sustainability tests.\nQUIET & COOL: The high-flow, low-noise 135mm diameter fan efficiently cools. This solves potential thermal and noise problems for your computer power supply. Our high-performance power supply produces less heat, resulting in lower energy consumption and operating cost.\nMAXIMUM SAFETY: Universal AC 115-230V / 10A input with 50-60Hz frequency for wide-ranging use, protect your components and data from unexpected unstable voltage damage. Heavy-duty protections, including OVP, UVP, OPP, SCP.\nDURABLE AND RELIABLE: These premium Japanese capacitors ensure a longer lifespan and eliminate explosion & electrolyte leakage issues. Purchase this power supply from a brand you trust. PowerSpec by Micro Center provides a 5-year limited warranty and outstanding customer service support.
35	Corsair RM750 750 Watt 80 Plus Gold ATX Fully Modular Power Supply	13999	{images/products/Corsair_RM750_750_1.jpg,images/products/Corsair_RM750_750_2.jpg,images/products/Corsair_RM750_750_3.jpg,images/products/Corsair_RM750_750_4.jpg,images/products/Corsair_RM750_750_5.jpg}	Power	N/A	Modern Standby is a upcoming feature for Windows 10 that vastly improves your PC's sleep and wake functionality. The technology allows your system to wake from sleep more than twice as fast, as well as maintain a network connection during sleep to continue downloading updates and receive emails and notifications - just like your phone. Best of all, it does this with less overall power consumption.
36	EVGA SuperNOVA 650 GT 650 Watt 80 Plus Gold ATX Fully Modular Power Supply	13999	{images/products/EVGA_SuperNOVA_650_1.jpg,images/products/EVGA_SuperNOVA_650_2.jpg,images/products/EVGA_SuperNOVA_650_3.jpg,images/products/EVGA_SuperNOVA_650_4.jpg}	Power	N/A	Introducing the EVGA SuperNOVA GT Series of power supplies - the newest addition to the outstanding line of EVGA Power Supplies. Featuring 80 Plus Gold certification, 100% Japanese capacitors, a fluid dynamic bearing fan, and a fully modular design, this power supply is built for long-term usage and durability. Building upon EVGA's line of 80 Plus Gold rated power supplies, the EVGA GT Series combines all these features at a great price.
37	Corsair RM850x 850 Watt 80 Plus Gold ATX Fully Modular Power Supply 2018	17999	{images/products/Corsair_RM850x_850_1.jpg,images/products/Corsair_RM850x_850_2.jpg,images/products/Corsair_RM850x_850_3.jpg,images/products/Corsair_RM850x_850_4.jpg,images/products/Corsair_RM850x_850_5.jpg}	Power	N/A	Corsair RMx series power supplies give you extremely tight voltage control, quiet operation, Gold-certified efficiency, and a fully modular cable set. Built with all Japanese 105C capacitors, theyre a great choice for high performance PCs where reliability is essential. 80 PLUS Gold efficiency reduces operating cost and excess heat, and Zero RPM fan mode ensures virtual silence at low and medium loads. And, the fully modular DC cables make builds and upgrades easy, with clean, great-looking results.
47	Corsair Vengeance LPX 32GB (2 x 16GB) DDR4-3200 PC4-25600 CL16 Dual Channel Desktop Memory Kit CMK32GX4M2E3200 - Black	19999	{images/products/Corsair_Vengeance_LPX_32GB_1.jpg,images/products/Corsair_Vengeance_LPX_32GB_2.jpg,images/products/Corsair_Vengeance_LPX_32GB_3.jpg}	Memory	N/A	The VENGEANCE LPX DDR4 memory is designed for gamers and DIY enthusiasts seeking a compact performance memory solution. Equipped with an eight-layer PCB, highly-screened memory ICs, and efficient aluminum heat spreader, the VENGEANCE LPX DDR4 memory runs extremely fast on various motherboards and keeps high temperature at bay for superior overclocking headroom. Overclocking is safe and totally hassle-free, thanks to support for XMP 2.0. Choose from four colors and outshine your competitors.
38	MAINGEAR IGNITION 1200 Watt 80 Plus Platinum ATX Fully Modular Power Supply	24999	{images/products/MAINGEAR_IGNITION_1200_Watt_1.jpg,images/products/MAINGEAR_IGNITION_1200_Watt_2.jpg,images/products/MAINGEAR_IGNITION_1200_Watt_3.jpg,images/products/MAINGEAR_IGNITION_1200_Watt_4.jpg}	Power	N/A	Made for gamers with an aggressive design and replaceable side decals to personalize the look of your system. A massive 100 Amp single rail designed with power hungry GPUs in mind and consistently provides reliable power even during heavy conditions. Run your PC in complete silence with ECO Mode, which deactivates the fan until a higher load and temperature is achieved. 80 PLUS Platinum Certified: The 80 PLUS Platinum certified power supply provides ultra-high power efficiency with 92% or higher under typical loads, saving your money on your electrical bill, reducing heat in your computer's system and prolonging its life. Comprehensive Protection: Over Current/Voltage/Power/Temperature Protection, Under Voltage Protection, and Short Circuit Protection provide maximum safety to your critical system components. Fully Modular Cable Design: The fully modular cable design allows use of only the cables you need for reduced system clutter and improved air flow. Flexible cables to provide easy cable routing. Powerful single rail +12V output. Assembled with tier 1 Japanese brand capacitors, active clamp and DC to DC converter design to improve output voltage stability. Tight Regulation: Voltage fluctuation will be at its minimum. Power output will be clean with low electrical ripple and noise. All power ports will offer robust power for easy overclocking. Replaceable Side Decals for a personalized look. Server grade design: copper bars are used to join component boards to the main board for increased efficiency. Active PFC > 99%: Active PFC reduces reactive power, which reduces the cost of electricity and distributes power efficiently to all components connected to the PSU. Quiet and long-lasting 135mm Fluid Dynamic Bearing cooling fan: the long-life 135mm Fluid Dynamic Bearing fan will keep your PSU running cool and effective while staying whisper quiet. ECO mode fan switch for silent operation: Run your PC in complete silence with ECO mode, which deactivates the fan until a higher load and temperature threshold is achieved.
39	EVGA 750 BQ 750 Watt 80 Plus Bronze Semi-Modular ATX Power Supply	8999	{images/products/EVGA_750_BQ_1.jpg,images/products/EVGA_750_BQ_2.jpg,images/products/EVGA_750_BQ_3.jpg,images/products/EVGA_750_BQ_4.jpg,images/products/EVGA_750_BQ_5.jpg}	Power	N/A	Introducing the next generation in value; the EVGA BQ Series. These power supplies take some of the best features from EVGA's award winning power supply lineup, like a 140mm fan with near silent operation and modular cables to make one of the best values today in high performance power supplies.
40	Seasonic USA FOCUS GX-750, 750W 80+ Gold, Full-Modular, Fan Control in Fanless, Silent, and Cooling Mode	13999	{images/products/Seasonic_USA_FOCUS_GX-750_1.jpg,images/products/Seasonic_USA_FOCUS_GX-750_2.jpg,images/products/Seasonic_USA_FOCUS_GX-750_3.jpg,images/products/Seasonic_USA_FOCUS_GX-750_4.jpg,images/products/Seasonic_USA_FOCUS_GX-750_5.jpg}	Power	N/A	The newly upgraded FOCUS GX series is the successor to the FOCUS PLUS Series in 80 PLUS Gold efficiency ratings, which became an instant the top seller in the power supply market after its launch, Seasonic engineers have made improvements on the popular series, removing the inline capacitors on the supplied cables. Besides the small change in the series naming, the PSU housing and its packaging are also updated to be in line with the concept of the OneSeasonic Initiative. Seasonic implements modern design and shows outstanding electrical performance with our new FOCUS GX.
41	Crucial Ballistix Gaming 32GB (2 x 16GB) DDR4-3200 PC4-25600 CL16 Dual Channel Desktop Memory Kit BL2K16G32C16U4B- Black	17999	{images/products/Crucial_Ballistix_Gaming_32GB_1.jpg,images/products/Crucial_Ballistix_Gaming_32GB_2.jpg}	Memory	N/A	Crucial Ballistix gaming memory is designed for high-performance overclocking and is ideal for gamers and performance enthusiasts looking to push beyond standard limits. With hundreds of awards, multiple esport championships, and numerous overclocking world records under its belt, Crucial Ballistix sets the standard for performance.
42	G.Skill Ripjaws V 16GB (2 x 8GB) DDR4-3200 PC4-25600 CL16 Dual Channel Desktop Memory Kit F4-3200C16D-16GVKB - Black	8899	{images/products/G.Skill_Ripjaws_V_16GB_1.jpg,images/products/G.Skill_Ripjaws_V_16GB_2.jpg}	Memory	N/A	High performance dual-channel DDR4 memory designed for maximum compatibility and cutting-edge performance with the latest Intel Core processors. Built with the finest components, tested under the most rigorous conditions, the 16GB 3200MHz Kit is the perfect choice for building a new performance system or for a simple memory upgrade.
43	G.Skill Ripjaws V 32GB (2 x 16GB) DDR4-3200 PC4-25600 CL16 Dual Channel Desktop Memory Kit F4-3200C16D-32G - Black	17099	{images/products/G.Skill_Ripjaws_V_32GB_1.jpg,images/products/G.Skill_Ripjaws_V_32GB_2.jpg}	Memory	N/A	G.SKILL Ripjaws V series high performance memory is built with the newest DDR4 standard in a sleek, redesigned heat spreader thats ideal for powerful gaming rigs, professional workstations, or daily computing tasks. Tested under G.SKILLs extensivesuite of testing software to ensure maximum performance and stability, Ripjaws Vmemory kits are the ideal choice for your new DDR4 system.
44	Crucial Ballistix RGB 16GB (2 x 8GB) DDR4-3600 PC4-28800 CL16 Dual Channel Desktop Memory Kit - Black	10999	{images/products/Crucial_Ballistix_RGB_16GB_1.jpg,images/products/Crucial_Ballistix_RGB_16GB_2.jpg}	Memory	N/A	Anodized aluminum heat spreader available in black, white, or red. Low-profile form factor is ideal for smaller or space-limited rigs. Low-profile form factor, ideal for smaller rigs. Customize your rigs color scheme with 16 RGB LEDs in 8 zones on each Crucial Ballistix RGB module.
45	Corsair Vengeance RGB Pro 16GB (2 x 8GB) DDR4-3200 PC4-25600 CL16 Dual Channel Desktop Memory Kit 16GX4M2C320C16W - White	11999	{images/products/Corsair_Vengeance_RGB_Pro_16GB_1.jpg,images/products/Corsair_Vengeance_RGB_Pro_16GB_2.jpg}	Memory	N/A	VENGEANCE RGB PRO Series DDR4 overclocked memory lights up your PC with mesmerizing dynamic multi-zone RGB lighting, while delivering the best in DDR4 performance. Powerful CORSAIR iCUE software brings your system to life with dynamic RGB lighting control, synchronized across all your iCUE compatible products, including memory, fans, RGB LED light strips, keyboards, mice and more.
46	G.Skill Trident Z Neo Series RGB 32GB (2 x 16GB) DDR4-3600 PC4-28800 CL16 Dual Channel Memory Kit F4-3600C16D-32GTZNC - Black	24499	{images/products/G.Skill_Trident_Z_Neo_Series_1.jpg,images/products/G.Skill_Trident_Z_Neo_Series_2.jpg}	Memory	N/A	Engineered and optimized for full compatibility on the latest AMD Ryzen 3000 series processors on AMD X570 chipset motherboards, Trident Z Neo brings unparalleled memory performance and vibrant RGB lighting to any gaming PC or workstation with AMD Ryzen 3000 CPUs and AMD X570 motherboards. Uniquely designed with a contrast of black brushed aluminum and powder-coated silver, as well as a sleek beveled edge along the tri-fin heatspreader, the Trident Z Neo dual-toned design adds boldness to your next-gen build.
48	Crucial Ballistix Gaming 16GB (2 x 8GB) DDR4-3600 PC4-28800 CL16 Dual Channel Desktop Memory Kit BL2K8G36C16U4W - White	9999	{images/products/Crucial_Ballistix_Gaming_16GB_1.jpg,images/products/Crucial_Ballistix_Gaming_16GB_2.jpg}	Memory	N/A	Crucial Ballistix gaming memory is designed for high-performance overclocking and is ideal for gamers and performance enthusiasts looking to push beyond standard limits. With hundreds of awards, multiple esport championships, and numerous overclocking world records under its belt, Crucial Ballistix sets the standard for performance.
49	Corsair DOMINATOR PLATINUM RGB AMD Optimized 32GB (2 x 16GB) DDR4-3200 PC4-25600 CL16 Quad Channel Desktop Memory Kit CMT32GX4M2E3200 - Black	22999	{images/products/Corsair_DOMINATOR_PLATINUM_RGB_1.jpg,images/products/Corsair_DOMINATOR_PLATINUM_RGB_2.jpg,images/products/Corsair_DOMINATOR_PLATINUM_RGB_3.jpg}	Memory	N/A	CORSAIR DOMINATOR PLATINUM RGB DDR4 Memory redefines premium DDR4 memory, with timeless iconic design, superior craftsmanship and aluminum construction thats built to last. Powered by tightly-screened high-frequency memory chips, DOMINATOR PLATINUM RGB ensures high frequency performance with generous room for overclocking thanks to a custom PCB cooled by CORSAIRS patented DHX cooling technology. Use CORSAIR iCUE software to customize virtually limitless lighting effects from 12 ultrabright, individually addressable RGB LEDs, and stay informed with real-time frequency and temperature monitoring. Complete with wide compatibility with the latest motherboards, Intel XMP 2.0 support for simple setup, and a limited lifetime warranty, this is DDR4 memory in a class of its own.
50	Crucial Ballistix Gaming RGB 16GB (2 x 8GB) DDR4-3200 PC4-25600 CL16 Dual Channel Desktop Memory Kit BL2K8G32C16U4WL - White	9999	{images/products/Crucial_Ballistix_Gaming_RGB_16GB_1.jpg,images/products/Crucial_Ballistix_Gaming_RGB_16GB_2.jpg}	Memory	N/A	Crucial Ballistix gaming memory is designed for high-performance overclocking and is ideal for gamers and performance enthusiasts looking to push beyond standard limits. With hundreds of awards, multiple esport championships, and numerous overclocking world records under its belt, Crucial Ballistix sets the standard for performance.
51	Corsair LL120 RGB Hydraulic Bearing 120mm Case Fan with Lighting Node Pro - Triple Pack	12999	{images/products/Corsair_LL120_RGB_1.jpg,images/products/Corsair_LL120_RGB_2.jpg}	Cooling	N/A	Made for those seeking excellent airflow, quiet operation, and powerful lighting, the CORSAIR LL120 RGB fan puts your PC back in the loop. The CORSAIR LL120 RGB LED PWM fan boasts 16 independent RGB LEDs across two separate light loops to create vibrant lighting and visual effects.
52	Bitspower Touchaqua Notos O RGB Hydro Bearing 120mm Case Fan - 5 Pack	6999	{images/products/Bitspower_Touchaqua_Notos_1.jpg,images/products/Bitspower_Touchaqua_Notos_2.jpg,images/products/Bitspower_Touchaqua_Notos_3.jpg}	Cooling	N/A	The Notos 120 DRGB Fan has been uniquely designed by Bitspower Touchaqua to provide the most efficient cooling at a fantastic price. With a maximum speed rate of 1800RPM, which can be adjusted via the supported PWM, the 120x120x25mm fan is well suited to be paired with our radiators for efficient cooling. Equipped with vibration cancellation rubber pads on all four corners, rattling noises will be a thing of the past while you game, stream, watch a movie, or work. RGB enthusiasts will be pleased to know that the Notos 120 DRGB Fan features digital RGB LEDs around the center shaft, providing stunning lighting effects. In addition to being able to "daisy chain" the RGB interface of your fans, Bitspower Touchaqua has also had the product certified by ASUS AURA Sync, GIGABYTE RGB Fusion, MSI Mystic Light Sync, ASRock Polychrome, and Razer Chroma to ensure fully synchronized lighting of your system.
53	Lian Li UNI SL140 RGB Fluid Dynamic Bearing 140mm Case Fan - Black Two Pack	7999	{images/products/Lian_Li_UNI_SL140_1.jpg,images/products/Lian_Li_UNI_SL140_2.jpg,images/products/Lian_Li_UNI_SL140_3.jpg}	Cooling	N/A	A modular approach to fan design to enhance the user experience and to create a cable-free, hassle-free, and easier assembly process. Each UNI FAN features a cable module with a PIN-to-PIN contact point to receive power and signal. Each cable module can support up to 4 UNI FAN SL140s, allowing users to choose to use either a single fan or up to 4 fans in one go.
54	Cooler Master Hyper 212 Black Universal CPU Cooler	4999	{images/products/Cooler_Master_Hyper_212_1.jpg,images/products/Cooler_Master_Hyper_212_2.jpg,images/products/Cooler_Master_Hyper_212_3.jpg,images/products/Cooler_Master_Hyper_212_4.jpg}	Cooling	N/A	Anodized gun-metal black with brushed aluminum surface finish to the top cover for a more refined look. Stacked fin array ensures least airflow resistance which allows cooler air flow into the heatsink. The nickel plated jet black also enhances radiation cooling performance.
55	Noctua NH-D15S CPU Cooler	10999	{images/products/Noctua_NH-D15S_CPU_Cooler_1.jpg,images/products/Noctua_NH-D15S_CPU_Cooler_2.jpg,images/products/Noctua_NH-D15S_CPU_Cooler_3.jpg}	Cooling	N/A	Tailored to provide superior RAM and PCIe compatibility, the NH-D15S is an asymmetrical single fan version of Noctuas award-winning flagship model, the NH-D15. Thanks to its asymmetrical design, the NH-D15S clears the top PCIe slot on most ATX and ATX motherboards.
56	Thermaltake UX200 ARGB Lighting CPU Cooler	4499	{images/products/Thermaltake_UX200_ARGB_1.jpg,images/products/Thermaltake_UX200_ARGB_2.jpg,images/products/Thermaltake_UX200_ARGB_3.jpg,images/products/Thermaltake_UX200_ARGB_4.jpg}	Cooling	N/A	Armed with high air flow blades, U-shaped copper heatpipes and aluminum heatsink, the Thermaltake UX200 keeps your CPU cool under intensive workloads. Addressable LEDs around the fan frame support 16.8 million colors and deliver dynamic lighting effects that can be synchronized with motherboard software. The included mounting kit makes for hassle-free installation with mainstream Intel and AMD sockets.
57	NZXT Kraken Z73 360mm CPU Water Cooling Kit w/ LCD Display	29999	{images/products/NZXT_Kraken_Z73_1.jpg,images/products/NZXT_Kraken_Z73_2.jpg,images/products/NZXT_Kraken_Z73_3.jpg,images/products/NZXT_Kraken_Z73_4.jpg,images/products/NZXT_Kraken_Z73_5.jpg}	Cooling	N/A	The all-new Kraken Z Series lets you personalize your all-in-one liquid cooler like never before. Through CAMs unique software interface, you can do more than simply fine-tune settings; you can now display your favorite animated gifs or CAM system information, allowing for total customization. Backed by a 6-year warranty, the Kraken Z series provides superior performance in liquid cooling, simple installation, and a look that is uniquely your own.
58	Lian Li Galahad 360mm RGB Water Cooling Kit - White	15999	{images/products/Lian_Li_Galahad_1.jpg,images/products/Lian_Li_Galahad_2.jpg,images/products/Lian_Li_Galahad_3.jpg}	Cooling	N/A	The 47 addressable RGB LEDs embedded in the GALAHAD 360 (35 LEDs in the GALAHAD 240) ensures brighter and complex lighting effects. The GALAHAD AIO is compatible with most mainstream motherboard software, allowing users to create a synchronized system with ease.
59	Cooler Master MasterLiquid ML240L RGB V2 240mm Water Cooling Kit	8499	{images/products/Cooler_Master_MasterLiquid_1.jpg,images/products/Cooler_Master_MasterLiquid_2.jpg,images/products/Cooler_Master_MasterLiquid_3.jpg,images/products/Cooler_Master_MasterLiquid_4.jpg}	Cooling	N/A	CoolerMaster has improved every aspect of the original MasterLiquid ML240L RGB liquid CPU cooler. Engineered with new generation pump, new SickleFlow 120 RGB fans, reinforced sealing and enlarged contact area, the all-new MasterLiquid ML240L RGB V2 runs even quieter with higher cooling performance on offer.
60	Corsair H150i Pro XT 360mm RGB Water Cooling Kit	17999	{images/products/Corsair_H150i_Pro_1.jpg,images/products/Corsair_H150i_Pro_2.jpg,images/products/Corsair_H150i_Pro_3.jpg}	Cooling	N/A	The CORSAIR iCUE H150i RGB PRO XT is an all-in-one liquid CPU cooler built for both low noise operation and extreme CPU cooling, with a 360mm radiator and three CORSAIR ML120 PWM fans controllable between 400 RPM and 2,400 RPM. Equipped with 16 individually addressable RGB LEDs on the pump head, the H150i RGB PRO XT is customizable through CORSAIR iCUE software, letting you create vivid lighting effects, adjust fan speeds, and enable Zero RPM mode to keep the noise down at low temperatures. With a thermally optimized cold plate and low-noise pump design, along with easy installation on most major CPU sockets, the H150i RGB PRO XT pairs killer looks with chiller performance.
61	Seagate BarraCuda 4TB 5400RPM SATA III 6Gb/s 3.5" Internal Hard Drive	8499	{images/products/Seagate_BarraCuda_4TB_1.jpg,images/products/Seagate_BarraCuda_4TB_2.jpg,images/products/Seagate_BarraCuda_4TB_3.jpg,images/products/Seagate_BarraCuda_4TB_4.jpg}	Storage	N/A	Versatile and dependable, Seagates fierce new BarraCuda drives are inspired by the past but ready for the future. BarraCuda drives are a cost-effective way to handle all your PC needs; working, playing storing your movies and music, and more.
62	Toshiba X300 4TB 7200RPM SATA III 6Gb/s 3.5" Internal Hard Drive	10499	{images/products/Toshiba_X300_4TB_1.jpg,images/products/Toshiba_X300_4TB_2.jpg,images/products/Toshiba_X300_4TB_3.jpg,images/products/Toshiba_X300_4TB_4.jpg,images/products/Toshiba_X300_4TB_5.jpg}	Storage	N/A	Toshibas X300 Desktop internal hard drives provide a convenient and reliable way to upgrade every major brand of desktop computer. We combine our reliable hard drive technology with a Serial ATA interface for increased performance, capacity and compatibility. Compatible with every major brand of Serial ATA enabled desktop computer, our hard drives use state of the art Perpendicular Magnetic Recording (PMR) technology, Native Command Queuing (NCQ) and TMR Head Recording technology for increased capacity, reliability and performance.
63	Toshiba N300 6TB 7200RPM SATA III 6Gb/s 3.5" Internal NAS Hard Drive	17499	{images/products/Toshiba_N300_6TB_1.jpg,images/products/Toshiba_N300_6TB_2.jpg,images/products/Toshiba_N300_6TB_3.jpg,images/products/Toshiba_N300_6TB_4.jpg}	Storage	N/A	Toshibas N300 3.5-inch NAS internal hard drive is designed to meet the reliability, performance, endurance, and scalability requirements of 24/7 network attached storage application for personal, home office and small business use.
64	Seagate 1TB USB USB 3.1 (Gen 1 Type-A) 2.5" Portable External Hard Drive - Black	4999	{images/products/Seagate_1TB_USB_1.jpg,images/products/Seagate_1TB_USB_2.jpg,images/products/Seagate_1TB_USB_3.jpg,images/products/Seagate_1TB_USB_4.jpg}	Storage	N/A	Take on your day with simple, reliable backup. Simple, compact, and PC compatible, Seagate Basic portable drive gives you additional on-the-go storage and lets you take along large files when you travel. Setup for PC is simple; simply connect the included USB cable and you are ready to go. The drive is powered from the USB cable, so there is no need for an external power supply. Plus, it is automatically recognized by the Windows operating system, so there is no software to install and nothing to configure. Just connect and take advantage of the fast data transfer speeds with the USB 3.1 (Gen 1 Type-A) interface by connecting to a USB 3.1 (Gen 1 Type-A) port. Transfer files fast with USB 3.0 that is backward compatible with USB 2.0.
65	LaCie Rugged 5TB USB-C External Hard Drive	16999	{images/products/LaCie_Rugged_5TB_1.jpg,images/products/LaCie_Rugged_5TB_2.jpg,images/products/LaCie_Rugged_5TB_3.jpg,images/products/LaCie_Rugged_5TB_4.jpg}	Storage	N/A	With a capacity of 5TB, the Rugged USB Type-C External Hard Drive from LaCie marries a USB Type-C interface and data transfer speeds of up to 130 MB/s with rugged durability that provides a drop resistance of up to 4', crush resistance of up to 1 ton, and rain resistance, making this drive suitable for all-terrain storage, whether you're in the field or in your home. It can be used to store large Lightroom libraries, as a shuttle drive to transport footage from a set to a post-production house, or just for general tasks. If you're concerned about unauthorized data breaches, encryption is available. Includes 2-Years Data Recovery Services
66	WD Elements 2TB USB 3.1 (Gen 1 Type-A) 2.5" Portable External Hard Drive - Black	6999	{images/products/WD_Elements_2TB_1.jpg,images/products/WD_Elements_2TB_2.jpg,images/products/WD_Elements_2TB_3.jpg,images/products/WD_Elements_2TB_4.jpg,images/products/WD_Elements_2TB_5.jpg}	Storage	N/A	WD Elements portable hard drives with USB 3.1 Gen 1 offer reliable, high-capacity storage to go, fast data transfer rates and universal connectivity with USB 2.0 and USB 3.1 Gen 1 devices. The small, lightweight enclosure features massive capacity and WD quality and reliability. It includes a free trial of WD SmarWare Pro for local and cloud backup.
67	Samsung 980 Pro SSD 2TB (MZ-V8P2T0B/AM) - M.2 NVMe Interface PCIe Gen 4x4 Internal Solid State Drive with V-NAND 3 bit MLC Technology, 2280	42999	{images/products/Samsung_980_Pro_SSD_1.jpg,images/products/Samsung_980_Pro_SSD_2.jpg,images/products/Samsung_980_Pro_SSD_3.jpg}	Storage	N/A	Unleash the power of the Samsung 980 PRO PCIe 4.0 NVMe SSD for next-level computing. 980 PRO delivers 2x the data transfer rate of PCIe 3.0, while maintaining compatibility with PCIe 3.0. Get read speeds up to 7,000 MB/s with 980 PRO and push the limits of what SSDs can do. Powered by a new Elpsis controller designed to harmonize the flash memory components and the interface for superior speed - with a PCIe 4.0 interface thats 2x faster than PCIe 3.0 SSDs and 12x faster than Samsung SATA SSDs - every component of this NVMe SSD is manufactured by Samsung for performance that lasts.
68	Inland Premium 1TB SSD 3D NAND M.2 2280 PCIe NVMe 3.0 x4 Internal Solid State Drive, Read/Write Speed up to 3100 MBps and 2800 MBps, NVMe 1.3 & PCIe 3.1 Compatible	12999	{images/products/Inland_Premium_1TB_SSD_1.jpg,images/products/Inland_Premium_1TB_SSD_2.jpg,images/products/Inland_Premium_1TB_SSD_3.jpg}	Storage	N/A	Get SSD speeds and inject new life into your laptop or desktop PC with a solid state drive from Inland Premium. With a fast, reliable Inland Premium SSD, you will experience quicker bootup and shutdown, and quicker application response and data transfer speeds than with a typical hard disk drive without purchasing a new computer.\n\nSSD Capacity 1TB\nForm Factor: NVMe M.2 2280\nInterface: PCIe 3.0 x4\nSequential Read/Write Speed up to 3100MB/s and 2800MB/s respectively\nEndurance up to 1600TBW\nRandom Read/Write 4K: up to 520,000 and 430,000 IOPS respectively\n3D TLC NAND flash, resistant to shock, vibration, and movement - no overheating, no noise\n3 Year Limited Parts and Labor Warranty\nSupported Windows OS: Microsoft Windows 8, 10\nIdeal for mainstream PCs, laptops, and ultrabooks for personal, gaming, and business use
69	Samsung 870 EVO 2TB SSD 3-bit MLC V-NAND SATA III 6Gb/s 2.5" Internal Solid State Drive	22999	{images/products/Samsung_870_EVO_2TB_1.jpg,images/products/Samsung_870_EVO_2TB_2.jpg,images/products/Samsung_870_EVO_2TB_3.jpg,images/products/Samsung_870_EVO_2TB_4.jpg,images/products/Samsung_870_EVO_2TB_5.jpg}	Storage	N/A	870 EVO is Samsung's latest model of the world's best selling SSD series, with the latest V-NAND technology and the new MKX controller. 870 EVO proves why the EVO series has been the favorite choice among general users by showing the best in class performance, committed reliability and convenient usage with a variety of features.
70	Crucial P1 2TB (CT2000P1SSD8) M.2 NVMe Interface PCIe 3.0 x4 Internal Solid State Drive with 3D QLC NAND, up to 2000MB/s, 2280	22999	{images/products/Crucial_P1_2TB_1.jpg,images/products/Crucial_P1_2TB_2.jpg}	Storage	N/A	Whether you are trying to get in the game faster or store all your precious memories, the Crucial P1 SSD delivers. Capacities start at 500GB and scale to 2TB. Accelerate performance with the latest NVMe PCIe technology. The P1 is designed to be the only storage upgrade you need " storage, speed, and dependability. Accelerate everything. Room to Spare Securely: Load and store up to 2TB of important files on Micron NAND in a tiny M.2 form factor. Vital Performance: NVMe PCIe technology delivers sequential read/write speeds up to 2000/1700MB/s so you can hammer out your work and compete online faster than ever before. Lasting Value: The Crucial P1 SSD is designed to be the only storage upgrade you'll need with an affordable blend of performance and capacity.
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 349, true);


--
-- Name: carts_cardId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cardId_seq"', 61, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 26, true);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."products_productId_seq"', 3, true);


--
-- Name: cartItems cartItems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems"
    ADD CONSTRAINT "cartItems_pkey" PRIMARY KEY ("cartItemId");


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY ("cartId");


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("orderId");


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

