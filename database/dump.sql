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
15	MSI Suprim GeForce RTX 3090 24GB GDDR6X Video Card RTX 3090 SUPRIM X 24G	232999	{images/products/MSI_Suprim_GeForce_RTX_3090_1.jpg,images/products/MSI_Suprim_GeForce_RTX_3090_2.jpg,images/products/MSI_Suprim_GeForce_RTX_3090_3.jpg}	GPU	N/A	The GeForce RTX™ 3090 is a big ferocious GPU (BFGPU) with TITAN class performance. It's powered by Ampere—NVIDIA's 2nd gen RTX architecture—doubling down on ray tracing and AI performance with enhanced RT Cores, Tensor Cores, and new streaming multiprocessors. Plus, it features a staggering 24 GB of G6X memory, all to deliver the ultimate gaming experience.
16	GIGABYTE Radeon RX 5500 XT OC 4G (rev. 2.0) Graphics Card, PCIe 4.0, 4GB 128-Bit GDDR6, GV-R55XTOC-4GD Video Card	55488	{images/products/GIGABYTE_Radeon_RX_5500_1.jpg,images/products/GIGABYTE_Radeon_RX_5500_2.jpg,images/products/GIGABYTE_Radeon_RX_5500_3.jpg,images/products/GIGABYTE_Radeon_RX_5500_4.jpg}	GPU	N/A	Improve your gaming performance with this Radeon RX 5500 series graphics card. Specially engineered RDNA architecture accelerates game fidelity by reducing input lag, tears and stutters during play. The multi-level cache hierarchy reduces latency and increases each game's responsiveness. The fan in this Radeon RX 5500 series graphics card features two fan-blade structures to create steady yet accelerated airflow for temperate gaming.\n
17	Sapphire NITRO+ AMD RADEON RX 6900 XT SE GAMING OC Graphics Card With 16GB GDDR6 HDMI / TRIPLE DP	245999	{images/products/RADEON_RX_6900_XT_1.jpg,images/products/RADEON_RX_6900_XT_2.jpg,images/products/RADEON_RX_6900_XT_3.jpg,images/products/RADEON_RX_6900_XT_4.jpg}	GPU	N/A	The NITRO+ AMD Radeon™ RX 6900 XT delivers powerhouse 4K gaming performance with vivid visuals for an elevated experience. The all-new innovative Wave Fin Design working in tandem with our V-Shape Fin Design for GPU Cooling reduces wind friction and centralizes airflow for optimal heat dissipation and a virtually silent system. Cutting edge Memory & VRM Cooling with Heat-Pipes and next gen K6.5 Memory Pad ensures you can push your performance to new limits while keeping the NITRO+ AMD Radeon™ RX 6900 XT components icy cool. The brand new Hybrid Fan Design combines the tranquility and strong air pressure features that exhibit ultimate levels of downward air pressure through the fan while keeping fan noise low. Incredible ARGB Lighting across the graphics card using our SAPPHIRE TriXX software fused with beautiful aesthetic styling will ensure the NITRO+ AMD Radeon™ RX 6900 XT is a stunning addition to every enthusiast gamer’s PC. NITRO Charge your PC with the NITRO+ AMD Radeon™ RX 6900 XT and elevate your gaming experience to the next level!
18	MSI Radeon RX 580 DirectX 12 RX 580 ARMOR 8G OC 8GB 256-Bit GDDR5 PCI Express x16 HDCP Ready CrossFireX Support Video Card	75999	{images/products/MSI_Radeon_RX_580_1.jpg,images/products/MSI_Radeon_RX_580_2.jpg,images/products/MSI_Radeon_RX_580_3.jpg,images/products/MSI_Radeon_RX_580_4.jpg,images/products/MSI_Radeon_RX_580_5.jpg}	GPU	N/A	Based on AMD Polaris architecture and manufactured with 14nm process, the AMD Radeon RX 580 graphics card is specced with 2304 Stream processors, 4GB/8GB GDDR5 memory and 256-bit memory bus. A performance-class graphics card, the Radeon RX 580 empowers gamers who play anything from the latest MOBAs to the most popular AAA titles in Full HD and beyond, and also delivers the power to drive you into the next level of immersion of the world of VR gaming and entertainment.\n\nThis ARMOR 8G OC edition card is turbocharged to 1366MHz Boost Clock in OC mode (1340MHz for reference card) so you can get more graphics power for your favorite titles. Its Armor 2x cooling solution is efficient and acoustics optimized, with the fan stopping at low/idle load level. And Military Class 4 components ensure unbeatable quality, reliability and durability you can count on in countless gaming hours.
19	ASUS TUF Gaming Radeon RX 6700 XT OC Edition Graphics Card (AMD RDNA 2, PCIe 4.0, 12GB GDDR6, HDMI 2.1, DisplayPort 1.4a, Dual Ball Fan Bearings, All-aluminum Shroud, Reinforced Frame, GPU Tweak II)	134998	{images/products/Radeon_RX_6700_XT_1.jpg,images/products/Radeon_RX_6700_XT_2.jpg,images/products/Radeon_RX_6700_XT_3.jpg,images/products/Radeon_RX_6700_XT_4.jpg,images/products/Radeon_RX_6700_XT_5.jpg}	GPU	N/A	The TUF GAMING Radeon™ RX 6700 XT is a tenacious beast with a tough metal exterior, super-efficient cooling, and components that offer enhanced endurance. An all-metal shroud houses three powerful axial-tech fans with dual ball fan bearings and extra blades. Under the exoskeleton, a thick heatsink keeps thermals under tight control and TUF components, selected for maximum durability and performance, keep the card ahead of the pack. You asked for a mean machine... this one is ready for action.
20	MSI GeForce RTX 2070 SUPER DirectX 12 RTX 2070 SUPER GAMING X TRIO 8GB 256-Bit GDDR6 PCI Express 3.0 x16 HDCP Ready SLI Support Video Card	159850	{images/products/MSI_GeForce_RTX_2070_SUPER_1.jpg,images/products/MSI_GeForce_RTX_2070_SUPER_2.jpg,images/products/MSI_GeForce_RTX_2070_SUPER_3.jpg,images/products/MSI_GeForce_RTX_2070_SUPER_4.jpg}	GPU	N/A	GeForce RTX is powered by NVIDIA Turing, the world's most advanced GPU architecture for gamers and creators. Get truly next-gen performance and features with dedicated AI and ray-tracing cores for the ultimate experience. The new GeForce RTX SUPER™ Series has even more cores and higher clocks, bringing you performance that's up to 25% faster than the original RTX 20 Series and 6X faster than the previous-generation 10 Series GPUs. It's time to gear up and get super powers.
14	GIGABYTE GeForce RTX 3080 VISION OC 10GB Video Card, GV-N3080VISION OC-10GD	109999	{images/products/GIGABYTE_GeForce_RTX_3080_1.jpg,images/products/GIGABYTE_GeForce_RTX_3080_2.jpg,images/products/GIGABYTE_GeForce_RTX_3080_3.jpg,images/products/GIGABYTE_GeForce_RTX_3080_4.jpg}	GPU	N/A	Based on the Ampere architecture and designed to handle the graphical demands of 4K gaming and high frame rates, the Gigabyte GeForce RTX 3080 VISION OC Graphics Card brings the power of real-time ray tracing and AI to your PC games. The Ampere architecture features 2nd Gen RT Cores and 3rd Gen Tensor Cores. The GPU features 10GB of GDDR6X VRAM and a 320-bit memory interface, offering improved performance and power efficiency over the previous Turing-based generation. The front panel of the card features a variety of outputs, such as DisplayPort 1.4a and HDMI 2.1. HDMI 2.1 supports up to 48 Gb/s bandwidth and a range of higher resolutions and refresh rates, including 8K @ 60fps, 4K @ 120fps, and even up to 10K. The RTX 3080 is not just about high-resolution gaming. Computationally intensive programs can utilize the GPU's 8704 cores to accelerate tasks using CUDA and other APIs.
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 312, true);


--
-- Name: carts_cardId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cardId_seq"', 48, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 20, true);


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

