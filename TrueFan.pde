
PGraphics maskCenter;
PImage imgOutput;
PImage imgMask[];

int onetime = 0;
int vdoIndex = 0;
int frame=0;
String strframe="";

int frameCount = 499;
int[] imgMaskConfig= {8,8,8,8, 
                      2,2,2,6,
                      4,1,1,1,
                      0,0,0,5,
                      4,1,1,1,
                      0,0,0,5,
                      4,1,1,1,
                      0,0,0,5,
                      4,1,1,1,
                      0,0,0,5,
                      4,1,1,1,
                      0,0,0,5,
                      4,1,1,1,
                      0,0,0,5,
                      4,1,1,1,
                      0,0,0,5,
                      4,1,1,1,
                      0,0,0,5,
                      4,1,1,1,
                      0,0,0,5,
                      4,1,1,1,
                      3,3,3,7,
                      8,8,8,8
                     };
void setup() {
  //frameRate(25);
  size(612, 612);  
  background(0);
  noSmooth();
  noLoop();

  imgMask = new PImage[9];
  imgMask[0] = loadImage("mask612/C1.png");
  imgMask[1] = loadImage("mask612/Center.png");
  imgMask[2] = loadImage("mask612/L.png");
  imgMask[3] = loadImage("mask612/R.png");
  imgMask[4] = loadImage("mask612/UP.png");
  imgMask[5] = loadImage("mask612/Down.png");
  imgMask[6] = loadImage("mask612/Down08.png");
  imgMask[7] = loadImage("mask612/Down88.png");
  imgMask[8] = loadImage("mask612/Black.png");

}

void draw() {  
  

  
   if (onetime == 0){
      onetime = 1;
      for(int frame=0;frame<=frameCount;frame++){
        //frame = 15;
         strframe = str(frame);
         println("picture process= "+frame+"/"+frameCount);
         
         //PImage imageSrc = loadImage("source/imageseq1/TrueStart-"+strframe+".png");
         PImage imageSrc = loadImage("source/imageseq2/TrunEnd-"+strframe+".png");

         //back
          vdoIndex = 0;
          for(int PosX=2; PosX<=1762; PosX=PosX+160){
            for(int PosY=2; PosY<=482; PosY=PosY+160){
                PImage imageSrcCrop = imageSrc.get(PosX, PosY, 156, 156);
                image(imageSrcCrop,0,0,612,612);
                image(imgMask[imgMaskConfig[vdoIndex]],0,0,612,612);
                save("out/vdo"+(vdoIndex+1)+"/frame"+strframe+".png");
                vdoIndex++;
              }
              vdoIndex=vdoIndex+4;
            }
        //front
        vdoIndex = 4;
          for(int PosX=82; PosX<=1682; PosX=PosX+160){
            for(int PosY=82; PosY<=562; PosY=PosY+160){
      
              PImage imageSrcCrop = imageSrc.get(PosX, PosY, 156, 156);
              image(imageSrcCrop,0,0,612,612);
              image(imgMask[imgMaskConfig[vdoIndex]],0,0,612,612);
              save("out/vdo"+(vdoIndex+1)+"/frame"+strframe+".png");
              vdoIndex++;
            }
            vdoIndex=vdoIndex+4;
          }   

      } //End For
      
    }

}

void keyPressed() {
  
  if(keyCode == 32) {
    // space-bar
     //movie.play();
  }
  else if(key == 's'){
     //movie.stop(); 
  }
    else if(key == 'p'){
     //movie.pause(); 
  }
  
}
