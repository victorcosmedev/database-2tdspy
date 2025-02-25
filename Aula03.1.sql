//OBRIGATORIO PARA FUNCIONAMENTO

set serveroutput on; -- habilita o servidor de saída de dados
 
set VERIFY off; -- desabilita a verificação da vm

// CRIACAO E CARGA
CREATE TABLE ALUNO(
RA CHAR(2),
NOME VARCHAR2(50),
CONSTRAINT ALUNO_PK PRIMARY KEY(RA)
);

INSERT INTO ALUNO (RA, NOME) VALUES ('11', 'Antonio Alves');
INSERT INTO ALUNO (RA, NOME) VALUES ('22', 'Beatriz Bernardes');
INSERT INTO ALUNO (RA, NOME) VALUES ('33', 'Cláudio Cardoso');

// SELECT DINAMICO
declare 
    v_ra CHAR(2) := '11';
    v_nome VARCHAR2(50);
begin
    select nome into v_nome from aluno where ra <= v_ra;
    dbms_output.put_line('O nome do aluno é: ' || v_nome); 
end;

// INSERT DINAMICO
declare 
    v_ra CHAR(2) := '44';
    v_nome VARCHAR2(50) := 'Daniela Dorneles';
begin
    insert into aluno (ra, nome) values (v_ra, v_nome);
end;

SELECT * FROM ALUNO;

// UPDATE DINAMICO
declare
    v_ra CHAR(2) := '11';
    v_nome VARCHAR2(50) := 'Antonio Rodrigues';
begin
    update aluno set nome = v_nome where ra = v_ra;
end;

SELECT * FROM ALUNO;

// DELETE DINAMICO
declare
    v_ra CHAR(2) := '44';
begin
    delete from aluno where ra = v_ra;
end;

SELECT * FROM ALUNO;


CREATE TABLE tb_faculdade(
    rm varchar2(1),
    nm_disc VARCHAR2(15),
    cp1 NUMBER(4,2),
    cp2 NUMBER(4,2),
    cp3 NUMBER(4,2),
    media NUMBER(4,2),
    situacao VARCHAR(3)
);
    
begin
    INSERT INTO tb_faculdade (rm, nm_disc, cp1, cp2, cp3) VALUES ('1', 'BD', 10, 10, 10);
    INSERT INTO tb_faculdade (rm, nm_disc, cp1, cp2, cp3) VALUES ('1', 'IA', 7.6, 8.2, 10);
    INSERT INTO tb_faculdade (rm, nm_disc, cp1, cp2, cp3) VALUES ('1', 'Front', 4.1, 2.2, 1.4);
    INSERT INTO tb_faculdade (rm, nm_disc, cp1, cp2, cp3) VALUES ('1', 'Java', 5.0, 5.0, 5.0);
end;

SELECT * FROM TB_FACULDADE;

declare
    v_nm_disc VARCHAR2(15) := 'Java';
    v_media NUMBER(4,2);
    v_cp1 NUMBER(4,2);
    v_cp2 NUMBER(4, 2);
    v_cp3 NUMBER(4,2);
    v_percentual_faltas NUMBER(4, 2);
    v_carga_hora NUMBER(4, 2);
    v_faltas NUMBER(4, 2);
begin
    select cp1, cp2, cp3 
    into v_cp1, v_cp2, v_cp3 
    from tb_faculdade 
    where nm_disc LIKE v_nm_disc;
    
    v_media := (v_cp1 + v_cp2 + v_cp3) / 3;
    update tb_faculdade set media = v_media where nm_disc = v_nm_disc;
    
    select carga_hora, faltas 
    into v_carga_hora, v_faltas
    where nm_disc like v_nm_disc;
    
    v_percentual_faltas := (v_faltas / v_carga_hora) * 100;
    
    if v_percentual_faltas > 25 then
        if v_media > 7.0 then
            update tb_faculdade set situacao = 'A' where nm_disc = v_nm_disc;
        ELSIF v_media >= 5.0 and v_media <= 6.9 then
            update tb_faculdade set situacao = 'EX' where nm_disc = v_nm_disc;
        ELSE
            update tb_faculdade set situacao = 'REP' where nm_disc = v_nm_disc;
        END IF;
    else
        update tb_faculdade set situacao = 'REP' where nm_disc = v_nm_disc;
    end if;
end;

ALTER TABLE tb_faculdade
ADD carga_hora NUMBER(3);

ALTER TABLE tb_faculdade
ADD faltas NUMBER(3);

begin
    update tb_faculdade set carga_hora = 160, faltas = 20 where nm_disc = 'BD';
    update tb_faculdade set carga_hora = 80, faltas = 40 where nm_disc = 'IA';
    update tb_faculdade set carga_hora = 160, faltas = 80 where nm_disc = 'Front';
    update tb_faculdade set carga_hora = 160, faltas = 25 where nm_disc = 'Java';
end;






