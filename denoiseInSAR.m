function denoiseInSAR;
gpuDevice();

run /home/cosc/csprh/linux/code/matconvnet-1.0-beta25/matlab/vl_setupnn


scratchDir = '/space/csprh/inSAR/';
inputDir  = [scratchDir 'COMET/'];
ImNum = 10;
modName = '/home/cosc/csprh/linux/code/den2/DnCNN_inSAR/TrainingCodes/DnCNN_InSAR/data/model_InSAR_1_0/model_InSAR_1_0-epoch-70.mat';

load(fullfile(nameOfModel));

net = vl_simplenn_tidy(net);
net.layers = net.layers(1:end-1);
net = vl_simplenn_tidy(net);

numStrIm = sprintf([inputDir 'ST%05d.png'],ImNum);
inputIm = im2double(imread(numStrIm));
phIm = Phase2GradIm(inputIm);

input = single(phIm);

res    = vl_simplenn(net,input,[],[],'conserveMemory',true,'mode','test','CuDNN', 'true');

outIm = double(input - res(end).x);

outImWrap = pgradIm2Phase(outIm , 0);
imwrite(uint8(outImWrap), outStr);



