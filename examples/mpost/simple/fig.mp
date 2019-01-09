verbatimtex
%&latex  % must begin with %
\documentclass{article}
\usepackage{amssymb}
% \usepackage{CJK}
% \begin{CJK}{GBK}{song}
\begin{document}
etex

beginfig(1);
  u := 4cm;
  pair a, b, c, d;
  a := (0, 0);
  b := (u, 0);
  c := (u, u);
  d := (0, u);
  draw a -- b -- c -- d -- a;
  drawarrow a -- c;
  label.urt(btex $\mathbb C$ etex, c);
endfig;

verbatimtex
% \end{CJK}
\end{document}
etex

end.
