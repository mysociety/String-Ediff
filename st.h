/* swig -perl -module String::Ediff st.h */

%module st
%{
char *ediff(char *s1, char *s2);
%}

char *ediff(char *s1, char *s2);
