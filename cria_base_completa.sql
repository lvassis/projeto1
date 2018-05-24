drop table associado_ind
drop table cobranca
drop table cobranca_ind
drop table comissao
drop table comissao_ind
drop table corretora
drop table empresa
drop table fenacor
drop table fenacor_pj
drop table ref
drop table vend_unico
drop table vendedor
drop table holdings

CREATE TABLE [associado_ind] (
	[n_matr_ass] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_adm_tit] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_adm_rea] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[nome_ass] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cpf_ass] [char] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cd_id_vend] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_canc_ex] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cd_mot_can] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cd_fil_con] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[desc_end] [char] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[desc_compl] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[bairro] [char] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[uf] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cep5] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cep3] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ddd] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[telefone] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ramal] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_nasc] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_inc_con] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[desc_email] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[qt_vidas] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cod_plano] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cod_subpl] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[nro_ver_ct] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_atu_ass] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_geracao] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_venda] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_atu] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_ender] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_nome] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_tlogr] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_logr] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_nro] [char] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_compl] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_bairro] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cidade] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_uf] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cep] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_unid] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdlocal] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdowner] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdbairr] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdlogr] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdesp] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdtlogr] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_tipoloc] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[end_ok] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_ct_prin] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[camp_venda] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[class_cli] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [cobranca] (
	[codigo] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[per_refer] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[n_parcela] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[seq_docto] [char] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_seq_doc] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_av_cred] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_pg] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_baixa] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[vl_calc] [decimal](14, 2) NOT NULL ,
	[vl_pg] [decimal](14, 2) NOT NULL ,
	[vl_juro] [decimal](14, 2) NOT NULL ,
	[vl_comiss] [decimal](14, 2) NOT NULL ,
	[nm_titul] [decimal](6, 0) NOT NULL ,
	[dt_gerac] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_atu] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[status] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [cobranca_ind] (
	[n_seq_doc] [char] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_seq_doc] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[n_matr_ass] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_adm_tit] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[per_rf_cob] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[n_parc] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_emissao] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dia_venc] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_av_cred] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_pagt] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_bx_pagt] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[vl_calcul] [decimal](12, 2) NOT NULL ,
	[vl_tot_pag] [decimal](12, 2) NOT NULL ,
	[vl_comis_p] [decimal](12, 2) NOT NULL ,
	[dt_geracao] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[data_venc] [datetime]  NOT NULL ,
	[data_pagt] [datetime]  NOT NULL ,
	[atraso] [decimal] (6, 0)  NOT NULL ,
	[flag_pg] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_atu] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [comissao] (
	[cod_empr] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cod_vended] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[per_refer] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[num_parc] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_emiss] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[vl_corr] [decimal](12, 2) NOT NULL ,
	[vl_ref] [decimal](12, 2) NOT NULL ,
	[vl_vend] [decimal](12, 2) NOT NULL ,
	[ref_proces] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_gerac] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cod_corr] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cod_ref] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cod_regra] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_atu] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [comissao_ind] (
	[n_matr_ass] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cd_vd_comi] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[per_rf_cob] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[n_parc] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_emissao] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[vl_pg_corr] [decimal](13, 2) NOT NULL ,
	[vl_pg_ref] [decimal](13, 2) NOT NULL ,
	[vl_pg_vend] [decimal](13, 2) NOT NULL ,
	[ref_proc] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_geracao] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cd_corret] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cd_ref] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cd_reg_com] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_atu] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [corretora] (
	[cd_id] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cd_corr] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[susep] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[nome] [char] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ender] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[bairro] [char] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cidade] [char] (23) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[email] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[uf] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cep5] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cep3] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[contato] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ddd_tel1] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ddd_tel2] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fax] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fone1] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fone2] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ramal1] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ramal2] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[inscr_est] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cgc] [char] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_admin] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_canc] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[filial_ct] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tipo_empre] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[n_pontos] [decimal](5, 0) NOT NULL ,
	[dt_atua] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_gerac] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_atu] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_ender] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_tlogr] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_logr] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_nro] [char] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_compl] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_bairro] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cidade] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_uf] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cep] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_unid] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdlocal] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdowner] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdbairr] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdlogr] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdesp] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdtlogr] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_tipoloc] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[end_ok] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [empresa] (
	[codigo] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[nome] [char] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cgc] [char] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cd_fl_cob] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[end_cob] [char] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[compl_cob] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[bairr_cob] [char] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[uf_cob] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cep5_cob] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cep3_cob] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cod_fil_ct] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ender] [char] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[compl] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[bairr] [char] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[uf] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cep5] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cep3] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ddd1] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fone1] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ramal1] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ddd2] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fone2] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ramal2] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[func] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[vendedor] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cd_admin] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[mot_canc] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_pg] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tp_rec_car] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tp_rel_com] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_admin] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_canc] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_susp] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[email] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cd_emp_grp] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fax1] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fax2] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[qtd_vidas] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_ut_atu] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_gerac] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_atu] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_end_cob] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_ender] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tc_tlogr] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tc_logr] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tc_nro] [char] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tc_compl] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tc_bairro] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tc_cidade] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tc_uf] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tc_cep] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tc_unid] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tc_cdlocal] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tc_cdowner] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tc_cdbairr] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tc_cdlogr] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tc_cdesp] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tc_cdtlogr] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tc_tipoloc] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[te_tlogr] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[te_logr] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[te_nro] [char] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[te_compl] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[te_bairro] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[te_cidade] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[te_uf] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[te_cep] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[te_unid] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[te_cdlocal] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[te_cdowner] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[te_cdbairr] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[te_cdlogr] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[te_cdesp] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[te_cdtlogr] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[te_tipoloc] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tend_cob] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tend_end] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[qt_vidas_i] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[vl_pg_dia] [decimal](12, 2) NOT NULL ,
	[vl_pg_atr] [decimal](12, 2) NOT NULL ,
	[vl_pg_aven] [decimal](12, 2) NOT NULL ,
	[vl_pg_venc] [decimal](12, 2) NOT NULL ,
	[rec_med_vd] [decimal](12, 2) NOT NULL ,
	[n_dd_ativ] [decimal](5, 0) NOT NULL ,
	[segmento] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[principal] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[camp_venda] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[qtd_tit] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[qtd_vda_or] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_assin] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[segment] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[class_cli] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [fenacor] (
	[id_unico] [char] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cpf] [char] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[registro] [char] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[nome] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[endereco] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[bairro] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cidade] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[uf] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cep] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ddd_fone] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fone] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ddd_fax] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fax] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[situacao] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[data_conce] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ult_altera] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[venc_provi] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [fenacor_pj] (
	[cgc] [char] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[registro] [char] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[nome] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[endereco] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[bairro] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cidade] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[uf] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cep] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ddd_fone] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fone] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ddd_fax] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fax] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[situacao] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[data_conce] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ult_altera] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[venc_provi] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cpf_resp] [char] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [ref] (
	[cd_id] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cd_corr] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[id_reg] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[susep] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[nome] [char] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ender] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[bairro] [char] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cidade] [char] (23) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[email] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[uf] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cep5] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cep3] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[contato] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ddd_tel1] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ddd_tel2] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fax] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fone1] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fone2] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ramal1] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ramal2] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[inscr_est] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cgc] [char] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_admin] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_canc] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[filial_ct] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[n_pontos] [decimal](5, 0) NOT NULL ,
	[dt_atua] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_gerac] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_atu] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_ender] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_tlogr] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_logr] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_nro] [char] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_compl] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_bairro] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cidade] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_uf] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cep] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_unid] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdlocal] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdowner] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdbairr] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdlogr] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdesp] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdtlogr] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_tipoloc] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[end_ok] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [vend_unico] (
	[id_unico] [char] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cd_id] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cd_corr] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cd_ref] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[nome] [char] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[sexo] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cpf] [char] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[matricula] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[susep] [char] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cargo] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ender] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[bairro] [char] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cidade] [char] (23) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[email] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[uf] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cep5] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cep3] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ddd_tel] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ddd_cel] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fone] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cel] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[stat_cel] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ramal] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[est_civ] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[gr_instr] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_nasc] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[qtd_filhos] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_admis] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_canc] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[stat_canc] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_atua] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_gerac] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_1_admis] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ndias_corr] [decimal](7, 0) NOT NULL ,
	[ndias_ativ] [decimal](7, 0) NOT NULL ,
	[razao_dias] [decimal](6, 2) NOT NULL ,
	[qt_recs] [decimal](3, 0) NOT NULL ,
	[qt_sit_0] [decimal](3, 0) NOT NULL ,
	[qt_sit_1] [decimal](3, 0) NOT NULL ,
	[qt_sit_2] [decimal](3, 0) NOT NULL ,
	[qt_sit_3] [decimal](3, 0) NOT NULL ,
	[qt_sit_4] [decimal](3, 0) NOT NULL ,
	[qt_sit_5] [decimal](3, 0) NOT NULL ,
	[qt_sit_6] [decimal](3, 0) NOT NULL ,
	[n_pontos] [decimal](5, 0) NOT NULL ,
	[end_ok] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_tlogr] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_logr] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_nro] [char] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_compl] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_bairro] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cidade] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_uf] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cep] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_unid] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdlocal] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdowner] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdbairr] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdlogr] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdesp] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdtlogr] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_tipoloc] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[flag_fenac] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[reg_fenac] [char] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[sit_fenac] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_con_fen] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_at_fen] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_pro_fen] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[qtd_ct_m] [decimal](5, 0) NOT NULL ,
	[qtd_ct_ma] [decimal](5, 0) NOT NULL ,
	[qtd_ct_tr] [decimal](8, 2) NOT NULL ,
	[qtd_ct_t] [decimal](8, 2) NOT NULL ,
	[nm_vd_m] [decimal](8, 0) NOT NULL ,
	[nm_vd_ma] [decimal](8, 0) NOT NULL ,
	[nm_vd_tr] [decimal](11, 2) NOT NULL ,
	[nm_vd_t] [decimal](11, 2) NOT NULL ,
	[cob_m] [decimal](15, 2) NOT NULL ,
	[cob_ma] [decimal](15, 2) NOT NULL ,
	[cob_tr] [decimal](15, 2) NOT NULL ,
	[cob_t] [decimal](15, 2) NOT NULL ,
	[cob_pdia] [decimal](15, 2) NOT NULL ,
	[cob_patr] [decimal](15, 2) NOT NULL ,
	[cob_avenc] [decimal](15, 2) NOT NULL ,
	[cob_venci] [decimal](15, 2) NOT NULL ,
	[tx_adimpl] [decimal](6, 2) NOT NULL ,
	[comis_m] [decimal](12, 2) NOT NULL ,
	[comis_ma] [decimal](12, 2) NOT NULL ,
	[comis_tr] [decimal](12, 2) NOT NULL ,
	[comis_t] [decimal](12, 2) NOT NULL ,
	[comis_c_at] [decimal](12, 2) NOT NULL ,
	[stat01] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[stat02] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[stat03] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[stat04] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[stat05] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[stat06] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[stat07] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[stat08] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[stat09] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[stat10] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[stat11] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[stat12] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[natu_empre] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [vendedor] (
	[id_unico] [char] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cd_id] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cd_corr] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cd_ref] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[nome] [char] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[sexo] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cpf] [char] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[matricula] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[susep] [char] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cargo] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ender] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[bairro] [char] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cidade] [char] (23) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[email] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[uf] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cep5] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cep3] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ddd_tel] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ddd_cel] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fone] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cel] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ramal] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[est_civ] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[gr_instr] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_nasc] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[qtd_filhos] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_admin] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_canc] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[stat_canc] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_atua] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_gerac] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_atu] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_ender] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_nome] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_tlogr] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_logr] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_nro] [char] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_compl] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_bairro] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cidade] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_uf] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cep] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_unid] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdlocal] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdowner] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdbairr] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdlogr] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdesp] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_cdtlogr] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_tipoloc] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[end_ok] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[qtd_ct_m] [decimal](5, 0) NOT NULL ,
	[qtd_ct_ma] [decimal](5, 0) NOT NULL ,
	[qtd_ct_tr] [decimal](8, 2) NOT NULL ,
	[qtd_ct_t] [decimal](8, 2) NOT NULL ,
	[nm_vd_m] [decimal](8, 0) NOT NULL ,
	[nm_vd_ma] [decimal](8, 0) NOT NULL ,
	[nm_vd_tr] [decimal](11, 2) NOT NULL ,
	[nm_vd_t] [decimal](11, 2) NOT NULL ,
	[cob_m] [decimal](15, 2) NOT NULL ,
	[cob_ma] [decimal](15, 2) NOT NULL ,
	[cob_tr] [decimal](15, 2) NOT NULL ,
	[cob_t] [decimal](15, 2) NOT NULL ,
	[cob_pdia] [decimal](15, 2) NOT NULL ,
	[cob_patr] [decimal](15, 2) NOT NULL ,
	[cob_avenc] [decimal](15, 2) NOT NULL ,
	[cob_venci] [decimal](15, 2) NOT NULL ,
	[comis_m] [decimal](12, 2) NOT NULL ,
	[comis_ma] [decimal](12, 2) NOT NULL ,
	[comis_tr] [decimal](12, 2) NOT NULL ,
	[comis_t] [decimal](12, 2) NOT NULL ,
	[comis_c_at] [decimal](12, 2) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [holdings] (
	[codigo] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[nome] [char] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cgc] [char] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO