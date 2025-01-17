#include <iostream>
using namespace std;
int diferencia_de_anos(int f1, int f2);

int main() {
	int fecha1, fecha2;
	cout << "Dar dos fechas(aaaammdd) para ver la diferencia de años" << endl;
	cin >> fecha1 >> fecha2;
	int dif = diferencia_de_anos(fecha1, fecha2);
	cout << "Diferencia: " << dif ; 
	return 0;
}

int diferencia_de_anos(int f1, int f2){
	int d;
	int ano1 = f1/10000;
	int ano2 = f2/10000;
	if (ano2>ano1){
		d = ano2-ano1;
	} else {
		d = ano1-ano2;
	}
	return (d);
}
