# my-first-devops
**1) Установка Git и создание аккаунта GitHub.**

**Установка Git**

- Выполнял задание на Ubuntu, поэтому пропишу в терминал команду:
```
sudo apt install git-all
```
- Проверил работоспособность с помощью команды:
```
git --version
```
**Создание аккаунта GitHub**

- Аккаунт у меня уже был, поэтому пропущу этот шаг

- Далле настроил ssh-ключи выполнив последовательность команд:

```
ssh-keygen -t ed25519 -C "имя почты"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub | xclip -sel clip
```
- Перейду в настройки GitHub, в раздел SSH and GPG keys и нажму кнопку "новый ssh ключ"
- Скопированный ключ вставлю в предоставленное окно и нажму кнопку "добавить ssh ключ"

**Создание репозитория и README.md**

- Перейду в GitHub и создам репозиторий с галочкой добавить README.md

**Установка Docker и запуск контейнеров**

- Воспользуюсь командами из документации:
```
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

- После установки разграничим права на docker:

```
sudo groupadd docker

sudo usermod -aG docker $USER

newgrp docker
```

**Запуск контейнеров**

- Введём команду:

```
docker run hello-world
```
Вывод команды:
![cvbt.JPG](screenshots%2Fcvbt.JPG)

- Создадим Dockerfile, который будет запускать внутри себя скрипт

```
FROM alpine:3.18 AS builder

RUN apk add --no-cache python3

FROM builder

COPY script.py .

CMD ["python", "script.py"]
```
Как можем видеть, контейнер работает
![ghm.JPG](screenshots%2Fghm.JPG)