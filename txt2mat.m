%filename = './True.txt';
filename = './False.txt';
fileID   = fopen(filename,'r');
%data     = textscan(fileID, '%s\n');
data     = textscan(fileID, ' %f64  %f64 %f64 %f64 %f64 %f64 %f64 %f64 %f64  %f64 %f64 %f64 %f64 %f64 %f64 %f64 %f64  %f64 %f64 %f64 %f64 %f64 %f64 %f64 %f64  %f64 %f64 %f64 %f64 %f64 %f64 %f64 %f64  %f64 %f64 %f64 %f64 %f64 %f64 %f64 %f64  %f64 %f64 %f64 %f64 %f64 %f64 %f64 %f64  %f64 %f64 %f64 %f64 %f64 %f64 %f64 %f64  %f64 %f64 %f64 %f64 %f64 %f64 %f64 %f64  %f64 %f64 %f64 %f64 %f64 %f64 %f64 %f64  %f64 %f64 %f64 %f64 %f64 %f64 %f64 %f64  %f64 %f64 %f64 %f64 %f64 %f64 %f64 %f64  %f64 %f64 %f64 %f64 %f64 %f64 %f64 %f64  %f64 %f64 %f64 %f64 %f64 %f64 %f64 %f64  %f64 %f64 %f64 %f64 %f64 %f64 %f64 %f64  %f64 %f64 %f64 %f64 %f64 %f64 %f64 %f64  %f64 %f64 %f64 %f64 %f64 %f64 %f64');
%data     = data{:};
fclose(fileID);
%save('True.mat', 'data')
save('False.mat', 'data')
