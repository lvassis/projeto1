USE [Golden_PJ_diario]
GO
/****** Object:  StoredProcedure [dbo].[passo30_gera_base_venda_v05]    Script Date: 04/26/2017 14:16:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[passo30_gera_base_venda_v05]  AS


/* Processo para geracao de base diária de análise de vidas   */

/* Controle de versões         */
/* v04 - Modificações conforme regras obtidas pela Jéssica e fornecidas em 22/12/2016  */
/* v05 - Modificações de lay-out conforme email enviado pela Jéssica/DEMAC em 19/01/2017  */
/* 26/04/2017 - Modificações na identificação do premio de venda - troca de per_venc por per_cobr */


set language portuguese
declare @anomes_corte varchar(6) 

set @anomes_corte = '201601'

insert into golden_PJ..status_processos values ('Base Venda Diária','Início - excluindo arquivos temporários',getdate())

if exists (select * from dbo.sysobjects where id = object_id(N'tab_aux_relacao_comercial') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table tab_aux_relacao_comercial

if exists (select * from dbo.sysobjects where id = object_id(N'tab_aux_tipo_empresa_venda') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table tab_aux_tipo_empresa_venda

if exists (select * from dbo.sysobjects where id = object_id(N'tab_aux_tipo_vendedor') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table tab_aux_tipo_vendedor

if exists (select * from dbo.sysobjects where id = object_id(N'tab_aux_status_vendedor') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table tab_aux_status_vendedor

if exists (select * from dbo.sysobjects where id = object_id(N'tab_aux_estrutura_venda') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table tab_aux_estrutura_venda

if exists (select * from dbo.sysobjects where id = object_id(N'tab_aux_planos') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table tab_aux_planos

if exists (select * from dbo.sysobjects where id = object_id(N'tab_aux_premio_venda') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table tab_aux_premio_venda

if exists (select * from dbo.sysobjects where id = object_id(N'tab_aux_report') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table tab_aux_report

if exists (select * from dbo.sysobjects where id = object_id(N'tab_aux_report_saida') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table tab_aux_report_saida

WAITFOR DELAY '00:00:01'
insert into golden_PJ..status_processos values ('Base Venda Diária','Criando tabelas auxiliares',getdate())

CREATE TABLE tab_aux_relacao_comercial (
	codigo      char (2) NULL ,
	descricao   varchar (100) NULL )

insert into tab_aux_relacao_comercial values ('00','00 - Normal'                  )
insert into tab_aux_relacao_comercial values ('01','01 - Empresa de Vendas'       )
insert into tab_aux_relacao_comercial values ('02','02 - Permuta'                 )
insert into tab_aux_relacao_comercial values ('03','03 - Devedores Duvidosos'     )
insert into tab_aux_relacao_comercial values ('04','04 - Negociação'              )
insert into tab_aux_relacao_comercial values ('05','05 - Associações'             )
insert into tab_aux_relacao_comercial values ('06','06 - Filantripia'             )
insert into tab_aux_relacao_comercial values ('07','07 - Licitação Pública'       )
insert into tab_aux_relacao_comercial values ('08','08 - Filantropia Externa'     )
insert into tab_aux_relacao_comercial values ('09','09 - Empresa Golden Cross'    )
insert into tab_aux_relacao_comercial values ('10','10 - Empresa Igase'           )
insert into tab_aux_relacao_comercial values ('11','11 - Dame Remido'             )
insert into tab_aux_relacao_comercial values ('12','12 - Cosep'                   )
insert into tab_aux_relacao_comercial values ('13','13 - Demitidos'               )
insert into tab_aux_relacao_comercial values ('14','14 - Plano por Administração' )
insert into tab_aux_relacao_comercial values ('15','15 - Plano por Administração' )
insert into tab_aux_relacao_comercial values ('16','16 - Liminar'                 )
insert into tab_aux_relacao_comercial values ('17','17 - Aposentados'             )

CREATE TABLE tab_aux_tipo_empresa_venda (
	codigo      char (2) NULL ,
	descricao   varchar (100) NULL )

insert into tab_aux_tipo_empresa_venda values ('01','01 - Terceirizada'  )
insert into tab_aux_tipo_empresa_venda values ('02','02 - Salão de Venda')
insert into tab_aux_tipo_empresa_venda values ('03','03 - Hot Money'     )
insert into tab_aux_tipo_empresa_venda values ('04','04 - Cooperativa'   )
insert into tab_aux_tipo_empresa_venda values ('05','05 - Administrativa')


CREATE TABLE tab_aux_tipo_vendedor (
	codigo      char (2) NULL ,
	descricao   varchar (100) NULL )

insert into tab_aux_tipo_vendedor values ('00','00 - Agente de Vendas'    )
insert into tab_aux_tipo_vendedor values ('01','01 - Supervisor de Vendas')
insert into tab_aux_tipo_vendedor values ('02','02 - Gerente de Vendas'   )
insert into tab_aux_tipo_vendedor values ('03','03 - Gerente de Filial'   )
insert into tab_aux_tipo_vendedor values ('04','04 - Gerente Geral'       )
insert into tab_aux_tipo_vendedor values ('05','05 - Diretor'             )


CREATE TABLE tab_aux_status_vendedor (
	codigo      char (2) NULL ,
	descricao   varchar (100) NULL )

insert into tab_aux_status_vendedor values ('00','00 - Ativo')
insert into tab_aux_status_vendedor values ('01','01 - Erro cadastramento')
insert into tab_aux_status_vendedor values ('02','02 - Demitido')
insert into tab_aux_status_vendedor values ('03','03 - Demitido por Erro Grave')
insert into tab_aux_status_vendedor values ('04','04 - Demitido por Erro Grave a pedido da Golden')
insert into tab_aux_status_vendedor values ('05','05 - Demitiu-se')
insert into tab_aux_status_vendedor values ('06','06 - Cancelado por falta de produção')


CREATE TABLE tab_aux_planos (
	plano      varchar (2) NULL ,
	subplano   char (2) NULL ,
	rede       varchar(100) null,
	acomodacao varchar(100) null,
	coparticip varchar(100) null,
	tipo_prod  varchar(100) null,
	clas_empr  varchar(100) null)

bulk insert tab_aux_planos
from 'E:\fabrica_golden_V02\2proc\report_demac_SQL\insumos\tabela_plano_subplano.dat'
with (FIELDTERMINATOR = '\t',DATAFILETYPE = 'char',CODEPAGE='RAW',FIRSTROW=2)

update tab_aux_planos
set subplano = right('00'+LTRIM(rtrim(subplano)),2)

/* Caso não tenha sido inserido o plano "IO" "70", insere o mesmo na base de planos */
DECLARE @ct_plano_odonto_ind integer
select @ct_plano_odonto_ind = COUNT(*) from tab_aux_planos where plano='IO' and subplano='70'

if @ct_plano_odonto_ind = 0
insert into tab_aux_planos values ('IO','70',space(1),'Sem Acomodação','N','Odonto','INDIVIDUAL')

checkpoint

WAITFOR DELAY '00:00:01'
insert into golden_PJ..status_processos values ('Base Venda Diária','Gerando tabela básica de vendas - vidas do coletivo',getdate())

select 
a.matricula as matricula,
a.matricula+a.dep as matricula_completa,
a.cpf as cpf,
a.codigo as codigo_empresa,
b.cgc as CNPJ_empresa,
c.codigo as codigo_holding,
c.cgc as CNPJ_holding,
right(a.dt_adm_rea,4) as ano_venda,       /* v04 -  Trocada data de assinatura por data de admissão da vida */
substring(a.dt_adm_rea,3,2) as mes_venda, /* v04 -  Trocada data de assinatura por data de admissão da vida */
left(a.dt_adm_rea,2) as dia_venda,        /* v05 -  incluido o campo separado de dia da venda */
a.dt_adm_rea as data_admissao_vida,
a.dt_adm_tit as data_admissao_titular,
a.dt_impl as data_implantacao_vida,
a.dt_canc as data_cancelamento_vida,
b.dt_assin as data_venda_empresa,
b.dt_implant as data_implantacao_empresa,
b.dt_admin as data_admissao_empresa,
b.dt_canc as data_cancelamento_empresa,
d.descricao as relacao_comercial,
e.rede as rede,
e.tipo_prod as tipo_produto,
b.segment as produto,
a.stat_prop as status_proposta,
a.mot_canc as status_vida,
CONVERT(numeric (12,2), 0.00) as valor,
CONVERT(char(8),'00000000') as data_cancelamento_titular,
a.fl_status as flag_status_quadro_social,
CONVERT(varchar(100),space(0)) as movimentacao_ingresso,
CONVERT(varchar(100),space(0)) as movimentacao_stat_prop,
CONVERT(varchar(100),space(0)) as movimentacao_status,
b.vendedor as cod_vendedor,
a.cd_plano,
a.cd_subpl
into tab_aux_report
from quadro_social a,
     empresa b,
     empresa c,
     tab_aux_relacao_comercial d,
     (select plano,subplano,rede,tipo_prod from tab_aux_planos group by plano,subplano,rede,tipo_prod) e
where a.codigo=b.codigo and
      b.cd_emp_grp=c.codigo and
      b.tp_rel_com=d.codigo and
      a.cd_plano=e.plano and
      a.cd_subpl=e.subplano and
      (right(b.dt_assin,4)  +substring(b.dt_assin,3,2)   >=@anomes_corte or
       right(b.dt_implant,4)+substring(b.dt_implant,3,2) >=@anomes_corte or
       right(b.dt_admin,4)  +substring(b.dt_admin,3,2)   >=@anomes_corte or
       right(b.dt_canc,4)   +substring(b.dt_canc,3,2)    >=@anomes_corte or
       right(a.dt_adm_rea,4)+substring(a.dt_adm_rea,3,2) >=@anomes_corte or
       right(a.dt_adm_tit,4)+substring(a.dt_adm_tit,3,2) >=@anomes_corte or
       right(a.dt_impl,4)   +substring(a.dt_impl,3,2)    >=@anomes_corte or
       right(a.dt_canc,4)   +substring(a.dt_canc,3,2)    >=@anomes_corte )

checkpoint

insert into golden_PJ..status_processos values ('Base Venda Diária','Gerando tabela básica de vendas - inserindo vidas do individual',getdate())

insert into tab_aux_report
select 
a.matricula,
a.matricula+a.dep,
a.cpf,
'000000',
space(1),
'000000',
space(1),
right(a.dt_adm_rea,4),       /* v04 -  Trocada data de assinatura por data de admissão da vida */
substring(a.dt_adm_rea,3,2), /* v04 -  Trocada data de assinatura por data de admissão da vida */
left(a.dt_adm_rea,2),        /* v05 -  incluido o campo separado de dia da venda */
a.dt_adm_rea,
a.dt_adm_tit,
a.dt_impl,
a.dt_canc,
CASE WHEN b.DT_VENDA IS null THEN '00000000' ELSE b.DT_VENDA end,
CASE WHEN b.DT_ADM_REA IS null THEN '00000000' ELSE b.DT_ADM_REA end,
CASE WHEN b.DT_ADM_REA IS null THEN '00000000' ELSE b.DT_ADM_REA end,
CASE WHEN b.DT_CANC_EX IS null THEN '00000000' ELSE b.DT_CANC_EX end,
space(1),
CONVERT(varchar(100),space(0)),
CONVERT(varchar(100),space(0)),
'INDIVIDUAL',
a.stat_prop,
a.mot_canc,
CONVERT(numeric (12,2), 0.00),
CASE WHEN b.DT_CANC_EX IS null THEN '00000000' ELSE b.DT_CANC_EX end,
a.fl_status,
CONVERT(varchar(100),space(0)),
CONVERT(varchar(100),space(0)),
CONVERT(varchar(100),space(0)),
CASE WHEN b.CD_ID_VEND IS null THEN '000000000' ELSE b.CD_ID_VEND end,
a.cd_plano,
a.cd_subpl
from quadro_social_ind a left join
     golden_PJ..associado_ind b
on a.matricula=b.N_MATR_ASS     
where (b.fl_ct_prin='S' or b.fl_ct_prin is null)

checkpoint

/* Preenchendo rede e tipo de produto para os contratos individuais  */
update tab_aux_report
set rede = b.rede,
    tipo_produto = b.tipo_prod
from tab_aux_report a left join
     (select plano,subplano,rede,tipo_prod from tab_aux_planos group by plano,subplano,rede,tipo_prod) b
on a.cd_plano=b.plano and a.cd_subpl=b.subplano
where a.codigo_empresa='000000'


    
/* Preenchimento do campo de data_cancelamento_titular - somente contratos coletivos */
update tab_aux_report
set data_cancelamento_titular=b.dt_canc
from tab_aux_report a,
     quadro_social b
     where a.matricula=b.matricula and b.dep='00' and a.codigo_empresa<>'000000'

WAITFOR DELAY '00:00:01'
insert into golden_PJ..status_processos values ('Base Venda Diária','Iniciando Campos de Movimentação',getdate())

/* Inicializando os campos de movimentação */
update tab_aux_report
set movimentacao_ingresso=SPACE(0),
    movimentacao_stat_prop=SPACE(0),
    movimentacao_status=SPACE(0)


/* =============================================================================================== */
/* Preenchendo os 3 campos de movimentação                                                         */
/* =============================================================================================== */
/* =============================================================================================== */

/* Preenchimento do campo movimentacao_ingresso  */
/* venda - todos */

/* Regra antiga - substituida por regra fornecida em email de 22/12/2016 - (racional2.txt)
update tab_aux_report
set movimentacao_ingresso='VENDA'
where (ltrim(rtrim(upper(produto)))<>'ADESAO' and
      RIGHT(data_admissao_vida,6)=RIGHT(data_admissao_empresa,6)) or
      (ltrim(rtrim(upper(produto)))='ADESAO' and
      RIGHT(matricula_completa,2)='00') or
      (ltrim(rtrim(upper(produto)))='ADESAO' and
      RIGHT(matricula_completa,2)<>'00' and
      RIGHT(data_admissao_vida,6)=RIGHT(data_admissao_titular,6))

/* inclusão - todos */
update tab_aux_report
set movimentacao_ingresso='INCLUSAO'
where movimentacao_ingresso<>'VENDA'

*/
WAITFOR DELAY '00:00:01'
insert into golden_PJ..status_processos values ('Base Venda Diária','Preenchendo Campos de Movimentação',getdate())

/* Critérios para movimentacao_ingresso  */
/* vidas coletivo exceto adesão  */
update tab_aux_report
set movimentacao_ingresso='VENDA'
where ltrim(rtrim(upper(produto)))<>'ADESAO' and ltrim(rtrim(upper(produto)))<>'INDIVIDUAL' and
      right(data_admissao_vida,4)+substring(data_admissao_vida,3,2)=right(data_admissao_titular,4)+substring(data_admissao_titular,3,2) and
      right(data_admissao_vida,4)+substring(data_admissao_vida,3,2)=right(data_admissao_empresa,4)+substring(data_admissao_empresa,3,2)
      
update tab_aux_report
set movimentacao_ingresso='VENDA'
where ltrim(rtrim(upper(produto)))<>'ADESAO' and ltrim(rtrim(upper(produto)))<>'INDIVIDUAL' and
      right(data_admissao_vida,4)+substring(data_admissao_vida,3,2)<right(data_admissao_titular,4)+substring(data_admissao_titular,3,2) and
      right(data_admissao_titular,4)+substring(data_admissao_titular,3,2)=right(data_admissao_empresa,4)+substring(data_admissao_empresa,3,2)

update tab_aux_report
set movimentacao_ingresso='INCLUSAO'
where ltrim(rtrim(upper(produto)))<>'ADESAO' and ltrim(rtrim(upper(produto)))<>'INDIVIDUAL' and
      right(data_admissao_vida,4)+substring(data_admissao_vida,3,2)>right(data_admissao_empresa,4)+substring(data_admissao_empresa,3,2)

update tab_aux_report
set movimentacao_ingresso='INCLUSAO'
where ltrim(rtrim(upper(produto)))<>'ADESAO' and ltrim(rtrim(upper(produto)))<>'INDIVIDUAL' and
      right(data_admissao_vida,4)+substring(data_admissao_vida,3,2)=right(data_admissao_empresa,4)+substring(data_admissao_empresa,3,2) and
      right(data_admissao_titular,4)+substring(data_admissao_titular,3,2)>right(data_admissao_empresa,4)+substring(data_admissao_empresa,3,2)

/* Registros com data de implantação conforme a regra: Vida<Empresa<Titular   */
update tab_aux_report
set movimentacao_ingresso='INCLUSAO'
where right(data_admissao_titular,4)+substring(data_admissao_titular,3,2)>right(data_admissao_empresa,4)+substring(data_admissao_empresa,3,2) and 
      right(data_admissao_vida,4)+substring(data_admissao_vida,3,2)<right(data_admissao_empresa,4)+substring(data_admissao_empresa,3,2) and
      ltrim(rtrim(upper(produto)))<>'ADESAO' and ltrim(rtrim(upper(produto)))<>'INDIVIDUAL'

/* Registros com data de implantação conforme a regra: Vida<Empresa e Titular<Empresa   */
update tab_aux_report
set movimentacao_ingresso='VENDA'
where right(data_admissao_titular,4)+substring(data_admissao_titular,3,2)<right(data_admissao_empresa,4)+substring(data_admissao_empresa,3,2) and 
      right(data_admissao_vida,4)+substring(data_admissao_vida,3,2)<right(data_admissao_empresa,4)+substring(data_admissao_empresa,3,2) and
      ltrim(rtrim(upper(produto)))<>'ADESAO' and ltrim(rtrim(upper(produto)))<>'INDIVIDUAL'   

/* Critérios para movimentacao_ingresso  */
/* vidas adesão  */
update tab_aux_report
set movimentacao_ingresso='VENDA'
where ltrim(rtrim(upper(produto)))='ADESAO' and
      right(data_admissao_vida,4)+substring(data_admissao_vida,3,2)<=right(data_admissao_titular,4)+substring(data_admissao_titular,3,2)
 
update tab_aux_report
set movimentacao_ingresso='INCLUSAO'
where ltrim(rtrim(upper(produto)))='ADESAO' and
      right(data_admissao_vida,4)+substring(data_admissao_vida,3,2)>right(data_admissao_titular,4)+substring(data_admissao_titular,3,2)

/* Critérios para movimentacao_ingresso  */
/* vidas individuais  */
update tab_aux_report
set movimentacao_ingresso='VENDA'
where ltrim(rtrim(upper(produto)))='INDIVIDUAL' and
      right(data_admissao_vida,4)+substring(data_admissao_vida,3,2)=right(data_admissao_titular,4)+substring(data_admissao_titular,3,2)
      
update tab_aux_report
set movimentacao_ingresso='INCLUSAO'
where ltrim(rtrim(upper(produto)))='INDIVIDUAL' and
      right(data_admissao_vida,4)+substring(data_admissao_vida,3,2)>right(data_admissao_titular,4)+substring(data_admissao_titular,3,2)


checkpoint
        
/* Preenchimento do campo movimentacao_stat_prop  */
update tab_aux_report
set movimentacao_stat_prop='ACEITA'
where ltrim(rtrim(upper(status_proposta)))='6-IMPLANTADA'      

update tab_aux_report
set movimentacao_stat_prop='EM ACEITACAO'
where ltrim(rtrim(upper(status_proposta)))<>'6-IMPLANTADA' and 
      data_cancelamento_vida='00000000'

update tab_aux_report
set movimentacao_stat_prop='RECUSADA'
where ltrim(rtrim(upper(status_proposta)))<>'6-IMPLANTADA' and 
      data_cancelamento_vida<>'00000000'

checkpoint


/* Preenchimento do campo movimentacao_status  */
update tab_aux_report
set movimentacao_status='ATIVO'
where data_cancelamento_vida='00000000'
      
update tab_aux_report
set movimentacao_status='INATIVO'
where data_cancelamento_vida<>'00000000'

checkpoint

/* =============================================================================================== */


/* Preenchendo o valor - gerando tabela auxiliar de premio de venda */

/* Preenchendo o valor - a partir do item/subitem 10/23 Lançamento Primeira Mensalidade    /Preço de Tabela                     */
WAITFOR DELAY '00:00:01'
insert into golden_PJ..status_processos values ('Base Venda Diária','Gerando tabela de premio de venda - parte 1',getdate())


select matricula,dep,cd_item,cd_det_it,per_venc,per_cobr,valor 
into tab_aux_premio_venda
from premio
where cd_item='10' and cd_det_it='23' and per_cobr>=@anomes_corte and dt_canc='00000000'


/* Preenchendo o valor - a partir do item/subitem 10/23 Lançamento Primeira Mensalidade    /Preço de Tabela                     */
WAITFOR DELAY '00:00:01'
insert into golden_PJ..status_processos values ('Base Venda Diária','Gerando tabela de premio de venda - parte 2',getdate())

insert into tab_aux_premio_venda 
select matricula,dep,cd_item,cd_det_it,per_venc,per_cobr,valor 
from premio
where cd_item='11' and cd_det_it='23' and per_cobr>=@anomes_corte and dt_canc='00000000' and
      matricula+dep not in (select matricula+dep from tab_aux_premio_venda)

checkpoint

WAITFOR DELAY '00:00:01'
insert into golden_PJ..status_processos values ('Base Venda Diária','Preenchendo prêmio',getdate())

update tab_aux_report
set valor = b.valor
    from tab_aux_report a,
         tab_aux_premio_venda b
    where a.matricula_completa = b.matricula+b.dep and
          RIGHT(a.data_admissao_vida,4)+SUBSTRING(a.data_admissao_vida,3,2)=b.per_cobr

checkpoint



/* =============================================================================================== */


/* gera tabela auxiliar da estrutura de venda  */
WAITFOR DELAY '00:00:01'
insert into golden_PJ..status_processos values ('Base Venda Diária','Gerando tabela da estrutura de vendas',getdate())

select a.id_unico,
       a.cd_id,
       b.cgc as CNPJ_corretora,
       b.cd_id as codigo_corretora,
       b.nome as nome_corretora,
       b.tipo_empre as cod_tipo_corretora,
       CONVERT(varchar(50),'') as tipo_corretora,
       right(b.dt_admin,4)+SUBSTRING(b.dt_admin,3,2)+left(b.dt_admin,2) as data_admissao_corretora,
       right(b.dt_canc,4)+SUBSTRING(b.dt_canc,3,2)+left(b.dt_canc,2) as data_cancelamento_corretora,
       CASE WHEN b.dt_canc='00000000' THEN convert(varchar(10),'Ativo')
                                      ELSE convert(varchar(10),'Cancelado')
                                      end as status_corretora,
       CASE WHEN b.dt_canc<>'00000000' THEN DATEDIFF(MONTH,CONVERT(datetime,right(b.dt_admin,4)+substring(b.dt_admin,3,2)+left(b.dt_admin,2),112),CONVERT(datetime,right(b.dt_canc,4)+substring(b.dt_canc,3,2)+left(b.dt_canc,2),112))
                                       ELSE DATEDIFF(MONTH,CONVERT(datetime,right(b.dt_admin,4)+substring(b.dt_admin,3,2)+left(b.dt_admin,2),112),GETDATE())
                                       end as meses_ativo_corretora,
       c.cgc as CNPJ_equipe_repasse,
       c.cd_id as codigo_equipe_repasse,
       c.nome as nome_equipe_repasse,
       CASE WHEN c.id_reg='E' THEN convert(varchar(10),'Equipe')
                              ELSE convert(varchar(10),'Repasse')
                                      end as tipo_equipe_repasse,
       right(c.dt_admin,4)+SUBSTRING(c.dt_admin,3,2)+left(c.dt_admin,2) as data_admissao_equipe_repasse,
       right(c.dt_canc,4)+SUBSTRING(c.dt_canc,3,2)+left(c.dt_canc,2) as data_cancelamento_equipe_repasse,
       CASE WHEN c.dt_canc='00000000' THEN convert(varchar(10),'Ativo')
                                      ELSE convert(varchar(10),'Cancelado')
                                      end as status_equipe_repasse,
       CASE WHEN c.dt_canc<>'00000000' THEN DATEDIFF(MONTH,CONVERT(datetime,right(c.dt_admin,4)+substring(c.dt_admin,3,2)+left(c.dt_admin,2),112),CONVERT(datetime,right(c.dt_canc,4)+substring(c.dt_canc,3,2)+left(c.dt_canc,2),112))
                                       ELSE DATEDIFF(MONTH,CONVERT(datetime,right(c.dt_admin,4)+substring(c.dt_admin,3,2)+left(c.dt_admin,2),112),GETDATE())
                                       end as meses_ativo_equipe_repasse,
                                      
       a.cpf as cpf_vendedor,
       a.cd_id as codigo_vendedor,
       a.nome as nome_vendedor,
       a.cargo as cod_tipo_vendedor,
       CONVERT(varchar(50),'') as tipo_vendedor,
       right(a.dt_admin,4)+SUBSTRING(a.dt_admin,3,2)+left(a.dt_admin,2) as data_admissao_vendedor,
       right(a.dt_canc,4)+SUBSTRING(a.dt_canc,3,2)+left(a.dt_canc,2) as data_cancelamento_vendedor,
       a.stat_canc as cod_status_vendedor,
       CONVERT(varchar(50),'')  as status_vendedor,  
       CASE WHEN a.dt_canc<>'00000000' THEN DATEDIFF(MONTH,CONVERT(datetime,right(a.dt_admin,4)+substring(a.dt_admin,3,2)+left(a.dt_admin,2),112),CONVERT(datetime,right(a.dt_canc,4)+substring(a.dt_canc,3,2)+left(a.dt_canc,2),112))
                                       ELSE DATEDIFF(MONTH,CONVERT(datetime,right(a.dt_admin,4)+substring(a.dt_admin,3,2)+left(a.dt_admin,2),112),GETDATE())
                                       end as meses_ativo_vendedor     
into tab_aux_estrutura_venda
from golden_PJ..vendedor a,
     golden_PJ..corretora b,
     golden_PJ..ref c
where a.cd_corr=b.cd_id and
      a.cd_ref=c.cd_id 
      
/* Preenchendo o tipo da empresa de venda na tabela de estrutura de venda  */
update tab_aux_estrutura_venda
set tipo_corretora = b.descricao
from tab_aux_estrutura_venda a,
     tab_aux_tipo_empresa_venda b
where a.cod_tipo_corretora=b.codigo
       
update tab_aux_estrutura_venda
set tipo_corretora = cod_tipo_corretora
where tipo_corretora=''


/* Preenchendo o tipo do vendedor na tabela de estrutura de venda  */
update tab_aux_estrutura_venda
set tipo_vendedor = b.descricao
from tab_aux_estrutura_venda a,
     tab_aux_tipo_vendedor b
where a.cod_tipo_vendedor=b.codigo
       
update tab_aux_estrutura_venda
set tipo_vendedor = cod_tipo_vendedor
where tipo_vendedor=''

/* Preenchendo o status do vendedor na tabela de estrutura de venda  */
update tab_aux_estrutura_venda
set status_vendedor = b.descricao
from tab_aux_estrutura_venda a,
     tab_aux_status_vendedor b
where a.cod_status_vendedor=b.codigo

update tab_aux_estrutura_venda
set status_vendedor = cod_status_vendedor
where status_vendedor=''       

checkpoint
/* =============================================================================================== */
/* gera tabela definitiva de saida  */
WAITFOR DELAY '00:00:01'
insert into golden_PJ..status_processos values ('Base Venda Diária','Gerando tabela da saida final',getdate())

/* SUBSTITUIDAS NO ARQUIVO FINAL AS DATAS NO FORMATO <DDMMAAAA> POR <AAAAMM> */
SELECT a.matricula
      ,a.matricula_completa
      ,a.cpf
      ,a.codigo_empresa
      ,a.CNPJ_empresa
      ,a.codigo_holding
      ,a.CNPJ_holding
      ,a.ano_venda
      ,a.mes_venda
      ,a.dia_venda
      /*                                                                                                                 */
      /* v05 - Datas abaixo modificadas de AAAAMM para AAAAMMDD conforme email enviado pela Jéssica/DEMAC em 19/01/2017  */
      /*                                                                                                                 */
      ,right(a.data_admissao_vida       ,4)+substring(a.data_admissao_vida       ,3,2)+left(a.data_admissao_vida       ,2)     as data_admissao_vida       
      ,right(a.data_admissao_titular    ,4)+substring(a.data_admissao_titular    ,3,2)+left(a.data_admissao_titular    ,2)     as data_admissao_titular    
      ,right(a.data_implantacao_vida    ,4)+substring(a.data_implantacao_vida    ,3,2)+left(a.data_implantacao_vida    ,2)     as data_implantacao_vida    
      ,right(a.data_cancelamento_vida   ,4)+substring(a.data_cancelamento_vida   ,3,2)+left(a.data_cancelamento_vida   ,2)     as data_cancelamento_vida   
      ,right(a.data_venda_empresa       ,4)+substring(a.data_venda_empresa       ,3,2)+left(a.data_venda_empresa       ,2)     as data_venda_empresa       
      ,right(a.data_implantacao_empresa ,4)+substring(a.data_implantacao_empresa ,3,2)+left(a.data_implantacao_empresa ,2)     as data_implantacao_empresa 
      ,right(a.data_admissao_empresa    ,4)+substring(a.data_admissao_empresa    ,3,2)+left(a.data_admissao_empresa    ,2)     as data_admissao_empresa    
      ,right(a.data_cancelamento_empresa,4)+substring(a.data_cancelamento_empresa,3,2)+left(a.data_cancelamento_empresa,2)     as data_cancelamento_empresa
      ,a.relacao_comercial
      ,a.rede
      ,a.tipo_produto
      ,a.produto
      ,a.status_proposta
      ,a.status_vida
      ,a.valor
      ,a.movimentacao_ingresso
      ,a.movimentacao_stat_prop
      ,a.movimentacao_status   
      ,b.CNPJ_corretora
      ,b.codigo_corretora
      ,b.nome_corretora
      ,b.tipo_corretora
      ,b.data_admissao_corretora
      ,b.data_cancelamento_corretora
      ,b.status_corretora
      ,b.meses_ativo_corretora
      ,b.CNPJ_equipe_repasse
      ,b.codigo_equipe_repasse
      ,b.nome_equipe_repasse
      ,b.tipo_equipe_repasse
      ,b.data_admissao_equipe_repasse
      ,b.data_cancelamento_equipe_repasse
      ,b.status_equipe_repasse
      ,b.meses_ativo_equipe_repasse
      ,b.cpf_vendedor
      ,a.cod_vendedor as codigo_vendedor
      ,b.nome_vendedor
      ,b.tipo_vendedor
      ,b.data_admissao_vendedor
      ,b.data_cancelamento_vendedor
      ,b.status_vendedor
      ,b.meses_ativo_vendedor
      ,a.cd_plano
      ,a.cd_subpl
into tab_aux_report_saida
FROM tab_aux_report a left join tab_aux_estrutura_venda b
on a.cod_vendedor = b.cd_id

checkpoint


/* Gera arquivo de saida e copia o mesmo para a área de transferência  */
declare @linha_comando varchar(2000) 
declare @var_data_arquivo varchar(20)

set @var_data_arquivo =  convert(varchar(8),GETDATE(),112)

/* Gerando arquivo de dados e concatenando com cabeçalho  */
WAITFOR DELAY '00:00:01'
insert into golden_PJ..status_processos values ('Base Venda Diária','Apagando arquivos texto anteriores',getdate())

set @linha_comando = 'del E:\fabrica_golden_V02\2proc\base_vendas_'+@var_data_arquivo+'.txt'
EXECUTE master..xp_cmdshell @linha_comando
EXECUTE master..xp_cmdshell 'del E:\fabrica_golden_V02\2proc\passo30_arquivo_report_dados.txt'
EXECUTE master..xp_cmdshell 'del E:\fabrica_golden_V02\2proc\passo30_arquivo_report.txt'

WAITFOR DELAY '00:00:01'
insert into golden_PJ..status_processos values ('Base Venda Diária','Gerando arquivo de dados TXT',getdate())
EXECUTE master..xp_cmdshell 'bcp "select * from golden_PJ_diario..tab_aux_report_saida" queryout E:\fabrica_golden_V02\2proc\passo30_arquivo_report_dados.txt -c -CACP -Smkrjs006 -Usa -Pmktec'

WAITFOR DELAY '00:00:01'
insert into golden_PJ..status_processos values ('Base Venda Diária','Concatenando header e dados',getdate())
EXECUTE master..xp_cmdshell 'copy /b E:\fabrica_golden_V02\2proc\passo30_arquivo_report_header.txt+E:\fabrica_golden_V02\2proc\passo30_arquivo_report_dados.txt E:\fabrica_golden_V02\2proc\passo30_arquivo_report.txt'


/* Renomenando arquivo para o formato base_vendas_<aaaammdd>.txt   */
WAITFOR DELAY '00:00:01'
insert into golden_PJ..status_processos values ('Base Venda Diária','Renomeando arquivo de saída',getdate())
set @linha_comando = 'ren E:\fabrica_golden_V02\2proc\passo30_arquivo_report.txt base_vendas_'+@var_data_arquivo+'.txt'
EXECUTE master..xp_cmdshell @linha_comando

/* Apagando arquivo de dados   */
WAITFOR DELAY '00:00:01'
insert into golden_PJ..status_processos values ('Base Venda Diária','Apagando arquivo de dados',getdate())
EXECUTE master..xp_cmdshell 'del E:\fabrica_golden_V02\2proc\passo30_arquivo_report_dados.txt'


/* Apagando arquivo final com nome base_vendas_<aaaammdd>.txt na pasta destino e movendo o novo arquivo   */
WAITFOR DELAY '00:00:01'
insert into golden_PJ..status_processos values ('Base Venda Diária','Apagando arquivo final anterior na pasta de entrega',getdate())
set @linha_comando = 'del E:\!Pastas_Compartilhadas\pasta_DEMAC\2017_DEMANDAS_REALIZADAS\base_diaria_vendas\base_vendas_'+@var_data_arquivo+'.txt'
EXECUTE master..xp_cmdshell @linha_comando

WAITFOR DELAY '00:00:01'
insert into golden_PJ..status_processos values ('Base Venda Diária','Copiando arquivo final para pasta de entrega',getdate())
set @linha_comando = 'move /Y E:\fabrica_golden_V02\2proc\base_vendas_'+@var_data_arquivo+'.txt E:\!Pastas_Compartilhadas\pasta_DEMAC\2017_DEMANDAS_REALIZADAS\base_diaria_vendas\base_vendas_'+@var_data_arquivo+'.txt'
EXECUTE master..xp_cmdshell @linha_comando


/* Apaga tabelas temporárias  */      
WAITFOR DELAY '00:00:01'
insert into golden_PJ..status_processos values ('Base Venda Diária','Apagando tabelas temporárias',getdate())

if exists (select * from dbo.sysobjects where id = object_id(N'tab_aux_relacao_comercial') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table tab_aux_relacao_comercial

if exists (select * from dbo.sysobjects where id = object_id(N'tab_aux_tipo_empresa_venda') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table tab_aux_tipo_empresa_venda

if exists (select * from dbo.sysobjects where id = object_id(N'tab_aux_tipo_vendedor') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table tab_aux_tipo_vendedor

if exists (select * from dbo.sysobjects where id = object_id(N'tab_aux_status_vendedor') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table tab_aux_status_vendedor

if exists (select * from dbo.sysobjects where id = object_id(N'tab_aux_estrutura_venda') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table tab_aux_estrutura_venda

if exists (select * from dbo.sysobjects where id = object_id(N'tab_aux_planos') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table tab_aux_planos

if exists (select * from dbo.sysobjects where id = object_id(N'tab_aux_premio_venda') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table tab_aux_premio_venda

if exists (select * from dbo.sysobjects where id = object_id(N'tab_aux_report') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table tab_aux_report

if exists (select * from dbo.sysobjects where id = object_id(N'tab_aux_report_saida') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table tab_aux_report_saida


checkpoint

WAITFOR DELAY '00:00:01'
insert into golden_PJ..status_processos values ('Base Venda Diária','Término',getdate())

/*  término da rotina   */


