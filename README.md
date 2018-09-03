# docker-glpi
Not official GLPI image

### Build
```
git clone https://github.com/gmdutra/docker-glpi
docker build -t gmdutra/glpi .
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
