#!/bin/bash
#author:hsevinc 05.2021
#in this script I aimed to scan the directory is given as a paramter(by default current directory) and find the apropriate files that wanted in selection process.
#Script just looks for file extension not file type!!
function txtfiles(){
	for item in `ls "$1" `;do
	if [[ ! -d ${1}/${item} ]]; then
	if [[ ${item: -4} == ".txt" ]];then
	echo "a txt file found in $1/$item "
	fi
	else
	txtfiles "$1/$item"
		fi
	
	done
}
	function pdffiles(){
		
			for item in `ls $1 `;do
	if [[ ! -d ${1}/${item} ]]; then
	if [[ ${item: -4} == ".pdf" ]];then
	echo "a pdf file found in $1/$item "
	fi
	else
	pdffiles "$1/$item"
		fi
	
	done
}
function xlsfiles(){
	
	for item in `ls "$1" `;do
	if [[ ! -d ${1}/${item} ]]; then
	if [[ ${item: -4} == ".xls" ]];then
	echo "a xls file found in $1/$item "
	fi
	else
	xlsfiles "$1/$item"
		fi
	
	done
}

function ownfiles(){

	n=`echo "$ext" | wc -c` 
	
	for item in `ls "$1" `;do
	if [[ ! -d ${1}/${item} ]]; then
	if [[ ${item: -n} ==  .$ext ]];then
	echo "a $ext file found in $1/$item "
	fi
	else
	ownfiles "$1/$item"
		fi
	
	done
}


echo -e "\t please specify the file format !!"
echo "**********************************"
echo -e "\t 1-to find files ends with .txt \n
         2-to find files ends with .pdf \n
         3-to find files ends with  .xls \n
         4-I want to enter my own extension!!"
         
       
         
         if [[ -z $1 ]];then
         param="."
         else
         param=$1
         fi
         
         
         read ans;
         case $ans in
         1)
         txtfiles $param ;;
         2)
         pdffiles $param ;;
         3)
         xlsfiles $param ;;
         4) 
        echo "you have chosen to enter your own file type!!"
        echo "please enter your file format(ex: for .sh files please just enter as sh "
        read ext;
        
        
         ownfiles $param  ;;
         *)
         echo "check your answer please" ;;
         esac 
                 
              


