/*
 * Lissandra.c
 *
 *  Created on: 8 abr. 2019
 *      Author: utnso
 */

#include "Lissandra.h"

int main(void){

	iniciar_log();

	leer_consola();



	return EXIT_SUCCESS;
}


void iniciar_log(void){

	char* Lisandra_ruta = "/home/utnso/Escritorio/TP_Sistemas_Operativos/tp-2019-1c-Te-Lo-Testeo-Asi-Nom-s/Lissandra File System/FLS.log";

	logger_Lisandra = log_create( Lisandra_ruta , "Lissandra" , 1 , LOG_LEVEL_INFO );
}

void leer_consola(void)
{
	char* leido;

	leido = readline(">");


	while(*leido != '\0') {

		log_info(g_logger, leido);
		free(leido);
		leido = readline(">");
	}

	free (leido);

}
