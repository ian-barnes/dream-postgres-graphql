CREATE TABLE dream_session (
    id TEXT PRIMARY KEY,
    label TEXT NOT NULL,
    expires_at REAL NOT NULL,
    payload TEXT NOT NULL
);

CREATE TABLE people (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    origin TEXT
);

INSERT INTO public.people VALUES (1, 'Alex', 'Australia');
INSERT INTO public.people VALUES (2, 'Bobby', 'Belgium');
INSERT INTO public.people VALUES (3, 'Charlie', 'Canada');
INSERT INTO public.people VALUES (4, 'Drew', 'Denmark');
INSERT INTO public.people VALUES (5, 'Evan', 'Ecuador');
INSERT INTO public.people VALUES (6, 'Freddie', 'France');
INSERT INTO public.people VALUES (7, 'Greer', 'Germany');
INSERT INTO public.people VALUES (8, 'Hayden', 'Hungary');
