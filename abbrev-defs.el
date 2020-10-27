;;-*-coding: utf-8;-*-
(define-abbrev-table 'c-mode-abbrev-table
  '(
    ("debug" "" skel-c-dbg-print :count 12)
    ("debugh" "" skel-c-dbg-hexdump :count 9)
    ("printf" "" skel-c-printf :count 2)
   ))

(define-abbrev-table 'global-abbrev-table
  '(
    ("adn" "and" nil :count 1)
    ("dtt" "" skel-django-template-tag :count 19)
    ("dtv" "" skel-django-template-var :count 6)
    ("shr" "¯\\_(ツ)_/¯" nil :count 2)
    ("teh" "the" nil :count 14)
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

(define-abbrev-table 'verilog-mode-abbrev-table
  '(
    ("debug" "" skel-verilog-insert-uvm-info :count 5)
    ("debugp" "" skel-verilog-insert-uvm-info-with-psprintf :count 3)
    ("uvm_info" "" skel-verilog-insert-uvm-info :count 3)
    ("uvm_infop" "" skel-verilog-insert-uvm-info-with-psprintf :count 2)
   ))

