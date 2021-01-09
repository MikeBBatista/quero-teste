--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5
-- Dumped by pg_dump version 12.5

-- Started on 2021-01-08 20:50:23

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
-- TOC entry 202 (class 1259 OID 16415)
-- Name: candidate_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate_data (
    id bigint NOT NULL,
    categoria bigint NOT NULL,
    ocupacao bigint NOT NULL,
    competencia bigint NOT NULL,
    fonte bigint NOT NULL,
    grau_de_instrucao bigint NOT NULL,
    horas_contratuais integer NOT NULL,
    idade integer NOT NULL,
    ind_trab_intermitente integer NOT NULL,
    ind_trab_parcial integer NOT NULL,
    indicador_aprendiz integer NOT NULL,
    municipio bigint NOT NULL,
    raca_cor integer NOT NULL,
    regiao bigint NOT NULL,
    salario numeric(15,6) NOT NULL,
    saldo_movimentacao integer NOT NULL,
    secao character varying(2) NOT NULL,
    sexo integer NOT NULL,
    subclasse bigint NOT NULL,
    tam_estab_jan integer NOT NULL,
    tipo_de_deficiencia integer NOT NULL,
    tipo_empregador integer NOT NULL,
    tipo_estabelecimento integer NOT NULL,
    tipo_movimentacao integer NOT NULL,
    uf integer NOT NULL
);


ALTER TABLE public.candidate_data OWNER TO postgres;

--
-- TOC entry 2686 (class 2606 OID 16419)
-- Name: candidate_data candidate_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_data
    ADD CONSTRAINT candidate_data_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 1259 OID 16421)
-- Name: idx_candidate_address; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_candidate_address ON public.candidate_data USING btree (municipio, regiao, uf);


--
-- TOC entry 2688 (class 1259 OID 16422)
-- Name: idx_candidate_explevel; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_candidate_explevel ON public.candidate_data USING btree (grau_de_instrucao);


--
-- TOC entry 2689 (class 1259 OID 16420)
-- Name: idx_candidate_idd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_candidate_idd ON public.candidate_data USING btree (idade) WHERE ((idade > 18) AND (idade < 65));


-- Completed on 2021-01-08 20:50:24

--
-- PostgreSQL database dump complete
--

