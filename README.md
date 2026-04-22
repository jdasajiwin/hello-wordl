# Explicacion de `runs-on` en GitHub Actions

En este proyecto se usa:

```yaml
runs-on: self-hosted
```

## Que significa `runs-on`?

`runs-on` indica en que tipo de maquina se ejecuta un job del workflow.

Hay dos opciones principales:

- **GitHub-hosted** (ejemplo: `ubuntu-latest`): GitHub te presta una VM temporal.
- **Self-hosted** (`self-hosted`): el job se ejecuta en una maquina administrada por ti.

## Es on-premise?

Si. Cuando usas `self-hosted`, normalmente es on-premise (o infraestructura propia), porque el runner vive en tu PC, servidor o VM bajo tu control.

## Flujo en este proyecto

Cuando haces push a `main`:

1. GitHub detecta el workflow.
2. Busca un runner con etiqueta `self-hosted` registrado en el repo u organizacion.
3. Envia el job a esa maquina.
4. Esa maquina ejecuta comandos como:
   - `docker build -t mi-pagina-web .`
   - `docker run -d -p 97:80 --name mi-web-contenedor mi-pagina-web`

Por eso el despliegue queda en tu maquina (puerto 97), no en una VM temporal de GitHub.

## Diferencia rapida

- **GitHub-hosted**
  - Facil de usar.
  - Entorno limpio y efimero.
  - No publica directamente en tu infraestructura local.

- **Self-hosted**
  - Control total (Docker, red y puertos locales).
  - Ideal para despliegues internos o on-prem.
  - Requiere que administres seguridad, actualizaciones y disponibilidad del runner.
