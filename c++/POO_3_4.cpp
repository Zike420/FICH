#include <iostream>
#include <string>
#include <iomanip>
using namespace std;

struct Punto{
	float x, y;
};

class Recta {
	virtual string obtenerEcuacion()=0;
	pertenece();
};


class RectaGeneral:public Recta {
	float a, b, c;
public:
	RectaGeneral(Punto p, Punto q){
		a=q.y-p.y;
		b=p.x-q.x;
		c=-a*p.x-b*p.y;
	}
	string obtenerEcuacion() override{
		string Ecu;
		Ecu = to_string(a)+"x+"+to_string(b)+"y+"+to_string(c)+"=0";
		return Ecu;
	}
	void verA();
	void verB();
	void verC();
};


class RectaExplicita:public Recta {
	float m, b;
public:
	RectaExplicita(Punto p, Punto q){
		m=(q.y-p.y)/(q.x-p.x);
		b=p.y-m*p.x;
	}
	string obtenerEcuacion() override{
		string Ecu;
		Ecu ="y="+std::to_string(m)+"x+"+std::to_string(b);
		return Ecu;
	}
	void verM(){
		cout << m << endl;
	}
	void verB(){
		cout << b << endl;
	}
};

int main() {
	
	Punto _p, _q;
	cout << "x del primer punto" << endl;
	cin >> _p.x;
	cout << "y del primer punto" << endl;
	cin >> _p.y;
	cout << "x del segundo punto" << endl;
	cin >> _q.x;
	cout << "y del segundo punto" << endl;
	cin >> _q.y;
	
	RectaExplicita Ec(_p, _q);
	RectaGeneral Ecu(_p, _q);
	string Ecuancion = Ec.obtenerEcuacion();
	string Ecuancion1 = Ecu.obtenerEcuacion();
	cout <<"La ecuacion de la recta es "<< fixed << std::setprecision(2) << Ecuancion << endl;
	
	Ec.verM();
	Ec.verB();
	
	return 0;
}

