Ben realized that results may contain duplicates.

To solve this problem he could compute some kind of hash value of each
result and then remove results with duplicated values. But if there
were a hash collision some results might get accidentally deleted.
Better solution would be too add numerical 'id' to each person, then
remove duplicated results.

