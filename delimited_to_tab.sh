#!/bin/bash

###############################################################
# Delimiters(,) are allowed within double quotes.
# To conform line formats checking only number of columns and number of quotes present.
# If any mismatch found between first five lines,script will exit.
###############################################################

#Remove output file
rm -f -- tab_limited_out.data
i=0
current_line_col_cnt=0
prev_line_col_cnt=0
correct_number_of_cols=0

current_line_quote_cnt=0
prev_line_quote_cnt=0
correct_number_of_quote=0

#Read first five lines and find number of columns and quotes.
echo "Processing first five lines"
while IFS='' read -r line || [[ -n "$line" ]] ; do

    if (($i==5));then
        correct_number_of_cols=$current_line_col_cnt
        correct_number_of_quote=$current_line_quote_cnt
	break
    fi
   
    #Calculate number of columns
    prev_line_col_cnt=$current_line_col_cnt  
    current_line_col_cnt=`echo $line | sed -e 's/"[^"]*"//g' | awk -F, '{ print NF; exit }'`
    
    #Calculate number of quotes.
    prev_line_quote_cnt=$current_line_quote_cnt  
    current_line_quote_cnt=`echo $line| awk -F"\"" '{print NF-1}'`

    #Compare col count between lines
    if (($i > 0 && $prev_line_col_cnt != $current_line_col_cnt));then
    echo "While checking first five lines,there is a mismatch in column count between lines"  
    exit 1
    fi

    #Compare quotes count between lines
    if (($i > 0 && $prev_line_quote_cnt != $current_line_quote_cnt));then
    echo "While checking first five lines,there is a mismatch in quotes count between lines"  
    exit 1
    fi

    ((i++)) 
done < "$1"
echo "After verifying first five lines,Number of columns is $correct_number_of_cols and Number of quotes is $correct_number_of_quote per line"

#Read Entire file and write it as tab limited file
while IFS='' read -r line || [[ -n "$line" ]] ; do

	#Get col count from line
	itrating_line_col_cnt=`echo $line | sed -e 's/"[^"]*"//g' | awk -F, '{ print NF; exit }'`
        
	#Get quote count from line
        itrating_line_quote_cnt=`echo $line | awk -F"\"" '{print NF-1}'`
        
        

	if (($itrating_line_col_cnt == $correct_number_of_cols && $itrating_line_quote_cnt==$correct_number_of_quote));then
		echo "SUCCESS: $line"
		tab_limited_line=$(echo $line | sed -e ':a;s/^\(\("[^"]*"\|'\''[^'\'']*'\''\|[^",'\'']*\)*\),/\1\t/;ta')
		echo $tab_limited_line >> tab_limited_out.data
	else
		echo "ERROR: $line"
	fi	
         

done < "$1"
