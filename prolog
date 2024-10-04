/* Here's a first version of a set of exercises for practising the querying
of a simple Prolog database, in this case a movie database (see below).
Modified from exercises found on the web. Not sure who first made them.  */


/* EXERCISES

Part 1: Write queries to answer the following questions.

    a. In which year was the movie American Beauty released? movie(american_beauty,Y)
    	-Y = 1999
    b. Find the movies released in the year 2000? movie(M,2000).
    	-M = down_from_the_mountain
		 M = o_brother_where_art_thou
		 M = ghost_world
    c. Find the movies released before 2000? movie(M,Y), Y < 2000.
    	- M = american_beauty,
          Y = 1999
          M = anna,
          Y = 1987
          M = barton_fink,
          Y = 1991
          M = the_big_lebowski,
          Y = 1998
          M = blade_runner,
          Y = 1997
          M = blood_simple,
          Y = 1984
          M = the_cotton_club,
          Y = 1984
          M = crimewave,
          Y = 1985
          M = fargo,
          Y = 1996
          M = the_firm,
          Y = 1993
          M = frankenweenie,
          Y = 1984
          M = ghost_busters,
          Y = 1984
          M = the_godfather,
          Y = 1972
          M = the_godfather_part_ii,
          Y = 1974
          M = the_godfather_part_iii,
          Y = 1990
          M = groundhog_day,
          Y = 1993
          M = hearts_of_darkness_a_filmmaker_s_apocalypse,
          Y = 1991
          M = the_hudsucker_proxy,
          Y = 1994
          M = inside_monkey_zetterland,
          Y = 1992
          M = lick_the_star,
          Y = 1998
          M = miller_s_crossing,
          Y = 1990
          M = mission_impossible,
          Y = 1996
          M = the_outsiders,
          Y = 1983
          M = peggy_sue_got_married,
          Y = 1986
          M = raising_arizona,
          Y = 1987
          M = rumble_fish,
          Y = 1983
          M = spies_like_us,
          Y = 1985
          M = star_wars_episode_i__the_phantom_menace,
          Y = 1999
          M = torrance_rises,
          Y = 1999
          M = the_usual_suspects,
          Y = 1995
          M = the_virgin_suicides,
          Y = 1999
          M = fall,
          Y = 1997
          M = if_lucy_fell,
          Y = 1996
          M = home_alone_3,
          Y = 1997
          M = the_horse_whisperer,
          Y = 1998
          M = just_cause,
          Y = 1995
          M = manny__lo,
          Y = 1996
          M = my_brother_the_pig,
          Y = 1999
          M = north,
          Y = 1994
    d. Find the movies released after 1990? movie(M,Y), Y < 1990.
    	- M = anna,
          Y = 1987
          M = blood_simple,
          Y = 1984
          M = the_cotton_club,
          Y = 1984
          M = crimewave,
          Y = 1985
          M = frankenweenie,
          Y = 1984
          M = ghost_busters,
          Y = 1984
          M = the_godfather,
          Y = 1972
          M = the_godfather_part_ii,
          Y = 1974
          M = the_outsiders,
          Y = 1983
          M = peggy_sue_got_married,
          Y = 1986
          M = raising_arizona,
          Y = 1987
          M = rumble_fish,
          Y = 1983
          M = spies_like_us,
          Y = 1985
    e. Find an actor who has appeared in more than one movie? actor(M1, A, _), actor(M2,A, _), M1 @> M2.
    f. Find a director of a movie in which Scarlett Johansson appeared.
    g. Find an actor who has also directed a movie.
    h. Find an actor or actress who has also directed a movie.
    i. Find the movie in which John Goodman and Jeff Bridges were co-stars.

Part 2: Add rules to the database to do the following,

    a. released_after(M, Y) <- the movie was released after the given year.
    b. released_before(M, Y) <- the movie was released before the given year.
    c. same_year(M1, M2) <- the movies are released in the same year.
    d. co_star(A1, A2) <- the actor/actress are in the same movie.

*/

/** <examples> (Remove these if you want to give the exercises to students!)

?- movie(american_beauty, Y).
?- movie(M, 2000).
?- movie(M, Y), Y < 2000.
?- movie(M, Y), Y > 1999.
?- actor(M1, A, _), actor(M2, A, _), M1 @> M2.
?- actress(M, scarlett_johansson, _), director(M, D).
?- actor(_, A, _), director(_, A).
?- (actor(_, A, _) ; actress(_, A, _)), director(_, A).
?- actor(M, john_goodman, _), actor(M, jeff_bridges, _).
*/

/* DATABASE

    movie(M, Y) <- movie M came out in year Y
    director(M, D) <- movie M was directed by director D
    actor(M, A, R) <- actor A played role R in movie M
    actress(M, A, R) <- actress A played role R in movie M

*/

:- discontiguous
        movie/2,
        director/2,
        actor/3,
        actress/3.
released_after(M, Y) :- movie(M, Year), Year < Y.
released_befor(M, Y) :- movie(M, Year), Year < Y.
