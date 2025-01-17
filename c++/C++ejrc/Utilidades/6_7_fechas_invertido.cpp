#include <iostream>
#include <iomanip>
using namespace std;

int main() {
	string Nombre1, Nombre2;
	int Fecha1, Fecha2, Dia1, Mes1, Ano1, Dia2, Mes2, Ano2;
	
	cout << "Ingrese el nombre y la fecha de nacimiento de la primera persona(aaaammdd)" << endl;
	cin >> Nombre1;
	cin >> Fecha1;
	cout << "Ingrese el nombre y la fecha de nacimiento de la segunda persona(aaaammdd)" << endl;
	cin >> Nombre2;
	cin >> Fecha2;
	
	Dia1 = Fecha1%100;
	Ano1 = Fecha1/10000;
	Mes1 = (Fecha1%10000)/100;
	Dia2 = Fecha2%100;
	Ano2 = Fecha2/10000;
	Mes2 = (Fecha2%10000)/100;
	
	cout << setfill('0');
	cout << Nombre1 << ": " << setw(2) << Dia1 << "/" << setw(2) << Mes1 << "/" << Ano1 << endl;
	cout << Nombre2 << ": " << setw(2) << Dia2 << "/" << setw(2) << Mes2 << "/" << Ano2 << endl;
	
	
}

