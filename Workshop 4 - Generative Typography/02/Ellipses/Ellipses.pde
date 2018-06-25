//Импортируем библиотеку для шрифтов
import geomerative.*;

RFont font;

//Храним все точки
RPoint[] points;

void setup()
{
    size(1280, 400);
    
    RG.init(this);
    font = new RFont( "lucon.ttf", 72, RFont.CENTER);
    
    //Преобразуем шрифт в группу объектов
    RGroup grp = font.toGroup("Hi, good morning");
    RCommand.setSegmentLength(10);
    RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
    
    //Преобразуем группу в точки
    points = grp.getPoints();
}

void draw()
{
    background(255);
    //Перемещаем все в центр
    translate(width/2, height/2);
    
    //Радиус, зависящий от X мыши
    float rad = map(mouseX, 0, width, 0, 40);
    //noFill();
    
    //Отрисовываем объекты
    for (RPoint point: points) {
      //Рисуем эллипс
      ellipse(point.x, point.y, rad * noise(point.x, point.y), rad * noise(point.x, point.y));
    }
}