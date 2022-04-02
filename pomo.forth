( POMO POMO POMO )

( TODO: haven't found a way to sleep in pforth
	using gforth ms does the trick, e.g.
	25 60 * 1000 * ms 
	sleeps for 25 minutes 

	More on ms, 
	https://www.complang.tuwien.ac.at/forth/gforth/Docs-html/Keeping-track-of-Time.html#index-ms-_0040var_007b-u-_002d_002d--_007d--facility_002dext-3025 )

VARIABLE POMO-TIME
20 POMO-TIME !

VARIABLE REST-TIME
10 REST-TIME !

VARIABLE LONGREST-TIME
15 LONGREST-TIME !


( DECREMENTS POMO-TIME if it is greater than 0 )
: CHECK-POMO-TIME? 
	0> IF 
		POMO-TIME @ 1 - POMO-TIME ! POMO-TIME ? 
	THEN
;

( POMO-LOOP exits when POMO-TIME reaches 0, 
	then resets to POMO-TIME to 20 )
: POMO-LOOP
		BEGIN
			POMO-TIME @ CHECK-POMO-TIME?
			POMO-TIME @ 0=
		UNTIL
		20 POMO-TIME !
;

POMO-TIME @ POMO-LOOP 

CR

POMO-TIME @ .

CR