## Электронная приёмная ##

Ruby v.2.0.0, Rails v.4.1.1, MongoDB v.4.0.1

### Развёртывание приложения ###

1. Клонирование проекта
   ```
   git clone https://github.com/HellLena/reception.git
   ```
2. Установка необходимых пакетов gem
   ```
   bundle install
   ```
3. Заполнение базы данных тестовыми данными
   ```
   rake db:seed
   ```

### Описание работы приложения ###

1. Стартовая страница - Вход пользователя.

   Предполагается, что самостоятельная регистрация невозможна, поэтому пользователи создаются Администратором.
   В результате выполнения команды rake db:seed в базе уже есть необходимы пользователи для входа в приложение:

   1. Администратор:
   
      логин: admin@test.com
      пароль: test1234

   2. Секретарь:
   
      логин: secretary@test.com
      пароль: test1235

   3. Министр:
   
      логин: minister@test.com
      пароль: test1236

2. После успешного входа пользователь переадресовывается на Главную страницу приложения - Обращения граждан.

   Если пользователь является Администратором, ему доступен раздел Пользователи, где он может редактировать и создавать новых пользователей.
   
   Секретарь и Министр видят одни и те же элементы страницы Обращения граждан, но имеют разные права на редактирование тех или иных элементов.
   
   Так, Секретарь имеет право редактировать элементы: ФИО, Суть обращения, Вид обращения, Контакты для обратной связи, Приоритет обращения, статус Выполнено.
   
   Министр имеет право редактировать: Приоритет обращения, Решение, Комментарий к решению.
   
   Вид обращения и решение являются типовыми, то есть выбираются из списка прописанных в базе значений. Если пользователю не достаточно того, что есть, рядом с полем редактирования добавлена функциональная кнопка "+", которая позволяет сразу же добавить в базу новые типовые решения/виды обращений.

3. Особенности редактирования:

   Редактирование таблицы происходит на месте для каждого кокретного поля. Нет необходимости нажимать дополнительные кнопки "Сохранить" и т.п. Как только пользователь изменил значение в поле редактирования - значение сразу записывается в базу. 
   
   Обращения граждан разделены на три таблицы: "Новые", "В работе"(обращения, по которым принято решение) и "Выполненные"(обращения, которым присвоен статус Выполнено). Учитывая особенности редактирования "на месте", когда Министр указывает решение, строка с данным обращением перейдёт в раздел "В работе" только после обновления страницы. Поэтому чтобы пользователь мог до обновления страницы ориентироваться в тех обращениях, которые обработал, - добавлен столбец таблицы "Обработано": как только пользователь обработал своё поле, галочка в столбце "Обработано" становится зелёной. Таким образом, пользователь может обрабатывать все обращения, потом обновить страницу - и видеть что обращения перешли в другой раздел.

4. Поиск:

   В рамках данного приложения возможен поиск по ключевым словам и по отдельно выбранным значениям, в том числе по дате.

### Особенности реализации ###

1. Для оформления приложения используется шаблон Bootstrap Flatly: https://bootswatch.com/flatly/
2. Для редактирования на месте используется библиотека X-editable: https://vitalets.github.io/x-editable/
3. Для работы с пользователями используется gem devise: https://github.com/plataformatec/devise
