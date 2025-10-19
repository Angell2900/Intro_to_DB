USE alx_book_store;

SELECT 
    column_name AS 'Column',
    column_type AS 'Type',
    is_nullable AS 'Nullable',
    column_key AS 'Key',
    extra AS 'Extra'
FROM information_schema.columns
WHERE table_schema = 'alx_book_store'
  AND table_name = 'Books';
