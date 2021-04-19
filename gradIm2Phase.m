function phaseIm = gradIm2Phase(inIm, phaseOffset)

  % inIm is a gradient image whose compoents are in the range 0 to 255
  % phaseIm is the phase image in the range 0 to 255
  scaledgx = double(inIm(:,:,1)/255.0);
  scaledgy = double(inIm(:,:,2)/255.0);

  scaledgx = ((scaledgx)*(2*pi))-pi;
  scaledgy = ((scaledgy)*(2*pi))-pi;

  phat = intgrad2(scaledgx,scaledgy,[],[],phaseOffset);
  phat_wrapped = angle(exp(1i*phat));
  phaseIm = round(255*(phat_wrapped+pi)/(2*pi));
  
