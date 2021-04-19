function outIm = Phase2GradIm(inIm)

  p = (double(inIm)/255.0)*(2*pi)-pi;
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