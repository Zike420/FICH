#include <iostream>
using namespace std;

int main() {
	
	float KmI, KmF, KmT, NaftaL, Precio, N;
	int PrecioT;
	cout << "Ingresar la cantidad de km iniciales y finales del viaje" << endl;
	cin >> KmI; 
	cin >> KmF;
	cout << "La cantidad de nafta consumida en 1km" << endl;
	cin >> NaftaL;
	cout << "Ingresar el precio del litro de nafta" << endl;
	cin >> Precio;
	cout << "¿Cuanto descuento habia?" << endl;
	cin >> N;
	
	KmT = KmF-KmI;
	PrecioT = (NaftaL*Precio)*KmT;
	
	if (N>0) {
		N=(N*PrecioT)/100;
		PrecioT = (PrecioT-N);
	}
	
	cout << "El costo del viaje es de " << PrecioT << "$";
	return 0;
}

