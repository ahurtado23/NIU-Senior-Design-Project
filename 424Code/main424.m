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

bruteForce(tempdata,len)

% %white
% toWhitedye = table(:,1); 
% fromWhitedye = table(1,:);
% toWhiteCoating = table(:,2);
% fromWhiteCoating = table(2,:);
% toWhiteFinish = table(:,3);
% fromWhiteFinish = table(3,:);
% toWhiteSkew = table(:,4);
% fromWhiteSkew = table(4,:);
% 
% %color
% toColordye = table(:,5); 
% fromColordye = table(5,:);
% toColorCoating = table(:,6);
% fromColorCoating = table(6,:);
% toColorFinish = tableinputdlg('Please enter the changeovers into a string of space-separated numbers: \n 1 White Coating',...
            
% fromColorFinish = table(7,:);
% toColorSkew = table(:,8);
% fromColorSkew = table(8,:);
% 
% %black
% toBlackdye = table(:,9); 
% fromBlackdye = table(9,:);
% toBlackCoating = table(:,10);
% fromBlackCoating = table(10,:);
% toBlackFinish = table(:,11);
% fromBlackFinish = table(11,:);
% toBlackSkew = table(:,12);
% fromBlackSkew = table(12,:);
% 
% prompt = 'What are the scheduling categories you would like to schedule?'
% x = input(prompt)
% 
% %we are attempting to display shortest path
% [path, dist] = shortestPath(table)

% 
% while true
% %asking for the amount of cities one wants to visit
% num = input('\n\n\n\n\n\nHow many changeovers would you like to schedule\n');
%     if num < 1
% %loops for invalid input
% fprintfdlg('Sorry, %d is not a valid number of changeovers', num);
%     else
% break;
% end
% end

% cities = zeros(num+1, 1);
% curr = '';
% while true
% %asking for initial position
% curr = inputdlg('Which changeover do you want to start from?');
% [found, cities(1)] = isFound(curr, Data);
% if found
% break;
% end
% end

% for i = 1:num
% while true
% %asking for each of the following destinations
% s =sprintf('What is your next destination?(%d out of %d)\n',i,num);
% curr = inputdlg(s);
% [found, cities(i+1)] = isFound(curr, Data);
% if found
% break;
% end
% end
% end



% %printing results
% ID = fopen('output.txt', 'wb');
% if ID~= -1
% fprintf(ID,'The scheduling sequence you should follow is:\n');
% fprintf(ID, '%s - ', Data.city{cities(path(1:end-1))});
% fprintf(ID,'%s\nTime: %0.0f km\n', Data.city{cities(1)}, dist);
% fclose(ID);
% disp('output is in the output.txt file');
% else
% disp('cannot open file');
% end

