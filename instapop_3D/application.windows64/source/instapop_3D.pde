import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim minim;
AudioInput in;
ArrayList<PImage> imageMap;
PImage p;
PImage p1; 
PImage p2;
PImage p3;
PImage p4;
PImage p5; 
PImage p6;
PImage p7;

int index;

BeatDetect beat;
float eRadius;
int count;
static float depth = -600;
Image[] images;
void setup() {
  size(1280, 720, P3D);

  minim = new Minim(this);
  minim.debugOn();
  frameRate(20);
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 1024);
  p = loadImage("viewer.jpeg");
  imageMap = new ArrayList<PImage>();
  for (int i = 0; i < 20; i++) {
    if (i == 0)
      imageMap.add(loadImage("viewer.jpeg"));
    else
      imageMap.add(loadImage("viewer-"+i+".jpeg"));
  }

  beat = new BeatDetect(in.bufferSize(), in.sampleRate());
  beat.setSensitivity(100);
  rectMode(CENTER);
  eRadius = 20;

  p = imageMap.get(0);
  p1 = imageMap.get(1); 
  p2 = imageMap.get(2);
  p3 = imageMap.get(3);

  count = 0;
  index = 0;
  textureMode(NORMALIZED);
}

void draw() {
  //fill(0, 100);
  background(0, 5); 
  //rect(width/2, height/2, width, height);

  boolean replace;


  if (frameCount % 24 == 0) {
     count++;
    if(count > imageMap.size()-1){
      count = 0;
    }
  }
  else {
    replace = false;
  }

  beat.detect(in.mix);
  if (beat.isKick()) {
    eRadius = 175;
  }
  eRadius *= 0.95;
  if ( eRadius < 85 ) {
    eRadius = 85;
  }


  stroke(255);
  // draw the waveforms
  for (int i = 0; i < in.bufferSize() - 1; i+=50)
  {
    float x = map(i, 0, in.bufferSize() - 1, -100, -50);
    float y = map(in.left.get(i), -1, 1, -i*4+1, i*4+1);
    float t = map(i, 0, in.bufferSize() - 1, -250, -10000);
    float d = map(i, 0, in.bufferSize() - 1, 0, 200);
  
    float y1 = y+height/4;
    
    float y2 = y+height/2;
    
    float y3 = y+3*height/4;

    p = imageMap.get((count+i)%(imageMap.size()-1));
    p1 = imageMap.get((count+i+1)%(imageMap.size()-1));
    p2 = imageMap.get((count+i+2)%(imageMap.size()-1));
    p3 = imageMap.get((count+i+3)%(imageMap.size()-1));
    p4 = imageMap.get((count+i+4)%(imageMap.size()-1));
    p5 = imageMap.get((count+i+5)%(imageMap.size()-1));
    p6 = imageMap.get((count+i+6)%(imageMap.size()-1));
    p7 = imageMap.get((count+i+7)%(imageMap.size()-1));
  
    
   
    beginShape();
    texture(p);
    vertex(x-eRadius, y1-eRadius, t, 0, 0);
    vertex(x-eRadius, y1+eRadius, t, 0, 100);
    vertex(x+eRadius, y1+eRadius, t, 100, 100);
    vertex(x+eRadius, y1-eRadius, t, 100, 0);

    endShape(CLOSE);


    //p = imageMap.get((i+1%(imageMap.size()-1)+frameCount%(imageMap.size()-1))%(imageMap.size()-1));

    x = map(i, 0, in.bufferSize() - 1, 400, 450);

    beginShape();
    texture(p1);
    vertex(x-eRadius, y1-eRadius, t, 0, 0);
    vertex(x-eRadius, y1+eRadius, t, 0, 100);
    vertex(x+eRadius, y1+eRadius, t, 100, 100);
    vertex(x+eRadius, y1-eRadius, t, 100, 0);

    endShape(CLOSE);

    //p = imageMap.get((i+2%(imageMap.size()-1)+frameCount%(imageMap.size()-1))%(imageMap.size()-1));

    x = map(i, 0, in.bufferSize() - 1, 900, 950);

    beginShape();
    texture(p2);
    vertex(x-eRadius, y1-eRadius, t, 0, 0);
    vertex(x-eRadius, y1+eRadius, t, 0, 100);
    vertex(x+eRadius, y1+eRadius, t, 100, 100);
    vertex(x+eRadius, y1-eRadius, t, 100, 0);

    endShape(CLOSE);


    //p = imageMap.get((i+3%(imageMap.size()-1)+frameCount%(imageMap.size()-1))%(imageMap.size()-1));

    x = map(i, 0, in.bufferSize() - 1, 1400, 1450);

    beginShape();
    texture(p3);
    vertex(x-eRadius, y1-eRadius, t, 0, 0);
    vertex(x-eRadius, y1+eRadius, t, 0, 100);
    vertex(x+eRadius, y1+eRadius, t, 100, 100);
    vertex(x+eRadius, y1-eRadius, t, 100, 0);

    endShape(CLOSE);



    x = map(i, 0, in.bufferSize() - 1, -100, -50);

    beginShape();
    texture(p4);
    vertex(x-eRadius, y3-eRadius, t, 0, 0);
    vertex(x-eRadius, y3+eRadius, t, 0, 100);
    vertex(x+eRadius, y3+eRadius, t, 100, 100);
    vertex(x+eRadius, y3-eRadius, t, 100, 0);

    endShape(CLOSE);


    //p = imageMap.get((i+1%(imageMap.size()-1)+frameCount%(imageMap.size()-1))%(imageMap.size()-1));

    x = map(i, 0, in.bufferSize() - 1, 400, 450);

    beginShape();
    texture(p5);
    vertex(x-eRadius, y3-eRadius, t, 0, 0);
    vertex(x-eRadius, y3+eRadius, t, 0, 100);
    vertex(x+eRadius, y3+eRadius, t, 100, 100);
    vertex(x+eRadius, y3-eRadius, t, 100, 0);

    endShape(CLOSE);

    //p = imageMap.get((i+2%(imageMap.size()-1)+frameCount%(imageMap.size()-1))%(imageMap.size()-1));

    x = map(i, 0, in.bufferSize() - 1, 900, 950);

    beginShape();
    texture(p6);
    vertex(x-eRadius, y3-eRadius, t, 0, 0);
    vertex(x-eRadius, y3+eRadius, t, 0, 100);
    vertex(x+eRadius, y3+eRadius, t, 100, 100);
    vertex(x+eRadius, y3-eRadius, t, 100, 0);

    endShape(CLOSE);


    //p = imageMap.get((i+3%(imageMap.size()-1)+frameCount%(imageMap.size()-1))%(imageMap.size()-1));

    x = map(i, 0, in.bufferSize() - 1, 1400, 1450);

    beginShape();
    texture(p7);
    vertex(x-eRadius, y3-eRadius, t, 0, 0);
    vertex(x-eRadius, y3+eRadius, t, 0, 100);
    vertex(x+eRadius, y3+eRadius, t, 100, 100);
    vertex(x+eRadius, y3-eRadius, t, 100, 0);

    endShape(CLOSE);



    //    beginShape();
    //    texture(p);
    //    vertex(x+400, y, t, 0, 0);
    //    vertex(x+400, y+300, t, 0, 100);
    //    vertex(x+400+300, y+300,t,100, 100);
    //    vertex(x+400+300, y, t, 100, 0);
    //    
    //    endShape(CLOSE);
    //    
    //    
    //    beginShape();
    //    texture(p);
    //    vertex(x+400, y, t, 0, 0);
    //    vertex(x+400, y+300, t, 0, 100);
    //    vertex(x+400+300, y+300,t,100, 100);
    //    vertex(x+400+300, y, t, 100, 0);
    //    
    //    endShape(CLOSE);
    //    beginShape();
    //    texture(p);
    //    vertex(x+400*2, y, t, 0, 0);
    //    vertex(x+400*2, y+300, t, 0, 100);
    //    vertex(x+400*2+300, y+300,t,100, 100);
    //    vertex(x+400*2+300, y, t, 100, 0);
    //    
    //    endShape(CLOSE);
    //    beginShape();
    //    texture(p);
    //    vertex(x+400*3, y, t, 0, 0);
    //    vertex(x+400*3, y+300, t, 0, 100);
    //    vertex(x+400*3+300, y+300,t,100, 100);
    //    vertex(x+400*3+300, y, t, 100, 0);
    //    
    //    endShape(CLOSE);
    //    beginShape();
    //    texture(p);
    //    vertex(x+400*4, y, t, 0, 0);
    //    vertex(x+400*4, y+300, t, 0, 100);
    //    vertex(x+400*4+300, y+300,t,100, 100);
    //    vertex(x+400*4+300, y, t, 100, 0);
    //    
    //    endShape(CLOSE);

    //    d_x1 = 1000;
    //    p = imageMap.get((i+frameCount+2)%(imageMap.size()-1));
    //    beginShape();
    //    texture(p);
    //    vertex(x+d_x1, y+500, t, 0, 0);
    //    vertex(x+d_x1, y+500+300, t, 0, 100);
    //    vertex(x+300+d_x1, y+500+300,t,100, 100);
    //    vertex(x+300+d_x1, y+500, t, 100, 0);
    //    endShape(CLOSE);
    //
    //    d_x1 = -500;
    //    p = imageMap.get((i+frameCount+5)%(imageMap.size()-1));
    //    beginShape();
    //    texture(p);
    //    vertex(x+d_x1, y+500, t, 0, 0);
    //    vertex(x+d_x1, y+500+300, t, 0, 100);
    //    vertex(x+300+d_x1, y+500+300,t,100, 100);
    //    vertex(x+300+d_x1, y+500, t, 100, 0);
    //    endShape(CLOSE);
    //    
    //     d_x1 = -500;
    //    p = imageMap.get((i+frameCount+5)%(imageMap.size()-1));
    //    beginShape();
    //    texture(p);
    //    vertex(x+d_x1, y, t, 0, 0);
    //    vertex(x+d_x1, y+300, t, 0, 100);
    //    vertex(x+300+d_x1, y+300,t,100, 100);
    //    vertex(x+300+d_x1, y, t, 100, 0);
    //    endShape(CLOSE);
  }
  //    beginShape();
  //    vertex(30, 20, -50);
  //    vertex(85, 20, -50);
  //    vertex(85, 75, -50);
  //    vertex(30, 75, -50);
  //    endShape(CLOSE);
}

void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();

  super.stop();
}

