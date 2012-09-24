clear all
clc
stacksize("max");
Path=('C:\Users\Pratyush\Downloads\Image Processing IITB\Eigen faces_04092012\PCA_based Face Recognition System');
TrainDatabasePath = ('C:\Users\Pratyush\Downloads\Image Processing IITB\Eigen faces_04092012\PCA_based Face Recognition System\TrainDatabase');
TestDatabasePath =  ('C:\Users\Pratyush\Downloads\Image Processing IITB\Eigen faces_04092012\PCA_based Face Recognition System\TestDatabase');

exec(Path+'\CreateDatabase.sci');
exec(Path+'\EigenfaceCore.sci');
exec(Path+'\Recognition.sci');

//prompt('Enter test image name (a number between 1 to 10):');
//dlg_title = 'Input of PCA-Based Face Recognition System';
//num_lines= 1;
//def = {'1'}; 

x  = input("Enter test image name(number between 1 to 10)");
x=int2str(x);
TestImage = TestDatabasePath+'\'+x+'.jpg';
im = imread(TestImage);

T=CreateDatabase(TrainDatabasePath);
[m, A, Eigenfaces] = EigenfaceCore(T);
OutputName = Recognition(TestImage, m, A, Eigenfaces);

SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);

imshow(im)
title('Test Image');
figure();
title('Equivalent Image');
imshow(SelectedImage);


str = strcat('Matched image is :  ',OutputName);
disp(str)
