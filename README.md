# Custom Report SQL subquery

[Github](https://github.com/SidorkinAlex/Opportunities_kanban) | 
[Ru](#Кастомизация-отчетов-для-написания-подзапросов-для-столбцов) |
[En](#Custom-Report)

![image](http://web-seedteam.ru/wp-content/uploads/2021/01/report1.png)
![image](http://web-seedteam.ru/wp-content/uploads/2021/01/report2.png)
![image](http://web-seedteam.ru/wp-content/uploads/2021/01/report3.png)
![image](http://web-seedteam.ru/wp-content/uploads/2021/01/report4-1.png)
![image](http://web-seedteam.ru/wp-content/uploads/2021/01/report5.png)

## support the project
https://yoomoney.ru/to/410013242088802

## поддержи проект
https://yoomoney.ru/to/410013242088802


Report customization package.
This package allows you to create subqueries for each column. Greatly expands the functionality of standard reports. Allows you to display multiple columns from a related module with different conditions in one report.

## Installation

1. Download the package from the repository (build / Build.zip) or follow the link

2. Go to Administration -> Module Loader

3. Install the package in the CRM following the prompts.


## Нow to work with it?
```diff
- after installation, you need to reset the cache files in the browser otherwise it will not work
```

### License
MIT


# Кастомизация отчетов для написания подзапросов для столбцов
[Github](https://github.com/SidorkinAlex/Opportunities_kanban) | 
[Ru](#Кабан-доска-сделок-для-SuiteCRM) |
[En](#Opportunities-Kanban-board-from-SuiteCRM)

[Установка](#Установка)


пакет кастомизации отчетов.
Данный пакет позволяет создавать подзапросы для каждого столбца. Сильно расширает функционал стандартных отчетов. Позволяет в одном отчете отобразить несколько  столбцов из связанного модуля с разными условиями.


## Установка

Перед установкой необходимо сделать резервную копию файлов системы!

Для установки необходимо скачать последную версию плагина по ссылке https://github.com/SidorkinAlex/Opportunities_kanban/releases/download/1.03/Build_1_03.zip

Далее в SuiteCRM открыть Загрузчик модулей (Администрирование -> Загрузчик модулей)

Загрузить архив с пакетом

Нажать кнопку установить.

## Натройка
После установки пакета переходим в модуль Opportunities Board

попадаем на станицу настройки канбан доски
![страница ннастройки](http://web-seedteam.ru/wp-content/uploads/2020/12/%D0%A1%D1%82%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D0%B0-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B5%D0%BA-1024x479.png)

### Сustomizing columns
Настойка колонок для канбан доски


Для натройки нужной последовательности колонок выставьте нужную вам последовательность сверху вних (будет преобразована в последовательность слева на право)
 ![настройка колонок](http://web-seedteam.ru/wp-content/uploads/2020/12/Страница-настроек-колонок.png)

 установите галочку в чекбоксе display colum для отображениия колонки на канбандоске
 
 установите галочку в чекбоксе display opportunity что бы в колонке выводилиь записи ( не рекомендуется ставить в финальных колонках завершено с успехом и отменено)
 
 
 ### Сustomizing header fields
 Настройка полей которые будут выводиться в залоговке карточки, если полей несколько то они будут разделены символом  -
 ![настройка заголовков карточек](http://web-seedteam.ru/wp-content/uploads/2020/12/screenshot-0.0.0.0-2020.12.04-18_00_14.png)
 
 
### Board column height

   Определяет высоту доски на странице
![высота доски](http://web-seedteam.ru/wp-content/uploads/2020/12/screenshot-0.0.0.0-2020.12.04-18_06_18.png)
