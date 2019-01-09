verbatimtex
%&latex  % must begin with %
\documentclass{article}
\usepackage{amssymb}
% \usepackage{CJK}
% \begin{CJK}{GBK}{song}
\begin{document}
etex

input ../../../macros/list.mp

beginfig(1);
  def_list(ps, pair);

  add_to_list(ps, (0, 0));
  add_to_list(ps, (1, 0));
  add_to_list(ps, (1, 1));
  add_to_list(ps, (2, 1));

  for i := 2 upto ps.n:
    draw (ps[i - 1] -- ps[i]) scaled 1cm;
  endfor;

  for i := 1 upto ps.n:
    draw fullcircle shifted ps[i] scaled 1cm;
  endfor;

  for i := 1 upto ps.n:
    path p;
    p := fullcircle scaled .5 shifted ps[i] scaled 1cm;
    unfill p;
    draw p;
  endfor;

  def_list(ls, string);
  for i := 1 upto ps.n:
    add_to_list(ls, decimal (i - 1));
  endfor;

  for i := 1 upto ps.n:
    label(ls[i], ps[i] scaled 1cm);
  endfor;
endfig;

verbatimtex
% \end{CJK}
\end{document}
etex

end.
