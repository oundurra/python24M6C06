--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-08-12 16:10:07 -04

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
-- TOC entry 242 (class 1259 OID 16866)
-- Name: curso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.curso (
    codigo character varying(10) NOT NULL,
    nombre character varying(50) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 16871)
-- Name: curso_profesores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.curso_profesores (
    curso_id character varying(10) NOT NULL,
    profesor_id character varying(9) NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 16904)
-- Name: direccion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.direccion (
    id integer NOT NULL,
    calle character varying(50) NOT NULL,
    numero character varying(10) NOT NULL,
    dpto character varying(10),
    comuna character varying(50) NOT NULL,
    ciudad character varying(50) NOT NULL,
    region character varying(50) NOT NULL,
    estudiante_id character varying(9) NOT NULL
);


--
-- TOC entry 246 (class 1259 OID 16903)
-- Name: direccion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.direccion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3688 (class 0 OID 0)
-- Dependencies: 246
-- Name: direccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.direccion_id_seq OWNED BY public.direccion.id;


--
-- TOC entry 244 (class 1259 OID 16884)
-- Name: estudiante; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.estudiante (
    rut character varying(9) NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    fecha_nac date NOT NULL,
    activo boolean DEFAULT false,
    creacion_registro date NOT NULL,
    modificacion_registro date NOT NULL,
    creado_por character varying(50) NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 16890)
-- Name: estudiante_cursos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.estudiante_cursos (
    estudiante_id character varying(9) NOT NULL,
    curso_id character varying(10) NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 16860)
-- Name: profesor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profesor (
    rut character varying(9) NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    activo boolean DEFAULT false,
    creacion_registro date NOT NULL,
    modificacion_registro date NOT NULL,
    creado_por character varying(50) NOT NULL
);


--
-- TOC entry 3515 (class 2604 OID 16907)
-- Name: direccion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.direccion ALTER COLUMN id SET DEFAULT nextval('public.direccion_id_seq'::regclass);


--
-- TOC entry 3677 (class 0 OID 16866)
-- Dependencies: 242
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.curso VALUES ('P01_24', 'Python Trainee', 1);
INSERT INTO public.curso VALUES ('P01_666', 'Python Hell', 1);


--
-- TOC entry 3678 (class 0 OID 16871)
-- Dependencies: 243
-- Data for Name: curso_profesores; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.curso_profesores VALUES ('P01_24', '13');
INSERT INTO public.curso_profesores VALUES ('P01_24', '666');
INSERT INTO public.curso_profesores VALUES ('P01_666', '666');


--
-- TOC entry 3682 (class 0 OID 16904)
-- Dependencies: 247
-- Data for Name: direccion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.direccion VALUES (4, 'Alameda', '1321', '', 'Santiago', 'Santiago', 'RM', '1');


--
-- TOC entry 3679 (class 0 OID 16884)
-- Dependencies: 244
-- Data for Name: estudiante; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.estudiante VALUES ('1', 'Oscar', 'Undurraga', '1979-08-08', false, '2024-08-12', '2024-08-12', 'oundurra');


--
-- TOC entry 3680 (class 0 OID 16890)
-- Dependencies: 245
-- Data for Name: estudiante_cursos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.estudiante_cursos VALUES ('1', 'P01_24');
INSERT INTO public.estudiante_cursos VALUES ('1', 'P01_666');


--
-- TOC entry 3676 (class 0 OID 16860)
-- Dependencies: 241
-- Data for Name: profesor; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.profesor VALUES ('13', 'Felipe', 'Undurraga', false, '2024-08-10', '2024-08-10', 'oundurraga');
INSERT INTO public.profesor VALUES ('666', 'Tomas', 'Araya', false, '2024-08-12', '2024-08-12', 'oundurraga');


--
-- TOC entry 3689 (class 0 OID 0)
-- Dependencies: 246
-- Name: direccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.direccion_id_seq', 4, true);


--
-- TOC entry 3519 (class 2606 OID 16870)
-- Name: curso curso_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pk PRIMARY KEY (codigo);


--
-- TOC entry 3521 (class 2606 OID 16918)
-- Name: curso_profesores curso_profesor_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso_profesores
    ADD CONSTRAINT curso_profesor_unique UNIQUE (curso_id, profesor_id);


--
-- TOC entry 3525 (class 2606 OID 16909)
-- Name: direccion direccion_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_pk PRIMARY KEY (id);


--
-- TOC entry 3527 (class 2606 OID 16911)
-- Name: direccion direccion_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_unique UNIQUE (estudiante_id);


--
-- TOC entry 3523 (class 2606 OID 16889)
-- Name: estudiante estudiante_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_pk PRIMARY KEY (rut);


--
-- TOC entry 3517 (class 2606 OID 16865)
-- Name: profesor profesor_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_pk PRIMARY KEY (rut);


--
-- TOC entry 3528 (class 2606 OID 16874)
-- Name: curso_profesores curso_profesor_curso_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso_profesores
    ADD CONSTRAINT curso_profesor_curso_fk FOREIGN KEY (curso_id) REFERENCES public.curso(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3529 (class 2606 OID 16879)
-- Name: curso_profesores curso_profesor_profesor_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso_profesores
    ADD CONSTRAINT curso_profesor_profesor_fk FOREIGN KEY (profesor_id) REFERENCES public.profesor(rut) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3532 (class 2606 OID 16912)
-- Name: direccion direccion_estudiante_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_estudiante_fk FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(rut) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3530 (class 2606 OID 16893)
-- Name: estudiante_cursos estudiante_curso_curso_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estudiante_cursos
    ADD CONSTRAINT estudiante_curso_curso_fk FOREIGN KEY (curso_id) REFERENCES public.curso(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3531 (class 2606 OID 16898)
-- Name: estudiante_cursos estudiante_curso_estudiante_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estudiante_cursos
    ADD CONSTRAINT estudiante_curso_estudiante_fk FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(rut) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2024-08-12 16:10:08 -04

--
-- PostgreSQL database dump complete
--

