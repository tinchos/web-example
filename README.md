# Simple imagen web para pruebas
Web de ejemplo para laboratorio

### Local test
Primero de debe hacer el build de la imagen
```docker build --build-arg LANG=nginx --build-arg TAG=1.0.1 -t web-app:1.0.1 .```

o bien:
```bash:
docker build --build-arg LANG=nginx --build-arg TAG=1.0.1 \
  --file Dockerfile \
  --compress \
  -t web-app:1.0.1 \
  -t web-app:latest .
  ```

una vez creada la imagen podes ejecutar:
```docker run -d -p 8080:80 --name web-app web-app:1.0.1```

