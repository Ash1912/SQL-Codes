DECLARE
    v_discount Product.Discount%TYPE;
    v_price Product.Final_price%TYPE;
    v_final_price Product.Final_price%TYPE;
    v_product_id Product.Product_id%TYPE;
BEGIN
    FOR i IN (SELECT * FROM Product WHERE Discount = 0)
    LOOP
        v_discount := 15;
        v_price := i.price;
        v_final_price := v_price + (v_price * v_discount / 100);
        v_product_id := i.Product_id;
        UPDATE Product SET Discount = v_discount, Final_price = v_final_price WHERE Product_id = v_product_id;
    END LOOP;
END;
/