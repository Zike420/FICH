#include <iostream>
using namespace std;

void intercambio (int &a, int &b); void intercambio (double &a, double &b); void intercambio (char &a, char &b); 

int main() {
	double x, y;
	cout << "Ingrese datos para invertir" << endl;
	cin >> x >> y;
	
	intercambio(x, y);
	
	cout << x << "   " << y;
	
	return 0;
}

	void intercambio (int &a, int &b){
		int aux=a;
		a=b;
		b=aux;
}
	void intercambio (double &a, double &b){
		double aux=a;
		a=b;
		b=aux;
	}
	void intercambio (char &a, char &b){
		char aux=a;
		a=b;
		b=aux;
	}
