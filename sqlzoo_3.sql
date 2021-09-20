----SELECT from Nobel Tutorial



8. Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
select * from nobel
where subject = 'Physics' and yr = '1980' OR subject = 'Chemistry' and yr = '1984'


9. Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
select * from nobel
where subject NOT IN ( 'Chemistry' , 'Medicine') and yr = 1980


14. Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject,winner
