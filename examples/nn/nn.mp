% neural network

u := .8cm;

vardef arr(expr p, q) =
  (p + .5u * dir(angle(q - p))) -- (q + .5u * dir(angle(p - q)))
enddef;

numeric l; % grid size
numeric r; % node size
r := 0.4 cm;
l := 1.2 cm;

path ubox;
ubox := unitsquare shifted (-.5, -.5);

def draw_node(expr b, g, m) =
    pair pos;
    pos := g * l;
    draw b scaled r shifted pos;
    label(m, pos);
enddef;

def draw_tensor_node(expr t, g) =
    draw_node(ubox, g, t);
enddef;

def draw_op_node(expr t, g) =
    draw_node(fullcircle, g, t);
enddef;

def draw_edge(expr p, q) =
    pair margin;
    pair start;
    pair stop;
    margin := (q - p) * r * .5;
    start := p * l + margin;
    stop := q * l - margin;
    drawarrow start -- stop;
enddef;

def draw_styled_bbox(expr gll, gur) (text style) =
    pair margin, ll, ur;
    margin := (right + up) * .4;
    ll := (gll - margin) * l;
    ur := (gur + margin) * l;
    draw ll -- (xpart(ur), ypart(ll)) -- ur -- (xpart(ll), ypart(ur)) -- cycle style;
enddef;

def draw_bbox(expr gll, gur) =
    draw_styled_bbox(gll, gur, dashed evenly);
enddef;

def draw_right_connect(expr m) =
    cur := cur + right;
    draw_edge(cur - right, cur);
    draw_tensor_node(m, cur);
enddef;

def draw_rewind_connect =
    pair start, p, q, stop, h;
    numeric margin;
    h := level_up / 3;

    margin := .5;
    start := cur - margin * up * r / l;
    p := cur + h;
    q := level + h;
    stop := level + level_up + margin * up * r / l;

    draw start * l -- p * l;
    draw p * l -- q * l;
    drawarrow q * l -- stop * l;
enddef;

def crlf =
    level := level + level_up;
    cur := level;
enddef;

def draw_unary_op(expr op) =
    cur := cur + right;
    draw_edge(cur - right, cur);
    draw_op_node(op, cur);
enddef;

def draw_binary_op(expr op, param) =
    cur := cur + right;
    draw_edge(cur - right, cur);
    draw_op_node(op, cur);
    draw_edge(cur + up, cur);
    draw_tensor_node(param, cur + up);
enddef;

def draw_relu_unit =
    draw_unary_op(btex $r$ etex);
enddef;

def draw_pool_unit =
    draw_unary_op(btex $p$ etex);
enddef;

def draw_dense_unit =
    draw_binary_op(btex $\times$ etex, btex $W$ etex);
    draw_right_connect("");
    draw_binary_op(btex $+$ etex, btex $b$ etex);
enddef;

def draw_conv_unit =
    draw_binary_op(btex $\circ$ etex, btex $W$ etex);
    draw_right_connect("");
    draw_binary_op(btex $+$ etex, btex $b$ etex);
enddef;

def draw_dense_layer(expr act) =
    draw_dense_unit;
    draw_right_connect("");
    draw_unary_op(act);
enddef;

def draw_conv_layer =
    draw_conv_unit;
    draw_right_connect("");
    draw_relu_unit;
    draw_right_connect("");
    draw_pool_unit;
enddef;

def draw_unit_box(expr ll, wh) =
    draw_bbox(ll, ll + wh);
enddef;

def draw_notes(expr m) =
    pair pos;
    pos := (level + up * .5 - right) * l;
    label(m, pos);
enddef;
