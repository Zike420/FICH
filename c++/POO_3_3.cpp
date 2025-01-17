#include <iostream>
#include <string>
#include <iomanip>
using namespace std;

struct Punto{
	float x, y;
};

class RectaExplicita{
	float m, b;
public:
	RectaExplicita(Punto p, Punto q){
		m=(q.y-p.y)/(q.x-p.x);
		b=p.y-m*p.x;
	}
	string obtenerEcuacion(){
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
	string Ecuancion = Ec.obtenerEcuacion();
	cout <<"La ecuacion de la recta es "<< fixed << std::setprecision(2) << Ecuancion << endl;
	
	Ec.verM();
	Ec.verB();
	
	return 0;
}

