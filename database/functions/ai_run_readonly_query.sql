CREATE OR REPLACE FUNCTION "AI_RUN_READONLY_QUERY" (p_sql IN VARCHAR2) RETURN CLOB IS
  l_sql       VARCHAR2(4000) := TRIM(p_sql);
  l_cursor    INTEGER;
  l_col_cnt   INTEGER;
  l_desc_tab  DBMS_SQL.DESC_TAB;
  l_result    CLOB := '';
  l_value     VARCHAR2(4000);
  l_status    INTEGER;
  l_rows      PLS_INTEGER := 0;
  l_max_rows  CONSTANT PLS_INTEGER := 50;
BEGIN
  IF l_sql IS NULL THEN
    RETURN 'Error: no SQL provided.';
  END IF;

  IF INSTR(UPPER(l_sql), 'SELECT') != 1 THEN
    RETURN 'Error: only SELECT statements are allowed.';
  END IF;

  IF REGEXP_LIKE(UPPER(l_sql), '(INSERT|UPDATE|DELETE|MERGE|DROP|ALTER|CREATE|TRUNCATE|GRANT|REVOKE|EXECUTE|CALL)') THEN
    RETURN 'Error: only read-only SELECT statements are allowed.';
  END IF;

  IF INSTR(l_sql, ';') > 0 THEN
    RETURN 'Error: multiple statements are not allowed.';
  END IF;

  l_cursor := DBMS_SQL.OPEN_CURSOR;
  BEGIN
    DBMS_SQL.PARSE(l_cursor, l_sql, DBMS_SQL.NATIVE);
  EXCEPTION WHEN OTHERS THEN
    DBMS_SQL.CLOSE_CURSOR(l_cursor);
    RETURN 'SQL error: '||SQLERRM;
  END;

  DBMS_SQL.DESCRIBE_COLUMNS(l_cursor, l_col_cnt, l_desc_tab);
  FOR i IN 1..l_col_cnt LOOP
    DBMS_SQL.DEFINE_COLUMN(l_cursor, i, l_value, 4000);
  END LOOP;

  FOR i IN 1..l_col_cnt LOOP
    l_result := l_result || l_desc_tab(i).col_name;
    IF i < l_col_cnt THEN l_result := l_result || ' | '; END IF;
  END LOOP;
  l_result := l_result || CHR(10);

  l_status := DBMS_SQL.EXECUTE(l_cursor);
  LOOP
    EXIT WHEN DBMS_SQL.FETCH_ROWS(l_cursor) = 0 OR l_rows >= l_max_rows;
    FOR i IN 1..l_col_cnt LOOP
      DBMS_SQL.COLUMN_VALUE(l_cursor, i, l_value);
      l_result := l_result || l_value;
      IF i < l_col_cnt THEN l_result := l_result || ' | '; END IF;
    END LOOP;
    l_result := l_result || CHR(10);
    l_rows := l_rows + 1;
  END LOOP;
  DBMS_SQL.CLOSE_CURSOR(l_cursor);

  IF l_rows = 0 THEN
    l_result := l_result || '(no rows)';
  ELSIF l_rows >= l_max_rows THEN
    l_result := l_result || '... (truncated at '||l_max_rows||' rows, refine your query with more filters)';
  END IF;

  RETURN l_result;
EXCEPTION WHEN OTHERS THEN
  IF DBMS_SQL.IS_OPEN(l_cursor) THEN
    DBMS_SQL.CLOSE_CURSOR(l_cursor);
  END IF;
  RETURN 'Error executing query: '||SQLERRM;
END ai_run_readonly_query;
/
