<div align="center">
    <p>
      <img src="images/hlds-pack.png" alt="Half-life Dedicated Server for Linux" />
    </p>
    <p>
      <a href="README.md"><img src="images/en_US.png" alt="English Language"/> English</a> — <a href="README-es_ES.md"><img src="images/es_ES.png" alt="Idioma Español"/> Español</a>
    </p>
</div>

# HLDS Pack (ReHLDS + AmxModX + Metamod-r)

Este es un pack completo para un servidor dedicado de Half-life que incluye:

- Archivos base traidos desde la misma Steam.
- [ReHLDS](https://github.com/dreamstalker/rehlds) (desde [esta imagen docker](https://github.com/dapize/rehlds))
- [AMX Mod X](https://github.com/alliedmodders/amxmodx/tree/1.9-dev) siempre la versión más reciente.
- [Metamod-r](https://github.com/theAsmodai/metamod-r) siempre la versión más reciente.

## ¿Cómo usarlo?

Importando los comandos desde la imagen padre...

```
docker run -d --name my-hlds-server\
 -p 26900:26900/udp\
 -p 27020:27020/udp\
 -p 27015:27015/udp\
 -p 27015:27015\
 -e SERVER_NAME="My HLDS Pack Server"\
 -e START_MAP="crossfire"\
 -e MAXPLAYERS="32"\
 -e RCON_PASSWORD="secret"\
 dapize/hlds-pack:latest
```

**_y eso es todo!_**

> Los archivos están localizados en la ruta: /opt/hlds

## Si usas docker-compose

Puedes usar este ejemplo escrito en el archivo docker-compose.yaml:

```
version: "2"
services:
  rehlds:
    image: dapize/hlds-pack:latest
    environment:
      SERVER_NAME: "My HLDS Pack Server"
      START_MAP: "crossfire"
      MAXPLAYERS: "32"
      RCON_PASSWORD: "secret"
    ports:
      - 26900:26900/udp
      - 27020:27020/udp
      - 27015:27015/udp
      - 27015:27015/tcp
```

## 📚 ¿Necesitas ayuda?

Hazme saber si tienes algúna duda

## 🧾 Licencia

El código de la documentación son publicadcos bajo la licencia [MIT](LICENSE).
