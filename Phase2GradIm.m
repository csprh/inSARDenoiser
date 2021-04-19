function outIm = Phase2GradIm(inIm)
  %Dr Paul Hill 2021.  University of Bristol.
  %convert inIm to 2D gradient image
  %input inIm must be in the range 0->1 (inteferogram: 0 = -pi, 1 = pi))
  %output scaled to 0->255 with 128 effectively being zero (0=-pi,255=pi)
  p = (double(inIm))*(2*pi)-pi;
  cp = exp(1i*p); rp = real(cp); ip = imag(cp);
  [prx, pry] = gradient(rp);
  [pix, piy] = gradient(ip);
  
  gx = rp.*pix-ip.*prx;
  gy = rp.*piy-ip.*pry;
  
  scaledgx = round(255*(gx+pi)/(2*pi));
  scaledgy = round(255*(gy+pi)/(2*pi));
  
  outIm(:,:,1) = uint8(scaledgx);
  outIm(:,:,2) = uint8(scaledgy);
  outIm(:,:,3) = uint8(128*ones(size(scaledgx)));