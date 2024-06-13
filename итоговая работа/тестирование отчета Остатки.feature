﻿#language: ru

@tree

Функционал: тестирование отчета Остатки

Как Тестировщик я хочу
протестировать отчеты
чтобы проверить, что у пользователя не возникнет проблем 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: 1001_ подготовительный сценарий (тестирование отчетов)
	Когда загрузка поступления товаров

Сценарий: 1002_ проверка отчета Остатки
	И В командном интерфейсе я выбираю 'Закупки' 'Остатки товаров'
	Тогда открылось окно 'Остатки товаров'
	И в табличном документе 'Результат' я перехожу к ячейке "R1C1"
	И я нажимаю на кнопку с именем 'ФормаЗагрузитьВариант'
	Тогда открылось окно 'Выбор варианта отчета'
	И я нажимаю на кнопку с именем 'Загрузить'
	И Пауза 20
	Тогда открылось окно 'Остатки товаров'
	И я нажимаю на кнопку с именем 'ФормаСформировать'
@screenshot
	Тогда табличный документ "Результат" равен:
		| 'Параметры:'  | 'Период: 06.06.2024 0:00:00' | ''                   |
		| ''            | ''                           | ''                   |
		| 'Товар'       | 'Склад отдела продаж'        | 'Итого'              |
		| ''            | 'Количество Остаток'         | 'Количество Остаток' |
		| 'Sony К3456P' | '50,00'                      | '50,00'              |
		| 'Veko67NE'    | '50,00'                      | '50,00'              |
		| 'Молоко'      | '100,00'                     | '100,00'             |
		| 'Торт '       | '100,00'                     | '100,00'             |
		| 'Итого'       | '300,00'                     | '300,00'             |
	И в табличном документе "Результат" ячейка с адресом "R10C3" равна "300,00" по шаблону
