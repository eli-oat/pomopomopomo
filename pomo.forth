( POMO POMO POMO )

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