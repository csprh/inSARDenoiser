function denoiseInSAR;
	
run /Users/csprh/Dlaptop/MATLAB/TOOLBOXES/matconvnet-1.0-beta25/matlab/vl_setupnn

inputDir = './';
inputIm = 'testGradIm1.png';
inputIm = 'testGradIm2.png';
inputIm = 'testIm1.png';
inputIm = 'testIm2.png';
modName = './models/model_InSAR_1_0_COMET-epoch-20.mat';

load(modName);

net = vl_simplenn_tidy(net);
net.layers = net.layers(1:end-1);
net = vl_simplenn_tidy(net);

numStrIm = [inputDir inputIm];
inputIm = im2double(imread(numStrIm));
phIm = Phase2GradIm(inputIm);

input = single(phIm)/255;

%the input to the net must be 0-1;
res    = vl_simplenn(net,input,[],[],'conserveMemory',true,'mode','test','CuDNN', 'true');
outIm = res(end).x;

outImWrap = gradIm2Phase(outIm , 0);
invertphIm = gradIm2Phase(input , 0);
imwrite(uint8(outImWrap), outStr);



