#include <iostream>
#include <cmath>
using namespace std;

int main() {
	int valor;
	float a, b, c, Raiz1, x, ecuacion, z, ecuacion1; 
	
	cout << "Elija la opcion que usara: 1) ecuacion cuadratica una raiz, 2) Logaritmo y exponenciales o 3) exponenciales"<<endl;
	cin >> valor;
	
	if (valor == 1) {
		cout << "ingrese valores de a, b y c" << endl;
		cin >> a >> b >> c;
		Raiz1= (-b+sqrt(pow(b,2)-4*a*c))/(2*a);
		cout << "Raiz: " << Raiz1 << endl;
	}
	
	if (valor == 2) {
		cout << "ingrese valores de x y a" << endl;
		cin >> x >> a;
		ecuacion = log(2*x-1)+((-exp(2*x)+pow(pow(x,a)-3*a*x,1/5))/(2*x-1));
		cout << "La ecuacion: " << ecuacion << endl;
	}
	
	if (valor == 3) {
		cout << "ingrese valores de a, x y z"<< endl;
		cin >> a >> x >> z;
		ecuacion1 = (exp(a)/(a-x)+((exp(a+z)*(sin(a-x))+exp(pow(x,2)))/2));
		cout << "La ecuacion: " << ecuacion1;
	}
	
	
	
	return 0;
}

