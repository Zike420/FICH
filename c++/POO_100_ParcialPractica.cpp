#include <iostream>
using namespace std;

class Animal{
protected:
	string tipos, especie;
public:
	Animal(string tip, int espec){
		tipos=tip;
		especie=espec;
	}
	virtual void desplazarse()=0;
	virtual void tipo(){
		cout << tipos << endl;
	}
};

class Mamifero : public Animal{
public:
	Mamifero(string tip, int espec):Anima1(tip, espec) {}
	void desplazarse()override{
		cout << "camina" <<endl;
	}
};
class Ave : public Animal{
public:
	void desplazarse()override{
		cout << "vuela" <<endl;
	}
};
class Pez :public Animal{
public:
	void desplazarse()override{
		cout << "nada" <<endl;
	}
};


int main() {
	string tip="perro";
	int esp=1;
	Animal *a = new Mamifero(tip, esp);
	a->desplazarse();
	a->tipo();
	return 0;
}

