
//Импортируем библиотеку
import geomerative.*;

RFont font;
RPoint[] pnts;

//Массив точек сетки
ArrayList<PVector> vectors = new ArrayList<PVector>();

//Шаг сетки
int step = 70;

void setup()
{
    size(800, 600);
    smooth();
    
    RG.init(this);
    font = new RFont( "lucon.ttf", 250, RFont.CENTER);
    
    //Преобразуем шрифт в группу объектов
    RGroup grp = font.toGroup("4V");
    RCommand.setSegmentLength(20);
    RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
    
    //Преобразуем группу в точки
    pnts = grp.getPoints();
    
    
    //Размечаем сетку
    for(int i = 0; i < width; i+=step)
    {
      for(int j = 0; j < height; j+=step)
      {
        vectors.add(new PVector(i, j));
      }
    }
    
    //Рисуем только один кадр
    noLoop();
}

void draw()
{
    background(255);
    
    //Цвет линий
    stroke(0, 25);
    strokeWeight(0.0001);
    
    //Соединяем линии с точками шрифта
    for (int i = 0; i < pnts.length; i++) {
      for(int j = 0; j < vectors.size(); j++)
      {
        //Получаем координаты сетки
        PVector vec = vectors.get(j);
        
        //Отрисовываем линию
        line(vec.x, vec.y, pnts[i].x + width / 2, pnts[i].y + height /2 + 80);
      }
    }
}