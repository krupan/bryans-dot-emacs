;;-*-coding: utf-8;-*-
(define-abbrev-table 'c-mode-abbrev-table
  '(
    ("debug" "" skel-c-dbg-print)
    ("debugh" "" skel-c-dbg-hexdump)
    ("printf" "" skel-c-printf)
   ))

(define-abbrev-table 'global-abbrev-table
  '(
    ("adn" "and" nil)
    ("dtt" "" skel-django-template-tag)
    ("dtv" "" skel-django-template-var)
    ("shr" "¯\\_(ツ)_/¯" nil)
    ("teh" "the" nil)
    ("uvmi" "" skel-verilog-insert-uvm-info)
    ("uvmip" "" skel-verilog-insert-uvm-info-with-psprintf)
   ))

(define-abbrev-table 'org-mode-abbrev-table
  '(
    ("mtodo" "[ ] " nil)
    ("odh" "" skel-org-document-header)
    ("onh" "" skel-org-notes-header)
   ))

(define-abbrev-table 'python-mode-abbrev-table
  '(
    ("bp" "import pdb; pdb.set_trace()" nil)
   ))

