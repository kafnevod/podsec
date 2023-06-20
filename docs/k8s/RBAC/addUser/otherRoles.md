# Настройка других ролей

При работа в кластере группы пользователей различной специализации необходимо будет добавлять другие обычные и кластерные роли.

В рамках проекта кроме администратора проекта необходимо будет выделить роли:
* разработчиков
* тестеров
* devops-инженеров
* ...

В рамках кластера возможно выделение из ролей **администратора информационной (автоматизированной) системы** и **администратора безопасности средства контейнеризации** подролей:
* генератора приватных ключей и запроса на подпись сертификатов;
* подписание или отказа на запроса на подпись сертификатов;
* создателя обычных и клаcтерных ролей;
* и других ролей, описанных в таблице [Другие кластерные роли](https://gitea.basealt.ru/kaf/RBAC/src/branch/main/addUser/rolesDescribe.md#%D0%B4%D1%80%D1%83%D0%B3%D0%B8%D0%B5-%D0%BA%D0%BB%D0%B0%D1%81%D1%82%D0%B5%D1%80%D0%BD%D1%8B%D0%B5-%D1%80%D0%BE%D0%BB%D0%B8) 

Для этого можно использовать описанные выше механизмы создания кластерных и обычных ролей и их привязку и пользователям.