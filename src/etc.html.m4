M4_DEFINE([__PAGE__], [__([etc], [etc])])dnl
M4_DEFINE([LINK], [<li><a target="_blank" href="$2">$1</a></li>])dnl
HTML_BEGIN()

HTML_HEADER()

M4_INCLUDE(etc/other.html.m4)dnl
M4_INCLUDE(etc/programming.html.m4)dnl
M4_INCLUDE(etc/talks.html.m4)dnl

HTML_END()
