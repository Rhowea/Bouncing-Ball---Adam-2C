void setup(){ //setup køres kun en gang, så her indsættes funktioner som kun skal bruges en gang
  size(1000, 1000);
  background(0, 0, 0);
}

int speedX = 5 , speedY = 4; //cirklens x- og y-hastighed
int ballX = 500 , ballY = 500; //cirklens startposition - midt på skærmen
int ballR = 20; //cirklens radius
float shrink = 1; //variabel der får firkanten til at blive mindre
float squareSide; //variabel der beskriver firkantens siders position

void draw(){
  squareSide = ((700/2) - ballR) * shrink; //Her beskrives siderne af firkanten, således cirklen kan kollidere med den
  clear();
  circle(ballX, ballY, ballR); //Tegner cirklen
  ballX = ballX + speedX; //cirklens hastighed
  ballY = ballY + speedY;
  stroke(200); //Formatering
  noFill();
  color(0, 0, 0);
  rectMode(CENTER); //dette gør, at rektanglen defineres ud fra dens center, i stedet for hjørnet, hvilket gør det nemmere at arbejde med
  square(500, 500, 700*shrink); // Tegner rektanglen
  if(ballX>=500 - squareSide){ //Kollision med højre side
    speedX = -speedX;
  }
  if(ballX>500 - squareSide){ //rykker cirklen en smule inad, for at undgå at den falder udenfor cirklen
    ballX = ballX - ballR;
  }
  if(ballX<=500 + squareSide){ //Kollision med venstre side
    speedX = -speedX;
  }
  if(ballX<500 + squareSide){ //rykker cirklen en smule inad, for at undgå at den falder udenfor cirklen
    ballX = ballX + ballR;
  }
  if(ballY>=500 - squareSide){ //Kollision med nederste side
    speedY = -speedY;
  }
  if(ballY>500 - squareSide){ //rykker cirklen en smule inad, for at undgå at den falder udenfor cirklen
    ballY = ballY - ballR;
  }
  if(ballY<=500 + squareSide){ //Kollision med øverste side
    speedY = -speedY;
  }
  if(ballY < 500 + squareSide){ //rykker cirklen en smule inad, for at undgå at den falder udenfor cirklen
    ballY = ballY + ballR;
  }
  shrink = shrink - 0.001; //Gør firkanten og dens sider mindre
}
