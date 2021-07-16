function img2raw(inputImageFilename, bitDepth, outputRawFilename)
%IMG2RAW converts an image into a RAW image file that can be used to create
%terrain in Unity. bitDepth can be 8 or 16.
imageIn = imread(inputImageFilename);
if(isa(imageIn, 'uint8') && bitDepth == 16)
    imageIn = uint16(imageIn) * 256;  
end
size(imageIn)
%imwrite(imageIn, outputRawFilename);
fid=fopen(outputRawFilename,'wb');
if(bitDepth == 8)
fwrite(fid,imageIn(:,:,1)','uint8');
elseif(bitDepth == 16)
fwrite(fid,imageIn(:,:,1)','uint16');        
end
fclose(fid);

end

