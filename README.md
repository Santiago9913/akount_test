# Explicación

El siguiente proyecto sigue un patron de provider con Riverpod. Aunqueu la UI no esta identica, el core de la aplicación el cual es consultar la gráfica y el valor del dolar al día de hoy funciona. Si bien la grafica implementada es un ejemplo de la propuesta, esta se puede customizar aún mucho más y alcanzar el diseño propuesto. Puede que la pantalla rompa en dispositivos pequeños, esto se debe a que no esta implemenatado el ScrollConfiguration para la pantalla debido a tiempos.

## Puntos extras

1. El cursor implementado tiene un tooltip basico el cual se puede customizar aún más
2. No se realizarón pruebas unitarias
3. Gracias a riverpod los datos se encuentran cacheados, lo cual es diferente al local storage, por lo cual al momento de consultar un dato distinto a los 5Y, el filtro lo hace con los datos cacheados. Adicionalmente, gracias a riverpod, si el provider se quisiera volver a llamar, este ya no realizaría una consulta al EP nuevamente.

## Recomendaciones para correr el proyecto

Por favor en el launch.json reemplazar la siguiente linea
`POLYGON_KEY=${api key}` con la key para ejecutar los get Polygon
