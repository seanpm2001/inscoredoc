
############## sections and subsections
s/\\toplevel{\([^}]*\)}/# \1/
s/\\sublevel{\([^}]*\)}/## \1/
s/\\subsublevel{\([^}]*\)}/### \1/

############## unescape latex special characters
s/\\%/%/g
s/\\\$/$/g
s/\\_/_/g
s/\\~{}/\~/g

############## handle verbatim sections
s/\\begin{verbatim}/\
~~~~~~~~~~~/
s/\\end{verbatim}/~~~~~~~~~~~/

############## handle itemize sections
s/\\begin{itemize}//
s/\\end{itemize}//
s/\\item/- /

s/\\example/<span class="example">Example<\/span>/

############## tranform OSC tag
s/\\OSC{\([^}]*\)}/<span class="OSC">\1<\/span>/g

s/\\sampleindent/  /
s/\\\\//

s/\\textbf{\([^}]*\)}/**\1**/g
s/\\textit{\([^}]*\)}/_\1_/g
s/\\emph{\([^}]*\)}/**\1**/g

s/\\note{\([^}]*\)}/<span class="note">Note: \1<\/span>/g
s/\\note/<span class="note">Note:<\/span>/g

s/\\warning{\([^}]*\)}/<span class="warning">Warning \1<\/span>/g
s/\\warning/<span class="warning">Warning<\/span>/g

s/\\values{\([^}]*\)}/<span class="values">\1<\/span>/g

s/\\url{\([^}]*\)}/[\1](\1)/g

s/\\seealso/<span class="seealso">See also:<\/span>/
s/\\hspace\*{[^}]*}/  /
s/\\hspace{[^}]*}/  /
s/\\icomment/\#/

s/\\oscint\\*/<span class="terminal">int32<\/span>/
s/\\oscfloat\\*/<span class="terminal">float32<\/span>/
s/\\oscstring\\*/<span class="terminal">string<\/span>/

s/\\verb+\(.\)+/\1/g

############## handle inline math
s/\$\([^ $]*\)\$/\\(\1\\)/g

############## handle single line samples
# don't move, must be run after previous substitutions
s/\\sample{\([^}]*\)}[ \t]*$/\
~~~~~~~~~\
\1\
~~~~~~~~~\
/
