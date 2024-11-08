daysOfExperiment = 2;
firstSubject = 3;
lastSubject = 6;
numberOfSubject = lastSubject - firstSubject;
numOfGestures = 7;


table = cell(numberOfSubject,1);
typeOfRepetitions = ["repeat_short","repeat_long"];
numTypesOfExperiment = length(typeOfRepetitions);

for subjectNumber = firstSubject:lastSubject

    subjectsSpecificSetGestures = cell(0,numOfGestures); %

    for day = 1:daysOfExperiment
        for type = 1:numTypesOfExperiment
            filePath = "/Users/chrisdollo/Desktop/putEMG/Dataset/sub_" + string(subjectNumber) + "/sub_" + string(subjectNumber) + "_" + typeOfRepetitions(type) + "_r" + string(day) + ".mat";
            subjectGestures = getRepeatValues(filePath);

            subjectsSpecificSetGestures = [subjectsSpecificSetGestures; subjectGestures];
        end
    end

    table{subjectNumber} = subjectsSpecificSetGestures;

end

sample=table(1:3,:)
save('subject3_to_6_data2.mat', 'table', '-v7');
% save('handGesturesSample3.mat', 'table', '-v7.3');
% save('my_large_data.mat', 'T', '-v7.3');