> Регистрации подлежат как минимум следующие события безопасности:
> 
>     * неуспешные попытки аутентификации пользователей средства контейнеризации;
>     * создание, модификация и удаление образов контейнеров;
>     * получение доступа к образам контейнеров;
>     * запуск и остановка контейнеров с указанием причины остановки;
>     * изменение ролевой модели;
>     * модификация запускаемых контейнеров
>     * выявление известных уязвимостей в образах контейнеров и некорректности конфигурации;
>     * факты нарушения целостности объектов контроля.
> 
> Для каждого события безопасности должны регистрироваться:
> 
>     * описание события безопасности;
>     * сведения о критичности события безопасности.
> 
> В журнал событий безопасности информационной (автоматизированной) системы должна обеспечиваться запись событий > > > > > безопасности контейнеров с указанием идентификатора пользователя хостовой ОС, от имени которого был запущен контейнер.


Ссылки:
* [A Practical Guide to Kubernetes Logging](https://logz.io/blog/a-practical-guide-to-kubernetes-logging/)
* [Logging Architecture](https://kubernetes.io/docs/concepts/cluster-administration/logging/)
* [Securing Kubernetes with Open Source Falco and Logz.io Cloud SIEM](https://logz.io/blog/k8s-security-with-falco-and-cloud-siem/)