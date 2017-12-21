
//Импортируем библиотеку для шрифтов
import geomerative.*;

RFont font;

void setup()
{
    size(1280,400);
    
    //Инициализируем средства работы со шрифтами
    RG.init(this);
    
    //Подгружаем шрифт
    font = new RFont("lucon.ttf", 72, RFont.CENTER);
}

void draw()
{
    background(255);
    
    //Перемещаем все в центр
    translate(width/2,height/2);

    //Преобразуем шрифт в группу объектов
    RGroup grp = font.toGroup("Hello, i'm a group");
    
    //Преобразуем группу в точки
    RPoint[] pnts = grp.getPoints();
    
    //Отрисовываем объекты
    for ( RPoint point: pnts)
    {
        ellipse(point.x, point.y, 5, 5);
    }
}