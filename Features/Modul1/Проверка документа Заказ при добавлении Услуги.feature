﻿#language: ru

@tree

Функционал: проверка добавления количества Услуг в документ Заказ 

Как Менеджер по продажам я хочу
проверку расчета количества Услуг документа Заказ  
чтобы продать услуги  

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий
	
Сценарий: проверка введения количества услуг документа Заказ
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000010' | 'Корнет ЗАО'   |
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Оптовая'
* Заполнение товарной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Доставка'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки
	И я нажимаю на кнопку "Записать"		
* Проверка заполнения табличной части
	Тогда таблица "Товары" содержит строки:
		| 'Товар'    | 'Цена'   | 'Количество' | 'Сумма'  |
		| 'Доставка' | '200,00' | '1'           | '200,00' |
* Проверка изменения количества
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	Тогда таблица "Товары" стала равной:
			| 'Товар'    | 'Цена'   | 'Количество' | 'Сумма'  |
			| 'Доставка' | '200,00' | '2'          | '400,00' |
	И я нажимаю на кнопку "Записать"
*Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Заказ (создание) *' в течение 20 секунд
* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер' |
		| "$Номер$" |

