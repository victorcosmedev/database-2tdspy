set serveroutput on;
set verify off;


// Exercicio 1
DECLARE
    v_sal_atual NUMBER(11,2) := &salario;
    v_sal_reajuste v_sal_atual%type;
BEGIN
    v_sal_reajuste := v_sal_atual * 1.25;
    dbms_output.put_line('O salário anterior era de ' || v_sal_atual || ' e o salário corrigido é de ' || v_sal_reajuste);
END;

// Exercicio 2
DECLARE
    v_valor_cambio NUMBER(5, 2) := &input_cambio;
    v_valor_dolar NUMBER(10, 2) := &input_dolar;
BEGIN
    dbms_output.put_line('Valor do câmbio dólar: U$' || v_valor_cambio);
    dbms_output.put_line('Valor em dólar: U$' || v_valor_dolar);
    dbms_output.put_line('Valor convertido em reais: R$' || v_valor_dolar * v_valor_cambio);
END;

DECLARE 
    v_valor_compra NUMBER(8,2) := &valor_compra;
    v_montante_final v_valor_compra%type;
BEGIN
    v_montante_final := v_valor_compra * 1.03;
    dbms_output.put_line('O montante final é de R$' || v_montante_final || ' e o valor dividido em 10 parcelas é de R$' || v_montante_final / 10);
END;

DECLARE 
    v_valor_compra NUMBER(8, 2) := &valor_compra * 0.8;
    v_valor_parcela v_valor_compra%type;
BEGIN
    v_valor_parcela := v_valor_compra * 1.1;
    dbms_output.put_line('Valor total a parcelar: R$' || v_valor_parcela || '. Valor dividido em 6 parcelas: R$' || v_valor_parcela / 6);
    
    v_valor_parcela := v_valor_compra * 1.15;
    dbms_output.put_line('Valor total a parcelar: R$' || v_valor_parcela || '. Valor dividido em 12 parcelas: R$' || v_valor_parcela / 12);
    
    v_valor_parcela := v_valor_compra * 1.2;
    dbms_output.put_line('Valor total a parcelar: R$' || v_valor_parcela || '. Valor dividido em 18 parcelas: R$' || v_valor_parcela / 18);

END;

