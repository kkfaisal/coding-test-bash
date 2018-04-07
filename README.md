# coding-test-bash
Solution for bash script based questions

*Question 3 - Sort and find number of occurances in list*

 ```
echo '1
> 6
> 201
> 8
> 21
> 10
> 21
> 21
> 6
> 2
> 8
> 6
> 201' >> number_list

sort number_list | uniq -c | sort -n -r
   3 6
   3 21
   2 8
   2 201
   1 2
   1 10
   1 1
```
*Question 4 - Parsing and detecting non compatible rows and converrt to tab limited file*
- Script is present in this repo.
```
echo '1,"2","2,3",4,5,6,"7,8,10"
> 1,"2","2,3",4,5,6,"7,8,10"
> 1,"2","2,3",4,5,6,"7,8,10"
> 1,"2","2,3",4,5,6,"7,8,10"
> 1,"2","2,3",4,5,6,"7,8,10"
> 1,"2","2,3",4,5,6,"7,8,10"
> 1,"2","2,3",4,5,6,"7,8,10"
> 1,"2","2,3",4,5,6,
> 1,"2","2,3",4,5,6,"7,8,10"
> 1,"2","2,3",4,5,6,"7,8,10"
> 1,"2","2,3",4,5,6,"7,8,10"
> 1,"2","2,3",4,5,6,"7,8,10",4,5,6,"7,8,10"' >> input_data

./delimited_to_tab.sh input_data
Processing first five lines
After verifying first five lines,Number of columns is 7 and Number of quotes is 6 per line
SUCCESS: 1,"2","2,3",4,5,6,"7,8,10"
SUCCESS: 1,"2","2,3",4,5,6,"7,8,10"
SUCCESS: 1,"2","2,3",4,5,6,"7,8,10"
SUCCESS: 1,"2","2,3",4,5,6,"7,8,10"
SUCCESS: 1,"2","2,3",4,5,6,"7,8,10"
SUCCESS: 1,"2","2,3",4,5,6,"7,8,10"
SUCCESS: 1,"2","2,3",4,5,6,"7,8,10"
ERROR: 1,"2","2,3",4,5,6,
SUCCESS: 1,"2","2,3",4,5,6,"7,8,10"
SUCCESS: 1,"2","2,3",4,5,6,"7,8,10"
SUCCESS: 1,"2","2,3",4,5,6,"7,8,10"
ERROR: 1,"2","2,3",4,5,6,"7,8,10",4,5,6,"7,8,10"
```
- Output tablimited file will be generated 
```
cat tab_limited_out.data 
1 "2" "2,3" 4 5 6 "7,8,10"
1 "2" "2,3" 4 5 6 "7,8,10"
1 "2" "2,3" 4 5 6 "7,8,10"
1 "2" "2,3" 4 5 6 "7,8,10"
1 "2" "2,3" 4 5 6 "7,8,10"
1 "2" "2,3" 4 5 6 "7,8,10"
1 "2" "2,3" 4 5 6 "7,8,10"
1 "2" "2,3" 4 5 6 "7,8,10"
1 "2" "2,3" 4 5 6 "7,8,10"
1 "2" "2,3" 4 5 6 "7,8,10"
```
