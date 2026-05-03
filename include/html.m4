dnl vim: ft=m4
M4_DIVERT(-1)

M4_DEFINE([__], M4_IFDEF([ENGLISH], [$2], [$1]))

M4_DEFINE(
  [HTML_BEGIN],
  [<html lang="__([pt-BR], [en])">
  <head>
  M4_INCLUDE([head.html.m4])
  [$1]
  </head>
  <body [$2]>]
)

M4_DEFINE([HTML_HEADER], M4_INCLUDE([header.html.m4]))

M4_DEFINE(
  [HTML_END],
  [</body>
  </html>]
)

M4_DEFINE(
  [HTML_MONTH],
  [__(
    [M4_CASE([$1],
      [01], [jan],
      [02], [fev],
      [03], [mar],
      [04], [abr],
      [05], [mai],
      [06], [jun],
      [07], [jul],
      [08], [ago],
      [09], [set],
      [10], [out],
      [11], [nov],
      [12], [dez],
    )],
    [M4_CASE([$1],
      [01], [jan],
      [02], [feb],
      [03], [mar],
      [04], [apr],
      [05], [may],
      [06], [jun],
      [07], [jul],
      [08], [aug],
      [09], [sep],
      [10], [oct],
      [11], [nov],
      [12], [dec],
    )]
  )]
)

M4_DEFINE(
  [HTML_DATE],
  [M4_IFVAL(
    [$3],
    [<time datetime="[$1]-[$2]-[$3]">[$3] HTML_MONTH($2) [$1]</time>],
    [M4_IFVAL(
      [$2],
      [<time datetime="[$1]-[$2]">HTML_MONTH($2) [$1]</time>],
      [<time datetime="[$1]">[$1]</time>]
    )]
  )]
)

M4_DEFINE([HTML_ARTICLE], M4_INCLUDE([article.html.m4]))

M4_DEFINE([HTML_H6], [<h6>[$1]</h6>])
M4_DEFINE([HTML_LINK], [<a target="_blank" href="[$2]">[$1]</a>])

M4_DEFINE(
[INTERNAL_LINK],
[M4_SYSTEST([test -f "__SRC__/[$2].m4"], [<a href="M4_ESYSCMD(grealpath --relative-to=__SRC_DIR__ __SRC__/[$2] | tr -d '\n')[$3]">[$1]</a>], [M4_ERROR(File '__SRC__/[$2].m4' does not exist.)])])

M4_DEFINE(
[STATIC_FILE],
[M4_SYSTEST([test -f "__STATIC__/[$1]"], [M4_ESYSCMD(grealpath --relative-to=__DIR__ __STATIC__/[$1] | tr -d '\n')], [M4_ERROR(File '__STATIC__/[$1]' does not exist.)])])

M4_DEFINE([__CNAME__], [M4_ESYSCMD(cat __STATIC__/CNAME)])
M4_DEFINE([__SITE__], [https://__CNAME__])

M4_DEFINE(
[SITE_LINK],
[M4_SYSTEST([test -f "__SRC__/[$2].m4"], [HTML_LINK($1, __SITE__/M4_ESYSCMD(grealpath --relative-to=__SRC_DIR__ __SRC__/[$2] | tr -d '\n')[$3])], [M4_ERROR(File '__SRC__/[$2].m4' does not exist.)])])

M4_DEFINE([__GITHUB__], [https://github.com/arthurxavierx])

M4_DIVERT(0)dnl
<!DOCTYPE html>
