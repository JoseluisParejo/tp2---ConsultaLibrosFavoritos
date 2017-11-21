#!/usr/bin/perl 

use CGI;
use utf8;

$query = new CGI;

if(!$query->param){
    print $query->header(-charset => 'iso-8859-1');
    print $query->start_html('Libros');
    print $query->start_form(-onsubmit=>'/submit');
    
    #Con esas lineas codificamos, creamos html con su nombre y iniciamos el formulario
    #creamos la cabecera
    
    print $query->h1('Gestion de Libros');
    print $query->h3('Veamos cual es tu estilo de lectura');
    print $query->br;
    print $query->br;
    
    #Ahora introduciremos los campos variados 
   
   print $query->label('Tipo: ');
    print $query->br;
    print $query->h2('¿Qué tipo de libro te gusta?');
    print $query->radio_group(-name=>'tipo',-values=>['Misterio', 'Aventura', 'Fantasia', 'Romántico'],-defaults =>'Aventura',-columns=>2,-rows=>2);
    print $query->br;
    
    print $query->label('Gusto: ');
    print $query->br;
    print $query->h2('¿Que es lo que más te llama de un libro?');
    print $query->checkbox_group(-name=>'gusto',-values=>['Longitud', 'Personajes', 'Universo', 'Corto'],-columns=>2,-rows=>2);
    print $query->br;
    
    print $query->label('Editorial ');
    print $query->br;
    print $query->h2('¿Tienes editorial favorita?');
    print $query->textfield(-name=>'editorial',-size=>10,-maxlength=>60);
    print $query->br;
    
    print $query->label('Escritor ');
    print $query->br;
    print $query->h2('¿Acaso tienes un escritor favorito?');
    print $query->textfield(-name=>'escritor',-size=>10,-maxlength=>60);
    print $query->br;
    
    print $query->label('Titulo Favorito ');
    print $query->br;
    print $query->h2('¿Acaso tienes un libro favorito?');
    print $query->textfield(-name=>'librofav',-size=>10,-maxlength=>60);
    print $query->br;
    
    print $query->label('Saga ');
    print $query->br;
    print $query->h2('¿Acaso tienes una saga favorita?');
    print $query->textfield(-name=>'saga',-size=>10,-maxlength=>60);
    print $query->br;
    
    #Ahora terminamos el codigo con los botones para enviar la informacion y terminamos el formulario
    
    print $query->submit('submit','Enviar');
    print $query->reset('reset','Resetear datos');
    print $query->end_form;
    
} else {

    #Ahora empezamos a crear el fichero guardando en variables los datos anteriores. Luego lo almacenamos en un fichero
    
    print $query->header(-charset => 'iso-8859-1');
    print $query->start_html('Datos de Libros');
    my $tipo = $query->param('tipo');
    my $gusto = $query->param('gusto');
    my $editorial = $query->param('editorial');
    my $autor = $query->param('autor');
    my $librofav = $query->param('librofav');
    my $saga = $query->param('saga');
     open F, '>>/tmp/texto.txt' or die "Imposible abrir el fichero:$!";
     print F "El tipo de libro era $tipo \n El gusto propio era $gusto \n La editorial que preferia era $editorial \n El autor preferido era $autor \n El libro preferido era $librofav \n y la saga preferida era $saga \n";
     close F;
     open F, '/tmp/texto.txt' or die "Imposible abrir el fichero:$!";
    while(<F>) {
    print "$_ <br>";
    }
    #Con las lineas anteriores imprimimos los datos por pantalla y cerramos el fichero acontinuacion
    close F;
}
