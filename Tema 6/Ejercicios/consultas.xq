(:

1) Mostrar cada uno de los nombres de los bailes

for $baile in doc("/media/daw/TOSHIBA EXT/1º DAW/VisualStudio/LND/Tema 6/Ejercicios/bailes.xml")/bailes/baile
return
$baile/nombre


2) Mostrar los nombres de los bailes seguidos con el número de plazas entre paréntesis

for $baile in doc("/media/daw/TOSHIBA EXT/1º DAW/VisualStudio/LND/Tema 6/Ejercicios/bailes.xml")/bailes/baile
return
concat($baile/nombre," (",$baile/plazas,")")

3) Mostrar los nombres de los bailes cuyo precio sea mayor de 30

for $baile in doc("/media/daw/TOSHIBA EXT/1º DAW/VisualStudio/LND/Tema 6/Ejercicios/bailes.xml")/bailes/baile[precio>30]
return
$baile/nombre

4) Mostrar los nombres de los bailes cuyo precio sea mayor de 30 y la moneda "euro"

for $baile in doc("/media/daw/TOSHIBA EXT/1º DAW/VisualStudio/LND/Tema 6/Ejercicios/bailes.xml")/bailes/baile[precio>30][precio/@moneda='euro']
return
$baile/nombre

5) Mostrar la media de los precios de todos los bailes

let $media:=avg(doc("/media/daw/TOSHIBA EXT/1º DAW/VisualStudio/LND/Tema 6/Ejercicios/bailes.xml")/bailes/baile/precio)
return $media

6) Mostrar la suma de los precios de los bailes de la sala 1

let $suma:=sum(doc("/media/daw/TOSHIBA EXT/1º DAW/VisualStudio/LND/Tema 6/Ejercicios/bailes.xml")/bailes/baile[sala=1]/precio)
return $suma


7) Mostrar cuántas plazas en total oferta el profesor "Jesús Lozano"
let $suma:=sum(doc("/media/daw/TOSHIBA EXT/1º DAW/VisualStudio/LND/Tema 6/Ejercicios/bailes.xml")/bailes/baile[profesor='Jesús Lozano']/plazas)
return $suma

8) Mostrar el dinero que ganaría la profesora "Miriam Gutiérrez" si se completaran todas las plazas de sus bailes.

let $suma:=sum(doc("/media/daw/TOSHIBA EXT/1º DAW/VisualStudio/LND/Tema 6/Ejercicios/bailes.xml")/bailes/baile[profesor='Miriam Gutiérrez']/(plazas*precio))
return $suma

9) Mostrar el nombre del baile, su precio y el precio con un descuento del 15% para familias numerosas. Ordenar por el nombre del baile

for $baile in doc("/media/daw/TOSHIBA EXT/1º DAW/VisualStudio/LND/Tema 6/Ejercicios/bailes.xml")//baile
order by $baile/nombre
return
<baile>
{
  $baile/nombre,
  $baile/precio,
  <precioDescuento>
  {
  round($baile/(precio*0.85))
  }
  </precioDescuento>
}
</baile>

9.2) Mostrar el nombre del baile, su precio y el precio con un descuento del 15% para familias numerosas. Ordenar por el nombre del baile en una tabla HTML

"<!DOCTYPE html>&#xa;",
<html lang="es">
<head>
  <meta charset='utf-8'/>
  <title>Listado de cursos de baile</title>
  <style>
      tr:nth-child(even) &#123; background-color: lightblue; &#125;
      tr:nth-child(odd) &#123; background-color: lightgrey; &#125;
  </style>
<link rel="stylesheet" type="text/css" href="https://www3.gobiernodecanarias.org/educacion/cau_ce/cookies/cookieconsent.min.css"/><script  type="text/javascript" src="https://www3.gobiernodecanarias.org/educacion/cau_ce/cookies/cookieconsent.min.js"></script><script type="text/javascript" src="https://www3.gobiernodecanarias.org/educacion/cau_ce/cookies/cauce_cookie.js"></script><script type="text/javascript" src="https://www3.gobiernodecanarias.org/educacion/cau_ce/estadisticasweb/scripts/piwik-base.js"></script><script type="text/javascript" src="https://www3.gobiernodecanarias.org/educacion/cau_ce/estadisticasweb/scripts/piwik-eforma.js"></script><link rel="stylesheet" type="text/css" href="https://www3.gobiernodecanarias.org/educacion/cau_ce/cookies/cookieconsent.min.css"/><script  type="text/javascript" src="https://www3.gobiernodecanarias.org/educacion/cau_ce/cookies/cookieconsent.min.js"></script><script type="text/javascript" src="https://www3.gobiernodecanarias.org/educacion/cau_ce/cookies/cauce_cookie.js"></script><script type="text/javascript" src="https://www3.gobiernodecanarias.org/educacion/cau_ce/estadisticasweb/scripts/piwik-base.js"></script><script type="text/javascript" src="https://www3.gobiernodecanarias.org/educacion/cau_ce/estadisticasweb/scripts/piwik-eforma.js"></script></head>
<table>
  <thead>
    <tr><th>Nombre</th><th>Precio</th><th>Precio con descuento</th></tr>
  </thead>
  <tbody>
  {
  for $baile in doc("/media/daw/TOSHIBA EXT/1º DAW/VisualStudio/LND/Tema 6/Ejercicios/bailes.xml")//baile
  order by $baile/nombre
  return
  <tr>
    <td>{ data($baile/nombre)}</td>,
    <td>{ data($baile/precio)}</td>,
    <td>{ data($baile/(precio*0.85))}</td>
  </tr>
  }
  </tbody>
</table>
</html>

10) Mostrar el dinero que ganaría la profesora "Laura" (no conocemos su apellido) si se completaran todas las plazas de su baile. *Función start-with

let $suma:=sum(doc("/media/daw/TOSHIBA EXT/1º DAW/VisualStudio/LND/Tema 6/Ejercicios/bailes.xml")/bailes/baile[starts-with(profesor,'Laura')]/(plazas*precio))
return $suma

11) Mostrar los nombres y la fecha de comienzo de los bailes que comiencen el mes de enero (utiliza para buscarlo la cadena de texto "/1/").

for $baile in doc("bailes.xml")/bailes/baile[contains(comienzo,'-01-')]
return
<baile>
{
  $baile/nombre,
  $baile/comienzo
}
</baile>

12) Mostrar el dinero que ganaría el profesor "Jesus Lozano" si se completaran todas las plazas de su baile, pero mostrando el beneficio de cada baile por separado.

for $baile in doc("/media/daw/TOSHIBA EXT/1º DAW/VisualStudio/LND/Tema 6/Ejercicios/bailes.xml")/bailes/baile[profesor='Jesús Lozano']
return 
<baile>
{
  $baile/nombre,
  $baile/plazas,
  $baile/precio,
  <beneficioTotal>
  {
   $baile/(plazas*precio)
  }
  </beneficioTotal>
}
</baile>

13) Mostrar los nombres de los profesores y las salas en las que dan clase, ordenados por sala.
for $baile in doc("/media/daw/TOSHIBA EXT/1º DAW/VisualStudio/LND/Tema 6/Ejercicios/bailes.xml")//baile
order by $baile/sala
return
<baile>
{
  $baile/profesor,
  $baile/sala
}
</baile>

14) Mostrar los nombres de los profesores eliminando los repetidos y acompañar cada nombre con todas las salas en la que da clase, ordenados por nombre. Función distinct-values
:)
for $profesor in  distinct-values(doc("bailes.xml")/bailes/baile/profesor)
let $salas:=(doc("bailes.xml")/bailes/baile[profesor=$profesor]/sala)
order by $profesor
return
<profesor>
{
  <nombre>
  {
    $profesor
  }
  </nombre>,
  $salas
}
</profesor>

