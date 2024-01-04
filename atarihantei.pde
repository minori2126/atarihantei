PVector point=new PVector(100,800);
block[][] b=new block[9][9];

void setup(){
  size(900,900);
  
  for(int i=0;i<9;i++){
    for(int j=0;j<9;j++){
      b[i][j]=new block(i*50+100,j*50+100);
    }
  }
  
}

void draw(){
  background(0);
  fill(255);
  rect(point.x-25,point.y-25,50,50);
  move();
  
  
  for(int i=0;i<b.length;i++){
    for(int j=0;j<b[i].length;j++){
      b[i][j].display();
      b[i][j].collision();
    }
  }
  
  
  point.add(move);
}

boolean w,a,s,d;

void keyPressed(){
  if(key=='w')w=true;
  if(key=='a')a=true;
  if(key=='s')s=true;
  if(key=='d')d=true;
}
void keyReleased(){
  if(key=='w')w=false;
  if(key=='a')a=false;
  if(key=='s')s=false;
  if(key=='d')d=false;
}

PVector vw=new PVector(),va=new PVector(),vs=new PVector(),vd=new PVector(),move=new PVector();
void move(){
  if(w)vw.set(0,-2);
  else vw.mult(0);
  if(a)va.set(-2,0);
  else va.mult(0);
  if(s)vs.set(0,2);
  else vs.mult(0);
  if(d)vd.set(2,0);
  else vd.mult(0);
  
  move.mult(0);
  move.add(vw).add(va).add(vs).add(vd);
}

class block{
  PVector xy=new PVector();
  int size=50;
  block(int x,int y){
    this.xy.set(x,y);
  }
  
  void display(){
    fill(0,255,0);
    rect(xy.x-size/2,xy.y-size/2,size,size);
  }
  
  void collision(){
    PVector next=PVector.add(point,move);
    
    boolean x=this.xy.x+25>next.x-25 && this.xy.x-25<next.x+25;
    boolean y=this.xy.y+25>next.y-25 && this.xy.y-25<next.y+25;
    if(x && y){
      if(move.x>0){
        float moveX=move.x;
        //move.x=0;
        for(int i=0;i<moveX;i++){
          if(this.xy.x-25<point.x+25+i)break;
          else move.x=i;
        }
      }
      if(move.x<0){
        float moveX=move.x;
        for(int i=0;i>moveX;i--){
          if(this.xy.x+25>point.x-25+i)break;
          else move.x=i;
        }
      }
      if(move.y>0){
        float moveY=move.y;
        for(int i=0;i<moveY;i++){
          if(this.xy.y-25<point.y+25+i)break;
          else move.y=i;
          
        }
      }
      if(move.y<0){
        float moveY=move.y;
        for(int i=0;i>moveY;i--){
          if(this.xy.y+25>point.y-25+i)break;
          else move.y=i;
        }
      }
      
    }
  }
}
