
//Импортируем библиотеку для шрифтов
import geomerative.*;

RFont font;

void setup()
{
    size(1280,400);
    
    //Инициализируем средства работы со шрифтами
    RG.init(this);
    
    //Подгружаем шрифт
    font = new RFont( "lucon.ttf", 72, RFont.CENTER);
}

void draw()
{
    background(255);
    
    //Перемещаем все в центр
    translate(width/2,height/2);

    //Преобразуем шрифт в группу объектов
    RGroup grp = font.toGroup("Good Morning");
    
    //задаем длину сегмента
    float segmentLenght = map(mouseX, 0, width, 0, 100);
    RCommand.setSegmentLength(segmentLenght);
    RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
    
    //Преобразуем группу в точки
    RPoint[] points = grp.getPoints();
    
    //Отрисовываем объекты
    for ( RPoint point: points )
    {
        ellipse(point.x, point.y, 5, 5);
    }
}