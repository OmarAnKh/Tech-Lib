--Popular Genre Analysis using Joins and Window Functions: Identify the most popular genre for a given month.

SELECT Genre,
		COUNT(Genre) AS [Booking Frequency],
		RANK() OVER(ORDER BY COUNT(Genre) DESC) AS Rank,
		ROW_NUMBER() OVER(ORDER BY COUNT(Genre) DESC) AS [Row Number],
		DENSE_RANK() OVER(ORDER BY COUNT(Genre) DESC) AS [Dense Rank]
		FROM Books b Right JOIN Loans l  ON
		b.BookID=l.BookID GROUP BY Genre;
