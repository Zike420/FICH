#include <iostream>
#include <string>
using namespace std;

class Fraccion {
	double num, den;
public:
	void Dardatos(double n, double d){
		num=n;
		den=d;
	}
	void verfracc(){
		cout << "La fraccion es " << to_string (num)+"/"+to_string (den)<< endl;
	}
	double ConvertirADouble(){
		double dou=num/den;
		return dou;
	}
};

class NumeroMixto {
	Fraccion f1;
	double entera;
public:
	NumeroMixto(double en){
		entera=en;
	}
	void AsignarDato(double _n, double _d){
		f1.Dardatos(_n, _d);
	}
	double ConvertirADouble(){
		double a=f1.ConvertirADouble();
		a=entera*a;
		return a;
	}
};

int main() {
	double numerador, denominador, parent;
	cout << "Numerador: " << endl;
	cin >> numerador;
	cout << "Denominador: " << endl;
	cin >> denominador;
	Fraccion f;
	f.Dardatos(numerador, denominador);
	f.verfracc();
	double p=f.ConvertirADouble();
	cout << "Su valor es: " << p << endl;
	
	cout << "parte entera" << endl;
	cin >> parent;
	NumeroMixto n(parent);
	n.AsignarDato(numerador, denominador);
	double parteentera = n.ConvertirADouble();
	cout << "Su valor es: " << parteentera << endl;
	return 0;
}

