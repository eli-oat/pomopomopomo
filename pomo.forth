( POMO POMO POMO )

VARIABLE POMO-TIME
1500000 POMO-TIME !

VARIABLE REST-TIME
600000 REST-TIME !

( TODO: haven't found a way to sleep in pforth.
	Using gforth ms does the trick, e.g.
	25 60 * 1000 * ms 
	sleeps for 25 minutes 

	More on ms, 
	https://www.complang.tuwien.ac.at/forth/gforth/Docs-html/Keeping-track-of-Time.html#index-ms-_0040var_007b-u-_002d_002d--_007d--facility_002dext-3025 )

: 1SEC  1000  MS ;
: 30SEC 30000 MS ;
: 60SEC 60000 MS ;

( DECREMENTS POMO-TIME if it is greater than 0 )
: CHECK-POMO-TIME? 
	0> IF
		POMO-TIME @ 1 - POMO-TIME ! ." 🍅" SPACE POMO-TIME ? CR
	ELSE 
		REST-TIME @ 1 - REST-TIME ! ." 😴" SPACE REST-TIME ? CR
	THEN
;

( POMO-LOOP exits when POMO-TIME reaches 0, 
	then resets to POMO-TIME to 1500000 )
: POMO-LOOP
	BEGIN
		PAGE 
			POMO-TIME @ CHECK-POMO-TIME? 1SEC 
		PAGE
		POMO-TIME @ REST-TIME @ + 0=
	UNTIL
;

POMO-LOOP 

BYE