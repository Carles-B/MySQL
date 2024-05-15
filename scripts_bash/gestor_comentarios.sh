#!/bin/bash

echo "Que quieres hacer?"
echo "inserta 1 para ver los comentarios"
echo "inserta 2 para insertar comentarios"
read ANSWER
if [ "$ANSWER" -eq 1 ]; then
	echo "SELECT * FROM comments;" | mysql -u comentarios faryadventures
elif [ "$ANSWER" -eq 2 ]; then
	echo "Ingresa el comentario a añadir:"
	read COMMENT
	LIST=`echo "$COMMENT" | grep -i -f palabrotas.txt`
	if [ -n "$LIST"  ]; then
		echo "Lo siento, el comentario contiene palabras prohibidas no lo voy a introducir"
		exit 0
	fi

	echo "INSERT INTO comments (comment) VALUES ('$COMMENT');" | mysql -u comentarios faryadventures
	echo "Mensaje correcto. Comentario añadido."
else 
	echo "Error 1: bad answer"
	exit 1
fi
exit 0
