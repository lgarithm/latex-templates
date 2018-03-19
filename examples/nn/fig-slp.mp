beginfig(1);
    % expression diagram
    pair cur;

    cur := origin;
    draw_tensor_node(btex $X$ etex, cur);
    draw_dense_layer(btex $S$ etex);
    draw_right_connect(btex $Y$ etex);

    draw_tensor_node(btex $Y^\prime$ etex, cur - up * 2);

    cur := cur + right - up;
    draw_edge(cur - right + up, cur);
    draw_edge(cur - right - up, cur);
    draw_op_node(btex $H$ etex, cur);

    cur := cur + right;
    draw_edge(cur - right, cur);
    draw_tensor_node(btex $L$ etex, cur);

    cur := cur - right + up * 2;
    draw_edge(cur - right - up, cur);
    draw_op_node(btex $A$ etex, cur);

    cur := cur + right;
    draw_edge(cur - right, cur);
    draw_tensor_node(btex $i$ etex, cur);

    draw_styled_bbox((1, 0), (5, 1), dashed evenly);

    label(btex $Y = WX + b$ etex, (2, 2) * l);
endfig;
