CREATE OR REPLACE FUNCTION public.buy_ticket(
    p_first_name TEXT,
    p_last_name TEXT,
    p_email TEXT,
    p_phone TEXT,
    p_exhibition_id INTEGER,
    p_price DECIMAL
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_visitor_id INTEGER;
    v_ticket_id INTEGER;
    v_result JSONB;
BEGIN
    -- Найти существующего посетителя по email или телефону
    SELECT id INTO v_visitor_id
    FROM art_galery.Visitors
    WHERE email = p_email OR phone = p_phone
    LIMIT 1;

    -- Если не найден – создать
    IF v_visitor_id IS NULL THEN
        INSERT INTO art_galery.Visitors (first_name, last_name, email, phone)
        VALUES (p_first_name, p_last_name, p_email, p_phone)
        RETURNING id INTO v_visitor_id;
    END IF;

    -- Вставить билет и получить его ID
    INSERT INTO art_galery.Tickets (exhibition_id, visitor_id, purchase_date, price, status)
    VALUES (p_exhibition_id, v_visitor_id, CURRENT_DATE, p_price, 'bought')
    RETURNING id INTO v_ticket_id;

    -- Формируем JSON с нужными полями
    v_result := jsonb_build_object(
        'success', true,
        'ticket_id', v_ticket_id,
        'price', p_price,
        'visitor_id', v_visitor_id
    );
    RETURN v_result;
EXCEPTION
    WHEN OTHERS THEN
        RETURN jsonb_build_object('success', false, 'error', SQLERRM);
END;
$$;