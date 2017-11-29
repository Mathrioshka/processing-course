/* --------------------------------------------------------------------------
 * SimpleOpenNI NITE Hands
 * --------------------------------------------------------------------------
 * Processing Wrapper for the OpenNI/Kinect library
 * http://code.google.com/p/simple-openni
 * --------------------------------------------------------------------------
 * prog:  Max Rheiner / Interaction Design / zhdk / http://iad.zhdk.ch/
 * date:  03/19/2011 (m/d/y)
 * ----------------------------------------------------------------------------
 * This example works with multiple hands, to enable mutliple hand change
 * the ini file in /usr/etc/primesense/XnVHandGenerator/Nite.ini:
 *  [HandTrackerManager]
 *  AllowMultipleHands=1
 *  TrackAdditionalHands=1
 * on Windows you can find the file at:
 *  C:\Program Files (x86)\Prime Sense\NITE\Hands\Data\Nite.ini
 * ----------------------------------------------------------------------------
 */

import SimpleOpenNI.*;


SimpleOpenNI      context;

// NITE
XnVSessionManager sessionManager;
XnVFlowRouter     flowRouter;

PointDrawer       pointDrawer;

boolean handDetected = false;

void setup()
{
  context = new SimpleOpenNI(this);
   
  // mirror is by default enabled
  context.setMirror(true);
  
  // enable depthMap generation 
  context.enableDepth();
  
  // enable the hands + gesture
  context.enableGesture();
  context.enableHands();
 
  // setup NITE 
  sessionManager = context.createSessionManager("Click,Wave", "RaiseHand");

  pointDrawer = new PointDrawer();
  flowRouter = new XnVFlowRouter();
  flowRouter.SetActive(pointDrawer);
  
  sessionManager.AddListener(flowRouter);
           
  size(context.depthWidth(), context.depthHeight()); 
  smooth();
}

void draw()
{
  if (!handDetected) background(200,0,0);
  // update the cam
  context.update();
  
  // update nite
  context.update(sessionManager);
  
  // draw depthImageMap
  if(!handDetected) image(context.depthImage(),0,0);
  
  // draw the list
  pointDrawer.draw();
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
// PointDrawer keeps track of the handpoints

class PointDrawer extends XnVPointControl
{ 
  PVector realCoord;
  
  float x;
  float y;
  float r;
  int h;
  
  float pscrnX;
  float pscrnY;
  
  public PointDrawer()
  {
  }
	
  public void OnPointCreate(XnVHandPointContext cxt)
  {
    realCoord = new PVector(cxt.getPtPosition().getX(), cxt.getPtPosition().getY(), cxt.getPtPosition().getZ());
    
    println("OnPointCreate, handId: " + cxt.getNID());
    
    handDetected = true;
  }
  
  public void OnPointUpdate(XnVHandPointContext cxt)
  {
    realCoord = new PVector(cxt.getPtPosition().getX(), cxt.getPtPosition().getY(), cxt.getPtPosition().getZ());  
  }
  
  public void OnPointDestroy(long nID)
  {
    println("OnPointDestroy, handId: " + nID);
    
    handDetected = false;
  }
  
  public void draw()
  {
    if(realCoord == null) return;
    
    PVector scrn = new PVector();
    context.convertRealWorldToProjective(realCoord,scrn);
    
    float targetX = scrn.x;
  
    x += (targetX - x) * 0.1;
  
    float targetY = scrn.y;
  
    y += (targetY - y) * 0.1;
  
    float targetR = dist(scrn.x, scrn.y, pscrnX, pscrnY) * 5;
  
    r += (targetR - r) * 0.1;
  
    stroke(0);
    strokeWeight(2);
    colorMode(HSB);
    color c = color(h, 255, 255);
    fill(c);
    ellipse(x, y, r, r);
    h++;
  
    if(h > 255) {
      h = 0;
    };
    
    pscrnX = scrn.x;
    pscrnY = scrn.y;
  }

}
