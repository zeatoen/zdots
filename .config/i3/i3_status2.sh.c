#include<stdio.h>
#include<unistd.h>
#define RED     "\033[31m" 
#define RESET   "\033[0m"

int main(){
	do{
		
		printf( "everyone" "\n");
		sleep(5);
	}while(1);
	return 0;
}
