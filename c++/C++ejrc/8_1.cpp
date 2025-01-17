#include <iostream>
#include <cmath>
#include <tuple>
using namespace std;

int division_entera(int a, int b); int facto(int z); int l=0; int r=1; float hipot(float cat1, float cat2); tuple<int, int> divison_con_resto(int a1, int b1); void intercambiar(char &fr1, char &fr2);

int main() {
	int f, g, u, aa, bb, r, t; /// enteros f y g para la division y u para el factorial
	float ct1, ct2;
	char e, w;
	
	cout << "ingrese enteros para el dividendo y el divisor" << endl;
	cin >> f >> g;
	cout << "ingrese un entero para factorial" << endl;
	cin >> u;
	cout << "Ingrese valores de dos catetos para sacar hipotenusa" << endl;
	cin >> ct1 >> ct2;
	cout << "Ingrese enteros para obtener cociente y resto" << endl;
	cin >> aa >> bb;
	cout << "Ingrese dos letras para intercambiarlas" << endl;
	cin >> e >> w;
	
	int o = division_entera(f, g);
	int x = facto(u);
	float p = hipot(ct1, ct2);
	tie(r,t) = divison_con_resto(aa, bb);
	intercambiar(e, w);
	
	cout << "" << endl;
	cout << "r div:" << o << endl;
	cout << "r fac:"<< x << endl;
	cout << "r hipo:" << p << endl;
	cout << "r div y coc:" << r << "   " << t << endl;
	cout << "primera leta: " << e << " Segunda: " << w; 
 	return 0;
}

int division_entera (int a, int b) { 
	int c=a/b;
	return (c);
}

int facto(int z) {
	
	for(int i = 1; i <=z; ++i)
	{
		r *= i;
	}
	return (r);
}
float hipot(float cat1, float cat2) {
	
	float hipo= sqrt(pow(cat1,2)+pow(cat2,2));
	return (hipo);
}
tuple<int, int> divison_con_resto(int a1, int b1) {
	int c1=a1/b1;
	int d1=a1%b1;
	return make_tuple(c1, d1);
}
	
void intercambiar(char &fr1, char &fr2) {
	char aux = fr1;
	fr1=fr2;
	fr2=aux;
}
