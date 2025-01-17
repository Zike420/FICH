#include <iostream>
using namespace std;

double pot(double a, int b);


int main() {
	double resultado, base;
	int exp;
	
	cout << "Escribir numero y su potencia" << endl;
	cin >> base >> exp;
	resultado = pot(base, exp);
	cout << resultado;
	
	return 0;
}

double pot(double a, int b){
	if (b == 0) return 1;
	else return a*pot(a,b-1);
}
