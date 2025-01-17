#include <iostream>
using namespace std;

struct complejos{
	float a; 
	float b;
};

complejos multiplicacion(complejos x, complejos y){
	complejos r;
	r.a = x.a*y.a-x.b*y.b;
	r.b = x.a*y.b+x.b*y.a;
	return r;
}

complejos suma(complejos x, complejos y) {
	complejos r;
	r.a = x.a + y.a;
	r.b = x.b + y.b;
	return r;
}

complejos resta(complejos x, complejos y) {
	complejos r;
	r.a = x.a - y.a;
	r.b = x.b - y.b;
	return r;
}

int main() {
	complejos c1, c2;
	cout << "Escribir los números reales del primer número complejo" << endl;
	cin >> c1.a >> c1.b;
	cout << "Escribir los números reales del segundo número complejo" << endl;
	cin >> c2.a >> c2.b;
	
	cout << "1- Suma" << endl;
	cout << "2- Resta" << endl;
	cout << "3- Multiplicación" << endl;

	int operacion;
	cin >> operacion;
	
	complejos r;
	switch(operacion) {
		case 1: r = suma(c1, c2); break;
		case 2: r = resta(c1, c2); break;
		case 3: r = multiplicacion(c1, c2); break;
	}
	
	cout << r.a << " + " << r.b << "i" << endl;
	
	return 0;
}

