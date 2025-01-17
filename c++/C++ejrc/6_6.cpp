#include <iostream>
#include <cmath>
using namespace std;

int main() {
	
	double Radio;
	cout << "Ingrese el radio de la circunferencia" << endl;
	cin >> Radio;
	double A = M_PI * Radio*Radio;
	double Perimetro = 2*M_PI*Radio;
	cout << "El Area es " << A << " y el perimetro es " << Perimetro;
}

