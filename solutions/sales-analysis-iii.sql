CREATE TABLE IF NOT EXISTS Product (
    product_id int,
    product_name varchar(10),
    unit_price int
);
CREATE TABLE IF NOT EXISTS Sales (
    seller_id int,
    product_id int,
    buyer_id int,
    sale_date date,
    quantity int,
    price int
);
INSERT INTO
    Product (product_id, product_name, unit_price)
VALUES
    ('1', 'S8', '1000');
INSERT INTO
    Product (product_id, product_name, unit_price)
VALUES
    ('2', 'G4', '800');
INSERT INTO
    Product (product_id, product_name, unit_price)
VALUES
    ('3', 'iPhone', '1400');
INSERT INTO
    Sales (
        seller_id,
        product_id,
        buyer_id,
        sale_date,
        quantity,
        price
    )
VALUES
    ('1', '1', '1', '2019-01-21', '2', '2000');
INSERT INTO
    Sales (
        seller_id,
        product_id,
        buyer_id,
        sale_date,
        quantity,
        price
    )
VALUES
    ('1', '2', '2', '2019-02-17', '1', '800');
INSERT INTO
    Sales (
        seller_id,
        product_id,
        buyer_id,
        sale_date,
        quantity,
        price
    )
VALUES
    ('2', '2', '3', '2019-06-02', '1', '800');
INSERT INTO
    Sales (
        seller_id,
        product_id,
        buyer_id,
        sale_date,
        quantity,
        price
    )
VALUES
    ('3', '3', '4', '2019-05-13', '2', '2800');
SELECT
    p.product_id,
    p.product_name
FROM
    Product p
    LEFT JOIN Sales s ON s.product_id = p.product_id
GROUP BY
    p.product_id, p.product_name
HAVING
    max(s.sale_date) <= '2019-03-31'
    AND min(s.sale_date) >= '2019-01-01';