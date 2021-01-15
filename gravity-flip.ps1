#Coding in powershell cuz why not!




# flip 'L' @(1, 4, 5, 3, 5) --> @(5, 5, 4, 3, 1)

#NOTATION TO KNOW
#[datatype] $variableName


# function hello() {
#   Write-Host "Hello world!";
# }

# hello # how to call the function 


# function message([string] $note) {
#   # Write-Host $note;  # this is like print() or cout << 
#   return $note; # to return a value 
# }

# message("oops") # function with arguments 


function chara([char] $a,[char] $b ) {
  Write-Host $a $b;
}

#chara 'R' 'L'

# function arra([int[]] $a, [int[]] $b) {
#   Write-Host $a $b; 
# }

# arra @(1,2,3,4) @(10,20,30,40)

function flip([char] $dir, [int[]] $arr) {
  Write-Host "TESTING WITH:================"
  Write-Host "Direction: " $dir; 
  Write-Host "Items per columns: " $arr; 
  Write-Host "============================="

  #set num_cols
  $num_cols = $arr.Count;

  #set num_rows to the max value in column array
  [int] $num_rows = $arr[0];
  foreach ($x in $arr){
    if($x -gt $num_rows) {
      $num_rows = $x;
    }
  }

  # reassigns all the values in num_rows to 0 
  $rows_arr = 1..$num_rows;
  for($i = 0; $i -lt $num_rows; $i++){
    $rows_arr[$i] = 0;
  }

  # reassigns all the values in num_cols to 0 
  $cols_arr = 1..$num_cols;
  for($i = 0; $i -lt $num_cols; $i++){
    $cols_arr[$i] = 0;
  }

  for ($x = 0; $x -lt $num_cols; $x++){
    for ($i = 0; $i -lt $arr[$x]; $i++) {
      $rows_arr[$i] = $rows_arr[$i] + 1; 
    }
    
  }
  # test the code
  # Write-host "Should be [4, 3, 1]" $rows_arr;
  # Write-host "Should be [0, 0, 0, 0]" $cols_arr; 
  
  for ($x = 0; $x -lt $num_cols; $x++) {
    for ($i = 0; $i -lt $num_rows; $i++){
      if ($rows_arr[$i] -gt 0) {
        $cols_arr[$x]++; 
        $rows_arr[$i]--; 
      }
    }
  }

  # test the code 
  # Write-host "Should be [0, 0, 0]" $rows_arr;   # result: [0, 0, 0]
  # Write-host "Should be [3, 2, 2, 1]" $cols_arr;   # result: [3, 2, 2, 1]

  #return result 

  if ($dir -eq 'R') {
    [array]::Reverse($cols_arr); 
  } 
  return $cols_arr;

}

flip 'L' @(3, 2, 1, 2)



# PS C:\> $a = [array]1,2,5,6,3,2,9,1
# PS C:\> $a | measure -Maximum



# THE PSUEDO CODE 
# function flip(direction, array) {
  
#   find list max 
#   var num_rows = array.max() 
#   var num_cols = array.size() 

#   # initialize the arrays 
#   rows_arr = [num elements in this = num_rows, values = 0]
#   cols_arr = [num elements in this = num_cols, values = 0]
#   new_col = [0]

#   # O(# of elements)
#   for x in range (num_cols):
#     for i in range(array[x]): 
#         rows_arr[i]++ 

#   # test the code 
#   print (rows_arr) # result: [4, 3, 1]
#   print (col_arr)  # result: input 

#   #O(num_rows * num_cols)
#   for x in range(num_cols): // 0, 1, 2, 3
#     for i in range(num_rows):  
#       if row_arr[i] > 0:      // [0, 0, 0]
#         col_arr[x]++
#         row_arr[i]-- 

#   # test the code 
#   print (rows_arr) # result: [0, 0, 0]
#   print (col_arr)  # result: [3, 2, 2, 1]
  
#   # return result 
#   if direction == 'R': 
#     return col_arr
#   if direction == 'L':
#     return col_arr[::-1] // reverse 
# }





# +---+                                       +---+
# |   |                                       |   |
# +---+                                       +---+
# +---++---+     +---+              +---++---++---+
# |   ||   |     |   |   -->        |   ||   ||   |
# +---++---+     +---+              +---++---++---+
# +---++---++---++---+         +---++---++---++---+
# |   ||   ||   ||   |         |   ||   ||   ||   |
# +---++---++---++---+         +---++---++---++---+

# # flip 'R' @(3, 2, 1, 2) --> @(1, 2, 2, 3)

# 1
# 3
# 4
# 0001 
# 0111
# 1111
#       // iterations
# xxxx     row[i]     index 
# 1000 =  1 1 1 1       2   
# 1101 =  1 2 2 3       1   
# 1111 =  1 2 3 4       0   
# xxxx
# 0001
# 0111
# 1111 


# row = [4, 3, 1]
# col = [3, 2, 1, 2]

# num row = list max;     rows[list max];
# num col = list size;    column[list size]

# (3, 2, 1, 2)



# find list max

# rows = list max
# rows[list max];
# for x in range row:
#   row[x] = 0


# for x in range (list.size):
#     for i in range(list[x]): 
#         row[i]++ 
    

# row[0] = 4
# row[1] = 3
# row[2] = 1



# 3210
# 1111 +   4 3 2 1
# 0111 +   3 2 1
# 0001 +   1 0 0 

# 1 2 2 3 


# column[list size]
# for x in range column:
#   column[x] = 0


# for x in range column: 
#   for i in range row: 
#     if row[i] > 0: 
#       column[x]++
#       row[i]-- 
