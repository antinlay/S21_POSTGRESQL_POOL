UPDATE menu
SET price = TRUNC(price * 0.9)
WHERE pizza_name = 'greek pizza';