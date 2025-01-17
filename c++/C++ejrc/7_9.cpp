#include <iostream>
#include <cmath>
using namespace std;

int main() {
	float a, b ,c, raiz1, raiz2, partereal, parteimaginaria;
	cout << "ingres los datos de a, b y c, para la ecuacion de segundo grado" << endl;
	cin >> a >> b >> c;
	
	if (pow(b,2)-4*a*c>=0){
		raiz1 = (-b+sqrt(pow(b,2)-4*a*c))/(2*a);
		raiz2 = (-b-sqrt(pow(b,2)-4*a*c))/(2*a);
		cout << "raiz: " << raiz1 << "   raiz: " << raiz2 << endl;
	} else {
		partereal = (-b)/2;
		parteimaginaria = sqrt(abs(pow(b,2)-4*a*c));
		cout << "raiz: " << partereal << " + " << parteimaginaria << "i" << endl;
		cout << "raiz: " << partereal << " - " << parteimaginaria << "i" << endl;
	}

	
	
	
	return 0;
}

