set serveroutput on;
set verify off;

DECLARE 
    v_id NUMBER(5) := &id;
    v_nome_livro VARCHAR(50);
BEGIN
    SELECT titulo INTO v_nome_livro
    FROM LIVROS
    WHERE id_livro = v_id;
    
    dbms_output.put_line('O livro selecionado é ' || v_nome_livro);
END;

DECLARE
    v_id NUMBER(5) := &id;
    v_genero VARCHAR(50) := '&genero';
    v_titulo v_genero%type;
BEGIN
    UPDATE livros SET genero = v_genero WHERE id_livro = v_id;
    
    SELECT titulo, genero INTO v_titulo, v_genero
    FROM livros
    WHERE id_livro = v_id;
    
    dbms_output.put_line('Novo gênero de ' || v_titulo || ' é ' || v_genero);
END;


DECLARE
    v_titulo VARCHAR(50) := '&titulo';
BEGIN
    DELETE FROM livros where titulo = v_titulo;
END;


DECLARE 
    v_autor VARCHAR(100) := '&autor';
    v_titulo v_autor%type := '&titulo';
    v_ano_publicacao v_autor%type := &ano_publicacao;
    v_genero v_autor%type := '&genero';
BEGIN
    INSERT INTO livros (autor, titulo, ano_publicacao, genero) VALUES (v_autor, v_titulo, v_ano_publicacao, v_genero);
END;

SELECT * FROM livros;