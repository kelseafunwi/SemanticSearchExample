WARNING:  database "appdb" has a collation version mismatch
DETAIL:  The database was created using collation version 2.41, but the operating system provides version 2.36.
HINT:  Rebuild all objects in this database that use the default collation and run ALTER DATABASE appdb REFRESH COLLATION VERSION, or build PostgreSQL with the right library version.
--
-- PostgreSQL database dump
--

\restrict hVu4LntNZpjW2Nn9Xh3HhstD6TIqrA9hjefcrMvKXlYRzpZTBqVZYF0roDxAWPo

-- Dumped from database version 16.12 (Debian 16.12-1.pgdg12+1)
-- Dumped by pg_dump version 16.12 (Debian 16.12-1.pgdg12+1)

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
-- Name: vector; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS vector WITH SCHEMA public;


--
-- Name: EXTENSION vector; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION vector IS 'vector data type and ivfflat and hnsw access methods';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: embeddings; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.embeddings (
    id uuid NOT NULL,
    source text NOT NULL,
    external_id text,
    content text NOT NULL,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    embedding public.vector(1536) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.embeddings OWNER TO app;

--
-- Name: items; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.items (
    id bigint NOT NULL,
    embedding public.vector(3)
);


ALTER TABLE public.items OWNER TO app;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.items_id_seq OWNER TO app;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: sentences; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.sentences (
    id integer NOT NULL,
    sentence character varying,
    embedding public.vector(384)
);


ALTER TABLE public.sentences OWNER TO app;

--
-- Name: sentences_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.sentences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sentences_id_seq OWNER TO app;

--
-- Name: sentences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.sentences_id_seq OWNED BY public.sentences.id;


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: sentences id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.sentences ALTER COLUMN id SET DEFAULT nextval('public.sentences_id_seq'::regclass);


--
-- Data for Name: embeddings; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.embeddings (id, source, external_id, content, metadata, embedding, created_at) FROM stdin;
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.items (id, embedding) FROM stdin;
1	[1,2,3]
2	[4,5,6]
3	[5,6,7]
4	[5,6,7]
5	[5,6,7]
\.


--
-- Data for Name: sentences; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.sentences (id, sentence, embedding) FROM stdin;
1	Action expresses priorities.	\N
2	Simplicity is the ultimate sophistication.	\N
3	Doubt kills more dreams than failure ever will.	\N
4	Your diet is not just what you eat, it is what you watch, listen to, and read.	\N
5	A comfort zone is a beautiful place, but nothing ever grows there.	\N
6	Do not confuse motion with progress.	\N
7	The obstacle is the way.	\N
8	Happiness is the absence of the desire for happiness.	\N
9	You do not rise to the level of your goals, you fall to the level of your systems.	\N
12	Perfection is the enemy of done.	\N
17	What gets measured gets managed.	\N
18	Listen with the intent to understand, not the intent to reply.	\N
33	Wisdom is knowing what to overlook.	\N
19	A ship in harbor is safe, but that is not what ships are built for.	\N
20	Creativity is intelligence having fun.	\N
21	Motivation is garbage; discipline is reliable.	\N
22	The best way to predict the future is to create it.	\N
23	Character is what you do when no one is watching.	\N
24	Your calm mind is the ultimate weapon against your challenges.	\N
25	Do what is right, not what is easy.	\N
38	Knowledge is potential power; execution is real power.	\N
39	Your vibe attracts your tribe.	\N
40	Silence is often the loudest answer.	\N
41	If it costs you your peace, it is too expensive.	\N
42	Make your life a masterpiece; imagine no limitations on what you can be.	\N
44	Great things never came from comfort zones.	\N
45	Impatience with actions, patience with results.	\N
46	Be the change that you wish to see in the world.	\N
191	No man is an island.	\N
47	Success is not final, failure is not fatal: it is the courage to continue that counts.	\N
48	Opportunities don't happen, you create them.	\N
49	Work until your idols become your rivals.	\N
50	Stay hungry, stay foolish.	\N
51	A person who never made a mistake never tried anything new.	\N
52	Life is 10% what happens to you and 90% how you react to it.	\N
57	The only way to do great work is to love what you do.	\N
58	Don't count the days, make the days count.	\N
60	He who has a why to live can bear almost any how.	\N
63	We are what we repeatedly do. Excellence, then, is not an act, but a habit.	\N
64	The best revenge is massive success.	\N
10	If you are the smartest person in the room, you are in the wrong room.	\N
11	Time is the only asset you cannot get back.	\N
112	Without a sense of urgency, desire loses its value.	\N
113	If you want to change the world, start by making your bed.	\N
114	A goal without a plan is just a wish.	\N
123	Think like a man of action, act like a man of thought.	\N
160	Fortune favors the bold.	\N
124	Absorb what is useful, discard what is not, add what is uniquely your own.	\N
125	Knowing is not enough, we must apply. Willing is not enough, we must do.	\N
126	Learning never exhausts the mind.	\N
135	Pain is inevitable. Suffering is optional.	\N
138	Rock bottom became the solid foundation on which I rebuilt my life.	\N
139	Strength does not come from winning. Your struggles develop your strengths.	\N
140	Turn your wounds into wisdom.	\N
141	Resilience is the ability to attack while running away.	\N
155	Waste no more time arguing what a good man should be. Be one.	\N
156	Man conquers the world by conquering himself.	\N
157	He who fears he will suffer, already suffers because he fears.	\N
158	Luck is what happens when preparation meets opportunity.	\N
159	A rolling stone gathers no moss.	\N
162	Strike while the iron is hot.	\N
163	The early bird catches the worm.	\N
164	Time waits for no man.	\N
165	Better late than never.	\N
168	Knowledge is power.	\N
169	Patience is a virtue.	\N
170	Honesty is the best policy.	\N
172	Birds of a feather flock together.	\N
173	Cleanliness is next to godliness.	\N
174	Beggars can't be choosers.	\N
175	Beauty is in the eye of the beholder.	\N
177	A penny saved is a penny earned.	\N
178	Familiarity breeds contempt.	\N
179	You can't judge a book by its cover.	\N
180	Good things come to those who wait.	\N
182	The grass is always greener on the other side.	\N
183	Don't put all your eggs in one basket.	\N
184	Every cloud has a silver lining.	\N
185	What goes around comes around.	\N
187	A watched pot never boils.	\N
188	Where there is a will, there is a way.	\N
189	The pen is mightier than the sword.	\N
190	When the going gets tough, the tough get going.	\N
192	Laughter is the best medicine.	\N
193	A picture is worth a thousand words.	\N
194	There is no such thing as a free lunch.	\N
195	You can lead a horse to water, but you can't make him drink.	\N
196	Don't count your chickens before they hatch.	\N
26	Everything you want is on the other side of fear.	\N
28	Clear thinking requires a quiet mind.	\N
29	You cannot change the people around you, but you can change the people you choose to be around.	\N
31	Be stubborn about your goals and flexible about your methods.	\N
32	The temptation to quit will be greatest just before you are about to succeed.	\N
34	Routine is the sign of an ambitious individual.	\N
36	The cave you fear to enter holds the treasure you seek.	\N
37	Don't let yesterday take up too much of today.	\N
13	Hard choices, easy life. Easy choices, hard life.	\N
61	To know thyself is the beginning of wisdom.	\N
43	The secret of change is to focus all of your energy not on fighting the old, but on building the new.	\N
53	If you want to go fast, go alone. If you want to go far, go together.	\N
54	It always seems impossible until it is done.	\N
55	Do not wait to strike till the iron is hot; but make it hot by striking.	\N
56	Whether you think you can or you think you can't, you're right.	\N
62	An unexamined life is not worth living.	\N
65	Live as if you were to die tomorrow. Learn as if you were to live forever.	\N
27	Busy is a decision.	\N
66	The mind is everything. What you think you become.	\N
14	We suffer more in imagination than in reality.	\N
67	You miss 100% of the shots you don't take.	\N
68	The journey of a thousand miles begins with one step.	\N
69	What you do today can improve all your tomorrows.	\N
70	Define success on your own terms, achieve it by your own rules.	\N
71	Don't watch the clock; do what it does. Keep going.	\N
72	Keep your face always toward the sunshine—and shadows will fall behind you.	\N
73	The only limit to our realization of tomorrow will be our doubts of today.	\N
74	Do one thing every day that scares you.	\N
75	Smart people learn from everything and everyone, average people from their experiences, stupid people already have all the answers.	\N
76	Happiness depends upon ourselves.	\N
77	It does not matter how slowly you go as long as you do not stop.	\N
78	Setting goals is the first step in turning the invisible into the visible.	\N
79	If you look at what you have in life, you'll always have more.	\N
80	You can't use up creativity. The more you use, the more you have.	\N
81	Everything has beauty, but not everyone can see.	\N
82	It is better to fail in originality than to succeed in imitation.	\N
83	Success usually comes to those who are too busy to be looking for it.	\N
84	The way to get started is to quit talking and begin doing.	\N
85	Don't let the fear of losing be greater than the excitement of winning.	\N
86	If you really look closely, most overnight successes took a long time.	\N
87	The only place where success comes before work is in the dictionary.	\N
88	Don't be afraid to give up the good to go for the great.	\N
89	I find that the harder I work, the more luck I seem to have.	\N
90	Success is walking from failure to failure with no loss of enthusiasm.	\N
91	If you are not willing to risk the usual, you will have to settle for the ordinary.	\N
92	Stop chasing the money and start chasing the passion.	\N
93	All our dreams can come true if we have the courage to pursue them.	\N
94	Success is the sum of small efforts, repeated day-in and day-out.	\N
95	As you grow older, you will discover that you have two hands, one for helping yourself, the other for helping others.	\N
96	If you want to lift yourself up, lift up someone else.	\N
97	The meaning of life is to find your gift. The purpose of life is to give it away.	\N
15	The magic you are looking for is in the work you are avoiding.	\N
16	Trust is gained in drops and lost in buckets.	\N
59	In the middle of every difficulty lies opportunity.	\N
121	Don't be busy. Be productive.	\N
98	What we fear of doing most is usually what we most need to do.	\N
101	Don't raise your voice, improve your argument.	\N
30	Small hinges swing big doors.	\N
35	Focus on being productive instead of busy.	\N
147	The only easy day was yesterday.	\N
102	The greatest glory in living lies not in never falling, but in rising every time we fall.	\N
103	Your time is limited, so don't waste it living someone else's life.	\N
104	Be so good they can't ignore you.	\N
105	Done is better than perfect.	\N
106	Simplicity is the ultimate form of efficiency.	\N
107	Don't wish it were easier. Wish you were better.	\N
108	The key to success is to start before you are ready.	\N
109	Every master was once a beginner.	\N
110	Focus on the step in front of you, not the whole staircase.	\N
111	Discipline is the bridge between goals and accomplishment.	\N
136	The best way out is always through.	\N
115	Productivity is being able to do things that you were never able to do before.	\N
116	Until we can manage time, we can manage nothing else.	\N
117	Efficient is doing things right; effective is doing the right things.	\N
118	Amateurs sit and wait for inspiration, the rest of us just get up and go to work.	\N
119	You don't have to see the whole staircase, just take the first step.	\N
120	The future depends on what you do today.	\N
122	Focus is a matter of deciding what things you're not going to do.	\N
127	The beautiful thing about learning is that no one can take it away from you.	\N
128	Tell me and I forget. Teach me and I remember. Involve me and I learn.	\N
129	Investment in knowledge pays the best interest.	\N
130	Change is the end result of all true learning.	\N
131	Education is not the filling of a pail, but the lighting of a fire.	\N
132	The capacity to learn is a gift; the ability to learn is a skill; the willingness to learn is a choice.	\N
133	If you think education is expensive, try ignorance.	\N
134	A river cuts through rock, not because of its power, but because of its persistence.	\N
142	Fall seven times, stand up eight.	\N
143	It is not the mountain we conquer, but ourselves.	\N
144	Difficult roads often lead to beautiful destinations.	\N
145	Embrace the suck.	\N
146	Comfort is a drug. Once you get used to it, it becomes addicting.	\N
148	Get comfortable being uncomfortable.	\N
149	Don't tell people your plans. Show them your results.	\N
150	Humility is not thinking less of yourself, it's thinking of yourself less.	\N
151	Kindness is a language which the deaf can hear and the blind can see.	\N
152	Treat people as if they were what they ought to be and you help them to become what they are capable of being.	\N
153	No one has ever become poor by giving.	\N
154	The only true wisdom is in knowing you know nothing.	\N
161	Make hay while the sun shines.	\N
166	Actions speak louder than words.	\N
167	Practice makes perfect.	\N
171	Hope for the best, prepare for the worst.	\N
176	Necessity is the mother of invention.	\N
181	Two heads are better than one.	\N
186	When in Rome, do as the Romans do.	\N
199	\N	\N
99	You are the average of the five people you spend the most time with.	\N
100	If you don't design your own life plan, chances are you'll fall into someone else's plan.	\N
137	Tough times never last, but tough people do.	\N
197	Too many cooks spoil the broth.	\N
198	A stitch in time saves nine.	\N
\.


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.items_id_seq', 5, true);


--
-- Name: sentences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.sentences_id_seq', 199, true);


--
-- Name: embeddings embeddings_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.embeddings
    ADD CONSTRAINT embeddings_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: sentences sentences_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.sentences
    ADD CONSTRAINT sentences_pkey PRIMARY KEY (id);


--
-- Name: embeddings_embedding_hnsw_idx; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX embeddings_embedding_hnsw_idx ON public.embeddings USING hnsw (embedding public.vector_cosine_ops);


--
-- Name: items_embedding_idx; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX items_embedding_idx ON public.items USING hnsw (embedding public.vector_l2_ops);


--
-- PostgreSQL database dump complete
--

\unrestrict hVu4LntNZpjW2Nn9Xh3HhstD6TIqrA9hjefcrMvKXlYRzpZTBqVZYF0roDxAWPo

