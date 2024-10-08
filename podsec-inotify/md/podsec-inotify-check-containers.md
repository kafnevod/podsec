podsec-inotify-check-containers(1) -- проверка наличия изменений критических файлов rootfull и rootless контейнеров
================================

## SYNOPSIS

`podsec-inotify-check-containers`

## DESCRIPTION

Скрипт:

- создаёт список директорий `rootless` и `rootfull` контейнеров, существующих в системе,

- запускает проверку на добавление,удаление, и изменение файлов в директориях контейнеров,

- отсылает уведомление об изменении в системный лог.

Скрипт запускает два процесса мониторинга каталогов:

- мониторинг добавления пользователей в каталоге `/home/`, добавления контейнеров в каталогах `*/storage/overlay/` `rootless` и `rootfull` пользователей (список формируется в файле `/tmp/inotifyMonitor.tmp`);

- мониторинг изменения файлов в контейнерах `rootless` и `rootfull` пользователей (список формируется в файле `/tmp/inotifyOverlays.tmp`).

Первый процесс при изменении отслеживаемых каталогов формирует списки в файлах мониторинга `/tmp/inotifyMonitor.tmp`, `/tmp/inotifyOverlays.tmp`, перезапускает себя и второй процесс мониторинга изменения файлов в контейнерах.

Второй процесс изменения файлов в контейнерах монитрит все файлы и каталоги за исключением файлов и каталогов
в корневых каталогах  `/var/`, `/proc/`, `/tmp/`, `/run/`,
которые могут инфенсивно изменяться при работе контейнеров сервисами контейнеров.

Изменения в каталогах `/home/`, `/root/`, `/etc/` логируются в системный лог как предупреждения (уровень `Warning`).
Изменения в остальных каталогах логируются в системный лог как критические (уровень `Critical`).

Сообщения в системный лог имеют формат:
```
An event <event> occurred in the container <container> [in home directory|in configuration directory] on the file <file>
```

## SECURITY CONSIDERATIONS

- Данный скрипт запускается сервисом `podsec-inotify-check-containers.service`.

## EXAMPLES

Если в системе развернуты контейнеры, и требуется следить за модификацией файлов внутри этих контейнеров, запустите сервис `podsec-inotify-check-containers.service`:
```
# systemctl enable --now podsec-inotify-check-containers.service
```

## AUTHOR

Burykin Nikolay, ALT Linux Team, bne@altlinux.org
Kostarev Alexey, ALT Linux Team, kaf@basealt.ru
