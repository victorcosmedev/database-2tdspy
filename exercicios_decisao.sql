set serveroutput on;
set verify off;

DECLARE
    v_nota NUMBER(4,2) := &nota;
BEGIN
    if v_nota >= 7 then
        dbms_output.put_line('Aprovado');
    elsif v_nota >= 5 then
        dbms_output.put_line('Recuperação');
    else
        dbms_output.put_line('Reprovado');
    end if;
END;


DECLARE
    v_numero NUMBER(10,2) := &numero;
BEGIN
    if v_numero > 0 then
        dbms_output.put_line('Número ' || v_numero || ' é positivo.');
    elsif v_numero = 0 then
        dbms_output.put_line('Zero.');
    else
        dbms_output.put_line('Número ' || v_numero || ' é negativo');
    end if;
END;

DECLARE
    v_salario NUMBER(10, 2) := &salario;
    v_tempo_empresa NUMBER(2) := &tempo_empresa;
BEGIN
    if v_tempo_empresa > 5 then
        v_salario := v_salario * 1.1;
        dbms_output.put_line('Salário reajustado: R$' || v_salario);
    elsif v_tempo_empresa > 3 then
        v_salario := v_salario * 1.05;
        dbms_output.put_line('Salário reajustado: R$' || v_salario);
    else
        dbms_output.put_line('Salário não sofreu reajuste. ');
    end if;

END;