void keyPressed() { 
  if (key=='c'||key=='C') {
    black=!black;
  }   
  if (key==' ') {
    imageProcess(nowImage);
    createDot(nowImage);
  } 
  if (key=='+') {
    div++; 
    if (!getOutsizeImage) {
      for (int i=0; i<imgNum; i++) {
        img[i]=imgCopy[i].copy();
      }  
      saveImage=imgCopy[index].copy();
      imageProcess(img[index]);
    } else { 
      imageProcess(saveImage.copy());
    }
  } else if (key=='-') {
    if (div>1) {
      div--;
    }    
    if (!getOutsizeImage) {
      for (int i=0; i<imgNum; i++) {
        img[i]=imgCopy[i].copy();
      }  
      saveImage=imgCopy[index].copy();
      imageProcess(img[index]);
    } else { 
      imageProcess(saveImage.copy());
    }
  }
  if ((key=='N'||key=='n')&&!getOutsizeImage) {
    index=(index+1)%imgNum;  
    saveImage=imgCopy[index].copy();
    imageProcess(img[index]);
    createDot(img[index]);
  }
}
