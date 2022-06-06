(:for $x in doc("/media/daw/TOSHIBA EXT/1º DAW/VisualStudio/LND/Tema 6/libros.xml")/biblioteca/libros/libro return <libro>{$x/titulo, $x/editorial}</libro>:)

<ol> { for $libro in doc("/media/daw/TOSHIBA EXT/1º DAW/VisualStudio/LND/Tema 6/libros.xml")//libro[editorial="O'Reilly"] order by $libro/titulo return <li>{ data($libro/titulo) }</li> } </ol>



for $baile in doc("")/bailes/baile[precio > 30 and precio/@moneda='euro']
return $baile/nombre