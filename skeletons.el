;; to bind skeletons to an abbrev do M-x list-abbrevs, edit the
;; abbrev-table you want it to be a part of, then hit C-c C-c, try it
;; out, then hit C-x C-s to save it to the abbrevs file

(define-skeleton skel-verilog-insert-uvm-info
  "Insert a uvm_info template"
  nil
  "`uvm_info(\"DEBUG\", \"" _ "\", UVM_MEDIUM)"
)

(define-skeleton skel-verilog-insert-uvm-info-with-psprintf
  "Insert a uvm_info template with psprintf"
  nil
  "`uvm_info(get_full_name(), $psprintf(\"" _ "\", ), UVM_MEDIUM)"
)

(define-skeleton skel-c-dbg-print
  "Insert DBG_PRINT macro call"
  nil
  "DBG_PRINT(\"" _ "\\n\");"
)

(define-skeleton skel-c-dbg-hexdump
  "Insert DBG_HEXDUMP macro call"
  nil
  "DBG_HEXDUMP(\"" _ "\", , );"
)

(define-skeleton skel-c-printf
  "Insert printf"
  nil
  "printf(\"" _ "\\n\");"
)

(define-skeleton skel-org-notes-header
  "insert the basic org-mode header that I like for notes"
  nil
  "#+STARTUP: hidestars"
  \n >
  "#+STARTUP: indent"
  \n >
)

(define-skeleton skel-org-document-header
  "Insert the basic org-mode header that I like for
  documents (i.e., pdfs). This should be combinable with
  skel-org-notes-header."
  nil
  "#+TITLE: " _
  \n >
  "#+OPTIONS:   num:nil toc:nil \\n:nil @:t ::t |:t ^:{} -:t f:t *:t <:t"
  \n >
  "# without this, html export turn _word to into a subscript."
  \n >
  "#+OPTIONS: ^:{}"
  \n >
  "# next two use helvetica"
  \n >
  "#+LaTeX_HEADER: \\usepackage[scaled]{helvet}"
  \n >
  "#+LaTeX_HEADER: \\renewcommand\\familydefault{\\sfdefault}"
  \n >
  "# this puts a blank line between paragraphs and removes the indent at"
  \n >
  "# the start of each paragraph:"
  \n >
  "#+LaTeX_HEADER: \\usepackage{parskip}"
  \n >
  "#+EXPORT_EXCLUDE_TAGS: noexport"
  \n >
)
