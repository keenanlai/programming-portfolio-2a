// Keenan Lai | Calculator Project | 2 Oct 2024
Button[] buttons = new Button[22];
String dVal = "0";
char opp;
float l, r, result;
boolean left;
void setup() {
  size(210, 250);
  background(50);
  left = true;
  opp = ' ';
  l = 0.0;
  r = 0.0;
  result = 0.0;
  buttons[0] = new Button(45, 230, 70, 30, "0", color(90), true);
  buttons[7] = new Button(25, 190, 30, 30, "7", color(90), true);
  buttons[1] = new Button(25, 110, 30, 30, "1", color(90), true);
  buttons[4] = new Button(25, 150, 30, 30, "4", color(90), true);
  buttons[2] = new Button(65, 110, 30, 30, "2", color(90), true);
  buttons[5] = new Button(65, 150, 30, 30, "5", color(90), true);
  buttons[8] = new Button(65, 190, 30, 30, "8", color(90), true);
  buttons[3] = new Button(105, 110, 30, 30, "3", color(90), true);
  buttons[6] = new Button(105, 150, 30, 30, "6", color(90), true);
  buttons[9] = new Button(105, 190, 30, 30, "9", color(90), true);
  buttons[10] = new Button(25, 70, 30, 30, "C", color(90), false);
  buttons[11] = new Button(85, 70, 70, 30, "+/-", color(90), false);
  buttons[12] = new Button(105, 230, 30, 30, ".", color(90), false);
  buttons[13] = new Button(145, 110, 30, 30, "x", color(90), false);//×
  buttons[14] = new Button(145, 150, 30, 30, "÷", color(90), false);
  buttons[15] = new Button(145, 190, 30, 30, "-", color(90), false);
  buttons[16] = new Button(145, 230, 30, 30, "+", color(90), false);
  buttons[17] = new Button(185, 210, 30, 70, "=", color(90), false);
  buttons[18] = new Button(185, 110, 30, 30, "π", color(90), false);
  buttons[19] = new Button(185, 150, 30, 30, "%", color(90), false);
  buttons[20] = new Button(185, 70, 30, 30, "<<", color(90), false);
  buttons[21] = new Button(145, 70, 30, 30, "√", color(90), false);
}

void draw() {
  background(50);
  println("Left:" + l + " Opp: " + opp + "Right:" + r + "Result:" + result);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void updateDisplay() {
  rectMode(CENTER);
  fill(100);
  rect(width/2, 25, 190, 30);
  fill(0);
  if (dVal.length() < 17) {
    textSize(20);
  } else if (dVal.length() < 20) {
    textSize(15);
  }
  textAlign(RIGHT);
  text(dVal, width-20, 33);
}

void mousePressed() {
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal.length() < 20) {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
        l = float(dVal);
      } else {
        dVal += buttons[i].val;
        l += float(dVal);
      }
    } else if (buttons[i].on && buttons[i].isNum && !left) {
      dVal += buttons[i].val;
      r = float(dVal);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("+")) {
      dVal = "0";
      opp = '+';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("-")) {
      dVal = "0";
      opp = '-';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("x")) {
      dVal = "0";
      opp = 'x';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("÷")) {
      dVal = "0";
      opp = '÷';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("π")) {
      if (left) {
        dVal = str(PI);
        l = PI;
      } else {
        dVal = str(PI);
        r = PI;
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("√")) {
      dVal = str(sqrt(l));
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals(".")) {
      if (!dVal.contains(".")) {
        dVal += buttons[i].val;
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("%")) {
      if (left) {
        l = l * 0.01;
        dVal = str(l);
      } else {
        r = r * 0.01;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("+/-")) {
      if (left) {
        l = l * -1;
        dVal = str(l);
      } else {
        r = r * -1;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("C")) {
      left = true;
      opp = ' ';
      l = 0.0;
      r = 0.0;
      result = 0.0;
      dVal = "0";
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("<<") && dVal.length() >= 1) {
      if (left) {
        dVal = dVal.substring(0, dVal.length() -1);
        l = float(dVal);
      } else {
        dVal = dVal.substring(0, dVal.length() -1);
        r = float(dVal);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("=")) {
      performCalc();
    }
  }
}


void performCalc() {
  if (opp == '+') {
    result = l + r;
  } else if (opp == '-') {
    result = l - r;
  } else if (opp == 'x') {
    result = l * r;
  } else if (opp == '÷') {
    result = l / r;
  }
  dVal = str(result);
}

void handleEvent(String keyVal, boolean isNum) {
  // handle numbers
  if (left && dVal.length() < 20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length () <12 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
      r = float (dVal);
    }
  } else if (keyVal.equals ("+") && !isNum) {
    left = false;
    dVal = "O";
    opp = '+';
  }
}

void keyPressed() {
  println("Key:" + key);
  println("KeyCode:" + keyCode);
  if (key == 0 || keyCode == 96) {
    handleEvent("0", true);
  } else if (key == 1 || keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
  } else if (key == 2|| keyCode == 98 || keyCode == 50) {
    handleEvent("2", true);
  } else if (key == 3|| keyCode == 99 || keyCode == 51) {
    handleEvent("3", true);
  } else if (key == 4|| keyCode == 100 || keyCode == 52) {
    handleEvent("4", true);
  } else if (key == 5|| keyCode == 101 || keyCode == 53) {
    handleEvent("5", true);
  } else if (key == 6|| keyCode == 102 || keyCode == 54) {
    handleEvent("6", true);
  } else if (key == 7|| keyCode == 103 || keyCode == 55) {
    handleEvent("7", true);
  } else if (key == 8|| keyCode == 104 || keyCode == 56) {
    handleEvent("8", true);
  } else if (key == 9|| keyCode == 105 || keyCode == 57) {
    handleEvent("9", true);
  } else if (key == '=' || keyCode == 10 || keyCode == 187) {
    handleEvent("=", false);
  } else if (key == '.' || keyCode == 190 || keyCode == 190) {
    handleEvent(".", false);
  } else if (key == '*') {
    handleEvent("*", false);
  } else if (key == '/' || keyCode == 191 || keyCode == 111) {
  } else if (key == '+' || keyCode == 107) {
    handleEvent("+", false);
  } else if (key == '-') {
    handleEvent("-", false);
  }
}
