syn match cCustomParen "?=(" contains=cParen,cCppParen
syn match cCustomFunc "\w\+\s*(\@=" contains=cCustomParen
syn match cCustomScope "::"
syn match cCustomClass "\w\+\s*::" contains=cCustomScope


hi def link cCustomFunc Function
hi def link cCustomClass Function
"hi def link cCustomClass Class

syn keyword vsStatement vsDelete
hi def link vsStatement Statement

syn keyword cCustomHi contained NOTE JGU OPEB SVZ PLE JCA
syn keyword cCustomHi contained note jgu opeb svz ple jca
hi def link cCustomHi Todo
syn cluster cCommentGroup contains=cCustomHi

