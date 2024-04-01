{-
The difficulty of a subject is inversely proportional to
the average grade of all students who are taking it.
Define a function that accepts a list of records
and returns the hardest subject.
Use the following type definitions:

type Student = String
type Subject = String
type Note = Double
type Record = (Student, Subject, Note)

**Acceptance criteria:**

1. All tests pass.
2. The task is solved using folding.
-}

import Data.List

main :: IO()
main = do
    -- print $ average [1, 2, 3]
    -- print $ nub [1, 2, 1, 2, 5, 5, 1, 7]
    print $ hardestSubject [("John", "Maths", 5), ("Kennedy", "English", 2), ("Joe", "Programming", 4), ("Claudia", "Programming", 6), ("Sam", "Maths", 4), ("Jenn", "English", 2)] -- == "English"
    print $ hardestSubject [("John", "Maths", 5), ("Kennedy", "English", 5), ("Joe", "Programming", 4), ("Claudia", "Programming", 6), ("Sam", "Maths", 4), ("Jenn", "English", 5)] -- == "Maths"

type Student = String
type Subject = String
type Note = Double
type Record = (Student, Subject, Note)

allSubjects :: [Record] -> [Subject]
allSubjects records = nub $ map (\ (_, subj, _) -> subj) records

average :: [Note] -> Note
average xs = sum xs / (fromIntegral $ length xs) 

-- hardestSubject :: [Record] -> 
hardestSubject records = fst $ foldl1 (\ (subj1, grade1) (subj2, grade2) -> if grade1 < grade2 then (subj1, grade1) else (subj2, grade2) ) $ map (\ subj -> averageSubj subj) $ allSubjects records
 where
    allPeople subj = filter (\ (_, subject, grade) -> subject == subj) records
    allGrades subj = map (\ (_, _, grade) -> grade) $ allPeople subj
    averageSubj subj = (subj, average $ allGrades subj)


