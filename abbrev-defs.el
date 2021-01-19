;;-*-coding: utf-8;-*-
(define-abbrev-table 'c-mode-abbrev-table
  '(
    ("debug" "" skel-c-dbg-print :count 12)
    ("debugh" "" skel-c-dbg-hexdump :count 9)
    ("printf" "" skel-c-printf :count 2)
   ))

(define-abbrev-table 'global-abbrev-table
  '(
    ("adn" "and" nil :count 3)
    ("dtt" "" skel-django-template-tag :count 21)
    ("dtv" "" skel-django-template-var :count 7)
    ("shr" "¯\\_(ツ)_/¯" nil :count 3)
    ("teh" "the" nil :count 16)
    ("uvmi" "" skel-verilog-insert-uvm-info :count 4)
    ("uvmip" "" skel-verilog-insert-uvm-info-with-psprintf :count 2)
   ))

(define-abbrev-table 'org-mode-abbrev-table
  '(
    ("mtodo" "[ ] " nil :count 4)
    ("odh" "" skel-org-document-header :count 13)
    ("onh" "" skel-org-notes-header :count 13)
   ))

(define-abbrev-table 'python-mode-abbrev-table
  '(
    ("bp" "import pdb; pdb.set_trace()" nil :count 4)
   ))

