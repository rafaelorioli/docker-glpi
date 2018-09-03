# docker-glpi
Not official GLPI image

### Build
```
git clone https://github.com/gmdutra/docker-glpi
cd docker-glpi
docker build -t gmdutra/glpi .
```

### Download glpi
```
wget https://github.com/glpi-project/glpi/releases/download/9.3.0/glpi-9.3.tgz
tar -zxf glpi-9.3.tgz
rm -rf glpi-9.3.tgz
```

### Run
```
docker run -d -p 3000:80 -v $PWD/glpi:/var/www/html/glpi gmdutra/glpi
```

### Contact
```
[+]Email: gabrieldmdutra@gmail.com
[+]Linkedin: linkedin.com/in/gmdutra/
[+]Telegram: @gmdutra
```
