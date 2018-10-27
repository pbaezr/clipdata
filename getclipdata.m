function data = getclipdata()
% GETCLIPDATA convert the contents of the clipboard to a cell array. This
% function could be useful, for example, to obtain the data copied from Excel.
%
%   data = getclipdata

% Licensed under the terms of the MIT License
% Copyright (c) 2018 Pablo Baez R.
% Author: Pablo Baez R. (pbaez@ug.uchile.cl)
% Version: 1.0 (2018-09-08)
% --------------------------------------------------------------------------------------

% get the contents of the clipboard and convert it to a java.lang.String object
c = java.awt.Toolkit.getDefaultToolkit.getSystemClipboard;
clip = java.lang.String(c.getData(java.awt.datatransfer.DataFlavor.stringFlavor));
% clip = java.lang.String(clipboard('paste'));

% convert the string to an m-by-1 java array (where m is the number of rows in the data)
rowStringData = clip.split('\n');

% split each row into individual elements (cells)
stringData = cell(0,0);
for i = 1:length(rowStringData)
    stringData(i,:) = cell(rowStringData(i).split('\t'));
end

% return 'stringData' to a numerical type if required 
numData = str2double(stringData);
ind = isnan(numData);
data = num2cell(numData);
data(ind) = stringData(ind);
