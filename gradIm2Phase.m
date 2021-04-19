function phaseIm = gradIm2Phase(inIm, phaseOffset)
  %Dr Paul Hill 2021.  University of Bristol.
  %convert gradient image inIm to scaled phase image
  %input inIm must be in the range 0->1 (inteferogram: 0 = -pi, 1 = pi))
  %output scaled to 0->255 with 128 effectively being zero (0=-pi,255=pi)
  scaledgx = double(inIm(:,:,1));
  scaledgy = double(inIm(:,:,2));

  scaledgx = ((scaledgx)*(2*pi))-pi;
  scaledgy = ((scaledgy)*(2*pi))-pi;

  phat = intgrad2(scaledgx,scaledgy,[],[],phaseOffset);
  phat_wrapped = angle(exp(1i*phat));
  phaseIm = round(255*(phat_wrapped+pi)/(2*pi));
  
