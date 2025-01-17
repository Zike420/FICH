#include <iostream>
using namespace std;

double pot(double a, int b);

int main() {
	double base, respuesta;
	int exp;
	cin >> base >> exp;
	respuesta = pot(base, exp);
	cout << respuesta;
	
	return 0;
}

double pot(double a, int b){
	if (b == 0) return 1;
	else  if (b%2 == 0) return pot(a,b/2)*pot(a,b/2);
	else return a*pot(a,b/2)*pot(a,b/2);
}
