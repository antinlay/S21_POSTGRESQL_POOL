CREATE VIEW v_generated_dates AS
SELECT dt.day::date AS generate_date
FROM generate_series('2022-01-01', '2022-01-31', interval '1 day') AS dt(day)
ORDER BY 1