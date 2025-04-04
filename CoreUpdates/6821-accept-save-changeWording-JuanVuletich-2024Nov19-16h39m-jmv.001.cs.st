'From Cuis7.1 [latest update: #6821] on 19 November 2024 at 4:40:54 pm'!

!CodeProvider methodsFor: 'misc' stamp: 'jmv 11/19/2024 16:39:41'!
okayToAccept
	"Answer whether it is okay to accept the receiver's input"

	self showingByteCodes ifTrue: [
		self inform: 
'Sorry, you can only submit changes here 
when you are showing source.'.
		^ false].

	self showingAnyKindOfDiffs ifTrue: [
		^ SelectionMenu confirm: 
'Caution!!  You are "showing diffs" here, so 
there is a danger that some of the text in the
code pane is contaminated by the "diff" display'
		trueChoice: 'save anyway -- I''ll take my chances' falseChoice: 'um, let me reconsider' icons: #(acceptIcon cancelIcon)
	].

	^ true! !


!TextEditor methodsFor: 'menu & kbd shortcuts' stamp: 'jmv 11/19/2024 16:39:52'!
defaultMenuSpec
	"Spec for the menu and shortcut keys for the regular text editors.
	See coment at Morph >> #getMenu
	"
	| acceptEntry |
	acceptEntry := self hasUnacceptedEdits
		ifTrue: [ #((110				'Save (s)' 					$s 	editor 			acceptContents 						acceptIcon 								'Save')) ]
		ifFalse: [ #((110 				'Save' 					nil 	editor 			nil 						acceptIcon 								'Save')) ].
	^#(
		#(0 		'Text Editor' 					true)
		#(10		'Help... (h)' 							$h 	editor 			openHelp 						helpIcon 								'Open Help')
		#(20 		'-----')
		#(30		'Find...(f)' 							$f 	editor 			find 						findIcon 								'Find')
		#(40		'Find Again (g)' 							$g 	editor 			findAgain 						systemIcon 								'Find again')
		#(50		'Use Selection for Find (j)' 							$j 	editor 			setSearchString 						saveAsIcon 								'Set selection as search string for find again')
		#(60 		'-----')
		#(70		'Undo - multiple (z)' 							$z 	editor 			undo 						undoIcon 								'Undo (multiple levels)')
		#(80		'Redo - multiple (Z)' 							$Z 	editor 			redo 						redoIcon 								'Redo (multiple levels)')
		#(90		'Undo / Redo history' 							nil 	editor 			offerUndoHistory 						changesIcon)
		#(100 		'-----')
	),
	acceptEntry,
	#(
		#(120		'Copy (c)' 							$c 	editor 			copySelection 						copyIcon 								'Copy selection to the Clipboard')
		#(130		'Cut (x)' 							$x 	editor 			cut 						cutIcon 								'Cut selection and store it in the Clipboard')
		#(140 		'Compare to Clipboard (C)' 							$C 	editor 			compareToClipboard 						changesIcon 								'Compare selection to clipboard')
		#(150		'Paste (v)' 							$v 	editor 			paste 						pasteIcon 								'Paste Clipboard contents')
		#(160		'Paste without Format' 							nil 	editor 			pasteString 						pasteIcon)
		#(170		'Paste...' 							nil 	editor 			pasteRecent 						worldIcon)
		#(180 		'-----')
		#(190		'Toggle WordWrap' 							nil 	editor 			wrapOnOff 						genericTextIcon)
		#(200		'Clear Font' 							nil 	editor 			clearFont 						newIcon)
		#(210		'Set Font... (k)' 							$k 	editor 			offerFontMenu 						preferencesDesktopFontIcon 								'Set font')
		#(220		'Set Font Size' 							nil 	editor 			offerFontSizeMenu 						preferencesDesktopFontIcon)
		#(230		'Set Style' 							nil 	editor 			offerFontStyleMenu 						preferencesDesktopFontIcon)
		#(240		'Set Text Color (8)' 							$8 	editor 			offerColorMenu 						graphicsIcon)
		#(250		'Set Alignment... (u)' 							$u 	editor 			chooseAlignment 						formatJustifyLeftIcon 								'Toggle alignment')

		"Keyboard shortcuts only"
		#(500		nil 							$0 	editor 			changeEmphasisNormal 									nil 			'Normal')
		#(501		nil 							$1 	editor 			changeEmphasisBold 									nil 			'Bold')
		#(502		nil 							$2 	editor 			changeEmphasisItalic 									nil 			'Italic')
		#(503		nil 							$3 	editor 			changeEmphasisUnderlined 									nil 			'Underlined')
		#(504		nil 							$4 	editor 			changeEmphasisStruckThrough 									nil 			'Struck Through')
		#(505		nil 							$5 	editor 			changeEmphasisSuperscript 									nil 			'Superscript')
		#(506		nil 							$6 	editor 			changeEmphasisSubscript 									nil 			'Subscript')
		#(601 		nil 							$a 	editor 			selectAll 									nil 			'Select all')
		#(602 		nil 							$U 	editor 			changeLineEndsToLf 									nil 			'Convert line endings to LF characters (Cuis convention) in selection')
		#(603 		nil 							$( 	editor 			encloseWithParenthesis 									nil 			'Enclose within ( and ), or remove enclosing ( and )')
		#(604 		nil 							$[ 	editor 			encloseWithSquareBrackets 									nil 			'Enclose within [ and ], or remove enclosing [ and ]')
		#(605 		nil 							${ 	editor 			encloseWithCurlyBrackets 									nil 			'Enclose within { and }, or remove enclosing { and }')
		#(606 		nil 							$' 	editor 			encloseWithSingleQuotes 									nil 			'Enclose within single quotes, or remove enclosing single quotes')
		#(607 		nil 							$" 	editor 			encloseWithDoubleQuotes 									nil 			'Enclose within double quotes, or remove enclosing double quotes')
		#(608 		nil 							$` 	editor 			encloseWithBackTicks 									nil 			'Enclose within backticks, or remove enclosing backticks')
		"#(609 		nil 							$< 	editor 			encloseWithAngleBrackets 									nil 			'Enclose within < and >, or remove enclosing ( and )')"
		#(610 		nil 							$H 	editor 			cursorTopHome 									nil 			'Move cursor to start of text')
	).
! !

