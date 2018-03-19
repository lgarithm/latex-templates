beginfig(2);
    pair level, cur;
    pair level_up;
    level_up := -up * 3;

    % conv layers
    level := origin;
    cur := level;
    draw_tensor_node(btex $X$ etex, cur);
    draw_conv_layer;
    draw_unit_box(level + right, (6, 1));
    draw_notes(btex $conv_1$ etex);
    draw_rewind_connect;

    level := level + level_up;
    cur := level;
    draw_tensor_node("", cur);
    draw_conv_layer;
    draw_unit_box(level + right, (6, 1));
    draw_notes(btex $conv_2$ etex);
    draw_rewind_connect;

    level := level + level_up;
    cur := level;
    draw_tensor_node("", cur);
    draw_conv_layer;
    draw_unit_box(level + right, (6, 1));
    draw_notes(btex $conv_3$ etex);
    draw_rewind_connect;

    % dense layers
    level := level + level_up;
    cur := level;
    draw_tensor_node("", cur);
    draw_dense_layer(btex $r$ etex);
    draw_unit_box(level + right, (4, 1));
    draw_notes(btex $dense_1$ etex);
    draw_rewind_connect;

    level := level + level_up;
    cur := level;
    draw_tensor_node("", cur);
    draw_dense_layer(btex $S$ etex);
    draw_unit_box(level + right, (4, 1))
    draw_notes(btex $dense_2$ etex);

    draw_right_connect(btex $Y$ etex);
endfig;
