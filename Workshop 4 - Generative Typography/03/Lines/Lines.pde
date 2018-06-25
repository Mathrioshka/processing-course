
//Импортируем библиотеку
import geomerative.*;

RFont font;
RPoint[] points;

//Массив точек сетки
ArrayList<PVector> vectors = new ArrayList<PVector>();

void setup()
{
    size(1280, 600);
    
    RG.init(this);
    font = new RFont( "lucon.ttf", 250, RFont.CENTER);
    
    //Преобразуем шрифт в группу объектов
    RGroup grp = font.toGroup("People");
    RCommand.setSegmentLength(20);
    RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
    
    //Преобразуем группу в точки
    points = grp.getPoints();
    
    //Шаг сетки
    int step = 70;
    
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
    for (RPoint point : points) 
    {
      for(PVector vector : vectors)
      { 
        //Отрисовываем линию
        line(vector.x, vector.y, point.x + width / 2 + noise(point.x, point.y) * 8, 
             point.y + height /2 + noise(point.x, point.y));
      }
    }
}