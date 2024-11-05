/* 
ant.admire:amsterdam=0
*/
SELECT * FROM mem WHERE (mem.aid='ant' AND mem.rid='admire' AND mem.bid='amsterdam' AND mem.qnt=0);

/*
ant.believe:cairo
*/
SELECT * FROM mem WHERE (mem.aid='ant' AND mem.rid='believe' AND mem.bid='cairo' AND mem.qnt=1);

/*
ant.believe
*/
SELECT * FROM mem WHERE (mem.aid='ant' AND mem.rid='believe' AND mem.qnt=1);

/*
ant
*/
SELECT * FROM mem WHERE (mem.aid='ant' AND mem.qnt=1);

/*
.admire
*/
SELECT * FROM mem WHERE (mem.rid='admire' AND mem.qnt=1);

/*
:amsterdam
*/
SELECT * FROM mem WHERE (mem.bid='amsterdam' AND mem.qnt=1);

/*
.letter #= 2
*/
SELECT * FROM mem WHERE (mem.rid='letter' AND mem.qnt=2);

/*
.letter > 2
*/
SELECT * FROM mem WHERE (mem.rid='letter' AND mem.qnt > 2);


/* OR JUNCTIONS */

/*
ant | :cairo
*/
SELECT * FROM mem WHERE (mem.aid='ant' AND mem.qnt=1) OR (mem.bid='cairo' AND mem.qnt=1);

/*
.admire | .believe
*/
SELECT * FROM mem WHERE (mem.rid='admire' AND mem.qnt=1) OR (mem.rid='believe' AND mem.qnt=1);

/*
.admire | .letter > 2
*/
SELECT * FROM mem WHERE (mem.rid='admire' AND mem.qnt=1) OR (mem.rid='letter' AND mem.qnt > 2);


/* AND JUNCTIONS */

/*
.admire & .believe & .letter < 5
*/
SELECT * FROM mem WHERE (
	aid IN (
		SELECT aid FROM mem WHERE (mem.rid='admire' AND mem.qnt=1)
		INTERSECT
		SELECT aid FROM mem WHERE (mem.rid='believe' AND mem.qnt=1)
		INTERSECT
		SELECT aid FROM mem WHERE (mem.rid='letter' AND mem.qnt<5)
	) AND (
		(mem.rid='admire' AND mem.qnt=1) OR
		(mem.rid='believe' AND mem.qnt=1) OR
		(mem.rid='letter' AND mem.qnt<5)
	)
);
