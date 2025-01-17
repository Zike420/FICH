#include <iostream>
#include <cmath>
using namespace std;

int main() {
	float A, B, C, Raiz1, Raiz2;
	cout << "ingrese los datos de los coeficientes para calcular Ax^2+Bx+C" << endl;
	cout << "Ingrese A:" << endl;
	cin >> A;
	cout << "Ingrese B:" << endl;
	cin >> B;
	cout << "Ingrese C:" << endl;
	cin >> C;
	
	Raiz1 = (-B+sqrt(pow(B,2)-4*A*C))/(2*A);
	Raiz2 = (-B-sqrt(pow(B,2)-4*A*C))/(2*A);
	
	cout << "Las raices son: " << Raiz1 << "  " << Raiz2;
}

