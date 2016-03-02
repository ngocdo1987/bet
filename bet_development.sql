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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: assign_teams; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE assign_teams (
    id integer NOT NULL,
    league_id integer,
    season_id integer,
    team_id integer,
    games_played smallint,
    win smallint,
    draw smallint,
    lose smallint,
    goals_for smallint,
    goals_against smallint,
    points smallint
);


ALTER TABLE public.assign_teams OWNER TO bet;

--
-- Name: assign_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE assign_teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assign_teams_id_seq OWNER TO bet;

--
-- Name: assign_teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE assign_teams_id_seq OWNED BY assign_teams.id;


--
-- Name: bet_money_lines; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE bet_money_lines (
    id integer NOT NULL,
    user_id integer,
    odd_id integer,
    match_id integer,
    stake double precision,
    profit double precision,
    option character varying,
    result character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.bet_money_lines OWNER TO bet;

--
-- Name: bet_money_lines_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE bet_money_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bet_money_lines_id_seq OWNER TO bet;

--
-- Name: bet_money_lines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE bet_money_lines_id_seq OWNED BY bet_money_lines.id;


--
-- Name: bet_spreads; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE bet_spreads (
    id integer NOT NULL,
    user_id integer,
    odd_id integer,
    match_id integer,
    stake double precision,
    profit double precision,
    option character varying,
    result character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.bet_spreads OWNER TO bet;

--
-- Name: bet_spreads_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE bet_spreads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bet_spreads_id_seq OWNER TO bet;

--
-- Name: bet_spreads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE bet_spreads_id_seq OWNED BY bet_spreads.id;


--
-- Name: bet_total_points; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE bet_total_points (
    id integer NOT NULL,
    user_id integer,
    odd_id integer,
    match_id integer,
    stake double precision,
    profit double precision,
    option character varying,
    result character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.bet_total_points OWNER TO bet;

--
-- Name: bet_total_points_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE bet_total_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bet_total_points_id_seq OWNER TO bet;

--
-- Name: bet_total_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE bet_total_points_id_seq OWNED BY bet_total_points.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying,
    slug character varying,
    parent_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    ancestry character varying
);


ALTER TABLE public.categories OWNER TO bet;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO bet;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: chefs; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE chefs (
    id integer NOT NULL,
    chefname character varying,
    email character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    image character varying,
    "position" character varying,
    description text,
    facebook character varying,
    twitter character varying,
    linkedin character varying,
    gplus character varying,
    home boolean
);


ALTER TABLE public.chefs OWNER TO bet;

--
-- Name: chefs_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE chefs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chefs_id_seq OWNER TO bet;

--
-- Name: chefs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE chefs_id_seq OWNED BY chefs.id;


--
-- Name: cuisines; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE cuisines (
    id integer NOT NULL,
    name character varying,
    slug character varying,
    description character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.cuisines OWNER TO bet;

--
-- Name: cuisines_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE cuisines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cuisines_id_seq OWNER TO bet;

--
-- Name: cuisines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE cuisines_id_seq OWNED BY cuisines.id;


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE ingredients (
    id integer NOT NULL,
    recipe_id integer,
    ingredient_name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.ingredients OWNER TO bet;

--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_id_seq OWNER TO bet;

--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE ingredients_id_seq OWNED BY ingredients.id;


--
-- Name: leagues; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE leagues (
    id integer NOT NULL,
    league_name character varying,
    league_type character varying,
    active boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    league_image character varying
);


ALTER TABLE public.leagues OWNER TO bet;

--
-- Name: leagues_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE leagues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leagues_id_seq OWNER TO bet;

--
-- Name: leagues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE leagues_id_seq OWNED BY leagues.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    name character varying,
    address character varying,
    phone character varying,
    fax character varying,
    email character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.locations OWNER TO bet;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO bet;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: matches; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE matches (
    id integer NOT NULL,
    league_id integer,
    home_team character varying,
    away_team character varying,
    home_number integer,
    away_number integer,
    home_score smallint,
    away_score smallint,
    match_time timestamp without time zone,
    status character varying,
    calculated boolean,
    active boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    season_id integer,
    home_team_id integer,
    away_team_id integer
);


ALTER TABLE public.matches OWNER TO bet;

--
-- Name: matches_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE matches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.matches_id_seq OWNER TO bet;

--
-- Name: matches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE matches_id_seq OWNED BY matches.id;


--
-- Name: nutritions; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE nutritions (
    id integer NOT NULL,
    recipe_id integer,
    nutrition_name character varying,
    nutrition_weight character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.nutritions OWNER TO bet;

--
-- Name: nutritions_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE nutritions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nutritions_id_seq OWNER TO bet;

--
-- Name: nutritions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE nutritions_id_seq OWNED BY nutritions.id;


--
-- Name: odd_money_lines; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE odd_money_lines (
    id integer NOT NULL,
    match_id integer,
    home_odd double precision,
    away_odd double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.odd_money_lines OWNER TO bet;

--
-- Name: odd_money_lines_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE odd_money_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.odd_money_lines_id_seq OWNER TO bet;

--
-- Name: odd_money_lines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE odd_money_lines_id_seq OWNED BY odd_money_lines.id;


--
-- Name: odd_spreads; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE odd_spreads (
    id integer NOT NULL,
    match_id integer,
    home_hdc double precision,
    away_hdc double precision,
    home_odd double precision,
    away_odd double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.odd_spreads OWNER TO bet;

--
-- Name: odd_spreads_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE odd_spreads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.odd_spreads_id_seq OWNER TO bet;

--
-- Name: odd_spreads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE odd_spreads_id_seq OWNED BY odd_spreads.id;


--
-- Name: odd_total_points; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE odd_total_points (
    id integer NOT NULL,
    match_id integer,
    over_hdc double precision,
    under_hdc double precision,
    over_odd double precision,
    under_odd double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.odd_total_points OWNER TO bet;

--
-- Name: odd_total_points_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE odd_total_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.odd_total_points_id_seq OWNER TO bet;

--
-- Name: odd_total_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE odd_total_points_id_seq OWNED BY odd_total_points.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE posts (
    id integer NOT NULL,
    name character varying,
    slug character varying,
    image character varying,
    description text,
    content text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    home boolean
);


ALTER TABLE public.posts OWNER TO bet;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO bet;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE recipes (
    id integer NOT NULL,
    name character varying,
    summary text,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    chef_id integer,
    image character varying,
    steps text,
    cooking_time character varying,
    level character varying,
    featured boolean,
    hot boolean,
    cuisine_id integer
);


ALTER TABLE public.recipes OWNER TO bet;

--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE recipes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_id_seq OWNER TO bet;

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE recipes_id_seq OWNED BY recipes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO bet;

--
-- Name: seasons; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE seasons (
    id integer NOT NULL,
    name character varying,
    slug character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.seasons OWNER TO bet;

--
-- Name: seasons_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE seasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seasons_id_seq OWNER TO bet;

--
-- Name: seasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE seasons_id_seq OWNED BY seasons.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE settings (
    id integer NOT NULL,
    name character varying,
    value character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.settings OWNER TO bet;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO bet;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying,
    slug character varying,
    ancestry character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tags OWNER TO bet;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO bet;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE teams (
    id integer NOT NULL,
    name character varying,
    image character varying,
    description character varying,
    total_matches integer,
    total_points integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    league_id integer
);


ALTER TABLE public.teams OWNER TO bet;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO bet;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE teams_id_seq OWNED BY teams.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    username character varying,
    first_name character varying,
    last_name character varying,
    role character varying
);


ALTER TABLE public.users OWNER TO bet;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO bet;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: videos; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE videos (
    id integer NOT NULL,
    name character varying,
    url character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.videos OWNER TO bet;

--
-- Name: videos_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.videos_id_seq OWNER TO bet;

--
-- Name: videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE videos_id_seq OWNED BY videos.id;


--
-- Name: web_captures; Type: TABLE; Schema: public; Owner: bet; Tablespace: 
--

CREATE TABLE web_captures (
    id integer NOT NULL
);


ALTER TABLE public.web_captures OWNER TO bet;

--
-- Name: web_captures_id_seq; Type: SEQUENCE; Schema: public; Owner: bet
--

CREATE SEQUENCE web_captures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_captures_id_seq OWNER TO bet;

--
-- Name: web_captures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bet
--

ALTER SEQUENCE web_captures_id_seq OWNED BY web_captures.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY assign_teams ALTER COLUMN id SET DEFAULT nextval('assign_teams_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY bet_money_lines ALTER COLUMN id SET DEFAULT nextval('bet_money_lines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY bet_spreads ALTER COLUMN id SET DEFAULT nextval('bet_spreads_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY bet_total_points ALTER COLUMN id SET DEFAULT nextval('bet_total_points_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY chefs ALTER COLUMN id SET DEFAULT nextval('chefs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY cuisines ALTER COLUMN id SET DEFAULT nextval('cuisines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY ingredients ALTER COLUMN id SET DEFAULT nextval('ingredients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY leagues ALTER COLUMN id SET DEFAULT nextval('leagues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY matches ALTER COLUMN id SET DEFAULT nextval('matches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY nutritions ALTER COLUMN id SET DEFAULT nextval('nutritions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY odd_money_lines ALTER COLUMN id SET DEFAULT nextval('odd_money_lines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY odd_spreads ALTER COLUMN id SET DEFAULT nextval('odd_spreads_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY odd_total_points ALTER COLUMN id SET DEFAULT nextval('odd_total_points_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY recipes ALTER COLUMN id SET DEFAULT nextval('recipes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY seasons ALTER COLUMN id SET DEFAULT nextval('seasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY teams ALTER COLUMN id SET DEFAULT nextval('teams_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY videos ALTER COLUMN id SET DEFAULT nextval('videos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bet
--

ALTER TABLE ONLY web_captures ALTER COLUMN id SET DEFAULT nextval('web_captures_id_seq'::regclass);


--
-- Data for Name: assign_teams; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY assign_teams (id, league_id, season_id, team_id, games_played, win, draw, lose, goals_for, goals_against, points) FROM stdin;
27	1	5	4	\N	\N	\N	\N	\N	\N	\N
28	1	5	7	\N	\N	\N	\N	\N	\N	\N
35	1	5	3	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: assign_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('assign_teams_id_seq', 35, true);


--
-- Data for Name: bet_money_lines; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY bet_money_lines (id, user_id, odd_id, match_id, stake, profit, option, result, created_at, updated_at) FROM stdin;
\.


--
-- Name: bet_money_lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('bet_money_lines_id_seq', 1, false);


--
-- Data for Name: bet_spreads; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY bet_spreads (id, user_id, odd_id, match_id, stake, profit, option, result, created_at, updated_at) FROM stdin;
\.


--
-- Name: bet_spreads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('bet_spreads_id_seq', 1, false);


--
-- Data for Name: bet_total_points; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY bet_total_points (id, user_id, odd_id, match_id, stake, profit, option, result, created_at, updated_at) FROM stdin;
\.


--
-- Name: bet_total_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('bet_total_points_id_seq', 1, false);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY categories (id, name, slug, parent_id, created_at, updated_at, ancestry) FROM stdin;
32	sit corporis	sit-corporis	\N	2016-02-14 16:52:17.181958	2016-02-14 16:52:17.181958	\N
33	nihil optio	nihil-optio	\N	2016-02-14 16:52:17.207045	2016-02-14 16:52:17.207045	\N
34	ut explicabo	ut-explicabo	\N	2016-02-14 16:52:17.215545	2016-02-14 16:52:17.215545	\N
35	quis ut	quis-ut	\N	2016-02-14 16:52:17.224355	2016-02-14 16:52:17.224355	\N
36	est nemo	est-nemo	\N	2016-02-14 16:52:17.230892	2016-02-14 16:52:17.230892	\N
37	ratione et	ratione-et	\N	2016-02-14 16:52:17.240374	2016-02-14 16:52:17.240374	\N
38	quia dolores	quia-dolores	\N	2016-02-14 16:52:17.248034	2016-02-14 16:52:17.248034	\N
39	corporis quae	corporis-quae	\N	2016-02-14 16:52:17.256445	2016-02-14 16:52:17.256445	\N
40	omnis perspiciatis	omnis-perspiciatis	\N	2016-02-14 16:52:17.264455	2016-02-14 16:52:17.264455	\N
41	amet consectetur	amet-consectetur	\N	2016-02-14 16:52:17.276193	2016-02-14 16:52:17.276193	\N
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('categories_id_seq', 42, true);


--
-- Data for Name: chefs; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY chefs (id, chefname, email, created_at, updated_at, image, "position", description, facebook, twitter, linkedin, gplus, home) FROM stdin;
4	Ngoc Do	ngoc@do.com	2016-01-18 00:31:15.92003	2016-01-18 00:31:15.92003	\N	\N	\N	\N	\N	\N	\N	\N
14	Ryan Dahl	ryan@dahl.com	2016-02-02 13:48:56.986717	2016-02-02 13:48:56.986717	\N	\N	\N	\N	\N	\N	\N	\N
13	Bjarne Stroustrup	bjarne@stroustrup.com	2016-02-02 13:48:23.386887	2016-02-10 04:49:48.394452	Bjarne_Stroustrup.jpg	\N	\N	\N	\N	\N	\N	\N
5	Sergey Brin	sergey@brin.com	2016-01-27 10:09:34.276523	2016-02-10 04:52:41.466507	sergey-brin.jpg	\N	\N	\N	\N	\N	\N	\N
8	Sandra Bullock	sandra@bullock.com	2016-02-02 13:43:59.385092	2016-02-10 04:54:46.532111	sandra.jpg	\N	\N	\N	\N	\N	\N	\N
10	Yukihiro Matsumoto	yukihiro@matsumoto.com	2016-02-02 13:46:11.186857	2016-02-10 04:56:53.247894	matsumoto.JPG	\N	\N	\N	\N	\N	\N	\N
11	Rasmus Lerdorf	rasmus@lerdorf.com	2016-02-02 13:46:46.572944	2016-02-10 04:57:54.518815	Rasmus_Lerdorf.jpg	\N	\N	\N	\N	\N	\N	\N
12	Guido van Rossum	guido@rossum.com	2016-02-02 13:47:40.791582	2016-02-10 04:58:47.271984	guido.jpg	\N	\N	\N	\N	\N	\N	\N
7	Joe Biden	joe@biden.com	2016-02-02 13:43:12.44781	2016-02-10 05:35:17.162182	joe.jpg	\N	\N	\N	\N	\N	\N	\N
1	Larry Page	larry@page.com	2016-01-17 18:10:00.947937	2016-02-10 15:09:11.005909	larry_page0.jpg	Head Chef	<p>I find that the biggest difference between being a chef in New York City andbeing a chef. The Bay Area is that in NYC you work to MAKE the food tastegood. Out here you work to LET the food taste good!</p>	http://facebook.com	http://twitter.com	http://linkedin.com	http://gplus.com	\N
9	David Heinemeier Hansson	david@hansson.com	2016-02-02 13:45:28.184984	2016-02-18 14:30:24.696968	09675b8a-2e4a-4454-9a91-e23ed965e7e5.png	Rails Chef						t
6	Justin Bieber	justin@bieber.com	2016-01-27 10:10:10.420921	2016-02-18 14:30:46.729393	d1f2a552-5724-4396-ab81-9f3192dc04c3.jpg	Teen Music Chef						t
3	Mark Zurkerberg	mark@zurkerberg.com	2016-01-18 00:31:01.955372	2016-02-18 14:31:06.254678	49d52bde-a9af-4f2f-940a-d11fa682cf67.jpg	Facebook Chef						t
2	Barack Obama	barack@obama.com	2016-01-18 00:30:51.626462	2016-02-18 14:31:56.256954	dc598791-22dc-4ca0-b522-747ee79b016a.jpg	USA Chef						t
15	Robert Griesemer	robert@griesemer.com	2016-02-02 13:50:15.989281	2016-02-18 16:50:55.680729	b2755228-e022-4351-b536-f764ab083099.jpg							f
\.


--
-- Name: chefs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('chefs_id_seq', 17, true);


--
-- Data for Name: cuisines; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY cuisines (id, name, slug, description, created_at, updated_at) FROM stdin;
4	Chinese	chinese		2016-02-21 14:21:14.983876	2016-02-21 14:21:14.983876
5	French	french		2016-02-21 14:21:26.184878	2016-02-21 14:21:26.184878
6	Greek	greek		2016-02-21 14:21:40.593845	2016-02-21 14:21:40.593845
7	Indian	indian		2016-02-21 14:21:55.387689	2016-02-21 14:21:55.387689
1	American	american	<p>Get inspired by Stateside favourites, from burgers and hotdogs to pancakes and pies.</p>	2016-02-21 14:20:10.213304	2016-02-21 14:22:34.79391
2	British	british	<p>Classic British dishes such as toad in the hole and fish pie.</p>	2016-02-21 14:20:41.585742	2016-02-21 14:23:40.389284
3	Caribbean	caribbean	<p>Delicious Caribbean flavours from jerk pork to fish stew</p>	2016-02-21 14:20:57.976155	2016-02-21 14:24:09.597717
\.


--
-- Name: cuisines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('cuisines_id_seq', 7, true);


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY ingredients (id, recipe_id, ingredient_name, created_at, updated_at) FROM stdin;
\.


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('ingredients_id_seq', 1, true);


--
-- Data for Name: leagues; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY leagues (id, league_name, league_type, active, created_at, updated_at, league_image) FROM stdin;
3	NBA	Basketball	f	2016-02-03 01:32:01.65768	2016-02-04 04:31:35.543604	MLS-Logo.jpg
1	Premier League	Football	t	2016-02-03 01:31:19.062075	2016-02-04 04:32:01.018287	napoli.jpg
2	Serie A	Football	t	2016-02-03 01:31:38.387159	2016-02-18 03:44:11.714604	bf311d85-543d-456c-80a3-096b4900d7dd.jpg
6	Division 1	Football	t	2016-02-21 15:02:49.151402	2016-02-21 15:02:49.151402	\N
7	Division 2	Football	t	2016-02-21 16:05:27.648251	2016-02-21 16:05:27.648251	\N
\.


--
-- Name: leagues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('leagues_id_seq', 7, true);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY locations (id, name, address, phone, fax, email, created_at, updated_at) FROM stdin;
1	Registered office	Recipe north street, opp secure garden. HotelView, City State Office, Melbournebr Australia. 123456	+123 4567 890	+123 4567 890	info@foodandtaste.com	2016-02-19 03:57:26.734141	2016-02-19 03:57:26.734141
2	Our Restaurant	Recipe north street, opp secure garden. HotelView, City State Office, Melbourne Australia. 123456	+123 4567 890	+123 4567 890	info1@foodandtaste.com	2016-02-19 03:58:08.278288	2016-02-19 03:58:08.278288
3	Other Office	Recipe north street, opp secure garden. HotelView, City State Office, Melbourne Australia. 123456	+123 4567 890	+123 4567 890	info2@foodandtaste.com	2016-02-19 03:58:42.72098	2016-02-19 03:58:42.72098
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('locations_id_seq', 3, true);


--
-- Data for Name: matches; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY matches (id, league_id, home_team, away_team, home_number, away_number, home_score, away_score, match_time, status, calculated, active, created_at, updated_at, season_id, home_team_id, away_team_id) FROM stdin;
3	6	Aston Villa	Accrington F.C.	0	0	4	3	\N	\N	\N	\N	2016-02-21 15:33:57.630177	2016-02-21 15:33:57.630177	7	9	10
4	6	Blackburn Rovers	Accrington F.C.	0	0	5	5	\N	\N	\N	\N	2016-02-21 15:33:57.671316	2016-02-21 15:33:57.671316	7	11	10
5	6	Bolton Wanderers	Accrington F.C.	0	0	4	1	\N	\N	\N	\N	2016-02-21 15:33:57.69325	2016-02-21 15:33:57.69325	7	12	10
6	6	Burnley	Accrington F.C.	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:33:57.705242	2016-02-21 15:33:57.705242	7	13	10
7	6	Derby County	Accrington F.C.	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:33:57.717536	2016-02-21 15:33:57.717536	7	14	10
8	6	Everton	Accrington F.C.	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:33:57.730634	2016-02-21 15:33:57.730634	7	15	10
9	6	Notts County	Accrington F.C.	0	0	3	3	\N	\N	\N	\N	2016-02-21 15:33:57.743208	2016-02-21 15:33:57.743208	7	16	10
10	6	Preston North End	Accrington F.C.	0	0	2	0	\N	\N	\N	\N	2016-02-21 15:33:57.758623	2016-02-21 15:33:57.758623	7	17	10
11	6	Stoke City	Accrington F.C.	0	0	2	4	\N	\N	\N	\N	2016-02-21 15:33:57.770533	2016-02-21 15:33:57.770533	7	18	10
12	6	West Bromwich Albion	Accrington F.C.	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:33:57.781773	2016-02-21 15:33:57.781773	7	19	10
13	6	Wolverhampton Wanderers	Accrington F.C.	0	0	4	0	\N	\N	\N	\N	2016-02-21 15:33:57.795388	2016-02-21 15:33:57.795388	7	20	10
14	6	Accrington F.C.	Aston Villa	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:33:57.801667	2016-02-21 15:33:57.801667	7	10	9
15	6	Blackburn Rovers	Aston Villa	0	0	5	1	\N	\N	\N	\N	2016-02-21 15:33:57.809061	2016-02-21 15:33:57.809061	7	11	9
16	6	Bolton Wanderers	Aston Villa	0	0	2	3	\N	\N	\N	\N	2016-02-21 15:33:57.815771	2016-02-21 15:33:57.815771	7	12	9
17	6	Burnley	Aston Villa	0	0	4	0	\N	\N	\N	\N	2016-02-21 15:33:57.821808	2016-02-21 15:33:57.821808	7	13	9
18	6	Derby County	Aston Villa	0	0	5	2	\N	\N	\N	\N	2016-02-21 15:33:57.82798	2016-02-21 15:33:57.82798	7	14	9
19	6	Everton	Aston Villa	0	0	2	0	\N	\N	\N	\N	2016-02-21 15:33:57.834086	2016-02-21 15:33:57.834086	7	15	9
20	6	Notts County	Aston Villa	0	0	2	4	\N	\N	\N	\N	2016-02-21 15:33:57.840212	2016-02-21 15:33:57.840212	7	16	9
21	6	Preston North End	Aston Villa	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:33:57.846481	2016-02-21 15:33:57.846481	7	17	9
22	6	Stoke City	Aston Villa	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:33:57.853608	2016-02-21 15:33:57.853608	7	18	9
23	6	West Bromwich Albion	Aston Villa	0	0	3	3	\N	\N	\N	\N	2016-02-21 15:33:57.859951	2016-02-21 15:33:57.859951	7	19	9
24	6	Wolverhampton Wanderers	Aston Villa	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:33:57.868455	2016-02-21 15:33:57.868455	7	20	9
25	6	Accrington F.C.	Blackburn Rovers	0	0	0	2	\N	\N	\N	\N	2016-02-21 15:33:57.874615	2016-02-21 15:33:57.874615	7	10	11
26	6	Aston Villa	Blackburn Rovers	0	0	6	1	\N	\N	\N	\N	2016-02-21 15:33:57.880852	2016-02-21 15:33:57.880852	7	9	11
27	6	Bolton Wanderers	Blackburn Rovers	0	0	3	2	\N	\N	\N	\N	2016-02-21 15:33:57.887667	2016-02-21 15:33:57.887667	7	12	11
28	6	Burnley	Blackburn Rovers	0	0	1	7	\N	\N	\N	\N	2016-02-21 15:33:57.894481	2016-02-21 15:33:57.894481	7	13	11
29	6	Derby County	Blackburn Rovers	0	0	0	2	\N	\N	\N	\N	2016-02-21 15:33:57.90075	2016-02-21 15:33:57.90075	7	14	11
30	6	Everton	Blackburn Rovers	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:33:57.907137	2016-02-21 15:33:57.907137	7	15	11
31	6	Notts County	Blackburn Rovers	0	0	3	3	\N	\N	\N	\N	2016-02-21 15:33:57.913955	2016-02-21 15:33:57.913955	7	16	11
32	6	Preston North End	Blackburn Rovers	0	0	1	0	\N	\N	\N	\N	2016-02-21 15:33:57.920198	2016-02-21 15:33:57.920198	7	17	11
33	6	Stoke City	Blackburn Rovers	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:33:57.926299	2016-02-21 15:33:57.926299	7	18	11
34	6	West Bromwich Albion	Blackburn Rovers	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:33:57.93242	2016-02-21 15:33:57.93242	7	19	11
35	6	Wolverhampton Wanderers	Blackburn Rovers	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:33:57.938524	2016-02-21 15:33:57.938524	7	20	11
36	6	Accrington F.C.	Bolton Wanderers	0	0	2	3	\N	\N	\N	\N	2016-02-21 15:33:57.944788	2016-02-21 15:33:57.944788	7	10	12
37	6	Aston Villa	Bolton Wanderers	0	0	6	2	\N	\N	\N	\N	2016-02-21 15:33:57.950771	2016-02-21 15:33:57.950771	7	9	12
38	6	Blackburn Rovers	Bolton Wanderers	0	0	4	4	\N	\N	\N	\N	2016-02-21 15:33:57.959163	2016-02-21 15:33:57.959163	7	11	12
39	6	Burnley	Bolton Wanderers	0	0	4	1	\N	\N	\N	\N	2016-02-21 15:33:57.965233	2016-02-21 15:33:57.965233	7	13	12
40	6	Derby County	Bolton Wanderers	0	0	2	3	\N	\N	\N	\N	2016-02-21 15:33:57.971587	2016-02-21 15:33:57.971587	7	14	12
41	6	Everton	Bolton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:33:57.978021	2016-02-21 15:33:57.978021	7	15	12
42	6	Notts County	Bolton Wanderers	0	0	0	4	\N	\N	\N	\N	2016-02-21 15:33:57.985073	2016-02-21 15:33:57.985073	7	16	12
43	6	Preston North End	Bolton Wanderers	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:33:57.991937	2016-02-21 15:33:57.991937	7	17	12
44	6	Stoke City	Bolton Wanderers	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:33:57.998603	2016-02-21 15:33:57.998603	7	18	12
45	6	West Bromwich Albion	Bolton Wanderers	0	0	1	5	\N	\N	\N	\N	2016-02-21 15:33:58.005378	2016-02-21 15:33:58.005378	7	19	12
46	6	Wolverhampton Wanderers	Bolton Wanderers	0	0	3	2	\N	\N	\N	\N	2016-02-21 15:33:58.012199	2016-02-21 15:33:58.012199	7	20	12
47	6	Accrington F.C.	Burnley	0	0	5	1	\N	\N	\N	\N	2016-02-21 15:33:58.018857	2016-02-21 15:33:58.018857	7	10	13
48	6	Aston Villa	Burnley	0	0	4	2	\N	\N	\N	\N	2016-02-21 15:33:58.025022	2016-02-21 15:33:58.025022	7	9	13
49	6	Blackburn Rovers	Burnley	0	0	4	2	\N	\N	\N	\N	2016-02-21 15:33:58.031647	2016-02-21 15:33:58.031647	7	11	13
50	6	Bolton Wanderers	Burnley	0	0	3	4	\N	\N	\N	\N	2016-02-21 15:33:58.037878	2016-02-21 15:33:58.037878	7	12	13
51	6	Derby County	Burnley	0	0	1	0	\N	\N	\N	\N	2016-02-21 15:33:58.044104	2016-02-21 15:33:58.044104	7	14	13
52	6	Everton	Burnley	0	0	3	2	\N	\N	\N	\N	2016-02-21 15:33:58.051098	2016-02-21 15:33:58.051098	7	15	13
53	6	Notts County	Burnley	0	0	6	1	\N	\N	\N	\N	2016-02-21 15:33:58.059507	2016-02-21 15:33:58.059507	7	16	13
54	6	Preston North End	Burnley	0	0	5	2	\N	\N	\N	\N	2016-02-21 15:33:58.065722	2016-02-21 15:33:58.065722	7	17	13
55	6	Stoke City	Burnley	0	0	4	3	\N	\N	\N	\N	2016-02-21 15:33:58.072643	2016-02-21 15:33:58.072643	7	18	13
56	6	West Bromwich Albion	Burnley	0	0	4	3	\N	\N	\N	\N	2016-02-21 15:33:58.078722	2016-02-21 15:33:58.078722	7	19	13
57	6	Wolverhampton Wanderers	Burnley	0	0	4	1	\N	\N	\N	\N	2016-02-21 15:33:58.085323	2016-02-21 15:33:58.085323	7	20	13
58	6	Accrington F.C.	Derby County	0	0	6	2	\N	\N	\N	\N	2016-02-21 15:33:58.092295	2016-02-21 15:33:58.092295	7	10	14
59	6	Aston Villa	Derby County	0	0	4	2	\N	\N	\N	\N	2016-02-21 15:33:58.099158	2016-02-21 15:33:58.099158	7	9	14
60	6	Blackburn Rovers	Derby County	0	0	3	0	\N	\N	\N	\N	2016-02-21 15:33:58.106044	2016-02-21 15:33:58.106044	7	11	14
61	6	Bolton Wanderers	Derby County	0	0	3	6	\N	\N	\N	\N	2016-02-21 15:33:58.112977	2016-02-21 15:33:58.112977	7	12	14
62	6	Burnley	Derby County	0	0	1	0	\N	\N	\N	\N	2016-02-21 15:33:58.119791	2016-02-21 15:33:58.119791	7	13	14
63	6	Everton	Derby County	0	0	6	2	\N	\N	\N	\N	2016-02-21 15:33:58.126397	2016-02-21 15:33:58.126397	7	15	14
64	6	Notts County	Derby County	0	0	3	5	\N	\N	\N	\N	2016-02-21 15:33:58.1331	2016-02-21 15:33:58.1331	7	16	14
65	6	Preston North End	Derby County	0	0	5	0	\N	\N	\N	\N	2016-02-21 15:33:58.139704	2016-02-21 15:33:58.139704	7	17	14
66	6	Stoke City	Derby County	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:33:58.146431	2016-02-21 15:33:58.146431	7	18	14
67	6	West Bromwich Albion	Derby County	0	0	5	0	\N	\N	\N	\N	2016-02-21 15:33:58.155638	2016-02-21 15:33:58.155638	7	19	14
68	6	Wolverhampton Wanderers	Derby County	0	0	4	1	\N	\N	\N	\N	2016-02-21 15:33:58.161959	2016-02-21 15:33:58.161959	7	20	14
2	1	Manchester City	Arsenal	3	4	\N	\N	\N	\N	f	t	2016-02-03 01:37:36.585344	2016-02-22 13:46:03.732254	\N	\N	\N
69	6	Accrington F.C.	Everton	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:33:58.167637	2016-02-21 15:33:58.167637	7	10	15
70	6	Aston Villa	Everton	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:33:58.173522	2016-02-21 15:33:58.173522	7	9	15
71	6	Blackburn Rovers	Everton	0	0	3	0	\N	\N	\N	\N	2016-02-21 15:33:58.179899	2016-02-21 15:33:58.179899	7	11	15
72	6	Bolton Wanderers	Everton	0	0	6	2	\N	\N	\N	\N	2016-02-21 15:33:58.186504	2016-02-21 15:33:58.186504	7	12	15
73	6	Burnley	Everton	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:33:58.193421	2016-02-21 15:33:58.193421	7	13	15
74	6	Derby County	Everton	0	0	2	4	\N	\N	\N	\N	2016-02-21 15:33:58.200105	2016-02-21 15:33:58.200105	7	14	15
75	6	Notts County	Everton	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:33:58.207121	2016-02-21 15:33:58.207121	7	16	15
76	6	Preston North End	Everton	0	0	3	0	\N	\N	\N	\N	2016-02-21 15:33:58.213725	2016-02-21 15:33:58.213725	7	17	15
77	6	Stoke City	Everton	0	0	0	0	\N	\N	\N	\N	2016-02-21 15:33:58.221054	2016-02-21 15:33:58.221054	7	18	15
78	6	West Bromwich Albion	Everton	0	0	1	0	\N	\N	\N	\N	2016-02-21 15:33:58.227929	2016-02-21 15:33:58.227929	7	19	15
79	6	Wolverhampton Wanderers	Everton	0	0	4	0	\N	\N	\N	\N	2016-02-21 15:33:58.237234	2016-02-21 15:33:58.237234	7	20	15
80	6	Accrington F.C.	Notts County	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:33:58.245897	2016-02-21 15:33:58.245897	7	10	16
81	6	Aston Villa	Notts County	0	0	9	1	\N	\N	\N	\N	2016-02-21 15:33:58.254508	2016-02-21 15:33:58.254508	7	9	16
82	6	Blackburn Rovers	Notts County	0	0	5	2	\N	\N	\N	\N	2016-02-21 15:33:58.265894	2016-02-21 15:33:58.265894	7	11	16
83	6	Bolton Wanderers	Notts County	0	0	7	3	\N	\N	\N	\N	2016-02-21 15:33:58.274089	2016-02-21 15:33:58.274089	7	12	16
84	6	Burnley	Notts County	0	0	1	0	\N	\N	\N	\N	2016-02-21 15:33:58.281006	2016-02-21 15:33:58.281006	7	13	16
85	6	Derby County	Notts County	0	0	3	2	\N	\N	\N	\N	2016-02-21 15:33:58.288553	2016-02-21 15:33:58.288553	7	14	16
86	6	Everton	Notts County	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:33:58.295898	2016-02-21 15:33:58.295898	7	15	16
87	6	Preston North End	Notts County	0	0	4	1	\N	\N	\N	\N	2016-02-21 15:33:58.303141	2016-02-21 15:33:58.303141	7	17	16
88	6	Stoke City	Notts County	0	0	3	0	\N	\N	\N	\N	2016-02-21 15:33:58.309919	2016-02-21 15:33:58.309919	7	18	16
89	6	West Bromwich Albion	Notts County	0	0	4	2	\N	\N	\N	\N	2016-02-21 15:33:58.316744	2016-02-21 15:33:58.316744	7	19	16
90	6	Wolverhampton Wanderers	Notts County	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:33:58.323385	2016-02-21 15:33:58.323385	7	20	16
91	6	Accrington F.C.	Preston North End	0	0	0	0	\N	\N	\N	\N	2016-02-21 15:33:58.329177	2016-02-21 15:33:58.329177	7	10	17
92	6	Aston Villa	Preston North End	0	0	0	2	\N	\N	\N	\N	2016-02-21 15:33:58.336227	2016-02-21 15:33:58.336227	7	9	17
93	6	Blackburn Rovers	Preston North End	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:33:58.343544	2016-02-21 15:33:58.343544	7	11	17
94	6	Bolton Wanderers	Preston North End	0	0	2	5	\N	\N	\N	\N	2016-02-21 15:33:58.35138	2016-02-21 15:33:58.35138	7	12	17
95	6	Burnley	Preston North End	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:33:58.358454	2016-02-21 15:33:58.358454	7	13	17
96	6	Derby County	Preston North End	0	0	2	3	\N	\N	\N	\N	2016-02-21 15:33:58.36727	2016-02-21 15:33:58.36727	7	14	17
97	6	Everton	Preston North End	0	0	0	2	\N	\N	\N	\N	2016-02-21 15:33:58.37334	2016-02-21 15:33:58.37334	7	15	17
98	6	Notts County	Preston North End	0	0	0	7	\N	\N	\N	\N	2016-02-21 15:33:58.379449	2016-02-21 15:33:58.379449	7	16	17
99	6	Stoke City	Preston North End	0	0	0	3	\N	\N	\N	\N	2016-02-21 15:33:58.385558	2016-02-21 15:33:58.385558	7	18	17
100	6	West Bromwich Albion	Preston North End	0	0	0	5	\N	\N	\N	\N	2016-02-21 15:33:58.39241	2016-02-21 15:33:58.39241	7	19	17
101	6	Wolverhampton Wanderers	Preston North End	0	0	0	4	\N	\N	\N	\N	2016-02-21 15:33:58.399138	2016-02-21 15:33:58.399138	7	20	17
102	6	Accrington F.C.	Stoke City	0	0	2	0	\N	\N	\N	\N	2016-02-21 15:33:58.405989	2016-02-21 15:33:58.405989	7	10	18
103	6	Aston Villa	Stoke City	0	0	5	1	\N	\N	\N	\N	2016-02-21 15:33:58.412358	2016-02-21 15:33:58.412358	7	9	18
104	6	Blackburn Rovers	Stoke City	0	0	5	2	\N	\N	\N	\N	2016-02-21 15:33:58.418993	2016-02-21 15:33:58.418993	7	11	18
105	6	Bolton Wanderers	Stoke City	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:33:58.426162	2016-02-21 15:33:58.426162	7	12	18
106	6	Burnley	Stoke City	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:33:58.433336	2016-02-21 15:33:58.433336	7	13	18
107	6	Derby County	Stoke City	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:33:58.441389	2016-02-21 15:33:58.441389	7	14	18
108	6	Everton	Stoke City	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:33:58.448852	2016-02-21 15:33:58.448852	7	15	18
109	6	Notts County	Stoke City	0	0	0	3	\N	\N	\N	\N	2016-02-21 15:33:58.456106	2016-02-21 15:33:58.456106	7	16	18
110	6	Preston North End	Stoke City	0	0	7	0	\N	\N	\N	\N	2016-02-21 15:33:58.463106	2016-02-21 15:33:58.463106	7	17	18
111	6	West Bromwich Albion	Stoke City	0	0	2	0	\N	\N	\N	\N	2016-02-21 15:33:58.473026	2016-02-21 15:33:58.473026	7	19	18
112	6	Wolverhampton Wanderers	Stoke City	0	0	4	1	\N	\N	\N	\N	2016-02-21 15:33:58.480079	2016-02-21 15:33:58.480079	7	20	18
113	6	Accrington F.C.	West Bromwich Albion	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:33:58.48723	2016-02-21 15:33:58.48723	7	10	19
114	6	Aston Villa	West Bromwich Albion	0	0	2	0	\N	\N	\N	\N	2016-02-21 15:33:58.49453	2016-02-21 15:33:58.49453	7	9	19
115	6	Blackburn Rovers	West Bromwich Albion	0	0	6	2	\N	\N	\N	\N	2016-02-21 15:33:58.501003	2016-02-21 15:33:58.501003	7	11	19
116	6	Bolton Wanderers	West Bromwich Albion	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:33:58.507523	2016-02-21 15:33:58.507523	7	12	19
117	6	Burnley	West Bromwich Albion	0	0	2	0	\N	\N	\N	\N	2016-02-21 15:33:58.514146	2016-02-21 15:33:58.514146	7	13	19
118	6	Derby County	West Bromwich Albion	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:33:58.520559	2016-02-21 15:33:58.520559	7	14	19
119	6	Everton	West Bromwich Albion	0	0	1	4	\N	\N	\N	\N	2016-02-21 15:33:58.527507	2016-02-21 15:33:58.527507	7	15	19
120	6	Notts County	West Bromwich Albion	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:33:58.534684	2016-02-21 15:33:58.534684	7	16	19
121	6	Preston North End	West Bromwich Albion	0	0	3	0	\N	\N	\N	\N	2016-02-21 15:33:58.541514	2016-02-21 15:33:58.541514	7	17	19
122	6	Stoke City	West Bromwich Albion	0	0	0	2	\N	\N	\N	\N	2016-02-21 15:33:58.54839	2016-02-21 15:33:58.54839	7	18	19
123	6	Wolverhampton Wanderers	West Bromwich Albion	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:33:58.555339	2016-02-21 15:33:58.555339	7	20	19
124	6	Accrington F.C.	Wolverhampton Wanderers	0	0	4	4	\N	\N	\N	\N	2016-02-21 15:33:58.561659	2016-02-21 15:33:58.561659	7	10	20
125	6	Aston Villa	Wolverhampton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:33:58.569516	2016-02-21 15:33:58.569516	7	9	20
126	6	Blackburn Rovers	Wolverhampton Wanderers	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:33:58.576511	2016-02-21 15:33:58.576511	7	11	20
127	6	Bolton Wanderers	Wolverhampton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:33:58.582765	2016-02-21 15:33:58.582765	7	12	20
128	6	Burnley	Wolverhampton Wanderers	0	0	0	4	\N	\N	\N	\N	2016-02-21 15:33:58.588935	2016-02-21 15:33:58.588935	7	13	20
129	6	Derby County	Wolverhampton Wanderers	0	0	3	0	\N	\N	\N	\N	2016-02-21 15:33:58.595126	2016-02-21 15:33:58.595126	7	14	20
130	6	Everton	Wolverhampton Wanderers	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:33:58.601227	2016-02-21 15:33:58.601227	7	15	20
131	6	Notts County	Wolverhampton Wanderers	0	0	3	0	\N	\N	\N	\N	2016-02-21 15:33:58.607442	2016-02-21 15:33:58.607442	7	16	20
132	6	Preston North End	Wolverhampton Wanderers	0	0	5	2	\N	\N	\N	\N	2016-02-21 15:33:58.613675	2016-02-21 15:33:58.613675	7	17	20
133	6	Stoke City	Wolverhampton Wanderers	0	0	0	1	\N	\N	\N	\N	2016-02-21 15:33:58.620142	2016-02-21 15:33:58.620142	7	18	20
134	6	West Bromwich Albion	Wolverhampton Wanderers	0	0	1	3	\N	\N	\N	\N	2016-02-21 15:33:58.626052	2016-02-21 15:33:58.626052	7	19	20
135	6	Aston Villa	Accrington F.C.	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:36:20.496673	2016-02-21 15:36:20.496673	8	9	10
136	6	Blackburn Rovers	Accrington F.C.	0	0	3	2	\N	\N	\N	\N	2016-02-21 15:36:20.508616	2016-02-21 15:36:20.508616	8	11	10
137	6	Bolton Wanderers	Accrington F.C.	0	0	2	4	\N	\N	\N	\N	2016-02-21 15:36:20.517699	2016-02-21 15:36:20.517699	8	12	10
138	6	Burnley	Accrington F.C.	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:36:20.527363	2016-02-21 15:36:20.527363	8	13	10
139	6	Derby County	Accrington F.C.	0	0	2	3	\N	\N	\N	\N	2016-02-21 15:36:20.535365	2016-02-21 15:36:20.535365	8	14	10
140	6	Everton	Accrington F.C.	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:36:20.543734	2016-02-21 15:36:20.543734	8	15	10
141	6	Notts County	Accrington F.C.	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:36:20.553606	2016-02-21 15:36:20.553606	8	16	10
142	6	Preston North End	Accrington F.C.	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:36:20.5637	2016-02-21 15:36:20.5637	8	17	10
143	6	Stoke City	Accrington F.C.	0	0	7	1	\N	\N	\N	\N	2016-02-21 15:36:20.57192	2016-02-21 15:36:20.57192	8	18	10
144	6	West Bromwich Albion	Accrington F.C.	0	0	4	1	\N	\N	\N	\N	2016-02-21 15:36:20.579929	2016-02-21 15:36:20.579929	8	19	10
145	6	Wolverhampton Wanderers	Accrington F.C.	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:36:20.58836	2016-02-21 15:36:20.58836	8	20	10
146	6	Accrington F.C.	Aston Villa	0	0	4	2	\N	\N	\N	\N	2016-02-21 15:36:20.597447	2016-02-21 15:36:20.597447	8	10	9
147	6	Blackburn Rovers	Aston Villa	0	0	7	0	\N	\N	\N	\N	2016-02-21 15:36:20.605763	2016-02-21 15:36:20.605763	8	11	9
148	6	Bolton Wanderers	Aston Villa	0	0	2	0	\N	\N	\N	\N	2016-02-21 15:36:20.61323	2016-02-21 15:36:20.61323	8	12	9
149	6	Burnley	Aston Villa	0	0	2	6	\N	\N	\N	\N	2016-02-21 15:36:20.622214	2016-02-21 15:36:20.622214	8	13	9
150	6	Derby County	Aston Villa	0	0	5	0	\N	\N	\N	\N	2016-02-21 15:36:20.63036	2016-02-21 15:36:20.63036	8	14	9
151	6	Everton	Aston Villa	0	0	7	0	\N	\N	\N	\N	2016-02-21 15:36:20.638202	2016-02-21 15:36:20.638202	8	15	9
152	6	Notts County	Aston Villa	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:36:20.64713	2016-02-21 15:36:20.64713	8	16	9
153	6	Preston North End	Aston Villa	0	0	3	2	\N	\N	\N	\N	2016-02-21 15:36:20.655447	2016-02-21 15:36:20.655447	8	17	9
154	6	Stoke City	Aston Villa	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:36:20.664595	2016-02-21 15:36:20.664595	8	18	9
155	6	West Bromwich Albion	Aston Villa	0	0	3	0	\N	\N	\N	\N	2016-02-21 15:36:20.672284	2016-02-21 15:36:20.672284	8	19	9
156	6	Wolverhampton Wanderers	Aston Villa	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:36:20.679902	2016-02-21 15:36:20.679902	8	20	9
157	6	Accrington F.C.	Blackburn Rovers	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:36:20.686853	2016-02-21 15:36:20.686853	8	10	11
158	6	Aston Villa	Blackburn Rovers	0	0	3	0	\N	\N	\N	\N	2016-02-21 15:36:20.695092	2016-02-21 15:36:20.695092	8	9	11
159	6	Bolton Wanderers	Blackburn Rovers	0	0	3	2	\N	\N	\N	\N	2016-02-21 15:36:20.703976	2016-02-21 15:36:20.703976	8	12	11
160	6	Burnley	Blackburn Rovers	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:36:20.712671	2016-02-21 15:36:20.712671	8	13	11
161	6	Derby County	Blackburn Rovers	0	0	4	0	\N	\N	\N	\N	2016-02-21 15:36:20.723798	2016-02-21 15:36:20.723798	8	14	11
162	6	Everton	Blackburn Rovers	0	0	3	2	\N	\N	\N	\N	2016-02-21 15:36:20.732055	2016-02-21 15:36:20.732055	8	15	11
163	6	Notts County	Blackburn Rovers	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:36:20.739468	2016-02-21 15:36:20.739468	8	16	11
164	6	Preston North End	Blackburn Rovers	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:36:20.747271	2016-02-21 15:36:20.747271	8	17	11
165	6	Stoke City	Blackburn Rovers	0	0	0	3	\N	\N	\N	\N	2016-02-21 15:36:20.756391	2016-02-21 15:36:20.756391	8	18	11
166	6	West Bromwich Albion	Blackburn Rovers	0	0	3	2	\N	\N	\N	\N	2016-02-21 15:36:20.766181	2016-02-21 15:36:20.766181	8	19	11
167	6	Wolverhampton Wanderers	Blackburn Rovers	0	0	2	4	\N	\N	\N	\N	2016-02-21 15:36:20.774286	2016-02-21 15:36:20.774286	8	20	11
168	6	Accrington F.C.	Bolton Wanderers	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:36:20.781383	2016-02-21 15:36:20.781383	8	10	12
169	6	Aston Villa	Bolton Wanderers	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:36:20.788803	2016-02-21 15:36:20.788803	8	9	12
170	6	Blackburn Rovers	Bolton Wanderers	0	0	7	1	\N	\N	\N	\N	2016-02-21 15:36:20.7982	2016-02-21 15:36:20.7982	8	11	12
171	6	Burnley	Bolton Wanderers	0	0	7	0	\N	\N	\N	\N	2016-02-21 15:36:20.806163	2016-02-21 15:36:20.806163	8	13	12
172	6	Derby County	Bolton Wanderers	0	0	3	2	\N	\N	\N	\N	2016-02-21 15:36:20.814009	2016-02-21 15:36:20.814009	8	14	12
173	6	Everton	Bolton Wanderers	0	0	3	0	\N	\N	\N	\N	2016-02-21 15:36:20.822721	2016-02-21 15:36:20.822721	8	15	12
174	6	Notts County	Bolton Wanderers	0	0	3	5	\N	\N	\N	\N	2016-02-21 15:36:20.830837	2016-02-21 15:36:20.830837	8	16	12
175	6	Preston North End	Bolton Wanderers	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:36:20.84192	2016-02-21 15:36:20.84192	8	17	12
176	6	Stoke City	Bolton Wanderers	0	0	0	1	\N	\N	\N	\N	2016-02-21 15:36:20.850591	2016-02-21 15:36:20.850591	8	18	12
177	6	West Bromwich Albion	Bolton Wanderers	0	0	6	3	\N	\N	\N	\N	2016-02-21 15:36:20.858514	2016-02-21 15:36:20.858514	8	19	12
178	6	Wolverhampton Wanderers	Bolton Wanderers	0	0	5	1	\N	\N	\N	\N	2016-02-21 15:36:20.867292	2016-02-21 15:36:20.867292	8	20	12
179	6	Accrington F.C.	Burnley	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:36:20.875186	2016-02-21 15:36:20.875186	8	10	13
180	6	Aston Villa	Burnley	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:36:20.885252	2016-02-21 15:36:20.885252	8	9	13
181	6	Blackburn Rovers	Burnley	0	0	7	1	\N	\N	\N	\N	2016-02-21 15:36:20.893688	2016-02-21 15:36:20.893688	8	11	13
182	6	Bolton Wanderers	Burnley	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:36:20.903424	2016-02-21 15:36:20.903424	8	12	13
183	6	Derby County	Burnley	0	0	4	1	\N	\N	\N	\N	2016-02-21 15:36:20.913068	2016-02-21 15:36:20.913068	8	14	13
184	6	Everton	Burnley	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:36:20.920692	2016-02-21 15:36:20.920692	8	15	13
185	6	Notts County	Burnley	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:36:20.92943	2016-02-21 15:36:20.92943	8	16	13
186	6	Preston North End	Burnley	0	0	6	0	\N	\N	\N	\N	2016-02-21 15:36:20.9376	2016-02-21 15:36:20.9376	8	17	13
187	6	Stoke City	Burnley	0	0	3	4	\N	\N	\N	\N	2016-02-21 15:36:20.947349	2016-02-21 15:36:20.947349	8	18	13
188	6	West Bromwich Albion	Burnley	0	0	6	1	\N	\N	\N	\N	2016-02-21 15:36:20.954884	2016-02-21 15:36:20.954884	8	19	13
189	6	Wolverhampton Wanderers	Burnley	0	0	9	1	\N	\N	\N	\N	2016-02-21 15:36:20.96414	2016-02-21 15:36:20.96414	8	20	13
190	6	Accrington F.C.	Derby County	0	0	6	1	\N	\N	\N	\N	2016-02-21 15:36:20.975086	2016-02-21 15:36:20.975086	8	10	14
191	6	Aston Villa	Derby County	0	0	7	1	\N	\N	\N	\N	2016-02-21 15:36:20.98397	2016-02-21 15:36:20.98397	8	9	14
192	6	Blackburn Rovers	Derby County	0	0	4	2	\N	\N	\N	\N	2016-02-21 15:36:20.993637	2016-02-21 15:36:20.993637	8	11	14
193	6	Bolton Wanderers	Derby County	0	0	7	1	\N	\N	\N	\N	2016-02-21 15:36:21.001544	2016-02-21 15:36:21.001544	8	12	14
194	6	Burnley	Derby County	0	0	2	0	\N	\N	\N	\N	2016-02-21 15:36:21.010882	2016-02-21 15:36:21.010882	8	13	14
195	6	Everton	Derby County	0	0	3	0	\N	\N	\N	\N	2016-02-21 15:36:21.020876	2016-02-21 15:36:21.020876	8	15	14
196	6	Notts County	Derby County	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:36:21.02991	2016-02-21 15:36:21.02991	8	16	14
197	6	Preston North End	Derby County	0	0	5	0	\N	\N	\N	\N	2016-02-21 15:36:21.038409	2016-02-21 15:36:21.038409	8	17	14
198	6	Stoke City	Derby County	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:36:21.046451	2016-02-21 15:36:21.046451	8	18	14
199	6	West Bromwich Albion	Derby County	0	0	2	3	\N	\N	\N	\N	2016-02-21 15:36:21.055806	2016-02-21 15:36:21.055806	8	19	14
200	6	Wolverhampton Wanderers	Derby County	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:36:21.06606	2016-02-21 15:36:21.06606	8	20	14
201	6	Accrington F.C.	Everton	0	0	5	3	\N	\N	\N	\N	2016-02-21 15:36:21.073951	2016-02-21 15:36:21.073951	8	10	15
202	6	Aston Villa	Everton	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:36:21.081474	2016-02-21 15:36:21.081474	8	9	15
203	6	Blackburn Rovers	Everton	0	0	2	4	\N	\N	\N	\N	2016-02-21 15:36:21.089302	2016-02-21 15:36:21.089302	8	11	15
204	6	Bolton Wanderers	Everton	0	0	3	4	\N	\N	\N	\N	2016-02-21 15:36:21.097101	2016-02-21 15:36:21.097101	8	12	15
205	6	Burnley	Everton	0	0	0	1	\N	\N	\N	\N	2016-02-21 15:36:21.106154	2016-02-21 15:36:21.106154	8	13	15
206	6	Derby County	Everton	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:36:21.113832	2016-02-21 15:36:21.113832	8	14	15
207	6	Notts County	Everton	0	0	4	3	\N	\N	\N	\N	2016-02-21 15:36:21.121416	2016-02-21 15:36:21.121416	8	16	15
208	6	Preston North End	Everton	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:36:21.129229	2016-02-21 15:36:21.129229	8	17	15
209	6	Stoke City	Everton	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:36:21.137326	2016-02-21 15:36:21.137326	8	18	15
210	6	West Bromwich Albion	Everton	0	0	4	1	\N	\N	\N	\N	2016-02-21 15:36:21.14555	2016-02-21 15:36:21.14555	8	19	15
211	6	Wolverhampton Wanderers	Everton	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:36:21.153842	2016-02-21 15:36:21.153842	8	20	15
212	6	Accrington F.C.	Notts County	0	0	1	8	\N	\N	\N	\N	2016-02-21 15:36:21.161384	2016-02-21 15:36:21.161384	8	10	16
213	6	Aston Villa	Notts County	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:36:21.16898	2016-02-21 15:36:21.16898	8	9	16
214	6	Blackburn Rovers	Notts County	0	0	9	1	\N	\N	\N	\N	2016-02-21 15:36:21.178355	2016-02-21 15:36:21.178355	8	11	16
215	6	Bolton Wanderers	Notts County	0	0	0	4	\N	\N	\N	\N	2016-02-21 15:36:21.186136	2016-02-21 15:36:21.186136	8	12	16
216	6	Burnley	Notts County	0	0	3	0	\N	\N	\N	\N	2016-02-21 15:36:21.194184	2016-02-21 15:36:21.194184	8	13	16
217	6	Derby County	Notts County	0	0	2	0	\N	\N	\N	\N	2016-02-21 15:36:21.202402	2016-02-21 15:36:21.202402	8	14	16
218	6	Everton	Notts County	0	0	5	3	\N	\N	\N	\N	2016-02-21 15:36:21.210211	2016-02-21 15:36:21.210211	8	15	16
219	6	Preston North End	Notts County	0	0	4	3	\N	\N	\N	\N	2016-02-21 15:36:21.220521	2016-02-21 15:36:21.220521	8	17	16
220	6	Stoke City	Notts County	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:36:21.228876	2016-02-21 15:36:21.228876	8	18	16
221	6	West Bromwich Albion	Notts County	0	0	4	2	\N	\N	\N	\N	2016-02-21 15:36:21.236805	2016-02-21 15:36:21.236805	8	19	16
222	6	Wolverhampton Wanderers	Notts County	0	0	2	0	\N	\N	\N	\N	2016-02-21 15:36:21.244529	2016-02-21 15:36:21.244529	8	20	16
223	6	Accrington F.C.	Preston North End	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:36:21.252112	2016-02-21 15:36:21.252112	8	10	17
224	6	Aston Villa	Preston North End	0	0	5	3	\N	\N	\N	\N	2016-02-21 15:36:21.260037	2016-02-21 15:36:21.260037	8	9	17
225	6	Blackburn Rovers	Preston North End	0	0	3	4	\N	\N	\N	\N	2016-02-21 15:36:21.268225	2016-02-21 15:36:21.268225	8	11	17
226	6	Bolton Wanderers	Preston North End	0	0	2	6	\N	\N	\N	\N	2016-02-21 15:36:21.276303	2016-02-21 15:36:21.276303	8	12	17
227	6	Burnley	Preston North End	0	0	0	3	\N	\N	\N	\N	2016-02-21 15:36:21.28457	2016-02-21 15:36:21.28457	8	13	17
228	6	Derby County	Preston North End	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:36:21.295889	2016-02-21 15:36:21.295889	8	14	17
229	6	Everton	Preston North End	0	0	1	5	\N	\N	\N	\N	2016-02-21 15:36:21.304158	2016-02-21 15:36:21.304158	8	15	17
230	6	Notts County	Preston North End	0	0	0	1	\N	\N	\N	\N	2016-02-21 15:36:21.312559	2016-02-21 15:36:21.312559	8	16	17
231	6	Stoke City	Preston North End	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:36:21.320739	2016-02-21 15:36:21.320739	8	18	17
232	6	West Bromwich Albion	Preston North End	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:36:21.331728	2016-02-21 15:36:21.331728	8	19	17
233	6	Wolverhampton Wanderers	Preston North End	0	0	0	1	\N	\N	\N	\N	2016-02-21 15:36:21.340188	2016-02-21 15:36:21.340188	8	20	17
234	6	Accrington F.C.	Stoke City	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:36:21.349799	2016-02-21 15:36:21.349799	8	10	18
235	6	Aston Villa	Stoke City	0	0	6	1	\N	\N	\N	\N	2016-02-21 15:36:21.358057	2016-02-21 15:36:21.358057	8	9	18
236	6	Blackburn Rovers	Stoke City	0	0	8	0	\N	\N	\N	\N	2016-02-21 15:36:21.367647	2016-02-21 15:36:21.367647	8	11	18
237	6	Bolton Wanderers	Stoke City	0	0	5	0	\N	\N	\N	\N	2016-02-21 15:36:21.377432	2016-02-21 15:36:21.377432	8	12	18
238	6	Burnley	Stoke City	0	0	1	3	\N	\N	\N	\N	2016-02-21 15:36:21.385943	2016-02-21 15:36:21.385943	8	13	18
239	6	Derby County	Stoke City	0	0	2	0	\N	\N	\N	\N	2016-02-21 15:36:21.395308	2016-02-21 15:36:21.395308	8	14	18
240	6	Everton	Stoke City	0	0	8	0	\N	\N	\N	\N	2016-02-21 15:36:21.4048	2016-02-21 15:36:21.4048	8	15	18
241	6	Notts County	Stoke City	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:36:21.412933	2016-02-21 15:36:21.412933	8	16	18
242	6	Preston North End	Stoke City	0	0	10	0	\N	\N	\N	\N	2016-02-21 15:36:21.423746	2016-02-21 15:36:21.423746	8	17	18
243	6	West Bromwich Albion	Stoke City	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:36:21.432106	2016-02-21 15:36:21.432106	8	19	18
244	6	Wolverhampton Wanderers	Stoke City	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:36:21.440632	2016-02-21 15:36:21.440632	8	20	18
245	6	Accrington F.C.	West Bromwich Albion	0	0	0	0	\N	\N	\N	\N	2016-02-21 15:36:21.448347	2016-02-21 15:36:21.448347	8	10	19
246	6	Aston Villa	West Bromwich Albion	0	0	1	0	\N	\N	\N	\N	2016-02-21 15:36:21.456294	2016-02-21 15:36:21.456294	8	9	19
247	6	Blackburn Rovers	West Bromwich Albion	0	0	5	0	\N	\N	\N	\N	2016-02-21 15:36:21.464291	2016-02-21 15:36:21.464291	8	11	19
248	6	Bolton Wanderers	West Bromwich Albion	0	0	7	0	\N	\N	\N	\N	2016-02-21 15:36:21.472742	2016-02-21 15:36:21.472742	8	12	19
249	6	Burnley	West Bromwich Albion	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:36:21.480151	2016-02-21 15:36:21.480151	8	13	19
250	6	Derby County	West Bromwich Albion	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:36:21.488222	2016-02-21 15:36:21.488222	8	14	19
251	6	Everton	West Bromwich Albion	0	0	5	1	\N	\N	\N	\N	2016-02-21 15:36:21.49808	2016-02-21 15:36:21.49808	8	15	19
252	6	Notts County	West Bromwich Albion	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:36:21.508053	2016-02-21 15:36:21.508053	8	16	19
253	6	Preston North End	West Bromwich Albion	0	0	5	0	\N	\N	\N	\N	2016-02-21 15:36:21.517196	2016-02-21 15:36:21.517196	8	17	19
254	6	Stoke City	West Bromwich Albion	0	0	1	3	\N	\N	\N	\N	2016-02-21 15:36:21.525724	2016-02-21 15:36:21.525724	8	18	19
255	6	Wolverhampton Wanderers	West Bromwich Albion	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:36:21.533998	2016-02-21 15:36:21.533998	8	20	19
256	6	Accrington F.C.	Wolverhampton Wanderers	0	0	6	3	\N	\N	\N	\N	2016-02-21 15:36:21.541946	2016-02-21 15:36:21.541946	8	10	20
257	6	Aston Villa	Wolverhampton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:36:21.549713	2016-02-21 15:36:21.549713	8	9	20
258	6	Blackburn Rovers	Wolverhampton Wanderers	0	0	4	3	\N	\N	\N	\N	2016-02-21 15:36:21.558557	2016-02-21 15:36:21.558557	8	11	20
259	6	Bolton Wanderers	Wolverhampton Wanderers	0	0	4	1	\N	\N	\N	\N	2016-02-21 15:36:21.568515	2016-02-21 15:36:21.568515	8	12	20
260	6	Burnley	Wolverhampton Wanderers	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:36:21.578439	2016-02-21 15:36:21.578439	8	13	20
261	6	Derby County	Wolverhampton Wanderers	0	0	3	3	\N	\N	\N	\N	2016-02-21 15:36:21.589332	2016-02-21 15:36:21.589332	8	14	20
262	6	Everton	Wolverhampton Wanderers	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:36:21.597421	2016-02-21 15:36:21.597421	8	15	20
263	6	Notts County	Wolverhampton Wanderers	0	0	0	2	\N	\N	\N	\N	2016-02-21 15:36:21.607221	2016-02-21 15:36:21.607221	8	16	20
264	6	Preston North End	Wolverhampton Wanderers	0	0	0	2	\N	\N	\N	\N	2016-02-21 15:36:21.614396	2016-02-21 15:36:21.614396	8	17	20
265	6	Stoke City	Wolverhampton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:36:21.621589	2016-02-21 15:36:21.621589	8	18	20
266	6	West Bromwich Albion	Wolverhampton Wanderers	0	0	1	4	\N	\N	\N	\N	2016-02-21 15:36:21.629533	2016-02-21 15:36:21.629533	8	19	20
267	6	Aston Villa	Accrington F.C.	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:55:49.837365	2016-02-21 15:55:49.837365	9	9	10
268	6	Blackburn Rovers	Accrington F.C.	0	0	0	0	\N	\N	\N	\N	2016-02-21 15:55:49.854975	2016-02-21 15:55:49.854975	9	11	10
269	6	Bolton Wanderers	Accrington F.C.	0	0	6	0	\N	\N	\N	\N	2016-02-21 15:55:49.862893	2016-02-21 15:55:49.862893	9	12	10
270	6	Burnley	Accrington F.C.	0	0	2	0	\N	\N	\N	\N	2016-02-21 15:55:49.870423	2016-02-21 15:55:49.870423	9	13	10
271	6	Derby County	Accrington F.C.	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:55:49.877193	2016-02-21 15:55:49.877193	9	14	10
272	6	Everton	Accrington F.C.	0	0	3	2	\N	\N	\N	\N	2016-02-21 15:55:49.916916	2016-02-21 15:55:49.916916	9	15	10
273	6	Notts County	Accrington F.C.	0	0	5	0	\N	\N	\N	\N	2016-02-21 15:55:49.934834	2016-02-21 15:55:49.934834	9	16	10
274	6	Preston North End	Accrington F.C.	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:55:49.944617	2016-02-21 15:55:49.944617	9	17	10
275	6	Sunderland	Accrington F.C.	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:55:49.954214	2016-02-21 15:55:49.954214	9	6	10
276	6	West Bromwich Albion	Accrington F.C.	0	0	5	1	\N	\N	\N	\N	2016-02-21 15:55:49.962953	2016-02-21 15:55:49.962953	9	19	10
277	6	Wolverhampton Wanderers	Accrington F.C.	0	0	3	0	\N	\N	\N	\N	2016-02-21 15:55:49.970835	2016-02-21 15:55:49.970835	9	20	10
278	6	Accrington F.C.	Aston Villa	0	0	1	3	\N	\N	\N	\N	2016-02-21 15:55:49.979057	2016-02-21 15:55:49.979057	9	10	9
279	6	Blackburn Rovers	Aston Villa	0	0	5	1	\N	\N	\N	\N	2016-02-21 15:55:49.990341	2016-02-21 15:55:49.990341	9	11	9
280	6	Bolton Wanderers	Aston Villa	0	0	4	0	\N	\N	\N	\N	2016-02-21 15:55:49.998457	2016-02-21 15:55:49.998457	9	12	9
281	6	Burnley	Aston Villa	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:55:50.00539	2016-02-21 15:55:50.00539	9	13	9
282	6	Derby County	Aston Villa	0	0	5	4	\N	\N	\N	\N	2016-02-21 15:55:50.01461	2016-02-21 15:55:50.01461	9	14	9
283	6	Everton	Aston Villa	0	0	5	0	\N	\N	\N	\N	2016-02-21 15:55:50.023636	2016-02-21 15:55:50.023636	9	15	9
284	6	Notts County	Aston Villa	0	0	7	1	\N	\N	\N	\N	2016-02-21 15:55:50.031554	2016-02-21 15:55:50.031554	9	16	9
285	6	Preston North End	Aston Villa	0	0	4	1	\N	\N	\N	\N	2016-02-21 15:55:50.040256	2016-02-21 15:55:50.040256	9	17	9
286	6	Sunderland	Aston Villa	0	0	5	1	\N	\N	\N	\N	2016-02-21 15:55:50.04672	2016-02-21 15:55:50.04672	9	6	9
287	6	West Bromwich Albion	Aston Villa	0	0	0	3	\N	\N	\N	\N	2016-02-21 15:55:50.057743	2016-02-21 15:55:50.057743	9	19	9
288	6	Wolverhampton Wanderers	Aston Villa	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:55:50.065416	2016-02-21 15:55:50.065416	9	20	9
289	6	Accrington F.C.	Blackburn Rovers	0	0	0	4	\N	\N	\N	\N	2016-02-21 15:55:50.07265	2016-02-21 15:55:50.07265	9	10	11
290	6	Aston Villa	Blackburn Rovers	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:55:50.098837	2016-02-21 15:55:50.098837	9	9	11
291	6	Bolton Wanderers	Blackburn Rovers	0	0	2	0	\N	\N	\N	\N	2016-02-21 15:55:50.106464	2016-02-21 15:55:50.106464	9	12	11
292	6	Burnley	Blackburn Rovers	0	0	1	6	\N	\N	\N	\N	2016-02-21 15:55:50.113915	2016-02-21 15:55:50.113915	9	13	11
293	6	Derby County	Blackburn Rovers	0	0	8	5	\N	\N	\N	\N	2016-02-21 15:55:50.121097	2016-02-21 15:55:50.121097	9	14	11
294	6	Everton	Blackburn Rovers	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:55:50.129461	2016-02-21 15:55:50.129461	9	15	11
295	6	Notts County	Blackburn Rovers	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:55:50.137155	2016-02-21 15:55:50.137155	9	16	11
296	6	Preston North End	Blackburn Rovers	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:55:50.145615	2016-02-21 15:55:50.145615	9	17	11
297	6	Sunderland	Blackburn Rovers	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:55:50.152844	2016-02-21 15:55:50.152844	9	6	11
298	6	West Bromwich Albion	Blackburn Rovers	0	0	1	0	\N	\N	\N	\N	2016-02-21 15:55:50.160522	2016-02-21 15:55:50.160522	9	19	11
299	6	Wolverhampton Wanderers	Blackburn Rovers	0	0	2	0	\N	\N	\N	\N	2016-02-21 15:55:50.167825	2016-02-21 15:55:50.167825	9	20	11
300	6	Accrington F.C.	Bolton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:55:50.174802	2016-02-21 15:55:50.174802	9	10	12
301	6	Aston Villa	Bolton Wanderers	0	0	5	0	\N	\N	\N	\N	2016-02-21 15:55:50.185618	2016-02-21 15:55:50.185618	9	9	12
302	6	Blackburn Rovers	Bolton Wanderers	0	0	0	2	\N	\N	\N	\N	2016-02-21 15:55:50.194458	2016-02-21 15:55:50.194458	9	11	12
303	6	Burnley	Bolton Wanderers	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:55:50.203199	2016-02-21 15:55:50.203199	9	13	12
304	6	Derby County	Bolton Wanderers	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:55:50.212061	2016-02-21 15:55:50.212061	9	14	12
305	6	Everton	Bolton Wanderers	0	0	2	0	\N	\N	\N	\N	2016-02-21 15:55:50.221655	2016-02-21 15:55:50.221655	9	15	12
306	6	Notts County	Bolton Wanderers	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:55:50.229777	2016-02-21 15:55:50.229777	9	16	12
307	6	Preston North End	Bolton Wanderers	0	0	1	0	\N	\N	\N	\N	2016-02-21 15:55:50.238058	2016-02-21 15:55:50.238058	9	17	12
308	6	Sunderland	Bolton Wanderers	0	0	2	0	\N	\N	\N	\N	2016-02-21 15:55:50.246408	2016-02-21 15:55:50.246408	9	6	12
309	6	West Bromwich Albion	Bolton Wanderers	0	0	2	4	\N	\N	\N	\N	2016-02-21 15:55:50.255301	2016-02-21 15:55:50.255301	9	19	12
310	6	Wolverhampton Wanderers	Bolton Wanderers	0	0	1	0	\N	\N	\N	\N	2016-02-21 15:55:50.263647	2016-02-21 15:55:50.263647	9	20	12
311	6	Accrington F.C.	Burnley	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:55:50.271916	2016-02-21 15:55:50.271916	9	10	13
312	6	Aston Villa	Burnley	0	0	4	4	\N	\N	\N	\N	2016-02-21 15:55:50.280016	2016-02-21 15:55:50.280016	9	9	13
313	6	Blackburn Rovers	Burnley	0	0	5	2	\N	\N	\N	\N	2016-02-21 15:55:50.28795	2016-02-21 15:55:50.28795	9	11	13
314	6	Bolton Wanderers	Burnley	0	0	1	0	\N	\N	\N	\N	2016-02-21 15:55:50.29702	2016-02-21 15:55:50.29702	9	12	13
315	6	Derby County	Burnley	0	0	2	4	\N	\N	\N	\N	2016-02-21 15:55:50.305835	2016-02-21 15:55:50.305835	9	14	13
316	6	Everton	Burnley	0	0	7	3	\N	\N	\N	\N	2016-02-21 15:55:50.317263	2016-02-21 15:55:50.317263	9	15	13
317	6	Notts County	Burnley	0	0	4	0	\N	\N	\N	\N	2016-02-21 15:55:50.32765	2016-02-21 15:55:50.32765	9	16	13
318	6	Preston North End	Burnley	0	0	7	0	\N	\N	\N	\N	2016-02-21 15:55:50.336989	2016-02-21 15:55:50.336989	9	17	13
319	6	Sunderland	Burnley	0	0	2	3	\N	\N	\N	\N	2016-02-21 15:55:50.345568	2016-02-21 15:55:50.345568	9	6	13
320	6	West Bromwich Albion	Burnley	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:55:50.353935	2016-02-21 15:55:50.353935	9	19	13
321	6	Wolverhampton Wanderers	Burnley	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:55:50.364264	2016-02-21 15:55:50.364264	9	20	13
322	6	Accrington F.C.	Derby County	0	0	4	0	\N	\N	\N	\N	2016-02-21 15:55:50.375585	2016-02-21 15:55:50.375585	9	10	14
323	6	Aston Villa	Derby County	0	0	4	0	\N	\N	\N	\N	2016-02-21 15:55:50.385067	2016-02-21 15:55:50.385067	9	9	14
324	6	Blackburn Rovers	Derby County	0	0	8	0	\N	\N	\N	\N	2016-02-21 15:55:50.396081	2016-02-21 15:55:50.396081	9	11	14
325	6	Bolton Wanderers	Derby County	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:55:50.405262	2016-02-21 15:55:50.405262	9	12	14
326	6	Burnley	Derby County	0	0	6	1	\N	\N	\N	\N	2016-02-21 15:55:50.416802	2016-02-21 15:55:50.416802	9	13	14
327	6	Everton	Derby County	0	0	7	0	\N	\N	\N	\N	2016-02-21 15:55:50.426636	2016-02-21 15:55:50.426636	9	15	14
328	6	Notts County	Derby County	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:55:50.438778	2016-02-21 15:55:50.438778	9	16	14
329	6	Preston North End	Derby County	0	0	6	0	\N	\N	\N	\N	2016-02-21 15:55:50.448888	2016-02-21 15:55:50.448888	9	17	14
330	6	Sunderland	Derby County	0	0	5	1	\N	\N	\N	\N	2016-02-21 15:55:50.458682	2016-02-21 15:55:50.458682	9	6	14
331	6	West Bromwich Albion	Derby County	0	0	3	4	\N	\N	\N	\N	2016-02-21 15:55:50.467602	2016-02-21 15:55:50.467602	9	19	14
332	6	Wolverhampton Wanderers	Derby County	0	0	5	1	\N	\N	\N	\N	2016-02-21 15:55:50.479006	2016-02-21 15:55:50.479006	9	20	14
333	6	Accrington F.C.	Everton	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:55:50.490592	2016-02-21 15:55:50.490592	9	10	15
334	6	Aston Villa	Everton	0	0	2	2	\N	\N	\N	\N	2016-02-21 15:55:50.499406	2016-02-21 15:55:50.499406	9	9	15
335	6	Blackburn Rovers	Everton	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:55:50.509065	2016-02-21 15:55:50.509065	9	11	15
336	6	Bolton Wanderers	Everton	0	0	0	5	\N	\N	\N	\N	2016-02-21 15:55:50.518622	2016-02-21 15:55:50.518622	9	12	15
337	6	Burnley	Everton	0	0	3	2	\N	\N	\N	\N	2016-02-21 15:55:50.528301	2016-02-21 15:55:50.528301	9	13	15
338	6	Derby County	Everton	0	0	2	6	\N	\N	\N	\N	2016-02-21 15:55:50.53738	2016-02-21 15:55:50.53738	9	14	15
339	6	Notts County	Everton	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:55:50.545922	2016-02-21 15:55:50.545922	9	16	15
340	6	Preston North End	Everton	0	0	2	0	\N	\N	\N	\N	2016-02-21 15:55:50.554709	2016-02-21 15:55:50.554709	9	17	15
341	6	Sunderland	Everton	0	0	1	0	\N	\N	\N	\N	2016-02-21 15:55:50.562333	2016-02-21 15:55:50.562333	9	6	15
342	6	West Bromwich Albion	Everton	0	0	1	4	\N	\N	\N	\N	2016-02-21 15:55:50.570041	2016-02-21 15:55:50.570041	9	19	15
343	6	Wolverhampton Wanderers	Everton	0	0	0	1	\N	\N	\N	\N	2016-02-21 15:55:50.577462	2016-02-21 15:55:50.577462	9	20	15
344	6	Accrington F.C.	Notts County	0	0	3	2	\N	\N	\N	\N	2016-02-21 15:55:50.585233	2016-02-21 15:55:50.585233	9	10	16
345	6	Aston Villa	Notts County	0	0	3	2	\N	\N	\N	\N	2016-02-21 15:55:50.593793	2016-02-21 15:55:50.593793	9	9	16
346	6	Blackburn Rovers	Notts County	0	0	1	7	\N	\N	\N	\N	2016-02-21 15:55:50.602504	2016-02-21 15:55:50.602504	9	11	16
347	6	Bolton Wanderers	Notts County	0	0	4	2	\N	\N	\N	\N	2016-02-21 15:55:50.612945	2016-02-21 15:55:50.612945	9	12	16
348	6	Burnley	Notts County	0	0	0	1	\N	\N	\N	\N	2016-02-21 15:55:50.623343	2016-02-21 15:55:50.623343	9	13	16
349	6	Derby County	Notts County	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:55:50.631545	2016-02-21 15:55:50.631545	9	14	16
350	6	Everton	Notts County	0	0	4	2	\N	\N	\N	\N	2016-02-21 15:55:50.639923	2016-02-21 15:55:50.639923	9	15	16
351	6	Preston North End	Notts County	0	0	0	0	\N	\N	\N	\N	2016-02-21 15:55:50.649956	2016-02-21 15:55:50.649956	9	17	16
352	6	Sunderland	Notts County	0	0	4	0	\N	\N	\N	\N	2016-02-21 15:55:50.660048	2016-02-21 15:55:50.660048	9	6	16
353	6	West Bromwich Albion	Notts County	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:55:50.671871	2016-02-21 15:55:50.671871	9	19	16
354	6	Wolverhampton Wanderers	Notts County	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:55:50.680573	2016-02-21 15:55:50.680573	9	20	16
355	6	Accrington F.C.	Preston North End	0	0	1	3	\N	\N	\N	\N	2016-02-21 15:55:50.692439	2016-02-21 15:55:50.692439	9	10	17
356	6	Aston Villa	Preston North End	0	0	0	1	\N	\N	\N	\N	2016-02-21 15:55:50.701852	2016-02-21 15:55:50.701852	9	9	17
357	6	Blackburn Rovers	Preston North End	0	0	1	0	\N	\N	\N	\N	2016-02-21 15:55:50.710707	2016-02-21 15:55:50.710707	9	11	17
358	6	Bolton Wanderers	Preston North End	0	0	1	0	\N	\N	\N	\N	2016-02-21 15:55:50.719304	2016-02-21 15:55:50.719304	9	12	17
359	6	Burnley	Preston North End	0	0	6	2	\N	\N	\N	\N	2016-02-21 15:55:50.73099	2016-02-21 15:55:50.73099	9	13	17
360	6	Derby County	Preston North End	0	0	1	3	\N	\N	\N	\N	2016-02-21 15:55:50.739711	2016-02-21 15:55:50.739711	9	14	17
361	6	Everton	Preston North End	0	0	0	1	\N	\N	\N	\N	2016-02-21 15:55:50.748204	2016-02-21 15:55:50.748204	9	15	17
362	6	Notts County	Preston North End	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:55:50.75845	2016-02-21 15:55:50.75845	9	16	17
363	6	Sunderland	Preston North End	0	0	3	0	\N	\N	\N	\N	2016-02-21 15:55:50.7699	2016-02-21 15:55:50.7699	9	6	17
364	6	West Bromwich Albion	Preston North End	0	0	1	3	\N	\N	\N	\N	2016-02-21 15:55:50.781342	2016-02-21 15:55:50.781342	9	19	17
365	6	Wolverhampton Wanderers	Preston North End	0	0	2	0	\N	\N	\N	\N	2016-02-21 15:55:50.79246	2016-02-21 15:55:50.79246	9	20	17
366	6	Accrington F.C.	Sunderland	0	0	4	1	\N	\N	\N	\N	2016-02-21 15:55:50.801346	2016-02-21 15:55:50.801346	9	10	6
367	6	Aston Villa	Sunderland	0	0	0	0	\N	\N	\N	\N	2016-02-21 15:55:50.809564	2016-02-21 15:55:50.809564	9	9	6
368	6	Blackburn Rovers	Sunderland	0	0	3	2	\N	\N	\N	\N	2016-02-21 15:55:50.81849	2016-02-21 15:55:50.81849	9	11	6
369	6	Bolton Wanderers	Sunderland	0	0	2	5	\N	\N	\N	\N	2016-02-21 15:55:50.831129	2016-02-21 15:55:50.831129	9	12	6
370	6	Burnley	Sunderland	0	0	3	3	\N	\N	\N	\N	2016-02-21 15:55:50.84111	2016-02-21 15:55:50.84111	9	13	6
371	6	Derby County	Sunderland	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:55:50.850028	2016-02-21 15:55:50.850028	9	14	6
372	6	Everton	Sunderland	0	0	1	0	\N	\N	\N	\N	2016-02-21 15:55:50.858067	2016-02-21 15:55:50.858067	9	15	6
373	6	Notts County	Sunderland	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:55:50.865864	2016-02-21 15:55:50.865864	9	16	6
374	6	Preston North End	Sunderland	0	0	0	0	\N	\N	\N	\N	2016-02-21 15:55:50.879926	2016-02-21 15:55:50.879926	9	17	6
375	6	West Bromwich Albion	Sunderland	0	0	0	4	\N	\N	\N	\N	2016-02-21 15:55:50.89088	2016-02-21 15:55:50.89088	9	19	6
376	6	Wolverhampton Wanderers	Sunderland	0	0	0	3	\N	\N	\N	\N	2016-02-21 15:55:50.899087	2016-02-21 15:55:50.899087	9	20	6
377	6	Accrington F.C.	West Bromwich Albion	0	0	1	0	\N	\N	\N	\N	2016-02-21 15:55:50.906963	2016-02-21 15:55:50.906963	9	10	19
378	6	Aston Villa	West Bromwich Albion	0	0	0	4	\N	\N	\N	\N	2016-02-21 15:55:50.916241	2016-02-21 15:55:50.916241	9	9	19
379	6	Blackburn Rovers	West Bromwich Albion	0	0	2	1	\N	\N	\N	\N	2016-02-21 15:55:50.924274	2016-02-21 15:55:50.924274	9	11	19
380	6	Bolton Wanderers	West Bromwich Albion	0	0	7	1	\N	\N	\N	\N	2016-02-21 15:55:50.933111	2016-02-21 15:55:50.933111	9	12	19
381	6	Burnley	West Bromwich Albion	0	0	5	4	\N	\N	\N	\N	2016-02-21 15:55:50.940924	2016-02-21 15:55:50.940924	9	13	19
382	6	Derby County	West Bromwich Albion	0	0	3	1	\N	\N	\N	\N	2016-02-21 15:55:50.955218	2016-02-21 15:55:50.955218	9	14	19
383	6	Everton	West Bromwich Albion	0	0	2	3	\N	\N	\N	\N	2016-02-21 15:55:50.963911	2016-02-21 15:55:50.963911	9	15	19
384	6	Notts County	West Bromwich Albion	0	0	3	2	\N	\N	\N	\N	2016-02-21 15:55:50.972303	2016-02-21 15:55:50.972303	9	16	19
385	6	Preston North End	West Bromwich Albion	0	0	3	0	\N	\N	\N	\N	2016-02-21 15:55:50.981238	2016-02-21 15:55:50.981238	9	17	19
386	6	Sunderland	West Bromwich Albion	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:55:50.990221	2016-02-21 15:55:50.990221	9	6	19
387	6	Wolverhampton Wanderers	West Bromwich Albion	0	0	4	0	\N	\N	\N	\N	2016-02-21 15:55:50.998403	2016-02-21 15:55:50.998403	9	20	19
388	6	Accrington F.C.	Wolverhampton Wanderers	0	0	1	2	\N	\N	\N	\N	2016-02-21 15:55:51.008761	2016-02-21 15:55:51.008761	9	10	20
389	6	Aston Villa	Wolverhampton Wanderers	0	0	6	2	\N	\N	\N	\N	2016-02-21 15:55:51.01831	2016-02-21 15:55:51.01831	9	9	20
390	6	Blackburn Rovers	Wolverhampton Wanderers	0	0	2	3	\N	\N	\N	\N	2016-02-21 15:55:51.026612	2016-02-21 15:55:51.026612	9	11	20
391	6	Bolton Wanderers	Wolverhampton Wanderers	0	0	6	0	\N	\N	\N	\N	2016-02-21 15:55:51.034108	2016-02-21 15:55:51.034108	9	12	20
392	6	Burnley	Wolverhampton Wanderers	0	0	4	2	\N	\N	\N	\N	2016-02-21 15:55:51.044385	2016-02-21 15:55:51.044385	9	13	20
393	6	Derby County	Wolverhampton Wanderers	0	0	9	0	\N	\N	\N	\N	2016-02-21 15:55:51.052857	2016-02-21 15:55:51.052857	9	14	20
394	6	Everton	Wolverhampton Wanderers	0	0	5	0	\N	\N	\N	\N	2016-02-21 15:55:51.062374	2016-02-21 15:55:51.062374	9	15	20
395	6	Notts County	Wolverhampton Wanderers	0	0	1	1	\N	\N	\N	\N	2016-02-21 15:55:51.071436	2016-02-21 15:55:51.071436	9	16	20
396	6	Preston North End	Wolverhampton Wanderers	0	0	5	1	\N	\N	\N	\N	2016-02-21 15:55:51.081206	2016-02-21 15:55:51.081206	9	17	20
397	6	Sunderland	Wolverhampton Wanderers	0	0	3	4	\N	\N	\N	\N	2016-02-21 15:55:51.093609	2016-02-21 15:55:51.093609	9	6	20
398	6	West Bromwich Albion	Wolverhampton Wanderers	0	0	0	1	\N	\N	\N	\N	2016-02-21 15:55:51.103504	2016-02-21 15:55:51.103504	9	19	20
399	6	Aston Villa	Accrington F.C.	0	0	12	2	\N	\N	\N	\N	2016-02-21 16:00:34.318734	2016-02-21 16:00:34.318734	10	9	10
400	6	Blackburn Rovers	Accrington F.C.	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:00:34.330969	2016-02-21 16:00:34.330969	10	11	10
401	6	Bolton Wanderers	Accrington F.C.	0	0	3	4	\N	\N	\N	\N	2016-02-21 16:00:34.337523	2016-02-21 16:00:34.337523	10	12	10
402	6	Burnley	Accrington F.C.	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:00:34.345203	2016-02-21 16:00:34.345203	10	13	10
403	6	Darwen	Accrington F.C.	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:00:34.358457	2016-02-21 16:00:34.358457	10	21	10
404	6	Derby County	Accrington F.C.	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:00:34.364602	2016-02-21 16:00:34.364602	10	14	10
405	6	Everton	Accrington F.C.	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:00:34.370778	2016-02-21 16:00:34.370778	10	15	10
406	6	Notts County	Accrington F.C.	0	0	9	0	\N	\N	\N	\N	2016-02-21 16:00:34.377114	2016-02-21 16:00:34.377114	10	16	10
407	6	Preston North End	Accrington F.C.	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:00:34.383344	2016-02-21 16:00:34.383344	10	17	10
408	6	Stoke City	Accrington F.C.	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:00:34.391128	2016-02-21 16:00:34.391128	10	18	10
409	6	Sunderland	Accrington F.C.	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:00:34.402078	2016-02-21 16:00:34.402078	10	6	10
410	6	West Bromwich Albion	Accrington F.C.	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:00:34.410437	2016-02-21 16:00:34.410437	10	19	10
411	6	Wolverhampton Wanderers	Accrington F.C.	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:00:34.418524	2016-02-21 16:00:34.418524	10	20	10
412	6	Accrington F.C.	Aston Villa	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:00:34.425732	2016-02-21 16:00:34.425732	10	10	9
413	6	Blackburn Rovers	Aston Villa	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:00:34.432349	2016-02-21 16:00:34.432349	10	11	9
414	6	Bolton Wanderers	Aston Villa	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:00:34.440532	2016-02-21 16:00:34.440532	10	12	9
415	6	Burnley	Aston Villa	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:00:34.448627	2016-02-21 16:00:34.448627	10	13	9
416	6	Darwen	Aston Villa	0	0	1	5	\N	\N	\N	\N	2016-02-21 16:00:34.455744	2016-02-21 16:00:34.455744	10	21	9
417	6	Derby County	Aston Villa	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:00:34.462491	2016-02-21 16:00:34.462491	10	14	9
418	6	Everton	Aston Villa	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:00:34.469186	2016-02-21 16:00:34.469186	10	15	9
419	6	Notts County	Aston Villa	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:00:34.475458	2016-02-21 16:00:34.475458	10	16	9
420	6	Preston North End	Aston Villa	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:00:34.488185	2016-02-21 16:00:34.488185	10	17	9
421	6	Stoke City	Aston Villa	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:00:34.495961	2016-02-21 16:00:34.495961	10	18	9
422	6	Sunderland	Aston Villa	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:00:34.503152	2016-02-21 16:00:34.503152	10	6	9
423	6	West Bromwich Albion	Aston Villa	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:00:34.510666	2016-02-21 16:00:34.510666	10	19	9
424	6	Wolverhampton Wanderers	Aston Villa	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:00:34.517777	2016-02-21 16:00:34.517777	10	20	9
425	6	Accrington F.C.	Blackburn Rovers	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:00:34.525494	2016-02-21 16:00:34.525494	10	10	11
426	6	Aston Villa	Blackburn Rovers	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:00:34.532635	2016-02-21 16:00:34.532635	10	9	11
427	6	Bolton Wanderers	Blackburn Rovers	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:00:34.538742	2016-02-21 16:00:34.538742	10	12	11
428	6	Burnley	Blackburn Rovers	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:00:34.544637	2016-02-21 16:00:34.544637	10	13	11
429	6	Darwen	Blackburn Rovers	0	0	3	5	\N	\N	\N	\N	2016-02-21 16:00:34.551118	2016-02-21 16:00:34.551118	10	21	11
430	6	Derby County	Blackburn Rovers	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:00:34.557576	2016-02-21 16:00:34.557576	10	14	11
431	6	Everton	Blackburn Rovers	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:00:34.564485	2016-02-21 16:00:34.564485	10	15	11
432	6	Notts County	Blackburn Rovers	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:00:34.572077	2016-02-21 16:00:34.572077	10	16	11
433	6	Preston North End	Blackburn Rovers	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:00:34.579568	2016-02-21 16:00:34.579568	10	17	11
434	6	Stoke City	Blackburn Rovers	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:00:34.589175	2016-02-21 16:00:34.589175	10	18	11
435	6	Sunderland	Blackburn Rovers	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:00:34.595969	2016-02-21 16:00:34.595969	10	6	11
436	6	West Bromwich Albion	Blackburn Rovers	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:00:34.603084	2016-02-21 16:00:34.603084	10	19	11
437	6	Wolverhampton Wanderers	Blackburn Rovers	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:00:34.610222	2016-02-21 16:00:34.610222	10	20	11
438	6	Accrington F.C.	Bolton Wanderers	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:00:34.616537	2016-02-21 16:00:34.616537	10	10	12
439	6	Aston Villa	Bolton Wanderers	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:00:34.623033	2016-02-21 16:00:34.623033	10	9	12
440	6	Blackburn Rovers	Bolton Wanderers	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:00:34.629126	2016-02-21 16:00:34.629126	10	11	12
441	6	Burnley	Bolton Wanderers	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:00:34.635743	2016-02-21 16:00:34.635743	10	13	12
442	6	Darwen	Bolton Wanderers	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:00:34.654285	2016-02-21 16:00:34.654285	10	21	12
443	6	Derby County	Bolton Wanderers	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:00:34.662713	2016-02-21 16:00:34.662713	10	14	12
444	6	Everton	Bolton Wanderers	0	0	2	5	\N	\N	\N	\N	2016-02-21 16:00:34.670496	2016-02-21 16:00:34.670496	10	15	12
445	6	Notts County	Bolton Wanderers	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:00:34.678067	2016-02-21 16:00:34.678067	10	16	12
446	6	Preston North End	Bolton Wanderers	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:00:34.68519	2016-02-21 16:00:34.68519	10	17	12
447	6	Stoke City	Bolton Wanderers	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:00:34.692573	2016-02-21 16:00:34.692573	10	18	12
448	6	Sunderland	Bolton Wanderers	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:00:34.699426	2016-02-21 16:00:34.699426	10	6	12
449	6	West Bromwich Albion	Bolton Wanderers	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:00:34.708936	2016-02-21 16:00:34.708936	10	19	12
450	6	Wolverhampton Wanderers	Bolton Wanderers	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:00:34.716187	2016-02-21 16:00:34.716187	10	20	12
451	6	Accrington F.C.	Burnley	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:00:34.723105	2016-02-21 16:00:34.723105	10	10	13
452	6	Aston Villa	Burnley	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:00:34.729087	2016-02-21 16:00:34.729087	10	9	13
453	6	Blackburn Rovers	Burnley	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:00:34.736328	2016-02-21 16:00:34.736328	10	11	13
454	6	Bolton Wanderers	Burnley	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:00:34.743397	2016-02-21 16:00:34.743397	10	12	13
455	6	Darwen	Burnley	0	0	2	6	\N	\N	\N	\N	2016-02-21 16:00:34.749833	2016-02-21 16:00:34.749833	10	21	13
456	6	Derby County	Burnley	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:00:34.756792	2016-02-21 16:00:34.756792	10	14	13
457	6	Everton	Burnley	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:00:34.765284	2016-02-21 16:00:34.765284	10	15	13
458	6	Notts County	Burnley	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:00:34.772725	2016-02-21 16:00:34.772725	10	16	13
459	6	Preston North End	Burnley	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:00:34.778971	2016-02-21 16:00:34.778971	10	17	13
460	6	Stoke City	Burnley	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:00:34.785115	2016-02-21 16:00:34.785115	10	18	13
461	6	Sunderland	Burnley	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:00:34.79339	2016-02-21 16:00:34.79339	10	6	13
462	6	West Bromwich Albion	Burnley	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:00:34.800578	2016-02-21 16:00:34.800578	10	19	13
463	6	Wolverhampton Wanderers	Burnley	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:00:34.806901	2016-02-21 16:00:34.806901	10	20	13
464	6	Accrington F.C.	Darwen	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:00:34.813259	2016-02-21 16:00:34.813259	10	10	21
465	6	Aston Villa	Darwen	0	0	7	0	\N	\N	\N	\N	2016-02-21 16:00:34.820095	2016-02-21 16:00:34.820095	10	9	21
466	6	Blackburn Rovers	Darwen	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:00:34.826604	2016-02-21 16:00:34.826604	10	11	21
467	6	Bolton Wanderers	Darwen	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:00:34.833254	2016-02-21 16:00:34.833254	10	12	21
468	6	Burnley	Darwen	0	0	9	0	\N	\N	\N	\N	2016-02-21 16:00:34.839667	2016-02-21 16:00:34.839667	10	13	21
469	6	Derby County	Darwen	0	0	7	0	\N	\N	\N	\N	2016-02-21 16:00:34.846046	2016-02-21 16:00:34.846046	10	14	21
470	6	Everton	Darwen	0	0	5	3	\N	\N	\N	\N	2016-02-21 16:00:34.85306	2016-02-21 16:00:34.85306	10	15	21
471	6	Notts County	Darwen	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:00:34.860337	2016-02-21 16:00:34.860337	10	16	21
472	6	Preston North End	Darwen	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:00:34.867237	2016-02-21 16:00:34.867237	10	17	21
473	6	Stoke City	Darwen	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:00:34.874034	2016-02-21 16:00:34.874034	10	18	21
474	6	Sunderland	Darwen	0	0	7	0	\N	\N	\N	\N	2016-02-21 16:00:34.881661	2016-02-21 16:00:34.881661	10	6	21
475	6	West Bromwich Albion	Darwen	0	0	12	0	\N	\N	\N	\N	2016-02-21 16:00:34.888747	2016-02-21 16:00:34.888747	10	19	21
476	6	Wolverhampton Wanderers	Darwen	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:00:34.895821	2016-02-21 16:00:34.895821	10	20	21
477	6	Accrington F.C.	Derby County	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:00:34.902822	2016-02-21 16:00:34.902822	10	10	14
478	6	Aston Villa	Derby County	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:00:34.90982	2016-02-21 16:00:34.90982	10	9	14
479	6	Blackburn Rovers	Derby County	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:00:34.916677	2016-02-21 16:00:34.916677	10	11	14
480	6	Bolton Wanderers	Derby County	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:00:34.923909	2016-02-21 16:00:34.923909	10	12	14
481	6	Burnley	Derby County	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:00:34.930863	2016-02-21 16:00:34.930863	10	13	14
482	6	Darwen	Derby County	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:00:34.939373	2016-02-21 16:00:34.939373	10	21	14
483	6	Everton	Derby County	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:00:34.946548	2016-02-21 16:00:34.946548	10	15	14
484	6	Notts County	Derby County	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:00:34.952993	2016-02-21 16:00:34.952993	10	16	14
485	6	Preston North End	Derby County	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:00:34.959263	2016-02-21 16:00:34.959263	10	17	14
486	6	Stoke City	Derby County	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:00:34.965221	2016-02-21 16:00:34.965221	10	18	14
487	6	Sunderland	Derby County	0	0	7	1	\N	\N	\N	\N	2016-02-21 16:00:34.971212	2016-02-21 16:00:34.971212	10	6	14
488	6	West Bromwich Albion	Derby County	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:00:34.977056	2016-02-21 16:00:34.977056	10	19	14
489	6	Wolverhampton Wanderers	Derby County	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:00:34.984147	2016-02-21 16:00:34.984147	10	20	14
490	6	Accrington F.C.	Everton	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:00:34.990513	2016-02-21 16:00:34.990513	10	10	15
491	6	Aston Villa	Everton	0	0	3	4	\N	\N	\N	\N	2016-02-21 16:00:34.996861	2016-02-21 16:00:34.996861	10	9	15
492	6	Blackburn Rovers	Everton	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:00:35.003483	2016-02-21 16:00:35.003483	10	11	15
493	6	Bolton Wanderers	Everton	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:00:35.009513	2016-02-21 16:00:35.009513	10	12	15
494	6	Burnley	Everton	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:00:35.015932	2016-02-21 16:00:35.015932	10	13	15
495	6	Darwen	Everton	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:00:35.024761	2016-02-21 16:00:35.024761	10	21	15
496	6	Derby County	Everton	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:00:35.032364	2016-02-21 16:00:35.032364	10	14	15
497	6	Notts County	Everton	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:00:35.038215	2016-02-21 16:00:35.038215	10	16	15
498	6	Preston North End	Everton	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:00:35.044463	2016-02-21 16:00:35.044463	10	17	15
499	6	Stoke City	Everton	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:00:35.052588	2016-02-21 16:00:35.052588	10	18	15
500	6	Sunderland	Everton	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:00:35.059561	2016-02-21 16:00:35.059561	10	6	15
501	6	West Bromwich Albion	Everton	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:00:35.066109	2016-02-21 16:00:35.066109	10	19	15
502	6	Wolverhampton Wanderers	Everton	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:00:35.073599	2016-02-21 16:00:35.073599	10	20	15
503	6	Accrington F.C.	Notts County	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:00:35.081331	2016-02-21 16:00:35.081331	10	10	16
504	6	Aston Villa	Notts County	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:00:35.087933	2016-02-21 16:00:35.087933	10	9	16
505	6	Blackburn Rovers	Notts County	0	0	5	4	\N	\N	\N	\N	2016-02-21 16:00:35.094357	2016-02-21 16:00:35.094357	10	11	16
506	6	Bolton Wanderers	Notts County	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:00:35.100677	2016-02-21 16:00:35.100677	10	12	16
507	6	Burnley	Notts County	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:00:35.107658	2016-02-21 16:00:35.107658	10	13	16
508	6	Darwen	Notts County	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:00:35.114655	2016-02-21 16:00:35.114655	10	21	16
509	6	Derby County	Notts County	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:00:35.121346	2016-02-21 16:00:35.121346	10	14	16
510	6	Everton	Notts County	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:00:35.127929	2016-02-21 16:00:35.127929	10	15	16
511	6	Preston North End	Notts County	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:00:35.133985	2016-02-21 16:00:35.133985	10	17	16
512	6	Stoke City	Notts County	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:00:35.140448	2016-02-21 16:00:35.140448	10	18	16
513	6	Sunderland	Notts County	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:00:35.146563	2016-02-21 16:00:35.146563	10	6	16
514	6	West Bromwich Albion	Notts County	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:00:35.158917	2016-02-21 16:00:35.158917	10	19	16
515	6	Wolverhampton Wanderers	Notts County	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:00:35.164865	2016-02-21 16:00:35.164865	10	20	16
516	6	Accrington F.C.	Preston North End	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:00:35.174775	2016-02-21 16:00:35.174775	10	10	17
517	6	Aston Villa	Preston North End	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:00:35.180909	2016-02-21 16:00:35.180909	10	9	17
518	6	Blackburn Rovers	Preston North End	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:00:35.188305	2016-02-21 16:00:35.188305	10	11	17
519	6	Bolton Wanderers	Preston North End	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:00:35.194161	2016-02-21 16:00:35.194161	10	12	17
520	6	Burnley	Preston North End	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:00:35.200003	2016-02-21 16:00:35.200003	10	13	17
521	6	Darwen	Preston North End	0	0	0	4	\N	\N	\N	\N	2016-02-21 16:00:35.20609	2016-02-21 16:00:35.20609	10	21	17
522	6	Derby County	Preston North End	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:00:35.212094	2016-02-21 16:00:35.212094	10	14	17
523	6	Everton	Preston North End	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:00:35.217918	2016-02-21 16:00:35.217918	10	15	17
524	6	Notts County	Preston North End	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:00:35.224233	2016-02-21 16:00:35.224233	10	16	17
525	6	Stoke City	Preston North End	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:00:35.230532	2016-02-21 16:00:35.230532	10	18	17
526	6	Sunderland	Preston North End	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:00:35.236408	2016-02-21 16:00:35.236408	10	6	17
527	6	West Bromwich Albion	Preston North End	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:00:35.242509	2016-02-21 16:00:35.242509	10	19	17
528	6	Wolverhampton Wanderers	Preston North End	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:00:35.248705	2016-02-21 16:00:35.248705	10	20	17
529	6	Accrington F.C.	Stoke City	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:00:35.255266	2016-02-21 16:00:35.255266	10	10	18
530	6	Aston Villa	Stoke City	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:00:35.261825	2016-02-21 16:00:35.261825	10	9	18
531	6	Blackburn Rovers	Stoke City	0	0	5	3	\N	\N	\N	\N	2016-02-21 16:00:35.268152	2016-02-21 16:00:35.268152	10	11	18
532	6	Bolton Wanderers	Stoke City	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:00:35.2768	2016-02-21 16:00:35.2768	10	12	18
533	6	Burnley	Stoke City	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:00:35.283569	2016-02-21 16:00:35.283569	10	13	18
534	6	Darwen	Stoke City	0	0	9	3	\N	\N	\N	\N	2016-02-21 16:00:35.290774	2016-02-21 16:00:35.290774	10	21	18
535	6	Derby County	Stoke City	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:00:35.298308	2016-02-21 16:00:35.298308	10	14	18
536	6	Everton	Stoke City	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:00:35.306703	2016-02-21 16:00:35.306703	10	15	18
537	6	Notts County	Stoke City	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:00:35.315369	2016-02-21 16:00:35.315369	10	16	18
538	6	Preston North End	Stoke City	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:00:35.335433	2016-02-21 16:00:35.335433	10	17	18
539	6	Sunderland	Stoke City	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:00:35.344699	2016-02-21 16:00:35.344699	10	6	18
540	6	West Bromwich Albion	Stoke City	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:00:35.35317	2016-02-21 16:00:35.35317	10	19	18
541	6	Wolverhampton Wanderers	Stoke City	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:00:35.370417	2016-02-21 16:00:35.370417	10	20	18
542	6	Accrington F.C.	Sunderland	0	0	3	5	\N	\N	\N	\N	2016-02-21 16:00:35.377149	2016-02-21 16:00:35.377149	10	10	6
543	6	Aston Villa	Sunderland	0	0	5	3	\N	\N	\N	\N	2016-02-21 16:00:35.384032	2016-02-21 16:00:35.384032	10	9	6
544	6	Blackburn Rovers	Sunderland	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:00:35.3902	2016-02-21 16:00:35.3902	10	11	6
545	6	Bolton Wanderers	Sunderland	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:00:35.396395	2016-02-21 16:00:35.396395	10	12	6
546	6	Burnley	Sunderland	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:00:35.40391	2016-02-21 16:00:35.40391	10	13	6
547	6	Darwen	Sunderland	0	0	1	7	\N	\N	\N	\N	2016-02-21 16:00:35.413757	2016-02-21 16:00:35.413757	10	21	6
548	6	Derby County	Sunderland	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:00:35.420451	2016-02-21 16:00:35.420451	10	14	6
549	6	Everton	Sunderland	0	0	0	4	\N	\N	\N	\N	2016-02-21 16:00:35.427205	2016-02-21 16:00:35.427205	10	15	6
550	6	Notts County	Sunderland	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:00:35.433361	2016-02-21 16:00:35.433361	10	16	6
551	6	Preston North End	Sunderland	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:00:35.439729	2016-02-21 16:00:35.439729	10	17	6
552	6	Stoke City	Sunderland	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:00:35.445784	2016-02-21 16:00:35.445784	10	18	6
553	6	West Bromwich Albion	Sunderland	0	0	2	5	\N	\N	\N	\N	2016-02-21 16:00:35.453949	2016-02-21 16:00:35.453949	10	19	6
554	6	Wolverhampton Wanderers	Sunderland	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:00:35.463068	2016-02-21 16:00:35.463068	10	20	6
555	6	Accrington F.C.	West Bromwich Albion	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:00:35.472422	2016-02-21 16:00:35.472422	10	10	19
556	6	Aston Villa	West Bromwich Albion	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:00:35.481419	2016-02-21 16:00:35.481419	10	9	19
557	6	Blackburn Rovers	West Bromwich Albion	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:00:35.490533	2016-02-21 16:00:35.490533	10	11	19
558	6	Bolton Wanderers	West Bromwich Albion	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:00:35.499728	2016-02-21 16:00:35.499728	10	12	19
559	6	Burnley	West Bromwich Albion	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:00:35.507546	2016-02-21 16:00:35.507546	10	13	19
560	6	Darwen	West Bromwich Albion	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:00:35.514442	2016-02-21 16:00:35.514442	10	21	19
561	6	Derby County	West Bromwich Albion	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:00:35.521329	2016-02-21 16:00:35.521329	10	14	19
562	6	Everton	West Bromwich Albion	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:00:35.530315	2016-02-21 16:00:35.530315	10	15	19
563	6	Notts County	West Bromwich Albion	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:00:35.537219	2016-02-21 16:00:35.537219	10	16	19
564	6	Preston North End	West Bromwich Albion	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:00:35.54388	2016-02-21 16:00:35.54388	10	17	19
565	6	Stoke City	West Bromwich Albion	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:00:35.550715	2016-02-21 16:00:35.550715	10	18	19
566	6	Sunderland	West Bromwich Albion	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:00:35.55802	2016-02-21 16:00:35.55802	10	6	19
567	6	Wolverhampton Wanderers	West Bromwich Albion	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:00:35.565379	2016-02-21 16:00:35.565379	10	20	19
568	6	Accrington F.C.	Wolverhampton Wanderers	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:00:35.572896	2016-02-21 16:00:35.572896	10	10	20
569	6	Aston Villa	Wolverhampton Wanderers	0	0	3	6	\N	\N	\N	\N	2016-02-21 16:00:35.580119	2016-02-21 16:00:35.580119	10	9	20
570	6	Blackburn Rovers	Wolverhampton Wanderers	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:00:35.586983	2016-02-21 16:00:35.586983	10	11	20
571	6	Bolton Wanderers	Wolverhampton Wanderers	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:00:35.594539	2016-02-21 16:00:35.594539	10	12	20
572	6	Burnley	Wolverhampton Wanderers	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:00:35.601648	2016-02-21 16:00:35.601648	10	13	20
573	6	Darwen	Wolverhampton Wanderers	0	0	1	4	\N	\N	\N	\N	2016-02-21 16:00:35.608788	2016-02-21 16:00:35.608788	10	21	20
574	6	Derby County	Wolverhampton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:00:35.61989	2016-02-21 16:00:35.61989	10	14	20
575	6	Everton	Wolverhampton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:00:35.627652	2016-02-21 16:00:35.627652	10	15	20
576	6	Notts County	Wolverhampton Wanderers	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:00:35.637502	2016-02-21 16:00:35.637502	10	16	20
577	6	Preston North End	Wolverhampton Wanderers	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:00:35.644833	2016-02-21 16:00:35.644833	10	17	20
578	6	Stoke City	Wolverhampton Wanderers	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:00:35.651734	2016-02-21 16:00:35.651734	10	18	20
579	6	Sunderland	Wolverhampton Wanderers	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:00:35.659546	2016-02-21 16:00:35.659546	10	6	20
580	6	West Bromwich Albion	Wolverhampton Wanderers	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:00:35.666819	2016-02-21 16:00:35.666819	10	19	20
581	6	Aston Villa	Accrington F.C.	0	0	6	4	\N	\N	\N	\N	2016-02-21 16:03:07.242344	2016-02-21 16:03:07.242344	11	9	10
582	6	Blackburn Rovers	Accrington F.C.	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:03:07.256115	2016-02-21 16:03:07.256115	11	11	10
583	6	Bolton Wanderers	Accrington F.C.	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:03:07.265019	2016-02-21 16:03:07.265019	11	12	10
584	6	Burnley	Accrington F.C.	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:03:07.27189	2016-02-21 16:03:07.27189	11	13	10
585	6	Derby County	Accrington F.C.	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:03:07.279276	2016-02-21 16:03:07.279276	11	14	10
586	6	Everton	Accrington F.C.	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:03:07.286839	2016-02-21 16:03:07.286839	11	15	10
587	6	Manchester United	Accrington F.C.	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:03:07.297216	2016-02-21 16:03:07.297216	11	4	10
588	6	Nottingham Forest	Accrington F.C.	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:03:07.313985	2016-02-21 16:03:07.313985	11	22	10
589	6	Notts County	Accrington F.C.	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:03:07.321413	2016-02-21 16:03:07.321413	11	16	10
590	6	Preston North End	Accrington F.C.	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:03:07.329604	2016-02-21 16:03:07.329604	11	17	10
591	6	Sheffield Wednesday	Accrington F.C.	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:03:07.346312	2016-02-21 16:03:07.346312	11	23	10
592	6	Stoke City	Accrington F.C.	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:03:07.354681	2016-02-21 16:03:07.354681	11	18	10
593	6	Sunderland	Accrington F.C.	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:03:07.36272	2016-02-21 16:03:07.36272	11	6	10
594	6	West Bromwich Albion	Accrington F.C.	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:03:07.372963	2016-02-21 16:03:07.372963	11	19	10
595	6	Wolverhampton Wanderers	Accrington F.C.	0	0	5	3	\N	\N	\N	\N	2016-02-21 16:03:07.381453	2016-02-21 16:03:07.381453	11	20	10
596	6	Accrington F.C.	Aston Villa	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:03:07.389319	2016-02-21 16:03:07.389319	11	10	9
597	6	Blackburn Rovers	Aston Villa	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:03:07.397222	2016-02-21 16:03:07.397222	11	11	9
598	6	Bolton Wanderers	Aston Villa	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:03:07.405169	2016-02-21 16:03:07.405169	11	12	9
599	6	Burnley	Aston Villa	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:03:07.41312	2016-02-21 16:03:07.41312	11	13	9
600	6	Derby County	Aston Villa	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:03:07.420798	2016-02-21 16:03:07.420798	11	14	9
601	6	Everton	Aston Villa	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:03:07.429291	2016-02-21 16:03:07.429291	11	15	9
602	6	Manchester United	Aston Villa	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:03:07.437672	2016-02-21 16:03:07.437672	11	4	9
603	6	Nottingham Forest	Aston Villa	0	0	4	5	\N	\N	\N	\N	2016-02-21 16:03:07.446156	2016-02-21 16:03:07.446156	11	22	9
604	6	Notts County	Aston Villa	0	0	1	4	\N	\N	\N	\N	2016-02-21 16:03:07.454587	2016-02-21 16:03:07.454587	11	16	9
605	6	Preston North End	Aston Villa	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:03:07.462973	2016-02-21 16:03:07.462973	11	17	9
606	6	Sheffield Wednesday	Aston Villa	0	0	5	3	\N	\N	\N	\N	2016-02-21 16:03:07.47143	2016-02-21 16:03:07.47143	11	23	9
607	6	Stoke City	Aston Villa	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:03:07.479769	2016-02-21 16:03:07.479769	11	18	9
608	6	Sunderland	Aston Villa	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:03:07.487332	2016-02-21 16:03:07.487332	11	6	9
609	6	West Bromwich Albion	Aston Villa	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:03:07.496206	2016-02-21 16:03:07.496206	11	19	9
610	6	Wolverhampton Wanderers	Aston Villa	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:03:07.503998	2016-02-21 16:03:07.503998	11	20	9
611	6	Accrington F.C.	Blackburn Rovers	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:03:07.513217	2016-02-21 16:03:07.513217	11	10	11
612	6	Aston Villa	Blackburn Rovers	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:03:07.521484	2016-02-21 16:03:07.521484	11	9	11
613	6	Bolton Wanderers	Blackburn Rovers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:03:07.528699	2016-02-21 16:03:07.528699	11	12	11
614	6	Burnley	Blackburn Rovers	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:03:07.536216	2016-02-21 16:03:07.536216	11	13	11
615	6	Derby County	Blackburn Rovers	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:03:07.543115	2016-02-21 16:03:07.543115	11	14	11
616	6	Everton	Blackburn Rovers	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:03:07.55066	2016-02-21 16:03:07.55066	11	15	11
617	6	Manchester United	Blackburn Rovers	0	0	4	4	\N	\N	\N	\N	2016-02-21 16:03:07.558559	2016-02-21 16:03:07.558559	11	4	11
618	6	Nottingham Forest	Blackburn Rovers	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:03:07.566945	2016-02-21 16:03:07.566945	11	22	11
619	6	Notts County	Blackburn Rovers	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:03:07.575288	2016-02-21 16:03:07.575288	11	16	11
620	6	Preston North End	Blackburn Rovers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:03:07.583669	2016-02-21 16:03:07.583669	11	17	11
621	6	Sheffield Wednesday	Blackburn Rovers	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:03:07.592029	2016-02-21 16:03:07.592029	11	23	11
622	6	Stoke City	Blackburn Rovers	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:03:07.600734	2016-02-21 16:03:07.600734	11	18	11
623	6	Sunderland	Blackburn Rovers	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:03:07.610133	2016-02-21 16:03:07.610133	11	6	11
624	6	West Bromwich Albion	Blackburn Rovers	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:03:07.617562	2016-02-21 16:03:07.617562	11	19	11
625	6	Wolverhampton Wanderers	Blackburn Rovers	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:03:07.624117	2016-02-21 16:03:07.624117	11	20	11
626	6	Accrington F.C.	Bolton Wanderers	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:03:07.63074	2016-02-21 16:03:07.63074	11	10	12
627	6	Aston Villa	Bolton Wanderers	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:03:07.63682	2016-02-21 16:03:07.63682	11	9	12
628	6	Blackburn Rovers	Bolton Wanderers	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:03:07.642989	2016-02-21 16:03:07.642989	11	11	12
629	6	Burnley	Bolton Wanderers	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:03:07.649275	2016-02-21 16:03:07.649275	11	13	12
630	6	Derby County	Bolton Wanderers	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:03:07.655607	2016-02-21 16:03:07.655607	11	14	12
631	6	Everton	Bolton Wanderers	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:03:07.662768	2016-02-21 16:03:07.662768	11	15	12
632	6	Manchester United	Bolton Wanderers	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:03:07.671427	2016-02-21 16:03:07.671427	11	4	12
633	6	Nottingham Forest	Bolton Wanderers	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:03:07.68056	2016-02-21 16:03:07.68056	11	22	12
634	6	Notts County	Bolton Wanderers	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:03:07.689055	2016-02-21 16:03:07.689055	11	16	12
635	6	Preston North End	Bolton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:03:07.697887	2016-02-21 16:03:07.697887	11	17	12
636	6	Sheffield Wednesday	Bolton Wanderers	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:03:07.706382	2016-02-21 16:03:07.706382	11	23	12
637	6	Stoke City	Bolton Wanderers	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:03:07.714976	2016-02-21 16:03:07.714976	11	18	12
638	6	Sunderland	Bolton Wanderers	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:03:07.725349	2016-02-21 16:03:07.725349	11	6	12
639	6	West Bromwich Albion	Bolton Wanderers	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:03:07.73311	2016-02-21 16:03:07.73311	11	19	12
640	6	Wolverhampton Wanderers	Bolton Wanderers	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:03:07.741733	2016-02-21 16:03:07.741733	11	20	12
641	6	Accrington F.C.	Burnley	0	0	0	4	\N	\N	\N	\N	2016-02-21 16:03:07.749722	2016-02-21 16:03:07.749722	11	10	13
642	6	Aston Villa	Burnley	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:03:07.765166	2016-02-21 16:03:07.765166	11	9	13
643	6	Blackburn Rovers	Burnley	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:03:07.778761	2016-02-21 16:03:07.778761	11	11	13
644	6	Bolton Wanderers	Burnley	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:03:07.785612	2016-02-21 16:03:07.785612	11	12	13
645	6	Derby County	Burnley	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:03:07.792195	2016-02-21 16:03:07.792195	11	14	13
646	6	Everton	Burnley	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:03:07.80008	2016-02-21 16:03:07.80008	11	15	13
647	6	Manchester United	Burnley	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:03:07.807469	2016-02-21 16:03:07.807469	11	4	13
648	6	Nottingham Forest	Burnley	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:03:07.813696	2016-02-21 16:03:07.813696	11	22	13
649	6	Notts County	Burnley	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:03:07.819919	2016-02-21 16:03:07.819919	11	16	13
650	6	Preston North End	Burnley	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:03:07.827634	2016-02-21 16:03:07.827634	11	17	13
651	6	Sheffield Wednesday	Burnley	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:03:07.835473	2016-02-21 16:03:07.835473	11	23	13
652	6	Stoke City	Burnley	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:03:07.842196	2016-02-21 16:03:07.842196	11	18	13
653	6	Sunderland	Burnley	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:03:07.848764	2016-02-21 16:03:07.848764	11	6	13
654	6	West Bromwich Albion	Burnley	0	0	7	1	\N	\N	\N	\N	2016-02-21 16:03:07.855349	2016-02-21 16:03:07.855349	11	19	13
655	6	Wolverhampton Wanderers	Burnley	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:03:07.862607	2016-02-21 16:03:07.862607	11	20	13
656	6	Accrington F.C.	Derby County	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:03:07.872304	2016-02-21 16:03:07.872304	11	10	14
657	6	Aston Villa	Derby County	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:03:07.879394	2016-02-21 16:03:07.879394	11	9	14
658	6	Blackburn Rovers	Derby County	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:03:07.886739	2016-02-21 16:03:07.886739	11	11	14
659	6	Bolton Wanderers	Derby County	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:03:07.895104	2016-02-21 16:03:07.895104	11	12	14
660	6	Burnley	Derby County	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:03:07.902732	2016-02-21 16:03:07.902732	11	13	14
661	6	Everton	Derby County	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:03:07.910113	2016-02-21 16:03:07.910113	11	15	14
662	6	Manchester United	Derby County	0	0	7	1	\N	\N	\N	\N	2016-02-21 16:03:07.917408	2016-02-21 16:03:07.917408	11	4	14
663	6	Nottingham Forest	Derby County	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:03:07.924651	2016-02-21 16:03:07.924651	11	22	14
664	6	Notts County	Derby County	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:03:07.932031	2016-02-21 16:03:07.932031	11	16	14
665	6	Preston North End	Derby County	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:03:07.938835	2016-02-21 16:03:07.938835	11	17	14
666	6	Sheffield Wednesday	Derby County	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:03:07.946167	2016-02-21 16:03:07.946167	11	23	14
667	6	Stoke City	Derby County	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:03:07.953834	2016-02-21 16:03:07.953834	11	18	14
668	6	Sunderland	Derby County	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:03:07.960575	2016-02-21 16:03:07.960575	11	6	14
669	6	West Bromwich Albion	Derby County	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:03:07.967542	2016-02-21 16:03:07.967542	11	19	14
670	6	Wolverhampton Wanderers	Derby County	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:03:07.974078	2016-02-21 16:03:07.974078	11	20	14
671	6	Accrington F.C.	Everton	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:03:07.984087	2016-02-21 16:03:07.984087	11	10	15
672	6	Aston Villa	Everton	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:03:07.991091	2016-02-21 16:03:07.991091	11	9	15
673	6	Blackburn Rovers	Everton	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:03:07.997788	2016-02-21 16:03:07.997788	11	11	15
674	6	Bolton Wanderers	Everton	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:03:08.005855	2016-02-21 16:03:08.005855	11	12	15
675	6	Burnley	Everton	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:03:08.015287	2016-02-21 16:03:08.015287	11	13	15
676	6	Derby County	Everton	0	0	1	6	\N	\N	\N	\N	2016-02-21 16:03:08.022937	2016-02-21 16:03:08.022937	11	14	15
677	6	Manchester United	Everton	0	0	3	4	\N	\N	\N	\N	2016-02-21 16:03:08.032883	2016-02-21 16:03:08.032883	11	4	15
678	6	Nottingham Forest	Everton	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:03:08.041863	2016-02-21 16:03:08.041863	11	22	15
679	6	Notts County	Everton	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:03:08.048992	2016-02-21 16:03:08.048992	11	16	15
680	6	Preston North End	Everton	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:03:08.057264	2016-02-21 16:03:08.057264	11	17	15
681	6	Sheffield Wednesday	Everton	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:03:08.065986	2016-02-21 16:03:08.065986	11	23	15
682	6	Stoke City	Everton	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:03:08.075213	2016-02-21 16:03:08.075213	11	18	15
683	6	Sunderland	Everton	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:03:08.082206	2016-02-21 16:03:08.082206	11	6	15
684	6	West Bromwich Albion	Everton	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:03:08.090516	2016-02-21 16:03:08.090516	11	19	15
685	6	Wolverhampton Wanderers	Everton	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:03:08.098466	2016-02-21 16:03:08.098466	11	20	15
686	6	Accrington F.C.	Manchester United	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:03:08.119333	2016-02-21 16:03:08.119333	11	10	4
687	6	Aston Villa	Manchester United	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:03:08.126988	2016-02-21 16:03:08.126988	11	9	4
688	6	Blackburn Rovers	Manchester United	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:03:08.134182	2016-02-21 16:03:08.134182	11	11	4
689	6	Bolton Wanderers	Manchester United	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:03:08.141685	2016-02-21 16:03:08.141685	11	12	4
690	6	Burnley	Manchester United	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:03:08.149574	2016-02-21 16:03:08.149574	11	13	4
691	6	Derby County	Manchester United	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:03:08.157146	2016-02-21 16:03:08.157146	11	14	4
692	6	Everton	Manchester United	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:03:08.165072	2016-02-21 16:03:08.165072	11	15	4
693	6	Nottingham Forest	Manchester United	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:03:08.173347	2016-02-21 16:03:08.173347	11	22	4
694	6	Notts County	Manchester United	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:03:08.181299	2016-02-21 16:03:08.181299	11	16	4
695	6	Preston North End	Manchester United	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:03:08.19	2016-02-21 16:03:08.19	11	17	4
696	6	Sheffield Wednesday	Manchester United	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:03:08.198399	2016-02-21 16:03:08.198399	11	23	4
697	6	Stoke City	Manchester United	0	0	7	1	\N	\N	\N	\N	2016-02-21 16:03:08.206543	2016-02-21 16:03:08.206543	11	18	4
698	6	Sunderland	Manchester United	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:03:08.215164	2016-02-21 16:03:08.215164	11	6	4
699	6	West Bromwich Albion	Manchester United	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:03:08.223784	2016-02-21 16:03:08.223784	11	19	4
700	6	Wolverhampton Wanderers	Manchester United	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:03:08.23375	2016-02-21 16:03:08.23375	11	20	4
701	6	Accrington F.C.	Nottingham Forest	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:03:08.241878	2016-02-21 16:03:08.241878	11	10	22
702	6	Aston Villa	Nottingham Forest	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:03:08.249139	2016-02-21 16:03:08.249139	11	9	22
703	6	Blackburn Rovers	Nottingham Forest	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:03:08.257009	2016-02-21 16:03:08.257009	11	11	22
704	6	Bolton Wanderers	Nottingham Forest	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:03:08.264234	2016-02-21 16:03:08.264234	11	12	22
705	6	Burnley	Nottingham Forest	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:03:08.271605	2016-02-21 16:03:08.271605	11	13	22
706	6	Derby County	Nottingham Forest	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:03:08.279012	2016-02-21 16:03:08.279012	11	14	22
707	6	Everton	Nottingham Forest	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:03:08.285485	2016-02-21 16:03:08.285485	11	15	22
708	6	Manchester United	Nottingham Forest	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:03:08.292557	2016-02-21 16:03:08.292557	11	4	22
709	6	Notts County	Nottingham Forest	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:03:08.30024	2016-02-21 16:03:08.30024	11	16	22
710	6	Preston North End	Nottingham Forest	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:03:08.309266	2016-02-21 16:03:08.309266	11	17	22
711	6	Sheffield Wednesday	Nottingham Forest	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:03:08.316952	2016-02-21 16:03:08.316952	11	23	22
712	6	Stoke City	Nottingham Forest	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:03:08.328793	2016-02-21 16:03:08.328793	11	18	22
713	6	Sunderland	Nottingham Forest	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:03:08.338873	2016-02-21 16:03:08.338873	11	6	22
714	6	West Bromwich Albion	Nottingham Forest	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:03:08.348762	2016-02-21 16:03:08.348762	11	19	22
715	6	Wolverhampton Wanderers	Nottingham Forest	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:03:08.357554	2016-02-21 16:03:08.357554	11	20	22
716	6	Accrington F.C.	Notts County	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:03:08.365666	2016-02-21 16:03:08.365666	11	10	16
717	6	Aston Villa	Notts County	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:03:08.372804	2016-02-21 16:03:08.372804	11	9	16
718	6	Blackburn Rovers	Notts County	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:03:08.3815	2016-02-21 16:03:08.3815	11	11	16
719	6	Bolton Wanderers	Notts County	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:03:08.397834	2016-02-21 16:03:08.397834	11	12	16
720	6	Burnley	Notts County	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:03:08.405577	2016-02-21 16:03:08.405577	11	13	16
721	6	Derby County	Notts County	0	0	4	5	\N	\N	\N	\N	2016-02-21 16:03:08.413765	2016-02-21 16:03:08.413765	11	14	16
722	6	Everton	Notts County	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:03:08.422721	2016-02-21 16:03:08.422721	11	15	16
723	6	Manchester United	Notts County	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:03:08.431831	2016-02-21 16:03:08.431831	11	4	16
724	6	Nottingham Forest	Notts County	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:03:08.440628	2016-02-21 16:03:08.440628	11	22	16
725	6	Preston North End	Notts County	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:03:08.449352	2016-02-21 16:03:08.449352	11	17	16
726	6	Sheffield Wednesday	Notts County	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:03:08.461281	2016-02-21 16:03:08.461281	11	23	16
727	6	Stoke City	Notts County	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:03:08.470528	2016-02-21 16:03:08.470528	11	18	16
728	6	Sunderland	Notts County	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:03:08.479249	2016-02-21 16:03:08.479249	11	6	16
729	6	West Bromwich Albion	Notts County	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:03:08.488204	2016-02-21 16:03:08.488204	11	19	16
730	6	Wolverhampton Wanderers	Notts County	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:03:08.49756	2016-02-21 16:03:08.49756	11	20	16
731	6	Accrington F.C.	Preston North End	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:03:08.506535	2016-02-21 16:03:08.506535	11	10	17
732	6	Aston Villa	Preston North End	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:03:08.515638	2016-02-21 16:03:08.515638	11	9	17
733	6	Blackburn Rovers	Preston North End	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:03:08.52447	2016-02-21 16:03:08.52447	11	11	17
734	6	Bolton Wanderers	Preston North End	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:03:08.531689	2016-02-21 16:03:08.531689	11	12	17
735	6	Burnley	Preston North End	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:03:08.538699	2016-02-21 16:03:08.538699	11	13	17
736	6	Derby County	Preston North End	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:03:08.54581	2016-02-21 16:03:08.54581	11	14	17
737	6	Everton	Preston North End	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:03:08.552773	2016-02-21 16:03:08.552773	11	15	17
738	6	Manchester United	Preston North End	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:03:08.559603	2016-02-21 16:03:08.559603	11	4	17
739	6	Nottingham Forest	Preston North End	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:03:08.566139	2016-02-21 16:03:08.566139	11	22	17
740	6	Notts County	Preston North End	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:03:08.573126	2016-02-21 16:03:08.573126	11	16	17
741	6	Sheffield Wednesday	Preston North End	0	0	0	5	\N	\N	\N	\N	2016-02-21 16:03:08.581793	2016-02-21 16:03:08.581793	11	23	17
742	6	Stoke City	Preston North End	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:03:08.589091	2016-02-21 16:03:08.589091	11	18	17
743	6	Sunderland	Preston North End	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:03:08.596894	2016-02-21 16:03:08.596894	11	6	17
744	6	West Bromwich Albion	Preston North End	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:03:08.604335	2016-02-21 16:03:08.604335	11	19	17
745	6	Wolverhampton Wanderers	Preston North End	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:03:08.611378	2016-02-21 16:03:08.611378	11	20	17
746	6	Accrington F.C.	Sheffield Wednesday	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:03:08.617547	2016-02-21 16:03:08.617547	11	10	23
747	6	Aston Villa	Sheffield Wednesday	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:03:08.624117	2016-02-21 16:03:08.624117	11	9	23
748	6	Blackburn Rovers	Sheffield Wednesday	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:03:08.630587	2016-02-21 16:03:08.630587	11	11	23
749	6	Bolton Wanderers	Sheffield Wednesday	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:03:08.636675	2016-02-21 16:03:08.636675	11	12	23
750	6	Burnley	Sheffield Wednesday	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:03:08.643468	2016-02-21 16:03:08.643468	11	13	23
751	6	Derby County	Sheffield Wednesday	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:03:08.650574	2016-02-21 16:03:08.650574	11	14	23
752	6	Everton	Sheffield Wednesday	0	0	3	5	\N	\N	\N	\N	2016-02-21 16:03:08.656789	2016-02-21 16:03:08.656789	11	15	23
753	6	Manchester United	Sheffield Wednesday	0	0	1	5	\N	\N	\N	\N	2016-02-21 16:03:08.663641	2016-02-21 16:03:08.663641	11	4	23
754	6	Nottingham Forest	Sheffield Wednesday	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:03:08.669742	2016-02-21 16:03:08.669742	11	22	23
755	6	Notts County	Sheffield Wednesday	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:03:08.677552	2016-02-21 16:03:08.677552	11	16	23
756	6	Preston North End	Sheffield Wednesday	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:03:08.684454	2016-02-21 16:03:08.684454	11	17	23
757	6	Stoke City	Sheffield Wednesday	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:03:08.692084	2016-02-21 16:03:08.692084	11	18	23
758	6	Sunderland	Sheffield Wednesday	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:03:08.699021	2016-02-21 16:03:08.699021	11	6	23
759	6	West Bromwich Albion	Sheffield Wednesday	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:03:08.70609	2016-02-21 16:03:08.70609	11	19	23
760	6	Wolverhampton Wanderers	Sheffield Wednesday	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:03:08.713291	2016-02-21 16:03:08.713291	11	20	23
761	6	Accrington F.C.	Stoke City	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:03:08.721356	2016-02-21 16:03:08.721356	11	10	18
762	6	Aston Villa	Stoke City	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:03:08.729609	2016-02-21 16:03:08.729609	11	9	18
763	6	Blackburn Rovers	Stoke City	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:03:08.736763	2016-02-21 16:03:08.736763	11	11	18
764	6	Bolton Wanderers	Stoke City	0	0	4	4	\N	\N	\N	\N	2016-02-21 16:03:08.743471	2016-02-21 16:03:08.743471	11	12	18
765	6	Burnley	Stoke City	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:03:08.749893	2016-02-21 16:03:08.749893	11	13	18
766	6	Derby County	Stoke City	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:03:08.756236	2016-02-21 16:03:08.756236	11	14	18
767	6	Everton	Stoke City	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:03:08.762387	2016-02-21 16:03:08.762387	11	15	18
768	6	Manchester United	Stoke City	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:03:08.768503	2016-02-21 16:03:08.768503	11	4	18
769	6	Nottingham Forest	Stoke City	0	0	3	4	\N	\N	\N	\N	2016-02-21 16:03:08.774772	2016-02-21 16:03:08.774772	11	22	18
770	6	Notts County	Stoke City	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:03:08.783744	2016-02-21 16:03:08.783744	11	16	18
771	6	Preston North End	Stoke City	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:03:08.789902	2016-02-21 16:03:08.789902	11	17	18
772	6	Sheffield Wednesday	Stoke City	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:03:08.79602	2016-02-21 16:03:08.79602	11	23	18
773	6	Sunderland	Stoke City	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:03:08.802624	2016-02-21 16:03:08.802624	11	6	18
774	6	West Bromwich Albion	Stoke City	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:03:08.8091	2016-02-21 16:03:08.8091	11	19	18
775	6	Wolverhampton Wanderers	Stoke City	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:03:08.815863	2016-02-21 16:03:08.815863	11	20	18
776	6	Accrington F.C.	Sunderland	0	0	0	6	\N	\N	\N	\N	2016-02-21 16:03:08.821806	2016-02-21 16:03:08.821806	11	10	6
777	6	Aston Villa	Sunderland	0	0	1	6	\N	\N	\N	\N	2016-02-21 16:03:08.827919	2016-02-21 16:03:08.827919	11	9	6
778	6	Blackburn Rovers	Sunderland	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:03:08.834327	2016-02-21 16:03:08.834327	11	11	6
779	6	Bolton Wanderers	Sunderland	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:03:08.840512	2016-02-21 16:03:08.840512	11	12	6
780	6	Burnley	Sunderland	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:03:08.84693	2016-02-21 16:03:08.84693	11	13	6
781	6	Derby County	Sunderland	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:03:08.855889	2016-02-21 16:03:08.855889	11	14	6
782	6	Everton	Sunderland	0	0	1	4	\N	\N	\N	\N	2016-02-21 16:03:08.862354	2016-02-21 16:03:08.862354	11	15	6
783	6	Manchester United	Sunderland	0	0	0	5	\N	\N	\N	\N	2016-02-21 16:03:08.869247	2016-02-21 16:03:08.869247	11	4	6
784	6	Nottingham Forest	Sunderland	0	0	0	5	\N	\N	\N	\N	2016-02-21 16:03:08.87634	2016-02-21 16:03:08.87634	11	22	6
785	6	Notts County	Sunderland	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:03:08.883721	2016-02-21 16:03:08.883721	11	16	6
786	6	Preston North End	Sunderland	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:03:08.890958	2016-02-21 16:03:08.890958	11	17	6
787	6	Sheffield Wednesday	Sunderland	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:03:08.898868	2016-02-21 16:03:08.898868	11	23	6
788	6	Stoke City	Sunderland	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:03:08.906449	2016-02-21 16:03:08.906449	11	18	6
789	6	West Bromwich Albion	Sunderland	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:03:08.913569	2016-02-21 16:03:08.913569	11	19	6
790	6	Wolverhampton Wanderers	Sunderland	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:03:08.921078	2016-02-21 16:03:08.921078	11	20	6
791	6	Accrington F.C.	West Bromwich Albion	0	0	5	4	\N	\N	\N	\N	2016-02-21 16:03:08.928058	2016-02-21 16:03:08.928058	11	10	19
792	6	Aston Villa	West Bromwich Albion	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:03:08.934425	2016-02-21 16:03:08.934425	11	9	19
793	6	Blackburn Rovers	West Bromwich Albion	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:03:08.941204	2016-02-21 16:03:08.941204	11	11	19
794	6	Bolton Wanderers	West Bromwich Albion	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:03:08.948438	2016-02-21 16:03:08.948438	11	12	19
795	6	Burnley	West Bromwich Albion	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:03:08.955238	2016-02-21 16:03:08.955238	11	13	19
796	6	Derby County	West Bromwich Albion	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:03:08.963932	2016-02-21 16:03:08.963932	11	14	19
797	6	Everton	West Bromwich Albion	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:03:08.970586	2016-02-21 16:03:08.970586	11	15	19
798	6	Manchester United	West Bromwich Albion	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:03:08.977043	2016-02-21 16:03:08.977043	11	4	19
799	6	Nottingham Forest	West Bromwich Albion	0	0	3	4	\N	\N	\N	\N	2016-02-21 16:03:08.983998	2016-02-21 16:03:08.983998	11	22	19
800	6	Notts County	West Bromwich Albion	0	0	8	1	\N	\N	\N	\N	2016-02-21 16:03:08.991172	2016-02-21 16:03:08.991172	11	16	19
801	6	Preston North End	West Bromwich Albion	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:03:08.99783	2016-02-21 16:03:08.99783	11	17	19
802	6	Sheffield Wednesday	West Bromwich Albion	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:03:09.005357	2016-02-21 16:03:09.005357	11	23	19
803	6	Stoke City	West Bromwich Albion	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:03:09.012332	2016-02-21 16:03:09.012332	11	18	19
804	6	Sunderland	West Bromwich Albion	0	0	8	1	\N	\N	\N	\N	2016-02-21 16:03:09.019908	2016-02-21 16:03:09.019908	11	6	19
805	6	Wolverhampton Wanderers	West Bromwich Albion	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:03:09.027708	2016-02-21 16:03:09.027708	11	20	19
806	6	Accrington F.C.	Wolverhampton Wanderers	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:03:09.035255	2016-02-21 16:03:09.035255	11	10	20
807	6	Aston Villa	Wolverhampton Wanderers	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:03:09.042329	2016-02-21 16:03:09.042329	11	9	20
808	6	Blackburn Rovers	Wolverhampton Wanderers	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:03:09.049209	2016-02-21 16:03:09.049209	11	11	20
809	6	Bolton Wanderers	Wolverhampton Wanderers	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:03:09.055871	2016-02-21 16:03:09.055871	11	12	20
810	6	Burnley	Wolverhampton Wanderers	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:03:09.065487	2016-02-21 16:03:09.065487	11	13	20
811	6	Derby County	Wolverhampton Wanderers	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:03:09.072713	2016-02-21 16:03:09.072713	11	14	20
812	6	Everton	Wolverhampton Wanderers	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:03:09.080703	2016-02-21 16:03:09.080703	11	15	20
813	6	Manchester United	Wolverhampton Wanderers	0	0	10	1	\N	\N	\N	\N	2016-02-21 16:03:09.094555	2016-02-21 16:03:09.094555	11	4	20
814	6	Nottingham Forest	Wolverhampton Wanderers	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:03:09.10193	2016-02-21 16:03:09.10193	11	22	20
815	6	Notts County	Wolverhampton Wanderers	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:03:09.109723	2016-02-21 16:03:09.109723	11	16	20
816	6	Preston North End	Wolverhampton Wanderers	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:03:09.11727	2016-02-21 16:03:09.11727	11	17	20
817	6	Sheffield Wednesday	Wolverhampton Wanderers	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:03:09.124891	2016-02-21 16:03:09.124891	11	23	20
818	6	Stoke City	Wolverhampton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:03:09.131911	2016-02-21 16:03:09.131911	11	18	20
819	6	Sunderland	Wolverhampton Wanderers	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:03:09.138736	2016-02-21 16:03:09.138736	11	6	20
820	6	West Bromwich Albion	Wolverhampton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:03:09.146085	2016-02-21 16:03:09.146085	11	19	20
821	7	Birmingham City	Manchester City	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:05:27.782014	2016-02-21 16:05:27.782014	11	24	7
822	7	Bootle	Manchester City	0	0	5	3	\N	\N	\N	\N	2016-02-21 16:05:27.798312	2016-02-21 16:05:27.798312	11	25	7
823	7	Burton Swifts	Manchester City	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:05:27.810615	2016-02-21 16:05:27.810615	11	26	7
824	7	Crewe Alexandra	Manchester City	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:05:27.822554	2016-02-21 16:05:27.822554	11	27	7
825	7	Darwen	Manchester City	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:05:27.8293	2016-02-21 16:05:27.8293	11	21	7
826	7	Grimsby Town	Manchester City	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:05:27.842413	2016-02-21 16:05:27.842413	11	28	7
827	7	Lincoln City	Manchester City	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:05:27.85496	2016-02-21 16:05:27.85496	11	29	7
828	7	Northwich Victoria	Manchester City	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:05:27.866546	2016-02-21 16:05:27.866546	11	30	7
829	7	Port Vale	Manchester City	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:05:27.878789	2016-02-21 16:05:27.878789	11	31	7
830	7	Sheffield United	Manchester City	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:05:27.895844	2016-02-21 16:05:27.895844	11	32	7
831	7	Walsall	Manchester City	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:05:27.910793	2016-02-21 16:05:27.910793	11	33	7
832	7	Manchester City	Birmingham City	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:05:27.91922	2016-02-21 16:05:27.91922	11	7	24
833	7	Bootle	Birmingham City	0	0	1	4	\N	\N	\N	\N	2016-02-21 16:05:27.9275	2016-02-21 16:05:27.9275	11	25	24
834	7	Burton Swifts	Birmingham City	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:05:27.935536	2016-02-21 16:05:27.935536	11	26	24
835	7	Crewe Alexandra	Birmingham City	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:05:27.943866	2016-02-21 16:05:27.943866	11	27	24
836	7	Darwen	Birmingham City	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:05:27.952175	2016-02-21 16:05:27.952175	11	21	24
837	7	Grimsby Town	Birmingham City	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:05:27.959287	2016-02-21 16:05:27.959287	11	28	24
838	7	Lincoln City	Birmingham City	0	0	3	4	\N	\N	\N	\N	2016-02-21 16:05:27.965723	2016-02-21 16:05:27.965723	11	29	24
839	7	Northwich Victoria	Birmingham City	0	0	0	6	\N	\N	\N	\N	2016-02-21 16:05:27.973609	2016-02-21 16:05:27.973609	11	30	24
840	7	Port Vale	Birmingham City	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:05:27.980818	2016-02-21 16:05:27.980818	11	31	24
841	7	Sheffield United	Birmingham City	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:05:27.988313	2016-02-21 16:05:27.988313	11	32	24
842	7	Walsall	Birmingham City	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:05:27.995505	2016-02-21 16:05:27.995505	11	33	24
843	7	Manchester City	Bootle	0	0	7	0	\N	\N	\N	\N	2016-02-21 16:05:28.002053	2016-02-21 16:05:28.002053	11	7	25
844	7	Birmingham City	Bootle	0	0	6	2	\N	\N	\N	\N	2016-02-21 16:05:28.009847	2016-02-21 16:05:28.009847	11	24	25
845	7	Burton Swifts	Bootle	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:05:28.019651	2016-02-21 16:05:28.019651	11	26	25
846	7	Crewe Alexandra	Bootle	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:05:28.027037	2016-02-21 16:05:28.027037	11	27	25
847	7	Darwen	Bootle	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:05:28.034348	2016-02-21 16:05:28.034348	11	21	25
848	7	Grimsby Town	Bootle	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:05:28.041897	2016-02-21 16:05:28.041897	11	28	25
849	7	Lincoln City	Bootle	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:05:28.048802	2016-02-21 16:05:28.048802	11	29	25
850	7	Northwich Victoria	Bootle	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:05:28.05578	2016-02-21 16:05:28.05578	11	30	25
851	7	Port Vale	Bootle	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:05:28.063194	2016-02-21 16:05:28.063194	11	31	25
852	7	Sheffield United	Bootle	0	0	8	3	\N	\N	\N	\N	2016-02-21 16:05:28.070783	2016-02-21 16:05:28.070783	11	32	25
853	7	Walsall	Bootle	0	0	4	4	\N	\N	\N	\N	2016-02-21 16:05:28.077267	2016-02-21 16:05:28.077267	11	33	25
854	7	Manchester City	Burton Swifts	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:05:28.083893	2016-02-21 16:05:28.083893	11	7	26
855	7	Birmingham City	Burton Swifts	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:05:28.091007	2016-02-21 16:05:28.091007	11	24	26
856	7	Bootle	Burton Swifts	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:05:28.09892	2016-02-21 16:05:28.09892	11	25	26
857	7	Crewe Alexandra	Burton Swifts	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:05:28.106484	2016-02-21 16:05:28.106484	11	27	26
858	7	Darwen	Burton Swifts	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:05:28.112802	2016-02-21 16:05:28.112802	11	21	26
859	7	Grimsby Town	Burton Swifts	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:05:28.121202	2016-02-21 16:05:28.121202	11	28	26
860	7	Lincoln City	Burton Swifts	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:05:28.127746	2016-02-21 16:05:28.127746	11	29	26
861	7	Northwich Victoria	Burton Swifts	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:05:28.134715	2016-02-21 16:05:28.134715	11	30	26
862	7	Port Vale	Burton Swifts	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:05:28.142735	2016-02-21 16:05:28.142735	11	31	26
863	7	Sheffield United	Burton Swifts	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:05:28.149223	2016-02-21 16:05:28.149223	11	32	26
864	7	Walsall	Burton Swifts	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:05:28.156531	2016-02-21 16:05:28.156531	11	33	26
865	7	Manchester City	Crewe Alexandra	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:05:28.164071	2016-02-21 16:05:28.164071	11	7	27
866	7	Birmingham City	Crewe Alexandra	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:05:28.170696	2016-02-21 16:05:28.170696	11	24	27
867	7	Bootle	Crewe Alexandra	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:05:28.177071	2016-02-21 16:05:28.177071	11	25	27
868	7	Burton Swifts	Crewe Alexandra	0	0	7	1	\N	\N	\N	\N	2016-02-21 16:05:28.183973	2016-02-21 16:05:28.183973	11	26	27
869	7	Darwen	Crewe Alexandra	0	0	7	3	\N	\N	\N	\N	2016-02-21 16:05:28.191484	2016-02-21 16:05:28.191484	11	21	27
870	7	Grimsby Town	Crewe Alexandra	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:05:28.198446	2016-02-21 16:05:28.198446	11	28	27
871	7	Lincoln City	Crewe Alexandra	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:05:28.204783	2016-02-21 16:05:28.204783	11	29	27
872	7	Northwich Victoria	Crewe Alexandra	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:05:28.211641	2016-02-21 16:05:28.211641	11	30	27
873	7	Port Vale	Crewe Alexandra	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:05:28.219063	2016-02-21 16:05:28.219063	11	31	27
874	7	Sheffield United	Crewe Alexandra	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:05:28.228548	2016-02-21 16:05:28.228548	11	32	27
875	7	Walsall	Crewe Alexandra	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:05:28.235103	2016-02-21 16:05:28.235103	11	33	27
876	7	Manchester City	Darwen	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:05:28.24146	2016-02-21 16:05:28.24146	11	7	21
877	7	Birmingham City	Darwen	0	0	6	2	\N	\N	\N	\N	2016-02-21 16:05:28.248534	2016-02-21 16:05:28.248534	11	24	21
878	7	Bootle	Darwen	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:05:28.255745	2016-02-21 16:05:28.255745	11	25	21
879	7	Burton Swifts	Darwen	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:05:28.263403	2016-02-21 16:05:28.263403	11	26	21
880	7	Crewe Alexandra	Darwen	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:05:28.271086	2016-02-21 16:05:28.271086	11	27	21
881	7	Grimsby Town	Darwen	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:05:28.278392	2016-02-21 16:05:28.278392	11	28	21
882	7	Lincoln City	Darwen	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:05:28.285346	2016-02-21 16:05:28.285346	11	29	21
883	7	Northwich Victoria	Darwen	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:05:28.292701	2016-02-21 16:05:28.292701	11	30	21
884	7	Port Vale	Darwen	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:05:28.301169	2016-02-21 16:05:28.301169	11	31	21
885	7	Sheffield United	Darwen	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:05:28.309119	2016-02-21 16:05:28.309119	11	32	21
886	7	Walsall	Darwen	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:05:28.319629	2016-02-21 16:05:28.319629	11	33	21
887	7	Manchester City	Grimsby Town	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:05:28.327591	2016-02-21 16:05:28.327591	11	7	28
888	7	Birmingham City	Grimsby Town	0	0	8	3	\N	\N	\N	\N	2016-02-21 16:05:28.338654	2016-02-21 16:05:28.338654	11	24	28
889	7	Bootle	Grimsby Town	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:05:28.348243	2016-02-21 16:05:28.348243	11	25	28
890	7	Burton Swifts	Grimsby Town	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:05:28.357169	2016-02-21 16:05:28.357169	11	26	28
891	7	Crewe Alexandra	Grimsby Town	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:05:28.365484	2016-02-21 16:05:28.365484	11	27	28
892	7	Darwen	Grimsby Town	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:05:28.373388	2016-02-21 16:05:28.373388	11	21	28
893	7	Lincoln City	Grimsby Town	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:05:28.381522	2016-02-21 16:05:28.381522	11	29	28
894	7	Northwich Victoria	Grimsby Town	0	0	5	3	\N	\N	\N	\N	2016-02-21 16:05:28.388706	2016-02-21 16:05:28.388706	11	30	28
895	7	Port Vale	Grimsby Town	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:05:28.395815	2016-02-21 16:05:28.395815	11	31	28
896	7	Sheffield United	Grimsby Town	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:05:28.40313	2016-02-21 16:05:28.40313	11	32	28
897	7	Walsall	Grimsby Town	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:05:28.41026	2016-02-21 16:05:28.41026	11	33	28
898	7	Manchester City	Lincoln City	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:05:28.417504	2016-02-21 16:05:28.417504	11	7	29
899	7	Birmingham City	Lincoln City	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:05:28.425944	2016-02-21 16:05:28.425944	11	24	29
900	7	Bootle	Lincoln City	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:05:28.434122	2016-02-21 16:05:28.434122	11	25	29
901	7	Burton Swifts	Lincoln City	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:05:28.441916	2016-02-21 16:05:28.441916	11	26	29
902	7	Crewe Alexandra	Lincoln City	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:05:28.44969	2016-02-21 16:05:28.44969	11	27	29
903	7	Darwen	Lincoln City	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:05:28.460542	2016-02-21 16:05:28.460542	11	21	29
904	7	Grimsby Town	Lincoln City	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:05:28.469001	2016-02-21 16:05:28.469001	11	28	29
905	7	Northwich Victoria	Lincoln City	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:05:28.479102	2016-02-21 16:05:28.479102	11	30	29
906	7	Port Vale	Lincoln City	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:05:28.48714	2016-02-21 16:05:28.48714	11	31	29
907	7	Sheffield United	Lincoln City	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:05:28.50407	2016-02-21 16:05:28.50407	11	32	29
908	7	Walsall	Lincoln City	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:05:28.515496	2016-02-21 16:05:28.515496	11	33	29
909	7	Manchester City	Northwich Victoria	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:05:28.524735	2016-02-21 16:05:28.524735	11	7	30
910	7	Birmingham City	Northwich Victoria	0	0	6	2	\N	\N	\N	\N	2016-02-21 16:05:28.532029	2016-02-21 16:05:28.532029	11	24	30
911	7	Bootle	Northwich Victoria	0	0	2	5	\N	\N	\N	\N	2016-02-21 16:05:28.538967	2016-02-21 16:05:28.538967	11	25	30
912	7	Burton Swifts	Northwich Victoria	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:05:28.545516	2016-02-21 16:05:28.545516	11	26	30
913	7	Crewe Alexandra	Northwich Victoria	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:05:28.552078	2016-02-21 16:05:28.552078	11	27	30
914	7	Darwen	Northwich Victoria	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:05:28.558673	2016-02-21 16:05:28.558673	11	21	30
915	7	Grimsby Town	Northwich Victoria	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:05:28.565953	2016-02-21 16:05:28.565953	11	28	30
916	7	Lincoln City	Northwich Victoria	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:05:28.572905	2016-02-21 16:05:28.572905	11	29	30
917	7	Port Vale	Northwich Victoria	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:05:28.581399	2016-02-21 16:05:28.581399	11	31	30
918	7	Sheffield United	Northwich Victoria	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:05:28.588997	2016-02-21 16:05:28.588997	11	32	30
919	7	Walsall	Northwich Victoria	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:05:28.597846	2016-02-21 16:05:28.597846	11	33	30
920	7	Manchester City	Port Vale	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:05:28.604717	2016-02-21 16:05:28.604717	11	7	31
921	7	Birmingham City	Port Vale	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:05:28.611356	2016-02-21 16:05:28.611356	11	24	31
922	7	Bootle	Port Vale	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:05:28.618418	2016-02-21 16:05:28.618418	11	25	31
923	7	Burton Swifts	Port Vale	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:05:28.62638	2016-02-21 16:05:28.62638	11	26	31
924	7	Crewe Alexandra	Port Vale	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:05:28.634283	2016-02-21 16:05:28.634283	11	27	31
925	7	Darwen	Port Vale	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:05:28.642555	2016-02-21 16:05:28.642555	11	21	31
926	7	Grimsby Town	Port Vale	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:05:28.651719	2016-02-21 16:05:28.651719	11	28	31
927	7	Lincoln City	Port Vale	0	0	3	4	\N	\N	\N	\N	2016-02-21 16:05:28.660587	2016-02-21 16:05:28.660587	11	29	31
928	7	Northwich Victoria	Port Vale	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:05:28.669699	2016-02-21 16:05:28.669699	11	30	31
929	7	Sheffield United	Port Vale	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:05:28.682137	2016-02-21 16:05:28.682137	11	32	31
930	7	Walsall	Port Vale	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:05:28.690723	2016-02-21 16:05:28.690723	11	33	31
931	7	Manchester City	Sheffield United	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:05:28.699407	2016-02-21 16:05:28.699407	11	7	32
932	7	Birmingham City	Sheffield United	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:05:28.710146	2016-02-21 16:05:28.710146	11	24	32
933	7	Bootle	Sheffield United	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:05:28.718748	2016-02-21 16:05:28.718748	11	25	32
934	7	Burton Swifts	Sheffield United	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:05:28.725577	2016-02-21 16:05:28.725577	11	26	32
935	7	Crewe Alexandra	Sheffield United	0	0	0	4	\N	\N	\N	\N	2016-02-21 16:05:28.732588	2016-02-21 16:05:28.732588	11	27	32
936	7	Darwen	Sheffield United	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:05:28.739495	2016-02-21 16:05:28.739495	11	21	32
937	7	Grimsby Town	Sheffield United	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:05:28.747417	2016-02-21 16:05:28.747417	11	28	32
938	7	Lincoln City	Sheffield United	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:05:28.754458	2016-02-21 16:05:28.754458	11	29	32
939	7	Northwich Victoria	Sheffield United	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:05:28.761692	2016-02-21 16:05:28.761692	11	30	32
940	7	Port Vale	Sheffield United	0	0	0	10	\N	\N	\N	\N	2016-02-21 16:05:28.770532	2016-02-21 16:05:28.770532	11	31	32
941	7	Walsall	Sheffield United	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:05:28.782213	2016-02-21 16:05:28.782213	11	33	32
942	7	Manchester City	Walsall	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:05:28.790615	2016-02-21 16:05:28.790615	11	7	33
943	7	Birmingham City	Walsall	0	0	12	0	\N	\N	\N	\N	2016-02-21 16:05:28.797869	2016-02-21 16:05:28.797869	11	24	33
944	7	Bootle	Walsall	0	0	7	1	\N	\N	\N	\N	2016-02-21 16:05:28.804715	2016-02-21 16:05:28.804715	11	25	33
945	7	Burton Swifts	Walsall	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:05:28.812378	2016-02-21 16:05:28.812378	11	26	33
946	7	Crewe Alexandra	Walsall	0	0	5	6	\N	\N	\N	\N	2016-02-21 16:05:28.820901	2016-02-21 16:05:28.820901	11	27	33
947	7	Darwen	Walsall	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:05:28.829715	2016-02-21 16:05:28.829715	11	21	33
948	7	Grimsby Town	Walsall	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:05:28.838542	2016-02-21 16:05:28.838542	11	28	33
949	7	Lincoln City	Walsall	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:05:28.847593	2016-02-21 16:05:28.847593	11	29	33
950	7	Northwich Victoria	Walsall	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:05:28.856897	2016-02-21 16:05:28.856897	11	30	33
951	7	Port Vale	Walsall	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:05:28.865615	2016-02-21 16:05:28.865615	11	31	33
952	7	Sheffield United	Walsall	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:05:28.874162	2016-02-21 16:05:28.874162	11	32	33
953	6	Blackburn Rovers	Aston Villa	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:09:45.29666	2016-02-21 16:09:45.29666	12	11	9
954	6	Bolton Wanderers	Aston Villa	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:09:45.309394	2016-02-21 16:09:45.309394	12	12	9
955	6	Burnley	Aston Villa	0	0	3	6	\N	\N	\N	\N	2016-02-21 16:09:45.318494	2016-02-21 16:09:45.318494	12	13	9
956	6	Darwen	Aston Villa	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:09:45.326993	2016-02-21 16:09:45.326993	12	21	9
957	6	Derby County	Aston Villa	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:09:45.337238	2016-02-21 16:09:45.337238	12	14	9
958	6	Everton	Aston Villa	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:09:45.346602	2016-02-21 16:09:45.346602	12	15	9
959	6	Manchester United	Aston Villa	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:09:45.35638	2016-02-21 16:09:45.35638	12	4	9
960	6	Nottingham Forest	Aston Villa	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:09:45.363421	2016-02-21 16:09:45.363421	12	22	9
961	6	Preston North End	Aston Villa	0	0	2	5	\N	\N	\N	\N	2016-02-21 16:09:45.369863	2016-02-21 16:09:45.369863	12	17	9
962	6	Sheffield United	Aston Villa	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:09:45.376503	2016-02-21 16:09:45.376503	12	32	9
963	6	Sheffield Wednesday	Aston Villa	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:09:45.382618	2016-02-21 16:09:45.382618	12	23	9
964	6	Stoke City	Aston Villa	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:09:45.391636	2016-02-21 16:09:45.391636	12	18	9
965	6	Sunderland	Aston Villa	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:09:45.400275	2016-02-21 16:09:45.400275	12	6	9
966	6	West Bromwich Albion	Aston Villa	0	0	3	6	\N	\N	\N	\N	2016-02-21 16:09:45.408774	2016-02-21 16:09:45.408774	12	19	9
967	6	Wolverhampton Wanderers	Aston Villa	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:09:45.415937	2016-02-21 16:09:45.415937	12	20	9
968	6	Aston Villa	Blackburn Rovers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:45.423159	2016-02-21 16:09:45.423159	12	9	11
969	6	Bolton Wanderers	Blackburn Rovers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:45.430408	2016-02-21 16:09:45.430408	12	12	11
970	6	Burnley	Blackburn Rovers	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:09:45.437853	2016-02-21 16:09:45.437853	12	13	11
971	6	Darwen	Blackburn Rovers	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:09:45.443886	2016-02-21 16:09:45.443886	12	21	11
972	6	Derby County	Blackburn Rovers	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:09:45.449585	2016-02-21 16:09:45.449585	12	14	11
973	6	Everton	Blackburn Rovers	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:09:45.455789	2016-02-21 16:09:45.455789	12	15	11
974	6	Manchester United	Blackburn Rovers	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:09:45.46265	2016-02-21 16:09:45.46265	12	4	11
975	6	Nottingham Forest	Blackburn Rovers	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:09:45.469146	2016-02-21 16:09:45.469146	12	22	11
976	6	Preston North End	Blackburn Rovers	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:09:45.476067	2016-02-21 16:09:45.476067	12	17	11
977	6	Sheffield United	Blackburn Rovers	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:09:45.483025	2016-02-21 16:09:45.483025	12	32	11
978	6	Sheffield Wednesday	Blackburn Rovers	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:09:45.490731	2016-02-21 16:09:45.490731	12	23	11
979	6	Stoke City	Blackburn Rovers	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:45.498	2016-02-21 16:09:45.498	12	18	11
980	6	Sunderland	Blackburn Rovers	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:09:45.50528	2016-02-21 16:09:45.50528	12	6	11
981	6	West Bromwich Albion	Blackburn Rovers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:45.511446	2016-02-21 16:09:45.511446	12	19	11
982	6	Wolverhampton Wanderers	Blackburn Rovers	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:09:45.517771	2016-02-21 16:09:45.517771	12	20	11
983	6	Aston Villa	Bolton Wanderers	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:09:45.525054	2016-02-21 16:09:45.525054	12	9	12
984	6	Blackburn Rovers	Bolton Wanderers	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:09:45.532329	2016-02-21 16:09:45.532329	12	11	12
985	6	Burnley	Bolton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:45.540297	2016-02-21 16:09:45.540297	12	13	12
986	6	Darwen	Bolton Wanderers	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:09:45.548318	2016-02-21 16:09:45.548318	12	21	12
987	6	Derby County	Bolton Wanderers	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:09:45.555984	2016-02-21 16:09:45.555984	12	14	12
988	6	Everton	Bolton Wanderers	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:09:45.563628	2016-02-21 16:09:45.563628	12	15	12
989	6	Manchester United	Bolton Wanderers	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:09:45.570644	2016-02-21 16:09:45.570644	12	4	12
990	6	Nottingham Forest	Bolton Wanderers	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:09:45.577787	2016-02-21 16:09:45.577787	12	22	12
991	6	Preston North End	Bolton Wanderers	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:09:45.584479	2016-02-21 16:09:45.584479	12	17	12
992	6	Sheffield United	Bolton Wanderers	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:09:45.590508	2016-02-21 16:09:45.590508	12	32	12
993	6	Sheffield Wednesday	Bolton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:45.596565	2016-02-21 16:09:45.596565	12	23	12
994	6	Stoke City	Bolton Wanderers	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:09:45.606678	2016-02-21 16:09:45.606678	12	18	12
995	6	Sunderland	Bolton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:45.616061	2016-02-21 16:09:45.616061	12	6	12
996	6	West Bromwich Albion	Bolton Wanderers	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:09:45.622189	2016-02-21 16:09:45.622189	12	19	12
997	6	Wolverhampton Wanderers	Bolton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:45.629156	2016-02-21 16:09:45.629156	12	20	12
998	6	Aston Villa	Burnley	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:09:45.636386	2016-02-21 16:09:45.636386	12	9	13
999	6	Blackburn Rovers	Burnley	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:09:45.644714	2016-02-21 16:09:45.644714	12	11	13
1000	6	Bolton Wanderers	Burnley	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:09:45.651662	2016-02-21 16:09:45.651662	12	12	13
1001	6	Darwen	Burnley	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:09:45.658848	2016-02-21 16:09:45.658848	12	21	13
1002	6	Derby County	Burnley	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:09:45.66814	2016-02-21 16:09:45.66814	12	14	13
1003	6	Everton	Burnley	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:09:45.675199	2016-02-21 16:09:45.675199	12	15	13
1004	6	Manchester United	Burnley	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:09:45.682395	2016-02-21 16:09:45.682395	12	4	13
1005	6	Nottingham Forest	Burnley	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:09:45.689511	2016-02-21 16:09:45.689511	12	22	13
1006	6	Preston North End	Burnley	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:09:45.696738	2016-02-21 16:09:45.696738	12	17	13
1007	6	Sheffield United	Burnley	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:09:45.703982	2016-02-21 16:09:45.703982	12	32	13
1008	6	Sheffield Wednesday	Burnley	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:09:45.710965	2016-02-21 16:09:45.710965	12	23	13
1009	6	Stoke City	Burnley	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:09:45.718016	2016-02-21 16:09:45.718016	12	18	13
1010	6	Sunderland	Burnley	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:09:45.725092	2016-02-21 16:09:45.725092	12	6	13
1011	6	West Bromwich Albion	Burnley	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:09:45.732431	2016-02-21 16:09:45.732431	12	19	13
1012	6	Wolverhampton Wanderers	Burnley	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:09:45.739743	2016-02-21 16:09:45.739743	12	20	13
1013	6	Aston Villa	Darwen	0	0	9	0	\N	\N	\N	\N	2016-02-21 16:09:45.746847	2016-02-21 16:09:45.746847	12	9	21
1014	6	Blackburn Rovers	Darwen	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:09:45.753351	2016-02-21 16:09:45.753351	12	11	21
1015	6	Bolton Wanderers	Darwen	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:09:45.759794	2016-02-21 16:09:45.759794	12	12	21
1016	6	Burnley	Darwen	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:09:45.768876	2016-02-21 16:09:45.768876	12	13	21
1017	6	Derby County	Darwen	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:45.778208	2016-02-21 16:09:45.778208	12	14	21
1018	6	Everton	Darwen	0	0	8	1	\N	\N	\N	\N	2016-02-21 16:09:45.785547	2016-02-21 16:09:45.785547	12	15	21
1019	6	Manchester United	Darwen	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:09:45.792635	2016-02-21 16:09:45.792635	12	4	21
1020	6	Nottingham Forest	Darwen	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:09:45.800843	2016-02-21 16:09:45.800843	12	22	21
1021	6	Preston North End	Darwen	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:09:45.807522	2016-02-21 16:09:45.807522	12	17	21
1022	6	Sheffield United	Darwen	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:45.813882	2016-02-21 16:09:45.813882	12	32	21
1023	6	Sheffield Wednesday	Darwen	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:09:45.820822	2016-02-21 16:09:45.820822	12	23	21
1024	6	Stoke City	Darwen	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:45.828409	2016-02-21 16:09:45.828409	12	18	21
1025	6	Sunderland	Darwen	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:09:45.836998	2016-02-21 16:09:45.836998	12	6	21
1026	6	West Bromwich Albion	Darwen	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:09:45.844361	2016-02-21 16:09:45.844361	12	19	21
1027	6	Wolverhampton Wanderers	Darwen	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:45.851126	2016-02-21 16:09:45.851126	12	20	21
1028	6	Aston Villa	Derby County	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:09:45.857876	2016-02-21 16:09:45.857876	12	9	14
1029	6	Blackburn Rovers	Derby County	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:09:45.864544	2016-02-21 16:09:45.864544	12	11	14
1030	6	Bolton Wanderers	Derby County	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:09:45.870626	2016-02-21 16:09:45.870626	12	12	14
1031	6	Burnley	Derby County	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:45.878616	2016-02-21 16:09:45.878616	12	13	14
1032	6	Darwen	Derby County	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:09:45.885365	2016-02-21 16:09:45.885365	12	21	14
1033	6	Everton	Derby County	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:09:45.892657	2016-02-21 16:09:45.892657	12	15	14
1034	6	Manchester United	Derby County	0	0	2	6	\N	\N	\N	\N	2016-02-21 16:09:45.899163	2016-02-21 16:09:45.899163	12	4	14
1035	6	Nottingham Forest	Derby County	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:09:45.905342	2016-02-21 16:09:45.905342	12	22	14
1036	6	Preston North End	Derby County	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:09:45.911397	2016-02-21 16:09:45.911397	12	17	14
1037	6	Sheffield United	Derby County	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:09:45.917864	2016-02-21 16:09:45.917864	12	32	14
1038	6	Sheffield Wednesday	Derby County	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:09:45.924887	2016-02-21 16:09:45.924887	12	23	14
1039	6	Stoke City	Derby County	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:45.931535	2016-02-21 16:09:45.931535	12	18	14
1040	6	Sunderland	Derby County	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:09:45.938422	2016-02-21 16:09:45.938422	12	6	14
1041	6	West Bromwich Albion	Derby County	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:09:45.945433	2016-02-21 16:09:45.945433	12	19	14
1042	6	Wolverhampton Wanderers	Derby County	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:09:45.955507	2016-02-21 16:09:45.955507	12	20	14
1043	6	Aston Villa	Everton	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:45.964048	2016-02-21 16:09:45.964048	12	9	15
1044	6	Blackburn Rovers	Everton	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:09:45.970743	2016-02-21 16:09:45.970743	12	11	15
1045	6	Bolton Wanderers	Everton	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:09:45.976766	2016-02-21 16:09:45.976766	12	12	15
1046	6	Burnley	Everton	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:45.983696	2016-02-21 16:09:45.983696	12	13	15
1047	6	Darwen	Everton	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:09:45.990652	2016-02-21 16:09:45.990652	12	21	15
1048	6	Derby County	Everton	0	0	7	3	\N	\N	\N	\N	2016-02-21 16:09:45.996904	2016-02-21 16:09:45.996904	12	14	15
1049	6	Manchester United	Everton	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:09:46.002711	2016-02-21 16:09:46.002711	12	4	15
1050	6	Nottingham Forest	Everton	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:09:46.008872	2016-02-21 16:09:46.008872	12	22	15
1051	6	Preston North End	Everton	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:09:46.015106	2016-02-21 16:09:46.015106	12	17	15
1052	6	Sheffield United	Everton	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:09:46.023519	2016-02-21 16:09:46.023519	12	32	15
1053	6	Sheffield Wednesday	Everton	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:09:46.029715	2016-02-21 16:09:46.029715	12	23	15
1054	6	Stoke City	Everton	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:46.036317	2016-02-21 16:09:46.036317	12	18	15
1055	6	Sunderland	Everton	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:09:46.042382	2016-02-21 16:09:46.042382	12	6	15
1056	6	West Bromwich Albion	Everton	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:46.049149	2016-02-21 16:09:46.049149	12	19	15
1057	6	Wolverhampton Wanderers	Everton	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:09:46.055123	2016-02-21 16:09:46.055123	12	20	15
1058	6	Aston Villa	Manchester United	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:09:46.061228	2016-02-21 16:09:46.061228	12	9	4
1059	6	Blackburn Rovers	Manchester United	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:09:46.067641	2016-02-21 16:09:46.067641	12	11	4
1060	6	Bolton Wanderers	Manchester United	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:09:46.07379	2016-02-21 16:09:46.07379	12	12	4
1061	6	Burnley	Manchester United	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:09:46.080414	2016-02-21 16:09:46.080414	12	13	4
1062	6	Darwen	Manchester United	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:09:46.087604	2016-02-21 16:09:46.087604	12	21	4
1063	6	Derby County	Manchester United	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:09:46.094892	2016-02-21 16:09:46.094892	12	14	4
1064	6	Everton	Manchester United	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:09:46.102112	2016-02-21 16:09:46.102112	12	15	4
1065	6	Nottingham Forest	Manchester United	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:09:46.109277	2016-02-21 16:09:46.109277	12	22	4
1066	6	Preston North End	Manchester United	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:09:46.1166	2016-02-21 16:09:46.1166	12	17	4
1067	6	Sheffield United	Manchester United	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:46.125867	2016-02-21 16:09:46.125867	12	32	4
1068	6	Sheffield Wednesday	Manchester United	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:09:46.133324	2016-02-21 16:09:46.133324	12	23	4
1069	6	Stoke City	Manchester United	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:46.139735	2016-02-21 16:09:46.139735	12	18	4
1070	6	Sunderland	Manchester United	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:09:46.146604	2016-02-21 16:09:46.146604	12	6	4
1071	6	West Bromwich Albion	Manchester United	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:46.153789	2016-02-21 16:09:46.153789	12	19	4
1072	6	Wolverhampton Wanderers	Manchester United	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:09:46.160083	2016-02-21 16:09:46.160083	12	20	4
1073	6	Aston Villa	Nottingham Forest	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:46.181532	2016-02-21 16:09:46.181532	12	9	22
1074	6	Blackburn Rovers	Nottingham Forest	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:09:46.189142	2016-02-21 16:09:46.189142	12	11	22
1075	6	Bolton Wanderers	Nottingham Forest	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:09:46.196381	2016-02-21 16:09:46.196381	12	12	22
1076	6	Burnley	Nottingham Forest	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:46.204335	2016-02-21 16:09:46.204335	12	13	22
1077	6	Darwen	Nottingham Forest	0	0	0	4	\N	\N	\N	\N	2016-02-21 16:09:46.212023	2016-02-21 16:09:46.212023	12	21	22
1078	6	Derby County	Nottingham Forest	0	0	3	4	\N	\N	\N	\N	2016-02-21 16:09:46.221114	2016-02-21 16:09:46.221114	12	14	22
1079	6	Everton	Nottingham Forest	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:09:46.229977	2016-02-21 16:09:46.229977	12	15	22
1080	6	Manchester United	Nottingham Forest	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:09:46.241437	2016-02-21 16:09:46.241437	12	4	22
1081	6	Preston North End	Nottingham Forest	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:09:46.249314	2016-02-21 16:09:46.249314	12	17	22
1082	6	Sheffield United	Nottingham Forest	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:09:46.25584	2016-02-21 16:09:46.25584	12	32	22
1083	6	Sheffield Wednesday	Nottingham Forest	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:09:46.266221	2016-02-21 16:09:46.266221	12	23	22
1084	6	Stoke City	Nottingham Forest	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:46.284208	2016-02-21 16:09:46.284208	12	18	22
1085	6	Sunderland	Nottingham Forest	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:09:46.29357	2016-02-21 16:09:46.29357	12	6	22
1086	6	West Bromwich Albion	Nottingham Forest	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:09:46.301477	2016-02-21 16:09:46.301477	12	19	22
1087	6	Wolverhampton Wanderers	Nottingham Forest	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:46.309215	2016-02-21 16:09:46.309215	12	20	22
1088	6	Aston Villa	Preston North End	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:09:46.31742	2016-02-21 16:09:46.31742	12	9	17
1089	6	Blackburn Rovers	Preston North End	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:09:46.324779	2016-02-21 16:09:46.324779	12	11	17
1090	6	Bolton Wanderers	Preston North End	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:09:46.33186	2016-02-21 16:09:46.33186	12	12	17
1091	6	Burnley	Preston North End	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:09:46.339508	2016-02-21 16:09:46.339508	12	13	17
1092	6	Darwen	Preston North End	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:46.346396	2016-02-21 16:09:46.346396	12	21	17
1093	6	Derby County	Preston North End	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:46.352792	2016-02-21 16:09:46.352792	12	14	17
1094	6	Everton	Preston North End	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:09:46.359586	2016-02-21 16:09:46.359586	12	15	17
1095	6	Manchester United	Preston North End	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:09:46.366147	2016-02-21 16:09:46.366147	12	4	17
1096	6	Nottingham Forest	Preston North End	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:09:46.385704	2016-02-21 16:09:46.385704	12	22	17
1097	6	Sheffield United	Preston North End	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:09:46.396089	2016-02-21 16:09:46.396089	12	32	17
1098	6	Sheffield Wednesday	Preston North End	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:09:46.403758	2016-02-21 16:09:46.403758	12	23	17
1099	6	Stoke City	Preston North End	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:46.411278	2016-02-21 16:09:46.411278	12	18	17
1100	6	Sunderland	Preston North End	0	0	6	3	\N	\N	\N	\N	2016-02-21 16:09:46.418894	2016-02-21 16:09:46.418894	12	6	17
1101	6	West Bromwich Albion	Preston North End	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:09:46.426008	2016-02-21 16:09:46.426008	12	19	17
1102	6	Wolverhampton Wanderers	Preston North End	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:09:46.432987	2016-02-21 16:09:46.432987	12	20	17
1103	6	Aston Villa	Sheffield United	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:09:46.453565	2016-02-21 16:09:46.453565	12	9	32
1104	6	Blackburn Rovers	Sheffield United	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:09:46.461187	2016-02-21 16:09:46.461187	12	11	32
1105	6	Bolton Wanderers	Sheffield United	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:09:46.4689	2016-02-21 16:09:46.4689	12	12	32
1106	6	Burnley	Sheffield United	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:09:46.475725	2016-02-21 16:09:46.475725	12	13	32
1107	6	Darwen	Sheffield United	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:09:46.482088	2016-02-21 16:09:46.482088	12	21	32
1108	6	Derby County	Sheffield United	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:46.489167	2016-02-21 16:09:46.489167	12	14	32
1109	6	Everton	Sheffield United	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:09:46.496663	2016-02-21 16:09:46.496663	12	15	32
1110	6	Manchester United	Sheffield United	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:09:46.505178	2016-02-21 16:09:46.505178	12	4	32
1111	6	Nottingham Forest	Sheffield United	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:09:46.512923	2016-02-21 16:09:46.512923	12	22	32
1112	6	Preston North End	Sheffield United	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:09:46.52022	2016-02-21 16:09:46.52022	12	17	32
1113	6	Sheffield Wednesday	Sheffield United	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:09:46.527489	2016-02-21 16:09:46.527489	12	23	32
1114	6	Stoke City	Sheffield United	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:09:46.534669	2016-02-21 16:09:46.534669	12	18	32
1115	6	Sunderland	Sheffield United	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:09:46.540842	2016-02-21 16:09:46.540842	12	6	32
1116	6	West Bromwich Albion	Sheffield United	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:46.547625	2016-02-21 16:09:46.547625	12	19	32
1117	6	Wolverhampton Wanderers	Sheffield United	0	0	3	4	\N	\N	\N	\N	2016-02-21 16:09:46.555015	2016-02-21 16:09:46.555015	12	20	32
1118	6	Aston Villa	Sheffield Wednesday	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:09:46.562598	2016-02-21 16:09:46.562598	12	9	23
1119	6	Blackburn Rovers	Sheffield Wednesday	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:09:46.569585	2016-02-21 16:09:46.569585	12	11	23
1120	6	Bolton Wanderers	Sheffield Wednesday	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:09:46.57735	2016-02-21 16:09:46.57735	12	12	23
1121	6	Burnley	Sheffield Wednesday	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:09:46.584905	2016-02-21 16:09:46.584905	12	13	23
1122	6	Darwen	Sheffield Wednesday	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:46.593453	2016-02-21 16:09:46.593453	12	21	23
1123	6	Derby County	Sheffield Wednesday	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:09:46.601125	2016-02-21 16:09:46.601125	12	14	23
1124	6	Everton	Sheffield Wednesday	0	0	8	1	\N	\N	\N	\N	2016-02-21 16:09:46.608808	2016-02-21 16:09:46.608808	12	15	23
1125	6	Manchester United	Sheffield Wednesday	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:09:46.615744	2016-02-21 16:09:46.615744	12	4	23
1126	6	Nottingham Forest	Sheffield Wednesday	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:09:46.622832	2016-02-21 16:09:46.622832	12	22	23
1127	6	Preston North End	Sheffield Wednesday	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:09:46.630388	2016-02-21 16:09:46.630388	12	17	23
1128	6	Sheffield United	Sheffield Wednesday	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:09:46.637856	2016-02-21 16:09:46.637856	12	32	23
1129	6	Stoke City	Sheffield Wednesday	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:09:46.647142	2016-02-21 16:09:46.647142	12	18	23
1130	6	Sunderland	Sheffield Wednesday	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:09:46.654959	2016-02-21 16:09:46.654959	12	6	23
1131	6	West Bromwich Albion	Sheffield Wednesday	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:09:46.662076	2016-02-21 16:09:46.662076	12	19	23
1132	6	Wolverhampton Wanderers	Sheffield Wednesday	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:46.669734	2016-02-21 16:09:46.669734	12	20	23
1133	6	Aston Villa	Stoke City	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:09:46.67718	2016-02-21 16:09:46.67718	12	9	18
1134	6	Blackburn Rovers	Stoke City	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:09:46.686436	2016-02-21 16:09:46.686436	12	11	18
1135	6	Bolton Wanderers	Stoke City	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:09:46.693561	2016-02-21 16:09:46.693561	12	12	18
1136	6	Burnley	Stoke City	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:09:46.700609	2016-02-21 16:09:46.700609	12	13	18
1137	6	Darwen	Stoke City	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:46.70815	2016-02-21 16:09:46.70815	12	21	18
1138	6	Derby County	Stoke City	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:09:46.71613	2016-02-21 16:09:46.71613	12	14	18
1139	6	Everton	Stoke City	0	0	6	2	\N	\N	\N	\N	2016-02-21 16:09:46.72308	2016-02-21 16:09:46.72308	12	15	18
1140	6	Manchester United	Stoke City	0	0	6	2	\N	\N	\N	\N	2016-02-21 16:09:46.729591	2016-02-21 16:09:46.729591	12	4	18
1141	6	Nottingham Forest	Stoke City	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:09:46.736255	2016-02-21 16:09:46.736255	12	22	18
1142	6	Preston North End	Stoke City	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:09:46.742676	2016-02-21 16:09:46.742676	12	17	18
1143	6	Sheffield United	Stoke City	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:09:46.749662	2016-02-21 16:09:46.749662	12	32	18
1144	6	Sheffield Wednesday	Stoke City	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:09:46.756916	2016-02-21 16:09:46.756916	12	23	18
1145	6	Sunderland	Stoke City	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:09:46.76381	2016-02-21 16:09:46.76381	12	6	18
1146	6	West Bromwich Albion	Stoke City	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:09:46.770727	2016-02-21 16:09:46.770727	12	19	18
1147	6	Wolverhampton Wanderers	Stoke City	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:09:46.779251	2016-02-21 16:09:46.779251	12	20	18
1148	6	Aston Villa	Sunderland	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:46.785638	2016-02-21 16:09:46.785638	12	9	6
1149	6	Blackburn Rovers	Sunderland	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:09:46.79276	2016-02-21 16:09:46.79276	12	11	6
1150	6	Bolton Wanderers	Sunderland	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:09:46.800965	2016-02-21 16:09:46.800965	12	12	6
1151	6	Burnley	Sunderland	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:09:46.808436	2016-02-21 16:09:46.808436	12	13	6
1152	6	Darwen	Sunderland	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:09:46.815531	2016-02-21 16:09:46.815531	12	21	6
1153	6	Derby County	Sunderland	0	0	1	4	\N	\N	\N	\N	2016-02-21 16:09:46.822666	2016-02-21 16:09:46.822666	12	14	6
1154	6	Everton	Sunderland	0	0	7	1	\N	\N	\N	\N	2016-02-21 16:09:46.829495	2016-02-21 16:09:46.829495	12	15	6
1155	6	Manchester United	Sunderland	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:09:46.836038	2016-02-21 16:09:46.836038	12	4	6
1156	6	Nottingham Forest	Sunderland	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:09:46.842756	2016-02-21 16:09:46.842756	12	22	6
1157	6	Preston North End	Sunderland	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:09:46.849033	2016-02-21 16:09:46.849033	12	17	6
1158	6	Sheffield United	Sunderland	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:09:46.855637	2016-02-21 16:09:46.855637	12	32	6
1159	6	Sheffield Wednesday	Sunderland	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:09:46.862074	2016-02-21 16:09:46.862074	12	23	6
1160	6	Stoke City	Sunderland	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:09:46.868768	2016-02-21 16:09:46.868768	12	18	6
1161	6	West Bromwich Albion	Sunderland	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:09:46.875552	2016-02-21 16:09:46.875552	12	19	6
1162	6	Wolverhampton Wanderers	Sunderland	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:46.884781	2016-02-21 16:09:46.884781	12	20	6
1163	6	Aston Villa	West Bromwich Albion	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:09:46.891972	2016-02-21 16:09:46.891972	12	9	19
1164	6	Blackburn Rovers	West Bromwich Albion	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:09:46.899268	2016-02-21 16:09:46.899268	12	11	19
1165	6	Bolton Wanderers	West Bromwich Albion	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:09:46.906588	2016-02-21 16:09:46.906588	12	12	19
1166	6	Burnley	West Bromwich Albion	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:09:46.913901	2016-02-21 16:09:46.913901	12	13	19
1167	6	Darwen	West Bromwich Albion	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:46.921449	2016-02-21 16:09:46.921449	12	21	19
1168	6	Derby County	West Bromwich Albion	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:09:46.928063	2016-02-21 16:09:46.928063	12	14	19
1169	6	Everton	West Bromwich Albion	0	0	7	1	\N	\N	\N	\N	2016-02-21 16:09:46.934529	2016-02-21 16:09:46.934529	12	15	19
1170	6	Manchester United	West Bromwich Albion	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:09:46.941673	2016-02-21 16:09:46.941673	12	4	19
1171	6	Nottingham Forest	West Bromwich Albion	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:09:46.953416	2016-02-21 16:09:46.953416	12	22	19
1172	6	Preston North End	West Bromwich Albion	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:46.961991	2016-02-21 16:09:46.961991	12	17	19
1173	6	Sheffield United	West Bromwich Albion	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:09:46.969161	2016-02-21 16:09:46.969161	12	32	19
1174	6	Sheffield Wednesday	West Bromwich Albion	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:09:46.976329	2016-02-21 16:09:46.976329	12	23	19
1175	6	Stoke City	West Bromwich Albion	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:46.985636	2016-02-21 16:09:46.985636	12	18	19
1176	6	Sunderland	West Bromwich Albion	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:09:46.995636	2016-02-21 16:09:46.995636	12	6	19
1177	6	Wolverhampton Wanderers	West Bromwich Albion	0	0	0	8	\N	\N	\N	\N	2016-02-21 16:09:47.002503	2016-02-21 16:09:47.002503	12	20	19
1178	6	Aston Villa	Wolverhampton Wanderers	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:09:47.008819	2016-02-21 16:09:47.008819	12	9	20
1179	6	Blackburn Rovers	Wolverhampton Wanderers	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:09:47.016163	2016-02-21 16:09:47.016163	12	11	20
1180	6	Bolton Wanderers	Wolverhampton Wanderers	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:09:47.02324	2016-02-21 16:09:47.02324	12	12	20
1181	6	Burnley	Wolverhampton Wanderers	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:09:47.030773	2016-02-21 16:09:47.030773	12	13	20
1182	6	Darwen	Wolverhampton Wanderers	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:09:47.037102	2016-02-21 16:09:47.037102	12	21	20
1183	6	Derby County	Wolverhampton Wanderers	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:09:47.043953	2016-02-21 16:09:47.043953	12	14	20
1184	6	Everton	Wolverhampton Wanderers	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:09:47.051085	2016-02-21 16:09:47.051085	12	15	20
1185	6	Manchester United	Wolverhampton Wanderers	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:09:47.057368	2016-02-21 16:09:47.057368	12	4	20
1186	6	Nottingham Forest	Wolverhampton Wanderers	0	0	7	1	\N	\N	\N	\N	2016-02-21 16:09:47.06373	2016-02-21 16:09:47.06373	12	22	20
1187	6	Preston North End	Wolverhampton Wanderers	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:09:47.070176	2016-02-21 16:09:47.070176	12	17	20
1188	6	Sheffield United	Wolverhampton Wanderers	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:09:47.076683	2016-02-21 16:09:47.076683	12	32	20
1189	6	Sheffield Wednesday	Wolverhampton Wanderers	0	0	1	4	\N	\N	\N	\N	2016-02-21 16:09:47.08337	2016-02-21 16:09:47.08337	12	23	20
1190	6	Stoke City	Wolverhampton Wanderers	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:09:47.093002	2016-02-21 16:09:47.093002	12	18	20
1191	6	Sunderland	Wolverhampton Wanderers	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:09:47.099899	2016-02-21 16:09:47.099899	12	6	20
1192	6	West Bromwich Albion	Wolverhampton Wanderers	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:09:47.107024	2016-02-21 16:09:47.107024	12	19	20
1193	7	Birmingham City	Arsenal	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:10:17.331603	2016-02-21 16:10:17.331603	12	24	3
1194	7	Burton Swifts	Arsenal	0	0	6	2	\N	\N	\N	\N	2016-02-21 16:10:17.343245	2016-02-21 16:10:17.343245	12	26	3
1195	7	Crewe Alexandra	Arsenal	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:10:17.351602	2016-02-21 16:10:17.351602	12	27	3
1196	7	Grimsby Town	Arsenal	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:10:17.360102	2016-02-21 16:10:17.360102	12	28	3
1197	7	Lincoln City	Arsenal	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:10:17.367798	2016-02-21 16:10:17.367798	12	29	3
1198	7	Liverpool	Arsenal	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:10:17.374776	2016-02-21 16:10:17.374776	12	8	3
1199	7	Manchester City	Arsenal	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:10:17.38596	2016-02-21 16:10:17.38596	12	7	3
1200	7	Middlesbrough Ironopolis	Arsenal	0	0	3	6	\N	\N	\N	\N	2016-02-21 16:10:17.430339	2016-02-21 16:10:17.430339	12	34	3
1201	7	Newcastle United	Arsenal	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:10:17.443927	2016-02-21 16:10:17.443927	12	35	3
1202	7	Northwich Victoria	Arsenal	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:10:17.452132	2016-02-21 16:10:17.452132	12	30	3
1203	7	Notts County	Arsenal	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:10:17.468468	2016-02-21 16:10:17.468468	12	16	3
1204	7	Port Vale	Arsenal	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:10:17.477557	2016-02-21 16:10:17.477557	12	31	3
1205	7	Rotherham Town	Arsenal	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:10:17.490836	2016-02-21 16:10:17.490836	12	36	3
1206	7	Walsall	Arsenal	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:10:17.501699	2016-02-21 16:10:17.501699	12	33	3
1207	7	Arsenal	Birmingham City	0	0	1	4	\N	\N	\N	\N	2016-02-21 16:10:17.512791	2016-02-21 16:10:17.512791	12	3	24
1208	7	Burton Swifts	Birmingham City	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:10:17.520207	2016-02-21 16:10:17.520207	12	26	24
1209	7	Crewe Alexandra	Birmingham City	0	0	3	5	\N	\N	\N	\N	2016-02-21 16:10:17.528703	2016-02-21 16:10:17.528703	12	27	24
1210	7	Grimsby Town	Birmingham City	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:10:17.537685	2016-02-21 16:10:17.537685	12	28	24
1211	7	Lincoln City	Birmingham City	0	0	2	5	\N	\N	\N	\N	2016-02-21 16:10:17.545085	2016-02-21 16:10:17.545085	12	29	24
1212	7	Liverpool	Birmingham City	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:10:17.551752	2016-02-21 16:10:17.551752	12	8	24
1213	7	Manchester City	Birmingham City	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:10:17.559252	2016-02-21 16:10:17.559252	12	7	24
1214	7	Middlesbrough Ironopolis	Birmingham City	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:10:17.566577	2016-02-21 16:10:17.566577	12	34	24
1215	7	Newcastle United	Birmingham City	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:10:17.574098	2016-02-21 16:10:17.574098	12	35	24
1216	7	Northwich Victoria	Birmingham City	0	0	0	7	\N	\N	\N	\N	2016-02-21 16:10:17.581553	2016-02-21 16:10:17.581553	12	30	24
1217	7	Notts County	Birmingham City	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:10:17.589139	2016-02-21 16:10:17.589139	12	16	24
1218	7	Port Vale	Birmingham City	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:10:17.596492	2016-02-21 16:10:17.596492	12	31	24
1219	7	Rotherham Town	Birmingham City	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:10:17.603745	2016-02-21 16:10:17.603745	12	36	24
1220	7	Walsall	Birmingham City	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:10:17.611046	2016-02-21 16:10:17.611046	12	33	24
1221	7	Arsenal	Burton Swifts	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:10:17.621393	2016-02-21 16:10:17.621393	12	3	26
1222	7	Birmingham City	Burton Swifts	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:10:17.630054	2016-02-21 16:10:17.630054	12	24	26
1223	7	Crewe Alexandra	Burton Swifts	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:10:17.639292	2016-02-21 16:10:17.639292	12	27	26
1224	7	Grimsby Town	Burton Swifts	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:10:17.647747	2016-02-21 16:10:17.647747	12	28	26
1225	7	Lincoln City	Burton Swifts	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:10:17.657244	2016-02-21 16:10:17.657244	12	29	26
1226	7	Liverpool	Burton Swifts	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:10:17.666635	2016-02-21 16:10:17.666635	12	8	26
1227	7	Manchester City	Burton Swifts	0	0	1	4	\N	\N	\N	\N	2016-02-21 16:10:17.675116	2016-02-21 16:10:17.675116	12	7	26
1228	7	Middlesbrough Ironopolis	Burton Swifts	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:10:17.681681	2016-02-21 16:10:17.681681	12	34	26
1229	7	Newcastle United	Burton Swifts	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:10:17.689135	2016-02-21 16:10:17.689135	12	35	26
1230	7	Northwich Victoria	Burton Swifts	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:10:17.697078	2016-02-21 16:10:17.697078	12	30	26
1231	7	Notts County	Burton Swifts	0	0	6	2	\N	\N	\N	\N	2016-02-21 16:10:17.704565	2016-02-21 16:10:17.704565	12	16	26
1232	7	Port Vale	Burton Swifts	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:10:17.712525	2016-02-21 16:10:17.712525	12	31	26
1233	7	Rotherham Town	Burton Swifts	0	0	2	5	\N	\N	\N	\N	2016-02-21 16:10:17.720307	2016-02-21 16:10:17.720307	12	36	26
1234	7	Walsall	Burton Swifts	0	0	3	4	\N	\N	\N	\N	2016-02-21 16:10:17.729426	2016-02-21 16:10:17.729426	12	33	26
1235	7	Arsenal	Crewe Alexandra	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:10:17.739814	2016-02-21 16:10:17.739814	12	3	27
1236	7	Birmingham City	Crewe Alexandra	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:10:17.747723	2016-02-21 16:10:17.747723	12	24	27
1237	7	Burton Swifts	Crewe Alexandra	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:10:17.754792	2016-02-21 16:10:17.754792	12	26	27
1238	7	Grimsby Town	Crewe Alexandra	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:10:17.762033	2016-02-21 16:10:17.762033	12	28	27
1239	7	Lincoln City	Crewe Alexandra	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:10:17.768732	2016-02-21 16:10:17.768732	12	29	27
1240	7	Liverpool	Crewe Alexandra	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:10:17.775269	2016-02-21 16:10:17.775269	12	8	27
1241	7	Manchester City	Crewe Alexandra	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:10:17.781717	2016-02-21 16:10:17.781717	12	7	27
1242	7	Middlesbrough Ironopolis	Crewe Alexandra	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:10:17.78872	2016-02-21 16:10:17.78872	12	34	27
1243	7	Newcastle United	Crewe Alexandra	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:10:17.795462	2016-02-21 16:10:17.795462	12	35	27
1244	7	Northwich Victoria	Crewe Alexandra	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:10:17.802728	2016-02-21 16:10:17.802728	12	30	27
1245	7	Notts County	Crewe Alexandra	0	0	9	1	\N	\N	\N	\N	2016-02-21 16:10:17.810373	2016-02-21 16:10:17.810373	12	16	27
1246	7	Port Vale	Crewe Alexandra	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:10:17.817212	2016-02-21 16:10:17.817212	12	31	27
1247	7	Rotherham Town	Crewe Alexandra	0	0	1	4	\N	\N	\N	\N	2016-02-21 16:10:17.823881	2016-02-21 16:10:17.823881	12	36	27
1248	7	Walsall	Crewe Alexandra	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:10:17.830171	2016-02-21 16:10:17.830171	12	33	27
1249	7	Arsenal	Grimsby Town	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:10:17.837472	2016-02-21 16:10:17.837472	12	3	28
1250	7	Birmingham City	Grimsby Town	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:10:17.845471	2016-02-21 16:10:17.845471	12	24	28
1251	7	Burton Swifts	Grimsby Town	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:10:17.852241	2016-02-21 16:10:17.852241	12	26	28
1252	7	Crewe Alexandra	Grimsby Town	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:10:17.859111	2016-02-21 16:10:17.859111	12	27	28
1253	7	Lincoln City	Grimsby Town	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:10:17.86625	2016-02-21 16:10:17.86625	12	29	28
1254	7	Liverpool	Grimsby Town	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:10:17.873558	2016-02-21 16:10:17.873558	12	8	28
1255	7	Manchester City	Grimsby Town	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:10:17.880496	2016-02-21 16:10:17.880496	12	7	28
1256	7	Middlesbrough Ironopolis	Grimsby Town	0	0	2	6	\N	\N	\N	\N	2016-02-21 16:10:17.887773	2016-02-21 16:10:17.887773	12	34	28
1257	7	Newcastle United	Grimsby Town	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:10:17.895317	2016-02-21 16:10:17.895317	12	35	28
1258	7	Northwich Victoria	Grimsby Town	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:10:17.905415	2016-02-21 16:10:17.905415	12	30	28
1259	7	Notts County	Grimsby Town	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:10:17.912672	2016-02-21 16:10:17.912672	12	16	28
1260	7	Port Vale	Grimsby Town	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:10:17.919675	2016-02-21 16:10:17.919675	12	31	28
1261	7	Rotherham Town	Grimsby Town	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:10:17.926602	2016-02-21 16:10:17.926602	12	36	28
1262	7	Walsall	Grimsby Town	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:10:17.932958	2016-02-21 16:10:17.932958	12	33	28
1263	7	Arsenal	Lincoln City	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:10:17.939548	2016-02-21 16:10:17.939548	12	3	29
1264	7	Birmingham City	Lincoln City	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:10:17.947009	2016-02-21 16:10:17.947009	12	24	29
1265	7	Burton Swifts	Lincoln City	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:10:17.955366	2016-02-21 16:10:17.955366	12	26	29
1266	7	Crewe Alexandra	Lincoln City	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:10:17.964394	2016-02-21 16:10:17.964394	12	27	29
1267	7	Grimsby Town	Lincoln City	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:10:17.973987	2016-02-21 16:10:17.973987	12	28	29
1268	7	Liverpool	Lincoln City	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:10:17.98188	2016-02-21 16:10:17.98188	12	8	29
1269	7	Manchester City	Lincoln City	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:10:17.99077	2016-02-21 16:10:17.99077	12	7	29
1270	7	Middlesbrough Ironopolis	Lincoln City	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:10:18.001038	2016-02-21 16:10:18.001038	12	34	29
1271	7	Newcastle United	Lincoln City	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:10:18.010351	2016-02-21 16:10:18.010351	12	35	29
1272	7	Northwich Victoria	Lincoln City	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:10:18.01973	2016-02-21 16:10:18.01973	12	30	29
1273	7	Notts County	Lincoln City	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:10:18.029865	2016-02-21 16:10:18.029865	12	16	29
1274	7	Port Vale	Lincoln City	0	0	5	3	\N	\N	\N	\N	2016-02-21 16:10:18.039487	2016-02-21 16:10:18.039487	12	31	29
1275	7	Rotherham Town	Lincoln City	0	0	2	8	\N	\N	\N	\N	2016-02-21 16:10:18.048142	2016-02-21 16:10:18.048142	12	36	29
1276	7	Walsall	Lincoln City	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:10:18.05661	2016-02-21 16:10:18.05661	12	33	29
1277	7	Arsenal	Liverpool	0	0	0	5	\N	\N	\N	\N	2016-02-21 16:10:18.064894	2016-02-21 16:10:18.064894	12	3	8
1278	7	Birmingham City	Liverpool	0	0	3	4	\N	\N	\N	\N	2016-02-21 16:10:18.071775	2016-02-21 16:10:18.071775	12	24	8
1279	7	Burton Swifts	Liverpool	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:10:18.079523	2016-02-21 16:10:18.079523	12	26	8
1280	7	Crewe Alexandra	Liverpool	0	0	0	5	\N	\N	\N	\N	2016-02-21 16:10:18.087387	2016-02-21 16:10:18.087387	12	27	8
1281	7	Grimsby Town	Liverpool	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:10:18.094216	2016-02-21 16:10:18.094216	12	28	8
1282	7	Lincoln City	Liverpool	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:10:18.100682	2016-02-21 16:10:18.100682	12	29	8
1283	7	Manchester City	Liverpool	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:10:18.108086	2016-02-21 16:10:18.108086	12	7	8
1284	7	Middlesbrough Ironopolis	Liverpool	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:10:18.115999	2016-02-21 16:10:18.115999	12	34	8
1285	7	Newcastle United	Liverpool	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:10:18.122894	2016-02-21 16:10:18.122894	12	35	8
1286	7	Northwich Victoria	Liverpool	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:10:18.129842	2016-02-21 16:10:18.129842	12	30	8
1287	7	Notts County	Liverpool	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:10:18.13917	2016-02-21 16:10:18.13917	12	16	8
1288	7	Port Vale	Liverpool	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:10:18.146206	2016-02-21 16:10:18.146206	12	31	8
1289	7	Rotherham Town	Liverpool	0	0	1	4	\N	\N	\N	\N	2016-02-21 16:10:18.153803	2016-02-21 16:10:18.153803	12	36	8
1290	7	Walsall	Liverpool	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:10:18.161518	2016-02-21 16:10:18.161518	12	33	8
1291	7	Arsenal	Manchester City	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:10:18.169292	2016-02-21 16:10:18.169292	12	3	7
1292	7	Birmingham City	Manchester City	0	0	10	2	\N	\N	\N	\N	2016-02-21 16:10:18.176771	2016-02-21 16:10:18.176771	12	24	7
1293	7	Burton Swifts	Manchester City	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:10:18.184186	2016-02-21 16:10:18.184186	12	26	7
1294	7	Crewe Alexandra	Manchester City	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:10:18.191566	2016-02-21 16:10:18.191566	12	27	7
1295	7	Grimsby Town	Manchester City	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:10:18.202055	2016-02-21 16:10:18.202055	12	28	7
1296	7	Lincoln City	Manchester City	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:10:18.209957	2016-02-21 16:10:18.209957	12	29	7
1297	7	Liverpool	Manchester City	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:10:18.217787	2016-02-21 16:10:18.217787	12	8	7
1298	7	Middlesbrough Ironopolis	Manchester City	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:10:18.225105	2016-02-21 16:10:18.225105	12	34	7
1299	7	Newcastle United	Manchester City	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:10:18.232547	2016-02-21 16:10:18.232547	12	35	7
1300	7	Northwich Victoria	Manchester City	0	0	1	4	\N	\N	\N	\N	2016-02-21 16:10:18.239106	2016-02-21 16:10:18.239106	12	30	7
1301	7	Notts County	Manchester City	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:10:18.245624	2016-02-21 16:10:18.245624	12	16	7
1302	7	Port Vale	Manchester City	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:10:18.252333	2016-02-21 16:10:18.252333	12	31	7
1303	7	Rotherham Town	Manchester City	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:10:18.259606	2016-02-21 16:10:18.259606	12	36	7
1304	7	Walsall	Manchester City	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:10:18.266419	2016-02-21 16:10:18.266419	12	33	7
1305	7	Arsenal	Middlesbrough Ironopolis	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:10:18.273389	2016-02-21 16:10:18.273389	12	3	34
1306	7	Birmingham City	Middlesbrough Ironopolis	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:10:18.280845	2016-02-21 16:10:18.280845	12	24	34
1307	7	Burton Swifts	Middlesbrough Ironopolis	0	0	7	0	\N	\N	\N	\N	2016-02-21 16:10:18.291547	2016-02-21 16:10:18.291547	12	26	34
1308	7	Crewe Alexandra	Middlesbrough Ironopolis	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:10:18.299218	2016-02-21 16:10:18.299218	12	27	34
1309	7	Grimsby Town	Middlesbrough Ironopolis	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:10:18.306589	2016-02-21 16:10:18.306589	12	28	34
1310	7	Lincoln City	Middlesbrough Ironopolis	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:10:18.316289	2016-02-21 16:10:18.316289	12	29	34
1311	7	Liverpool	Middlesbrough Ironopolis	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:10:18.32299	2016-02-21 16:10:18.32299	12	8	34
1312	7	Manchester City	Middlesbrough Ironopolis	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:10:18.32902	2016-02-21 16:10:18.32902	12	7	34
1313	7	Newcastle United	Middlesbrough Ironopolis	0	0	7	2	\N	\N	\N	\N	2016-02-21 16:10:18.335797	2016-02-21 16:10:18.335797	12	35	34
1314	7	Northwich Victoria	Middlesbrough Ironopolis	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:10:18.341834	2016-02-21 16:10:18.341834	12	30	34
1315	7	Notts County	Middlesbrough Ironopolis	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:10:18.348568	2016-02-21 16:10:18.348568	12	16	34
1316	7	Port Vale	Middlesbrough Ironopolis	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:10:18.355493	2016-02-21 16:10:18.355493	12	31	34
1317	7	Rotherham Town	Middlesbrough Ironopolis	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:10:18.3621	2016-02-21 16:10:18.3621	12	36	34
1318	7	Walsall	Middlesbrough Ironopolis	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:10:18.37043	2016-02-21 16:10:18.37043	12	33	34
1319	7	Arsenal	Newcastle United	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:10:18.377474	2016-02-21 16:10:18.377474	12	3	35
1320	7	Birmingham City	Newcastle United	0	0	1	4	\N	\N	\N	\N	2016-02-21 16:10:18.384449	2016-02-21 16:10:18.384449	12	24	35
1321	7	Burton Swifts	Newcastle United	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:10:18.391128	2016-02-21 16:10:18.391128	12	26	35
1322	7	Crewe Alexandra	Newcastle United	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:10:18.398636	2016-02-21 16:10:18.398636	12	27	35
1323	7	Grimsby Town	Newcastle United	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:10:18.405883	2016-02-21 16:10:18.405883	12	28	35
1324	7	Lincoln City	Newcastle United	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:10:18.413655	2016-02-21 16:10:18.413655	12	29	35
1325	7	Liverpool	Newcastle United	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:10:18.42099	2016-02-21 16:10:18.42099	12	8	35
1326	7	Manchester City	Newcastle United	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:10:18.427755	2016-02-21 16:10:18.427755	12	7	35
1327	7	Middlesbrough Ironopolis	Newcastle United	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:10:18.435151	2016-02-21 16:10:18.435151	12	34	35
1328	7	Northwich Victoria	Newcastle United	0	0	5	3	\N	\N	\N	\N	2016-02-21 16:10:18.443279	2016-02-21 16:10:18.443279	12	30	35
1329	7	Notts County	Newcastle United	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:10:18.45058	2016-02-21 16:10:18.45058	12	16	35
1330	7	Port Vale	Newcastle United	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:10:18.458166	2016-02-21 16:10:18.458166	12	31	35
1331	7	Rotherham Town	Newcastle United	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:10:18.465021	2016-02-21 16:10:18.465021	12	36	35
1332	7	Walsall	Newcastle United	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:10:18.481548	2016-02-21 16:10:18.481548	12	33	35
1333	7	Arsenal	Northwich Victoria	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:10:18.490899	2016-02-21 16:10:18.490899	12	3	30
1334	7	Birmingham City	Northwich Victoria	0	0	8	0	\N	\N	\N	\N	2016-02-21 16:10:18.519664	2016-02-21 16:10:18.519664	12	24	30
1335	7	Burton Swifts	Northwich Victoria	0	0	6	2	\N	\N	\N	\N	2016-02-21 16:10:18.528568	2016-02-21 16:10:18.528568	12	26	30
1336	7	Crewe Alexandra	Northwich Victoria	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:10:18.53711	2016-02-21 16:10:18.53711	12	27	30
1337	7	Grimsby Town	Northwich Victoria	0	0	7	0	\N	\N	\N	\N	2016-02-21 16:10:18.545563	2016-02-21 16:10:18.545563	12	28	30
1338	7	Lincoln City	Northwich Victoria	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:10:18.553684	2016-02-21 16:10:18.553684	12	29	30
1339	7	Liverpool	Northwich Victoria	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:10:18.561761	2016-02-21 16:10:18.561761	12	8	30
1340	7	Manchester City	Northwich Victoria	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:10:18.570001	2016-02-21 16:10:18.570001	12	7	30
1341	7	Middlesbrough Ironopolis	Northwich Victoria	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:10:18.578935	2016-02-21 16:10:18.578935	12	34	30
1342	7	Newcastle United	Northwich Victoria	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:10:18.586629	2016-02-21 16:10:18.586629	12	35	30
1343	7	Notts County	Northwich Victoria	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:10:18.595599	2016-02-21 16:10:18.595599	12	16	30
1344	7	Port Vale	Northwich Victoria	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:10:18.605503	2016-02-21 16:10:18.605503	12	31	30
1345	7	Rotherham Town	Northwich Victoria	0	0	5	4	\N	\N	\N	\N	2016-02-21 16:10:18.615266	2016-02-21 16:10:18.615266	12	36	30
1346	7	Walsall	Northwich Victoria	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:10:18.625509	2016-02-21 16:10:18.625509	12	33	30
1347	7	Arsenal	Notts County	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:10:18.635098	2016-02-21 16:10:18.635098	12	3	16
1348	7	Birmingham City	Notts County	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:10:18.644814	2016-02-21 16:10:18.644814	12	24	16
1349	7	Burton Swifts	Notts County	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:10:18.65452	2016-02-21 16:10:18.65452	12	26	16
1350	7	Crewe Alexandra	Notts County	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:10:18.666154	2016-02-21 16:10:18.666154	12	27	16
1351	7	Grimsby Town	Notts County	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:10:18.674212	2016-02-21 16:10:18.674212	12	28	16
1352	7	Lincoln City	Notts County	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:10:18.68274	2016-02-21 16:10:18.68274	12	29	16
1353	7	Liverpool	Notts County	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:10:18.691473	2016-02-21 16:10:18.691473	12	8	16
1354	7	Manchester City	Notts County	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:10:18.699949	2016-02-21 16:10:18.699949	12	7	16
1355	7	Middlesbrough Ironopolis	Notts County	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:10:18.708602	2016-02-21 16:10:18.708602	12	34	16
1356	7	Newcastle United	Notts County	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:10:18.717947	2016-02-21 16:10:18.717947	12	35	16
1357	7	Northwich Victoria	Notts County	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:10:18.726674	2016-02-21 16:10:18.726674	12	30	16
1358	7	Port Vale	Notts County	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:10:18.733645	2016-02-21 16:10:18.733645	12	31	16
1359	7	Rotherham Town	Notts County	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:10:18.740514	2016-02-21 16:10:18.740514	12	36	16
1360	7	Walsall	Notts County	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:10:18.748673	2016-02-21 16:10:18.748673	12	33	16
1361	7	Arsenal	Port Vale	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:10:18.755991	2016-02-21 16:10:18.755991	12	3	31
1362	7	Birmingham City	Port Vale	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:10:18.762953	2016-02-21 16:10:18.762953	12	24	31
1363	7	Burton Swifts	Port Vale	0	0	5	3	\N	\N	\N	\N	2016-02-21 16:10:18.769706	2016-02-21 16:10:18.769706	12	26	31
1364	7	Crewe Alexandra	Port Vale	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:10:18.777013	2016-02-21 16:10:18.777013	12	27	31
1365	7	Grimsby Town	Port Vale	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:10:18.789103	2016-02-21 16:10:18.789103	12	28	31
1366	7	Lincoln City	Port Vale	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:10:18.798152	2016-02-21 16:10:18.798152	12	29	31
1367	7	Liverpool	Port Vale	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:10:18.80645	2016-02-21 16:10:18.80645	12	8	31
1368	7	Manchester City	Port Vale	0	0	8	1	\N	\N	\N	\N	2016-02-21 16:10:18.814021	2016-02-21 16:10:18.814021	12	7	31
1369	7	Middlesbrough Ironopolis	Port Vale	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:10:18.82131	2016-02-21 16:10:18.82131	12	34	31
1370	7	Newcastle United	Port Vale	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:10:18.828687	2016-02-21 16:10:18.828687	12	35	31
1371	7	Northwich Victoria	Port Vale	0	0	1	5	\N	\N	\N	\N	2016-02-21 16:10:18.83736	2016-02-21 16:10:18.83736	12	30	31
1372	7	Notts County	Port Vale	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:10:18.845358	2016-02-21 16:10:18.845358	12	16	31
1373	7	Rotherham Town	Port Vale	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:10:18.854014	2016-02-21 16:10:18.854014	12	36	31
1374	7	Walsall	Port Vale	0	0	0	5	\N	\N	\N	\N	2016-02-21 16:10:18.861537	2016-02-21 16:10:18.861537	12	33	31
1375	7	Arsenal	Rotherham Town	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:10:18.868881	2016-02-21 16:10:18.868881	12	3	36
1376	7	Birmingham City	Rotherham Town	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:10:18.87669	2016-02-21 16:10:18.87669	12	24	36
1377	7	Burton Swifts	Rotherham Town	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:10:18.885201	2016-02-21 16:10:18.885201	12	26	36
1378	7	Crewe Alexandra	Rotherham Town	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:10:18.892498	2016-02-21 16:10:18.892498	12	27	36
1379	7	Grimsby Town	Rotherham Town	0	0	7	1	\N	\N	\N	\N	2016-02-21 16:10:18.899656	2016-02-21 16:10:18.899656	12	28	36
1380	7	Lincoln City	Rotherham Town	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:10:18.909292	2016-02-21 16:10:18.909292	12	29	36
1381	7	Liverpool	Rotherham Town	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:10:18.916329	2016-02-21 16:10:18.916329	12	8	36
1382	7	Manchester City	Rotherham Town	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:10:18.923211	2016-02-21 16:10:18.923211	12	7	36
1383	7	Middlesbrough Ironopolis	Rotherham Town	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:10:18.930324	2016-02-21 16:10:18.930324	12	34	36
1384	7	Newcastle United	Rotherham Town	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:10:18.937908	2016-02-21 16:10:18.937908	12	35	36
1385	7	Northwich Victoria	Rotherham Town	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:10:18.944709	2016-02-21 16:10:18.944709	12	30	36
1386	7	Notts County	Rotherham Town	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:10:18.951471	2016-02-21 16:10:18.951471	12	16	36
1387	7	Port Vale	Rotherham Town	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:10:18.957723	2016-02-21 16:10:18.957723	12	31	36
1388	7	Walsall	Rotherham Town	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:10:18.964587	2016-02-21 16:10:18.964587	12	33	36
1389	7	Arsenal	Walsall	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:10:18.97133	2016-02-21 16:10:18.97133	12	3	33
1390	7	Birmingham City	Walsall	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:10:18.977894	2016-02-21 16:10:18.977894	12	24	33
1391	7	Burton Swifts	Walsall	0	0	8	5	\N	\N	\N	\N	2016-02-21 16:10:18.984557	2016-02-21 16:10:18.984557	12	26	33
1392	7	Crewe Alexandra	Walsall	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:10:18.990982	2016-02-21 16:10:18.990982	12	27	33
1393	7	Grimsby Town	Walsall	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:10:18.997232	2016-02-21 16:10:18.997232	12	28	33
1394	7	Lincoln City	Walsall	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:10:19.006038	2016-02-21 16:10:19.006038	12	29	33
1395	7	Liverpool	Walsall	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:10:19.01335	2016-02-21 16:10:19.01335	12	8	33
1396	7	Manchester City	Walsall	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:10:19.021019	2016-02-21 16:10:19.021019	12	7	33
1397	7	Middlesbrough Ironopolis	Walsall	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:10:19.029017	2016-02-21 16:10:19.029017	12	34	33
1398	7	Newcastle United	Walsall	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:10:19.036873	2016-02-21 16:10:19.036873	12	35	33
1399	7	Northwich Victoria	Walsall	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:10:19.044506	2016-02-21 16:10:19.044506	12	30	33
1400	7	Notts County	Walsall	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:10:19.051365	2016-02-21 16:10:19.051365	12	16	33
1401	7	Port Vale	Walsall	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:10:19.057612	2016-02-21 16:10:19.057612	12	31	33
1402	7	Rotherham Town	Walsall	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:10:19.064538	2016-02-21 16:10:19.064538	12	36	33
1403	6	Birmingham City	Aston Villa	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:23.132083	2016-02-21 16:14:23.132083	13	24	9
1404	6	Blackburn Rovers	Aston Villa	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:14:23.145936	2016-02-21 16:14:23.145936	13	11	9
1405	6	Bolton Wanderers	Aston Villa	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:14:23.155365	2016-02-21 16:14:23.155365	13	12	9
1406	6	Burnley	Aston Villa	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:14:23.165168	2016-02-21 16:14:23.165168	13	13	9
1407	6	Derby County	Aston Villa	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:14:23.179455	2016-02-21 16:14:23.179455	13	14	9
1408	6	Everton	Aston Villa	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:14:23.187603	2016-02-21 16:14:23.187603	13	15	9
1409	6	Liverpool	Aston Villa	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:14:23.195397	2016-02-21 16:14:23.195397	13	8	9
1410	6	Nottingham Forest	Aston Villa	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:23.205313	2016-02-21 16:14:23.205313	13	22	9
1411	6	Preston North End	Aston Villa	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:14:23.214094	2016-02-21 16:14:23.214094	13	17	9
1412	6	Sheffield United	Aston Villa	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:23.223066	2016-02-21 16:14:23.223066	13	32	9
1413	6	Sheffield Wednesday	Aston Villa	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:14:23.230697	2016-02-21 16:14:23.230697	13	23	9
1414	6	Stoke City	Aston Villa	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:14:23.238978	2016-02-21 16:14:23.238978	13	18	9
1415	6	Sunderland	Aston Villa	0	0	4	4	\N	\N	\N	\N	2016-02-21 16:14:23.248162	2016-02-21 16:14:23.248162	13	6	9
1416	6	West Bromwich Albion	Aston Villa	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:14:23.259958	2016-02-21 16:14:23.259958	13	19	9
1417	6	Wolverhampton Wanderers	Aston Villa	0	0	0	4	\N	\N	\N	\N	2016-02-21 16:14:23.270419	2016-02-21 16:14:23.270419	13	20	9
1418	6	Aston Villa	Birmingham City	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:23.280321	2016-02-21 16:14:23.280321	13	9	24
1419	6	Blackburn Rovers	Birmingham City	0	0	9	1	\N	\N	\N	\N	2016-02-21 16:14:23.291875	2016-02-21 16:14:23.291875	13	11	24
1420	6	Bolton Wanderers	Birmingham City	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:14:23.299227	2016-02-21 16:14:23.299227	13	12	24
1421	6	Burnley	Birmingham City	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:14:23.306057	2016-02-21 16:14:23.306057	13	13	24
1422	6	Derby County	Birmingham City	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:14:23.31394	2016-02-21 16:14:23.31394	13	14	24
1423	6	Everton	Birmingham City	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:14:23.321102	2016-02-21 16:14:23.321102	13	15	24
1424	6	Liverpool	Birmingham City	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:14:23.3278	2016-02-21 16:14:23.3278	13	8	24
1425	6	Nottingham Forest	Birmingham City	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:14:23.336892	2016-02-21 16:14:23.336892	13	22	24
1426	6	Preston North End	Birmingham City	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:14:23.346116	2016-02-21 16:14:23.346116	13	17	24
1427	6	Sheffield United	Birmingham City	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:14:23.355273	2016-02-21 16:14:23.355273	13	32	24
1428	6	Sheffield Wednesday	Birmingham City	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:14:23.363977	2016-02-21 16:14:23.363977	13	23	24
1429	6	Stoke City	Birmingham City	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:23.371931	2016-02-21 16:14:23.371931	13	18	24
1430	6	Sunderland	Birmingham City	0	0	7	1	\N	\N	\N	\N	2016-02-21 16:14:23.380831	2016-02-21 16:14:23.380831	13	6	24
1431	6	West Bromwich Albion	Birmingham City	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:14:23.393245	2016-02-21 16:14:23.393245	13	19	24
1432	6	Wolverhampton Wanderers	Birmingham City	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:23.402925	2016-02-21 16:14:23.402925	13	20	24
1433	6	Aston Villa	Blackburn Rovers	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:14:23.412173	2016-02-21 16:14:23.412173	13	9	11
1434	6	Birmingham City	Blackburn Rovers	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:14:23.424838	2016-02-21 16:14:23.424838	13	24	11
1435	6	Bolton Wanderers	Blackburn Rovers	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:14:23.434551	2016-02-21 16:14:23.434551	13	12	11
1436	6	Burnley	Blackburn Rovers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:23.442472	2016-02-21 16:14:23.442472	13	13	11
1437	6	Derby County	Blackburn Rovers	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:14:23.449587	2016-02-21 16:14:23.449587	13	14	11
1438	6	Everton	Blackburn Rovers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:23.456736	2016-02-21 16:14:23.456736	13	15	11
1439	6	Liverpool	Blackburn Rovers	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:23.463791	2016-02-21 16:14:23.463791	13	8	11
1440	6	Nottingham Forest	Blackburn Rovers	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:14:23.47106	2016-02-21 16:14:23.47106	13	22	11
1441	6	Preston North End	Blackburn Rovers	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:14:23.479361	2016-02-21 16:14:23.479361	13	17	11
1442	6	Sheffield United	Blackburn Rovers	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:14:23.490367	2016-02-21 16:14:23.490367	13	32	11
1443	6	Sheffield Wednesday	Blackburn Rovers	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:14:23.5026	2016-02-21 16:14:23.5026	13	23	11
1444	6	Stoke City	Blackburn Rovers	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:14:23.511459	2016-02-21 16:14:23.511459	13	18	11
1445	6	Sunderland	Blackburn Rovers	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:14:23.523754	2016-02-21 16:14:23.523754	13	6	11
1446	6	West Bromwich Albion	Blackburn Rovers	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:14:23.534802	2016-02-21 16:14:23.534802	13	19	11
1447	6	Wolverhampton Wanderers	Blackburn Rovers	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:14:23.543073	2016-02-21 16:14:23.543073	13	20	11
1448	6	Aston Villa	Bolton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:23.552275	2016-02-21 16:14:23.552275	13	9	12
1449	6	Birmingham City	Bolton Wanderers	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:14:23.562435	2016-02-21 16:14:23.562435	13	24	12
1450	6	Blackburn Rovers	Bolton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:23.572389	2016-02-21 16:14:23.572389	13	11	12
1451	6	Burnley	Bolton Wanderers	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:14:23.583004	2016-02-21 16:14:23.583004	13	13	12
1452	6	Derby County	Bolton Wanderers	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:23.591706	2016-02-21 16:14:23.591706	13	14	12
1453	6	Everton	Bolton Wanderers	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:14:23.599584	2016-02-21 16:14:23.599584	13	15	12
1454	6	Liverpool	Bolton Wanderers	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:14:23.608328	2016-02-21 16:14:23.608328	13	8	12
1455	6	Nottingham Forest	Bolton Wanderers	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:14:23.617178	2016-02-21 16:14:23.617178	13	22	12
1456	6	Preston North End	Bolton Wanderers	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:23.625347	2016-02-21 16:14:23.625347	13	17	12
1457	6	Sheffield United	Bolton Wanderers	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:14:23.635387	2016-02-21 16:14:23.635387	13	32	12
1458	6	Sheffield Wednesday	Bolton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:23.642598	2016-02-21 16:14:23.642598	13	23	12
1459	6	Stoke City	Bolton Wanderers	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:14:23.64978	2016-02-21 16:14:23.64978	13	18	12
1460	6	Sunderland	Bolton Wanderers	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:14:23.657169	2016-02-21 16:14:23.657169	13	6	12
1461	6	West Bromwich Albion	Bolton Wanderers	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:14:23.664478	2016-02-21 16:14:23.664478	13	19	12
1462	6	Wolverhampton Wanderers	Bolton Wanderers	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:14:23.671741	2016-02-21 16:14:23.671741	13	20	12
1463	6	Aston Villa	Burnley	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:14:23.678966	2016-02-21 16:14:23.678966	13	9	13
1464	6	Birmingham City	Burnley	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:14:23.688472	2016-02-21 16:14:23.688472	13	24	13
1465	6	Blackburn Rovers	Burnley	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:14:23.695787	2016-02-21 16:14:23.695787	13	11	13
1466	6	Bolton Wanderers	Burnley	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:14:23.703028	2016-02-21 16:14:23.703028	13	12	13
1467	6	Derby County	Burnley	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:14:23.710582	2016-02-21 16:14:23.710582	13	14	13
1468	6	Everton	Burnley	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:14:23.719785	2016-02-21 16:14:23.719785	13	15	13
1469	6	Liverpool	Burnley	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:14:23.728128	2016-02-21 16:14:23.728128	13	8	13
1470	6	Nottingham Forest	Burnley	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:23.736781	2016-02-21 16:14:23.736781	13	22	13
1471	6	Preston North End	Burnley	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:14:23.745991	2016-02-21 16:14:23.745991	13	17	13
1472	6	Sheffield United	Burnley	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:23.754977	2016-02-21 16:14:23.754977	13	32	13
1473	6	Sheffield Wednesday	Burnley	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:14:23.762817	2016-02-21 16:14:23.762817	13	23	13
1474	6	Stoke City	Burnley	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:14:23.771398	2016-02-21 16:14:23.771398	13	18	13
1475	6	Sunderland	Burnley	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:14:23.779476	2016-02-21 16:14:23.779476	13	6	13
1476	6	West Bromwich Albion	Burnley	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:14:23.790189	2016-02-21 16:14:23.790189	13	19	13
1477	6	Wolverhampton Wanderers	Burnley	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:14:23.803243	2016-02-21 16:14:23.803243	13	20	13
1478	6	Aston Villa	Derby County	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:14:23.812109	2016-02-21 16:14:23.812109	13	9	14
1479	6	Birmingham City	Derby County	0	0	3	5	\N	\N	\N	\N	2016-02-21 16:14:23.820348	2016-02-21 16:14:23.820348	13	24	14
1480	6	Blackburn Rovers	Derby County	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:14:23.827548	2016-02-21 16:14:23.827548	13	11	14
1481	6	Bolton Wanderers	Derby County	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:14:23.83641	2016-02-21 16:14:23.83641	13	12	14
1482	6	Burnley	Derby County	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:14:23.844025	2016-02-21 16:14:23.844025	13	13	14
1483	6	Everton	Derby County	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:14:23.851157	2016-02-21 16:14:23.851157	13	15	14
1484	6	Liverpool	Derby County	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:14:23.858613	2016-02-21 16:14:23.858613	13	8	14
1485	6	Nottingham Forest	Derby County	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:23.866128	2016-02-21 16:14:23.866128	13	22	14
1486	6	Preston North End	Derby County	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:14:23.873835	2016-02-21 16:14:23.873835	13	17	14
1487	6	Sheffield United	Derby County	0	0	1	4	\N	\N	\N	\N	2016-02-21 16:14:23.892952	2016-02-21 16:14:23.892952	13	32	14
1488	6	Sheffield Wednesday	Derby County	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:14:23.901199	2016-02-21 16:14:23.901199	13	23	14
1489	6	Stoke City	Derby County	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:14:23.909665	2016-02-21 16:14:23.909665	13	18	14
1490	6	Sunderland	Derby County	0	0	8	0	\N	\N	\N	\N	2016-02-21 16:14:23.918691	2016-02-21 16:14:23.918691	13	6	14
1491	6	West Bromwich Albion	Derby County	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:23.927078	2016-02-21 16:14:23.927078	13	19	14
1492	6	Wolverhampton Wanderers	Derby County	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:23.939482	2016-02-21 16:14:23.939482	13	20	14
1493	6	Aston Villa	Everton	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:23.948717	2016-02-21 16:14:23.948717	13	9	15
1494	6	Birmingham City	Everton	0	0	4	4	\N	\N	\N	\N	2016-02-21 16:14:23.958049	2016-02-21 16:14:23.958049	13	24	15
1495	6	Blackburn Rovers	Everton	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:14:23.966882	2016-02-21 16:14:23.966882	13	11	15
1496	6	Bolton Wanderers	Everton	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:14:23.975392	2016-02-21 16:14:23.975392	13	12	15
1497	6	Burnley	Everton	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:14:23.983669	2016-02-21 16:14:23.983669	13	13	15
1498	6	Derby County	Everton	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:23.992183	2016-02-21 16:14:23.992183	13	14	15
1499	6	Liverpool	Everton	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:24.004604	2016-02-21 16:14:24.004604	13	8	15
1500	6	Nottingham Forest	Everton	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:14:24.013355	2016-02-21 16:14:24.013355	13	22	15
1501	6	Preston North End	Everton	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:14:24.022362	2016-02-21 16:14:24.022362	13	17	15
1502	6	Sheffield United	Everton	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:14:24.03144	2016-02-21 16:14:24.03144	13	32	15
1503	6	Sheffield Wednesday	Everton	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:14:24.044271	2016-02-21 16:14:24.044271	13	23	15
1504	6	Stoke City	Everton	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:14:24.057196	2016-02-21 16:14:24.057196	13	18	15
1505	6	Sunderland	Everton	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:24.06807	2016-02-21 16:14:24.06807	13	6	15
1506	6	West Bromwich Albion	Everton	0	0	1	4	\N	\N	\N	\N	2016-02-21 16:14:24.07955	2016-02-21 16:14:24.07955	13	19	15
1507	6	Wolverhampton Wanderers	Everton	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:14:24.092085	2016-02-21 16:14:24.092085	13	20	15
1508	6	Aston Villa	Liverpool	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:14:24.104825	2016-02-21 16:14:24.104825	13	9	8
1509	6	Birmingham City	Liverpool	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:14:24.114689	2016-02-21 16:14:24.114689	13	24	8
1510	6	Blackburn Rovers	Liverpool	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:14:24.123313	2016-02-21 16:14:24.123313	13	11	8
1511	6	Bolton Wanderers	Liverpool	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:14:24.131313	2016-02-21 16:14:24.131313	13	12	8
1512	6	Burnley	Liverpool	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:14:24.14659	2016-02-21 16:14:24.14659	13	13	8
1513	6	Derby County	Liverpool	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:14:24.155169	2016-02-21 16:14:24.155169	13	14	8
1514	6	Everton	Liverpool	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:14:24.17183	2016-02-21 16:14:24.17183	13	15	8
1515	6	Nottingham Forest	Liverpool	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:14:24.180865	2016-02-21 16:14:24.180865	13	22	8
1516	6	Preston North End	Liverpool	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:24.193592	2016-02-21 16:14:24.193592	13	17	8
1517	6	Sheffield United	Liverpool	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:24.204662	2016-02-21 16:14:24.204662	13	32	8
1518	6	Sheffield Wednesday	Liverpool	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:14:24.21468	2016-02-21 16:14:24.21468	13	23	8
1519	6	Stoke City	Liverpool	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:14:24.223241	2016-02-21 16:14:24.223241	13	18	8
1520	6	Sunderland	Liverpool	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:14:24.23333	2016-02-21 16:14:24.23333	13	6	8
1521	6	West Bromwich Albion	Liverpool	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:14:24.242383	2016-02-21 16:14:24.242383	13	19	8
1522	6	Wolverhampton Wanderers	Liverpool	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:14:24.250831	2016-02-21 16:14:24.250831	13	20	8
1523	6	Aston Villa	Nottingham Forest	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:14:24.259872	2016-02-21 16:14:24.259872	13	9	22
1524	6	Birmingham City	Nottingham Forest	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:14:24.268036	2016-02-21 16:14:24.268036	13	24	22
1525	6	Blackburn Rovers	Nottingham Forest	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:14:24.27651	2016-02-21 16:14:24.27651	13	11	22
1526	6	Bolton Wanderers	Nottingham Forest	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:14:24.286754	2016-02-21 16:14:24.286754	13	12	22
1527	6	Burnley	Nottingham Forest	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:14:24.295641	2016-02-21 16:14:24.295641	13	13	22
1528	6	Derby County	Nottingham Forest	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:14:24.308004	2016-02-21 16:14:24.308004	13	14	22
1529	6	Everton	Nottingham Forest	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:14:24.317246	2016-02-21 16:14:24.317246	13	15	22
1530	6	Liverpool	Nottingham Forest	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:14:24.325748	2016-02-21 16:14:24.325748	13	8	22
1531	6	Preston North End	Nottingham Forest	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:14:24.335442	2016-02-21 16:14:24.335442	13	17	22
1532	6	Sheffield United	Nottingham Forest	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:14:24.347213	2016-02-21 16:14:24.347213	13	32	22
1533	6	Sheffield Wednesday	Nottingham Forest	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:14:24.359034	2016-02-21 16:14:24.359034	13	23	22
1534	6	Stoke City	Nottingham Forest	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:14:24.370936	2016-02-21 16:14:24.370936	13	18	22
1535	6	Sunderland	Nottingham Forest	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:24.383058	2016-02-21 16:14:24.383058	13	6	22
1536	6	West Bromwich Albion	Nottingham Forest	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:14:24.396349	2016-02-21 16:14:24.396349	13	19	22
1537	6	Wolverhampton Wanderers	Nottingham Forest	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:14:24.404683	2016-02-21 16:14:24.404683	13	20	22
1538	6	Aston Villa	Preston North End	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:14:24.413292	2016-02-21 16:14:24.413292	13	9	17
1539	6	Birmingham City	Preston North End	0	0	4	4	\N	\N	\N	\N	2016-02-21 16:14:24.424552	2016-02-21 16:14:24.424552	13	24	17
1540	6	Blackburn Rovers	Preston North End	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:14:24.431652	2016-02-21 16:14:24.431652	13	11	17
1541	6	Bolton Wanderers	Preston North End	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:14:24.439079	2016-02-21 16:14:24.439079	13	12	17
1542	6	Burnley	Preston North End	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:24.446832	2016-02-21 16:14:24.446832	13	13	17
1543	6	Derby County	Preston North End	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:24.454366	2016-02-21 16:14:24.454366	13	14	17
1544	6	Everton	Preston North End	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:14:24.463213	2016-02-21 16:14:24.463213	13	15	17
1545	6	Liverpool	Preston North End	0	0	2	5	\N	\N	\N	\N	2016-02-21 16:14:24.471712	2016-02-21 16:14:24.471712	13	8	17
1546	6	Nottingham Forest	Preston North End	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:14:24.480199	2016-02-21 16:14:24.480199	13	22	17
1547	6	Sheffield United	Preston North End	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:14:24.502435	2016-02-21 16:14:24.502435	13	32	17
1548	6	Sheffield Wednesday	Preston North End	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:14:24.510703	2016-02-21 16:14:24.510703	13	23	17
1549	6	Stoke City	Preston North End	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:24.519943	2016-02-21 16:14:24.519943	13	18	17
1550	6	Sunderland	Preston North End	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:14:24.585321	2016-02-21 16:14:24.585321	13	6	17
1551	6	West Bromwich Albion	Preston North End	0	0	4	5	\N	\N	\N	\N	2016-02-21 16:14:24.595435	2016-02-21 16:14:24.595435	13	19	17
1552	6	Wolverhampton Wanderers	Preston North End	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:14:24.604723	2016-02-21 16:14:24.604723	13	20	17
1553	6	Aston Villa	Sheffield United	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:14:24.614515	2016-02-21 16:14:24.614515	13	9	32
1554	6	Birmingham City	Sheffield United	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:14:24.625319	2016-02-21 16:14:24.625319	13	24	32
1555	6	Blackburn Rovers	Sheffield United	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:14:24.63306	2016-02-21 16:14:24.63306	13	11	32
1556	6	Bolton Wanderers	Sheffield United	0	0	6	2	\N	\N	\N	\N	2016-02-21 16:14:24.640326	2016-02-21 16:14:24.640326	13	12	32
1557	6	Burnley	Sheffield United	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:14:24.647023	2016-02-21 16:14:24.647023	13	13	32
1558	6	Derby County	Sheffield United	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:14:24.653163	2016-02-21 16:14:24.653163	13	14	32
1559	6	Everton	Sheffield United	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:14:24.661523	2016-02-21 16:14:24.661523	13	15	32
1560	6	Liverpool	Sheffield United	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:24.670133	2016-02-21 16:14:24.670133	13	8	32
1561	6	Nottingham Forest	Sheffield United	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:14:24.679001	2016-02-21 16:14:24.679001	13	22	32
1562	6	Preston North End	Sheffield United	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:24.698411	2016-02-21 16:14:24.698411	13	17	32
1563	6	Sheffield Wednesday	Sheffield United	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:14:24.708269	2016-02-21 16:14:24.708269	13	23	32
1564	6	Stoke City	Sheffield United	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:14:24.71642	2016-02-21 16:14:24.71642	13	18	32
1565	6	Sunderland	Sheffield United	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:14:24.723723	2016-02-21 16:14:24.723723	13	6	32
1566	6	West Bromwich Albion	Sheffield United	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:14:24.730911	2016-02-21 16:14:24.730911	13	19	32
1567	6	Wolverhampton Wanderers	Sheffield United	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:14:24.739314	2016-02-21 16:14:24.739314	13	20	32
1568	6	Aston Villa	Sheffield Wednesday	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:14:24.749848	2016-02-21 16:14:24.749848	13	9	23
1569	6	Birmingham City	Sheffield Wednesday	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:14:24.75862	2016-02-21 16:14:24.75862	13	24	23
1570	6	Blackburn Rovers	Sheffield Wednesday	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:14:24.769167	2016-02-21 16:14:24.769167	13	11	23
1571	6	Bolton Wanderers	Sheffield Wednesday	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:24.778766	2016-02-21 16:14:24.778766	13	12	23
1572	6	Burnley	Sheffield Wednesday	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:14:24.78813	2016-02-21 16:14:24.78813	13	13	23
1573	6	Derby County	Sheffield Wednesday	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:14:24.79642	2016-02-21 16:14:24.79642	13	14	23
1574	6	Everton	Sheffield Wednesday	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:14:24.803555	2016-02-21 16:14:24.803555	13	15	23
1575	6	Liverpool	Sheffield Wednesday	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:14:24.812027	2016-02-21 16:14:24.812027	13	8	23
1576	6	Nottingham Forest	Sheffield Wednesday	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:24.820892	2016-02-21 16:14:24.820892	13	22	23
1577	6	Preston North End	Sheffield Wednesday	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:14:24.829649	2016-02-21 16:14:24.829649	13	17	23
1578	6	Sheffield United	Sheffield Wednesday	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:14:24.841028	2016-02-21 16:14:24.841028	13	32	23
1579	6	Stoke City	Sheffield Wednesday	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:14:24.850699	2016-02-21 16:14:24.850699	13	18	23
1580	6	Sunderland	Sheffield Wednesday	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:14:24.860978	2016-02-21 16:14:24.860978	13	6	23
1581	6	West Bromwich Albion	Sheffield Wednesday	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:14:24.870022	2016-02-21 16:14:24.870022	13	19	23
1582	6	Wolverhampton Wanderers	Sheffield Wednesday	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:14:24.881323	2016-02-21 16:14:24.881323	13	20	23
1583	6	Aston Villa	Stoke City	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:14:24.890265	2016-02-21 16:14:24.890265	13	9	18
1584	6	Birmingham City	Stoke City	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:14:24.898646	2016-02-21 16:14:24.898646	13	24	18
1585	6	Blackburn Rovers	Stoke City	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:14:24.911164	2016-02-21 16:14:24.911164	13	11	18
1586	6	Bolton Wanderers	Stoke City	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:24.922134	2016-02-21 16:14:24.922134	13	12	18
1587	6	Burnley	Stoke City	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:14:24.932815	2016-02-21 16:14:24.932815	13	13	18
1588	6	Derby County	Stoke City	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:14:24.940937	2016-02-21 16:14:24.940937	13	14	18
1589	6	Everton	Stoke City	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:14:24.95017	2016-02-21 16:14:24.95017	13	15	18
1590	6	Liverpool	Stoke City	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:14:24.961646	2016-02-21 16:14:24.961646	13	8	18
1591	6	Nottingham Forest	Stoke City	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:14:24.972819	2016-02-21 16:14:24.972819	13	22	18
1592	6	Preston North End	Stoke City	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:14:24.984295	2016-02-21 16:14:24.984295	13	17	18
1593	6	Sheffield United	Stoke City	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:14:24.996607	2016-02-21 16:14:24.996607	13	32	18
1594	6	Sheffield Wednesday	Stoke City	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:14:25.013359	2016-02-21 16:14:25.013359	13	23	18
1595	6	Sunderland	Stoke City	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:14:25.029309	2016-02-21 16:14:25.029309	13	6	18
1596	6	West Bromwich Albion	Stoke City	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:14:25.041827	2016-02-21 16:14:25.041827	13	19	18
1597	6	Wolverhampton Wanderers	Stoke City	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:14:25.058882	2016-02-21 16:14:25.058882	13	20	18
1598	6	Aston Villa	Sunderland	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:14:25.068977	2016-02-21 16:14:25.068977	13	9	6
1599	6	Birmingham City	Sunderland	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:14:25.079798	2016-02-21 16:14:25.079798	13	24	6
1600	6	Blackburn Rovers	Sunderland	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:14:25.088537	2016-02-21 16:14:25.088537	13	11	6
1601	6	Bolton Wanderers	Sunderland	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:14:25.098127	2016-02-21 16:14:25.098127	13	12	6
1602	6	Burnley	Sunderland	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:14:25.10811	2016-02-21 16:14:25.10811	13	13	6
1603	6	Derby County	Sunderland	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:14:25.119316	2016-02-21 16:14:25.119316	13	14	6
1604	6	Everton	Sunderland	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:25.128782	2016-02-21 16:14:25.128782	13	15	6
1605	6	Liverpool	Sunderland	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:14:25.137011	2016-02-21 16:14:25.137011	13	8	6
1606	6	Nottingham Forest	Sunderland	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:25.146161	2016-02-21 16:14:25.146161	13	22	6
1607	6	Preston North End	Sunderland	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:14:25.154805	2016-02-21 16:14:25.154805	13	17	6
1608	6	Sheffield United	Sunderland	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:14:25.162376	2016-02-21 16:14:25.162376	13	32	6
1609	6	Sheffield Wednesday	Sunderland	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:14:25.168739	2016-02-21 16:14:25.168739	13	23	6
1610	6	Stoke City	Sunderland	0	0	2	5	\N	\N	\N	\N	2016-02-21 16:14:25.175572	2016-02-21 16:14:25.175572	13	18	6
1611	6	West Bromwich Albion	Sunderland	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:14:25.184081	2016-02-21 16:14:25.184081	13	19	6
1612	6	Wolverhampton Wanderers	Sunderland	0	0	1	4	\N	\N	\N	\N	2016-02-21 16:14:25.199337	2016-02-21 16:14:25.199337	13	20	6
1613	6	Aston Villa	West Bromwich Albion	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:14:25.215736	2016-02-21 16:14:25.215736	13	9	19
1614	6	Birmingham City	West Bromwich Albion	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:14:25.238585	2016-02-21 16:14:25.238585	13	24	19
1615	6	Blackburn Rovers	West Bromwich Albion	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:14:25.252263	2016-02-21 16:14:25.252263	13	11	19
1616	6	Bolton Wanderers	West Bromwich Albion	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:14:25.258797	2016-02-21 16:14:25.258797	13	12	19
1617	6	Burnley	West Bromwich Albion	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:14:25.265235	2016-02-21 16:14:25.265235	13	13	19
1618	6	Derby County	West Bromwich Albion	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:14:25.272242	2016-02-21 16:14:25.272242	13	14	19
1619	6	Everton	West Bromwich Albion	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:14:25.279362	2016-02-21 16:14:25.279362	13	15	19
1620	6	Liverpool	West Bromwich Albion	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:14:25.28705	2016-02-21 16:14:25.28705	13	8	19
1621	6	Nottingham Forest	West Bromwich Albion	0	0	5	3	\N	\N	\N	\N	2016-02-21 16:14:25.294746	2016-02-21 16:14:25.294746	13	22	19
1622	6	Preston North End	West Bromwich Albion	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:14:25.303465	2016-02-21 16:14:25.303465	13	17	19
1623	6	Sheffield United	West Bromwich Albion	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:25.310801	2016-02-21 16:14:25.310801	13	32	19
1624	6	Sheffield Wednesday	West Bromwich Albion	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:14:25.318715	2016-02-21 16:14:25.318715	13	23	19
1625	6	Stoke City	West Bromwich Albion	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:14:25.325853	2016-02-21 16:14:25.325853	13	18	19
1626	6	Sunderland	West Bromwich Albion	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:14:25.333769	2016-02-21 16:14:25.333769	13	6	19
1627	6	Wolverhampton Wanderers	West Bromwich Albion	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:14:25.341177	2016-02-21 16:14:25.341177	13	20	19
1628	6	Aston Villa	Wolverhampton Wanderers	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:14:25.348733	2016-02-21 16:14:25.348733	13	9	20
1629	6	Birmingham City	Wolverhampton Wanderers	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:14:25.355629	2016-02-21 16:14:25.355629	13	24	20
1630	6	Blackburn Rovers	Wolverhampton Wanderers	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:14:25.361859	2016-02-21 16:14:25.361859	13	11	20
1631	6	Bolton Wanderers	Wolverhampton Wanderers	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:14:25.36979	2016-02-21 16:14:25.36979	13	12	20
1632	6	Burnley	Wolverhampton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:25.377694	2016-02-21 16:14:25.377694	13	13	20
1633	6	Derby County	Wolverhampton Wanderers	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:14:25.389623	2016-02-21 16:14:25.389623	13	14	20
1634	6	Everton	Wolverhampton Wanderers	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:14:25.399719	2016-02-21 16:14:25.399719	13	15	20
1635	6	Liverpool	Wolverhampton Wanderers	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:14:25.411216	2016-02-21 16:14:25.411216	13	8	20
1636	6	Nottingham Forest	Wolverhampton Wanderers	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:14:25.440846	2016-02-21 16:14:25.440846	13	22	20
1637	6	Preston North End	Wolverhampton Wanderers	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:14:25.447902	2016-02-21 16:14:25.447902	13	17	20
1638	6	Sheffield United	Wolverhampton Wanderers	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:14:25.454141	2016-02-21 16:14:25.454141	13	32	20
1639	6	Sheffield Wednesday	Wolverhampton Wanderers	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:14:25.460436	2016-02-21 16:14:25.460436	13	23	20
1640	6	Stoke City	Wolverhampton Wanderers	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:14:25.468265	2016-02-21 16:14:25.468265	13	18	20
1641	6	Sunderland	Wolverhampton Wanderers	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:14:25.475402	2016-02-21 16:14:25.475402	13	6	20
1642	6	West Bromwich Albion	Wolverhampton Wanderers	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:14:25.483336	2016-02-21 16:14:25.483336	13	19	20
1643	7	Burton Swifts	Arsenal	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:15:05.723126	2016-02-21 16:15:05.723126	13	26	3
1644	7	Burton Wanderers	Arsenal	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:05.76998	2016-02-21 16:15:05.76998	13	37	3
1645	7	Bury	Arsenal	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:15:05.788715	2016-02-21 16:15:05.788715	13	38	3
1646	7	Crewe Alexandra	Arsenal	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:15:05.805973	2016-02-21 16:15:05.805973	13	27	3
1647	7	Darwen	Arsenal	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:15:05.82159	2016-02-21 16:15:05.82159	13	21	3
1648	7	Grimsby Town	Arsenal	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:15:05.839673	2016-02-21 16:15:05.839673	13	28	3
1649	7	Leicester City	Arsenal	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:15:05.860888	2016-02-21 16:15:05.860888	13	2	3
1650	7	Lincoln City	Arsenal	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:15:05.871508	2016-02-21 16:15:05.871508	13	29	3
1651	7	Manchester City	Arsenal	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:15:05.879458	2016-02-21 16:15:05.879458	13	7	3
1652	7	Manchester United	Arsenal	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:15:05.886482	2016-02-21 16:15:05.886482	13	4	3
1653	7	Newcastle United	Arsenal	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:15:05.893465	2016-02-21 16:15:05.893465	13	35	3
1654	7	Notts County	Arsenal	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:15:05.901714	2016-02-21 16:15:05.901714	13	16	3
1655	7	Port Vale	Arsenal	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:15:05.909555	2016-02-21 16:15:05.909555	13	31	3
1656	7	Rotherham Town	Arsenal	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:15:05.916279	2016-02-21 16:15:05.916279	13	36	3
1657	7	Walsall	Arsenal	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:15:05.923228	2016-02-21 16:15:05.923228	13	33	3
1658	7	Arsenal	Burton Swifts	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:15:05.929687	2016-02-21 16:15:05.929687	13	3	26
1659	7	Burton Wanderers	Burton Swifts	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:15:05.939843	2016-02-21 16:15:05.939843	13	37	26
1660	7	Bury	Burton Swifts	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:15:05.946783	2016-02-21 16:15:05.946783	13	38	26
1661	7	Crewe Alexandra	Burton Swifts	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:15:05.95375	2016-02-21 16:15:05.95375	13	27	26
1662	7	Darwen	Burton Swifts	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:15:05.961288	2016-02-21 16:15:05.961288	13	21	26
1663	7	Grimsby Town	Burton Swifts	0	0	7	1	\N	\N	\N	\N	2016-02-21 16:15:05.968565	2016-02-21 16:15:05.968565	13	28	26
1664	7	Leicester City	Burton Swifts	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:15:05.97532	2016-02-21 16:15:05.97532	13	2	26
1665	7	Lincoln City	Burton Swifts	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:15:05.99478	2016-02-21 16:15:05.99478	13	29	26
1666	7	Manchester City	Burton Swifts	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:15:06.006766	2016-02-21 16:15:06.006766	13	7	26
1667	7	Manchester United	Burton Swifts	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:15:06.019375	2016-02-21 16:15:06.019375	13	4	26
1668	7	Newcastle United	Burton Swifts	0	0	6	3	\N	\N	\N	\N	2016-02-21 16:15:06.03107	2016-02-21 16:15:06.03107	13	35	26
1669	7	Notts County	Burton Swifts	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:15:06.045666	2016-02-21 16:15:06.045666	13	16	26
1670	7	Port Vale	Burton Swifts	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:15:06.0602	2016-02-21 16:15:06.0602	13	31	26
1671	7	Rotherham Town	Burton Swifts	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:15:06.069352	2016-02-21 16:15:06.069352	13	36	26
1672	7	Walsall	Burton Swifts	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:15:06.077632	2016-02-21 16:15:06.077632	13	33	26
1673	7	Arsenal	Burton Wanderers	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:15:06.08817	2016-02-21 16:15:06.08817	13	3	37
1674	7	Burton Swifts	Burton Wanderers	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:15:06.095786	2016-02-21 16:15:06.095786	13	26	37
1675	7	Bury	Burton Wanderers	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:15:06.105272	2016-02-21 16:15:06.105272	13	38	37
1676	7	Crewe Alexandra	Burton Wanderers	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:15:06.113489	2016-02-21 16:15:06.113489	13	27	37
1677	7	Darwen	Burton Wanderers	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:15:06.124269	2016-02-21 16:15:06.124269	13	21	37
1678	7	Grimsby Town	Burton Wanderers	0	0	7	2	\N	\N	\N	\N	2016-02-21 16:15:06.133205	2016-02-21 16:15:06.133205	13	28	37
1679	7	Leicester City	Burton Wanderers	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:15:06.142837	2016-02-21 16:15:06.142837	13	2	37
1680	7	Lincoln City	Burton Wanderers	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:15:06.152048	2016-02-21 16:15:06.152048	13	29	37
1681	7	Manchester City	Burton Wanderers	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:15:06.161704	2016-02-21 16:15:06.161704	13	7	37
1682	7	Manchester United	Burton Wanderers	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:15:06.169333	2016-02-21 16:15:06.169333	13	4	37
1683	7	Newcastle United	Burton Wanderers	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:15:06.176395	2016-02-21 16:15:06.176395	13	35	37
1684	7	Notts County	Burton Wanderers	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:15:06.186613	2016-02-21 16:15:06.186613	13	16	37
1685	7	Port Vale	Burton Wanderers	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:15:06.204145	2016-02-21 16:15:06.204145	13	31	37
1686	7	Rotherham Town	Burton Wanderers	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:15:06.219598	2016-02-21 16:15:06.219598	13	36	37
1687	7	Walsall	Burton Wanderers	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:15:06.243158	2016-02-21 16:15:06.243158	13	33	37
1688	7	Arsenal	Bury	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:15:06.25339	2016-02-21 16:15:06.25339	13	3	38
1689	7	Burton Swifts	Bury	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:15:06.263214	2016-02-21 16:15:06.263214	13	26	38
1690	7	Burton Wanderers	Bury	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:15:06.272022	2016-02-21 16:15:06.272022	13	37	38
1691	7	Crewe Alexandra	Bury	0	0	1	5	\N	\N	\N	\N	2016-02-21 16:15:06.279433	2016-02-21 16:15:06.279433	13	27	38
1692	7	Darwen	Bury	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:15:06.29021	2016-02-21 16:15:06.29021	13	21	38
1693	7	Grimsby Town	Bury	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:15:06.307276	2016-02-21 16:15:06.307276	13	28	38
1694	7	Leicester City	Bury	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:15:06.325643	2016-02-21 16:15:06.325643	13	2	38
1695	7	Lincoln City	Bury	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:15:06.336796	2016-02-21 16:15:06.336796	13	29	38
1696	7	Manchester City	Bury	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:15:06.352966	2016-02-21 16:15:06.352966	13	7	38
1697	7	Manchester United	Bury	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:15:06.368212	2016-02-21 16:15:06.368212	13	4	38
1698	7	Newcastle United	Bury	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:15:06.382098	2016-02-21 16:15:06.382098	13	35	38
1699	7	Notts County	Bury	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:06.407761	2016-02-21 16:15:06.407761	13	16	38
1700	7	Port Vale	Bury	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:15:06.428956	2016-02-21 16:15:06.428956	13	31	38
1701	7	Rotherham Town	Bury	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:15:06.454787	2016-02-21 16:15:06.454787	13	36	38
1702	7	Walsall	Bury	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:15:06.475635	2016-02-21 16:15:06.475635	13	33	38
1703	7	Arsenal	Crewe Alexandra	0	0	7	0	\N	\N	\N	\N	2016-02-21 16:15:06.489346	2016-02-21 16:15:06.489346	13	3	27
1704	7	Burton Swifts	Crewe Alexandra	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:15:06.498607	2016-02-21 16:15:06.498607	13	26	27
1705	7	Burton Wanderers	Crewe Alexandra	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:15:06.507629	2016-02-21 16:15:06.507629	13	37	27
1706	7	Bury	Crewe Alexandra	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:15:06.516576	2016-02-21 16:15:06.516576	13	38	27
1707	7	Darwen	Crewe Alexandra	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:15:06.542076	2016-02-21 16:15:06.542076	13	21	27
1708	7	Grimsby Town	Crewe Alexandra	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:15:06.551245	2016-02-21 16:15:06.551245	13	28	27
1709	7	Leicester City	Crewe Alexandra	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:15:06.558674	2016-02-21 16:15:06.558674	13	2	27
1710	7	Lincoln City	Crewe Alexandra	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:15:06.57055	2016-02-21 16:15:06.57055	13	29	27
1711	7	Manchester City	Crewe Alexandra	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:15:06.582199	2016-02-21 16:15:06.582199	13	7	27
1712	7	Manchester United	Crewe Alexandra	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:15:06.59869	2016-02-21 16:15:06.59869	13	4	27
1713	7	Newcastle United	Crewe Alexandra	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:15:06.61568	2016-02-21 16:15:06.61568	13	35	27
1714	7	Notts County	Crewe Alexandra	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:15:06.638727	2016-02-21 16:15:06.638727	13	16	27
1715	7	Port Vale	Crewe Alexandra	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:15:06.668069	2016-02-21 16:15:06.668069	13	31	27
1716	7	Rotherham Town	Crewe Alexandra	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:15:06.684255	2016-02-21 16:15:06.684255	13	36	27
1717	7	Walsall	Crewe Alexandra	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:15:06.698312	2016-02-21 16:15:06.698312	13	33	27
1718	7	Arsenal	Darwen	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:15:06.710394	2016-02-21 16:15:06.710394	13	3	21
1719	7	Burton Swifts	Darwen	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:15:06.719101	2016-02-21 16:15:06.719101	13	26	21
1720	7	Burton Wanderers	Darwen	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:15:06.727818	2016-02-21 16:15:06.727818	13	37	21
1721	7	Bury	Darwen	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:15:06.736594	2016-02-21 16:15:06.736594	13	38	21
1722	7	Crewe Alexandra	Darwen	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:15:06.745566	2016-02-21 16:15:06.745566	13	27	21
1723	7	Grimsby Town	Darwen	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:06.753529	2016-02-21 16:15:06.753529	13	28	21
1724	7	Leicester City	Darwen	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:06.759721	2016-02-21 16:15:06.759721	13	2	21
1725	7	Lincoln City	Darwen	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:15:06.769492	2016-02-21 16:15:06.769492	13	29	21
1726	7	Manchester City	Darwen	0	0	2	4	\N	\N	\N	\N	2016-02-21 16:15:06.777998	2016-02-21 16:15:06.777998	13	7	21
1727	7	Manchester United	Darwen	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:15:06.794171	2016-02-21 16:15:06.794171	13	4	21
1728	7	Newcastle United	Darwen	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:15:06.810598	2016-02-21 16:15:06.810598	13	35	21
1729	7	Notts County	Darwen	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:06.825375	2016-02-21 16:15:06.825375	13	16	21
1730	7	Port Vale	Darwen	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:15:06.840822	2016-02-21 16:15:06.840822	13	31	21
1731	7	Rotherham Town	Darwen	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:15:06.854757	2016-02-21 16:15:06.854757	13	36	21
1732	7	Walsall	Darwen	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:15:06.863957	2016-02-21 16:15:06.863957	13	33	21
1733	7	Arsenal	Grimsby Town	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:15:06.874548	2016-02-21 16:15:06.874548	13	3	28
1734	7	Burton Swifts	Grimsby Town	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:06.88313	2016-02-21 16:15:06.88313	13	26	28
1735	7	Burton Wanderers	Grimsby Town	0	0	0	0	\N	\N	\N	\N	2016-02-21 16:15:06.892403	2016-02-21 16:15:06.892403	13	37	28
1736	7	Bury	Grimsby Town	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:15:06.9005	2016-02-21 16:15:06.9005	13	38	28
1737	7	Crewe Alexandra	Grimsby Town	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:06.907902	2016-02-21 16:15:06.907902	13	27	28
1738	7	Darwen	Grimsby Town	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:15:06.916457	2016-02-21 16:15:06.916457	13	21	28
1739	7	Leicester City	Grimsby Town	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:15:06.924228	2016-02-21 16:15:06.924228	13	2	28
1740	7	Lincoln City	Grimsby Town	0	0	1	5	\N	\N	\N	\N	2016-02-21 16:15:06.933143	2016-02-21 16:15:06.933143	13	29	28
1741	7	Manchester City	Grimsby Town	0	0	2	5	\N	\N	\N	\N	2016-02-21 16:15:06.940243	2016-02-21 16:15:06.940243	13	7	28
1742	7	Manchester United	Grimsby Town	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:15:06.94697	2016-02-21 16:15:06.94697	13	4	28
1743	7	Newcastle United	Grimsby Town	0	0	1	4	\N	\N	\N	\N	2016-02-21 16:15:06.953403	2016-02-21 16:15:06.953403	13	35	28
1744	7	Notts County	Grimsby Town	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:15:06.961137	2016-02-21 16:15:06.961137	13	16	28
1745	7	Port Vale	Grimsby Town	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:15:06.967882	2016-02-21 16:15:06.967882	13	31	28
1746	7	Rotherham Town	Grimsby Town	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:15:06.97475	2016-02-21 16:15:06.97475	13	36	28
1747	7	Walsall	Grimsby Town	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:15:06.980772	2016-02-21 16:15:06.980772	13	33	28
1748	7	Arsenal	Leicester City	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:15:06.992689	2016-02-21 16:15:06.992689	13	3	2
1749	7	Burton Swifts	Leicester City	0	0	0	5	\N	\N	\N	\N	2016-02-21 16:15:07.011526	2016-02-21 16:15:07.011526	13	26	2
1750	7	Burton Wanderers	Leicester City	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:15:07.026031	2016-02-21 16:15:07.026031	13	37	2
1751	7	Bury	Leicester City	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:15:07.043113	2016-02-21 16:15:07.043113	13	38	2
1752	7	Crewe Alexandra	Leicester City	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:15:07.054282	2016-02-21 16:15:07.054282	13	27	2
1753	7	Darwen	Leicester City	0	0	8	2	\N	\N	\N	\N	2016-02-21 16:15:07.064371	2016-02-21 16:15:07.064371	13	21	2
1754	7	Grimsby Town	Leicester City	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:15:07.073705	2016-02-21 16:15:07.073705	13	28	2
1755	7	Lincoln City	Leicester City	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:15:07.082803	2016-02-21 16:15:07.082803	13	29	2
1756	7	Manchester City	Leicester City	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:15:07.089722	2016-02-21 16:15:07.089722	13	7	2
1757	7	Manchester United	Leicester City	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:15:07.098563	2016-02-21 16:15:07.098563	13	4	2
1758	7	Newcastle United	Leicester City	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:15:07.106204	2016-02-21 16:15:07.106204	13	35	2
1759	7	Notts County	Leicester City	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:15:07.113597	2016-02-21 16:15:07.113597	13	16	2
1760	7	Port Vale	Leicester City	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:15:07.12082	2016-02-21 16:15:07.12082	13	31	2
1761	7	Rotherham Town	Leicester City	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:15:07.128975	2016-02-21 16:15:07.128975	13	36	2
1762	7	Walsall	Leicester City	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:15:07.136359	2016-02-21 16:15:07.136359	13	33	2
1763	7	Arsenal	Lincoln City	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:15:07.143253	2016-02-21 16:15:07.143253	13	3	29
1764	7	Burton Swifts	Lincoln City	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:15:07.150964	2016-02-21 16:15:07.150964	13	26	29
1765	7	Burton Wanderers	Lincoln City	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:15:07.158457	2016-02-21 16:15:07.158457	13	37	29
1766	7	Bury	Lincoln City	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:15:07.165775	2016-02-21 16:15:07.165775	13	38	29
1767	7	Crewe Alexandra	Lincoln City	0	0	1	4	\N	\N	\N	\N	2016-02-21 16:15:07.193823	2016-02-21 16:15:07.193823	13	27	29
1768	7	Darwen	Lincoln City	0	0	6	0	\N	\N	\N	\N	2016-02-21 16:15:07.213372	2016-02-21 16:15:07.213372	13	21	29
1769	7	Grimsby Town	Lincoln City	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:15:07.231596	2016-02-21 16:15:07.231596	13	28	29
1770	7	Leicester City	Lincoln City	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:07.24548	2016-02-21 16:15:07.24548	13	2	29
1771	7	Manchester City	Lincoln City	0	0	11	3	\N	\N	\N	\N	2016-02-21 16:15:07.254146	2016-02-21 16:15:07.254146	13	7	29
1772	7	Manchester United	Lincoln City	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:15:07.263612	2016-02-21 16:15:07.263612	13	4	29
1773	7	Newcastle United	Lincoln City	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:15:07.270894	2016-02-21 16:15:07.270894	13	35	29
1774	7	Notts County	Lincoln City	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:15:07.278642	2016-02-21 16:15:07.278642	13	16	29
1775	7	Port Vale	Lincoln City	0	0	7	1	\N	\N	\N	\N	2016-02-21 16:15:07.285092	2016-02-21 16:15:07.285092	13	31	29
1776	7	Rotherham Town	Lincoln City	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:15:07.292112	2016-02-21 16:15:07.292112	13	36	29
1777	7	Walsall	Lincoln City	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:15:07.298765	2016-02-21 16:15:07.298765	13	33	29
1778	7	Arsenal	Manchester City	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:15:07.305148	2016-02-21 16:15:07.305148	13	3	7
1779	7	Burton Swifts	Manchester City	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:07.312396	2016-02-21 16:15:07.312396	13	26	7
1780	7	Burton Wanderers	Manchester City	0	0	8	0	\N	\N	\N	\N	2016-02-21 16:15:07.319638	2016-02-21 16:15:07.319638	13	37	7
1781	7	Bury	Manchester City	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:15:07.327975	2016-02-21 16:15:07.327975	13	38	7
1782	7	Crewe Alexandra	Manchester City	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:15:07.337493	2016-02-21 16:15:07.337493	13	27	7
1783	7	Darwen	Manchester City	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:15:07.344677	2016-02-21 16:15:07.344677	13	21	7
1784	7	Grimsby Town	Manchester City	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:07.351764	2016-02-21 16:15:07.351764	13	28	7
1785	7	Leicester City	Manchester City	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:15:07.35845	2016-02-21 16:15:07.35845	13	2	7
1786	7	Lincoln City	Manchester City	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:15:07.367784	2016-02-21 16:15:07.367784	13	29	7
1787	7	Manchester United	Manchester City	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:15:07.376638	2016-02-21 16:15:07.376638	13	4	7
1788	7	Newcastle United	Manchester City	0	0	5	4	\N	\N	\N	\N	2016-02-21 16:15:07.392618	2016-02-21 16:15:07.392618	13	35	7
1789	7	Notts County	Manchester City	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:15:07.402529	2016-02-21 16:15:07.402529	13	16	7
1790	7	Port Vale	Manchester City	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:15:07.415596	2016-02-21 16:15:07.415596	13	31	7
1791	7	Rotherham Town	Manchester City	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:15:07.429743	2016-02-21 16:15:07.429743	13	36	7
1792	7	Walsall	Manchester City	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:15:07.44501	2016-02-21 16:15:07.44501	13	33	7
1793	7	Arsenal	Manchester United	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:15:07.464227	2016-02-21 16:15:07.464227	13	3	4
1794	7	Burton Swifts	Manchester United	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:15:07.474095	2016-02-21 16:15:07.474095	13	26	4
1795	7	Burton Wanderers	Manchester United	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:15:07.481368	2016-02-21 16:15:07.481368	13	37	4
1796	7	Bury	Manchester United	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:07.488137	2016-02-21 16:15:07.488137	13	38	4
1797	7	Crewe Alexandra	Manchester United	0	0	0	2	\N	\N	\N	\N	2016-02-21 16:15:07.497056	2016-02-21 16:15:07.497056	13	27	4
1798	7	Darwen	Manchester United	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:15:07.50436	2016-02-21 16:15:07.50436	13	21	4
1799	7	Grimsby Town	Manchester United	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:07.510822	2016-02-21 16:15:07.510822	13	28	4
1800	7	Leicester City	Manchester United	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:15:07.51776	2016-02-21 16:15:07.51776	13	2	4
1801	7	Lincoln City	Manchester United	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:15:07.533072	2016-02-21 16:15:07.533072	13	29	4
1802	7	Manchester City	Manchester United	0	0	2	5	\N	\N	\N	\N	2016-02-21 16:15:07.540976	2016-02-21 16:15:07.540976	13	7	4
1803	7	Newcastle United	Manchester United	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:15:07.548337	2016-02-21 16:15:07.548337	13	35	4
1804	7	Notts County	Manchester United	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:15:07.555051	2016-02-21 16:15:07.555051	13	16	4
1805	7	Port Vale	Manchester United	0	0	2	5	\N	\N	\N	\N	2016-02-21 16:15:07.561427	2016-02-21 16:15:07.561427	13	31	4
1806	7	Rotherham Town	Manchester United	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:07.567572	2016-02-21 16:15:07.567572	13	36	4
1807	7	Walsall	Manchester United	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:15:07.575027	2016-02-21 16:15:07.575027	13	33	4
1808	7	Arsenal	Newcastle United	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:15:07.581914	2016-02-21 16:15:07.581914	13	3	35
1809	7	Burton Swifts	Newcastle United	0	0	5	3	\N	\N	\N	\N	2016-02-21 16:15:07.590194	2016-02-21 16:15:07.590194	13	26	35
1810	7	Burton Wanderers	Newcastle United	0	0	9	0	\N	\N	\N	\N	2016-02-21 16:15:07.601759	2016-02-21 16:15:07.601759	13	37	35
1811	7	Bury	Newcastle United	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:15:07.616026	2016-02-21 16:15:07.616026	13	38	35
1812	7	Crewe Alexandra	Newcastle United	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:07.62448	2016-02-21 16:15:07.62448	13	27	35
1813	7	Darwen	Newcastle United	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:15:07.631905	2016-02-21 16:15:07.631905	13	21	35
1814	7	Grimsby Town	Newcastle United	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:15:07.638686	2016-02-21 16:15:07.638686	13	28	35
1815	7	Leicester City	Newcastle United	0	0	4	4	\N	\N	\N	\N	2016-02-21 16:15:07.645478	2016-02-21 16:15:07.645478	13	2	35
1816	7	Lincoln City	Newcastle United	0	0	3	1	\N	\N	\N	\N	2016-02-21 16:15:07.652196	2016-02-21 16:15:07.652196	13	29	35
1817	7	Manchester City	Newcastle United	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:15:07.65871	2016-02-21 16:15:07.65871	13	7	35
1818	7	Manchester United	Newcastle United	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:15:07.665933	2016-02-21 16:15:07.665933	13	4	35
1819	7	Notts County	Newcastle United	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:07.673492	2016-02-21 16:15:07.673492	13	16	35
1820	7	Port Vale	Newcastle United	0	0	4	4	\N	\N	\N	\N	2016-02-21 16:15:07.681015	2016-02-21 16:15:07.681015	13	31	35
1821	7	Rotherham Town	Newcastle United	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:15:07.688712	2016-02-21 16:15:07.688712	13	36	35
1822	7	Walsall	Newcastle United	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:15:07.696684	2016-02-21 16:15:07.696684	13	33	35
1823	7	Arsenal	Notts County	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:07.704038	2016-02-21 16:15:07.704038	13	3	16
1824	7	Burton Swifts	Notts County	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:15:07.710888	2016-02-21 16:15:07.710888	13	26	16
1825	7	Burton Wanderers	Notts County	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:15:07.717464	2016-02-21 16:15:07.717464	13	37	16
1826	7	Bury	Notts County	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:07.72668	2016-02-21 16:15:07.72668	13	38	16
1827	7	Crewe Alexandra	Notts County	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:15:07.733599	2016-02-21 16:15:07.733599	13	27	16
1828	7	Darwen	Notts County	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:07.74032	2016-02-21 16:15:07.74032	13	21	16
1829	7	Grimsby Town	Notts County	0	0	0	1	\N	\N	\N	\N	2016-02-21 16:15:07.747719	2016-02-21 16:15:07.747719	13	28	16
1830	7	Leicester City	Notts County	0	0	5	1	\N	\N	\N	\N	2016-02-21 16:15:07.755048	2016-02-21 16:15:07.755048	13	2	16
1831	7	Lincoln City	Notts County	0	0	1	3	\N	\N	\N	\N	2016-02-21 16:15:07.764246	2016-02-21 16:15:07.764246	13	29	16
1832	7	Manchester City	Notts County	0	0	7	1	\N	\N	\N	\N	2016-02-21 16:15:07.771625	2016-02-21 16:15:07.771625	13	7	16
1833	7	Manchester United	Notts County	0	0	3	3	\N	\N	\N	\N	2016-02-21 16:15:07.778898	2016-02-21 16:15:07.778898	13	4	16
1834	7	Newcastle United	Notts County	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:15:07.789976	2016-02-21 16:15:07.789976	13	35	16
1835	7	Port Vale	Notts County	0	0	0	3	\N	\N	\N	\N	2016-02-21 16:15:07.80142	2016-02-21 16:15:07.80142	13	31	16
1836	7	Rotherham Town	Notts County	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:15:07.810459	2016-02-21 16:15:07.810459	13	36	16
1837	7	Walsall	Notts County	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:07.820209	2016-02-21 16:15:07.820209	13	33	16
1838	7	Arsenal	Port Vale	0	0	7	0	\N	\N	\N	\N	2016-02-21 16:15:07.827641	2016-02-21 16:15:07.827641	13	3	31
1839	7	Burton Swifts	Port Vale	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:15:07.834498	2016-02-21 16:15:07.834498	13	26	31
1840	7	Burton Wanderers	Port Vale	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:15:07.843478	2016-02-21 16:15:07.843478	13	37	31
1841	7	Bury	Port Vale	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:15:07.849949	2016-02-21 16:15:07.849949	13	38	31
1842	7	Crewe Alexandra	Port Vale	0	0	2	2	\N	\N	\N	\N	2016-02-21 16:15:07.856355	2016-02-21 16:15:07.856355	13	27	31
1843	7	Darwen	Port Vale	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:15:07.862819	2016-02-21 16:15:07.862819	13	21	31
1844	7	Grimsby Town	Port Vale	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:15:07.869247	2016-02-21 16:15:07.869247	13	28	31
1845	7	Leicester City	Port Vale	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:07.876227	2016-02-21 16:15:07.876227	13	2	31
1846	7	Lincoln City	Port Vale	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:15:07.883979	2016-02-21 16:15:07.883979	13	29	31
1847	7	Manchester City	Port Vale	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:15:07.891178	2016-02-21 16:15:07.891178	13	7	31
1848	7	Manchester United	Port Vale	0	0	3	0	\N	\N	\N	\N	2016-02-21 16:15:07.898053	2016-02-21 16:15:07.898053	13	4	31
1849	7	Newcastle United	Port Vale	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:15:07.90547	2016-02-21 16:15:07.90547	13	35	31
1850	7	Notts County	Port Vale	0	0	10	0	\N	\N	\N	\N	2016-02-21 16:15:07.912944	2016-02-21 16:15:07.912944	13	16	31
1851	7	Rotherham Town	Port Vale	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:07.920693	2016-02-21 16:15:07.920693	13	36	31
1852	7	Walsall	Port Vale	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:15:07.928079	2016-02-21 16:15:07.928079	13	33	31
1853	7	Arsenal	Rotherham Town	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:15:07.935099	2016-02-21 16:15:07.935099	13	3	36
1854	7	Burton Swifts	Rotherham Town	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:15:07.94136	2016-02-21 16:15:07.94136	13	26	36
1855	7	Burton Wanderers	Rotherham Town	0	0	4	0	\N	\N	\N	\N	2016-02-21 16:15:07.948895	2016-02-21 16:15:07.948895	13	37	36
1856	7	Bury	Rotherham Town	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:07.955609	2016-02-21 16:15:07.955609	13	38	36
1857	7	Crewe Alexandra	Rotherham Town	0	0	2	1	\N	\N	\N	\N	2016-02-21 16:15:07.961989	2016-02-21 16:15:07.961989	13	27	36
1858	7	Darwen	Rotherham Town	0	0	4	3	\N	\N	\N	\N	2016-02-21 16:15:07.969115	2016-02-21 16:15:07.969115	13	21	36
1859	7	Grimsby Town	Rotherham Town	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:15:07.976554	2016-02-21 16:15:07.976554	13	28	36
1860	7	Leicester City	Rotherham Town	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:15:07.984548	2016-02-21 16:15:07.984548	13	2	36
1861	7	Lincoln City	Rotherham Town	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:15:07.993442	2016-02-21 16:15:07.993442	13	29	36
1862	7	Manchester City	Rotherham Town	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:15:08.003726	2016-02-21 16:15:08.003726	13	7	36
1863	7	Manchester United	Rotherham Town	0	0	3	2	\N	\N	\N	\N	2016-02-21 16:15:08.01418	2016-02-21 16:15:08.01418	13	4	36
1864	7	Newcastle United	Rotherham Town	0	0	5	2	\N	\N	\N	\N	2016-02-21 16:15:08.02196	2016-02-21 16:15:08.02196	13	35	36
1865	7	Notts County	Rotherham Town	0	0	4	2	\N	\N	\N	\N	2016-02-21 16:15:08.031548	2016-02-21 16:15:08.031548	13	16	36
1866	7	Port Vale	Rotherham Town	0	0	1	1	\N	\N	\N	\N	2016-02-21 16:15:08.039123	2016-02-21 16:15:08.039123	13	31	36
1867	7	Walsall	Rotherham Town	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:15:08.046177	2016-02-21 16:15:08.046177	13	33	36
1868	7	Arsenal	Walsall	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:15:08.055703	2016-02-21 16:15:08.055703	13	3	33
1869	7	Burton Swifts	Walsall	0	0	1	2	\N	\N	\N	\N	2016-02-21 16:15:08.062492	2016-02-21 16:15:08.062492	13	26	33
1870	7	Burton Wanderers	Walsall	0	0	7	0	\N	\N	\N	\N	2016-02-21 16:15:08.06965	2016-02-21 16:15:08.06965	13	37	33
1871	7	Bury	Walsall	0	0	4	1	\N	\N	\N	\N	2016-02-21 16:15:08.078185	2016-02-21 16:15:08.078185	13	38	33
1872	7	Crewe Alexandra	Walsall	0	0	2	3	\N	\N	\N	\N	2016-02-21 16:15:08.085623	2016-02-21 16:15:08.085623	13	27	33
1873	7	Darwen	Walsall	0	0	2	0	\N	\N	\N	\N	2016-02-21 16:15:08.093136	2016-02-21 16:15:08.093136	13	21	33
1874	7	Grimsby Town	Walsall	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:15:08.100903	2016-02-21 16:15:08.100903	13	28	33
1875	7	Leicester City	Walsall	0	0	9	1	\N	\N	\N	\N	2016-02-21 16:15:08.10846	2016-02-21 16:15:08.10846	13	2	33
1876	7	Lincoln City	Walsall	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:15:08.115673	2016-02-21 16:15:08.115673	13	29	33
1877	7	Manchester City	Walsall	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:15:08.123163	2016-02-21 16:15:08.123163	13	7	33
1878	7	Manchester United	Walsall	0	0	9	0	\N	\N	\N	\N	2016-02-21 16:15:08.129738	2016-02-21 16:15:08.129738	13	4	33
1879	7	Newcastle United	Walsall	0	0	7	2	\N	\N	\N	\N	2016-02-21 16:15:08.136104	2016-02-21 16:15:08.136104	13	35	33
1880	7	Notts County	Walsall	0	0	5	0	\N	\N	\N	\N	2016-02-21 16:15:08.1422	2016-02-21 16:15:08.1422	13	16	33
1881	7	Port Vale	Walsall	0	0	1	0	\N	\N	\N	\N	2016-02-21 16:15:08.148375	2016-02-21 16:15:08.148375	13	31	33
1882	7	Rotherham Town	Walsall	0	0	6	1	\N	\N	\N	\N	2016-02-21 16:15:08.154899	2016-02-21 16:15:08.154899	13	36	33
1	1	MU	Chelsea	1	2	\N	\N	\N	\N	f	t	2016-02-03 01:36:53.207991	2016-02-22 13:30:39.695044	\N	\N	\N
\.


--
-- Name: matches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('matches_id_seq', 1882, true);


--
-- Data for Name: nutritions; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY nutritions (id, recipe_id, nutrition_name, nutrition_weight, created_at, updated_at) FROM stdin;
\.


--
-- Name: nutritions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('nutritions_id_seq', 1, true);


--
-- Data for Name: odd_money_lines; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY odd_money_lines (id, match_id, home_odd, away_odd, created_at, updated_at) FROM stdin;
\.


--
-- Name: odd_money_lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('odd_money_lines_id_seq', 1, false);


--
-- Data for Name: odd_spreads; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY odd_spreads (id, match_id, home_hdc, away_hdc, home_odd, away_odd, created_at, updated_at) FROM stdin;
\.


--
-- Name: odd_spreads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('odd_spreads_id_seq', 1, false);


--
-- Data for Name: odd_total_points; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY odd_total_points (id, match_id, over_hdc, under_hdc, over_odd, under_odd, created_at, updated_at) FROM stdin;
\.


--
-- Name: odd_total_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('odd_total_points_id_seq', 1, false);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY posts (id, name, slug, image, description, content, created_at, updated_at, home) FROM stdin;
5	qui ex similique ea libero	qui-ex-similique-ea-libero	8d0bd1c5-1df2-4117-84cb-fcf02fadda3f.jpg	<p>["Recusandae velit nam adipisci dolore dolor nostrum quae. Ut doloremque qui ea recusandae provident ut. Dolores laborum eaque enim id.", "Voluptatem consequuntur deleniti quis. Ipsum reiciendis omnis sed quia eos perspiciatis molestiae. Itaque animi in ratione at atque.", "Molestiae est rerum dolorem sit maiores repellendus eaque. Cupiditate quas fugiat cumque dolor consequatur a. Rerum similique aperiam. Ut numquam officiis possimus soluta libero quis."]</p>	<p>["Est sunt asperiores qui dicta. Enim inventore consequatur nobis sunt assumenda nesciunt. Recusandae omnis distinctio sint est officiis. Corrupti quibusdam excepturi sapiente dolor.", "Tenetur iste omnis placeat laudantium similique ut. Quis accusantium cum laborum et soluta quam sunt. Est sequi beatae et sed maxime. Excepturi quis dicta distinctio optio dolor hic. Tenetur autem beatae voluptatem.", "Hic praesentium eligendi alias modi vitae eos et. Non suscipit incidunt et ab quod similique aliquam. Totam libero quis adipisci voluptas sapiente quae."]</p>	2016-02-18 10:18:57.618037	2016-02-18 10:25:05.822409	\N
6	quisquam accusantium voluptatem nobis maxime	quisquam-accusantium-voluptatem-nobis-maxime	c215cc78-7859-4e4f-a11a-7b832cc1e989.jpg	<p>["Assumenda eos eligendi. Ducimus rerum rerum vel. Rerum facere perspiciatis ut optio. Consequatur iure hic nulla reiciendis quo. Beatae perspiciatis aliquam nihil ea vel.", "Commodi fugiat qui quia perferendis nesciunt. Maiores et deleniti sed omnis voluptatem fuga aut. Error necessitatibus ipsam est blanditiis illo non ut. Sint recusandae reprehenderit sit officiis nisi omnis harum. Quam adipisci temporibus inventore aut aspernatur.", "Aut ut quia sunt est quas aliquid voluptate. Omnis necessitatibus dolores eius impedit aperiam. Nostrum quaerat officiis iure aut facilis voluptas."]</p>	<p>["Quas velit consequuntur. Voluptatem quia aut consequatur non perspiciatis. Non et minus nihil in tenetur qui fugit. Veniam quidem velit ut. Temporibus iusto distinctio quia et animi.", "Magni quidem corporis sit. Occaecati a repellendus deserunt eligendi quo saepe. Rerum beatae et nulla laboriosam et. Vero velit dicta cupiditate rerum error minima ipsam.", "Est adipisci consequatur enim atque praesentium. Labore quia consequatur. Qui hic consectetur quo est rerum quae. Optio et voluptatibus pariatur error sunt aliquam. Incidunt sapiente voluptas."]</p>	2016-02-18 10:18:57.625652	2016-02-18 10:25:27.059344	\N
7	odit qui et laudantium pariatur	odit-qui-et-laudantium-pariatur	8fdb0bfd-5d69-4db5-aa56-1e6a69faf8f4.jpg	<p>["Qui ipsam aut. Excepturi quo aut id. Quos quia ipsa iusto libero cum nemo qui.", "Autem repellendus odio iure quis expedita architecto et. Nulla quis accusamus voluptate. Illo veniam ipsa ut debitis doloribus vel consequatur.", "Est repellat sequi. Accusamus animi expedita ipsum qui. Laborum perferendis et."]</p>	<p>["Magnam vel laborum voluptas officiis nostrum quia. Et eum aut ut. Minus sint facere.", "Quas distinctio laboriosam cupiditate. Quibusdam vero ut aut facere non ipsam. Aut et natus harum.", "Quod sunt quia. Ad dolorum dolor corporis. Amet eligendi et."]</p>	2016-02-18 10:18:57.631992	2016-02-18 10:25:43.188388	\N
2	iste in rerum minima ut	iste-in-rerum-minima-ut	b955eaed-d4de-4c96-9281-15e8a76787c7.jpg	<p>["Distinctio magnam explicabo et cum hic ducimus velit. Quisquam eum soluta aliquid laudantium officiis. Dolor et est id reiciendis. Eaque sint et.", "Omnis perferendis sint ea est. Error perferendis molestiae. Repellat accusamus voluptatem. Expedita quasi dicta occaecati dolores.", "Dicta rerum sapiente. Voluptate vel quasi quibusdam accusamus. Sit provident magnam rerum est. Voluptatem recusandae omnis id aut illum qui sunt. Et enim quod dolorum ipsum dolores."]</p>	<p>["Sunt alias facere ut. Id eum et qui ratione voluptatem soluta. Ullam consectetur et nemo suscipit veritatis.", "Non impedit quasi ducimus. Ducimus ad dolores illum eius sunt accusamus. Asperiores dolores alias consequatur eveniet excepturi. Possimus dolorum sunt.", "Atque eos voluptas. Voluptate qui voluptas sit alias. Error voluptatem ut modi est. Neque molestias totam odit."]</p>	2016-02-18 10:18:57.419863	2016-02-19 02:33:45.051961	t
4	necessitatibus fuga assumenda est aliquam	necessitatibus-fuga-assumenda-est-aliquam	90c79d12-91db-4f5c-85b7-4760e9c64793.jpg	<p>["Consequatur dolor magni earum veniam ut. Voluptate recusandae impedit dolor sit. Qui libero ipsa consequatur nostrum. Et doloremque sunt perferendis. Ab quos omnis occaecati ipsum incidunt sunt.", "Quia possimus quasi debitis. Provident necessitatibus voluptatem consequuntur fuga laboriosam error. Quis sit debitis aperiam quod.", "Ducimus est iusto quia quos quo. In iusto debitis. Qui consequatur voluptatem quidem rerum ut molestiae. Quia voluptas nihil quidem quo et et corporis. Quaerat quisquam rerum omnis asperiores aut."]</p>	<p>["Eius reiciendis vitae aut pariatur tempore. Sit qui dolorem vero saepe ut dolorum. Laborum dicta et velit corporis nobis. In voluptatem et iure aut quis dolorem. Consequatur aut et magni.", "Dicta pariatur ea. Quia est est ea quos voluptatem omnis officiis. Odio aut dolore. Et et et ipsum ea temporibus omnis.", "Velit repudiandae provident voluptas esse et. Nostrum nobis officiis dolorem aspernatur tenetur. Ipsa amet consequatur perferendis vitae. Mollitia et voluptatem illo deserunt nulla nemo aliquid. Ut sunt possimus voluptate aut a sit."]</p>	2016-02-18 10:18:57.604185	2016-02-19 02:34:11.091551	t
14	autem quia odio eius qui	autem-quia-odio-eius-qui	3127f198-6855-42b0-97af-bfe1c9cb4e5a.jpg	<p>["Cupiditate aut eos aperiam qui excepturi ipsum voluptatem. Nobis debitis sunt rem corrupti non. Ratione voluptas maiores nihil et.", "Rerum voluptatem debitis distinctio officiis expedita minima. Excepturi asperiores omnis architecto et et quia minima. Non enim modi ad.", "Nemo quidem et nihil. Impedit non quo molestiae quis ratione et. Fuga nihil culpa. Suscipit aspernatur pariatur praesentium perspiciatis. Inventore repellendus dolorem ducimus."]</p>	<p>["Deserunt est atque amet totam praesentium iste odio. In ad nesciunt. Illum dolorem ut.", "Sunt iste id non. Molestiae mollitia illo ullam. Mollitia illo culpa. Iure ullam laborum libero rerum culpa qui.", "Possimus eius autem cumque qui sed voluptatibus consequatur. Quo qui optio enim repellendus harum. Adipisci quam eos."]</p>	2016-02-18 10:18:57.679996	2016-02-19 09:36:56.869332	f
8	qui culpa earum exercitationem voluptatibus	qui-culpa-earum-exercitationem-voluptatibus	c67ad83a-37ed-44e6-98f8-bfe32d944514.jpg	<p>["Porro dolorum culpa. Minus itaque sequi deleniti recusandae adipisci debitis quo. Odio placeat nam eius dicta ea sunt inventore.", "Itaque sit illum. Voluptas suscipit ut velit asperiores. Quis consequatur delectus adipisci rem. Officiis optio quia doloribus eum. Cupiditate vero omnis velit asperiores nesciunt.", "Laborum nulla natus est vitae cupiditate voluptatem. Ut et at. Voluptates laborum reprehenderit. Perspiciatis quia delectus accusamus nisi."]</p>	<p>["Harum beatae odio dicta consequuntur accusamus ullam. Qui et iusto eos vel. Molestias mollitia incidunt nisi aliquid. Iure quia nihil. Odio temporibus nulla.", "Dolor assumenda culpa error sint et et. Veritatis quam sed ut eum. Aut optio perspiciatis molestias repellendus.", "Voluptas enim et rem nulla. Voluptatem voluptas debitis architecto aspernatur laborum nesciunt doloribus. Odit atque ut dolor at aspernatur hic. At asperiores facere cum."]</p>	2016-02-18 10:18:57.638733	2016-02-18 10:26:10.921637	\N
12	est aliquam qui pariatur optio	est-aliquam-qui-pariatur-optio	5e8bf48a-30cd-42f3-8cd1-2da96caac113.jpg	["Beatae qui ullam neque. Sed ut consequuntur. Est voluptatem tenetur voluptatem vitae.", "Sed suscipit dignissimos quod fuga. Quas id doloremque iusto sunt iure reiciendis aut. Eos aspernatur ut.", "Et culpa eum sunt qui sed distinctio vitae. Ut laborum excepturi voluptas et corrupti. Quis et corporis aperiam."]	["Repellat cupiditate quia laborum in recusandae. Expedita culpa sit quia. Adipisci ut expedita non.", "Magni veritatis cumque temporibus labore. Nulla aliquid accusamus in veniam. Voluptatem voluptas nulla distinctio fugit dolor non sequi. Et aut aut corporis magnam est qui.", "Vel quia velit. Vero porro sit animi aut. Nihil optio doloremque et vel. Occaecati est velit et ut. Consequuntur voluptas rerum aspernatur."]	2016-02-18 10:18:57.667746	2016-02-19 02:34:28.092029	t
10	repudiandae quibusdam voluptatem natus quo	repudiandae-quibusdam-voluptatem-natus-quo	35702516-549c-4623-b5de-02333760e81a.jpg	<p>["Ut suscipit sapiente neque voluptatum odio veritatis. Molestiae voluptas consequuntur laboriosam quas. Sint quisquam magnam voluptatem. Sint laboriosam voluptatibus alias libero molestias.", "Dolor velit soluta est voluptates. Maiores eum in animi molestias libero similique. Ab voluptatem nemo veritatis ratione accusantium sit eligendi.", "Amet dolores quasi quibusdam magnam illum. Et asperiores labore. Quam beatae rem minus voluptatem."]</p>	<p>["Soluta commodi repellendus rerum tempora libero. Quaerat corporis est alias. Ducimus qui ipsa cumque qui delectus. Corrupti eos tempora sit error esse commodi.", "Vero consequuntur provident magni officia sint porro. Et ullam nobis est fuga. Odit ducimus eaque. Qui vero minima quaerat qui aut eius. Et esse ad at.", "Magnam aspernatur ducimus. Eos eaque nihil commodi doloremque laboriosam iste dolorum. Laborum reiciendis excepturi occaecati ipsam. Harum itaque corporis similique sapiente error dignissimos. Nihil sint debitis harum nihil."]</p>	2016-02-18 10:18:57.654475	2016-02-19 09:36:07.021709	t
1	dignissimos et est et modi	dignissimos-et-est-et-modi	44b267df-f747-4aed-a119-803a46b658da.jpg	<p>["Aut aut vel reprehenderit aut molestiae. Doloremque nulla molestias quo consequatur itaque. Recusandae in dicta molestiae.", "Et veniam laudantium hic corrupti blanditiis. Nihil perspiciatis sit. Qui impedit magni non asperiores et id perspiciatis. Dolor odit quia iusto vel quos. Quos delectus quaerat vero non.", "Nobis ut ipsum autem. Iste omnis rem ea enim enim voluptas modi. Eaque quia id eveniet dolor minus. Ipsa veniam qui sit. Asperiores minima veniam temporibus neque ad."]</p>	<p>["Est sed sequi quia est ut similique. Molestias rerum mollitia adipisci unde repellendus tempora odit. Ab provident quam totam. Quisquam sunt consequatur ipsam animi pariatur accusamus cum.", "Maiores non est molestias et corrupti. Dolore fuga iste eum assumenda sit. Nihil esse est optio repellendus et cupiditate voluptas. Aliquid laborum dolor quis voluptate et quia. Aut voluptas occaecati sit.", "Quis voluptate ab totam eum cupiditate est. Nam tempora excepturi quia delectus quae aut est. Esse earum voluptatem qui quas architecto at. Et rerum sit nam."]</p>	2016-02-18 10:18:57.261345	2016-02-19 02:34:45.712644	t
16	alias voluptatem sit est nobis	alias-voluptatem-sit-est-nobis	86916c6b-75e9-41a2-b5a7-0e342e03c590.jpg	<p>["Corporis quisquam veritatis. Et magnam quo optio. Tenetur maiores fuga ullam qui id. Quo vero blanditiis labore. Alias libero quia ea veritatis aut.", "Vel sunt earum iure et quo. Qui in et rerum ipsa officiis consequatur ut. Id perferendis vel deleniti. Dolorum velit nostrum maxime distinctio at ab.", "Laudantium tempora ab. Nisi qui ut laborum. Velit dolore eaque totam atque sunt. Unde aperiam rerum doloribus tenetur voluptatibus."]</p>	<p>["Vel modi unde culpa et sed animi. Assumenda delectus enim molestiae provident pariatur natus nam. Quod placeat ullam vitae reiciendis. Fuga nihil ut nostrum dicta officiis. Minus voluptatibus laborum.", "Vel eveniet assumenda consequatur fugiat voluptatem. Alias rerum dignissimos ea sit sequi natus qui. Cum eum assumenda quia aliquid ut soluta temporibus.", "Qui maxime distinctio veniam velit. Fugiat aut est veniam. Officia atque voluptas numquam voluptatem. Voluptas est reprehenderit ipsum aliquam sed debitis."]</p>	2016-02-18 10:18:57.691488	2016-02-19 09:37:29.745981	f
18	aliquam ex a sunt iste	aliquam-ex-a-sunt-iste	a03bb205-ee55-49bf-a7cc-d7d69a898370.jpg	<p>["Harum at enim recusandae ut optio consequatur. Doloremque quis illo non et optio eveniet. Dolor minus aut dolorem consequatur dolor.", "Sed ullam unde eos velit laudantium ex quos. Officia quia eius. Eligendi quis voluptatem qui fuga error. Dolore sit dolor et pariatur iure excepturi maiores. Nulla architecto ut fugiat ipsa illo quibusdam.", "Iste omnis veritatis a porro molestias laborum consequatur. Voluptas aliquid totam occaecati. Quisquam ea suscipit quia id. Vitae id unde. Voluptatem fuga enim explicabo ut."]</p>	<p>["Ut itaque quis iusto voluptates in. Laudantium beatae vitae facere illum nulla sint vel. Hic vel sunt ut. Odit ut excepturi placeat et.", "Voluptatem cum beatae. Necessitatibus voluptas ipsam aliquid. Debitis exercitationem ad veniam laborum. Sequi enim ipsum magnam impedit cum laborum ducimus.", "Eos quidem consequatur quod dolore et. Et repellat sint ex perspiciatis id quaerat. Et dolorem aut. Temporibus aperiam reprehenderit rerum similique nesciunt odit velit."]</p>	2016-02-18 10:18:57.706835	2016-02-19 09:37:56.953943	f
17	numquam autem delectus quia ut	numquam-autem-delectus-quia-ut	07aab778-4155-4b79-8776-df05fb8807e7.jpg	<p>["Explicabo ut facere ut ipsam iusto officia. Et et doloribus porro est voluptatem harum doloremque. Et eum vitae excepturi totam.", "Aut ad voluptatibus similique. Aspernatur architecto qui expedita recusandae laudantium repudiandae. Quo cum ipsum. Explicabo doloremque corporis non ut cum.", "Aliquid voluptatem reprehenderit praesentium deserunt neque alias non. Non et quam voluptates architecto qui. Rem consequatur consequuntur ipsam odit iste."]</p>	<p>["Facilis nemo omnis sit dolorum. Fuga voluptatem numquam. At ab maiores enim nisi explicabo. Nulla nesciunt quidem.", "Quia consequatur ut occaecati. Eos dolores nobis. Sunt ullam quasi corporis atque nostrum consequatur. Non laborum consequuntur ratione. Dolor blanditiis dolorum odit aut.", "Ipsam non nostrum sed qui. Repudiandae placeat voluptates. Necessitatibus eius voluptas magnam."]</p>	2016-02-18 10:18:57.700152	2016-02-19 09:38:16.811275	f
19	voluptas necessitatibus veniam est perferendis	voluptas-necessitatibus-veniam-est-perferendis	b130dc8a-8495-495f-a159-9f2766c9ef41.jpg	<p>["Fugit praesentium occaecati nobis suscipit. Distinctio quo ipsum accusantium. Consequatur nostrum omnis provident numquam tenetur illo.", "Delectus mollitia et odio aut id. Similique voluptas eum nostrum. Vel fuga consequatur perspiciatis dicta ducimus. Dolorem commodi dicta.", "Ratione id harum dolore ducimus et. Tempore sed non sed odio sint. Corrupti veritatis corporis sapiente tempore non qui sed. Provident nostrum tempora."]</p>	<p>["Voluptas sed est et quia et nesciunt. Maxime tempore eligendi perferendis ea. Rerum commodi autem voluptas aliquam assumenda. Ut animi non perspiciatis est officiis id. Aliquid laudantium eum at velit voluptas repudiandae.", "Temporibus quo eaque. Perferendis quae et atque alias sit eligendi rem. Illum aspernatur assumenda id aliquam a explicabo. Sunt voluptatem velit nam dolores.", "Magnam quidem quia modi sit voluptas. Voluptates sapiente itaque omnis qui. Pariatur praesentium consectetur aliquid facilis rerum et."]</p>	2016-02-18 10:18:57.71313	2016-02-19 09:38:37.712833	f
20	sit aperiam error in voluptatem	sit-aperiam-error-in-voluptatem	05cef152-e1c6-4b15-854d-0b028772f221.jpg	<p>["Quia est eveniet. Dolores fugiat ut impedit voluptas animi occaecati et. Labore qui fuga et nulla. Culpa quia dignissimos nesciunt adipisci.", "Nisi eligendi harum quasi. Rerum aut iusto voluptatem illo consequatur. Voluptatem culpa amet est veniam. Et repudiandae officia omnis.", "Voluptas perspiciatis consequatur repudiandae quis. Et doloremque ea rerum amet error veniam beatae. Quas minus numquam eligendi. Facere sit doloribus laborum quisquam qui laboriosam. Et animi debitis neque similique."]</p>	<p>["Quo illo quia corrupti velit. Non voluptatum iusto sunt. Et cum rem vel nulla architecto voluptatibus cumque. Deserunt praesentium libero unde minus illo dolorem atque. Enim quo fugiat minus et ut.", "Neque modi qui corrupti dolor quo quia voluptatum. Impedit nihil modi pariatur. Et neque ducimus voluptatem iusto dolor cum nihil.", "Facilis eaque neque dolore autem aut fugit. Similique et libero magni cupiditate non maiores. Quidem est veniam."]</p>	2016-02-18 10:18:57.719162	2016-02-19 09:38:56.298032	f
13	velit non inventore quas voluptatem	velit-non-inventore-quas-voluptatem	8224bf1d-29f7-45d9-a331-9b217d76a828.jpg	<p>["Dolorem delectus minus dolorum sunt exercitationem tempora nihil. Corrupti consequatur ducimus. Qui ut quae quod porro ullam sit sit. Dolor soluta est deleniti alias optio. Laboriosam et quibusdam sit.", "Omnis commodi soluta sit dolores vitae optio. Labore voluptates fugiat beatae. Temporibus aut magnam est animi qui fugiat ut. Et ab atque numquam.", "Est saepe deserunt magni ipsum totam quia perferendis. Perferendis aperiam aut reiciendis. Et enim et voluptas qui. Voluptas sequi commodi qui porro iste. A repellat eos autem et dignissimos itaque."]</p>	<p>["Ullam deserunt aut amet eligendi. Nulla voluptatem molestiae. Odit dignissimos non voluptatibus quis illum. Quidem qui animi aut voluptatem. Aut perspiciatis sint sed vel sunt.", "Rem voluptas sed porro voluptatem aliquam. Dolorem dolorem blanditiis quis nihil praesentium est eius. Sed dicta ad.", "Aspernatur quas saepe mollitia nostrum ex. Quia harum fugit sed quidem. Voluptates sed doloribus molestiae earum et exercitationem et. Qui sunt tempore temporibus assumenda."]</p>	2016-02-18 10:18:57.673984	2016-02-18 10:22:50.569125	\N
3	ut non quo ut provident	ut-non-quo-ut-provident	c6d019ac-55c6-4114-bcac-c5c75980ad59.jpg	<p>["Est fugiat animi. Cum illo natus. Voluptatem harum rerum deleniti culpa quas neque consequatur.", "Non aut sed tempore in ab dolorem sit. Repudiandae veritatis enim dolorem quod. Et sed aut odit deleniti dolorum iste. Et modi excepturi velit.", "Voluptatum ex aut explicabo voluptas et sed fugit. Adipisci minima consectetur. Recusandae sit quas molestias."]</p>	<p>["Nesciunt provident eum. Minima occaecati ab nihil cumque voluptatem nihil optio. Eligendi explicabo excepturi. Dolorum quas ut autem voluptatum quos eius deserunt.", "Ipsum sed quo vitae officiis expedita sed. Minima nisi quos temporibus voluptas. Qui porro quia voluptate repudiandae aut molestias. Aut animi et sunt qui facere ullam id. Quisquam vitae enim autem illum accusantium dicta.", "Non nihil aut inventore. Deleniti cumque incidunt accusamus molestias rerum. Molestiae placeat voluptates ipsam."]</p>	2016-02-18 10:18:57.491341	2016-02-18 10:23:30.105312	\N
15	sed debitis nihil culpa aperiam	sed-debitis-nihil-culpa-aperiam	6857be8f-c9e1-44cc-ac0c-c3670f88c2e9.jpg	<p>["Natus ducimus dolores qui non voluptatibus. Eaque consequuntur earum in necessitatibus. Deleniti eum facere est id sed nisi. Fugit provident est et alias ipsa aut.", "Possimus et molestiae sint consectetur ratione. Voluptatem consequuntur ut inventore voluptatibus quia. Temporibus in voluptate nihil aliquid error saepe. Et optio culpa id. Mollitia nulla quaerat id.", "Quo quia consequatur corporis. Nemo et quisquam possimus libero veniam nulla est. Doloribus voluptatem quam veniam odit cupiditate quia. Maxime quo et et eius. Et autem vel id qui fugiat natus nihil."]</p>	<p>["Quae libero magni. Ipsum dignissimos ducimus qui voluptatem at beatae. Voluptatem nemo qui iure. Aut hic consequatur sit alias sit minus.", "Porro quia non quasi cupiditate voluptates. Omnis quia impedit quo. Sint suscipit nisi optio doloremque. Nihil rerum accusantium esse et tempora ipsa. Dolore sint eos.", "Quia temporibus et. Iusto nostrum eos minima. Distinctio tempora rerum saepe ea deserunt."]</p>	2016-02-18 10:18:57.685726	2016-02-18 10:24:35.845821	\N
9	quisquam corporis tempora rerum consequatur	quisquam-corporis-tempora-rerum-consequatur	8f3eec76-5f1b-4a41-b95e-b05f478c96ec.jpg	<p>["Aspernatur autem sapiente. Iste quo inventore atque enim optio iure. Officia rem quod assumenda distinctio tempora. Sed ut libero. Doloribus quam placeat sint dolores vel vitae pariatur.", "Velit totam id error hic fugiat quia consectetur. Animi assumenda facere repudiandae ad. Sed sunt quo quaerat reiciendis rerum aut. Dignissimos iste aut est eveniet. Doloremque et esse unde laudantium voluptate facere.", "Eaque vel facere aut eius temporibus qui quia. Aut accusantium vero facilis. Ipsam labore reiciendis veritatis consectetur nobis id."]</p>	<p>["Vero dignissimos corporis hic. Molestiae animi cumque ratione. Aut earum commodi architecto aspernatur molestiae fuga. Sint pariatur nihil.", "Non cumque aperiam laboriosam quas aut. Nesciunt et libero et. Autem velit consequatur modi.", "Eum ad magni non voluptatem ut ducimus. Ab et debitis ullam. Officiis ducimus modi magnam consequatur."]</p>	2016-02-18 10:18:57.645695	2016-02-18 10:26:28.631832	\N
11	omnis dolorum autem dolor natus	omnis-dolorum-autem-dolor-natus	5857dbff-a126-4638-a5c6-0745dff0dbcf.jpg	<p>["Laboriosam dolor nam adipisci ipsum est ad. Optio suscipit cum minus quis. Iusto aut nulla. Eos eos mollitia minima et eius qui amet.", "Sit vel voluptates voluptatem. Aliquid deserunt ut dolorum dolore ea enim. Recusandae et doloribus ad dolorem aut minus sit.", "Quas repellendus alias odio ducimus. Laboriosam et natus eaque mollitia sunt non enim. Ut in eum sed."]</p>	<p>["Odit iure facere officia sit vitae tempore ut. Architecto officia quidem fugiat. Esse molestias consequatur quo officiis consequuntur quae praesentium.", "Repellendus labore dolorem. Voluptatem reiciendis ratione impedit minima. Dolores veritatis enim. Modi ut accusamus consequatur distinctio nostrum quod.", "Vel vero ea impedit. Aliquam enim nihil qui porro. Esse ea debitis iste quam. Et aut necessitatibus accusantium molestiae qui. Blanditiis aut nobis eos quam rerum architecto."]</p>	2016-02-18 10:18:57.661162	2016-02-19 09:36:32.744777	f
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('posts_id_seq', 20, true);


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY recipes (id, name, summary, description, created_at, updated_at, chef_id, image, steps, cooking_time, level, featured, hot, cuisine_id) FROM stdin;
2	Melissa Daniel	Ut quia animi debitis consequatur culpa nulla rem laudantium.	<p>["Delectus debitis qui quia. Sed a consequatur aut ut est. Officiis eos et odio enim voluptatem temporibus. Veritatis nihil voluptas nihil consectetur quae eveniet.", "Sit dolore dolores odit eaque et. Fugiat in nostrum rerum alias voluptas et. Laborum id quae debitis.", "Accusamus in enim quia ipsum. Numquam fugit voluptate non aperiam commodi. Adipisci omnis earum et reiciendis."]</p>	2016-02-14 15:31:30.716547	2016-02-23 09:49:18.164387	4	290c4817-192a-4d45-a33e-e6eca7907913.jpg	<p>["Qui aut natus repellat quo. Ex adipisci et nam. Quos accusantium at ipsam est. Inventore quia et est quasi ut quos fugit. Neque ipsam rerum consequatur commodi.", "Alias distinctio debitis laudantium libero provident dolores. Voluptate a ut et. Inventore et occaecati libero. Id aliquam aperiam repellat.", "Tempora commodi occaecati eum. Eaque corrupti ea itaque distinctio eos. Consectetur rem ut nihil qui. Sit recusandae voluptas. Quo temporibus unde officiis cupiditate quaerat non."]</p>	dolor	dolorum	t	f	4
1	Beef Stew with Root Vegetables	Get this all-star, easy-to-follow Beef Stew with Root Vegetables recipe from Ree Drummond.	<p>Heat the oil and butter in a pan and brown the beef. Remove the beef from the pan, throw in the garlic and onions and cook until softened, about 3 minutes. Pour in the beer, beef broth, Worcestershire sauce, tomato paste, sugar, paprika, salt and some pepper. Then return the beef to the pan, cover and simmer on a low heat until the meat is very tender, 1 1/2 to 2 hours. If the liquid level gets too low, add more broth as needed.<br /><br />Add the carrots, parsnips and turnips and continue to simmer until the vegetables are tender and the liquid is reduced, about 30 minutes.<br /><br />If the stew is still too liquidy, remove a cup of cooking liquid from the pan and stir in the flour. Add the flour mixture back into the pan and stir. Simmer for 10 minutes until the stew is thick. The meat should be very tender; if it's tough, let it continue to cook.<br /><br />To finish, add the parsley and stir through the stew.</p>	2016-02-02 13:55:49.845727	2016-02-22 14:15:08.453206	1	ea0d0a66-ba8b-4467-9c65-62a8c9c12f85.jpg		2 hours	Easy	t	f	5
9	Florine Conroy	Dolores ab facere laudantium.	["Quia est repellat dolor eum quos. Dolor voluptatem officiis deleniti. Molestias et sit quibusdam rem voluptate eum. Aliquam eaque illo in. Soluta facere cum necessitatibus nam fugit.", "Eos voluptas beatae aspernatur et aut veniam. Quaerat quia rerum omnis. Aperiam recusandae illum. Rerum maxime consequuntur nemo sit. Modi necessitatibus nihil eum impedit consectetur commodi.", "Eum et est. Quos voluptas consequuntur sint delectus quis dolor. Expedita dignissimos vero quis. Culpa et alias ipsum vel. Iure labore doloremque ullam accusantium."]	2016-02-14 15:31:30.846312	2016-02-14 15:31:30.846312	15	\N	["Explicabo non eos ut sint similique. Error ut deleniti eum voluptas qui possimus. Ipsa occaecati similique nesciunt non at veritatis.", "Qui similique aperiam et quia illum velit aut. Rem sapiente rerum quo ut. Beatae et minus distinctio deserunt consequuntur accusamus non. Eum ratione doloremque enim provident est porro laudantium.", "Minus est illo odio fugit consectetur at. Voluptas ut praesentium. Nihil quod consequuntur soluta similique."]	unde	molestiae	\N	\N	\N
6	Mason Wyman	Nostrum vel vel esse suscipit soluta.	<p>["Voluptatem velit quis et blanditiis. Et qui necessitatibus magnam. Consequatur cum magnam labore beatae a consequatur.", "Velit ut exercitationem. Saepe ipsum ea id voluptas quae. Molestias maiores in. Est earum unde commodi voluptates. Et corrupti enim aut necessitatibus.", "Tenetur libero ut. Sunt neque tenetur sapiente non magni. Officiis qui soluta. Dolores aut aliquam sunt minus aspernatur tenetur inventore."]</p>	2016-02-14 15:31:30.810906	2016-02-18 10:42:21.893009	14	18951bbf-95e7-430d-8b1f-5175590feb6a.jpg	<p>["Mollitia impedit eveniet quidem ipsam eius. Et nulla eveniet qui aut. Deserunt ex hic ut dolorem nihil. Sequi non eius quasi magni minus.", "Laborum dolores aspernatur et. Placeat alias qui commodi autem nemo mollitia doloribus. Consectetur aperiam exercitationem dignissimos qui.", "Ullam non quibusdam vero. Eligendi voluptas aut. Vel consequatur et rerum id eos perferendis. Reiciendis natus modi perferendis animi et. Minima nobis distinctio explicabo quis."]</p>	numquam	enim	f	t	\N
7	Vida Nolan DVM	Iusto at sapiente enim suscipit qui nemo.	<p>["Velit eaque quis quos pariatur ut nostrum. Cupiditate accusantium rem architecto voluptatum eaque illo. Laudantium accusantium maiores deserunt. Repellendus dignissimos ducimus ipsa rerum dolores.", "Voluptas sit eligendi. Fugit sed ab repellendus est et consequatur voluptate. Libero omnis tempore velit. Ut nihil laudantium optio magnam perspiciatis enim quos.", "Magnam culpa eos inventore et. Impedit voluptas in aperiam et sint. Nemo blanditiis officia consequatur."]</p>	2016-02-14 15:31:30.82932	2016-02-18 10:48:38.508875	14	00d2aa14-8d50-44cc-88d5-4634d0e24258.jpg	<p>["Quia magni non sit tenetur. In dolore odit quod et dolor. Doloribus perferendis est cumque aut tempore.", "Sint aut tempore. Dignissimos dicta corporis possimus dolorem sunt. Et ut dolorem dolorum itaque pariatur consequatur dignissimos. Voluptatem earum beatae.", "Nemo sint distinctio quasi. Laudantium est fuga voluptatem facere id ea aperiam. Dicta sunt repellendus et et praesentium eum. Quae omnis sit similique commodi."]</p>	quos	magnam	f	t	\N
8	Nia Hirthe I	Quis incidunt autem et porro itaque.	<p>["Et est quod eum qui nihil libero. Eaque sint voluptatum voluptas in. Optio mollitia dignissimos.", "Fuga earum autem odit quia vero. Sit quis quo sint voluptates ex. Quos vitae dignissimos corporis.", "Accusamus quae soluta aspernatur. Consequatur et in non harum neque. Facere est accusamus unde repudiandae molestias."]</p>	2016-02-14 15:31:30.838194	2016-02-18 16:41:44.41586	15	87d362d6-3cbb-445a-824d-3ee11f99d595.jpg	<p>["Ullam aut natus quo voluptatem eius. Nobis ut nostrum officia. Odio iure dolores. Deserunt vero consequuntur fuga.", "Tempore tenetur delectus non. Sit deserunt omnis voluptatem praesentium eaque aut. Reprehenderit consequuntur minus cum odit. Molestiae corporis nihil.", "Laboriosam libero nisi quibusdam sunt qui nostrum. Dolores fugiat fuga. Debitis illo ad voluptatem qui consequatur. Veritatis nesciunt a quo nulla molestiae sit illum."]</p>	maiores	eligendi	f	t	\N
10	Paul Bins	Voluptas maiores repellat totam eum ex eveniet tempore ullam.	["Nihil culpa harum quis quis. Eos culpa eaque ipsa et incidunt. Qui quam consequuntur.", "Omnis suscipit asperiores alias id. Quaerat magni impedit. Quos quasi deleniti blanditiis quia quia expedita.", "Quis facere distinctio nihil. Molestiae accusamus autem eos quas nostrum modi sed. Nihil magnam labore veniam velit dicta provident et. Mollitia ipsum eveniet sit eius. Qui nostrum quasi fugiat facere aut voluptas."]	2016-02-14 15:31:30.856207	2016-02-14 15:31:30.856207	15	\N	["Iusto nihil necessitatibus non. Et amet molestiae voluptatem rerum. Provident sapiente labore. Omnis perspiciatis numquam ratione magni eum. Voluptatem laboriosam vel aliquid ut.", "Dicta tempora error provident voluptatibus et vitae quia. Laboriosam atque cum itaque nemo numquam quidem harum. Deleniti molestias animi aut repudiandae odio.", "Non iste maiores ut aperiam praesentium. Iusto molestiae deleniti hic possimus sit. Est hic aut autem voluptas. Omnis cupiditate corrupti sit sapiente et. Aliquam minus sint."]	qui	quo	\N	\N	\N
11	Rosella Pagac II	Omnis debitis voluptatem consectetur et consequatur non qui maxime.	["Delectus animi voluptas ipsam saepe pariatur. Perferendis rerum enim omnis. In recusandae at voluptate non. Dolore laborum id ut.", "Iure rem porro distinctio molestiae. Debitis tenetur reprehenderit vel nostrum quae. Ea aut maxime perspiciatis provident illo. Totam et qui sit.", "Beatae dicta illum nemo qui voluptates illo id. Vitae reiciendis cupiditate maxime magnam et. Voluptate non dolorum ipsam."]	2016-02-14 15:31:30.865677	2016-02-14 15:31:30.865677	13	\N	["Neque maiores porro tenetur rem dolore. Asperiores velit hic et consequatur quia aut. Sit quia asperiores consequuntur in et.", "Architecto unde sunt. Saepe quidem soluta molestiae facilis aut. Ut temporibus pariatur dignissimos sed tempora. Veniam occaecati blanditiis voluptatum dicta excepturi. Aut voluptas velit autem aliquid illo.", "Asperiores est deleniti omnis. Voluptatum sed ex debitis molestias. Itaque eligendi accusamus ipsam laboriosam. Nulla error quisquam omnis et nisi suscipit."]	impedit	dolores	\N	\N	\N
12	Talia Stroman	Dolor consequatur sed laboriosam accusamus reprehenderit velit aperiam officiis.	["Dolor aut itaque perferendis aut. Quia ab earum ut hic incidunt quibusdam. Non eaque perferendis. Modi quidem qui aliquam sed neque. Nihil qui incidunt repellat tempora.", "Harum ipsam deleniti impedit. Et quidem amet. Vel sint ipsum omnis alias accusantium et. Quae voluptas architecto et.", "Voluptatibus mollitia in eos inventore. Culpa veniam laboriosam molestiae consequatur. Architecto asperiores est optio eos dolorum nulla quibusdam. Quia voluptate sint placeat perspiciatis consequatur dolores."]	2016-02-14 15:31:30.8788	2016-02-14 15:31:30.8788	13	\N	["Repellat sed enim et. Quia officia qui corporis. Fugiat consequuntur excepturi libero veritatis aut. Accusantium minus dolores. In ut expedita fuga.", "Qui non delectus tenetur beatae. Nostrum enim laborum. Harum suscipit vel incidunt quaerat excepturi occaecati sit. Voluptatem ex sed excepturi sit ea nobis.", "Deserunt et expedita sapiente. Tempora commodi rem cupiditate. Aut ab beatae assumenda. Quod aut et quasi ullam aut."]	atque	officia	\N	\N	\N
13	Elva Gerlach IV	Rem quam consequuntur nemo doloremque eum veniam dolorum.	["Veritatis omnis quia dolores eligendi non dolorem eius. Dolores eum earum sint. Voluptas et vel.", "Maxime sed neque quidem voluptas. Qui nihil consequatur inventore recusandae. Rem aut at in nihil dolores nobis consectetur. Rerum natus qui. Cum maiores sit praesentium dicta magni iusto tempora.", "Unde non perspiciatis qui possimus ad sequi. Cupiditate voluptatem placeat qui sint incidunt. Sint sed quia praesentium. Eos voluptatem expedita cupiditate. Dolores optio id distinctio eaque quasi."]	2016-02-14 15:31:30.889157	2016-02-14 15:31:30.889157	13	\N	["Aut et sunt quia. Repudiandae magni quia. Deleniti explicabo magni et iusto vel minus ut. Quae dolor quam illum minima doloremque. Id qui enim fugiat.", "Repudiandae reprehenderit qui voluptatem in aut ipsam impedit. Repudiandae aut delectus illo. Tenetur animi laboriosam enim sapiente.", "Qui magnam quia error distinctio necessitatibus ipsam voluptas. Sunt exercitationem quisquam est aperiam incidunt veniam iste. Officia praesentium quia voluptate."]	at	reiciendis	\N	\N	\N
14	Bernice Champlin	Ipsa ad cupiditate et repudiandae commodi in illo.	["Consequuntur ut voluptatem illo provident et. Qui odit et et. Magnam saepe ut culpa est.", "Perferendis qui excepturi rem molestias consequatur non molestiae. Natus qui nisi. Id aut odio sit et. Amet expedita veritatis rerum ab velit nam.", "Debitis voluptatem mollitia et aut consequatur reprehenderit. Voluptatem nostrum non qui fugiat. Error laborum consequatur dolore inventore est numquam accusantium. Repellat illum est."]	2016-02-14 15:31:30.897511	2016-02-14 15:31:30.897511	2	\N	["Labore quis voluptatem vero nihil accusantium. Rerum maiores eos debitis porro et. Rerum ipsam quae rerum et est assumenda fugit.", "Ut ut et numquam non ad. Et odit quia. Sed aut quia. Qui totam consequatur dolorum possimus rerum iusto.", "Iste reiciendis delectus blanditiis necessitatibus ea corrupti repudiandae. Voluptas excepturi aliquid quod voluptas voluptas sit dignissimos. Aut quos nemo magnam non."]	atque	possimus	\N	\N	\N
15	Filiberto Mante IV	Exercitationem molestiae culpa qui dolor.	["Recusandae magnam culpa ullam cupiditate officiis. Ducimus iure consequatur dolor distinctio ut. Laboriosam minus dolorem consectetur aut cumque aut. Impedit aspernatur pariatur. Ut voluptas consequatur eius.", "Commodi rerum et asperiores quibusdam magnam magni culpa. Qui omnis et quos praesentium at in natus. Quibusdam at ipsa sed. Debitis tenetur consequatur dolorem nisi cupiditate quia distinctio. Omnis itaque sapiente in officiis laboriosam.", "Esse ad dolores incidunt ratione et. Laboriosam earum eaque ut maiores debitis culpa non. Sint magni sit. Ipsam quo maiores rerum ut excepturi aut voluptas. Eaque praesentium doloribus."]	2016-02-14 15:31:30.90868	2016-02-14 15:31:30.90868	2	\N	["Ut cumque et. Ipsum dolorem ut aut minus. Recusandae mollitia dolor est voluptatum molestias ullam qui. Tempora ipsum necessitatibus. Provident doloribus sapiente quia quia eum praesentium et.", "Consequuntur esse numquam officia quam eveniet quasi est. Ut a totam est aut beatae cum quis. Fuga iure suscipit qui accusamus. Fuga quod enim veritatis molestiae qui dolor.", "Exercitationem nulla esse quisquam. Suscipit ipsum sed voluptatem consequatur. Quo nisi amet dignissimos praesentium aut. Et expedita molestiae enim."]	illum	voluptatem	\N	\N	\N
16	Alexane Ratke	Aperiam fugit tenetur quia veritatis amet earum.	["Delectus doloribus eos odit dolorem quo veritatis cum. Maiores error et ut. Odit est fugiat in quo unde voluptatibus. Ut accusantium sit.", "Vel rerum et mollitia voluptatem. Deleniti iste id molestiae reprehenderit. Nihil aut voluptas fugit rerum optio explicabo. Nemo nisi omnis incidunt earum.", "Sequi cupiditate temporibus error. In tempore est in placeat cumque libero. Quo tempore eaque est voluptatem optio pariatur."]	2016-02-14 15:31:30.921421	2016-02-14 15:31:30.921421	2	\N	["Ipsa excepturi voluptas quas quia. Et ducimus occaecati dolor. Eligendi ab nulla eveniet nam voluptatem in officiis. Id sint iusto quo cumque a consequuntur sed. Vel voluptatem fugiat voluptas debitis voluptate et nesciunt.", "Voluptas beatae nisi in fugiat quo. Id optio sapiente facilis. Esse repellat voluptatibus. Exercitationem dolores dolorem.", "Accusantium reprehenderit nostrum asperiores. Rerum voluptatem officiis consequuntur reiciendis nihil. A eligendi earum quam et."]	est	voluptatem	\N	\N	\N
17	Miss Norval Mills	Tempora quasi corrupti odit ut quidem sint deleniti aliquam.	["Dolorum at repudiandae repellendus in et. Expedita totam magni praesentium et voluptates nisi. Veritatis qui voluptatibus impedit at vel. Rem velit consequatur eos doloremque est molestiae velit.", "Est quia voluptatem saepe veritatis et. Dolor molestias consectetur ab ipsum. Rem commodi sed repellat quas itaque deserunt ea.", "Odit quis sit rerum harum molestiae. Rerum incidunt architecto. Ab deleniti maiores. Vero accusamus enim explicabo. Fuga pariatur quisquam facilis repellat ut voluptatem."]	2016-02-14 15:31:30.936888	2016-02-14 15:31:30.936888	3	\N	["Ipsum corporis voluptatem aliquam sed dolores aut. Qui debitis culpa omnis eum nam dolore eveniet. Ipsam corporis culpa. Corrupti minima voluptas qui ipsum ex tenetur sed.", "Quia eligendi consequatur suscipit tenetur architecto. Occaecati et voluptatum et quo tenetur sit. Illum et velit ut qui sit et. Eos et quidem sit ut voluptate. Velit voluptatem dolores optio odit non maxime.", "Consectetur nihil molestiae labore. Ratione ad natus labore non. Dolor commodi molestiae. Et accusantium et et."]	consectetur	et	\N	\N	\N
18	Felipe Harber I	Odio ea est qui.	["Sit quam quibusdam voluptas qui ratione. Perspiciatis eum enim. Voluptatem non reiciendis dolorem qui sit. Eum ut iste. Cupiditate sit neque eius beatae tempore error.", "Et voluptatem dolorem consequatur. Natus possimus dignissimos. Consequatur aut cum.", "Dicta quibusdam nam vitae corrupti natus sunt exercitationem. Similique qui voluptatem incidunt laborum delectus distinctio. Eos quia repudiandae laborum."]	2016-02-14 15:31:30.951005	2016-02-14 15:31:30.951005	3	\N	["Dolorum ipsam aliquam optio accusantium ut dolores aut. Reiciendis dolore fugiat expedita. Praesentium eos perferendis eos et earum ut. Doloremque culpa quisquam asperiores quidem consequuntur id.", "Qui nisi dolorem voluptatem quis. Aperiam non ex ut quidem in. Beatae veritatis et. Similique labore amet asperiores incidunt ipsa aut. Voluptate nesciunt consequuntur.", "Natus voluptatem dolorem sed saepe placeat laudantium aspernatur. Et in vel consectetur labore. Assumenda perferendis qui voluptatem vitae non."]	sit	non	\N	\N	\N
19	Jamir Pouros	Quasi quo voluptas molestiae sit ea.	["Dolore suscipit nulla et nemo qui tempora provident. Nihil vel ut quae non laborum exercitationem. Quod esse eligendi consectetur.", "Excepturi non at vero qui sit. Debitis voluptas occaecati mollitia quisquam. Qui eos qui quod et tempore quia quas. Dolorem praesentium reprehenderit quae fugiat cupiditate hic quibusdam. Quia expedita iusto.", "Voluptates et nisi aut possimus numquam impedit ut. Qui eaque minus dolorem modi quas voluptatum. Quasi magnam eum. Accusamus vel quia dolorem rerum iusto voluptas sit."]	2016-02-14 15:31:30.962104	2016-02-14 15:31:30.962104	3	\N	["Voluptas id accusamus recusandae molestiae velit rerum officia. Cupiditate et odit. Consequatur et voluptatem distinctio magni. Unde pariatur non quod modi assumenda dolor.", "Non tenetur sit. Dolore debitis pariatur quis ea qui ipsam. Id rerum similique eos rerum saepe nesciunt ut. Aspernatur voluptatibus debitis explicabo rerum ut quis a.", "Ut voluptatem rem a labore temporibus et. Blanditiis molestiae corporis. Reiciendis consequatur deserunt qui recusandae. Consequatur doloremque molestiae."]	ducimus	deserunt	\N	\N	\N
20	Eleonore Von MD	Earum et voluptate et.	["Ea facere quidem. Et tempore quia totam voluptas enim. Nobis quos quam ut quod numquam. Vel voluptatem consequatur corrupti voluptatem dolor.", "Maxime sed recusandae praesentium repellat quo dignissimos. Illum excepturi soluta dolor distinctio porro totam. Cupiditate culpa expedita. Dolorem rerum facere.", "Est praesentium aut. Ducimus molestias sed qui quam necessitatibus quasi. Voluptatibus qui et animi expedita temporibus dolorem dignissimos. Cupiditate eveniet quaerat necessitatibus sit nobis dolorem expedita. Magni doloribus blanditiis voluptas voluptates."]	2016-02-14 15:31:30.975803	2016-02-14 15:31:30.975803	5	\N	["Culpa consequuntur aliquam esse aut est. Doloribus modi quis dolores dolorem ut quia. Eum eum est. Iste eos nulla cupiditate non. Ea ut sed ut.", "Aliquid neque ut illo iste. Impedit delectus ad. Eum non qui eos ut harum vel. Hic exercitationem quia. Ipsa culpa earum qui iure.", "Est numquam est alias omnis et. Et ipsa ad id eveniet qui expedita adipisci. Et consequuntur fugit suscipit inventore nobis reprehenderit. Qui et dolorem amet doloremque. Dolores dolor totam odio voluptates."]	et	sed	\N	\N	\N
21	Sibyl Block	Vel cupiditate et vel dolores pariatur qui itaque vitae.	["Corporis quidem accusantium minus. Repellendus illum necessitatibus voluptas rerum. Harum et dolorum atque expedita dolor. Culpa repudiandae commodi minus accusamus voluptas. Repudiandae tempore animi dolores inventore.", "Laboriosam eum autem sed aut dolorum amet. Nostrum sed inventore. Voluptate facilis dolorem. Et omnis dolores.", "Dolores consectetur iure exercitationem. Rerum ad eum omnis doloremque mollitia quae. Minus aut sint accusamus. Doloremque aliquam sint quia. Vel tempora reprehenderit asperiores."]	2016-02-14 15:31:30.993098	2016-02-14 15:31:30.993098	5	\N	["Quis adipisci rerum facilis incidunt ullam iste et. Nostrum sed fugiat ut aperiam hic est. Nulla occaecati quia voluptatem. Praesentium omnis quos sapiente non sed consectetur.", "Voluptatem dolorem quia dolorum totam. Numquam quia quae officiis. Soluta expedita autem delectus sint. Aut aut facere. Voluptatem saepe aut.", "Placeat ad voluptas ex accusamus. Quas quia laborum voluptatem aspernatur rerum. Voluptatem eaque iure. Ipsam quisquam sed suscipit doloremque qui eos. Ad est tenetur natus."]	ducimus	consequuntur	\N	\N	\N
22	Karlee Weissnat	Ut amet ut eveniet doloribus aut.	["Est incidunt sed quibusdam. Asperiores error suscipit. Labore voluptatem autem eum. Voluptas exercitationem aliquid.", "Ex qui molestiae placeat. Delectus dolorum in sed. Suscipit qui aliquam id quia debitis labore est. Doloremque distinctio nobis dolorum. Aspernatur qui iste.", "Reiciendis veniam id aliquid consequuntur. Exercitationem ratione nesciunt inventore nisi. Ipsa dolor autem id distinctio occaecati vel sed."]	2016-02-14 15:31:31.006827	2016-02-14 15:31:31.006827	5	\N	["Impedit neque vel. Consequuntur id voluptate voluptatem. Rem qui ut molestias est earum. Cumque voluptas eos impedit nisi praesentium. Nihil minima aut labore voluptate veritatis voluptates sit.", "Fuga similique magni distinctio et. Voluptatem molestiae repellendus ea iste rerum enim. Ex doloribus sed. Illum distinctio dolore et. Explicabo voluptas odit veniam esse.", "Consectetur voluptatem voluptates. Molestiae quis aliquam aut a rerum et eveniet. Quia cumque rerum est eius voluptatem ut consequuntur. Nam sapiente id. Veniam dolorum debitis aliquid rerum tenetur sint doloribus."]	facere	aperiam	\N	\N	\N
23	Myrna Mayer	Et necessitatibus illo porro quae nesciunt.	["Vero voluptatem debitis enim eum. Rerum enim doloremque cupiditate consectetur quisquam vero. Labore suscipit esse aut nesciunt odio aut vitae. Impedit iusto facere alias placeat enim earum. Reprehenderit veritatis animi libero qui quam sit aut.", "Facere magnam optio placeat velit. Sed sunt qui. Aut quae reprehenderit quaerat provident sint rem optio. Quia fuga velit soluta a. Suscipit est voluptate fuga dolores debitis rem.", "Accusantium omnis commodi voluptatem. Ut aut minima sint voluptatem non iusto vero. Libero error necessitatibus quia recusandae non."]	2016-02-14 15:31:31.02066	2016-02-14 15:31:31.02066	6	\N	["Cupiditate quasi ea et error aperiam consequatur. Consequatur dolorem iure adipisci accusantium non doloremque. Vel dolores qui eaque ad.", "Voluptas consequatur nesciunt sint porro. Sunt libero nulla. Amet ea autem tenetur voluptate itaque ipsum distinctio.", "Et consectetur molestias non et sunt saepe perspiciatis. Voluptate excepturi saepe sed ipsam sit exercitationem. Quas nostrum incidunt. Atque at nam voluptatem quaerat et quae asperiores. Odio consectetur voluptatem dolores repellat eum."]	culpa	consequuntur	\N	\N	\N
29	Reed Monahan	Quibusdam nostrum ut rerum eum.	["Est non animi. Et et omnis dignissimos. Impedit fuga esse. Facilis ut sunt est est sit pariatur. Et officia earum ex cupiditate beatae pariatur excepturi.", "Consectetur tempora minima eveniet architecto at reiciendis accusamus. In corrupti sint. Possimus voluptatem porro.", "Et quibusdam voluptas quod. Voluptas consectetur nemo est alias quo ex. Ullam ex repellendus. Delectus sed occaecati sunt cum molestiae est. Dignissimos officia tempora atque aut et occaecati expedita."]	2016-02-14 15:31:31.116981	2016-02-14 15:31:31.116981	9	\N	["Est nam enim. Est nihil eum ab iusto laudantium sit maiores. Ut impedit voluptate natus enim reiciendis. Sequi qui incidunt ab ipsam.", "Ex esse qui et fuga. Rerum ex est. Soluta quo rerum cumque et.", "Est sunt ut. Aliquam est repellat et. Et temporibus veniam accusamus et autem adipisci."]	officia	repudiandae	\N	\N	\N
24	Deron Sipes	Aut non aut quaerat unde voluptatibus.	["Consectetur iusto repellat. Omnis sunt magnam qui sit totam perferendis accusantium. Iure facilis quaerat porro sed. Et voluptate voluptatibus voluptatem facilis quas rerum aut.", "Numquam magnam et soluta pariatur. Maiores dolor et ad consequuntur sed quo natus. Officia qui quia aut eos ut quo fugiat.", "Unde ut libero nostrum sint reiciendis. Accusantium dolor voluptas. In officia culpa. Ut corrupti optio."]	2016-02-14 15:31:31.046956	2016-02-14 15:31:31.046956	6	\N	["Sit odio molestias voluptatibus. Quidem non sit nemo consequatur tenetur mollitia. Perferendis neque et. Magnam quibusdam assumenda et rerum.", "Tempora id doloremque non atque architecto. Voluptatem repudiandae illum perferendis et. Tempore odit quaerat debitis.", "Dolores quo ut corrupti autem. Itaque nihil aperiam accusantium nobis. Nam quia aliquid soluta explicabo quos."]	doloribus	sint	\N	\N	\N
25	Loren Toy PhD	Enim necessitatibus et molestias.	["Animi praesentium blanditiis. Iure distinctio ducimus. Error alias excepturi qui mollitia qui. Debitis hic numquam sed provident et.", "Labore iste iure non enim facere et amet. Omnis tenetur quia sequi quis. Doloribus possimus quo et quo consequuntur.", "Culpa est at ipsum. Perspiciatis qui aut illum voluptas aut quia temporibus. Voluptas et est voluptate et recusandae. Dolorem sit quod sed provident aspernatur."]	2016-02-14 15:31:31.057832	2016-02-14 15:31:31.057832	6	\N	["Nulla facilis quos ratione. Est itaque ut qui non sed rerum dolor. Quia repellat sit autem provident et eaque iure. Distinctio deleniti est omnis in aut.", "Vel modi sed aut. Autem ipsam reprehenderit enim perspiciatis labore ut. Rerum unde sed. Eos et asperiores molestias praesentium eos.", "Eos consequatur voluptas excepturi praesentium nihil consequuntur. Officiis et ut est tempore ducimus ab dolorem. Dolores facilis voluptatum quis et tenetur perferendis tempore. Vel quam quisquam molestias."]	sapiente	nostrum	\N	\N	\N
26	Jorge Eichmann	Soluta perspiciatis tempore iure corrupti.	["Aut rerum ex deserunt consectetur corrupti. Modi est error odio. Laborum aut architecto quae. At eaque quas ut aspernatur esse nisi unde.", "Sit qui voluptatum occaecati quis nulla quia. Eum nihil sit ducimus non aperiam dolorum. Id dolores voluptatem explicabo est repellat similique. Sit quae et.", "Consequuntur dolor animi. Debitis reiciendis dolorem voluptatem similique voluptatibus atque. Nemo deleniti eos. Illum sint magnam ut."]	2016-02-14 15:31:31.081062	2016-02-14 15:31:31.081062	8	\N	["Laboriosam consequatur voluptas quam et ex vel placeat. Tempora voluptas qui et quisquam perferendis perspiciatis est. Temporibus velit dolore deleniti enim aut. Maxime similique nihil omnis deserunt laudantium.", "Unde rerum quas dolore aliquid blanditiis veniam porro. Expedita ut libero hic. Ducimus debitis nisi maxime.", "Quia ipsa voluptas quam aliquam numquam eos. Id dolor inventore ipsum et. Et quia dolor minima pariatur quasi autem."]	autem	optio	\N	\N	\N
27	Dixie Lueilwitz	Ad soluta molestias sed atque adipisci sequi et.	["Corrupti sed provident necessitatibus beatae nihil sed qui. Totam sed ex consectetur nostrum esse vitae. Ratione dolorem non.", "Blanditiis facilis iusto voluptatibus et. Aut necessitatibus dolorem deleniti quasi quis minus. Maiores expedita numquam.", "Dolor nulla non. Odio placeat tempora et commodi iste voluptas. Asperiores atque a perferendis natus. Dolorem voluptas ex saepe eveniet sed sint."]	2016-02-14 15:31:31.094413	2016-02-14 15:31:31.094413	8	\N	["Iure dolor neque quas et iusto. Rerum itaque ducimus dignissimos pariatur vel. Sed distinctio ad. Ut non dignissimos eaque est. Inventore debitis dicta aliquid ad voluptatem vero.", "Facere iste quidem similique id repellat. Doloremque voluptatem veniam corrupti ratione vel. Quo fugit rem adipisci magnam deleniti id. Nesciunt eum ut dolorem ab consequuntur vel ea.", "Enim temporibus dignissimos eius omnis. Velit et et est. Minima modi sed qui eos consequatur. Ipsum qui rerum velit. Fugit ea et corrupti."]	quis	dolor	\N	\N	\N
28	Mrs. Alvina Greenfelder	Est odio quasi autem unde dolores.	["Assumenda molestias omnis voluptas sint. Repudiandae id qui autem cum consequuntur veritatis. Incidunt quod aut hic quia. Vel odio culpa non veniam.", "Maiores explicabo nisi. Voluptates qui ipsum rerum error quia. Consequatur harum autem.", "Perferendis molestiae repellendus sunt omnis deserunt quo. Maxime eos facere debitis aut. Recusandae iste commodi fugiat quis explicabo at. Et sint officia atque saepe sed totam cumque. Dolorem cumque delectus et."]	2016-02-14 15:31:31.106091	2016-02-14 15:31:31.106091	8	\N	["Repudiandae et illo. Expedita eaque cupiditate distinctio minima id. Tempora iusto ipsa aliquam. Est doloremque consequuntur perferendis dolorum aut enim. Error quod qui optio et hic.", "Sint et vero non ducimus praesentium consequatur. Nisi doloribus et. Et nulla dolores cum et ut iure. Aliquam aperiam aut similique reprehenderit.", "Adipisci itaque accusamus qui tenetur. Expedita fugit repellat error perferendis repellendus aliquam nulla. Officiis labore itaque velit vero."]	modi	esse	\N	\N	\N
30	Sonia Gusikowski DDS	Et cupiditate commodi similique.	["Consequatur quia aut dolorem quia tempora aperiam in. Explicabo sit voluptas dolores. Earum id esse.", "Debitis dicta a voluptatem deleniti. Quis ea et. Dolore et reprehenderit consequuntur enim. Non molestiae perferendis eum distinctio consequatur ex.", "In animi veritatis esse. Consequatur quam iusto quia debitis magnam. Quod ullam soluta at sed. Mollitia reprehenderit et atque iste ad totam."]	2016-02-14 15:31:31.126681	2016-02-14 15:31:31.126681	9	\N	["Provident iusto rerum dicta vel consectetur. Id modi similique voluptatum iure totam qui quos. Error modi ad deserunt aspernatur ut qui et. Officia similique aut debitis.", "Nihil maiores dolores qui porro assumenda enim eveniet. Et a dolorum. Et maxime quia. Aliquid culpa voluptatem minima quia natus ex labore. Praesentium magni voluptatem sit in corporis.", "Reprehenderit accusamus similique qui hic animi. Excepturi accusantium omnis dolor quia quam rerum ut. Officiis fuga quam doloribus inventore quia natus dolor."]	distinctio	sint	\N	\N	\N
31	Kale Runolfsson	Excepturi eaque fuga molestiae reprehenderit provident.	["Ut labore et consequatur corrupti facere qui. Pariatur optio ea dolor voluptas debitis sed ullam. Voluptatibus recusandae similique cum. Voluptatum et amet excepturi eligendi sint totam rerum.", "Corporis assumenda minima. Repellendus ipsam qui odio expedita sunt dignissimos. Vel doloremque a distinctio qui dolorum ipsa reprehenderit. Esse nihil molestias recusandae voluptas.", "Eum perspiciatis animi amet corrupti eveniet est aspernatur. Doloremque esse enim deleniti quam rem et. Deleniti iste dicta laborum. Natus esse est voluptatem inventore dolor facilis autem. Voluptas quis odio autem quae qui."]	2016-02-14 15:31:31.145233	2016-02-14 15:31:31.145233	9	\N	["Neque illum saepe facilis omnis accusantium modi. Labore hic doloribus aut non quia. Sed est cupiditate dolor quod aut. Sint dolorum sit sed natus. Nostrum alias cumque et.", "Corporis optio est numquam perferendis. Hic voluptatum et dolor omnis. Nobis expedita ratione debitis quam.", "Non qui omnis debitis. Vitae non iste. Ut voluptatem quaerat."]	perferendis	velit	\N	\N	\N
32	Roxanne Mayert	Ratione corrupti hic natus.	["Nemo distinctio sed non. Debitis enim sint nulla necessitatibus dolores. Non magnam vel velit perspiciatis quia quo labore. Perspiciatis vero commodi similique iure quo sit accusamus.", "Eos neque illo sit porro a aut. Praesentium vitae hic enim id non. Quibusdam sapiente consequuntur et. Deserunt nihil maxime quia ut a.", "Dolorem voluptatem sunt eos enim tempora rerum. Consequatur reiciendis eum. Consequatur est voluptas fuga temporibus. Consectetur architecto id quia illo molestias."]	2016-02-14 15:31:31.159296	2016-02-14 15:31:31.159296	10	\N	["Dolores saepe ipsam aut architecto. Mollitia similique consectetur doloremque rerum debitis. Earum minima et qui.", "Soluta debitis quam esse quo qui vero expedita. Harum pariatur deleniti doloribus. Iure delectus doloremque dignissimos et accusantium veritatis minima.", "Velit magnam culpa sunt porro sed. Provident numquam nostrum cum rerum ut. Beatae omnis id."]	tempora	vitae	\N	\N	\N
33	Ariane Bergnaum III	Fuga ipsam ut recusandae dolor sed qui esse.	["Ducimus sed ut nostrum aperiam. Aspernatur inventore aliquam nesciunt vel asperiores. Itaque minus velit repellendus qui ex tempora. Est libero explicabo sit rerum. Et quia iusto reiciendis quod eaque.", "Laudantium dolorem ut quod voluptatem. Iste odit quaerat. Minus est perferendis natus et maiores odit rerum.", "Consequatur dolor dolorem soluta repellat architecto ullam aut. Corrupti ut ipsam ducimus. Officia explicabo saepe voluptate et libero voluptatem non."]	2016-02-14 15:31:31.171877	2016-02-14 15:31:31.171877	10	\N	["Debitis exercitationem perspiciatis. Et vel consequatur reprehenderit doloribus. Autem possimus laudantium delectus ut voluptatum.", "Quo laudantium est alias molestiae eveniet. Hic voluptatem vitae quia omnis. Est doloribus illo. Dolores vel mollitia velit sit aut beatae. Eaque cumque quaerat quibusdam dolorem officiis.", "Est dolor excepturi unde sit. Voluptas suscipit nostrum qui voluptatem. Atque soluta officiis et beatae quis. Ratione voluptatem eos consequatur nihil et voluptatum corporis. Soluta nam modi sunt voluptates rerum magni."]	mollitia	aut	\N	\N	\N
34	Destin Windler I	Blanditiis fugit omnis in incidunt.	["Et magnam consectetur inventore. Beatae est et ut porro alias sit. Et error saepe consequatur ut et veniam quod. Distinctio dolorum dolores quidem perferendis cum qui. Ullam et quia.", "Commodi expedita quas laudantium maxime minus voluptate. Maiores accusamus nostrum amet libero qui. Provident sed iure possimus quos mollitia vel.", "Est qui velit assumenda dolorum magni. Reiciendis eaque et facilis. Possimus asperiores assumenda explicabo ab."]	2016-02-14 15:31:31.182772	2016-02-14 15:31:31.182772	10	\N	["Hic sit sequi nobis ex rerum provident. Eius quaerat provident expedita magnam repudiandae. Et ut provident et veritatis.", "Laudantium aut ex et a. Culpa ducimus nihil animi. Tempora non sed praesentium eum corporis. Qui beatae numquam officia non.", "Ut sit voluptate qui facilis deserunt dolores. Quos natus voluptas autem. Porro mollitia velit dolorem aut odio repellendus fugit."]	eos	culpa	\N	\N	\N
35	Maci McCullough	Dolorem repudiandae voluptatum esse.	["Veniam dolorum sequi dolore et doloribus. Harum autem omnis quia quasi non aliquam quae. Id alias laborum non. Quos quasi dolor voluptas repellat.", "Illum et quaerat expedita rerum totam modi. Est amet unde veritatis consequatur recusandae repellat sed. Non non porro.", "Quisquam impedit adipisci provident possimus et. Ea eos quos eius laudantium et sequi. Sed dignissimos commodi voluptatem quam perferendis repudiandae. At dolores sunt atque eum. Et error quam ut accusamus ullam reprehenderit."]	2016-02-14 15:31:31.19739	2016-02-14 15:31:31.19739	11	\N	["Quia unde qui amet nulla inventore aut doloremque. Quasi nihil enim amet aut iste tenetur. Et eos quod. Ipsum deleniti qui facilis.", "Voluptate error sit officia laudantium quis esse. Magni odit quis velit aut consequatur. Sit voluptates magni aut voluptatem voluptas non eum.", "Aut qui non impedit at molestias illum. Voluptatem natus ab non adipisci. Et earum in et qui repellendus. Recusandae hic sunt iure deserunt."]	veritatis	ex	\N	\N	\N
36	Herminio Jenkins	Porro adipisci vel totam rerum.	["Sed optio aut esse omnis similique at ut. Excepturi vel laudantium dignissimos ad nisi. Ea quo ut harum dolorem est ex. Dolorum aspernatur placeat qui sit minus nihil et.", "Ipsum molestiae nobis quia. Corrupti quo quidem voluptatibus impedit. Possimus tempora natus consequatur quod qui placeat rerum.", "Iste quasi in aperiam beatae non. Rem aut eum enim ut consectetur non. Minima saepe est aliquam atque."]	2016-02-14 15:31:31.218705	2016-02-14 15:31:31.218705	11	\N	["Cupiditate nulla molestiae voluptas. Amet et ipsum ullam iusto. Voluptatibus adipisci eum tempora pariatur quidem ut commodi.", "Molestias voluptatum consequuntur earum illo corrupti. Amet officia est. Ea at ratione minus distinctio quos omnis. Laborum cupiditate ut voluptatem alias explicabo quidem.", "Dignissimos reiciendis sit fugiat ex autem. Quae rerum laborum deleniti voluptatem odio iure. Molestiae ut qui dolorum hic est aliquid neque."]	ex	excepturi	\N	\N	\N
37	Verlie Kuhic	Tenetur ratione corrupti cupiditate fugiat inventore et.	["Harum officia et inventore doloribus. Similique enim totam possimus. Consectetur earum quod voluptatum accusantium.", "Dolore rem perspiciatis minus ipsa. Provident temporibus voluptatem voluptatem illum. Et eveniet laudantium est repellat. Saepe qui et commodi dolorem perferendis ratione labore.", "Reprehenderit illo amet provident rem earum voluptas nulla. Quis aperiam consequatur quia consequuntur dolores. Voluptas rerum esse."]	2016-02-14 15:31:31.228904	2016-02-14 15:31:31.228904	11	\N	["Eligendi ut fugiat temporibus est officia. Repellendus deleniti officia. Qui perspiciatis ut laudantium tenetur. Error vero neque. Ipsum reprehenderit pariatur sunt facere perferendis minima qui.", "Veniam maiores et nam nihil dicta fuga. Magni id quam vel voluptates officia molestiae consequuntur. Amet veniam pariatur. Quos id recusandae. Est blanditiis est voluptatem id consequatur qui sequi.", "Distinctio sit non aliquam quia. Magni voluptates quaerat. Et molestiae sed doloribus fugit voluptatem. Animi sed sunt possimus impedit magnam modi repellendus."]	tempora	sed	\N	\N	\N
38	Valentin Will	Molestiae sunt itaque ea facere.	["Earum nemo ut saepe cupiditate voluptas assumenda aliquid. Delectus commodi qui molestiae consectetur. Quia et asperiores fugit et cum laudantium expedita.", "Nesciunt distinctio nihil voluptatem ad aliquid corrupti culpa. Modi omnis error dignissimos provident officiis est. Possimus a et ex omnis aperiam. Ipsum iure architecto quia nostrum cupiditate eos.", "Voluptatem quod in ut. Aliquid quos reiciendis consequatur rerum sed cumque. Ex nisi aut illum qui aut. Qui eius animi ut rerum inventore illo. Sapiente quidem est quaerat rerum fugit accusantium et."]	2016-02-14 15:31:31.238427	2016-02-14 15:31:31.238427	12	\N	["Ex aliquid aliquam sit est et quod. Sed non illo reiciendis iusto accusantium et error. Odio sunt suscipit in. Deleniti velit sit vel et id.", "Alias nihil repudiandae rerum. Perspiciatis nesciunt qui suscipit quisquam autem consequatur. Optio quasi dolorem. Iste eos nulla non eum provident non quas.", "Possimus culpa tempore minus. Quisquam recusandae quibusdam. Et quis excepturi ut aliquid sunt."]	eos	ut	\N	\N	\N
39	Maggie Renner	Aut dolorem laudantium doloribus.	["Laudantium voluptas qui. Dolores aliquid rerum magnam sint. Soluta accusantium aliquam explicabo nobis.", "Quo quisquam et dignissimos doloribus atque. Officiis unde sunt quidem. Explicabo optio ipsum neque unde itaque. Facilis aut esse expedita. Enim voluptas optio.", "Sequi et sapiente recusandae temporibus eius ad. Reprehenderit molestiae officiis architecto inventore autem error laboriosam. Velit et odio qui veritatis mollitia architecto."]	2016-02-14 15:31:31.253277	2016-02-14 15:31:31.253277	12	\N	["Qui nemo vitae molestiae veniam cumque fugit. Tenetur minus odio dolor adipisci. Est molestiae et id mollitia. Iste modi eos. Tempore eos ut porro.", "Voluptas est vitae cupiditate aut modi sed. Veniam qui sapiente explicabo culpa est magnam. Qui ipsam nemo ut aut ea. Dolorem incidunt optio asperiores. Aliquid dolor quis atque quisquam vitae.", "Doloremque nulla omnis ut placeat sint quo totam. A voluptatem est architecto libero vero aliquid error. Saepe iusto fuga deleniti aperiam. Nihil blanditiis quisquam qui repudiandae qui deserunt. Beatae unde impedit."]	dolorum	ut	\N	\N	\N
40	Benton Moore	Nulla officiis autem sint illo quidem.	["Facere eveniet quasi tempore. Voluptatem dolores cupiditate necessitatibus et esse. Voluptatem quo quaerat. Laborum autem harum accusantium et iste dolor blanditiis.", "Quae totam temporibus corrupti in. Voluptas iure necessitatibus autem et in earum quibusdam. Id voluptates ipsum quis.", "Explicabo corrupti rerum eos. Sunt velit quaerat quia voluptatem. Qui doloremque officiis sit deserunt. Nihil aliquam id molestiae ut non. Ut perspiciatis aut."]	2016-02-14 15:31:31.270761	2016-02-14 15:31:31.270761	12	\N	["Architecto minus velit quas vel est eaque veritatis. Pariatur et doloremque impedit laborum in. Labore et assumenda delectus facilis quos repellendus.", "Velit et sed nesciunt harum. Dicta ab architecto velit. Soluta natus consequatur ut laudantium. Hic commodi in. Sunt rerum ut.", "Ex perspiciatis temporibus incidunt est. Dolorum rerum recusandae consectetur. Omnis suscipit id."]	ut	id	\N	\N	\N
41	Ms. Justen Langosh	Cum ut eos quas autem eum.	["Eaque rem optio dolor aliquid est veritatis. Sunt nostrum nobis. Qui excepturi et ut quas. Non et nisi repudiandae rerum. Sapiente illum voluptatem consequatur et.", "Aspernatur dignissimos laborum. Soluta fugiat quam magni ea. Voluptatem est modi consequatur itaque qui. Ab ratione aut earum voluptas aut ipsum et.", "Iure nobis dolorem vitae facere dolorum. Illo eaque quas aliquam nisi mollitia quidem. Voluptatem ratione sit modi. Molestias perferendis repudiandae ullam labore aut veritatis est."]	2016-02-14 15:31:31.284069	2016-02-14 15:31:31.284069	7	\N	["Voluptatem aspernatur suscipit est et culpa. Ab qui saepe id. Voluptatem est ullam id iure. Necessitatibus id vitae quasi maxime ea at ad.", "Veritatis sit et et autem adipisci ratione doloremque. Est est et. In est vel ea voluptatem impedit et pariatur. Soluta facilis magnam ea rerum voluptate mollitia.", "Omnis non ut eos ea et. Libero temporibus natus quia. Est doloribus id nemo rerum. Adipisci ut vero."]	est	neque	\N	\N	\N
42	Brent Okuneva	Harum est adipisci et vero asperiores et repellendus ipsam.	["Nulla vel est officia repudiandae voluptates quos. Est enim sequi blanditiis eos. Exercitationem maiores quod.", "Quam non nam voluptates ratione. Et quia atque aut cupiditate et. Eaque non omnis quas et. Quia vero iure ad explicabo non.", "Assumenda error ipsa quis. Error libero iure nihil et. Hic omnis quibusdam. Aut sunt veniam omnis distinctio commodi sed. Asperiores vel sunt nam est ea consequatur velit."]	2016-02-14 15:31:31.298932	2016-02-14 15:31:31.298932	7	\N	["Ipsa alias quis. Laborum sit beatae ea doloribus quia nihil. Quaerat repudiandae consequatur exercitationem ab in iusto labore. Nihil aut omnis at voluptas delectus ab.", "Voluptas similique sint minima incidunt repellendus ea. Est nobis soluta architecto similique eveniet ut. Facere fugit neque excepturi dolores. Ipsa et numquam et non. Accusantium fugiat est est adipisci.", "Architecto ea non similique neque. Ut quos autem quasi illo eligendi nostrum. Aut accusantium nesciunt. Cumque dolores et. Qui eum et et amet qui iure ut."]	eveniet	neque	\N	\N	\N
43	Vena Maggio	Minima delectus molestiae cum vel voluptates quos.	["Deserunt optio tenetur quos porro quasi nihil aut. Autem eos sit ipsum ut doloribus. Consequuntur maxime labore est illo possimus soluta. Ut facilis qui aperiam et illo qui minus.", "Veritatis ipsa voluptas incidunt facilis iste. Blanditiis nam est dolorem saepe. Ab quibusdam deleniti voluptatum iure eveniet. Voluptates vel dolores et. Cumque vitae porro aliquid accusantium ullam.", "Quia maxime reiciendis deleniti eius rem. Adipisci et molestiae enim voluptatem. Quo dicta ipsam aut consequatur quae quod. In quaerat cum magnam aut odit eaque ut."]	2016-02-14 15:31:31.310623	2016-02-14 15:31:31.310623	7	\N	["Ducimus vel et voluptates ipsa voluptate dolorum. Culpa illo quo autem ut nesciunt. Beatae dicta itaque dolor omnis facere. Recusandae totam odio.", "Quas omnis eos provident. Amet et accusantium excepturi omnis officia. Officiis autem vel error fuga.", "Velit pariatur ad totam incidunt fugit ab voluptate. Ad error repellendus et nesciunt beatae distinctio. Cupiditate voluptas eveniet animi sed. Iusto nobis dolor itaque. Rerum praesentium doloremque."]	voluptatem	ut	\N	\N	\N
44	Daphne Rowe	Inventore dolor ipsam veritatis quia reiciendis.	["Repudiandae doloremque itaque mollitia dolorem et rerum est. Non odio dolor debitis. Voluptatem libero adipisci voluptates distinctio.", "Sunt mollitia quidem beatae id. Officia quos dolores voluptatum. Est ab animi ipsa eligendi ipsum aut vel. Tempora fuga atque et quam. Dolor explicabo reprehenderit repudiandae qui enim ea.", "Atque enim dolor mollitia nam voluptatem nesciunt ut. Ea enim aut omnis ipsam ut. Qui distinctio officiis. Laboriosam eum excepturi eos architecto earum. Est at aut vero eaque accusantium sed."]	2016-02-14 15:31:31.330073	2016-02-14 15:31:31.330073	1	\N	["Nulla earum numquam provident adipisci voluptatem. Maxime vel temporibus cupiditate. Est pariatur quaerat.", "Doloribus quia quaerat explicabo nam dolores rem. Dolores neque perferendis quis corporis ipsum. Minus expedita quia ipsa magnam. Ea molestiae aspernatur voluptatibus cupiditate. Repudiandae maxime qui labore.", "Ab recusandae excepturi magnam expedita nihil iste et. Minima alias eveniet ab voluptatibus. Consequatur consectetur nemo error vitae non aliquam ullam. Incidunt molestias nihil dignissimos assumenda in."]	explicabo	nemo	\N	\N	\N
45	Elinore Hermiston	Voluptas unde voluptates consequuntur.	["In ratione non vero minima odio velit. Qui harum sit in et. Corrupti occaecati sed dolorem. Ad quia laborum nihil eius molestiae rerum. Non quis eos dignissimos in voluptatum.", "Voluptatem dolor nulla vero. Dolorem harum atque natus. Quis aspernatur aut. Enim esse placeat. Tempora dolorem ab aut.", "Unde aut ratione voluptatibus. Impedit rem dolor eius laudantium. Dicta illo magnam qui laborum eligendi ea."]	2016-02-14 15:31:31.359903	2016-02-14 15:31:31.359903	1	\N	["Natus officiis eum. Reiciendis sint ut voluptatibus facere. Est nulla asperiores laborum expedita sit.", "Occaecati aliquid voluptatum consequatur totam quae esse et. Laudantium pariatur quia fuga odit. Placeat sint ipsum vel. Cupiditate saepe sit in. Eius assumenda autem eveniet nihil nihil eos est.", "Totam repellat saepe harum et tenetur. Voluptas dolorem accusantium. Autem minima ut eos culpa qui hic dolorum. Et aut cum explicabo dolore nobis sapiente dolores."]	non	deserunt	\N	\N	\N
46	Hazel Jacobi	Earum perspiciatis et impedit fugiat veniam sed.	["Facilis ab sunt debitis vel pariatur. Molestiae quidem provident saepe mollitia expedita doloribus. Expedita blanditiis est reprehenderit ut quia. Quia id occaecati corporis autem voluptate.", "Culpa eum a natus. Aut sit quis quos fugiat. Iure enim veniam quia in et voluptatem aut. Ut fuga aliquam voluptatibus vel quaerat. Dolore recusandae fugiat repellendus quisquam soluta quia.", "Error quaerat odio. Saepe quas nemo. In ullam est vel aspernatur itaque rem labore."]	2016-02-14 15:31:31.375111	2016-02-14 15:31:31.375111	1	\N	["Expedita delectus sapiente esse aut omnis impedit amet. Eum omnis consequatur. Deserunt nihil dolore est harum eligendi sunt. Magnam quisquam maiores. Molestiae repudiandae eaque voluptatem unde natus corrupti est.", "Eos quod vero fugit dolore sed nemo voluptatem. Libero optio quia. Tenetur in quaerat est maxime rerum.", "Est blanditiis velit delectus. Quo et culpa qui illum. Maiores magnam itaque sit enim voluptas qui. Laboriosam nesciunt vel rem eligendi odit ut quidem."]	tempora	voluptas	\N	\N	\N
3	Josue Treutel	Mollitia architecto voluptas deleniti dolores quia.	<p>["Pariatur est quis. Debitis labore et tempora. Dolores at id labore non dolorem. Explicabo iste ut repellat cumque illo rem sed.", "Ut nisi omnis facilis laudantium. Quas soluta cumque. Aspernatur excepturi et ea esse.", "Perspiciatis cum voluptatem occaecati pariatur iure earum. A sequi est et eius. Qui est error eveniet."]</p>	2016-02-14 15:31:30.765658	2016-02-18 10:33:50.913344	4	b1cd0767-dd57-40d8-9c80-817daa541828.jpg	<p>["Voluptates voluptatem officia. Molestiae perferendis explicabo eum excepturi facere facilis ea. Praesentium pariatur quos quia. Voluptate quia voluptas.", "Qui veritatis fugiat asperiores quia quam. Expedita aliquam et corporis explicabo blanditiis optio. Est corporis nihil. Laudantium voluptas autem ea excepturi numquam.", "Et ratione doloribus occaecati quia nostrum unde. Iusto laboriosam ut omnis nesciunt quae ut autem. Quos magni ut ipsam."]</p>	a	veniam	f	t	\N
5	Jaycee Ledner	Ut vitae repudiandae quaerat aut quo.	<p>["Qui ea asperiores in ullam illum beatae. Fugiat tenetur eveniet voluptas. Atque id ullam aliquam dolorum. Atque et neque non est eos modi cupiditate. Sed iste saepe nam optio.", "Hic saepe odit unde ducimus maxime. Qui autem animi dolores. Qui enim dolor sunt fugit omnis.", "Qui saepe facilis qui. Aut consequuntur quis aliquam dignissimos quia. Quia voluptatem voluptatum eligendi perferendis odit laboriosam molestiae. Provident aperiam nostrum error. Neque alias placeat maiores occaecati sequi qui aut."]</p>	2016-02-14 15:31:30.793797	2016-02-18 16:42:36.974302	14	54fc3425-60ed-4fc1-a279-361019b5e9d9.jpg	<p>["Ipsa sit molestiae sit quibusdam. Distinctio natus nihil qui. Ipsa quas porro iusto incidunt et. Eos eius aspernatur accusantium illo molestiae debitis aut.", "In fugiat nam neque. Qui repellat quae. Et nemo architecto ipsum. Dolorem non quas sit nostrum saepe. Est facere eos occaecati.", "Qui officia distinctio dolores ipsa quia. Excepturi aliquam odit. Quas amet soluta voluptas est fugiat quasi. Eveniet sint dolor. A ut provident aut."]</p>	in	et	f	t	\N
4	Rosendo Rath Sr.	Eum tempore facere reiciendis sapiente et natus et expedita.	<p>["Possimus voluptas nostrum nesciunt vitae impedit debitis harum. Sint non architecto dicta hic a. Voluptas consequatur perferendis voluptatum molestias iusto deserunt odio.", "Ut aut sed. Consequatur et consequatur. Ullam mollitia alias sapiente.", "Ut voluptatem nulla ut nam qui doloribus rerum. Nemo autem omnis. Ea quis laborum. Et id a nulla cupiditate eaque. Mollitia rem suscipit id."]</p>	2016-02-14 15:31:30.779714	2016-02-22 12:14:10.894765	4	7a9b1634-3762-4b68-bd90-ca5cf7370d06.jpg	<p>["Ex maxime molestiae pariatur qui et. Quidem exercitationem nihil. Enim cupiditate quia.", "Suscipit molestiae deserunt nam. Fuga consectetur assumenda nihil. Ea eos quis voluptas eos quae soluta.", "Est neque quasi ipsum dolor praesentium aut illo. Quia doloremque et sapiente tempora magni sed rerum. Nihil maxime rerum."]</p>	qui	est	f	t	5
\.


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('recipes_id_seq', 46, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY schema_migrations (version) FROM stdin;
20151213145844
20151213150217
20151213150701
20151213151946
20151213152130
20151213152259
20151213152654
20151213152935
20151214054056
20151215150129
20151215152326
20151216161737
20160110111417
20160111141800
20160112124036
20160112154620
20160117150609
20160118012307
20160118020639
20160118021547
20160204035511
20160210053704
20160210145100
20160210151912
20160211043031
20160211074505
20160211075406
20160211142107
20160213091551
20160215094515
20160215111045
20160216140155
20160218044625
20160218050701
20160218141513
20160219022009
20160219024612
20160219150057
20160220103444
20160220104402
20160220104841
20160221151737
20160221152318
20160222121049
20160222140928
20160223100806
\.


--
-- Data for Name: seasons; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY seasons (id, name, slug, created_at, updated_at) FROM stdin;
1	2010-2011	2010-2011	2016-02-15 13:30:49.176859	2016-02-15 13:30:49.176859
2	2011-2012	2011-2012	2016-02-15 13:30:59.925429	2016-02-15 13:30:59.925429
3	2012-2013	2012-2013	2016-02-15 13:31:12.320451	2016-02-15 13:31:12.320451
4	2013-2014	2013-2014	2016-02-15 13:31:25.540976	2016-02-15 13:31:25.540976
5	2014-2015	2014-2015	2016-02-15 13:32:24.139124	2016-02-15 13:32:24.139124
7	1888-89	1888-89	2016-02-21 15:02:49.108281	2016-02-21 15:02:49.108281
8	1889-90	1889-90	2016-02-21 15:36:20.40786	2016-02-21 15:36:20.40786
9	1890-91	1890-91	2016-02-21 15:55:49.724202	2016-02-21 15:55:49.724202
10	1891-92	1891-92	2016-02-21 16:00:34.202805	2016-02-21 16:00:34.202805
11	1892-93	1892-93	2016-02-21 16:03:07.130168	2016-02-21 16:03:07.130168
12	1893-94	1893-94	2016-02-21 16:09:45.21476	2016-02-21 16:09:45.21476
13	1894-95	1894-95	2016-02-21 16:14:23.03376	2016-02-21 16:14:23.03376
\.


--
-- Name: seasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('seasons_id_seq', 13, true);


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY settings (id, name, value, created_at, updated_at) FROM stdin;
1	facebook	http://facebook.com	2016-02-19 15:18:10.422842	2016-02-19 15:18:10.422842
2	twitter	http://twitter.com	2016-02-19 15:18:34.945762	2016-02-19 15:18:34.945762
3	gplus	http://gplus.com	2016-02-19 15:18:49.206021	2016-02-19 15:18:49.206021
4	linkedin	http://linkedin.com	2016-02-19 15:19:36.902363	2016-02-19 15:19:36.902363
5	youtube	http://youtube.com	2016-02-19 15:19:53.770797	2016-02-19 15:19:53.770797
6	flickr	http://flickr.com	2016-02-19 15:20:30.3598	2016-02-19 15:20:30.3598
7	description	Welcome to cookcook.com!	2016-02-19 15:21:25.677275	2016-02-19 15:21:25.677275
\.


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('settings_id_seq', 7, true);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY tags (id, name, slug, ancestry, created_at, updated_at) FROM stdin;
8	et quia	et-quia	\N	2016-02-14 16:53:29.350933	2016-02-14 16:53:29.350933
9	cumque molestiae	cumque-molestiae	\N	2016-02-14 16:53:29.384513	2016-02-14 16:53:29.384513
10	in numquam	in-numquam	\N	2016-02-14 16:53:29.38945	2016-02-14 16:53:29.38945
11	qui qui	qui-qui	\N	2016-02-14 16:53:29.393841	2016-02-14 16:53:29.393841
12	non tenetur	non-tenetur	\N	2016-02-14 16:53:29.399948	2016-02-14 16:53:29.399948
13	sunt explicabo	sunt-explicabo	\N	2016-02-14 16:53:29.407409	2016-02-14 16:53:29.407409
14	sapiente dolor	sapiente-dolor	\N	2016-02-14 16:53:29.412053	2016-02-14 16:53:29.412053
15	accusantium tempore	accusantium-tempore	\N	2016-02-14 16:53:29.416321	2016-02-14 16:53:29.416321
16	est ullam	est-ullam	\N	2016-02-14 16:53:29.420831	2016-02-14 16:53:29.420831
17	aliquam quo	aliquam-quo	\N	2016-02-14 16:53:29.425292	2016-02-14 16:53:29.425292
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('tags_id_seq', 18, true);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY teams (id, name, image, description, total_matches, total_points, created_at, updated_at, league_id) FROM stdin;
1	Juventus	juventus.jpg	<p>B&agrave; đầm gi&agrave; th&agrave;nh Turin</p>	0	0	2016-02-03 11:46:37.647075	2016-02-03 11:46:37.647075	2
2	Leicester City	leicester.jpg		0	0	2016-02-03 11:47:15.775872	2016-02-03 11:47:15.775872	1
3	Arsenal	\N		\N	\N	2016-02-16 19:03:45.941709	2016-02-16 19:03:45.941709	\N
4	Manchester United	\N		\N	\N	2016-02-16 19:03:59.062745	2016-02-16 19:03:59.062745	\N
5	Chelsea	\N		\N	\N	2016-02-16 19:04:09.386898	2016-02-16 19:04:09.386898	\N
6	Sunderland	\N		\N	\N	2016-02-16 19:04:18.763313	2016-02-16 19:04:18.763313	\N
7	Manchester City	\N		\N	\N	2016-02-16 19:04:37.01887	2016-02-16 19:04:37.01887	\N
8	Liverpool	\N		\N	\N	2016-02-16 19:04:46.456416	2016-02-16 19:04:46.456416	\N
9	Aston Villa	\N	\N	\N	\N	2016-02-21 15:32:30.591659	2016-02-21 15:32:30.591659	\N
10	Accrington F.C.	\N	\N	\N	\N	2016-02-21 15:32:30.611178	2016-02-21 15:32:30.611178	\N
11	Blackburn Rovers	\N	\N	\N	\N	2016-02-21 15:33:57.661733	2016-02-21 15:33:57.661733	\N
12	Bolton Wanderers	\N	\N	\N	\N	2016-02-21 15:33:57.685905	2016-02-21 15:33:57.685905	\N
13	Burnley	\N	\N	\N	\N	2016-02-21 15:33:57.699906	2016-02-21 15:33:57.699906	\N
14	Derby County	\N	\N	\N	\N	2016-02-21 15:33:57.712211	2016-02-21 15:33:57.712211	\N
15	Everton	\N	\N	\N	\N	2016-02-21 15:33:57.724945	2016-02-21 15:33:57.724945	\N
16	Notts County	\N	\N	\N	\N	2016-02-21 15:33:57.737186	2016-02-21 15:33:57.737186	\N
17	Preston North End	\N	\N	\N	\N	2016-02-21 15:33:57.750196	2016-02-21 15:33:57.750196	\N
18	Stoke City	\N	\N	\N	\N	2016-02-21 15:33:57.764926	2016-02-21 15:33:57.764926	\N
19	West Bromwich Albion	\N	\N	\N	\N	2016-02-21 15:33:57.776478	2016-02-21 15:33:57.776478	\N
20	Wolverhampton Wanderers	\N	\N	\N	\N	2016-02-21 15:33:57.789166	2016-02-21 15:33:57.789166	\N
21	Darwen	\N	\N	\N	\N	2016-02-21 16:00:34.352155	2016-02-21 16:00:34.352155	\N
22	Nottingham Forest	\N	\N	\N	\N	2016-02-21 16:03:07.307088	2016-02-21 16:03:07.307088	\N
23	Sheffield Wednesday	\N	\N	\N	\N	2016-02-21 16:03:07.338519	2016-02-21 16:03:07.338519	\N
24	Birmingham City	\N	\N	\N	\N	2016-02-21 16:05:27.715599	2016-02-21 16:05:27.715599	\N
25	Bootle	\N	\N	\N	\N	2016-02-21 16:05:27.791973	2016-02-21 16:05:27.791973	\N
26	Burton Swifts	\N	\N	\N	\N	2016-02-21 16:05:27.804989	2016-02-21 16:05:27.804989	\N
27	Crewe Alexandra	\N	\N	\N	\N	2016-02-21 16:05:27.816832	2016-02-21 16:05:27.816832	\N
28	Grimsby Town	\N	\N	\N	\N	2016-02-21 16:05:27.835826	2016-02-21 16:05:27.835826	\N
29	Lincoln City	\N	\N	\N	\N	2016-02-21 16:05:27.848987	2016-02-21 16:05:27.848987	\N
30	Northwich Victoria	\N	\N	\N	\N	2016-02-21 16:05:27.861338	2016-02-21 16:05:27.861338	\N
31	Port Vale	\N	\N	\N	\N	2016-02-21 16:05:27.872611	2016-02-21 16:05:27.872611	\N
32	Sheffield United	\N	\N	\N	\N	2016-02-21 16:05:27.886416	2016-02-21 16:05:27.886416	\N
33	Walsall	\N	\N	\N	\N	2016-02-21 16:05:27.903699	2016-02-21 16:05:27.903699	\N
34	Middlesbrough Ironopolis	\N	\N	\N	\N	2016-02-21 16:10:17.422113	2016-02-21 16:10:17.422113	\N
35	Newcastle United	\N	\N	\N	\N	2016-02-21 16:10:17.437809	2016-02-21 16:10:17.437809	\N
36	Rotherham Town	\N	\N	\N	\N	2016-02-21 16:10:17.484437	2016-02-21 16:10:17.484437	\N
37	Burton Wanderers	\N	\N	\N	\N	2016-02-21 16:15:05.756866	2016-02-21 16:15:05.756866	\N
38	Bury	\N	\N	\N	\N	2016-02-21 16:15:05.779596	2016-02-21 16:15:05.779596	\N
\.


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('teams_id_seq', 38, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, username, first_name, last_name, role) FROM stdin;
3	bestphpcoder@gmail.com	$2a$10$qddp2xXNFNrcbkP9FR2d1ehFBlURvGFxojdW9rnLf.i9XWdpmVB5y	\N	\N	\N	3	2016-02-14 07:23:23.935716	2016-02-13 10:14:41.423851	115.77.192.45	115.77.192.45	2016-02-13 09:14:28.075029	2016-02-14 07:23:23.938223	bestphpcoder	Best	PHP Coder	mod
1	nguyenanhngoc.do@gmail.com	$2a$10$eUCqkGztCs5zv6gANTGonuYPki3eAVZm9g/9dQRWXS.6Fc9usH9qC	\N	\N	2016-02-15 10:15:54.034677	37	2016-02-29 04:17:26.483245	2016-02-23 09:44:33.05524	115.77.192.45	115.77.192.45	2016-02-11 07:56:27.150945	2016-02-29 04:17:26.48537	ngocdo	Ngoc	Do	admin
2	conmeocanthi@gmail.com	$2a$10$OXjpSBaVvuxjuD838PbIDOKE4z/pSH8XHkXn/.bV4d3FhlssKFeZi	\N	\N	\N	5	2016-02-13 10:16:10.113076	2016-02-13 09:12:26.168924	115.77.192.45	115.77.192.45	2016-02-13 09:04:44.155522	2016-02-13 10:16:10.115775	conmeocanthi	Con Meo	Can Thi	user
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Data for Name: videos; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY videos (id, name, url, created_at, updated_at) FROM stdin;
1	Cristiano Ronaldo ► 2016 - Skills - Tricks - Goals |HD	https://www.youtube.com/embed/bTk5ZcL0XZ4	2016-02-03 11:49:54.8192	2016-02-03 11:49:54.8192
2	TOP 5 - Saves of the Year 2015	https://www.youtube.com/embed/Qpt6QQ5MeQ8	2016-02-03 11:50:30.002767	2016-02-03 11:50:30.002767
3	Top 10 Stupid Red Cards | HD	https://www.youtube.com/embed/W-f2YkerEYI	2016-02-03 11:51:16.227741	2016-02-03 11:51:16.227741
\.


--
-- Name: videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('videos_id_seq', 3, true);


--
-- Data for Name: web_captures; Type: TABLE DATA; Schema: public; Owner: bet
--

COPY web_captures (id) FROM stdin;
\.


--
-- Name: web_captures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bet
--

SELECT pg_catalog.setval('web_captures_id_seq', 1, false);


--
-- Name: assign_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY assign_teams
    ADD CONSTRAINT assign_teams_pkey PRIMARY KEY (id);


--
-- Name: bet_money_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY bet_money_lines
    ADD CONSTRAINT bet_money_lines_pkey PRIMARY KEY (id);


--
-- Name: bet_spreads_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY bet_spreads
    ADD CONSTRAINT bet_spreads_pkey PRIMARY KEY (id);


--
-- Name: bet_total_points_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY bet_total_points
    ADD CONSTRAINT bet_total_points_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: chefs_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY chefs
    ADD CONSTRAINT chefs_pkey PRIMARY KEY (id);


--
-- Name: cuisines_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY cuisines
    ADD CONSTRAINT cuisines_pkey PRIMARY KEY (id);


--
-- Name: ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: leagues_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY leagues
    ADD CONSTRAINT leagues_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: matches_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_pkey PRIMARY KEY (id);


--
-- Name: nutritions_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY nutritions
    ADD CONSTRAINT nutritions_pkey PRIMARY KEY (id);


--
-- Name: odd_money_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY odd_money_lines
    ADD CONSTRAINT odd_money_lines_pkey PRIMARY KEY (id);


--
-- Name: odd_spreads_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY odd_spreads
    ADD CONSTRAINT odd_spreads_pkey PRIMARY KEY (id);


--
-- Name: odd_total_points_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY odd_total_points
    ADD CONSTRAINT odd_total_points_pkey PRIMARY KEY (id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: seasons_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY seasons
    ADD CONSTRAINT seasons_pkey PRIMARY KEY (id);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: teams_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: videos_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (id);


--
-- Name: web_captures_pkey; Type: CONSTRAINT; Schema: public; Owner: bet; Tablespace: 
--

ALTER TABLE ONLY web_captures
    ADD CONSTRAINT web_captures_pkey PRIMARY KEY (id);


--
-- Name: index_assign_teams_on_league_id_and_season_id_and_team_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE UNIQUE INDEX index_assign_teams_on_league_id_and_season_id_and_team_id ON assign_teams USING btree (league_id, season_id, team_id);


--
-- Name: index_bet_money_lines_on_match_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_bet_money_lines_on_match_id ON bet_money_lines USING btree (match_id);


--
-- Name: index_bet_money_lines_on_odd_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_bet_money_lines_on_odd_id ON bet_money_lines USING btree (odd_id);


--
-- Name: index_bet_money_lines_on_user_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_bet_money_lines_on_user_id ON bet_money_lines USING btree (user_id);


--
-- Name: index_bet_spreads_on_match_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_bet_spreads_on_match_id ON bet_spreads USING btree (match_id);


--
-- Name: index_bet_spreads_on_odd_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_bet_spreads_on_odd_id ON bet_spreads USING btree (odd_id);


--
-- Name: index_bet_spreads_on_user_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_bet_spreads_on_user_id ON bet_spreads USING btree (user_id);


--
-- Name: index_bet_total_points_on_match_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_bet_total_points_on_match_id ON bet_total_points USING btree (match_id);


--
-- Name: index_bet_total_points_on_odd_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_bet_total_points_on_odd_id ON bet_total_points USING btree (odd_id);


--
-- Name: index_bet_total_points_on_user_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_bet_total_points_on_user_id ON bet_total_points USING btree (user_id);


--
-- Name: index_categories_on_parent_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_categories_on_parent_id ON categories USING btree (parent_id);


--
-- Name: index_ingredients_on_recipe_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_ingredients_on_recipe_id ON ingredients USING btree (recipe_id);


--
-- Name: index_matches_on_away_team_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_matches_on_away_team_id ON matches USING btree (away_team_id);


--
-- Name: index_matches_on_home_team_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_matches_on_home_team_id ON matches USING btree (home_team_id);


--
-- Name: index_matches_on_league_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_matches_on_league_id ON matches USING btree (league_id);


--
-- Name: index_matches_on_season_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_matches_on_season_id ON matches USING btree (season_id);


--
-- Name: index_nutritions_on_recipe_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_nutritions_on_recipe_id ON nutritions USING btree (recipe_id);


--
-- Name: index_odd_money_lines_on_match_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_odd_money_lines_on_match_id ON odd_money_lines USING btree (match_id);


--
-- Name: index_odd_spreads_on_match_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_odd_spreads_on_match_id ON odd_spreads USING btree (match_id);


--
-- Name: index_odd_total_points_on_match_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_odd_total_points_on_match_id ON odd_total_points USING btree (match_id);


--
-- Name: index_recipes_on_cuisine_id; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_recipes_on_cuisine_id ON recipes USING btree (cuisine_id);


--
-- Name: index_tags_on_ancestry; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE INDEX index_tags_on_ancestry ON tags USING btree (ancestry);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: bet; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

