//Импортируем библиотеку для шрифтов
import geomerative.*;

RFont font;

//Храним все точки
RPoint[] pnts;

void setup()
{
    size(400, 400);
    
    RG.init(this);
    font = new RFont( "lucon.ttf", 72, RFont.CENTER);
    
    //Преобразуем шрифт в группу объектов
    RGroup grp = font.toGroup("VVVV");
    RCommand.setSegmentLength(10);
    RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
    
    //Преобразуем группу в точки
    pnts = grp.getPoints();
}

void draw()
{
    background(255);
    //Перемещаем все в центр
    translate(width/2,height/2);
    
    //Отрисовываем объекты
    for (int i = 0; i < pnts.length; i++) {
      noFill();
      
      //Радиус, зависящий от X мыши
      float rad = map(mouseX, 0, width, 0, 40);
      
      //Рисуем эллипс
      ellipse(pnts[i].x, pnts[i].y, rad, rad);
    }
}