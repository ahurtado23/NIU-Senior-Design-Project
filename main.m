%user input scheduling category for a 2 week horizon

clc
clear all


%code will look into excel and read matrix 
filename = 'Range II Changeover Data Collection.xlsm';
sheet = 5;
xlRange = 'A1:E5';

table = xlsread(filename,sheet,xlRange)


%parse only needed scheduling categories



%white
toWhitedye = table(:,1); 
fromWhitedye = table(1,:);
toWhiteCoating = table(:,2);
fromWhiteCoating = table(2,:);
toWhiteFinish = table(:,3);
fromWhiteFinish = table(3,:);
toWhiteSkew = table(:,4);
fromWhiteSkew = table(4,:);

%color
toColordye = table(:,5); 
fromColordye = table(5,:);
% toColorCoating = table(:,6);
% fromColorCoating = table(6,:);
% toColorFinish = table(:,7);
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

%prompt scheduling categories, match indices, delete not needed indeces

while true
%asking for the amount of cities one wants to visit
num = input('\n\n\n\n\n\nHow many changeovers would you like to schedule\n');
if num < 1
%loops for invalid input
fprintfdlg('Sorry, %d is not a valid number of changeovers', num);
else
break;
end
end

cities = zeros(num+1, 1);
curr = '';
while true
%asking for initial position
curr = inputdlg('Which changeover do you want to start from?');
[found, cities(1)] = isFound(curr, Data);
if found
break;
end
end

for i = 1:num
while true
%asking for each of the following destinations
s =sprintf('What is the next changeover? (%d out of %d)\n',i,num);
curr = inputdlg(s);
[found, cities(i+1)] = isFound(curr, Data);
if found
break;
end
end
end




%generate a temp table everytime




temptable = table(1:3, 1:3)

len = length(temptable)

display(table);
display (temptable)

bruteForce(temptable,len)


% 
% %we are attempting to display shortest path
% [path, dist] = shortestPath(table)




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

