m4_divert(-1)
# See https://github.com/autotools-mirror/autoconf/blob/master/lib/m4sugar/m4sugar.m4

m4_changequote()
m4_changequote([, ])

m4_define([dnl], m4_defn([m4_dnl]))
m4_define([M4_DEFINE], m4_defn([m4_define]))
m4_define([M4_DEFN], m4_defn([m4_defn]))
m4_define([M4_UNDEFINE], m4_defn([m4_undefine]))
M4_UNDEFINE([m4_define])
M4_UNDEFINE([m4_defn])
M4_UNDEFINE([m4_undefine])

M4_DEFINE([M4_COPY], [M4_DEFINE([$2], M4_DEFN([$1]))])
M4_DEFINE([M4_RENAME], [M4_COPY([$1], [$2])M4_UNDEFINE([$1])])

M4_RENAME([m4_changequote], [M4_CHANGEQUOTE])
M4_RENAME([m4_divert], [M4_DIVERT])
M4_RENAME([m4_errprint], [M4_ERRPRINT])
M4_RENAME([m4_esyscmd], [M4_ESYSCMD])
M4_RENAME([m4_ifdef], [M4_IFDEF])
M4_RENAME([m4_ifndef], [M4_IFNDEF])
M4_RENAME([m4_ifelse], [M4_IF])
M4_RENAME([m4_include], [M4_INCLUDE])
M4_RENAME([m4_m4exit], [M4_EXIT])
M4_RENAME([m4_popdef], [M4_POPDEF])
M4_RENAME([m4_pushdef], [M4_PUSHDEF])
M4_RENAME([m4_shift], [M4_SHIFT])
M4_RENAME([m4_syscmd], [M4_SYSCMD])
M4_RENAME([m4_sysval], [M4_SYSVAL])
M4_RENAME([m4_translit], [M4_TRANSLIT])
M4_RENAME([m4_undivert], [M4_UNDIVERT])

M4_RENAME([m4___file__], [M4__FILE__])
M4_RENAME([m4___line__], [M4__LINE__])
M4_RENAME([m4___program__], [M4__PROGRAM__])
M4_DEFINE([M4_NEWLINE], [
])

M4_DEFINE([M4_IFVAL], [M4_IF([$1], [], [$3], [$2])])
M4_DEFINE([M4_QUOTE], [[$*]])
M4_DEFINE([M4_UNQUOTE], [$*])

M4_DEFINE([M4_SYSTEST], [M4_SYSCMD($1)M4_IF(M4_SYSVAL, [0], [$2], [$3])])

M4_DEFINE([M4_SHIFT2], [M4_SHIFT(M4_SHIFT($@))])
M4_DEFINE([M4_SHIFT3], [M4_SHIFT(M4_SHIFT(M4_SHIFT($@)))])
M4_DEFINE([M4_CASE], [M4_IF([$#], 0, [], [$#], 1, [], [$#], 2, [$2], [$1], [$2], [$3], [$0([$1], M4_SHIFT3($@))])])

M4_DEFINE([M4_ERROR], [M4_ERRPRINT(M4__FILE__:M4__LINE__[: error: $*
])M4_EXIT([1])])

M4_DIVERT(0)dnl
