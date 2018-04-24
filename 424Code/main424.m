%user input scheduling category for a 2 week horizon

clc
clear


%code will look into excel and read matrix 
filename = 'Range II Changeover Data Collection.xlsm';
sheet = 5;
xlRange = 'A1:L12';
table = xlsread(filename,sheet,xlRange)


%Prompt for changeovers in box
schedinput = inputdlg('Please enter the changeovers into a string of space-separated numbers: ',...
             'Sample ', [1 50])
 
         %guide for scheduling categories
%          display(SchedCat)
         userip = str2num(schedinput{1})

%creates for loop to make table with needed changeovers

for i = 1:length(userip);
    for j = 1:length(userip);
        tempdata(i,j) = table(userip(i),userip(j));
    end
end



len = length(userip)

display(table)


display (userip)


[optimalpath, optimaldist] = bruteForce(tempdata,len)
for i=1:length(userip)
    finalpath(i,1) = userip(optimalpath(i));
end
finalpath
