#include <iostream>
using namespace std;

float mayor_de_dosotres(float a, float b, float c);

int main() {
	int eleg;
	float num1, num2, num3, mayor;
	
	cout << "Digite 2 o 3 numeros, indique primero poniendo 3 o 2, asi poder identificar el mayor" << endl;
	cin >> eleg;
	
	if (eleg >=3 ){
		cin >> num1 >> num2 >> num3;
		mayor = mayor_de_dosotres(num1, num2, num3);
		
	} else {
		cin >> num1 >> num2; num3= -99999;
		mayor = mayor_de_dosotres(num1, num2, num3);
		
	}
	cout << "El mayor es: " << mayor;
	
	return 0;
}

float mayor_de_dosotres(float a, float b, float c){
	float x;
	if (a>b) {
		if (a>c){
			x=a;
		} else {
			x=c;
		}
	} else {
		if (b>c){
			x=b;
		} else {
			x=c;
		}
	}
	return (x);
}
