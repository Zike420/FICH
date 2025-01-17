#include <iostream>
#include <string>
#include <vector>
#include <math.h>
using namespace std;

class Monomio{
	int a, n, x;
public:
	Monomio(int _a, int _n){
		a=_a;
		n=_n;
	}
	float Evaluar(float _x ){
		x=_x;
		float mono = a*(pow(x,n));
		return mono;
	}
};

class Polinomio{
	vector<Monomio> mon;
public:
	void AgregarMonomio(Monomio a){
		mon.push_back(a);
	};
	Evaluar(float x){
		float aux=0;
		for(size_t i=0;i<mon.size();i++) { 
			aux+=mon[i].Evaluar(x);
		}
		return aux;
	}
};

int main() {
	int _a, _n;
	int a, n, grad; 
	float x;
	string cual;
	
	cout << "monomio o polinomio" << endl;
	cin >> cual;
	
	if(cual=="monomio"){
		cout << "Ingrese el coficiente" << endl;
		cin >> a;
		cout << "Ingrese el exponente" << endl;
		cin >> n;
		cout << "Ingrese la incongnita" << endl;
		cin >> x;
		
		Monomio m(a, n);
		float mon = m.Evaluar(x);
		
		cout << "El Monomio da como resultado " << mon << endl;
	} else {
		Polinomio p;
		cout << "Grado del polinomio" << endl;
		cin >> grad;
		for(int i=0;i<grad;i++) { 
			cout << "Ingrese el exponente" << endl;
			cin >> _n;
			cout << "Ingrese el coficiente" << endl;
			cin >> _a;
			p.AgregarMonomio(Monomio(_a, _n));
		}
		cout << "Ingrese la incongnita" << endl;
		cin >> x;
		float pol = p.Evaluar(x);
		cout << "El polinomio da como resultado " << pol << endl;
	}

	return 0;
}

