set serveroutput on; -- habilita o servidor de saída de dados
 
set VERIFY off; -- desabilita a verificação da vm

declare
    v_contador number(2) := 1;
begin
loop
    dbms_output.put_line(v_contador);
    v_contador := v_contador + 1;
    exit when v_contador > 20;
end loop;
end;

declare 
    v_contador number(2) := 1;
begin
    while v_contador <= 20 loop
        dbms_output.put_line(v_contador);
        v_contador := v_contador + 1;
    end loop;
end;


begin
    for v_contador in 1..20 loop
        dbms_output.put_line(v_contador);
    end loop;
end;

begin
    for v_contador in reverse 1..20 loop
        dbms_output.put_line(v_contador);
    end loop;
end;

declare
    v_numerador number(2) := &entrada;
begin
    for v_contador in 1..10 loop
        dbms_output.put_line(v_numerador || 'X' || v_contador || ' = ' || v_numerador * v_contador);
    end loop;
end;

declare 
    v_max number(2) := &entrada;
    v_min v_max%type := &entrada2;
    v_quant_pares v_max%type := 0;
    v_quant_impares v_max%type := 0;
begin
    for v_contador in v_min..v_max loop
        dbms_output.put_line(v_contador);
        if MOD(v_contador, 2) = 0 then
            v_quant_pares := v_quant_pares + 1;
        else
            v_quant_impares := v_quant_impares + 1;
        end if;
    end loop;
    
    dbms_output.put_line('Quantidade de números pares: ' || v_quant_pares);
    dbms_output.put_line('Quantidade de números impares: ' || v_quant_impares);

end;

declare
    v_min v_max%type := &entrada;
    v_max number(3) := &entradadois;

    v_soma_numeros_pares v_max%type := 0;
begin
    for v_contador in v_min..v_max loop
        dbms_output.put_line(v_contador);

        if MOD(v_contador, 2) = 0 then
            v_soma_numeros_pares := v_soma_numeros_pares + v_contador;
        end if;
    end loop;

    dbms_output.put_line(v_soma_numeros_pares);

end;


