﻿#language: ru

@tree

Функционал: проверка формы документа Заказ покупателя

Как Тестировщик я хочу
проверить заполнение полей
чтобы убедиться, что при работе пользователя не возникнет ошибок  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: проверка заполнения полей в документе Заказ покупателя
*Проверка заполнения полей Партнер, Соглашение
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	Тогда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Заказ покупателя (создание)'
	И я нажимаю кнопку выбора у поля с именем "Partner"
	Тогда открылось окно 'Партнеры'
	И в таблице "List" я активизирую поле с именем "Description"
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Заказ покупателя (создание) *'
	И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
	Тогда элемент формы с именем "Agreement" стал равен 'Соглашение с клиентами (расчет по документам + кредитный лимит)'
*Проверка блокировки поля Контрагент
	Когда открылось окно 'Заказ покупателя (создание) *'
	И в поле с именем 'Partner' я ввожу текст ''
	Тогда элемент формы с именем "Partner" стал равен ''
	И элемент "LegalName" не доступен для редактирования Тогда
	
			
